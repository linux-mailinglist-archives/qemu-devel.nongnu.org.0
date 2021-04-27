Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E0E36BDCF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 05:42:21 +0200 (CEST)
Received: from localhost ([::1]:35918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbEc8-0006Wp-89
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 23:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbEZH-00054t-I7; Mon, 26 Apr 2021 23:39:23 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:46689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbEZF-0005SB-23; Mon, 26 Apr 2021 23:39:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FTnYw2Pknz9sXL; Tue, 27 Apr 2021 13:39:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619494756;
 bh=ia7rNeTl3MxMe438S4bFBhJy/ph94Nbj4VV6seVHLDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NJAaCc9IXsrRnSHJPQV+nAWRUVopD5o6UTjjMqwfgMIL7G7nyk6fZ8fj/ApW+x50M
 mt5CPMo3sR+XR3aA3qx1n7YrY4LBZRsSJvrFG4NxOVuCKVFH+8YQgOTZjPEwCQddEM
 kACmYNnuddFSNeRNqh8NB1OMZJqMAW+zp6KfBXmI=
Date: Tue, 27 Apr 2021 13:28:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [RFC PATCH 2/4] target/ppc: isolated SPR read/write callbacks
Message-ID: <YIeE+Ob/Z9D57x4P@yekko.fritz.box>
References: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
 <20210423191807.77963-3-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Nm5RmcsilHLj2Ph2"
Content-Disposition: inline
In-Reply-To: <20210423191807.77963-3-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Nm5RmcsilHLj2Ph2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 04:18:05PM -0300, Bruno Larsen (billionai) wrote:
> Moved all functions related to SPR read/write callbacks into a new file
> specific for holding these. This is setting up a better separation of
> SPR registration, which is required to be able to build disabling
> TCG.
>=20
> The solution to move it to spr_tcg.c.inc and including it in translate.c
> is a work in progress, any better solutions are very much appreciated.
> Also, making the R/W functions not static is required for the next
> commit.

[snip]
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> new file mode 100644
> index 0000000000..1e09d001a9
> --- /dev/null
> +++ b/target/ppc/spr_tcg.h
> @@ -0,0 +1,132 @@
> +#ifndef SPR_TCG_H
> +#define SPR_TCG_H
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/translator.h"
> +#include "tcg/tcg.h"
> +
> +/* prototypes for readers and writers for SPRs */

The 2 fscr functions below aren't readers and writers for the FSCR.
Instead they're used by instructions related to facilities the FSCR
can enable and disable - this generates the code to check the FSCR and
generate an exception if the units are disabled.

That doesn't mean they don't belong here, but it does mean=20



> +
> +#ifdef TARGET_PPC64
> +void gen_fscr_facility_check(DisasContext *ctx, int facility_sprn,
> +                                    int bit, int sprn, int cause);
> +void gen_msr_facility_check(DisasContext *ctx, int facility_sprn,
> +                                   int bit, int sprn, int cause);
> +#endif

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Nm5RmcsilHLj2Ph2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCHhPYACgkQbDjKyiDZ
s5LxjA/+NT1k7I3o7eFfrP5qsjmGKKBE+8O3cjHzfTAutHkpwMZ6yvd494ldzO8G
d+ug0yJA+byJEvfLF7lr9IHQPDImP7Bqc5FwDoKewpXgk0FTxwxVlcSUfYHABOcM
saRC+h7YWltepVkEF3/LGa4e6CmkXYgpYnPHxc/pU6cMPKl+/jKnmxTThlsx4COg
+2k99/KN32hv7uSVXR2/+rw3MR1msKO4N2Xt+GhHoai2SqJEAKKvqEYaRExyRqy3
ZjA5Jvt6aNZnrTZxIw2apFdkz4sUuXNhysqKv+0V26CP+hDEV9cFeSrayJQJIzSr
o5UXbDWC/UkLG8YhQn5vP//OXkguCFKUREhueBMWUa/Doie9DGv9l0OVn5Gcs6FV
dWpYw35HpeXFXgiHaaclFmBdeNMhB2bB3rCjKPeAO7rWU0sHro9W5FkB6NdbWsdY
qAvzBt2H/ZWnRYkUpAkN3A43CXNY741gmG8KW8S3RcMfDhhRo9J9GtPeGLjicKAU
I1WReCB0NVSuPGoUAmBTezrKcUKnswppLmB42eYECdUvX4rxDtB/utLAbpTdbG/z
QWLru1tC0+ACg6oznuFqEJJXaVNRFREe8CH18YhyPUMt0tOf/o8OKpA59T7bmT0u
eN0FlotAxgj7rx+4wIQMOoa9Sv6y/ypGRnJFC4apvjczhM2XEvg=
=C+bp
-----END PGP SIGNATURE-----

--Nm5RmcsilHLj2Ph2--

