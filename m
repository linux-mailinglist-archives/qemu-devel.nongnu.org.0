Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3434841404A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 06:04:07 +0200 (CEST)
Received: from localhost ([::1]:46106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mStUM-0001qY-2T
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 00:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mStPD-0007Lj-2f; Tue, 21 Sep 2021 23:58:47 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:38599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mStP9-0007DQ-Md; Tue, 21 Sep 2021 23:58:46 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HDkqj2MDgz4xbH; Wed, 22 Sep 2021 13:51:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632282689;
 bh=tyEp40K+dEDrSnNBt/0dAKy7MAAEFA9sm5VVO8wpIKc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aaZRcHQBYutvypihJWVc0oplGak6xAZV0f16ipmcnMG+8d6mkictD5ftKMG4S1w9/
 fur6iNcqpoDq0WDp/63Onwq1ANRKQjAe0Cqhp3DZ0beZFSwACyWfTw2HOsaVTVBzSt
 SuBrPLJCLZg43Qtw0FM5hkcv8we0fdjx2M3hmxEM=
Date: Wed, 22 Sep 2021 13:08:21 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH] spapr_numa.c: fixes in
 spapr_numa_FORM2_write_rtas_tables()
Message-ID: <YUqeJQEtMKh2jyuV@yekko>
References: <20210921194347.52347-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ey4ez2AkhmLoDu/n"
Content-Disposition: inline
In-Reply-To: <20210921194347.52347-1-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Ey4ez2AkhmLoDu/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2021 at 04:43:47PM -0300, Daniel Henrique Barboza wrote:
> This patch has a handful of modifications for the recent added
> FORM2 support:
>=20
> - there is no particular reason for both 'lookup_index_table' and
> 'distance_table' to be allocated in the heap, since their sizes are
> known right at the start of the function. Use static allocation in
> them to spare a couple of g_new0() calls;
>=20
> - to not allocate more than the necessary size in 'distance_table'. At
> this moment the array is oversized due to allocating uint32_t for all
> elements, when most of them fits in an uint8_t;
>=20
> - create a NUMA_LOCAL_DISTANCE macro to avoid hardcoding the local
> distance value.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-fot-6.2, thanks.

