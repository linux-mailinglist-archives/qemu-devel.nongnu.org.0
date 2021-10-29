Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1989E43FA8C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 12:14:06 +0200 (CEST)
Received: from localhost ([::1]:46518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgOth-0004ud-5H
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 06:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNoB-00026u-Ua
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:04:19 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNo8-0006os-P8
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:04:19 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so10111067pje.0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mLsqBrg1aHnThOM6huC9hLxzNnQ+6aSZHTSCP0mko4M=;
 b=ImSjJrvGGfWT8/ApWBqV6s5Yttec06RHsP5eBNXZgeiOnP9rMc+fiE6ibixlZW7ckz
 eZvS/IbTxakBbLyiYSTDcP7ZZZAjKbM3G6/EiRKoS0KKPbdr43sWr7gaYG59IF+k8nnk
 OJp/KxldfmFDAChO3lQsL09WkmXp8Bti1RcTm2uY77EVrYCnISg9BIWFbZE1bq2ZHIwe
 eEh9vN+2WfpFFCcpT86kOm3Oi1Ka34l7OV/1DCcUZOPPhQHUuOoIlbWwfUzRgAcvQV/B
 FqtXMORFj+m+1Hd2ggTvxH5+KU9nII6mQLcHx2LPpPNAObUAxchUiTdVWQCR3UPxQiz2
 qTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mLsqBrg1aHnThOM6huC9hLxzNnQ+6aSZHTSCP0mko4M=;
 b=AA8Mg5lL6alxTDUgMjvczQkEVv2Eds4lxWPm4qBv5mNC1AmDNtsGtEjYqd6hvhziH0
 9yYme0zFi6NrQAy2P0OkNyRBFpmdsenf/yFleuLoiGnrsZSdyQA6VNsYTmonHOCJWEZF
 yiTGj/hcFl9YUCDCO+lnLR4vcZFejTJ23g2ABhK+9WtSbfXWSlv/y3NUtzsZtvQ/MDH7
 Nq+NzJbtBiBy9Ifs6XW2OmhKZMrxv1FokDnkVZbaeHY2x/aRQPfJc1TWvQQolz7wmF5+
 Cd89ET1pFfiQtcNO7w85uwQG97ELz7n81UsUSCY4sajYue5Tm47n7RY9untIQ7DneSPm
 C55w==
X-Gm-Message-State: AOAM532UrkazA+KynK2i6k2D9c/tYNQPh1lDz5vO2P3JXQzDQLu12r4S
 PdzbWl6SBn2KqnvsysyjuBG+9ZLG0LNB5J/E
X-Google-Smtp-Source: ABdhPJzvLqyzbIBV9YRu67LpgLC6vbTIhYNkzG6FySK0C/Bsu9ppl20WDeH6cRZ86Mg6vtGd07zZzw==
X-Received: by 2002:a17:90a:5992:: with SMTP id
 l18mr18151148pji.127.1635498255300; 
 Fri, 29 Oct 2021 02:04:15 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:04:15 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 73/76] target/riscv: rvv-1.0: add evl parameter to
 vext_ldst_us()
Date: Fri, 29 Oct 2021 16:59:18 +0800
Message-Id: <20211029085922.255197-74-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Add supports of Vector unit-stride mask load/store instructions
(vlm.v, vsm.v), which has:
    evl (effective vector length) = ceil(env->vl / 8).

The new instructions operate the same as unmasked byte loads and stores.
Add evl parameter to reuse vext_ldst_us().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 946dca53ffd..83373ca6fc6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -279,15 +279,15 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
 /* unmasked unit-stride load and store operation*/
 static void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
-             vext_ldst_elem_fn *ldst_elem,
-             uint32_t esz, uintptr_t ra, MMUAccessType access_type)
+             vext_ldst_elem_fn *ldst_elem, uint32_t esz, uint32_t evl,
+             uintptr_t ra, MMUAccessType access_type)
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
     uint32_t max_elems = vext_max_elems(desc, esz);
 
     /* load bytes from guest memory */
-    for (i = env->vstart; i < env->vl; i++, env->vstart++) {
+    for (i = env->vstart; i < evl; i++, env->vstart++) {
         k = 0;
         while (k < nf) {
             target_ulong addr = base + ((i * nf + k) << esz);
@@ -316,7 +316,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
                   CPURISCVState *env, uint32_t desc)                    \
 {                                                                       \
     vext_ldst_us(vd, base, env, desc, LOAD_FN,                          \
-                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);          \
+                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_LOAD); \
 }
 
 GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b)
@@ -324,20 +324,20 @@ GEN_VEXT_LD_US(vle16_v, int16_t, lde_h)
 GEN_VEXT_LD_US(vle32_v, int32_t, lde_w)
 GEN_VEXT_LD_US(vle64_v, int64_t, lde_d)
 
-#define GEN_VEXT_ST_US(NAME, ETYPE, STORE_FN)                           \
-void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         \
-                         CPURISCVState *env, uint32_t desc)             \
-{                                                                       \
-    uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));             \
-    vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,  \
-                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     \
-}                                                                       \
-                                                                        \
-void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
-                  CPURISCVState *env, uint32_t desc)                    \
-{                                                                       \
-    vext_ldst_us(vd, base, env, desc, STORE_FN,                         \
-                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);         \
+#define GEN_VEXT_ST_US(NAME, ETYPE, STORE_FN)                            \
+void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,          \
+                         CPURISCVState *env, uint32_t desc)              \
+{                                                                        \
+    uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));              \
+    vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,   \
+                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);      \
+}                                                                        \
+                                                                         \
+void HELPER(NAME)(void *vd, void *v0, target_ulong base,                 \
+                  CPURISCVState *env, uint32_t desc)                     \
+{                                                                        \
+    vext_ldst_us(vd, base, env, desc, STORE_FN,                          \
+                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_STORE); \
 }
 
 GEN_VEXT_ST_US(vse8_v,  int8_t,  ste_b)
-- 
2.25.1


