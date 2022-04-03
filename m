Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A434F0C67
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Apr 2022 21:48:23 +0200 (CEST)
Received: from localhost ([::1]:53184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nb6Cz-00082h-U7
	for lists+qemu-devel@lfdr.de; Sun, 03 Apr 2022 15:48:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nb6Ba-0007EK-Nn
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 15:46:54 -0400
Received: from [2a00:1450:4864:20::329] (port=39689
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nb6BZ-0006Vn-1r
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 15:46:54 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so6551970wmb.4
 for <qemu-devel@nongnu.org>; Sun, 03 Apr 2022 12:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yeAMGHCAEmkyWJzZOL4biZsmMRzZgKzY+XXVc7/eJVM=;
 b=TJuHnBURgxv5GU4wiO7l10FIeg8ql8kRle8KPPvro40y1peEV7Zabn4goYZNQq6u10
 lNyq60K/fTZQhJDT5zupG1yg3F9ahhovtqiTBDBViPeAZJ0J2zkY5RhjyXVBaYW1ESMY
 cXQ1aIAAe8nR0mx3CBI/Oe3xtBvf7jQagiyv2bTtDlO+cfg/hEwWDj1wPa4p89FdpC5k
 FgT+grkl5pCrDUwXXcFBM/eThipQJ709+su7vfpNrAaBz/f7amO5T1+vzi1SmCrAjVmg
 idKe06pO9cQMzOtJ7qDD9l/qG1SpNqFUjZkUn0HdaW3mpaYmakJi/RQWm0zFsaU4mqJy
 E5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yeAMGHCAEmkyWJzZOL4biZsmMRzZgKzY+XXVc7/eJVM=;
 b=IiCJcEA5gBMFc9Kqqz9bL6osn4rBFwoFdGBFB3EjBQLQDtU1K/VeWSZQ8tyzsF5sni
 yts8vK5+1nuoqizs1lCRBSrpDXdu8lGwxX/atfaB29vjUq3gSSXxlomu584wgfAu1vRC
 VE4VktwIe65k1Q8TUqdTwT4xoAGKVWQaNxlxYnbodxLCPIiGZ16X27Fx+7EksYacl+gd
 v5YHK+gj590r8Jcjjc/9KENzdwCQZZTfqUgXlC3yLJ427nxDcEuJKIC2iXD+iaTvMLIx
 CXTJ4PZOyyqWQzWrHC3TLcpqG7tW6SR3AKAXKLDcdBTzcMcKzfTooWN/PocQQl5hps7k
 a07w==
X-Gm-Message-State: AOAM532jeRdnEydurGnGAdoihWYbtdO7TpA5nHga/ZfPOFV27/PyNhyL
 uebPo8bS9iNLnc6HNmo1xuY=
X-Google-Smtp-Source: ABdhPJwi17FJxkBVBrIv4SG/QbmsUeqvI7VcH0wurTXuCM0PKmIZYu9h7etHGwfUorwzc+E2rW9+Fg==
X-Received: by 2002:a05:600c:4ecc:b0:38e:354d:909 with SMTP id
 g12-20020a05600c4ecc00b0038e354d0909mr17043969wmq.33.1649015211187; 
 Sun, 03 Apr 2022 12:46:51 -0700 (PDT)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6b43000000b001e317fb86ecsm7332041wrw.57.2022.04.03.12.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 12:46:50 -0700 (PDT)
Date: Sun, 3 Apr 2022 20:46:49 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Sakshi Kaushik <sakshikaushik717@gmail.com>
Subject: Re: [PATCH] [PATCH RFC v2] Implements Backend Program conventions
 for vhost-user-scsi
Message-ID: <Ykn5qQzvp/+s6ulH@stefanha-x1.localdomain>
References: <20220403072148.9248-1-sakshikaushik717@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eCHDhdY1h+46SLye"
Content-Disposition: inline
In-Reply-To: <20220403072148.9248-1-sakshikaushik717@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: raphel.norwitz@nutanix.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--eCHDhdY1h+46SLye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 03, 2022 at 02:21:48AM -0500, Sakshi Kaushik wrote:

Hi Sakshi,
Thanks for the patch. I left comments below on things that are
incomplete. Please compile and run it with the new command-line options
you've added to test if the code works.

> Signed-off-by: Sakshi Kaushik <sakshikaushik717@gmail.com>
> ---
>  contrib/vhost-user-scsi/vhost-user-scsi.c | 35 +++++++++++++++++++----
>  1 file changed, 29 insertions(+), 6 deletions(-)
>=20
> diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-us=
er-scsi/vhost-user-scsi.c
> index 4f6e3e2a24..9bdc088ce8 100644
> --- a/contrib/vhost-user-scsi/vhost-user-scsi.c
> +++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
> @@ -353,6 +353,8 @@ fail:
> =20
>  int main(int argc, char **argv)
>  {
> +    static int opt_fdnum =3D -1;
> +    static gboolean opt_print_caps;

Why are these variables declared static?

>      VusDev *vdev_scsi =3D NULL;
>      char *unix_fn =3D NULL;
>      char *iscsi_uri =3D NULL;
> @@ -362,12 +364,18 @@ int main(int argc, char **argv)
>          switch (opt) {

The getopt(3) call needs to be extended to parse --socket-path, --fd, and
--print-capabilities. getopt_long(3) or GOptionContext APIs could be
used to parse these long options.

>          case 'h':
>              goto help;
> -        case 'u':
> +        case 's':
>              unix_fn =3D g_strdup(optarg);
>              break;
>          case 'i':
>              iscsi_uri =3D g_strdup(optarg);
>              break;
> +        case 'f':
> +            opt_fdnum =3D g_strdup(optarg);
> +            break;
> +        case 'p':
> +            opt_print_caps =3D g_strdup(optarg);

This statement sets opt_print_caps to true and leaks the string
allocated by g_strdup(). opt_print_caps is a gboolean, I think this
should just be:

  opt_print_caps =3D true;

> +            break;
>          default:
>              goto help;
>          }
> @@ -376,9 +384,22 @@ int main(int argc, char **argv)
>          goto help;
>      }
> =20
> -    lsock =3D unix_sock_new(unix_fn);
> -    if (lsock < 0) {
> -        goto err;
> +    if (unix_fn) {
> +        lsock =3D unix_sock_new(unix_fn);
> +        if (lsock < 0) {
> +            exit(EXIT_FAILURE);
> +        }
> +    } else if (opt_fdnum < 0) {
> +        g_print("%s\n", g_option_context_get_help(context, true, NULL));

This looks like it was copy-pasted from another program that uses
GOptionContext but vhost-user-scsi.c:main() uses getopt(3) (a different
API) so it won't work here.

> +        exit(EXIT_FAILURE);
> +    } else {
> +        lsock =3D opt_fdnum;
> +    }
> +
> +    if (opt_print_caps) {
> +        if (opt_print_caps["type"] !=3D "scsi") {
> +            goto err;
> +        }

This option does not need to validate input (there is no input). Instead
it needs to output JSON according to the vhost-user.rst backend
convention specification. Something like:

  printf("{\n");
  printf("  \"type\": \"scsi\"\n");
  printf("}\n");
  goto out;

>      }
> =20
>      csock =3D accept(lsock, NULL, NULL);
> @@ -426,10 +447,12 @@ err:
>      goto out;
> =20
>  help:
> -    fprintf(stderr, "Usage: %s [ -u unix_sock_path -i iscsi_uri ] | [ -h=
 ]\n",
> +    fprintf(stderr, "Usage: %s [ -s socket-path -i iscsi_uri -f fd -p pr=
int-capabilities ] | [ -h ]\n",
>              argv[0]);
> -    fprintf(stderr, "          -u path to unix socket\n");
> +    fprintf(stderr, "          -s path to unix socket\n");
>      fprintf(stderr, "          -i iscsi uri for lun 0\n");
> +    fprintf(stderr, "          -f fd, file-descriptor\n");
> +    fprintf(stderr, "          -p denotes print-capabilities\n");
>      fprintf(stderr, "          -h print help and quit\n");
> =20
>      goto err;
> --=20
> 2.17.1
>=20
>=20

--eCHDhdY1h+46SLye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJJ+agACgkQnKSrs4Gr
c8jKvAf/b/xpqJ5Py4sEH4Dnc67cn+BeAMq7ixfgvdau78+g89vb/y0QOIQTvlx7
vXkWR41sH98K7egVkt1bM8fGUE2l3+SQ1wIaL0y/AqIg+6OxTSSS/7bkQOHoY2N3
D23gW0WYRbwI7cIbE1SbfG0BkRNqVsQnSvZGmbil8xx5FOMDAHI5Z2/kUR7wPW4u
im3/xaLNMDcJ8DOBldYYciA/v6ObODKAr0/GBC6WRwQTu4KTsOnmM3zHhMFoUtXc
F5QzAb26JChM3o4/ccz1MJxkWguiQzJWnsxGubWi2D9O7TtRtyU5UgbU64aAFCmF
Q2OC2qHxn+Zbsrd00/7iyRsMYJwCWA==
=fnCF
-----END PGP SIGNATURE-----

--eCHDhdY1h+46SLye--

