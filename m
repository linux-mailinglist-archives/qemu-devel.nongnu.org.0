Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A563F5BD8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:17:55 +0200 (CEST)
Received: from localhost ([::1]:44772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITVC-0007TW-EO
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITSW-0001HJ-R8; Tue, 24 Aug 2021 06:15:08 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:52591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITST-0004io-NF; Tue, 24 Aug 2021 06:15:08 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 8B1F03200B43;
 Tue, 24 Aug 2021 06:15:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 24 Aug 2021 06:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=sunQMKcdjf3PhugWOo6cDJE1PJ/29
 4p2QNg+l8wdNAY=; b=WNXe1BpiUWknCcqIQzcMj32t4xiBLu2b2dgVym7Z6YzC6
 QJl4XKBtgR9YVxp0THKLl92P7D01jE/0tiWg2DY/L36LfpTMZdrlN55m6K+HBMWP
 kJkUrrT2TZcsVcM9x8ea54HGBxGVDrSQPiuTzo95xVoPjSz98Jq0Ai6eLlYgYhcb
 YAKeGawP9zjEIjaVD/16V/ZfIzEBgaDXbxfwRzO89jBo1VEI1V7dAlapAmCr5X8d
 Yb5Qv2a9CoDDRiwvJL2uHBphk3Mi7iEYwbBR8TckCEmgnp6ouZVlMMlNrXBSL83D
 oKrddoZxg6JFQ9wsJ5hPNIY/3Wnjw8fZ3TSDOHBeA==
X-ME-Sender: <xms:p8YkYbWODUCHaOX1rs2ZbbkH1FgpXPrAVYYFBDqbBX7VoX9yqh8Llw>
 <xme:p8YkYTl9zkB3JiK_Xb54mIUGK79xZhXuIBBNCnuyzFA9t1HX4jfz0G2SSegF89ffC
 1vS8EFjXzkd8gh8cHY>
X-ME-Received: <xmr:p8YkYXbfWPLRJjPnNYpYKC2i6571EP6aHNdAWBohyI0GmuaX74GkWAY2-kxyFurXnX_1vkaLEcCntjzGYUon_CDGAsmkTvg85Y87Og>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtjedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgr
 ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
 hrnhephfetledtgeffuedujedvteevgfdtudeufeekvdfhveekkefhgfevtdfhveeuueet
 necuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
 grihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:p8YkYWWVRqK41on1kg66AXqEobTCoaavDr3Tx1XThrRm2Y--OAN-mg>
 <xmx:p8YkYVkepg3BW2kYRyFU2uWHqnEa2LDYOlqOs1l27-KJRsqIwK3Ydw>
 <xmx:p8YkYTd-8bdcokYqpcQEHKjRG7QVzuLjccz3WwyypCnqh4D05F-beg>
 <xmx:p8YkYbjTIAAqAaOoGyRtoIxmMUf_5Qwr_OKxO0ftRdhEChM6xjXf-w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Aug 2021 06:15:01 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Message-Id: <ae3528be683e131503ea272847a4490d505739ca.1629799776.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1629799776.git.fthain@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [RFC 07/10] hw/mos6522: Fix initial timer counter reload
Date: Tue, 24 Aug 2021 20:09:36 +1000
Received-SPF: none client-ip=64.147.123.25; envelope-from=fthain@linux-m68k.org;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first reload of timer 1 is early by half of a clock cycle as it gets
measured from a falling edge. By contrast, the succeeding reloads are
measured from rising edge to rising edge.

Neglecting that complication, the behaviour of the counter should be the
same from one reload to the next. The sequence is always:

N, N-1, N-2, ... 2, 1, 0, -1, N, N-1, N-2, ...

But at the first reload, the present driver does this instead:

N, N-1, N-2, ... 2, 1, 0, -1, N-1, N-2, ...

Fix this deviation for both timer 1 and timer 2, and allow for the fact
that on a real 6522 the timer 2 counter is not reloaded when it wraps.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 hw/misc/mos6522.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 5b1657ac0d..0a241fe9f8 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -63,15 +63,16 @@ static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti)
     if (ti->index == 0) {
         /* the timer goes down from latch to -1 (period of latch + 2) */
         if (d <= (ti->counter_value + 1)) {
-            counter = (ti->counter_value - d) & 0xffff;
+            counter = ti->counter_value - d;
         } else {
-            counter = (d - (ti->counter_value + 1)) % (ti->latch + 2);
-            counter = (ti->latch - counter) & 0xffff;
+            int64_t d_post_reload = d - (ti->counter_value + 2);
+            /* XXX this calculation assumes that ti->latch has not changed */
+            counter = ti->latch - (d_post_reload % (ti->latch + 2));
         }
     } else {
-        counter = (ti->counter_value - d) & 0xffff;
+        counter = ti->counter_value - d;
     }
-    return counter;
+    return counter & 0xffff;
 }
 
 static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int val)
@@ -103,11 +104,13 @@ static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
 
     /* the timer goes down from latch to -1 (period of latch + 2) */
     if (d <= (ti->counter_value + 1)) {
-        counter = (ti->counter_value - d) & 0xffff;
+        counter = ti->counter_value - d;
     } else {
-        counter = (d - (ti->counter_value + 1)) % (ti->latch + 2);
-        counter = (ti->latch - counter) & 0xffff;
+        int64_t d_post_reload = d - (ti->counter_value + 2);
+        /* XXX this calculation assumes that ti->latch has not changed */
+        counter = ti->latch - (d_post_reload % (ti->latch + 2));
     }
+    counter &= 0xffff;
 
     /* Note: we consider the irq is raised on 0 */
     if (counter == 0xffff) {
-- 
2.26.3


