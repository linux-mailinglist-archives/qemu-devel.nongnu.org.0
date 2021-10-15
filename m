Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764FE42EB17
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:08:22 +0200 (CEST)
Received: from localhost ([::1]:53300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIGL-0001bP-Gp
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxT-0000Tb-Ih
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:48:53 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:37403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxR-0003YD-MQ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:48:51 -0400
Received: by mail-pl1-x636.google.com with SMTP id n11so5891613plf.4
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8hmEG6kPBDvJUrkusqG/oNJMxjuWtGKg7+Z2UYPNA+g=;
 b=GTCMqt4YGwVKhBmiYSpvZD05hZik4N6ipvAsUL2tjg1OMjCE4KL/9FD+6AXjPKYHTO
 ffMEXool82mRcEjMb9lEX8dLh0F3Zww5IopR7YWMAmu30p/GR2XRBvvrvoaL/x8ct3mE
 YhC1mmGUecpC46YbTmMcEv0c0nVUCSiJD4FgRcbJ7kmRKoyK9ruGXMqI7bsv/2KoLnAA
 9a665a7LdINh8sxIKNx232+SHdqI3aWc7+jry0LJOtTewFCvJsoQTuSxCGzNC1U9wHjB
 j8d5xbxJ6sN6jbcwz0tbuhwQsvJwGvVwJF/P6SE/Kcr71ja5CRvd+PD4IFn1Ip+Cv/bw
 MPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8hmEG6kPBDvJUrkusqG/oNJMxjuWtGKg7+Z2UYPNA+g=;
 b=UTA6JziZEhtqzg/9qY1pLxyHe3FRZDBhlxLdXr26pTnYa6vRQur1AkwqHe5R0MLw5Z
 GyeYXkq6pa3BBjI1vyyiHkv9AGjy88VdW5sLeyAqkY0FTFEnugCZDnzuiXL3KTMej9jv
 uefgtSDz+/U5pwcZ34p7G3c0eXRGWY+j4UeDcmZtekjxXWJTha4XW2JJUPFAuYyjiUpi
 dIVoFAdyrSwwLAGVRvxpuIKO/M/PWc9519lhh9Fj6GmpvOhQILRLfS27ehdA3NGpejnu
 holUdCm2Y60QNMsjB5Vvg9qUkGEeYDJ8fXSIV9KGwoK71Ap4RKUXIbLfQzl40VdtD7/Y
 a15Q==
X-Gm-Message-State: AOAM531PzYzDlcWvUOX2FQIdpaMPosarBESe9w4a+wMmMxt39PG9pJW/
 3ow4zVW5OR4xu7a9mcRPVKNLQYmfuS7vhJoA
X-Google-Smtp-Source: ABdhPJzcfNvy3zgZRaedgA2qoiRqK7me2gmq9q195I2x7zGItkc6B71yCuX9iZqJiz6WH79J20XFrA==
X-Received: by 2002:a17:903:228c:b0:13e:f389:4ca9 with SMTP id
 b12-20020a170903228c00b0013ef3894ca9mr9758090plh.80.1634284127401; 
 Fri, 15 Oct 2021 00:48:47 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:48:47 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 31/78] target/riscv: rvv-1.0: set-X-first mask bit
 instructions
Date: Fri, 15 Oct 2021 15:45:39 +0800
Message-Id: <20211015074627.3957162-39-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              | 6 +++---
 target/riscv/insn_trans/trans_rvv.c.inc | 5 ++++-
 target/riscv/vector_helper.c            | 4 ----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4df2aa9cddc..d139c0aade7 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -629,9 +629,9 @@ vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
-vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
-vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
-vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
+vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
+vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
+vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5376adca60c..538a32a605a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2730,7 +2730,10 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 #define GEN_M_TRANS(NAME)                                          \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
-    if (vext_check_isa_ill(s)) {                                   \
+    if (require_rvv(s) &&                                          \
+        vext_check_isa_ill(s) &&                                   \
+        require_vm(a->vm, a->rd) &&                                \
+        (a->rd != a->rs2)) {                                       \
         uint32_t data = 0;                                         \
         gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f97783acf05..b0dc971a860 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4260,7 +4260,6 @@ enum set_mask_type {
 static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
                    uint32_t desc, enum set_mask_type type)
 {
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
     int i;
@@ -4290,9 +4289,6 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
             }
         }
     }
-    for (; i < vlmax; i++) {
-        vext_set_elem_mask(vd, i, 0);
-    }
 }
 
 void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
-- 
2.25.1


