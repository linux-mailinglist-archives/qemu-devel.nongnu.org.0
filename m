Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B5E485AD0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:37:39 +0100 (CET)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5DyU-0000uB-T0
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:37:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlR-0001mB-HH; Wed, 05 Jan 2022 16:24:09 -0500
Received: from [2607:f8b0:4864:20::929] (port=39928
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlQ-0007t6-17; Wed, 05 Jan 2022 16:24:09 -0500
Received: by mail-ua1-x929.google.com with SMTP id b26so840412uap.6;
 Wed, 05 Jan 2022 13:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HyHe+E0K/8CfGlM/t3/KAcNvxaOBZvrbUwrlHkOdAgY=;
 b=HFo1fgcZ4/L5Ymv0rkGGs8lt01jqoPQtIBQKMa1pbEsrQ40qP7MgMgh4Nlxw+fvRc4
 SdAA0kh1+KMawaWHgaFcJZe3L5FW8nu81jDnPgmxdzHVM69avp4/DlTf0SFPGDoQMh2O
 9HacTgUVHi1IZAxOpa4PdFQtXu+Um+gILFbXYKsX041+pzsqR18ZEZ1z87SrscM2Cza/
 8WAyubCNZYZw8OLxL2UvStjSVG+8mIz2fu8MhsqKWYvhk9NIsc2zRrvGys3LHJwEQmvK
 45wlnawn6HS9PThg1yZjHqoQDPNmiiZcr0zB1+Q/5/KFvQuTxdlsAYwOVXOcip2lsVjA
 No/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HyHe+E0K/8CfGlM/t3/KAcNvxaOBZvrbUwrlHkOdAgY=;
 b=zb0Ro9NAWVhE3pXVpT+RS8tX3/7N8Hv+tlRYF8n6q9iN3ID0Sac0ghSH2mri7qPmxk
 9W2yRRtGedo05OPyrx3IcnhRiutYMFsNpqTCfydqOD/e9qB8tDPgtLGP7EreBEm2tS03
 VDfUHf0nocPBWj+dBeCTnoh4cRkrTgvRwvsU96f9K8S4Wup23m5Z8dZmhf9Ow2IuYPkw
 LUQQPqvMeMNDiEMbrNBGuYtQnZTDPfzwaevBWg0DUghSp2/mYDhX7e3LB6FqH4S4f6Lp
 x3U4MJGe63A8vyktKL2Tkl5PGpOFXTGAz6UEHinog2kkPo3hJhqqb84t5C/7lnSBufiL
 w3IA==
X-Gm-Message-State: AOAM532r4zmAy6+8/UWppjdxSaZAm+jWNY+6SVar9m/4wtdf0ZssP8Ng
 JSy0fRvWsnTI4T5QgVOvHFlN6K0jGvE=
X-Google-Smtp-Source: ABdhPJwe9mxzzKd14F7SpKEfk0598Id1I5+aepyoFadZhYnPmc4GRHPK4vE7f4jZDgR48r13vBNCNQ==
X-Received: by 2002:a05:6102:3585:: with SMTP id
 h5mr17815789vsu.73.1641417846744; 
 Wed, 05 Jan 2022 13:24:06 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:24:06 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/18] ppc/pnv: Reparent user created PHB3 devices to the
 PnvChip
Date: Wed,  5 Jan 2022 18:23:27 -0300
Message-Id: <20220105212338.49899-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, danielhb413@gmail.com,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

The powernv machine uses the object hierarchy to populate the device
tree and each device should be parented to the chip it belongs to.
This is not the case for user created devices which are parented to
the container "/unattached".

Make sure a PHB3 device is parented to its chip by reparenting the
object if necessary.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb3.c |  6 ++++++
 hw/ppc/pnv.c           | 17 +++++++++++++++++
 include/hw/ppc/pnv.h   |  1 +
 3 files changed, 24 insertions(+)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 1ebe43df5d..a52aedcad3 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -998,6 +998,12 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
             error_setg(errp, "invalid chip id: %d", phb->chip_id);
             return;
         }
+
+        /*
+         * Reparent user created devices to the chip to build
+         * correctly the device tree.
+         */
+        pnv_chip_parent_fixup(phb->chip, OBJECT(phb), phb->phb_id);
     }
 
     if (phb->phb_id >= PNV_CHIP_GET_CLASS(phb->chip)->num_phbs) {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index ad02d56aa7..fa5e7bc751 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1814,6 +1814,23 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
     return NULL;
 }
 
+void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index)
+{
+    Object *parent = OBJECT(chip);
+    g_autofree char *default_id =
+        g_strdup_printf("%s[%d]", object_get_typename(obj), index);
+
+    if (obj->parent == parent) {
+        return;
+    }
+
+    object_ref(obj);
+    object_unparent(obj);
+    object_property_add_child(
+        parent, DEVICE(obj)->id ? DEVICE(obj)->id : default_id, obj);
+    object_unref(obj);
+}
+
 PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
 {
     int i;
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 64bab7112b..f4219da7c5 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -178,6 +178,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
 
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
 void pnv_phb_attach_root_port(PCIHostState *pci, const char *name);
+void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index);
 
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
-- 
2.33.1


