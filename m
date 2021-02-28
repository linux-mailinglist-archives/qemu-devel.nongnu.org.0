Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F4C3273B6
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 18:55:30 +0100 (CET)
Received: from localhost ([::1]:45822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGQHx-0006FR-RM
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 12:55:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGQGd-0005ID-0r; Sun, 28 Feb 2021 12:54:07 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:42196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGQGb-0004QT-7N; Sun, 28 Feb 2021 12:54:06 -0500
Received: by mail-oi1-x22b.google.com with SMTP id l64so15686951oig.9;
 Sun, 28 Feb 2021 09:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/bDgLjN9XoSDZfs2ys3Q5e4zjKCIZLsSnNZGjcGkc6U=;
 b=aYoFFtbOXpE88gZTTdyGX59RM6FAygqeIzfXm06HtBy4noWgPAjKXu7c8IwQRg1FBl
 x/xZRHzLIqnGR0jWweEcH/dZnO4IgvgavwSg+56DhpwiuoOjWxQud5573zkUB9gOhk1g
 mCisUde6hBE9xNyDWeMxvNnpmLdTDVfA2uVfBxiry70AH9R4+shtXAoMA4NtXo1GmjSG
 yNlT/qPH8Ik3dyKa+puHlzSENfs32ZC+5cRooFwieNpgcEBL2Ke34zfFZ2iekxbUNcqh
 DK/rVF1WEaQVMhBYtoyOczmnllSeZN4O/uJ68quXhmU7VocLF1QbUfllPCUKagpm8DJ1
 KiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/bDgLjN9XoSDZfs2ys3Q5e4zjKCIZLsSnNZGjcGkc6U=;
 b=pJKkO2wBCQ+Ro6H8V9bkG9lqwSuveU1Alw4N5zWBrNTR9hI/oJ+lyT2ZP/Fk4mXEC7
 zI0p7KHAwglCOeMKZD3Gr7oXTcnh8GSsGR0ZWmXPy7Uqe+B1QwlsYe2WRuUQ35OrBRPm
 b0dfPGQDcOzuPUpHFMruT2xdMMh1pfAhcfnoN+UNCe5tEPgbPQ/+MaKDoARZmaDIuz96
 rV4AJRXVQasewtNWx/FM0H0FUZKnEVWz/BE6eIiIqiEjMBtEWCljCdG2th1xDREozYUE
 cPlhxt0POJgZWzZaePwBxmMYyuPWkSMU+nljELJ2VqKNv7Nu2rsZdhBvVA+tULPfp6qC
 1bOw==
X-Gm-Message-State: AOAM5301TaUyIJuO/fhpH/yF7ffbCctkOAQkBESOes9xSD94J4v+SVad
 mOxYT4gbm1ufQqXr5stqJGzjBpQRnOTd2Q==
X-Google-Smtp-Source: ABdhPJwxNqZbmMnYwEN27QUfze1g/5O4SuKwJB7Zmv9CzpxV7/jUHB/V5qDwZPi5jvTvJZpA0o70Zg==
X-Received: by 2002:a17:90a:2e89:: with SMTP id
 r9mr12827584pjd.95.1614528683918; 
 Sun, 28 Feb 2021 08:11:23 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x11sm14389781pja.46.2021.02.28.08.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 08:11:23 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V3 7/8] hw/block/nvme: support changed namespace asyncrohous
 event
Date: Mon,  1 Mar 2021 01:10:59 +0900
Message-Id: <20210228161100.54015-8-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
References: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-oi1-x22b.google.com
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
 hw/block/nvme.c      | 44 ++++++++++++++++++++++++++++++++++++++++++++
 hw/block/nvme.h      |  7 +++++++
 include/block/nvme.h |  7 +++++++
 3 files changed, 58 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 68c2e63d9412..fc06f806e58e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2980,6 +2980,32 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
                     DMA_DIRECTION_FROM_DEVICE, req);
 }
 
+static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
+                                    uint64_t off, NvmeRequest *req)
+{
+    uint32_t nslist[1024];
+    uint32_t trans_len;
+    NvmeChangedNs *ns, *next;
+    int i = 0;
+
+    memset(nslist, 0x0, sizeof(nslist));
+    trans_len = MIN(sizeof(nslist) - off, buf_len);
+
+    QTAILQ_FOREACH_SAFE(ns, &n->changed_ns_list, entry, next) {
+        nslist[i++] = ns->nsid;
+
+        QTAILQ_REMOVE(&n->changed_ns_list, ns, entry);
+        g_free(ns);
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
@@ -3064,6 +3090,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_smart_info(n, rae, len, off, req);
     case NVME_LOG_FW_SLOT_INFO:
         return nvme_fw_log_info(n, len, off, req);
+    case NVME_LOG_CHANGED_NSLIST:
+        return nvme_changed_nslist(n, rae, len, off, req);
     case NVME_LOG_CMD_EFFECTS:
         return nvme_cmd_effects(n, csi, len, off, req);
     default:
@@ -3882,6 +3910,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
     uint16_t *ids = &list[1];
     uint16_t ret;
     int i;
+    NvmeChangedNs *changed_nsid;
 
     trace_pci_nvme_ns_attachment(nvme_cid(req), dw10 & 0xf);
 
@@ -3920,6 +3949,18 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 
             nvme_ns_detach(ctrl, ns);
         }
+
+        /*
+         * Add namespace id to the changed namespace id list for event clearing
+         * via Get Log Page command.
+         */
+        changed_nsid = g_new(NvmeChangedNs, 1);
+        changed_nsid->nsid = nsid;
+        QTAILQ_INSERT_TAIL(&ctrl->changed_ns_list, changed_nsid, entry);
+
+        nvme_enqueue_event(ctrl, NVME_AER_TYPE_NOTICE,
+                           NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
+                           NVME_LOG_CHANGED_NSLIST);
     }
 
     return NVME_SUCCESS;
@@ -4714,6 +4755,7 @@ static void nvme_init_state(NvmeCtrl *n)
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
+    QTAILQ_INIT(&n->changed_ns_list);
 }
 
 static int nvme_attach_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
@@ -4910,6 +4952,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->cntlid = cpu_to_le16(n->cntlid);
 
+    id->oaes = cpu_to_le32(NVME_OAES_NS_ATTR);
+
     id->rab = 6;
 
     if (n->params.use_intel_id) {
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 74a00ab21a55..d5eaea003ea5 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -132,6 +132,11 @@ typedef struct NvmeFeatureVal {
     uint32_t    async_config;
 } NvmeFeatureVal;
 
+typedef struct NvmeChangedNs {
+    uint32_t nsid;
+    QTAILQ_ENTRY(NvmeChangedNs) entry;
+} NvmeChangedNs;
+
 typedef struct NvmeCtrl {
     PCIDevice    parent_obj;
     MemoryRegion bar0;
@@ -177,6 +182,8 @@ typedef struct NvmeCtrl {
     QTAILQ_HEAD(, NvmeAsyncEvent) aer_queue;
     int         aer_queued;
 
+    QTAILQ_HEAD(, NvmeChangedNs) changed_ns_list;   /* Changed NS list log */
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
2.25.1


