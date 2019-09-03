Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9461AA63DA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 10:29:45 +0200 (CEST)
Received: from localhost ([::1]:42796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i54C8-0000GE-L8
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 04:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50491)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chen.zhang@intel.com>) id 1i54B0-000847-QT
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 04:28:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1i54Ay-0002nj-VG
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 04:28:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:25612)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1i54Ay-0002im-Ln
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 04:28:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 01:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,462,1559545200"; d="scan'208";a="176514461"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008.jf.intel.com with ESMTP; 03 Sep 2019 01:28:27 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>,
	qemu-dev <qemu-devel@nongnu.org>
Date: Tue,  3 Sep 2019 16:22:29 +0800
Message-Id: <20190903082229.28609-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.GIT
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
Subject: [Qemu-devel] [PATCH] net/filter: Add filter order info for "info
 network"
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

People need a way to know current filter order if they
want to dynamic add/remove netfilter.

For example:
(qemu) info network
.......
filters order:
 m0 ---> redire0 ---> redire1 ---> End
.......

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/net.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/net/net.c b/net/net.c
index 84aa6d8d00..496f4aa049 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1253,15 +1253,23 @@ void print_net_client(Monitor *mon, NetClientState *nc)
                    NetClientDriver_str(nc->info->type),
                    nc->info_str);
     if (!QTAILQ_EMPTY(&nc->filters)) {
-        monitor_printf(mon, "filters:\n");
-    }
-    QTAILQ_FOREACH(nf, &nc->filters, next) {
-        char *path = object_get_canonical_path_component(OBJECT(nf));
+        monitor_printf(mon, "filters order:\n");
+        QTAILQ_FOREACH(nf, &nc->filters, next) {
+            char *path = object_get_canonical_path_component(OBJECT(nf));
+
+            monitor_printf(mon, " %s --->", path);
+        }
+        monitor_printf(mon, " End\n");
+        monitor_printf(mon, "filters detail info:\n");
 
-        monitor_printf(mon, "  - %s: type=%s", path,
-                       object_get_typename(OBJECT(nf)));
-        netfilter_print_info(mon, nf);
-        g_free(path);
+        QTAILQ_FOREACH(nf, &nc->filters, next) {
+            char *path = object_get_canonical_path_component(OBJECT(nf));
+
+            monitor_printf(mon, "  - %s: type=%s", path,
+                           object_get_typename(OBJECT(nf)));
+            netfilter_print_info(mon, nf);
+            g_free(path);
+        }
     }
 }
 
-- 
2.17.GIT


