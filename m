Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992013F9286
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 04:46:56 +0200 (CEST)
Received: from localhost ([::1]:57878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJRtP-0000bz-Ha
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 22:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJRqT-0007d3-Mz; Thu, 26 Aug 2021 22:43:53 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:43653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJRqS-0001zw-0N; Thu, 26 Aug 2021 22:43:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwkYX5L5Xz9sVq; Fri, 27 Aug 2021 12:43:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630032224;
 bh=jPVtNGnU6Uz7YXYEKpAP7RlnRBWD+pAJ5CLyQGXjmrM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EiRTAsORli0g1eymzzOpjKCLzq0WuclQpEy3tNcBEsTfILHOP4DmQzP1mmfxWfpEG
 PoDp31B2amcAFUxKNSdL6uVnQRKDI2DrSihuMGY8fxO4rAUV+B+OnUcsbda0U8Ua9j
 xvpLMqQW6jTMHs6bemwPyySL+pxHOIb/+++BXC0A=
Date: Fri, 27 Aug 2021 12:43:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v3 0/2] target/ppc: Fix vector registers access in
 gdbstub for little-endian
Message-ID: <YShRWfrHYVV6Pa0r@yekko>
References: <20210826145656.2507213-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SePuaIbSKzEJJy0L"
Content-Disposition: inline
In-Reply-To: <20210826145656.2507213-1-matheus.ferst@eldorado.org.br>
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SePuaIbSKzEJJy0L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2021 at 11:56:54AM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> PPC gdbstub code has two possible swaps of the 64-bit elements of AVR
> registers: in gdb_get_avr_reg/gdb_set_avr_reg (based on msr_le) and in
> gdb_get_reg128/ldq_p (based on TARGET_WORDS_BIGENDIAN).
>=20
> In softmmu, only the first is done, because TARGET_WORDS_BIGENDIAN is
> always true. In user mode, both are being done, resulting in swapped
> high and low doublewords of AVR registers in little-endian binaries.
>=20
> We fix this by moving the first swap to ppc_maybe_bswap_register, which
> already handles the endianness swap of each element's value in softmmu
> and does nothing in user mode.

Applied to ppc-for-6.2, thanks.

>=20
> Based-on: <20210826141446.2488609-1-matheus.ferst@eldorado.org.br>
>=20
> Matheus Ferst (2):
>   include/qemu/int128.h: introduce bswap128s
>   target/ppc: fix vector registers access in gdbstub for little-endian
>=20
>  include/qemu/int128.h | 17 ++++++++++++++++-
>  target/ppc/gdbstub.c  | 32 +++++++-------------------------
>  2 files changed, 23 insertions(+), 26 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SePuaIbSKzEJJy0L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEoUVkACgkQbDjKyiDZ
s5JO/Q/9EafOFVCFJu2nVKYu4+hdD7DP08j223z2YfiTR6pB/VmhQmYrsv5iOLVI
wfZPfXYq2BC0lsE3J2z9mPhhzwNponzRB0ma3AUJHYqInWMkwzNEgxQmqkZJZF2j
4H2jSJYUXwePm5UrHrSSk8JDg9JHxJBsTTRzlbpVF7PhTjcEd9QUyW8NGd9nBRDh
tRtnwFVEBwzQKI2dvwpDWhEbeOIUU0EpcmqkE7zGlNE4IT+cF79MwgOdczeIhRtF
g1uIPJBVDZgHr5mKrBZ78WtsacWGMpTFNIHTKZACjzyuPbsMcs6r4B5ZQQTzwjS+
me3gBo3snRJTrYeT9eymeYZXJBG75KBhAFVVltyJ2diYqy8RlKLrZ+Rs6QDEUfY3
hIOJOoBW4hFnM1qkdL6iL758ZbkvBroeB4Dp8HdDdQRIcSfgh+SMUUHk6lYYaFBb
M3HZXExSEAvKJLpbwb63d036/TF3ZnA25Yj5JVTEIsSRfL1YZdH3B/q8RebyhyTG
SbB62dfnrurBipP4Ac48Gn4wGzMaKU2erhZ/aMX6KCMQIrYc4sFMLWQoVzs6d4kk
VMBZUmXe1C0YlXxqQ86WSFM2/+UNIMyVl6c6UR7IVZLEH/PjWEs0/dZrau4Qk+ah
XTaK1NAlUii10Q7EpwHQ/pxaPAL/ksrSVxrtJBW2JEyr33yMe9g=
=Lfv7
-----END PGP SIGNATURE-----

--SePuaIbSKzEJJy0L--

