Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD8D2FF7C3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:12:36 +0100 (CET)
Received: from localhost ([::1]:58290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2iBv-0000rf-RB
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2i8r-0006RI-HO; Thu, 21 Jan 2021 17:09:25 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2i8p-0000Lj-Pf; Thu, 21 Jan 2021 17:09:25 -0500
Received: by mail-pg1-x532.google.com with SMTP id g15so2270100pgu.9;
 Thu, 21 Jan 2021 14:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4tTcTEd0XY2xyJQ9r1T83wCvH6NeJWAkeGCZOLKhte4=;
 b=qAqReFQX0LCSbzIj1MtSNRfJ/9EU3lumH0+niLJL+z+mVIuXuCNz+37otHxPK7+a1h
 TfEp58dU9sbjbvWrMYKRQy6NJIdWIonmG9C2jqFgnwZHsLt3ZmCyB9XRccGGMxLpfqH2
 DJS203oFXARpglB4b5wIbZlDuRIRrueRsjI8jSUkk74wDc1wtu/mvdPPbjugg3O5IlVH
 58gkT+03XGI7onMYcDeOWwsQ4ZBZ+FlNHNJjoC3ejp8XYJiOjfLRtGVzoCgXQZDAwEJQ
 wMJQitihcJVk5plBG5OZsoHZ1LuyLLjeGEvocJj5cuyHkUKcppZ7fZCq1rO3qNoQgjG3
 0P8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4tTcTEd0XY2xyJQ9r1T83wCvH6NeJWAkeGCZOLKhte4=;
 b=jGGxlNiJJubulNEansbkpNZSeuXcZanhQrS8mAGsAVXmhPAT7+LTiuAimbQAXVIRdG
 jyUEHLevB6WrCYuNQx7szrpgOWvbwnhB28e85Soe04zo5Vp2PY2FaECiO3M54iFCqqNh
 61mFYE5QR3xeXmOVjcc3AwrbpVoWWxxebazJ6rBzfPOhqpGw+aQb6v82NSSVI5Md7L8a
 +FXpOErt7zLf+0ARtR9oQ7mWmDIaW9QPJKRiMOGPkfULuUjXb5uKPfdghH1sZu6G3hWv
 wBTJqDNis1p5YEEMo0lIIMmXk/yCWeSHRbW9PjKsIB2tVa04jU94i55vbTJZfwH5uINI
 XWfA==
X-Gm-Message-State: AOAM532PePlCBk4xFWYjbM2ZkwqjT+GUburkYABzWw3dRWO0zSsOL4Vs
 CPMHqVVAsPYFyI/8uaDfMbo/j1zHEmbAtw==
X-Google-Smtp-Source: ABdhPJz5ZfWCZpP14Nt8cwdTBXzI41bUi+7SswMZpiNLUcMbYfd+ORVkEyJ5I+K4M0lT4udutcNG6w==
X-Received: by 2002:a05:6a00:2127:b029:1bb:b6de:c875 with SMTP id
 n7-20020a056a002127b02901bbb6dec875mr1591162pfj.72.1611266961478; 
 Thu, 21 Jan 2021 14:09:21 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id c8sm5584308pfo.148.2021.01.21.14.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 14:09:21 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V4 2/6] hw/block/nvme: support to map controller to a subsystem
Date: Fri, 22 Jan 2021 07:09:04 +0900
Message-Id: <20210121220908.14247-3-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
References: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x532.google.com
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
index aabccdf36f4b..ab0531492ddd 100644
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
@@ -4404,11 +4412,25 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
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
@@ -4455,9 +4477,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
                            NVME_CTRL_SGLS_BITBUCKET);
 
-    subnqn = g_strdup_printf("nqn.2019-08.org.qemu:%s", n->params.serial);
-    strpadcpy((char *)id->subnqn, sizeof(id->subnqn), subnqn, '\0');
-    g_free(subnqn);
+    nvme_init_subnqn(n);
 
     id->psd[0].mp = cpu_to_le16(0x9c4);
     id->psd[0].enlat = cpu_to_le32(0x10);
@@ -4545,6 +4565,8 @@ static Property nvme_props[] = {
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


