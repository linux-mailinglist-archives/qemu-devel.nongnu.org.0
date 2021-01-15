Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23FB2F6FDD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 02:11:45 +0100 (CET)
Received: from localhost ([::1]:51084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0DeR-00078K-CG
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 20:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0DaQ-00049O-AA; Thu, 14 Jan 2021 20:07:34 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56213 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0DaK-0003Sh-Qh; Thu, 14 Jan 2021 20:07:34 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DH31c1V4xz9sWb; Fri, 15 Jan 2021 12:07:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610672836;
 bh=fKMVFSkuryjXgndTjmGPq6afPRIArWhTutA1WP5oxaI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wb84IYmokwbq6YNwvYOSdb/d85/8UihI60Pu3RKPGSHv8d8ie9UYyH1pg8PLqe0df
 TCMthC/dN+8yZtkWXX37sqk2w8obqQJ0XufFKB6hw3b0E0dZEWkgyloNNzBUz2G+Gt
 TzmDLOMsaNi1frtVUVPWUto3SDPZJrUoXzBWXlBA=
Date: Fri, 15 Jan 2021 12:03:00 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 7/7] spapr.c: consider CPU core online state before
 allowing unplug
Message-ID: <20210115010300.GW435587@yekko.fritz.box>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
 <20210114180628.1675603-8-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RMorpr61ug7CvG36"
Content-Disposition: inline
In-Reply-To: <20210114180628.1675603-8-danielhb413@gmail.com>
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
Cc: Xujun Ma <xuma@redhat.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RMorpr61ug7CvG36
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 03:06:28PM -0300, Daniel Henrique Barboza wrote:
> The only restriction we have when unplugging CPUs is to forbid unplug of
> the boot cpu core. spapr_core_unplug_possible() does not contemplate the
> possibility of some cores being offlined by the guest, meaning that we're
> rolling the dice regarding on whether we're unplugging the last online
> CPU core the guest has.
>=20
> If we hit the jackpot, we're going to detach the core DRC and pulse the
> hotplug IRQ, but the guest OS will refuse to release the CPU. Our
> spapr_core_unplug() DRC release callback will never be called and the CPU
> core object will keep existing in QEMU. No error message will be sent
> to the user, but the CPU core wasn't unplugged from the guest.
>=20
> If the guest OS onlines the CPU core again we won't be able to hotunplug =
it
> either. 'dmesg' inside the guest will report a failed attempt to offline =
an
> unknown CPU:
>=20
> [  923.003994] pseries-hotplug-cpu: Failed to offline CPU <NULL>, rc: -16
>=20
> This is the result of stopping the DRC state transition in the middle in =
the
> first failed attempt.
>=20
> We can avoid this, and potentially other bad things from happening, if we
> avoid to attempt the unplug altogether in this scenario. Let's check for
> the online/offline state of the CPU cores in the guest before allowing
> the hotunplug, and forbid removing a CPU core if it's the last one online
> in the guest.

Good explanation overall, but I think it would be a bit clearer and
more direct if you remove the "roll the dice" / "hit the jackpot"
metaphor.



> Reported-by: Xujun Ma <xuma@redhat.com>
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1911414
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index a2f01c21aa..d269dcd102 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3709,9 +3709,16 @@ static void spapr_core_unplug(HotplugHandler *hotp=
lug_dev, DeviceState *dev)
>  static int spapr_core_unplug_possible(HotplugHandler *hotplug_dev, CPUCo=
re *cc,
>                                        Error **errp)

This will need a small rework w.r.t. my suggestions for the previous
patch, obviously.

