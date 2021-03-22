Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346C5343667
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 02:49:43 +0100 (CET)
Received: from localhost ([::1]:60914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO9hN-00011V-Iz
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 21:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lO9fP-0000ai-8Z; Sun, 21 Mar 2021 21:47:40 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:51593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lO9fM-0007vq-8g; Sun, 21 Mar 2021 21:47:39 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3cnQ5vvWz9sWP; Mon, 22 Mar 2021 12:47:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616377642;
 bh=BaBG4syE9npsaSNmMTeNPaMcobfLRcLtBSZS11OOmAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NvE2GrFlr1D9caCJcnKJPJjpegUGltHa656ATEvZ4HQWsUqJqYUejsDEpX/nOJljk
 EXNXwDpQcX++6T/wXjU/R5tdlpLs1+0eby8CABM3uurTbjjHdueGq6LG4qzAwHGLjU
 2aOo05tzGGK45JgBq1zssalrpjqriPnqWYIWWTZc=
Date: Mon, 22 Mar 2021 11:32:57 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2] target/ppc/kvm: Cache timebase frequency
Message-ID: <YFfluXqp6QOy6oXC@yekko.fritz.box>
References: <161600382766.1780699.6787739229984093959.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v/IJnBu76J9You7K"
Content-Disposition: inline
In-Reply-To: <161600382766.1780699.6787739229984093959.stgit@bahia.lan>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--v/IJnBu76J9You7K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 06:57:07PM +0100, Greg Kurz wrote:
> Each vCPU core exposes its timebase frequency in the DT. When running
> under KVM, this means parsing /proc/cpuinfo in order to get the timebase
> frequency of the host CPU.
>=20
> The parsing appears to slow down the boot quite a bit with higher number
> of cores:
>=20
> # of cores     seconds spent in spapr_dt_cpus()
>       8                  0.550122
>      16                  1.342375
>      32                  2.850316
>      64                  5.922505
>      96                  9.109224
>     128                 12.245504
>     256                 24.957236
>     384                 37.389113
>=20
> The timebase frequency of the host CPU is identical for all
> cores and it is an invariant for the VM lifetime. Cache it
> instead of doing the same expensive parsing again and again.
>=20
> Rename kvmppc_get_tbfreq() to kvmppc_get_tbfreq_procfs() and
> rename the 'retval' variable to make it clear it is used as
> fallback only. Come up with a new version of kvmppc_get_tbfreq()
> that calls kvmppc_get_tbfreq_procfs() only once and keep the
> value in a static.
>=20
> Zero is certainly not a valid value for the timebase frequency.
> Treat atoi() returning zero as another parsing error and return
> the fallback value instead. This allows kvmppc_get_tbfreq() to
> use zero as an indicator that kvmppc_get_tbfreq_procfs() hasn't
> been called yet.
>=20
> With this patch applied:
>=20
>     384                 0.518382
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
> v2: - do the caching in a distinct function for clarity (Philippe)
>     - rename 'retval' to 'tbfreq_fallback'
>     - expand the changelog a bit
> ---
>  target/ppc/kvm.c |   25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 298c1f882c67..104a308abb57 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -1815,24 +1815,37 @@ static int read_cpuinfo(const char *field, char *=
value, int len)
>      return ret;
>  }
> =20
> -uint32_t kvmppc_get_tbfreq(void)
> +static uint32_t kvmppc_get_tbfreq_procfs(void)
>  {
>      char line[512];
>      char *ns;
> -    uint32_t retval =3D NANOSECONDS_PER_SECOND;
> +    uint32_t tbfreq_fallback =3D NANOSECONDS_PER_SECOND;
> +    uint32_t tbfreq_procfs;
> =20
>      if (read_cpuinfo("timebase", line, sizeof(line))) {
> -        return retval;
> +        return tbfreq_fallback;
>      }
> =20
>      ns =3D strchr(line, ':');
>      if (!ns) {
> -        return retval;
> +        return tbfreq_fallback;
>      }
> =20
> -    ns++;
> +    tbfreq_procfs =3D atoi(++ns);
> +
> +    /* 0 is certainly not acceptable by the guest, return fallback value=
 */
> +    return tbfreq_procfs ? tbfreq_procfs : tbfreq_fallback;
> +}
> +
> +uint32_t kvmppc_get_tbfreq(void)
> +{
> +    static uint32_t cached_tbfreq;
> +
> +    if (!cached_tbfreq) {
> +        cached_tbfreq =3D kvmppc_get_tbfreq_procfs();
> +    }
> =20
> -    return atoi(ns);
> +    return cached_tbfreq;
>  }
> =20
>  bool kvmppc_get_host_serial(char **value)
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--v/IJnBu76J9You7K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBX5bgACgkQbDjKyiDZ
s5LC0hAAu2ia9m+w9ZmHZWZ3Cdq7ykC5QLp0wYOIM8h9WQtJTKrEGFeu3EkQTsA3
WIu3odxRn2n3Nmk9p/b2T5cX5A5R3ktIQqMx2ypoF9qC9hmfIpdhac3EORNNb4N2
ne9N/kPJywvYtvO1uaowdhwaewqmzf7PK6SJ2G1Sx3DPezxPMulYxu+LxjSUTV5Z
rJ3QFue3oeMGGCPbdut8aAuj6ZPbdbtdBm0uVefxx6CHfAnAIDWMeQDJBpFnEbH+
62r/C/BbswT5fuMso76kRFVlPTdyXHvFNcdWq1GfKaePKJx6I4hVbAPCLRp49UER
Nnl0gv97XKBIJn/lznENBwmW/RFKEsciS65q6BHIyhBdLhCcwXvvLRlh09HlDvbd
TJKrACqWl8Cd6isG2fSGP2NqyZzE7d/DWzSh23tEIs9Ih1Ho0cP9eMZLX0xK+4dH
gzSeFQwsnze6aF3FR6pRZWnfU5jGK7aKeeHvGyctVCR2zuJZ57MehJAJhH+vnyCo
nmllCcgGnEXvODfXNtN6W6So294hh7thr+V9M510mfMgkL5cNjZHebHGfh7WLjDJ
fsvlcBFwKhTmNbn69rqF65aW+sSdrZX7JZaN/kPlVRBHrARCCBBt2NARKRlpneOG
TV3Vv+l6CZtf35ffQ9hJlz3+rl2Grt82Fytg8k4zPf3TFIF22yY=
=HPCa
-----END PGP SIGNATURE-----

--v/IJnBu76J9You7K--

