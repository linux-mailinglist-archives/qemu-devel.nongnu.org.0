Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6484634611D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:13:14 +0100 (CET)
Received: from localhost ([::1]:60650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhmT-0007TK-FD
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhdj-00068X-9U
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:04:11 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhdZ-0002Je-SJ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:04:11 -0400
Received: by mail-ed1-x534.google.com with SMTP id b16so23607288eds.7
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qAeRx3lRMtEg+y3BGCy9iyyDk8R18duBq7PKoMd/oT4=;
 b=u1FuOquWOCmxqJq2QnESKy+ytQQJrgTJUPxNUpidM5bAyHlLMwRE51S+4nDSQpPpO2
 2vcRCAS9nSm3GHG/ntMozUFJKFEcQwhcHOHfRQr1mbCUWgnLfe8cFtcS3Nyd2p+uYokl
 OQYuUGMrSnlIPjupT+PUWXBqi0g85Pu0zGPmd7eg12B1w8Bi9mS8Ic1utnx53+fEyAH/
 18q3mVnj2efO9023LAjVoq/9vxyVoLqPY4Gnu11ZyL42YbGF95sC8bVcs0YzSLhH8gXy
 p74h/DW+ck4GWCSHbxn1uoi0ek7KeXpR6+ikAK5BNOznuqONiaXii0PqHf1AmX7MXmN9
 5wRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qAeRx3lRMtEg+y3BGCy9iyyDk8R18duBq7PKoMd/oT4=;
 b=Yga8awlwqrs6MCxZziK7tRpyDlqVUqKMxPKVP3fJ4C1QBMl6FrSaPXNRCjhYUcBBe+
 IJc7CSXJxcvvDnL2OtWd61KBm7ox2/ro0Uux5K69x5F/K1QAnXeTX5wNPPxfIknfMysQ
 d2fcSoM5Hr0pggK4j6IbsyeanywtchNqJkV7wUp2aHB/muY5kKLWelsPIol0EvMMdG/n
 4yyEpEV5YmiYPJAfWz9TBfWOhFM52POSwxjq1CsRT7MYWYMVAJ+UJlBbjEZihNV/lipt
 YTsS9yWLUqtpxkkXPUA4LyVX86r2uA3QZP6a/aCBURXmICBH/o1oNPXbecCJrtI2Y09b
 /cGA==
X-Gm-Message-State: AOAM530InKr7MZUbi0LPo2gW732kmtMYyANUmGw+SpIsbFlycwmp1MAx
 +AAWoFDRtdav1zKWxJIODtc=
X-Google-Smtp-Source: ABdhPJyzAXOK+FZndjc/G2qdTKmBP/8keFesMNd0ekvmYlO4hgM+MbeCYLuaIEkpxlwOpkgX41ZLeA==
X-Received: by 2002:a05:6402:8c2:: with SMTP id d2mr4930609edz.4.1616508239496; 
 Tue, 23 Mar 2021 07:03:59 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id u13sm11429547ejn.59.2021.03.23.07.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:03:58 -0700 (PDT)
Date: Tue, 23 Mar 2021 14:03:57 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 3/8] virtiofsd: Changed fuse_pollhandle allocation to
 GLib's functions
Message-ID: <YFn1TZMx3mtL+EfX@stefanha-x1.localdomain>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
 <20210319132527.3118-4-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dEREV0t6vkoCjLqh"
Content-Disposition: inline
In-Reply-To: <20210319132527.3118-4-ma.mandourr@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=stefanha@gmail.com; helo=mail-ed1-x534.google.com
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dEREV0t6vkoCjLqh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 03:25:22PM +0200, Mahmoud Mandour wrote:
> Changed allocation of fuse_pollhandle structs to GLib's g_new().
>=20
> Removed the null checking as allocating such a small memory segment
> should always succeed on a healthy system. Otherwise, the system
> is already in a critical state.
>=20
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowle=
vel.c
> index 66607100f2..45527ff703 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -1755,7 +1755,7 @@ static void do_ioctl(fuse_req_t req, fuse_ino_t nod=
eid,
> =20
>  void fuse_pollhandle_destroy(struct fuse_pollhandle *ph)
>  {
> -    free(ph);
> +    g_free(ph);
>  }
> =20
>  static void do_poll(fuse_req_t req, fuse_ino_t nodeid,
> @@ -1778,11 +1778,7 @@ static void do_poll(fuse_req_t req, fuse_ino_t nod=
eid,
>          struct fuse_pollhandle *ph =3D NULL;
> =20
>          if (arg->flags & FUSE_POLL_SCHEDULE_NOTIFY) {
> -            ph =3D malloc(sizeof(struct fuse_pollhandle));
> -            if (ph =3D=3D NULL) {
> -                fuse_reply_err(req, ENOMEM);
> -                return;
> -            }
> +            ph =3D g_new(struct fuse_pollhandle, 1);

If the out-of-memory handling code is already there then I don't think
it should be removed. How have you determined that all hope is lost for
virtiofsd if this malloc fails?

By the way, this is dead code since passthrough_ll.c does not implement
the ->poll() callback. It's there because the code comes from upstream
libfuse and the idea was to leave the code relatively unmodified to make
applying future updates from libfuse easier.

Stefan

--dEREV0t6vkoCjLqh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZ9U0ACgkQnKSrs4Gr
c8hLbwf/SBtndlIf5LzKHzkeKS86APX0svQfm1H2uiYlO++n6iq9ES+mqIUaIK7T
gJYlw3LlKNY92ZkYmKpDKsoueFSLbxwwk9NS/ZbZAcXISehsJquabAWT/8DpuCs9
gaV4z4pH/TUbuYa2bziO7dz7zeHABGV0WMUJpmcPxZqCwo2dN27GCPaA6vYFVFNx
vwmT7GgUwlI7hcemkj+mPvbMkeuApmNaYWzGgOqZCRnWfRCPtg6M6Huc5sKW4Z2u
ByNUtVDacVe/FbRrO+FeJ8bVQVIxCW4bJRjDnNeW+tKDSIcLEMnpx/pY07j2Qter
6UFt26lMcSoIK901k/NRXJhtvs7QkA==
=xHQU
-----END PGP SIGNATURE-----

--dEREV0t6vkoCjLqh--

