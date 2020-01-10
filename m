Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A49136B11
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 11:29:59 +0100 (CET)
Received: from localhost ([::1]:43650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iprYE-0000Oz-T0
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 05:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33973)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iprUI-00038r-TY
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:25:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iprUH-0006X9-Q9
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:25:54 -0500
Received: from 12.mo6.mail-out.ovh.net ([178.32.125.228]:49068)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iprUH-0006SQ-Jn
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:25:53 -0500
Received: from player786.ha.ovh.net (unknown [10.108.57.95])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id D6F0F1F8C7C
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 11:25:51 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id 8F3E2E3A06D6;
 Fri, 10 Jan 2020 10:25:43 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 3/5] ftgmac100: check RX and TX buffer alignment
Date: Fri, 10 Jan 2020 11:25:16 +0100
Message-Id: <20200110102518.4233-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200110102518.4233-1-clg@kaod.org>
References: <20200110102518.4233-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5849894445101845265
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeifedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.32.125.228
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These buffers should be aligned on 16 bytes.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 86ac25894a89..051f7b7af2d6 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -198,6 +198,8 @@ typedef struct {
     uint32_t        des3;
 } FTGMAC100Desc;
=20
+#define FTGMAC100_DESC_ALIGNMENT 16
+
 /*
  * Specific RTL8211E MII Registers
  */
@@ -722,6 +724,12 @@ static void ftgmac100_write(void *opaque, hwaddr add=
r,
         s->itc =3D value;
         break;
     case FTGMAC100_RXR_BADR: /* Ring buffer address */
+        if (!QEMU_IS_ALIGNED(value, FTGMAC100_DESC_ALIGNMENT)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad RX buffer alignment =
0x%"
+                          HWADDR_PRIx "\n", __func__, value);
+            return;
+        }
+
         s->rx_ring =3D value;
         s->rx_descriptor =3D s->rx_ring;
         break;
@@ -731,6 +739,11 @@ static void ftgmac100_write(void *opaque, hwaddr add=
r,
         break;
=20
     case FTGMAC100_NPTXR_BADR: /* Transmit buffer address */
+        if (!QEMU_IS_ALIGNED(value, FTGMAC100_DESC_ALIGNMENT)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad TX buffer alignment =
0x%"
+                          HWADDR_PRIx "\n", __func__, value);
+            return;
+        }
         s->tx_ring =3D value;
         s->tx_descriptor =3D s->tx_ring;
         break;
--=20
2.21.1


