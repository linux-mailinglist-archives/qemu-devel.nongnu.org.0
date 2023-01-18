Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8DA6717F3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:41:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI4vs-0000Wb-SN; Wed, 18 Jan 2023 04:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI4vq-0000Vo-8l
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:40:34 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI4vo-0003Rm-Ir
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:40:33 -0500
Received: by mail-wr1-x429.google.com with SMTP id k8so18800315wrc.9
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 01:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ZyhUeFxlkrXf9d0fxIrlwxdlHgHOET5uo6IDAqGU+I=;
 b=LXkXLXrfV/kPbAWMtkHpmDhrAzW3DlMobgZvcplTuFqQIzgmZYs/5Lhoo3zxVniiy3
 AF+gh1cRMmYEOhrOeBdNom3u02t3NqW1ilcYwa5iyXPbaxxMX6+qkl3b24MLMwgsivKn
 aySAyZUHaNBJaFzomVQBjcsdiNNSFLWQwzqFKcrFG3v/2vi/IJ8GmRh+1vMniJIK2F8O
 ZetvBeBPTLCDy9iLqBeYzC5DrS2VZCNQsQwTJAK3nJyAJSPODm6pmLWRjIv041pbjgkJ
 Xm28TxpdNpqMr5pBGF30AuGs9F/Nk3E58MmUhcy6Ha3HesXzeUXGQHN5qx+DREi3WX1C
 u3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ZyhUeFxlkrXf9d0fxIrlwxdlHgHOET5uo6IDAqGU+I=;
 b=IqdR65Ga2kUh2MyrwAkQW6lTfiw+otl1SPUpQCeHIKTzpF1lC870L5PLybiYSQdPvp
 BQv874CSDDRr+doUxIpGC+LyvLCtDKDneLqPlyQ706FljC8Fd1onWK8g/eiZk54869cq
 E7K08HZl+LbqKAzldG2OK+BqDU7LQjv7DC9fRymXMxtPUqscUekiQ+XI3hHPVH8j8loh
 8l2XQF6zSoqZPIAnz+k6Tqs2dxQ89PeSCH40+p2u6peLg/rHBwLNtGk69cchUeQ0exxu
 paSNqTY0LJgXS7jDZk2wyqPAQLbx5tXp5eLesxaKBZz+sRJHFSCgC55eea3VPYWAAwpi
 hiBg==
X-Gm-Message-State: AFqh2koyQ7InpQomSvPNGyjwhFNceZflBwGUQE/ogyWtMxVwBQUm4FE5
 Ql8a63TZbEyPU8KOx624czd2VwkWTSv5b+M8
X-Google-Smtp-Source: AMrXdXsFa2hix52hz/b7oIsH46ozSHlMAgq5tJDbIwcduSAxxkGZNIGyseVZ4BlOFKoXYXYIvG2w4w==
X-Received: by 2002:adf:ef11:0:b0:2bb:dd87:3485 with SMTP id
 e17-20020adfef11000000b002bbdd873485mr5463135wro.30.1674034830713; 
 Wed, 18 Jan 2023 01:40:30 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q4-20020adfdfc4000000b002bc6c180738sm28468752wrn.90.2023.01.18.01.40.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Jan 2023 01:40:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Beraldo Leal <bleal@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Klaus Jensen <its@irrelevant.dk>, Cleber Rosa <crosa@redhat.com>
Subject: [PATCH 1/2] hw/pci-host/gt64120: Fix PCI I/O config register
 endianness
Date: Wed, 18 Jan 2023 10:40:22 +0100
Message-Id: <20230118094023.49517-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118094023.49517-1-philmd@linaro.org>
References: <20230118094023.49517-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/gt64120.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/hw/pci-host/gt64120.c b/hw/pci-host/gt64120.c
index f226d03420..a88b59f576 100644
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
+                          s->regs[GT_PCI0_CMD] & 1 ? &pci_host_data_le_ops
+                                                   : &pci_host_data_be_ops,
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


