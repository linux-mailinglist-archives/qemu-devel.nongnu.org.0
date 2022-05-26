Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AD65355BC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:41:29 +0200 (CEST)
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLEX-0003I1-0p
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLBk-0000RF-RJ; Thu, 26 May 2022 17:38:36 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:41718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLBj-00083g-4l; Thu, 26 May 2022 17:38:36 -0400
Received: by mail-oi1-x233.google.com with SMTP id e189so3638331oia.8;
 Thu, 26 May 2022 14:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=imql0qNKHKBsnAZW2/cMn5l+lNp/68hJx+XCNH1PT5g=;
 b=hgram8tPyBXhzCN7sK2EXkZazUorBtMszRBdN5z9eAaJxvZAi4/+j2LWWJiRfAjMSF
 iKRsf1xCc6wSj4XcwFVIR4Df/QwJLtJgLtF8m1T1dKtRo/TAXydNdiRgAtuaFbpNX0TL
 alyeA3v1Cfx3Seh5ZTp1jphjvKtDLrK4dUI6F8SxL7wef6A9qS+1uxCxHVpJsJXJKHqN
 c7awkp40pOcGPyYRcuSo84TaL8WUAmn9nsfB/9c5OJa7hMpOzcohIR8sBkSkgfPx1xIV
 A+I28qULNHht0ZcI5cyaAGsezuy921thmS8xlUbYZGOwls2e4bVrwMaCUCETu+ofoP6p
 +GcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=imql0qNKHKBsnAZW2/cMn5l+lNp/68hJx+XCNH1PT5g=;
 b=b5Uh+VU1PXkEASrIZZZXmG0sMPvQD3dCftIYgxQvCinoMq1NPTDDIPauHplEa/6CnT
 BbkLIB1wdcTIVJuYGFF1dY+HXZO7cDU1X7oA7W/VZlWnFEjk6NzpyrU8cB2hBeh0852w
 MtWrUVqe9cRYhQuzVxZ+jMrNSxRvqBClqbzvk4TcqhbwRAT71gnEMXDkmuit+HbzaUol
 1Bz6jCGHRZ7td6Z75PODPTgAkwGXQ2mfKcrznFSScUyQoS/3kKfl9RPJ3UZ8ReyTyVE+
 BNpbRR6IYQoWcUr2h0cki2cVXY1Pao5ef8blgqpQWp6/63P56biRUMfpTcwoievzaDvD
 Rx/A==
X-Gm-Message-State: AOAM533ptQW/2ZQeitE8qSHhL9PmE762TpFRBvU0Ug6LGhUBJCHYnTYx
 hMCmqf0PGlKSPB2AM3axZWl0OpIWIkA=
X-Google-Smtp-Source: ABdhPJxKAw773W279WeZGh2AdvbYYtCeDxPi8WsJLRS0qWaSJWO2jZxM9T8J8G7G/fimssJzGl//6w==
X-Received: by 2002:a05:6808:3087:b0:32b:4961:3bc6 with SMTP id
 bl7-20020a056808308700b0032b49613bc6mr2273504oib.251.1653601113586; 
 Thu, 26 May 2022 14:38:33 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:38:33 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 01/34] pseries: allow setting stdout-path even on machines with
 a VGA
Date: Thu, 26 May 2022 18:37:42 -0300
Message-Id: <20220526213815.92701-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

-machine graphics=off is the usual way to tell the firmware or the OS that the
user wants a serial console.  The pseries machine however does not support
this, and never adds the stdout-path node to the device tree if a VGA device
is provided.  This is in addition to the other magic behavior of VGA devices,
which is to add a keyboard and mouse to the default USB bus.

Split spapr->has_graphics in two variables so that the two behaviors can be
separated: the USB devices remains the same, but the stdout-path is added
even with "-device VGA -machine graphics=off".

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220507054826.124936-1-pbonzini@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c         | 12 ++++++++----
 include/hw/ppc/spapr.h |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6de800524a..d112b85b4f 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1066,7 +1066,7 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
             _FDT(fdt_setprop_string(fdt, chosen, "qemu,boot-device", boot_device));
         }
 
-        if (!spapr->has_graphics && stdout_path) {
+        if (spapr->want_stdout_path && stdout_path) {
             /*
              * "linux,stdout-path" and "stdout" properties are
              * deprecated by linux kernel. New platforms should only
@@ -2712,6 +2712,7 @@ static void spapr_machine_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     PCIHostState *phb;
+    bool has_vga;
     int i;
     MemoryRegion *sysmem = get_system_memory();
     long load_limit, fw_size;
@@ -2950,9 +2951,12 @@ static void spapr_machine_init(MachineState *machine)
     }
 
     /* Graphics */
-    if (spapr_vga_init(phb->bus, &error_fatal)) {
-        spapr->has_graphics = true;
+    has_vga = spapr_vga_init(phb->bus, &error_fatal);
+    if (has_vga) {
+        spapr->want_stdout_path = !machine->enable_graphics;
         machine->usb |= defaults_enabled() && !machine->usb_disabled;
+    } else {
+        spapr->want_stdout_path = true;
     }
 
     if (machine->usb) {
@@ -2962,7 +2966,7 @@ static void spapr_machine_init(MachineState *machine)
             pci_create_simple(phb->bus, -1, "nec-usb-xhci");
         }
 
-        if (spapr->has_graphics) {
+        if (has_vga) {
             USBBus *usb_bus = usb_bus_find(-1);
 
             usb_create_simple(usb_bus, "usb-kbd");
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 14b01c3f59..072dda2c72 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -194,7 +194,7 @@ struct SpaprMachineState {
     Vof *vof;
     uint64_t rtc_offset; /* Now used only during incoming migration */
     struct PPCTimebase tb;
-    bool has_graphics;
+    bool want_stdout_path;
     uint32_t vsmt;       /* Virtual SMT mode (KVM's "core stride") */
 
     /* Nested HV support (TCG only) */
-- 
2.36.1


