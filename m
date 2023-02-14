Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5396369645D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:16:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRv9d-0007YA-Io; Tue, 14 Feb 2023 08:15:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9P-0007TY-Ar
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:21 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9N-0003tq-IY
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:15 -0500
Received: by mail-ej1-x635.google.com with SMTP id n10so12996834ejc.4
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0Szj+BUCHjxuJBdx9Wrvy+HkmBa/dgxVRBK3E/BnfQ=;
 b=P1KCrJ5iFTxh+5hJPtfVQujs9CifBZFJrovFDUYhJ3z6mc49/O1KUE5BAuzD2e2kov
 nS9cciywE1Cgyb5sKblg7Ul1XP0r+SVhbXQu0kcldp5/EjtQWbmMjJN4vYUwBJnKa7Fi
 dULDM0+FRiOAtjZdPH5npCnotlvZisNCXY4dc7mNJ5V5W3P1E81hJi/UEjFQ5EFzHkuE
 To4JShWSwN7qSBWc73ukDxQHjz+cEwNiaO2yWPgVfvjSv0NUuZg/kQ5U1J/QOG2qMDpr
 eYkh9MSHl7JfcoFx2pkcwW51zbx36P8iFjin6QAgWN5/aEBUn/nclhGQwuhxcyj1UPnH
 rk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E0Szj+BUCHjxuJBdx9Wrvy+HkmBa/dgxVRBK3E/BnfQ=;
 b=Gi65nHJsqSzpX4GqreIECIddJcLMTSpMqXtBUaW0pgrb/E/hv4l/1UAnw3rYXnXis4
 686R/5Zi0kvUKni4Po2M9YHy9vPJmATOe09CSGYKy3ATRMHLpLSdLO7g7hTS1L8QymuC
 b7hO11qtcmtFnViGurB6esxyiQgJKvOVxBLrKb07PMWDtspaDmYmx3SZqFiv5ML29aUq
 S+FmaiBcBEzn6hzK6H5bYb0zagAoOBdm+KeVkArMU0sl3P+D5bOBx+LSjbRcWn/w3yJl
 iGLXZ+cWbCngr4JzsjO3Ip/S392X36CTLOjeVOOvp92WsGHALlzP7eleZ7okACa/70FZ
 vcQg==
X-Gm-Message-State: AO0yUKUO+H3Vbffubc46wSy0N/syQ9K++rWOrHyd3oRLPj6h01I398HZ
 u3D9a7KmUevDiZPXVhbyMeg64rdgbys=
X-Google-Smtp-Source: AK7set9VL1euQ420jTWO4A2cNMGLWKOozgjeLNAI6Vf0wicXdmMh4RRG9X246+RFwqTC0nKvOuzUPA==
X-Received: by 2002:a17:906:a1c7:b0:8a6:e075:e364 with SMTP id
 bx7-20020a170906a1c700b008a6e075e364mr2832219ejb.26.1676380511765; 
 Tue, 14 Feb 2023 05:15:11 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-101-237.92.224.pool.telefonica.de. [92.224.101.237])
 by smtp.gmail.com with ESMTPSA id
 hz17-20020a1709072cf100b008b13836801bsm220153ejc.183.2023.02.14.05.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 05:15:11 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Bernhard Beschow <shentey@gmail.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 01/12] hw/i386/pc_q35: Resolve redundant q35_host variable
Date: Tue, 14 Feb 2023 14:14:30 +0100
Message-Id: <20230214131441.101760-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214131441.101760-1-shentey@gmail.com>
References: <20230214131441.101760-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The variable is redundant to "phb" and is never used by its real type.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/pc_q35.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a5ffb77ed8..1ce9b16c53 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -118,8 +118,7 @@ static void pc_q35_init(MachineState *machine)
     PCMachineState *pcms = PC_MACHINE(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(machine);
-    Q35PCIHost *q35_host;
-    PCIHostState *phb;
+    Object *phb;
     PCIBus *host_bus;
     PCIDevice *lpc;
     DeviceState *lpc_dev;
@@ -206,10 +205,10 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* create pci host bus */
-    q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
+    phb = OBJECT(qdev_new(TYPE_Q35_HOST_DEVICE));
 
     if (pcmc->pci_enabled) {
-        pci_hole64_size = object_property_get_uint(OBJECT(q35_host),
+        pci_hole64_size = object_property_get_uint(phb,
                                                    PCI_HOST_PROP_PCI_HOLE64_SIZE,
                                                    &error_abort);
     }
@@ -217,25 +216,25 @@ static void pc_q35_init(MachineState *machine)
     /* allocate ram and load rom/bios */
     pc_memory_init(pcms, system_memory, rom_memory, pci_hole64_size);
 
-    object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
+    object_property_add_child(OBJECT(machine), "q35", phb);
+    object_property_set_link(phb, MCH_HOST_PROP_RAM_MEM,
                              OBJECT(machine->ram), NULL);
-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_SMRAM_MEM,
+    object_property_set_link(phb, MCH_HOST_PROP_SMRAM_MEM,
                              OBJECT(&x86ms->smram), NULL);
-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
+    object_property_set_link(phb, MCH_HOST_PROP_PCI_MEM,
                              OBJECT(pci_memory), NULL);
-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_SYSTEM_MEM,
+    object_property_set_link(phb, MCH_HOST_PROP_SYSTEM_MEM,
                              OBJECT(system_memory), NULL);
-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_IO_MEM,
+    object_property_set_link(phb, MCH_HOST_PROP_IO_MEM,
                              OBJECT(system_io), NULL);
-    object_property_set_int(OBJECT(q35_host), PCI_HOST_BELOW_4G_MEM_SIZE,
+    object_property_set_int(phb, PCI_HOST_BELOW_4G_MEM_SIZE,
                             x86ms->below_4g_mem_size, NULL);
-    object_property_set_int(OBJECT(q35_host), PCI_HOST_ABOVE_4G_MEM_SIZE,
+    object_property_set_int(phb, PCI_HOST_ABOVE_4G_MEM_SIZE,
                             x86ms->above_4g_mem_size, NULL);
+
     /* pci */
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(q35_host), &error_fatal);
-    phb = PCI_HOST_BRIDGE(q35_host);
-    host_bus = phb->bus;
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(phb), &error_fatal);
+    host_bus = PCI_BUS(qdev_get_child_bus(DEVICE(phb), "pcie.0"));
     /* create ISA bus */
     lpc = pci_create_simple_multifunction(host_bus, PCI_DEVFN(ICH9_LPC_DEV,
                                           ICH9_LPC_FUNC), true,
-- 
2.39.1


