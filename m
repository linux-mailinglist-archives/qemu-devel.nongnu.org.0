Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDB942ECA4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:41:29 +0200 (CEST)
Received: from localhost ([::1]:34530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbImO-0001sG-LG
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyJ-00026Z-PB
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:49:44 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyI-0004JC-64
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:49:43 -0400
Received: by mail-pg1-x536.google.com with SMTP id e65so5463592pgc.5
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y9E18ASI1jSeoAkPQqFV0gLtkodQm+thHHx2aChLV3A=;
 b=FRo9wroNSm6ipDkY+P5UKZLdyMkfm0BXGc413v30pnoNUO9rEwQpwJUwVrjuLCaYjV
 /gKeJlTe+9iiFBFqjwyt3ix9wsPKnXmOKkyTh1X4TVcZrVRVwiuw2joYyRor2N1MJCiR
 799NQjhMvrj6qmbFEVHJAlHaC6jHYQrsNMu6MkpOpkkWBNi64p3ySseWaOhX4XUtUasv
 7Ymd0a0HC0azUJO0AHOiSEZi8ho0BSanTRx+UlfhuRx6sp6i820CaOouJm4Kht23vtvQ
 yjN6hZMvS+k3w9wh+SeAfsVstr6YW6uTvj4/sr1aoHKygnjr4CBnJlS4QUuVO1SfPiaT
 dKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y9E18ASI1jSeoAkPQqFV0gLtkodQm+thHHx2aChLV3A=;
 b=rpuSTxx4wYArdcWyFgsbJ4YsnB34Nk2qfYNeF5r2ppf0hMG1kSGdjnwgWNAZybTpgF
 qVIXC5rahZ7a285xuED751HS+gnIKZW8aueljaaanByJ9vwNcVxBbkv8req8a6nugbF/
 cfu175xvSTh5TZm40Ih+NUM2n996HGiKcuWfuJU+e+KzgOiNfBXNyPWXwou0PS1jcl5A
 8UuCt8ORy+ibUHmhdurdaMv7zqFXCSV5EujtrGHXk523DnPDrI5nE3Jd7egd7Z9PjQUL
 YCEMbxF6WxhtJ1nQqoeGkS/9VBDaIxhhf8Ke9DdQua6tB4pgvAJwbzUR+ecVZThid01y
 cAVw==
X-Gm-Message-State: AOAM530vUYaWqiAZ4X9ihuKskeGtCkdboB3+yIzkBe7wUm5evRHmi3IP
 AER//+CdP1YWFcA0nBDA0mkfYW/d9Jl40aaP
X-Google-Smtp-Source: ABdhPJxIDFwielhn80ChqtgQJVrox8wH/hHEbOmaJSWx9iySV9KFeLmNZhfCDCvEh2VzvCVNMQEU5Q==
X-Received: by 2002:aa7:978b:0:b0:44c:abf1:a8b8 with SMTP id
 o11-20020aa7978b000000b0044cabf1a8b8mr10347167pfp.35.1634284180839; 
 Fri, 15 Oct 2021 00:49:40 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:40 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 47/78] target/riscv: rvv-1.0: integer comparison
 instructions
Date: Fri, 15 Oct 2021 15:45:55 +0800
Message-Id: <20211015074627.3957162-55-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
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

* Sign-extend vmselu.vi and vmsgtu.vi immediate values.
* Remove "set tail elements to zeros" as tail elements can be unchanged
  for either VTA to have undisturbed or agnostic setting.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 9 ---------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 575d42b68ab..2fe8f4a3c2f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1809,9 +1809,9 @@ GEN_OPIVX_TRANS(vmsgt_vx, opivx_cmp_check)
 
 GEN_OPIVI_TRANS(vmseq_vi, IMM_SX, vmseq_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsne_vi, IMM_SX, vmsne_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsleu_vi, IMM_ZX, vmsleu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsleu_vi, IMM_SX, vmsleu_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsle_vi, IMM_SX, vmsle_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsgtu_vi, IMM_ZX, vmsgtu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsgtu_vi, IMM_SX, vmsgtu_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsgt_vi, IMM_SX, vmsgt_vx, opivx_cmp_check)
 
 /* Vector Integer Min/Max Instructions */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e885d4d3539..277a5e4120a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1190,8 +1190,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_max_elems(desc,                     \
-                                    ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -1202,9 +1200,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         }                                                     \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
@@ -1243,7 +1238,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -1254,9 +1248,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
         vext_set_elem_mask(vd, i,                                   \
                 DO_OP(s2, (ETYPE)(target_long)s1));                 \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
-    }                                                               \
 }
 
 GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)
-- 
2.25.1