>  {
> +    CPUArchId *core_slot;
> +    SpaprCpuCore *core;
> +    PowerPCCPU *cpu;
> +    CPUState *cs;
> +    bool last_cpu_online =3D true;
>      int index;
> =20
> -    if (!spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_id, &index))=
 {
> +    core_slot =3D spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_id,
> +                                    &index);
> +    if (!core_slot) {
>          error_setg(errp, "Unable to find CPU core with core-id: %d",
>                     cc->core_id);
>          return -1;
> @@ -3722,6 +3729,36 @@ static int spapr_core_unplug_possible(HotplugHandl=
er *hotplug_dev, CPUCore *cc,
>          return -1;
>      }
> =20
> +    /* Allow for any non-boot CPU core to be unplugged if already offlin=
e */
> +    core =3D SPAPR_CPU_CORE(core_slot->cpu);
> +    cs =3D CPU(core->threads[0]);
> +    if (cs->halted) {
> +        return 0;
> +    }

I think you need to check that *all* the cpu's threads are offline,
not just thread 0 for this to be correct.

> +
> +    /*
> +     * Do not allow core unplug if it's the last core online.
> +     */
> +    cpu =3D POWERPC_CPU(cs);
> +    CPU_FOREACH(cs) {
> +        PowerPCCPU *c =3D POWERPC_CPU(cs);
> +
> +        if (c =3D=3D cpu) {
> +            continue;
> +        }
> +
> +        if (!cs->halted) {
> +            last_cpu_online =3D false;
> +            break;
> +        }
> +    }

Likewise here I think your logic needs more careful handling of
threads - you need to disallow the hotplug if all of the currently
online threads are on the core slated for removal.

I'm also a little bit worried about whether just checking cs->halted
is sufficient.  That's a qemu/tcg core concept that I think that may
be set in some circumstances when the CPU is *not* offline.  The logic
of the suspend-me RTAS call is specifically to both set halted *and*
to block interrupts so there's nothing that can pull the vcpu out of
halted state.  It's possible that handling this correctly will require
adding some qemu internal state to explicitly track the "online" state
of a vcpu as managed by "suspend-me" and "start-cpu" RTAS calls.

> +
> +    if (last_cpu_online) {
> +        error_setg(errp, "Unable to unplug CPU core with core-id %d: it =
is "
> +                   "the only CPU core online in the guest", cc->core_id);
> +        return -1;
> +    }
> +
>      return 0;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RMorpr61ug7CvG36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAA6cIACgkQbDjKyiDZ
s5LCQA/+MMIkjnkyI8z6TsVihQtwX2WtegOLSj4K1GNC6O7zYM/biO+FZREAG7mR
kcM38E3JGru7U//gzU8j6Ve97sp3eBIveJf8y03s4AK737HTqGRne3rjnGh+5OKK
qoHLbI0159qKVaN3DoxGzXzkT6XUcksxZNfVr+4WmpfPI4mQKO7wXJtgUs5aUL70
EeDdA+5s2lguyYrQ/kr5XhrBvTDnGhwcpJNGGQu7IIJiF5cFecvuocJMC9antlQq
vG6WzjKzGkyZ+tg0H4cTwj7MIvABVdB66Paj78wdel4yeYpd+kAYZkGP4gaiHnK3
Sxk8Do97joVJ3ZmAIyZMMhNmXy7dtJ58i0ZjLlv6ijf7Rg7yRXOxSIN7AGrPOe76
CW9t/Yq6qSiN0YiPaCs8uiis+pAjSELZHb0VbXYmAsZ7+nCGYxvYecnHpK8T03xL
t0hk3eyO2hz+oUpwBvvirJ1KUA0bi7D/W0c29tR4VkTUfN8r6LbaSebEitRmet9h
fKk583GSdQjuTLTcrv2tSiCLGHSQQ3GEbQUt9H55yqo+ynxaqoB4sSy4WveeKO7m
Z9nUpgvfo3f+adUIBiACm56zIYdZv6mEDkC4yQ2Ds6CrBnr+Wj5O2aLPjC7OGHkW
iL1uReFBZoBeroiuCTzqE1Hummiu7Hj1BgKu/7k9IWHM3mN0lQY=
=xGby
-----END PGP SIGNATURE-----

--RMorpr61ug7CvG36--

