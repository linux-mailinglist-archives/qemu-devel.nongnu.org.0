Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8C7294D6D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 15:24:41 +0200 (CEST)
Received: from localhost ([::1]:60604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVE6a-00049P-T7
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 09:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <9bec33a7d8f006ef8f80517985d0d6ac48650d53@lizzy.crudebyte.com>)
 id 1kVE4u-0002hh-7k
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 09:22:56 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:34253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <9bec33a7d8f006ef8f80517985d0d6ac48650d53@lizzy.crudebyte.com>)
 id 1kVE4s-0003U4-KV
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 09:22:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=TVMsne8188a4RW0D3nqmiiAJmCUTVKNn2lpr0tyvPPc=; b=XxriJ
 PESi7zRAiM891OQjdMGgb1B8IIm+yqPIBcjCFx36/yjWLfXjXm4ELam4rvJVUMIAcZM6iRJHxp8pD
 MgbpIp0UYf3NpwQ9jsNcNC0F0oBF0+LZ+Lx5NESnBw3jeFUZfiT6IakwmrQeVrVHpSzyKvHAZ26kU
 bn1cCKKe0m3voM42e2HWenmdagXnP//M4b9fydCn8+qDlmGalzdVjRuQ9Mz0yKWsiD+H1Z8rvKP+R
 pM9IEW7IihWlhUmLBz7iZr41tv37qSj79gnSKtsD07V3NLHZn/Zf7fu5AUSFpExO9CJBjVj9kIcxP
 ZIms5+ITfc4TiejErAuFNQkfbiuGQ==;
Message-Id: <cover.1603285620.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 21 Oct 2020 15:07:00 +0200
Subject: [PATCH v2 0/8] 9pfs: more local tests
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=9bec33a7d8f006ef8f80517985d0d6ac48650d53@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 09:21:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

Just a bunch of more test cases using the 9pfs 'local' fs driver backend,
namely for these 9p requests:

  * Tunlinkat, Tlcreate, Tsymlink and Tlink.

v1->v2:

  * Rebased on latest 9p.next queue HEAD.

  * Use do_*() as new naming convention for utility functions.

  * Drop unnecessary arguments of utility functions.

  * Always do 'alloc = t_alloc;' in toplevel test functions.

  * Split out do_hardlink() as utility function [patch 6].

Christian Schoenebeck (8):
  tests/9pfs: simplify do_mkdir()
  tests/9pfs: add local Tunlinkat directory test
  tests/9pfs: add local Tlcreate test
  tests/9pfs: add local Tunlinkat file test
  tests/9pfs: add local Tsymlink test
  tests/9pfs: add local Tunlinkat symlink test
  tests/9pfs: add local Tlink test
  tests/9pfs: add local Tunlinkat hard link test

 tests/qtest/virtio-9p-test.c | 405 ++++++++++++++++++++++++++++++++++-
 1 file changed, 397 insertions(+), 8 deletions(-)

-- 
2.20.1


