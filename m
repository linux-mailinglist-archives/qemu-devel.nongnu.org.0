Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E811532F496
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 21:23:22 +0100 (CET)
Received: from localhost ([::1]:40082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIGyo-0000rR-0H
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 15:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1lIGxi-0000D9-OI; Fri, 05 Mar 2021 15:22:14 -0500
Received: from home.keithp.com ([63.227.221.253]:33084 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1lIGxh-00031b-8y; Fri, 05 Mar 2021 15:22:14 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id CEC273F2EE3F;
 Fri,  5 Mar 2021 12:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1614975730; bh=M5sx0VQLPo9KnQno/BVZlGjB4AZ0Grv+jZJBHAAIizk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KHquymD8GClsMbPNelw3JIPoMhksxqrmPUd3cbEUgNEdL8SvwlY/JD1ZFNzazbFkH
 nGIcEhPoXWyZ6EbOP3cWkaDVWQLVG+I/9ZadO8UzOcDDDVNHyVl935Z0rMlvOMWJHT
 XZIH32I5wOZip5VoMlwETXixgIeMrpD/+SfE9d5R4MKsvQL2FH6ynzko+qzDn3b13+
 ieBpebInP72NbfPvkqjdtW9aF9LnDN2CSDbo3rY8IdXfUB+Z77h9o1Oa4bg7dAGVuy
 /CZ+yxMogIIR3w52u30b0MHNAltm+Lc3v1Egi8gr5KytGNyOFmC+mkSpuCvAQG7Vh2
 PFrguVst4Dejg==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id sfMXdzvMypKq; Fri,  5 Mar 2021 12:22:10 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 569D63F2EE21;
 Fri,  5 Mar 2021 12:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1614975730; bh=M5sx0VQLPo9KnQno/BVZlGjB4AZ0Grv+jZJBHAAIizk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KHquymD8GClsMbPNelw3JIPoMhksxqrmPUd3cbEUgNEdL8SvwlY/JD1ZFNzazbFkH
 nGIcEhPoXWyZ6EbOP3cWkaDVWQLVG+I/9ZadO8UzOcDDDVNHyVl935Z0rMlvOMWJHT
 XZIH32I5wOZip5VoMlwETXixgIeMrpD/+SfE9d5R4MKsvQL2FH6ynzko+qzDn3b13+
 ieBpebInP72NbfPvkqjdtW9aF9LnDN2CSDbo3rY8IdXfUB+Z77h9o1Oa4bg7dAGVuy
 /CZ+yxMogIIR3w52u30b0MHNAltm+Lc3v1Egi8gr5KytGNyOFmC+mkSpuCvAQG7Vh2
 PFrguVst4Dejg==
Received: by keithp.com (Postfix, from userid 1000)
 id 3B7E015821A3; Fri,  5 Mar 2021 12:22:10 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Bug 1915925
 <1915925@bugs.launchpad.net>, "open list:ARM TCG CPUs"
 <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
In-Reply-To: <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
 <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
Date: Fri, 05 Mar 2021 12:22:09 -0800
Message-ID: <87im65gxla.fsf@keithp.com>
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

Peter Maydell <peter.maydell@linaro.org> writes:

> Also, you don't seem to have the correct "is the CPU in
> 32-bit or 64-bit mode" test here: you cannot rely on target_ulong
> being the right size, you must make a runtime check.

Do you mean whether a dual aarch64/arm core is in arm or aarch64 mode,
or whether an aarch64 is running a 32-bit ABI?

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAmBCkvIACgkQ2yIaaQAA
ABEd/g/+O+tWkZiYe6wLv+EJByIAwxVAQWLgzjF5jXa6TkcmyFKHj1NqpzFZTL9e
6DhGN9UOOQTw7YYjFZu/s9QDDkdXV4k5BX+ELDAWuTVdGM4tAWnakrrX+dNCmCuB
d6GEaehzDdB1Mu8KJyyKkMSFKSXV35X6fc7Mo1teqfa+cqLYPHwToreTzDpwt2MI
XFFv/Ud8NAJSncfDyvdOaDXzWU4k22uOZ9EjAkrMO/7q2ii/aSDo5x9s4LHnF58n
v1p+JhwiM/F9xkugkIh99r5OiYIP8K13MlS6VZONE/y89iNdhokG/BfKLjo9XHIu
H/GqeGoo39dr4zEnWo9C/rZ+HVjjxHHh4aGOT37UM3tMoumGL1mVXCHKNXt9if07
0KuC6tvJQpKyAcbUobLLqKxKmZWRt/+AbYBwLN0L9PRINAqjHmPkj7EUw0V0okqa
M8e4TPf13PmpmeOk1WPc39B4jdnzO4+7jkcqIHd1RSKWTH2P/tlKQC9Y4y2ypEDb
fhgCELRRKFZT7d7TCtVSHO/yYMdHuY7AmIVlb8PouGYYIVKvnrDB5t4wVGuzClcv
sf9Fn+yBUtG+MYr+KIgN1d9ZZaLFCHbBT44ZHmBQghHjvcTCa7bnttzOlph3AqPr
1WktDOc3MKFD/dTW+RInYoscou9zQZMXBttHSc57fN9Qo0Ke0Sc=
=PmUx
-----END PGP SIGNATURE-----
--=-=-=--

