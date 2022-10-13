Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68545FDE0D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 18:15:48 +0200 (CEST)
Received: from localhost ([::1]:50808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj0s7-0005Um-Kl
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 12:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj0jB-0001ww-7i
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 12:06:34 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj0j7-0001cx-VZ
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 12:06:32 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so3591214wma.3
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 09:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E3Tez9gIYiISEzYgsR4FRO0VTxja6A2lyVpJXB3pzbs=;
 b=MhKmchz/2s51agrvkmOJST2PEpXwTsjxfsYNPTGlN77LCutXO9D6k6xaL6irYWmeJE
 4/s4vwhE/qQ+bHBVQpsLSWKKu0y3muYEp7u1qCkmEMc0tuoMcmCv+RMqtFcXY9ktNe0R
 yb8s5KL71gWrtxKNRbkaFNO5nFvTA0lhSbLsoM6P3pYy82HsBRUAVEbzYWOcFf5bXonU
 nWp7sedz/529wIsXLL11mLUSI9OdhocIU9pHS80f1DaO/JY3M+9ASIyj43wUSetLJkxZ
 XPO9lisPJjWfbZeKf9SOHB6gpMO6ifoTWUwIT1ghCJ3wk6v5x9fNYk5pkMgwWNiws9o+
 GlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E3Tez9gIYiISEzYgsR4FRO0VTxja6A2lyVpJXB3pzbs=;
 b=i/1cwAeBWwwppaQMI+s4V/VLSZwCA6oKctHdSdSxinXfUQLHoGgifucNEy7A8bETpH
 W6IcxN2mhImeDZ0RmQV4MAe/ySAvJxw15vLbZwOzuU3W5PWkQIv2Cp0d93v53DRdkqpb
 HyspaYHEfaz6TlEhBbpzgUl1yhZKhFrH306+tBnlkXN5g+YjFuB2a5+J439Uemvru2ZL
 CRLhK+kdVz4GNDZsS41ZSjygwQR/cSXnxnpVZDJA4m82mvH7X3HG8ohsbsliG6dYjL+Q
 pU9SbTrrrRnHOMHM/O3IkEwFJPK/SaP4tqBv3o6TKNXpw8NLteJ+khbSa6PT1Mxqd9qV
 czhw==
X-Gm-Message-State: ACrzQf2Njwd/Xdm1waIfTB43YpUamz+utcF4YCVMK++RbpgnO1A+6QCt
 kZ7Z48gmYjpo0Vwd1IKYayNg8+rkRkepcw==
X-Google-Smtp-Source: AMsMyM77jwLh4vHVkmITTqKDuK3FHImgDzTbg3D00GDoby+R0dSEF2VfgCOSTk5l67K31Me6g0CWzw==
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:ae27 with SMTP id
 bg14-20020a05600c3c8e00b003b4d224ae27mr371886wmb.187.1665677188349; 
 Thu, 13 Oct 2022 09:06:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b003c6b67426b0sm5125617wmq.12.2022.10.13.09.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 09:06:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 1/2] scsi: Use device_cold_reset() and bus_cold_reset()
Date: Thu, 13 Oct 2022 17:06:22 +0100
Message-Id: <20221013160623.1296109-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221013160623.1296109-1-peter.maydell@linaro.org>
References: <20221013160623.1296109-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the SCSI subsystem we currently use the legacy functions
qdev_reset_all() and qbus_reset_all().  These perform a recursive
reset, starting from either a qbus or a qdev.  However they do not
permit any of the devices in the tree to use three-phase reset,
because device reset goes through the device_legacy_reset() function
that only calls the single DeviceClass::reset method.

Switch to using the device_cold_reset() and bus_cold_reset()
functions.  These also perform a recursive reset, where first the
children are reset and then finally the parent, but they use the new
(...in 2020...) Resettable mechanism, which supports both the old
style single-reset method and also the new 3-phase reset handling.

Since no devices attached to SCSI buses currently try to use 3-phase
reset, this should be a no-behaviour-change commit which just reduces
the use of a deprecated API.

