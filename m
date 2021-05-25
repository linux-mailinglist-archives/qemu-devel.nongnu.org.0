Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3E63908F4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 20:28:24 +0200 (CEST)
Received: from localhost ([::1]:51088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llbmy-0002ng-1E
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 14:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llbaU-0002lJ-Ik
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:34 -0400
Received: from mailout05.t-online.de ([194.25.134.82]:34982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llbaE-0003jw-LD
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:30 -0400
Received: from fwd02.aul.t-online.de (fwd02.aul.t-online.de [172.20.26.148])
 by mailout05.t-online.de (Postfix) with SMTP id D0288FA7D;
 Tue, 25 May 2021 20:15:11 +0200 (CEST)
Received: from linpower.localnet
 (GEAK1cZlQhx8dQWfytRdTiRI5wpj07keMtCpga8KKoENgYW5Ki1sbo1KJtWrZHuwik@[93.236.158.49])
 by fwd02.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1llbaB-0myd5E0; Tue, 25 May 2021 20:15:11 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 9FCBD20061E; Tue, 25 May 2021 20:14:41 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 12/12] pckbd: clear outport_present in outer pre_load()
Date: Tue, 25 May 2021 20:14:41 +0200
Message-Id: <20210525181441.27768-12-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
References: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: GEAK1cZlQhx8dQWfytRdTiRI5wpj07keMtCpga8KKoENgYW5Ki1sbo1KJtWrZHuwik
X-TOI-EXPURGATEID: 150726::1621966511-0000AFC8-B3273E59/0/0 CLEAN NORMAL
X-TOI-MSGID: 7c5f660e-e330-4924-b5f2-79295d968f7b
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

The variable outport_present is a flag to show if the outport
subsection was loaded. Clear the outport_present flag in the
outer pre_load() function. This method is recommended in the QEMU
manual for developers in the chapter "Migration, Subsections".

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/pckbd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index de867abc06..baba62f357 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -457,7 +457,6 @@ static void kbd_reset(void *opaque)
     s->mode = KBD_MODE_KBD_INT | KBD_MODE_MOUSE_INT;
     s->status = KBD_STAT_CMD | KBD_STAT_UNLOCKED;
     s->outport = KBD_OUT_RESET | KBD_OUT_A20 | KBD_OUT_ONES;
-    s->outport_present = false;
     s->pending = 0;
     kbd_deassert_irq(s);
     if (s->throttle_timer) {
@@ -564,6 +563,7 @@ static int kbd_pre_load(void *opaque)
 {
     KBDState *s = opaque;
 
+    s->outport_present = false;
     s->extended_state_loaded = false;
     return 0;
 }
@@ -574,7 +574,6 @@ static int kbd_post_load(void *opaque, int version_id)
     if (!s->outport_present) {
         s->outport = kbd_outport_default(s);
     }
-    s->outport_present = false;
     s->pending = s->pending_tmp;
     if (!s->extended_state_loaded) {
         s->obsrc = s->status & KBD_STAT_OBF ?
-- 
2.26.2


