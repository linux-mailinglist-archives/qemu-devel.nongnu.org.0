Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E9D3273A6
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 18:30:35 +0100 (CET)
Received: from localhost ([::1]:41788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGPtq-00084m-Ow
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 12:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGPfp-0001p4-Le; Sun, 28 Feb 2021 12:16:05 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGPfg-0008Fv-2H; Sun, 28 Feb 2021 12:16:05 -0500
Received: by mail-pg1-x536.google.com with SMTP id p21so9955826pgl.12;
 Sun, 28 Feb 2021 09:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/N+LQlyS49238I2Z5vttSrl07LTW96QPPv3xEPBssx4=;
 b=tgw95vfHxT1G7qoXHN6dtsT8zFdQ7subnN6y3q4DxIA8oTjDvlNYCmYFRhuthg50Co
 4T/2iNTtX2vUB4Y47glMRbrertq4XCRIvektSnCJE0hHuF0GNyug50SyBGmioOULkOkF
 MWBqsYAXNddxerZfOn01NtcyCJb6j3XB12EDv0G5Wqdge4h+zowcG1rJ7oCS3rO62rSb
 aDWvQa5azB+jL1dwi3HgxM8lhOmY4RJx/Yn5UQ31Wf9VFqDuzNCmStvqTkIbg3NOVXua
 lxStliK0BIDWGlp3Lfgy4TP724Ndv3JqEW6X3N+hfiQhd5eqOkW+ELecCOz26V3fiWN7
 ZQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/N+LQlyS49238I2Z5vttSrl07LTW96QPPv3xEPBssx4=;
 b=scH3MtXI1hB1OcVBZD5/VkEauHw2RKcojeUQB1jw59WTezEWYbMWXoLiKkxZSpUtRr
 +UL9SMX/JXVP6RgEo522KpcRIWgS8yxnioTrrOnc+qK0UmuJ4lVT5Ki6BhTgA2EUlAWE
 OdIRyR/u0muc3XtmA1o3JNZEbBR/lsuJL1tETRNs2PMZNsYmZhaaaw8enxFct5KXIcdH
 XTX7uUvyUAXGFuhawyoMFEnCuMq0xBqSJPxtUatOEP+Y5lZ4l7a86pZ1Acs9+F+Q0QyL
 Oz9y+JVW+jFky18WHpiZOgXHqY1zqu+U9A6Cs6E/7eAQzIaKsyAcJdwjO/DzvE4c1XhW
 M60w==
X-Gm-Message-State: AOAM530H6++XgNWoGqB3tw+RuDKb1d3xxW8kusESXZVHyTXK9kFKNi4k
 +ODAQeKWfg1gImT8MRC/Tx+HnVDRYSTuSg==
X-Google-Smtp-Source: ABdhPJztQrUVQxtHe17eR+m3MOIc8TQEGTOnlWLBhZHs5rqFoUZlr0zFEFQZJtHgFo1f0YPwjdVmEQ==
X-Received: by 2002:a62:4c1:0:b029:1ee:70e1:75c1 with SMTP id
 184-20020a6204c10000b02901ee70e175c1mr3911515pfe.23.1614528686326; 
 Sun, 28 Feb 2021 08:11:26 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x11sm14389781pja.46.2021.02.28.08.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 08:11:26 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V3 8/8] hw/block/nvme: support Identify NS Attached Controller
 List
Date: Mon,  1 Mar 2021 01:11:00 +0900
Message-Id: <20210228161100.54015-9-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
References: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x536.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>
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
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 42 ++++++++++++++++++++++++++++++++++++++++++
 hw/block/trace-events |  1 +
 include/block/nvme.h  |  1 +
 3 files changed, 44 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index fc06f806e58e..202fc94d0bb2 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3286,6 +3286,46 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
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
@@ -3485,6 +3525,8 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
         return nvme_identify_ns(n, req, true);
     case NVME_ID_CNS_NS_PRESENT:
         return nvme_identify_ns(n, req, false);
+    case NVME_ID_CNS_NS_ATTACHED_CTRL_LIST:
+        return nvme_identify_ns_attached_list(n, req);
     case NVME_ID_CNS_CS_NS:
         return nvme_identify_ns_csi(n, req, true);
     case NVME_ID_CNS_CS_NS_PRESENT:
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 98d542c999e2..2628d69c7879 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -64,6 +64,7 @@ pci_nvme_del_cq(uint16_t cqid) "deleted completion queue, cqid=%"PRIu16""
 pci_nvme_identify_ctrl(void) "identify controller"
 pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
 pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
+pci_nvme_identify_ns_attached_list(uint16_t cntid) "cntid=%"PRIu16""
 pci_nvme_identify_ns_csi(uint32_t ns, uint8_t csi) "nsid=%"PRIu32", csi=0x%"PRIx8""
 pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_nslist_csi(uint16_t ns, uint8_t csi) "nsid=%"PRIu16", csi=0x%"PRIx8""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index eb0b31e949c2..b18945913927 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -971,6 +971,7 @@ enum NvmeIdCns {
     NVME_ID_CNS_CS_NS_ACTIVE_LIST     = 0x07,
     NVME_ID_CNS_NS_PRESENT_LIST       = 0x10,
     NVME_ID_CNS_NS_PRESENT            = 0x11,
+    NVME_ID_CNS_NS_ATTACHED_CTRL_LIST = 0x12,
     NVME_ID_CNS_CS_NS_PRESENT_LIST    = 0x1a,
     NVME_ID_CNS_CS_NS_PRESENT         = 0x1b,
     NVME_ID_CNS_IO_COMMAND_SET        = 0x1c,
-- 
2.25.1


