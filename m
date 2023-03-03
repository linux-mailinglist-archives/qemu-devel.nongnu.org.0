Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF236A92F4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:47:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0z6-0007p9-Ck; Fri, 03 Mar 2023 03:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yt-000795-DM
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:35 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yq-0007oi-Mt
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:34 -0500
Received: by mail-pg1-x52f.google.com with SMTP id p6so1060352pga.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832891;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ihpb4HVM2K+uGSZ8ovXkDuhXMAKAlLyH9A3iHU/y+Eg=;
 b=O+udFM3sKy7NeGyBZFyq2/7yQKT5QP/XF6DJcoM9ukpCQmNK3L/FmC57GGhg7+GuzU
 0+Am+M/0FzidyNo1dv3kqwBZtGG/iL6D4Al8o++in6G2Hu/I9fRM/eJfupXiDJ0ZVGPP
 +CWtYOdQb/Tc28wifW9zqVJc65IZwKq/yTYzvUWyHEF1wiCKq92iApicEgyabPi2Mbka
 ayHrFzEskxDR3tfvsv23nxpY9gmGBQOko16oLUUeIxFt8p4eBxAMs5TR67233SRvPJiH
 t5cj1Oon1iT+NdUYWbTioX+crNyIXXxTr+moQmOixGzcBiqWFbEVDQipJkdF2Oij5/Sx
 OPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832891;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ihpb4HVM2K+uGSZ8ovXkDuhXMAKAlLyH9A3iHU/y+Eg=;
 b=RNHtxVx+q/4IrSAx90qvT5sCTAdXsRrt5j+ANwxYFHK+cAYPvzhqojCyhnygQr0dgG
 rsRO0Q9yON0z69POELUTtNvdqs/AK2UlJ6fzj4WtF0IGfJzKuIyl+W7KPc0Il1fErDjx
 WB3IhOMfl7sYJgleUbwgIrKatz9d05WSyKfM+gb2/dOqgMiyHCDbrduBvhogNfBd2+Kh
 sxkkreOhGRXitSz/iWpT0Q2aFyXiTl1bf1+1+tO+SV7JZsvpJHnDzpxesyQCJNwl8xTf
 /jZ4PeTjNdEiQAtTziRyVnJVNEWEPXV8l4dglnO+jAByApQO3ZgvBLSQGP+npSd7XgmG
 kLnQ==
X-Gm-Message-State: AO0yUKWUIVD5JkoY0aU4IZdvz44xMZonMu+RctFFtD9b3kRab2yzLclf
 IFoy5HeIk+BUJLRKaZh/OONtmw==
X-Google-Smtp-Source: AK7set8iKpkV6PKnNxPs7PI+5oNnRxdOTiTQbXtqdMqKI3O4cw7GwOnkqoQPObdy6RDo/tkqFZm81w==
X-Received: by 2002:a62:6487:0:b0:594:26a7:cbd2 with SMTP id
 y129-20020a626487000000b0059426a7cbd2mr890934pfb.8.1677832891150; 
 Fri, 03 Mar 2023 00:41:31 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 e21-20020aa78255000000b005a8dcd32851sm1085526pfn.11.2023.03.03.00.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:30 -0800 (PST)
Subject: [PULL 08/59] hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
 create_fdt_socket_cpus()
Date: Fri,  3 Mar 2023 00:36:49 -0800
Message-Id: <20230303083740.12817-9-palmer@rivosinc.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=palmer@rivosinc.com; helo=mail-pg1-x52f.google.com
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

Read cpu_ptr->cfg.mmu directly. As a bonus, use cpu_ptr in
riscv_isa_string().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230222185205.355361-9-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
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


