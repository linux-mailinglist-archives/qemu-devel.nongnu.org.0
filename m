Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6585F46FD65
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 10:08:30 +0100 (CET)
Received: from localhost ([::1]:40994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbtF-0006q0-H8
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 04:08:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapD-00089I-75
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:00:15 -0500
Received: from [2607:f8b0:4864:20::62c] (port=33349
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvap9-00079p-DQ
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:00:14 -0500
Received: by mail-pl1-x62c.google.com with SMTP id y7so5797040plp.0
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 00:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hcrv2A+ufbotVoC/cB5KLIarJVYd5T0JXDiHqioqUnA=;
 b=OFvSNdptyAqnc4jlpRLNMUedcBjII7ESXvAnV/b5UA/6LO1hf1gefc/DM2NZwqqwtp
 EyaG3uEr5MVp7C98KlHDvXnEf7gg70lATn4gMiMJHBlEm4CUWZZxAJn2hgiGhNJ/7q6m
 zelGNLTcbbW9iA8/OVwTNb7gaPmfI0wIXB+MTOfBnTCl2xZ4jmdIkiJgutVKtMT2xe+Y
 tfoZvDI/n2oEzGOFeUbV8lfMbSl8IboFSbZVGMlvu7ZqPEheXHMVVSDtdLznVda450yq
 rhRsxtMhHTSEBtwd50F7Ep38sUVSeCDoLym0uwxz1OQtAg4m8MCJjVeMgulqW4wVq2jM
 wQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hcrv2A+ufbotVoC/cB5KLIarJVYd5T0JXDiHqioqUnA=;
 b=UqW2Kw8aGv4nD9wN79pUIUwHy4Uqo/oJGm8YvU96cZ4xeVTvXHw+QVd0tzmLuffcrw
 SlPFI079yZWUYEB3P8VxDVKtJwTozYXNhT1hS0/ZBc9PODfj70yd1MW5vxQVucKnpL15
 Bz7SjdTaRpuKi+Znhx3NuvQzu0TxnJjN3vDkAgJv2d6nsWElylZVMQKyY0S0r/EGLbpd
 Sb24lDBwArT3lUU7cK7smd08OXvNnZCWk+DAvTMT0A+8vEqR1TDJqn5O45or+P6r3o+X
 GoWamxhMHq+NuvjiTs4DHHY5pe5UK71CgxhLR75k+0fm72dbuQ1tvWtF+8GPiwJjG4bH
 uUBA==
X-Gm-Message-State: AOAM5338CbnVaJ0VftRm70nHlUIeLpLF43HKHPN85rwfTxTuWiLa9U9H
 A/EG+SU4Geju8RucmFKFVrxhIuLLiBuy+Jd6
X-Google-Smtp-Source: ABdhPJzpm4uWz4IWtZCT0jGcyRKx9eQe1/sh+27GOyY+TcnmAP0+LDYzsHqegiX6jwt6VKPl5iiaVQ==
X-Received: by 2002:a17:902:748c:b0:141:c45e:c612 with SMTP id
 h12-20020a170902748c00b00141c45ec612mr73341843pll.73.1639123209879; 
 Fri, 10 Dec 2021 00:00:09 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:09 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 60/77] target/riscv: introduce floating-point rounding
 mode enum
Date: Fri, 10 Dec 2021 15:56:46 +0800
Message-Id: <20211210075704.23951-61-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/fpu_helper.c               | 12 ++++++------
 target/riscv/insn_trans/trans_rvv.c.inc | 18 +++++++++---------
 target/riscv/internals.h                |  9 +++++++++
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 388e23ca67..dec39d4a9e 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -55,23 +55,23 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
 {
     int softrm;
 
-    if (rm == 7) {
+    if (rm == RISCV_FRM_DYN) {
         rm = env->frm;
     }
     switch (rm) {
-    case 0:
+    case RISCV_FRM_RNE:
         softrm = float_round_nearest_even;
         break;
-    case 1:
+    case RISCV_FRM_RTZ:
         softrm = float_round_to_zero;
         break;
-    case 2:
+    case RISCV_FRM_RDN:
         softrm = float_round_down;
         break;
-    case 3:
+    case RISCV_FRM_RUP:
         softrm = float_round_up;
         break;
-    case 4:
+    case RISCV_FRM_RMM:
         softrm = float_round_ties_away;
         break;
     default:
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 1ce5a10b6a..047be5d5c4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2088,7 +2088,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
             gen_helper_##NAME##_d,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2167,7 +2167,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)            \
             gen_helper_##NAME##_w,                                \
             gen_helper_##NAME##_d,                                \
         };                                                        \
-        gen_set_rm(s, 7);                                         \
+        gen_set_rm(s, RISCV_FRM_DYN);                             \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);            \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
@@ -2199,7 +2199,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
         TCGLabel *over = gen_new_label();                        \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, RISCV_FRM_DYN);                            \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);        \
                                                                  \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
@@ -2236,7 +2236,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         static gen_helper_opfvf *const fns[2] = {                \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, RISCV_FRM_DYN);                            \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
@@ -2266,7 +2266,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,          \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2303,7 +2303,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         static gen_helper_opfvf *const fns[2] = {                \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, RISCV_FRM_DYN);                            \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
@@ -2380,7 +2380,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_d,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2526,7 +2526,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_w,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2574,7 +2574,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_w,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index ac062dc0b4..db105d4d64 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -36,6 +36,15 @@ target_ulong fclass_d(uint64_t frs1);
 extern const VMStateDescription vmstate_riscv_cpu;
 #endif
 
+enum {
+    RISCV_FRM_RNE = 0,  /* Round to Nearest, ties to Even */
+    RISCV_FRM_RTZ = 1,  /* Round towards Zero */
+    RISCV_FRM_RDN = 2,  /* Round Down */
+    RISCV_FRM_RUP = 3,  /* Round Up */
+    RISCV_FRM_RMM = 4,  /* Round to Nearest, ties to Max Magnitude */
+    RISCV_FRM_DYN = 7,  /* Dynamic rounding mode */
+};
+
 static inline uint64_t nanbox_s(float32 f)
 {
     return f | MAKE_64BIT_MASK(32, 32);
-- 
2.31.1


