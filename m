Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166106D0666
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:20:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phsBd-0007z8-US; Thu, 30 Mar 2023 09:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phsBR-0007kG-RU
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:19:20 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phsBP-00021J-LR
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:19:17 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t4so13819112wra.7
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 06:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680182354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pAX9S025dEyrSFkAAp1TBAvo2BRP/u6bo3pCVnFlqbg=;
 b=fQUQwf/cBK97OQOowkvhytsrjJOaPlu/0ZAvY6vLWyMhoRqELhgff/awGoeuDGCw9J
 NVisV+D2DtIvWmftlK8RTtkpACcST6gmtVb2iWswdFrajMS8Bx3mxEXXlO7VFksJPxFu
 xtPPRRAd5pZ0TkJPGmPm20nY9m3GEHGm50LksNEhMBDq+d6ELL1C9Xwfcbya0TAQyFCY
 iUv5ghAgk6TTEISciAZiTEH8yKqWFpwZbEXmB61AfXn51s1ogb6Zweddbnx+qo72SF1p
 45Cz+BO0zUyDYayJqWuQLPK08ro28eH2oIKiIynKEaW0yBSscVVuAQW9/LijK/8iBZ+u
 mxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pAX9S025dEyrSFkAAp1TBAvo2BRP/u6bo3pCVnFlqbg=;
 b=oJYIzd953YvOyNCv7Hws/TpOVl3zN+SDsFKWpmKw1o9spUBcSjMozp5mmdW/nYV+ya
 qDvX2wpjtEu2r4LxOPzaJHP6OUS2N6rY5HlvcJaIh698s8TN956ynR4GnYMClvKKjbPC
 s2mtPeWA6e+AcqeLtrdfB72aiFGL6sigh0mvb8mrxwhQwa8ScMDMjKyc2qb6huKW87ZZ
 rrknjbqb6ATHp9Ft05cYvw2pMMDb5/D5UqsgwATUU8M2wFblM7ikWpPC8malFKw/PLkF
 E7iekrDPXC2uuLjIDdZIklYEOPLggBaDHfuPPixem+Bqo2avmI1YGhuHdFeJn+J3YAg/
 3l1w==
X-Gm-Message-State: AAQBX9fROKXT5K06ufWC1517uKzf7LGndCTN79qV9Oim1L63y7belW5P
 g0oUPpgUPbUd9OhwF/EE7P5vZVe0COO2lCmNduc=
X-Google-Smtp-Source: AKy350ZwSI06Ca3g7s2WUzuBMdpXKvtpwTQuo0GWApqKgPn+99UfqNALZS9TuRT3FhR3Oi+ciM3xkg==
X-Received: by 2002:adf:e484:0:b0:2ce:a938:ecc9 with SMTP id
 i4-20020adfe484000000b002cea938ecc9mr17937943wrm.69.1680182354124; 
 Thu, 30 Mar 2023 06:19:14 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a5d5307000000b002c5a1bd5280sm32869812wrv.95.2023.03.30.06.19.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Mar 2023 06:19:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Titus Rwantare <titusr@google.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PULL 3/6] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Date: Thu, 30 Mar 2023 15:18:53 +0200
Message-Id: <20230330131856.94210-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230330131856.94210-1-philmd@linaro.org>
References: <20230330131856.94210-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
MemoryRegionOps") converted CFGADDR/CFGDATA registers to use
PCI_HOST_BRIDGE's accessor facility and enabled byte swap for both
CFGADDR/CFGDATA register.

However CFGADDR as a ISD internal register is not controlled by
MByteSwap bit, it follows endian of all other ISD register, which
means it ties to little endian.

Move mapping of CFGADDR out of gt64120_update_pci_cfgdata_mapping
to disable endian-swapping.

Fixes: 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Message-Id: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
[PMD: !!! Note this only fixes little-endian hosts !!! ]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/gt64120.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/pci-host/gt64120.c b/hw/pci-host/gt64120.c
index f226d03420..82c15edb46 100644
--- a/hw/pci-host/gt64120.c
+++ b/hw/pci-host/gt64120.c
@@ -321,9 +321,6 @@ static void gt64120_isd_mapping(GT64120State *s)
 static void gt64120_update_pci_cfgdata_mapping(GT64120State *s)
 {
     /* Indexed on MByteSwap bit, see Table 158: PCI_0 Command, Offset: 0xc00 */
-    static const MemoryRegionOps *pci_host_conf_ops[] = {
-        &pci_host_conf_be_ops, &pci_host_conf_le_ops
-    };
     static const MemoryRegionOps *pci_host_data_ops[] = {
         &pci_host_data_be_ops, &pci_host_data_le_ops
     };
@@ -339,15 +336,6 @@ static void gt64120_update_pci_cfgdata_mapping(GT64120State *s)
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
 
     if (memory_region_is_mapped(&phb->data_mem)) {
         memory_region_del_subregion(&s->ISD_mem, &phb->data_mem);
@@ -1208,6 +1196,12 @@ static void gt64120_realize(DeviceState *dev, Error **errp)
                                 PCI_DEVFN(18, 0), TYPE_PCI_BUS);
 
     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
+    memory_region_init_io(&phb->conf_mem, OBJECT(phb),
+                          &pci_host_conf_le_ops,
+                          s, "pci-conf-idx", 4);
+    memory_region_add_subregion_overlap(&s->ISD_mem, GT_PCI0_CFGADDR << 2,
+                                        &phb->conf_mem, 1);
+
 
     /*
      * The whole address space decoded by the GT-64120A doesn't generate
-- 
2.38.1


