Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74C83C6922
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 06:20:15 +0200 (CEST)
Received: from localhost ([::1]:54662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m39u2-0000aU-HX
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 00:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m39mG-00086z-VV
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:12:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43171 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m39mC-00052w-QE
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:12:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GP6f752Ccz9sX3; Tue, 13 Jul 2021 14:11:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626149519;
 bh=mdq+BL5raxen+JtbVS4+cAQCrvQwu3a81Jq7KbZ7R/U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=leIWwGd/5LebOH2UfBZ5ndqBg16ht84BHF3VYlWcAtwBDYLlS/9e77tPSCFcn6ht8
 7zxIU45ciW16idnK8glWlgMxd94Kr+/Z9U2WiAMszcJdd9XwwpQtKmdJ470NH2OzjB
 u3/skxN9lg3bLTFFyHMpHVeTM8YsY5iwLDmIfG4Q=
Date: Tue, 13 Jul 2021 14:11:24 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v6 5/6] hw/acpi/ich9: Set ACPI PCI hot-plug as default on
 Q35
Message-ID: <YO0SbMqumYzocy/J@yekko>
References: <20210713004205.775386-1-jusual@redhat.com>
 <20210713004205.775386-6-jusual@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3MIXlGjDsHfSFjC+"
Content-Disposition: inline
In-Reply-To: <20210713004205.775386-6-jusual@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Igor Mammedov <imammedo@redhat.com>, David Gibson <dgibson@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3MIXlGjDsHfSFjC+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2021 at 02:42:04AM +0200, Julia Suvorova wrote:
> Q35 has three different types of PCI devices hot-plug: PCIe Native,
> SHPC Native and ACPI hot-plug. This patch changes the default choice
> for cold-plugged bridges from PCIe Native to ACPI Hot-plug with
> ability to use SHPC and PCIe Native for hot-plugged bridges.
>=20
> This is a list of the PCIe Native hot-plug issues that led to this
> change:
>     * no racy behavior during boot (see 110c477c2ed)
>     * no delay during deleting - after the actual power off software
>       must wait at least 1 second before indicating about it. This case
>       is quite important for users, it even has its own bug:
>           https://bugzilla.redhat.com/show_bug.cgi?id=3D1594168
>     * no timer-based behavior - in addition to the previous example,
>       the attention button has a 5-second waiting period, during which
>       the operation can be canceled with a second press. While this
>       looks fine for manual button control, automation will result in
>       the need to queue or drop events, and the software receiving
>       events in all sort of unspecified combinations of attention/power
>       indicator states, which is racy and uppredictable.
>     * fixes:
>         * https://bugzilla.redhat.com/show_bug.cgi?id=3D1752465
>         * https://bugzilla.redhat.com/show_bug.cgi?id=3D1690256
>=20
> To return to PCIe Native hot-plug:
>     -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=3Doff
>=20
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/acpi/ich9.c | 2 +-
>  hw/i386/pc.c   | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 2f4eb453ac..778e27b659 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -427,7 +427,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMReg=
s *pm)
>      pm->disable_s3 =3D 0;
>      pm->disable_s4 =3D 0;
>      pm->s4_val =3D 2;
> -    pm->use_acpi_hotplug_bridge =3D false;
> +    pm->use_acpi_hotplug_bridge =3D true;
> =20
>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
>                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8e1220db72..7e03848792 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -98,6 +98,7 @@ GlobalProperty pc_compat_6_0[] =3D {
>      { "qemu64" "-" TYPE_X86_CPU, "family", "6" },
>      { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
>      { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
> +    { "ICH9-LPC", "acpi-pci-hotplug-with-bridge-support", "off" },
>  };
>  const size_t pc_compat_6_0_len =3D G_N_ELEMENTS(pc_compat_6_0);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3MIXlGjDsHfSFjC+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDtEmwACgkQbDjKyiDZ
s5LZSBAAnZohkuXGRTGaB5iwZ8Wd2s2EgldAQTCvVWQbv7s739kWWvVpJLz6r/xD
ceiCK0dG2G8qZ6Ms/7cMg4Br95A7DEdLlZ6nCtSbM02UK5OWA7dYS1CXk17tqNel
d8II13R8cRD5OFCH+0tasIZYSL57HYS2CCnJ559nK7kKjQYvZ1o11ySYPednWkW8
vhBf3wI5kRbvwhZUuHMuW7BoEaml6jTx8Z/FzkbBNXT256M2NpMknu4+CBAFsTlO
gGRhhHH+JBlUrfjwWF7Rd+zO9pruy+ndxOMr5xiiw4tCYPkR8Ywwg7mud5wEFwTF
GmPq4F3hGbsKZWKcNfm3g7qEdW/dw33rfiSjHJWfzKYRethHnJRcp5E3YSYpfJ/a
+WSSPxtRy7wAcSlVgHIEt0u1JPYIVYfc0URZuvOZwH3BKTHmRwAae5QmT0ThJkBh
hhcVfkPdRsh9AOukpCVp4jLY0/YglnmaoC7ztsMuwO5k6adoDuA/0D9Ai4YZg9Mz
ZGVdGyPdeA2XPbiizn+UWLZIFmjkZ3s6RH72zCt7taaLw3KXL3inVEDFU4jnGgyW
NDpJ4aAysYaafJoQ+cxLZDwLOAAXdbyYZ6sj5VxJUWNv1nBjyTRVLHuBTuZ4whSR
MX1+Us/kjfHOXbDnEdlFY0HG/fg6/sB5w8mnLgQgvfl6cjumCxo=
=TMhd
-----END PGP SIGNATURE-----

--3MIXlGjDsHfSFjC+--

