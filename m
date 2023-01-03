Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B379D65C5F4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:19:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCls5-00013h-6H; Tue, 03 Jan 2023 13:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pCls2-000119-JM
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:43 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pCls0-0005Oj-Ob
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:42 -0500
Received: by mail-qt1-x835.google.com with SMTP id z12so25180843qtv.5
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RTwMqyhlkCLAE14wwdpweGikJKU6H9FwK5bch9gSJbk=;
 b=Kr6/wqmjMyOFMK+cIZ3rJrAxGCjuU1irdVP0/ilPhumrH4kZ9nNALIn6ds/jgmPmLJ
 mA8qu1P4ES3AWCIt8mssLHqBWkf/pzzaZOT1seOtZy7Ekm9zZwUPEyBmB6Hv5xYTiNX7
 MbqpKF3gLlptyk+1PC+ah3om0GrJD7WrsJk1ORiMFChojAvAPEiapWeMKhZtwqPeYkXM
 J+DD5dtdbGjBx1l87asd7hDWH7LGW2p90Zc+gsvHwAMlkZIe+o1t9O/OOgzOOm75D6DW
 LvImS/cHRA1+I4Sgwfvy4Qx1g16M/aQq6u2vrkvl55raRK2EcvRyZ7B/aj0ze9aXzEif
 mbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RTwMqyhlkCLAE14wwdpweGikJKU6H9FwK5bch9gSJbk=;
 b=dTfup/GAwxWUHpgUBVH0tRwQOu1YzhPi9m9JhfqXyd/5R7FgBt4tVnqo0XHXHPZm3p
 ucP3q9mHguMJUV3ZSPqy50/oSrOOJwUwdkab+jfPt8R8884qfzsvl/p61D1EbemEHF0t
 kISkMx/U6wwhzn/WFpMOWZA7SI2bcElg7Y6JwUcHldBWy8pRqA7+6Zcz2qcUagdDaDVS
 p60vMy4BPkH7EPJDyqevs64YRcJY2q4NZ+IvVjXPVhaAx8trnN1wlH288Mk44LWCmbLI
 YjXHDaza93iZpX+25eIZICOejIYucghy+Qf0efxbnufQoVptqiHIE/Icr86hBVMSRSGT
 bbhg==
X-Gm-Message-State: AFqh2ko5UjFOhoZWPTpLTyWxVMZWQiB1NoDiN3bU77sX2ps6n6SS9Fgb
 MNLv/+Ff4i2yIJxKpd+qttyDGUzDhw8JxBVTmY4=
X-Google-Smtp-Source: AMrXdXuU5MUCmBWQmURljRj9y6J/AOY4Bq3FTZ2GmOXAa/P3uEu8X48b4+OaF2I+pEIYcGT1PtXDyw==
X-Received: by 2002:ac8:1382:0:b0:3a9:8b48:f8f with SMTP id
 h2-20020ac81382000000b003a98b480f8fmr63259237qtj.67.1672769919600; 
 Tue, 03 Jan 2023 10:18:39 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 37/40] target/arm: Move "cfgend" to class property
