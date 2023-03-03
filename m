Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4D46A9317
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:52:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0z0-0007UN-8V; Fri, 03 Mar 2023 03:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yv-0007Ed-22
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:37 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yt-0007pb-5c
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:36 -0500
Received: by mail-pj1-x102d.google.com with SMTP id oj5so1779380pjb.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832893;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MPDpcPiU9jbrwrbZWIjRMlGIFv8ed8SP93XpsmceXZA=;
 b=s266GqFHlgVqcvGFqqfRCTV032FbqtCZXjtmhmgtgLj4fyg88ZTXB5hvMQ7R1k5HHA
 r/H5CZFfaJ3rDQeuC6erAtPAv7HESioyXLD0KshpIvGU07qwyMl+UGBlWTc68rqWft1r
 VCOIumd3FcGBrVNdogXUPCjXVOF6ROopvSiMT3ag6aUBCNwz/ZI9FrRLOkUYH5oNSqr4
 2O6vbaWkMzfH8DIQYVdLa4GZZUl5wVdeyEDXixh3FaasmfgGnzlkI+BaSn+fpqb7+NtD
 CFyZfBB/lc8Gd1oKfw+0R4iuR3MigyxEukNNm61gAijGfbD8Heh29BIrKB3INfMlQL9v
 Ukmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832893;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MPDpcPiU9jbrwrbZWIjRMlGIFv8ed8SP93XpsmceXZA=;
 b=JkZJjhDYWo1Y+I9xhgQ/SaTIC/Jfilc0JyV47clAfpHovAOKzquA+5kiDA6xtAnpKM
 zxLiclRNCrfATpuxEBJNkj26CgS+2mwhVhiqzvAkmg4j65I84CxaX9kqf4g6+M5Swlau
 6vbVrymZxkoSyrrd4JK1kBMF8BC+zilEg1ddzwNM5xotcmEK7t+dwAv0jVfcKwxkHtMu
 vc1YPQHl+5hIPgTY4AWQPqHWxdlOH1ROJI8/IX+yzs9cKMGkRrY0gYYz0SOez3J1C4/8
 6jLa2xLVikkT7qgBj/t8tkvFtOjl80B57ItYe7ymRZatJFUIV/FSC90te5cDJhTon5wm
 xwuA==
X-Gm-Message-State: AO0yUKXCW9IMpXit0+ftuOgdYHJCUfHk+ZyOaxW1lZvzYzEw4HKMHUpJ
 FSthQfWEKEACHOsNXtedeTPXVw==
X-Google-Smtp-Source: AK7set+ADLXl2c5zfOXCz3b7RU06VCuXsXjdH+HZiRJpIPrQJFs2iJ31rdwRsMDfeuyONECIN1Rlxg==
X-Received: by 2002:a17:902:db0b:b0:19e:524a:657 with SMTP id
 m11-20020a170902db0b00b0019e524a0657mr1400547plx.56.1677832893650; 
 Fri, 03 Mar 2023 00:41:33 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 a8-20020a170902900800b0019ac9c9ce16sm969415plp.138.2023.03.03.00.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:33 -0800 (PST)
Subject: [PULL 10/59] target/riscv/cpu: remove CPUArchState::features and
 friends
Date: Fri,  3 Mar 2023 00:36:51 -0800
Message-Id: <20230303083740.12817-11-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Bin Meng <bmeng@tinylab.org>, 
 Andrew Jones <ajones@ventanamicro.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102d.google.com
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

The attribute is no longer used since we can retrieve all the enabled
features in the hart by using cpu->cfg instead.

Remove env->feature, riscv_feature() and riscv_set_feature(). We also
need to bump vmstate_riscv_cpu version_id and minimal_version_id since
'features' is no longer being migrated.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230222185205.355361-11-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.h     | 12 ------------
 target/riscv/machine.c |  5 ++---
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ac33362525..b9f69a134b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -175,8 +175,6 @@ struct CPUArchState {
     /* 128-bit helpers upper part return value */
     target_ulong retxh;
 
-    uint32_t features;
-
 #ifdef CONFIG_USER_ONLY
     uint32_t elf_flags;
 #endif
@@ -525,16 +523,6 @@ static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
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
2.39.2


