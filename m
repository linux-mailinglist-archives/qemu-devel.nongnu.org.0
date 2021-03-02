Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F1C32A101
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:34:40 +0100 (CET)
Received: from localhost ([::1]:49126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5Ad-0001eX-5k
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH532-0002D6-1u; Tue, 02 Mar 2021 08:26:48 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:35759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH530-0001d8-C6; Tue, 02 Mar 2021 08:26:47 -0500
Received: by mail-pf1-x429.google.com with SMTP id o188so7169744pfg.2;
 Tue, 02 Mar 2021 05:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ynr1Xdhd/PThGQwcbxEF5xL/HgXb/2YFBfEqmh6dyCU=;
 b=GdGrPnF+a83mMlF6pJSes0wcmjXUN8grhriRBKcYf/ABkef8fCE1AQcRMvaQQyEBvb
 PoYj9kY6r/OXvj+tWJpYMSKSOk3LsMpn0DwKTsuw6dFX6lXU2loZETWx2NSNbAUDDnOg
 JPji7hCmbTlGvwFhe6TVmTNot0jQbBPfA+ouanVwJo/a87MN5Zj+fXE5pIDRyCRIRBII
 naHkxuVwIsFa8OO3991wnBUC7vO6StPfFrCSUsemnbpScaWzqJFe0Cb8rbBN7MSiCI1D
 Oc0YK8Zvn1vNiwuajs6aj1mVkM6QFYKAxwMtNTIFV2ruuAEoHPJsfbsP8f6nX/i1ci+L
 ggDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ynr1Xdhd/PThGQwcbxEF5xL/HgXb/2YFBfEqmh6dyCU=;
 b=eIpg1P4gslBG/0c1OQlx31J7EBYHEKj8Vsu4ibgMEhDmJ4BzzZHj6V79m1+yMMoiiK
 tlEkXtW9Z/CjsSEhJyHPhY2/ODOPcjMjD7PTHTaCjHJ8Hsq3PioxMp5zCy11q/14Eh8f
 en8g+lJgiqPxwCVB6Ng+xNIB4NEs4n9KVYl/BypYGed/D/e+DIh05RWiVwziDTTLJ81z
 OuIaqy3Hp7WlUMfV9nmB29+GFIOP6F+wFiXSObnTD4jgomsf5yOiPppuOx66CwtmT+Lu
 LUYe9l4U5dyxh8cVLRUoyE0FN9jJfNQdWStmDNU2+ypZ/4AG50/J2BS8Jhl26tUVNV5O
 rw1A==
X-Gm-Message-State: AOAM530zkLiJNfgPUwKK67Aui6MuOEfQNIadpEUr0d9188YtvZBRmlsv
 9nhi8S/HWBnqs4K2g/WK2Apj9l0ycQdETA==
X-Google-Smtp-Source: ABdhPJz0WupYl+5keiJaMTgfOfNpIrj9aORJLhdbnL6ZV82DPAlj88FnhaPSBgUwyCYgcCwZNEmNgA==
X-Received: by 2002:aa7:9246:0:b029:1ed:cfa4:f1a8 with SMTP id
 6-20020aa792460000b02901edcfa4f1a8mr3252989pfp.73.1614691604509; 
 Tue, 02 Mar 2021 05:26:44 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id u7sm20166956pfh.150.2021.03.02.05.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:26:44 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V4 8/8] hw/block/nvme: support Identify NS Attached Controller
 List
Date: Tue,  2 Mar 2021 22:26:17 +0900
Message-Id: <20210302132617.18495-9-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
References: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 7e6f91923fd7..7b79b6b5265d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3303,6 +3303,46 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
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
@@ -3502,6 +3542,8 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
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
2.27.0


