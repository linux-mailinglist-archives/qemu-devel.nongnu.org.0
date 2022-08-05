Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442F458A931
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:05:44 +0200 (CEST)
Received: from localhost ([::1]:45610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuD8-0004iM-Vw
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoo-0007bS-J8
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:36 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32]:36792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtog-0001fF-GS
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:29 -0400
Received: by mail-vk1-xa32.google.com with SMTP id v13so1004608vke.3
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=eQX9n04YPz+bUrrgksUma/VgRZtmN5L8EqxWZCmuRVA=;
 b=oooAJavfQrFb/F1mSAKOvn3DlAVrZfdG4fS7o/L7UwU8b7Wgjmwc0IVyYlwP9lfSu4
 dR01LWGdtOmeRMWD5ksuciPn+3Geo6mFMqU5mznnoUg3of3Ku/Ci1030BGdxjyWICG04
 qcuanO5YaEudCNaAjqSvqq7+qQuXzxehXyEPrS9qg4trK3pjrOR2GHaNFpcv+fYYKCu5
 stZmfXAb06J31P7YbwAEfKOKbRXhBzAWKR3ti8yWrBSmVAMsnAU9kQ8lcQR4ehy7+7V8
 LtOWrM8Yt9C+6yEfOQ3ZqmOXyGYYADHHatRLy5Kbei8Rdx5+Ks3cSSuW8mnO9aR0gVPF
 2Ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=eQX9n04YPz+bUrrgksUma/VgRZtmN5L8EqxWZCmuRVA=;
 b=F8vbYpTtelUxQtn/zLv7+ydQUVKAQ5ibbMCr3fp9739D7pxSTH/J8Moxo39r8mUktN
 xsWDJvLqW1aRMNjgHzStrnTKhTiesxDLZa/xklU+Scl6jGUfvNSPW3vYwsVolfyZCub5
 Ts4voQSVX6dumzNDexGVMCQlNopvQ21CYF7hhtD8iueK9YN1Wprr081P0prGW2s8hBDB
 z6ChSADUq7Jc5RGGdtBg1bbIoFndJIPBuNTI+8w+V2dTNZA5Y0y1Q0qI4d+CwtrAN0zE
 X/Hq8T1arJi0MIxZW5h8QheAkB5oviw33phdInM/VHCc34jG9K4sm5oB42K7IRjqS3aP
 FJqw==
X-Gm-Message-State: ACgBeo3hPL3j9ebYqp+7XtrGcVbQCBpYfWiW5AM3H9jaWb/HXnbeZHS2
 wUyvvsZyDu8uKEtD0fze1Mkoewo4e/4=
X-Google-Smtp-Source: AA6agR7m4vdcp56DjQ/rIpz3gFScBw1V9/oXF1KZD7XaW7cmGcXr1jRPoupsWDjaytZWehpdU+ELUw==
X-Received: by 2002:a1f:b455:0:b0:377:c783:e96 with SMTP id
 d82-20020a1fb455000000b00377c7830e96mr2611473vkf.8.1659692423435; 
 Fri, 05 Aug 2022 02:40:23 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:40:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH for-7.2 v2 14/20] qmp/hmp, device_tree.c: introduce dumpdtb
Date: Fri,  5 Aug 2022 06:39:42 -0300
Message-Id: <20220805093948.82561-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

To save the FDT blob we have the '-machine dumpdtb=<file>' property.
With this property set, the machine saves the FDT in <file> and exit.
The created file can then be converted to plain text dts format using
'dtc'.

There's nothing particularly sophisticated into saving the FDT that
can't be done with the machine at any state, as long as the machine has
a valid FDT to be saved.

The 'dumpdtb' command receives a 'filename' paramenter and, if a valid
FDT is available, it'll save it in a file 'filename'. In short, this is
a '-machine dumpdtb' that can be fired on demand via QMP/HMP.

