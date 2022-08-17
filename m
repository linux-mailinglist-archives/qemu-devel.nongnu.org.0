Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAA5596AA0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 09:52:02 +0200 (CEST)
Received: from localhost ([::1]:39764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oODqK-0002C3-M4
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 03:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oODjZ-0008CI-AR
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 03:45:01 -0400
Received: from mga04.intel.com ([192.55.52.120]:30991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oODjW-0005SH-Bf
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 03:45:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660722298; x=1692258298;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8p4zWZHRQq2aG0U8GJrw4D5yMFiIlF621HznyUOcO9E=;
 b=khXCp4H/Jnh2pUC2loqU7xLeKPijg1tYznI2fYxBu/sw9ZFlJa0VlPzn
 Lq1puR0498eB8Av6kVomFG2y5RaXz/hvvXCdzn3qmQCqJzvBJMfZL+gVS
 ikRFkumJTyfP1HEgkyEc/8R1ChShXxHTYIa0Zx9ghkScznuG5Wugtppge
 8NuOX9xgouOI21XkKxWc0/te64FuZ6uiu23hcdiCUMkppCYxiI4PuK+c0
 3StOpDvB6/X5pFAnnuC0Ci16PNFDjI8m3BLJEeKSI9N2GUuD+0QMkSbMG
 NDiY04JchU2FNDd33YuOqkg3U8qwkfI8dytk4WStY7QSJtXEBrIXLHmy7 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="291182565"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="291182565"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 00:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="696680877"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2022 00:44:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 00:44:53 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 00:44:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 17 Aug 2022 00:44:53 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 17 Aug 2022 00:44:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWmeSKt1b/d50pBFfAW7e9lkyvn6svpaO4dXg5RlC0vdweubbzCUg1z0ZJZxkaTjuwV8m6g/6Nq+mSLeGJiutB6vSnNwYYco1ObN72Z1EgOyIoEfTHmFEf8MM1sDEaN7ZTDdrCv055u89uwBcK5FVC2HdyPNw/R4HkNk377mVTZB8vfRPdwJymfrn6KPBc7GGnM0DbWJNp88PXOTx60uKSjlGcN5KWNXp5/I9SOKNojdJsjo2D8EauLkpmWIi0D++XhJ94m0PVVlDEzqb0twk4WIzPf9FCvFf2T2IHyPZVigemgR+agk+UT2m7mYkQAv95hnC4x8MZUNPA7VUOL2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqb594hsMX5P/WOUKSrxTT1WQJyCBX0rcJ3lQxMuosI=;
 b=ARIBX0PjrC+10JIhMuDlvkcKuiX8dLv7TVZhZISYIONKkAbP/bw6L8yfmK1FB9nzdrGXii8ZDkL1Yab8971lY/Yn9uMWSh0fNBD7yA+7rj2PLVokzJn+bVG0W/CCTghDWblu6GndGERfYVJRYY4oXZXmAZ5Gft5RIPIwz6LAQgIK3iztB38RDoOfAU2NPsN0y8bCGALMb9HO3pRM9jXiiNdoVxdSzy1nTOg4Dix30YufqW88hmXbLTsBsWiooA879n5mZ8d6WsWOKsEyt16SWXBNnztuP1a3lFHD862PeD9Zw9DTupE9MFsV62Itd9ajGGfTS75gM7gU6mIlNODlPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by BL0PR11MB2883.namprd11.prod.outlook.com (2603:10b6:208:7b::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 07:44:51 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee%7]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 07:44:50 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Li Zhijian <lizhijian@fujitsu.com>, qemu-dev
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH V4 RESEND] net/colo.c: Fix the pointer issue reported by
 Coverity.
Thread-Topic: [PATCH V4 RESEND] net/colo.c: Fix the pointer issue reported by
 Coverity.
Thread-Index: AQHYq87t3Q56oSRNMkypjwO6rW/3aa2ywqEA
Date: Wed, 17 Aug 2022 07:44:49 +0000
Message-ID: <MWHPR11MB0031A51C861DF8C6CB520E909B6A9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220809084854.217943-1-chen.zhang@intel.com>
In-Reply-To: <20220809084854.217943-1-chen.zhang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e83deafc-221c-4e5d-9b6d-08da80245d70
x-ms-traffictypediagnostic: BL0PR11MB2883:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nLR5Rl8hmc7yQH2zG3Tcn/wTKUVbOX94dzBS6e8rpwlF1TBhNBreQ7JApvk/Mn10Dh2/nvksg74VDgTHQgEqETDB6aRgF0MQMCr2tFPHm/bPmskJCpV7q+sXEAk3ZMcYh/ueKAG5I11fNgonVvIaxfU2d7+grKOmLgS2AH0BT6i+QqXSY8BbUXXVjr53WaaAY+UZaGjsQ2/ANekowZUJy0WJVh7eB8bJIWsyO28lnn/pIAe6lVTctebKwhPmQ4wX8l/v7LHPbOPipT8hf2506eq0TrhR1DkwEZegNvXrr+lEX+VgR7QO4Y5BJRRILpFxIlT/siOhKokGIPo17bd96mPr33p6/V7PH08mktrXqvPln/cetCn6dliUON4jQu5EsBtCNW3MgQgC5mQ9vgHhT+AsROwV6ayC5KA/X/qviPYdu6ctmLLlbAMeviUyfta2Cz9dQcf0rl2PgvvFRgGklKTuar2GmRxhtAtoQQfF6W3DFQiGrJvQLft/xoiD/FE0MSDpStLd/1IgAI4EHfBVw+mXUGXqazFiBHkfbGAi3sUBTRAb+J3FyKK23dyLDGtQjcysQXp1gC9AcqfMmDZcJ7nj9sr1kz0fYC+O9H7i9Bb0GG3DMMAm1wSRfkvEm31c5iCFDfwEsTjXv3UZV+vSDc5AUFj42oOvQgf6MeDeC2GCTufzbfLxtyX8mD0FqnK5mYi2wLebxi0xjZ/s409IMrDO2Ey884BcI8dSSjP3hgL5yLWmp0MJ6mNobjJWUAeTm2NMJ6psig9T5tu7reYqEegzl10euqXA5tk7B12CH4YvMzYslRThz1iNJ4XD8vKh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(396003)(346002)(376002)(136003)(66556008)(5660300002)(66476007)(110136005)(76116006)(66946007)(64756008)(8676002)(66446008)(55016003)(316002)(2906002)(8936002)(38100700002)(122000001)(52536014)(86362001)(53546011)(38070700005)(186003)(26005)(7696005)(33656002)(41300700001)(478600001)(9686003)(71200400001)(82960400001)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BTxrBUWahGv/pjIH338Wn04rnRDi4aZzxoyXe2yeWbmYKltVO0mkHeTYxudi?=
 =?us-ascii?Q?QlzZ4E6kZhJkd8Y6V5j+1YoSnLhORLLhSqKOwX4zsGq7cNuTVzfwxpUH7XEr?=
 =?us-ascii?Q?a7v8ZAqWNwOQMecNKAToNzuO6vC8PwuaOeGonhulN15nbNf5x0UMm48DfAWp?=
 =?us-ascii?Q?8KSRGeE18BdY66otY3C6kdOJiBvAuWYQj2h5ePo4GZy8zomyrsJhUbnVSf3w?=
 =?us-ascii?Q?elyzmUIMynyTf5OewyHkEjh9i5Q7f7ifqZWmZKD6Mz0RyMZHVdRBj/sDowyd?=
 =?us-ascii?Q?dfduCiwlt0h4REw1932k3qns4G6R9ks+/8LJKWIWXR7vqf6pd1REphKJ4gU6?=
 =?us-ascii?Q?56QgcfNmJvq74VMIhckxLQtGlLfPSINZly6Vr5v60OMNf+LAoC/1cvf1FYu4?=
 =?us-ascii?Q?ADM2QGOJDVWfNAdlaqKzAyZ7byGsSL3uro+PbAs9v8Bk1kc2TTf8ZtHH1Xgw?=
 =?us-ascii?Q?PFFueM64GOi+Q3sHe2pnrd02tQ+nyh0Q77YVdYtuDnVPDg0mYbXA9U/KxMp7?=
 =?us-ascii?Q?Oi4KRUPzT66atNS3ClY6ZrhojQ//VrxqdQTzJ+zUcklE53OnOhNO+TnMsaxi?=
 =?us-ascii?Q?ZmZdswE9f49F7T6t/M2SEquNgWXsh8pYDBTq2PskZlhRg7ujQGjCr25F5+8v?=
 =?us-ascii?Q?Ex4gMXLf0QnE19N6uhL0gPOp7kAGSX80XkuX6oUKrVAy0tXsmYTDhpOdd4yv?=
 =?us-ascii?Q?X+jAmvcdR7ROyRlBbF7HjAcSU7BJOKeFRqWu5AxiCIVaoHY3t7QHdTUn/VWq?=
 =?us-ascii?Q?kDhWuekuRaUx56RsoDADYBNTNtRNd6B9AzAuMBY4VxDZZnf3LFF0jwRyHuQI?=
 =?us-ascii?Q?IrGEvr1bQ/2tNISlCWvYHErbk5AECCOy22BcMZkkE5CMnDlM2CUNfoIHNq+s?=
 =?us-ascii?Q?3paGybguqDHuTawZMXVV3vd52iQFiGaqb+kH2HETbl6Rr5sh2v28U4xZ1QOZ?=
 =?us-ascii?Q?VlE9BecxmElTnMGVmbxlzrSQNhIsP4O8QCYL9foCRUDV/Nizps78281Tv7gq?=
 =?us-ascii?Q?MWl93xrMr1YeixhwtRkV7XFA5f/doHp0JmV4BVeonzx+vQuMdB4gagf+Ur3C?=
 =?us-ascii?Q?JVkpWGNbXUOLxzgkWil+Fb+HIoaaRQREZB309rK1E0iVuD7wNMMVrxiqdZlm?=
 =?us-ascii?Q?bYJ+PNED/uRvGnx59HrzjmA/y0W5Ak2EfaU2GooIxaVkcklE67Yk+dP23Or+?=
 =?us-ascii?Q?DCXIVhpRmss3qCF+s4RGDhKoMpooe7AAFc/EX3fZC7sLzlc8qcO1b/KKjd/P?=
 =?us-ascii?Q?5Lbdn60SB4Ys8zmOp+Pxx3iNwYfVo1ESTEM78+3XevIkLIxwxJ4GaXQxMSV9?=
 =?us-ascii?Q?N79kDOSQ5QzYsqJpU/cnX9XFETrT3o+sc2Poam/jKsNnLpHflL0TBbyaaQzi?=
 =?us-ascii?Q?RK8C0+lLgyuf/wurKiUtf1GyMJHx8OuDWhicmXxZ+kjAePPubSIH89GyzNbf?=
 =?us-ascii?Q?NBn5QV9cMsQWMcjRftSLAZc1vuCjud9r/YB3pXVR4UyATW8tv4mUFgAuwGYR?=
 =?us-ascii?Q?glBP/XQ3Jzv3WONiBQ5bKy6DwdRsoGUdheGRDU6z5Qd0J6O3zCzLNbqJHJ2H?=
 =?us-ascii?Q?d3li4gkDq9FyDHHnmGzJYRrVqlo1+9Dr3H1taXwI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e83deafc-221c-4e5d-9b6d-08da80245d70
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 07:44:50.0872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ej7v+DZ0Vqlpa0NFLD4Z3zt5NxOm1qXsQBvQUE9SnMa+sb2ZrXUlgU2ShRVCH4109Tt/Kf87tMW3jAfdxTDWuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2883
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=chen.zhang@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Ping....  Jason and Peter, any comments for this patch?

Thanks
Chen

> -----Original Message-----
> From: Zhang, Chen <chen.zhang@intel.com>
> Sent: Tuesday, August 9, 2022 4:49 PM
> To: Jason Wang <jasowang@redhat.com>; Peter Maydell
> <peter.maydell@linaro.org>; Li Zhijian <lizhijian@fujitsu.com>; qemu-dev
> <qemu-devel@nongnu.org>
> Cc: Zhang, Chen <chen.zhang@intel.com>
> Subject: [PATCH V4 RESEND] net/colo.c: Fix the pointer issue reported by
> Coverity.
>=20
> When enabled the virtio-net-pci, guest network packet will load the vnet_=
hdr.
> In COLO status, the primary VM's network packet maybe redirect to another
> VM, it need filter-redirect enable the vnet_hdr flag at the same time, CO=
LO-
> proxy will correctly parse the original network packet. If have any
> misconfiguration here, the vnet_hdr_len is wrong for parse the packet, th=
e
> data+offset will point to wrong place.
>=20
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/colo.c | 18 ++++++++++--------
>  net/colo.h |  1 +
>  2 files changed, 11 insertions(+), 8 deletions(-)
>=20
> diff --git a/net/colo.c b/net/colo.c
> index 6b0ff562ad..2b5568fff4 100644
> --- a/net/colo.c
> +++ b/net/colo.c
> @@ -44,21 +44,23 @@ int parse_packet_early(Packet *pkt)  {
>      int network_length;
>      static const uint8_t vlan[] =3D {0x81, 0x00};
> -    uint8_t *data =3D pkt->data + pkt->vnet_hdr_len;
> +    uint8_t *data =3D pkt->data;
>      uint16_t l3_proto;
>      ssize_t l2hdr_len;
>=20
> -    if (data =3D=3D NULL) {
> -        trace_colo_proxy_main_vnet_info("This packet is not parsed corre=
ctly, "
> +    assert(data);
> +
> +    /* Check the received vnet_hdr_len then add the offset */
> +    if ((pkt->vnet_hdr_len > sizeof(struct virtio_net_hdr_v1_hash)) ||
> +        (pkt->size < sizeof(struct eth_header) + sizeof(struct vlan_head=
er)
> +        + pkt->vnet_hdr_len)) {
> +        trace_colo_proxy_main_vnet_info("This packet may be load wrong "
>                                          "pkt->vnet_hdr_len", pkt->vnet_h=
dr_len);
>          return 1;
>      }
> -    l2hdr_len =3D eth_get_l2_hdr_length(data);
> +    data +=3D pkt->vnet_hdr_len;
>=20
> -    if (pkt->size < ETH_HLEN + pkt->vnet_hdr_len) {
> -        trace_colo_proxy_main("pkt->size < ETH_HLEN");
> -        return 1;
> -    }
> +    l2hdr_len =3D eth_get_l2_hdr_length(data);
>=20
>      /*
>       * TODO: support vlan.
> diff --git a/net/colo.h b/net/colo.h
> index 8b3e8d5a83..22fc3031f7 100644
> --- a/net/colo.h
> +++ b/net/colo.h
> @@ -18,6 +18,7 @@
>  #include "qemu/jhash.h"
>  #include "qemu/timer.h"
>  #include "net/eth.h"
> +#include "standard-headers/linux/virtio_net.h"
>=20
>  #define HASHTABLE_MAX_SIZE 16384
>=20
> --
> 2.25.1


