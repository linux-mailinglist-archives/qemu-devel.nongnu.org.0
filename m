Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326BC195627
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 12:20:02 +0100 (CET)
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHn1t-0000oa-6c
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 07:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38164)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jHmwm-0001Rf-0r
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 07:14:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1jHmwk-0002JL-IT
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 07:14:43 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:41582)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1jHmwk-0002Ia-Dx
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 07:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585307682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwuzM2jNqoM564i9vFKMIxyP47Rn9FTVs3Xjz/vfwQI=;
 b=FogLkZV4End+4CvdH1romgVItazkeXwuyG5rzes6Xy3ZkL4nrKzNFytblayGxjb2bn9oaS
 /0rO+5QSai9Fdj+62oxyDzQ/CXVVbd/qRyLimfRNdWgoMBfaPYQb/s5f+vGH3bMEOxbXoP
 +azLf2gnTzRy/NktxVMyv+5CxZgpEjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-tF6MyFrWNuOWT5lY2swYHg-1; Fri, 27 Mar 2020 07:14:39 -0400
X-MC-Unique: tF6MyFrWNuOWT5lY2swYHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDE62800D48;
 Fri, 27 Mar 2020 11:14:38 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-77.pek2.redhat.com
 [10.72.12.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C6855E016;
 Fri, 27 Mar 2020 11:14:36 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 12/13] net: tulip: check frame size and r/w data length
Date: Fri, 27 Mar 2020 19:14:06 +0800
Message-Id: <1585307647-24456-13-git-send-email-jasowang@redhat.com>
In-Reply-To: <1585307647-24456-1-git-send-email-jasowang@redhat.com>
References: <1585307647-24456-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Jason Wang <jasowang@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Tulip network driver while copying tx/rx buffers does not check
frame size against r/w data length. This may lead to OOB buffer
access. Add check to avoid it.

Limit iterations over descriptors to avoid potential infinite
loop issue in tulip_xmit_list_update.

Reported-by: Li Qiang <pangpei.lq@antfin.com>
Reported-by: Ziming Zhang <ezrakiez@gmail.com>
Reported-by: Jason Wang <jasowang@redhat.com>
Tested-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/tulip.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index cfac271..1295f51 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -170,6 +170,10 @@ static void tulip_copy_rx_bytes(TULIPState *s, struct =
tulip_descriptor *desc)
         } else {
             len =3D s->rx_frame_len;
         }
+
+        if (s->rx_frame_len + len > sizeof(s->rx_frame)) {
+            return;
+        }
         pci_dma_write(&s->dev, desc->buf_addr1, s->rx_frame +
             (s->rx_frame_size - s->rx_frame_len), len);
         s->rx_frame_len -=3D len;
@@ -181,6 +185,10 @@ static void tulip_copy_rx_bytes(TULIPState *s, struct =
tulip_descriptor *desc)
         } else {
             len =3D s->rx_frame_len;
         }
+
+        if (s->rx_frame_len + len > sizeof(s->rx_frame)) {
+            return;
+        }
         pci_dma_write(&s->dev, desc->buf_addr2, s->rx_frame +
             (s->rx_frame_size - s->rx_frame_len), len);
         s->rx_frame_len -=3D len;
@@ -227,7 +235,8 @@ static ssize_t tulip_receive(TULIPState *s, const uint8=
_t *buf, size_t size)
=20
     trace_tulip_receive(buf, size);
=20
-    if (size < 14 || size > 2048 || s->rx_frame_len || tulip_rx_stopped(s)=
) {
+    if (size < 14 || size > sizeof(s->rx_frame) - 4
+        || s->rx_frame_len || tulip_rx_stopped(s)) {
         return 0;
     }
=20
@@ -275,7 +284,6 @@ static ssize_t tulip_receive_nc(NetClientState *nc,
     return tulip_receive(qemu_get_nic_opaque(nc), buf, size);
 }
=20
-
 static NetClientInfo net_tulip_info =3D {
     .type =3D NET_CLIENT_DRIVER_NIC,
     .size =3D sizeof(NICState),
@@ -558,7 +566,7 @@ static void tulip_tx(TULIPState *s, struct tulip_descri=
ptor *desc)
         if ((s->csr[6] >> CSR6_OM_SHIFT) & CSR6_OM_MASK) {
             /* Internal or external Loopback */
             tulip_receive(s, s->tx_frame, s->tx_frame_len);
-        } else {
+        } else if (s->tx_frame_len <=3D sizeof(s->tx_frame)) {
             qemu_send_packet(qemu_get_queue(s->nic),
                 s->tx_frame, s->tx_frame_len);
         }
@@ -570,23 +578,31 @@ static void tulip_tx(TULIPState *s, struct tulip_desc=
riptor *desc)
     }
 }
=20
-static void tulip_copy_tx_buffers(TULIPState *s, struct tulip_descriptor *=
desc)
+static int tulip_copy_tx_buffers(TULIPState *s, struct tulip_descriptor *d=
esc)
 {
     int len1 =3D (desc->control >> TDES1_BUF1_SIZE_SHIFT) & TDES1_BUF1_SIZ=
E_MASK;
     int len2 =3D (desc->control >> TDES1_BUF2_SIZE_SHIFT) & TDES1_BUF2_SIZ=
E_MASK;
=20
+    if (s->tx_frame_len + len1 > sizeof(s->tx_frame)) {
+        return -1;
+    }
     if (len1) {
         pci_dma_read(&s->dev, desc->buf_addr1,
             s->tx_frame + s->tx_frame_len, len1);
         s->tx_frame_len +=3D len1;
     }
=20
+    if (s->tx_frame_len + len2 > sizeof(s->tx_frame)) {
+        return -1;
+    }
     if (len2) {
         pci_dma_read(&s->dev, desc->buf_addr2,
             s->tx_frame + s->tx_frame_len, len2);
         s->tx_frame_len +=3D len2;
     }
     desc->status =3D (len1 + len2) ? 0 : 0x7fffffff;
+
+    return 0;
 }
=20
 static void tulip_setup_filter_addr(TULIPState *s, uint8_t *buf, int n)
@@ -651,13 +667,15 @@ static uint32_t tulip_ts(TULIPState *s)
=20
 static void tulip_xmit_list_update(TULIPState *s)
 {
+#define TULIP_DESC_MAX 128
+    uint8_t i =3D 0;
     struct tulip_descriptor desc;
=20
     if (tulip_ts(s) !=3D CSR5_TS_SUSPENDED) {
         return;
     }
=20
-    for (;;) {
+    for (i =3D 0; i < TULIP_DESC_MAX; i++) {
         tulip_desc_read(s, s->current_tx_desc, &desc);
         tulip_dump_tx_descriptor(s, &desc);
=20
@@ -675,10 +693,10 @@ static void tulip_xmit_list_update(TULIPState *s)
                 s->tx_frame_len =3D 0;
             }
=20
-            tulip_copy_tx_buffers(s, &desc);
-
-            if (desc.control & TDES1_LS) {
-                tulip_tx(s, &desc);
+            if (!tulip_copy_tx_buffers(s, &desc)) {
+                if (desc.control & TDES1_LS) {
+                    tulip_tx(s, &desc);
+                }
             }
         }
         tulip_desc_write(s, s->current_tx_desc, &desc);
--=20
2.5.0


