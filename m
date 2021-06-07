Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A46439D3BD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 06:01:34 +0200 (CEST)
Received: from localhost ([::1]:35184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6SD-00019i-4a
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 00:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Pg-00075O-A6; Sun, 06 Jun 2021 23:58:56 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:48629 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Pe-0007RX-GU; Sun, 06 Jun 2021 23:58:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fz03b4Rb1z9sT6; Mon,  7 Jun 2021 13:58:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623038331;
 bh=mV8ib3f1msaftXonM+x4Yhyomn2b+ILhmwZntahsw94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RLoXQP6KVeB1JVRgKLVckEo1NWax49Wvl9Pt8g9Fpu6Mq88SM06S0Rx4G1H1emT4b
 G5LQDtXXXq7P02PxBxlJle6ZPenn6mCw4L0jW4wqn9SxqhtQsXsh7nGoc7ijEi+Rk9
 yt41GsJheZjjwPNITgDX5OzfYMd1wqJA/l2IJSpc=
Date: Mon, 7 Jun 2021 13:52:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [RFC PATCH] target/ppc: removed usage of ppc_store_sdr1 in kvm.c
Message-ID: <YL2X6m6mpXQ4cfof@yekko>
References: <20210601184242.122895-1-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+DDARd3aRRs07dny"
Content-Disposition: inline
In-Reply-To: <20210601184242.122895-1-bruno.larsen@eldorado.org.br>
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
Cc: "open list:Overall KVM CPUs" <kvm@vger.kernel.org>, farosas@linux.ibm.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, matheus.ferst@eldorado.org.br,
 luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+DDARd3aRRs07dny
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 03:42:42PM -0300, Bruno Larsen (billionai) wrote:
> The only use of this function in kvm.c is right after using the KVM
> ioctl to get the registers themselves, so there is no need to do the
> error checks done by ppc_store_sdr1.
>=20
> The probable reason this was here before is because of the hack where
> KVM PR stores the hash table size along with the SDR1 information, but
> since ppc_store_sdr1 would also store that information, there should be
> no need to do any extra processing here.
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>=20
> This change means we won't have to compile ppc_store_sdr1 when we get
> disable-tcg working, but I'm not working on that code motion just yet
> since Lucas is dealing with the same file.
>=20
> I'm sending this as an RFC because I'm pretty sure I'm missing
> something, but from what I can see, this is all we'd need

I don't think this is a good idea.  Even though it's not strictly
necessary for KVM, I'd prefer to have a common entry point for SDR1
updates to reduce confusion.  Plus this won't be sufficient to fix
things for !TCG builds, since we still have the common calls on the
loadvm path.

>=20
>  target/ppc/kvm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 104a308abb..3f52a7189d 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -1159,7 +1159,11 @@ static int kvmppc_get_books_sregs(PowerPCCPU *cpu)
>      }
> =20
>      if (!cpu->vhyp) {
> -        ppc_store_sdr1(env, sregs.u.s.sdr1);
> +        /*
> +         * We have just gotten the SDR1, there should be no
> +         * reason to do error checking.... right?
> +         */
> +        env->spr[SPR_SDR1] =3D sregs.u.s.sdr1;
>      }
> =20
>      /* Sync SLB */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+DDARd3aRRs07dny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9l+oACgkQbDjKyiDZ
s5Lfuw//XmNsvqY9rzssSKrU0tClRdUqyJy/wdFCA89+8uuOuUGSNaJznRLCbgZd
FnezH8KKbxxn8wo0BnZG6roUeJE47+FBUB4RzS+WCXShXNJI5yu5HbzfPWFaGOyq
3rOgFEI8Og3pC62e7Fng9bSsL2XDwU9EAp7zAJVPn07kimp4Jsyr0Na3LXppR04h
GbWDLKztvOiLcOHbuQT7WTykoyB36WrfF/EEoGjUaYhGw9N4rbJPfTIYS6gG/0Jm
CfvyVpKs0eNJoY1axiAVKoWKZR60zWhL5wabNj8l8iRi5zt2yocQeEvsZxy6HsII
lREmw39NhfbqGdTv50BnNaEGitlk+EEMRxhDdPE9+zQh+UHEkVGU6eTnsyoPvDU+
Q5V0yWcIgi+9aHlSPJ+74YWgfRDoW2rGJAY5etieJPmke2jLWkw/uuhY3VU0czmy
GfRDnHpbIFSePT0Vz7oYQCRXVg1bFp0nxmbO1VkuFpkgEi6njmsOUUzyURNY/kAs
VgFlXvwaUbdbEbkhr8KxnXmNuU4vT2QbMttUZvY+rAkQKUVRzk2hTAQ97O0q+6+6
O93ar8TQLQ9iUz1e90zMz5xKq+JFvt3XUCEfomXMRKtz3YZpzOFaVmpY2oFsSctT
mq0DbIxYqu3K20qjw/WkgfVY9W9u0lbwasiZZMpUnyQZymRvkb8=
=8/jU
-----END PGP SIGNATURE-----

--+DDARd3aRRs07dny--

