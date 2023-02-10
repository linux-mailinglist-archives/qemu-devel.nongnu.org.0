Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CBB691FDA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:37:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTaL-0005RO-DN; Fri, 10 Feb 2023 08:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTaJ-0005Qi-CN
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:37:03 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTaH-0007Vp-J5
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:37:02 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-169ba826189so6692135fac.2
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rd0sfU48r7B/1dLMwAOrTjGjXHv2cDDzuCYw8TbIdE8=;
 b=XVrU42lLLKj+7mXZ2ChQ3DgO6QjrzEY836MWlmmJEdN5NNbsmtTYSEJP3vWSZp1enj
 cy4yB+5bauW/ScUzKNXggpSPLvErG9htPA+Ji1E4hoagNY4C2HyUzW1rjeQbXG5B+uRa
 CeM+eNsPQPcIVo1U13tm1G4/AoduqY84HyTd4XeLQmLquyOlvyWwjLddcWVd6tH9ywFN
 kzNUDGDtaK6mw2RnSVzEwKY2Lplk2SY7RNbGX1Ou/nrah2f5S0es2xecOGrob0cFtZH8
 Z04INnGOZ4ZLihj4F60Jud2sA2b3aFsTMR+EfekIr+ZlZKquKhS8Ea6xy+kGT4ljhHr0
 uHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rd0sfU48r7B/1dLMwAOrTjGjXHv2cDDzuCYw8TbIdE8=;
 b=XRgXZUsESwKB+swYvMeu8eNHVjh62Ru7k0BzExLB1lv3e4qWdkqr8IuU9nNImRuWcM
 zIkt6COXXps8XuJb9MIoU0Lf54ElFRa4f3GrLXMHY4N5f5zhpDgSPZTptRKahfXPll0d
 buzlVzKtecDIJncCaauf1scp3imyrkguee7ysAt9ZiSMlnt+HW6rRp1YIiBaX1/+N+6R
 OQEPFeP/WDaWSLT9Ybytbuog+b6omOdAJM0fc4bDdAaX07QdAeg7LEkNYzFSv2rfL4VH
 pkxOswFbjgGtERm08uWY2LKfKF8gwq3RdytmnsPWtrgfsjVRaCjg+KDW2ue335vgIwVm
 ycWQ==
X-Gm-Message-State: AO0yUKWzdxLUQn2Qs/L3ibiuCaE6pUpmlUvV4Orz43sltQgTLEoUbmeq
 E6WT1mWmIbzCZ53Q8vp4c8zgyG7VvWYsOGwB
X-Google-Smtp-Source: AK7set+r09SLwNHLNZ2HEJyJ1riLvQ+ESAl4q4kwg3SvTa6a/BF+KMGXzROf6CUzIjWsQ8ghWjSmVQ==
X-Received: by 2002:a05:6870:64a3:b0:16a:cdaf:4739 with SMTP id
 cz35-20020a05687064a300b0016acdaf4739mr2302051oab.5.1676036220598; 
 Fri, 10 Feb 2023 05:37:00 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a05687050e400b0014474019e50sm1890570oaf.24.2023.02.10.05.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:37:00 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 09/11] hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
 create_fdt_socket_cpus()
Date: Fri, 10 Feb 2023 10:36:33 -0300
Message-Id: <20230210133635.589647-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210133635.589647-1-dbarboza@ventanamicro.com>
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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

Read cpu_ptr->cfg.mmu directly. As a bonus, use cpu_ptr in
riscv_isa_string().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 86c4adc0c9..8ab6a3ec16 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -232,20 +232,21 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     bool is_32_bit = riscv_is_32bit(&s->soc[0]);
 
     for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
+        RISCVCPU *cpu_ptr = &s->soc[socket].harts[cpu];
+        RISCVCPUConfig cpu_cfg = cpu_ptr->cfg;
         cpu_phandle = (*phandle)++;
 
         cpu_name = g_strdup_printf("/cpus/cpu@%d",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_add_subnode(ms->fdt, cpu_name);
-        if (riscv_feature(&s->soc[socket].harts[cpu].env,
-                          RISCV_FEATURE_MMU)) {
+        if (cpu_cfg.mmu) {
             qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type",
                                     (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
         } else {
             qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type",
                                     "riscv,none");
         }
-        name = riscv_isa_string(&s->soc[socket].harts[cpu]);
+        name = riscv_isa_string(cpu_ptr);
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "compatible", "riscv");
-- 
2.39.1


