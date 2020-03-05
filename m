Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A90F179D97
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 02:47:27 +0100 (CET)
Received: from localhost ([::1]:42274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9fbh-0006Nt-Vp
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 20:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45928)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j9fY1-0000Nl-T7
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 20:43:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j9fY0-0006pv-MY
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 20:43:37 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54911 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j9fY0-0006oh-AC; Wed, 04 Mar 2020 20:43:36 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48XtnF4xD8z9sSQ; Thu,  5 Mar 2020 12:43:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1583372609;
 bh=8cgvX54s1GvUY0lturGnoQ5SBwaG/0CGAQb0LrjiXPI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ELLiqEV8ucETrzIXrMevQYzKJIpb0bcK5UbEDeb/HcDmgkbei8+z4p5YDCvPGsLjT
 PX1ac5LX01JyxNl+OiF8kKLcJEWqzNYDSw0utdmvH1NHwnYt+HzSQdjCza2TosnKot
 mGREn2d19a4OgMrkOMjbA1ypE6FmTtEsaRZyLi44=
Date: Thu, 5 Mar 2020 11:43:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 5/5] hw/scsi/spapr_vscsi: Do not mix SRP IU size with DMA
 buffer size
Message-ID: <20200305004337.GL593957@umbus.fritz.box>
References: <20200304153311.22959-1-philmd@redhat.com>
 <20200304153311.22959-6-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zYjDATHXTWnytHRU"
