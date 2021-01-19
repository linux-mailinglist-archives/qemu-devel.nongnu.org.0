Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EC22FBD3F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:13:40 +0100 (CET)
Received: from localhost ([::1]:59194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uZX-0001E5-2D
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:13:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uOM-00085C-53; Tue, 19 Jan 2021 12:02:06 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uOK-0003GT-36; Tue, 19 Jan 2021 12:02:05 -0500
Received: by mail-pj1-x102f.google.com with SMTP id x20so265617pjh.3;
 Tue, 19 Jan 2021 09:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vLWTKLuTjiXeZUE+TodHUrJauWcs1Y9kM2vRgX7/zlU=;
 b=MZ7atprIbza1EzN1yY5YS55WBh8UElYduUNdcYhF1W6rfKLuQ+3ZobwxvY5dOS7QQx
 4BbaAaeRfzaVgHPao5J2uGjN0Vt7tyr/FPb+UctzQko60NZS2i9FCGmqJWly1c4PiQZ4
 beJa/WaM/x3H0bStZT3/Tm3dKcg3LfE1HHesf3Mzt+f5KkJ/jjjgtsaAsRCwXL+3u4Ta
 Xe1EvvsGxQXkkwP+BttV27pKljY+2/oIeIQSOFXsL32vaGfK62c55wjLlyVGIM7gLMem
 kIsuui3RypgHQbBRvZ/iFtzUycQh/iyXW2ry3lt5l7XagUH6tF6odB+QDj3PHUTZAMDj
 gwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vLWTKLuTjiXeZUE+TodHUrJauWcs1Y9kM2vRgX7/zlU=;
 b=MiOlNIZ3ZQkb4LxauyNwakjR5TYdESSIjj6+tqznjP3xZmbHirq/vJj9YKFnGdykmB
 ALtjDt6uUudAdka/d9a3jbpyowt10vsN5LoYnvAoC+SAnDfdJmuwSMdy/iQkd4XK/CMw
 Hw1IYKVOdC+IVFLs+tiUfwx9ie6vkuhzMl6EzQFf+TGzQoKWdDNuHAq4F93KTQ3Hg1Bk
 sHDucJvdniaiJFpZkJA42ovWC8cLTEt3T7QZCtFpYYilFRETReSaUxL0149iZsj4zhzN
 W9RqSYoaFHALl4mdyonQs79lw1/2Epix4TUQ3ICJ1o4K6rsS02Gvfh6iIGze+PGf4Kj7
 7FZQ==
X-Gm-Message-State: AOAM532sqR9gVrNVBDHLTZc5APjEoTO6lgzSNGkzJhegEKDnY572C5JC
 wR4Z5SSUkUVKpaRhgKLOD7IV+igq3/BapQ==
X-Google-Smtp-Source: ABdhPJw4odhJrhcV++QtHFeGETZkRwj0agkKrTkAtYSgrKTtZht8taqj3RKyV4qr4hBZ30Oa/qffxQ==
X-Received: by 2002:a17:902:8503:b029:dc:44f:62d8 with SMTP id
 bj3-20020a1709028503b02900dc044f62d8mr5699920plb.34.1611075720587; 
 Tue, 19 Jan 2021 09:02:00 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id m4sm19396001pgv.16.2021.01.19.09.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:01:59 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V3 2/8] hw/block/nvme: support to map controller to a
 subsystem
Date: Wed, 20 Jan 2021 02:01:41 +0900
Message-Id: <20210119170147.19657-3-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102f.google.com
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
index 4644937a5c50..3e3b5451ea3d 100644
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
@@ -4281,11 +4289,25 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
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
@@ -4331,9 +4353,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
                            NVME_CTRL_SGLS_BITBUCKET);
 
-    subnqn = g_strdup_printf("nqn.2019-08.org.qemu:%s", n->params.serial);
-    strpadcpy((char *)id->subnqn, sizeof(id->subnqn), subnqn, '\0');
-    g_free(subnqn);
+    nvme_init_subnqn(n);
 
     id->psd[0].mp = cpu_to_le16(0x9c4);
     id->psd[0].enlat = cpu_to_le32(0x10);
@@ -4417,6 +4437,8 @@ static void nvme_exit(PCIDevice *pci_dev)
 
 static Property nvme_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeCtrl, namespace.blkconf),
+    DEFINE_PROP_LINK("subsys", NvmeCtrl, subsys, TYPE_NVME_SUBSYS,
+                     NvmeSubsystem *),
     DEFINE_PROP_LINK("pmrdev", NvmeCtrl, pmrdev, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
     DEFINE_PROP_STRING("serial", NvmeCtrl, params.serial),
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 347c149e7905..3fa0e0a15539 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -2,6 +2,7 @@
 #define HW_NVME_H
 
 #include "block/nvme.h"
+#include "nvme-subsys.h"
 #include "nvme-ns.h"
 
 #define NVME_MAX_NAMESPACES 256
@@ -158,6 +159,8 @@ typedef struct NvmeCtrl {
 
     uint8_t     zasl;
 
+    NvmeSubsystem   *subsys;
+
     NvmeNamespace   namespace;
     NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
     NvmeSQueue      **sq;
-- 
2.17.1


