Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBDB67B6E3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 17:25:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKiaQ-0004Sb-Cc; Wed, 25 Jan 2023 11:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKiaO-0004Rd-3S
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:25:20 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKiaM-0003hT-AD
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:25:19 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso1605256wmn.5
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 08:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRWvpmPRHrukoIwIrFR+ERY535b3mU7yJB9xTFeVSNc=;
 b=u8xwkJQ431YoZL9zTSlf1eOJDtGIIjBweMr0a8u+YXfX2JbFXYaVombwMOQtNTclrS
 rCxXTpNygppUn8EWX/RbGRg9CtoJx8QupG2lK5SW6Jus4doSs3SalFuUs85N+IaXq7Ko
 O9lwFKWLfNM2hpWOzSLyenqpiIYX7etVFy/X74tjRzHWdOfuNXQPgMK1b8zeQm7ng1yG
 9MWZ9YuRq+CS+ybjJw7+5QpP2WA8gvIsKq09u4hGpIoGnc8Sej1CdO3cuuAH5TrBMbaS
 4NmF0itFzGiS2serzNBCfauGGIglJHRFlwZwiypG08qSKxwHuuJtF8Pq7kZfPeVqyw7K
 nlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IRWvpmPRHrukoIwIrFR+ERY535b3mU7yJB9xTFeVSNc=;
 b=ACSlAILsVLYQw1HwyGz6S3POfW4PKtIvYvXqOrgrazVYdf0rHjDGVzGkm64HANzz0u
 OCt4y8BZszOkTATs0jQJkBXf2y+Kls4tP3lQvimHfg+6+GPR9+uK102ErIUQLsJ4hbRT
 zG9nMDo4+5h9yoCg8L+QY97ipqaTF/Pb/UIe55vTA4iJdly6AfivvqJFR4vW7y9IXJ6A
 P0MMXraMWzhtu7O4yd31ID2AHGeL7jIr7DykXQUAqnSNANX0l7u8k33SpapNNYEJCpnh
 PIK1PuOJWM8HZIRxag3HiGKXBBmFZPbSIf3eDfJcd9WbzAqPIo7XGtKr8Mmx/GAqQ+Df
 ZxMQ==
X-Gm-Message-State: AFqh2kq8lmcShPXaYh2dGOWdt+Qga2oNyIFmpGvHt6DPwY4wIIMvupAA
 0J6RXkAIU/X3es/U4ygidx/UDA==
X-Google-Smtp-Source: AMrXdXt93mW9IbCg+gH994ue2/kTMRkVjJ6YCxiJpQvjqNbQnGrZSUTGjvCz4nq4ypH7/yfIC1UvJg==
X-Received: by 2002:a05:600c:54eb:b0:3da:2090:d404 with SMTP id
 jb11-20020a05600c54eb00b003da2090d404mr32770630wmb.18.1674663916789; 
 Wed, 25 Jan 2023 08:25:16 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr.
 [2.7.42.160]) by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c12ca00b003d9df9e59c4sm2180076wmd.37.2023.01.25.08.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 08:25:16 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v8 5/5] riscv: Correctly set the device-tree entry 'mmu-type'
Date: Wed, 25 Jan 2023 17:20:10 +0100
Message-Id: <20230125162010.1615787-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230125162010.1615787-1-alexghiti@rivosinc.com>
References: <20230125162010.1615787-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The 'mmu-type' should reflect what the hardware is capable of so use the
new satp_mode field in RISCVCPUConfig to do that.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 94ff2a1584..48d034a5f7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -228,7 +228,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     int cpu;
     uint32_t cpu_phandle;
     MachineState *mc = MACHINE(s);
-    char *name, *cpu_name, *core_name, *intc_name;
+    uint8_t satp_mode_max;
+    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
 
     for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
         cpu_phandle = (*phandle)++;
@@ -236,14 +237,14 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         cpu_name = g_strdup_printf("/cpus/cpu@%d",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_add_subnode(mc->fdt, cpu_name);
-        if (riscv_feature(&s->soc[socket].harts[cpu].env,
-                          RISCV_FEATURE_MMU)) {
-            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
-                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
-        } else {
-            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
-                                    "riscv,none");
-        }
+
+        satp_mode_max = satp_mode_max_from_map(
+                            s->soc[socket].harts[cpu].cfg.satp_mode.map);
+        sv_name = g_strdup_printf("riscv,%s",
+                                  satp_mode_str(satp_mode_max, is_32_bit));
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
+        g_free(sv_name);
+
         name = riscv_isa_string(&s->soc[socket].harts[cpu]);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
-- 
2.37.2


