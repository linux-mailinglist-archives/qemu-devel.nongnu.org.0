Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570E9165596
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 04:24:53 +0100 (CET)
Received: from localhost ([::1]:35232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4cSK-0006WR-A8
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 22:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4cR8-0004cp-5m
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 22:23:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4cR6-0008Li-Mj
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 22:23:38 -0500
Received: from ozlabs.org ([203.11.71.1]:35861)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4cR6-0008Ic-Ba; Wed, 19 Feb 2020 22:23:36 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48NKg11jDTz9sSZ; Thu, 20 Feb 2020 14:23:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582169005;
 bh=5V3Fkwnhhaf99LksVVnXh9d+PmvLqtote/We8hZMvyU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g6xxKlTuVDFRhFigVBuaLQmCrDvi0vQBdFF9uNx2gzCMU9hp+y3dU30Q1ljUMN1rt
 oRUbtAx/6d31zbwQMlZypyEH1RnF5LE4QFHqZADJldP5MGDI9wnculft6837DFCyaM
 nKuykWh2rP8WqShs8nr3pnAEoCmA1z6P7QzVx7MI=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org,
	groug@kaod.org,
	clg@kaod.org
Subject: [PATCH v5 09/18] target/ppc: Correct RMLS table
Date: Thu, 20 Feb 2020 14:23:07 +1100
Message-Id: <20200220032317.96884-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220032317.96884-1-david@gibson.dropbear.id.au>
References: <20200220032317.96884-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, Thomas Huth <thuth@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, paulus@samba.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The table of RMA limits based on the LPCR[RMLS] field is slightly wrong.
We're missing the RMLS =3D=3D 0 =3D> 256 GiB RMA option, which is availab=
le on
POWER8, so add that.

The comment that goes with the table is much more wrong.  We *don't* filt=
er
invalid RMLS values when writing the LPCR, and there's not really a
sensible way to do so.  Furthermore, while in theory the set of RMLS valu=
es
is implementation dependent, it seems in practice the same set has been
available since around POWER4+ up until POWER8, the last model which
supports RMLS at all.  So, correct that as well.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/mmu-hash64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 4e6c1f722b..46690bc79b 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -762,12 +762,12 @@ static target_ulong rmls_limit(PowerPCCPU *cpu)
 {
     CPUPPCState *env =3D &cpu->env;
     /*
-     * This is the full 4 bits encoding of POWER8. Previous
-     * CPUs only support a subset of these but the filtering
-     * is done when writing LPCR
+     * In theory the meanings of RMLS values are implementation
+     * dependent.  In practice, this seems to have been the set from
+     * POWER4+..POWER8, and RMLS is no longer supported in POWER9.
      */
     const target_ulong rma_sizes[] =3D {
-        [0] =3D 0,
+        [0] =3D 256 * GiB,
         [1] =3D 16 * GiB,
         [2] =3D 1 * GiB,
         [3] =3D 64 * MiB,
--=20
2.24.1


