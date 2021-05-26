Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9723919C3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:16:17 +0200 (CEST)
Received: from localhost ([::1]:36524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lluKW-0005Hu-EO
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBq-0003s2-BE
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBn-0004Dy-Bp
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622038034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3zxtObz7CwwlAK0TDVpJnJqWHyrye+hGJYI0zTV6bA=;
 b=fS/GhbAUt9/L2eqlKwU54JFbbzhoAWwySPItPvY4DBwf0VoA4Y/vdavfEDekoLDGSAr7Oc
 qMyYbkyiZWpBS7jYu6p7oH2f82+PcruElNtKYX42nb8MxEQMqDOmlGmr3z895Sb6Ec6YmQ
 OIj0FCFiD4J61tZp5aj6n1DRAGTRVKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-C438MvkCNc6u49zdWrPXyA-1; Wed, 26 May 2021 10:07:12 -0400
X-MC-Unique: C438MvkCNc6u49zdWrPXyA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 025BB107ACCD;
 Wed, 26 May 2021 14:07:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8762260875;
 Wed, 26 May 2021 14:07:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E92B41800937; Wed, 26 May 2021 16:06:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/14] pckbd: correctly disable PS/2 communication
Date: Wed, 26 May 2021 16:06:24 +0200
Message-Id: <20210526140627.381857-12-kraxel@redhat.com>
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

Currently the PS/2 controller command KBD_CCMD_MOUSE_DISABLE
doesn't disable the PS/2 mouse communication at all, and the
PS/2 controller commands KBD_CCMD_KBD_DISABLE and
KBD_CCMD_KBD_ENABLE only disable and enable the keyboard
interrupt, which is very different from what a real PS/2
controller does. A guest may notice the difference.

Mask out pending data on disabled queues to correctly disable
the PS/2 controller communication.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20210525181441.27768-10-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/pckbd.c | 51 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index e9905e1c6b8c..e73bc8181cff 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -131,10 +131,12 @@
 #define MOUSE_STATUS_ENABLED    0x20
 #define MOUSE_STATUS_SCALE21    0x10
 
-#define KBD_PENDING_KBD         1
-#define KBD_PENDING_AUX         2
+#define KBD_PENDING_KBD_COMPAT  0x01
+#define KBD_PENDING_AUX_COMPAT  0x02
 #define KBD_PENDING_CTRL_KBD    0x04
 #define KBD_PENDING_CTRL_AUX    0x08
+#define KBD_PENDING_KBD         KBD_MODE_DISABLE_KBD    /* 0x10 */
+#define KBD_PENDING_AUX         KBD_MODE_DISABLE_MOUSE  /* 0x20 */
 
 #define KBD_MIGR_TIMER_PENDING  0x1
 
@@ -156,6 +158,7 @@ typedef struct KBDState {
     uint8_t pending;
     uint8_t obdata;
     uint8_t cbdata;
+    uint8_t pending_tmp;
     void *kbd;
     void *mouse;
     QEMUTimer *throttle_timer;
@@ -200,7 +203,11 @@ static void kbd_deassert_irq(KBDState *s)
 
 static uint8_t kbd_pending(KBDState *s)
 {
-    return s->pending;
+    if (s->extended_state) {
+        return s->pending & (~s->mode | ~(KBD_PENDING_KBD | KBD_PENDING_AUX));
+    } else {
+        return s->pending;
+    }
 }
 
 /* update irq and KBD_STAT_[MOUSE_]OBF */
@@ -361,6 +368,7 @@ static void kbd_write_command(void *opaque, hwaddr addr,
         break;
     case KBD_CCMD_MOUSE_ENABLE:
         s->mode &= ~KBD_MODE_DISABLE_MOUSE;
+        kbd_safe_update_irq(s);
         break;
     case KBD_CCMD_TEST_MOUSE:
         kbd_queue(s, 0x00, 0);
@@ -440,6 +448,9 @@ static void kbd_write_data(void *opaque, hwaddr addr,
     switch(s->write_cmd) {
     case 0:
         ps2_write_keyboard(s->kbd, val);
+        /* sending data to the keyboard reenables PS/2 communication */
+        s->mode &= ~KBD_MODE_DISABLE_KBD;
+        kbd_safe_update_irq(s);
         break;
     case KBD_CCMD_WRITE_MODE:
         s->mode = val;
@@ -466,6 +477,9 @@ static void kbd_write_data(void *opaque, hwaddr addr,
         break;
     case KBD_CCMD_WRITE_MOUSE:
         ps2_write_mouse(s->mouse, val);
+        /* sending data to the mouse reenables PS/2 communication */
+        s->mode &= ~KBD_MODE_DISABLE_MOUSE;
+        kbd_safe_update_irq(s);
         break;
     default:
         break;
@@ -565,6 +579,24 @@ static const VMStateDescription vmstate_kbd_extended_state = {
     }
 };
 
+static int kbd_pre_save(void *opaque)
+{
+    KBDState *s = opaque;
+
+    if (s->extended_state) {
+        s->pending_tmp = s->pending;
+    } else {
+        s->pending_tmp = 0;
+        if (s->pending & KBD_PENDING_KBD) {
+            s->pending_tmp |= KBD_PENDING_KBD_COMPAT;
+        }
+        if (s->pending & KBD_PENDING_AUX) {
+            s->pending_tmp |= KBD_PENDING_AUX_COMPAT;
+        }
+    }
+    return 0;
+}
+
 static int kbd_pre_load(void *opaque)
 {
     KBDState *s = opaque;
@@ -580,11 +612,21 @@ static int kbd_post_load(void *opaque, int version_id)
         s->outport = kbd_outport_default(s);
     }
     s->outport_present = false;
+    s->pending = s->pending_tmp;
     if (!s->extended_state_loaded) {
         s->obsrc = s->status & KBD_STAT_OBF ?
             (s->status & KBD_STAT_MOUSE_OBF ? KBD_OBSRC_MOUSE : KBD_OBSRC_KBD) :
             0;
+        if (s->pending & KBD_PENDING_KBD_COMPAT) {
+            s->pending |= KBD_PENDING_KBD;
+        }
+        if (s->pending & KBD_PENDING_AUX_COMPAT) {
+            s->pending |= KBD_PENDING_AUX;
+        }
     }
+    /* clear all unused flags */
+    s->pending &= KBD_PENDING_CTRL_KBD | KBD_PENDING_CTRL_AUX |
+                  KBD_PENDING_KBD | KBD_PENDING_AUX;
     return 0;
 }
 
@@ -594,11 +636,12 @@ static const VMStateDescription vmstate_kbd = {
     .minimum_version_id = 3,
     .pre_load = kbd_pre_load,
     .post_load = kbd_post_load,
+    .pre_save = kbd_pre_save,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(write_cmd, KBDState),
         VMSTATE_UINT8(status, KBDState),
         VMSTATE_UINT8(mode, KBDState),
-        VMSTATE_UINT8(pending, KBDState),
+        VMSTATE_UINT8(pending_tmp, KBDState),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription*[]) {
-- 
2.31.1


