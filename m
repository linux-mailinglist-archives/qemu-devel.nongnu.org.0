Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340B257E813
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 22:11:47 +0200 (CEST)
Received: from localhost ([::1]:41414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEyzy-0004bh-Ab
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 16:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyp9-0003GE-68
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:36 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:35477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyp7-0005JG-3S
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:34 -0400
Received: by mail-oi1-x22d.google.com with SMTP id r82so6698878oig.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 13:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pLNDvNY4vqIyBPGAJJxTjC/HuMR6ZJpJbU+/fAAfUaE=;
 b=doBJUWO3G3KBORNroKbu6VLzepOgXt62ZkOSVf2ddzQkWnntQMr8/GipuZxc1yWfos
 Lo83DQy8Rb7mzscR1plqsTWwJtjJhdbxuZtHU5G/QBMKINgCSJU69vH+nns8+r27mbVq
 TQhtd5z2Qnb14L1qDdjwOtkxBrGhG0MvT/ZcYKq+CEzTFY1PSi5++dCnea60lM7+IOZ7
 YspIXmXCRLHgro4CA6ivQIgL5QCdGiZ7Ctr1hpB6yU9IOlhLKeAV7lZWAuyc7fIG+SRE
 1ejXWnGVngI27aO846PUrGEI7FBGkbfVklmLdO2GKSVJ6F9M15s0u+xS4icu2yPWnzTl
 kriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pLNDvNY4vqIyBPGAJJxTjC/HuMR6ZJpJbU+/fAAfUaE=;
 b=v9RZaKIjOtEKB+KFL82xCQk642wA+NTInc7mBKJ02MH5iTmt26bWLVeWxvx9OiLxxL
 RZb8K0NvoBNqBx7JRAp1QI0Y3Jx97eZuCwnzb2iCEil+c0v8MJQiW9InGZ/wWfugDBLu
 +hy02EYanesuKh9fhwI5V6IyJ26lLTkUx0bR+CemfJV+WjEpNhlMkPVKvTY1UGemNOTy
 JURtLZOZiAV3ZIDcaSxaQmqgWaHIb9MgP5/bU0S1CoGH2JDiEcXkDbyB2TPBPh2xDq2l
 QUXaczLAVK4DAhZHuYSQM8CKkc2lWc5SyUCRoc4rqD1kcqdAJUrSUVBHgPS+OdOdlF3i
 r8PQ==
X-Gm-Message-State: AJIora+qZb44yVvMaQyUz/tbVHrujYKXDm77ZEVczDt0xmlj8N67BqxY
 VGuQpfAbj/JN6xHhS8FjVeY/3eJMDEA=
X-Google-Smtp-Source: AGRyM1uxCugj6fXUrmGOIziSZ7h/dNOTobFQbUXYTi8ML5JaSnBi8Rfg+6/YD2ykFquHnfjE6WlYsg==
X-Received: by 2002:aca:90c:0:b0:33a:768b:50d5 with SMTP id
 12-20020aca090c000000b0033a768b50d5mr7647173oij.294.1658520031840; 
 Fri, 22 Jul 2022 13:00:31 -0700 (PDT)
Received: from balboa.COMFAST ([152.254.206.198])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a9d740e000000b0061cae62aafcsm2388218otk.20.2022.07.22.13.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 13:00:31 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH for-7.2 10/10] hmp,
 device_tree.c: add 'info fdt <property>' support
Date: Fri, 22 Jul 2022 17:00:07 -0300
Message-Id: <20220722200007.1602174-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722200007.1602174-1-danielhb413@gmail.com>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
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

This is how we're going to support it:

- given the same fullpath parameter, assume it's a node. If we have a
match with an existing node, print it. If not, assume it's a property;

- in fdt_find_property() we're going to split 'fullpath' into node and
property. Unfortunately we can't use g_path_get_basename() to helps us
because, although the device tree path format is similar to Linux, it'll
not work when trying to run QEMU under Windows where the path format is
different;

- after spliiting into node + property, try to find the node in the FDT.
If we have a match, use fdt_get_property() to retrieve fdt_property.
Return it if found;

- using the fdt_print_property() created previously, print the property.

