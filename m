Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F433F8226
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 07:51:06 +0200 (CEST)
Received: from localhost ([::1]:56636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ8I5-0006c6-2v
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 01:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mJ8Gc-00051f-Qb
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 01:49:35 -0400
Received: from mga18.intel.com ([134.134.136.126]:13705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mJ8GZ-0006Jd-Ev
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 01:49:34 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="204807600"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="204807600"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 22:49:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="516360383"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 25 Aug 2021 22:49:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 22:49:25 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 22:49:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 25 Aug 2021 22:49:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 25 Aug 2021 22:49:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSiDukROfBITgTqQIyzM8SdSbtsYzeWmErYkfvXL2lrDh4Pzr+Nf5nEtySxWr3qzfZiGM40EfTXR1+wduE3EhO2w4Ir/pFKZSis+XhTSO2veWoQOWnw0zGuTTqPLDuUz8DjjTu1Rn4qlDlpp9Y/hKp9EYXF5p7hWHcEkksyzK1SnaUoB00NZHx2M+pzznr/WtHM3rIqNM9upZHzzZnFGnzmD4LHJf0XNT4bQpUp/2yWj2CXDmJbkl7dihBEMgN92cIqk+gl/deWjmmtQBhqTSntCqoqOJryQSjnYjPrkZ3AOlQzaH/1Lqg+UKiVkdpG5YPothbuZksFfuwuNRcLwvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGOKGyViGthizoZojQ5cScn6Dq97OhjyXwE+LQeWYbQ=;
 b=KUGuj9c4LNmNNKB3jptEiWe27iuGjgVGjaagjR+4a1RIzjySYsHxHGt0KMfND5dwUZbNSuVD+E6gBFSgbQRFJougaNBQHKElBRNIV8IWnynPmWBz9TZ+tq/75/llXEE1Bx64u2ZTNRZHIxfS4Y7tJeShBwmD84FwlfpbBQ4NDY+lyLdY8TxxWDUzad97CeTQKx5+p8t4+Nzf/DnfwCYu8ZBnzSdlb7kScTs7GtXJ7OGhyvy25Ecd8WDJ0DoKae3fPq5vgAa1+x50uEsUQ7HLyA/H0GcdRl21wjzBWlOxsAEsE7HEAbU+Y76X4DWeJ3JlJ7OtrmHawoy3dJoFRKWmgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGOKGyViGthizoZojQ5cScn6Dq97OhjyXwE+LQeWYbQ=;
 b=lRCpQ+AP+3DQP5tLoPlbfT++M6yroQegs/GmUAcEz9LzV2DiUB+rhZLv/IK6cQINtMn6fzbQjL6/Yf6zz3KWH1+CrzhzK1yXHilnaoTGteL8rvdpOT+LDdIBzZ61om8F51vRexpYy1tjQyK3+ktA0/eqKZTcaSK/ZtJWJYzGhjA=
Received: from BN0PR11MB5757.namprd11.prod.outlook.com (2603:10b6:408:165::23)
 by BN8PR11MB3604.namprd11.prod.outlook.com (2603:10b6:408:83::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Thu, 26 Aug
 2021 05:49:23 +0000
Received: from BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::bde7:7f0a:e0bd:9945]) by BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::bde7:7f0a:e0bd:9945%4]) with mapi id 15.20.4457.019; Thu, 26 Aug 2021
 05:49:23 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>, "Xu, Tao3" <tao3.xu@intel.com>
Subject: RE: [PATCH v2] net/colo: check vnet_hdr_support flag when using
 virtio-net
Thread-Topic: [PATCH v2] net/colo: check vnet_hdr_support flag when using
 virtio-net
Thread-Index: AQHXlJlgS22HUioSM0+thc3FtmRHiKt+KRYAgAco30A=
Date: Thu, 26 Aug 2021 05:49:23 +0000
Message-ID: <BN0PR11MB575712EA5EBD922254BBB4819BC79@BN0PR11MB5757.namprd11.prod.outlook.com>
References: <20210819012717.318050-1-tao3.xu@intel.com>
 <20210821162524.3b112708@gecko.fritz.box>
In-Reply-To: <20210821162524.3b112708@gecko.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: web.de; dkim=none (message not signed)
 header.d=none;web.de; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 046301dd-63bb-4bd3-e2cd-08d968554200
