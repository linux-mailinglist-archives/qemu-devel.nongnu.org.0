Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9317A4BA671
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 17:53:08 +0100 (CET)
Received: from localhost ([::1]:45580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKk1j-0001XZ-Mz
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 11:53:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haiyue.wang@intel.com>)
 id 1nKjzH-0000Lq-7K; Thu, 17 Feb 2022 11:50:35 -0500
Received: from mga18.intel.com ([134.134.136.126]:55573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haiyue.wang@intel.com>)
 id 1nKjzD-0006po-Rt; Thu, 17 Feb 2022 11:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645116631; x=1676652631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I+rDSmUQLJXvJFAcMoN4fPkeNOQ2R1K57RtdqnKWBrk=;
 b=LLs5tA7vdv57cFrAr5nA/UdzvYsqFxyUKE+6dmHkWHD/MUlVkGu1vJxq
 ZrQ3vFpD3XzUloA82CbaMGlSd2rgOulkvi72v3whFt1RqeO16ksVRe601
 XENHp3dfkG8WL6Vx00s8teL4Rxkn7XwaOKmHhffJMUe1MM5bshxb5YwTQ
 lnHMxDQgI21k1yqeZsGyKNc1RvjIxcboCncGEdOBtki373+QcgI5vk2Xe
 PtI42UW6lYio65xZ+sc4yvJpLcAe+PAtwD1fLIaKsGF4OmyDXBnYwBLzK
 MTdBsGk9B4JOqj8/MYvpyO0cLAaSWvk9fang6hOufr72NEdH6ge++8Pue A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="234447380"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="234447380"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 08:50:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="502775683"
Received: from npg-dpdk-haiyue-2.sh.intel.com ([10.67.118.240])
 by orsmga006.jf.intel.com with ESMTP; 17 Feb 2022 08:50:26 -0800
From: Haiyue Wang <haiyue.wang@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] aio-posix: fix build failure io_uring 2.2
Date: Fri, 18 Feb 2022 00:16:27 +0800
Message-Id: <20220217161627.45351-1-haiyue.wang@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=haiyue.wang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Haiyue Wang <haiyue.wang@intel.com>, Fam Zheng <fam@euphon.net>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The io_uring fixed "Don't truncate addr fields to 32-bit on 32-bit":
https://git.kernel.dk/cgit/liburing/commit/?id=d84c29b19ed0b130000619cff40141bb1fc3615b

This leads to build failure:
../util/fdmon-io_uring.c: In function ‘add_poll_remove_sqe’:
../util/fdmon-io_uring.c:182:36: error: passing argument 2 of ‘io_uring_prep_poll_remove’ makes integer from pointer without a cast [-Werror=int-conversion]
  182 |     io_uring_prep_poll_remove(sqe, node);
      |                                    ^~~~
      |                                    |
      |                                    AioHandler *
In file included from /root/io/qemu/include/block/aio.h:18,
                 from ../util/aio-posix.h:20,
                 from ../util/fdmon-io_uring.c:49:
/usr/include/liburing.h:415:17: note: expected ‘__u64’ {aka ‘long long unsigned int’} but argument is of type ‘AioHandler *’
  415 |           __u64 user_data)
      |           ~~~~~~^~~~~~~~~
cc1: all warnings being treated as errors

So convert the paramter to right type according to the io_uring define.

Signed-off-by: Haiyue Wang <haiyue.wang@intel.com>
---
 util/fdmon-io_uring.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/util/fdmon-io_uring.c b/util/fdmon-io_uring.c
index 1461dfa407..e7febbf11f 100644
--- a/util/fdmon-io_uring.c
+++ b/util/fdmon-io_uring.c
@@ -179,7 +179,11 @@ static void add_poll_remove_sqe(AioContext *ctx, AioHandler *node)
 {
     struct io_uring_sqe *sqe = get_sqe(ctx);
 
+#ifdef LIBURING_HAVE_DATA64
+    io_uring_prep_poll_remove(sqe, (__u64)node);
+#else
     io_uring_prep_poll_remove(sqe, node);
+#endif
 }
 
 /* Add a timeout that self-cancels when another cqe becomes ready */
-- 
2.35.1


