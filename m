Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24645ED598
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 09:01:45 +0200 (CEST)
Received: from localhost ([::1]:60086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odR4i-0000Ab-FN
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 03:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1odQWR-0007Mq-Jk
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:26:19 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:50533
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1odQWD-0000FV-NG
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:26:19 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Mcmhf5249z4xGg; Wed, 28 Sep 2022 16:25:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1664346354;
 bh=CAFB4Awrva3gFwekJHgqyL4oyRUCtOgh215BBFGqSAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y2MIP/yMlth2odRk6+6ZirFIoNscTT48iGJzKJCoCCDVyhMDu8981Q/RPov+icXGU
 5hp2e2Ymg9god5DOvNUWcD+402pfnh2xYnS4AkESRTaBoXB/At3kaD4gbMs7/QwRvJ
 71J633CThg4iI0ywwPVv3d1C6ulGhr/5KdeqDDJI=
Date: Wed, 28 Sep 2022 14:56:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v9 03/16] net: simplify net_client_parse() error management
Message-ID: <YzPT/Lp8zbSHRl9D@yekko>
References: <20220926195048.487915-1-lvivier@redhat.com>
 <20220926195048.487915-4-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IFuUiXM82lvuut2i"
Content-Disposition: inline
In-Reply-To: <20220926195048.487915-4-lvivier@redhat.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--IFuUiXM82lvuut2i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 09:50:35PM +0200, Laurent Vivier wrote:
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
> index b172134a62cb..f71fca2a9f73 100644
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

--IFuUiXM82lvuut2i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMz0/YACgkQgypY4gEw
YSKH+A//TQ0N9xWsTchS1AiW/0tpOyNH36EBXtqx3uIfLPKWrC1SYlkbVrqGbKfh
eDMJRfb1Ya3bVqFZhYK/60jLr99a3RUSL6YkxjySjwVLnYN/uw4rs/vaHHSEGMXY
aeweLFceNaQNnFLZruCEImOwfIkAdXMtEca2FzRwbPXdVpgC8B/l8BBomCE4oc/9
YwXxgdJ/KtPpuClRD3yEq8TzP+gzqvJIxP2z/8hNV65gfJjXkyRGGeckAsRsNCel
V/dwD3CpZdiAtBoJUXSH55+uIgMjWOuVShw/0vLkpo/61seX28RjnqYVBhjkRnnb
SqpzK/S93REPv8o/iEHybU2p2EFN+++bxen2agizOhxU0Du1yXUZJh5VhiXeCfQX
KGUD73Ah+drN3a5sbyZBa3+7/EtgDyc73g//GtHhjrLJtQnhmjpvhF0hzP9HdT03
RnxknX6dyjdm+134HxJFhsN4Nv6Obudbd2Yr0lLNIuvMHRqhaHOU9OJpUa6S/0v3
Ov9KN/l845JBGJ05cmcm3B9X6k6QZ+pHMn4CkZKNDMz0BtwC+lwbKESzVqfJ2rrs
z7UZAE/R6qyaRlBRlxUe4qLS4P2xMJ3tAG8iKsGHh4r/hA1//tGU2p7NKc/a79uw
b5tYiJle+gft8nVcIlph75IvRLHeWADTHU9MwhhSjVFahxmEVSQ=
=NMMo
-----END PGP SIGNATURE-----

--IFuUiXM82lvuut2i--

