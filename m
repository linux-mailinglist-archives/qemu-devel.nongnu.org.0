Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FC73BF4D9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 06:46:15 +0200 (CEST)
Received: from localhost ([::1]:44998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1LvS-0006DH-Eg
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 00:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1Ls4-0004UF-SY; Thu, 08 Jul 2021 00:42:44 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56181 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1Ls1-0000eM-M7; Thu, 08 Jul 2021 00:42:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GL3Ym1twGz9sWl; Thu,  8 Jul 2021 14:42:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625719356;
 bh=lbUs1ruVMJrVdORqYgfEef0J1TkvWJFvAIdDQtPO2Ps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iNx4uPgxdB/Lzz/IMx4+DA159ctuS8tUFHOFfsjJYVwxWSX/oNTUwnY9O31UdlhCY
 IOsPcZFxABRbG+n+9YPs5AdtvGchDlU98HunE1MXI/+QV/oggKo9iMZboRiPeTt5tk
 AbOrv03RLNQmxGZooO0cuYPvjzNjgLm2uxgNAfeU=
Date: Thu, 8 Jul 2021 14:37:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 4/4] ppc/pegasos2: Implement some RTAS functions with VOF
Message-ID: <YOaBCA4nZ0Lyz2SM@yekko>
References: <cover.1624811233.git.balaton@eik.bme.hu>
 <b4bf314d4edca0dd31f2859543601f815ed56187.1624811233.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7dwRH+zQu6slVuJu"
Content-Disposition: inline
In-Reply-To: <b4bf314d4edca0dd31f2859543601f815ed56187.1624811233.git.balaton@eik.bme.hu>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--7dwRH+zQu6slVuJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 27, 2021 at 06:27:13PM +0200, BALATON Zoltan wrote:
> Linux uses RTAS functions to access PCI devices so we need to provide
> these with VOF. Implement some of the most important functions to
> allow booting Linux with VOF. With this the board is now usable
> without a binary ROM image and we can enable it by default as other
> boards.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Applied, but...

> @@ -687,6 +795,29 @@ static void *build_fdt(MachineState *machine, int *f=
dt_size)
>      qemu_fdt_setprop_string(fdt, "/failsafe", "device_type", "serial");
>      qemu_fdt_setprop_string(fdt, "/failsafe", "name", "failsafe");
> =20
> +    qemu_fdt_add_subnode(fdt, "/rtas");
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "system-reboot", 20);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "hibernate", 19);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "suspend", 18);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "power-off", 17);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "set-indicator", 11);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "display-character", 10);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "write-pci-config", 9);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "read-pci-config", 8);
> +    /* Pegasos2 firmware misspells check-exception and guests use that */
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "check-execption", 7);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "event-scan", 6);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "set-time-of-day", 4);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "get-time-of-day", 3);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "nvram-store", 2);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "nvram-fetch", 1);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "restart-rtas", 0);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-error-log-max", 0);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-event-scan-rate", 0);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-display-device", 0);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-size", 20);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-version", 1);

=2E.you really want to be using your symbolic names here as well.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7dwRH+zQu6slVuJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDmgQUACgkQbDjKyiDZ
s5Id+RAA3KxFMQcRPe8sDqLFXy3Rs57hfaznlUIKlfiUNVEMLI8UkhBERf9k5aUN
Tu0nvrDo3+tgjh2+X3GZ6gY7oAmXGpEtXXldkOLu75tYgAjSj3Mj5lxmqIfJFt58
lc5zwhznx38b7B4xyKjizbSwZmKTeQ3BI2yWfQn1yQGtMahUQJQynFA1tCOVg8cl
SUA2oxOoSrZhnr5qX5AJi+5NN7/suOhcvZik0CgqFo4uENlvC89ta2zOnl2cwm1u
Eznve9v6jfh/0SX/RTmd7WEIgQiU+DWEnW3Ji+Gy5Qgzl3DsOwIibNV+jv+O53Hk
SZ6iQ/hYspYJczuz4+5orF21tLdd9pUDKKmMnDwyw2VKwQTZC9cY9UqpKJJ/TQzN
yqrRjVlKaE1OtG9vlZtYCAKqxd1VjPArxcldLZOptAhhHXcYXYVNFE1uU77crHAA
ZPGbWgxDBLMhLw0ZsP4IuFUDsYDvTRONPRPvXAy9ze6guogqAGUfR+AEXblHVl96
w1rfg/kxizs4Bbl0OhUCTYdVRNG3oEVkFkaKdtaHTMFISmiJlvEun8oQsblkP+ZD
iPH7AwWsAYYEgmXHqOefc7eMmqZkE1Lr8OFIIKnvBPrLEqZQizh43g8WPz4aQBvN
o9Anf+I0JDD8CgDqVtYd43Zbos5bKmZBXjLcjSAd6uFTNdIPUqg=
=N9qM
-----END PGP SIGNATURE-----

--7dwRH+zQu6slVuJu--

