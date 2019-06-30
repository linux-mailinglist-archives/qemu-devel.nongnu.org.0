Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE775B101
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jun 2019 19:37:09 +0200 (CEST)
Received: from localhost ([::1]:45802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhdlE-0001iS-8R
	for lists+qemu-devel@lfdr.de; Sun, 30 Jun 2019 13:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58311)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hhdjU-0000LM-73
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 13:35:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hhdjT-0000Tx-81
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 13:35:20 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:40194
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1hhdjT-0007yq-1P
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 13:35:19 -0400
Received: from host109-146-132-17.range109-146.btcentralplus.com
 ([109.146.132.17] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hhdfr-0001xd-Gf
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 18:31:35 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org
Date: Sun, 30 Jun 2019 18:32:00 +0100
Message-Id: <20190630173203.9620-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190630173203.9620-1-mark.cave-ayland@ilande.co.uk>
References: <20190630173203.9620-1-mark.cave-ayland@ilande.co.uk>
X-SA-Exim-Connect-IP: 109.146.132.17
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: [Qemu-devel] [PATCH 2/5] sunhme: fix incorrect constant in
 sunhme_can_receive()
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Due to a copy/paste error the wrong register was being checked in order to
determine if the NIC is able to receive data.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/sunhme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index 6d660a8238..e3a488ee1d 100644
--- a/hw/net/sunhme.c
+++ b/hw/net/sunhme.c
@@ -649,7 +649,7 @@ static int sunhme_can_receive(NetClientState *nc)
 {
     SunHMEState *s = qemu_get_nic_opaque(nc);
 
-    return s->macregs[HME_MAC_RXCFG_ENABLE >> 2] & HME_MAC_RXCFG_ENABLE;
+    return s->macregs[HME_MACI_RXCFG >> 2] & HME_MAC_RXCFG_ENABLE;
 }
 
 static void sunhme_link_status_changed(NetClientState *nc)
-- 
2.11.0


