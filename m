Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F82F3D902F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 16:15:24 +0200 (CEST)
Received: from localhost ([::1]:59472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8kLD-0003TF-BI
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 10:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1m8kK7-0002gS-WB
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:14:16 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:47026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1m8kK6-0006vc-3m
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:14:15 -0400
Received: by mail-wr1-x42d.google.com with SMTP id c16so2721956wrp.13
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 07:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=S9dqqLUajUEo51nkymgVO63YSoGccfe+pBiddV9jbQI=;
 b=vIwsE4WvsoC5jzWT2Y7UDUlogsOoWaRHGzk6CeFXHKR1Tp++fEucwnDYHfFldUuikx
 KZ5gCuniEa0v0nWuUscOV56X9inWu9IqaHoMwmhK+CnZ5FPckNVri2CoeJUOwAh47OIy
 wH22InzKD/Oyve169xdjBhrsmxH09vXMVd8APdudmMpMWGacb4jXOmDBTo9Kf1viK2I0
 6jVsQKETUq/Gi5XkQYMhHaTIXjUoaDdJDfCr6VT8i3eq+S+Dir4lH1JnrrFZ2WD8odk4
 d5Z+fQdXAM4U9ua5kh2gVZDOyi0uawW6moZTtMyk9dF/EhUtEmj6i3mOiJNlj04bx5+X
 IDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S9dqqLUajUEo51nkymgVO63YSoGccfe+pBiddV9jbQI=;
 b=jpZ6/TqZPfN2vUK7GQ+u6EMtreELxBOOkJwivXzrLpD66tXqaTCvQX5mRt4dada5CP
 8JRhuFzIkIZFd1zjYI0q5YbL5VdCrh7exNeHVJA3QcxZ4+d6qiCIpR1iByp20P7bAJA/
 DOnCl9hrmK7lu6EwLj0KSA0vaKxy20qlrUZp0l1HfqxG8XUb0HCTMiqkyO8ccJnsRTX/
 CjegVE8Po06H/9VlrDyK+g8+PQkJRXUPYoyVwkb4iIUK93GKdyU1ojB1lCcxFdZc9ioG
 drlZrnoh6YQer2SDMaIyOHeumW+B7pxDrESQQ0ESbFag701RxIPuCAH8Q+fHoURRgFfI
 A9cw==
X-Gm-Message-State: AOAM533xvUbl0Was4KFH+XHbxxDzJdCMhlpr1AZJh7BOQ3pP4Blq3yr0
 Q/q7qojW/W0wQO/nwvwSMB4=
X-Google-Smtp-Source: ABdhPJxUKt7an59xjvxB1qYumate+KzFxws+vTedc/yIAzUvnZZagdnVYJwPvNsSmpBz7e7s5jvMbg==
X-Received: by 2002:a5d:4d0c:: with SMTP id z12mr4088158wrt.275.1627481651540; 
 Wed, 28 Jul 2021 07:14:11 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id s3sm6787749wru.29.2021.07.28.07.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:14:10 -0700 (PDT)
Date: Wed, 28 Jul 2021 15:14:09 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH] block/io_uring: resubmit when result is -EAGAIN
Message-ID: <YQFmMdNUoYQxmxej@stefanha-x1.localdomain>
References: <20210728103518.1221195-1-f.ebner@proxmox.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H53QXKGimLQFhlHx"
Content-Disposition: inline
In-Reply-To: <20210728103518.1221195-1-f.ebner@proxmox.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x42d.google.com
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


