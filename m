Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6CB5B8068
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 06:52:33 +0200 (CEST)
Received: from localhost ([::1]:48286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYKNy-0000eq-VH
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 00:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oYKDr-00045m-Ez
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:42:03 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:35541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oYKDm-0005tP-0s
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:42:03 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4MS72z4S1pz4xG8; Wed, 14 Sep 2022 14:41:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1663130507;
 bh=8yzrNp2g/bgJ1kqXlg3istWVNb5G/50fTBCw9Rrb898=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AEPWQgHbNh/xMqABo7GctH1YRBKmJeg3INFCz9m65d+IXYAnkpqFObQIxGq+FFp68
 VThQKfBzLd5ZSC/aoOF635FUYTrIfxRv0uchJacTEeuUuQCK+ewQqZwRLLbnOHSrNU
 ad3c2Mx/fCahfn5vwXlawZOhmlyeN8Yq20+x0CRU=
Date: Wed, 14 Sep 2022 12:29:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gregory Kurz <gregory.kurz@free.fr>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 03/14] net: simplify net_client_parse() error management
Message-ID: <YyE8f+vkS/E3xAAM@yekko>
References: <20220913064000.79353-1-lvivier@redhat.com>
 <20220913064000.79353-4-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IJQ+Dj2d+tFRcgqH"
Content-Disposition: inline
In-Reply-To: <20220913064000.79353-4-lvivier@redhat.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IJQ+Dj2d+tFRcgqH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2022 at 08:39:49AM +0200, Laurent Vivier wrote:
> All net_client_parse() callers exit in case of error.
>=20
> Move exit(1) to net_client_parse() and remove error checking from
> the callers.
>=20
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  include/net/net.h |  2 +-
>  net/net.c         |  6 ++----
>  softmmu/vl.c      | 12 +++---------
>  3 files changed, 6 insertions(+), 14 deletions(-)
>=20
> diff --git a/include/net/net.h b/include/net/net.h
> index c1c34a58f849..55023e7e9fa9 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -220,7 +220,7 @@ extern NICInfo nd_table[MAX_NICS];
>  extern const char *host_net_devices[];
> =20
>  /* from net.c */
> -int net_client_parse(QemuOptsList *opts_list, const char *str);
> +void net_client_parse(QemuOptsList *opts_list, const char *str);
>  void show_netdevs(void);
>  void net_init_clients(void);
>  void net_check_clients(void);
> diff --git a/net/net.c b/net/net.c
> index 15958f881776..f056e8aebfb2 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1579,13 +1579,11 @@ void net_init_clients(void)
>                        &error_fatal);
>  }
> =20
> -int net_client_parse(QemuOptsList *opts_list, const char *optarg)
> +void net_client_parse(QemuOptsList *opts_list, const char *optarg)
>  {
>      if (!qemu_opts_parse_noisily(opts_list, optarg, true)) {
> -        return -1;
> +        exit(1);
>      }
> -
> -    return 0;
>  }
> =20
>  /* From FreeBSD */
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 1fe8b5c5a120..55d163475e9e 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2809,21 +2809,15 @@ void qemu_init(int argc, char **argv, char **envp)
>                  break;
>              case QEMU_OPTION_netdev:
>                  default_net =3D 0;
> -                if (net_client_parse(qemu_find_opts("netdev"), optarg) =
=3D=3D -1) {
> -                    exit(1);
> -                }
> +                net_client_parse(qemu_find_opts("netdev"), optarg);
>                  break;
>              case QEMU_OPTION_nic:
>                  default_net =3D 0;
> -                if (net_client_parse(qemu_find_opts("nic"), optarg) =3D=
=3D -1) {
> -                    exit(1);
> -                }
> +                net_client_parse(qemu_find_opts("nic"), optarg);
>                  break;
>              case QEMU_OPTION_net:
>                  default_net =3D 0;
> -                if (net_client_parse(qemu_find_opts("net"), optarg) =3D=
=3D -1) {
> -                    exit(1);
> -                }
> +                net_client_parse(qemu_find_opts("net"), optarg);
>                  break;
>  #ifdef CONFIG_LIBISCSI
>              case QEMU_OPTION_iscsi:

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IJQ+Dj2d+tFRcgqH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMhPHgACgkQgypY4gEw
YSJbsA//WK8oaBYERVpz1hDiN09vninIVThRUTbNIblrAdeYdmfxeBgS/Lx+jNwy
7NeX/AWaAdnFCUzhnsP3RfTZnRugSRSFg9AMz2eDNP5Z6nVrMrVqpF8z6+OCB8cs
E/uBVmj24UJ1YjSvvlmBLY2YjXYzbtaAnDoSP4U2pXhmeLCCFJlrO5v8eUW6tavq
VcWxi++/ttFbTLNi/MGGFnu2X5YOgqxJ4N15tE5MRVOoqjs2ikt0mwJvmSRi7vAB
/iJZ1pq3sLidAHzOYSJpb5wyMamskqJn1UAym8wkQVBja6/QmGt/ry/NLRmRHKgx
EUfsfdm+ld+XvCFpOeSet1ArVPZUR5II9Y5pN8EAIrz/Bct5I4BhS3lCMTCB6Z6h
vDVUKwpwag3cWcypiUgFkYfAYJY1tHa+CJUwezaA7cC2+fBABq1zoKL5I65Ad8DO
Ob1q0K7Dzwb9RlAGYKP7fUdpopKiBDZNY/lAQrxyMRi3AkoHon2Efi/nZA14N9La
Cwa36H6940k6rzhE9zyyQnKu6eBY2X2qJx6hROGOZbzVtxlptpEC7EG90ljHlHuu
jwkMTSuGMx/qpIpk1WcEMPAJI4jryE1fdxOoE73DgJag4n2h0fOJgRuryTrOZ2wH
lQdP40YRvb6h42TwqVYoqQ26Pppcu4qvRkzimyfECVSWO6ZgKrQ=
=mcL5
-----END PGP SIGNATURE-----

--IJQ+Dj2d+tFRcgqH--

