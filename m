Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318B84BDB12
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:06:34 +0100 (CET)
Received: from localhost ([::1]:34738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMC8v-0004Qr-1T
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:06:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haiyue.wang@intel.com>)
 id 1nMC10-00068S-6r; Mon, 21 Feb 2022 11:58:22 -0500
Received: from mga06.intel.com ([134.134.136.31]:14488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haiyue.wang@intel.com>)
 id 1nMC0w-0003gO-Tz; Mon, 21 Feb 2022 11:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645462698; x=1676998698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hjPPB1lyi8cVTWfN5T1PBQ3m79R+DbDQbJX/zzx4Y2w=;
 b=jXZzJLpXsWyL80ZEPoh2q2M+gJKwxWracD2HD3AWCdsG6ilke+cTXSPw
 xhjhOxL5Fupn2PX8UIXGl4dCpp/ZNDMDgYwJ68byX343z8y8ze2aKktq9
 9PY94d2TSH3HtrAlblygqsl5phnxGMWw4EyLaHLHfBHM3hAG9ZZoAT6F5
 SOxMc/vHIXwdhIQYd9Rz6xLLuyllfWJBGL4lK6fd02UWTLCCLhFgoioJ3
 sVYP73gVii2x6u7uwSsoqfE6BSygPOM/lPe3zriwLoD3waSDp+QURKNC6
 QLj9kMGMCkpwvR/JDv2Lpsu5lZJcSeqGuR8UsYcTnhhIaMnmVOKxOHyRz A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="312287301"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="312287301"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 08:58:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="547401562"
Received: from npg-dpdk-haiyue-2.sh.intel.com ([10.67.118.240])
 by orsmga008.jf.intel.com with ESMTP; 21 Feb 2022 08:58:09 -0800
From: Haiyue Wang <haiyue.wang@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] aio-posix: fix build failure io_uring 2.2
Date: Tue, 22 Feb 2022 00:24:01 +0800
Message-Id: <20220221162401.45415-1-haiyue.wang@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217161627.45351-1-haiyue.wang@intel.com>
References: <20220217161627.45351-1-haiyue.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=haiyue.wang@intel.com; helo=mga06.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use LIBURING_HAVE_DATA64 to check whether the io_uring supports 64-bit
variants of the get/set userdata, to convert the paramter to the right
data type.

Signed-off-by: Haiyue Wang <haiyue.wang@intel.com>
---
v2: update the commit log, and change the type cast as io_uring test does.
---
 util/fdmon-io_uring.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/util/fdmon-io_uring.c b/util/fdmon-io_uring.c
index 1461dfa407..ab43052dd7 100644
--- a/util/fdmon-io_uring.c
+++ b/util/fdmon-io_uring.c
@@ -179,7 +179,11 @@ static void add_poll_remove_sqe(AioContext *ctx, AioHandler *node)
 {
     struct io_uring_sqe *sqe = get_sqe(ctx);
 
+#ifdef LIBURING_HAVE_DATA64
+    io_uring_prep_poll_remove(sqe, (__u64)(uintptr_t)node);
+#else
     io_uring_prep_poll_remove(sqe, node);
+#endif
 }
 
 /* Add a timeout that self-cancels when another cqe becomes ready */
-- 
2.35.1


