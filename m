Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678D531B0BC
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 15:29:52 +0100 (CET)
Received: from localhost ([::1]:58812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBIPH-0007Lh-Gz
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 09:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lBINl-0006P9-4Q; Sun, 14 Feb 2021 09:28:17 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lBINj-0004LI-2b; Sun, 14 Feb 2021 09:28:16 -0500
Received: by mail-pl1-x635.google.com with SMTP id a9so171892plh.8;
 Sun, 14 Feb 2021 06:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=i3OZXxBJsFlQ0HAOk7kLpzZwFqDxVMT3jtH4mK2YPzI=;
 b=fdjeilfzh56vIGLD9puespE4Fi+6iGVLk2U2KkefCwiOPC9UtOPtFVfQR9EdjHbcsq
 1q0hO9DAFcw4eXFSI96KkOUUDCW5hxq+BO1ZVcBap0iAK6HDxtVJPHSm/t9MzD1U8NC5
 CvbMdYvtw6hL62ca4V6wSGWKsv+ursHJE64QwJWkvqZNq3ADUF6KId1eV3pb+uIBpzXb
 wNw0+Mnn5zrjvnkay7+0Aj4h2/SLyCKFd/hb3unVq+LZQJzW52gx/RtWgi4cG/oo8BbY
 6RHoT6r1/sJRcTDOlEbyXxWR3249BWEuUrE4fHorXzRqZF+A2DW3ArGwnlvc8ZC7fYOH
 q9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=i3OZXxBJsFlQ0HAOk7kLpzZwFqDxVMT3jtH4mK2YPzI=;
 b=QSSWVCPxbbPM5qE3ofmMRVLkBvUcAippLBn/rgX/xjmGLKE4XVMUsfrmBUTYz1/0+d
 6WMQ+AUTMAFO7ogyKEjknxmdSmjPWToAMCMqrPc25ZRFzJOaoIDnstRK0+MZmA8W/dvZ
 7/QIEsWtGVJEIKSHs1GG9LruBKuwqfHngPDeJX5KEzd+TKDIlnfZa2cgONvkhmaFukUX
 TfcjnAp4YxMdQCKs2MK3zF3BbjJ0ZhNmFnWwlKxMzvphZAgY9gR93f6gPEOoS3fmZWrv
 JS2/ASt9BNxBlQytGsz8IclOJ9Koa4Y0dIBO7XAtZDcT3p3UlGJKsK8riUrp28JKoQEZ
 D/HQ==
X-Gm-Message-State: AOAM5328/Xpas7mEPMY8pW7y+QY9B27EgYzoWT90Tc2kYo6zPijzn/3B
 f6jvn1LcUnMmIFiAywAXFqIf0AInDqoZkw==
X-Google-Smtp-Source: ABdhPJyADUsTB8M0oYGczlY76EJgi+woZAOTwcxNT/HUgZUNThQ6ZTATHiYfhbbJ8DpV2qhXxWTk2A==
X-Received: by 2002:a17:90a:ca95:: with SMTP id
 y21mr5234629pjt.179.1613312893336; 
 Sun, 14 Feb 2021 06:28:13 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id r68sm15502224pfc.49.2021.02.14.06.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 06:28:13 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V2 1/1] hw/block/nvme: support command retry delay
Date: Sun, 14 Feb 2021 23:28:05 +0900
Message-Id: <20210214142805.21534-2-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210214142805.21534-1-minwoo.im.dev@gmail.com>
References: <20210214142805.21534-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x635.google.com
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

Set CRDT1(Command Retry Delay Time 1) in the Identify controller data
structure to milliseconds units of 100ms by the given value of
'cmd-retry-delay' parameter which is newly added.  If
cmd-retry-delay=1000, it will be set CRDT1 to 10.  This patch only
considers the CRDT1 without CRDT2 and 3 for the simplicity.

This patch also introduced set/get feature command handler for Host
Behavior feature (16h).  In this feature, ACRE(Advanced Command Retry
Enable) will be set by the host based on the Identify controller data
structure, especially by CRDTs.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c      | 68 +++++++++++++++++++++++++++++++++++++++++++-
 hw/block/nvme.h      |  2 ++
 include/block/nvme.h | 13 ++++++++-
 3 files changed, 81 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 1cd82fa3c9fe..5aedb26cea9e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -23,7 +23,7 @@
  *              max_ioqpairs=<N[optional]>, \
  *              aerl=<N[optional]>, aer_max_queued=<N[optional]>, \
  *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]>, \
