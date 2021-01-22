Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09590300298
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 13:13:02 +0100 (CET)
Received: from localhost ([::1]:55594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2vJF-0004UE-17
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 07:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2vEV-0008RJ-QP; Fri, 22 Jan 2021 07:08:07 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:41757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2vER-0001v1-Kb; Fri, 22 Jan 2021 07:08:07 -0500
Received: by mail-pf1-x431.google.com with SMTP id q20so3542063pfu.8;
 Fri, 22 Jan 2021 04:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UyIGV4RaYW8+BtNKgF8fPnPcHXbvYoyUV1nS/YXwuoE=;
 b=jYdA/nenv5oY/qG2kU1fZef+VbSXAT8GEkN9U8M00gvXVVBqTETZCYMqT0NxukDIWr
 7zYwBNhnL44cZIe6KIKqQ6pOdmFI5aDKne2hfeTCqmUEQ1LScA6dPOJODgiRYuzopW93
 y06I9YtLybibI3EkD3YVNRNpPh/jtwphz2NTw7qODzU03Onq+oao4a7DkBDLy0JkVSQh
 /bNfFGeBCeV2i0VqDvyi+/6EOXT+LF+ChCG2l1g4AW91jG2KCWjx/dJhhyNWnC1xp0q4
 EvBDD3TUlrf1mSmj2OxPP8nawr4x9C/8ICnsHvnbwM2EVI3KFwdqHX9DBZ5I4V04XRuq
 YGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UyIGV4RaYW8+BtNKgF8fPnPcHXbvYoyUV1nS/YXwuoE=;
 b=r2sH8BKFSX407PD9cTcQx8qg1umxhIvTG82vVivtCJHz1hUtc79+9YuVisRUB2IsDO
 ovw80l3EjTCWVGYJlOBv2bwYqj4LWkJwBWE/qiVkJ/JYiTEa7SB3LOouq8jSQuvaO9JE
 z0r29JpiIcNMD/87g7yAy1qELn/9I7ajW5xCfluuNBuc9876j33DKIjXMq1ZlVAW7Yi2
 v9s+mSqJHyzzKUz42aGp15ZaA+/UQ0q3x9vYoQx0E4w/uhsAMLG3mGtr0RCok2yRepNo
 mxW6RE5nyQdgl7C0AU9nHED38dM3mBkGa+Kq1pab1crbCDBbNAiNxbmuvkxl0AtiipB4
 DTag==
X-Gm-Message-State: AOAM531vQtABPD9FAGAUM5W528N5dWFnOQBM1vXU2v5aBpJGCBzzDEQL
 d+z7NCAGKZPXqxcBzV9wgykLOqQ5mB4zdw==
X-Google-Smtp-Source: ABdhPJxjKxSvihhABLv56I3DwdRRN4JwmTMJ0nPcIU2VtqA/kDK4X9v2yrwHI2O4QHkwfDLPZmTXPw==
X-Received: by 2002:a62:2e86:0:b029:1a6:5f94:2cb with SMTP id
 u128-20020a622e860000b02901a65f9402cbmr4770257pfu.19.1611317281652; 
 Fri, 22 Jan 2021 04:08:01 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id mv17sm9104440pjb.17.2021.01.22.04.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 04:08:01 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V5 4/6] hw/block/nvme: support for multi-controller in
 subsystem
Date: Fri, 22 Jan 2021 21:07:34 +0900
Message-Id: <20210122120736.5242-5-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122120736.5242-1-minwoo.im.dev@gmail.com>
References: <20210122120736.5242-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x431.google.com
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
index b525fca14103..3dedefb8ebba 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4435,6 +4435,9 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
     strpadcpy((char *)id->fr, sizeof(id->fr), "1.0", ' ');
     strpadcpy((char *)id->sn, sizeof(id->sn), n->params.serial, ' ');
+
+    id->cntlid = n->cntlid;
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


