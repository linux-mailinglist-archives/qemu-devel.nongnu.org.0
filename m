Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5857350CE5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 05:06:36 +0200 (CEST)
Received: from localhost ([::1]:39656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRnfH-00079l-Rg
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 23:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRnd1-0005iR-MG; Wed, 31 Mar 2021 23:04:15 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:60295 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRncq-00083Q-1M; Wed, 31 Mar 2021 23:04:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9p1C07dfz9sWF; Thu,  1 Apr 2021 14:03:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617246239;
 bh=5uxwIZQnCzmQes0I7kYM7oVGib8PVDMmllogI+bzxDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A254//1R9eQ1CJBTDRWbnNiywczuRMwsNII9K2GxIyNY9oOhle2yuSDI3rNqnX88y
 pLukHvKp5nIwP4YnymuhFWy7q0qsN00thviv8Rmar8aEHNPrNLgUw5I1YywcTlzmyX
 sNoKVb6s9sKpYfiVfpNkT0TwDLm46c+DKb/7NzNw=
Date: Thu, 1 Apr 2021 13:37:11 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 2/2] spapr.c: always pulse guest IRQ in
 spapr_core_unplug_request()
Message-ID: <YGUx1+bNSR2IFFSV@yekko.fritz.box>
References: <20210401000437.131140-1-danielhb413@gmail.com>
 <20210401000437.131140-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YcqI9hB86IWcACmy"
Content-Disposition: inline
In-Reply-To: <20210401000437.131140-3-danielhb413@gmail.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YcqI9hB86IWcACmy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 09:04:37PM -0300, Daniel Henrique Barboza wrote:
> Commit 47c8c915b162 fixed a problem where multiple spapr_drc_detach()
> requests were breaking QEMU. The solution was to just spapr_drc_detach()
> once, and use spapr_drc_unplug_requested() to filter whether we already
> detached it or not. The commit also tied the hotplug request to the
> guest in the same condition.
>=20
> Turns out that there is a reliable way for a CPU hotunplug to fail. If a
> guest with one CPU hotplugs a CPU1, then offline CPU0s via 'echo 0 >
> /sys/devices/system/cpu/cpu0/online', then attempts to hotunplug CPU1,
> the kernel will refuse it because it's the last online CPU of the
> system. Given that we're pulsing the IRQ only in the first try, in a
> failed attempt, all other CPU1 hotunplug attempts will fail, regardless
> of the online state of CPU1 in the kernel, because we're simply not
> letting the guest know that we want to hotunplug the device.
>=20
> Let's move spapr_hotplug_req_remove_by_index() back out of the "if
> (!spapr_drc_unplug_requested(drc))" conditional, allowing for multiple
> 'device_del' requests to the same CPU core to reach the guest, in case
> the CPU core didn't fully hotunplugged previously.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

I've applied these to ppc-for-6.0, but..

> ---
>  hw/ppc/spapr.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 05a765fab4..e4be00b732 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3777,8 +3777,17 @@ void spapr_core_unplug_request(HotplugHandler *hot=
plug_dev, DeviceState *dev,
> =20
>      if (!spapr_drc_unplug_requested(drc)) {
>          spapr_drc_unplug_request(drc);
> -        spapr_hotplug_req_remove_by_index(drc);
>      }
> +
> +    /*
> +     * spapr_hotplug_req_remove_by_index is left unguarded, out of the
> +     * "!spapr_drc_unplug_requested" check, to allow for multiple IRQ
> +     * pulses removing the same CPU. Otherwise, in an failed hotunplug
> +     * attempt (e.g. the kernel will refuse to remove the last online
> +     * CPU), we will never attempt it again because unplug_requested
> +     * will still be 'true' in that case.
> +     */
> +    spapr_hotplug_req_remove_by_index(drc);

I think we need similar changes for all the other unplug types (LMB,
PCI, PHB) - basically retries should always be allowed, and at worst
be a no-op, rather than generating an error like they do now.

>  }
> =20
>  int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YcqI9hB86IWcACmy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBlMdcACgkQbDjKyiDZ
s5JhwBAAmdi0ayejzUzUhTBaWEMmpm8kXR+hKcXiJXsYDT3A/CjV2ySaMI6GuUtD
bxCXYzLF9FFBQmewX01OjdKamYv/nUDNJKzYbXdPrloSORUWRlQKQGX/krDpX3Pv
4TRoDxVGaoY48C93Ibk84eczOipQFdB0gALSt6jgb5ADgDRu0xezEL4enBA3gQyP
siwGDNbuPSAcvDz6xv7IqFy5+AJnIKrCImXr1JCHETntJYRBo09DHjvUO+sQISen
xSIFO5q/cdoQmsOqqflzDxqUPr2RJ5wD9TNxhAjcOUhgH0UQBFbf5tpOpjlvb2ht
YlCNnhUuJwFDt+EuJUG9Z6wjEcNaRdsu+U7ADkdcgrsakrGuo5ktYUxHWCgEUEuD
yzGsYRpR0uP2pSpX+X65C62vmHgOZQ9jgFlyiAEEREpt/l7kdTFEUCmzfGC+SXMi
r13MqxTNxXP5TNLg8C/VIjt44tfvy/976ixyWucrJ8gF6E58ifsOFa05IDxp9sN7
IZvNWZbItlfak1kDPICIU4ewkh3K+BJsblBM2dsKeFtwlfdFN3ACcBnH5p4vVVF7
fYWrGil0MCdWgRNj2LtGBm1KJXgY3T8WPoiCDVgt3GE4CDPt0FRfFjkx5laIVqHr
BSBAR5RlSRq9sPd3g31wsBOqtW/hxC1wiZuAIQfJJiHUB459QrU=
=VmXY
-----END PGP SIGNATURE-----

--YcqI9hB86IWcACmy--

