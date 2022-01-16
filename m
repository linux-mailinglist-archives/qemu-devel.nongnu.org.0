Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D951648FD38
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 14:42:44 +0100 (CET)
Received: from localhost ([::1]:55814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n95nw-0003YT-0F
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 08:42:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n95in-0000kg-BX
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 08:37:25 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:53161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n95ik-0001h3-2R
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 08:37:25 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A99A47470C7;
 Sun, 16 Jan 2022 14:37:19 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3AFCF746FCF; Sun, 16 Jan 2022 14:37:19 +0100 (CET)
Message-Id: <79f1cf913e9fd2e39bf11dc1f816860b6f6b8876.1642339238.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1642339238.git.balaton@eik.bme.hu>
References: <cover.1642339238.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 1/5] usb/ohci: Move trace point and log ep number to help
 debugging
Date: Sun, 16 Jan 2022 14:20:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/usb/hcd-ohci.c   | 14 +++++++-------
 hw/usb/trace-events |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index a93d6b2e98..f915cc5473 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1033,21 +1033,21 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
         ohci->async_td = 0;
         ohci->async_complete = false;
     } else {
+        dev = ohci_find_device(ohci, OHCI_BM(ed->flags, ED_FA));
+        if (dev == NULL) {
+            trace_usb_ohci_td_dev_error();
+            return 1;
+        }
+        ep = usb_ep_get(dev, pid, OHCI_BM(ed->flags, ED_EN));
         if (ohci->async_td) {
             /* ??? The hardware should allow one active packet per
                endpoint.  We only allow one active packet per controller.
                This should be sufficient as long as devices respond in a
                timely manner.
             */
-            trace_usb_ohci_td_too_many_pending();
+            trace_usb_ohci_td_too_many_pending(ep->nr);
             return 1;
         }
-        dev = ohci_find_device(ohci, OHCI_BM(ed->flags, ED_FA));
-        if (dev == NULL) {
-            trace_usb_ohci_td_dev_error();
-            return 1;
-        }
-        ep = usb_ep_get(dev, pid, OHCI_BM(ed->flags, ED_EN));
         usb_packet_setup(&ohci->usb_packet, pid, ep, 0, addr, !flag_r,
                          OHCI_BM(td.flags, TD_DI) == 0);
         usb_packet_addbuf(&ohci->usb_packet, ohci->usb_buf, pktlen);
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index b8287b63f1..9773cb5330 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -51,7 +51,7 @@ usb_ohci_td_skip_async(void) ""
 usb_ohci_td_pkt_hdr(uint32_t addr, int64_t pktlen, int64_t len, const char *s, int flag_r, uint32_t cbp, uint32_t be) " TD @ 0x%.8x %" PRId64 " of %" PRId64 " bytes %s r=%d cbp=0x%.8x be=0x%.8x"
 usb_ohci_td_pkt_short(const char *dir, const char *buf) "%s data: %s"
 usb_ohci_td_pkt_full(const char *dir, const char *buf) "%s data: %s"
-usb_ohci_td_too_many_pending(void) ""
+usb_ohci_td_too_many_pending(int ep) "ep=%d"
 usb_ohci_td_packet_status(int status) "status=%d"
 usb_ohci_ed_read_error(uint32_t addr) "ED read error at 0x%x"
 usb_ohci_ed_pkt(uint32_t cur, int h, int c, uint32_t head, uint32_t tail, uint32_t next) "ED @ 0x%.8x h=%u c=%u\n  head=0x%.8x tailp=0x%.8x next=0x%.8x"
-- 
2.30.2


