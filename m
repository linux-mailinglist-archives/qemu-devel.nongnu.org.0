Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03737176DAF
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 04:49:31 +0100 (CET)
Received: from localhost ([::1]:41638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8yYj-00063u-Sy
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 22:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35289)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j8yTV-0004i8-9f
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:44:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j8yTU-0002FV-6e
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:44:05 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:36791)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j8yTT-0002Bt-Ri; Mon, 02 Mar 2020 22:44:04 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48WjY61pd3z9sSq; Tue,  3 Mar 2020 14:43:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1583207034;
 bh=SsCee0AU6qi7MD8E+l9wYYZMteadeXr2Ro4UYhkZybg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CnbVXOg/QxUfMSdZ2TBDPM9LvG3/0fFHfutjYrFiD3ledAa/MCJR514tfF8lo9/oU
 +NE8i65HpAJp9elpNtN6zgBGgA+38bjqJo7DgOTOHUXaTdt4Lay/+UxaYxYCMJnI2q
 BnyXuB0DXRwvvPwMU4iVLXpYvcHOh8m/GCTyd+YQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org, clg@kaod.org, qemu-devel@nongnu.org, groug@kaod.org
Subject: [PATCH v7 09/17] target/ppc: Correct RMLS table
Date: Tue,  3 Mar 2020 14:43:43 +1100
Message-Id: <20200303034351.333043-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200303034351.333043-1-david@gibson.dropbear.id.au>
References: <20200303034351.333043-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, farosas@linux.ibm.com,
 aik@ozlabs.ru, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, paulus@samba.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
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
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 target/ppc/mmu-hash64.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 934989e6d9..fcccaabb88 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -762,15 +762,16 @@ static target_ulong rmls_limit(PowerPCCPU *cpu)
 {
     CPUPPCState *env =3D &cpu->env;
     /*
-     * This is the full 4 bits encoding of POWER8. Previous
-     * CPUs only support a subset of these but the filtering
-     * is done when writing LPCR.
+     * In theory the meanings of RMLS values are implementation
+     * dependent.  In practice, this seems to have been the set from
+     * POWER4+..POWER8, and RMLS is no longer supported in POWER9.
      *
      * Unsupported values mean the OS has shot itself in the
      * foot. Return a 0-sized RMA in this case, which we expect
      * to trigger an immediate DSI or ISI
      */
     static const target_ulong rma_sizes[16] =3D {
+        [0] =3D 256 * GiB,
         [1] =3D 16 * GiB,
         [2] =3D 1 * GiB,
         [3] =3D 64 * MiB,
--=20
2.24.1


