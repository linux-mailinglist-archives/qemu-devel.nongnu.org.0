Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132E84B7FF3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:15:41 +0100 (CET)
Received: from localhost ([::1]:60904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCfE-0006Yc-63
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:15:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7h-0001Kl-FI; Tue, 15 Feb 2022 23:41:04 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:40713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7e-0000SD-L6; Tue, 15 Feb 2022 23:41:01 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y34ZKqz4y4s; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=hNiq4cyqC3GFep1tKt9PdKMEl6S3N++us0kUzSjU0tE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W7YEZpXdNOVml/9Y8f/tBHUBiuWmPHjsLlNQWz4NwoG9y/7muD9reT/ePoYVBbiDX
 EYf0T5EiB7k1XnE8QplhWU9xJmjpubkVo03A4MY2U4rgsy7XkGDDHeDgmWqjIPMfyk
 mGmNZDy3AAVIx3cS5PjaFofPfWa5QdDLwPW8Jxco=
Date: Wed, 16 Feb 2022 14:06:40 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 00/27] target/ppc: SPR registration cleanups
Message-ID: <YgxqQMQGCkDeZoEb@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ao9FbSbRTfXCpZ2C"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-1-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ao9FbSbRTfXCpZ2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:21PM -0300, Fabiano Rosas wrote:
> The goal of this series is to do some untangling of SPR registration
> code in cpu_init.c and prepare for moving the CPU initialization into
> separate files for each CPU family.
>=20
> The first 23 patches are all simple cleanups:
>  - Remove unnecessary comments/code;
>  - Reuse some pieces of code where it makes sense;
>  - Group spr_register calls;
>  - Remove bare spr_register calls from init_proc;
>  - Separate code that affects different CPU families;
>=20
> The last 4 patches move common SPR registration routines out of
> cpu_init.c so that the cpu-specific code that uses them can move to
> other files.
>=20
> After this series we'll have only cpu-specific SPR code in cpu_init.c,
> i.e. code that can be split and moved as a unit into other
> files. Common/generic SPR code will be in helper_regs.c, exposed via
> spr_tcg.h.

These are some very nice cleanups, and rather overdue.  You've also
done a great job of splitting them up into easy to review pieces,
thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ao9FbSbRTfXCpZ2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMajoACgkQgypY4gEw
YSKkdBAAjS779O/N5Sw6mxiDghJKMOwtr20A7ijtHZo1Gc7uSdkSUgXViD4vQRTU
73o/xKCqEAF2VKPef1dX7wtFCrhcFj1bvgMJIHqvRv+K5oS9Dq10+iJqpIcGJx2k
1xmLoqCshkZOMyE/3GQabLJVhWoCop/Ad28jl+ZOUIkUpbRq3eti1Vz0Wv8PZFti
K87DR/hd01hx5RQewOZ1HrnEkkS/YUDXWo3tB79sjiP7OoPW6n60hRhHhaCpqPjr
avfaAj46ArF9GroKXBD5zozrjxeszFzvx3b8On0ipQkf9sb2LOfvYBxrfO7FMFI7
wMA2WrTeKdQTpkB6UmyHtBPUg8beqm0b+9pZZiPofcfPa5DWJukW1JdiZ/Us31Nk
mIalQUYuyy2F3j9Y2eh0IphbZ2hjHmMscEowZuSx4b1VF4nOB+3WTqIFlYEGonk7
irXzBK44sp9KPQ4lE1afUvg4uC/k6myPHYQYymJ41kY9cXvTMhOewOzhw+wavTkR
jE5IzRjRuBZG3gUIVfJGzZkaIJQ7Hbb7GmycBTzwS1odWxN0mVIxmPRI6UW56LmM
Soxm2j6d8RlghySfOHRp8WPaVjT2neYJDGVFJ4Kgn1hpWZV+Ta1LIWxOPqS/WOAV
mQ/qYfixM6fyrFexcgV7k0/T6+OKGip5ODZS0K0oN4cLKJNfRYI=
=4mvU
-----END PGP SIGNATURE-----

--ao9FbSbRTfXCpZ2C--

