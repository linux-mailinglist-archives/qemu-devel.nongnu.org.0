Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC142E3499
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 08:01:49 +0100 (CET)
Received: from localhost ([::1]:59248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktmXM-00027n-3t
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 02:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmUo-0000e1-SV; Mon, 28 Dec 2020 01:59:10 -0500
Received: from ozlabs.org ([203.11.71.1]:34251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmUl-0003qJ-Sz; Mon, 28 Dec 2020 01:59:10 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D47gg4v6kz9sWb; Mon, 28 Dec 2020 17:58:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609138735;
 bh=rIV/2XZN2IQOlRKINGhJQUJVhqy9+ixInWkD6Hk+kiw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QarZM2bslZUOpuL6OnmAV5Hg777/91w7beCCpovpyUEabMd8l7JcHW9iClEPXZ7xz
 O05zWQrei6/O1CXjx1wp9lM2ZBiZFMf5YYcwtdn/FtaqW/JcFaV48YCfz4mEm5h1Kd
 gDe18CwGggugTPCUb8FvFowBiH0UtaaMQ3de1yk0=
Date: Mon, 28 Dec 2020 17:56:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: g00517791 <gaojinhao@huawei.com>
Subject: Re: [PATCH 3/8] spapr: Fix memory leak of vmstate_spapr_event_entry
Message-ID: <20201228065635.GA6952@yekko.fritz.box>
References: <20201226103347.868-1-gaojinhao@huawei.com>
 <20201226103347.868-4-gaojinhao@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <20201226103347.868-4-gaojinhao@huawei.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Juan Quintela <quintela@redhat.com>,
 qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 zhukeqian1@huawei.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 26, 2020 at 06:33:42PM +0800, g00517791 wrote:
> From: Jinhao Gao <gaojinhao@huawei.com>
>=20
> When VM migrate VMState of spapr_event_log_entry, the field(extended_log)
> of spapr_event_log_entry having a flag of VMS_ALLOC needs to allocate
> memory. If the dst doesn't free memory which has been allocated for
> SaveStateEntry of spapr_event_log_entry before dst loads device state,
> it may result that the pointer of extended_log is overlaid when vm loads.
> We add the pre_load func to free memory, which prevents memory leak.
>=20
> Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 489cefcb81..ddfed1e7ca 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1799,10 +1799,22 @@ static bool spapr_pending_events_needed(void *opa=
que)
>      return !QTAILQ_EMPTY(&spapr->pending_events);
>  }
> =20
> +static int spapr_event_log_entry_pre_load(void *opaque)
> +{
> +    SpaprEventLogEntry *entry =3D opaque;
> +
> +    g_free(entry->extended_log);
> +    entry->extended_log =3D NULL;
> +    entry->extended_length =3D 0;
> +
> +    return 0;
> +}
> +
>  static const VMStateDescription vmstate_spapr_event_entry =3D {
>      .name =3D "spapr_event_log_entry",
>      .version_id =3D 1,
>      .minimum_version_id =3D 1,
> +    .pre_load =3D spapr_event_log_entry_pre_load,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINT32(summary, SpaprEventLogEntry),
>          VMSTATE_UINT32(extended_length, SpaprEventLogEntry),

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/pgaEACgkQbDjKyiDZ
s5IZdRAAoqLIlV2q8aTwf7ZEkGTkMA8ePF+9hULBI4k7irlEQt3qlr2oNhJkGak+
hFBQXC+xdPg8wh0pxxwKkjGNABKWh8SiSZMPNz8SccTQ91sgs8E7yXm0/4GY9SsH
cuoczhaUqs/4YHbpL0L8pgmZTUnqDwLqMhT1td7e2Rj0GVfiqhRDx9wZwCibamMz
bAXIQg5Wcgq7Iem4OM2FWU6KrC9NBkM+25DzxwQXAn3A+m0ERHsAbanzBOh+9Q8k
vRqTnPR6D9jl7eYBiAjDM1t0hi9YC8kel2TCLUtsdEVY3lWUOxAYYwptSaLDktRy
O70zPu4iFgdBd+ALnbw3phkMct6U4k2c5balkR9SmfQukR0VdzQfKwJEyjtVQwUG
3qAuHfwqhoiIo/OiymPGYu9eZTGhyL972eqMFzKicWGk6AM368zaVo5cfLfKnYbm
qWhF5qWh7iBRKmtklFLZgmwacSZUncfxV7VBGWpvI+toM2zOZa8Nn6HYnPy9kTfT
gfYADTI8C1pRoxF4kyNagyis7xpnrfT6zGeO8yLunx6wBwZW4oGGHKbIpgPEBRUE
BCUdCOU+YN9wofQ2TmOeH5l867TDqTGHGePvP8CB93gX8sMyGA3xnmzn/56576NJ
/rgDKCxQNd4wZG/e1wvNPmSoCiX7liK53UG26zCUglWCzk2+dqI=
=5nUm
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--

