Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FFE6E8DEA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:22:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQU7-0000d8-21; Thu, 20 Apr 2023 05:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQU4-0000Vi-M9
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:21:44 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQU3-00074o-21
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:21:44 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-187b70ab997so3850536fac.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681982502; x=1684574502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r4Ti55fZmsYhQLe4LOvl6hR0lkFX2jcmI6dQjQEhJyU=;
 b=JUO8pvU8bWNkDBgCtZBSfbuZEnMeeHNWxlLkPa+1bx9R4HTj78PQ4WuFH+2cP4Imsr
 WPgczmG/kyjmt8VzOQuybfNnRD3yGG6IiNd4E3NIfka2H8lIoSIeTgvMhO2ojZIWidRL
 rAatdzu+HiIljayMfjU3IyvNHY3BEk42eULSqJgbNpsYgdUxWR8AZ59rqMhOxruxUnbk
 hwozWAUiUR8mukg2p8sunIyC2y4uKniIblrTNPcDh+KiHkSHJC1zSVtejQCXPzwWNuqF
 DbzVBZzUi1TEeUecidnKIXUEh+h5ZHPPD7qMHwNQ9O57fNBupmy9kQkJT3c8kF2Y++OJ
 05aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982502; x=1684574502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r4Ti55fZmsYhQLe4LOvl6hR0lkFX2jcmI6dQjQEhJyU=;
 b=lOxl/ycY+lz/oXnqPc0082X7gZO4yG5PyPpGWe+ntqI/t5ZkQA8tXnfhwTyMljJQ2o
 Fd3UBKSwBez3R/7FVd/mxCPAV6u4Q9WkQrs0ClNYSGqecTAt1u2X6ZiOWK0JW8JfYuie
 KPker6ssKTujHqVso41eEZwhIg3pcRbRlQDO7Jdp1MK9/39Uiy5jdWSZMaoTvb5CJDmL
 01CWF92n06PFAC91x89r3dd8OfmSPMxSPJUH8EW1TXw6qoU7QR4dbhtfhzj84FW1h1Qq
 Rz7WxhnJZZkHsoc7VY3+9xKT9bqHTouIgAHTr+imsTqdPly5/faEiE5Ve9JzDhy7INxb
 U7tA==
X-Gm-Message-State: AAQBX9fUnehrdgwmkOwf+GVwAjNk4w8WLMbjVLj3TIwtJ4mZoMAGlZ8c
 idZzb5FgyKcml1HH/tQj7O5YRE3nRlBn5ybRKDY=
X-Google-Smtp-Source: AKy350ZtgQ9NUAe/tU0Tj1MRbLgkEm20NcjYOp6+HDzJ7c2eDPgt0mglEx3TJYLSYvVoSh36cZqWsw==
X-Received: by 2002:aca:ba0b:0:b0:38e:295b:2e18 with SMTP id
 k11-20020acaba0b000000b0038e295b2e18mr2887084oif.4.1681982502009; 
 Thu, 20 Apr 2023 02:21:42 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a056870e74100b0017280f7d653sm529668oak.35.2023.04.20.02.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 02:21:41 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v7 12/12] target/riscv: forbid write_misa() for static
 CPUs
Date: Thu, 20 Apr 2023 06:21:00 -0300
Message-Id: <20230420092100.177464-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420092100.177464-1-dbarboza@ventanamicro.com>
References: <20230420092100.177464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Static CPUs don't want their extensions changed by user interaction. We
can prevent it during init by not exposing user facing properties, but
write_misa() is also capable of disabling/enabling extension during
runtime.

We have a way of telling whether a CPU is static or not by checking for
TYPE_RISCV_DYNAMIC_CPU. Use it to make write_misa() a no-op for these
CPUs.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 2 ++
 target/riscv/csr.c | 5 +++++
 3 files changed, 12 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4fa720a39d..3cbcf6d320 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1452,6 +1452,11 @@ static void riscv_cpu_init(Object *obj)
 #endif /* CONFIG_USER_ONLY */
 }
 
+bool riscv_cpu_is_static(RISCVCPU *cpu)
+{
+    return object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_DYNAMIC_CPU) == NULL;
+}
+
 typedef struct RISCVCPUMisaExtConfig {
     const char *name;
     const char *description;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1f39edc687..1913ab9d8d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -587,6 +587,8 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
+bool riscv_cpu_is_static(RISCVCPU *cpu);
+
 #include "exec/cpu-all.h"
 
 FIELD(TB_FLAGS, MEM_IDX, 0, 3)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d449da2657..929c5477dd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1391,6 +1391,11 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     uint32_t orig_misa_ext = env->misa_ext;
     Error *local_err = NULL;
 
+    if (riscv_cpu_is_static(cpu)) {
+        /* never write MISA for static CPUs */
+        return RISCV_EXCP_NONE;
+    }
+
     if (!riscv_cpu_cfg(env)->misa_w) {
         /* drop write to misa */
         return RISCV_EXCP_NONE;
-- 
2.40.0


