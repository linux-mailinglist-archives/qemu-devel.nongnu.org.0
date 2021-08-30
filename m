Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5FD3FB3E8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 12:30:25 +0200 (CEST)
Received: from localhost ([::1]:60384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKeYb-0005gK-0H
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 06:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTi-0005hj-DV
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53290
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTW-00071W-0A
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:15 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeT2-0003D2-Sc; Mon, 30 Aug 2021 11:24:46 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Mon, 30 Aug 2021 11:24:37 +0100
Message-Id: <20210830102447.10806-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 02/12] mac_via: move last_b variable into q800 VIA1
 VMStateDescription
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This variable is already present in MOS6522Q800VIA1State and can be moved
immediately into the q800 VIA1 VMStateDescription.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mac_via.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 46e65058e0..6fb0b9391d 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1083,7 +1083,6 @@ static const VMStateDescription vmstate_mac_via = {
     .post_load = mac_via_post_load,
     .fields = (VMStateField[]) {
         /* VIAs */
-        VMSTATE_UINT8(mos6522_via1.last_b, MacVIAState),
         VMSTATE_BUFFER(mos6522_via1.PRAM, MacVIAState),
         VMSTATE_TIMER_PTR(mos6522_via1.one_second_timer, MacVIAState),
         VMSTATE_INT64(mos6522_via1.next_second, MacVIAState),
@@ -1159,6 +1158,7 @@ static const VMStateDescription vmstate_q800_via1 = {
     .fields = (VMStateField[]) {
         VMSTATE_STRUCT(parent_obj, MOS6522Q800VIA1State, 0, vmstate_mos6522,
                        MOS6522State),
+        VMSTATE_UINT8(last_b, MOS6522Q800VIA1State),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.20.1


