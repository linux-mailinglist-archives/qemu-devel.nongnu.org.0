Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B14E39D3BF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 06:02:01 +0200 (CEST)
Received: from localhost ([::1]:36000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6Sc-0001ih-FP
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 00:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6I8-0003zL-A9; Sun, 06 Jun 2021 23:51:09 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:53423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hw-0002qa-UB; Sun, 06 Jun 2021 23:51:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fyzt25LhCz9sf8; Mon,  7 Jun 2021 13:50:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623037834;
 bh=fnFNoCBfHwB4DdyMQH2CKhj+WMmhaGaGgO0dhzD2aLY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mK7Rs7LDCBdoMBV5mhRaNj/K98vLjoacVTVbgzsJsslqlIXBskdXB342uu5O9kOY4
 DLLVjMeKFMIUQSoYZ3hnRCqZ/RC739j7YKwwY/JJVSa8wddASKZZVKJNjbhNM/Upjs
 7gZTksCnfXYp6XU8hJ0Yrtj76rpRkrvDZGQKd7a4=
Date: Mon, 7 Jun 2021 13:50:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 02/11] target/ppc: moved ppc_store_sdr1 to cpu.c
Message-ID: <YL2XhNfG6OPiaR5V@yekko>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-3-bruno.larsen@eldorado.org.br>
 <YJyiDaBAK48lVaDF@yekko>
 <52622a11-522b-cc04-6382-7c4f5328710c@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Pz/593kA/nQofU3J"
Content-Disposition: inline
In-Reply-To: <52622a11-522b-cc04-6382-7c4f5328710c@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Pz/593kA/nQofU3J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 31, 2021 at 03:17:47PM -0300, Bruno Piazera Larsen wrote:
>=20
> On 13/05/2021 00:50, David Gibson wrote:
> > On Wed, May 12, 2021 at 11:08:04AM -0300, Bruno Larsen (billionai) wrot=
e:
> > > Moved this function that is required in !TCG cases into a
> > > common code file
> > The reasons it's needed by !TCG are kind of bogus, related to
> > weirdness in the way KVM PR works.  But it's fair not to care about
> > that right now, so, applied to ppc-for-6.1.
> Now that the future is here, I was looking into why might the reasons be
> bogus. From what I can see, what should be happening is just storing what
> was retrieved by the kvm ioctl, right? Am I missing something?

Actually, I was mixing this up with something else.  We invoke
ppc_store_sdr1() in several places from !TCG code.  From explicitly
KVM code in kvmppc_book_get_sregs() - since we more or less trust KVM
we could in theory just store directly to the value.  However we also
use it in common code in machine.c in the loadvm path.  I don't want
to bypass ppc_store_sdr1() there so that we have a common place for
all SDR1 updates, for sanity checking and any secondary alterations we
need.

So having this in common code is the right thing to do.

(In case you care, the "bogus reason" thing I was thinking of in
connection to SDR1 handling is actually the special
encode_hpt_for_kvm_pr() case in kvmppc_but_books_sregs.  That's there
because KVM PR requires us to inform us of the *qemu userspace*
location of the hash table for PAPR guests via the SDR1 value, which
doesn't really make sense)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Pz/593kA/nQofU3J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9l4IACgkQbDjKyiDZ
s5IJ0A/9FDvRV62fy3zVFj8tE5Q8hY+iVFLUr6YoR5olxnUBx85Cf7vZhVXW8hTz
pSEmQAUwBXg1BYoIvelGMtSgomeYpJH5fr6JMjOsjBnKBMEORH1KilVJh9pd1UId
UrQxFPjz0z/3bD+NAOv0MSpTW2fZpbsJIY6yJce/Jk5HNhWAEEMmA6OC5tuwvzoZ
QYiaxJcSj4Gvf0hT6IfWNjrXrOkMvl1pbvWL5jrRmCmGsRakaSMi1rstgVl9RIoK
Qjvn4TEVFN/Zv7gj183AL6Ouf+szGXHNyKxnkSAmmiahWlNPR+mFvItzANtMPPXW
Q4eBAHfTcrfxuMOMbqY74VxcsWPTq4Wt/U+Ox3bSvLcEgFE8I4SIl+HV99AH4at1
7CsXE9bnzTtvHJKJuk6s/fY3HQw56PzKl52Gu4tk8KtRhv7tkQcMFkPdLUDkW8P5
pXIEl3ki3GdyPHyK09S5F+Eqn5XVdi2ymU0Gmx/Tv35ZA7UMdXWA/nhVnce9UHIG
ZnWKZh1k3hi9E34Q9tye7eFWPR/b1OEKZrXleUuLVhn3YqeFiiEkhaNwbSwWVYXa
1cBJcWi3j5pB/8YIH5010h+Fc8sD6aep02bcO8b9fpH2sBrIctM4NtSS+1pCajZ9
0tNVgyOWuQjOL2s+igrgReK5fyPfAuRAYphaY3PbLi49zRflCIc=
=AKoX
-----END PGP SIGNATURE-----

--Pz/593kA/nQofU3J--

