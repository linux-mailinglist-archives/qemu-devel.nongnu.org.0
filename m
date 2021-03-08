Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373993314FE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:39:21 +0100 (CET)
Received: from localhost ([::1]:58172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJqi-0004yE-8a
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1lJJfw-0000UI-K2; Mon, 08 Mar 2021 12:28:12 -0500
Received: from home.keithp.com ([63.227.221.253]:49434 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1lJJfu-0004tD-2c; Mon, 08 Mar 2021 12:28:12 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 048203F2EDF3;
 Mon,  8 Mar 2021 09:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1615224485; bh=m+sw0Zt/ees661/3Rr4sQMtlM3GlrM7DNfMqo1u+8RM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YG/ZVXMGmDITTxUCT2GXnlZoFpKkAAp/PBRZkjxVYwtrsl1BcFaKFvdrzBLmAmHh7
 pl7vp9SqctV7r0qPpxWXWA/KYzLKOy9EEfMy4HZ/gcgQRaii42gRnuBvEU1/3Vbyul
 D5dM3gOZ2baZar4I69Qo9nKF3w4IX9dDdsguGIgiD74ez9h8dHtV30B5A5xG1DdK0a
 HkVHkM0NlTeWpkfnKZERQltSxc3Uwv253xCBfbmScoRc4rKfwqy975W7ElHbknxGcr
 5weFh0XD87jihSm4fgLdirQVE0m4UVZ6M6mysqpESIESJ8ENp46DA6Z9Ekwa8KIG/S
 2cWRgaWqurrLg==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id GqbDHdoCU_hc; Mon,  8 Mar 2021 09:28:04 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id AF4643F2EDEC;
 Mon,  8 Mar 2021 09:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1615224484; bh=m+sw0Zt/ees661/3Rr4sQMtlM3GlrM7DNfMqo1u+8RM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RO8IMNNDZ51kjFPnj4Wdn5F8wnDaCPXbBY07C2ztSR4rr6a3pdLt/visRgSY1Zz8k
 UOxHNlWeOsyk8kSsU7vbKC1C7D6ugw1FuvRiZiyHlrf4XIwvMrLpo7zX5tn0t6oiVu
 I9lQDGh/0OaZkPra24h/gxFRYCyWTFiQuCnyLJieRzthz5U5RanSgz9CI5K/R/Nelp
 81/0Rg4nV3hila0fjeNuscU430t/dbw9UosTptpPZSpwsTcqTUhrnW5rmrHbn3zeUk
 3Q6UOoOS79vsnia9wgDyXgBwFXrz62LtFfeTYvBneaD39ht+w2kUspJ37f5XDNIG6t
 jJ/jd7PXOkAaw==
Received: by keithp.com (Postfix, from userid 1000)
 id A7F7A15821A3; Mon,  8 Mar 2021 09:28:04 -0800 (PST)
To: Alistair Francis <alistair23@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, Bug 1915925 <1915925@bugs.launchpad.net>, "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
In-Reply-To: <CAKmqyKMmS3uasofFLvteZyZVJTR8mrmVtTM=WKUD_DQ_8rHmqw@mail.gmail.com>
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
 <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
 <87im65gxla.fsf@keithp.com>
 <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
 <877dmlgnrf.fsf@keithp.com>
 <CAFEAcA8t9eQf7nD2Ea7z1qO-Tf5xthTvzODS3XsxX+0ns3ttQg@mail.gmail.com>
 <87o8fwfcjd.fsf@keithp.com>
 <CAFEAcA-X6aqsePMKgxzHcRA8okyVUg=Lxve2KqXrd+qiX=jjFg@mail.gmail.com>
 <CAKmqyKMmS3uasofFLvteZyZVJTR8mrmVtTM=WKUD_DQ_8rHmqw@mail.gmail.com>
Date: Mon, 08 Mar 2021 09:28:04 -0800
Message-ID: <87czw9ftcr.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Keith Packard <keithp@keithp.com>
From:  Keith Packard via <qemu-devel@nongnu.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Alistair Francis <alistair23@gmail.com> writes:

> I have started on the effort, but I have not finished yet. Adding
> riscv_cpu_is_32bit() was the first step there and I have some more
> patches locally but I don't have anything working yet.

That's awesome. I think waiting until we see what APIs you're developing
for detecting and operating in 32-bit mode on a 64-bit capable processor
seems like a good idea for now.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAmBGXqQACgkQ2yIaaQAA
ABG7Aw/9EA9NUbXRwNYs14zkycnnoFVFGS6Y3NmnDBeJ4h6WqQaAvMVFg/jVB2AX
4q4SZsakKc35H+i9icj/lBpBmdVySUI/kJ+elElE5IVYM47msBBGYb8KmX1f1n1F
twgWduMjHi4KoPbitIl1OtCr8/oNkddBKmPsEG/kYdxmZU1bdKg+YYSNjUZd80JV
JHb1uAyAZLLBGLKEjm6ZrfJGgDPDzik+nuLieVn9pAkPUhUSr2/a+ZGjcMFIJMxv
ws1OOQmsjgR25yHk004yRqXgueS1MneXC9ri7cN/NbkbiKFMKrzvJKP5susTs8wi
ltZ0CLiYmKt/VaNnEx4xzBUwR/o+7ML4bxOSjxaWCazRQPi/HV3b0h/+XzLl0LjM
KEGDLpVLEw87tNIkRBdQYvAuZbFG+WwqOBE+y0U+JhS5rZzLJijZUnOs48Y84kVE
dpBdHZiOclU9b1p1zTLi0+Nv/9dFZBZOPXBWwdsGvn5ExYU4oFLutBxws3UP9TBW
r5LuqphhzvHN70yu56hSH9Clbhi4k5NacZft/7PS+v2K9lszQs9ndbvmFqr8T1qY
SldfyUI1hZixUMyQPMFcaSsHq5Xo4PJOdgtNdBsSO03wv7cSla7XaqeRBdAcVScw
ESl3K0bO7sZRlDy4xGuYOu2xNcRt2tLctYjZiRZvpMsYo6pxFwo=
=kcrR
-----END PGP SIGNATURE-----
--=-=-=--