Commit created with:
  sed -i -e 's/qdev_reset_all/device_cold_reset/g;s/qbus_reset_all/bus_cold_reset/g' hw/scsi/*.c

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/scsi/esp.c         | 2 +-
 hw/scsi/lsi53c895a.c  | 4 ++--
 hw/scsi/megasas.c     | 2 +-
 hw/scsi/mptsas.c      | 8 ++++----
 hw/scsi/spapr_vscsi.c | 2 +-
 hw/scsi/virtio-scsi.c | 6 +++---
 hw/scsi/vmw_pvscsi.c  | 4 ++--
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 2ff18ce5008..e5b281e836a 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -941,7 +941,7 @@ static void esp_soft_reset(ESPState *s)
 
 static void esp_bus_reset(ESPState *s)
 {
-    qbus_reset_all(BUS(&s->bus));
+    bus_cold_reset(BUS(&s->bus));
 }
 
 static void parent_esp_reset(ESPState *s, int irq, int level)
diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 05a43ec8071..50979640c32 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -1868,7 +1868,7 @@ static void lsi_reg_writeb(LSIState *s, int offset, uint8_t val)
         }
         if (val & LSI_SCNTL1_RST) {
             if (!(s->sstat0 & LSI_SSTAT0_RST)) {
-                qbus_reset_all(BUS(&s->bus));
+                bus_cold_reset(BUS(&s->bus));
                 s->sstat0 |= LSI_SSTAT0_RST;
                 lsi_script_scsi_interrupt(s, LSI_SIST0_RST, 0);
             }
@@ -1926,7 +1926,7 @@ static void lsi_reg_writeb(LSIState *s, int offset, uint8_t val)
             lsi_execute_script(s);
         }
         if (val & LSI_ISTAT0_SRST) {
-            qdev_reset_all(DEVICE(s));
+            device_cold_reset(DEVICE(s));
         }
         break;
     case 0x16: /* MBOX0 */
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 7082456d653..9cbbb16121d 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1484,7 +1484,7 @@ static int megasas_cluster_reset_ld(MegasasState *s, MegasasCmd *cmd)
         MegasasCmd *tmp_cmd = &s->frames[i];
         if (tmp_cmd->req && tmp_cmd->req->dev->id == target_id) {
             SCSIDevice *d = tmp_cmd->req->dev;
-            qdev_reset_all(&d->qdev);
+            device_cold_reset(&d->qdev);
         }
     }
     return MFI_STAT_OK;
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index a90c2546f10..c485da792c9 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -522,7 +522,7 @@ reply_maybe_async:
             reply.ResponseCode = MPI_SCSITASKMGMT_RSP_TM_INVALID_LUN;
             goto out;
         }
-        qdev_reset_all(&sdev->qdev);
+        device_cold_reset(&sdev->qdev);
         break;
 
     case MPI_SCSITASKMGMT_TASKTYPE_TARGET_RESET:
@@ -538,13 +538,13 @@ reply_maybe_async:
         QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
             sdev = SCSI_DEVICE(kid->child);
             if (sdev->channel == 0 && sdev->id == req->TargetID) {
-                qdev_reset_all(kid->child);
+                device_cold_reset(kid->child);
             }
         }
         break;
 
     case MPI_SCSITASKMGMT_TASKTYPE_RESET_BUS:
-        qbus_reset_all(BUS(&s->bus));
+        bus_cold_reset(BUS(&s->bus));
         break;
 
     default:
@@ -807,7 +807,7 @@ static void mptsas_soft_reset(MPTSASState *s)
     s->intr_mask = MPI_HIM_DIM | MPI_HIM_RIM;
     mptsas_update_interrupt(s);
 
-    qbus_reset_all(BUS(&s->bus));
+    bus_cold_reset(BUS(&s->bus));
     s->intr_status = 0;
     s->intr_mask = save_mask;
 
diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index 0a8cbf5a4b5..5bbbef64ef3 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -865,7 +865,7 @@ static int vscsi_process_tsk_mgmt(VSCSIState *s, vscsi_req *req)
                 break;
             }
 
-            qdev_reset_all(&d->qdev);
+            device_cold_reset(&d->qdev);
             break;
 
         case SRP_TSK_ABORT_TASK_SET:
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 41f2a563017..2dd40dcf90b 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -365,7 +365,7 @@ static int virtio_scsi_do_tmf(VirtIOSCSI *s, VirtIOSCSIReq *req)
             goto incorrect_lun;
         }
         s->resetting++;
-        qdev_reset_all(&d->qdev);
+        device_cold_reset(&d->qdev);
         s->resetting--;
         break;
 
@@ -417,7 +417,7 @@ static int virtio_scsi_do_tmf(VirtIOSCSI *s, VirtIOSCSIReq *req)
         QTAILQ_FOREACH_RCU(kid, &s->bus.qbus.children, sibling) {
             SCSIDevice *d1 = SCSI_DEVICE(kid->child);
             if (d1->channel == 0 && d1->id == target) {
-                qdev_reset_all(&d1->qdev);
+                device_cold_reset(&d1->qdev);
             }
         }
         rcu_read_unlock();
@@ -831,7 +831,7 @@ static void virtio_scsi_reset(VirtIODevice *vdev)
 
     assert(!s->dataplane_started);
     s->resetting++;
-    qbus_reset_all(BUS(&s->bus));
+    bus_cold_reset(BUS(&s->bus));
     s->resetting--;
 
     vs->sense_size = VIRTIO_SCSI_SENSE_DEFAULT_SIZE;
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 91e2f858aba..3ea2c8c9f23 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -445,7 +445,7 @@ static void
 pvscsi_reset_adapter(PVSCSIState *s)
 {
     s->resetting++;
-    qbus_reset_all(BUS(&s->bus));
+    bus_cold_reset(BUS(&s->bus));
     s->resetting--;
     pvscsi_process_completion_queue(s);
     assert(QTAILQ_EMPTY(&s->pending_queue));
@@ -894,7 +894,7 @@ pvscsi_on_cmd_reset_bus(PVSCSIState *s)
     trace_pvscsi_on_cmd_arrived("PVSCSI_CMD_RESET_BUS");
 
     s->resetting++;
-    qbus_reset_all(BUS(&s->bus));
+    bus_cold_reset(BUS(&s->bus));
     s->resetting--;
     return PVSCSI_COMMAND_PROCESSING_SUCCEEDED;
 }
-- 
2.25.1


