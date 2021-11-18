Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36CF45546B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 06:46:22 +0100 (CET)
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnaFZ-0007hg-GS
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 00:46:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mnaDa-0006jw-Df; Thu, 18 Nov 2021 00:44:19 -0500
Received: from mga02.intel.com ([134.134.136.20]:11367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mnaDX-0005Ln-01; Thu, 18 Nov 2021 00:44:18 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="221332505"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="221332505"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 21:44:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="507281682"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 17 Nov 2021 21:44:08 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 17 Nov 2021 21:44:08 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 17 Nov 2021 21:44:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 17 Nov 2021 21:44:07 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 17 Nov 2021 21:44:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZe3fjONzlI5YfTXp+iw1UvYMzhwnmSsA85G+OgnbYgKe2i5egAwi7u18qXa+U90JSizPoZyf8EYcx09U7QYFp9HXHUp3nq2YHL/FFKkHLA9BWKPI0X5kMfL4YPHSQoO/ZguW6DhtnAzK9VvGiCAbz9OLnn5OTSrz+5GeweHCXYv2Uzv9qeqtDJXgANQn2pQhI/ce8RfrcR1Lx0V0y9tpW1OF3AtU903atZ2z8Z8ROXcdkpeUyhlKIIR7PhPRUWuACUvB3gJodEACVWTAxDVFmOEuPnO8q6iQlfCMq2TiSDHM3Q1cbahsrSwb/4ZvJ9L4zfsD/pqzAuTAxLR+IjbRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GswoXALhy+/Dtmh3TmeolhMZXs7PIoNnNQOiC8u+dyg=;
 b=Kif7GvhZW4ZHBRg1yrwQtD6ryfY7pOusxrVeYku8fuKa2HoWoNQhLf3Qry+nw1vEmH7m26fjOU+Fv9SfTJDAE9OdY6cMic1mTn3Ia1FPfBoU3aLFveTY8MQedgTbMqACZcchGBn7M78ln6ApK4lybAEY9gRrLNVVIbv+Ckx1DYHDld3ei8qqfkvB+/m0f/SEnLXib7DUiUQ8eOE6B/2/SZ/icKRbw72aaW7zOUcs5pLdfdDrKRwsGU/63x3HWiUvDdu6kPu3E/jcLXW1g7D8osEoyD3BT0Dpl84Jm3JD/5H69ioK/L3eC3NdJSh6QRDlR8e1oUJIJJ7/pii3vrkUhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GswoXALhy+/Dtmh3TmeolhMZXs7PIoNnNQOiC8u+dyg=;
 b=tHphKCam9jIB9wCfRDMLbQLNs78WmTmGZ8O1DoJlIiBvjABWpxK6TP3mOC4dkJkUfxF4EF6iL3MlUI9KsD3FXEvdTNfgqO4wBigfD0IBtW8PATNxAhWFppL8A4A4oetlRprQF0+6GZNP5Ucks8d9Wxta2dxswfcQNl1jgUbM2R4=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MWHPR11MB1822.namprd11.prod.outlook.com (2603:10b6:300:111::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 05:44:01 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 05:44:01 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Rao, Lei" <lei.rao@intel.com>, "zhang.zhanghailiang@huawei.com"
 <zhang.zhanghailiang@huawei.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>
Subject: RE: [PATCH] docs/COLO-FT.txt: Drop deprecated 'props' from object-add
 in COLO docs
Thread-Topic: [PATCH] docs/COLO-FT.txt: Drop deprecated 'props' from
 object-add in COLO docs
Thread-Index: AQHX3DRmt363TEKHgE6P0jV2EySvMKwIxcAA
Date: Thu, 18 Nov 2021 05:44:01 +0000
Message-ID: <MWHPR11MB00314E8271D9B2E22261C6EC9B9B9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <1637209041-15080-1-git-send-email-lei.rao@intel.com>
In-Reply-To: <1637209041-15080-1-git-send-email-lei.rao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13bc64b6-1f69-46c8-4532-08d9aa566cb1
x-ms-traffictypediagnostic: MWHPR11MB1822:
x-microsoft-antispam-prvs: <MWHPR11MB18228C7BA9F2E9FF032ECC969B9B9@MWHPR11MB1822.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:486;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /IBOgv21Rk1NamnKvJ+3/dNyGPuhUPdeT3ytuAX6019c+2oJjVZZwoHwylFa3D1K/w4uhZS545VExO9PNODYv5enqUBERpHLMYyFmEFMz1S67OqdfkmcwuE5F2gIV+NAIdLe+nRrdMLrzrQ8W5NzbIvLwLUuJvhoE84E6EX9/6PpRhxCmXwOXrvt+7hYsw0bpFRvkWk3jlGKXhux4paEi6VTqJUgWZHEED1ikHxe6GEA6WF38rgtjIqCSMMEhbTQ0F9QMvlpJQs13wNUa8+avlgNv4niF9jzd6XCgPiqXDml9Z7HFi+AN/TGEaIhkrhl78cI/NqGXXv7PAe0pa3k7e44Z5KwR/clbsu7KyR9u5XSLobeEeHjZrmSjs2ftGTb9gib+zliTSSzJrRH4o/oRo2Mu0ARH8MSZCY4Z8k+6hLwA8cr2bk2MBL2jKbabYXeXwF/zutofTn7WVIvqGIXPoWgThuTeX8vbUMQ+rYMC2GUUAyzPFhzHLbZcosQmIAeVYtOQ021wKfyaP8Sh56KVZr3hvclAe4en6f3hSUfcECG4uHwzlaz9a2Sf9yhQpSUT+PD+KUYNvSPna9V5kUXkEm7EkGqi15zhW21VVVPSJQFHvExekktoDuPQiM1mgweUQDHZ5huUxC9PKPE46j6ri3/Dys9KM5IYbqcfOQwZXoqNUzHtBPI6de+WitdzcRhCXsjegfVlSAcY5qEgNzpgw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(5660300002)(9686003)(38100700002)(86362001)(66446008)(71200400001)(7696005)(8676002)(82960400001)(55016002)(122000001)(26005)(52536014)(8936002)(110136005)(6506007)(76116006)(54906003)(53546011)(508600001)(66946007)(4326008)(66476007)(186003)(83380400001)(33656002)(2906002)(66556008)(64756008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rOXrbfILrjAXKu1HFoRgo2vc6Uc563xRWpq8LAzNzEr1oGvTNNouRptHNIFL?=
 =?us-ascii?Q?6sdU2Sse6iJIhIVmgHlu3wwLbG1n2pUerdIeTwsb7nPTQVAg+32al8aow8nA?=
 =?us-ascii?Q?E4d8u5pB6oCM+QS7jbKE/kYf/EgmGahXn9ONZtHnlt8ftF+DmfT1CuPTiRtC?=
 =?us-ascii?Q?Y3iiEf4+uqMTZD7shre+DZ22SoY3KJp/MHegeryg40n6+5TXeml58UvDXgdG?=
 =?us-ascii?Q?wSW+5Pl+PARaSK43cYKhm9LucwT02eV0CM2ZfhlEdcHFYio6CmlAutqJR7KM?=
 =?us-ascii?Q?DThkOO6L/E8SzpDHESLq/zgqwmdpmUuHJttSVGzcUTfIwhWk1QSjouA9ixlW?=
 =?us-ascii?Q?6h2/mplpNN3JQnMMGXtqJIh5NX+ZHvUZj5+uHpbJtVmHqDAnXmc63g+LF04p?=
 =?us-ascii?Q?dphlw9jo2OdgCDj0dAF92J8qEhzgJA0gbnTQkhaNjVCwvljuNjUq/waru8VD?=
 =?us-ascii?Q?KGxU8nPAzTzaLFSbVs+Ml5TKfdbhwSJjiPjLgsJrUh3NwX/SvovCg2ciRYpz?=
 =?us-ascii?Q?pDPO1nOzBGG5Bla8nMjbLdo72n6oEY+/zAZ1Y0Ea58ex2qO7coe5xbFzZbrB?=
 =?us-ascii?Q?TAUi3QRH7a/bnWQy0JVwlvXTzY8+YleGO0UokbPvEIzXe+IHtc/rRd0N2J+9?=
 =?us-ascii?Q?aKZfSZNTv+S2av+A7duya1qeGIsZns6rPn8z2QAoNB+ZG3WJdVTZ6cjz6NTn?=
 =?us-ascii?Q?Hn6xrYDWqmbNzliqpnlZ3rhwjcGZpIbdtG8y8keX2Lihsk4RE3KCEJ1JGfzk?=
 =?us-ascii?Q?+HQO7hncu/JvhznfzLlScTbiOGezgRhH7Nl5YdYVlM4U71dzWrSy+8BPUy//?=
 =?us-ascii?Q?zevTJzLTBheC+AqFkcyjvtp3SA/ZA4AHHurSIKhKdZFAN52+j6/ekwEJdYM4?=
 =?us-ascii?Q?UZHO0UfAfmhgtBvkBSOB1AWamq+rne2PjM4R5637rJ6orKi688o+G1Ab/ycq?=
 =?us-ascii?Q?u2f7jAFUG0LAO6hXmpVPkjl7z8t0rYOiuZOKZKizzpIe9kBtzfgqe9jZVr3h?=
 =?us-ascii?Q?kUbtbTCxpDOT8SDmrtXeWau/cuXiYqCW6CZ3GJ1Xn+3AEVJOM2cQEhFnkUMV?=
 =?us-ascii?Q?STGpQe7HXFssKyFUO/4UHRXZ/lC/qOtHb2aSyY6Qxdibj47MhZn5JoweE4in?=
 =?us-ascii?Q?B8NH7ftVWniU0KnnUwinSHrYnRi5nRABcEecsIgNMko1fecPttYFGnI2qytd?=
 =?us-ascii?Q?kbCnVmvQJPFrcclA3zFTyzEoJ+y2bFNyzvgGM7xkiFRBQ+l4NuMXjkScttIY?=
 =?us-ascii?Q?YUxbulyzSqLixlEzPfz7Ll2knwT6CyzgYZHe+tQjQpfqXzODIDLZg8ZBur1y?=
 =?us-ascii?Q?/tTUD1nykjwOXvsnEXVm1+0/5Z3Up2AGxjssj9pRwg4cLYIJCur7pE49H72c?=
 =?us-ascii?Q?Oi3iZ41xmWOFtFXxVBsN/kDxQyyGukeLbBCQKrNxMB56uX+ZAgd2Msf/4Gqw?=
 =?us-ascii?Q?fjGOTsMxus7euPPFLYuZoK1GI2ASQQE7cHphQt+T32gx7/Kgoj41I5HqRmC0?=
 =?us-ascii?Q?oLiAsj4fiq2jNUwIwBWDp2dxvSALu8BY04GXoMLpg+U/1NNsLbCJjVdK85q/?=
 =?us-ascii?Q?JjahxzFvw8JfK23U6ciR6jHRanXhMbeDr8S0zY9seHy5t86CoWPOxtdBQw6c?=
 =?us-ascii?Q?rawpIX0SLKfQSSh/NakPTtU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bc64b6-1f69-46c8-4532-08d9aa566cb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 05:44:01.5692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2e0CRONykWCAw+E4/O81F82eJ74o9VUWUb+TZF21Q5VvRvwjwyoZsJ83YMPjt57u8mbJ2W4K6lrJk3NopfT1AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1822
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Rao, Lei <lei.rao@intel.com>
> Sent: Thursday, November 18, 2021 12:17 PM
> To: Zhang, Chen <chen.zhang@intel.com>;
> zhang.zhanghailiang@huawei.com; quintela@redhat.com;
> dgilbert@redhat.com
> Cc: qemu-trivial@nongnu.org; qemu-devel@nongnu.org; Rao, Lei
> <lei.rao@intel.com>
> Subject: [PATCH] docs/COLO-FT.txt: Drop deprecated 'props' from object-
> add in COLO docs
>=20
> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> With the removal of deprecated 'props' from object-add in the commit of
> "50243407457a9fb0ed17b9a9ba9fc9aee09495b1", we also should update
> COLO's documents.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Looks good to me.

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

> ---
>  docs/COLO-FT.txt | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt index 8d6d53a..fd5ffcc
> 100644
> --- a/docs/COLO-FT.txt
> +++ b/docs/COLO-FT.txt
> @@ -289,11 +289,11 @@ Wait until disk is synced, then:
>  {'execute': 'human-monitor-command', 'arguments':{ 'command-line':
> 'drive_add -n buddy
> driver=3Dreplication,mode=3Dprimary,file.driver=3Dnbd,file.host=3D127.0.0=
.2,file.port
> =3D9999,file.export=3Dparent0,node-name=3Dreplication0'}}
>  {'execute': 'x-blockdev-change', 'arguments':{ 'parent': 'colo-disk0', '=
node':
> 'replication0' } }
>=20
> -{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id=
': 'm0',
> 'props': { 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } } }
> -{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector',=
 'id':
> 'redire0', 'props': { 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_o=
ut' } } }
> -{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector',=
 'id':
> 'redire1', 'props': { 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0=
' } } }
> +{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror',
> +'id': 'm0', 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } }
> +{'execute': 'object-add', 'arguments':{ 'qom-type':
> +'filter-redirector', 'id': 'redire0', 'netdev': 'hn0', 'queue': 'rx',
> +'indev': 'compare_out' } }
> +{'execute': 'object-add', 'arguments':{ 'qom-type':
> +'filter-redirector', 'id': 'redire1', 'netdev': 'hn0', 'queue': 'rx',
> +'outdev': 'compare0' } }
>  {'execute': 'object-add', 'arguments':{ 'qom-type': 'iothread', 'id':
> 'iothread1' } }
> -{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id'=
:
> 'comp0', 'props': { 'primary_in': 'compare0-0', 'secondary_in': 'compare1=
',
> 'outdev': 'compare_out0', 'iothread': 'iothread1' } } }
> +{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare',
> +'id': 'comp0', 'primary_in': 'compare0-0', 'secondary_in': 'compare1',
> +'outdev': 'compare_out0', 'iothread': 'iothread1' } }
>=20
>  {'execute': 'migrate-set-capabilities', 'arguments':{ 'capabilities': [ =
{'capability':
> 'x-colo', 'state': true } ] } }
>  {'execute': 'migrate', 'arguments':{ 'uri': 'tcp:127.0.0.2:9998' } } @@ =
-318,11
> +318,11 @@ Wait until disk is synced, then:
>  {'execute': 'human-monitor-command', 'arguments':{ 'command-line':
> 'drive_add -n buddy
> driver=3Dreplication,mode=3Dprimary,file.driver=3Dnbd,file.host=3D127.0.0=
.1,file.port
> =3D9999,file.export=3Dparent0,node-name=3Dreplication0'}}
>  {'execute': 'x-blockdev-change', 'arguments':{ 'parent': 'colo-disk0', '=
node':
> 'replication0' } }
>=20
> -{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id=
': 'm0',
> 'props': { 'insert': 'before', 'position': 'id=3Drew0', 'netdev': 'hn0', =
'queue': 'tx',
> 'outdev': 'mirror0' } } }
> -{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector',=
 'id':
> 'redire0', 'props': { 'insert': 'before', 'position': 'id=3Drew0', 'netde=
v': 'hn0',
> 'queue': 'rx', 'indev': 'compare_out' } } }
> -{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector',=
 'id':
> 'redire1', 'props': { 'insert': 'before', 'position': 'id=3Drew0', 'netde=
v': 'hn0',
> 'queue': 'rx', 'outdev': 'compare0' } } }
> +{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror',
> +'id': 'm0', 'insert': 'before', 'position': 'id=3Drew0', 'netdev': 'hn0'=
,
> +'queue': 'tx', 'outdev': 'mirror0' } }
> +{'execute': 'object-add', 'arguments':{ 'qom-type':
> +'filter-redirector', 'id': 'redire0', 'insert': 'before', 'position':
> +'id=3Drew0', 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } }
> +{'execute': 'object-add', 'arguments':{ 'qom-type':
> +'filter-redirector', 'id': 'redire1', 'insert': 'before', 'position':
> +'id=3Drew0', 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } }
>  {'execute': 'object-add', 'arguments':{ 'qom-type': 'iothread', 'id':
> 'iothread1' } }
> -{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id'=
:
> 'comp0', 'props': { 'primary_in': 'compare0-0', 'secondary_in': 'compare1=
',
> 'outdev': 'compare_out0', 'iothread': 'iothread1' } } }
> +{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare',
> +'id': 'comp0', 'primary_in': 'compare0-0', 'secondary_in': 'compare1',
> +'outdev': 'compare_out0', 'iothread': 'iothread1' } }
>=20
>  {'execute': 'migrate-set-capabilities', 'arguments':{ 'capabilities': [ =
{'capability':
> 'x-colo', 'state': true } ] } }
>  {'execute': 'migrate', 'arguments':{ 'uri': 'tcp:127.0.0.1:9998' } }
> --
> 1.8.3.1


