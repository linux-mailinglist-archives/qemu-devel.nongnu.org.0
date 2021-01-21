Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8C62FDE2C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 01:53:19 +0100 (CET)
Received: from localhost ([::1]:54630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ODu-00005x-Em
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 19:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l2OCe-00080U-7y; Wed, 20 Jan 2021 19:52:00 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:36989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l2OCb-0002xo-NF; Wed, 20 Jan 2021 19:51:59 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DLkP35FMQz9sWk; Thu, 21 Jan 2021 11:51:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611190311;
 bh=VJ819DE8JeFno+BORYXccrbcFnuK4AcadUToIx8rKHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NnolVHPLOLwfT9YYPz+oGqs/iBzROYpqRk9VZbl0Oyez5CQ2jPmIGZDQilHwH95wx
 /+6zijnYD8R7tQkntTkWoWUov4wnR7+WZymJUP8TQFGVILWfmWcJvQHXx+Vb7mNYlT
 KOantAY6bGbx33wpQJyfQDo340QALchGZeFyYMSk=
Date: Thu, 21 Jan 2021 11:43:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 2/2] spapr.c: add 'name' property for hotplugged CPUs
 nodes
Message-ID: <20210121004305.GC5174@yekko.fritz.box>
References: <20210120232305.241521-1-danielhb413@gmail.com>
 <20210120232305.241521-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline
In-Reply-To: <20210120232305.241521-3-danielhb413@gmail.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 08:23:05PM -0300, Daniel Henrique Barboza wrote:
> In the CPU hotunplug bug [1] the guest kernel throws a scary
> message in dmesg:
>=20
> pseries-hotplug-cpu: Failed to offline CPU <NULL>, rc: -16
>=20
> The reason isn't related to the bug though. This happens because the
> kernel file arch/powerpc/platform/pseries/hotplug-cpu.c, function
> dlpar_cpu_remove(), is not finding the device_node.name of the offending
> CPU.
>=20
> We're not populating the 'name' property for hotplugged CPUs. Since the
> kernel relies on device_node.name for identifying CPU nodes, and the
> CPUs that are coldplugged has the 'name' property filled by SLOF, this
> is creating an unneeded inconsistency between hotplug and coldplug CPUs
> in the kernel.
>=20
> Let's fill the 'name' property for hotplugged CPUs as well. This will
> make the guest dmesg throws a less intimidating message when we try to
> unplug the last online CPU:
>=20
> pseries-hotplug-cpu: Failed to offline CPU PowerPC,POWER9@1, rc: -16
>=20
> [1] https://bugzilla.redhat.com/1911414
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Nice catch.  Because the PAPR code has an odd mix of flattened-tree
pieces (where 'name' is implicit) and real OF pieces (where we
definitely need it), getting this right is kind of fiddly.  Since this
bit of flat tree gets encoded into PAPR's CAS update format, which
does require the 'name' property, this is correct.

You could argue that it's more technically correct for the flattening
code to add the name property from the FDT node name, but this is
simpler and gets the job done.

Applied, thanks.

> ---
>  hw/ppc/spapr.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index cc1b709615..6ab27ea269 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3750,6 +3750,19 @@ int spapr_core_dt_populate(SpaprDrc *drc, SpaprMac=
hineState *spapr,
> =20
>      spapr_dt_cpu(cs, fdt, offset, spapr);
> =20
> +    /*
> +     * spapr_dt_cpu() does not fill the 'name' property in the
> +     * CPU node. The function is called during boot process, before
> +     * and after CAS, and overwriting the 'name' property written
> +     * by SLOF is not allowed.
> +     *
> +     * Write it manually after spapr_dt_cpu(). This makes the hotplug
> +     * CPUs more compatible with the coldplugged ones, which have
> +     * the 'name' property. Linux Kernel also relies on this
> +     * property to identify CPU nodes.
> +     */
> +    _FDT((fdt_setprop_string(fdt, offset, "name", nodename)));
> +
>      *fdt_start_offset =3D offset;
>      return 0;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAIzhcACgkQbDjKyiDZ
s5Io9g/+P5jmQEuGNJxDnyLY/arkzhP3N7enrKqNh/0Umcfv4ZpC0Y2sAbV00viE
gGmlyd0i+OHOmuSku0vnME66fppdO31XXZZiWsYPZ5fm/niTNbNOvFOA2cnAZhgX
44WyEpLynGtMLm8QX1A7OPUTAzX4YL4kSg6yYlXEIbcnZhkld4EP7lCzD0ydkJcR
jm1CWrJzf0u90kOS4TwrZ6fqc/tgyM+++coJlMBZzhYt38Pjgzd3DDOhiLqYrKb9
Wj7ZkZYpIOaf9zkoeTCYkAJuEeU7yHhlku1RURanpfxtycE06QiFOQGBcL/I3UIF
39OsHF11n/KE0gXacSBQs7vzLzNGzgbLgABT7UcjQNRD8erAnZAJ5PeUQrTw9/Qu
0iVTTZJhRPYqqOMRWD24jj5nVIVRUeSGNphPpbuuEDl/+fvPR3UxddmjsGCuFzuZ
vhBKs6GHJYqsdqKGeFccNtvjfSm/L++V86uoxVs+f8CmbPeNL8l9cpvHzDTAocwx
8kikgt2hIFHH43D2o8ZTOlKyWIc7yAhbFxb0or8CfLmqKWfMGAHxIjQFG1IJr9DP
EQc76bXpeu9u0mlfq2Rzx8lkkz7x17mDD7WAoYV0SkhWw3JuD5kmhm6XmvsKHMKl
6rFj0ZwRBfDfkxq2cajQ6as5BRUlrzAwaLN7bvWQgeS9w3/8EcY=
=PCq6
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--

