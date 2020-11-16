Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2452D2B4474
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:12:14 +0100 (CET)
Received: from localhost ([::1]:52468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keeIn-0005MN-6L
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1keeH4-00040m-Ft
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:10:26 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:35650 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1keeH2-0002qg-Na
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:10:26 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5F6C141396;
 Mon, 16 Nov 2020 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1605532222; x=1607346623; bh=NkZL88GV2C/4arjpUh/JrUJtze4bu+ghmiN
 O15N3+Vo=; b=OOOFX+dWXniSWqJRZJFpU6D4//nHdq4Cz3eTsm7pXVLCU/daNP7
 6XAxp3y9oNm20pCRB2C1Zrtw4cFRnIXk1EGl9BaLtvntZmRFjoGsxA4A7InK+D/Q
 WMKBQ53VgpDqt2FC3lz6pD2/hInEg6ycPy5ONnkue/mOiU5dDTQpJ2y4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p7_aHXS5jNGk; Mon, 16 Nov 2020 16:10:22 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 6B82941392;
 Mon, 16 Nov 2020 16:10:22 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 16
 Nov 2020 16:10:21 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.0 1/6] qapi: Add query-accel command
Date: Mon, 16 Nov 2020 16:10:06 +0300
Message-ID: <20201116131011.26607-2-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116131011.26607-1-r.bolshakov@yadro.com>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 08:10:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's a problem for management applications to determine if certain
accelerators available. Generic QMP command should help with that.

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 monitor/qmp-cmds.c | 15 +++++++++++++++
 qapi/machine.json  | 19 +++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index a08143b323..0454394e76 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -62,6 +62,21 @@ KvmInfo *qmp_query_kvm(Error **errp)
     return info;
 }
 
+KvmInfo *qmp_query_accel(const char *name, Error **errp)
+{
+    KvmInfo *info = g_malloc0(sizeof(*info));
+
+    AccelClass *ac = accel_find(name);
+
+    if (ac) {
+        info->enabled = *ac->allowed;
+        info->present = true;
+    }
+
+    return info;
+}
+
+
 UuidInfo *qmp_query_uuid(Error **errp)
 {
     UuidInfo *info = g_malloc0(sizeof(*info));
diff --git a/qapi/machine.json b/qapi/machine.json
index 7c9a263778..11f364fab4 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -591,6 +591,25 @@
 ##
 { 'command': 'query-kvm', 'returns': 'KvmInfo' }
 
+##
+# @query-accel:
+#
+# Returns information about an accelerator
+#
+# Returns: @KvmInfo
+#
+# Since: 6.0.0
+#
+# Example:
+#
+# -> { "execute": "query-accel", "arguments": { "name": "kvm" } }
+# <- { "return": { "enabled": true, "present": true } }
+#
+##
+{ 'command': 'query-accel',
+  'data': { 'name': 'str' },
+  'returns': 'KvmInfo' }
+
 ##
 # @NumaOptionsType:
 #
-- 
2.29.2


