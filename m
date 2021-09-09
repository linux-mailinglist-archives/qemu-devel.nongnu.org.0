Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC3B405A52
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 17:43:39 +0200 (CEST)
Received: from localhost ([::1]:45874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOMDC-0004mi-Mr
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 11:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mOMAk-000305-ND
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:41:09 -0400
Received: from mga18.intel.com ([134.134.136.126]:32470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mOMAi-0002YO-PV
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:41:06 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="207932337"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="207932337"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 08:41:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="431867776"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 09 Sep 2021 08:41:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 08:41:01 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 08:41:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 08:41:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 08:41:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xemd9bPCJ6BfGABlVwFM31wl8eKwRO4MZFI8iw1LxKuHBARroMaaBLKLwvQr9e1+bqFDHdOJ3GbtCCq2QxkFoEJqQIVQzkIejtB7SRuJWiVw9H8m8hfyXzpNGb6Cp9SHcSwkOWBmSmRrXG9jIEK2UiZKXXC+V9KYSNqK3wp5j93mq58ZErvIrWKuTPjolSROhZIU6OIF/diLYUCTxX6UEwJE3m4Ao/RqtA/cZngYPvPeUAIXzLk/nvJPFsOUQHm3x7mqbq1WUWSNGKmnPJui9vCTObrLDelFD9xrnN0dbPQwSge+TGBlLbS6MfbNYO3N8Q0yXDXERk5BMFW0GMXNNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ldqSCC3JJGk6qoJTh7BblG14fB44zj2BYYLqOpAMxz0=;
 b=SVIpVOMO3JqUVW6QFIrSeFOjAiyIWgo3pkwU48GN0quX7xRcqIHJx/FoSLaeSQGr3Vku3SEMOkRCmBVoMk4xFGekkTBcqRxaGbNydzXVmLLvqPPl7ZMCPiyZ03wLT66wpCGum+LjXHSFFi3Ro7CR2J2VOBHWMT4JjYXKTJAxW9EhFfKalJh2xJq38Pr/v0n9Yxk82gBl7cTuZYMUMhgljr5kCGMMh+oA1RLiC4Yfzn4qaq/oGegSb0oy8uj1IETCedL4/03P+zF2Ou1kQGb1LNsXjugGMcCVGVyGNbCiEKN65qHHuTVDA/AE6hr9jCM4/7Fm6Zv1d3ACkOGLfTKXjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldqSCC3JJGk6qoJTh7BblG14fB44zj2BYYLqOpAMxz0=;
 b=beSdAKiUSzLM8kebO2p2RjclchKcC52Zih9KhryebFfjE7PxcfZ4MQCfZXvQzVjnyGSqukWMttY9bXfK2PImwKc2ztmW2OV4G34mdwQBM110rnfHAdlZJk55s3dR//85Z4elE0VHAUw98Rp382XUIhY6he5TwESlXugfp5TKgKk=
Received: from BN0PR11MB5757.namprd11.prod.outlook.com (2603:10b6:408:165::23)
 by BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 15:41:00 +0000
Received: from BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::bde7:7f0a:e0bd:9945]) by BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::bde7:7f0a:e0bd:9945%4]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 15:41:00 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH V3 04/10] vhost-vdpa: let net_vhost_vdpa_init() returns
 NetClientState *
Thread-Topic: [PATCH V3 04/10] vhost-vdpa: let net_vhost_vdpa_init() returns
 NetClientState *
Thread-Index: AQHXo8ecy29cd7XlCkCkRAIsWcntDaub1bBA
Date: Thu, 9 Sep 2021 15:41:00 +0000
Message-ID: <BN0PR11MB575775A2FFB4314AC0A4E99E9BD59@BN0PR11MB5757.namprd11.prod.outlook.com>
References: <20210907090322.1756-1-jasowang@redhat.com>
 <20210907090322.1756-5-jasowang@redhat.com>