- *              subsys=<subsys_id> \
+ *              subsys=<subsys_id>,cmd-retry-delay=<N[optional]> \
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
  *              subsys=<subsys_id>
@@ -71,6 +71,14 @@
  *   data size being in effect. By setting this property to 0, users can make
  *   ZASL to be equal to MDTS. This property only affects zoned namespaces.
  *
+ * - `cmd-retry-delay`
+ *   Command Retry Delay value in unit of millisecond.  This value will be
+ *   reported to the CRDT1(Command Retry Delay Time 1) in Identify Controller
+ *   data structure in 100 milliseconds unit.  If this is not given, DNR(Do Not
+ *   Retry) bit field in the Status field of CQ entry.  If it's given to 0,
+ *   CRD(Command Retry Delay) will be set to 0 which is for retry without
+ *   delay.  Otherwise, it will set to 1 to delay for CRDT1 value.
+ *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `subsys`
@@ -154,6 +162,7 @@ static const bool nvme_feature_support[NVME_FID_MAX] = {
     [NVME_WRITE_ATOMICITY]          = true,
     [NVME_ASYNCHRONOUS_EVENT_CONF]  = true,
     [NVME_TIMESTAMP]                = true,
+    [NVME_HOST_BEHAVIOR_SUPPORT]    = true,
 };
 
 static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
@@ -163,6 +172,7 @@ static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
     [NVME_NUMBER_OF_QUEUES]         = NVME_FEAT_CAP_CHANGE,
     [NVME_ASYNCHRONOUS_EVENT_CONF]  = NVME_FEAT_CAP_CHANGE,
     [NVME_TIMESTAMP]                = NVME_FEAT_CAP_CHANGE,
+    [NVME_HOST_BEHAVIOR_SUPPORT]    = NVME_FEAT_CAP_CHANGE,
 };
 
 static const uint32_t nvme_cse_acs[256] = {
@@ -942,9 +952,30 @@ static void nvme_post_cqes(void *opaque)
     }
 }
 
+static void nvme_setup_crdt(NvmeCtrl *n, NvmeRequest *req)
+{
+    if (!n->features.acre) {
+        return;
+    }
+
+    /*
+     * We just support CRDT1 for now without considering CRDT2 and CRDT3.
+     * Also, regardless to the status code, if there's no NVME_DNR, then we
+     * set up the command retry delay.
+     */
+    if (req->status && !(req->status & NVME_DNR)) {
+        if (n->params.cmd_retry_delay) {
+            req->status |= NVME_CRD_CRDT1;
+        }
+    }
+}
+
 static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
 {
     assert(cq->cqid == req->sq->cqid);
+
+    nvme_setup_crdt(cq->ctrl, req);
+
     trace_pci_nvme_enqueue_req_completion(nvme_cid(req), cq->cqid,
                                           req->status);
 
@@ -3501,6 +3532,16 @@ static uint16_t nvme_get_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
                     DMA_DIRECTION_FROM_DEVICE, req);
 }
 
+static uint16_t nvme_get_feature_host_behavior(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeFeatureHostBehavior data = {};
+
+    data.acre = n->features.acre;
+
+    return nvme_dma(n, (uint8_t *)&data, sizeof(data),
+                    DMA_DIRECTION_FROM_DEVICE, req);
+}
+
 static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = &req->cmd;
@@ -3607,6 +3648,8 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         goto out;
     case NVME_TIMESTAMP:
         return nvme_get_feature_timestamp(n, req);
+    case NVME_HOST_BEHAVIOR_SUPPORT:
+        return nvme_get_feature_host_behavior(n, req);
     default:
         break;
     }
@@ -3670,6 +3713,22 @@ static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
     return NVME_SUCCESS;
 }
 
+static uint16_t nvme_set_feature_host_behavior(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeFeatureHostBehavior data;
+    int ret;
+
+    ret = nvme_dma(n, (uint8_t *)&data, sizeof(data),
+                   DMA_DIRECTION_TO_DEVICE, req);
+    if (ret) {
+        return ret;
+    }
+
+    n->features.acre = data.acre;
+
+    return NVME_SUCCESS;
+}
+
 static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = NULL;
@@ -3801,6 +3860,8 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         break;
     case NVME_TIMESTAMP:
         return nvme_set_feature_timestamp(n, req);
