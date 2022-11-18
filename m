Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADD962EE16
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:04:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovvPl-00051Z-6F; Fri, 18 Nov 2022 02:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovvPU-0004z0-1E; Fri, 18 Nov 2022 02:03:36 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovvPS-00028w-Dm; Fri, 18 Nov 2022 02:03:35 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3584B320093B;
 Fri, 18 Nov 2022 02:03:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 18 Nov 2022 02:03:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668755010; x=1668841410; bh=t4
 CYS867Y54dw7SE6SvcxTormCMu2cUkclXRCvy8QQ0=; b=ho0uixtPsddKatKe06
 O3GgSqAphVJzGjIO1+6vfonwVZNfk/djiGwjg8efH+TXyPowcme2Hqe/SZQvK8M9
 U8NkSgfYRk3bWMhq9i1GuduvRbZiKYnwYwr0CIG3EaoQq8xMNa20wOV8NcCo8K3V
 JNVZoeljvISY0XN8YGb6mmZ4oQuFngBy+0ms7MR1YG5fdWtaNzp+eOzvqwNDrvj4
 MKbP0y0gxmQgBv9x2iVhmWsyOLOGZJdq5sOwbx4cqlkwK1KmSOzWOTcj1wFKF3Ex
 GPuwvPZ0yIZRMVLWoRNp/M+nd4sUYOGshomBgL95MLUYeHvniK8naYuiUQM1lUub
 PEeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668755010; x=1668841410; bh=t4CYS867Y54dw7SE6SvcxTormCMu
 2cUkclXRCvy8QQ0=; b=bvUHIyYbUGwZKfFRnrYznBoLTach96UwoXASGFekF8Qi
 tn1dVwIGF7AeQrD2n511Z3I5OZ9yqEp4dV/i/6eOYNve4+bej91THkXBMtffZVAT
 rkb1nbN4/VWtviGW8GUQB96PDxfYEK/Un2T4wSEbIBKoGNmL4+v2iKv5dHxZR0YO
 dyIphe9MPGhFEHXEThLCXTg8lFV53+FT2NeNc/ewgmADSuGexV4Py7TGzWYPG0N7
 3qgA312pYpQJlgXzTgnoyCpiAJiTBTgSCbRufqxBr3bL26vdA8DJwIWM0cD/UiRp
 6MA5mTxgS5jxcGtWH+1i7jMlyWfMsYyyMDsr/fOTmQ==
X-ME-Sender: <xms:Qi53Y3_n88ngH_lMwGyI58LzGhRpiNV2HrwtLXXus5msWVZqO3U2Ww>
 <xme:Qi53YzvH3_HR3scD05uJYykDUiAHmb6FD0rObkyFML5kSybydA_cHKSY8NtDibzBO
 IS5jSHKDIH1ANLQXO8>
X-ME-Received: <xmr:Qi53Y1AuC9XI86BohDZTlw9XxcnuXu8B9OU3R7IhBdqSIHdUzMETcqOF6ixFvBPCoIkBrP0Hx40dnIWB6KOQILUKlmV8PQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeelgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Qi53YzcEAhhUTl_ABN4_rNVtIohdHu7P1w7E2Q4Ak2jWwJFooOwjPA>
 <xmx:Qi53Y8P5nNlAysJJELSrgUj4kzgPsQoYqVPMqq8Nn95HvPp6d6mwuQ>
 <xmx:Qi53Y1km5op3wYIIZROiTR3ykmuhi7QcemWXA9a60Rr-ATtxh4Vp3Q>
 <xmx:Qi53Y4mM8ZZMRaMjbsL-ADajj2M6FcNbYuX6b-XUeVtD205KzZg68w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Nov 2022 02:03:28 -0500 (EST)
Date: Fri, 18 Nov 2022 08:03:26 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Keith Busch <kbusch@kernel.org>, Corey Minyard <cminyard@mvista.com>,
 Peter Delevoryas <peter@pjd.dev>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>
Subject: Re: [PATCH RFC 2/3] hw/i2c: add mctp core
Message-ID: <Y3cuPrJQMBHuDYxG@cormorant.local>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-3-its@irrelevant.dk>
 <d8a8549c6fc29650131046ee00b7968ebedf886b.camel@codeconstruct.com.au>
 <be1a8590ee2f06d159987c45f85b4552695f8ed1.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ykwJR3w6uZWZ7KF9"
Content-Disposition: inline
In-Reply-To: <be1a8590ee2f06d159987c45f85b4552695f8ed1.camel@codeconstruct.com.au>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--ykwJR3w6uZWZ7KF9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 18 14:15, Jeremy Kerr wrote:
> Hi Klaus,
>=20
> > With those changes, I can get control protocol going, and multi-
> > packet messages work.
>=20
> Ah, I also needed a change to the aspeed I2C driver, as I'm seeing
> the interrupt handler being invoked with both a stop and a start event
> pending.
>=20

I had to reverse the target mode functionality in QEMU from the linux
driver, so I am really not too sure if having START and STOP set in the
interrupt register is allowed behavior or not (or if we are doing
something wrong in the target mode implementation). I guess thats a
question for Aspeed I2C maintainers (here and on lkml).

--ykwJR3w6uZWZ7KF9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmN3Lj4ACgkQTeGvMW1P
DekSewgAsu3srbmXMnR0J+ln6BWk8ubEmdRUUzfRJwx5Y8FWDtDEpi0fJ2Yhsl+H
p4LIhWzoq0SkiQ1kwPxJZX6Wc1ouP4S4G+LM3GNbdcPeenXhZmNiJHmZoDhusPfi
3rZazzuUFa0aURXOzdmVyftzwQjiBL1jblyeVu/LUs3UmJAWmbAU8aa7quX/QHl1
BsO/vfbN58dbWFvVa3tPn3VoBXXbAi6BduGVr6ch8sfXtbfra+RVL5bHb+rRaIaI
3HGZ0ErF/CD3w7H7JtDDrErQPht3zfoM8OiSi7hgVVqpAR07JTg7mfkmuryrAjKx
qkB2zYFP2Qrxu/K1naPXaSi6xOiNoQ==
=LL5v
-----END PGP SIGNATURE-----

--ykwJR3w6uZWZ7KF9--

