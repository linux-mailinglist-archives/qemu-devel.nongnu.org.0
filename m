Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871FE1223F2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 06:41:27 +0100 (CET)
Received: from localhost ([::1]:36036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih5bq-0005TP-6d
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 00:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4kt-0003VL-PJ
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:46:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4ks-0001KQ-Jh
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:46:43 -0500
Received: from ozlabs.org ([203.11.71.1]:44487)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ih4ks-0000Eu-8M; Mon, 16 Dec 2019 23:46:42 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47cQWm083dz9sTp; Tue, 17 Dec 2019 15:43:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576557828;
 bh=WPGhRLVgvuo1dfcfSmYeMRPiaxlknfIpHytSLFhG/OA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aWIoqsuIfjjubhESYx8NAuAV0YlJAbe4andXIa91KzeDo/v6kzdbOpbQ5BXEyoTat
 0CAqaKui3/i9QD1hcr+gROqKRHotPhqErpu+h/A8FnVCUq+zrzthPltsfk/SVYWNx3
 h+2yVExEi9dkDyHMEhiGaGbdp2/pflED9pHOkq6c=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 85/88] ppc/pnv: Drop pnv_chip_is_power9() and
 pnv_chip_is_power10() helpers
Date: Tue, 17 Dec 2019 15:43:19 +1100
Message-Id: <20191217044322.351838-86-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191217044322.351838-1-david@gibson.dropbear.id.au>
References: <20191217044322.351838-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

They aren't used anymore.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <157623842986.360005.1787401623906380181.stgit@bahia.lan>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/ppc/pnv.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 17ca9a14ac..7a134a15d3 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -224,21 +224,11 @@ struct PnvMachineState {
     PnvPnor      *pnor;
 };
=20
-static inline bool pnv_chip_is_power9(const PnvChip *chip)
-{
-    return PNV_CHIP_GET_CLASS(chip)->chip_type =3D=3D PNV_CHIP_POWER9;
-}
-
 PnvChip *pnv_get_chip(uint32_t chip_id);
=20
 #define PNV_FDT_ADDR          0x01000000
 #define PNV_TIMEBASE_FREQ     512000000ULL
=20
-static inline bool pnv_chip_is_power10(const PnvChip *chip)
-{
-    return PNV_CHIP_GET_CLASS(chip)->chip_type =3D=3D PNV_CHIP_POWER10;
-}
-
 /*
  * BMC helpers
  */
--=20
2.23.0


