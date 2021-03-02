Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5621532A0F8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:33:03 +0100 (CET)
Received: from localhost ([::1]:42798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH594-0007RN-BC
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH52z-000279-Tv; Tue, 02 Mar 2021 08:26:45 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:41003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH52y-0001cp-00; Tue, 02 Mar 2021 08:26:45 -0500
Received: by mail-pf1-x42f.google.com with SMTP id q20so13828141pfu.8;
 Tue, 02 Mar 2021 05:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oK1V9VqyARNdDmSq8eaH0WXXEQqO+aHWjZRcixslDmo=;
 b=exnHQplFmGAEYbOcj2wHqUB/2E9e/7eEF7ZHsnllAVgeldnrMyXAngtPPd4hhR9yZQ
 Ety/zeO8FR8g4DjyzutgH6RBjMbOvr5g1x3TXUk7XHBsEqR6PWfYfbZCvf8btnlqIYTq
 496Y4Z/07c1cq8HsaoP39V9Qe0xpZZYE2lxQpHY+DgxhvEoGS3WDTZ7GuVQa2r1vaCxl
 G7hQmqD1Xpjp2v8+OHJuGkpr0NXL2JWraqJ5kNIrcREJw2Bfuqxg+1KTmFuO2LWka9Ik
 jUlfpPWhn0hmeMv54aPN3mfyfWHNlS1l6Kd3Ya6FzouywWnOGTuZ87dAnmwioZdI6PRB
 y+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oK1V9VqyARNdDmSq8eaH0WXXEQqO+aHWjZRcixslDmo=;
 b=cDWe3PxccLAuC/l/lbKZ4mw8Y28mmPA52afpx2lbditlHB59CQx/FXaXFmncYJXOQo
 /UCU16TZjWqKj9fhBR1Z7ySmbzkSBjPAHeZIUJD8upX3JELbTiU4TUoAtggLEIFXmHRv
 yMdX9RjM0e7aDM/vWLIfh/HLBrb6SRuP1M0HRwZt9iw8de0kVAymdJV5lSUc7zhv+QSA
 AG247DSeZ+FthVc/R028ohfJaOHfN+DYCKFfSwwBGP6n+I/BDGkC6oFyy2ehKWA3U76u
 YTmgpTvJJJ401GIx14M3aKZaNavzb/6AYksIbxJuCQ2wOtIyKp3rmypb1l+oYMXhvsLg
 3CZA==
X-Gm-Message-State: AOAM531bCSvqohs342oZTKtrjgecdT9Q2be+urk7nYwVfNysiEObQAmx
 4nDxESGsw5SVwSUUq4adeDNW4eipzlKgXw==
X-Google-Smtp-Source: ABdhPJzvSm+ypq2Uc/NftL+FJdoPCrVmq8LLLqs4yMD4fJvWnb34PUFgXgJO5f1GfFkfSIwf/rjHDw==
X-Received: by 2002:a62:8709:0:b029:1ed:6bd2:4a08 with SMTP id
 i9-20020a6287090000b02901ed6bd24a08mr19744580pfe.81.1614691602166; 
 Tue, 02 Mar 2021 05:26:42 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id u7sm20166956pfh.150.2021.03.02.05.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:26:41 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V4 7/8] hw/block/nvme: support changed namespace asyncrohous
 event
Date: Tue,  2 Mar 2021 22:26:16 +0900
Message-Id: <20210302132617.18495-8-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
References: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x42f.google.com
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

If namespace inventory is changed due to some reasons (e.g., namespace
attachment/detachment), controller can send out event notifier to the
host to manage namespaces.

This patch sends out the AEN to the host after either attach or detach
namespaces from controllers.  To support clear of the event from the
controller, this patch also implemented Get Log Page command for Changed
Namespace List log type.  To return namespace id list through the
command, when namespace inventory is updated, id is added to the
per-controller list (changed_ns_list).

To indicate the support of this async event, this patch set
OAES(Optional Asynchronous Events Supported) in Identify Controller data
structure.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-ns.h   |  1 +
 hw/block/nvme.c      | 57 ++++++++++++++++++++++++++++++++++++++++++++
 hw/block/nvme.h      |  4 ++++
 include/block/nvme.h |  7 ++++++
 4 files changed, 69 insertions(+)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index b0c00e115d81..318d3aebe1a8 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -53,6 +53,7 @@ typedef struct NvmeNamespace {
     uint8_t      csi;
 
     NvmeSubsystem   *subsys;
+    QTAILQ_ENTRY(NvmeNamespace) entry;
 
     NvmeIdNsZoned   *id_ns_zoned;
     NvmeZone        *zone_array;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 68c2e63d9412..7e6f91923fd7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2980,6 +2980,49 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
                     DMA_DIRECTION_FROM_DEVICE, req);
 }
 
