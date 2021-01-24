Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE236301944
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 03:57:45 +0100 (CET)
Received: from localhost ([::1]:51122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3Vay-0002gs-Q4
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 21:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l3VYS-0000Lt-V8; Sat, 23 Jan 2021 21:55:09 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l3VYQ-0003hp-T3; Sat, 23 Jan 2021 21:55:08 -0500
Received: by mail-pj1-x1029.google.com with SMTP id g15so6376346pjd.2;
 Sat, 23 Jan 2021 18:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YwBe4YYkS5JT7ZD/trCcY77b8jZIwtzVoLSSmJTJ9Po=;
 b=oAMTgFZYtC0X5fo09UtwlftvbsBs80UZPl83J4YF7zZ3DAIZuqcZ4ID3J+XRlEDmBW
 3fsLHTK67x5e9dHHbKzcO1eGKnBWehnokc/BrxJrpKFll9ASB6/2L9+MIb2yQsGpv9FZ
 GBzrNRHS985bMj7LPYORg8iK5n4lB6z6j0xnH5EiZ3bsQFle/A+N9mH4hEoDnw7VB2l9
 8Zgu3PcQkFkH/aBOya2BZP2MLUCEAEF+0VJYPUjLKtjJz0Of5+JsGLl7Wn4BxoO3bOol
 AThPoIGmF/e2kY6ZfG7MUY54ztclfDDTpIz4AlyjRrY4IjKsqoOhGdqxBNa4aQFh9V/I
 8Wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YwBe4YYkS5JT7ZD/trCcY77b8jZIwtzVoLSSmJTJ9Po=;
 b=h2EuSzJoo6RFiqZHBrT6/JcxZMSMcWZ72lEl2I1n8GlkTdKj7QYPipB7MPES49/WBg
 VdrZchltOOmFd6WPbaf8B4cKlE3ZUd8EtqIS/ojzue3ofC7i/qQYfwLTsIdNae3VvDxo
 qjQUIySPaAzfOi7fpewnHnnBa0Q/4vEgBZQPigsm6g4UStU3X3pRig/0lKQ0WuXe1We9
 TwdTRCP7Lx7AZ1UhCOzDQoLNWwO4rHUH3Wdmgi4hJ78ujV9e97h27l7NbISYRaJJsugz
 upf+LHsrmdLacpcSjfiqKbmmHCV9Sdc/VHYFe3CrcXixI3Y0pypoRDS9aKWnJseGwvEu
 M9wQ==
X-Gm-Message-State: AOAM532HyfkHTDSEBPtDctbVoO66jxCCrEq9nffARuBIXiOnJ2+70rFz
 dFNrsf/rx7LRbFJ02r1nqncTTs+VqCVNeQ==
X-Google-Smtp-Source: ABdhPJzdxha8bzQ6gtsalAcHLkBect559mZzxo6ClM41mXyn0j9XyusNMmlAfl1mRXpW5LlFQxSPFA==
X-Received: by 2002:a17:902:e741:b029:de:9cd1:35c8 with SMTP id
 p1-20020a170902e741b02900de9cd135c8mr12728767plf.18.1611456904964; 
 Sat, 23 Jan 2021 18:55:04 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 77sm314842pfx.130.2021.01.23.18.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:55:04 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V6 2/6] hw/block/nvme: support to map controller to a subsystem
Date: Sun, 24 Jan 2021 11:54:46 +0900
Message-Id: <20210124025450.11071-3-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1029.google.com
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
 hw/block/nvme.c | 30 +++++++++++++++++++++++++-----
 hw/block/nvme.h |  3 +++
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index aabccdf36f4b..b525fca14103 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -22,7 +22,8 @@
  *              [pmrdev=<mem_backend_file_id>,] \
  *              max_ioqpairs=<N[optional]>, \
  *              aerl=<N[optional]>, aer_max_queued=<N[optional]>, \
- *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]> \
+ *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]>, \
+ *              subsys=<subsys_id> \
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>
  *      -device nvme-subsys,id=<subsys_id>
@@ -44,6 +45,13 @@
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
@@ -4404,11 +4412,23 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     return 0;
 }
 
+static void nvme_init_subnqn(NvmeCtrl *n)
+{
+    NvmeSubsystem *subsys = n->subsys;
+    NvmeIdCtrl *id = &n->id_ctrl;
+
+    if (!subsys) {
+        snprintf((char *)id->subnqn, sizeof(id->subnqn),
+                 "nqn.2019-08.org.qemu:%s", n->params.serial);
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
@@ -4455,9 +4475,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
                            NVME_CTRL_SGLS_BITBUCKET);
 
-    subnqn = g_strdup_printf("nqn.2019-08.org.qemu:%s", n->params.serial);
-    strpadcpy((char *)id->subnqn, sizeof(id->subnqn), subnqn, '\0');
-    g_free(subnqn);
+    nvme_init_subnqn(n);
 
     id->psd[0].mp = cpu_to_le16(0x9c4);
     id->psd[0].enlat = cpu_to_le32(0x10);
@@ -4545,6 +4563,8 @@ static Property nvme_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeCtrl, namespace.blkconf),
     DEFINE_PROP_LINK("pmrdev", NvmeCtrl, pmr.dev, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
+    DEFINE_PROP_LINK("subsys", NvmeCtrl, subsys, TYPE_NVME_SUBSYS,
+                     NvmeSubsystem *),
     DEFINE_PROP_STRING("serial", NvmeCtrl, params.serial),
     DEFINE_PROP_UINT32("cmb_size_mb", NvmeCtrl, params.cmb_size_mb, 0),
     DEFINE_PROP_UINT32("num_queues", NvmeCtrl, params.num_queues, 0),
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index dee6092bd45f..04d4684601fd 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -2,6 +2,7 @@
 #define HW_NVME_H
 
 #include "block/nvme.h"
+#include "nvme-subsys.h"
 #include "nvme-ns.h"
 
 #define NVME_MAX_NAMESPACES 256
@@ -170,6 +171,8 @@ typedef struct NvmeCtrl {
 
     uint8_t     zasl;
 
+    NvmeSubsystem   *subsys;
+
     NvmeNamespace   namespace;
     NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
     NvmeSQueue      **sq;
-- 
2.17.1


