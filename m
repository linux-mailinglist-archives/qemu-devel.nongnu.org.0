Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705F53908EC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 20:25:53 +0200 (CEST)
Received: from localhost ([::1]:45282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llbkL-0007CD-9f
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 14:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llba8-0002c7-MD
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:09 -0400
Received: from mailout03.t-online.de ([194.25.134.81]:50930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llba5-0003gY-KL
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:08 -0400
Received: from fwd02.aul.t-online.de (fwd02.aul.t-online.de [172.20.26.148])
 by mailout03.t-online.de (Postfix) with SMTP id 72BCD72226;
 Tue, 25 May 2021 20:15:04 +0200 (CEST)
Received: from linpower.localnet
 (EqWspmZeYhQQEY2kLwTZsswmeWGOO55UGOvPgfmqGfpeut1VNd+uUxWbfTuJQFxZY8@[93.236.158.49])
 by fwd02.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1llba3-0Z5NuC0; Tue, 25 May 2021 20:15:03 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 9744C200619; Tue, 25 May 2021 20:14:41 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 09/12] pckbd: add function kbd_pending()
Date: Tue, 25 May 2021 20:14:38 +0200
Message-Id: <20210525181441.27768-9-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
References: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: EqWspmZeYhQQEY2kLwTZsswmeWGOO55UGOvPgfmqGfpeut1VNd+uUxWbfTuJQFxZY8
X-TOI-EXPURGATEID: 150726::1621966503-0000AFC8-E6CC8708/0/0 CLEAN NORMAL
X-TOI-MSGID: f03aeb4f-a2e1-4fd7-b63e-feb5ad9b064d
Received-SPF: none client-ip=194.25.134.81;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout03.t-online.de
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
index 294b315901..e9905e1c6b 100644
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
2.26.2


