Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D506A3312
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 18:06:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWKSm-0007wr-HY; Sun, 26 Feb 2023 12:05:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWKSk-0007w0-I7
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 12:05:26 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWKSi-0001hW-Dg
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 12:05:26 -0500
Received: by mail-oi1-x236.google.com with SMTP id bk32so3482726oib.10
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 09:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ejl0lWpG19j5guDTl5f5eWDqwqvkWZyhyou5WK2+ZZE=;
 b=X0Y64Q94rihSI6V5UW5j8Gi2TpcnFk493IaeLkoggPXzGFjwF6w9kuWok4q0PjxYet
 p93xuYVArKzGLXqbQf7eTH00nr0JCFLyZNgYrWzt1ghixJEzyXc725ePZG5vGgp1UO/d
 6g9PXRwrrSidKu1BMkBa/StyTVbTZRCpgyD3h7dCWJ2sdfUwnYzp7xBejHTRaAO1Zvr4
 CmtahcPWJMAdR2A12nahd/+5nP8qHhVsNBfrzW8j+exksXHIBgWzH61qT00ja2sxS90p
 /ZLEPd2bYhh/ZPAw6EnYJyhJWjqiHHZy1WzXrSm4bwUfGRm4gEF/OSTMpfo6DyrTBsOz
 /ONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ejl0lWpG19j5guDTl5f5eWDqwqvkWZyhyou5WK2+ZZE=;
 b=O3I8VDkNcD1jauGm8TAnJl6Bh7MlTZtx5PbyS209bplg9bfVl+YLOLnqFjTsuAtOV8
 WhmK6p71gigX+ed1Vm0Az3AGY6OJe09WGk6n4Ys4LSIBqu3Pq9MoXV1FRpsi3lrQ83b0
 pVbccx/Rc1eqT3KFvehh5SnmlOT6bkZqaJ+ZsbpdOHqzJeV1QK3+0TesonACC8Y36fp1
 v5+KArp4ZPhukYQa+BscPMCwf7ZlFxedr5DybLoDwiD6b3bYswWSql5AkMPeIyNQPpID
 36lLl3n4swjAPTCZ4o4lIv1Yl7V41xd6W8t6IZQ7EQuVz8A8+8bGtiXDNsIGtxWdI6Iq
 6CFA==
X-Gm-Message-State: AO0yUKWEvPNm5KgDszNRtlzRKLHypaJkT6A7QtuerJS4HXvH1usYjBd4
 QViLJuGKitFFQzH+33Z5rCPSCzNsLSniHBTq
X-Google-Smtp-Source: AK7set9lBaAJL+NWDeMFPT0DOV3lSU8kLSWJhSbQWPcT2dJ58eh8ZTyBowQqiDEtt9dCXxT0WIePSQ==
X-Received: by 2002:a05:6808:6087:b0:378:6da:6d4f with SMTP id
 de7-20020a056808608700b0037806da6d4fmr6023503oib.28.1677431123364; 
 Sun, 26 Feb 2023 09:05:23 -0800 (PST)
Received: from grind.. ([189.110.112.117]) by smtp.gmail.com with ESMTPSA id
 n83-20020acaef56000000b00383b8011881sm2142406oih.18.2023.02.26.09.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 09:05:22 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 1/2] target/riscv/vector_helper.c: create
 vext_set_tail_elems_1s()
Date: Sun, 26 Feb 2023 14:05:13 -0300
Message-Id: <20230226170514.588071-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230226170514.588071-1-dbarboza@ventanamicro.com>
References: <20230226170514.588071-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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

Commit 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector
load / store instructions") added code to set the tail elements to 1 in
the end of vext_ldst_stride(), vext_ldst_us(), vext_ldst_index() and
vext_ldff(). Aside from a env->vl versus an evl value being used in the
first loop, the code is being repeated 4 times.

Create a helper to avoid code repetition in all those functions.
Arguments that are used in the callers (nf, esz and max_elems) are
passed as arguments. All other values are being derived inside the
helper.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/vector_helper.c | 86 +++++++++++++-----------------------
 1 file changed, 30 insertions(+), 56 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 00de879787..7d2e3978f1 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -267,6 +267,28 @@ GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
 GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
 GEN_VEXT_ST_ELEM(ste_d, int64_t, H8, stq)
 
+static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
+                                   void *vd, uint32_t desc, uint32_t nf,
+                                   uint32_t esz, uint32_t max_elems)
+{
+    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
+    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+    uint32_t vta = vext_vta(desc);
+    uint32_t registers_used;
+    int k;
+
+    for (k = 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
+                          (k * max_elems + max_elems) * esz);
+    }
+
+    if (nf * max_elems % total_elems != 0) {
+        registers_used = ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
+        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
+                          registers_used * vlenb);
+    }
+}
+
 /*
  *** stride: access vector element from strided memory
  */
@@ -281,8 +303,6 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     uint32_t nf = vext_nf(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
-    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
-    uint32_t vta = vext_vta(desc);
     uint32_t vma = vext_vma(desc);
 
     for (i = env->vstart; i < env->vl; i++, env->vstart++) {
@@ -301,18 +321,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         }
     }
     env->vstart = 0;
-    /* set tail elements to 1s */
-    for (k = 0; k < nf; ++k) {
-        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
-                          (k * max_elems + max_elems) * esz);
-    }
-    if (nf * max_elems % total_elems != 0) {
-        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
-        uint32_t registers_used =
-            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
-        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
-                          registers_used * vlenb);
-    }
+
+    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
@@ -359,8 +369,6 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     uint32_t nf = vext_nf(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
-    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
-    uint32_t vta = vext_vta(desc);
 
     /* load bytes from guest memory */
     for (i = env->vstart; i < evl; i++, env->vstart++) {
@@ -372,18 +380,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         }
     }
     env->vstart = 0;
-    /* set tail elements to 1s */
-    for (k = 0; k < nf; ++k) {
-        vext_set_elems_1s(vd, vta, (k * max_elems + evl) * esz,
-                          (k * max_elems + max_elems) * esz);
-    }
-    if (nf * max_elems % total_elems != 0) {
-        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
-        uint32_t registers_used =
-            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
-        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
-                          registers_used * vlenb);
-    }
+
+    vext_set_tail_elems_1s(env, evl, vd, desc, nf, esz, max_elems);
 }
 
 /*
@@ -484,8 +482,6 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t vm = vext_vm(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
-    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
-    uint32_t vta = vext_vta(desc);
     uint32_t vma = vext_vma(desc);
 
     /* load bytes from guest memory */
@@ -505,18 +501,8 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         }
     }
     env->vstart = 0;
-    /* set tail elements to 1s */
-    for (k = 0; k < nf; ++k) {
-        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
-                          (k * max_elems + max_elems) * esz);
-    }
-    if (nf * max_elems % total_elems != 0) {
-        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
-        uint32_t registers_used =
-            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
-        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
-                          registers_used * vlenb);
-    }
+
+    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
@@ -585,8 +571,6 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t vm = vext_vm(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
-    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
-    uint32_t vta = vext_vta(desc);
     uint32_t vma = vext_vma(desc);
     target_ulong addr, offset, remain;
 
@@ -647,18 +631,8 @@ ProbeSuccess:
         }
     }
     env->vstart = 0;
-    /* set tail elements to 1s */
-    for (k = 0; k < nf; ++k) {
-        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
-                          (k * max_elems + max_elems) * esz);
-    }
-    if (nf * max_elems % total_elems != 0) {
-        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
-        uint32_t registers_used =
-            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
-        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
-                          registers_used * vlenb);
-    }
+
+    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
-- 
2.39.2


