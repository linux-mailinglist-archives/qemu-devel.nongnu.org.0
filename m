Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD71F699F87
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 22:57:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSmEw-00037H-0u; Thu, 16 Feb 2023 16:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSmEu-00036a-4I
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 16:56:28 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSmEr-0001we-HV
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 16:56:27 -0500
Received: by mail-oi1-x22f.google.com with SMTP id j3so1678447oig.10
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 13:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SRUSnKQk8SFmtXGFiuLmHMMhVwT2fGCY0f0QzILH7/c=;
 b=VCy2t9M0qP5TJEVywngP53PsAfs4+UFWUonwYPvPdruay5lhLn/nID0on7FvQhFziT
 p7Sn9zt806QRWv/IBXRmoVj4viLt5CVi96eHkQbF1zS0rq74oHIKGBFHCVAYHv0nSTIZ
 KW9Qfcr5QKeMFN3KDpXWRieqGnAxqdK1vjnIu5SuBFX4jMnnURq1ZHj1trfFqjB0dtMC
 YD2uTJMUhAV9en5cJzUibdY4ywXAnEw0+UaTG5XTlYOE6sOax5hZgXw2jcJcdwkVzuAF
 YJYoWev7O7NkvwES/LWaRalhpSI0IoZbOY+jfNnjCiY7yD58j9Hc7cUILgqMPBTzxDvo
 /J9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SRUSnKQk8SFmtXGFiuLmHMMhVwT2fGCY0f0QzILH7/c=;
 b=kH7hEW+4NeuvZkN/dS3PeXo5qpJlAaBztMOp7nf9nTBiGs8CmAkiOy5eqBXuNmONvp
 M9rHTLiaY/EfCjI21LAVA87MQb0CvFoSHgEI7qjNZt+XmXk732TXclKvTOO/+4HC/K2Z
 RxFqHCKZzAksmr0AVozYA6dAMkh3EhxjpmQ8rPWJ56+p7pcwXnIgZ82Xs2sb+YCsMceH
 +NO9WhVMnIxuXB+aLPYmMnZQ46jC5A7ga33i8Qx6np0PVfx+k9mFDp/IVQ82Wae7ty1w
 zvdtrV+e71LEM/Bh/eYtB4e9HwC/7klWrCReunNblXUb7UYkWKFLjjXvjwSCt5ZZJ9C5
 JS/Q==
X-Gm-Message-State: AO0yUKXJTItubM2/hJrN2KujdpWV6FTTLQCXvbFB4gDx7/m5xYs4TrxL
 zaP65X3e0ze078zDBtTh2VtHPW64SNBbfaDD
X-Google-Smtp-Source: AK7set/N9C5dCSDO7esr1zlgTH9dFnjMXxGHYMNCO44N1QEX/XI9eqIynfgYbFxyuigpVxGr0bswyA==
X-Received: by 2002:a05:6808:6da:b0:378:5987:6df8 with SMTP id
 m26-20020a05680806da00b0037859876df8mr3144588oih.52.1676584584545; 
 Thu, 16 Feb 2023 13:56:24 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 i132-20020acaea8a000000b0037d7f4d0890sm1047570oih.26.2023.02.16.13.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 13:56:24 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 9/9] target/riscv/cpu: remove CPUArchState::features and
 friends
Date: Thu, 16 Feb 2023 18:55:50 -0300
Message-Id: <20230216215550.1011637-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
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
index 0519d2ab0c..9897305184 100644
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


