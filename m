Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D55B2D5246
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 04:59:58 +0100 (CET)
Received: from localhost ([::1]:37826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knD7V-00022J-DJ
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 22:59:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knD26-0006y2-PP; Wed, 09 Dec 2020 22:54:24 -0500
Received: from ozlabs.org ([203.11.71.1]:51701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knD23-0000IS-AE; Wed, 09 Dec 2020 22:54:22 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cs0Qt0LwWz9sWL; Thu, 10 Dec 2020 14:54:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607572454;
 bh=rBxqGKj6GZtPQjZRUEqfK6Ie8wTn9gCBX6Kd/iHnBwM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aNVhFDAQd2OrUyRgYEeOZEwysCVVAVvF+B9IJIEB/DeTzmWWI/RaOHIy8GiA1tUUn
 CMCcGywtmYzeaFNm4jSTNKKXPAwtPdrptlGCHvpdlqogJkqc5Lu/WRw/1afF28/Q8d
 bmH4Dr2xo050xNLtDH+ZcndAsSG3ga7Mjc7CYm9A=
Date: Thu, 10 Dec 2020 14:54:08 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 6/6] target/ppc: Add mce_req_event() handler to
 PPCVirtualHypervisorClass
Message-ID: <20201210035408.GN2555@yekko.fritz.box>
References: <20201209170052.1431440-1-groug@kaod.org>
 <20201209170052.1431440-7-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Pjk796cY0SfIo9Z2"
Content-Disposition: inline
In-Reply-To: <20201209170052.1431440-7-groug@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Pjk796cY0SfIo9Z2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2020 at 06:00:52PM +0100, Greg Kurz wrote:
> kvm_handle_nmi() directly calls spapr_mce_req_event() which is machine
> level code. Apart from being ugly, this forces spapr_mce_req_event()
> to rely on qdev_get_machine() to get a pointer to the machine state.
> This is a bit unfortunate since POWER CPUs have a backlink to the
> virtual hypervisor, which happens to be the machine itself with
> sPAPR.
>=20
> Turn spapr_mce_req_event() into a PPC virtual hypervisor operation,
> and adapt kvm_handle_nmi() to call it as such.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

I have somewhat mixed thoughts on this.  Putting it in vhyp makes a
certain sense.  But on the other hand, the MCE event from KVM is an
explicitly PAPR specific interface, so it can't really go to any other
implementation.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Pjk796cY0SfIo9Z2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/Rm+AACgkQbDjKyiDZ
s5ItAQ//R2da5sWL/OOIDROivi7kfJ7X8HriUOfEUZfPNd7K/TBZiCVD54Cnv7nc
O4jHr1UjWsiwwvrF1xsHoD6S+BqX0RApiKkCJr+Be03PibpbMSkYeXvHEXDuK67f
0K+pFnCoJug1ECMwkWax+qPLoXzeQmJz2OpFvxbNFwU8dQg6I+U5/D9TROG8IVM7
YT9gBjKgHcnVMikT4VSkItw5Ktcuzu9TzAAie7XSDNB6HLCaPuvxJ8teTJaPZPjE
5HU+E7w0zODH97D4jKmGo+jv6n28OfDinPlbgeMI/wkfI2LHiQW6/YPD3GyLC80Q
rwgLinVH0szDdhhJBCd2BQwjq5OsXMdM11CGBGBU+hpoyCs4qylgQE3Fhd7mkeZk
tG7JF+9x8aL3zGsGQ1kaEBTOTurHuRAzjbxs1mMm6KieHnm9quTfEB4vg/U2pVi5
DanLInXaSI8V5M5zi69HrzGez28BF7uxzqg8iHkb7wCpNXsqdSLNco6tuvZebD27
vZf4lQxGMDwIVL4/ei66SthKHLwS0xAukmFGtxDy/Sr8PxrjbC6iuaUcq7yGm3k6
+q/VH0apmYON6FuJoi6NsCsVHJWDd5h90Kl14tNxGV6nStUw399SpxTh452gdNmL
RTRBf5Wj+gATL/uLV7pl9zNAvWWmDxYt/HSbSnJvBOeuXDK/cC4=
=uqwt
-----END PGP SIGNATURE-----

--Pjk796cY0SfIo9Z2--

