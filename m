Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57505961FC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 20:09:11 +0200 (CEST)
Received: from localhost ([::1]:40556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO102-0006hQ-Pk
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 14:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0TS-0005b7-19; Tue, 16 Aug 2022 13:35:42 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:37686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0TP-0002c2-RC; Tue, 16 Aug 2022 13:35:29 -0400
Received: by mail-vs1-xe29.google.com with SMTP id z185so1298920vsb.4;
 Tue, 16 Aug 2022 10:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=UM1w2DHKtrYxtYYq5uWUmNXReRFsb3rxAEPbAJKrJIA=;
 b=P7HwE12Fnjk6+U2YMnFHBEn1o2pnvw0l8xWvD2V4mJhRMiVdW7orUWjopQiyg42G6R
 pq7NIgvFS+vr57Kcxb0zCch1L2AL9los0i7yneYmpER/XzXx1RwXsRYeRTObWlPT1m1x
 G1OOWiBxYTbp6E7AoblSCUplUrgJb3v/BilOdEPTqHJSWpybbLES9+yNbZkSZiYp7qw7
 DqOlbkUa18X7Alz9fpNAZmv04oDuStE/dUbYs1ZiR3hWtWA/MOsbx3D4CKM2BqZyQRJ7
 oGsf6fkaT/XVRsI0sZTt+BIm+l5ifIKtpqodz0BKgHb2Eud2IDadcORDNJQswOVEjaXF
 AFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=UM1w2DHKtrYxtYYq5uWUmNXReRFsb3rxAEPbAJKrJIA=;
 b=wUgaUebh3lTqnAFFRgyHAofnqk2K6CG4sqrWulDhcYpcDVRk3rtkgBhLkUYFxvQab3
 jBdDXLIhoU4370jpMKVTJAbC4lJN2FxQd6eScys7NArjs2Q6j7XmlGM28bWMzSaV03rj
 eOqUFw0vcn7eqg5kts1q119sCOtvdn5RnOe6TbO9/dbqcCg4nW3QFLXxXH5rsE4clTHv
 WVN7SPt2ElCCMXnol//rS5Z0FiJgpznC/873kRoGg+bMHEQ6gtDMU9VLO/gd4jr2A78E
 xaeCpSna84/YgwyMLR7JtyDcGk4IyYo97riOXmpt/63zfOzyFf0sHZbQ4xmja7oNvisI
 +pCQ==
X-Gm-Message-State: ACgBeo39JwZZjCC5Dg7nbePHRcpZv5DHDxpRIS+PUI836EckUgmpN35S
 ZpdxtxyImwlvkg6evtpZvRHY5S4Uo+CSbw==
X-Google-Smtp-Source: AA6agR57Hp+pmNnI62rp9mymmtuQReBVVjLJD+zuGqKiOrLVkmB+fsZlFXnCdgQEp5fDzPrUb8vjKw==
X-Received: by 2002:a67:c807:0:b0:385:4678:a62b with SMTP id
 u7-20020a67c807000000b003854678a62bmr8934190vsk.11.1660671326660; 
 Tue, 16 Aug 2022 10:35:26 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:35:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH for-7.2 v3 20/20] hmp,
 device_tree.c: add 'info fdt <property>' support
Date: Tue, 16 Aug 2022 14:34:28 -0300
Message-Id: <20220816173428.157304-21-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe29.google.com
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

'info fdt' is only able to print full nodes so far. It would be good to
be able to also print single properties, since ometimes we just want
to verify a single value from the FDT.

libfdt does not have support to find a property given its full path, but
it does have a way to return a fdt_property given a prop name and its
subnode.

Add a new optional 'propname' parameter to x-query-fdt to specify the
property of a given node. If it's present, we'll proceed to find the
node as usual but, instead of printing the node, we'll attempt to find
the property and print it standalone.

After this change, if an user wants to print just the value of 'cpu' inside
/cpu/cpu-map(...) from an ARM FDT, we can do it:

(qemu) info fdt /cpus/cpu-map/socket0/cluster0/core0 cpu
/cpus/cpu-map/socket0/cluster0/core0/cpu = <0x8001>

Or the 'ibm,my-dma-window' from the v-scsi device inside the pSeries
FDT:

(qemu) info fdt /vdevice/v-scsi@71000003 ibm,my-dma-window
/vdevice/v-scsi@71000003/ibm,my-dma-window = <0x71000003 0x0 0x0 0x0 0x10000000>

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hmp-commands-info.hx         |  9 +++++----
 include/sysemu/device_tree.h |  2 ++
 monitor/hmp-cmds.c           |  5 ++++-
 monitor/qmp-cmds.c           |  8 +++++---
 qapi/machine.json            |  4 +++-
 softmmu/device_tree.c        | 29 ++++++++++++++++++++++++-----
 6 files changed, 43 insertions(+), 14 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 743b48865d..17d6ee4d30 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -924,13 +924,14 @@ ERST
 
     {
         .name       = "fdt",
-        .args_type  = "nodepath:s",
-        .params     = "nodepath",
-        .help       = "show firmware device tree node given its path",
+        .args_type  = "nodepath:s,propname:s?",
+        .params     = "nodepath [propname]",
+        .help       = "show firmware device tree node or property given its path",
         .cmd        = hmp_info_fdt,
     },
 
 SRST
   ``info fdt``