After this change, if an user wants to print just the value of 'cpu' inside
/cpu/cpu-map(...) from an ARM FDT, we can do it:

(qemu) info fdt /cpus/cpu-map/socket0/cluster0/core0/cpu
/cpus/cpu-map/socket0/cluster0/core0/cpu = <0x8001>
(qemu)

Or the 'ibm,my-dma-window' from the v-scsi device inside the pSeries
FDT:

(qemu) info fdt /vdevice/v-scsi@71000003/ibm,my-dma-window
/vdevice/v-scsi@71000003/ibm,my-dma-window = <0x71000003 0x0 0x0 0x0 0x10000000>
(qemu)

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hmp-commands-info.hx  |  2 +-
 softmmu/device_tree.c | 79 ++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 76 insertions(+), 5 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index abf277be7d..8891c2918a 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -913,7 +913,7 @@ ERST
         .name       = "fdt",
         .args_type  = "fullpath:s",
         .params     = "fullpath",
-        .help       = "show firmware device tree node given its full path",
+        .help       = "show firmware device tree node or property given its full path",
         .cmd        = hmp_info_fdt,
     },
 
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index e41894fbef..f6eb060acc 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -774,9 +774,74 @@ static void fdt_print_node(int node, int depth, const char *fullpath)
     qemu_printf("%*s}\n", padding, "");
 }
 
+static const struct fdt_property *fdt_find_property(const char *fullpath,
+                                                    int *prop_size,
+                                                    Error **errp)
+{
+    const struct fdt_property *prop = NULL;
+    void *fdt = current_machine->fdt;
+    g_autoptr(GString) nodename = NULL;
+    const char *propname = NULL;
+    int path_len = strlen(fullpath);
+    int node = 0; /* default to root node '/' */
+    int i, idx = -1;
+
+    /*
+     * We'll assume that we're dealing with a property. libfdt
+     * does not have an API to find a property given the full
+     * path, but it does have an API to find a property inside
+     * a node.
+     */
+    nodename = g_string_new("");
+
+    for (i = path_len - 1; i >= 0; i--) {
+        if (fullpath[i] == '/') {
+            idx = i;
+            break;
+        }
+    }
+
+    if (idx == -1) {
+        error_setg(errp, "FDT paths must contain at least one '/' character");
+        return NULL;
+    }
+
+    if (idx == path_len - 1) {
+        error_setg(errp, "FDT paths can't end with a '/' character");
+        return NULL;
+    }
+
+    propname = &fullpath[idx + 1];
+
+    if (idx != 0) {
+        g_string_append_len(nodename, fullpath, idx);
+
+        node = fdt_path_offset(fdt, nodename->str);
+        if (node < 0) {
+            error_setg(errp, "node '%s' of property '%s' not found in FDT",
+                       nodename->str, propname);
+            return NULL;
+        }
+    } else {
+        /* idx = 0 means that it's a property of the root node */
+        g_string_append(nodename, "/");
+    }
+
+    prop = fdt_get_property(fdt, node, propname, prop_size);
+    if (!prop) {
+        error_setg(errp, "property '%s' not found in node '%s' in FDT",
+                   propname, nodename->str);
+        return NULL;
+    }
+
+    return prop;
+}
+
 void fdt_info(const char *fullpath, Error **errp)
 {
-    int node;
+    const struct fdt_property *prop = NULL;
+    Error *local_err = NULL;
+    int node, prop_size;
 
     if (!current_machine->fdt) {
         error_setg(errp, "Unable to find the machine FDT");
@@ -784,10 +849,16 @@ void fdt_info(const char *fullpath, Error **errp)
     }
 
     node = fdt_path_offset(current_machine->fdt, fullpath);
-    if (node < 0) {
-        error_setg(errp, "node '%s' not found in FDT", fullpath);
+    if (node >= 0) {
+        fdt_print_node(node, 0, fullpath);
+        return;
+    }
+
+    prop = fdt_find_property(fullpath, &prop_size, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
         return;
     }
 
-    fdt_print_node(node, 0, fullpath);
+    fdt_print_property(fullpath, prop->data, prop_size, 0);
 }
-- 
2.36.1


