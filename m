Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68703405A64
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 17:48:30 +0200 (CEST)
Received: from localhost ([::1]:51854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOMHt-0000Th-Gh
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 11:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mOMFZ-00087L-Fb
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:46:05 -0400
Received: from mga03.intel.com ([134.134.136.65]:33190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mOMFU-0006h2-Od
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:46:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="220875055"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="220875055"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 08:45:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="539681739"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Sep 2021 08:45:57 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 08:45:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 08:45:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 08:45:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4FSD7nSHo4dStdFuVdY+e+8BaAngRcqpBwOR83WXPKq5pADGkM8nETQ5gxlfLsGVj4tWYxgBAAlsKM4+99e9pKfzrZYNSh8UZ+WaFG5iHivcoZ5RINyjoFMVfcWZssjGnJC3/tW3Dbyoya3hxdiaroeIuNI4AT8++SrXtAdHc4Ksayi8/wpFTowrQMRlmhf5at0VzcEuVrmubB36gpjPv/sT2QOH64v+BdgPUj94aX9oQvorn9IkoSC5JTmJP/PGSSVGTZlLiHRA9p2etpIuy49nTP2M3G8rcyUgMtKNHSFsBx7smELKd0UEFY5ncpty5NBioMLvUGtE03vcDviZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=GpS1/RmqOgxTjlQIpY2Xu52RNpaoTJImgG8RCvGgRko=;
 b=YwX1JglwggjBjwYv37bT0au2E5v0mrwEGbD0uxwlvvPsE1Z4p8Pl5d3yp8BNh5w+heeE5j/GWhCESfpPYk78pdPKpccAGk2ae3YJtFesJv2CZz/DXad3VaXC90LgH13HsMdU+aJNegXzY4M18xb6b8eSVgkNsictlcc6oCp0F57qkP6/epUYVe+yca7mGcEIzT61iYf5Aj/gRIMqFb6DKq8iddj2AEalHiJhaA89WRCFcoC9L3S5Y7Y1ws9GFayefqC+oJgOTyBYvvFqP1Th9n7YbFPJyoHX63INRKnsq1j2dlq34ShQmarvppreRepPIuSghNaESNojfXbhHSC82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpS1/RmqOgxTjlQIpY2Xu52RNpaoTJImgG8RCvGgRko=;
 b=EtpOQMNKqC7HJoUHu11h6esy+N2LRuo+SmTb4XwUPmEe1vR1zF9bB7+i52gtgSKn/rPiF3Mz4uMmhWzsw6Qar0MyC1aYn9337v2DNfS8nUZRe03mqfbqcjiSyniSWBtKQci2ORaMSGI2nCGO1u7ZCxYLFH99lKEMjwa/U9WVlO8=
Received: from BN0PR11MB5757.namprd11.prod.outlook.com (2603:10b6:408:165::23)
 by BN7PR11MB2755.namprd11.prod.outlook.com (2603:10b6:406:b5::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 15:45:56 +0000
Received: from BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::bde7:7f0a:e0bd:9945]) by BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::bde7:7f0a:e0bd:9945%4]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 15:45:55 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH V3 05/10] net: introduce control client
Thread-Topic: [PATCH V3 05/10] net: introduce control client
Thread-Index: AQHXo8fl6irnWakdRUqfjbRbUwL1Xqub2OJQ
Date: Thu, 9 Sep 2021 15:45:55 +0000
Message-ID: <BN0PR11MB57572F0723DCFCB9C9C703619BD59@BN0PR11MB5757.namprd11.prod.outlook.com>
References: <20210907090322.1756-1-jasowang@redhat.com>
 <20210907090322.1756-6-jasowang@redhat.com>
