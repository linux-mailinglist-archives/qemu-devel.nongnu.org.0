Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DE53460B6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:59:41 +0100 (CET)
Received: from localhost ([::1]:59012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhZM-00078n-IW
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhOk-0007P0-5O
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:48:42 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhOi-00026R-8T
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:48:41 -0400
Received: by mail-ej1-x629.google.com with SMTP id k10so27232064ejg.0
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 06:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Cu4gNeljJNZPJnYxrL7Ez1IgusXciF8OOv/fem1tz8g=;
 b=DlzusCYmS2bQAjr1r2u+5FxYGHExJDNxs8FVqUdm4nmlw87LtxVCpepiCjVd2F9ell
 RNLm9x9nfrGzerVjFVkr94gtQD8pJlf9gxJj62TDFgsHZE0ECkdoZIIogrQHLHnQi1jL
 exrXF7IL5+5kPWKPYuvNRlV9Fk+095GtVNKB7rONzIhUvfwXCRZjweAJvs+VlV3+WXZw
 5FEvqnMJX1in0ZWzpcKkvM0hMPs7flmlk8i4Ib2R5L6qdA443YsEwCf888vQSDS6jNIc
 1piOVhMJ6c95xHhL6D9lNBXi2d+FDI/Lgur1Bbc82ms/B/dDJPdylDWN0CJOE+JRZbFX
 8JDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cu4gNeljJNZPJnYxrL7Ez1IgusXciF8OOv/fem1tz8g=;
 b=tv7Eovjan48NDw8ac0SvcwucQ3vgQMc05+ULvq9eyZYTQugULLHccyb110I6ggLoiU
 tMXRtTstakeqBu8RfWqYmrceX0is8GtTseQU4wwWxwuPNvNY/zjAlGW9j6j6sbWhA9BQ
 Qtm3iZAGiWrihPj50/UmIRQnktSPKtMT7Qp+BjEOttnj+1rroHrYQ5OOwRoKDdhT8Ud7
 lhDtX8Ej1WrcRTsAMt1r7aUGUvhtYGhvc6UjnbVgi0Es7IuSM58PraESBu6zBiPvgFpN
 9J6TQp3rSFhsNK6ZUS0Jfwc2OHfYjaBa25aDxbgpoEahGbqKceeRflMfT4atzxBr1+Bj
 zhEg==
X-Gm-Message-State: AOAM531IErx+fUlfwKR/+oTTndeKiGP3E2pVy4ETZPRSP4mOfuiSf2Zi
 HEedrWIMmySvKDE1CVRCokk=
X-Google-Smtp-Source: ABdhPJyOCZ7JOuxfuTSoFiHRsWykSXQye3atKGG7TD48FXWUbTl5NqZ5tKz+0CHMhNZjWzVbn8dJUQ==
X-Received: by 2002:a17:906:f56:: with SMTP id
 h22mr5108845ejj.494.1616507318254; 
 Tue, 23 Mar 2021 06:48:38 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id l10sm13037232edr.87.2021.03.23.06.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 06:48:37 -0700 (PDT)
Date: Tue, 23 Mar 2021 13:48:36 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 1/8] virtiofsd: Changed allocations of fuse_req to GLib
 functions
Message-ID: <YFnxtBX0rMZXS/6a@stefanha-x1.localdomain>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
 <20210319132527.3118-2-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="puxW8m2fmw26eGpL"
Content-Disposition: inline
In-Reply-To: <20210319132527.3118-2-ma.mandourr@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=stefanha@gmail.com; helo=mail-ej1-x629.google.com
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


--puxW8m2fmw26eGpL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 03:25:20PM +0200, Mahmoud Mandour wrote:
> Replaced the allocation and deallocation of fuse_req structs
> using calloc()/free() call pairs to a GLib's g_try_new0()
> and g_free().
>=20
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--puxW8m2fmw26eGpL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZ8bQACgkQnKSrs4Gr
c8gFJAf/XIfWx0Jr+fOPL6DKSUE7Gln/Ebj7yDhrxThlY2EbW5lCf2bHSk2WtXDR
Al3xywodBVsCPB+JyTc844Isdudw4ZOwNv1+br9tu3TK4LzzfzTaZivCs6frLFOu
bmvNzF8fTF4RgpVRXGhpAlJXkijyfnxKV1qZe00Nz3LxPhsIyX7AmoTIs8OTj5OZ
L1Xjb+5gT020faU/lc68QxtDiMhjxPqCrnj7Pi9W1kkv5BwkdhpjO5uIA4mMnDf5
9kaK97nEeqrIJmq7Hn0NsrSyhp7CoRslpoeQCQI92Yx1Fd/tJq9Iut4Y2xHevOHQ
mSLeDvgVcK7QCUaWpen0Pqk6ReiWZA==
=5B3k
-----END PGP SIGNATURE-----

--puxW8m2fmw26eGpL--

