Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B1A425A61
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 20:09:01 +0200 (CEST)
Received: from localhost ([::1]:49636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXpE-0007SW-4T
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 14:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYXdI-0005Fb-83
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYXdF-0005kr-MZ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633629397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0XS07QnhJoyMRdHPV86+sTB0tINIseduV6cvpF8QwKg=;
 b=UEKG7J4R+StnxghGTwqAusUuxcRj+c6kEGsZQD+brGa3l3wlMAtJnlrq4v/qiCmoJuvOVr
 hOIr2/RQbDofylwhxOs/2TKaQekwW6boIlmB/HninjmvleJe7E42BPKJ4EaQRlUKJS249U
 5DDAS/aBf7BldqwvPoF06dMNlavN++Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-hune7NzVNiK9CkQc4tuvJg-1; Thu, 07 Oct 2021 13:56:34 -0400
X-MC-Unique: hune7NzVNiK9CkQc4tuvJg-1
Received: by mail-wr1-f71.google.com with SMTP id
 75-20020adf82d1000000b00160cbb0f800so4556974wrc.22
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0XS07QnhJoyMRdHPV86+sTB0tINIseduV6cvpF8QwKg=;
 b=f5Sy3N9wMnjeX6GELhJqcTPeX1HpV+pFc9vpec3ubO1naOw3/XLI+d1TpYzpdw2NUG
 SIhj4vbd0gt7lfE9zFJ/Xe2zQAl1WG4p4/EgXPfAD6ZXTmYg3Uc9jtSz7oOx7kBuA0WN
 NYNvZPqRo+qru8sTYWu6hnkavVYCtWZ+vKRUXjKAHFORn2Qd9XLSjki3X/QquwrkUYN/
 6bxHoF+waCAIFWB6UXI/l63wuCOTZ2SpWF2OuZq1OTzbDN6eNqyORiwQXvcPCckjimPY
 jDK8UZynix2aWN1hih9GJ45cKNobRKBFUQ8mEktqI0z26j/NTXLrbXs75C+Qt/yrJDKj
 ZGfA==
X-Gm-Message-State: AOAM532N7BiQW/XaYzb1LkG3cC20WZCilEdLBpVIqFd4ss610CRyUNpl
 O5sMPeAwgkvIofxpjmqs60kwOOGyTjxfUyT0l/dYbwLhNLMXQcSTotQlQnI0taexTEGKbPMChid
 1AmrGvzKt1L5275F4g+dkLKFtEZa1bMVG+hnvDHNTYqi+A5lEIjQzrY/ztb8b9SIw
X-Received: by 2002:a05:6000:2cf:: with SMTP id
 o15mr7419450wry.364.1633629392528; 
 Thu, 07 Oct 2021 10:56:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCTNtVuF0C096+h4EE6dtzdOy+/tu8jCax8f8MyCqrwJlI5sDE/nk5aH3JLxOriI7gsKxG5w==
X-Received: by 2002:a05:6000:2cf:: with SMTP id
 o15mr7419411wry.364.1633629392170; 
 Thu, 07 Oct 2021 10:56:32 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d16sm8946913wmb.2.2021.10.07.10.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:56:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] hw/i386/sgx: Move qmp_query_sgx() and hmp_info_sgx() to
 hw/i386/sgx.c
Date: Thu,  7 Oct 2021 19:56:12 +0200
Message-Id: <20211007175612.496366-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007175612.496366-1-philmd@redhat.com>
References: <20211007175612.496366-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qmp_query_sgx() and hmp_info_sgx() from target/i386/monitor.c
to hw/i386/sgx.c, removing the sgx_get_info() indirection and the
"hw/i386/sgx.h" header.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/i386/sgx.h | 11 -----------
 hw/i386/sgx-stub.c    | 10 ++++++++--
 hw/i386/sgx.c         | 26 ++++++++++++++++++++++++--
 target/i386/monitor.c | 27 ---------------------------
 4 files changed, 32 insertions(+), 42 deletions(-)
 delete mode 100644 include/hw/i386/sgx.h

diff --git a/include/hw/i386/sgx.h b/include/hw/i386/sgx.h
deleted file mode 100644
index 2bf90b3f4fe..00000000000
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
diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
index 3749656db1a..c9b379e6651 100644
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
index 713f1363433..11607568b69 100644
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
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 84fba47f193..8166e17693a 100644
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


