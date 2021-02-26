Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946E5325C8C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:28:27 +0100 (CET)
Received: from localhost ([::1]:41440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUjq-0002TK-Ls
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTlK-00040G-79
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:54 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTlI-0003H8-KL
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:53 -0500
Received: by mail-pf1-x431.google.com with SMTP id r5so5299488pfh.13
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Xgm78Q7SMYR81cH4wXTeqyeLkMOfma68ZrCpZPuH9XU=;
 b=JKcYrpA2VlU34xGZ9wvu+YOtCoeTGzTnCJGgof9IfvVfe9/g39MGHkjWCYg4zrjNF4
 Oq5HXYu9TjrbPUiSxu3FCkGHIPXDtmg/jAh17NLF3JkEeK8c9FjBR6vAFbFGwLT8KCff
 0KyDjk1FAKzTBxfwR+nOAik9g7BGb3h8AJCIuIzxcMNi3r/P7bwosYGSJ3VuG0+31vDL
 tvtmu/yc10dm3IqbesYuJyY4uHRWYnNgSRUm6MiVNT541h0l15k67ZTBgrp6bA8J78BL
 XLdGhxUmXyUdcUbcuP97pbU3TRa8WXBJOj2O8H+DY21hTt+wRW8DkWZbb34WJTQn8/WT
 PEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Xgm78Q7SMYR81cH4wXTeqyeLkMOfma68ZrCpZPuH9XU=;
 b=ov2jCCF/6etd4rm0oLeSALgFlZeCz5xkHbt9dfi3QQj6iiBOoKw6AEFzTq5Du90WyA
 DMLGXbCXR8+OZSu2oGGLPgxxG9KPII+IXqUkjeQ2JT46Rlpqv+2Y/xON4ib88o+Za/+7
 xi6QYgE5XGo8JoE5yH8/SXcqjWWJEZmsucwIsj0TH0PK6Y7V/PAuvQ7cGKz4dOd9tR2j
 1OrYXWlHLw8OonRVZ25jicC4947N6mUNYyz1sNR90yk9Q+oyD+/yZo01o8Dnvci3tdfq
 8sXtWyZ2b00uHuLgp9GoGXKlNR4tawhu9v/ibMxuB+RYETnK/SIZKEEC01X7t9IXzl3h
 ZobQ==
X-Gm-Message-State: AOAM530CQx0mEv/+a3tZ05Nf0FnqPAuvKmANQ3L1gY/eYryNXnAaXYho
 04Zmod5jrPhm9jMG04uaTWoAvBdgrAIKMg==
X-Google-Smtp-Source: ABdhPJwS6vKMp4X3PZxahSA+NgRnT6p8yUTbl0iqnNl1vwqSKRB0XpAAJHygOKb/LjQZhX/ga/O1Bw==
X-Received: by 2002:a63:df01:: with SMTP id u1mr1012602pgg.341.1614309951072; 
 Thu, 25 Feb 2021 19:25:51 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:50 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 74/75] target/riscv: rvv-1.0: add evl parameter to
 vext_ldst_us()
Date: Fri, 26 Feb 2021 11:18:58 +0800
Message-Id: <20210226031902.23656-75-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

rvv v0.10 adds vector unit-stride mask load/store instructions
(vle1.v, vse1.v), which has:
    evl (effective vector length) = ceil(env-vl/8).

The new instructions operate the same as unmasked byte loads and stores.
Add evl parameter to reuse vext_ldst_us().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 38 ++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index fc6834c1ec4..55560116ff6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -292,17 +292,17 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
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
 
     /* probe every access */
-    probe_pages(env, base, env->vl * (nf << esz), ra, access_type);
+    probe_pages(env, base, evl * (nf << esz), ra, access_type);
     /* load bytes from guest memory */
-    for (i = env->vstart; i < env->vl; i++) {
+    for (i = env->vstart; i < evl; i++) {
         k = 0;
         while (k < nf) {
             target_ulong addr = base + ((i * nf + k) << esz);
@@ -332,7 +332,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
                   CPURISCVState *env, uint32_t desc)                    \
 {                                                                       \
     vext_ldst_us(vd, base, env, desc, LOAD_FN,                          \
-                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);          \
+                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_LOAD); \
 }
 
 GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b)
@@ -340,20 +340,20 @@ GEN_VEXT_LD_US(vle16_v, int16_t, lde_h)
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
2.17.1