Date: Tue,  3 Jan 2023 10:16:43 -0800
Message-Id: <20230103181646.55711-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Remove the cfgend variable entirely and reuse the property
accessor functions created for reset-hivecs.  This removes
the last setting of cpu->reset_sctlr, to we can remove that
as well, using only the class value.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  8 --------
 target/arm/cpu.c    | 26 ++++++++++++--------------
 target/arm/helper.c |  4 ++--
 3 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5921660d86..23070a9c25 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -954,7 +954,6 @@ struct ArchCPU {
     uint32_t revidr;
     uint32_t reset_fpsid;
     uint64_t ctr;
-    uint32_t reset_sctlr;
     uint64_t pmceid0;
     uint64_t pmceid1;
     uint32_t id_afr0;
@@ -987,13 +986,6 @@ struct ArchCPU {
     int gic_vprebits; /* number of virtual preemption bits */
     int gic_pribits; /* number of physical priority bits */
 
-    /* Whether the cfgend input is high (i.e. this CPU should reset into
-     * big-endian mode).  This setting isn't used directly: instead it modifies
-     * the reset_sctlr value to have SCTLR_B or SCTLR_EE set, depending on the
-     * architecture version.
-     */
-    bool cfgend;
-
     QLIST_HEAD(, ARMELChangeHook) pre_el_change_hooks;
     QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3262e86e61..17d08e0e9c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1222,7 +1222,6 @@ static void arm_cpu_initfn(Object *obj)
     cpu->revidr = acc->revidr;
     cpu->id_afr0 = acc->id_afr0;
     cpu->reset_fpsid = acc->reset_fpsid;
-    cpu->reset_sctlr = acc->reset_sctlr;
     cpu->reset_auxcr = acc->reset_auxcr;
     cpu->pmsav7_dregion = acc->pmsav7_dregion;
     cpu->sau_sregion = acc->sau_sregion;
@@ -1280,9 +1279,6 @@ static void arm_cpu_initfn(Object *obj)
 static Property arm_cpu_reset_cbar_property =
             DEFINE_PROP_UINT64("reset-cbar", ARMCPU, reset_cbar, 0);
 
-static Property arm_cpu_cfgend_property =
-            DEFINE_PROP_BOOL("cfgend", ARMCPU, cfgend, false);
-
 static Property arm_cpu_has_vfp_property =
             DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
 
@@ -1442,8 +1438,6 @@ static void arm_cpu_post_init(Object *obj)
                                    &cpu->psci_conduit,
                                    OBJ_PROP_FLAG_READWRITE);
 
-    qdev_property_add_static(DEVICE(obj), &arm_cpu_cfgend_property);
-
     if (kvm_enabled()) {
         kvm_arm_add_vcpu_properties(obj);
     }
@@ -1771,14 +1765,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (cpu->cfgend) {
-        if (arm_feature(&cpu->env, ARM_FEATURE_V7)) {
-            cpu->reset_sctlr |= SCTLR_EE;
-        } else {
-            cpu->reset_sctlr |= SCTLR_B;
-        }
-    }
-
     if (!cpu->has_pmu) {
         unset_feature(env, ARM_FEATURE_PMU);
     }
@@ -2306,6 +2292,18 @@ static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
     }
 
 #ifndef CONFIG_USER_ONLY
+    /*
+     * When the cfgend input is high, the CPU should reset into
+     * big-endian mode.  Modify the reset_sctlr value to have SCTLR_B
+     * or SCTLR_EE set, depending on the architecture version.
+     */
+    class_property_add(oc, "cfgend", "bool", NULL,
+                       arm_class_prop_get_sctlrbit,
+                       arm_class_prop_set_sctlrbit,
+                       (void *)(uintptr_t)
+                       (arm_class_feature(acc, ARM_FEATURE_V7)
+                        ? SCTLR_EE : SCTLR_B));
+
     if (arm_class_feature(acc, ARM_FEATURE_GENERIC_TIMER)) {
         class_property_add(oc, "cntfrq", "uint64", NULL,
                            arm_class_prop_uint64_ofs,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 67d32c2e59..e414fa11dd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7995,7 +7995,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL3_RW,
               .raw_writefn = raw_write, .writefn = sctlr_write,
               .fieldoffset = offsetof(CPUARMState, cp15.sctlr_el[3]),
-              .resetvalue = cpu->reset_sctlr },
+              .resetvalue = acc->reset_sctlr },
         };
 
         define_arm_cp_regs(cpu, el3_regs);
@@ -8331,7 +8331,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             .access = PL1_RW, .accessfn = access_tvm_trvm,
             .bank_fieldoffsets = { offsetof(CPUARMState, cp15.sctlr_s),
                                    offsetof(CPUARMState, cp15.sctlr_ns) },
-            .writefn = sctlr_write, .resetvalue = cpu->reset_sctlr,
+            .writefn = sctlr_write, .resetvalue = acc->reset_sctlr,
             .raw_writefn = raw_write,
         };
         if (arm_feature(env, ARM_FEATURE_XSCALE)) {
-- 
2.34.1


