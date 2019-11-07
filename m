Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB01F303C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 14:43:44 +0100 (CET)
Received: from localhost ([::1]:42634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSi4d-0001Df-6W
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 08:43:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39938)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1iSi2U-0000LT-7R
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 08:41:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1iSi2S-0007u5-6l
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 08:41:30 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35781)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1iSi2S-0007ta-08
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 08:41:28 -0500
Received: by mail-wr1-x443.google.com with SMTP id p2so3109734wro.2
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2019 05:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AsJhVLNq5Fqy4erR0lRtkQbYddjYIr18jxaCD4aqHDo=;
 b=qHq/Z11sC9XVDfhCkOSmz5Njair46O96EGW8CRGOSHukQZEpz4VOa8ijikgiIXmO/S
 5w1+lhqJOojH9Ak1iF/P5YNR6200CP8nOuK/shK34tK6PX/SFr2NZuEYh4QzRyX8cF86
 UvulQykZ9XZRYH889INroAav1b1MUFAtlMFsDaLLPHuJczuwAGDXhZE9wjYpy4L0kSNt
 z84PECCCeH5AkLFuYG8o4XCyeXN+p8zC4pRX8/5Twx+vQDN5mswNWv2bT4pYVaqHXRn5
 RiTEoV8sBitLOPyN7hzCSovcJEEmsMX/Tm2se66lqKZzs3kR4SXfpjYhcZOo/wKhorc2
 RYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AsJhVLNq5Fqy4erR0lRtkQbYddjYIr18jxaCD4aqHDo=;
 b=Wt7c+MkGOsrkLcsZuPBdAiY4wQLNVbEDYDKvXBkpzXKgyylGmTpgXZtEqrTFQD1UJF
 bbl/GDU37lRpEAxkEFEjrizWoqp14uqXoDbzmSRg2L1iVSsHnuFKFylTn5a8ztl2bd3Q
 lKDztNsIf07TWfcoC8/8+iMvOhufS1hTJsitpAEqzcbRXOYxJTc9XMaYh6T3qXT0F9aN
 A4zHr4G7RtnU9RpPUwUySdt3GZ16uzlQ9K9eDcHHgTp5X/d/w6ASPSJANocNtV1h1yRv
 8PBVZe88xUwEmF352jzcc3c5PvIZPSw7AZGuVA/DhbUhmH3fwubs+5N6GoldO6k59doh
 a/+w==
X-Gm-Message-State: APjAAAVYKs7ZVD8+4MSS5NRxAWTLKbfUQ5XOJ0dxIgz8YK9GtmdHUY2O
 u1yjnKWOBleUqYKdK7bkyTT5AHM1xG8=
X-Google-Smtp-Source: APXvYqyB/AUS/E18yyo4OWx14kEel7fP6tLRn85nKeuQ+oyOtMwA3Time0YgzUjVyxdc90qLCKnBqA==
X-Received: by 2002:adf:e389:: with SMTP id e9mr3056917wrm.285.1573134087095; 
 Thu, 07 Nov 2019 05:41:27 -0800 (PST)
Received: from localhost (77.119.131.75.wireless.dyn.drei.com. [77.119.131.75])
 by smtp.gmail.com with ESMTPSA id c9sm1376350wmb.42.2019.11.07.05.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 05:41:26 -0800 (PST)
Date: Thu, 7 Nov 2019 14:41:12 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Oleinik, Alexander" <alxndr@bu.edu>
Subject: Re: [PATCH v4 00/20] Add virtual device fuzzing support
Message-ID: <20191107134112.GG365089@stefanha-x1.localdomain>
References: <20191030144926.11873-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GUPx2O/K0ibUojHx"
Content-Disposition: inline
In-Reply-To: <20191030144926.11873-1-alxndr@bu.edu>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GUPx2O/K0ibUojHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 02:49:47PM +0000, Oleinik, Alexander wrote:
> This series adds a framework for coverage-guided fuzzing of
> virtual-devices. Fuzzing targets are based on qtest and can make use of
> the libqos abstractions.
>=20
> V4:
>  * add/transfer license headers to new files
>  * restructure the added QTestClientTransportOps struct
>  * restructure the FuzzTarget struct and fuzzer skeleton
>  * fork-based fuzzer now directly mmaps shm over the coverage bitmaps
>  * fixes to i440 and virtio-net fuzz targets
>  * undo the changes to qtest_memwrite
>  * possible to build /fuzz and /all in the same build-dir
>  * misc fixes to address V3 comments

I have finished reviewing this series.  Please fold in my Reviewed-by
tags when you send the next series.  That way I'll know which patches to
skip :).

Thanks,
Stefan

--GUPx2O/K0ibUojHx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3EHvgACgkQnKSrs4Gr
c8gARgf/bsCYW6VPs1kuE6GOSU7XxQwAkpvuiy3RpHZlMmGbvmeL6t0yPyl+pHez
JMYvuxPT0NiSQc/wdpYp+AFMdEmRZ7Zf2tjyZ8ZR05Hv4ulBV279yGIyog/t7Ws1
9vh2EiqWNCncIdh/v/2BKotoPEcTvVjAkIrOdZXqskhP7JbHLqksdqK34K8E12yG
uENMWqyOtZyJSTAGhh8gZYCwhcq6QZlE6aziN6suaKylNdp6sO2MIV0mjtIIgvxu
FPmbFcPKsIp1Fn/cG60zitnTE43PtGqTR4F/TDYj6SKO6Ke99qYJoVcrsw31wnyf
UlY186MRYRQNg4DakHGFBuklspb0Bg==
=n6nU
-----END PGP SIGNATURE-----

--GUPx2O/K0ibUojHx--

