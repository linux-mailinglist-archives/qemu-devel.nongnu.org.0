Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1E542BBC3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:37:14 +0200 (CEST)
Received: from localhost ([::1]:38224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maahF-0001CT-Cl
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEy-0002c0-HM
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:08:00 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEt-0005xt-Jv
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:59 -0400
Received: by mail-ed1-x536.google.com with SMTP id d9so7275232edh.5
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AYqBjtwIP/Y4XBbfbDoadmxylhZu0QmchPu8vr13YfM=;
 b=aP9c0RYgzBacII6ZVP1c2gxi/9YCHWCIkUQaiUhC9grvkNFK9g5c1TRhpFbA25xehl
 QdSeGjlLRMiu/tpjlqKBu8qV8RVdOEvIVp9jQi2jWjD6dalFvkQhLmSA9W7Bz9wthNI6
 jW5H//7Jr16AbaFbgpykh/GZ81ALDKF/L4Mtf1F5ZbLSYo68xNAYObegsnQTXlCtk66Y
 N7pk6+c25RgmjWwtNVeyHS/UA2VswYAjXKN2N2zjeZN2oWW5A686NSkb+HDg85fAfE9B
 VSU/4xwfZcLB/M6nBBLcRAzR5QCHixKaooQM1fzOdkBRjyprt/2O//NS7CUrP0kbtyvu
 ftJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AYqBjtwIP/Y4XBbfbDoadmxylhZu0QmchPu8vr13YfM=;
 b=U7iSnHK78WaJOOj6vA9C7iOeY1PDRjsPuxn6Q+rzjoIVkukfmE1P//u1Oyd7S4zhso
 v3g+tepTU6AchfiiMAF0z6Q959ZaQFfEgcjOa5EgsmcmzXSaxfWtZ1nMn82PfJx1gohK
 P5SK/TTOPLz3Gi0pZhQ/gGzkrHWybC8U2nFZotAH6ON+oFUm7yDlXwcg72qRM/RtJfAw
 WbJcfwwxv94vxOy+pbP8Womwn0+vYMP7ikqbir4878fv5u7fwa2gqoeaiV6G0ba6wFp7
 JV1iCXW5OSBVR3WOllUSobsUUBhN4UD+hpURI7heE8wQLMpKiSkBQiA+jC3etFMcqOAC
 UVCw==
X-Gm-Message-State: AOAM530Jzdf5G+aMolVKnSQZmXOCGJHvSRE24pqv8Ex4nO1OujDVSgMv
 azB9tG4YjEiBap/n85h4Msyz0V1ZyRY=
X-Google-Smtp-Source: ABdhPJyT2I/IFMQkL9lXTp1OeyIj+yL8ySzf9aBGOBL+qrDgo03bXiBO5+SVImLbaW9KcBo53TDqdg==
X-Received: by 2002:a17:906:ce2c:: with SMTP id
 sd12mr39685266ejb.488.1634116074059; 
 Wed, 13 Oct 2021 02:07:54 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/40] hw/i386/sgx: Move qmp_query_sgx() and hmp_info_sgx() to
 hw/i386/sgx.c
Date: Wed, 13 Oct 2021 11:07:23 +0200
Message-Id: <20211013090728.309365-36-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Move qmp_query_sgx() and hmp_info_sgx() from target/i386/monitor.c
to hw/i386/sgx.c, removing the sgx_get_info() indirection and the
"hw/i386/sgx.h" header.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007175612.496366-5-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/sgx-stub.c    | 10 ++++++++--
 hw/i386/sgx.c         | 26 ++++++++++++++++++++++++--
 include/hw/i386/sgx.h | 11 -----------
 target/i386/monitor.c | 27 ---------------------------
 4 files changed, 32 insertions(+), 42 deletions(-)
 delete mode 100644 include/hw/i386/sgx.h

diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
index 3749656db1..c9b379e665 100644
--- a/hw/i386/sgx-stub.c
+++ b/hw/i386/sgx-stub.c
@@ -1,11 +1,12 @@
 #include "qemu/osdep.h"
+#include "monitor/monitor.h"
+#include "monitor/hmp-target.h"
 #include "hw/i386/pc.h"
 #include "hw/i386/sgx-epc.h"
-#include "hw/i386/sgx.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc-target.h"
 
