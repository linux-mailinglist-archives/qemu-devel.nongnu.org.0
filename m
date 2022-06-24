Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA07D55963D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:15:26 +0200 (CEST)
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fPS-0008DE-01
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0l-0002LT-Ag; Fri, 24 Jun 2022 04:49:55 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:39693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0j-0000Dz-PI; Fri, 24 Jun 2022 04:49:55 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-101dc639636so2906283fac.6; 
 Fri, 24 Jun 2022 01:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5q3LW9wi06Y7QV7cdkSV17w4C4nKDZ/MEyMOfJJ0mo8=;
 b=koUKJqyXHQLDGqpVpCXs1zfVcmF0Qx8hSUAuc0RVZM+GW+WSt/THOrEo2q5kH1/mJh
 KqbuR4LieHQoCbwJNIfxnse2FEGtH0gpn9ABq+TSiRDiTYuP7Pwwxza9ehdI3y4LfD8u
 4bivMq0DBeGWn2nKHTEHT6xi750SfL3drA//0h0UP5g1R8te8A9UVdgE+dqROQiEjarR
 MMm3X0bFtIzdQDlztlZ8hua2KDK1H7jz62qQBzwGLDJ90BuYfmAxwrXZ+C7nU6N/IB/2
 Ry9vPBxDUfGSJKdDJNiM5IeyQn00ZpQ8+AcoMny9FDel0sAiu30KAleqf7DtBRtKfNSV
 qtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5q3LW9wi06Y7QV7cdkSV17w4C4nKDZ/MEyMOfJJ0mo8=;
 b=L9H7OJgFXZzol2JyBQZFkVD/+xnu/4lyLmw1rNSrf/kLUNWZrbW961DIe2JIlDfXOQ
 5jxu1yBnSO7MdAt5rGPq6b7Y/NzdCtSsOCkGO5HsY3Vfb9W2N6b/uqOBvLVdNnuNINo0
 kzjMKzh1qVMKoTErpkK84xWSO6Oo3HDuEWNqA0nArAz9jAHDRan/YOaRaD5s/VXg6tz4
 ZC1pqp7o9MMG7YG3EHYqtbwqgYREozGDXt1NIerQxXZmXxipeIR5wE4rMOQ4yKSEXKm2
 HkikbytKx7nqxpiKsBtNsylzw/iqNluvd/eQ17sroQCgxUBxw/ksTrwVkdT6K/uHSPJK
 3+QQ==
X-Gm-Message-State: AJIora/6XxuVF9NFiKoc2FwUstljw+oBOp8sjWRw0vD02FZgZue3KsBo
 N7ejFqtZ8qw5fXRWB8NnEqwTHg71rkA=
X-Google-Smtp-Source: AGRyM1vVPgG8gRK1L/Xw8JTQVT4tJO2cBMPCXJJLjkn3UuoErZ4oaUgoEEE0eNQcLpyIw1AdJBZK3g==
X-Received: by 2002:a05:6870:6321:b0:101:b203:d871 with SMTP id
 s33-20020a056870632100b00101b203d871mr1406564oao.130.1656060591812; 
 Fri, 24 Jun 2022 01:49:51 -0700 (PDT)
Received: from balboa.ibmmodules.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a056830230800b0061698ef90e5sm1192768ote.31.2022.06.24.01.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:49:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 12/12] ppc/pnv: move attach_root_port helper to pnv-phb.c
Date: Fri, 24 Jun 2022 05:49:21 -0300
Message-Id: <20220624084921.399219-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624084921.399219-1-danielhb413@gmail.com>
References: <20220624084921.399219-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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

The helper is only used in this file.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 24 ++++++++++++++++++++++++
 hw/ppc/pnv.c          | 25 -------------------------
 include/hw/ppc/pnv.h  |  1 -
 3 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index cc15a949c9..c47ed92462 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -18,6 +18,30 @@
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
 
+/*
+ * Attach a root port device.
+ *
+ * 'index' will be used both as a PCIE slot value and to calculate
+ * QOM id. 'chip_id' is going to be used as PCIE chassis for the
+ * root port.
+ */
+static void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id)
+{
+    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
+    g_autofree char *default_id = g_strdup_printf("%s[%d]",
+                                                  TYPE_PNV_PHB_ROOT_PORT,
+                                                  index);
+    const char *dev_id = DEVICE(root)->id;
+
+    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
+                              OBJECT(root));
+
+    /* Set unique chassis/slot values for the root port */
+    qdev_prop_set_uint8(DEVICE(root), "chassis", chip_id);
+    qdev_prop_set_uint16(DEVICE(root), "slot", index);
+
+    pci_realize_and_unref(root, pci->bus, &error_fatal);
+}
 
 static void pnv_phb_realize(DeviceState *dev, Error **errp)
 {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 5b7cbfc699..d649ed6b1b 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1192,31 +1192,6 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
     }
 }
 
-/*
- * Attach a root port device.
- *
- * 'index' will be used both as a PCIE slot value and to calculate
- * QOM id. 'chip_id' is going to be used as PCIE chassis for the
- * root port.
- */
-void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id)
-{
-    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
-    g_autofree char *default_id = g_strdup_printf("%s[%d]",
-                                                  TYPE_PNV_PHB_ROOT_PORT,
-                                                  index);
-    const char *dev_id = DEVICE(root)->id;
-
-    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
-                              OBJECT(root));
-
-    /* Set unique chassis/slot values for the root port */
-    qdev_prop_set_uint8(DEVICE(root), "chassis", chip_id);
-    qdev_prop_set_uint16(DEVICE(root), "slot", index);
-
-    pci_realize_and_unref(root, pci->bus, &error_fatal);
-}
-
 static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
 {
     PnvChipClass *pcc = PNV_CHIP_GET_CLASS(dev);
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index fbad11d6a7..033d907287 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -190,7 +190,6 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
                          TYPE_PNV_CHIP_POWER10)
 
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
-void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id);
 
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
-- 
2.36.1


