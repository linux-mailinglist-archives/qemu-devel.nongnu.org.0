Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42F756938B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:46:28 +0200 (CEST)
Received: from localhost ([::1]:53346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Bul-0005tW-Cr
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BM0-0000Wb-25; Wed, 06 Jul 2022 16:10:34 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34]:42653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLx-0003Zp-Uo; Wed, 06 Jul 2022 16:10:31 -0400
Received: by mail-vk1-xa34.google.com with SMTP id r184so1134465vkg.9;
 Wed, 06 Jul 2022 13:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9gNpwUW0nGeRtr0KvWUJvAGB/3o+wQ2ilsbSvquXNuY=;
 b=d3EYy6lGN+XiNK8GMZ+H+cBBrHAJOd28adLjflHvrNJZZmKSGSzt9NJGfHbpSc4DzW
 atICL9WVSy/m7bDEY0pgIMwA0MouVhCeGwpBeff2f8TTbuaaD0TQ0m2oD7c/5c8BI2d7
 R4H6SMDAXMBFVrxCoVq7yyuJdldspAtpy+OOTy1cXa3t+F9oH/ox6OqQr7QBu37LQMcT
 9+/A7Rm65Cpio14ViRMpD+HdxWZlbzdt2//wJxpybasjhoMQ6QyV63CfSUnf9sPMvfnP
 28D3luUF+w1R9x+w+xOx3M2NJu9GAgXioDJHIgb0jNxgCs3hVT5yIwB6mMOEYp6JVx6Y
 6Dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9gNpwUW0nGeRtr0KvWUJvAGB/3o+wQ2ilsbSvquXNuY=;
 b=UjqV7lxrUqJTAR2hhYPlXxpZNAFq41JdW2OFU/tpMTFXsQBrSfvot/BvMxez06RUJN
 Dhi24TQ3djq2Uj03hyi303ZfSU2Ds/Th7sz3pzOxyqND4Mv/+0wClkCZa8pzLelBR2I/
 ud964RLhMJwxpJyB/eRGFA7QpRNctxR2W0EYW6DGQnmxtL4uZ7S2QcyLWyDnJC9VYno4
 XEExYz/j8ttd19xnmp/Y3QiAJvz89Ibv+DOq1LlLJQ7sjnplZIQNroYC2nXTH5l7NiyZ
 Tq9BNY88tJNR+NKXSj7ETsD4CHIJOz+JZ9YGfor+Mi5JI4yJWWHGuz9wpb77DK1fJGRu
 DqwQ==
X-Gm-Message-State: AJIora86lC4ZTTHPp+SNLx9hshzT8XYnH9EhYGRDmU1F7Jzq6Rkg5sQu
 tgtItJezDTy/IOOwwq3n0v9jAF67gUU=
X-Google-Smtp-Source: AGRyM1vS1ypfLHzUgX0Lvyqv9hti2sg/FCU3H2CyPPlQAlDONJlBJyF29c+Gkhn6G8D0V7iGe28Icg==
X-Received: by 2002:a1f:a094:0:b0:36c:e403:52eb with SMTP id
 j142-20020a1fa094000000b0036ce40352ebmr24470414vke.36.1657138228404; 
 Wed, 06 Jul 2022 13:10:28 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PULL 19/34] ppc: Define SETFIELD for the ppc target
Date: Wed,  6 Jul 2022 17:09:31 -0300
Message-Id: <20220706200946.471114-20-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa34.google.com
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

From: Alexey Kardashevskiy <aik@ozlabs.ru>

It keeps repeating, move it to the header. This uses __builtin_ffsll() to
allow using the macros in #define.

This is not using the QEMU's FIELD macros as this would require changing
all such macros found in skiboot (the PPC PowerNV firmware).

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220628080544.1509428-1-aik@ozlabs.ru>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/intc/pnv_xive.c                  | 20 --------------------
 hw/intc/pnv_xive2.c                 | 20 --------------------
 hw/pci-host/pnv_phb4.c              | 16 ----------------
 include/hw/pci-host/pnv_phb3_regs.h | 16 ----------------
 target/ppc/cpu.h                    | 12 ++++++++++++
 5 files changed, 12 insertions(+), 72 deletions(-)

diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index 1ce1d7b07d..c7b75ed12e 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -66,26 +66,6 @@ static const XiveVstInfo vst_infos[] = {
     qemu_log_mask(LOG_GUEST_ERROR, "XIVE[%x] - " fmt "\n",              \
                   (xive)->chip->chip_id, ## __VA_ARGS__);
 
-/*
- * QEMU version of the GETFIELD/SETFIELD macros
- *
- * TODO: It might be better to use the existing extract64() and
- * deposit64() but this means that all the register definitions will
- * change and become incompatible with the ones found in skiboot.
- *
- * Keep it as it is for now until we find a common ground.
- */
-static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
-{
-    return (word & mask) >> ctz64(mask);
-}
-
-static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
-                                uint64_t value)
-{
-    return (word & ~mask) | ((value << ctz64(mask)) & mask);
-}
-
 /*
  * When PC_TCTXT_CHIPID_OVERRIDE is configured, the PC_TCTXT_CHIPID
  * field overrides the hardwired chip ID in the Powerbus operations
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index f31c53c28d..f22ce5ca59 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -75,26 +75,6 @@ static const XiveVstInfo vst_infos[] = {
     qemu_log_mask(LOG_GUEST_ERROR, "XIVE[%x] - " fmt "\n",              \
                   (xive)->chip->chip_id, ## __VA_ARGS__);
 
-/*
- * QEMU version of the GETFIELD/SETFIELD macros
- *
- * TODO: It might be better to use the existing extract64() and
- * deposit64() but this means that all the register definitions will
- * change and become incompatible with the ones found in skiboot.
- *
- * Keep it as it is for now until we find a common ground.
- */
-static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
-{
-    return (word & mask) >> ctz64(mask);
-}
-
-static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
-                                uint64_t value)
-{
-    return (word & ~mask) | ((value << ctz64(mask)) & mask);
-}
-
 /*
  * TODO: Document block id override
  */
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index d225ab5b0f..67ddde4a6e 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -31,22 +31,6 @@
     qemu_log_mask(LOG_GUEST_ERROR, "phb4_pec[%d:%d]: " fmt "\n",        \
                   (pec)->chip_id, (pec)->index, ## __VA_ARGS__)
 
-/*
- * QEMU version of the GETFIELD/SETFIELD macros
- *
- * These are common with the PnvXive model.
- */
-static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
-{
-    return (word & mask) >> ctz64(mask);
-}
-
-static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
-                                uint64_t value)
-{
-    return (word & ~mask) | ((value << ctz64(mask)) & mask);
-}
-
 static PCIDevice *pnv_phb4_find_cfg_dev(PnvPHB4 *phb)
 {
     PCIHostState *pci = PCI_HOST_BRIDGE(phb);
diff --git a/include/hw/pci-host/pnv_phb3_regs.h b/include/hw/pci-host/pnv_phb3_regs.h
index a174ef1f70..38f8ce9d74 100644
--- a/include/hw/pci-host/pnv_phb3_regs.h
+++ b/include/hw/pci-host/pnv_phb3_regs.h
@@ -12,22 +12,6 @@
 
 #include "qemu/host-utils.h"
 
-/*
- * QEMU version of the GETFIELD/SETFIELD macros
- *
- * These are common with the PnvXive model.
- */
-static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
-{
-    return (word & mask) >> ctz64(mask);
-}
-
-static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
-                                uint64_t value)
-{
-    return (word & ~mask) | ((value << ctz64(mask)) & mask);
-}
-
 /*
  * PBCQ XSCOM registers
  */
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e109b5902b..b38c651af4 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -47,6 +47,18 @@
                                  PPC_BIT32(bs))
 #define PPC_BITMASK8(bs, be)    ((PPC_BIT8(bs) - PPC_BIT8(be)) | PPC_BIT8(bs))
 
+/*
+ * QEMU version of the GETFIELD/SETFIELD macros from skiboot
+ *
+ * It might be better to use the existing extract64() and
+ * deposit64() but this means that all the register definitions will
+ * change and become incompatible with the ones found in skiboot.
+ */
+#define MASK_TO_LSH(m)          (__builtin_ffsll(m) - 1)
+#define GETFIELD(m, v)          (((v) & (m)) >> MASK_TO_LSH(m))
+#define SETFIELD(m, v, val) \
+        (((v) & ~(m)) | ((((typeof(v))(val)) << MASK_TO_LSH(m)) & (m)))
+
 /*****************************************************************************/
 /* Exception vectors definitions                                             */
 enum {
-- 
2.36.1


