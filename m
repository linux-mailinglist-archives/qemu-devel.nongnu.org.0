Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3282C4CF253
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 07:57:45 +0100 (CET)
Received: from localhost ([::1]:42032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7JQ-0000qw-5m
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 01:57:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nR7HX-0006Ss-NG; Mon, 07 Mar 2022 01:55:48 -0500
Received: from [2607:f8b0:4864:20::429] (port=37580
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nR7HV-0007m4-SX; Mon, 07 Mar 2022 01:55:47 -0500
Received: by mail-pf1-x429.google.com with SMTP id t5so12931714pfg.4;
 Sun, 06 Mar 2022 22:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lpDM4L25PmAWayO1hL2DYngZR5Lp/VHzuF6P8QmGy70=;
 b=S3wdy/SKYS4ya+Lv8XkOkdvWiDLhiBKPud6nW6g+xGt7uu0DsHYDjRJPfPJv/jgK+j
 ld31c+y0utbJVYp5qdyOT5wx9xHa8XWTjuhGd0Nd/GBMLXzRTkzCGnseltlC6AGEVu/m
 G8j0jXnZm/DVOXQaoypO3VvpLgHRi1l/B1o61aUwWIgtHl031f7EemDE/j3k9m+ImJvk
 vP7JbIPm4VgyZATCznNGhOAF0CgyDXUlyQxB8Ln2Vl7PZsdaDm6duAvDFkpf6jv9ir5m
 eK5+SFP9G7YLl0QOYJkwn1e/9l/j7KZEghy7PVRVUP7z2jOFeYvsFVk/bVk6X8Z5eB37
 2hBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lpDM4L25PmAWayO1hL2DYngZR5Lp/VHzuF6P8QmGy70=;
 b=KESy8w1QKwNO08tJ0brLqescAKvFQOPvm95p6oktvGbOyzhw0DnR5c6T7dU6jAlgAM
 cmWCbjqnXCGij0y7sXKXNneDN22qlIVu8gCxmZgWWubfLNpIt3ZVtEryb7enU6UfCViY
 B/zrNU1d6rxp0EimBQbol6xAGOSYwlrGRn6xBSccJLQNs6Pk29z4AGaJHzFAKSY2eZPj
 IDFx5Uf2/cSd61pvFn7pulpAFgVpWW+zjPB0I0m71IqLUok8yXEYA0eRyn9Vw6GrLupc
 p9UpqpS1HF9pyWlgkqDuT890u4koCFot21+B1IsxA/2j6S3LTBf01R+TbFFEqKIay46G
 AV6A==
X-Gm-Message-State: AOAM5318Jqj/00JzbLg6DvPE7/R/Bprg1dIJw2JicAks6NDigNWmDi72
 n3To9K8HoBN5irA8zQC2LnDIrC/Br1k=
X-Google-Smtp-Source: ABdhPJzhHudDb8PCvb6Y9oFs4JCxjYm92bV11Ey1lZIMzgmunfeqzDbQNf1KLvCcNA+vXSHUoj6+4g==
X-Received: by 2002:a63:81c7:0:b0:37c:8bd7:f7ff with SMTP id
 t190-20020a6381c7000000b0037c8bd7f7ffmr8627259pgd.202.1646636144105; 
 Sun, 06 Mar 2022 22:55:44 -0800 (PST)
Received: from bobo.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a637e41000000b003804d0e2c9esm1902477pgn.35.2022.03.06.22.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 22:55:43 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v3 3/4] target/ppc: Add POWER9 DD2.2 model
Date: Mon,  7 Mar 2022 16:55:26 +1000
Message-Id: <20220307065527.156132-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220307065527.156132-1-npiggin@gmail.com>
References: <20220307065527.156132-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

POWER9 DD2.1 and earlier had significant limitations when running KVM,
including lack of "mixed mode" MMU support (ability to run HPT and RPT
mode on threads of the same core), and a translation prefetch issue
which is worked around by disabling "AIL" mode for the guest.

These processors are not widely available, and it's difficult to deal
with all these quirks in qemu +/- KVM, so create a POWER9 DD2.2 CPU
and make it the default POWER9 CPU.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/pnv.c                   |  2 +-
 hw/ppc/pnv_core.c              |  2 +-
 hw/ppc/spapr.c                 |  2 +-
 hw/ppc/spapr_cpu_core.c        |  1 +
 include/hw/ppc/pnv.h           |  2 +-
 target/ppc/cpu-models.c        |  4 +++-
 target/ppc/cpu-models.h        |  1 +
 target/ppc/cpu_init.c          | 21 +++++++++++++++++++--
 tests/qtest/device-plug-test.c |  4 ++--
 9 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 0ac86e104f..a7217b6ffd 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2144,7 +2144,7 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
     static const char compat[] = "qemu,powernv9\0ibm,powernv";
 
     mc->desc = "IBM PowerNV (Non-Virtualized) POWER9";
-    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power9_v2.0");
+    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power9_v2.2");
     xfc->match_nvt = pnv_match_nvt;
 
     mc->alias = "powernv";
diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index 19e8eb885f..a350cfc0b6 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -346,7 +346,7 @@ static const TypeInfo pnv_core_infos[] = {
     DEFINE_PNV_CORE_TYPE(power8, "power8e_v2.1"),
     DEFINE_PNV_CORE_TYPE(power8, "power8_v2.0"),
     DEFINE_PNV_CORE_TYPE(power8, "power8nvl_v1.0"),
-    DEFINE_PNV_CORE_TYPE(power9, "power9_v2.0"),
+    DEFINE_PNV_CORE_TYPE(power9, "power9_v2.2"),
     DEFINE_PNV_CORE_TYPE(power10, "power10_v2.0"),
 };
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4cc204f90d..69b0a6f6d6 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4599,7 +4599,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
 
     smc->dr_lmb_enabled = true;
     smc->update_dt_enabled = true;
-    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power9_v2.0");
+    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power9_v2.2");
     mc->has_hotpluggable_cpus = true;
     mc->nvdimm_supported = true;
     smc->resize_hpt_default = SPAPR_RESIZE_HPT_ENABLED;
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index ed84713960..fe18127d1d 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -387,6 +387,7 @@ static const TypeInfo spapr_cpu_core_type_infos[] = {
     DEFINE_SPAPR_CPU_CORE_TYPE("power8nvl_v1.0"),
     DEFINE_SPAPR_CPU_CORE_TYPE("power9_v1.0"),
     DEFINE_SPAPR_CPU_CORE_TYPE("power9_v2.0"),
+    DEFINE_SPAPR_CPU_CORE_TYPE("power9_v2.2"),
     DEFINE_SPAPR_CPU_CORE_TYPE("power10_v1.0"),
     DEFINE_SPAPR_CPU_CORE_TYPE("power10_v2.0"),
 #ifdef CONFIG_KVM
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 1e34ddd502..7f7b8ec4df 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -180,7 +180,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER8,
 DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER8NVL,
                          TYPE_PNV_CHIP_POWER8NVL)
 
-#define TYPE_PNV_CHIP_POWER9 PNV_CHIP_TYPE_NAME("power9_v2.0")
+#define TYPE_PNV_CHIP_POWER9 PNV_CHIP_TYPE_NAME("power9_v2.2")
 DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER9,
                          TYPE_PNV_CHIP_POWER9)
 
diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
index 976be5e0d1..3d136859f0 100644
--- a/target/ppc/cpu-models.c
+++ b/target/ppc/cpu-models.c
@@ -732,6 +732,8 @@
                 "POWER9 v1.0")
     POWERPC_DEF("power9_v2.0",   CPU_POWERPC_POWER9_DD20,            POWER9,
                 "POWER9 v2.0")
+    POWERPC_DEF("power9_v2.2",   CPU_POWERPC_POWER9_DD22,            POWER9,
+                "POWER9 v2.2")
     POWERPC_DEF("power10_v1.0",  CPU_POWERPC_POWER10_DD1,            POWER10,
                 "POWER10 v1.0")
     POWERPC_DEF("power10_v2.0",  CPU_POWERPC_POWER10_DD20,           POWER10,
@@ -908,7 +910,7 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
     { "power8e", "power8e_v2.1" },
     { "power8", "power8_v2.0" },
     { "power8nvl", "power8nvl_v1.0" },
-    { "power9", "power9_v2.0" },
+    { "power9", "power9_v2.2" },
     { "power10", "power10_v2.0" },
 #endif
 
diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
index b42f2ab162..20be2a4348 100644
--- a/target/ppc/cpu-models.h
+++ b/target/ppc/cpu-models.h
@@ -350,6 +350,7 @@ enum {
     CPU_POWERPC_POWER9_BASE        = 0x004E0000,
     CPU_POWERPC_POWER9_DD1         = 0x004E0100,
     CPU_POWERPC_POWER9_DD20        = 0x004E0200,
+    CPU_POWERPC_POWER9_DD22        = 0x004E0202,
     CPU_POWERPC_POWER10_BASE       = 0x00800000,
     CPU_POWERPC_POWER10_DD1        = 0x00800100,
     CPU_POWERPC_POWER10_DD20       = 0x00800200,
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 83ca741bea..eee5d9cffb 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6283,9 +6283,26 @@ static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr)
         return false;
     }
 
-    if ((pvr & 0x0f00) == (pcc->pvr & 0x0f00)) {
-        /* Major DD version matches to power9_v1.0 and power9_v2.0 */
+    if ((pvr & 0x0f00) != (pcc->pvr & 0x0f00)) {
+        /* Major DD version does not match */
+        return false;
+    }
+
+    if ((pvr & 0x0f00) == 0x100) {
+        /* DD1.x always matches power9_v1.0 */
         return true;
+    } else if ((pvr & 0x0f00) == 0x200) {
+        if ((pvr & 0xf) < 2) {
+            /* DD2.0, DD2.1 match power9_v2.0 */
+            if ((pcc->pvr & 0xf) == 0) {
+                return true;
+            }
+        } else {
+            /* DD2.2, DD2.3 (and any higher) match power9_v2.2 */
+            if ((pcc->pvr & 0xf) == 2) {
+                return true;
+            }
+        }
     }
 
     return false;
diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index 404a92e132..30adc91d12 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -124,8 +124,8 @@ static void test_spapr_cpu_unplug_request(void)
 {
     QTestState *qtest;
 
-    qtest = qtest_initf("-cpu power9_v2.0 -smp 1,maxcpus=2 "
-                        "-device power9_v2.0-spapr-cpu-core,core-id=1,id=dev0");
+    qtest = qtest_initf("-cpu power9_v2.2 -smp 1,maxcpus=2 "
+                        "-device power9_v2.2-spapr-cpu-core,core-id=1,id=dev0");
 
     /* similar to test_pci_unplug_request */
     device_del(qtest, "dev0");
-- 
2.23.0


