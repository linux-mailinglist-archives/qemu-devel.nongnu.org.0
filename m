Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD39325C7B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:19:25 +0100 (CET)
Received: from localhost ([::1]:52256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUb6-0003WQ-JE
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTja-000292-5f
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:24:07 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:55890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTjV-0002RA-Hu
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:24:05 -0500
Received: by mail-pj1-x1033.google.com with SMTP id t9so5181493pjl.5
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lz/W3BW+1lR1i74Oi5nMJEIOHCSiAJcSkdzoESnLrJo=;
 b=d+wHXA+xMDBjutKtkLXhNR9GhuHX0OLL1fiXvOdRVDW0e3xJdjBZr4BUy893nTxfLl
 wFEYLSmCSPs5Jmv4fSU+HULYlah2O7oAxHGsosBZC6tuhXCHODalIh8bcNR0t7pVZRco
 A+plmX0yXaFI2Yc04WFC50n6ePSoULArv5wS0MKWxkd/4gsvU8s8My8aEvVgI0MvFb2P
 E99mXsJxKmd9mk/+hajPIp+wpMqtCNUdr+kk21YWED7g0il6mqmpoZGo/EN7aFPvs5Sj
 hr8p0h1+1qa9mzpjsCYn5fmxuOJ/Q3cXgKA8vdL+Sg8fkn3wxRnzGKOuYGWhH1DmERGv
 5TUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lz/W3BW+1lR1i74Oi5nMJEIOHCSiAJcSkdzoESnLrJo=;
 b=i6UM3MjpDUF3EFFq1Yp2KJsrx2ch3NH39oeOFLomDwK1wRhgSWlJk4X7XyApwCrb6P
 /k+WR3+xqlHAQlRa8ekwfV1Ypse6ymJNLETLIF028aLk4Sh2GdEAE1zL+7jj9gtvqUyc
 /fzhHG4sgs/Fz5Pojf7rbeKrSTSKLX3ZhtpzLo2Lqbk68dfGOetjgVMGHvB63FCu85qH
 K5POYQPXlaVb+hi8Mtgf5lz3kZskbF0V2Tm50/Zq/cyhJtfOGd+lCE18Zq4kBaOMXYLQ
 7OXs92+t80vacSL9vb9UB/M7dxNEAXRsRVdL3KDF5iXIqeFrBLmInvsFYKPgg5d6KC9L
 M+AA==
X-Gm-Message-State: AOAM531rjioiyT4WpwFATkNdeRa7Vj0MHyw5qf3rJSqUlE632JrVDFrR
 1PyLfzhCOnkaIEJzP3dKRnAZya1UJCkrcA==
X-Google-Smtp-Source: ABdhPJx/0MXa6HdNP57iswzJisu91MmxNVoOVkH4iCrifqZqoeHLzB7lfVpVJG/Y7K4mCNi/L8sybw==
X-Received: by 2002:a17:902:7286:b029:e3:cec5:f0cb with SMTP id
 d6-20020a1709027286b02900e3cec5f0cbmr1213840pll.70.1614309840092; 
 Thu, 25 Feb 2021 19:24:00 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:23:59 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 49/75] target/riscv: rvv-1.0: slide instructions
Date: Fri, 26 Feb 2021 11:18:33 +0800
Message-Id: <20210226031902.23656-50-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

* Remove clear function from helper functions as the tail elements
  are unchanged in RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a2ef6b708c8..fac387353fb 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4639,17 +4639,22 @@ GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    target_ulong offset = s1, i;                                          \
+    target_ulong i_max, i;                                                \
                                                                           \
-    for (i = 0; i < vl; ++i) {                                            \
-        target_ulong j = i + offset;                                      \
-        if (!vm && !vext_elem_mask(v0, i)) {                              \
-            continue;                                                     \
+    i_max = MIN(s1 < vlmax ? vlmax - s1 : 0, vl);                         \
+    for (i = 0; i < i_max; ++i) {                                         \
+        if (vm || vext_elem_mask(v0, i)) {                                \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));          \
+        }                                                                 \
+    }                                                                     \
+                                                                          \
+    for (i = i_max; i < vl; ++i) {                                        \
+        if (vm || vext_elem_mask(v0, i)) {                                \
+            *((ETYPE *)vd + H(i)) = 0;                                    \
         }                                                                 \
-        *((ETYPE *)vd + H(i)) = j >= vlmax ? 0 : *((ETYPE *)vs2 + H(j));  \
     }                                                                     \
 }
 
-- 
2.17.1


