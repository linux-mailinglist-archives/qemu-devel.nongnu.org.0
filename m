Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B746D30029B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 13:13:47 +0100 (CET)
Received: from localhost ([::1]:58694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2vJy-0005kv-NK
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 07:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2vEV-0008PV-CS; Fri, 22 Jan 2021 07:08:07 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2vEP-0001u5-P0; Fri, 22 Jan 2021 07:08:07 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 15so3546890pgx.7;
 Fri, 22 Jan 2021 04:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YwBe4YYkS5JT7ZD/trCcY77b8jZIwtzVoLSSmJTJ9Po=;
 b=QFguUmHbRCLDd9Bzlki01BtEQolBg4Q9WWzgFGvalMRo7O+RbenzDWLX5INmsuliRk
 X9jTuHq14vizCrDm6Qo9EJDZ51RN94xsc2CpWkOYlHhsJdjfiaDbFVI+v19Ag54OGDyc
 1vSX0UsZrPJmRuvlHl2QhtTT3pXCF9BGbWdr2TmSdpR6whE4FaASmY+kLbkEbzRprxl0
 1udnK65iK2YatrcTkGVFTe7Ld46tQMZezM3gDu9R5PNpcK/xaVvkH2oGMDYl5I5agZEo
 gyj/f+bmsZBnDHZxe9GJv2W0A8MJgwq4uzhqqgVVttIzLYWT3ZFm08cbbagTa7XvblBO
 ClfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YwBe4YYkS5JT7ZD/trCcY77b8jZIwtzVoLSSmJTJ9Po=;
 b=QTXlQ0TZZNcFMMEhf+0fWXd/oSkqsTY68iB6LR2Qy8GihW/1Y7hkSpPoHKIwZfgAKR
 oCKZvKV7bluxqX54feI3Kt1xnn/fCWVGzYXgBU/a8ML/E9SIyGgNwmgfMYQeRv7QZlZR
 Q5L2fTsaLm9HA0fgVYV1R+h2q25B+jTHWLtOuzIho56ACZbpBiD55veij+9J+Nv2aIQz
 5aY2r0pZPNpblML0SzwrsQDuw/1X1vEndmYhA9W1y5PhdSrUlBG2I6qRAK+aY5ETe4vh
 js6L0nDDqskqdSVnYVJj0Z78XkXHAVZjrAOBBVmJKcXSSPwpXw4axnHDLRWxHx3GCHIC
 HfeA==
X-Gm-Message-State: AOAM532kAqYh/tXsyIAk1vKl3KuhdZCSZouFzytOg56fq1xbnWy/qutV
 r4AeCggJg1FvSq89f/+iTJ+ZcoSbnuR5tA==
X-Google-Smtp-Source: ABdhPJxX3z9a8Oevf/3DuvbA5ObDbSyHCyp1+caBfncxHLkbQZBUCA2j92uLf5OLAaRdb+SiRdOflg==
X-Received: by 2002:a62:838d:0:b029:1ba:9b85:2eac with SMTP id
 h135-20020a62838d0000b02901ba9b852eacmr4458892pfe.36.1611317276553; 
 Fri, 22 Jan 2021 04:07:56 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id mv17sm9104440pjb.17.2021.01.22.04.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 04:07:55 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V5 2/6] hw/block/nvme: support to map controller to a subsystem
Date: Fri, 22 Jan 2021 21:07:32 +0900
Message-Id: <20210122120736.5242-3-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122120736.5242-1-minwoo.im.dev@gmail.com>
References: <20210122120736.5242-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x52e.google.com
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