In-Reply-To: <20210907090322.1756-5-jasowang@redhat.com>
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
x-ms-office365-filtering-correlation-id: a6bd8df7-3bb6-4bc9-dbc3-08d973a8394a
x-ms-traffictypediagnostic: BN9PR11MB5354:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR11MB53549FBF23F70EEBDDE94DD69BD59@BN9PR11MB5354.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KzorsL6AsJh5eIR7bwiiygG7snHvqwMvwRn/VwufRI17TKSWr1neMTGlMDOWDTJ+QWNi7MZ7E9I9RnT93I1v3VG/tDPbvWBgin8h9q1WsLZVYkuf+Ci403lPW+5n3/YON7Zd96MDegx6pXl4mExKhyAD/EniViVSO3pKjiXx52omfFjHRJmXnN7OggVU/IAHZvuHmF2dBrDFm29UBY38RYA7+Vw0pkCwKyniP7ZGTcd4Mc7X3SlJyOD9iSvEe6WEsoD56KZQdn3N6ZnwhAUFp59aclndRUvBD1iLsV+EDuhG9IZR5j3hDdvcVROwiRidRcKZatkUpPBz+o1CuVmYCWVeighTGAdXEWjsf9xycvWcBCSIry3W2YRfQb6Hkgm8X+y0Ji3Azk8d+qQ/yTOyAx1XlhpZE3db2xqoOYcjkcyKpLtD2AYCNjVxzzXTLGJsYX1jkg6H6uqo14xQ7634QeTRfilLJKP9OPcNDlzFz3Ul4yuDGc4kLBYVTjBMhOnCU5YfZGep31YBodiI5cKy60S1VZI/VlDmh2vsLaU8NwBYAEjq1kLzvITBINrRQ0wE2ENZyckAXyZ/JbdTLrXTclWryJc7YKRZfz4JNaeMk/zMiN4YY1TqD/OunrXIfos/s1s4BUkZa7OqproBk5f/xxpcfgow5fHbMn4zG9puo3gzXfEq+aXlpaoqsulRgVBzDjww7+QcbRaw8RUD/YRZew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(66476007)(66556008)(316002)(66446008)(26005)(122000001)(64756008)(76116006)(38100700002)(38070700005)(33656002)(66946007)(52536014)(186003)(478600001)(71200400001)(2906002)(86362001)(110136005)(53546011)(6506007)(8936002)(54906003)(83380400001)(7696005)(8676002)(55016002)(4326008)(9686003)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JYuC8HFo9S990lKtduqnE0e7UPb73zh6sNNDqDYcbJxoRAGEknNK1lPrl5Wp?=
 =?us-ascii?Q?lF6AEJ8d/KhoGMxBIJj1ZcJT1i5jBGL7/WqovJ8GHfhesMhB9MHXVwErNFmm?=
 =?us-ascii?Q?IpvExmy7oDOxDJ5btMCQn4Z669KafZ8jponQjKbzoXQ+NuVNrmKRBWWqk9XG?=
 =?us-ascii?Q?0Xq9eXF4FqBGaJ7K6OM0vpVO2FQaxWUfPTnTFMcjejRBCdEBvXrvUosVk32D?=
 =?us-ascii?Q?5cahSqXmknwPxQxmnFpkuY7K04ufSwe4kaKNNBBCJp2t86gvR4SnjOmzdMTe?=
 =?us-ascii?Q?FCI1OCDRsVHtO5qg7kO0XgBGDEPNga1WTNJw1GVK7FB8nSMl5x2llOAvJ/Ou?=
 =?us-ascii?Q?YmL9CL9nzFzp84TCl5i826s63fV2K/WVRBCwHITvz5+khugYk1JtRZXBdxlH?=
 =?us-ascii?Q?v98V/2tZ6h+3GEBmNFa7WWy7YJCGrNC1m4bPJ/03r7HRoHW3ExPRASN0b7Uk?=
 =?us-ascii?Q?ZAXOH2fP+5nO4vgFgvaoUhzfsycsLqBrh9jtu/mLAbNgyg9xXndXn/N4+AtC?=
 =?us-ascii?Q?mvZk2dm2CnGVsFjQyiFvC7dmkxSJG3Hr9t+5B15d232mDWLwj+5kR5JR0pCj?=
 =?us-ascii?Q?E1yucuaTYQVRxRxW+SaNWAUo55X5YMvAQciK4SC+2FIop6XfpgDAWimc5S2H?=
 =?us-ascii?Q?77MASxyW0nLsclxIrW9gRC/7ND2y7wO+qk1AxwD+YSxZnGVgpKlYpvd/vgtA?=
 =?us-ascii?Q?KjDkXpte8ex2YLFf6Q3TVHLVJ7AavKH7NpIcyM+Ol1DBVn1U0p6iLtYCtOBK?=
 =?us-ascii?Q?3f1LLdXhZiFJeV9JBUyPDaEhKHF/soacNeZU0TVOiD3BJViDyqVt0jv7T+ug?=
 =?us-ascii?Q?vcb0i09eOREMCJ4H4kKGcitt6GRrzpR3rVtGwOuujAIvRGbZB0LqXIT3kqVa?=
 =?us-ascii?Q?U4QJEHJupI+aNQ2cShPzowyyo44EA26WIg6jffOChAF24O7SpzuXvmoaOJE2?=
 =?us-ascii?Q?tojRp/eQOH743/GWkvcqsC4mnhZ5eXIbtrDH6Cb3XdFOv59yaWPC+fXdZXg0?=
 =?us-ascii?Q?HI5LUOs35jUZaqBaAS6XxHzvg/YEf7dyYAnIU0ims/aZj/WUBUG8+oE1b0hM?=
 =?us-ascii?Q?BeuE6IsHNu9aWF3RIawl3bFQqsLPavqriHrWYQzM0J9kXA3cwJuv92P5ge8z?=
 =?us-ascii?Q?PT+YGzOyRH6+2Iy3Fl+31Vywazn4O8Wyu2eXSZ6OnJcVtoI/+1cCl3OjVa8B?=
 =?us-ascii?Q?KEXIDSd2q1dU+gviQzhbVVMFMWMLijg2uxmua1b7P66CY0U0FOsHfwSLDRsC?=
 =?us-ascii?Q?DkBQLRAuxUQT+xy/6Td++7WKGfM/7SEaVGm00OY0I88pKvAkxn+5lYm+BPND?=
 =?us-ascii?Q?uuCw0v+TtghLWp0w2fQDIiPK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bd8df7-3bb6-4bc9-dbc3-08d973a8394a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 15:41:00.1567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ewpq3fXITK5ZHMKI6E5EZfa1MbRsvwzDew4Sw4usIPg10Gphb72CDaDNGazawYDlo8SgPZNbeiOziGFugywnVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5354
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
> Subject: [PATCH V3 04/10] vhost-vdpa: let net_vhost_vdpa_init() returns
> NetClientState *
>=20
> This patch switches to let net_vhost_vdpa_init() to return NetClientState=
 *.
