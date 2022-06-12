Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A68C547BBA
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 21:30:09 +0200 (CEST)
Received: from localhost ([::1]:47586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0THj-0007zw-RE
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 15:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o0TFx-00073d-Ng; Sun, 12 Jun 2022 15:28:17 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:36730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o0TFv-0006dC-Vd; Sun, 12 Jun 2022 15:28:17 -0400
Received: by mail-ej1-x641.google.com with SMTP id s12so7361866ejx.3;
 Sun, 12 Jun 2022 12:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=32C84MgkT+e7b4732NZR1h3JkIJSDHIcnreZhE8Icl0=;
 b=dSdCJMghtU7OEd2b0QQlX+u5kxwQN26AcdNM09tWWpSSJ79Yh4S8xcBvH+1SFauzp1
 LgHDn18FToWtlLHNBSI1hcrd3cov90BjZFSYJ0+bIwN4c4FYXxSkKHuUDzhz5t49uZwy
 zLEvno3JPpUi4M12hkkX+8rlIJlytPxVf+M+Thnl4m2YfaedJzXyMFWrTn3qAHlGCPyI
 jfk77UKpu9SqIX+IP85VXcnFyW+6iIj9otnBbR8KfkCK0gyt2LV/B5c+ydCs3yaTQ2HB
 M4INGTsQipkAOFwuAytDAiShUEF92kep1OBN2hIXl9CpWynwDBg7nWsoA8FZxXz20Ooq
 nDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=32C84MgkT+e7b4732NZR1h3JkIJSDHIcnreZhE8Icl0=;
 b=SF9maKElvMoHaxpGkQA3ZW1hYWO9R0MN3k2bA2hxwFaKc5aq6WggWiacIRrCFA2rsk
 xxpM52rLqcbvAvcJJtDejSd6U2SDcoZmBCBfypdOcaMNfBSVURMH4EYUCRTOUq8Nk33A
 6YW4AsIXzINPTLjPg4ov7bc5PdmgDGyV5DtqCjHIVAWiun/lyNY1BN3QPjKq7YAcUL5a
 XDAJGfiviXV62A8w4WSGzeEDFRsqKAdU6gUQDQ4k1NVd/pUhmFZs/IYipUfCAyGNJ4oB
 dxQDpuLqqLNqpqvJCnmxf0T/CoylrRhdyjnmnBK2a0k6vegIUOE+s/L0D6VZiP3jqyEE
 dCIw==
X-Gm-Message-State: AOAM530aS2+Nv3f4IysMQLr4ikQYk8bE+rAOpx9BQMZGELClmD43iBE0
 RbPsyC+dDLQb6WPgwbqJKmXotF3pSdnTAJpKcls=
X-Google-Smtp-Source: ABdhPJz/QJMW4bPUIAnlH55b1CbV6MIi4Q9xJ9qhFQvYAO6R+Fo3VbO3sIEwS60HzklzJqzY14f+Ng==
X-Received: by 2002:a17:906:3bd9:b0:6ff:4b5:4a8f with SMTP id
 v25-20020a1709063bd900b006ff04b54a8fmr43754168ejf.139.1655062091546; 
 Sun, 12 Jun 2022 12:28:11 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-183-191-140.77.183.pool.telefonica.de. [77.183.191.140])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a1709064f8100b006f3ef214de7sm2816564eju.77.2022.06.12.12.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 12:28:11 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH] hw/pci-host/i440fx: Remove unused parameter from i440fx_init()
Date: Sun, 12 Jun 2022 21:28:00 +0200
Message-Id: <20220612192800.40813-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

pi440fx_state is an out-parameter which is never read by the caller.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c            | 3 ---
 hw/pci-host/i440fx.c         | 4 +---
 include/hw/pci-host/i440fx.h | 1 -
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0fc2361ffe..a234989ac3 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -82,7 +82,6 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *system_io = get_system_io();
     PCIBus *pci_bus;
     ISABus *isa_bus;
-    PCII440FXState *i440fx_state;
     int piix3_devfn = -1;
     qemu_irq smi_irq;
     GSIState *gsi_state;
@@ -203,7 +202,6 @@ static void pc_init1(MachineState *machine,
 
         pci_bus = i440fx_init(host_type,
                               pci_type,
-                              &i440fx_state,
                               system_memory, system_io, machine->ram_size,
                               x86ms->below_4g_mem_size,
                               x86ms->above_4g_mem_size,
@@ -217,7 +215,6 @@ static void pc_init1(MachineState *machine,
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
     } else {
         pci_bus = NULL;
-        i440fx_state = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
         pcms->hpet_enabled = false;
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index e08716142b..1c5ad5f918 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -238,7 +238,6 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
 }
 
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
-                    PCII440FXState **pi440fx_state,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
                     ram_addr_t ram_size,
@@ -264,8 +263,7 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     d = pci_create_simple(b, 0, pci_type);
-    *pi440fx_state = I440FX_PCI_DEVICE(d);
-    f = *pi440fx_state;
+    f = I440FX_PCI_DEVICE(d);
     f->system_memory = address_space_mem;
     f->pci_address_space = pci_address_space;
     f->ram_memory = ram_memory;
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index f068aaba8f..52518dbf08 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -36,7 +36,6 @@ struct PCII440FXState {
 #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
 
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
-                    PCII440FXState **pi440fx_state,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
                     ram_addr_t ram_size,
-- 
2.36.1


