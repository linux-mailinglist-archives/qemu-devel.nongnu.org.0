Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7AD2B4484
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:14:46 +0100 (CET)
Received: from localhost ([::1]:60882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keeLF-0000Ts-9y
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1keeH9-0004CS-Cj
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:10:31 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:35686 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1keeH5-0002uh-8B
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:10:31 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id D186A41373;
 Mon, 16 Nov 2020 13:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1605532224; x=1607346625; bh=6qksPsC8TxVM6cbrYY40O/GefzqGChR5LH9
 2hSj6dks=; b=QC+vIKr9sPm48D3c3RGvhQrmYsjaBifsZXu5R7x0l/oXf5XYAqw
 Ce34xsCiw93eCTI7fvwfKb/qKBxL3A4pDYKUFA27TfIIjNhDhgpK7PSY8T0ZEhPP
 xCaKDZZj7THmzq0TuDFh8ZKcwNHVEE6HozTTPTVA3r1tkKtDrq/kvHzg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lEpfjD9dG7uv; Mon, 16 Nov 2020 16:10:24 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C0ACF41394;
 Mon, 16 Nov 2020 16:10:24 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 16
 Nov 2020 16:10:24 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.0 5/6] hmp: Add 'info accel' command
Date: Mon, 16 Nov 2020 16:10:10 +0300
Message-ID: <20201116131011.26607-6-r.bolshakov@yadro.com>
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The command is made after 'info kvm' and aims to replace it as more
generic one.

If used without parameters, the command can used to get current
accelerator. Otherwise, it may be used to determine if an accelerator is
available. Here's an example if a VM with hvf accel is started:

  (qemu) info accel
  hvf support: enabled
  (qemu) info accel kvm
  kvm support: not compiled
  (qemu) info accel tcg
  tcg support: disabled

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 hmp-commands-info.hx  | 13 +++++++++++++
 include/monitor/hmp.h |  1 +
 monitor/hmp-cmds.c    | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 117ba25f91..e9da6b52e4 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -337,6 +337,19 @@ SRST
     Show KVM information.
 ERST
 
+    {
+        .name       = "accel",
+        .args_type  = "name:s?",
+        .params     = "[name]",
+        .help       = "show accelerator information",
+        .cmd        = hmp_info_accel,
+    },
+
+SRST
+  ``info accel``` [*name*]
+    Show accelerator information.
+ERST
+
     {
         .name       = "numa",
         .args_type  = "",
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index ed2913fd18..03f22957d9 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -21,6 +21,7 @@ void hmp_handle_error(Monitor *mon, Error *err);
 void hmp_info_name(Monitor *mon, const QDict *qdict);
 void hmp_info_version(Monitor *mon, const QDict *qdict);
 void hmp_info_kvm(Monitor *mon, const QDict *qdict);
+void hmp_info_accel(Monitor *mon, const QDict *qdict);
 void hmp_info_status(Monitor *mon, const QDict *qdict);
 void hmp_info_uuid(Monitor *mon, const QDict *qdict);
 void hmp_info_chardev(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index ea86289fe8..00db791aa3 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -20,6 +20,7 @@
 #include "chardev/char.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/runstate.h"
+#include "sysemu/accel.h"
 #include "qemu/config-file.h"
 #include "qemu/option.h"
 #include "qemu/timer.h"
@@ -133,6 +134,37 @@ void hmp_info_kvm(Monitor *mon, const QDict *qdict)
     qapi_free_AccelInfo(info);
 }
 
+void hmp_info_accel(Monitor *mon, const QDict *qdict)
+{
+    AccelInfo *info;
+    AccelClass *acc;
+    const char *name, *typename;
+    char *current_name;
+    int len;
+
+    /* Figure out current accelerator */
+    acc = ACCEL_GET_CLASS(current_accel());
+    typename = object_class_get_name(OBJECT_CLASS(acc));
+    len = strlen(typename) - strlen(ACCEL_CLASS_SUFFIX);
+    current_name = g_strndup(typename, len);
+
+    name = qdict_get_try_str(qdict, "name");
+    if (!name) {
+        name = current_name;
+    }
+
+    info = qmp_query_accel(name, NULL);
+    monitor_printf(mon, "%s support: ", name);
+    if (info->present) {
+        monitor_printf(mon, "%s\n", info->enabled ? "enabled" : "disabled");
+    } else {
+        monitor_printf(mon, "not compiled\n");
+    }
+
+    qapi_free_AccelInfo(info);
+    g_free(current_name);
+}
+
 void hmp_info_status(Monitor *mon, const QDict *qdict)
 {
     StatusInfo *info;
-- 
2.29.2


