Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EAB381873
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:41:45 +0200 (CEST)
Received: from localhost ([::1]:36696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhsfw-0005Tj-LA
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lhsXt-0004Wd-HO
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:33:25 -0400
Received: from mailout05.t-online.de ([194.25.134.82]:50456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lhsXr-0003U3-Rq
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:33:25 -0400
Received: from fwd34.aul.t-online.de (fwd34.aul.t-online.de [172.20.26.145])
 by mailout05.t-online.de (Postfix) with SMTP id B9A2B641C0;
 Sat, 15 May 2021 13:33:22 +0200 (CEST)
Received: from linpower.localnet
 (bKYWmoZeYhFnUefgADweDEM+5sV8gKfaeNdzIwxm0isnHP1oXIfxdo+LbvIgD9hQRd@[79.208.18.63])
 by fwd34.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lhsXk-3rUUts0; Sat, 15 May 2021 13:33:16 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id B35D920062E; Sat, 15 May 2021 13:32:54 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 09/11] pckbd: add function kbd_pending()
Date: Sat, 15 May 2021 13:32:52 +0200
Message-Id: <20210515113254.6245-9-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
References: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: bKYWmoZeYhFnUefgADweDEM+5sV8gKfaeNdzIwxm0isnHP1oXIfxdo+LbvIgD9hQRd
X-TOI-EXPURGATEID: 150726::1621078396-000126A7-235C9E0D/0/0 CLEAN NORMAL
X-TOI-MSGID: 7633e56a-bd2d-4b76-9931-59d192553f67
Received-SPF: none client-ip=194.25.134.82;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout05.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace reads of the variable s->pending with a call to a new
function kbd_pending() to ease the review of the next patch.
There is no functional change.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/pckbd.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index e9523e164f..199367dcab 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -195,21 +195,28 @@ static void kbd_deassert_irq(KBDState *s)
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
@@ -233,7 +240,7 @@ static void kbd_safe_update_irq(KBDState *s)
     if (s->throttle_timer && timer_pending(s->throttle_timer)) {
         return;
     }
-    if (s->pending) {
+    if (kbd_pending(s)) {
         kbd_update_irq(s);
     }
 }
@@ -266,7 +273,7 @@ static void kbd_throttle_timeout(void *opaque)
 {
     KBDState *s = opaque;
 
-    if (s->pending) {
+    if (kbd_pending(s)) {
         kbd_update_irq(s);
     }
 }
@@ -294,7 +301,7 @@ static uint8_t kbd_dequeue(KBDState *s)
     uint8_t b = s->cbdata;
 
     s->pending &= ~KBD_PENDING_CTRL_KBD & ~KBD_PENDING_CTRL_AUX;
-    if (s->pending) {
+    if (kbd_pending(s)) {
         kbd_update_irq(s);
     }
     return b;
-- 
2.26.2


