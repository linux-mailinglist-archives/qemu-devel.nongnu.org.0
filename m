Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488C239353A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 20:01:47 +0200 (CEST)
Received: from localhost ([::1]:43222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmKKI-0000Jb-BA
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 14:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <364bc324ad4dfdb87cbbb75abb7dc09b561cda2f@lizzy.crudebyte.com>)
 id 1lmKIS-0007Pt-CQ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:59:52 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:43091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <364bc324ad4dfdb87cbbb75abb7dc09b561cda2f@lizzy.crudebyte.com>)
 id 1lmKIP-0004gL-PJ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=y3vaxvIbWmNlOEwZc9Y03iXkm+TRiip31YB0TdZIAjw=; b=NZk+C
 4mn/qBgW6FCnb6U9yw4zizUF1S45qCIayFtFeTdkd3fSXDbvLIItS0NYteEJmnib8eoav2c3/cgy4
 ++NQIC+PN8cFkndXwQSgfQMdpN45OlOgubT9h9Ze3aCIxMd+8KrrUvm+RoZzx0aCOKIe4Er/9ISt9
 4neBsnRC4vtRiK/4/o5tO0rS64TbG0ShcBqAnlVMHc5bKSqXfpwahFjE6zsJZlpfU7QEl5tYexdZA
 MNE9V6ceabTsITWbEjua+7ZzFlrVt5gb+Sox2PZWlR1YExGmh4HWtuwMHNWVf4W/mosqWz+p/5fMB
 80gtGongEusXR2s4N4pax8oFYNqwA==;
Message-Id: <cover.1622135592.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 27 May 2021 19:13:12 +0200
Subject: [PATCH 0/3] 9pfs: Twalk optimization
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=364bc324ad4dfdb87cbbb75abb7dc09b561cda2f@lizzy.crudebyte.com;
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

First draft for reducing latency of Twalk handling by reducing the amount
of thread hops, similar to previous Treaddir optimization. The performance
gain is not as spectacular as on Treaddir, but there is definitely a
measurable difference.

With the benchmark of patch 1, the runtime of the Twalk test was cut in half.
In real world tests I measured a performance gain (i.e. running an entire
guest OS, and hence mixed with all othe kinds of 9p requests) of about 2%,
again measured in a mix, not concentrated on Treaddir at all.

Independent of the actual performance optimization (patch 3), there are some
things about Twalk handling in general which I am yet unsure about. So I'll
add some of my thoughts as reply to patch 3, and depending on that I might
still cleanup / reduce some of the code.

Christian Schoenebeck (3):
  9pfs: Twalk benchmark
  9pfs: capture root stat
  9pfs: reduce latency of Twalk

 hw/9pfs/9p.c                 | 128 +++++++++++++++++++++++------------
 hw/9pfs/9p.h                 |   2 +-
 tests/qtest/virtio-9p-test.c |  30 ++++++++
 3 files changed, 116 insertions(+), 44 deletions(-)

-- 
2.20.1


