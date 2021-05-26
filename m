Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7623919D5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:19:26 +0200 (CEST)
Received: from localhost ([::1]:42702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lluNY-00019z-Ir
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBs-000405-8B
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBq-0004G7-EF
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622038037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yweZ022dQXpkY9SZ4669BEpuLFg/ywULhqQmb4b7GHI=;
 b=YDpTDQxpz4hfK28iRWJ5uo3Xnz0MJ7mM4zND5kjtJSrYJg0v41MvftiU86cz3pQSC1Fl39
 OxFrSAduFqAhpee8yPPLvbRB1/YuWF9XZkBBDg5C4o5KuT6m3sr7wRB1SdZE12ysHeam3Y
 55XFiVhxNvUDJw6ZStZ95GNhrBhjdZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-VuJ-xEsfNb6ZQq6iW6zGrg-1; Wed, 26 May 2021 10:07:15 -0400
X-MC-Unique: VuJ-xEsfNb6ZQq6iW6zGrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CCE3800D55;
 Wed, 26 May 2021 14:07:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6185219D9D;
 Wed, 26 May 2021 14:07:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DCF0A1800936; Wed, 26 May 2021 16:06:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/14] pckbd: add function kbd_pending()
Date: Wed, 26 May 2021 16:06:23 +0200
Message-Id: <20210526140627.381857-11-kraxel@redhat.com>
In-Reply-To: <20210526140627.381857-1-kraxel@redhat.com>
References: <20210526140627.381857-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Replace reads of the variable s->pending with a call to a new
function kbd_pending() to ease the review of the next patch.
There is no functional change.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20210525181441.27768-9-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/pckbd.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 294b31590196..e9905e1c6b8c 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -198,21 +198,28 @@ static void kbd_deassert_irq(KBDState *s)
     kbd_update_irq_lines(s);
 }
 
+static uint8_t kbd_pending(KBDState *s)
+{
+    return s->pending;
+}
+
 /* update irq and KBD_STAT_[MOUSE_]OBF */
 static void kbd_update_irq(KBDState *s)
 {
+    uint8_t pending = kbd_pending(s);
+
     s->status &= ~(KBD_STAT_OBF | KBD_STAT_MOUSE_OBF);
     s->outport &= ~(KBD_OUT_OBF | KBD_OUT_MOUSE_OBF);
-    if (s->pending) {
+    if (pending) {
         s->status |= KBD_STAT_OBF;
         s->outport |= KBD_OUT_OBF;
-        if (s->pending & KBD_PENDING_CTRL_KBD) {
+        if (pending & KBD_PENDING_CTRL_KBD) {
             s->obsrc = KBD_OBSRC_CTRL;
-        } else if (s->pending & KBD_PENDING_CTRL_AUX) {
+        } else if (pending & KBD_PENDING_CTRL_AUX) {
             s->status |= KBD_STAT_MOUSE_OBF;
             s->outport |= KBD_OUT_MOUSE_OBF;
             s->obsrc = KBD_OBSRC_CTRL;
-        } else if (s->pending & KBD_PENDING_KBD) {
+        } else if (pending & KBD_PENDING_KBD) {
             s->obsrc = KBD_OBSRC_KBD;
         } else {
             s->status |= KBD_STAT_MOUSE_OBF;
@@ -236,7 +243,7 @@ static void kbd_safe_update_irq(KBDState *s)
     if (s->throttle_timer && timer_pending(s->throttle_timer)) {
         return;
     }
-    if (s->pending) {
+    if (kbd_pending(s)) {
         kbd_update_irq(s);
     }
 }
@@ -269,7 +276,7 @@ static void kbd_throttle_timeout(void *opaque)
 {
     KBDState *s = opaque;
 
-    if (s->pending) {
+    if (kbd_pending(s)) {
         kbd_update_irq(s);
     }
 }
@@ -301,7 +308,7 @@ static uint8_t kbd_dequeue(KBDState *s)
     uint8_t b = s->cbdata;
 
     s->pending &= ~KBD_PENDING_CTRL_KBD & ~KBD_PENDING_CTRL_AUX;
-    if (s->pending) {
+    if (kbd_pending(s)) {
         kbd_update_irq(s);
     }
     return b;
-- 
2.31.1


