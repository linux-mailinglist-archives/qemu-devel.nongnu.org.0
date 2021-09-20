Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6F141103B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 09:36:53 +0200 (CEST)
Received: from localhost ([::1]:56794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSDrA-0000Pj-HY
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 03:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSDms-0006di-Sc; Mon, 20 Sep 2021 03:32:26 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:59685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSDmq-0006Aw-Kn; Mon, 20 Sep 2021 03:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632123140;
 bh=COFehanaxSWv9YkZTYA8ZM+qc9MSYc0QXLHNMCkkywA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WTVQNBMed2Bv5cm7sRe0sOg0EXC7FnS7fPV8EYsNaMWhTpEkwabot3G+i4MENvwWS
 1GcTNxwtDgv0C4USCaa75zJ6vhNCXG3zir1LdhpMWDTfRTJvcGp0U67GGWrno6Gzs/
 N6HQFt6DHmXd+ZEojCQigf0i+/BWMcLZt4zqMOq8=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HCbqS1ZQJz9sSs; Mon, 20 Sep 2021 17:32:20 +1000 (AEST)
Date: Mon, 20 Sep 2021 16:55:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v4 2/4] target/ppc: Replace debug messages by asserts for
 unknown IRQ pins
Message-ID: <YUgwUCocwHsy4AA/@yekko>
References: <20210920061203.989563-1-clg@kaod.org>
 <20210920061203.989563-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="q7aBjEUDdARa4Ecv"
Content-Disposition: inline
In-Reply-To: <20210920061203.989563-3-clg@kaod.org>
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--q7aBjEUDdARa4Ecv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 08:12:01AM +0200, C=E9dric Le Goater wrote:
> If an unknown pin of the IRQ controller is raised, something is very
> wrong in the QEMU model. It is better to abort.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.2, thanks.

> ---
>  hw/ppc/ppc.c | 24 ++++++------------------
>  1 file changed, 6 insertions(+), 18 deletions(-)
>=20
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 7375bf4fa910..a327206a0a1e 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -165,9 +165,7 @@ static void ppc6xx_set_irq(void *opaque, int pin, int=
 level)
>              ppc_set_irq(cpu, PPC_INTERRUPT_RESET, level);
>              break;
>          default:
> -            /* Unknown pin - do nothing */
> -            LOG_IRQ("%s: unknown IRQ pin %d\n", __func__, pin);
> -            return;
> +            g_assert_not_reached();
>          }
>          if (level)
>              env->irq_input_state |=3D 1 << pin;
> @@ -252,9 +250,7 @@ static void ppc970_set_irq(void *opaque, int pin, int=
 level)
>              /* XXX: TODO */
>              break;
>          default:
> -            /* Unknown pin - do nothing */
> -            LOG_IRQ("%s: unknown IRQ pin %d\n", __func__, pin);
> -            return;
> +            g_assert_not_reached();
>          }
>          if (level)
>              env->irq_input_state |=3D 1 << pin;
> @@ -287,9 +283,7 @@ static void power7_set_irq(void *opaque, int pin, int=
 level)
>          ppc_set_irq(cpu, PPC_INTERRUPT_EXT, level);
>          break;
>      default:
> -        /* Unknown pin - do nothing */
> -        LOG_IRQ("%s: unknown IRQ pin %d\n", __func__, pin);
> -        return;
> +        g_assert_not_reached();
>      }
>  }
> =20
> @@ -323,9 +317,7 @@ static void power9_set_irq(void *opaque, int pin, int=
 level)
>          ppc_set_irq(cpu, PPC_INTERRUPT_HVIRT, level);
>          break;
>      default:
> -        /* Unknown pin - do nothing */
> -        LOG_IRQ("%s: unknown IRQ pin %d\n", __func__, pin);
> -        return;
> +        g_assert_not_reached();
>      }
>  }
> =20
> @@ -459,9 +451,7 @@ static void ppc40x_set_irq(void *opaque, int pin, int=
 level)
>              ppc_set_irq(cpu, PPC_INTERRUPT_DEBUG, level);
>              break;
>          default:
> -            /* Unknown pin - do nothing */
> -            LOG_IRQ("%s: unknown IRQ pin %d\n", __func__, pin);
> -            return;
> +            g_assert_not_reached();
>          }
>          if (level)
>              env->irq_input_state |=3D 1 << pin;
> @@ -523,9 +513,7 @@ static void ppce500_set_irq(void *opaque, int pin, in=
t level)
>              ppc_set_irq(cpu, PPC_INTERRUPT_DEBUG, level);
>              break;
>          default:
> -            /* Unknown pin - do nothing */
> -            LOG_IRQ("%s: unknown IRQ pin %d\n", __func__, pin);
> -            return;
> +            g_assert_not_reached();
>          }
>          if (level)
>              env->irq_input_state |=3D 1 << pin;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--q7aBjEUDdARa4Ecv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFIMFAACgkQbDjKyiDZ
s5IVvA/8Da1uzIR/0FpIxNWf10bC8GGG5GtyzcOIXacQVDAHWcixPEOJJCzgRMba
nU9Vs6UpH2Hq0JEiYqucrw8+dCC098oLMDVn5w25gE2j+4Sbqlu6j9z1cw+mZP5z
raCRiBkOHVrZzssUSDD4c7RPpxQK3HCApzbTSNh0CadFh63NV/QkI8+zwP8DEH7s
Tm8J7FMe5Mt0s3NRx3dIdeOA0KUbnCxFwcyRkf+dfPHZOVih0HPOtvQ6oBxICdM0
UYbKKh0eFeJdq0TyUqMgnch584YyBLPDET8VHUnDbvRb278IinFWSD1lPyH316aM
Peu/Y5EhfF0jOKVX8EU2Pt5/AtjIKFYs9RDKg+SB2q5iK9hX/LNl2HP2pNhDWyG5
fP/gUxvWJHetGFLTnvhJOhkBKgPyHkiLuCX8Sn3/CoqJhk15m637abS2ex8o9k0a
RnUMK7Tnf9tpB6IeZBQ70yuRGRKqrVDGMKIi6/mcWcg2Bsf/M/J79EIgEUfcPRuE
ny7n+Rg+1NAlj0HNkNHtuXp6/ZF6cU2vrDrGXxELJ8WWK6csojWFbdxXpN47BHLf
Dpm70boBJ/JIDV9ZEoUIyz2xW/5dT+INfKMM0YqsyDpKU3mIH1f3W2qaZiE+/Av8
BHCQwBrKXWG7S+uAut08haadzImhf1Rnyj2eHjP1M5n5t4Y3zbM=
=Qib8
-----END PGP SIGNATURE-----

--q7aBjEUDdARa4Ecv--

