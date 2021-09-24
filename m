Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C11141715C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:56:33 +0200 (CEST)
Received: from localhost ([::1]:34928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjoe-0001Cn-DH
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKg-00087C-IV
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:35 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKe-0000e6-RS
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:34 -0400
Received: by mail-ed1-x530.google.com with SMTP id eg28so35036805edb.1
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7aIHkITyfDCPKw7jzecCNevaMEbatHzwC1yR+VL6gh4=;
 b=l5czh37ywwM1en4WpOGysFy21RVAbWRScqgvNJ0KgvwCtDZ68QDrgzmiqpJ36KnhC9
 BWpLvEhAAEocBJ2LwsZo8QDykx4qO2/efLEfhlBtyaz/AvvoqIfiGJn3kZcTEpA08I27
 NUaWW4/yHCxY7Ltn3Q2O6IHwvNMw37Oi4hcyNiqafus45NWj/hvsN922tWBl38CqNm42
 WRvjLUgtUqJ6qwWIXgIByq2sLV1Wa26MHKMAQb9COn9q3aH6dGsQrdpzIeDzO5huA1s+
 AVWgqIDJZupTXxHHbVzGgAXgAJUAmmHrAy1/UVpsUBqmqlVWtayr9I2YQielIR8YbCHn
 Sg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7aIHkITyfDCPKw7jzecCNevaMEbatHzwC1yR+VL6gh4=;
 b=ae9VTZgpsYRcOMzFyDQyQYaPBoMYEOoevPpX3tn1r4HKfKx55Qq5fBShsCnIBo2lPA
 ppFNkSy2CRxzw2XX7qneGnhITVc82ZaCIJxqGD2fBqcrttLOCtGJiube9/PV0uwOmZ6+
 X/rdSPnN+I77VRzqujKdLIWGw+gj4niitQRkxbPHtMZH7FrhdJaRrTl869VzbZFhcDJC
 O5X0ExTzNic81hl4wXU5lUF7YkcuY5mQy6pwr3x2uAPEAhhMlMZ0oTrmA868L+txZ0bs
 B7rT7YeyjrLtDDUUtL53lVD9GkGWr7R00cqYJ+TKEH+8Ku62mwSkH1GafuIS/n4nN9sI
 7mLA==
X-Gm-Message-State: AOAM530tUJrHYLfo2mtPcbi6txjOiZ/uN0GtOk3atEIlmmSu8EnlGo4m
 XteuN2YjRafB/77xX44hFEZA/HndPcs=
X-Google-Smtp-Source: ABdhPJzFnicWO668iozSPlwKK0G8bTvQ90XPYhVFZZL/Z1fcXl04daSz2FYuMpIZBwsDYW2XH1RsjQ==
X-Received: by 2002:a50:d581:: with SMTP id v1mr4480459edi.210.1632482731539; 
 Fri, 24 Sep 2021 04:25:31 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 25/26] target/i386: Add HMP and QMP interfaces for SGX
Date: Fri, 24 Sep 2021 13:25:08 +0200
Message-Id: <20210924112509.25061-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: yang.zhong@intel.com, philmd@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

The QMP and HMP interfaces can be used by monitor or QMP tools to retrieve
the SGX information from VM side when SGX is enabled on Intel platform.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210910102258.46648-2-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands-info.hx         | 15 +++++++++++++
 hw/i386/sgx-stub.c           |  7 ++++++
 hw/i386/sgx.c                | 31 ++++++++++++++++++++++++++
 include/hw/i386/sgx.h        | 11 +++++++++
 include/monitor/hmp-target.h |  1 +
 qapi/misc-target.json        | 43 ++++++++++++++++++++++++++++++++++++
 target/i386/monitor.c        | 27 ++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c   |  1 +
 8 files changed, 136 insertions(+)
 create mode 100644 include/hw/i386/sgx.h

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 27206ac049..4c966e8a6b 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -877,3 +877,18 @@ SRST
   ``info dirty_rate``
     Display the vcpu dirty rate information.
 ERST
+
+#if defined(TARGET_I386)
+    {
+        .name       = "sgx",
+        .args_type  = "",
+        .params     = "",
+        .help       = "show intel SGX information",
+        .cmd        = hmp_info_sgx,
+    },
+#endif
+
+SRST
+  ``info sgx``
+    Show intel SGX information.
+ERST
diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
index 483c72bba6..485e16ecc1 100644
--- a/hw/i386/sgx-stub.c
+++ b/hw/i386/sgx-stub.c
@@ -1,6 +1,13 @@
 #include "qemu/osdep.h"
 #include "hw/i386/pc.h"
 #include "hw/i386/sgx-epc.h"
