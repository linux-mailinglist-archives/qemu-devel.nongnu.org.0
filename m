Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB8E562FA9
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 11:16:59 +0200 (CEST)
Received: from localhost ([::1]:35600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Cll-0006Gz-Pv
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 05:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1o7Cj6-0004ic-VW; Fri, 01 Jul 2022 05:14:12 -0400
Received: from mga12.intel.com ([192.55.52.136]:7267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1o7Cj4-0005ca-HG; Fri, 01 Jul 2022 05:14:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656666850; x=1688202850;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dJIAyz87mv0JWL1dkpNQNf9eALU5xqqg4+2n7YwwDQA=;
 b=NDRNAVGDNA0Qu04MXmGsOkVgne33k2YBuH8PY/9VRIsDSYw35mzPqE0T
 vnjAbsxmOokgSFFRIUCnYayxtqs0Edf4owqhoRJZpHYVixtUvrZ4isQcQ
 aUjoefRI2yxDg5/X0ss2XK9OuqLnJVMemL8RoqQ9NS40+SVKiA67I2phx
 EC+LsIq8H5E/JpMHCgfqJZlmmkIfUW/XU+pIn6ULyclrYpiBjyzNpXsS3
 aTifJhK1RPUO3q49/dn+0k+Eof3mbdyoQHAC2aV6+isofCmQfdNxmqS6d
 1WWYLqcMs3GL8ga94m8HIhOENwmC4QHzA0bj70QREnZlAszfWy2vBIKno g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="262405480"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="262405480"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 02:14:02 -0700
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="596187770"
Received: from spr.sh.intel.com ([10.239.53.120])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 02:14:00 -0700
From: Chao Gao <chao.gao@intel.com>
To: stefanha@redhat.com,
	fam@euphon.net,
	pbonzini@redhat.com
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, Chao Gao <chao.gao@intel.com>
Subject: [RFC v1] util/aio: Keep notification disabled as much as possible
Date: Fri,  1 Jul 2022 17:13:48 +0800
Message-Id: <20220701091348.215320-1-chao.gao@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chao.gao@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When measuring FIO read performance (cache=writethrough, bs=4k, iodepth=64) in
VMs, we observe ~80K/s notifications (e.g., EPT_MISCONFIG) from guest to qemu.

Currently, poll_set_started(ctx,false) is called in try_poll_mode() to enable
virtqueue notification in below 4 cases:

1. ctx->poll_ns is 0
2. a zero timeout is passed to try_poll_mode()
3. polling succeeded but reported as no progress
4. polling failed and reported as no progress

To minimize unnecessary guest notifications, keep notification disabled when
it is possible, i.e., polling is enabled and last polling doesn't fail.

Keep notification disabled for case #2 and #3; handle case #2 simply by a call
of run_poll_handlers_once() and for case #3, differentiate successful/failed
polling and skip the call of poll_set_started(ctx,false) for successful ones.

With this patch applied, FIO seq-read performance (bs=4k, iodepth=64,
cache=writethrough) in VMs increases from 330K/s to 413K/s IOPS.

Below are changes in VM-exit statistics:
w/o this patch (duration:10s):
           VM-EXIT    Samples  Samples%     Time%    Min Time    Max Time         Avg time

     EPT_MISCONFIG     797440    99.34%    98.58%      0.39us     57.92us      0.60us ( +-   0.05% )
         MSR_WRITE       3672     0.46%     1.15%      0.88us      4.97us      1.52us ( +-   0.53% )
EXTERNAL_INTERRUPT       1638     0.20%     0.27%      0.59us     11.04us      0.81us ( +-   1.71% )

w/ this patch (duration:10s):
          VM-EXIT    Samples  Samples%     Time%    Min Time    Max Time         Avg time

         MSR_WRITE       3524    84.11%    87.17%      0.86us      4.43us      1.74us ( +-   0.60% )
EXTERNAL_INTERRUPT        515    12.29%    10.05%      0.64us      8.95us      1.37us ( +-   1.54% )
     EPT_MISCONFIG        151     3.60%     2.79%      0.40us     52.07us      1.30us ( +-  31.44% )

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
 util/aio-posix.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/util/aio-posix.c b/util/aio-posix.c
index 731f3826c0..bd2076145b 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -519,7 +519,7 @@ static bool remove_idle_poll_handlers(AioContext *ctx,
  * Returns: true if progress was made, false otherwise
  */
 static bool run_poll_handlers(AioContext *ctx, AioHandlerList *ready_list,
-                              int64_t max_ns, int64_t *timeout)
+                              int64_t max_ns, int64_t *timeout, bool *success)
 {
     bool progress;
     int64_t start_time, elapsed_time;
@@ -553,6 +553,8 @@ static bool run_poll_handlers(AioContext *ctx, AioHandlerList *ready_list,
         progress = true;
     }
 
+    *success = !*timeout;
+
     /* If time has passed with no successful polling, adjust *timeout to
      * keep the same ending time.
      */
@@ -577,22 +579,28 @@ static bool run_poll_handlers(AioContext *ctx, AioHandlerList *ready_list,
 static bool try_poll_mode(AioContext *ctx, AioHandlerList *ready_list,
                           int64_t *timeout)
 {
-    int64_t max_ns;
+    int64_t max_ns, start_time;
+    bool success = false;
 
     if (QLIST_EMPTY_RCU(&ctx->poll_aio_handlers)) {
         return false;
     }
 
+    if (!*timeout) {
+        start_time = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
+        return run_poll_handlers_once(ctx, ready_list, start_time, timeout);
+    }
+
     max_ns = qemu_soonest_timeout(*timeout, ctx->poll_ns);
     if (max_ns && !ctx->fdmon_ops->need_wait(ctx)) {
         poll_set_started(ctx, ready_list, true);
 
-        if (run_poll_handlers(ctx, ready_list, max_ns, timeout)) {
+        if (run_poll_handlers(ctx, ready_list, max_ns, timeout, &success)) {
             return true;
         }
     }
 
-    if (poll_set_started(ctx, ready_list, false)) {
+    if (!success && poll_set_started(ctx, ready_list, false)) {
         *timeout = 0;
         return true;
     }
-- 
2.25.1


