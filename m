Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D69C205C41
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 21:54:48 +0200 (CEST)
Received: from localhost ([::1]:33226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnp0J-0002lx-4N
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 15:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnok5-0005HJ-Us
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 15:38:01 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojz-0005ub-Sv
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 15:38:01 -0400
Received: by mail-pl1-x643.google.com with SMTP id y18so9549798plr.4
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 12:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQXYKDBbAkgmCq2txmQfjRI97j0dYv9eb4akQx5Fjp4=;
 b=JJin/ksifIAF8LFkSVx+4qaa3vkAcfStZ5edNlvEAF64LpDa9JpYYjc8CTXgyMjcrv
 his6Wa4L//Ym1KfRnvJpgj6fOog9UHAZ4uYITNej8Bt2G/EVZPP/DxaZ5BZV2XZvrxbC
 ujoZSrgZVrDZIzYgX5wJx1VkrWaNSodCmAmwlyajcS8B9Nrzq7nQIeI4Gi1wrqD2M4Cc
 8KX815M1nyYkMNjtSub+xR+teb/usXX+kE1phxT5pLNL5zDZeiFQs6bj3s5Qwts5h3Gx
 kdBW33nu8Ht+Mf8SrZomtgDAwciglrTy25CMHAxFl9q0w+6bo02YSS4Bu62u0aBMDrTv
 EjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQXYKDBbAkgmCq2txmQfjRI97j0dYv9eb4akQx5Fjp4=;
 b=GzP8NQoKP4rZ8hoGiyUQTmgHEnZXYO4OGYCrWMrFD5u2pzi3vI7iv2lcKS1QCW+Nqo
 9YetHS7X4oVWlcgfkR5IgIGyNhNQvQItmVVyTvAyX3IFPLyZv2v5Ib8mGOrJA4eYEEJO
 wRkWxGvDFw1+yYgUMAa1SqocMfNWHD8jroEkUpKSZVnj7EvBQEyN3p5kcjmbooagIoUx
 3rq1xRkkLb6W8VNIkFztmNDLQkbNcLWS/JlSICTq+u0LSiLW60xSgs/b05xCH21QQDp+
 tZ6uWDRQ6laVqUQF6gRneiGeGA9NRHYehVx4UaRq2Ohb8+iIQOVY4PN4CFgY1fqok+ku
 R9QQ==
X-Gm-Message-State: AOAM531qE18tYNPtKOIbI+DlOX8QzBeVOSk480IBzVUP5TDgDiuT7wP7
 qStrFiVrNO69e0QczIXh1PA2J6wAOV0=
X-Google-Smtp-Source: ABdhPJzB0IWMiYPb6ZeZd3YxEg2v/6vKqhVDQxqnM2JsvME5S9f95gm7Y8PxXWnBtd56jOyxqkLioA==
X-Received: by 2002:a17:902:8b8a:: with SMTP id
 ay10mr12640494plb.236.1592941074281; 
 Tue, 23 Jun 2020 12:37:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 39/45] target/arm: Implement data cache set allocation tags
Date: Tue, 23 Jun 2020 12:36:52 -0700
Message-Id: <20200623193658.623279-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is DC GVA and DC GZVA, and the tag check for DC ZVA.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Use allocation_tag_mem + memset.
v3: Require pre-cleaned addresses.
v6: Move DCZ block size assert to cpu realize.
    Perform a tag check for DC ZVA.
---
 target/arm/cpu.h           |  4 +++-
 target/arm/helper.c        | 16 ++++++++++++++++
 target/arm/translate-a64.c | 39 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 76f2287314..10c4d031b1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2360,7 +2360,9 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
 #define ARM_CP_NZCV              (ARM_CP_SPECIAL | 0x0300)
 #define ARM_CP_CURRENTEL         (ARM_CP_SPECIAL | 0x0400)
 #define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
-#define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
+#define ARM_CP_DC_GVA            (ARM_CP_SPECIAL | 0x0600)
+#define ARM_CP_DC_GZVA           (ARM_CP_SPECIAL | 0x0700)
+#define ARM_LAST_SPECIAL         ARM_CP_DC_GZVA
 #define ARM_CP_FPU               0x1000
 #define ARM_CP_SVE               0x2000
 #define ARM_CP_NO_GDB            0x4000
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 44a3f9fb48..23cf44fcf4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6998,6 +6998,22 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL0_W,
       .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_GVA", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 4, .opc2 = 3,
+      .access = PL0_W, .type = ARM_CP_DC_GVA,
+#ifndef CONFIG_USER_ONLY
+      /* Avoid overhead of an access check that always passes in user-mode */
+      .accessfn = aa64_zva_access,
+#endif
+    },
+    { .name = "DC_GZVA", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 4, .opc2 = 4,
+      .access = PL0_W, .type = ARM_CP_DC_GZVA,
+#ifndef CONFIG_USER_ONLY
+      /* Avoid overhead of an access check that always passes in user-mode */
+      .accessfn = aa64_zva_access,
+#endif
+    },
     REGINFO_SENTINEL
 };
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f35b122ded..1041ec29d4 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1874,6 +1874,45 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         }
         gen_helper_dc_zva(cpu_env, tcg_rt);
         return;
+    case ARM_CP_DC_GVA:
+        {
+            TCGv_i64 clean_addr, tag;
+
+            /*
+             * DC_GVA, like DC_ZVA, requires that we supply the original
+             * pointer for an invalid page.  Probe that address first.
+             */
+            tcg_rt = cpu_reg(s, rt);
+            clean_addr = clean_data_tbi(s, tcg_rt);
+            gen_probe_access(s, clean_addr, MMU_DATA_STORE, MO_8);
+
+            if (s->ata) {
+                /* Extract the tag from the register to match STZGM.  */
+                tag = tcg_temp_new_i64();
+                tcg_gen_shri_i64(tag, tcg_rt, 56);
+                gen_helper_stzgm_tags(cpu_env, clean_addr, tag);
+                tcg_temp_free_i64(tag);
+            }
+        }
+        return;
+    case ARM_CP_DC_GZVA:
+        {
+            TCGv_i64 clean_addr, tag;
+
+            /* For DC_GZVA, we can rely on DC_ZVA for the proper fault. */
+            tcg_rt = cpu_reg(s, rt);
+            clean_addr = clean_data_tbi(s, tcg_rt);
+            gen_helper_dc_zva(cpu_env, clean_addr);
+
+            if (s->ata) {
+                /* Extract the tag from the register to match STZGM.  */
+                tag = tcg_temp_new_i64();
+                tcg_gen_shri_i64(tag, tcg_rt, 56);
+                gen_helper_stzgm_tags(cpu_env, clean_addr, tag);
+                tcg_temp_free_i64(tag);
+            }
+        }
+        return;
     default:
         break;
     }
-- 
2.25.1


