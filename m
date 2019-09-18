Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE9B68D0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 19:17:32 +0200 (CEST)
Received: from localhost ([::1]:33202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAda6-0004Sc-Mu
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 13:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55780)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iAcUv-0004Ek-NX
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 12:08:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iAcUu-0003Nw-Du
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 12:08:05 -0400
Received: from 4.mo7.mail-out.ovh.net ([178.32.122.254]:38574)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iAcUu-0003Mg-1D
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 12:08:04 -0400
Received: from player799.ha.ovh.net (unknown [10.109.146.76])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id B18D6131337
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2019 18:08:02 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id B788F9F0E715;
 Wed, 18 Sep 2019 16:07:56 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 18 Sep 2019 18:06:32 +0200
Message-Id: <20190918160645.25126-13-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918160645.25126-1-clg@kaod.org>
References: <20190918160645.25126-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6224537639010339814
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudekgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.122.254
Subject: [Qemu-devel] [PATCH v4 12/25] ppc/xive: Remove the get_tctx()
 XiveRouter handler
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

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive.h |  2 --
 hw/intc/pnv_xive.c    | 13 -------------
 hw/intc/spapr_xive.c  |  8 --------
 hw/intc/xive.c        |  7 -------
 4 files changed, 30 deletions(-)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 9d9cd88dd17e..f35ff3b64791 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -351,7 +351,6 @@ typedef struct XiveRouterClass {
                    XiveNVT *nvt);
     int (*write_nvt)(XiveRouter *xrtr, uint8_t nvt_blk, uint32_t nvt_idx=
,
                      XiveNVT *nvt, uint8_t word_number);
-    XiveTCTX *(*get_tctx)(XiveRouter *xrtr, CPUState *cs);
 } XiveRouterClass;
=20
 int xive_router_get_eas(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_=
idx,
@@ -364,7 +363,6 @@ int xive_router_get_nvt(XiveRouter *xrtr, uint8_t nvt=
_blk, uint32_t nvt_idx,
                         XiveNVT *nvt);
 int xive_router_write_nvt(XiveRouter *xrtr, uint8_t nvt_blk, uint32_t nv=
t_idx,
                           XiveNVT *nvt, uint8_t word_number);
-XiveTCTX *xive_router_get_tctx(XiveRouter *xrtr, CPUState *cs);
 void xive_router_notify(XiveNotifier *xn, uint32_t lisn);
=20
 /*
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index 40e18fb44811..74d6ccbea3d6 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -485,18 +485,6 @@ static PnvXive *pnv_xive_tm_get_xive(PowerPCCPU *cpu=
)
     return xive;
 }
=20
-static XiveTCTX *pnv_xive_get_tctx(XiveRouter *xrtr, CPUState *cs)
-{
-    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
-    PnvXive *xive =3D pnv_xive_tm_get_xive(cpu);
-
-    if (!xive) {
-        return NULL;
-    }
-
-    return XIVE_TCTX(pnv_cpu_state(cpu)->intc);
-}
-
 /*
  * The internal sources (IPIs) of the interrupt controller have no
  * knowledge of the XIVE chip on which they reside. Encode the block
@@ -1921,7 +1909,6 @@ static void pnv_xive_class_init(ObjectClass *klass,=
 void *data)
     xrc->write_end =3D pnv_xive_write_end;
     xrc->get_nvt =3D pnv_xive_get_nvt;
     xrc->write_nvt =3D pnv_xive_write_nvt;
-    xrc->get_tctx =3D pnv_xive_get_tctx;
=20
     xnc->notify =3D pnv_xive_notify;
     xpc->match_nvt  =3D pnv_xive_match_nvt;
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index e00a9bdd901b..864f50167c65 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -444,13 +444,6 @@ static int spapr_xive_write_nvt(XiveRouter *xrtr, ui=
nt8_t nvt_blk,
     g_assert_not_reached();
 }
=20
-static XiveTCTX *spapr_xive_get_tctx(XiveRouter *xrtr, CPUState *cs)
-{
-    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
-
-    return spapr_cpu_state(cpu)->tctx;
-}
-
 static int spapr_xive_match_nvt(XivePresenter *xptr, uint8_t format,
                                 uint8_t nvt_blk, uint32_t nvt_idx,
                                 bool cam_ignore, uint8_t priority,
@@ -578,7 +571,6 @@ static void spapr_xive_class_init(ObjectClass *klass,=
 void *data)
     xrc->write_end =3D spapr_xive_write_end;
     xrc->get_nvt =3D spapr_xive_get_nvt;
     xrc->write_nvt =3D spapr_xive_write_nvt;
-    xrc->get_tctx =3D spapr_xive_get_tctx;
=20
     xpc->match_nvt  =3D spapr_xive_match_nvt;
 }
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 11432f04f5c3..68d3361d1c3f 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1270,13 +1270,6 @@ int xive_router_write_nvt(XiveRouter *xrtr, uint8_=
t nvt_blk, uint32_t nvt_idx,
    return xrc->write_nvt(xrtr, nvt_blk, nvt_idx, nvt, word_number);
 }
=20
-XiveTCTX *xive_router_get_tctx(XiveRouter *xrtr, CPUState *cs)
-{
-    XiveRouterClass *xrc =3D XIVE_ROUTER_GET_CLASS(xrtr);
-
-    return xrc->get_tctx(xrtr, cs);
-}
-
 /*
  * Encode the HW CAM line in the block group mode format :
  *
--=20
2.21.0


