Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2350B516223
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:11:22 +0200 (CEST)
Received: from localhost ([::1]:38658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl2ng-0007jR-C2
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tf-0006p9-F8
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:39 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Td-0001FB-Gu
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:39 -0400
Received: by mail-pf1-x432.google.com with SMTP id p8so10064502pfh.8
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8BvhoITH3FbicdDtJZOWptl87d3wC+1SbojQuSuWgZM=;
 b=rmjRGSv++zQZftdfZDjSEoY8KklB3Mj94/CJHnu1OYhT/pD6bAK1NpzE3x9qmkbGIT
 yHiWs2ccDuAsj7XpmJc+L+6n1gGB0Ft2NTkmqG4M75AKjfVkEFiwVumypxe9l5MRtifZ
 BzLBWrA/Ui67fhWC6m9ksJo6i0bkxbYRRyp47zgQEhcS1R0QiqJcbAgK/rv2kRZLdgx8
 HgXcVyPXDKye7TqL+vUaF8oyoRwZwuJpolg6CS8H8oGqmTr6LKjn7CgWk1O4Eb7c9q8p
 BYXIY4VTUWLRLjncC0F100wXJjrFAo1Qxy99m8syLmAO2nmpQbeOfeyujleOV/ibJmsQ
 BnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8BvhoITH3FbicdDtJZOWptl87d3wC+1SbojQuSuWgZM=;
 b=sxTxfIUdA3I6BVMVDYAA97jfOr0Y46HDU/HcLc7mcpzkH3Z8HO2KhwyUkhWmjtv5+z
 Bxa4OFgt2a+jJ/6typNVb9acpel7psxGARXiwVzDf/7l4bOYrzP2QAeq21MZw5LTy/Cj
 L/eClIzRI3P3G363OASD0AUuRAjgvpZ/oc+z6n4Bb5MEDNYedgmjQOUsroZOU523nBGs
 sojxl3ehBGy+NZR5YOHUCjMkWPorDCvvwzoLkjQRqikbXoiJSQ0KL9w3anOGJWPXR0aL
 MQnICVxN8fCzZM00b93M895VH6OEuEkGDeXJu/39uFuwdy4s0ACjgKagWsLMU/uFzyUG
 OReA==
X-Gm-Message-State: AOAM533VfIQfvY4Qp0uObX0IAZxq8bOKFnjjX4wRfpx5xtGJK3Hl1L3R
 UFFsh9sjwAXbBJcK63UAHRLa3DtDKpY7UQ==
X-Google-Smtp-Source: ABdhPJwh4mvAxwDlssIFrNuywuOe84L926xBtANlSRqX5MddtUWC52hyu+lOt/Q20QvzRLYqtTBglA==
X-Received: by 2002:a05:6a00:23d3:b0:50d:9044:4297 with SMTP id
 g19-20020a056a0023d300b0050d90444297mr5957148pfc.43.1651384236157; 
 Sat, 30 Apr 2022 22:50:36 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/45] target/arm: Avoid bare abort() or assert(0)
Date: Sat, 30 Apr 2022 22:49:48 -0700
Message-Id: <20220501055028.646596-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Standardize on g_assert_not_reached() for "should not happen".
Retain abort() when preceeded by fprintf or error_report.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: new.
---
 target/arm/helper.c         | 7 +++----
 target/arm/hvf/hvf.c        | 2 +-
 target/arm/kvm-stub.c       | 4 ++--
 target/arm/kvm.c            | 4 ++--
 target/arm/machine.c        | 4 ++--
 target/arm/translate-a64.c  | 4 ++--
 target/arm/translate-neon.c | 2 +-
 target/arm/translate.c      | 4 ++--
 8 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f84377babe..06f8864c77 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8740,8 +8740,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
             break;
         default:
             /* broken reginfo with out-of-range opc1 */
-            assert(false);
-            break;
+            g_assert_not_reached();
         }
         /* assert our permissions are not too lax (stricter is fine) */
         assert((r->access & ~mask) == 0);
@@ -10823,7 +10822,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             break;
         default:
             /* Never happens, but compiler isn't smart enough to tell.  */
-            abort();
+            g_assert_not_reached();
         }
     }
     *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
@@ -10944,7 +10943,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
             break;
         default:
             /* Never happens, but compiler isn't smart enough to tell.  */
-            abort();
+            g_assert_not_reached();
         }
     }
     if (domain_prot == 3) {
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index b11a8b9a18..86710509d2 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1200,7 +1200,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         /* we got kicked, no exit to process */
         return 0;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     hvf_sync_vtimer(cpu);
diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 56a7099e6b..965a486b32 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -15,10 +15,10 @@
 
 bool write_kvmstate_to_list(ARMCPU *cpu)
 {
-    abort();
+    g_assert_not_reached();
 }
 
 bool write_list_to_kvmstate(ARMCPU *cpu, int level)
 {
-    abort();
+    g_assert_not_reached();
 }
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 5fc37ac10a..4339e1cd6e 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -540,7 +540,7 @@ bool write_kvmstate_to_list(ARMCPU *cpu)
             ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &r);
             break;
         default:
-            abort();
+            g_assert_not_reached();
         }
         if (ret) {
             ok = false;
@@ -575,7 +575,7 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level)
             r.addr = (uintptr_t)(cpu->cpreg_values + i);
             break;
         default:
-            abort();
+            g_assert_not_reached();
         }
         ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &r);
         if (ret) {
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 135d2420b5..285e387d2c 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -661,7 +661,7 @@ static int cpu_pre_save(void *opaque)
     if (kvm_enabled()) {
         if (!write_kvmstate_to_list(cpu)) {
             /* This should never fail */
-            abort();
+            g_assert_not_reached();
         }
 
         /*
@@ -672,7 +672,7 @@ static int cpu_pre_save(void *opaque)
     } else {
         if (!write_cpustate_to_list(cpu, false)) {
             /* This should never fail. */
-            abort();
+            g_assert_not_reached();
         }
     }
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a82f5d5984..b80313670f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6151,7 +6151,7 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
         gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
         break;
     default:
-        abort();
+        g_assert_not_reached();
     }
 
     write_fp_sreg(s, rd, tcg_res);
@@ -6392,7 +6392,7 @@ static void handle_fp_fcvt(DisasContext *s, int opcode,
         break;
     }
     default:
-        abort();
+        g_assert_not_reached();
     }
 }
 
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 2e4d1ec87d..321c17e2c7 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -679,7 +679,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         }
         break;
     default:
-        abort();
+        g_assert_not_reached();
     }
     if ((vd + a->stride * (nregs - 1)) > 31) {
         /*
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 050c237b07..4e19191ed5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5156,7 +5156,7 @@ static void gen_srs(DisasContext *s,
         offset = 4;
         break;
     default:
-        abort();
+        g_assert_not_reached();
     }
     tcg_gen_addi_i32(addr, addr, offset);
     tmp = load_reg(s, 14);
@@ -5181,7 +5181,7 @@ static void gen_srs(DisasContext *s,
             offset = 0;
             break;
         default:
-            abort();
+            g_assert_not_reached();
         }
         tcg_gen_addi_i32(addr, addr, offset);
         gen_helper_set_r13_banked(cpu_env, tcg_constant_i32(mode), addr);
-- 
2.34.1


