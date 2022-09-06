Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912C65AF3A4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 20:35:31 +0200 (CEST)
Received: from localhost ([::1]:35498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVdQ2-00087k-MV
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 14:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcb30@ipxe.org>) id 1oVdML-0003M3-5x
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 14:31:41 -0400
Received: from blyat.fensystems.co.uk ([54.246.183.96]:56036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcb30@ipxe.org>) id 1oVdMJ-0004sw-IF
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 14:31:40 -0400
Received: from dolphin.home (unknown
 [IPv6:2a00:23c6:5486:8700:72b3:d5ff:feb1:e101])
 by blyat.fensystems.co.uk (Postfix) with ESMTPSA id 7F386442B3;
 Tue,  6 Sep 2022 18:31:36 +0000 (UTC)
From: Michael Brown <mcb30@ipxe.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Michael Brown <mcb30@ipxe.org>
Subject: [PATCH 3/4] usbnet: Detect short packets as sent by the xHCI
 controller
Date: Tue,  6 Sep 2022 19:30:52 +0100
Message-Id: <20220906183053.3625472-4-mcb30@ipxe.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220906183053.3625472-1-mcb30@ipxe.org>
References: <20220906183053.3625472-1-mcb30@ipxe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=54.246.183.96; envelope-from=mcb30@ipxe.org;
 helo=blyat.fensystems.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The xHCI controller will ignore the endpoint MTU and so may deliver
packets of any length.  Detect short packets as being any packet that
has a length of zero or a length that is not a multiple of the MTU.

Signed-off-by: Michael Brown <mcb30@ipxe.org>
---
 hw/usb/dev-network.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index 155df935cd..9d83974ec9 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -1211,7 +1211,7 @@ static void usb_net_handle_dataout(USBNetState *s, USBPacket *p)
     s->out_ptr += sz;
 
     if (!is_rndis(s)) {
-        if (p->iov.size < 64) {
+        if (p->iov.size % 64 || p->iov.size == 0) {
             qemu_send_packet(qemu_get_queue(s->nic), s->out_buf, s->out_ptr);
             s->out_ptr = 0;
         }
-- 
2.35.1


