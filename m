Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EC75A29AA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:38:58 +0200 (CEST)
Received: from localhost ([::1]:43966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaU3-0000SN-14
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4z-0000RD-72; Fri, 26 Aug 2022 10:13:01 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:43721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4x-0003zt-2c; Fri, 26 Aug 2022 10:13:00 -0400
Received: by mail-oi1-x232.google.com with SMTP id w196so2105235oiw.10;
 Fri, 26 Aug 2022 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=XZ2+l42NQGkEM1CbxvqM5IAi34JMlT8VNLeZsAU2PwU=;
 b=JuHUWni7JweBBhxOklvCTVfkwQLRIGwWvjRtxoH/nXjp5hI15bkA5dg4PDFh7Cc3VR
 jK0jUZxLnFPYWmIuXyop9IDs1VNUKWUdi8ONNAVDkbiu7sTqgR8CLqI79YZt5oaOENaf
 sYt0MdJgA9Yk4Nt4hDqcg5pWx/Y0WTbRIJ16eItxndIfCYkkhoK+dNgbtkIaGOPJGBmg
 IwzJyeSnaJ2ByyhS3bc6KvvHjXcYfP05BrLWgJA2BgMV1YK4URvQuPY3OmG/wMHZ1ykg
 J8pjSCtt7j8kTRgcOYG3DwpLXQke4jvL+BBM2TfsD3TFrsYF9K8Rt6a6PHDlRTCK7zBw
 8mNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=XZ2+l42NQGkEM1CbxvqM5IAi34JMlT8VNLeZsAU2PwU=;
 b=PleGusDsNpTN26VxdbhJ6ecSeK4nICHcJhBGadP5sUcelkqUSZxnJIBSUdTvurErU8
 ByqR8ezR2FoyNub0xl5cZn0QcrqxiMp1CWZDpVPaywWH6bOtu+aGzFCEUFbysylXTiPU
 2RInUyMLf/Z77NMEEPD0513xZk0CyPMzoUl+LCGgndTENxx7vxurgADHW+Ri7Ic1cyDo
 7zgV6u3ZHh3C8NubtpD0C34OC+PIByKtNvFNEGkGR2sEwxu/6oZL8CObNvPFJYtWM3oj
 WmHg3wBm+N/bzy+LlN2OObXHkQwgSf58EG/u64aKn4YdqpkC5WvR4E88EibnPZyn7h7x
 INMQ==
X-Gm-Message-State: ACgBeo1n9DWhnTj0bMSJeyQS0j7OurytdHOJdXTGXPqAQcWKapPMfuCk
 SolV41Sviz4ZCPIgQy/1IxpHo2vTTsY=
X-Google-Smtp-Source: AA6agR5CTZbyy1PsGqzceDXdEwSaSBPadcFUHh8q7kSmhrMZKjQkjuYI52nrej/ConCsmhoqM2SfZw==
X-Received: by 2002:a05:6808:190e:b0:343:335:c0d1 with SMTP id
 bf14-20020a056808190e00b003430335c0d1mr1747315oib.246.1661523176690; 
 Fri, 26 Aug 2022 07:12:56 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:56 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 21/21] qmp/hmp,
 device_tree.c: add textformat dumpdtb option
Date: Fri, 26 Aug 2022 11:11:50 -0300
Message-Id: <20220826141150.7201-22-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
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

The QMP/HMP 'dumpdtb' command is saving the FDT blob to be decoded using
'dtc' like the '-machine dumpdtb' always did. However, after adding
support for the 'info fdt' command, we're now able to format a full FDT
in text format - which is what 'info fdt /' already does.

Let's extend the 'dumpdtb' QMP/HMP command with the capability of saving
the FDT in plain text format. A new textformat '-t' option was added to
it. With this option, qemu_fdt_qmp_dumpdtb() will call
qemu_fdt_qmp_query_fdt() to retrieve the human string that represents
the output of 'info fdt /' and write it to the file.

This will allow users to dump the FDT in a text file and immediately
open it to see its contents, without the need of an extra step to decode
a dtb blob with 'dtc'. Here's an example:

(qemu) dumpdtb fdt.dtb

$ file fdt.dtb
fdt.dtb: Device Tree Blob version 17, size=15458, boot CPU=0, string block
size=2318, DT structure block size=13084

(qemu) dumpdtb -t fdt.txt

$ file fdt.txt
fdt.txt: ASCII text, with very long lines (4746)

