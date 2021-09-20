Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E8E411827
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:25:13 +0200 (CEST)
Received: from localhost ([::1]:39832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSLAO-0001uz-HJ
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mSL8N-0007cr-7V
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:23:08 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:30969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mSL8L-0002zz-3g
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:23:07 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-NUbWv_XuPp6tpDy5Q95HiQ-1; Mon, 20 Sep 2021 11:22:59 -0400
X-MC-Unique: NUbWv_XuPp6tpDy5Q95HiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4CAF1023F4D;
 Mon, 20 Sep 2021 15:22:57 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F3655D6AD;
 Mon, 20 Sep 2021 15:22:56 +0000 (UTC)
Date: Mon, 20 Sep 2021 17:22:19 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v8 7/7] spapr_numa.c: handle auto NUMA node with no
 distance info
Message-ID: <20210920172219.7343c4f4@bahia.huguette>
In-Reply-To: <20210917212802.424481-8-danielhb413@gmail.com>
References: <20210917212802.424481-1-danielhb413@gmail.com>
 <20210917212802.424481-8-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Sep 2021 18:28:02 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> numa_complete_configuration() in hw/core/numa.c always adds a NUMA node
> for the pSeries machine if none was specified, but without node distance
> information for the single node created.
>=20
> NUMA FORM1 affinity code didn't rely on numa_state information to do its
> job, but FORM2 does. As is now, this is the result of a pSeries guest
> with NUMA FORM2 affinity when no NUMA nodes is specified:
>=20
> $ numactl -H
> available: 1 nodes (0)
> node 0 cpus: 0
> node 0 size: 16222 MB
> node 0 free: 15681 MB
> No distance information available.
>=20
> This can be amended in spapr_numa_FORM2_write_rtas_tables(). We're
> enforcing that the local distance (the distance to the node to itself) is
> always 10. This allows for the proper creation of the NUMA distance table=
s,
> fixing the output of 'numactl -H' in the guest:
>=20
> $ numactl -H
> available: 1 nodes (0)
> node 0 cpus: 0
> node 0 size: 16222 MB
> node 0 free: 15685 MB
> node distances:
> node   0
>   0:  10
>=20
> CC: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_numa.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 659513b405..0cead2e7f5 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -539,6 +539,17 @@ static void spapr_numa_FORM2_write_rtas_tables(Spapr=
MachineState *spapr,
> =20
>      for (src =3D 0; src < nb_numa_nodes; src++) {
>          for (dst =3D 0; dst < nb_numa_nodes; dst++) {
> +            /*
> +             * We need to be explicit with the local distance
> +             * value to cover the case where the user didn't added any
> +             * NUMA nodes, but QEMU adds the default NUMA node without
> +             * adding the numa_info to retrieve distance info from.
> +             */
> +            if (src =3D=3D dst) {
> +                node_distances[i++] =3D 10;
> +                continue;
> +            }
> +
>              node_distances[i++] =3D numa_info[src].distance[dst];
>          }
>      }


