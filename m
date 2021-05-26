Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3171039198E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:09:16 +0200 (CEST)
Received: from localhost ([::1]:40384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lluDi-0005n8-6C
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBO-00036c-Cx
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:06:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBL-0003rZ-7L
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622038006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LjdxxPm/3a5lUA42yV8gfOpAA+r0ZCkN+8OqMTgFe7o=;
 b=TLcykn3eVqmOiSkjb0toxrdcgUAORMK06hvgWmeXQ6DVNTNJWPv0WAPGeKYqAFBjdR/Oe9
 +UlG1/cgIXaQJcuvgXK9za6quSELABhksNgwp0veysbL13lEsJVbNbLz/iKQUIhfcQcNlz
 bN0XOXNDAIYbQ/A3JQgHjVwK/BCcF8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-4agDk1NdP6a03SmyVj4qUQ-1; Wed, 26 May 2021 10:06:43 -0400
X-MC-Unique: 4agDk1NdP6a03SmyVj4qUQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 529A0802938;
 Wed, 26 May 2021 14:06:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CB9118BAF;
 Wed, 26 May 2021 14:06:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9F03A18007A2; Wed, 26 May 2021 16:06:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/14] pckbd: split out interrupt line changing code
Date: Wed, 26 May 2021 16:06:18 +0200
Message-Id: <20210526140627.381857-6-kraxel@redhat.com>
In-Reply-To: <20210526140627.381857-1-kraxel@redhat.com>
References: <20210526140627.381857-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Split out the interrupt line changing code from kbd_update_irq().
This is a preparation for the next patch. There is no functional
change.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20210525181441.27768-4-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/pckbd.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index dde85ba6c683..90b33954a8e9 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -148,15 +148,34 @@ typedef struct KBDState {
     hwaddr mask;
 } KBDState;
 
-/* update irq and KBD_STAT_[MOUSE_]OBF */
 /* XXX: not generating the irqs if KBD_MODE_DISABLE_KBD is set may be
    incorrect, but it avoids having to simulate exact delays */
-static void kbd_update_irq(KBDState *s)
+static void kbd_update_irq_lines(KBDState *s)
 {
     int irq_kbd_level, irq_mouse_level;
 
     irq_kbd_level = 0;
     irq_mouse_level = 0;
+
+    if (s->status & KBD_STAT_OBF) {
+        if (s->status & KBD_STAT_MOUSE_OBF) {
+            if (s->mode & KBD_MODE_MOUSE_INT) {
+                irq_mouse_level = 1;
+            }
+        } else {
+            if ((s->mode & KBD_MODE_KBD_INT) &&
+                !(s->mode & KBD_MODE_DISABLE_KBD)) {
+                irq_kbd_level = 1;
+            }
+        }
+    }
+    qemu_set_irq(s->irq_kbd, irq_kbd_level);
+    qemu_set_irq(s->irq_mouse, irq_mouse_level);
+}
+
+/* update irq and KBD_STAT_[MOUSE_]OBF */
+static void kbd_update_irq(KBDState *s)
+{
     s->status &= ~(KBD_STAT_OBF | KBD_STAT_MOUSE_OBF);
     s->outport &= ~(KBD_OUT_OBF | KBD_OUT_MOUSE_OBF);
     if (s->pending) {
@@ -166,16 +185,9 @@ static void kbd_update_irq(KBDState *s)
         if (s->pending == KBD_PENDING_AUX) {
             s->status |= KBD_STAT_MOUSE_OBF;
             s->outport |= KBD_OUT_MOUSE_OBF;
-            if (s->mode & KBD_MODE_MOUSE_INT)
-                irq_mouse_level = 1;
-        } else {
-            if ((s->mode & KBD_MODE_KBD_INT) &&
-                !(s->mode & KBD_MODE_DISABLE_KBD))
-                irq_kbd_level = 1;
         }
     }
-    qemu_set_irq(s->irq_kbd, irq_kbd_level);
-    qemu_set_irq(s->irq_mouse, irq_mouse_level);
+    kbd_update_irq_lines(s);
 }
 
 static void kbd_update_kbd_irq(void *opaque, int level)
-- 
2.31.1


