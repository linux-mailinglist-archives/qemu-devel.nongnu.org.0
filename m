Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1BB5A5C05
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 08:45:03 +0200 (CEST)
Received: from localhost ([::1]:45948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSuze-0004FJ-HE
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 02:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oSutR-0008AI-DZ
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 02:38:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oSutO-0003TL-V2
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 02:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661841514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GX8TRsXP1TkBC79Lr0q9Tt4AaChfkw0YPNy8WRpG+mw=;
 b=gEtHpzamk4FBKwz+dpV91qPlAKiJ9IkWufrR/rQGfjJW60X6sC+rKr7UnNzBF0zu5bKMe1
 8OJOq4btX6VsEnztzR70iEKo+mOkesl6M2PGVhq2ah9GDQkRMpE2eHiTGkAKllSM1x0oCF
 22NxuWwNSTtL1SMcWLzM/0Iozcph+/4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-HNffULwjMbqaJneY_oabtg-1; Tue, 30 Aug 2022 02:38:30 -0400
X-MC-Unique: HNffULwjMbqaJneY_oabtg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A44A185A79C;
 Tue, 30 Aug 2022 06:38:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A09D2166B26;
 Tue, 30 Aug 2022 06:38:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8811B180062F; Tue, 30 Aug 2022 08:38:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Qiang Liu <cyruscyliu@gmail.com>
Subject: [PATCH 2/2] usb/msd: add usb_msd_fatal_error() and fix
 guest-triggerable assert
Date: Tue, 30 Aug 2022 08:38:27 +0200
Message-Id: <20220830063827.813053-3-kraxel@redhat.com>
In-Reply-To: <20220830063827.813053-1-kraxel@redhat.com>
References: <20220830063827.813053-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index 4485a2411797..3928209b8249 100644
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
2.37.2


