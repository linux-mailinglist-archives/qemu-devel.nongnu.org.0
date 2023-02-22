Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8326769FB82
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 19:53:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUuES-0007KJ-Fv; Wed, 22 Feb 2023 13:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuER-0007Jw-3U
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 13:52:47 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuEP-0004OX-LZ
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 13:52:46 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1724d65d002so4291980fac.4
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 10:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TEaF74M6WvRmSzL9d+AXXQnqIGKGvCuao150I2D5AIs=;
 b=ZDMKsiAAvihgzqCIvfpEUHWilzLu+NXOtDeutimPOOuoQNAJbpyudz0GWjR5291RxY
 Uqt3GPWoyayhWxuVx+nq8TNkhrcYzkt+A8rj1WD68sJvWjmcMjSB/EhqVV1OpczDXVNk
 0wdMQGgPOl8x4Ag2jQQKpEU7C9LlSmrEDgLwVa/MTmjwT6fTIZqimDlb3bEDeSn5ityh
 waA0ZQvNRNsqpfqZCloTeHYozIafiWvF2kUy3Y2N6DT0caBI+n7zen5q8bkWwUO2FA1U
 wU0eK7o3OJlmQVhnr8GZCcj0AIxvr7ITIMoQnxz5xLDsIhKPzRB1CrnuRmeuAD2GMOQO
 MJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TEaF74M6WvRmSzL9d+AXXQnqIGKGvCuao150I2D5AIs=;
 b=ObKKeDe0HTk7kbewMb1CdbwoOLsyFNEkbdloqqS5fDjEVr7abFjlPk1Z7YDGMt0frP
 FsXWueOmSfgHxcfn7nYA+KLZLxaL5yMfW79tvuD6lJX5i7/qA6tSWbsv5Kc4JlVG6E/B
 GBJMZO6syLEumLed0GoOuOoCqKeEpy7KAjKqHR0WbGyIYUDizfFdvstZ13+RgmuPv/p7
 fU+ILK68o+vfQ8xwHA6mmghvV+b88DV++GHfycUfI+H78KLd9N1pAcq3XVeHvJnvbCkW
 t9HbcuAxATTCfbhxZG6uCwOJ/L8anAPDipS7PEtwgSBG53RU57Kwt4bYsUQ/rRyxDUZ0
 8G0Q==
X-Gm-Message-State: AO0yUKU1fUBIrkomVTyzQB7LUAWiwZNkupweuM7btgsN02aCGf21oM+g
 J78onP6hRvfkCHWar/vNkZZDD9fNGwbawt0f
X-Google-Smtp-Source: AK7set+YlVpaxPtNZa9kFVj0Yz408D87QlJ9t6+vc3atYoQFSQMX4QOP8MwwdVH8ALJ/u3jZJpt5qw==
X-Received: by 2002:a05:6870:1494:b0:163:2804:596d with SMTP id
 k20-20020a056870149400b001632804596dmr10030801oab.19.1677091963876; 
 Wed, 22 Feb 2023 10:52:43 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a9d71c2000000b0068bcadcad5bsm1781111otj.57.2023.02.22.10.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 10:52:43 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v7 08/10] hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
 create_fdt_socket_cpus()
Date: Wed, 22 Feb 2023 15:52:03 -0300
Message-Id: <20230222185205.355361-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222185205.355361-1-dbarboza@ventanamicro.com>
References: <20230222185205.355361-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
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
2.39.2


