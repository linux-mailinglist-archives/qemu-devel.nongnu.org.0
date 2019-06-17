Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76B1488E7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 18:29:24 +0200 (CEST)
Received: from localhost ([::1]:49118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcuVX-0001kv-Uh
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 12:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37544)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <anthony.perard@citrix.com>) id 1hctlC-00046h-EJ
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:41:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1hctlA-0008DA-3x
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:41:30 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144]:62260)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1hctl2-00082L-Uo
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:41:24 -0400
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: m8p7QSPWyD6XAlP0UCvQs8rrSZpRFRITJnOmdhyixFTQF+HI+KTQhyUcxt3Wzbd7aww30IHafu
 PM5jGuamTqsXMfNgjC99ipQShn66hGYE8f+KNXYQGtgGZVaRFmHSrH+ae4Dre9+jkV9DC+LWt6
 JrBm9ctvIIWM+cZRKH8V2TqzoaUlO2KVzqrzfkOrO+e/KOBKtTkpsyAQ1v0P/qHm02McQ3MEwM
 Nhx3hbhykEwGGG6ukfgPV9rLzbAfAVcMH5YwFtVkW2x9S/i9zwxBEBNmVfaxHfFd31t0mJLB6N
 9Lc=
X-SBRS: 2.7
X-MesageID: 1846122
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,385,1557201600"; 
   d="scan'208";a="1846122"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 17 Jun 2019 16:41:05 +0100
Message-ID: <20190617154105.32323-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190617154105.32323-1-anthony.perard@citrix.com>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.155.144
Subject: [Qemu-devel] [PATCH 4/4] xen: Avoid VLA
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul.durrant@citrix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid using a variable length array.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    Was suggested by Peter here:
    <CAFEAcA88+A2oCkQnxKDEdpmfCZSmPzWMBg01wDDV68bMZoY5Jg@mail.gmail.com>
    "should we try to stop using variable length arrays?"

 hw/i386/xen/xen-hvm.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 725f9c2278..10d73b55b4 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -615,7 +615,8 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
 {
     hwaddr npages = size >> TARGET_PAGE_BITS;
     const int width = sizeof(unsigned long) * 8;
-    unsigned long bitmap[DIV_ROUND_UP(npages, width)];
+    unsigned long *bitmap = NULL;
+    size_t bitmap_size = DIV_ROUND_UP(npages, width);
     int rc, i, j;
     const XenPhysmap *physmap = NULL;
 
@@ -632,6 +633,8 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
         return;
     }
 
+    bitmap = g_new0(unsigned long, bitmap_size);
+
     rc = xen_track_dirty_vram(xen_domid, start_addr >> TARGET_PAGE_BITS,
                               npages, bitmap);
     if (rc < 0) {
@@ -644,10 +647,10 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
                     ", 0x" TARGET_FMT_plx "): %s\n",
                     start_addr, start_addr + size, strerror(errno));
         }
-        return;
+        goto out;
     }
 
-    for (i = 0; i < ARRAY_SIZE(bitmap); i++) {
+    for (i = 0; i < bitmap_size; i++) {
         unsigned long map = bitmap[i];
         while (map != 0) {
             j = ctzl(map);
@@ -657,6 +660,8 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
                                     TARGET_PAGE_SIZE);
         };
     }
+out:
+    g_free(bitmap);
 }
 
 static void xen_log_start(MemoryListener *listener,
-- 
Anthony PERARD


