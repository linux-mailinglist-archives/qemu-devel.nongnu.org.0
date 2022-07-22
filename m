Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5C757E7DA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 22:04:31 +0200 (CEST)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEysv-0000Qr-FC
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 16:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyoz-0002yy-Tw
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:25 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyoy-0005Dn-3B
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:25 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-10d8880d055so7549225fac.8
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 13:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vvTscm4jE/pQADjzilhvEGolDLXNnxRwXsi8fxpaEv0=;
 b=ZLECyn1x95EjHziMxhbk8B9DEvhBAe16RHNpYGVTVFqUHX29o/uSYdDX90fk5CbPzo
 c3dIFc0nc2ORS5e8VDiudOXAw3xDGRUseh0wVJCWcDEVkinEXb+eyd87hi1yD7Ityj+i
 wS42Ks7bDTrfQG7oJGiDs/P1gYQzSCIK2uTUbWDWWpfPKLXbJficW5+zLMRdMXFAMfaF
 zIiiWv4MWEwnU3nzjQCOdojWTVj2pebvKDMvwtu+rlv76odrjhP30/lfcKXijlPvxKnW
 Evcytv09ZUYwJlE5JGO15P+YJprULSv68vPL3Y0YJgzJHMgx6JN7nFf/HEJIx9LcsyIY
 j11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vvTscm4jE/pQADjzilhvEGolDLXNnxRwXsi8fxpaEv0=;
 b=Hu5TtzfCqY9Jd4Lz1gXxx9ssZ7XISgPqYYgslQNtG+b5G42C4d2sLoSEDoEhoOI249
 OiRNT7ecgQ+e2ALq2QaKdO8WMULOn/W/lcJxan6y3MmVaFznZN/aByB18mNcOUXOaZy9
 OlAUOJfm7zZjGOqOQYHYWIKhMgXOhlhggob8ZRyzpDNj1+da2D0utWf0Z0B/yXOCK1mq
 pzR7xVMdvAyNpLeMNE3YmczPd8W8bWSc09NQx759UY2ZNGLvl2hBvNHL82hH3uxzU1ve
 nRQxyZpZyATJyMbJErQL0Xa77WBe1LWdaGOHMJLpmRvyz9Qxuz0Umf/AHDbx90EqR51l
 hdyw==
X-Gm-Message-State: AJIora+dx4RvvLFV6O+ok0jkbKsUYZm9MxBQ1PhOAfG6CYgAt4UUY+4K
 ma/FCLonow/AkXP3cI44xeASjFEOKC8=
X-Google-Smtp-Source: AGRyM1vsRyTEnJWoiv6XK8PqC+TwzEVK8xzEXxB3k3VgEWVpYzK+BxX8pmc84kwgItBrXEWCTgc/xA==
X-Received: by 2002:a05:6870:8925:b0:101:fbdd:765d with SMTP id
 i37-20020a056870892500b00101fbdd765dmr881512oao.194.1658520022775; 
 Fri, 22 Jul 2022 13:00:22 -0700 (PDT)
Received: from balboa.COMFAST ([152.254.206.198])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a9d740e000000b0061cae62aafcsm2388218otk.20.2022.07.22.13.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 13:00:22 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH for-7.2 05/10] hmp, device_tree.c: introduce 'info fdt' command
Date: Fri, 22 Jul 2022 17:00:02 -0300
Message-Id: <20220722200007.1602174-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722200007.1602174-1-danielhb413@gmail.com>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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

Reading the FDT requires that the user saves the fdt_blob and then use
'dtc' to read the contents. Saving the file and using 'dtc' is a strong
use case when we need to compare two FDTs, but it's a lot of steps if
you want to do quick check on a certain attribute.

'info fdt' retrieves FDT nodes (and properties, later on) and print it
to the user. This can be used to check the FDT on running machines
without having to save the blob and use 'dtc'.

The implementation is based on the premise that the machine thas a FDT
created using libfdt and pointed by 'machine->fdt'. As long as this
pre-requisite is met the machine should be able to support it.

