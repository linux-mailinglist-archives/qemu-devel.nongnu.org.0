Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E691754BC
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 08:43:37 +0100 (CET)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8fjk-0000Q0-Tf
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 02:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60101)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j8fhI-0003wO-4n
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 02:41:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j8fhG-0003VI-Vo
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 02:41:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26740
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j8fhG-0003V7-RR
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 02:41:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583134862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DMwzVglu3CHcRggvEoML/ZAZCqWueorRpeSh5bBDNn8=;
 b=CREj4JNtz2lTByUDV4SWxl6gDcjjFlc2xqNqIDULu5F6+Xuo5JqnmRHH67o/CET1HTQgsE
 lzkeCkjl32SspzPG0ouiMvaHPD4YfanBTv1TCzfGoNMiRuoYFgohdwPorVDoT5A4v1akv1
 oDrnAp9JnbdA2EUmeTSo/8HUHL3vGxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-D5dPqzOGPTC_eWoftfVYbA-1; Mon, 02 Mar 2020 02:40:58 -0500
X-MC-Unique: D5dPqzOGPTC_eWoftfVYbA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E128107ACC9;
 Mon,  2 Mar 2020 07:40:57 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-58.pek2.redhat.com
 [10.72.12.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2A3560BF3;
 Mon,  2 Mar 2020 07:40:55 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 07/23] dp8393x: Implement packet size limit and RBAE interrupt
Date: Mon,  2 Mar 2020 15:40:20 +0800
Message-Id: <1583134836-23991-8-git-send-email-jasowang@redhat.com>
In-Reply-To: <1583134836-23991-1-git-send-email-jasowang@redhat.com>
References: <1583134836-23991-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Finn Thain <fthain@telegraphics.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Finn Thain <fthain@telegraphics.com.au>

Add a bounds check to prevent a large packet from causing a buffer
overflow. This is defensive programming -- I haven't actually tried
sending an oversized packet or a jumbo ethernet frame.

The SONIC handles packets that are too big for the buffer by raising
the RBAE interrupt and dropping them. Linux uses that interrupt to
count dropped packets.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/dp8393x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index b5a9c6a..911f59e 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -137,6 +137,7 @@ do { printf("sonic ERROR: %s: " fmt, __func__ , ## __VA=
_ARGS__); } while (0)
 #define SONIC_TCR_CRCI   0x2000
 #define SONIC_TCR_PINT   0x8000
=20
+#define SONIC_ISR_RBAE   0x0010
 #define SONIC_ISR_RBE    0x0020
 #define SONIC_ISR_RDE    0x0040
 #define SONIC_ISR_TC     0x0080
@@ -772,6 +773,14 @@ static ssize_t dp8393x_receive(NetClientState *nc, con=
st uint8_t * buf,
     s->regs[SONIC_RCR] &=3D ~(SONIC_RCR_PRX | SONIC_RCR_LBK | SONIC_RCR_FA=
ER |
         SONIC_RCR_CRCR | SONIC_RCR_LPKT | SONIC_RCR_BC | SONIC_RCR_MC);
=20
+    if (pkt_size + 4 > dp8393x_rbwc(s) * 2) {
+        DPRINTF("oversize packet, pkt_size is %d\n", pkt_size);
+        s->regs[SONIC_ISR] |=3D SONIC_ISR_RBAE;
+        dp8393x_update_irq(s);
+        dp8393x_do_read_rra(s);
+        return pkt_size;
+    }
+
     packet_type =3D dp8393x_receive_filter(s, buf, pkt_size);
     if (packet_type < 0) {
         DPRINTF("packet not for netcard\n");
--=20
2.5.0