+    case NVME_HOST_BEHAVIOR_SUPPORT:
+        return nvme_set_feature_host_behavior(n, req);
     case NVME_COMMAND_SET_PROFILE:
         if (dw11 & 0x1ff) {
             trace_pci_nvme_err_invalid_iocsci(dw11 & 0x1ff);
@@ -4816,6 +4877,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->oacs = cpu_to_le16(0);
     id->cntrltype = 0x1;
 
+    if (n->params.cmd_retry_delay) {
+        id->crdt1 = cpu_to_le16(DIV_ROUND_UP(n->params.cmd_retry_delay, 100));
+    }
+
     /*
      * Because the controller always completes the Abort command immediately,
      * there can never be more than one concurrently executing Abort command,
@@ -4988,6 +5053,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
     DEFINE_PROP_SIZE32("zoned.append_size_limit", NvmeCtrl, params.zasl_bs,
                        NVME_DEFAULT_MAX_ZA_SIZE),
+    DEFINE_PROP_UINT32("cmd-retry-delay", NvmeCtrl, params.cmd_retry_delay, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index cb2b5175f1a1..94fc5c333bbe 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -22,6 +22,7 @@ typedef struct NvmeParams {
     bool     use_intel_id;
     uint32_t zasl_bs;
     bool     legacy_cmb;
+    uint32_t cmd_retry_delay;
 } NvmeParams;
 
 typedef struct NvmeAsyncEvent {
@@ -124,6 +125,7 @@ typedef struct NvmeFeatureVal {
         uint16_t temp_thresh_low;
     };
     uint32_t    async_config;
+    uint8_t     acre;
 } NvmeFeatureVal;
 
 typedef struct NvmeCtrl {
diff --git a/include/block/nvme.h b/include/block/nvme.h
index b23f3ae2279f..9f8f97b7f9f5 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -813,6 +813,7 @@ enum NvmeStatusCodes {
     NVME_SGL_DESCR_TYPE_INVALID = 0x0011,
     NVME_INVALID_USE_OF_CMB     = 0x0012,
     NVME_INVALID_PRP_OFFSET     = 0x0013,
+    NVME_COMMAND_INTERRUPTED    = 0x0021,
     NVME_CMD_SET_CMB_REJECTED   = 0x002b,
     NVME_INVALID_CMD_SET        = 0x002c,
     NVME_LBA_RANGE              = 0x0080,
@@ -858,6 +859,7 @@ enum NvmeStatusCodes {
     NVME_DULB                   = 0x0287,
     NVME_MORE                   = 0x2000,
     NVME_DNR                    = 0x4000,
+    NVME_CRD_CRDT1              = 0x0800,
     NVME_NO_COMPLETE            = 0xffff,
 };
 
@@ -987,7 +989,10 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
     uint8_t     rsvd100[11];
     uint8_t     cntrltype;
     uint8_t     fguid[16];
-    uint8_t     rsvd128[128];
+    uint16_t    crdt1;
+    uint16_t    crdt2;
+    uint16_t    crdt3;
+    uint8_t     rsvd134[122];
     uint16_t    oacs;
     uint8_t     acl;
     uint8_t     aerl;
@@ -1139,6 +1144,7 @@ enum NvmeFeatureIds {
     NVME_WRITE_ATOMICITY            = 0xa,
     NVME_ASYNCHRONOUS_EVENT_CONF    = 0xb,
     NVME_TIMESTAMP                  = 0xe,
+    NVME_HOST_BEHAVIOR_SUPPORT      = 0x16,
     NVME_COMMAND_SET_PROFILE        = 0x19,
     NVME_SOFTWARE_PROGRESS_MARKER   = 0x80,
     NVME_FID_MAX                    = 0x100,
@@ -1170,6 +1176,11 @@ typedef enum NvmeGetFeatureSelect {
 #define NVME_SETFEAT_SAVE(dw10) \
     ((dw10 >> NVME_SETFEAT_SAVE_SHIFT) & NVME_SETFEAT_SAVE_MASK)
 
+typedef struct QEMU_PACKED NvmeFeatureHostBehavior {
+    uint8_t     acre;
+    uint8_t     rsvd1[511];
+} NvmeFeatureHostBehavior;
+
 typedef struct QEMU_PACKED NvmeRangeType {
     uint8_t     type;
     uint8_t     attributes;
-- 
2.17.1