> This is used for the callers to allocate multiqueue NetClientState for
> multiqueue support.
>=20
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  net/vhost-vdpa.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c index
> 73d29a74ef..834dab28dd 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -155,8 +155,10 @@ static NetClientInfo net_vhost_vdpa_info =3D {
>          .has_ufo =3D vhost_vdpa_has_ufo,
>  };
>=20
> -static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
> -                               const char *name, int vdpa_device_fd)
> +static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> +                                           const char *device,
> +                                           const char *name,
> +                                           int vdpa_device_fd)
>  {
>      NetClientState *nc =3D NULL;
>      VhostVDPAState *s;
> @@ -170,8 +172,9 @@ static int net_vhost_vdpa_init(NetClientState *peer,
> const char *device,
>      ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
>      if (ret) {
>          qemu_del_net_client(nc);
> +        return NULL;
>      }
> -    return ret;
> +    return nc;
>  }
>=20
>  static int net_vhost_check_net(void *opaque, QemuOpts *opts, Error
> **errp) @@ -196,7 +199,8 @@ int net_init_vhost_vdpa(const Netdev
> *netdev, const char *name,
>                          NetClientState *peer, Error **errp)  {
>      const NetdevVhostVDPAOptions *opts;
> -    int vdpa_device_fd, ret;
> +    int vdpa_device_fd;
> +    NetClientState *nc;
>=20
>      assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
>      opts =3D &netdev->u.vhost_vdpa;
> @@ -211,10 +215,11 @@ int net_init_vhost_vdpa(const Netdev *netdev,
> const char *name,
>          return -errno;
>      }
>=20
> -    ret =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> vdpa_device_fd);
> -    if (ret) {
> +    nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> vdpa_device_fd);
> +    if (!nc) {
>          qemu_close(vdpa_device_fd);
> +        return -1;

It looks like this patch needs to be merged with the 01/10 patch.
Both related to the changes of " net_vhost_vdpa_init ".

Thanks
Chen


>      }
>=20
> -    return ret;
> +    return 0;
>  }
> --
> 2.25.1
>=20


