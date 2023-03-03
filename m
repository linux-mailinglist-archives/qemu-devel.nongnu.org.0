Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826CB6A92EA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:46:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY102-00020x-I7; Fri, 03 Mar 2023 03:42:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zu-0001LM-Cl
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:38 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zs-000815-E5
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:38 -0500
Received: by mail-pl1-x635.google.com with SMTP id h8so1956406plf.10
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832955;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0rHQcn1c3RoxIEMYQmBzf3qgrVCMNlGeLy55RgmobpQ=;
 b=Fpus1Gd3jc18L2P5mUkI+RBj8lvpTN6CF+trBI69PYs492/dWFAjKNUFW68XF3EleB
 0+iXAc4jp4iXZ7317GW7N0Vsc2Ox07C6yZ6b7fqzd8qaBMKWH9ZlA1ZLnXa+DGD3jkZu
 e5efUAVdWJibTPVSYeseEBZSWobD8kQsPRlAJVJodanrKvKXuD4kw9Y71PAnv4Y+uVnN
 R7XsKdZMwNo7kip4WirwQieUFl8JjuYP7lBs85EEwIbd0/5K0AE+aDju0vhO6PcYMeGa
 xUWnujYnbxKGo6Ps1KZbAJgUaumqJBwSJXFGj0gr2MPeXa/ICCfy85pwVPWwrWC7S39f
 kMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832955;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0rHQcn1c3RoxIEMYQmBzf3qgrVCMNlGeLy55RgmobpQ=;
 b=g+AHMZEvxlCSZO/rpRoXQIiTUm+XNZty1rcCj0iKR4waueqGMwZU7JIY7KoTiA6TIB
 4A8AeP5GpYLdHVQ1SRJGXFcSWDTuOeENfsUKLjILw6/Ci5bYURGawDRCyh6Gqw13ctT1
 pJ9eGcLkMUlgp5uIiTAGDsBEeV3SwviRw6JSiIbi68gZJw0b/T+0eFr/pajSgOyphDaK
 rWYh3ivXvXLt94x1jbXU4qYRI1jYzwtYh8BwcYPiHJNa1A39ZFQoMLTepxAk4dRdXSua
 /PntrMb9fjtIKKIIEnWC3C63JZvhAh8zLHpHBgRM7NXn1/42O2IXf9zxKojBZHiBrCmN
 wnoA==
X-Gm-Message-State: AO0yUKURbMR9wTyNlwmrK474NS9+AOKeR2rzczxyQRshQ3cRv6aPPIHy
 C9MPYr3y1tcxEf4L/4ZAEqOiWQ==
X-Google-Smtp-Source: AK7set88nqLx/p/eDDnZ6jshl5fpPIkwn4UArH3x1oIsdsHagaDCqekt8siKhhs37jdjfcmGV87hhw==
X-Received: by 2002:a17:90b:3505:b0:234:dc4:2006 with SMTP id
 ls5-20020a17090b350500b002340dc42006mr1075443pjb.4.1677832955444; 
 Fri, 03 Mar 2023 00:42:35 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 ki4-20020a170903068400b0019309be03e7sm983435plb.66.2023.03.03.00.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:35 -0800 (PST)
Subject: [PULL 59/59] target/riscv/vector_helper.c: avoid env_archcpu() when
 reading RISCVCPUConfig
Date: Fri,  3 Mar 2023 00:37:40 -0800
Message-Id: <20230303083740.12817-60-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, 
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

This file has several uses of env_archcpu() that are used solely to read
cfg->vlen. Use the new riscv_cpu_cfg() inline instead.

Suggested-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
Message-ID: <20230226170514.588071-3-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/vector_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7e476ea8c3..2423affe37 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -272,7 +272,7 @@ static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
                                    uint32_t esz, uint32_t max_elems)
 {
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);
-    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+    uint32_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
     uint32_t vta = vext_vta(desc);
     uint32_t registers_used;
     int k;
@@ -671,7 +671,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 {
     uint32_t i, k, off, pos;
     uint32_t nf = vext_nf(desc);
-    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+    uint32_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
     uint32_t max_elems = vlenb >> log2_esz;
 
     k = env->vstart / max_elems;
@@ -1141,7 +1141,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vl = env->vl;                                    \
     uint32_t vm = vext_vm(desc);                              \
-    uint32_t total_elems = env_archcpu(env)->cfg.vlen;        \
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;          \
     uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
     uint32_t i;                                               \
                                                               \
@@ -1177,7 +1177,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
 {                                                               \
     uint32_t vl = env->vl;                                      \
     uint32_t vm = vext_vm(desc);                                \
-    uint32_t total_elems = env_archcpu(env)->cfg.vlen;          \
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;            \
     uint32_t vta_all_1s = vext_vta_all_1s(desc);                \
     uint32_t i;                                                 \
                                                                 \
@@ -1376,7 +1376,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t total_elems = env_archcpu(env)->cfg.vlen;        \
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;          \
     uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
     uint32_t vma = vext_vma(desc);                            \
     uint32_t i;                                               \
@@ -1439,7 +1439,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t total_elems = env_archcpu(env)->cfg.vlen;              \
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;                \
     uint32_t vta_all_1s = vext_vta_all_1s(desc);                    \
     uint32_t vma = vext_vma(desc);                                  \
     uint32_t i;                                                     \
@@ -4152,7 +4152,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t total_elems = env_archcpu(env)->cfg.vlen;        \
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;          \
     uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
     uint32_t vma = vext_vma(desc);                            \
     uint32_t i;                                               \
@@ -4190,7 +4190,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t total_elems = env_archcpu(env)->cfg.vlen;              \
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;                \
     uint32_t vta_all_1s = vext_vta_all_1s(desc);                    \
     uint32_t vma = vext_vma(desc);                                  \
     uint32_t i;                                                     \
@@ -4721,7 +4721,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   uint32_t desc)                          \
 {                                                         \
     uint32_t vl = env->vl;                                \
-    uint32_t total_elems = env_archcpu(env)->cfg.vlen;    \
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;      \
     uint32_t vta_all_1s = vext_vta_all_1s(desc);          \
     uint32_t i;                                           \
     int a, b;                                             \
@@ -4808,7 +4808,7 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
 {
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
-    uint32_t total_elems = env_archcpu(env)->cfg.vlen;
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;
     uint32_t vta_all_1s = vext_vta_all_1s(desc);
     uint32_t vma = vext_vma(desc);
     int i;
-- 
2.39.2


