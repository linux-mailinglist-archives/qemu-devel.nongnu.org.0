Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DE4CB475
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 08:25:17 +0200 (CEST)
Received: from localhost ([::1]:42504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGH1f-0003ud-UJ
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 02:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34833)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGG9d-0003NP-3p
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 01:29:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGG9b-0004aX-G2
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 01:29:24 -0400
Received: from ozlabs.org ([203.11.71.1]:38905)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1iGG9Z-0004VE-41
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 01:29:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46kz2G320kz9sPw; Fri,  4 Oct 2019 15:29:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570166950;
 bh=uXl4/sIGY5mRu5kIBOlLm8n9Y4qaBXFp5OI9TutNwaY=;
 h=Date:From:To:Cc:Subject:From;
 b=pA9qlgKtp+VpYMhlvdRUYTwy0BP9RGLnpH+07p9CbnwmUFkzwGiGguWbLQHcLLhuf
 3rtq5nYfpwajoH81CcU4CtFdCZHfOVdNbm6m2tPN4OBDCifXgHwc7IH/OzT2jW/R5j
 eL/chmJusJLYOGFUKh/8XsdkZJKQnbVMLnHHza1s=
Date: Fri, 4 Oct 2019 15:29:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Cleber Rosa <crosa@redhat.com>
Subject: Skip
 LinuxInitrd.test_with_2gib_file_should_exit_error_msg_with_linux_v3_6 on
 32-bit hosts?
Message-ID: <20191004052906.GC27597@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1ccMZA6j1vT5UqiK"
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
X-Mailman-Approved-At: Fri, 04 Oct 2019 02:23:42 -0400
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Caio Carrara <ccarrara@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1ccMZA6j1vT5UqiK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

When I run make check-acceptance in a 32-bit (i686) container, this
test fails, because it tries to start a guest with 4G of RAM, which
can't fit in the userspace address space on a 32-bit host, obviously.

 (16/44) /home/dwg/src/qemu/tests/acceptance/linux_initrd.py:LinuxInitrd.te=
st_with_2gib_file_should_exit_error_msg_with_linux_v3_6: FAIL: Regex didn't=
 match: '.*initrd is too large.*max: \\d+, need 2147483648.*' not found in =
'qemu-system-x86_64: -m 4096: ram size too large\n' (0.12 s)

Should we simply skip this test on 32-bit hosts?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1ccMZA6j1vT5UqiK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl2W2KIACgkQbDjKyiDZ
s5KuYBAA0AzduJcHTBLGdIxxeMV9F0iXgd7G4MAJSW+v9KMUX+IRJsi8nO9amzbg
s0S2cQpEPjZ4WIBUvdZWFl9LK57n54EPlG/p1r254oWqorL2TE8tsjNNXAGAy2CA
6lZrXaa/GeEgLfoZyqCIYE48UIiGH3pQpbIxc4wquxq7ocfE6JLtX4msSzEO49sE
W4gqEZ644TU9qUtk8pOIOC7MkiJbxiCfm+up54+7ErcPTvxZBvBkuwqOmKrAEBHT
Qj0ieZrLsIWF4pkIo4G2JVpGV2quwGaPG8X4teuv0zLnVQIhKoY9Xg6penvjcNly
UNJ21rwhugctQp+YExPx3Q10mv3QyO+ae6f2/9XsLmt/pgCwXUnxmJZmqdWb5AQC
LUUeGAOg94iYzO5lcanwdtmcr5ZAYEfvY7XcuUhwvGC/oYr1wB606C10M622tpxN
eceGzzpS0ihyKKTAjA71gjw05ncFfciGLBBJlFVLKh2z4pcvLgy+QmRpRScai0rI
pfJFk810uQSftl002fOIP/pd+r1v9OA3w6e8TY59gFwdYNe4PEiin2xiqqaqLb8X
hTPmBCjc9/1iE4F7TJY8xi/Sl0ixhVDwR3DaonjunSULfXNnSQWxoYYydTztEGiQ
uYGsBtlwYrMpLmWKYl4bTlLBFXji1dCBkYg4SvzZUqqXfJ4qLsk=
=ytxQ
-----END PGP SIGNATURE-----

--1ccMZA6j1vT5UqiK--