--H53QXKGimLQFhlHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 28, 2021 at 12:35:18PM +0200, Fabian Ebner wrote:
> Quoting from [0]:
>=20
>  Some setups, like SCSI, can throw spurious -EAGAIN off the softirq
>  completion path. Normally we expect this to happen inline as part
>  of submission, but apparently SCSI has a weird corner case where it
>  can happen as part of normal completions.
>=20
> Host kernels without patch [0] can panic when this happens [1], and
> resubmitting makes the panic more likely. On the other hand, for
> kernels with patch [0], resubmitting ensures that a block job is not
> aborted just because of such spurious errors.
>=20
> [0]: https://lore.kernel.org/io-uring/20210727165811.284510-3-axboe@kerne=
l.dk/T/#u
>=20
> [1]:
>   #9 [ffffb732000c8b70] asm_exc_page_fault at ffffffffa4800ade
>  #10 [ffffb732000c8bf8] io_prep_async_work at ffffffffa3d89c16
>  #11 [ffffb732000c8c50] io_rw_reissue at ffffffffa3d8b2e1
>  #12 [ffffb732000c8c78] io_complete_rw at ffffffffa3d8baa8
>  #13 [ffffb732000c8c98] blkdev_bio_end_io at ffffffffa3d62a80
>  #14 [ffffb732000c8cc8] bio_endio at ffffffffa3f4e800
>  #15 [ffffb732000c8ce8] dec_pending at ffffffffa432f854
>  #16 [ffffb732000c8d30] clone_endio at ffffffffa433170c
>  #17 [ffffb732000c8d70] bio_endio at ffffffffa3f4e800
>  #18 [ffffb732000c8d90] blk_update_request at ffffffffa3f53a37
>  #19 [ffffb732000c8dd0] scsi_end_request at ffffffffa4233a5c
>  #20 [ffffb732000c8e08] scsi_io_completion at ffffffffa423432c
>  #21 [ffffb732000c8e58] scsi_finish_command at ffffffffa422c527
>  #22 [ffffb732000c8e88] scsi_softirq_done at ffffffffa42341e4
>=20
> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
> ---
>=20
> I'm new to this code and io_uring, so I don't know what all the
> implications are, but retrying upon EAGAIN does not sound like
> a bad thing to my inexperienced ears.
>=20
> Some more context, leading up to this patch:
>=20
> We had some users reporting issues after we switched to using io_uring
> by default. Namely, kernel panics [2] for some, and failing block jobs
> [3] (with a custom backup mechanism we implemented on top of QEMU's
> block layer) for others.
>=20
> I had luck and managed to reprouce the issue, and it was a failed
> block job about half of the time and a kernel panic the other half.
> When using a host kernel with [0], it's a failed block job all the
> time, and this patch attempts to fix that, by resubmitting instead
> of bubbling up the error.

Great, thanks for the patch!

Some of the relevant information is below the '---' line and won't be
included in the git log. Please tweak the commit description to focus
on:
- io_uring may return spurious -EAGAIN with Linux SCSI
  (The details of how io_uring internally resubmits are not important
  but the fact that spurious -EAGAIN is visible to userspace matters.)
- Resubmitting such requests solves the problem

The kernel panic is not as important in the commit description since
this patch works the same regardless of whether the kernel panics
sometimes or not.

>=20
> [2]: https://forum.proxmox.com/threads/kernel-panic-whole-server-crashes-=
about-every-day.91803/post-404382
> [3]: https://forum.proxmox.com/threads/backup-job-failed-with-err-11-on-2=
-of-6-vms.92568/
>=20
>  block/io_uring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/block/io_uring.c b/block/io_uring.c
> index 00a3ee9fb8..77d162cb24 100644
> --- a/block/io_uring.c
> +++ b/block/io_uring.c
> @@ -165,7 +165,7 @@ static void luring_process_completions(LuringState *s)
>          total_bytes =3D ret + luringcb->total_read;
> =20
>          if (ret < 0) {
> -            if (ret =3D=3D -EINTR) {
> +            if (ret =3D=3D -EINTR || ret =3D=3D -EAGAIN) {
>                  luring_resubmit(s, luringcb);
>                  continue;
>              }

Please add a comment:

 /*
  * Only writev/readv/fsync requests on regular files or host block
  * devices are submitted. Therefore -EAGAIN is not expected but it's
  * known to happen sometimes with Linux SCSI. Submit again and hope the
  * request completes successfully.
  *
  * For more information, see:
  * https://lore.kernel.org/io-uring/20210727165811.284510-3-axboe@kernel.d=
k/T/#u
  *
  * If the code is changed to submit other types of requests in the
  * future, then this workaround may need to be extended to deal with
  * genuine -EAGAIN results that should not be resubmitted immediately.
  */

Stefan

--H53QXKGimLQFhlHx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEBZjEACgkQnKSrs4Gr
c8h48Qf/WqKG+Bt3npyOATfaHHvwSa7gPupi67lapl3hSwT131+quliQ+qBB2uZa
bAaT0yxRldOy2PgwsY79xmdvvc7LML/1jXajKO9OWcYjfg8ZD18Chz9P2D3u7+Qo
CKDAbZSx2Q/LcJymBIIgNfLj2Ohp6LD7k3BJFc4qhsb5hk/fsdx15h5fQunJzmX7
2Stn8h+ai8vgSPBWJ3a1E+qQFkNYRfF0GD0NSaZ0z+xvQXDtRoSboNazWrjGz7Qd
QZ9AW3pSXKjNpHGQghs6n+cZ55zBciKaZgfUBM5wuSGpors9MCT/CCWtzRKT47B2
x8yrI5537aDbxuV7vFJlwqIFTWOEoQ==
=6IKi
-----END PGP SIGNATURE-----

--H53QXKGimLQFhlHx--

