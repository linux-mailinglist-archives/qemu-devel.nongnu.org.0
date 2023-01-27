Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC2D67EB8B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 17:49:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLRtE-0002M6-Nq; Fri, 27 Jan 2023 11:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRt4-0002IC-EA; Fri, 27 Jan 2023 11:47:38 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRt2-0005ed-RA; Fri, 27 Jan 2023 11:47:38 -0500
Received: by mail-ed1-x536.google.com with SMTP id cw4so123794edb.13;
 Fri, 27 Jan 2023 08:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OJhCvhIhhKBnccqOEN+LTzcwGaza/ypgRY72rsH65ww=;
 b=V7KbksY5OYO6zNCWK76b0mR+BF1yecjrADVJLUl9g7nglH92AAAcxaaECT5928Oi1S
 123f7vS9KFHxt+rQ/rvZDDXC2VkTZo1zrhENG2vOaBmgZTx++7XbZaC+YUwOjTag4xAj
 iaRC7tMZ9E/cT0UYnWijiFy5p93LZLonn4PMG/Ezoi8TfpPFQvnyMqG/1fwDk5Cty8Lu
 F25BC571oUyxIV9tmc2uvEGPbOtEbgyRbbQY5hxfRW7vm2WJb7Y1RtUTHDyR7PiAQuQJ
 w0IxhiHwGGaUzMfw+4HUfAqW2BIAfGe8s8HiLeV5wmJ2BgKy2lBMoShgcE+DdK/CTUsa
 zJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OJhCvhIhhKBnccqOEN+LTzcwGaza/ypgRY72rsH65ww=;
 b=xWKs9leWkpZ90GyWgq1Q4FEeMNaZJk4z/cCCWr/qAdYdKdxgsU7Dg7uXZjrxEn/r/6
 i7cBBXaWuCfjf8kcNYKlrUqTXcKGE39qg7jwD+Zsk9QErHJUElLGxoWr1nB7Pm6iCugM
 49zkhrZcMMzmPrd4DuE3EPGdwhB6XbMHquJAcZxgpc0rALKfxecSQMa9bFTlMewyIwKz
 v7liSQm9lrdG81SK3cBHTCv/zeyMft1xXSJ/LFqJvKoeIvz7Q2OU3hS+j+FXq93W/J0G
 JFGnxMW5sTmFizSNmQg7E5gafVqIfs7IGLRSi5orqzU+BFlohL+NilSoS/R93FF682AY
 GXDQ==
X-Gm-Message-State: AFqh2kqZ3g8boZoaBr4/1Rsph6TvGWsaohdqn9450/AftsB7bVNakLNq
 D8IN126p5djBtqu/3QC2/esrSyCODAteuA==
X-Google-Smtp-Source: AMrXdXtKTej3q6ioYljEqJxvfGPJIsFxr91d++Sp0xrTErcpCsEGqgx6zk/dn69fjW45JCWCY/4OmA==
X-Received: by 2002:a05:6402:2b92:b0:45a:7d2:9b35 with SMTP id
 fj18-20020a0564022b9200b0045a07d29b35mr42341259edb.0.1674838054747; 
 Fri, 27 Jan 2023 08:47:34 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a056402050f00b0049ef70a2894sm2574414edv.38.2023.01.27.08.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 08:47:34 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/7] hw/i386/pc_q35: Resolve redundant q35_host variable
Date: Fri, 27 Jan 2023 17:47:15 +0100
Message-Id: <20230127164718.98156-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127164718.98156-1-shentey@gmail.com>
References: <20230127164718.98156-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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
---
 hw/i386/pc_q35.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 83c57c6eb1..dc94ce1081 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -118,7 +118,6 @@ static void pc_q35_init(MachineState *machine)
     PCMachineState *pcms = PC_MACHINE(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(machine);
-    Q35PCIHost *q35_host;
     PCIHostState *phb;
     PCIBus *host_bus;
     PCIDevice *lpc;
@@ -206,10 +205,10 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* create pci host bus */
-    q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
+    phb = PCI_HOST_BRIDGE(qdev_new(TYPE_Q35_HOST_DEVICE));
 
     if (pcmc->pci_enabled) {
-        pci_hole64_size = object_property_get_uint(OBJECT(q35_host),
+        pci_hole64_size = object_property_get_uint(OBJECT(phb),
                                                    PCI_HOST_PROP_PCI_HOLE64_SIZE,
                                                    &error_abort);
     }
@@ -218,22 +217,21 @@ static void pc_q35_init(MachineState *machine)
     pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
                    pci_hole64_size);
 
-    object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
+    object_property_add_child(OBJECT(machine), "q35", OBJECT(phb));
+    object_property_set_link(OBJECT(phb), MCH_HOST_PROP_RAM_MEM,
                              OBJECT(ram_memory), NULL);
-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
+    object_property_set_link(OBJECT(phb), MCH_HOST_PROP_PCI_MEM,
                              OBJECT(pci_memory), NULL);
-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_SYSTEM_MEM,
+    object_property_set_link(OBJECT(phb), MCH_HOST_PROP_SYSTEM_MEM,
                              OBJECT(get_system_memory()), NULL);
-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_IO_MEM,
+    object_property_set_link(OBJECT(phb), MCH_HOST_PROP_IO_MEM,
                              OBJECT(system_io), NULL);
-    object_property_set_int(OBJECT(q35_host), PCI_HOST_BELOW_4G_MEM_SIZE,
+    object_property_set_int(OBJECT(phb), PCI_HOST_BELOW_4G_MEM_SIZE,
                             x86ms->below_4g_mem_size, NULL);
-    object_property_set_int(OBJECT(q35_host), PCI_HOST_ABOVE_4G_MEM_SIZE,
+    object_property_set_int(OBJECT(phb), PCI_HOST_ABOVE_4G_MEM_SIZE,
                             x86ms->above_4g_mem_size, NULL);
     /* pci */
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(q35_host), &error_fatal);
-    phb = PCI_HOST_BRIDGE(q35_host);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(phb), &error_fatal);
     host_bus = phb->bus;
     /* create ISA bus */
     lpc = pci_create_simple_multifunction(host_bus, PCI_DEVFN(ICH9_LPC_DEV,
-- 
2.39.1