In-Reply-To: <20210907090322.1756-6-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c701e63-c030-432d-66f2-08d973a8e991
x-ms-traffictypediagnostic: BN7PR11MB2755:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR11MB2755DCE33E17CB9B76E450349BD59@BN7PR11MB2755.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bm8+LXV5GfiLxCxDd6ppDWEMI14dmcGMyIEn4yAJ1FjAdGPqDHVCmH0scbtLJp32Spm2k/va4aVoDEjJf6IAQLfPeQKT4GuAeQac3+VnAs7hAZ2dl0BkaNka21GyPqB5/Dsrr+mFtaGwLk9bWhCDIzrZv1tHduPqXpEFUweLhaJIS5Be1EtCCA/Jknopdi02m+shcyzP0NMNX5DYrWMt3c5JenhqhbGx1Tuie+NFeIDs20bTn6juG4g4T/uSvUffpdfz6MXxGEKzc0dRDs2AdafVjpsiFNelWr8Jk1Xf6VrVo38xWNFHOoww9BLHPtrO2kP3ClX/1hMJuei/2P4/rM33T081nSO3IbaVRzdJkfPXNuSyPKrdZtO/5+wlz5iZyP1RLXjarI5xVG1hlCMsYa+LcstqIPAbHzbjKxw6jYunapxLztCOsZQ5nx3lAXSmaTkPW57iJS7WvHobvQTIu1bHcO5pzjTPCDTQDU1ShvLzF7ATtaLljuNnAQ8GtpBl7pbBCq3twRJ8A9WjvXHlY20P8mntlyRU/MKSymibdww0c0BEw7xuOGh44NruK8i4IkTUHVlgTY7glcDvwVc1Ueey2+clQTcnnGXkre6fYJxieV8L3+TlMuNt0NCbQgR5jBSVClt8XvZMkkyMKAELZ2ZQ7VJghkTLHPsmBVhULo3avy6TqdH+BmYEzTcWUfJ/PKnuGvAbyYKtCo7FbOlFyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(64756008)(66556008)(66446008)(66476007)(66946007)(8936002)(186003)(83380400001)(4326008)(8676002)(26005)(478600001)(52536014)(76116006)(53546011)(6506007)(2906002)(122000001)(71200400001)(54906003)(5660300002)(38070700005)(316002)(55016002)(33656002)(38100700002)(86362001)(110136005)(9686003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KrHoGbWNc/k2pHsjbeJ+ltCTz3LsE2tKW0U78TD3E8v/Cv5jGv61jHECwowr?=
 =?us-ascii?Q?Paw8C2Lsf+rTq4fdMl8ZiX5q36it2TG3DbCIi2VX+kuNzAMW7chT+C+83nbF?=
 =?us-ascii?Q?pvz+18Krg7uCoXm/EaAaRuGCiqpTNaaiGMoxEZObsn395AVeXzWzt5LZ+UmE?=
 =?us-ascii?Q?M+/j547lDruACVT3lPuL7i2ZbaoR9J+/03simBLLS1telaIwomasSPjlFV2O?=
 =?us-ascii?Q?9VXdvUObWdUysw1kGslKmsaTREUiwket/xaZN4Dep3ketLO+pTLpVW4wC1Tu?=
 =?us-ascii?Q?cLHLB7aHQoA691iv3SBkWgyZi4wGnhcnnMbC8bbOlAbiA9LagJc04+uYPBQw?=
 =?us-ascii?Q?1T4EyWiuzIbEtiYhb48kxsegfUwnYtBYtPmtFPqYKUWX7PtHWfh3a9pOlUPJ?=
 =?us-ascii?Q?z5WqILZeJ4fDNenkQJ0/col46KYHGnKyG/U16buN8CDDnP/L2YY7p0VOY7SE?=
 =?us-ascii?Q?vuu2o19C4njSQBJfKZ/EZBvQwUXhIgaFSZXysl90KS8jjSpAy1QyDLVuPmjO?=
 =?us-ascii?Q?CdnmR0DkFEHCekKf3VAz95L9J6ogY9UsM5Fb1M617kvbQDqEXkBgD0nOq0d8?=
 =?us-ascii?Q?b3DH62OBcjnzVAGZbAMa+l8xz9cZSU/Gw0el1zQSaPkvTU6+n2p8qRnm/dxF?=
 =?us-ascii?Q?EuFPfAxH/KfBvu2UGIf7J38poLj4kjbx5tdGH0vwuCEZ6g9Lo3Suz84wdgzQ?=
 =?us-ascii?Q?AcOYYipLJyvChifdWGeopkX7wLFk0mISdBd2o/tANG82afNSkMe1dmsVIDvF?=
 =?us-ascii?Q?Na0ezP6he3+7w2k7pXtOP5e9n2/Jl/Rky8XJcRs3DXuKQnqUqzTEUSy4IKoV?=
 =?us-ascii?Q?mdRnhnIznIQLMS82ydQ2y2Qbks+FvOZZhfl7K/BARC/2hF1C9nQ8Tm2y36J6?=
 =?us-ascii?Q?FTNdDcKa1Aq2K3TVmN7vLsxwm6G6gCHFw3yDqe9Wdtm5bUkG13c9tD7fJEGu?=
 =?us-ascii?Q?BI9nevNEENiuzZ1QMlVikDbw2iCMBxklc9ois9C3h+btxlQjfVwmaOiLIRu/?=
 =?us-ascii?Q?AmbI7UZC+vjHUqQTguXch72My+knHnwFEGqu2Tkdkef13aO3qIa7lpk7Gow6?=
 =?us-ascii?Q?qkpJCPrU/wrjKqf7BKjqqE9g3LHUWZ2YShoFLJh9YeuzJlKOuVWOFjV0A+ie?=
 =?us-ascii?Q?JmFokB35BTiqQSjdmFZecQIyuy81ySe+iBPMCpPcuLbh0nJUpA0Nm9Stef3n?=
 =?us-ascii?Q?+FEMQvaARnRMfxN6wOyWLiwC6DViLRHxiOVD4tVmYPDCIEC5L/ZdZb9U5HBt?=
 =?us-ascii?Q?8OKU2XDrizEkxIUh+V5qGO68veL077Cg0onOnbqUC7NHGmcdl8GHTRlz3Nuk?=
 =?us-ascii?Q?nl7gsYzRGQCf3bipVPkg6Fg2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c701e63-c030-432d-66f2-08d973a8e991
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 15:45:55.8831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aam4a0MDzpgwAPA0P5rgpOCyhff0jwYXTO9UL+cjqt+nFeZqvyVA4KLAQXDVQ3aeSltmkw2IJofaJCEhnxZ4CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2755
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "eperezma@redhat.com" <eperezma@redhat.com>,
 "elic@nvidia.com" <elic@nvidia.com>, "lulu@redhat.com" <lulu@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>, "gdawar@xilinx.com" <gdawar@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Qemu-devel <qemu-devel-
> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Jason Wang
> Sent: Tuesday, September 7, 2021 5:03 PM
> To: mst@redhat.com; jasowang@redhat.com; qemu-devel@nongnu.org
> Cc: eperezma@redhat.com; elic@nvidia.com; gdawar@xilinx.com; Zhu,
> Lingshan <lingshan.zhu@intel.com>; lulu@redhat.com
> Subject: [PATCH V3 05/10] net: introduce control client
>=20
> This patch introduces a boolean for the device has control queue which ca=
n
> accepts control command via network queue.
>=20
> The first user would be the control virtqueue support for vhost.
>=20
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  include/net/net.h |  5 +++++
>  net/net.c         | 24 +++++++++++++++++++++---
>  2 files changed, 26 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/net/net.h b/include/net/net.h index
> 5d1508081f..4f400b8a09 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -103,6 +103,7 @@ struct NetClientState {
>      int vnet_hdr_len;
>      bool is_netdev;
>      bool do_not_pad; /* do not pad to the minimum ethernet frame length =
*/
> +    bool is_datapath;
>      QTAILQ_HEAD(, NetFilterState) filters;  };
>=20
> @@ -134,6 +135,10 @@ NetClientState
> *qemu_new_net_client(NetClientInfo *info,
>                                      NetClientState *peer,
>                                      const char *model,
>                                      const char *name);
> +NetClientState *qemu_new_net_control_client(NetClientInfo *info,
> +                                        NetClientState *peer,
> +                                        const char *model,
> +                                        const char *name);
>  NICState *qemu_new_nic(NetClientInfo *info,
>                         NICConf *conf,
>                         const char *model, diff --git a/net/net.c b/net/n=
et.c index
> 52c99196c6..f0d14dbfc1 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -239,7 +239,8 @@ static void qemu_net_client_setup(NetClientState
> *nc,
>                                    NetClientState *peer,
>                                    const char *model,
>                                    const char *name,
> -                                  NetClientDestructor *destructor)
> +                                  NetClientDestructor *destructor,
> +                                  bool is_datapath)
>  {
>      nc->info =3D info;
>      nc->model =3D g_strdup(model);
> @@ -258,6 +259,7 @@ static void qemu_net_client_setup(NetClientState
> *nc,
>=20
>      nc->incoming_queue =3D
> qemu_new_net_queue(qemu_deliver_packet_iov, nc);
>      nc->destructor =3D destructor;
> +    nc->is_datapath =3D is_datapath;
>      QTAILQ_INIT(&nc->filters);
>  }
>=20
> @@ -272,7 +274,23 @@ NetClientState
> *qemu_new_net_client(NetClientInfo *info,
>=20
>      nc =3D g_malloc0(info->size);
>      qemu_net_client_setup(nc, info, peer, model, name,
> -                          qemu_net_client_destructor);
> +                          qemu_net_client_destructor, true);
> +
> +    return nc;
> +}
> +
> +NetClientState *qemu_new_net_control_client(NetClientInfo *info,
> +                                            NetClientState *peer,
> +                                            const char *model,
> +                                            const char *name) {
> +    NetClientState *nc;
> +
> +    assert(info->size >=3D sizeof(NetClientState));
> +
> +    nc =3D g_malloc0(info->size);
> +    qemu_net_client_setup(nc, info, peer, model, name,
> +                          qemu_net_client_destructor, false);
>=20

Except for the "is_datapath", it looks the same as "qemu_new_net_client ".
Why not extend the original "qemu_new_net_client " with a "bool control" fi=
eld?

Thanks
Chen

>      return nc;
>  }
> @@ -297,7 +315,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
>=20
>      for (i =3D 0; i < queues; i++) {
>          qemu_net_client_setup(&nic->ncs[i], info, peers[i], model, name,
> -                              NULL);
> +                              NULL, true);
>          nic->ncs[i].queue_index =3D i;
>      }
>=20
> --
> 2.25.1
>=20


