Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879FB699527
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:06:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdx7-0004Tz-6y; Thu, 16 Feb 2023 08:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdww-0004QK-RU
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:05:22 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwu-0002FV-JA
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:05:22 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-15f97c478a8so2376507fac.13
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rhjy4ZuFr2J/YQsYfjypiNp1FTwn/nVolIeKKoKX5g0=;
 b=ojPAbb5G93ZpFTO5nAompoxnSBCg6hpGvRUYFbQ83iAhT3NxnAff99RPPb+y4k7znp
 5UaTplX1t1cGk6HahVAmdMtD1IKTFS0yLFNWxZ+gZ4nmH1CcVw2ncjzqeivsDNdKNFZJ
 wBDtQwwt7vvANWXnkKjKxoaeg/ybOhf4rrbCZyk0YU6VzStBSRy0lTG2SQhdupOgXEdq
 n6hjnNMpxEyQxwNZPo+hbg0xNpgZ1+VdD5LsIsNlrHSn6FzmJT/XCFLbfmTskxf7szL6
 A4gUlwJQ4ZVP+3tEZwTmrQC625/Cp3iboCgQgkhyvy2FFFCrjEA8V2azb0LQS+X+6EqR
 U70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rhjy4ZuFr2J/YQsYfjypiNp1FTwn/nVolIeKKoKX5g0=;
 b=ozTuderdiuFPAOFf5XZbdIJMswYJ0WRltZixLTTX11sKcXBsHwBuseqMJ/PI0O4bBF
 ojod9ZmFKS4EtGbJe8llE6RTC9ip6I5mMGj1Nt8HGHANd8mPuDlvZ8tz57U2qSS3YHY1
 XYwmX9Oyz5gx/GU++rQBaGZX2m7ogLHkaexlkDkATsrOZp/4GcPlkFFGx2QpxCfUqczk
 FcTh8UFttDuvvlAhM3DKnISoHMv7f8Ac4sM7jbcnPg3xiYN+YGrwulmU+fN2YgB4W6WI
 v2bMD4+vCwyafE+3wCq96Dy7mllRSQV5AOLaVQe/WjOrUkRR+PUjck7upz5ogUataH2f
 S7TQ==
X-Gm-Message-State: AO0yUKU6KSuDpd6oH08Q33SP7rncmNgL5E8m2YJkORKFtRadNdE637Jw
 mSbW2rWQRukmjibdoFfiCDSYFQ9SFq/wCBQl
X-Google-Smtp-Source: AK7set94LQev3fimvrZwLMQNNg+oWY1lZu9uiqFhmc1zO6RPvcPnzZMo9GB2x0tl/y6/mcprx9x4dQ==
X-Received: by 2002:a05:6870:1708:b0:16d:bbb9:9693 with SMTP id
 h8-20020a056870170800b0016dbbb99693mr3212199oae.57.1676552719096; 
 Thu, 16 Feb 2023 05:05:19 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c74-20020a4a4f4d000000b0051f97e8a1d5sm594315oob.35.2023.02.16.05.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:05:18 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 08/10] hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
 create_fdt_socket_cpus()
Date: Thu, 16 Feb 2023 10:04:42 -0300
Message-Id: <20230216130444.795997-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130444.795997-1-dbarboza@ventanamicro.com>
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
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

Read cpu_ptr->cfg.mmu directly. As a bonus, use cpu_ptr in
riscv_isa_string().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 86c4adc0c9..49f2c157f7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -232,20 +232,21 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     bool is_32_bit = riscv_is_32bit(&s->soc[0]);
 
     for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
+        RISCVCPU *cpu_ptr = &s->soc[socket].harts[cpu];
+
         cpu_phandle = (*phandle)++;
 
         cpu_name = g_strdup_printf("/cpus/cpu@%d",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_add_subnode(ms->fdt, cpu_name);
-        if (riscv_feature(&s->soc[socket].harts[cpu].env,
-                          RISCV_FEATURE_MMU)) {
+        if (cpu_ptr->cfg.mmu) {
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


