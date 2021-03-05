Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1323C32F48B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 21:21:24 +0100 (CET)
Received: from localhost ([::1]:35838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIGws-0007WI-Jf
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 15:21:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1lIGv1-0006d1-IT; Fri, 05 Mar 2021 15:19:27 -0500
Received: from home.keithp.com ([63.227.221.253]:33058 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1lIGux-0001fq-Is; Fri, 05 Mar 2021 15:19:27 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 2DCC73F2EE3F;
 Fri,  5 Mar 2021 12:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1614975557; bh=Ane6Z/iOYdLzQEYJ1l+yME575dvok5HTBcejFsm2kdE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=F35daGPrBakhHFqXEvzw8ZwZXl7iauUYj8OKDHRL/hxd0vOtHVC9sShTeA7Octcw4
 MfR3s1gw+BD9rg5RX8dr1EGlnJRCdiMl6Lse8TEztBPvQ4hbZVlJu6k4xzJQsYcRTg
 qMu8jC8xRSkKH/aWuYHsycPonIBbnCsQRkT8SN6qoxP+7ww8TIN/mb8UugTBO7JZ0t
 3cJzxXZWkttA9EswpIYmEYWPMFKltilJugU+kFWw8/LFgEZ4DKsiKv1H7LF2qsagrr
 tkkS9DaCf0HhyJ639TZ4+9GvJ/dprkem+gduX9x7c1FnBkRqJ7u7xf9CO1IZYZyCyB
 ERgJHjKYgZSfA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id lCDKVBfi5HNK; Fri,  5 Mar 2021 12:19:16 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id C0DBB3F2EE21;
 Fri,  5 Mar 2021 12:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1614975556; bh=Ane6Z/iOYdLzQEYJ1l+yME575dvok5HTBcejFsm2kdE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RmS6hyxkYPgcAcR7ivjPlg8uV9hrFA2irCbdaxdTJwGKSY9emvROt4BILfZZ7qrOh
 CFcOrGd2qbGqwTa0HBJjiX3T9nKRuG+jxGSwu11mxFG+foM9mB0BXJNplOrf58Ntut
 Aig5p8B/oUC9xGPfxiqYprzg/mIHL7kZgR5u2tnMRe0n1EDnzQe3dg8619CRvCpjOU
 buHqviXiGGTOnNE2p0xvo5MDdjIExr2SDbP+i47whFnMGSHiHr4YKa5SVmr7x0LsvE
 N3wj0tU1FQ54/uXjWTHeZCh8rEbmtUwX+X+dJLK7Cgxq0ugqQx1/ZSVECav2wDLkty
 DbS7TwVF/y5bw==
Received: by keithp.com (Postfix, from userid 1000)
 id 98A9D15821A3; Fri,  5 Mar 2021 12:19:16 -0800 (PST)
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Bug 1915925
 <1915925@bugs.launchpad.net>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH  v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
In-Reply-To: <20210305135451.15427-4-alex.bennee@linaro.org>
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
Date: Fri, 05 Mar 2021 12:19:16 -0800
Message-ID: <87lfb1gxq3.fsf@keithp.com>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> I'm not sure this every worked properly and it's certainly not
> exercised by check-tcg or Peter's semihosting tests. Hoist it into
> it's own helper function and attempt to validate the results in the
> linux-user semihosting test at the least.

The patch is mostly code motion, moving the existing heapinfo stuff into
a separate function. That makes it really hard to see how you've
changed the values being returned. I'd love to see a two patch series,
one of which moves the code as-is and a second patch which fixes
whatever bugs you've found.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAmBCkkQACgkQ2yIaaQAA
ABH2vQ/9Hns9A12xQi4WE/5uRF4/KHbPczlCwwrrmCIYkllMzNQ9AtlXLSZZIDgD
dBro2yHjBzYWY0WkmgQS5qrsPSAfseWdRTmKukSHJWhxK5sSN8TMe/NvnQ2nN86Y
cCm9QHam716TF+b5mZgQjqTm4RdwHo6RWFhnlxj7M+FfUAKsLo5o9rD0+CL+WHW6
rJycd0X45M7FXVUQqfpZnbmKVzW7wFUeE4PEpIDZvtwU2KOLurYKyIXb+T6xVMdh
qgG9kaEJbYRrrKJXom62yaX+lD+/zwpuU9GUiQ73zrs2oYk+wo0XLXefW7wSDLgy
8HlIHmhplruKQJu3ly0vbqzO7o5QSGvRjsjfvKFe2DrOR5KXBH5bcGRjQ/6Xv7M2
BFh5fjkSs1fcN/LVlxZfug8xP7rsEjsjBfH8FV4j9gOp/qmMdVcWWAl/znuAJUoH
pNnVSsFQ5wVlpTRiYPplDQuzveiUBSXFfcLVnB+SgIIX4COmsI07bj+Z0exRQOqR
UUnVkgG8OUu4u877DOPWJf9v/ly9kkmwJMaJ9VPnvcioJQcxsosHCQgFN3KwI+wb
QUgUrQ0ZrR/stzzqlWjHdBPJNFYt/m0JXguKkHvzSMXYzfaf4LR3h1o6uk+q1xA6
vhYNON0fZ5QJPWGVBk0U+d9LLJxCNsUBOWX+L3ZpGL9yglVvdO4=
=GQC+
-----END PGP SIGNATURE-----
--=-=-=--

