Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51752F9339
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 16:06:05 +0100 (CET)
Received: from localhost ([::1]:51484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l19cy-0007h3-T8
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 10:06:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RY-0004aD-Cy; Sun, 17 Jan 2021 09:54:16 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RW-000498-4K; Sun, 17 Jan 2021 09:54:16 -0500
Received: by mail-pf1-x429.google.com with SMTP id y205so2830398pfc.5;
 Sun, 17 Jan 2021 06:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1Cm/Y/wHV6XDVnBidszQS9hCYZA9+sK+hHU3IgmkQuk=;
 b=V1fFgzqDUaF7t5+I5CQJTxyFgCFLPny7M27dFIovuGnI/n1fOFk+9hs9zU6IbgBvCY
 pYNNOZQ1zc2beJUyOnhrQgUYJcmupb7hTy34jdPqtr9o8M69FRR7moJNE3xddxM+uadW
 c8EicjGbqm0h9HBXjXK83Qhz45h1XTyY89EM+XUrn6poh9BXhYaZr5Zld0wx6k8cofua
 h22M+PELHre67bEGppVq81aCCUbZlLv7fX+avda7V5X2VfthhbUjKt90+hvaie+31X3K
 1TVQmK+2FDGbtKsRNwNlCCDbdT6rf1MuIdeauZ+N8WoSVU1nvzUlAbm1ar6uGf1OTS6M
 EAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1Cm/Y/wHV6XDVnBidszQS9hCYZA9+sK+hHU3IgmkQuk=;
 b=ewOABZ8TUIyxL7CcpylPW9Ikgxt9rMdtGaGOGaSST38ToSOmwGqw4YwRzZTcar18Tk
 iif5odkYM7wNRvUWEyLYKvQwhEPD3d6bGPNsCcIKemcObMh74hcxMnkRca7hQ7Fy77+C
 KXMYr/lMiGyAdNYBWH6/vsdZY0qop84T/z1vM8EcWf8kp+oLZRIrgzhZhoEtwodHBuKw
 HbYznfJewrYVMXSymyCYsUQLj8wsFJiWtDsZcScwVuNTA6P4b2J+0WQO2X/j8v5/ej7O
 83wiKlk8jqgsPqgey/djerL9H4nIYQ6JQjVbtz4CKcXoz7IkW7zNwqLcOhziL6tjiUgG
 JZvQ==
X-Gm-Message-State: AOAM533Rq92QVPh+5Ki6r7uxZIfCGseovWpdz2sqxLDew5i38GsF/xxg
 7grIyFHO7dnlVieiEvTvbnREWZp/qLpt3A==
X-Google-Smtp-Source: ABdhPJyZXzKk/7U/JjkbYl1uKZ3GWZYyX/vyOcg8B18Z5Rw4ZOncaHS1E7Azdpl1bB8A+qZPr5Zpaw==
X-Received: by 2002:a62:5383:0:b029:1b6:20bf:e5a1 with SMTP id
 h125-20020a6253830000b02901b620bfe5a1mr5695472pfb.58.1610895251614; 
 Sun, 17 Jan 2021 06:54:11 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x127sm13143583pfb.74.2021.01.17.06.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 06:54:11 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V2 09/11] hw/block/nvme: support for multi-controller in
 subsystem
Date: Sun, 17 Jan 2021 23:53:39 +0900
Message-Id: <20210117145341.23310-10-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x429.google.com
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
 hw/block/nvme.c        | 32 ++++++++++++++++++++++++++++++--
 hw/block/nvme.h        |  1 +
 4 files changed, 56 insertions(+), 2 deletions(-)

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
index af5b2162e2b5..2aeb164dd508 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4242,7 +4242,7 @@ static void nvme_init_subnqn(NvmeCtrl *n)
     }
 }
 
-static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
+static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t cntlid)
 {
     NvmeIdCtrl *id = &n->id_ctrl;
     uint8_t *pci_conf = pci_dev->config;
@@ -4252,6 +4252,9 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
     strpadcpy((char *)id->fr, sizeof(id->fr), "1.0", ' ');
     strpadcpy((char *)id->sn, sizeof(id->sn), n->params.serial, ' ');
+
+    id->cntlid = cntlid;
+
     id->rab = 6;
     id->ieee[0] = 0x00;
     id->ieee[1] = 0x02;
@@ -4297,6 +4300,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->psd[0].enlat = cpu_to_le32(0x10);
     id->psd[0].exlat = cpu_to_le32(0x4);
 
+    if (n->subsys) {
+        id->cmic |= NVME_CMIC_MULTI_CTRL;
+    }
+
     NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
     NVME_CAP_SET_CQR(n->bar.cap, 1);
     NVME_CAP_SET_TO(n->bar.cap, 0xf);
@@ -4309,11 +4316,28 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
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
@@ -4329,7 +4353,11 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
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
index 2061e53e2cee..329902a9fc04 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -129,6 +129,7 @@ typedef struct NvmeCtrl {
     NvmeBus      bus;
     BlockConf    conf;
 
+    uint16_t    cntlid;
     bool        qs_created;
     uint32_t    page_size;
     uint16_t    page_bits;
-- 
2.17.1