x-ms-traffictypediagnostic: BN8PR11MB3604:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR11MB36044832BF2E8A29566DB4AC9BC79@BN8PR11MB3604.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: feiTBFlCnz6/k65itC2yvl9vq2irKm6bLV8nVDzlonWmDHkCcdbA5s2Al3IqYXSMkoi2w+bVcloyIUNSJiuPhQv1Hnef4s6hZ500nRRy5J40uFvPUPfZHytQSu5XMZEoQuYz5Eu0P2Z3clOErftCxhUDNd3QLsUdJ4tk3AU+p94AY2SKDSaTxIqje2UmeTKNMbW4/XmqzeBvaZVA34i2dUbbb2ns43vU2j6gLt2hgQHVe4qIm/psp4Rr//QaXb2qc9V+tlDrygDufqXmsRY3gCoiUVzMRvmpj0imigt/4WKYRxbm0ao1WQlpM7aB6r4woWKP+gLsxsET1d6Tu6VIIf0XOqfugcjjRTx5QF2DgjBhlZdc5BLuD+BT1RkioVkd7gGWiXPt+RbXYZYsR8K5Y5QeyLbJxkWffytpqbxruheN0FCpQCdC3ElQC5CQ9bkXV+MCB8ygzdXBhoINaTdfeT2Vuf3BO+i/POdu3cSOgkbkmnJK5I1BBuA+5BQGafR3NJXuHZUNEBreHg5g0oOjBitvnNM6H/MbN9e3WX7L2l89LvEoYLIlD4VuKH77i/K7V0F6hTHa8QZwaj4WKiNJhED7EKc7BXuWdVZUUaOQ4Trh5gqHpNMe8wKnwQ0nnP2Oir0WbU+OBcWrfUiak0SklhxA95r2CneARNCsZGiJJgkEkjL9MqgWDWJ5GIYGxiMLCMOqrdkwvf141SOcVm+HJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(83380400001)(30864003)(86362001)(5660300002)(55016002)(2906002)(478600001)(9686003)(122000001)(38100700002)(66446008)(64756008)(66556008)(66476007)(66946007)(71200400001)(76116006)(38070700005)(26005)(53546011)(110136005)(8936002)(186003)(6636002)(8676002)(4326008)(52536014)(316002)(33656002)(54906003)(7696005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YeoXmcUs6gWf3x9oqYqvApuVU76aOMq9ji9zCNPxA7WWjL0TXe2dp2pSmVSp?=
 =?us-ascii?Q?rKMLAMB6WKK9hjBLDFrzQ0gFG9skTpf9npMxcICFp/x5JBJ/Lu37qsbx8c7L?=
 =?us-ascii?Q?BeunSXCH2NbBuy5FBGE2sf8qMf+BqvqmjJgVdyVLBpTRKkXnEPcXfO38XNs8?=
 =?us-ascii?Q?wa5B6fE3GVYUcdanLvEqdXvdXgg90jpSTcKkblN1Rcjll8BaVQLCC8SNGx8n?=
 =?us-ascii?Q?6E8sVGHXiWV7LayaFiC5U47U0NBux2PDU4Ej0txObfsQxEM1/eJBcICN77A7?=
 =?us-ascii?Q?7GUWVIPSMnMyR55OSQ8syw8h2BfPA6XTheMkBxxWRRvG/otGeNamcA+V0HRW?=
 =?us-ascii?Q?6e/YqGeINLSUXx1WLjgFVNt+rfIB/rxrmsEndcfYF7gcb22AwShIrHHIlpbX?=
 =?us-ascii?Q?pghxR9AX8ofztqtBNgFtRJEnCmqT7B2G/A/nivJyfbnC1g5Z/et8yr61Imu8?=
 =?us-ascii?Q?DXveS6TYfMKYttsGQGmwYzyZGC2oyfgK+SW48T4Rns1vcHJc5scxACFcgpSF?=
 =?us-ascii?Q?VNWSzRjsr6K+1ykdHyIY5/PuHqFdYCJbfmg9wrCOXbrQFGMqWIhImJCbC+HX?=
 =?us-ascii?Q?7bwL0fg/mxaP5+1rznlrUA4F7b4MCh826RYuJwLhExFUEm5XREKyPTkQ75IK?=
 =?us-ascii?Q?2MAckqd0o/+vz20S4XOZBxWJR3f2y0lSx6+CKcb6RKR5L9C7iKWRK6dF+H2H?=
 =?us-ascii?Q?sMjxoLoOh2Z59rfU89YeW7zNVxjCdEpCVMZtGt6taFYQH/Ipc61h33raaJAP?=
 =?us-ascii?Q?Zl7mrMl0LDYTwwOhrGtSwFOHw+G7y59XEXhjQl5kb7ViVDeesT3sVT0UMyX/?=
 =?us-ascii?Q?EOYMWVxPRWtNRQZ1IMm8XGofNArvDFtb++cu3b7Jp/Go5ffvGwnC9ahs8kkJ?=
 =?us-ascii?Q?is2AIiqwLdC5HUoqm5U8Ashm98xQSZTY1Y772MTk4DHD6g9GnkTitT/K+4Lf?=
 =?us-ascii?Q?iuOpIWS9og1i6cAQjBp+lnl3D8/7+p0N5Ewx8rgLjD4UtIHE89aCiZ/+NcZs?=
 =?us-ascii?Q?FxsnJqtCZwH28cFKUlUKlvzvY0dL6bLIvSl9AL8uuyDpys/CvPThI71LXn8h?=
 =?us-ascii?Q?5rRNDXMtgmZPg/FYTg4xJBsdBatjhpCdSAmYtp/UGTw4bslFDSlSuW/n2Hdx?=
 =?us-ascii?Q?TsuOT4PxVL3VmSyqoCZd7yZZ3vIpb7n/6NduGUwDXkTT24pmfRY714E6obKT?=
 =?us-ascii?Q?64vUobFfxJRy0/HdS4m0aZ2X0Wg6JOAC3o1s2hP6nO3uvRTzblyuOLUxzEIS?=
 =?us-ascii?Q?pl/OIdRKp2I/LdajPqdMpCP8fNe0YgitHsZNKSJyVTNbHEFTFjSw+rSys4Tv?=
 =?us-ascii?Q?YEzHjMkt4pTEPjE8qe9512Jl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046301dd-63bb-4bd3-e2cd-08d968554200
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2021 05:49:23.7483 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w4xZtZVm6C3ZkNImFCKnSU2X60SMW0uaJiuYwNb7bOuOG65BMIb1XePlrd4Kig+nHs5H30GG7Uno6WzF33eOUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3604
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
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
Cc: "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>
> Sent: Sunday, August 22, 2021 12:25 AM
> To: Xu, Tao3 <tao3.xu@intel.com>
> Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;
> jasowang@redhat.com; qemu-devel@nongnu.org
> Subject: Re: [PATCH v2] net/colo: check vnet_hdr_support flag when using
> virtio-net
>=20
> On Thu, 19 Aug 2021 09:27:17 +0800
> Tao Xu <tao3.xu@intel.com> wrote:
>=20
> > When COLO use only one vnet_hdr_support parameter between COLO
> network
> > filter(filter-mirror, filter-redirector or filter-rewriter and
> > colo-compare, packet will not be parsed correctly. Acquire network
> > driver related to COLO, if it is nirtio-net, check vnet_hdr_support
> > flag of COLO network filter and colo-compare.
> >
> > Signed-off-by: Tao Xu <tao3.xu@intel.com>
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >
> > Changelog:
> > v2:
> >      Detect virtio-net driver and apply vnet_hdr_support
> >      automatically. (Jason)
> > ---
> >  net/colo-compare.c    | 57
> +++++++++++++++++++++++++++++++++++++++++++
> >  net/colo.c            | 20 +++++++++++++++
> >  net/colo.h            |  4 +++
> >  net/filter-mirror.c   | 21 ++++++++++++++++
> >  net/filter-rewriter.c | 10 ++++++++
> >  qapi/qom.json         |  6 +++++
> >  qemu-options.hx       |  6 +++--
> >  7 files changed, 122 insertions(+), 2 deletions(-)
> >
> > diff --git a/net/colo-compare.c b/net/colo-compare.c index
> > b100e7b51f..870bd05a41 100644
> > --- a/net/colo-compare.c
> > +++ b/net/colo-compare.c
> > @@ -110,6 +110,7 @@ struct CompareState {
> >      char *sec_indev;
> >      char *outdev;
> >      char *notify_dev;
> > +    char *netdev;
> >      CharBackend chr_pri_in;
> >      CharBackend chr_sec_in;
> >      CharBackend chr_out;
> > @@ -838,6 +839,28 @@ static int compare_chr_can_read(void *opaque)
> >      return COMPARE_READ_LEN_MAX;
> >  }
> >
> > +static int colo_set_default_netdev(void *opaque, QemuOpts *opts,
> > +Error **errp) {
> > +    const char *colo_obj_type, *netdev_from_filter;
> > +    char **netdev =3D (char **)opaque;
> > +
> > +    colo_obj_type =3D qemu_opt_get(opts, "qom-type");
> > +
> > +    if (colo_obj_type &&
> > +        (strcmp(colo_obj_type, "filter-mirror") =3D=3D 0 ||
> > +         strcmp(colo_obj_type, "filter-redirector") =3D=3D 0 ||
> > +         strcmp(colo_obj_type, "filter-rewriter") =3D=3D 0)) {
> > +        netdev_from_filter =3D qemu_opt_get(opts, "netdev");
> > +        if (*netdev =3D=3D NULL) {
> > +            *netdev =3D g_strdup(netdev_from_filter);
> > +        } else if (strcmp(*netdev, netdev_from_filter) !=3D 0) {
> > +            warn_report("%s is using a different netdev from other COL=
O "
> > +                        "component", colo_obj_type);
> > +        }
> > +    }
> > +    return 0;
> > +}
> > +
>=20
> Hi,
> This doesn't properly handle the case where there are multiple network
> devices and one is virtio-net and the other isn't. This would be a regres=
sion as
> this worked fine before.

No, If have multiple network device this patch just report a warning for it=
.
You can still use virtio-net and others at the same time.

>=20
> >  /*
> >   * Called from the main thread on the primary for packets
> >   * arriving over the socket from the primary.
> > @@ -1050,6 +1073,21 @@ static void compare_set_vnet_hdr(Object *obj,
> >      s->vnet_hdr =3D value;
> >  }
> >
> > +static char *compare_get_netdev(Object *obj, Error **errp) {
> > +    CompareState *s =3D COLO_COMPARE(obj);
> > +
> > +    return g_strdup(s->netdev);
> > +}
> > +
> > +static void compare_set_netdev(Object *obj, const char *value, Error
> > +**errp) {
> > +    CompareState *s =3D COLO_COMPARE(obj);
> > +
> > +    g_free(s->netdev);
> > +    s->netdev =3D g_strdup(value);
> > +}
> > +
> >  static char *compare_get_notify_dev(Object *obj, Error **errp)  {
> >      CompareState *s =3D COLO_COMPARE(obj); @@ -1274,6 +1312,12 @@
> > static void colo_compare_complete(UserCreatable *uc, Error **errp)
> >          max_queue_size =3D MAX_QUEUE_SIZE;
> >      }
> >
> > +    if (!s->netdev) {
> > +        /* Set default netdev as the first colo netfilter found */
> > +        qemu_opts_foreach(qemu_find_opts("object"),
> > +                          colo_set_default_netdev, &s->netdev, NULL);
> > +    }
> > +
> >      if (find_and_check_chardev(&chr, s->pri_indev, errp) ||
> >          !qemu_chr_fe_init(&s->chr_pri_in, chr, errp)) {
> >          return;
> > @@ -1289,6 +1333,16 @@ static void
> colo_compare_complete(UserCreatable *uc, Error **errp)
> >          return;
> >      }
> >
> > +    if (!s->vnet_hdr &&
> > +        qemu_opts_foreach(qemu_find_opts("device"),
> > +                          vnet_driver_check, s->netdev, NULL)) {
> > +        /*
> > +         * colo compare needs 'vnet_hdr_support' when it works on virt=
io-net,
> > +         * add 'vnet_hdr_support' automatically
> > +         */
> > +        s->vnet_hdr =3D true;
> > +    }
> > +
>=20
> There is no way to disable vnet_hdr_support with virtio-net now.

