Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570C66CBE0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 11:27:49 +0200 (CEST)
Received: from localhost ([::1]:35796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho2hY-0005X3-I2
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 05:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41546)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chen.zhang@intel.com>) id 1ho2hI-000599-4g
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 05:27:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1ho2hG-00069J-WF
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 05:27:32 -0400
Received: from mga12.intel.com ([192.55.52.136]:21640)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1ho2hG-00063c-MV
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 05:27:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 02:27:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="168220616"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jul 2019 02:27:21 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Li Zhijian <lizhijian@cn.fujitsu.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>
Date: Thu, 18 Jul 2019 17:22:19 +0800
Message-Id: <20190718092219.20081-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.GIT
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
Subject: [Qemu-devel] [PATCH V3] net/colo-compare.c: Fix memory leak and
 code style issue.
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
Cc: Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

This patch to fix the origin "char *data" menory leak, code style issue
and add necessary check here.
Reported-by: Coverity (CID 1402785)

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 909dd6c6eb..fcccb4c6f6 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -127,6 +127,17 @@ static int compare_chr_send(CompareState *s,
                             uint32_t vnet_hdr_len,
                             bool notify_remote_frame);
 
+static bool packet_matches_str(const char *str,
+                               uint8_t *buf,
+                               uint32_t packet_len)
+{
+    if (packet_len != strlen(str)) {
+        return false;
+    }
+
+    return !memcmp(str, buf, strlen(str));
+}
+
 static void notify_remote_frame(CompareState *s)
 {
     char msg[] = "DO_CHECKPOINT";
@@ -1008,21 +1019,24 @@ static void compare_notify_rs_finalize(SocketReadState *notify_rs)
 {
     CompareState *s = container_of(notify_rs, CompareState, notify_rs);
 
-    /* Get Xen colo-frame's notify and handle the message */
-    char *data = g_memdup(notify_rs->buf, notify_rs->packet_len);
-    char msg[] = "COLO_COMPARE_GET_XEN_INIT";
+    const char msg[] = "COLO_COMPARE_GET_XEN_INIT";
     int ret;
 
-    if (!strcmp(data, "COLO_USERSPACE_PROXY_INIT")) {
+    if (packet_matches_str("COLO_USERSPACE_PROXY_INIT",
+                           notify_rs->buf,
+                           notify_rs->packet_len)) {
         ret = compare_chr_send(s, (uint8_t *)msg, strlen(msg), 0, true);
         if (ret < 0) {
             error_report("Notify Xen COLO-frame INIT failed");
         }
-    }
-
-    if (!strcmp(data, "COLO_CHECKPOINT")) {
+    } else if (packet_matches_str("COLO_CHECKPOINT",
+                                  notify_rs->buf,
+                                  notify_rs->packet_len)) {
         /* colo-compare do checkpoint, flush pri packet and remove sec packet */
         g_queue_foreach(&s->conn_list, colo_flush_packets, s);
+    } else {
+        error_report("COLO compare got unsupported instruction '%s'",
+                     (char *)notify_rs->buf);
     }
 }
 
-- 
2.17.GIT


