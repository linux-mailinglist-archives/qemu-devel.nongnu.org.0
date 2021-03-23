Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEE834610D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:09:53 +0100 (CET)
Received: from localhost ([::1]:53056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhjE-0003P7-6s
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhi0-0002Je-3H
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:08:36 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhhy-000532-Gn
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:08:35 -0400
Received: by mail-ed1-x535.google.com with SMTP id j3so23563007edp.11
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BAlU3mGwo/y6iWfbKJQpXGl1++wTpqbk/i3SdoPz5mA=;
 b=qy5gyt9TGLJ18a3hsLbO9vRIzSvmrOxFVRvC9n/IznXLBjh9JwNZ9NdNGju20WSEaI
 ViZSkNkhoOSR16J4DkzUEukvt8vkyxrebWmsUUWps0sNaJLJaPsIHcRFeBn4i7v/ZZoP
 xkw54qX8pY6WSPPMI1suSDRTEEpNHi47Id+p3q+1T5tmrJ9iJE90Gl6ZUVQR+lsBOvgM
 qCRs9B1PpufK92FRVkGWAgGZUb5HdP8+zlDB3oxO8XG1r6tu5gGq6F+hAHUaZTp/xdow
 e3c8/sfwXHpfyr9aZQJUX5WCIowfUwJSZF/G3Hyx5N9CnXUOt79MqFVkt/WnNBDac8KX
 6IKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BAlU3mGwo/y6iWfbKJQpXGl1++wTpqbk/i3SdoPz5mA=;
 b=sT4xfAo2Bm5g8N77HRnfrzLllsYv9b8gmOyex/xjlrhChJZ9Yc1lUuVxO4a0akezWd
 FRlQ3CPM2675WnvQ1vWfdlWeLbV1F90scEytO9USawcil1dY5J68iCLoV9E0QSxiK9iE
 awXovFaa7A0O8dw1DSRSarTO5X6AKTGb2zriBzz9Q0LordBzU2DkJJwLgIMpYacoQGmG
 P6i0dEz6OHountl8OS7Ku9OxYOEoCS4vAmoFjI8ApYE2zdD1A783hwA7d0Kaoz67L0sJ
 YWq7IzZ22jNKCfncaq7D6V0a2IAAcDyIzVbzRPqy45oJRP3qq+RiThWPbpoY1xzpLGFC
 gw5Q==
X-Gm-Message-State: AOAM5310FDqLYbWKhWNBUw/elkvYaq11rgoI2R8bAZ91VAxAOGIulZPx
 IsWgCrzGwe2aa3gDFHDvcy6Trmsnxow=
X-Google-Smtp-Source: ABdhPJw+ciL7cmJJvvPDOAuG3d9oKTIIexDXjPCj0I3OFNnu03zdVSS3N2kKaKm7RAZBEt5TeUZFVA==
X-Received: by 2002:a05:6402:4386:: with SMTP id
 o6mr5009976edc.307.1616508513195; 
 Tue, 23 Mar 2021 07:08:33 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id ho11sm10701842ejc.112.2021.03.23.07.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:08:32 -0700 (PDT)
Date: Tue, 23 Mar 2021 14:08:31 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 4/8] virtiofsd: Changed allocations of fuse_session to
 GLib's functions
Message-ID: <YFn2XzInzDn4uBOe@stefanha-x1.localdomain>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
 <20210319132527.3118-5-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yn5im3BUF7r4A9jc"
Content-Disposition: inline
In-Reply-To: <20210319132527.3118-5-ma.mandourr@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=stefanha@gmail.com; helo=mail-ed1-x535.google.com
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


--yn5im3BUF7r4A9jc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 03:25:23PM +0200, Mahmoud Mandour wrote:
> Replaced the allocation and deallocation of fuse_session structs
> from calloc() and free() calls to g_new0() and g_free().
>=20
> Removed the NULL-check and used g_new0() mainly because fuse_session
> creation is critical and an exit will occur anyway if fuse_session
> allocation failed.
>=20
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowle=
vel.c
> index 45527ff703..b0e9ef29a7 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -2467,7 +2467,7 @@ void fuse_session_destroy(struct fuse_session *se)
>      free(se->vu_socket_path);
>      se->vu_socket_path =3D NULL;
> =20
> -    free(se);
> +    g_free(se);
>  }
> =20
> =20
> @@ -2490,11 +2490,7 @@ struct fuse_session *fuse_session_new(struct fuse_=
args *args,
>          return NULL;
>      }
> =20
> -    se =3D (struct fuse_session *)calloc(1, sizeof(struct fuse_session));
> -    if (se =3D=3D NULL) {
> -        fuse_log(FUSE_LOG_ERR, "fuse: failed to allocate fuse object\n");
> -        goto out1;
> -    }
> +    se =3D g_new0(struct fuse_session, 1);

Exiting with a virtiofsd log message is preferrable to aborting inside
g_new0(). abort(3) is good when you need a coredump to investigate the
problem. Here that doesn't seem appropriate. Please don't remove this
error handling code.

Stefan

--yn5im3BUF7r4A9jc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZ9l8ACgkQnKSrs4Gr
c8iS+QgAtT7mLjmI5BWAFNrE8VwvAscGvjjt3OI5RD3ZtxNnZz+pltq8Jhd6CwUy
06XFHZVLFbohzhX5JOi49fZ2ei0Em2fLvWoRsu9ncLM30xAebaPIyo+WSK1NSolH
E0NTXdXxk0t96P7pAYOExNEmk0Ve9hz2SY4qxxnQ4RGAq3LAX0FbFi15AW6HPpAR
OOYf9HU+UHbkT56AMJ6EN6HV7r4xCcpyOGKTpN7iAoSJ5h2v4MCoH3Kum9MdPOCV
XdP2un/3dpLkP5KUegCpP1JGdJXE/ujcINaabhizRJXPRUiUQZaFzpAk7mb52URH
B/6CuwRRVjIC25icbgV/aPOAnVqKVQ==
=HxkU
-----END PGP SIGNATURE-----

--yn5im3BUF7r4A9jc--