Content-Disposition: inline
In-Reply-To: <20200304153311.22959-6-philmd@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zYjDATHXTWnytHRU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2020 at 04:33:11PM +0100, Philippe Mathieu-Daud=E9 wrote:
> The 'union srp_iu' is meant as a pointer to any SRP Information
> Unit type, it is not related to the size of a VIO DMA buffer.
>=20
> Use a plain buffer for the VIO DMA read/write calls.
> We can remove the reserved buffer from the 'union srp_iu'.
>=20
> This issue was noticed when replacing the zero-length arrays
> from hw/scsi/srp.h with flexible array member,
> 'clang -fsanitize=3Dundefined' reported:
>=20
>   hw/scsi/spapr_vscsi.c:69:29: error: field 'iu' with variable sized type=
 'union viosrp_iu' not at the end of a struct or class is a GNU extension [=
-Werror,-Wgnu-variable-sized-type-not-at-end]
>        union viosrp_iu         iu;
>                                ^
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/scsi/viosrp.h      |  2 +-
>  hw/scsi/spapr_vscsi.c | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/scsi/viosrp.h b/hw/scsi/viosrp.h
> index 25676c2383..aba3203028 100644
> --- a/hw/scsi/viosrp.h
> +++ b/hw/scsi/viosrp.h
> @@ -49,8 +49,8 @@ union srp_iu {
>      struct srp_tsk_mgmt tsk_mgmt;
>      struct srp_cmd cmd;
>      struct srp_rsp rsp;
> -    uint8_t reserved[SRP_MAX_IU_LEN];
>  };
> +_Static_assert(sizeof(union srp_iu) <=3D SRP_MAX_IU_LEN, "srp_iu size in=
correct");

Hrm.  Given that srp_iu will be a variably sized type, is this
assertion actually testing anything meaningful?


Otherwise, LGTM.

> =20
>  enum viosrp_crq_formats {
>      VIOSRP_SRP_FORMAT =3D 0x01,
> diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
> index f1a0bbdc31..f9be68e44e 100644
> --- a/hw/scsi/spapr_vscsi.c
> +++ b/hw/scsi/spapr_vscsi.c
> @@ -66,7 +66,7 @@ typedef union vscsi_crq {
> =20
>  typedef struct vscsi_req {
>      vscsi_crq               crq;
> -    union viosrp_iu         iu;
> +    uint8_t                 viosrp_iu_buf[SRP_MAX_IU_LEN];
> =20
>      /* SCSI request tracking */
>      SCSIRequest             *sreq;
> @@ -99,7 +99,7 @@ typedef struct {
> =20
>  static union viosrp_iu *req_iu(vscsi_req *req)
>  {
> -    return (union viosrp_iu *)req->iu.srp.reserved;
> +    return (union viosrp_iu *)req->viosrp_iu_buf;
>  }
> =20
> =20
> @@ -184,7 +184,7 @@ static int vscsi_send_iu(VSCSIState *s, vscsi_req *re=
q,
> =20
>      /* First copy the SRP */
>      rc =3D spapr_vio_dma_write(&s->vdev, req->crq.s.IU_data_ptr,
> -                             &req->iu, length);
> +                             &req->viosrp_iu_buf, length);
>      if (rc) {
>          fprintf(stderr, "vscsi_send_iu: DMA write failure !\n");
>      }
> @@ -603,7 +603,7 @@ static const VMStateDescription vmstate_spapr_vscsi_r=
eq =3D {
>      .minimum_version_id =3D 1,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_BUFFER(crq.raw, vscsi_req),
> -        VMSTATE_BUFFER(iu.srp.reserved, vscsi_req),
> +        VMSTATE_BUFFER(viosrp_iu_buf, vscsi_req),
>          VMSTATE_UINT32(qtag, vscsi_req),
>          VMSTATE_BOOL(active, vscsi_req),
>          VMSTATE_UINT32(data_len, vscsi_req),
> @@ -1104,7 +1104,7 @@ static void vscsi_got_payload(VSCSIState *s, vscsi_=
crq *crq)
>      }
> =20
>      /* XXX Handle failure differently ? */
> -    if (spapr_vio_dma_read(&s->vdev, crq->s.IU_data_ptr, &req->iu,
> +    if (spapr_vio_dma_read(&s->vdev, crq->s.IU_data_ptr, &req->viosrp_iu=
_buf,
>                             crq->s.IU_length)) {
>          fprintf(stderr, "vscsi_got_payload: DMA read failure !\n");
>          vscsi_put_req(req);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zYjDATHXTWnytHRU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5gSzkACgkQbDjKyiDZ
s5Kl2Q/7Bwsz1Kg2/Hq/JJudU0qE8BtvN7uiUhlifqV//gnhO8hP0AAQzR1GYita
7pSZDP5uhH2QBO5VaCwE9aomawNv97Yx+aK3C2eMvXQ9Aj5CWTnq8fjDYCNGEOBV
OQpyG0Op7A5i3l0gI9rJuArbN7KiD07TNg4R/5tPWM5MVij/Q9SHiDy/USkWcsxF
zJ8YHm5Fogn6BiLk2RJ3iDTPCHIyIY0iFZHtpngjgE0Rl1RerCfosw9cZvGFWg6Q
zp5RfyNHidU+pP+1n99bNRY/wc27CTavmr68xdajdlZm6tqLA/R4Nz7oo1/BGY9h
HTceg+Po8IWHcKIhe/dZkEEd3gZSkUQ7eB9RvVXTYzxao4cxXBM9izPc8dk5VqHr
ydCCn+Bxx9A4x7Z/6b0yNcwxB4IFB2l4HRsykmLpa+LycxvRCRz3iiucie1zGev0
22iNqVI3E/cqFYEjwj38cfMpzTwXEUtmBjsOGU7mGUZD9TEsrR3fE5iykDqBy0hx
FzwLQTmM2jR5iY3WXetS6kguQ2OG47YJbfN4BBBWnCJNlYUB5hqpftKKK/Jr4tZz
HBhKDPRNVgffb7619bS1zee9ZSjrxAbA+ke6MQ17M9GwuwaLO46ltcWcljKevl8w
qVBUZ0kJyhTP4OvHhp7JZyBBOySaxHIbwdgyXpVJSdXhN9qe3x8=
=ybwb
-----END PGP SIGNATURE-----

--zYjDATHXTWnytHRU--

