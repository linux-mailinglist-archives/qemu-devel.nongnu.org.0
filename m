Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73198347926
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 14:00:20 +0100 (CET)
Received: from localhost ([::1]:42688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP37T-0005xG-E8
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 09:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lP351-0004ow-Nm
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 08:57:47 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:41820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lP34z-0002k5-UP
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 08:57:47 -0400
Received: by mail-ej1-x631.google.com with SMTP id u5so32696803ejn.8
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 05:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DfbwWibM90fGYygpQ0KlYt+QIrA+6O+JjidFkoEBjNM=;
 b=AvhMVIwLiX7kVYqt8aeno1B4ViFWr6QXDhB7r4z7OMZPu6wyO5OMf5p86xXnNHFP+8
 kborBgZ028AeDFAruVyRx+hCaYnqB9hotsr47i6VomghjedzFgNrGhvG0Hwbj3FWn3zd
 QyT+VBnuxN2x9rEcAYq4uJxjUEzkS2cCh3+f4n7YQfHXnWXooBDJD5im3GIaYGPYKe9P
 sMRqBrqpcv31E2jbXblarYXqSj8up+PWjC6ZCdr1Tz/kqE/q1uFQ16c7D8QMmlIcNd8p
 Ln5oVscCw67PxGmmh/i8rx0EO/SRuqN9vHQDKxeyFVesZDaKZPmEOTdMqZHQdlVk/3bn
 0zbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DfbwWibM90fGYygpQ0KlYt+QIrA+6O+JjidFkoEBjNM=;
 b=GnL42yoW4AMgIV7BycOmA1Tb7AK0eMLah6YHXIeqYcEbQvV8iBYHgM9oPoJX7J+xHU
 2o1kJqVecWIw+IdIyNZJ08kobBXWtXLZaiwcxwWo23IMxqooX0vjxFv/HCbUkDQPSHSp
 C2Fymo+7EoNW0wsK5SnogT9k3kqX0lkhAB4VLMgjFCPo4ybkYLpB7//lRGoBIKfDpwTM
 MPY1DkTARNZbxnKYNwxNMHLHSTFjdrBHIlco04v2KThYp4vaR/uhGsPbv72F2DAW8yc1
 55OYceATMito++UyQdk73dY3LY4UI2pa0cpzDNAtwrtW2EhxlTqvT0BCR0WCT3OblsVJ
 dBbg==
X-Gm-Message-State: AOAM532rG+iJYTEE8LCjX0fN2xszCs7drh3UdlZvmwD87pnUA3VoBlGH
 3xhGlZz4eozi2igTCm0AR0s=
X-Google-Smtp-Source: ABdhPJwWvBiUApdKlWGpZFDMQOcWB65Z38yyv9F8kFbWzGdWhZqOQezoUg24GOZNbisv9VYn5+AiEg==
X-Received: by 2002:a17:907:2d24:: with SMTP id
 gs36mr3578171ejc.344.1616590663608; 
 Wed, 24 Mar 2021 05:57:43 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id u13sm899863ejy.31.2021.03.24.05.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 05:57:42 -0700 (PDT)
Date: Wed, 24 Mar 2021 12:57:41 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 2/8] virtiofds: Changed allocations of iovec to GLib's
 functions
Message-ID: <YFs3RUPW81evLKTT@stefanha-x1.localdomain>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
 <20210319132527.3118-3-ma.mandourr@gmail.com>
 <YFnzsf2LgpUicPvH@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oI470wQVGmx8bzXR"
Content-Disposition: inline
In-Reply-To: <YFnzsf2LgpUicPvH@stefanha-x1.localdomain>
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=stefanha@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--oI470wQVGmx8bzXR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 01:57:05PM +0000, Stefan Hajnoczi wrote:
> On Fri, Mar 19, 2021 at 03:25:21PM +0200, Mahmoud Mandour wrote:
> > @@ -629,9 +628,6 @@ int fuse_reply_ioctl_retry(fuse_req_t req, const st=
ruct iovec *in_iov,
> > =20
> >      res =3D send_reply_iov(req, 0, iov, count);
> >  out:
> > -    free(in_fiov);
> > -    free(out_fiov);
> > -
> >      return res;
> > =20
> >  enomem:
>=20
> This hunk doesn't seem related to anything in this patch. Was it
> included accidentally?

Thanks for explaining that in_fiov/out_fiov are allocated by
fuse_ioctl_iovec_copy() earlier in this function. I missed that.

Please use Reply-All on mailing list emails so that the mailing like and
all other CC email addresses are included in the discussion.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--oI470wQVGmx8bzXR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBbN0UACgkQnKSrs4Gr
c8iPMwgAhio1yFIMROQqu+WrkONan8Z9dRon+qi1SUI1ul+wxHue2L2/RVNhg8nN
jAOeGvengmnWRGr1vZcY914rBXzCgcDl3hWho71uUpeiLBQQJqzPkv3qr2iqvPcX
7GpO1KP50Gpqy40Rmp9AL7kl0pUDyikp3cW/QdpshB58g/ks1h7w5QdkZSktDmy9
jzUeFdDmzdsHz2Le7U2qX9IXGvvh4rExVlr9RfwfZbHQG2mUcmcWD6yIsAATOZPc
JD6e7dCkOk+0qUz9bWPZQPWOklid7du0DaQjrP5TSwI2gVc2pq1sXN8GpfUgZOBB
iOVWZwZ4ZgtMhYHQDKuuD3Zooq3SYw==
=mGUx
-----END PGP SIGNATURE-----

--oI470wQVGmx8bzXR--

