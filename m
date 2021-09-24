Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C06C417121
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:46:38 +0200 (CEST)
Received: from localhost ([::1]:43684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjf3-0004H3-53
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKh-00088g-MY
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:36 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKf-0000en-KY
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:35 -0400
Received: by mail-ed1-x52a.google.com with SMTP id v22so34026531edd.11
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ohYcK/h+3ibYka7ysojEKUGWGgYiFqj771QZXpbZi94=;
 b=IGqp4D47WwGrOt20FufGptO0Kd41pARs50S2x1RSL/Z7z1Lkl731ldPnUQ+ECW02A7
 NEJnacEoHjYZkGFOD+4MH5SQwpPI07V/Ol7F+cT39QuEJakfEUTd6PbgdJZIYKX7midp
 GC/XjcwR10mNH/CsUXY3+ckYXxAD2SHXes1jy0mjb9q9BkdWE8g86cwzQgRAf+F5qBvr
 ShWv1esqT/xOnHo6AzsC3LlXgAcLipoug7WRHs3dM8zmSaWHMcBJkF35IB2MenWPaDOb
 Au9/LIWE8kE1LPp7OgLyk0e0YLm6d+8pKqcfL3RRdxkgi5Grtn1SWwHtcMtcJJvL5v3Z
 Lv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ohYcK/h+3ibYka7ysojEKUGWGgYiFqj771QZXpbZi94=;
 b=wZQKf6xxiBMKPq+ioTs2oZ8I+kKrABQ4o/FhWO+zi3Gp2Pgrbsv3Zau73qbIvECxwi
 zDERWWWhgXDoAmJdBUH3AeHQs24e5pP7y/60PrhTD6B5d2qVXEIVnHvGVlftDw798tRT
 SGL7MrtHbrDJA0vX5QKKF7HWhPewPAE5n0SbifhbLrkqQej+SV9bXnNmOPb+ToCHLNsP
 KWqvux0F+bD8hNvMfy6SOJdBmnccULiUFs5g0JIZyxXU/cZxq1/ggEDQXhDdEfJkGXRL
 IJPBoqPib2nnIcU+QRaNsgElp5U+O3pjVmQBPgMZEpY2N95/+fM/L2dvpZ8szjBdVUbW
 W+Sg==
X-Gm-Message-State: AOAM532Vw8n7KE37VE46XzNEtDaqwp5m1cDc6CzHuuO8F8IUePyWgu7L
 jMeMHE5vOWG3boMDHLXSv6klCs9mTuc=
X-Google-Smtp-Source: ABdhPJw/n4QTUIAg40F6PhcipIRERVjVxwZGB2umhTnWwC5hMftWA0QnAiVRIqkgGnJIpdiPl0Nn/w==
X-Received: by 2002:a17:906:a08d:: with SMTP id
 q13mr10528349ejy.465.1632482732263; 
 Fri, 24 Sep 2021 04:25:32 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 26/26] target/i386: Add the query-sgx-capabilities QMP
 command
Date: Fri, 24 Sep 2021 13:25:09 +0200
Message-Id: <20210924112509.25061-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
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

Libvirt can use query-sgx-capabilities to get the host
sgx capabilities to decide how to allocate SGX EPC size to VM.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210910102258.46648-3-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/sgx-stub.c         |  6 ++++
 hw/i386/sgx.c              | 66 ++++++++++++++++++++++++++++++++++++++
 include/hw/i386/sgx.h      |  1 +
 qapi/misc-target.json      | 18 +++++++++++
 target/i386/monitor.c      |  5 +++
 tests/qtest/qmp-cmd-test.c |  1 +
 6 files changed, 97 insertions(+)

diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
index 485e16ecc1..3be9f5ca32 100644
--- a/hw/i386/sgx-stub.c
+++ b/hw/i386/sgx-stub.c
@@ -9,6 +9,12 @@ SGXInfo *sgx_get_info(Error **errp)
     return NULL;
 }
 