+static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
+                                    uint64_t off, NvmeRequest *req)
+{
+    uint32_t nslist[1024];
+    uint32_t trans_len;
+    int i = 0;
+    uint32_t nsid;
+
+    memset(nslist, 0x0, sizeof(nslist));
+    trans_len = MIN(sizeof(nslist) - off, buf_len);
+
+    while ((nsid = find_first_bit(n->changed_nsids, NVME_CHANGED_NSID_SIZE)) !=
+            NVME_CHANGED_NSID_SIZE) {
+        /*
+         * If more than 1024 namespaces, the first entry in the log page should
+         * be set to 0xffffffff and the others to 0 as spec.
+         */
+        if (i == ARRAY_SIZE(nslist)) {
+            memset(nslist, 0x0, sizeof(nslist));
+            nslist[0] = 0xffffffff;
+            break;
+        }
+
+        nslist[i++] = nsid;
+        clear_bit(nsid, n->changed_nsids);
+    }
+
+    /*
+     * Remove all the remaining list entries in case returns directly due to
+     * more than 1024 namespaces.
+     */
+    if (nslist[0] == 0xffffffff) {
+        bitmap_zero(n->changed_nsids, NVME_CHANGED_NSID_SIZE);
+    }
+
+    if (!rae) {
+        nvme_clear_events(n, NVME_AER_TYPE_NOTICE);
+    }
+
+    return nvme_dma(n, ((uint8_t *)nslist) + off, trans_len,
+                    DMA_DIRECTION_FROM_DEVICE, req);
+}
+
 static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
                                  uint64_t off, NvmeRequest *req)
 {
@@ -3064,6 +3107,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_smart_info(n, rae, len, off, req);
     case NVME_LOG_FW_SLOT_INFO:
         return nvme_fw_log_info(n, len, off, req);
+    case NVME_LOG_CHANGED_NSLIST:
+        return nvme_changed_nslist(n, rae, len, off, req);
     case NVME_LOG_CMD_EFFECTS:
         return nvme_cmd_effects(n, csi, len, off, req);
     default:
@@ -3920,6 +3965,16 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 
             nvme_ns_detach(ctrl, ns);
         }
+
+        /*
+         * Add namespace id to the changed namespace id list for event clearing
+         * via Get Log Page command.
+         */
+        if (!test_and_set_bit(nsid, ctrl->changed_nsids)) {
+            nvme_enqueue_event(ctrl, NVME_AER_TYPE_NOTICE,
+                               NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
+                               NVME_LOG_CHANGED_NSLIST);
+        }
     }
 
     return NVME_SUCCESS;
@@ -4910,6 +4965,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->cntlid = cpu_to_le16(n->cntlid);
 
+    id->oaes = cpu_to_le32(NVME_OAES_NS_ATTR);
+
     id->rab = 6;
 
     if (n->params.use_intel_id) {
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 74a00ab21a55..7245c2b638d9 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -177,6 +177,10 @@ typedef struct NvmeCtrl {
     QTAILQ_HEAD(, NvmeAsyncEvent) aer_queue;
     int         aer_queued;
 
+    /* Namespace ID is started with 1 so bitmap should be 1-based */
+#define NVME_CHANGED_NSID_SIZE  (NVME_MAX_NAMESPACES + 1)
+    DECLARE_BITMAP(changed_nsids, NVME_CHANGED_NSID_SIZE);
+
     NvmeSubsystem   *subsys;
 
     NvmeNamespace   namespace;
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 339784d9c23a..eb0b31e949c2 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -760,6 +760,7 @@ typedef struct QEMU_PACKED NvmeCopySourceRange {
 enum NvmeAsyncEventRequest {
     NVME_AER_TYPE_ERROR                     = 0,
     NVME_AER_TYPE_SMART                     = 1,
+    NVME_AER_TYPE_NOTICE                    = 2,
     NVME_AER_TYPE_IO_SPECIFIC               = 6,
     NVME_AER_TYPE_VENDOR_SPECIFIC           = 7,
     NVME_AER_INFO_ERR_INVALID_DB_REGISTER   = 0,
@@ -771,6 +772,7 @@ enum NvmeAsyncEventRequest {
     NVME_AER_INFO_SMART_RELIABILITY         = 0,
     NVME_AER_INFO_SMART_TEMP_THRESH         = 1,
     NVME_AER_INFO_SMART_SPARE_THRESH        = 2,
+    NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED    = 0,
 };
 
 typedef struct QEMU_PACKED NvmeAerResult {
@@ -940,6 +942,7 @@ enum NvmeLogIdentifier {
     NVME_LOG_ERROR_INFO     = 0x01,
     NVME_LOG_SMART_INFO     = 0x02,
     NVME_LOG_FW_SLOT_INFO   = 0x03,
+    NVME_LOG_CHANGED_NSLIST = 0x04,
     NVME_LOG_CMD_EFFECTS    = 0x05,
 };
 
@@ -1046,6 +1049,10 @@ typedef struct NvmeIdCtrlZoned {
     uint8_t     rsvd1[4095];
 } NvmeIdCtrlZoned;
 
+enum NvmeIdCtrlOaes {
+    NVME_OAES_NS_ATTR   = 1 << 8,
+};
+
 enum NvmeIdCtrlOacs {
     NVME_OACS_SECURITY  = 1 << 0,
     NVME_OACS_FORMAT    = 1 << 1,
-- 
2.27.0