A valid FDT consists of a FDT that was created using libfdt being
retrieved via 'current_machine->fdt' in device_tree.c. This condition is
met by most FDT users in QEMU.

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hmp-commands.hx              | 13 +++++++++++++
 include/monitor/hmp.h        |  1 +
 include/sysemu/device_tree.h |  1 +
 monitor/hmp-cmds.c           | 12 ++++++++++++
 monitor/qmp-cmds.c           | 13 +++++++++++++
 qapi/machine.json            | 17 +++++++++++++++++
 softmmu/device_tree.c        | 18 ++++++++++++++++++
 7 files changed, 75 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 182e639d14..d2554e9701 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1800,3 +1800,16 @@ ERST
                       "\n\t\t\t\t\t limit on a specified virtual cpu",
         .cmd        = hmp_cancel_vcpu_dirty_limit,
     },
+
+SRST
+``dumpdtb`` *filename*
+  Save the FDT in the 'filename' file to be decoded using dtc.
+  Requires 'libfdt' support.
+ERST
+    {
+        .name       = "dumpdtb",
+        .args_type  = "filename:s",
+        .params     = "[filename] file to save the FDT",
+        .help       = "save the FDT in the 'filename' file to be decoded using dtc",
+        .cmd        = hmp_dumpdtb,
+    },
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index a618eb1e4e..d7f324da59 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -134,6 +134,7 @@ void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
 void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
 void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
 void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
+void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
 void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
 void hmp_info_stats(Monitor *mon, const QDict *qdict);
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index ef060a9759..bf7684e4ed 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -136,6 +136,7 @@ int qemu_fdt_add_path(void *fdt, const char *path);
     } while (0)
 
 void qemu_fdt_dumpdtb(void *fdt, int size);
+void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
 
 /**
  * qemu_fdt_setprop_sized_cells_from_array:
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index c6cd6f91dd..d23ec85f9d 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2472,3 +2472,15 @@ exit:
 exit_no_print:
     error_free(err);
 }
+
+void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
+{
+    const char *filename = qdict_get_str(qdict, "filename");
+    Error *local_err = NULL;
+
+    qmp_dumpdtb(filename, &local_err);
+
+    if (local_err) {
+        error_report_err(local_err);
+    }
+}
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 7314cd813d..8415aca08c 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -45,6 +45,7 @@
 #include "hw/intc/intc.h"
 #include "hw/rdma/rdma.h"
 #include "monitor/stats.h"
+#include "sysemu/device_tree.h"
 
 NameInfo *qmp_query_name(Error **errp)
 {
@@ -596,3 +597,15 @@ bool apply_str_list_filter(const char *string, strList *list)
     }
     return false;
 }
+
+#ifdef CONFIG_FDT
+void qmp_dumpdtb(const char *filename, Error **errp)
+{
+    return qemu_fdt_qmp_dumpdtb(filename, errp);
+}
+#else
+void qmp_dumpdtb(const char *filename, Error **errp)
+{
+    error_setg(errp, "dumpdtb requires libfdt");
+}
+#endif
diff --git a/qapi/machine.json b/qapi/machine.json
index 6afd1936b0..aeb013f3dd 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1664,3 +1664,20 @@
      '*size': 'size',
      '*max-size': 'size',
      '*slots': 'uint64' } }
+
+##
+# @dumpdtb:
+#
+# Save the FDT in dtb format. Requires 'libfdt' support.
+#
+# @filename: name of the FDT file to be created
+#
+# Since: 7.2
+#
+# Example:
+#   {"execute": "dumpdtb"}
+#    "arguments": { "filename": "/tmp/fdt.dtb" } }
+#
+##
+{ 'command': 'dumpdtb',
+  'data': { 'filename': 'str' } }
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 6ca3fad285..cd487ddd4d 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -643,3 +643,21 @@ out:
     g_free(propcells);
     return ret;
 }
+
+void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp)
+{
+    int size;
+
+    if (!current_machine->fdt) {
+        error_setg(errp, "Unable to find the machine FDT");
+        return;
+    }
+
+    size = fdt_totalsize(current_machine->fdt);
+
+    if (g_file_set_contents(filename, current_machine->fdt, size, NULL)) {
+        return;
+    }
+
+    error_setg(errp, "Error when saving machine FDT to file %s", filename);
+}
-- 
2.36.1


