Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89A15AA7FF
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 08:23:03 +0200 (CEST)
Received: from localhost ([::1]:48602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU04z-0008HD-Vc
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 02:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oU02c-0006eD-SM
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:20:36 -0400
Received: from mga05.intel.com ([192.55.52.43]:9544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oU02a-0003zh-PN
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662099632; x=1693635632;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=InsOj2BKvI3qPXhcNTJoBKX8hSTxJbXPdOyE4sehb0A=;
 b=KQLGQUg+fT0FryNiSVU6OiC74j/yE/Fwgx+gDBlkRyqRWrzN3gqNvAPA
 PwpOLKneBpfGdqur2ncbx1kVBz3LPqNIbzEHztMOg4oieBk91uARN7U4+
 Q+z+HrwzeEi7/0LQRydZC9K9E8KsiLCZ4nbgfgsDsS3Qt3/MOBHXRgFkj
 Yr6MmJeGJcGH858Uis/OScCCjrBlHAdU4phbLDw/xsZuf6lPBNF9ckD/M
 aKnyrbG8ANkD2IAFjb8vEVI3FDgKDKFOJTYbzqJkaERXgrXSoLq/QP1fD
 eyKMGfk/4H1bE7mtR4ONTyGR/0eIU114UE2whe1JZiu0TiFlLrcU1fGvH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="382204627"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="382204627"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 23:20:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="674224606"
Received: from trist.sh.intel.com ([10.239.160.37])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 23:20:30 -0700
From: "Wang, Lei" <lei4.wang@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-config: extract same logic in *_add_opts() to
 fill_config_groups()
Date: Fri,  2 Sep 2022 22:20:28 +0800
Message-Id: <20220902142028.1469716-1-lei4.wang@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=192.55.52.43;
 envelope-from=lei4.wang@intel.com; helo=mga05.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

QEMU use qemu_add_opts() and qemu_add_drive_opts() to add config options
when initialization. Extract the same logic in both functions to a
seperate function fill_config_groups() to reduce code redundency.

Signed-off-by: Wang, Lei <lei4.wang@intel.com>
---
 util/qemu-config.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/util/qemu-config.c b/util/qemu-config.c
index 433488aa56..3a1c85223a 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -282,36 +282,37 @@ QemuOptsList *qemu_find_opts_err(const char *group, Error **errp)
     return find_list(vm_config_groups, group, errp);
 }
 
-void qemu_add_drive_opts(QemuOptsList *list)
+static int fill_config_groups(QemuOptsList *groups[], int entries,
+                              QemuOptsList *list)
 {
-    int entries, i;
+    int i;
 
-    entries = ARRAY_SIZE(drive_config_groups);
     entries--; /* keep list NULL terminated */
     for (i = 0; i < entries; i++) {
-        if (drive_config_groups[i] == NULL) {
-            drive_config_groups[i] = list;
-            return;
+        if (groups[i] == NULL) {
+            groups[i] = list;
+            return 0;
         }
     }
-    fprintf(stderr, "ran out of space in drive_config_groups");
-    abort();
+    return -1;
 }
 
-void qemu_add_opts(QemuOptsList *list)
+void qemu_add_drive_opts(QemuOptsList *list)
 {
-    int entries, i;
+    if (fill_config_groups(drive_config_groups, ARRAY_SIZE(drive_config_groups),
+                           list) < 0) {
+        fprintf(stderr, "ran out of space in drive_config_groups");
+        abort();
+    }
+}
 
-    entries = ARRAY_SIZE(vm_config_groups);
-    entries--; /* keep list NULL terminated */
-    for (i = 0; i < entries; i++) {
-        if (vm_config_groups[i] == NULL) {
-            vm_config_groups[i] = list;
-            return;
-        }
+void qemu_add_opts(QemuOptsList *list)
+{
+    if (fill_config_groups(vm_config_groups, ARRAY_SIZE(vm_config_groups),
+                           list) < 0) {
+        fprintf(stderr, "ran out of space in vm_config_groups");
+        abort();
     }
-    fprintf(stderr, "ran out of space in vm_config_groups");
-    abort();
 }
 
 /* Returns number of config groups on success, -errno on error */
-- 
2.37.1


