Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80452F9329
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 16:03:50 +0100 (CET)
Received: from localhost ([::1]:44934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l19an-0004xX-SK
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 10:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RX-0004Ys-Vy; Sun, 17 Jan 2021 09:54:16 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:34091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RR-00047Y-NN; Sun, 17 Jan 2021 09:54:15 -0500
Received: by mail-pf1-x429.google.com with SMTP id m6so8664133pfk.1;
 Sun, 17 Jan 2021 06:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zlpwnwAv5g9ETjdNtjndtNHZTjD++61r7danBZbY8Uw=;
 b=iL/hLv/maP5dF406Ex+jVh2bIbIgPS/KUMO5jA5Or9lEXtO7owV2cjgTbCMy78I+NQ
 WSUKW6n5vUhFcfwtL1hJx7rAsK1kHdi3oyhsqzODvafcOTJi4eqVLkdJfaaVKAh48nwc
 4W9WX4cxauo1wxGWyJTi+Z9e/Z9z0QUqdsw0Ww4A8BdF+UkOAMGGePihnMlHb5xMJYnv
 a2bYGGCWSSNFDoMdRgyrXtGCm/f5NbpNRDEY9UII5wVInzXeTXYUvzDxWA4TKMN9gqRd
 gM81DRWsP5NEjvgtlizKFeBFXfn9lGOsND+49YAXyTiH9SjV502BDzRh8xt/2nrxUjDE
 QiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zlpwnwAv5g9ETjdNtjndtNHZTjD++61r7danBZbY8Uw=;
 b=ONOWbl9DAHSPGdQSut/HysyGGax7P4dyiTOC8uddhd7vLVI8yprqlsHIqa2eVUb1C0
 7og3++br2FnbKETU5CSb2n3Nn+SN2kUQ4hMSHn/RjrqG90JqUOqxnVUkoePboiz8tZxb
 1M0lvmnEHC4xW+Bj+UtlRzC24Rfx0WumMlkg5e0vEJRvLb/tArn31M0dbL1iLGtmDpsP
 L0I9ik9d7NZUAiifLNdKcO2qdPuydLAm8mzjPfSQcVbAI/tLPPlr+MHD25MNsZc5HQBe
 YXVCjoPpCzic7oK2Y5PqPnot2Hi5UGMmkfEtWd26MnreMyV70FQVVB97txrRmBeaqjHQ
 9uEg==
X-Gm-Message-State: AOAM532go4hgibLuphZJLd2Ks+4nMHbNrHfYMvkYS52Akps44CmbRm1I
 ZVUrQHsMXglu00FR/2cRbFQLTF4yQZzBkQ==
X-Google-Smtp-Source: ABdhPJzi8YpjV12cGnRPEZksxwTJGLoK2iuJeiSZpRIkCI9TzstJbEt2szMoCCmmc0oNcO9C7zOgXQ==
X-Received: by 2002:a63:a556:: with SMTP id r22mr22185686pgu.296.1610895246838; 
 Sun, 17 Jan 2021 06:54:06 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x127sm13143583pfb.74.2021.01.17.06.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 06:54:06 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V2 07/11] hw/block/nvme: support to map controller to a
 subsystem
Date: Sun, 17 Jan 2021 23:53:37 +0900
Message-Id: <20210117145341.23310-8-minwoo.im.dev@gmail.com>
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

nvme controller(nvme) can be mapped to a NVMe subsystem(nvme-subsys).
This patch maps a controller to a subsystem by adding a parameter
'subsys' to the nvme device.

To map a controller to a subsystem, we need to put nvme-subsys first and
then maps the subsystem to the controller:

  -device nvme-subsys,id=subsys0
  -device nvme,serial=foo,id=nvme0,subsys=subsys0

If 'subsys' property is not given to the nvme controller, then subsystem
NQN will be created with serial (e.g., 'foo' in above example),
Otherwise, it will be based on subsys id (e.g., 'subsys0' in above
example).

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 30 ++++++++++++++++++++++++++----
 hw/block/nvme.h |  3 +++
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index dde83aafc33d..af5b2162e2b5 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -23,6 +23,7 @@
  *              max_ioqpairs=<N[optional]>, \
  *              aerl=<N[optional]>, aer_max_queued=<N[optional]>, \
  *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]> \
+ *              ,subsys=<subsys_id> \
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>
  *      -device nvme-subsys,id=<subsys_id>
@@ -43,6 +44,13 @@
  *
  * nvme device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~
+ * - `subsys`
+ *   NVM Subsystem device. If given, a subsystem NQN will be initialized with
+ *   <subsys_id> given. Otherwise, <serial> will be taken for subsystem NQN.
+ *   Also, it will enable multi controller capability represented in Identify
+ *   Controller data structure in CMIC (Controller Multi-path I/O and Namesapce
+ *   Sharing Capabilities), if given.
+ *
  * - `aerl`
  *   The Asynchronous Event Request Limit (AERL). Indicates the maximum number
  *   of concurrently outstanding Asynchronous Event Request commands support
@@ -4219,11 +4227,25 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     return 0;
 }
 
+static void nvme_init_subnqn(NvmeCtrl *n)
+{
+    NvmeSubsystem *subsys = n->subsys;
+    NvmeIdCtrl *id = &n->id_ctrl;
+    char *subnqn;
+
+    if (!subsys) {
+        subnqn = g_strdup_printf("nqn.2019-08.org.qemu:%s", n->params.serial);
+        strpadcpy((char *)id->subnqn, sizeof(id->subnqn), subnqn, '\0');
+        g_free(subnqn);
+    } else {
+        pstrcpy((char *)id->subnqn, sizeof(id->subnqn), (char*)subsys->subnqn);
+    }
+}
+
 static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 {
     NvmeIdCtrl *id = &n->id_ctrl;
     uint8_t *pci_conf = pci_dev->config;
-    char *subnqn;
 
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
@@ -4269,9 +4291,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
                            NVME_CTRL_SGLS_BITBUCKET);
 
-    subnqn = g_strdup_printf("nqn.2019-08.org.qemu:%s", n->params.serial);
-    strpadcpy((char *)id->subnqn, sizeof(id->subnqn), subnqn, '\0');
-    g_free(subnqn);
+    nvme_init_subnqn(n);
 
     id->psd[0].mp = cpu_to_le16(0x9c4);
     id->psd[0].enlat = cpu_to_le32(0x10);
@@ -4355,6 +4375,8 @@ static void nvme_exit(PCIDevice *pci_dev)
 
 static Property nvme_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeCtrl, namespace.blkconf),
+    DEFINE_PROP_LINK("subsys", NvmeCtrl, subsys, TYPE_NVME_SUBSYS,
+                     NvmeSubsystem *),
     DEFINE_PROP_LINK("pmrdev", NvmeCtrl, pmrdev, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
     DEFINE_PROP_STRING("serial", NvmeCtrl, params.serial),
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 5ba83ee77841..2061e53e2cee 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -2,6 +2,7 @@
 #define HW_NVME_H
 
 #include "block/nvme.h"
+#include "nvme-subsys.h"
 #include "nvme-ns.h"
 
 #define NVME_MAX_NAMESPACES 256
@@ -154,6 +155,8 @@ typedef struct NvmeCtrl {
 
     uint8_t     zasl;
 
+    NvmeSubsystem   *subsys;
+
     NvmeNamespace   namespace;
     NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
     NvmeSQueue      **sq;
-- 
2.17.1


