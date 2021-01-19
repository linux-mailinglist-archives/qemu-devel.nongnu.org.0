Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697E92FBD5F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:18:32 +0100 (CET)
Received: from localhost ([::1]:40716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ueF-0005oL-Fi
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uOP-0008DE-N0; Tue, 19 Jan 2021 12:02:09 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:54407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uON-0003Gr-N8; Tue, 19 Jan 2021 12:02:09 -0500
Received: by mail-pj1-x1033.google.com with SMTP id cq1so270279pjb.4;
 Tue, 19 Jan 2021 09:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dO7I5R2PUej3AzzcqI2wFUHEmH/mzpXmls9/ur/M4BE=;
 b=ROtEeFCPqrPLkcYYvjaWxOI7llKr+9+XP/S1MfawcQEa4WO42BzxEhHGGpJc5zLQ9/
 Q0MWpxcDNaBJ40fNUJXM/Ah8TDZdHU0gKYOoG3dk2CYoHgW/bzTe9YhP52U8aWbDxdG6
 4QvtfoRp3nrSrSyty3GF8tPpvtKWgB3BBbWk5WyzuHO/c1xQCyTARhkeSkB3/jxoxETh
 CpYV8Fzht759buq7jgl4ZFwoqQdUqAM3Sp6ihpjQuwm3/7rWsWV+a14WfKTOBNT0ca1y
 aoe61ERt72tGi1mkcGHvFwRxN3S+3bha4+GL0VrDL+IleDU9m252fTgPtAQDn7pDujS4
 F5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dO7I5R2PUej3AzzcqI2wFUHEmH/mzpXmls9/ur/M4BE=;
 b=dLlZz1JIrgkT1gGFMLGgmQGq1v5ZIBbVY9qFKppmDI9X71bes3dLOIQtJJ5aAH2wDp
 Uoe4uM0MEA1fHN8OKrWY6kU5cn+ijLjpU97TrRGbFGnJtRJjyxUU8O7Rso4Os7dNYzH8
 YznPd2KQiug4wX5jj4TrkweXLLvKKnpqKuqI7784juZIe4qIWDu4NKnOuXYDw+3DwutI
 oWoYJOpm/1pZ7X3PVpoqWCq0Ni2aqNQwKjt6oYRHLwFJisvfaIkOHlZwYZhOkLBS+d7P
 DMEw/KPwvkyaPI1NvNpzCasQuzhY9wHka4xObLhICyVZjQDv4Ji7/cHAVgxYMS5aVwAU
 qclg==
X-Gm-Message-State: AOAM533JZja04WT+Z3vSwy+xcJtscxLfa72QjZH/9fLaTo3ralLoM8Gx
 /gZEfx3okr5TgdnR8bmSc33x0SxQYrCbhQ==
X-Google-Smtp-Source: ABdhPJwm8BPYPN/gSUsDFOe02XpXM5koHEDaoGUSMqrLySTgFKq3mHRwXTlTq3IzSnlkNbDDkRTVOw==
X-Received: by 2002:a17:902:7102:b029:de:aa85:e04e with SMTP id
 a2-20020a1709027102b02900deaa85e04emr5471967pll.23.1611075725733; 
 Tue, 19 Jan 2021 09:02:05 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id m4sm19396001pgv.16.2021.01.19.09.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:02:04 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V3 4/8] hw/block/nvme: support for multi-controller in
 subsystem
Date: Wed, 20 Jan 2021 02:01:43 +0900
Message-Id: <20210119170147.19657-5-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have nvme-subsys and nvme devices mapped together.  To support
multi-controller scheme to this setup, controller identifier(id) has to
be managed.  Earlier, cntlid(controller id) used to be always 0 because
we didn't have any subsystem scheme that controller id matters.

This patch introduced 'cntlid' attribute to the nvme controller
instance(NvmeCtrl) and make it allocated by the nvme-subsys device
mapped to the controller.  If nvme-subsys is not given to the
controller, then it will always be 0 as it was.

