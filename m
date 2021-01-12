Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAFF2F3792
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:48:12 +0100 (CET)
Received: from localhost ([::1]:44960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNm7-0007iX-Cq
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG8-0003hH-Ud
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:09 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG6-0004uj-1b
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:08 -0500
Received: by mail-ej1-x636.google.com with SMTP id f4so3498515ejx.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UJgSKs3atxrFQ5lheIj9vIfMvt45UwLp5jiCMdV8XNA=;
 b=l9RWrsLMs6lnHuDJGfSpw+DgmUsb+v2Prx5Op47XAcXwxm+MkjuLoPKBDah2FZLepc
 7aM69iIJ08xt1WA5bSkjaXcgfeBVSEJ320zRjRA4rXUXXHVvBRE4JFMbiGCju2ZbRWU4
 bZ6dOP4i+dZrSQl+2w7ttsYf3TVduzsjFHd1MhAf7OAngNmG1P4WsoyMz+My1+4UF5te
 tZE2xLi4TywU7Sl/m/VuLVEdGZI8doRQw0QPgl0ErfVjWWi0RGVphEh/bRZX+StDdYXo
 G96BgLeo6m7R2/8eZlHnryC9Nnbn7ijoFfHqgIfd1g2PPIJoACldYHiGdpfyYXEEfgJi
 5rNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UJgSKs3atxrFQ5lheIj9vIfMvt45UwLp5jiCMdV8XNA=;
 b=GydfbxokttEO/pk055T9azUJPQ7hKa+Zy6Br3LwKh8Y+ld+KOn41x8wb7DUYOzUK8k
 XrwMuSbFIK6osCIgJGiGmLcMAWRUzHKxTD35ngN02AqDh9sRG5K1dbTtO05I3NSbWoXJ
 +xcBwcc8kOooN8JJqtLTAPQ/UhF9RsYnnCjKXQZdYV3PQ9NVyXo5Qux0nmSw2tvRJJyk
 pCO8SnEzGm5IAxchrAGaFGyccefmnJHSImqNuSNeomH0/4oAY8rLIKQIh1ffmfKsHWBQ
 vfL4SLEoa+Ces5zzwoHkqjcqgnz9Bp+jJ8fZk/BQH7gdNQIP6A2ZsAvGRzIspc0FpYo/
 u4qQ==
X-Gm-Message-State: AOAM533BXlSua/8UwVzZ+LtIP3OqvmW5fkBs0wkjhNwyYO1mGB6H/CRL
 fr+0dkaS6X/8aMKFpQjl2/Oxcg76zUo/Dw==
X-Google-Smtp-Source: ABdhPJyXkMd9ekrgQryqqHU16mMrlcApknrs4DqvykmvKJhDHTn6jsw4jYBhZqPBE84b/oCnuBv5vQ==
X-Received: by 2002:a17:907:d25:: with SMTP id
 gn37mr2854427ejc.381.1610471703868; 
 Tue, 12 Jan 2021 09:15:03 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:15:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/20] virtio-scsi: trace events
Date: Tue, 12 Jan 2021 18:14:43 +0100
Message-Id: <20210112171450.791427-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hannes Reinecke <hare@suse.de>

Add trace events for virtio command and response tracing.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Message-Id: <20201116183114.55703-2-hare@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
index 3db9a8aae9..9690bc63c8 100644
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
@@ -429,11 +437,23 @@ static void virtio_scsi_handle_ctrl_req(VirtIOSCSI *s, VirtIOSCSIReq *req)
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
@@ -469,6 +489,10 @@ static void virtio_scsi_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 
 static void virtio_scsi_complete_cmd_req(VirtIOSCSIReq *req)
 {
+    trace_virtio_scsi_cmd_resp(virtio_scsi_get_lun(req->req.cmd.lun),
+                               req->req.cmd.tag,
+                               req->resp.cmd.response,
+                               req->resp.cmd.status);
     /* Sense data is not in req->resp and is copied separately
      * in virtio_scsi_command_complete.
      */
@@ -566,6 +590,8 @@ static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCSIReq *req)
             return -EINVAL;
         }
     }
+    trace_virtio_scsi_cmd_req(virtio_scsi_get_lun(req->req.cmd.lun),
+                              req->req.cmd.tag, req->req.cmd.cdb[0]);
 
     d = virtio_scsi_device_get(s, req->req.cmd.lun);
     if (!d) {
@@ -767,6 +793,8 @@ void virtio_scsi_push_event(VirtIOSCSI *s, SCSIDevice *dev,
         }
         evt->lun[3] = dev->lun & 0xFF;
     }
+    trace_virtio_scsi_event(virtio_scsi_get_lun(evt->lun), event, reason);
+     
     virtio_scsi_complete_req(req);
 }
 
-- 
2.29.2



