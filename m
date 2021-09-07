Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABB54021E5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 04:18:48 +0200 (CEST)
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNQhD-0007UC-KL
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 22:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNQar-0002oh-GG; Mon, 06 Sep 2021 22:12:13 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:40549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNQap-0000us-1O; Mon, 06 Sep 2021 22:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630980726;
 bh=iOQEmnICevBFKu0J1lj6kOXjO/UFGtlfx3yyIe8G04g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pfxxFEVgO9NCR5rzTVChDJPiNf0iGmGKoXXHW5ajfSpouMcRrv0ezxrhFZ6Nzh171
 rdVgZkz23BxB/w7/zFwmVTASS54Ub6ydm1MQSBY5vjl5PNozfZRndyLsuerfpqlB/a
 u9X8pnrc7k9jNTyz9Mc005jTzsz2JRodJ/Gxq4cs=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H3TKy2JZ1z9sXk; Tue,  7 Sep 2021 12:12:06 +1000 (AEST)
Date: Tue, 7 Sep 2021 11:48:32 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 03/15] target/ppc: PMU basic cycle count for pseries TCG
Message-ID: <YTbE8LB5JwU3Yi0l@yekko>
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-4-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mYfeiiP0fUd7WY+V"
Content-Disposition: inline
In-Reply-To: <20210903203116.80628-4-danielhb413@gmail.com>
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mYfeiiP0fUd7WY+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 05:31:04PM -0300, Daniel Henrique Barboza wrote:
> This patch adds the barebones of the PMU logic by enabling cycle
> counting, done via the performance monitor counter 6. The overall logic
> goes as follows:
>=20
> - a helper is added to control the PMU state on each MMCR0 write. This
> allows for the PMU to start/stop as the frozen counter bit (MMCR0_FC)
> is cleared or set;
>=20
> - MMCR0 reg initial value is set to 0x80000000 (MMCR0_FC set) to avoid
> having to spin the PMU right at system init;
>=20
> - the intended usage is to freeze the counters by setting MMCR0_FC, do
> any additional setting of events to be counted via MMCR1 (not
> implemented yet) and enable the PMU by zeroing MMCR0_FC. Software must
> freeze counters to read the results - on the fly reading of the PMCs
> will return the starting value of each one.
>=20
> Since there will be more PMU exclusive code to be added next, put the
> PMU logic in its own helper to keep all in the same place. The name of
> the new helper file, power8_pmu.c, is an indicative that the PMU logic
> has been tested with the IBM POWER chip family, POWER8 being the oldest
> version tested. This doesn't mean that this PMU logic will break with
> any other PPC64 chip that implements Book3s, but since we can't assert
> that this PMU will work with all available Book3s emulated processors
> we're choosing to be explicit.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

LGTM, except for one nit:
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +
> +static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
> +                              uint64_t time_delta)
> +{
> +    /*
> +     * The pseries and pvn clock runs at 1Ghz, meaning that

s/pvn/pnv/ ?


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mYfeiiP0fUd7WY+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE2xPAACgkQbDjKyiDZ
s5L6Eg//X6nLqr8F1mLAyQ42cuXtjllO/eciWgGBbr3Vcj5czg2J5RMsfbiWkTBN
AXLUniApvv4yWNawqufFY4YOGFdF+eCWIVbEHwVHH6eO64GvsnwgUh15bN+HVNCG
Cb5vVLqaWI8eSUf/JpnjBVPJnKqujHfsTnIGORJxGG1s7flXt9mdHqChutyhdCGR
mOdPKIdsGMU8Mz3bVDS5/8mOBQVeth5Pc+DMPzjHmU5IFadOlZELmq1oFb3nA6+p
IndnhqjTwk8EdNsYwfpS3J+TAq6/xKwEsFzhpBRhlW5YSQPansDqYe6TihYHLHz4
5R0PHIbFAtInGKPECvVZiw5QkoT5KL2taWSKQK//sIOSzBQsrW/bLe51TqJjP7Zw
rolR6H03TuEhU0/4vWTs6thUDXuDyqXqjtsW4ToskBqXS1zeSia7+vtnBcT4Gb63
tNi6kgaG/KtTU/XePtfx4o6M7BEIr6KUjNXSadl+MPoUPxWl9RQ6Ea7BhEeDApDF
SgKzc1587AEAlYAy2dQ50YxM/mEaMioLp4VfHPiK9UjBYKwT591ju7jgjbBKIl3P
9ISCtEkQ5id+1UBHAwGabkU5rJCHhXeTR8tct+cTyIr518gR9jvGUckL9dI2HYKD
7m+yn398C+VYLHMNHl8IvFXj7Du+M7elefwOv2N8CuYusEeqDIQ=
=Shdn
-----END PGP SIGNATURE-----

--mYfeiiP0fUd7WY+V--

