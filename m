Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B58F30194C
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 04:04:54 +0100 (CET)
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3Vht-0001kT-11
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 22:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l3VYZ-0000Qh-CS; Sat, 23 Jan 2021 21:55:15 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l3VYW-0003j2-Uq; Sat, 23 Jan 2021 21:55:15 -0500
Received: by mail-pg1-x535.google.com with SMTP id n25so6627567pgb.0;
 Sat, 23 Jan 2021 18:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DTj2aGM1/xjfCWZbhFHeSQReQnHkNso3QEjVPVOb3W4=;
 b=Wk3tvhR1rlp+6I4KgsIw2kbTXOKJnbP4ffDMPLdX+f+bvt+7q21I8bQAoY+ys7ejX7
 JQ6gwB2uduKyGFOsqU3nBFSe/vwncFnBZ5MkPiELolMaePFREFg/NV/PSo4bi1P8+HsQ
 uih1jAPAwceeKMN2gaOhndsEI8WB1BYcvTw0siawBlAMmH7mLiNhYW8r4h/blfXwtoUg
 lRzpgllci3LusG01rE1Qf4xo6r3ymxsgdKn5vOZVVmo1/M/jHZ699StvRFN9levsVJ9D
 lUjz6OqWzPVFvNlL7dzMYJC309mPGz46nBGLUl5DkIM0Ar/S0K/QXVZ+oaofWt2Lz6Ys
 ++Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DTj2aGM1/xjfCWZbhFHeSQReQnHkNso3QEjVPVOb3W4=;
 b=COuCYHx8rTCnmSGNk2CJSQVDH+mESiA6GlHRudg8Ij7jHSjhNIH69cy7ofhrTcwSIa
 b1nno5L9g6h1jm2ZOF4llGyE5wmuylIsg7XoXTBAGzfv4hu05h0zkPsjs+dZi3QBofb5
 ww/0rzTa2scH8qHmfCBSxMr9FylWLOMAKssdp+is1kU8ZllGzhMQOMlRDa+EL1bzLohJ
 YYyP56ruUyTIdlwphSov+AcOCdHdi43k/17U4Gh7t1ZBtgCTnV+gFUyhhaFfn8/iy5lU
 mbS3iO9e13ZSdJ1cxlp7G7++wvcKZcsI3O30ia63t7xcm9j/z3ybtKn9rDYrgFBHt4hN
 hUdg==
X-Gm-Message-State: AOAM533+MqPXnI+vVse44OIlGbRsO4+gne+sjFmaYbBvTMzqCENNfG9d
 +hhxVMGjJvTSh1aQIhAS5iWaFcWOMbD1Bg==
X-Google-Smtp-Source: ABdhPJy9kOCM0z61zrfTqDEDFWaqoRD+bQgsrgSM5TIhOex4XdzezLaqLLk06YxT1HpUr4r1kYz9AA==
X-Received: by 2002:a62:ee03:0:b029:1a9:cc29:7d1f with SMTP id
 e3-20020a62ee030000b02901a9cc297d1fmr138089pfi.24.1611456909563; 
 Sat, 23 Jan 2021 18:55:09 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 77sm314842pfx.130.2021.01.23.18.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:55:09 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V6 4/6] hw/block/nvme: support for multi-controller in
 subsystem
Date: Sun, 24 Jan 2021 11:54:48 +0900
Message-Id: <20210124025450.11071-5-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x535.google.com
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
 hw/block/nvme.c        | 29 +++++++++++++++++++++++++++++
 hw/block/nvme.h        |  1 +
 4 files changed, 55 insertions(+)

diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
index aa82911b951c..e9d61c993c90 100644
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
     snprintf((char *)subsys->subnqn, sizeof(subsys->subnqn),
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
index b525fca14103..7138389be4bd 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4435,6 +4435,9 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
     strpadcpy((char *)id->fr, sizeof(id->fr), "1.0", ' ');
     strpadcpy((char *)id->sn, sizeof(id->sn), n->params.serial, ' ');
+
+    id->cntlid = cpu_to_le16(n->cntlid);
+
     id->rab = 6;
     id->ieee[0] = 0x00;
     id->ieee[1] = 0x02;
@@ -4481,6 +4484,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->psd[0].enlat = cpu_to_le32(0x10);
     id->psd[0].exlat = cpu_to_le32(0x4);
 
+    if (n->subsys) {
+        id->cmic |= NVME_CMIC_MULTI_CTRL;
+    }
+
     NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
     NVME_CAP_SET_CQR(n->bar.cap, 1);
     NVME_CAP_SET_TO(n->bar.cap, 0xf);
@@ -4495,6 +4502,24 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
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
+    n->cntlid = cntlid;
+
+    return 0;
+}
+
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n = NVME(pci_dev);
@@ -4515,6 +4540,10 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         return;
     }
 
+    if (nvme_init_subsys(n, errp)) {
+        error_propagate(errp, local_err);
+        return;
+    }
     nvme_init_ctrl(n, pci_dev);
 
     /* setup a namespace if the controller drive property was given */
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