Added 'ctrls' array in the nvme-subsys instance to manage attached
controllers to the subsystem with a limit(32).  This patch didn't take
list for the controllers to make it seamless with nvme-ns device.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-subsys.c | 21 +++++++++++++++++++++
 hw/block/nvme-subsys.h |  4 ++++
 hw/block/nvme.c        | 34 ++++++++++++++++++++++++++++++++--
 hw/block/nvme.h        |  1 +
 4 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
index f1dc71d588d9..a01003136b12 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/block/nvme-subsys.c
@@ -22,6 +22,27 @@
 #include "nvme.h"
 #include "nvme-subsys.h"
 
+int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
+{
+    NvmeSubsystem *subsys = n->subsys;
+    int cntlid;
+
+    for (cntlid = 0; cntlid < ARRAY_SIZE(subsys->ctrls); cntlid++) {
+        if (!subsys->ctrls[cntlid]) {
+            break;
+        }
+    }
+
+    if (cntlid == ARRAY_SIZE(subsys->ctrls)) {
+        error_setg(errp, "no more free controller id");
+        return -1;
+    }
+
+    subsys->ctrls[cntlid] = n;
+
+    return cntlid;
+}
+
 static void nvme_subsys_setup(NvmeSubsystem *subsys)
 {
     char *subnqn;
diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 40f06a4c7db0..4eba50d96a1d 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -20,6 +20,10 @@ typedef struct NvmeNamespace NvmeNamespace;
 typedef struct NvmeSubsystem {
     DeviceState parent_obj;
     uint8_t     subnqn[256];
+
+    NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
 } NvmeSubsystem;
 
+int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
+
 #endif /* NVME_SUBSYS_H */
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 3e3b5451ea3d..9f8a739fcd8f 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4304,16 +4304,21 @@ static void nvme_init_subnqn(NvmeCtrl *n)
     }
 }
 
-static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
+static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t cntlid)
 {
     NvmeIdCtrl *id = &n->id_ctrl;
     uint8_t *pci_conf = pci_dev->config;
 
+    n->cntlid = cntlid;
+
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
     strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
     strpadcpy((char *)id->fr, sizeof(id->fr), "1.0", ' ');
     strpadcpy((char *)id->sn, sizeof(id->sn), n->params.serial, ' ');
+
+    id->cntlid = cntlid;
+
     id->rab = 6;
     id->ieee[0] = 0x00;
     id->ieee[1] = 0x02;
@@ -4359,6 +4364,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->psd[0].enlat = cpu_to_le32(0x10);
     id->psd[0].exlat = cpu_to_le32(0x4);
 
+    if (n->subsys) {
+        id->cmic |= NVME_CMIC_MULTI_CTRL;
+    }
+
     NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
     NVME_CAP_SET_CQR(n->bar.cap, 1);
     NVME_CAP_SET_TO(n->bar.cap, 0xf);
@@ -4371,11 +4380,28 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     n->bar.intmc = n->bar.intms = 0;
 }
 
+static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
+{
+    int cntlid;
+
+    if (!n->subsys) {
+        return 0;
+    }
+
+    cntlid = nvme_subsys_register_ctrl(n, errp);
+    if (cntlid < 0) {
+        return -1;
+    }
+
+    return cntlid;
+}
+
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n = NVME(pci_dev);
     NvmeNamespace *ns;
     Error *local_err = NULL;
+    int cntlid;
 
     nvme_check_constraints(n, &local_err);
     if (local_err) {
@@ -4391,7 +4417,11 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         return;
     }
 
-    nvme_init_ctrl(n, pci_dev);
+    cntlid = nvme_init_subsys(n, errp);
+    if (cntlid < 0) {
+        return;
+    }
+    nvme_init_ctrl(n, pci_dev, cntlid);
 
     /* setup a namespace if the controller drive property was given */
     if (n->namespace.blkconf.blk) {
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 3fa0e0a15539..c158cc873b59 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -133,6 +133,7 @@ typedef struct NvmeCtrl {
     NvmeBus      bus;
     BlockConf    conf;
 
+    uint16_t    cntlid;
     bool        qs_created;
     uint32_t    page_size;
     uint16_t    page_bits;
-- 
2.17.1


