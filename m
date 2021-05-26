Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06883391999
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:12:16 +0200 (CEST)
Received: from localhost ([::1]:48990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lluGb-0003Eu-UN
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBn-0003fe-5Z
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBl-0004DG-94
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622038032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q4sHrVns34mb2mUy1auX9d9foecyllYeTIx7GAIRdJg=;
 b=Ss/wugwxvxFZrg2HTfLAmsWNob7PvcEDWjypHXe947rV4X0f8iqX8KRu4txunFLSOk6EyU
 GvNgoPPR9pnXXix8ubWyZj7O4ocTme7Ick9cCrNGREDsHU41go9xedwvo/1Nb8VJkntgcM
 2Al+vIAhXAHYVJe1Z9U3FFcsxGv6vl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-1tm3sCyGMUKg9H48HhhiYA-1; Wed, 26 May 2021 10:07:09 -0400
X-MC-Unique: 1tm3sCyGMUKg9H48HhhiYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D071F1922962;
 Wed, 26 May 2021 14:07:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCA1E60C5A;
 Wed, 26 May 2021 14:06:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D17D41800935; Wed, 26 May 2021 16:06:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/14] pckbd: add controller response queue
Date: Wed, 26 May 2021 16:06:22 +0200
Message-Id: <20210526140627.381857-10-kraxel@redhat.com>
In-Reply-To: <20210526140627.381857-1-kraxel@redhat.com>
References: <20210526140627.381857-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Add a separate queue for PS/2 controller responses. The
responses no longer get queued in the keyboard or mouse queues.
The advantage of this can be seen after the next two patches,
where the guest can disable the PS/2 communication with keyboard
and mouse and still talk to the PS/2 controller.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20210525181441.27768-8-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/pckbd.c | 42 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 62a3b29074b8..294b31590196 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -133,11 +133,14 @@
 
 #define KBD_PENDING_KBD         1
 #define KBD_PENDING_AUX         2
+#define KBD_PENDING_CTRL_KBD    0x04
+#define KBD_PENDING_CTRL_AUX    0x08
 
 #define KBD_MIGR_TIMER_PENDING  0x1
 
 #define KBD_OBSRC_KBD           0x01
 #define KBD_OBSRC_MOUSE         0x02
+#define KBD_OBSRC_CTRL          0x04
 
 typedef struct KBDState {
     uint8_t write_cmd; /* if non zero, write data to port 60 is expected */
@@ -152,6 +155,7 @@ typedef struct KBDState {
     /* Bitmask of devices with data available.  */
     uint8_t pending;
     uint8_t obdata;
+    uint8_t cbdata;
     void *kbd;
     void *mouse;
     QEMUTimer *throttle_timer;
@@ -202,12 +206,18 @@ static void kbd_update_irq(KBDState *s)
     if (s->pending) {
         s->status |= KBD_STAT_OBF;
         s->outport |= KBD_OUT_OBF;
-        if (s->pending == KBD_PENDING_AUX) {
+        if (s->pending & KBD_PENDING_CTRL_KBD) {
+            s->obsrc = KBD_OBSRC_CTRL;
+        } else if (s->pending & KBD_PENDING_CTRL_AUX) {
             s->status |= KBD_STAT_MOUSE_OBF;
             s->outport |= KBD_OUT_MOUSE_OBF;
-            s->obsrc = KBD_OBSRC_MOUSE;
-        } else {
+            s->obsrc = KBD_OBSRC_CTRL;
+        } else if (s->pending & KBD_PENDING_KBD) {
             s->obsrc = KBD_OBSRC_KBD;
+        } else {
+            s->status |= KBD_STAT_MOUSE_OBF;
+            s->outport |= KBD_OUT_MOUSE_OBF;
+            s->obsrc = KBD_OBSRC_MOUSE;
         }
     }
     kbd_update_irq_lines(s);
@@ -276,10 +286,25 @@ static uint64_t kbd_read_status(void *opaque, hwaddr addr,
 
 static void kbd_queue(KBDState *s, int b, int aux)
 {
-    if (aux)
-        ps2_queue(s->mouse, b);
-    else
-        ps2_queue(s->kbd, b);
+    if (s->extended_state) {
+        s->cbdata = b;
+        s->pending &= ~KBD_PENDING_CTRL_KBD & ~KBD_PENDING_CTRL_AUX;
+        s->pending |= aux ? KBD_PENDING_CTRL_AUX : KBD_PENDING_CTRL_KBD;
+        kbd_safe_update_irq(s);
+    } else {
+        ps2_queue(aux ? s->mouse : s->kbd, b);
+    }
+}
+
+static uint8_t kbd_dequeue(KBDState *s)
+{
+    uint8_t b = s->cbdata;
+
+    s->pending &= ~KBD_PENDING_CTRL_KBD & ~KBD_PENDING_CTRL_AUX;
+    if (s->pending) {
+        kbd_update_irq(s);
+    }
+    return b;
 }
 
 static void outport_write(KBDState *s, uint32_t val)
@@ -389,6 +414,8 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
             s->obdata = ps2_read_data(s->kbd);
         } else if (s->obsrc & KBD_OBSRC_MOUSE) {
             s->obdata = ps2_read_data(s->mouse);
+        } else if (s->obsrc & KBD_OBSRC_CTRL) {
+            s->obdata = kbd_dequeue(s);
         }
     }
 
@@ -526,6 +553,7 @@ static const VMStateDescription vmstate_kbd_extended_state = {
         VMSTATE_UINT32(migration_flags, KBDState),
         VMSTATE_UINT32(obsrc, KBDState),
         VMSTATE_UINT8(obdata, KBDState),
+        VMSTATE_UINT8(cbdata, KBDState),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.31.1