-SGXInfo *sgx_get_info(Error **errp)
+SGXInfo *qmp_query_sgx(Error **errp)
 {
     error_setg(errp, "SGX support is not compiled in");
     return NULL;
@@ -17,6 +18,11 @@ SGXInfo *qmp_query_sgx_capabilities(Error **errp)
     return NULL;
 }
 
+void hmp_info_sgx(Monitor *mon, const QDict *qdict)
+{
+    monitor_printf(mon, "SGX is not available in this QEMU\n");
+}
+
 void pc_machine_init_sgx_epc(PCMachineState *pcms)
 {
     memset(&pcms->sgx_epc, 0, sizeof(SGXEPCState));
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 713f136343..11607568b6 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -15,10 +15,11 @@
 #include "hw/i386/sgx-epc.h"
 #include "hw/mem/memory-device.h"
 #include "monitor/qdev.h"
+#include "monitor/monitor.h"
+#include "monitor/hmp-target.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "exec/address-spaces.h"
-#include "hw/i386/sgx.h"
 #include "sysemu/hw_accel.h"
 
 #define SGX_MAX_EPC_SECTIONS            8
@@ -86,7 +87,7 @@ SGXInfo *qmp_query_sgx_capabilities(Error **errp)
     return info;
 }
 
-SGXInfo *sgx_get_info(Error **errp)
+SGXInfo *qmp_query_sgx(Error **errp)
 {
     SGXInfo *info = NULL;
     X86MachineState *x86ms;
@@ -116,6 +117,27 @@ SGXInfo *sgx_get_info(Error **errp)
     return info;
 }
 
+void hmp_info_sgx(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    g_autoptr(SGXInfo) info = qmp_query_sgx(&err);
+
+    if (err) {
+        error_report_err(err);
+        return;
+    }
+    monitor_printf(mon, "SGX support: %s\n",
+                   info->sgx ? "enabled" : "disabled");
+    monitor_printf(mon, "SGX1 support: %s\n",
+                   info->sgx1 ? "enabled" : "disabled");
+    monitor_printf(mon, "SGX2 support: %s\n",
+                   info->sgx2 ? "enabled" : "disabled");
+    monitor_printf(mon, "FLC support: %s\n",
+                   info->flc ? "enabled" : "disabled");
+    monitor_printf(mon, "size: %" PRIu64 "\n",
+                   info->section_size);
+}
+
 bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
 {
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
diff --git a/include/hw/i386/sgx.h b/include/hw/i386/sgx.h
deleted file mode 100644
index 2bf90b3f4f..0000000000
--- a/include/hw/i386/sgx.h
+++ /dev/null
@@ -1,11 +0,0 @@
-#ifndef QEMU_SGX_H
-#define QEMU_SGX_H
-
-#include "qom/object.h"
-#include "qapi/error.h"
-#include "qemu/error-report.h"
-#include "qapi/qapi-types-misc-target.h"
-
-SGXInfo *sgx_get_info(Error **errp);
-
-#endif
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 84fba47f19..8166e17693 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -34,7 +34,6 @@
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qapi-commands-misc.h"
 #include "hw/i386/pc.h"
-#include "hw/i386/sgx.h"
 
 /* Perform linear address sign extension */
 static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
@@ -674,29 +673,3 @@ void hmp_info_io_apic(Monitor *mon, const QDict *qdict)
     monitor_printf(mon, "This command is obsolete and will be "
                    "removed soon. Please use 'info pic' instead.\n");
 }
-
-SGXInfo *qmp_query_sgx(Error **errp)
-{
-    return sgx_get_info(errp);
-}
-
-void hmp_info_sgx(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-    g_autoptr(SGXInfo) info = qmp_query_sgx(&err);
-
-    if (err) {
-        error_report_err(err);
-        return;
-    }
-    monitor_printf(mon, "SGX support: %s\n",
-                   info->sgx ? "enabled" : "disabled");
-    monitor_printf(mon, "SGX1 support: %s\n",
-                   info->sgx1 ? "enabled" : "disabled");
-    monitor_printf(mon, "SGX2 support: %s\n",
-                   info->sgx2 ? "enabled" : "disabled");
-    monitor_printf(mon, "FLC support: %s\n",
-                   info->flc ? "enabled" : "disabled");
-    monitor_printf(mon, "size: %" PRIu64 "\n",
-                   info->section_size);
-}
-- 
2.31.1