> ---
>  hw/ppc/spapr_numa.c | 35 +++++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 58d5dc7084..039a0439c6 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -19,6 +19,9 @@
>  /* Moved from hw/ppc/spapr_pci_nvlink2.c */
>  #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
> =20
> +/* Macro to avoid hardcoding the local distance value */
> +#define NUMA_LOCAL_DISTANCE         10
> +
>  /*
>   * Retrieves max_dist_ref_points of the current NUMA affinity.
>   */
> @@ -500,17 +503,21 @@ static void spapr_numa_FORM2_write_rtas_tables(Spap=
rMachineState *spapr,
>      MachineState *ms =3D MACHINE(spapr);
>      NodeInfo *numa_info =3D ms->numa_state->nodes;
>      int nb_numa_nodes =3D ms->numa_state->num_nodes;
> +    /* Lookup index table has an extra uint32_t with its length */
> +    uint32_t lookup_index_table[nb_numa_nodes + 1];
>      int distance_table_entries =3D nb_numa_nodes * nb_numa_nodes;
> -    g_autofree uint32_t *lookup_index_table =3D NULL;
> -    g_autofree uint32_t *distance_table =3D NULL;
> -    int src, dst, i, distance_table_size;
> -    uint8_t *node_distances;
> +    /*
> +     * Distance table is an uint8_t array with a leading uint32_t
> +     * containing its length.
> +     */
> +    uint8_t distance_table[distance_table_entries + 4];
> +    uint32_t *distance_table_length;
> +    int src, dst, i;
> =20
>      /*
>       * ibm,numa-lookup-index-table: array with length and a
>       * list of NUMA ids present in the guest.
>       */
> -    lookup_index_table =3D g_new0(uint32_t, nb_numa_nodes + 1);
>      lookup_index_table[0] =3D cpu_to_be32(nb_numa_nodes);
> =20
>      for (i =3D 0; i < nb_numa_nodes; i++) {
> @@ -518,8 +525,7 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprM=
achineState *spapr,
>      }
> =20
>      _FDT(fdt_setprop(fdt, rtas, "ibm,numa-lookup-index-table",
> -                     lookup_index_table,
> -                     (nb_numa_nodes + 1) * sizeof(uint32_t)));
> +                     lookup_index_table, sizeof(lookup_index_table)));
> =20
>      /*
>       * ibm,numa-distance-table: contains all node distances. First
> @@ -531,11 +537,10 @@ static void spapr_numa_FORM2_write_rtas_tables(Spap=
rMachineState *spapr,
>       * array because NUMA ids can be sparse (node 0 is the first,
>       * node 8 is the second ...).
>       */
> -    distance_table =3D g_new0(uint32_t, distance_table_entries + 1);
> -    distance_table[0] =3D cpu_to_be32(distance_table_entries);
> +    distance_table_length =3D (uint32_t *)distance_table;
> +    distance_table_length[0] =3D cpu_to_be32(distance_table_entries);
> =20
> -    node_distances =3D (uint8_t *)&distance_table[1];
> -    i =3D 0;
> +    i =3D 4;
> =20
>      for (src =3D 0; src < nb_numa_nodes; src++) {
>          for (dst =3D 0; dst < nb_numa_nodes; dst++) {
> @@ -546,18 +551,16 @@ static void spapr_numa_FORM2_write_rtas_tables(Spap=
rMachineState *spapr,
>               * adding the numa_info to retrieve distance info from.
>               */
>              if (src =3D=3D dst) {
> -                node_distances[i++] =3D 10;
> +                distance_table[i++] =3D NUMA_LOCAL_DISTANCE;
>                  continue;
>              }
> =20
> -            node_distances[i++] =3D numa_info[src].distance[dst];
> +            distance_table[i++] =3D numa_info[src].distance[dst];
>          }
>      }
> =20
> -    distance_table_size =3D distance_table_entries * sizeof(uint8_t) +
> -                          sizeof(uint32_t);
>      _FDT(fdt_setprop(fdt, rtas, "ibm,numa-distance-table",
> -                     distance_table, distance_table_size));
> +                     distance_table, sizeof(distance_table)));
>  }
> =20
>  /*

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Ey4ez2AkhmLoDu/n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFKniMACgkQbDjKyiDZ
s5J5IBAArQ+aIiQ0PWl4xO9mqP8DNO9KrBIBrUE6tavZkYlxgsutdgsl6YG34A7v
FJL8b0cUeZyNqyye+Vy5/ZJeg0YgTfpc/y8gZti4+DQ15zvb5aAIjifPTkxuCkxw
V4dCATc7/F9ygvoHoWZYMNnqoyTI9/Xuvcz1rDBiXhOoxdGNN7AGc3teKJ8g7yQc
oPHX0GjVTVI+vbhqtcJNmIMEbWlaZyXE1aSo8uNySbB6BiLF3IbGQfAsBxWtnPsS
5kvDvUYyHRuhruK/NMPTOMaJblJuw8SEDZOawf16K2KkK9bYXxJccD7ld3rAASxY
TSVHorH+fQ+E8kLFTtxJYloWg03LYjEsXj5aW00KXC/gQQfj1bpPjVYt9Fihwlge
Y8/TQ7oUNbmPCr33KaErVdsO3MbgAKc+qUzEXZiCKTY+6Y/GerKue1+/3nA6AefZ
90Pd2xw4HbUZCmy111WennEuhhZN+YY42XonfKNntOm7ypiwCM3KPqjr5qM5LRRX
he+IN10oioUKCl3aaWob+4RC4Zt6kCI0oYEB0gV/zWpU7aLjG/+zcBPxu1GiWrc7
lC2Y2uJdb6F0Y4KQvtzGofpfb4CiixHhS7GPMhZhRjjcV3PYnpdcL39XAnI4hyqw
QUkM9hkdi/WLAcL2IzoMrys4anGv4ou1kZ0B5m9KWZcFpSVlnQ8=
=+RZj
-----END PGP SIGNATURE-----

--Ey4ez2AkhmLoDu/n--