For now we're going to add the required HMP boilerplate and the
capability of printing the name of the properties of a given node. Next
patches will extend 'info fdt' to be able to print nodes recursively.

This is an example of 'info fdt' fetching the '/chosen' node of the
pSeries machine:

(qemu) info fdt /chosen
chosen {
    ibm,architecture-vec-5;
    rng-seed;
    ibm,arch-vec-5-platform-support;
    linux,pci-probe-only;
    stdout-path;
    linux,stdout-path;
    qemu,graphic-depth;
    qemu,graphic-height;
    qemu,graphic-width;
}

And the same node for the aarch64 'virt' machine:

(qemu) info fdt /chosen
chosen {
    stdout-path;
    rng-seed;
    kaslr-seed;
}

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hmp-commands-info.hx         | 13 +++++++++++
 include/sysemu/device_tree.h |  1 +
 monitor/misc.c               | 12 ++++++++++
 softmmu/device_tree.c        | 43 ++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 3ffa24bd67..abf277be7d 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -908,3 +908,16 @@ SRST
   ``stats``
     Show runtime-collected statistics
 ERST
+
+    {
+        .name       = "fdt",
+        .args_type  = "fullpath:s",
+        .params     = "fullpath",
+        .help       = "show firmware device tree node given its full path",
+        .cmd        = hmp_info_fdt,
+    },
+
+SRST
+  ``info fdt``
+    Show firmware device tree (fdt).
+ERST
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 1397adb21c..c0f98b1c88 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -124,6 +124,7 @@ int qemu_fdt_add_subnode(void *fdt, const char *name);
 int qemu_fdt_add_path(void *fdt, const char *path);
 
 void fdt_save(const char *filename, Error **errp);
+void fdt_info(const char *fullpath, Error **errp);
 
 #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
     do {                                                                      \
diff --git a/monitor/misc.c b/monitor/misc.c
index 145285cec0..e709a7de91 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -973,6 +973,18 @@ static void hmp_info_capture(Monitor *mon, const QDict *qdict)
     }
 }
 
+static void hmp_info_fdt(Monitor *mon, const QDict *qdict)
+{
+    const char *fullpath = qdict_get_str(qdict, "fullpath");
+    Error *local_err = NULL;
+
+    fdt_info(fullpath, &local_err);
+
+    if (local_err) {
+        error_report_err(local_err);
+    }
+}
+
 static void hmp_stopcapture(Monitor *mon, const QDict *qdict)
 {
     int i;
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index eeab6a5ef0..899c239c5c 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -26,6 +26,7 @@
 #include "hw/loader.h"
 #include "hw/boards.h"
 #include "qemu/config-file.h"
+#include "qemu/qemu-print.h"
 
 #include <libfdt.h>
 
@@ -661,3 +662,45 @@ void fdt_save(const char *filename, Error **errp)
 
     error_setg(errp, "Error when saving machine FDT to file %s", filename);
 }
+
+static void fdt_print_node(int node, int depth)
+{
+    const struct fdt_property *prop = NULL;
+    const char *propname = NULL;
+    void *fdt = current_machine->fdt;
+    int padding = depth * 4;
+    int property = 0;
+    int prop_size;
+
+    qemu_printf("%*s%s {\n", padding, "", fdt_get_name(fdt, node, NULL));
+
+    padding += 4;
+
+    fdt_for_each_property_offset(property, fdt, node) {
+        prop = fdt_get_property_by_offset(fdt, property, &prop_size);
+        propname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
+
+        qemu_printf("%*s%s;\n", padding, "", propname);
+    }
+
+    padding -= 4;
+    qemu_printf("%*s}\n", padding, "");
+}
+
+void fdt_info(const char *fullpath, Error **errp)
+{
+    int node;
+
+    if (!current_machine->fdt) {
+        error_setg(errp, "Unable to find the machine FDT");
+        return;
+    }
+
+    node = fdt_path_offset(current_machine->fdt, fullpath);
+    if (node < 0) {
+        error_setg(errp, "node '%s' not found in FDT", fullpath);
+        return;
+    }
+
+    fdt_print_node(node, 0);
+}
-- 
2.36.1


