Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F02D6A3313
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 18:06:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWKSp-0007yS-FN; Sun, 26 Feb 2023 12:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWKSn-0007xF-9q
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 12:05:29 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWKSl-0001hW-DF
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 12:05:29 -0500
Received: by mail-oi1-x236.google.com with SMTP id bk32so3482781oib.10
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 09:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=swJuKWdeVhFHYkb694oGvFxPgjTud+ZVJxPB7OT3+aU=;
 b=I2vHLO0/JgYI1BIED176ZgQ7+SOvYRPTb4WCRqpEmyViWjhW7L42CaHisrl3pKC94D
 0bpM84E6DHv8WbtM+PwkWJQCyWVV2fp0Ahg8plBcJEHiBu3u/pwc5Fx0J2YyD9HS1fRA
 t1zF1SNWDgXx9/vYE5s0COlGbqt4N1v9XJL7x0B9DFMcNDL1stb4v2Ovw/27cyn9sYl9
 79fu/kjLqiJGZ7yqlDY6Ez41M1zICm1JIMwbV6FlBz724nImImhUzUrZz7u8tJIu90PZ
 ce7BEBaJ1Eq6iw1znoRKSL7i0U4bdaoYswbgAb/d5TqU4vuX0OfuIjZZAGKFTgiI72sz
 1W3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=swJuKWdeVhFHYkb694oGvFxPgjTud+ZVJxPB7OT3+aU=;
 b=IPihbAqVaBnZRSJF+I+5/NOVJRmcs0PdWRcrK30g+JTpDupr892Qka6yU4Uga3GcDu
 SExr5+H0G/Dn+8+EUTJ1HjBCAPMCms5v1rUZCsYSUccXU0HYCh5b/A5EOc8rEeAFGNEm
 uFNcFK8XkiKTgLxen/0MDlD6hrOr7IfXZdaOc6L8hEb0bwZvOHOQUcPXT0NOY7NwWFe4
 lxC3YFbDo5xYsJbGijFw0DPqEnFC7aBFpzXzwg06VJOVHhWvcH23gz+jPRHabc9uDBcC
 vFQNNVdZ8k65nbujuOLacA16jwqiBgyvh19tVtBps07/dgDC7Y0MzBY2ilyrZU/0Fv/I
 XUrA==
X-Gm-Message-State: AO0yUKVX0r1CNbUyLE+lH4V+oc+DWu5CXTFFaB8B61wbXjbF/u2G3Qu+
 g7Jm5ZXmY2q4bbmP6sHZRD8D3XcMm/iWaCWY
X-Google-Smtp-Source: AK7set+XnMZd9Pv0CtBIT2OMeKBIsHyhXCz1nP0nI4ZDeLNIxLHjT8rDCg5MoATjWFc2WYICeasqRg==
X-Received: by 2002:a05:6808:4294:b0:37f:b041:b6ee with SMTP id
 dq20-20020a056808429400b0037fb041b6eemr6781294oib.16.1677431126366; 
 Sun, 26 Feb 2023 09:05:26 -0800 (PST)
Received: from grind.. ([189.110.112.117]) by smtp.gmail.com with ESMTPSA id
 n83-20020acaef56000000b00383b8011881sm2142406oih.18.2023.02.26.09.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 09:05:25 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/2] target/riscv/vector_helper.c: avoid env_archcpu() when
 reading RISCVCPUConfig
Date: Sun, 26 Feb 2023 14:05:14 -0300
Message-Id: <20230226170514.588071-3-dbarboza@ventanamicro.com>
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

This file has several uses of env_archcpu() that are used solely to read
cfg->vlen. Use the new riscv_cpu_cfg() inline instead.

Suggested-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/vector_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7d2e3978f1..a7fb09efa3 100644
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


