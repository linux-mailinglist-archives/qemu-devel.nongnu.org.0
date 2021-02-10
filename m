Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BB9316AD3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:13:31 +0100 (CET)
Received: from localhost ([::1]:36884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9s7O-0001nv-LG
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9s49-0007m0-Am; Wed, 10 Feb 2021 11:10:09 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9s46-0000FL-Db; Wed, 10 Feb 2021 11:10:09 -0500
Received: by mail-pf1-x42b.google.com with SMTP id u143so1546169pfc.7;
 Wed, 10 Feb 2021 08:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=++uTf666R3wKZnxlt4XChne+EiWFypgm0bWWXtcnXnU=;
 b=Qw15K1VDwLLP3lAZU+d0tFHzHAGDbMzzT0JZRiJCcAgTKhfPnISubH6OlBxicZxvmo
 RYyrnQqb8fdMz67xj0a63+bzzI0lGukI3lAtNmTrcrX24n7rQ1zLUHt5g9xlYc5Ta3xa
 6xIIGhCZcHVn/TlUjtJ3+ZJfCN79KVB3pSwEDeuQM3OLiyoao3Ysv5SJLe6dt/AifgkR
 TTyIy2vLGkhSwvvf9bYCYhQy8pWE2BVajaH2s7U97QkDBogDn3xXSkqx9aJkfgGsnnjZ
 UjUewi8k1VzIoprDP9DbICzQtJNmKoj0gRqNDVlZhdqHE8E0Cjc/ztpV6vdS3QY53Wc2
 L6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=++uTf666R3wKZnxlt4XChne+EiWFypgm0bWWXtcnXnU=;
 b=UzLY6DXHVPECT0Twfs2HISrfLTGK2qpuYQdRVrlIQb7iEJUyYdTYyF3gy1UzqCfVCP
 y3eOA2CfdPRAgwPZNBG4VWTW1Tkh7FDlk+rE682o9b9XXUDyGhj901ABhlAY5Obw3qYm
 TCJeuFLwmCR40rV7LpdBJms8nAiNXjRkj7gCXrz2Axclle9+f46BBGkoZ/EvX7LERNRj
 p4Y0zcE1eV0Fcwrz5qRjsjYcSy0EW33o08pOxUI94+6ewcS9Ae7cF/SAVl60vDEUd/I9
 sy81IaiYK/FYzhXnV41OM7IACGKkIBmKH75N48NID4E6P1MqU+lXXKN6bWHwCFJ+i9Wz
 r8QQ==
X-Gm-Message-State: AOAM531CY8ox3smJcTpk8eC3h+/DZSTius7U1QAobZkoHjnmnnU3Ss00
 GnwkviBpVBlHM+DanKJAzr0aZqhing9ChA==
X-Google-Smtp-Source: ABdhPJy4wo0nT96OUiIMZNnWPA7XI6u8uO6KE3ZTB+uXiQPRZin7IcxO9KKvY70IzqqpSaCqwdsW9w==
X-Received: by 2002:a63:1241:: with SMTP id 1mr3707076pgs.350.1612973403509;
 Wed, 10 Feb 2021 08:10:03 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 25sm2761195pfj.120.2021.02.10.08.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 08:10:03 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V2 7/7] hw/block/nvme: support Identify NS Attached Controller
 List
Date: Thu, 11 Feb 2021 01:09:37 +0900
Message-Id: <20210210160937.1100-8-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
References: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x42b.google.com
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

Support Identify command for Namespace attached controller list.  This
command handler will traverse the controller instances in the given
subsystem to figure out whether the specified nsid is attached to the
controllers or not.

The 4096bytes Identify data will return with the first entry (16bits)
indicating the number of the controller id entries.  So, the data can
hold up to 2047 entries for the controller ids.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c       | 42 ++++++++++++++++++++++++++++++++++++++++++
 hw/block/trace-events |  1 +
 include/block/nvme.h  |  1 +
 3 files changed, 44 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 71bcd66f1956..da60335def9f 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3157,6 +3157,46 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
     return NVME_INVALID_CMD_SET | NVME_DNR;
 }
 
+static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
+    uint16_t min_id = le16_to_cpu(c->ctrlid);
+    uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
+    uint16_t *ids = &list[1];
+    NvmeNamespace *ns;
+    NvmeCtrl *ctrl;
+    int cntlid, nr_ids = 0;
+
+    trace_pci_nvme_identify_ns_attached_list(min_id);
+
+    if (c->nsid == NVME_NSID_BROADCAST) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    ns = nvme_subsys_ns(n->subsys, c->nsid);
+    if (!ns) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    for (cntlid = min_id; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid++) {
+        ctrl = nvme_subsys_ctrl(n->subsys, cntlid);
+        if (!ctrl) {
+            continue;
+        }
+
+        if (!nvme_ns_is_attached(ctrl, ns)) {
+            continue;
+        }
+
+        ids[nr_ids++] = cntlid;
+    }
+
+    list[0] = nr_ids;
+
+    return nvme_dma(n, (uint8_t *)list, sizeof(list),
+                    DMA_DIRECTION_FROM_DEVICE, req);
+}
+
 static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
         bool active)
 {
@@ -3356,6 +3396,8 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
         return nvme_identify_ns(n, req, true);
     case NVME_ID_CNS_NS_PRESENT:
         return nvme_identify_ns(n, req, false);
+    case NVME_ID_CNS_NS_ATTACHED_CTRL_LIST:
+        return nvme_identify_ns_attached_list(n, req);
     case NVME_ID_CNS_CS_NS:
         return nvme_identify_ns_csi(n, req, true);
     case NVME_ID_CNS_CS_NS_PRESENT:
diff --git a/hw/block/trace-events b/hw/block/trace-events
index bf67fe7873d2..2d88d96c2165 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -62,6 +62,7 @@ pci_nvme_del_cq(uint16_t cqid) "deleted completion queue, cqid=%"PRIu16""
 pci_nvme_identify_ctrl(void) "identify controller"
 pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
 pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
+pci_nvme_identify_ns_attached_list(uint16_t cntid) "cntid=%"PRIu16""
 pci_nvme_identify_ns_csi(uint32_t ns, uint8_t csi) "nsid=%"PRIu32", csi=0x%"PRIx8""
 pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_nslist_csi(uint16_t ns, uint8_t csi) "nsid=%"PRIu16", csi=0x%"PRIx8""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 4b016f954fee..fb82d8682e9f 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -968,6 +968,7 @@ enum NvmeIdCns {
     NVME_ID_CNS_CS_NS_ACTIVE_LIST     = 0x07,
     NVME_ID_CNS_NS_PRESENT_LIST       = 0x10,
     NVME_ID_CNS_NS_PRESENT            = 0x11,
+    NVME_ID_CNS_NS_ATTACHED_CTRL_LIST = 0x12,
     NVME_ID_CNS_CS_NS_PRESENT_LIST    = 0x1a,
     NVME_ID_CNS_CS_NS_PRESENT         = 0x1b,
     NVME_ID_CNS_IO_COMMAND_SET        = 0x1c,
-- 
2.17.1


