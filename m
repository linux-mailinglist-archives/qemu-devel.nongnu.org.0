Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF8F131EBF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 06:04:38 +0100 (CET)
Received: from localhost ([::1]:42212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioh2c-00069l-OY
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 00:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44225)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iognO-0005Oa-2s
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 23:48:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iognM-0004i8-Uh
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 23:48:45 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38533 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iognM-0004cn-Ik; Mon, 06 Jan 2020 23:48:44 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47sKdX5dSDz9sRl; Tue,  7 Jan 2020 15:48:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578372512;
 bh=LX+p22y98QJHXeR526fSlmyfXK9IbB1S0L2Puxze/Ts=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=chLTQoeadr9/n3QAjE5GxwOg3vFFGuVuWuCbIzILktYhTK4gze6EmHzAaa/35hO6f
 BWFF9erLQ13R4nWKGJUWjQTcp0zs7ml6YwKjgCVEMuQLKdRl3Ce7RCbztf46nuK2OY
 XVxBGouH1WBp0y+kMAk5aOiumVipqZWoBnHacHbk=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	groug@kaod.org,
	philmd@redhat.com,
	clg@kaod.org
Subject: [PATCH v2 09/10] target/ppc: Correct RMLS table
Date: Tue,  7 Jan 2020 15:48:26 +1100
Message-Id: <20200107044827.471355-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107044827.471355-1-david@gibson.dropbear.id.au>
References: <20200107044827.471355-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
Cc: lvivier@redhat.com, aik@ozlabs.ru,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 paulus@samba.org, David Gibson <david@gibson.dropbear.id.au>
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
---
 target/ppc/mmu-hash64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index bb9ebeaf48..e6f24be93e 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -760,12 +760,12 @@ static target_ulong rmls_limit(PowerPCCPU *cpu)
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