Yes, It looks no reason to do this.
Please show me some details?

Thanks
Chen

>=20
> >      net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, s->vnet_hd=
r);
> >      net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize,
> > s->vnet_hdr);
> >
> > @@ -1400,6 +1454,9 @@ static void colo_compare_init(Object *obj)
> >      s->vnet_hdr =3D false;
> >      object_property_add_bool(obj, "vnet_hdr_support",
> compare_get_vnet_hdr,
> >                               compare_set_vnet_hdr);
> > +    /* colo compare can't varify that netdev is correct */
> > +    object_property_add_str(obj, "netdev", compare_get_netdev,
> > +                            compare_set_netdev);
> >  }
> >
> >  void colo_compare_cleanup(void)
> > diff --git a/net/colo.c b/net/colo.c
> > index 3a3e6e89a0..4a03780f45 100644
> > --- a/net/colo.c
> > +++ b/net/colo.c
> > @@ -243,3 +243,23 @@ bool connection_has_tracked(GHashTable
> > *connection_track_table,
> >
> >      return conn ? true : false;
> >  }
> > +
> > +/* check the network driver related to COLO, return 1 if it is
> > +virtio-net */ int vnet_driver_check(void *opaque, QemuOpts *opts,
> > +Error **errp) {
> > +    const char *driver_type, *netdev_from_driver;
> > +    char *netdev_from_filter =3D (char *)opaque;
> > +
> > +    driver_type =3D qemu_opt_get(opts, "driver");
> > +    netdev_from_driver =3D qemu_opt_get(opts, "netdev");
> > +
> > +    if (!driver_type || !netdev_from_driver || !netdev_from_filter) {
> > +        return 0;
> > +    }
> > +
> > +    if (g_str_has_prefix(driver_type, "virtio-net") &&
> > +        strcmp(netdev_from_driver, netdev_from_filter) =3D=3D 0) {
> > +        return 1;
> > +    }
> > +    return 0;
> > +}
> > diff --git a/net/colo.h b/net/colo.h
> > index d91cd245c4..d401fc76b6 100644
> > --- a/net/colo.h
> > +++ b/net/colo.h
> > @@ -18,6 +18,9 @@
> >  #include "qemu/jhash.h"
> >  #include "qemu/timer.h"
> >  #include "net/eth.h"
> > +#include "qemu/option.h"
> > +#include "qemu/option_int.h"
> > +#include "qemu/config-file.h"
> >
> >  #define HASHTABLE_MAX_SIZE 16384
> >
> > @@ -104,5 +107,6 @@ Packet *packet_new(const void *data, int size, int
> > vnet_hdr_len);  Packet *packet_new_nocopy(void *data, int size, int
> > vnet_hdr_len);  void packet_destroy(void *opaque, void *user_data);
> > void packet_destroy_partial(void *opaque, void *user_data);
> > +int vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp);
> >
> >  #endif /* NET_COLO_H */
> > diff --git a/net/filter-mirror.c b/net/filter-mirror.c index
> > f20240cc9f..69ca9c9839 100644
> > --- a/net/filter-mirror.c
> > +++ b/net/filter-mirror.c
> > @@ -12,6 +12,7 @@
> >  #include "qemu/osdep.h"
> >  #include "net/filter.h"
> >  #include "net/net.h"
> > +#include "net/colo.h"
> >  #include "qapi/error.h"
> >  #include "qom/object.h"
> >  #include "qemu/main-loop.h"
> > @@ -224,6 +225,16 @@ static void filter_mirror_setup(NetFilterState *nf=
,
> Error **errp)
> >          return;
> >      }
> >
> > +    if (!s->vnet_hdr &&
> > +        qemu_opts_foreach(qemu_find_opts("device"),
> > +                          vnet_driver_check, nf->netdev_id, NULL)) {
> > +        /*
> > +         * filter mirror needs 'vnet_hdr_support' when colo filter mod=
ules
> > +         * work on virtio-net, add 'vnet_hdr_support' automatically
> > +         */
> > +        s->vnet_hdr =3D true;
> > +    }
> > +
> >      qemu_chr_fe_init(&s->chr_out, chr, errp);  }
> >
> > @@ -252,6 +263,16 @@ static void filter_redirector_setup(NetFilterState
> *nf, Error **errp)
> >          }
> >      }
> >
> > +    if (!s->vnet_hdr &&
> > +        qemu_opts_foreach(qemu_find_opts("device"),
> > +                          vnet_driver_check, nf->netdev_id, NULL)) {
> > +        /*
> > +         * filter redirector needs 'vnet_hdr_support' when colo filter=
 modules
> > +         * work on virtio-net, add 'vnet_hdr_support' automatically
> > +         */
> > +        s->vnet_hdr =3D true;
> > +    }
> > +
> >      net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
> >
> >      if (s->indev) {
> > diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c index
> > cb3a96cde1..637ef4ce71 100644
> > --- a/net/filter-rewriter.c
> > +++ b/net/filter-rewriter.c
> > @@ -388,6 +388,16 @@ static void colo_rewriter_setup(NetFilterState
> > *nf, Error **errp)  {
> >      RewriterState *s =3D FILTER_REWRITER(nf);
> >
> > +    if (!s->vnet_hdr &&
> > +        qemu_opts_foreach(qemu_find_opts("device"),
> > +                          vnet_driver_check, nf->netdev_id, NULL)) {
> > +        /*
> > +         * filter rewriter needs 'vnet_hdr_support' when colo filter m=
odules
> > +         * work on virtio-net, add 'vnet_hdr_support' automatically
> > +         */
> > +        s->vnet_hdr =3D true;
> > +    }
> > +
> >      s->connection_track_table =3D
> g_hash_table_new_full(connection_key_hash,
> >                                                        connection_key_e=
qual,
> >                                                        g_free, diff
> > --git a/qapi/qom.json b/qapi/qom.json index 6d5f4a88e6..442a963ba4
> > 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -241,6 +241,11 @@
> >  # @notify_dev: name of the character device backend to be used to
> communicate
> >  #              with the remote colo-frame (only for Xen COLO)
> >  #
> > +# @netdev: id of the network device backend to colo-compare, although
> > +#          colo-compare doesn't depend on network device directly, thi=
s
> > +#          parameter help colo-compare know what network driver it is
> > +#          working on
> > +#
> >  # @compare_timeout: the maximum time to hold a packet from
> @primary_in for
> >  #                   comparison with an incoming packet on @secondary_i=
n in
> >  #                   milliseconds (default: 3000)
> > @@ -264,6 +269,7 @@
> >              'outdev': 'str',
> >              'iothread': 'str',
> >              '*notify_dev': 'str',
> > +            '*netdev': 'str',
> >              '*compare_timeout': 'uint64',
> >              '*expired_scan_cycle': 'uint32',
> >              '*max_queue_size': 'uint32', diff --git a/qemu-options.hx
> > b/qemu-options.hx index 83aa59a920..b31ce3c87d 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -4957,12 +4957,14 @@ SRST
> >          stored. The file format is libpcap, so it can be analyzed with
> >          tools such as tcpdump or Wireshark.
> >
> > -    ``-object colo-
> compare,id=3Did,primary_in=3Dchardevid,secondary_in=3Dchardevid,outdev=3D=
chard
> evid,iothread=3Did[,vnet_hdr_support][,notify_dev=3Did][,compare_timeout=
=3D@
> var{ms}][,expired_scan_cycle=3D@var{ms}][,max_queue_size=3D@var{size}]``
> > +    ``-object
> > + colo-
> compare,id=3Did,primary_in=3Dchardevid,secondary_in=3Dchardevid,outde
> > + v=3Dchardevid,iothread=3Did[,netdev=3Dnetdevid][,vnet_hdr_support][,n=
otify
> > +
> _dev=3Did][,compare_timeout=3D@var{ms}][,expired_scan_cycle=3D@var{ms}][,
> m
> > + ax_queue_size=3D@var{size}]``
> >          Colo-compare gets packet from primary\_in chardevid and
> >          secondary\_in, then compare whether the payload of primary pac=
ket
> >          and secondary packet are the same. If same, it will output
> >          primary packet to out\_dev, else it will notify COLO-framework=
 to do
> > -        checkpoint and send primary packet to out\_dev. In order to
> > +        checkpoint and send primary packet to out\_dev. Although colo-
> compare
> > +        does not depend on network device directly, netdevid help
> > +        colo-compare know what network driver it is working on. In
> > + order to
> >          improve efficiency, we need to put the task of comparison in
> >          another iothread. If it has the vnet\_hdr\_support flag,
> >          colo compare will send/recv packet with vnet\_hdr\_len.
>=20
>=20
>=20
> --


