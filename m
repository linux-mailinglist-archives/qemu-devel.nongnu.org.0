Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9836017D7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:39:53 +0200 (CEST)
Received: from localhost ([::1]:47600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVxn-0001sw-Uh
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgE-0003ez-4A; Mon, 17 Oct 2022 15:21:42 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:39745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgA-00031J-MU; Mon, 17 Oct 2022 15:21:41 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1322fa1cf6fso14394255fac.6; 
 Mon, 17 Oct 2022 12:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aqgkbLfIXWn7D+7LQZe2Ews6I+OeRkOQzRZ5iCESNH4=;
 b=io7IKIeAmA1uGd0IF+gEJW1ojS0pOcXqAwMAOprKdax1O1Mw+Mt6ke4MHLRNAx4AP1
 DPPvdi0+6Oyu0rXvAo4JoaHH41zgYkh8Hp71STndxgjaMbSfACUt7y3+ntCIg+FuBqir
 a6RK0p455Y590pSOeNjBR0QG4JkM6/PqWZ+vMCAxY3xOjqXrkjA8qSAwCzXsUUEW/7av
 gUGvd0HIRF1FfFSaXM2lT59aWVz9Srq5VvFc3IcBd5d6mPtZ+356dIfq3pY9Vk5HeV/p
 5BlWnuqtwcYFMVVnjGQHMUoW1tINT/DzbDRRC/7p1WxfAj+SAJ/F7QA63C/i0OyTaynv
 XjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aqgkbLfIXWn7D+7LQZe2Ews6I+OeRkOQzRZ5iCESNH4=;
 b=3ctr8qmv6n2/+redlpi/chCMpOpq1Exznb6WRleR4EkFravke3em72y+jmOICPS7iA
 sPQo2l3HKTjvomsZxxfE8LON45MiR5m0cUWr//THmwmepnBBExvwr4/fGmCldAm/EY1h
 WVaCVMQzFr3n/CJP066SaJQwE+b0HDaHjSsxbTS8obBXDVJRZQABVcJ158uzOIGaGQ1Z
 3DGSs9RdQQKGz7Kouge35F3Zs8C16ZdYTul2eEsQXxx8xS+zgk9EDclj8TUlg1T+i/fA
 AWO8G+RjfatOoB8lnhrpao+lQ7O0MGVfFFrrTr+x41su+Owg9Q/q+lkKQ5cnNKF3FO/E
 iOFg==
X-Gm-Message-State: ACrzQf0asPUaDudxTSbg8RQx10gBB/BjMI5YZsi/TcVbS4mA1u2/yUiO
 vqyvMYIPSMBX7M5DdgFI9kFiIeceOvE=
X-Google-Smtp-Source: AMsMyM4vcPeIKPLb/AwjDFzNvZGCT9nTRShvNuFDcsUs7hUqhJrVx+Yahe7MMB/LTg74Fv5weDOPFg==
X-Received: by 2002:a05:6871:14f:b0:132:901c:31db with SMTP id
 z15-20020a056871014f00b00132901c31dbmr16392102oab.233.1666034495746; 
 Mon, 17 Oct 2022 12:21:35 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:35 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 29/38] qmp/hmp, device_tree.c: introduce dumpdtb
Date: Mon, 17 Oct 2022 16:20:00 -0300
Message-Id: <20221017192009.92404-30-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The 'dumpdtb' command receives a 'filename' parameter and, if the FDT is
available via current_machine->fdt, save it in dtb format to 'filename'.
In short, this is a '-machine dumpdtb' that can be fired on demand via
QMP/HMP.

This command will always be executed in-band (i.e. holding BQL),
avoiding potential race conditions with machines that might change the
FDT during runtime (e.g. PowerPC 'pseries' machine).

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220926173855.1159396-2-danielhb413@gmail.com>
---
 hmp-commands.hx              | 15 +++++++++++++++
 include/sysemu/device_tree.h |  1 +
 monitor/misc.c               |  1 +
 qapi/machine.json            | 18 ++++++++++++++++++
 softmmu/device_tree.c        | 37 ++++++++++++++++++++++++++++++++++++
 5 files changed, 72 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8ab8000acd..12b6d4e2dc 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1800,3 +1800,18 @@ ERST
         .sub_table  = hmp_info_cmds,
         .flags      = "p",
     },
+
+#if defined(CONFIG_FDT)
+    {
+        .name       = "dumpdtb",
+        .args_type  = "filename:F",
+        .params     = "filename",
+        .help       = "dump the FDT in dtb format to 'filename'",
+        .cmd        = hmp_dumpdtb,
+    },
+
+SRST
+``dumpdtb`` *filename*
+  Dump the FDT in dtb format to *filename*.
+ERST
+#endif
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index ef060a9759..e7c5441f56 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -136,6 +136,7 @@ int qemu_fdt_add_path(void *fdt, const char *path);
     } while (0)
 
 void qemu_fdt_dumpdtb(void *fdt, int size);
+void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
 
 /**
  * qemu_fdt_setprop_sized_cells_from_array:
diff --git a/monitor/misc.c b/monitor/misc.c
index 6436a8786b..205487e2b9 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -49,6 +49,7 @@
 #include "sysemu/blockdev.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/tpm.h"
+#include "sysemu/device_tree.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qstring.h"
diff --git a/qapi/machine.json b/qapi/machine.json
index abb2f48808..b9228a5e46 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1664,3 +1664,21 @@
      '*size': 'size',
      '*max-size': 'size',
      '*slots': 'uint64' } }
+
+##
+# @dumpdtb:
+#
+# Save the FDT in dtb format.
+#
+# @filename: name of the dtb file to be created
+#
+# Since: 7.2
+#
+# Example:
+#   {"execute": "dumpdtb"}
+#    "arguments": { "filename": "fdt.dtb" } }
+#
+##
+{ 'command': 'dumpdtb',
+  'data': { 'filename': 'str' },
+  'if': 'CONFIG_FDT' }
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 6ca3fad285..ce74f3d48d 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -26,6 +26,9 @@
 #include "hw/loader.h"
 #include "hw/boards.h"
 #include "qemu/config-file.h"
+#include "qapi/qapi-commands-machine.h"
+#include "qapi/qmp/qdict.h"
+#include "monitor/hmp.h"
 
 #include <libfdt.h>
 
@@ -643,3 +646,37 @@ out:
     g_free(propcells);
     return ret;
 }
+
+void qmp_dumpdtb(const char *filename, Error **errp)
+{
+    g_autoptr(GError) err = NULL;
+    uint32_t size;
+
+    if (!current_machine->fdt) {
+        error_setg(errp, "This machine doesn't have a FDT");
+        return;
+    }
+
+    size = fdt_totalsize(current_machine->fdt);
+
+    g_assert(size > 0);
+
+    if (!g_file_set_contents(filename, current_machine->fdt, size, &err)) {
+        error_setg(errp, "Error saving FDT to file %s: %s",
+                   filename, err->message);
+    }
+}
+
+void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
+{
+    const char *filename = qdict_get_str(qdict, "filename");
+    Error *local_err = NULL;
+
+    qmp_dumpdtb(filename, &local_err);
+
+    if (hmp_handle_error(mon, local_err)) {
+        return;
+    }
+
+    info_report("dtb dumped to %s", filename);
+}
-- 
2.37.3


