Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D85732F701
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 00:57:53 +0100 (CET)
Received: from localhost ([::1]:33170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIKKO-0001Mq-Hy
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 18:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1lIKHD-00076O-FE; Fri, 05 Mar 2021 18:54:35 -0500
Received: from home.keithp.com ([63.227.221.253]:34272 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1lIKHB-0005uL-08; Fri, 05 Mar 2021 18:54:35 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id C33843F2EE40;
 Fri,  5 Mar 2021 15:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1614988469; bh=kQYl8htm6EDnpEk43q6P1gZCrhFnVFNXjZmsmKnliDI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=I5TQWJeR+YjGYdBD3tfqIaHyfGvkhyrCLXLfvrCmsZWSeV90cI3Z1GyNOa6pDvVoh
 o48mVgYTOqLzMB3QwyOqR4TgHB/AdkmczvC7iteI7WilGvOVdFSM4Lhj1vt041bXLS
 76Ir7O62nIT6hZRkwARHTGjgh1kulrW8JF4IQV4N65LwsBSxCh3WAR1B9iImoek6Iy
 LwOxJRq61tVaUJV2+/xPoi0H1bibH6SWXhR1kuL/1N/GIZD8odPADFI8FXT8RLCF86
 RSIobeiNr/kMlpd7dt1f1wN5ZI0HPba8IqVKdhSiiEWSJvVff3YtNTE7rGI9KVvfqO
 8plFVl4asxcpA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id vAsnTAh4Cqzo; Fri,  5 Mar 2021 15:54:29 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 7451E3F2EE3F;
 Fri,  5 Mar 2021 15:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1614988469; bh=kQYl8htm6EDnpEk43q6P1gZCrhFnVFNXjZmsmKnliDI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=I5TQWJeR+YjGYdBD3tfqIaHyfGvkhyrCLXLfvrCmsZWSeV90cI3Z1GyNOa6pDvVoh
 o48mVgYTOqLzMB3QwyOqR4TgHB/AdkmczvC7iteI7WilGvOVdFSM4Lhj1vt041bXLS
 76Ir7O62nIT6hZRkwARHTGjgh1kulrW8JF4IQV4N65LwsBSxCh3WAR1B9iImoek6Iy
 LwOxJRq61tVaUJV2+/xPoi0H1bibH6SWXhR1kuL/1N/GIZD8odPADFI8FXT8RLCF86
 RSIobeiNr/kMlpd7dt1f1wN5ZI0HPba8IqVKdhSiiEWSJvVff3YtNTE7rGI9KVvfqO
 8plFVl4asxcpA==
Received: by keithp.com (Postfix, from userid 1000)
 id 39A0115821A3; Fri,  5 Mar 2021 15:54:29 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, Bug 1915925 <1915925@bugs.launchpad.net>, "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
In-Reply-To: <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
 <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
 <87im65gxla.fsf@keithp.com>
 <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
Date: Fri, 05 Mar 2021 15:54:28 -0800
Message-ID: <877dmlgnrf.fsf@keithp.com>
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

> For semihosting for Arm what matters is "what state is the core
> in at the point where it makes the semihosting SVC/HLT/etc insn?".

Ok, that means we *aren't* talking about -mabi=3Dilp32, which is good --
in my current picolibc implementation, the semihosting code uses a pure
64-bit interface for aarch64 targets, even when using ilp32 ABI.

> How does RISCV specify it?

Because the ISA is identical between 64- and 32- bit (and 128-bit)
execution modes, the only difference between the two is the Machine XLEN
value which encodes the native base integer ISA width. You switch modes
by modifying this value.

I don't know of any implementation in hardware or software that supports
modifying this value. I'm not sure we need to support this in the
semihosting code for qemu as I'm pretty sure getting qemu to support
dynamic XLEN values would be a large project (a project which I don't
personally feel would offer much value).

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAmBCxLQACgkQ2yIaaQAA
ABFHExAAnbnZUxZUu0+MzkWHrqiM5ddgv6bMmaklL47A1Jd/z2s/NOFqbqbMtfPY
lQeT9FZE5d23vOEGAY3/5LrK59vN1LXsr1/8IRkGd1/607rs3qEGICeFaqSxbZ8d
ixcE3ip7fVI6E2km7zVY6NWBHt8ungsv6ASMGjPGM8ekJMwSG3DvD61tW1bLhfPR
BzdOURsksPix9z7Gr8WnU/JqBsAohhAZ/h8/lc4UFF2qwvCpaiabrm1ww9cvcnxY
v2JRNv0NxIHtvTywz/UVXD9qpq/av2L/GRsym6exl/zph8svdS4R5UeIAYnsLxPz
f1spoWwb1sltd9CP++RFpXr0JsKc6X7Zgx/WZmvyA2iVYYncSVZkzhjlS74hfZ2Z
iCvQ716Z2Vq6Vn8/yNhwWEd1y/Qi+CxHHLYGuPvWCGbM4dXiUlMmSb0GeIEJP5EX
4rlz5jkaYzjHIGZW3rdIABIWVWiE1LO9sFhcC24y68gNEUt7tRRaUeGtXKDdiP11
bVosRxdZ5BD2Ra6g8A7D4WrdcwrmxbokGuxlEZpabj5ovstb9MwmQ0M/IgD0cO4e
ZXVE2ai0yq8hscCm+QeKX9ptTFfxHw849dvcjuPxnGSMozYuE3P1OEn/iCRb7gCb
vsx23/Wf34VDv+oNvbuwnCLfqNS7LumCr3PGypZiZuSyWkJwxoU=
=Ck89
-----END PGP SIGNATURE-----
--=-=-=--

