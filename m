Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E248666189
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 18:16:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFecM-00032I-RZ; Wed, 11 Jan 2023 12:10:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFec2-0002i8-Oa
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:10:07 -0500
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFec0-0006A7-GB
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:10:05 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 x15-20020a4ab90f000000b004e64a0a967fso4200968ooo.2
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 09:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DPONLIzIEy/3UQV9VjMXIl8RnUsRqK9vSoHXVRNeILc=;
 b=o4RMcKEM7PDjq66qO5ILPI4+50kxiFwI1Qe7/NK+PYZwMwomH1BdDsFsViq2FyUc7E
 59G+XFjDpG5hRBhzORLsWsAD/FCVQ4mXTU6yuy/BoiuljzNNLZSfPrJU6FeWoL+MLdqe
 edOkc/X+gDqDkGCoOViLmIHU3k4XDVt01N5GawsbHz6sYp4GkiLrx/k28wd3hd90/+lW
 gGuYrPN4cLBXRfWXnF3zTDH1BiRD3FTrNccU4ucWBUxuu0QLfJvgJpRgpT6qcEaQBtbX
 Bs6WypDDjtA6P0jxh/3F8hFl2KIRhCOoeK13wcycemwIQewBbdjkQO9JBmACeopw4JLi
 Vzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DPONLIzIEy/3UQV9VjMXIl8RnUsRqK9vSoHXVRNeILc=;
 b=O9HwbJyguaAMzH69bYUaWENRWW7urlOz3mJPnEKHI51riuySsd1/0k5AB0lHMe4zeR
 n0IQlpNQi1Hg69BsvAEIl3fiaeBHSpzRaL0RxfwpGscdrAswJASsVW+AVw9njdVeI0oJ
 ukJJrHUTVxEQt6XbJisawjrIUkbTrc7Erzuriz3jOZ38Y3UTwSPNEF6jGj7kN6i3sXjx
 /VtN6wXZzpkdr4cKhIyHP0ZkqvLbLfEnyqiY1z8vCtN7azlqvSubJNNIMGJ34YkYs35A
 jE2FD9bSVocBNI6KuPJeNVFIZF12XRVEvyM2BC3jsxts8tbnSEH2qktupNTzL6wOPLT4
 fecA==
X-Gm-Message-State: AFqh2kqbN/1b0vA7lvTtA+vOKwpDquOU4O9U74x4p7jIlcrDSMxIdEsc
 dG1B/TAVBIlF1cM2sLd3yb3zKT4k8Z9xJZbYEVU=
X-Google-Smtp-Source: AMrXdXtkfl4QADQqITJKwHm1S6GlYPwmAjvPaTnw/pJumAF+OIalE1qpkaIG700gZO40KIBXte7erw==
X-Received: by 2002:a4a:dbd8:0:b0:4a0:bc7f:462c with SMTP id
 t24-20020a4adbd8000000b004a0bc7f462cmr31480242oou.9.1673457001365; 
 Wed, 11 Jan 2023 09:10:01 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 x18-20020a4ac592000000b004a3543fbfbbsm7214974oop.14.2023.01.11.09.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:10:00 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 03/10] hw/riscv/sifive_u.c: simplify create_fdt()
Date: Wed, 11 Jan 2023 14:09:41 -0300
Message-Id: <20230111170948.316276-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111170948.316276-1-dbarboza@ventanamicro.com>
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2c.google.com
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

'cmdline' isn't being used. Remove it.

A MachineState pointer is being retrieved via a MACHINE() macro calling
qdev_get_machine(). Use MACHINE(s) instead to avoid calling qdev().

 'mem_size' is being set as machine->ram_size by the caller. Retrieve it
via ms->ram_size.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/sifive_u.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 9a75d4aa62..ccad386920 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -94,9 +94,10 @@ static const MemMapEntry sifive_u_memmap[] = {
 #define GEM_REVISION        0x10070109
 
 static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
+                       bool is_32_bit)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
+    MachineState *ms = MACHINE(s);
+    uint64_t mem_size = ms->ram_size;
     void *fdt;
     int cpu, fdt_size;
     uint32_t *cells;
@@ -560,8 +561,7 @@ static void sifive_u_machine_init(MachineState *machine)
                           qemu_allocate_irq(sifive_u_machine_reset, NULL, 0));
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc.u_cpus));
+    create_fdt(s, memmap, riscv_is_32bit(&s->soc.u_cpus));
 
     if (s->start_in_flash) {
         /*
-- 
2.39.0


