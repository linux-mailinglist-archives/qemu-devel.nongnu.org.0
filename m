Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B92FF7D9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:19:10 +0100 (CET)
Received: from localhost ([::1]:47800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2iIH-0008VB-Fm
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2i94-0006T0-W7; Thu, 21 Jan 2021 17:09:43 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2i8v-0000NR-HO; Thu, 21 Jan 2021 17:09:36 -0500
Received: by mail-pj1-x1030.google.com with SMTP id m5so2556279pjv.5;
 Thu, 21 Jan 2021 14:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=e3zcg90vs7VgYi4sn6oxiKjBiBE2UtOtgzAyXchZd5Y=;
 b=HsHihHsJ9uFIuQ2jiMs697Xq+GU/yUf6RRLlOlvyk3qetyx4AcjLQCMFSCUgy0cTnv
 NCoU9a36l7OUIqAyJKqPig2Kc/Q6dLLLO/h8jTaLV8uzOxKOqdzvKt42MatFJm5zQy12
 qUtHBIJ+2Twnb3pTjUJOd0iRlO+a4AxPuFtw6Mp1KYe0zbNwAaJg/StUoWkio58YNJfe
 JAcZid0v9WYoFO+JboIxjeWPEKXLr81bRo+pKyMfl0cx3FNrmpRFmogjjCTI65I1IUL0
 xa3w+XLad4VqIbHrY9Uc436DkJBh+mfK5mHZd4fHL4aSBxQc6WhZIiQtMF877XF4Pfa9
 meSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=e3zcg90vs7VgYi4sn6oxiKjBiBE2UtOtgzAyXchZd5Y=;
 b=Djb0fCXXyxQbtgNSWwCbUYbMopesdnYmvw15v31CKo7MCm/nBU4/27NsKgblJbY35A
 XgVZYmBL3mhmhqcPS/fR243cfHfK6uARoZKnl2lFcRoJI3OAKlVy46Zvq9lgaxkIuf8Y
 OJHC1Dp+vzYmZSpDCYvoXqFW3R4MUEyJw61ciLT2WR9E7xg1V+VF0wRaomprZs6SCRgY
 tmovNEL4U7y6M7MAWUQb5NS9S88xdK/Rflr17jFTMcl6wOwnwofmeIytpGu+S3l1a5qk
 B+PE2VjR/mB5W1AASM/ctg/WFwzHHT2rKD1cMkw16kW04orh3TGwitCQDazB9y9f/Ct1
 tbzQ==
X-Gm-Message-State: AOAM530vM7UdOwYfR4KZ8/5uBAS9Wxb5gw80N01Q1D8kGgZCQShj39Ly
 QDm8PQ4oePGv328JgvL5DMDyg1puPkwfZg==
X-Google-Smtp-Source: ABdhPJwerSOkOIvkFDPhLjvsE6EZWyk5WEpZrSBB7ruZf9GRvWTHbjKf6ShzYsNjhkIGlac9I3BOBg==
X-Received: by 2002:a17:90a:db4c:: with SMTP id
 u12mr1667249pjx.14.1611266966224; 
 Thu, 21 Jan 2021 14:09:26 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id c8sm5584308pfo.148.2021.01.21.14.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 14:09:25 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V4 4/6] hw/block/nvme: support for multi-controller in
 subsystem
Date: Fri, 22 Jan 2021 07:09:06 +0900
Message-Id: <20210121220908.14247-5-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
References: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1030.google.com
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
index ab0531492ddd..225f0d3f3a27 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4427,16 +4427,21 @@ static void nvme_init_subnqn(NvmeCtrl *n)
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
@@ -4483,6 +4488,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->psd[0].enlat = cpu_to_le32(0x10);
     id->psd[0].exlat = cpu_to_le32(0x4);
 
+    if (n->subsys) {
+        id->cmic |= NVME_CMIC_MULTI_CTRL;
+    }
+
     NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
     NVME_CAP_SET_CQR(n->bar.cap, 1);
     NVME_CAP_SET_TO(n->bar.cap, 0xf);
@@ -4497,11 +4506,28 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
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
@@ -4517,7 +4543,11 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
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
index 04d4684601fd..b8f5f2d6ffb8 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -134,6 +134,7 @@ typedef struct NvmeCtrl {
     NvmeBus      bus;
     BlockConf    conf;
 
+    uint16_t    cntlid;
     bool        qs_created;
     uint32_t    page_size;
     uint16_t    page_bits;
-- 
2.17.1


