Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFCB3F6E73
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:27:35 +0200 (CEST)
Received: from localhost ([::1]:60252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkVi-0004rP-4n
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGg-0000kA-7H; Wed, 25 Aug 2021 00:12:02 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42427 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGd-0007UD-5O; Wed, 25 Aug 2021 00:12:01 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvXbt6c4Jz9t1Q; Wed, 25 Aug 2021 14:11:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629864698;
 bh=QmGwFV5rej1IiZxSUPVz6SNQooghggvMESEq/3ogAlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o5bGwnzSeEEhwdm23KuSiImGdUfNglrIK5LwIxzJxi8akoKmgftyTR52BdcpFsJb6
 MFuY7Wh+tDA8TzxmY9UdgDB9nyYYUsstfUTk07JHxuIyv5/qe5PTc/P5cEGpk9W0fy
 vJvM6DnkG0+tQGjZ7O7trm9ouqeDinzUxbDI/nm8=
Date: Wed, 25 Aug 2021 13:49:20 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v7 1/7] memory_hotplug.c: handle dev->id = NULL in
 acpi_memory_hotplug_write()
Message-ID: <YSW9wD4XiA1KyQM0@yekko>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5jJlbhheu9z7fQwy"
Content-Disposition: inline
In-Reply-To: <20210825004835.472919-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5jJlbhheu9z7fQwy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 09:48:29PM -0300, Daniel Henrique Barboza wrote:
> qapi_event_send_mem_unplug_error() deals with @device being NULL by
> replacing it with an empty string ("") when emitting the event. Aside
> from the fact that this behavior (qapi visitor mapping NULL pointer to
> "") can be patched/changed someday, there's also the lack of utility
> that the event brings to listeners, e.g. "a memory unplug error happened
> somewhere".
>=20
> In theory we should just avoit emitting this event at all if dev->id is
> NULL, but this would be an incompatible change to existing guests.
> Instead, let's make the forementioned behavior explicit: if dev->id is
> NULL, pass an empty string to qapi_event_send_mem_unplug_error().
>=20
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/acpi/memory_hotplug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index af37889423..6a71de408b 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -178,7 +178,7 @@ static void acpi_memory_hotplug_write(void *opaque, h=
waddr addr, uint64_t data,
>              hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>              if (local_err) {
>                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> -                qapi_event_send_mem_unplug_error(dev->id,
> +                qapi_event_send_mem_unplug_error(dev->id ? : "",
>                                                   error_get_pretty(local_=
err));
>                  error_free(local_err);
>                  break;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5jJlbhheu9z7fQwy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmElvcAACgkQbDjKyiDZ
s5I11BAAsZ8ri8nY3GI3zVRhRIyh9Jb64JSawBjxMbSKze6g2ravAumtzAqYXiBO
H0aTaKHVcyAwmQVfV3VyJuiMfVD8E0Tx6OuzIZKmjr9CwnUXrasLKw/IAKTmex5M
pq1ZC0iWDGJ/DoyBUtSYKdXjCGp7XZQcvc9nQHwRqFNbjeVrnbIxlAu4IB1x6+ie
qXNYwPgUtTLGuGs+hXCEstWqyVF23ModCMIN6I4o/n+vUNOgL1z7eW+QvPj+mbuh
g59zc6ufTVrNhXcUyLRjlwJO9L7JGxGkRDytrBsQpTlhb9hw3AfHJDSF0VPywKr1
UB7fRKwEVL4mwIEKo5uKikZDVCjHAO3RdVwos+AjLTB0qX5UEYwSq7ub3YM8NbLM
Zz8Jrr6z50z5Owo9AhwoEYV9g7vDoaf1F6ff2UvUQ2txRvEpixsNhwvuNFWiA2BJ
lOc/ZbiSYZmC5mcxFNYozu/Z2aZe0uR8ziwdkRx/e+ykZNxecinoaEHdyn9u8o1+
kOH2nyLVPTE1tVruznJPra24q7jXpccAglCRpgA7/SE/0vybgRJoTtsCmIhxGsb0
GYhj8GysZxnd0iX1Irw0ZtJ1nFBJLi7t5OnOeGK2ZZX/m95+sXkIyAZH2LoUro3e
3bt+IGt8GQURxEtw5n461BhMwpbFwTuxLQQHidCRzG3v2XW02wU=
=/MIr
-----END PGP SIGNATURE-----

--5jJlbhheu9z7fQwy--