+#include "hw/i386/sgx.h"
+
+SGXInfo *sgx_get_info(Error **errp)
+{
+    error_setg(errp, "SGX support is not compiled in");
+    return NULL;
+}
 
 void pc_machine_init_sgx_epc(PCMachineState *pcms)
 {
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 8a18cddc3f..ea75398575 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -17,6 +17,37 @@
 #include "monitor/qdev.h"
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
+#include "hw/i386/sgx.h"
+
+SGXInfo *sgx_get_info(Error **errp)
+{
+    SGXInfo *info = NULL;
+    X86MachineState *x86ms;
+    PCMachineState *pcms =
+        (PCMachineState *)object_dynamic_cast(qdev_get_machine(),
+                                              TYPE_PC_MACHINE);
+    if (!pcms) {
+        error_setg(errp, "SGX is only supported on PC machines");
+        return NULL;
+    }
+
+    x86ms = X86_MACHINE(pcms);
+    if (!x86ms->sgx_epc_list) {
+        error_setg(errp, "No EPC regions defined, SGX not available");
+        return NULL;
+    }
+
+    SGXEPCState *sgx_epc = &pcms->sgx_epc;
+    info = g_new0(SGXInfo, 1);
+
+    info->sgx = true;
+    info->sgx1 = true;
+    info->sgx2 = true;
+    info->flc = true;
+    info->section_size = sgx_epc->size;
+
+    return info;
+}
 
 int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
 {
diff --git a/include/hw/i386/sgx.h b/include/hw/i386/sgx.h
new file mode 100644
index 0000000000..2bf90b3f4f
--- /dev/null
+++ b/include/hw/i386/sgx.h
@@ -0,0 +1,11 @@
+#ifndef QEMU_SGX_H
+#define QEMU_SGX_H
+
+#include "qom/object.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qapi/qapi-types-misc-target.h"
+
+SGXInfo *sgx_get_info(Error **errp);
+
+#endif
diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index 60fc92722a..dc53add7ee 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -49,5 +49,6 @@ void hmp_info_tlb(Monitor *mon, const QDict *qdict);
 void hmp_mce(Monitor *mon, const QDict *qdict);
 void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
 void hmp_info_io_apic(Monitor *mon, const QDict *qdict);
+void hmp_info_sgx(Monitor *mon, const QDict *qdict);
 
 #endif /* MONITOR_HMP_TARGET_H */
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 3b05ad3dbf..e2a347cc23 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -333,3 +333,46 @@
 { 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
   'returns': 'SevAttestationReport',
   'if': 'TARGET_I386' }
+
+##
+# @SGXInfo:
+#
+# Information about intel Safe Guard eXtension (SGX) support
+#
+# @sgx: true if SGX is supported
+#
+# @sgx1: true if SGX1 is supported
+#
+# @sgx2: true if SGX2 is supported
+#
+# @flc: true if FLC is supported
+#
+# @section-size: The EPC section size for guest
+#
+# Since: 6.2
+##
+{ 'struct': 'SGXInfo',
+  'data': { 'sgx': 'bool',
+            'sgx1': 'bool',
+            'sgx2': 'bool',
+            'flc': 'bool',
+            'section-size': 'uint64'},
+   'if': 'TARGET_I386' }
+
+##
+# @query-sgx:
+#
+# Returns information about SGX
+#
+# Returns: @SGXInfo
+#
+# Since: 6.2
+#
+# Example:
+#
+# -> { "execute": "query-sgx" }
+# <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
+#                  "flc": true, "section-size" : 0 } }
+#
+##
+{ 'command': 'query-sgx', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 119211f0b0..d7384ba348 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -35,6 +35,7 @@
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qapi-commands-misc.h"
 #include "hw/i386/pc.h"
+#include "hw/i386/sgx.h"
 
 /* Perform linear address sign extension */
 static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
@@ -763,3 +764,29 @@ qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
 {
     return sev_get_attestation_report(mnonce, errp);
 }
+
+SGXInfo *qmp_query_sgx(Error **errp)
+{
+    return sgx_get_info(errp);
+}
+
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
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index c98b78d033..b75f3364f3 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -100,6 +100,7 @@ static bool query_is_ignored(const char *cmd)
         /* Success depends on Host or Hypervisor SEV support */
         "query-sev",
         "query-sev-capabilities",
+        "query-sgx",
         NULL
     };
     int i;
-- 
2.31.1



