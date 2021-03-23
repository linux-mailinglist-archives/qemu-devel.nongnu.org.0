Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69060346109
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:09:11 +0100 (CET)
Received: from localhost ([::1]:51608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhiY-0002dz-97
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhWz-00053I-0C
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:57:13 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:38687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhWx-0006sL-EI
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:57:12 -0400
Received: by mail-ed1-x52e.google.com with SMTP id h13so23554980eds.5
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 06:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8vlUTc5eal3f+9qZr2Xy/UI1YCkidsEeQI0CqOMP2d0=;
 b=EaMzaBdgN65Q98MjGPFilFB8iRN/RW3iIkOxnV5cWrzSZFM+T+3+PRUnRe+pRtE6u+
 wPetHxdgk/pvM+hOupogWbd+ETVSoZdvx55XUy8DU0K922iqhRg4rjAfIzEcv5xvxvPn
 Oa6jcrB0gL/OgIRsd01jN156ptA3L6c1iapk4iu7pHgSDx0b+BI4GNMzaxcHaJibD1cH
 UhtZXbgog2boJ4wMg4izBj/BMPrFRzVS0iCtRN1YGmbFuSja5aDqGX9ZDES3Ig1slJiz
 jj7/6RdNbS94ytU7w7otDy7zWiRkecQCReSZjBIMRSBwfkiFeLTbF5kRXpPCAJeS9v0t
 aThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8vlUTc5eal3f+9qZr2Xy/UI1YCkidsEeQI0CqOMP2d0=;
 b=Z2PyMhG6PwevAsdSfsGtUfZsOZB0U9KuugTCB+49QjuUQJZQ1+FNyPhMso3mUuljsx
 JMIp/m4+YcHu58f/uSZyH/7p0zlOu4ofeNoDwgrIY37giGnJVVOlqLPMRmOqn6EnLd+v
 iNmaxF+Lb9L0CXOB8s1rWVJNppEwfSmPuZxu9JzMb76l0McKULgK6flZkSqG5lyZO2JU
 DXt2FkILh5JdtA6k+iox0syqUcL5jYCpeZbJOtJQJ/C7+hAt8n+I9r3lL6AoDRig0q6C
 WnzNpWk+qHjivF1z8O4rHup6t+lePnEtdrgmXTVxTAoG6l35gSg2/WOzWCImxH0LMq56
 TFdw==
X-Gm-Message-State: AOAM533sIi0NsQUa14Hx3KqUarSxnoXVXBlHJmkvofxCVDbjLK7dp405
 hQRFNZ4Q5ghaIffl0L6Qnjs=
X-Google-Smtp-Source: ABdhPJzL991WLk96nI5SQdZ9GAW9CBcqvhPV5LFFIRWskVKWtEOepD/z+8c+G055VakP5KOKv8d0Vg==
X-Received: by 2002:aa7:c353:: with SMTP id j19mr4671352edr.263.1616507827298; 
 Tue, 23 Mar 2021 06:57:07 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id u1sm12630289edv.90.2021.03.23.06.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 06:57:06 -0700 (PDT)
Date: Tue, 23 Mar 2021 13:57:05 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 2/8] virtiofds: Changed allocations of iovec to GLib's
 functions
Message-ID: <YFnzsf2LgpUicPvH@stefanha-x1.localdomain>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
 <20210319132527.3118-3-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ka7t5sA5XkRDPfkM"
Content-Disposition: inline
In-Reply-To: <20210319132527.3118-3-ma.mandourr@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=stefanha@gmail.com; helo=mail-ed1-x52e.google.com
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


--Ka7t5sA5XkRDPfkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 03:25:21PM +0200, Mahmoud Mandour wrote:
> @@ -629,9 +628,6 @@ int fuse_reply_ioctl_retry(fuse_req_t req, const stru=
ct iovec *in_iov,
> =20
>      res =3D send_reply_iov(req, 0, iov, count);
>  out:
> -    free(in_fiov);
> -    free(out_fiov);
> -
>      return res;
> =20
>  enomem:

This hunk doesn't seem related to anything in this patch. Was it
included accidentally?

--Ka7t5sA5XkRDPfkM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZ87EACgkQnKSrs4Gr
c8hv3Af/YPMzWIAbOQxECnn5XpvU+1PN98VexaIjangjiFgeoDmKfO88b/XTe7po
M2OHTCcoS3dcuMWYzbggD9qb8pPdSVfOOY6momzSxu8l0L4mVqHAm1nImsELpbw6
LWTTGL24XQ8Nlv3Job/LAt6fenSSRJ+XXF1Cp8qnz61FRMKTWHrIzpUDIHHI/Wl6
OW6O5djXXRwiwYAfVj+vxZQLcrnXa8eHIpSbKL+IFMBkPuJtuwEw+se1nbFffzLW
pMFOR3X6XaJWZJXLFvkR99XrZikh1qkXkQ/QEEPtIHVByTrHEz/homAqiB3QP+Wb
3cOFXt7dj8zESkie8Ml1i4xin4ua1Q==
=k4V2
-----END PGP SIGNATURE-----

--Ka7t5sA5XkRDPfkM--

