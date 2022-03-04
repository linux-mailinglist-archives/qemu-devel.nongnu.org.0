Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FF84CD709
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:02:12 +0100 (CET)
Received: from localhost ([::1]:60728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9Ra-0007xs-HZ
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:02:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8p5-0000rE-1o
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:22:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8p3-0000GV-F8
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:22:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dU1YDkDSzs6uMQwQgw4xY7kY/3Em9e65XDeCswSYW0=;
 b=IqYqsLy923a1RzEkSDXA1ZwjLXBQFaGQljCt1xULZp8Fd/+gf5+0HACe+Vqniss0k3ttaT
 RilVswgId+KbOQb3jaQfStdjPEjKitiJGhaWZw0yjOJKTvCPTs7Qt5pOgnCz8TvC9bwpWO
 Pciwf2MVWFaOaDvxQQBALGLH3KEZXE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-frTATKKtM0OM1eqEH4IqEg-1; Fri, 04 Mar 2022 09:22:18 -0500
X-MC-Unique: frTATKKtM0OM1eqEH4IqEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5813E801AFE;
 Fri,  4 Mar 2022 14:22:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13A0D2ED75;
 Fri,  4 Mar 2022 14:21:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F03AA180039D; Fri,  4 Mar 2022 15:21:23 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/35] usb/ohci: Move trace point and log ep number to help
 debugging
Date: Fri,  4 Mar 2022 15:20:51 +0100
Message-Id: <20220304142123.956171-4-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <4e3a05a64b5029a88654eab9a873fb45ac80b1a7.1643117600.git.balaton@eik.bme.hu>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ohci.c   | 14 +++++++-------
 hw/usb/trace-events |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index a93d6b2e9882..f915cc547351 100644
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
index b8287b63f15d..9773cb53300d 100644
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
2.35.1


