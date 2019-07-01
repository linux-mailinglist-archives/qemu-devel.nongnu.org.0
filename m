Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121EC17F0F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 19:27:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOQLu-0007ft-6Z
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 13:27:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hOQEi-0000ob-1T
	for qemu-devel@nongnu.org; Wed, 08 May 2019 13:20:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hOQEh-0003mq-3i
	for qemu-devel@nongnu.org; Wed, 08 May 2019 13:20:08 -0400
Received: from 6.mo177.mail-out.ovh.net ([46.105.51.249]:39789)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hOQEg-0003kZ-TX
	for qemu-devel@nongnu.org; Wed, 08 May 2019 13:20:07 -0400
Received: from player711.ha.ovh.net (unknown [10.108.42.228])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id 0F0FDF1646
	for <qemu-devel@nongnu.org>; Wed,  8 May 2019 19:20:01 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player711.ha.ovh.net (Postfix) with ESMTPSA id BF43E576935B;
	Wed,  8 May 2019 17:19:55 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed,  8 May 2019 19:19:44 +0200
Message-Id: <20190508171946.657-2-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508171946.657-1-clg@kaod.org>
References: <20190508171946.657-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1135188585020230630
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrkeefgdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.51.249
Subject: [Qemu-devel] [PATCH 1/3] spapr/xive: EQ page should be naturally
 aligned
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the OS configures the EQ page in which to receive event
notifications from the XIVE interrupt controller, the page should be
naturally aligned. Add this check.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/spapr_xive.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 097f88d4608d..666e24e9b447 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -993,6 +993,12 @@ static target_ulong h_int_set_queue_config(PowerPCCP=
U *cpu,
     case 16:
     case 21:
     case 24:
+        if (!QEMU_IS_ALIGNED(qpage, 1ul << qsize)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "XIVE: EQ @0x%" HWADDR_PRIx
+                          " is not naturally aligned with %" HWADDR_PRIx=
 "\n",
+                          qpage, 1ul << qsize);
+            return H_P4;
+        }
         end.w2 =3D cpu_to_be32((qpage >> 32) & 0x0fffffff);
         end.w3 =3D cpu_to_be32(qpage & 0xffffffff);
         end.w0 |=3D cpu_to_be32(END_W0_ENQUEUE);
--=20
2.20.1


