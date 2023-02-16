Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FBE6999DF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:23:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSh1M-0000Rz-V3; Thu, 16 Feb 2023 11:22:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh1F-0000OU-Ks
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:22:03 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh1E-0006UE-0e
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:22:01 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-15ff0a1f735so3110620fac.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GvaH81B5hBrpGPqem9kaUkSdCiGN0le0jCxW0/4CJJg=;
 b=E7OJbtq9YQyCvo5gnaNMZ0nr1lMKzUU/f4ohf0M9qx7BAttBfZGOeMPaQIKr9Eq2tg
 IIOeytZK/CHU1dw/rs5pTm864Hnhi7sy2WynqG3fIY5fwCMHn+XKnX9s7s4awND+UpbC
 zp9n/dFf3fQCpCUDfAlCyCjH1ZouvO2KRQMJdGYSV2xX5QGUSZYGsUZ3cdCZNMJmYE9f
 +JC3nqHsSd9u072BCMhYPxJBy6mEOWDR/NF/nhZBlXw2+0P55FnYbPPJaw1ar/31Ryg1
 d57zIQHb3b3mYSiJvv1s71BB2REJKwuCvgwKgFawlspJPii/jW/UiAcazZ6CAePcIpBq
 0gNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GvaH81B5hBrpGPqem9kaUkSdCiGN0le0jCxW0/4CJJg=;
 b=VpO9C1m5eyeamaVc5OJmh9DxKgC4kH/rkAG2q5AsQnLv2JvQL6QpOsdBXsxgzXhw49
 Cn1EfaEi83thfOb4DVnaaA/QSk7LEpk400KpqusEpmcxXrkMXUL0lFs4LjhKtT6bFLGn
 +3Cs2uRSsSy3UoHuY/z9RdKKQtk9KnR5SYP0cfvCb7Sx07YKK8MDWCz+r8GggjovBMdC
 8Ay8HCGvCqEgikL68tXiTd3ge/uSy4ZLQBWfek43e55Hjb21cBZXcwU1ByIKOfAnj8xi
 EnGbcPCFudm5SHoxgRtZBjoHxYC3BcTBeuv2usHNPJmXL8RMbuKvMzi4eXmXkIe7lDIs
 v9hQ==
X-Gm-Message-State: AO0yUKU3gh1Dt4wXdhvzsTTy+uZCYIF0W0Nu86oSLG/vkUGcCvcMJkPi
 7jgpWAUP52xiIPHZo1eP5G66fATYvLAdKvTV
X-Google-Smtp-Source: AK7set+Q2NU5jFXq2+4IavOL9jdUQFbS/y4/fkMlA9IwMXdFda/G8vdgL2bO1O7mGpwuwVAJkBCGAg==
X-Received: by 2002:a05:6870:e305:b0:16e:11f0:79e9 with SMTP id
 z5-20020a056870e30500b0016e11f079e9mr3352972oad.18.1676564518994; 
 Thu, 16 Feb 2023 08:21:58 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a056870e15100b001600797d1b5sm693029oaa.41.2023.02.16.08.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:21:58 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 9/9] target/riscv/cpu: remove CPUArchState::features and
 friends
Date: Thu, 16 Feb 2023 13:21:26 -0300
Message-Id: <20230216162126.809482-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216162126.809482-1-dbarboza@ventanamicro.com>
References: <20230216162126.809482-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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

The attribute is no longer used since we can retrieve all the enabled
features in the hart by using cpu->cfg instead.

Remove env->feature, riscv_feature() and riscv_set_feature(). We also
need to bump vmstate_riscv_cpu version_id and minimal_version_id since
'features' is no longer being migrated.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.h     | 12 ------------
 target/riscv/machine.c |  5 ++---
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7ff4d90261..671734420b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -173,8 +173,6 @@ struct CPUArchState {
     /* 128-bit helpers upper part return value */
     target_ulong retxh;
 
-    uint32_t features;
-
 #ifdef CONFIG_USER_ONLY
     uint32_t elf_flags;
 #endif
@@ -524,16 +522,6 @@ static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
     return (env->misa_ext & ext) != 0;
 }
 
-static inline bool riscv_feature(CPURISCVState *env, int feature)
-{
-    return env->features & (1ULL << feature);
-}
-
-static inline void riscv_set_feature(CPURISCVState *env, int feature)
-{
-    env->features |= (1ULL << feature);
-}
-
 #include "cpu_user.h"
 
 extern const char * const riscv_int_regnames[];
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 67e9e56853..9c455931d8 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -331,8 +331,8 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 6,
-    .minimum_version_id = 6,
+    .version_id = 7,
+    .minimum_version_id = 7,
     .post_load = riscv_cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
@@ -351,7 +351,6 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT32(env.misa_ext, RISCVCPU),
         VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
         VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
-        VMSTATE_UINT32(env.features, RISCVCPU),
         VMSTATE_UINTTL(env.priv, RISCVCPU),
         VMSTATE_UINTTL(env.virt, RISCVCPU),
         VMSTATE_UINT64(env.resetvec, RISCVCPU),
-- 
2.39.1


