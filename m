Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BC340F480
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 11:03:05 +0200 (CEST)
Received: from localhost ([::1]:59172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR9lv-0003Y5-UO
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 05:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mR9hx-0002QI-1p
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:58:57 -0400
Received: from ozlabs.org ([203.11.71.1]:44945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mR9hs-0002kg-DS
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1631869120;
 bh=5zxcVqBqrEXJjU7dHr1sHuWX1sBeAnoL/xXu0di3ylk=;
 h=Date:From:To:Cc:Subject:From;
 b=Ik6vokG4dc0iKw+QXMYoGHcS0Ju0UOWv+No7R4WJc9oTlQ5K7673jOrlCvr394Buu
 pYJxxaH2/V8z9o+6szQl1raGXl2IVx4j6yeuhAbWyFy5N9HaVPsj+4q6F5S1pB6xeD
 +QKzf5U4t3XjbcZM7FTAHksv9634lPROHZbeFVRQ=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H9ntS5B9wz9sW4; Fri, 17 Sep 2021 18:58:40 +1000 (AEST)
Date: Fri, 17 Sep 2021 18:58:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org
Subject: Rust in Qemu BoF followup: Rust vs. qemu platform support
Message-ID: <YURYvaOpya498Xx2@yekko>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2k5/rjYAJaW37kqS"
Content-Disposition: inline
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, slp@redhat.com, cohuck@redhat.com,
 f4bug@amsat.org, hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, alex.bennee@linaro.org, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2k5/rjYAJaW37kqS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
whether Rust supported all the host/build platforms that qemu does,
which is obviously vital if we want to make Rust a non-optional
component of the build.

I've added the information to our wiki at:
	https://wiki.qemu.org/RustInQemu

TBH, the coverage is not as good as I expected.  Linux, macOS and
Windows are pretty much ok, with the exception of Linux on Sparc.
There are a lot of gaps in *BSD support, however.

I've included some notes on where the information comes from, and some
uncertainties in there.

I've made an effort to get the information correct, but double
checking would be appreciated.

I haven't yet looked into the packaging situation for the Rust
toolchain on various platforms and distros, but I still intend to do
so.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2k5/rjYAJaW37kqS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFEWLwACgkQbDjKyiDZ
s5LHVg//XyRDzuk4Yhn9xRRDpQanK72vZY0KcTivY1QLY+2uhpOIHewdYPM3E9gc
HYAUGtAlWPRTP3UVp7sS6KAPRxlRmKLsuItol62xUBOMeB+X87PJWwcqyJiNUaZ1
B0EJGfpabEkgToKtSNy8rqtF4H14RPP0+fwXXWsNu4hTHHZJuWWoDYQXCckhGwp5
avuSzwBGWRNnJWBh6SuJ182X2SUUUZPwGh8Pp0q7GDancwa4GXcczxs5+K9RWGPc
jy/IYEkBgJGLLzzfDsepyk9/13YC7rolPbeeRuGLKHckubpNmBK98mc/eszbSSQh
/RhCIN3j3eYabfw46faLb6jIrImHSJtGoS1cu9htEVq/kXzxY2qgSWGMj2gAAtQD
RShgepktRvmDxEE/Iw64ghaXKV6iqu2nVhjzzIP01E4MyKFApetxw18Y9ZhEaBg3
kTOmLEKOVoO8FCzQ5ISS93j11UXcbJVyc35DxdVQSS/xF/FC/Sxwu/25Yd/T64GU
fOkGQdQdq0BCqp3htY2VG+JLr5LDF2h/YmSFqzsIUEfPMqrtZWk9CHQtka6gnwMS
Nu9TGVwmnXzdEWUjE2BTwa/PEfH861mZgO3bYp6nfognvxdJHU08/epwB37iG4Vn
rQMzei+XQ0kCF4450uyC9JNEG0ZmdItdGMin8vGuf4mLh8LX6VE=
=NAvu
-----END PGP SIGNATURE-----

--2k5/rjYAJaW37kqS--

