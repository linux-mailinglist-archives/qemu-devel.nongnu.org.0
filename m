Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107DD39BEE6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:34:00 +0200 (CEST)
Received: from localhost ([::1]:35814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDhn-0004oh-4m
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1a6701674afc4f08d40396e3aa2631e18a4dbb33@lizzy.crudebyte.com>)
 id 1lpCrv-0006tj-5v
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:40:23 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:57703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1a6701674afc4f08d40396e3aa2631e18a4dbb33@lizzy.crudebyte.com>)
 id 1lpCrq-000598-2M
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=WVg0/lzp1f9I9c7krGGxS5BjO7tToO60tZOzy7KNtX4=; b=TKuDx
 26Cq0iLguQTKvmMtrffXXuVPpcXHGNVLMS7zVwJFv2+5r0/YsjvXRWyJ+2W8SWqa79MrS8zodFcNQ
 2zfRmm7ToYjvIQm63a43yx3/DCUY6ksA22SwRQOAJSDQk4GB1zEsF+RQpZlkDb91m6fMiCMhWF808
 PGI8gfULQEhePV+8z6OvXRHKYX5JxRX9NBsByebMBzbtSWHg2ceMobhKqDXsnG4BVJvPRTizrUFLG
 kLcX26cVAq00qdeh43efFI0MwtF6nGP/+DhN6jZLIHtNjlCL3cFfuGJ91HT1dacJga4t3sywFAih8
 MYESoA3fBaycKxbnjkmDG8cdaV/Bg==;
Message-Id: <cover.1622821729.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 4 Jun 2021 17:48:49 +0200
Subject: [PATCH v2 0/7] 9pfs: Twalk optimization
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=1a6701674afc4f08d40396e3aa2631e18a4dbb33@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set reduces latency of Twalk handling by reducing the amount of
thread hops, similar to previous Treaddir optimization.

The performance gain of this patch set is not as spectacular as previously
with Treaddir, but there is definitely a measurable difference.

The actualy performance optimization is patch 7. With the benchmark of
patch 2, the runtime of the Twalk test was cut in half. In real world tests
I measured a performance gain (i.e. running an entire guest OS, and hence
mixed with all other kinds of 9p requests) of about 2%, again measured in a
mix, not concentrated on Twalk alone.

v1 -> v2:

  * Added a separate [NEW PATCH 1] for fixing not_same_qid() semantic.

  * Code style: use sizeof(var-name) instead of sizeof(type-name)
    [PATCH 3].

  * Split out dropping fid_to_qid() into separate [PATCH 4].

  * Split out replacing not_same_qid() by same_stat_id() into separate
    [PATCH 5].

  * Split out dropping root_qid into separate [PATCH 6].

Christian Schoenebeck (7):
  9pfs: fix not_same_qid()
  9pfs: Twalk benchmark
  9pfs: capture root stat
  9pfs: drop fid_to_qid()
  9pfs: replace not_same_qid() by same_stat_id()
  9pfs: drop root_qid
  9pfs: reduce latency of Twalk

 hw/9pfs/9p.c                 | 128 +++++++++++++++++++++++------------
 hw/9pfs/9p.h                 |   2 +-
 tests/qtest/virtio-9p-test.c |  30 ++++++++
 3 files changed, 116 insertions(+), 44 deletions(-)

-- 
2.20.1


