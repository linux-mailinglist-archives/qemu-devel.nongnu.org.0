Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B21C2F6C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 11:00:18 +0200 (CEST)
Received: from localhost ([::1]:60124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFE12-0007HZ-RB
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 05:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59316)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iFDyb-00057R-7e
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 04:57:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iFDyY-00042J-Uk
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 04:57:44 -0400
Received: from 5.mo173.mail-out.ovh.net ([46.105.40.148]:34320)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iFDyX-00040d-PZ
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 04:57:41 -0400
Received: from player762.ha.ovh.net (unknown [10.108.35.185])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 90CB211B43D
 for <qemu-devel@nongnu.org>; Tue,  1 Oct 2019 10:57:38 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player762.ha.ovh.net (Postfix) with ESMTPSA id 8AC85A6D6C0C;
 Tue,  1 Oct 2019 08:57:32 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH] spapr/xive: skip partially initialized vCPUs in presenter
Date: Tue,  1 Oct 2019 10:57:22 +0200
Message-Id: <20191001085722.32755-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1513772427037412326
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrgeeggddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.40.148
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When vCPUs are hotplugged, they are added to the QEMU CPU list before
being fully realized. This can crash the XIVE presenter because the
'tctx' pointer is not necessarily initialized when looking for a
matching target.

These vCPUs are not valid targets for the presenter. Skip them.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/xive.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index b7417210d817..29df06df1136 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1396,6 +1396,14 @@ static bool xive_presenter_match(XiveRouter *xrtr,=
 uint8_t format,
         XiveTCTX *tctx =3D xive_router_get_tctx(xrtr, cs);
         int ring;
=20
+        /*
+         * Skip partially initialized vCPUs. This can happen when
+         * vCPUs are hotplugged.
+         */
+        if (!tctx) {
+            continue;
+        }
+
         /*
          * HW checks that the CPU is enabled in the Physical Thread
          * Enable Register (PTER).
--=20
2.21.0


