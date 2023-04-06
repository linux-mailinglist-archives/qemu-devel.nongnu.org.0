Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841AC6D9F79
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 20:06:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkTyU-00019o-K8; Thu, 06 Apr 2023 14:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyO-00015w-Qi
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:38 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyK-0000dq-5B
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:34 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-17aaa51a911so43228512fac.5
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 11:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G0KZB43953rDZ9eEo49cyVU/G2AGYXUmxjvTZ9fuOiE=;
 b=ZanHvbzheepU/K8NnOqtU0AwsMJBNTwj51bw9Ppm0mzZVkeHaCkGzlKp2t22lnO24f
 PjlNSb/VlHmQY/DXV1AzU32S2ghS/t1Qsz0/fizV4+T+hK1vuPAjS/ovw+yZ1VZsSs6w
 RBuVeblnzv/iakNucWIAW/0hntGN6uuUchSMtaBa7d8+R6uHaXmtYau7wutf3ip32Lus
 mZ3yulh1I1sy8VbBjMukhp7m32DYDAZ3rASF7rB1TTaozywq4m++VOhajIS4orO3ac8y
 IAQ/2oVEtBR05/YyAJVP29tHcka1SjAJNk/ZQZ6D+Nwme3xElPF9ZyWDUpXPukCZXpC8
 D28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G0KZB43953rDZ9eEo49cyVU/G2AGYXUmxjvTZ9fuOiE=;
 b=FTjvOQLPsD2NIfK4SfrKIOQJczkbqjbq0rbo2qIsTr7z4zpLWFxIZpdtUW3EnfyOU1
 or8DwDY9ZJVBxPE+6A2gvVLUecO1B2Pqm4y1Yd7QS77ZVkxa6yVllRUhXxET5NOp45XE
 wsluJX0cpekKhdJKFnEw+2n9tEfyJy+nHAfM3j9SKWkgfTUfmppkI8fs+6tilVKHDT8h
 w+eZa+IgeqSOSDIvwiHfcy8y4zdehGYDmkREKehA2JWAao4VlUBb6IY+4z0Mh73Y03lE
 QGDLrcnv/ounPj7k6AKzK3T2yuYEYnIJgynZeuVIqx9Cq+7mu6YCPpFZ6jKBahN9xvE6
 7jNQ==
X-Gm-Message-State: AAQBX9cFgjZwRqHNyAyqV+1jn/iugi/luKDYeOlOhDBxpXD0HPNWQVKh
 8+HENJXro3wkoXfBnMIy8RqdzRiOCW0LX/HJAXk=
X-Google-Smtp-Source: AKy350ZCdTvJ5Qyqrowl6qosW0Msq8sRyClbKlZWpmvsMNq/LqofBoEyuETZBmRTuPKLOLRqi5BuNQ==
X-Received: by 2002:a05:6870:961d:b0:177:7dae:42e0 with SMTP id
 d29-20020a056870961d00b001777dae42e0mr44191oaq.58.1680804270604; 
 Thu, 06 Apr 2023 11:04:30 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:30 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 10/20] target/riscv: remove cpu->cfg.ext_e
Date: Thu,  6 Apr 2023 15:03:41 -0300
Message-Id: <20230406180351.570807-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Create a new "e" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVE. Instances of cpu->cfg.ext_e and similar are
replaced with riscv_has_ext(env, RVE).

Remove the old "e" property and 'ext_e' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c                        | 10 +++++-----
 target/riscv/cpu.h                        |  1 -
 target/riscv/insn_trans/trans_rvzce.c.inc |  2 +-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f082748569..33db4fa4b2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -831,13 +831,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         env->misa_ext_mask = env->misa_ext;
     }
 
-    if (riscv_has_ext(env, RVI) && cpu->cfg.ext_e) {
+    if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
         error_setg(errp,
                    "I and E extensions are incompatible");
         return;
     }
 
-    if (!riscv_has_ext(env, RVI) && !cpu->cfg.ext_e) {
+    if (!riscv_has_ext(env, RVI) && !riscv_has_ext(env, RVE)) {
         error_setg(errp,
                    "Either I or E extension must be set");
         return;
@@ -1150,7 +1150,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVI)) {
         ext |= RVI;
     }
-    if (riscv_cpu_cfg(env)->ext_e) {
+    if (riscv_has_ext(env, RVE)) {
         ext |= RVE;
     }
     if (riscv_cpu_cfg(env)->ext_m) {
@@ -1503,6 +1503,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVF, .enabled = true},
     {.name = "i", .description = "Base integer instruction set",
      .misa_bit = RVI, .enabled = true},
+    {.name = "e", .description = "Base integer instruction set (embedded)",
+     .misa_bit = RVE, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1525,7 +1527,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
-    DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
@@ -1644,7 +1645,6 @@ static void register_cpu_props(Object *obj)
      * later on.
      */
     if (cpu->env.misa_ext != 0) {
-        cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
         cpu->cfg.ext_v = misa_ext & RVV;
         cpu->cfg.ext_s = misa_ext & RVS;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 479b654d54..2b42de60b1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -422,7 +422,6 @@ typedef struct {
 } RISCVSATPMap;
 
 struct RISCVCPUConfig {
-    bool ext_e;
     bool ext_g;
     bool ext_m;
     bool ext_s;
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
index d75acbc4a6..a727169a4b 100644
--- a/target/riscv/insn_trans/trans_rvzce.c.inc
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -117,7 +117,7 @@ static uint32_t decode_push_pop_list(DisasContext *ctx, target_ulong rlist)
 {
     uint32_t reg_bitmap = 0;
 
-    if (ctx->cfg_ptr->ext_e && rlist > 6) {
+    if (has_ext(ctx, RVE) && rlist > 6) {
         return 0;
     }
 
-- 
2.39.2


