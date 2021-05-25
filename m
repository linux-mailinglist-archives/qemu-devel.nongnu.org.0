Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1777D3908C8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 20:19:18 +0200 (CEST)
Received: from localhost ([::1]:59018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llbe8-0005aB-Lk
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 14:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llba1-0002Xq-Kh
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:01 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:46972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llbZs-0003bE-OT
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:01 -0400
Received: from fwd31.aul.t-online.de (fwd31.aul.t-online.de [172.20.26.136])
 by mailout08.t-online.de (Postfix) with SMTP id 492DB4DFCC;
 Tue, 25 May 2021 20:14:50 +0200 (CEST)
Received: from linpower.localnet
 (ZB2nFrZfwhh4OLP8-W3rZf9hFyPZ6I0z9dAcDRrHDoa-7rStRysTY-LLrTOgqFEgaV@[93.236.158.49])
 by fwd31.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1llbZn-23a8rw0; Tue, 25 May 2021 20:14:47 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 8764E2000A7; Tue, 25 May 2021 20:14:41 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 03/12] ps2: don't deassert irq twice if queue is empty
Date: Tue, 25 May 2021 20:14:32 +0200
Message-Id: <20210525181441.27768-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
References: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: ZB2nFrZfwhh4OLP8-W3rZf9hFyPZ6I0z9dAcDRrHDoa-7rStRysTY-LLrTOgqFEgaV
X-TOI-EXPURGATEID: 150726::1621966487-000102A7-40EBE6F2/0/0 CLEAN NORMAL
X-TOI-MSGID: 2dc7ec04-7dd5-450e-bbbc-b71738c902b4
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
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

Don't deassert the irq twice if the queue is empty. While the
second deassertion doesn't do any harm, it's unnecessary.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/ps2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 55a81a0c51..4aee46a595 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -519,7 +519,9 @@ uint32_t ps2_read_data(PS2State *s)
         /* reading deasserts IRQ */
         s->update_irq(s->update_arg, 0);
         /* reassert IRQs if data left */
-        s->update_irq(s->update_arg, q->count != 0);
+        if (q->count) {
+            s->update_irq(s->update_arg, 1);
+        }
     }
     return val;
 }
-- 
2.26.2


