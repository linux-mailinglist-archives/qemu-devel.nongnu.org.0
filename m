Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D7D5AC835
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:54:49 +0200 (CEST)
Received: from localhost ([::1]:38134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzRw-0000zT-DK
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz9Q-0007Fp-NJ; Sun, 04 Sep 2022 19:35:40 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:38645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz9N-00058P-La; Sun, 04 Sep 2022 19:35:40 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-11edd61a9edso18051127fac.5; 
 Sun, 04 Sep 2022 16:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uglBf7F9CqWcvM3175bWUvlm+U1dUtA4yg1E7e2OX5s=;
 b=MlIdq6Io/FSmSAHaPND0456eptIk8wLcD8/4UeKT1f1rx7JLOMluLUsZH4aCSfx3nq
 Dt6hd3nwzBHYGyyurMQPBttKEnjNU/aTAxID9TB40N6yr9p8V8Zu896YU9wAmlO9978f
 AUZzxiL1fAFT2vTyJd4XC0byUlPG50gKUdW2ZKYJMYzR7fIvAbXX0fFg9Tx3vb8505qi
 gC1w3WnK7BUm3klX/I7YxRpchylSNyiiCCEJ55y8oOcKaV1wrrCg7svKYJLR426Uf6WP
 d05S3cuuXHxGJ4LNjos1XQV/lsS3O2TpJckMB8jZgLkrFhZTK14aLH5oCM3WZRHWlhUL
 q9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uglBf7F9CqWcvM3175bWUvlm+U1dUtA4yg1E7e2OX5s=;
 b=uZ8vwnZuNCBKydbPQThY9syPym2BDo7LpbrtHY9ky28r82lN3J/4lYNWVxaHn09EMI
 dh0sBr5C6V6AWj2XbUthhL2kqAmW4pNq/x6bauHTBamrZfYg8T2RgeRiU0/abqLAkyjd
 hrZUZBZEatExBnuxpkl9w5tIEaTMvZ2izeADgoxl7JdK+g0xIg89A2YBusScHApHfPBJ
 02DzSQoRG9sRcIXkmrIKup0SyLqwq43U+xfAur38rHy6rgiGwjYVSsQ8A5tS3iqYUAYs
 CsR4NJXmbxjj2WzrFEJnbjVMFbTQpJRYRuCjFO2bn45jpOJ6G6bEr4VJBON2RkeppQdT
 EjFQ==
X-Gm-Message-State: ACgBeo3YsZQ6Iv7ECFqMggn1nAUj24QPW1iV5sl6mWm9pH6yGQ1qc4Ks
 zWBqe7GE6GHktfGytMJ3lZBbSgSiY0MQ5Q==
X-Google-Smtp-Source: AA6agR6SEPBuigblLRCl7hdTGbG8PHQBj2CHosnyVIzvLrrA/PgKY4fDbdUS8ByWinLQmjnfkOVkHA==
X-Received: by 2002:a05:6870:4410:b0:122:520b:2159 with SMTP id
 u16-20020a056870441000b00122520b2159mr7810649oah.27.1662334536254; 
 Sun, 04 Sep 2022 16:35:36 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a4a9587000000b0044b4acd27c5sm2549793ooi.17.2022.09.04.16.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 16:35:35 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v6 14/14] qmp/hmp, device_tree.c: introduce dumpdtb
Date: Sun,  4 Sep 2022 20:34:56 -0300
Message-Id: <20220904233456.209027-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904233456.209027-1-danielhb413@gmail.com>
References: <20220904233456.209027-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hmp-commands.hx              | 15 +++++++++++++++
 include/sysemu/device_tree.h |  1 +
 monitor/misc.c               |  1 +
 qapi/machine.json            | 18 ++++++++++++++++++
 softmmu/device_tree.c        | 31 +++++++++++++++++++++++++++++++
 5 files changed, 66 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 182e639d14..9a3e57504f 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1800,3 +1800,18 @@ ERST
                       "\n\t\t\t\t\t limit on a specified virtual cpu",
         .cmd        = hmp_cancel_vcpu_dirty_limit,
     },
+
+#if defined(CONFIG_FDT)
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
index 3d2312ba8d..e7dd63030b 100644
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
index 6afd1936b0..f968a5d343 100644
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
+  'data': { 'filename': 'str' },
+  'if': 'CONFIG_FDT' }
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 6ca3fad285..cdd41b6de6 100644
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
 
@@ -643,3 +646,31 @@ out:
     g_free(propcells);
     return ret;
 }
+
+void qmp_dumpdtb(const char *filename, Error **errp)
+{
+    g_autoptr(GError) err = NULL;
+    int size;
+
+    if (!current_machine->fdt) {
+        error_setg(errp, "Unable to find the machine FDT");
+        return;
+    }
+
+    size = fdt_totalsize(current_machine->fdt);
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
+    hmp_handle_error(mon, local_err);
+}
-- 
2.37.2


