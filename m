Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C652B28C350
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 22:51:21 +0200 (CEST)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS4mu-0008PN-Pl
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 16:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kS4WV-0002wz-4O
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 16:34:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kS4WO-0002jK-90
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 16:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602534854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pW3I7+8Fr03yk/X+Wk7CJwUrSBzdKsHrG85hgVxf070=;
 b=DYB/SGOkv+6D3VHJO4On9j3nllmjmffljiqP+Y36ewBjcpuxi3qwwJVguP94KkMJO/YBSh
 XLfiYaD/236ga+lsp0l7IN9V8JJ22jERnkElCJz6kpILLaGjcXe7MOITq7z1TtnOMV1jdz
 LhFrwwqh3OMv8Cw2WsQKVBvj2MiMJmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-kdwtCmT9PY6bY-Zzxo7yrA-1; Mon, 12 Oct 2020 16:34:12 -0400
X-MC-Unique: kdwtCmT9PY6bY-Zzxo7yrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43D30890EAC;
 Mon, 12 Oct 2020 20:34:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C08AA6EF59;
 Mon, 12 Oct 2020 20:34:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/38] virtio-scsi: use scsi_device_get
Date: Mon, 12 Oct 2020 16:33:41 -0400
Message-Id: <20201012203343.1105018-37-pbonzini@redhat.com>
In-Reply-To: <20201012203343.1105018-1-pbonzini@redhat.com>
References: <20201012203343.1105018-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 16:33:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

This will help us to avoid the scsi device disappearing
after we took a reference to it.

It doesn't by itself forbid case when we try to access
an unrealized device

Suggested-by: Stefan Hajnoczi <stefanha@gmail.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20200913160259.32145-9-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201006123904.610658-13-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/virtio-scsi.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 971afbb217..3db9a8aae9 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -33,7 +33,7 @@ static inline int virtio_scsi_get_lun(uint8_t *lun)
     return ((lun[2] << 8) | lun[3]) & 0x3FFF;
 }
 
-static inline SCSIDevice *virtio_scsi_device_find(VirtIOSCSI *s, uint8_t *lun)
+static inline SCSIDevice *virtio_scsi_device_get(VirtIOSCSI *s, uint8_t *lun)
 {
     if (lun[0] != 1) {
         return NULL;
@@ -41,7 +41,7 @@ static inline SCSIDevice *virtio_scsi_device_find(VirtIOSCSI *s, uint8_t *lun)
     if (lun[2] != 0 && !(lun[2] >= 0x40 && lun[2] < 0x80)) {
         return NULL;
     }
-    return scsi_device_find(&s->bus, 0, lun[1], virtio_scsi_get_lun(lun));
+    return scsi_device_get(&s->bus, 0, lun[1], virtio_scsi_get_lun(lun));
 }
 
 void virtio_scsi_init_req(VirtIOSCSI *s, VirtQueue *vq, VirtIOSCSIReq *req)
@@ -256,7 +256,7 @@ static inline void virtio_scsi_ctx_check(VirtIOSCSI *s, SCSIDevice *d)
  *  case of async cancellation. */
 static int virtio_scsi_do_tmf(VirtIOSCSI *s, VirtIOSCSIReq *req)
 {
-    SCSIDevice *d = virtio_scsi_device_find(s, req->req.tmf.lun);
+    SCSIDevice *d = virtio_scsi_device_get(s, req->req.tmf.lun);
     SCSIRequest *r, *next;
     BusChild *kid;
     int target;
@@ -370,10 +370,10 @@ static int virtio_scsi_do_tmf(VirtIOSCSI *s, VirtIOSCSIReq *req)
 
         rcu_read_lock();
         QTAILQ_FOREACH_RCU(kid, &s->bus.qbus.children, sibling) {
-             d = SCSI_DEVICE(kid->child);
-             if (d->channel == 0 && d->id == target) {
-                qdev_reset_all(&d->qdev);
-             }
+            SCSIDevice *d1 = SCSI_DEVICE(kid->child);
+            if (d1->channel == 0 && d1->id == target) {
+                qdev_reset_all(&d1->qdev);
+            }
         }
         rcu_read_unlock();
 
@@ -386,14 +386,17 @@ static int virtio_scsi_do_tmf(VirtIOSCSI *s, VirtIOSCSIReq *req)
         break;
     }
 
+    object_unref(OBJECT(d));
     return ret;
 
 incorrect_lun:
     req->resp.tmf.response = VIRTIO_SCSI_S_INCORRECT_LUN;
+    object_unref(OBJECT(d));
     return ret;
 
 fail:
     req->resp.tmf.response = VIRTIO_SCSI_S_BAD_TARGET;
+    object_unref(OBJECT(d));
     return ret;
 }
 
@@ -564,7 +567,7 @@ static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCSIReq *req)
         }
     }
 
-    d = virtio_scsi_device_find(s, req->req.cmd.lun);
+    d = virtio_scsi_device_get(s, req->req.cmd.lun);
     if (!d) {
         req->resp.cmd.response = VIRTIO_SCSI_S_BAD_TARGET;
         virtio_scsi_complete_cmd_req(req);
@@ -580,10 +583,12 @@ static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCSIReq *req)
             req->sreq->cmd.xfer > req->qsgl.size)) {
         req->resp.cmd.response = VIRTIO_SCSI_S_OVERRUN;
         virtio_scsi_complete_cmd_req(req);
+        object_unref(OBJECT(d));
         return -ENOBUFS;
     }
     scsi_req_ref(req->sreq);
     blk_io_plug(d->conf.blk);
+    object_unref(OBJECT(d));
     return 0;
 }
 
-- 
2.26.2



