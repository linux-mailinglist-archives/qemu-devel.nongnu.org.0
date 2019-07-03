Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A705DB16
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 03:43:47 +0200 (CEST)
Received: from localhost ([::1]:58622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiUJG-0006wt-L2
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 21:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43922)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chen.zhang@intel.com>) id 1hiUIZ-0006YE-5T
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 21:43:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1hiUIY-0008EO-9Q
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 21:43:03 -0400
Received: from mga05.intel.com ([192.55.52.43]:28489)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1hiUIY-0008CC-0j
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 21:43:02 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jul 2019 18:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,445,1557212400"; d="scan'208";a="315424488"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga004.jf.intel.com with ESMTP; 02 Jul 2019 18:42:56 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Li Zhijian <lizhijian@cn.fujitsu.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>
Date: Wed,  3 Jul 2019 09:38:05 +0800
Message-Id: <20190703013805.2722-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.GIT
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-devel] [PATCH] net/colo-compare.c: Fix memory leak and code
 style issue.
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

Address Peter's comments in patch "COLO-compare:Add colo-compare
remote notify support".

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 909dd6c6eb..363b1edd11 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -1008,21 +1008,20 @@ static void compare_notify_rs_finalize(SocketReadState *notify_rs)
 {
     CompareState *s = container_of(notify_rs, CompareState, notify_rs);
 
-    /* Get Xen colo-frame's notify and handle the message */
-    char *data = g_memdup(notify_rs->buf, notify_rs->packet_len);
-    char msg[] = "COLO_COMPARE_GET_XEN_INIT";
+    const char msg[] = "COLO_COMPARE_GET_XEN_INIT";
     int ret;
 
-    if (!strcmp(data, "COLO_USERSPACE_PROXY_INIT")) {
+    if (!strcmp((char *)notify_rs->buf, "COLO_USERSPACE_PROXY_INIT")) {
         ret = compare_chr_send(s, (uint8_t *)msg, strlen(msg), 0, true);
         if (ret < 0) {
             error_report("Notify Xen COLO-frame INIT failed");
         }
-    }
-
-    if (!strcmp(data, "COLO_CHECKPOINT")) {
+    } else if (!strcmp((char *)notify_rs->buf, "COLO_CHECKPOINT")) {
         /* colo-compare do checkpoint, flush pri packet and remove sec packet */
         g_queue_foreach(&s->conn_list, colo_flush_packets, s);
+    } else {
+        error_report("COLO compare got unsupported instruction '%s'",
+                     (char *)notify_rs->buf);
     }
 }
 
-- 
2.17.GIT