-    Show a firmware device tree node given its path. Requires libfdt.
+    Show a firmware device tree node or property given its path.
+    Requires libfdt.
 ERST
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 057d13e397..551a02dee2 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -140,6 +140,8 @@ int qemu_fdt_add_path(void *fdt, const char *path);
 void qemu_fdt_dumpdtb(void *fdt, int size);
 void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
 HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
+                                          bool has_propname,
+                                          const char *propname,
                                           Error **errp);
 
 /**
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index accde90380..df8493adc5 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2488,8 +2488,11 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
 void hmp_info_fdt(Monitor *mon, const QDict *qdict)
 {
     const char *nodepath = qdict_get_str(qdict, "nodepath");
+    const char *propname = qdict_get_try_str(qdict, "propname");
     Error *err = NULL;
-    g_autoptr(HumanReadableText) info = qmp_x_query_fdt(nodepath, &err);
+    g_autoptr(HumanReadableText) info = NULL;
+
+    info = qmp_x_query_fdt(nodepath, propname != NULL, propname, &err);
 
     if (hmp_handle_error(mon, err)) {
         return;
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index db2c6aa7da..ca2a96cdf7 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -604,9 +604,10 @@ void qmp_dumpdtb(const char *filename, Error **errp)
     return qemu_fdt_qmp_dumpdtb(filename, errp);
 }
 
-HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
+HumanReadableText *qmp_x_query_fdt(const char *nodepath, bool has_propname,
+                                   const char *propname, Error **errp)
 {
-    return qemu_fdt_qmp_query_fdt(nodepath, errp);
+    return qemu_fdt_qmp_query_fdt(nodepath, has_propname, propname, errp);
 }
 #else
 void qmp_dumpdtb(const char *filename, Error **errp)
@@ -614,7 +615,8 @@ void qmp_dumpdtb(const char *filename, Error **errp)
     error_setg(errp, "dumpdtb requires libfdt");
 }
 
-HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
+HumanReadableText *qmp_x_query_fdt(const char *nodepath, bool has_propname,
+                                   const char *propname, Error **errp)
 {
     error_setg(errp, "this command requires libfdt");
 
diff --git a/qapi/machine.json b/qapi/machine.json
index 96cff541ca..c15ce60f46 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1688,6 +1688,7 @@
 # Query for FDT element (node or property). Requires 'libfdt'.
 #
 # @nodepath: the path of the FDT node to be retrieved
+# @propname: name of the property inside the node
 #
 # Features:
 # @unstable: This command is meant for debugging.
@@ -1697,6 +1698,7 @@
 # Since: 7.2
 ##
 { 'command': 'x-query-fdt',
-  'data': { 'nodepath': 'str' },
+  'data': { 'nodepath': 'str',
+            '*propname': 'str' },
   'returns': 'HumanReadableText',
   'features': [ 'unstable' ]  }
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 9e681739bd..523c9b8d4d 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -823,23 +823,42 @@ static void fdt_format_node(GString *buf, int node, int depth,
     g_string_append_printf(buf, "%*s}\n", padding, "");
 }
 
-HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath, Error **errp)
+HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
+                                          bool has_propname,
+                                          const char *propname,
+                                          Error **errp)
 {
     g_autoptr(GString) buf = g_string_new("");
-    int node;
+    const struct fdt_property *prop = NULL;
+    void *fdt = current_machine->fdt;
+    int node, prop_size;
 
-    if (!current_machine->fdt) {
+    if (!fdt) {
         error_setg(errp, "Unable to find the machine FDT");
         return NULL;
     }
 
-    node = fdt_path_offset(current_machine->fdt, nodepath);
+    node = fdt_path_offset(fdt, nodepath);
     if (node < 0) {
         error_setg(errp, "node '%s' not found in FDT", nodepath);
         return NULL;
     }
 
-    fdt_format_node(buf, node, 0, nodepath);
+    if (!has_propname) {
+        fdt_format_node(buf, node, 0, nodepath);
+    } else {
+        g_autofree char *proppath = g_strdup_printf("%s/%s", nodepath,
+                                                    propname);
+
+        prop = fdt_get_property(fdt, node, propname, &prop_size);
+        if (!prop) {
+            error_setg(errp, "property '%s' not found in node '%s' in FDT",
+                       propname, nodepath);
+            return NULL;
+        }
+
+        fdt_format_property(buf, proppath, prop->data, prop_size, 0);
+    }
 
     return human_readable_text_from_str(buf);
 }
-- 
2.37.2


