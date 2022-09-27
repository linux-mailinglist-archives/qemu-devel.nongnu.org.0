Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430315EBE51
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:20:21 +0200 (CEST)
Received: from localhost ([::1]:52430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6lI-0003tA-4C
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oV-0005Wd-OV
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oT-0000Jv-Qh
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664266770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1/bz0ZvfMImJCS6WH5kQCYHFBHl/aO5fDf5KXRDm0YE=;
 b=SLE/xsuUJEdGt/eIF/OQSZwJMp4tLrb7XcI8bGSUFy6aMTFVpQnAM7m4VLNC6gg6z88K58
 8a5bpcCAiGp0AZjJxfgsHCxP9TaJHLU6aQeP+HbxDZwGYjUyPJ7zgDLWkfwoEC4vl/Cx4S
 lCOKmuQAE5TEQEK1FiNiN7e4H/Er1Fc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-NgBXk3BLPJmU17-imvproA-1; Tue, 27 Sep 2022 04:19:27 -0400
X-MC-Unique: NgBXk3BLPJmU17-imvproA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BD54185A794;
 Tue, 27 Sep 2022 08:19:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1F80111E414;
 Tue, 27 Sep 2022 08:19:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A77AA180099B; Tue, 27 Sep 2022 10:19:13 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alexandre Ratchov <alex@caoua.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Qiang Liu <cyruscyliu@gmail.com>
Subject: [PULL 14/24] usb/msd: add usb_msd_fatal_error() and fix
 guest-triggerable assert
Date: Tue, 27 Sep 2022 10:19:02 +0200
Message-Id: <20220927081912.180983-15-kraxel@redhat.com>
In-Reply-To: <20220927081912.180983-1-kraxel@redhat.com>
References: <20220927081912.180983-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add handler for fatal errors.  Moves device into error state where it
stops responding until the guest resets it.

Guest can send illegal requests where scsi command and usb packet
transfer directions are inconsistent.  Use the new usb_msd_fatal_error()
function instead of assert() in that case.

Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Qiang Liu <cyruscyliu@gmail.com>
Message-Id: <20220830063827.813053-3-kraxel@redhat.com>
---
 include/hw/usb/msd.h |  1 +
 hw/usb/dev-storage.c | 30 +++++++++++++++++++++++++++++-
 hw/usb/trace-events  |  1 +
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/hw/usb/msd.h b/include/hw/usb/msd.h
index 54e9f38bda46..f9fd862b529a 100644
--- a/include/hw/usb/msd.h
+++ b/include/hw/usb/msd.h
@@ -40,6 +40,7 @@ struct MSDState {
     bool removable;
     bool commandlog;
     SCSIDevice *scsi_dev;
+    bool needs_reset;
 };
 
 typedef struct MSDState MSDState;
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 140ef2aeaa80..e3bcffb3e0d7 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -191,6 +191,23 @@ static void usb_msd_packet_complete(MSDState *s)
     usb_packet_complete(&s->dev, p);
 }
 
+static void usb_msd_fatal_error(MSDState *s)
+{
+    trace_usb_msd_fatal_error();
+
+    if (s->packet) {
+        s->packet->status = USB_RET_STALL;
+        usb_msd_packet_complete(s);
+    }
+
+    /*
+     * Guest messed up up device state with illegal requests.  Go
+     * ignore any requests until the guests resets the device (and
+     * brings it into a known state that way).
+     */
+    s->needs_reset = true;
+}
+
 static void usb_msd_copy_data(MSDState *s, USBPacket *p)
 {
     uint32_t len;
@@ -227,7 +244,11 @@ void usb_msd_transfer_data(SCSIRequest *req, uint32_t len)
     MSDState *s = DO_UPCAST(MSDState, dev.qdev, req->bus->qbus.parent);
     USBPacket *p = s->packet;
 
-    assert((s->mode == USB_MSDM_DATAOUT) == (req->cmd.mode == SCSI_XFER_TO_DEV));
+    if ((s->mode == USB_MSDM_DATAOUT) != (req->cmd.mode == SCSI_XFER_TO_DEV)) {
+        usb_msd_fatal_error(s);
+        return;
+    }
+
     s->scsi_len = len;
     s->scsi_off = 0;
     if (p) {
@@ -317,6 +338,8 @@ void usb_msd_handle_reset(USBDevice *dev)
 
     memset(&s->csw, 0, sizeof(s->csw));
     s->mode = USB_MSDM_CBW;
+
+    s->needs_reset = false;
 }
 
 static void usb_msd_handle_control(USBDevice *dev, USBPacket *p,
@@ -382,6 +405,11 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
     SCSIDevice *scsi_dev;
     uint32_t len;
 
+    if (s->needs_reset) {
+        p->status = USB_RET_STALL;
+        return;
+    }
+
     switch (p->pid) {
     case USB_TOKEN_OUT:
         if (devep != 2)
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index 914ca7166829..b65269892c5e 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -263,6 +263,7 @@ usb_msd_packet_complete(void) ""
 usb_msd_cmd_submit(unsigned lun, unsigned tag, unsigned flags, unsigned len, unsigned data_len) "lun %u, tag 0x%x, flags 0x%08x, len %d, data-len %d"
 usb_msd_cmd_complete(unsigned status, unsigned tag) "status %d, tag 0x%x"
 usb_msd_cmd_cancel(unsigned tag) "tag 0x%x"
+usb_msd_fatal_error(void) ""
 
 # dev-uas.c
 usb_uas_reset(int addr) "dev %d"
-- 
2.37.3


