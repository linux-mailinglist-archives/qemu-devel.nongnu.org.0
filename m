Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B967F5AF3C1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 20:38:02 +0200 (CEST)
Received: from localhost ([::1]:58958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVdST-0002bR-SR
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 14:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcb30@ipxe.org>) id 1oVdMJ-0003HC-3F
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 14:31:39 -0400
Received: from blyat.fensystems.co.uk ([54.246.183.96]:56010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcb30@ipxe.org>) id 1oVdMH-0004sk-In
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 14:31:38 -0400
Received: from dolphin.home (unknown
 [IPv6:2a00:23c6:5486:8700:72b3:d5ff:feb1:e101])
 by blyat.fensystems.co.uk (Postfix) with ESMTPSA id 9EE8D44271;
 Tue,  6 Sep 2022 18:31:34 +0000 (UTC)
From: Michael Brown <mcb30@ipxe.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Michael Brown <mcb30@ipxe.org>
Subject: [PATCH 2/4] usbnet: Accept mandatory
 USB_CDC_SET_ETHERNET_PACKET_FILTER request
Date: Tue,  6 Sep 2022 19:30:51 +0100
Message-Id: <20220906183053.3625472-3-mcb30@ipxe.org>
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

The USB_CDC_SET_ETHERNET_PACKET_FILTER request is mandatory for
CDC-ECM devices.  Accept this request, ignoring the actual filter
value (to match the existing behaviour for RNDIS).

Signed-off-by: Michael Brown <mcb30@ipxe.org>
---
 hw/usb/dev-network.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index 61bf598870..155df935cd 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -1122,6 +1122,12 @@ static void usb_net_handle_control(USBDevice *dev, USBPacket *p,
 #endif
         break;
 
+    case ClassInterfaceOutRequest | USB_CDC_SET_ETHERNET_PACKET_FILTER:
+        if (is_rndis(s)) {
+            goto fail;
+        }
+        break;
+
     default:
     fail:
         fprintf(stderr, "usbnet: failed control transaction: "
-- 
2.35.1


