Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7562E34F4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 09:11:50 +0100 (CET)
Received: from localhost ([::1]:35638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktnd6-00075u-MW
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 03:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1ktnc7-0006XO-6j; Mon, 28 Dec 2020 03:10:47 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1ktnc3-0002lC-9A; Mon, 28 Dec 2020 03:10:46 -0500
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4D49FS3mS0zQxY2;
 Mon, 28 Dec 2020 16:09:48 +0800 (CST)
Received: from dggpemm000004.china.huawei.com (7.185.36.154) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 28 Dec 2020 16:10:30 +0800
Received: from dggeme770-chm.china.huawei.com (10.3.19.116) by
 dggpemm000004.china.huawei.com (7.185.36.154) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.1913.5; Mon, 28 Dec 2020 16:10:31 +0800
Received: from dggeme770-chm.china.huawei.com ([10.8.68.58]) by
 dggeme770-chm.china.huawei.com ([10.8.68.58]) with mapi id 15.01.1913.007;
 Mon, 28 Dec 2020 16:10:31 +0800
From: gaojinhao <gaojinhao@huawei.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: RE: [PATCH 4/8] spapr_pci: Fix memory leak of vmstate_spapr_pci
Thread-Topic: [PATCH 4/8] spapr_pci: Fix memory leak of vmstate_spapr_pci
Thread-Index: AQHW3OcZQWt+nwvkI0aSp0n3c7YGkqoMIswg
Date: Mon, 28 Dec 2020 08:10:31 +0000
Message-ID: <013a231c9cab4f3da7be9d88d87f34ae@huawei.com>
References: <20201226103347.868-1-gaojinhao@huawei.com>
 <20201226103347.868-5-gaojinhao@huawei.com>
 <20201228065824.GB6952@yekko.fritz.box>
In-Reply-To: <20201228065824.GB6952@yekko.fritz.box>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.50]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=gaojinhao@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 zhukeqian <zhukeqian1@huawei.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,
Firstly, thank you for you review. And then for your review, I worry that a=
 memory leak will occur if QEMU exits after saves vmsd. So, we free it in p=
ost_save func.

Jinhao Gao

-----Original Message-----
From: David Gibson [mailto:david@gibson.dropbear.id.au]=20
Sent: 2020-12-28 14:58
To: gaojinhao <gaojinhao@huawei.com>
Cc: qemu-devel@nongnu.org; qemu-ppc@nongnu.org; Marc-Andr=E9 Lureau <marcan=
dre.lureau@redhat.com>; Stefan Berger <stefanb@linux.vnet.ibm.com>; Michael=
 S . Tsirkin <mst@redhat.com>; Jason Wang <jasowang@redhat.com>; Greg Kurz =
<groug@kaod.org>; Juan Quintela <quintela@redhat.com>; Dr . David Alan Gilb=
ert <dgilbert@redhat.com>; Wanghaibin (D) <wanghaibin.wang@huawei.com>; zhu=
keqian <zhukeqian1@huawei.com>
Subject: Re: [PATCH 4/8] spapr_pci: Fix memory leak of vmstate_spapr_pci

On Sat, Dec 26, 2020 at 06:33:43PM +0800, g00517791 wrote:
> From: Jinhao Gao <gaojinhao@huawei.com>
>=20
> When VM migrate VMState of spapr_pci, the field(msi_devs) of spapr_pci=20
> having a flag of VMS_ALLOC need to allocate memory. If the src doesn't=20
> free memory of msi_devs in SaveStateEntry of spapr_pci after QEMUFile=20
> save VMState of spapr_pci, it may result in memory leak of msi_devs.=20
> We add the post_save func to free memory, which prevents memory leak.
>=20
> Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>

Not really a memory leak, since it will get freed on the next pre_save.  Bu=
t, we might as well free it earlier if we can ,so

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_pci.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c index=20
> 76d7c91e9c..1b2b940606 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -2173,6 +2173,16 @@ static int spapr_pci_pre_save(void *opaque)
>      return 0;
>  }
> =20
> +static int spapr_pci_post_save(void *opaque) {
> +    SpaprPhbState *sphb =3D opaque;
> +
> +    g_free(sphb->msi_devs);
> +    sphb->msi_devs =3D NULL;
> +    sphb->msi_devs_num =3D 0;
> +    return 0;
> +}
> +
>  static int spapr_pci_post_load(void *opaque, int version_id)  {
>      SpaprPhbState *sphb =3D opaque;
> @@ -2205,6 +2215,7 @@ static const VMStateDescription vmstate_spapr_pci =
=3D {
>      .version_id =3D 2,
>      .minimum_version_id =3D 2,
>      .pre_save =3D spapr_pci_pre_save,
> +    .post_save =3D spapr_pci_post_save,
>      .post_load =3D spapr_pci_post_load,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINT64_EQUAL(buid, SpaprPhbState, NULL),

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