+SGXInfo *sgx_get_capabilities(Error **errp)
+{
+    error_setg(errp, "SGX support is not compiled in");
+    return NULL;
+}
+
 void pc_machine_init_sgx_epc(PCMachineState *pcms)
 {
     memset(&pcms->sgx_epc, 0, sizeof(SGXEPCState));
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index ea75398575..e481e9358f 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -18,6 +18,72 @@
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
 #include "hw/i386/sgx.h"
+#include "sysemu/hw_accel.h"
+
+#define SGX_MAX_EPC_SECTIONS            8
+#define SGX_CPUID_EPC_INVALID           0x0
+
+/* A valid EPC section. */
+#define SGX_CPUID_EPC_SECTION           0x1
+#define SGX_CPUID_EPC_MASK              0xF
+
+static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
+{
+    return (low & MAKE_64BIT_MASK(12, 20)) +
+           ((high & MAKE_64BIT_MASK(0, 20)) << 32);
+}
+
+static uint64_t sgx_calc_host_epc_section_size(void)
+{
+    uint32_t i, type;
+    uint32_t eax, ebx, ecx, edx;
+    uint64_t size = 0;
+
+    for (i = 0; i < SGX_MAX_EPC_SECTIONS; i++) {
+        host_cpuid(0x12, i + 2, &eax, &ebx, &ecx, &edx);
+
+        type = eax & SGX_CPUID_EPC_MASK;
+        if (type == SGX_CPUID_EPC_INVALID) {
+            break;
+        }
+
+        if (type != SGX_CPUID_EPC_SECTION) {
+            break;
+        }
+
+        size += sgx_calc_section_metric(ecx, edx);
+    }
+
+    return size;
+}
+
+SGXInfo *sgx_get_capabilities(Error **errp)
+{
+    SGXInfo *info = NULL;
+    uint32_t eax, ebx, ecx, edx;
+
+    int fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
+    if (fd < 0) {
+        error_setg(errp, "SGX is not enabled in KVM");
+        return NULL;
+    }
+
+    info = g_new0(SGXInfo, 1);
+    host_cpuid(0x7, 0, &eax, &ebx, &ecx, &edx);
+
+    info->sgx = ebx & (1U << 2) ? true : false;
+    info->flc = ecx & (1U << 30) ? true : false;
+
+    host_cpuid(0x12, 0, &eax, &ebx, &ecx, &edx);
+    info->sgx1 = eax & (1U << 0) ? true : false;
+    info->sgx2 = eax & (1U << 1) ? true : false;
+
+    info->section_size = sgx_calc_host_epc_section_size();
+
+    close(fd);
+
+    return info;
+}
 
 SGXInfo *sgx_get_info(Error **errp)
 {
diff --git a/include/hw/i386/sgx.h b/include/hw/i386/sgx.h
index 2bf90b3f4f..16fc25725c 100644
--- a/include/hw/i386/sgx.h
+++ b/include/hw/i386/sgx.h
@@ -7,5 +7,6 @@
 #include "qapi/qapi-types-misc-target.h"
 
 SGXInfo *sgx_get_info(Error **errp);
+SGXInfo *sgx_get_capabilities(Error **errp);
 
 #endif
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index e2a347cc23..594fbd1577 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -376,3 +376,21 @@
 #
 ##
 { 'command': 'query-sgx', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
+
+##
+# @query-sgx-capabilities:
+#
+# Returns information from host SGX capabilities
+#
+# Returns: @SGXInfo
+#
+# Since: 6.2
+#
+# Example:
+#
+# -> { "execute": "query-sgx-capabilities" }
+# <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
+#                  "flc": true, "section-size" : 0 } }
+#
+##
+{ 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index d7384ba348..196c1c9e77 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -790,3 +790,8 @@ void hmp_info_sgx(Monitor *mon, const QDict *qdict)
     monitor_printf(mon, "size: %" PRIu64 "\n",
                    info->section_size);
 }
+
+SGXInfo *qmp_query_sgx_capabilities(Error **errp)
+{
+    return sgx_get_capabilities(errp);
+}
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index b75f3364f3..1af2f74c28 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -101,6 +101,7 @@ static bool query_is_ignored(const char *cmd)
         "query-sev",
         "query-sev-capabilities",
         "query-sgx",
+        "query-sgx-capabilities",
         NULL
     };
     int i;
-- 
2.31.1


