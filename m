Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2388671853
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:58:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI5Cq-00027L-D9; Wed, 18 Jan 2023 04:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI5Cm-00026Y-GR
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:58:04 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI5Ci-00061K-Vz
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:58:03 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so1076094wmc.1
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 01:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwOa/3lHPIEIlOYRqb+bMt9BbbFurvxLhJ3zRVokkDk=;
 b=lD+acpnKxIg8VZQ+jFXRIp8nhocG1nPt2N/VR/SO3KP/FmqRrx+vL5iDTQYgMVehje
 db3NIzHsGH41axWn7oZgS6bpNYGTN1he3eG79HtY11aLQ45vR7WR3XGANi9Gc56Wg/jQ
 hZW59WvYmSdmkLiCyLQ1LQGEvOSE1FC1fEKSvT7GMxlcLtZDfROMSDO/aOFGKu3RHMZW
 L0x0nS4Bdyg9VBh+K7IPLycnp3iSrCd0XpmTfBea2b5OGqYt3loGY3J1jGAvyMfmjy27
 f8sjBvdGHa20kekYP6oglBqE2w94/3YAnzRFt1KCmZiT0tKEet/iGxEz/kZo7qECU2LN
 c6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QwOa/3lHPIEIlOYRqb+bMt9BbbFurvxLhJ3zRVokkDk=;
 b=TSatDCcQAB5OExdRuDCLSK0hzo341HPCh/recFB9b8o7zeUy1xa2mZm+jZ3H52gj1a
 Uwf6F34RuBvVUbcrbbBOU4BnBDFRLtcsixdnylxCgwM42hoUhQfcDg3/RbCJlYg19s3S
 nzckhT08DhtMnpQ3AKgxgQU9mY68lDeAKaxT/xDT829FMj3uUn93LwVITLcauhQNpnXG
 g1qAXsw60q4NCLEQYnMydYpD1lHh+XXR4kYr24JQ7qHfu6/nkUNzxYIkiv5zHCx+OT7c
 TAmKdPNsL3UnPu0a0zpYXNiT7F0bVxrt+SspYt+n4vEpHeP58r2+DD06LEdYFx/yUxTV
 xEww==
X-Gm-Message-State: AFqh2koqWBWwbHKx4MLe5TlD4RNgZuZcoYPR3fDiXk7u1i81FNAb6vPS
 +7ED29dV+eZpGPgc1W6yXQ6PWLkN7xazqTx4
X-Google-Smtp-Source: AMrXdXtGKVrtuFP2M80XckJwlC7fNpgEdc+ViqSB3EM+vbUEvoLkHKip0OiU0/jNSgcZPh3tzmI8gg==
X-Received: by 2002:a05:600c:4910:b0:3d3:4406:8a3a with SMTP id
 f16-20020a05600c491000b003d344068a3amr6229251wmp.30.1674035878815; 
 Wed, 18 Jan 2023 01:57:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b003dafadd2f77sm1674815wms.1.2023.01.18.01.57.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Jan 2023 01:57:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Klaus Jensen <its@irrelevant.dk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v2 1/2] hw/pci-host/gt64120: Fix PCI I/O config register
 endianness
Date: Wed, 18 Jan 2023 10:57:50 +0100
Message-Id: <20230118095751.49728-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118095751.49728-1-philmd@linaro.org>
References: <20230118095751.49728-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The MByteSwap bit only affects the data register endianness,
not the config register. Map the config register once in the
gt64120_realize() handler, and only remap the data register
when the mapping is updated.

Fixes: 145e2198d7 ("gt64xxx: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps")
Reported-by: Klaus Jensen <its@irrelevant.dk>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/gt64120.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/hw/pci-host/gt64120.c b/hw/pci-host/gt64120.c
index f226d03420..36ed01c615 100644
--- a/hw/pci-host/gt64120.c
+++ b/hw/pci-host/gt64120.c
@@ -320,13 +320,6 @@ static void gt64120_isd_mapping(GT64120State *s)
 
 static void gt64120_update_pci_cfgdata_mapping(GT64120State *s)
 {
-    /* Indexed on MByteSwap bit, see Table 158: PCI_0 Command, Offset: 0xc00 */
-    static const MemoryRegionOps *pci_host_conf_ops[] = {
-        &pci_host_conf_be_ops, &pci_host_conf_le_ops
-    };
-    static const MemoryRegionOps *pci_host_data_ops[] = {
-        &pci_host_data_be_ops, &pci_host_data_le_ops
-    };
     PCIHostState *phb = PCI_HOST_BRIDGE(s);
 
     memory_region_transaction_begin();
@@ -339,22 +332,13 @@ static void gt64120_update_pci_cfgdata_mapping(GT64120State *s)
      * - Table 16: 32-bit PCI Transaction Endianess
      * - Table 158: PCI_0 Command, Offset: 0xc00
      */
-    if (memory_region_is_mapped(&phb->conf_mem)) {
-        memory_region_del_subregion(&s->ISD_mem, &phb->conf_mem);
-        object_unparent(OBJECT(&phb->conf_mem));
-    }
-    memory_region_init_io(&phb->conf_mem, OBJECT(phb),
-                          pci_host_conf_ops[s->regs[GT_PCI0_CMD] & 1],
-                          s, "pci-conf-idx", 4);
-    memory_region_add_subregion_overlap(&s->ISD_mem, GT_PCI0_CFGADDR << 2,
-                                        &phb->conf_mem, 1);
-
     if (memory_region_is_mapped(&phb->data_mem)) {
         memory_region_del_subregion(&s->ISD_mem, &phb->data_mem);
         object_unparent(OBJECT(&phb->data_mem));
     }
     memory_region_init_io(&phb->data_mem, OBJECT(phb),
-                          pci_host_data_ops[s->regs[GT_PCI0_CMD] & 1],
+                          (s->regs[GT_PCI0_CMD] & 1) ? &pci_host_data_le_ops
+                                                     : &pci_host_data_be_ops,
                           s, "pci-conf-data", 4);
     memory_region_add_subregion_overlap(&s->ISD_mem, GT_PCI0_CFGDATA << 2,
                                         &phb->data_mem, 1);
@@ -1207,6 +1191,11 @@ static void gt64120_realize(DeviceState *dev, Error **errp)
                                 get_system_io(),
                                 PCI_DEVFN(18, 0), TYPE_PCI_BUS);
 
+    memory_region_init_io(&phb->conf_mem, OBJECT(phb), &pci_host_conf_le_ops,
+                          s, "pci-conf-idx", 4);
+    memory_region_add_subregion_overlap(&s->ISD_mem, GT_PCI0_CFGADDR << 2,
+                                        &phb->conf_mem, 1);
+
     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
 
     /*
-- 
2.38.1


