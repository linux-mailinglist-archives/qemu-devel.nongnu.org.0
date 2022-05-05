Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF9951BD5B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:39:42 +0200 (CEST)
Received: from localhost ([::1]:51236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYtZ-0003XH-BM
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nmYQ5-0002yA-DH
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:09:13 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:35700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nmYQ3-0000wU-PR
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:09:13 -0400
Received: by mail-qt1-x833.google.com with SMTP id x22so2782942qto.2
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 03:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fD5jxrIybWBsKC1Iicg56F3Xcz5vfHVNKwjKem7FXEI=;
 b=QA1PTl7MxnDYYbgH6Gkk+YtYu/Bz+hs3rUdEMeQ8railO20uxctb7nK01YTgWKw+Cv
 O0EhodVItlwIEX+RRHtfX5JpU5eDCAYBE/2f24tedSOcsSGee3ANipmtG1q8wA6dfCBf
 TJbPSJCDP+7hL8IrCcgHcs07DxJEqm3eSXUhfSn+nx8GmasITxMtZYLptAMGfHGTKihu
 xOvX8i9Qp3WMAMyJoZBUR+8PLMSjFmCJjEwMjksDhxp5oh+nVq4jnR8EyYrHSLN+38Iq
 RUhqSRF43WZoTxjfLsnu2zkVXj07lx86YVbHF5iER4bE+BCT/ik7pHTSuadYSLZIGQ7M
 yfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fD5jxrIybWBsKC1Iicg56F3Xcz5vfHVNKwjKem7FXEI=;
 b=5Hv8oFLTDdzKsrGGANeyR+0RHKXgwarfj9IcScSZXrTZ0X0yHMBt4/Uv0yl/rQpn5+
 QAdqq2unwIcHlsC65qYTeGR6vpu5Bs8dbWZOnCYvMl5sb+krWNHHqeIUOphfXGEyrYkX
 aSjL508RgiVVff390SwTAZENXKEQYFCuualBCzAnBpNLYDMl6j0reJbfzw4UVhN0zMkj
 9gBadcMIs4N8og1O7ygJjG8g1WLGlvgs2glnUtmo5obfkzYO0ojJiP9EZCvHx2pBIquM
 mKRX3+tXpigX1YSUvm2fTGOYHgkR2io9ErETSiaVI+jhU1M9zYEUBojIeUFKXZdI9f9A
 rJLg==
X-Gm-Message-State: AOAM533BQhoPOhO+Bqn/0mZb718PnpOH1qLlPRGSmvAAJvavsFbPPg2N
 L90LLEdUGaZSmmx+9fQCBlw=
X-Google-Smtp-Source: ABdhPJyOcEn4vDW/zjKgrHkve1xUOSwhktjqEQemjabutnymxSli5/POD2drzOXj93L/MSjZ1G910g==
X-Received: by 2002:ac8:5f0c:0:b0:2f3:abd0:2c9a with SMTP id
 x12-20020ac85f0c000000b002f3abd02c9amr14272039qta.50.1651745350628; 
 Thu, 05 May 2022 03:09:10 -0700 (PDT)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id
 u126-20020ae9d884000000b0069ffe63228fsm536728qkf.121.2022.05.05.03.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 03:09:10 -0700 (PDT)
Date: Thu, 5 May 2022 11:09:08 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: longpeng2@huawei.com, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>
Subject: Re: Fio regression caused by f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94
Message-ID: <YnOiRPrLkfjoPbU+@stefanha-x1.localdomain>
References: <35dd4da8-5278-767e-4193-ccf53e836969@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TP8Df2BE8mL3W14l"
Content-Disposition: inline
In-Reply-To: <35dd4da8-5278-767e-4193-ccf53e836969@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=stefanha@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TP8Df2BE8mL3W14l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2022 at 09:43:15AM +0200, Luk=C3=A1=C5=A1 Doktor wrote:
> Hello Mike, Paolo, others,
>=20
> in my perf pipeline I noticed a regression bisected to the f9fc8932b11f3b=
cf2a2626f567cb6fdd36a33a94 - "thread-posix: remove the posix semaphore supp=
ort" commit and I'd like to ask you to verify it might have caused that and=
 eventually consider fixing it. The regression is visible, reproducible and=
 clearly bisectable to this commit with the following 2 scenarios:

I can't parse the commit message for
f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94, so it's not 100% clear to me
why it was necessary to remove sem_*() calls.

util/thread-pool.c uses qemu_sem_*() to notify worker threads when work
becomes available. It makes sense that this operation is
performance-critical and that's why the benchmark regressed.

Maybe thread-pool.c can use qemu_cond_*() instead of qemu_sem_*(). That
avoids the extra mutex (we already have pool->lock) and counter (we
already have pool->request_list)?

>=20
> 1. fio write 4KiB using the nbd ioengine on localhost
> 2. fio read 4KiB using #cpu jobs and iodepth=3D8 on a rotational disk usi=
ng qcow2 image and default virt-install=20
>=20
>     <disk type=3D"file" device=3D"disk">
>       <driver name=3D"qemu" type=3D"qcow2"/>
>       <source file=3D"/var/lib/libvirt/images/RHEL-8.4.0-20210503.1-virtl=
ab506.DefaultLibvirt0.qcow2"/>
>       <target dev=3D"vda" bus=3D"virtio"/>
>     </disk>
>=20
> but smaller regressions can be seen under other scenarios as well since t=
his commit. You can find the report from bisections here:
>=20
> https://ldoktor.github.io/tmp/RedHat-virtlab506/v7.0.0/RedHat-virtlab506-=
f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94-RHEL-8.4.0-20210503.1-1.html
> https://ldoktor.github.io/tmp/RedHat-virtlab506/v7.0.0/RedHat-virtlab506-=
f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94-RHEL-8.4.0-20210503.1-2.html
>=20
> Regards,
> Luk=C3=A1=C5=A1






--TP8Df2BE8mL3W14l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJzokMACgkQnKSrs4Gr
c8iVswf3TKfi+E/ytWna+RRAvQ4V21+rqb6oNT+I483HB19hqIDu4Aqmo2n8miuZ
nHBz87nZaIXw9E9Xj00zEbzFHBqTdaa0OKIezQ+PYb1khGp2KJG7vKVXyyvOYMrr
Cl/emxhMDpuabOyvTqfo+llOyonRrj5r8U9IJ2XT77m+wEK7qWhDCEWOk2q/9H/W
PiEeYdy3v0gEeDLdYeddTcEMGKwet+o5H5/x6HIuhHhjRCG3S7gCWT+umFODwvDj
vvwdLwuOkzvIPPT830yQxGkm5ciLowE6w31zVv5+hK1UHHG0uL4SXmiOgf4xR0V6
2WbNsyV229G+efEIIAsctEA0R9Z6
=c30G
-----END PGP SIGNATURE-----

--TP8Df2BE8mL3W14l--