$ grep -A 3 'persistent-memory' fdt.txt
    ibm,persistent-memory {
        device_type = "ibm,persistent-memory";
        #size-cells = <0x0>;
        #address-cells = <0x1>;
    };

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hmp-commands.hx              |  7 ++++---
 include/sysemu/device_tree.h |  3 ++-
 monitor/hmp-cmds.c           |  3 ++-
 monitor/qmp-cmds.c           |  8 +++++---
 qapi/machine.json            |  2 +-
 softmmu/device_tree.c        | 25 ++++++++++++++++++++++---
 6 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 2dd737078e..8a9595cc26 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1808,8 +1808,9 @@ SRST
 ERST
     {
         .name       = "dumpdtb",
-        .args_type  = "filename:F",
-        .params     = "filename",
-        .help       = "save the FDT in the 'filename' file to be decoded using dtc",
+        .args_type  = "textformat:-t,filename:F",
+        .params     = "[-t] filename",
+        .help       = "save the FDT in the 'filename' file to be decoded using dtc."
+                       "Use '-t' to save the file in text (dts) format.",
         .cmd        = hmp_dumpdtb,
     },
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 551a02dee2..082ff69751 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -138,7 +138,8 @@ int qemu_fdt_add_path(void *fdt, const char *path);
     } while (0)
 
 void qemu_fdt_dumpdtb(void *fdt, int size);
-void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
+void qemu_fdt_qmp_dumpdtb(const char *filename, bool textformat,
+                          Error **errp);
 HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
                                           bool has_propname,
                                           const char *propname,
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 320204e982..ffcb9ffb67 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2476,9 +2476,10 @@ exit_no_print:
 void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
 {
     const char *filename = qdict_get_str(qdict, "filename");
+    bool textformat = qdict_get_try_bool(qdict, "textformat", false);
     Error *local_err = NULL;
 
-    qmp_dumpdtb(filename, &local_err);
+    qmp_dumpdtb(true, textformat, filename, &local_err);
 
     if (local_err) {
         hmp_handle_error(mon, local_err);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index ca2a96cdf7..8d625e5e7d 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -599,9 +599,10 @@ bool apply_str_list_filter(const char *string, strList *list)
 }
 
 #ifdef CONFIG_FDT
-void qmp_dumpdtb(const char *filename, Error **errp)
+void qmp_dumpdtb(bool has_textformat, bool textformat,
+                 const char *filename, Error **errp)
 {
-    return qemu_fdt_qmp_dumpdtb(filename, errp);
+    return qemu_fdt_qmp_dumpdtb(filename, textformat, errp);
 }
 
 HumanReadableText *qmp_x_query_fdt(const char *nodepath, bool has_propname,
@@ -610,7 +611,8 @@ HumanReadableText *qmp_x_query_fdt(const char *nodepath, bool has_propname,
     return qemu_fdt_qmp_query_fdt(nodepath, has_propname, propname, errp);
 }
 #else
-void qmp_dumpdtb(const char *filename, Error **errp)
+void qmp_dumpdtb(bool has_textformat, bool textformat,
+                 const char *filename, Error **errp)
 {
     error_setg(errp, "dumpdtb requires libfdt");
 }
diff --git a/qapi/machine.json b/qapi/machine.json
index c15ce60f46..8573f96da8 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1680,7 +1680,7 @@
 #
 ##
 { 'command': 'dumpdtb',
-  'data': { 'filename': 'str' } }
+  'data': { '*textformat':'bool', 'filename': 'str' } }
 
 ##
 # @x-query-fdt:
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index ad2386295b..34af31552d 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -645,8 +645,10 @@ out:
     return ret;
 }
 
-void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp)
+void qemu_fdt_qmp_dumpdtb(const char *filename, bool textformat, Error **errp)
 {
+    g_autoptr(HumanReadableText) txt = NULL;
+    void *contents = NULL;
     int size;
 
     if (!current_machine->fdt) {
@@ -654,9 +656,26 @@ void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp)
         return;
     }
 
-    size = fdt_totalsize(current_machine->fdt);
+    if (textformat) {
+        /*
+         * 'info fdt /' returns all the FDT in text format, formatted
+         * with a style close to what 'dtc' uses to decode the blob
+         * to a .dts.
+         */
+        txt = qemu_fdt_qmp_query_fdt("/", false, NULL, errp);
+
+        if (!txt) {
+            return;
+        }
+
+        contents = txt->human_readable_text;
+        size = strlen(txt->human_readable_text);
+    } else {
+        contents = current_machine->fdt;
+        size = fdt_totalsize(current_machine->fdt);
+    }
 
-    if (g_file_set_contents(filename, current_machine->fdt, size, NULL)) {
+    if (g_file_set_contents(filename, contents, size, NULL)) {
         return;
     }
 
-- 
2.37.2


