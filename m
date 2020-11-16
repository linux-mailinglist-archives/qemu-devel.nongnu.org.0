Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280522B505D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:57:21 +0100 (CET)
Received: from localhost ([::1]:58712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejgm-0006kc-5X
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejHh-0003Te-1F
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:31:26 -0500
Received: from mx2.suse.de ([195.135.220.15]:34660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejHa-0006BH-IQ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:31:24 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D972CB05D;
 Mon, 16 Nov 2020 18:31:15 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/3] virtio-scsi: trace events
Date: Mon, 16 Nov 2020 19:31:12 +0100
Message-Id: <20201116183114.55703-2-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201116183114.55703-1-hare@suse.de>
References: <20201116183114.55703-1-hare@suse.de>
Received-SPF: pass client-ip=195.135.220.15; envelope-from=hare@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 12:53:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add trace events for virtio command and response tracing.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 hw/scsi/trace-events  |  9 +++++++++
 hw/scsi/virtio-scsi.c | 30 +++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 9a4a60ca63..0e0aa9847d 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -294,6 +294,15 @@ lsi_awoken(void) "Woken by SIGP"
 lsi_reg_read(const char *name, int offset, uint8_t ret) "Read reg %s 0x%x = 0x%02x"
 lsi_reg_write(const char *name, int offset, uint8_t val) "Write reg %s 0x%x = 0x%02x"
 
+# virtio-scsi.c
+virtio_scsi_cmd_req(int lun, uint32_t tag, uint8_t cmd) "virtio_scsi_cmd_req lun=%u tag=0x%x cmd=0x%x"
+virtio_scsi_cmd_resp(int lun, uint32_t tag, int response, uint8_t status) "virtio_scsi_cmd_resp lun=%u tag=0x%x response=%d status=0x%x"
+virtio_scsi_tmf_req(int lun, uint32_t tag, int subtype) "virtio_scsi_tmf_req lun=%u tag=0x%x subtype=%d"
+virtio_scsi_tmf_resp(int lun, uint32_t tag, int response) "virtio_scsi_tmf_resp lun=%u tag=0x%x response=%d"
+virtio_scsi_an_req(int lun, uint32_t event_requested) "virtio_scsi_an_req lun=%u event_requested=0x%x"
+virtio_scsi_an_resp(int lun, int response) "virtio_scsi_an_resp lun=%u response=%d"
+virtio_scsi_event(int lun, int event, int reason) "virtio_scsi_event lun=%u event=%d reason=%d"
+
 # scsi-disk.c
 scsi_disk_check_condition(uint32_t tag, uint8_t key, uint8_t asc, uint8_t ascq) "Command complete tag=0x%x sense=%d/%d/%d"
 scsi_disk_read_complete(uint32_t tag, size_t size) "Data ready tag=0x%x len=%zd"
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 3a71ea7097..c9873d5af7 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -27,6 +27,7 @@
 #include "scsi/constants.h"
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
+#include "trace.h"
 
 static inline int virtio_scsi_get_lun(uint8_t *lun)
 {
@@ -239,7 +240,11 @@ static void virtio_scsi_cancel_notify(Notifier *notifier, void *data)
                                                notifier);
 
     if (--n->tmf_req->remaining == 0) {
-        virtio_scsi_complete_req(n->tmf_req);
+        VirtIOSCSIReq *req = n->tmf_req;
+
+        trace_virtio_scsi_tmf_resp(virtio_scsi_get_lun(req->req.tmf.lun),
+                                   req->req.tmf.tag, req->resp.tmf.response);
+        virtio_scsi_complete_req(req);
     }
     g_free(n);
 }
@@ -273,6 +278,9 @@ static int virtio_scsi_do_tmf(VirtIOSCSI *s, VirtIOSCSIReq *req)
     req->req.tmf.subtype =
         virtio_tswap32(VIRTIO_DEVICE(s), req->req.tmf.subtype);
 
+    trace_virtio_scsi_tmf_req(virtio_scsi_get_lun(req->req.tmf.lun),
+                              req->req.tmf.tag, req->req.tmf.subtype);
+
     switch (req->req.tmf.subtype) {
     case VIRTIO_SCSI_T_TMF_ABORT_TASK:
     case VIRTIO_SCSI_T_TMF_QUERY_TASK:
@@ -422,11 +430,23 @@ static void virtio_scsi_handle_ctrl_req(VirtIOSCSI *s, VirtIOSCSIReq *req)
             virtio_scsi_bad_req(req);
             return;
         } else {
+            req->req.an.event_requested =
+                virtio_tswap32(VIRTIO_DEVICE(s), req->req.an.event_requested);
+            trace_virtio_scsi_an_req(virtio_scsi_get_lun(req->req.an.lun),
+                                     req->req.an.event_requested);
             req->resp.an.event_actual = 0;
             req->resp.an.response = VIRTIO_SCSI_S_OK;
         }
     }
     if (r == 0) {
+        if (type == VIRTIO_SCSI_T_TMF)
+            trace_virtio_scsi_tmf_resp(virtio_scsi_get_lun(req->req.tmf.lun),
+                                       req->req.tmf.tag,
+                                       req->resp.tmf.response);
+        else if (type == VIRTIO_SCSI_T_AN_QUERY ||
+                 type == VIRTIO_SCSI_T_AN_SUBSCRIBE)
+            trace_virtio_scsi_an_resp(virtio_scsi_get_lun(req->req.an.lun),
+                                      req->resp.an.response);
         virtio_scsi_complete_req(req);
     } else {
         assert(r == -EINPROGRESS);
@@ -462,6 +482,10 @@ static void virtio_scsi_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 
 static void virtio_scsi_complete_cmd_req(VirtIOSCSIReq *req)
 {
+    trace_virtio_scsi_cmd_resp(virtio_scsi_get_lun(req->req.cmd.lun),
+                               req->req.cmd.tag,
+                               req->resp.cmd.response,
+                               req->resp.cmd.status);
     /* Sense data is not in req->resp and is copied separately
      * in virtio_scsi_command_complete.
      */
@@ -559,6 +583,8 @@ static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCSIReq *req)
             return -EINVAL;
         }
     }
+    trace_virtio_scsi_cmd_req(virtio_scsi_get_lun(req->req.cmd.lun),
+                              req->req.cmd.tag, req->req.cmd.cdb[0]);
 
     d = virtio_scsi_device_find(s, req->req.cmd.lun);
     if (!d) {
@@ -758,6 +784,8 @@ void virtio_scsi_push_event(VirtIOSCSI *s, SCSIDevice *dev,
         }
         evt->lun[3] = dev->lun & 0xFF;
     }
+    trace_virtio_scsi_event(virtio_scsi_get_lun(evt->lun), event, reason);
+     
     virtio_scsi_complete_req(req);
 }
 
-- 
2.16.4


