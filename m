Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5986256CEE8
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jul 2022 14:11:06 +0200 (CEST)
Received: from localhost ([::1]:55220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAVmC-0003SO-SY
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 08:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1oAVkN-0001tu-8I; Sun, 10 Jul 2022 08:09:11 -0400
Received: from mga03.intel.com ([134.134.136.65]:17642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1oAVkK-0007JX-Qk; Sun, 10 Jul 2022 08:09:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657454948; x=1688990948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IfVvyCixYj6yEHXOFYHNjGFkJj1b0Pzjeo68JOd1DTg=;
 b=iUmekxHathbJR2gvnAq0G2MagfZJBQFin7rk9K9cEoEayxhdsnQSzUtg
 Xp3T/nSQW+5dzf2VK8f5uU9+1k/WCHysL8sTodh59VaBF8sx/ysk29wrJ
 H6VuFjoD26Gcg3sgnr8AzPAgnn+rlhNhrHNCEE/tHqa9jKj0wmIBOgGPm
 ZFhbG8wd+L/TaMZ2fQ2bpWDP8bKyiPoh3K8r6+j18P4EdDJMrp4B44UYs
 diDZsZce/azTgrVu6sXvHgYF/7eud0eyiOoiN/UGDNJaYCwMo9mEl+OvC
 OwhfTlUVC/5Q1F25VRwQZmbyNObgbDfEqmo1CT4PK+EPjMZZGnDKn+Q1h w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="285632854"
X-IronPort-AV: E=Sophos;i="5.92,260,1650956400"; d="scan'208";a="285632854"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2022 05:09:00 -0700
X-IronPort-AV: E=Sophos;i="5.92,260,1650956400"; d="scan'208";a="652106503"
Received: from spr.sh.intel.com ([10.239.53.120])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2022 05:08:59 -0700
From: Chao Gao <chao.gao@intel.com>
To: stefanha@redhat.com,
	fam@euphon.net,
	pbonzini@redhat.com
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, Chao Gao <chao.gao@intel.com>
Subject: [PATCH] util/aio: Defer disabling poll mode as long as possible
Date: Sun, 10 Jul 2022 20:08:49 +0800
Message-Id: <20220710120849.63086-1-chao.gao@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chao.gao@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

When we measure FIO read performance (cache=writethrough, bs=4k,
iodepth=64) in VMs, ~80K/s notifications (e.g., EPT_MISCONFIG) are observed
from guest to qemu.

It turns out those frequent notificatons are caused by interference from
worker threads. Worker threads queue bottom halves after completing IO
requests.  Pending bottom halves may lead to either aio_compute_timeout()
zeros timeout and pass it to try_poll_mode() or run_poll_handlers() returns
no progress after noticing pending aio_notify() events. Both cause
run_poll_handlers() to call poll_set_started(false) to disable poll mode.
However, for both cases, as timeout is already zeroed, the event loop
(i.e., aio_poll()) just processes bottom halves and then starts the next
event loop iteration. So, disabling poll mode has no value but leads to
unnecessary notifications from guest.

To minimize unnecessary notifications from guest, defer disabling poll
mode to when the event loop is about to be blocked.

With this patch applied, FIO seq-read performance (bs=4k, iodepth=64,
cache=writethrough) in VMs increases from 330K/s to 413K/s IOPS.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Chao Gao <chao.gao@intel.com>
---
 util/aio-posix.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/util/aio-posix.c b/util/aio-posix.c
index 731f3826c0..6cc6256d53 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -585,18 +585,16 @@ static bool try_poll_mode(AioContext *ctx, AioHandlerList *ready_list,
 
     max_ns = qemu_soonest_timeout(*timeout, ctx->poll_ns);
     if (max_ns && !ctx->fdmon_ops->need_wait(ctx)) {
+        /*
+         * Enable poll mode. It pairs with the poll_set_started() in
+         * aio_poll() which disables poll mode.
+         */
         poll_set_started(ctx, ready_list, true);
 
         if (run_poll_handlers(ctx, ready_list, max_ns, timeout)) {
             return true;
         }
     }
-
-    if (poll_set_started(ctx, ready_list, false)) {
-        *timeout = 0;
-        return true;
-    }
-
     return false;
 }
 
@@ -657,6 +655,17 @@ bool aio_poll(AioContext *ctx, bool blocking)
      * system call---a single round of run_poll_handlers_once suffices.
      */
     if (timeout || ctx->fdmon_ops->need_wait(ctx)) {
+        /*
+         * Disable poll mode. poll mode should be disabled before the call
+         * of ctx->fdmon_ops->wait() so that guest's notification can wake
+         * up IO threads when some work becomes pending. It is essential to
+         * avoid hangs or unnecessary latency.
+         */
+        if (poll_set_started(ctx, &ready_list, false)) {
+            timeout = 0;
+            progress = true;
+        }
+
         ctx->fdmon_ops->wait(ctx, &ready_list, timeout);
     }
 
-- 
2.25.1


