Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985AB5A298E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:32:12 +0200 (CEST)
Received: from localhost ([::1]:36830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaNX-0002WF-Fh
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4c-0008Ff-WC; Fri, 26 Aug 2022 10:12:43 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:42666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4b-0003xq-4S; Fri, 26 Aug 2022 10:12:38 -0400
Received: by mail-oi1-x229.google.com with SMTP id p187so2106351oia.9;
 Fri, 26 Aug 2022 07:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=jVoGGNXMdLWVBeU6goBOpT7H07W5qN2vMSAqWjeDRSw=;
 b=KauDos761N8d9qNn5h2KfB+XnFxBbVueWyuVWiML2wr1ZVVrZDmC914/E3A2ZI4i5E
 fQg0ADs4+alXZWyzBqEhIJOVEfOgV1FO/s5QqGJZ5/M8WnsNHSFjGVNgL7VwzGVJMihd
 OY2tkDR0zxx2p5RwmbeqDfO2PNnvXSG0zZqm9yy+z5R4D2XdJLhndxOavVL0dZyyYWNi
 qOcEdMeZ5GjnE6FkRqfzmpMr7yAcuWiD7qp1m6xxhc3ypBx2MjCDYEMwOVXFi78CT5Fv
 suAM0wYHfzXib9KrHO4O8QE7jowZi3ZBW0fuf6AuNSry2FyP1WZdXwRy9xewdLAjlkMA
 JIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=jVoGGNXMdLWVBeU6goBOpT7H07W5qN2vMSAqWjeDRSw=;
 b=u8MUzAqVdb6BCc+98KZbiXZMwIUZ9AKkNSnkWb2c3twTC5GWS3r7Kh0TN0rjn+qK3g
 Y8Bp5sqLnMfcknZL/qwbfR5P/fz8/bJeUAw8ZCCkPbv57tkiyTYs6eKptr6mk5UW9Y+D
 Ht21tEOupxRJhUm7i0THcximwSPHWB9BsiSi0NaLXYon59sLHPuo830ZOPL2wrSydeLj
 aK7KzsixW/CEFBEv2sm3r8JAoAfxfnhbJZWMMBR9Dlc0Hdf+BYZ5DUlFImXBErLEYPu8
 a2DMtB/31WQaemj0PLrpzFjn0EwCfdLBHPfmUDjMXcgLjcwWlZ8VFjwrp775zORFWdKX
 Zgrg==
X-Gm-Message-State: ACgBeo08MBpy3erJ9X37afw79IDIq1/VK2KHQd4Pa5EPlW2NVB07xo4f
 jD6SX7mtrPhUZfhtCPkOZHvsuYzqb0k=
X-Google-Smtp-Source: AA6agR6uUV41dy2UKcX+plQ5KCY12SsZmzGQapsOvTtoC/73KpQTQKjmusvj3btAw16WOPLIi5hYzg==
X-Received: by 2002:a05:6808:14c4:b0:343:7905:bbab with SMTP id
 f4-20020a05680814c400b003437905bbabmr1690218oiw.93.1661523155901; 
 Fri, 26 Aug 2022 07:12:35 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:35 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH for-7.2 v4 14/21] qmp/hmp, device_tree.c: introduce dumpdtb
Date: Fri, 26 Aug 2022 11:11:43 -0300
Message-Id: <20220826141150.7201-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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

This command will always be executed in-band (i.e. holding BQL),
avoiding potential race conditions with machines that might change the
FDT during runtime (e.g. PowerPC 'pseries' machine).

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
index 182e639d14..2dd737078e 100644
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
+        .args_type  = "filename:F",
+        .params     = "filename",
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
index c6cd6f91dd..1c7bfd3b9d 100644
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
+        hmp_handle_error(mon, local_err);
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
2.37.2


