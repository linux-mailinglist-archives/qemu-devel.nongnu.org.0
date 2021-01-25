Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F50302305
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 09:51:28 +0100 (CET)
Received: from localhost ([::1]:46952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3xal-0007Z4-C6
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 03:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l3xZC-00070E-BJ; Mon, 25 Jan 2021 03:49:46 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:37683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l3xZ9-00022x-0p; Mon, 25 Jan 2021 03:49:45 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DPNp81vysz9sRR; Mon, 25 Jan 2021 19:49:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611564560;
 bh=km89ChaEAgnqWMBSwu817023za7Qm9X4YI8ptw9s0Q4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ah1WvkdX073e4E/8Y/t++VsYHUVjUxoq+I91mVM4nKMbnmSMhzoVSk1ZhmsEyWzuI
 d4FmHudEG9v9DjluTbXhAirsRQY1e60pOhaf6pJUwdhawncUJrwYy3mt6l17EwSyQk
 L8R5rmqawgZlRWBsW2yb46HZLaqJPMtL1Nm6hDRM=
Date: Mon, 25 Jan 2021 19:21:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] spapr: Adjust firmware path of PCI devices
Message-ID: <20210125082138.GA2046@yekko.fritz.box>
References: <20210122170157.246374-1-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <20210122170157.246374-1-groug@kaod.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2021 at 06:01:57PM +0100, Greg Kurz wrote:
> It is currently not possible to perform a strict boot from USB storage:
>=20
> $ qemu-system-ppc64 -accel kvm -nodefaults -nographic -serial stdio \
> 	-boot strict=3Don \
> 	-device qemu-xhci \
> 	-device usb-storage,drive=3Ddisk,bootindex=3D0 \
> 	-blockdev driver=3Dfile,node-name=3Ddisk,filename=3Dfedora-ppc64le.qcow2
>=20
>=20
> SLOF ********************************************************************=
**
> QEMU Starting
>  Build Date =3D Jul 17 2020 11:15:24
>  FW Version =3D git-e18ddad8516ff2cf
>  Press "s" to enter Open Firmware.
>=20
> Populating /vdevice methods
> Populating /vdevice/vty@71000000
> Populating /vdevice/nvram@71000001
> Populating /pci@800000020000000
>                      00 0000 (D) : 1b36 000d    serial bus [ usb-xhci ]
> No NVRAM common partition, re-initializing...
> Scanning USB
>   XHCI: Initializing
>     USB Storage
>        SCSI: Looking for devices
>           101000000000000 DISK     : "QEMU     QEMU HARDDISK    2.5+"
> Using default console: /vdevice/vty@71000000
>=20
>   Welcome to Open Firmware
>=20
>   Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
>   This program and the accompanying materials are made available
>   under the terms of the BSD License available at
>   http://www.opensource.org/licenses/bsd-license.php
>=20
>=20
> Trying to load:  from: /pci@800000020000000/usb@0/storage@1/disk@10100000=
0000000 ...
> E3405: No such device
>=20
> E3407: Load failed
>=20
>   Type 'boot' and press return to continue booting the system.
>   Type 'reset-all' and press return to reboot the system.
>=20
>=20
> Ready!
> 0 >
>=20
> The device tree handed over by QEMU to SLOF indeed contains:
>=20
> qemu,boot-list =3D
> 	"/pci@800000020000000/usb@0/storage@1/disk@101000000000000 HALT";
>=20
> but the device node is named usb-xhci@0, not usb@0.
>=20
> This happens because the firmware names of PCI devices returned
> by get_boot_devices_list() come from pcibus_get_fw_dev_path(),
> while the sPAPR PHB code uses a different naming scheme for
> device nodes. This inconsistency has always been there but it was
> hidden for a long time because SLOF used to rename USB device
> nodes, until this commit, merged in QEMU 4.2.0 :
>=20
> commit 85164ad4ed9960cac842fa4cc067c6b6699b0994
> Author: Alexey Kardashevskiy <aik@ozlabs.ru>
> Date:   Wed Sep 11 16:24:32 2019 +1000
>=20
>     pseries: Update SLOF firmware image
>=20
>     This fixes USB host bus adapter name in the device tree to match QEMU=
's
>     one.
>=20
>     Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>     Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>=20
> Fortunately, sPAPR implements the firmware path provider interface.
> This provides a way to override the default firmware paths.
>=20
> Just factor out the sPAPR PHB naming logic from spapr_dt_pci_device()
> to a helper, and use it in the sPAPR firmware path provider hook.
>=20
> Fixes: 85164ad4ed99 ("pseries: Update SLOF firmware image")
> Signed-off-by: Greg Kurz <groug@kaod.org>

Nice work.  Applied to ppc-for-6.0.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAOf5IACgkQbDjKyiDZ
s5Jagg//X/6AQpblTr7xkIreMrG9k63qKh0lt6QBbIs/QfHpg4p/PyXbLvL06BPg
IYQqKRuZ25Yl1inIrm+yiRxRJ7tenqjiVsLdNop2a+enEgF8WF5kZCLyfPUGlOLV
fDYJBUMk36jxli75/6u2cOtBZPPLQKRq9dDD+t8hGo98jd5WxZEC+2CBKHDAOpKQ
KXbUzMOJt9krTQPmVKG3Fnx4zjxNORs/tPRPUDw20rhItbOGtotJQxFvXaWxh+Hq
5Lc9kc+3bbLbjPZjRIiMHW4+gQCWHSKHj8ScK2K4AsrzWYir7mIjVUEXZBlVADVs
foxJBfsowMJKdzBkHC9i4HRRWOnrRwbLMB+GE90EbZAAP3tybHWtoqRteJ784yxL
7f88uzkTX4gsMRedoaSzCSeTzblI2caSyxZJgxxRPVZhtp87i014N0qw6JDCDuHJ
DqU173jWLzgUJtcme2iJHf9Z7CUWQcNpLALQXPAh4IpgJ/JBpUt6Fm/sqjnQQzIl
oy2jBQTbwkcHiM02wTjK3RnrHyh5No99h8v+7EpE9D8upWFW3lVQLsWfXm1y6BnL
bLHLCS0Z0CrYKEZtNQJvyjeQwdY6MKsnnX9UmGce9aKUGwLABdK7IkIvH6tCA3Yi
sIlWnWN2dEv1MT0cTmEQ610FfCwjXfHA+8Sr6OZ0UiMwAj0CAT4=
=RL99
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--

