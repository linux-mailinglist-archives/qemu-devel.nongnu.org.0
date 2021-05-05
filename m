Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD613748A9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 21:23:53 +0200 (CEST)
Received: from localhost ([::1]:51130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leN7g-0001zp-4U
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 15:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1leN5g-0000xD-Ie
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:21:48 -0400
Received: from mailout01.t-online.de ([194.25.134.80]:45592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1leN5e-00078D-C6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:21:48 -0400
Received: from fwd01.aul.t-online.de (fwd01.aul.t-online.de [172.20.27.147])
 by mailout01.t-online.de (Postfix) with SMTP id 26D8082000;
 Wed,  5 May 2021 21:21:43 +0200 (CEST)
Received: from linpower.localnet
 (SUax+ZZFQhozB0pFb6o8WwECf8j3rvUDU1X+YzJIwrcLaYaKUQQnEV1FNhwMD4awR9@[46.86.52.8])
 by fwd01.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1leN5X-0kMOEC0; Wed, 5 May 2021 21:21:39 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id EB3BC200618; Wed,  5 May 2021 21:21:33 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 03/10] ps2: don't deassert irq twice if queue is empty
Date: Wed,  5 May 2021 21:21:26 +0200
Message-Id: <20210505192133.7480-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <aed90d92-4e34-6f33-005f-10cf176e5483@t-online.de>
References: <aed90d92-4e34-6f33-005f-10cf176e5483@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: SUax+ZZFQhozB0pFb6o8WwECf8j3rvUDU1X+YzJIwrcLaYaKUQQnEV1FNhwMD4awR9
X-TOI-EXPURGATEID: 150726::1620242500-0000B607-0B1DF161/0/0 CLEAN NORMAL
X-TOI-MSGID: 145b11e3-e4b9-40bb-9145-ea2d49508919
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


