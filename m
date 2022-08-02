Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A1B587A91
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:18:48 +0200 (CEST)
Received: from localhost ([::1]:42504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIoz9-0007FP-Bl
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oIohC-0004ho-Rv
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:00:15 -0400
Received: from mga04.intel.com ([192.55.52.120]:5245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oIoh4-0006AQ-Sf
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:00:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659434406; x=1690970406;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AzKw/xnUm168PjhxxEVvuPNanydAlo1HN2A1rJTDdCQ=;
 b=hNXdrHl3eqMRlm7r1wzQbnTZ+scAIOg0B5t1bZVi/t7BOylvETr/vaT2
 CRA9qoA59Yt/pwhW5CHu/CsjvCwBNkQn2V3NhVWTF0ZkJ1RPftUcOV4gU
 OugQy/mP0kopSOprWrKVgq4+U2pYHcmN7+b/oN7F8An6GiV/73+awg6MY
 8z5VbRRj6DFq+h/vbH4cMjI+5ROPeJeAcJKevPRqKBU92GAp85CReQgt+
 TH4Ix6N2KnKWOaHmi9npJ6i2Hui06dCkyNxQ8f7ApuEyYYKb9GMUYeoup
 DQ0ML4JPBPNZ8Nn8YMoDGeQyZvagRu+L4gnaedymlVQ3TbbWbSEDr+o45 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="288128675"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="288128675"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 03:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="848150963"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga006.fm.intel.com with ESMTP; 02 Aug 2022 03:00:03 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 03:00:03 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 03:00:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 2 Aug 2022 03:00:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 2 Aug 2022 03:00:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYLKlljwOo2zidZoeop3R+3TxuWNq6jBG6Jb+wVbXplQJ3Lf1JQCIYqBvUkx1bih0NBvznKX7rcAVrFJ1EA5K9oXCEwjG6ir2xgN95SemfSOjYLfTjVVUUjPDINZ7m37ddpJe6QhOZZr5aNQxH+qk2MBSVWWQLCiJ5kc8aWIs4s/yllZOH54/Nmz2YQDdGMPKrLvzUj/b2uWuEJOt1dVhGPFmRHRv3VWi/owRcJsYMBLCxIr3DWolX6JD2ihh8tr+8SLWii1Y0ooL8aDMYPGeDXEhFtlnqZVwVZ5k0pnIbm9G+ujzd6jv1GAz6dRASG2aCCZXaU9xnm4vhLx0BDLTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRJ1FRl1aAvZdRaTnEK8YppY39MrFsCqptMm+YxO/3s=;
 b=HUzR7rzRmowVmxAVqwqJNwD8WwV9OL82l0/9dziLmkfVt9Rwh18jqSB3ZbEUqZVN3sWmZ8LRIGELFQApc4jS5278NucgRqEE1fTSMWehP9yvnUj4/VuvqkcXulbaMifUuU1KLK2b1uqiN/78QBtfFF3J2WxXkiXVtppCZ83++vxndPkdzG8YtTxPS/t1JVeTG9WSPtV/ABf4y+7h2/jIQTQ7Hb/OsrK6v3Cp1lIKZ0k/UbqV4ukMGAgP8O5tvDZQ8JbI0g6h0gPpbyDyncF5TwHr8V+bcD8banbPVPgHyGhBy7M3DtjJ/BGeNqsbCyacaDQJdYZzqCQza/4Eztdmhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by PH0PR11MB5783.namprd11.prod.outlook.com (2603:10b6:510:128::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15; Tue, 2 Aug
 2022 10:00:01 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee%7]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 10:00:00 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Thomas Huth
 <thuth@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>
CC: "stefanha@gmail.com" <stefanha@gmail.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>
Subject: RE: [PATCH 0/1] Update vfio-user module to the latest
Thread-Topic: [PATCH 0/1] Update vfio-user module to the latest
Thread-Index: AQHYpg8uptYhFuQmokSTcIwK7NhG7K2bT6eQ
Date: Tue, 2 Aug 2022 10:00:00 +0000
Message-ID: <MWHPR11MB00312737931679069FAAE7AB9B9D9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <cover.1659403195.git.jag.raman@oracle.com>
In-Reply-To: <cover.1659403195.git.jag.raman@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfe378da-deb1-4549-0c87-08da746dc37f
x-ms-traffictypediagnostic: PH0PR11MB5783:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p3Ve1yhRbq7Sdh6aTOMIXPvA65ri1d20F3n1+nMQZ9cPE/Vwj/nheK8XNYkZnsMzS6Z+1XOl/BYei54MvVv43BVkxowz06Eu0UXDCExDva5jSCfLWuqZAnKVgdqT0qk/N0tibQHbesH07Qye67ZaZLF1l+OAcvdd/L1mpN5HOTZ9eDcC70I9xgWx32NeqjgH9/fCXRW3sgz49RAcNuAIaBjCt3erx57Yxp+93bjblWqhhdeQ+4MbdcV8Gt6U0Tn5lGuNFoEYEUCi0SiYeuryWYu+qZnwVJmyLCnpr59n64Hof+V/MxWuUYg+BY31Hy+FWTWk5gBKpw/iCKDA3SFOmF0FCICOI761dsRkridUoSn8Vbz7Nx0ReeZG5DwgqjSsC76YN4ieVnjn1jWhGHePftnk8F+S2e5VRxYJfBKAotCBuXLuChwt4CDJ77kj2wUYyt6EnbvPvz/00U0jS0aSq/1/IlXtELExM1wNQogE0l24GF6qU9fjaJEC/2gVkhWIzIYrxP73nlR2yQ6SjLoZxXiRroFR1EEeqKo4Avy1dIcN8A2qnC7QF5F7BSo0gCDY+dTNJ59zXsbchZNdJbYHrtlF4Ba+JM26TMyKt3/3qVxcrciadt4kVnLAS2DAY2Bqy43qCwgxduj+Nc9BJYstQsnoEII5sfi+qgYlZWqFRc0kTHq0d9sD3ozhDYX5z43eoKufvqVRe3mINEMbUJVE6hL1QJc942V0E95d3wYhw+cHdzclYrzNC+eaYMnrp437U0ZimUZ/0mvYMHsCwHnLDwVF5ZKM64Glc4KR3A1SPVQOGkI+DqxFdE7qcLtIcIfb+2Pwzs8vi6ffk2kflkmMSA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(376002)(39860400002)(396003)(366004)(316002)(478600001)(41300700001)(110136005)(54906003)(71200400001)(966005)(15650500001)(55016003)(66946007)(64756008)(66446008)(66476007)(66556008)(8676002)(76116006)(4326008)(4744005)(52536014)(5660300002)(2906002)(8936002)(38100700002)(82960400001)(122000001)(86362001)(38070700005)(33656002)(9686003)(83380400001)(53546011)(186003)(6506007)(26005)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Pe+Dfis7y2UHJoVKN7iGuRJaAO1sQ28TPXr1xc7TABcUao+SYsiVOEnQ1t3R?=
 =?us-ascii?Q?/cRVy6+OngtDUyN4+XdTamelmtnErB6+cAmnah0MFgM2SidxdOolcpAptMCH?=
 =?us-ascii?Q?/yl3RBkdQ0bohHXkYXQjmYHzRBDcfNKUW37cgYM8Mt/ycXE3cyg4RQBy0rnC?=
 =?us-ascii?Q?CLrB+QiCzlUTfkMqxutIAaajjSHkEdU578PyzhMEdts8G5D2u05aUe7ugtQu?=
 =?us-ascii?Q?YVVajQl5VP2SxHGMBV8a1wGXZk6KfbhR6QNrfDGhKMYB4oqK+jmHK+kCjpIc?=
 =?us-ascii?Q?017VttvGHijpO+iEslVTtQGvl93wET8Xav60RFjvc2MePzIFn0WGkfrqt2pp?=
 =?us-ascii?Q?cvg0WiYQyeY/BLvInIu6SR3GRpT00VogWsQj6RO4BfTHhKY2ag31zDsIUcDl?=
 =?us-ascii?Q?RLZClBuNRYrzoCeQTrmsQMztz1bROSxiMWatvBB5P1WfAatVUTjZbcM5JYLE?=
 =?us-ascii?Q?/DSpJG4CTRXSGnGaXRcW1mIvYglFVuUCmlkloIhhOIAPp0f7LZlNKt4wr/JI?=
 =?us-ascii?Q?Xj8WXgLtI5F/Y4yUiQmAYFD7ZQfRMBxFi2ok7rK1Taozb8Jo/xSOBGI4hRFc?=
 =?us-ascii?Q?srRNeMBbWFwnc4/hVCiJnrgv+NpuxA4LpmbN3Oe08pA+oclYAOlt/QFoifSe?=
 =?us-ascii?Q?hZp4rdWT78NARZ0AcpueZ4PSfxdlFzI1EsI7pn++W9pbHr5MegrSjpkQQIT8?=
 =?us-ascii?Q?Mo9IQ/VS2OYLwZ1bYeqbuK38zrg4x/Ocvwd67Lx8vpQRINqNmd/yCjSAQoDQ?=
 =?us-ascii?Q?GF/C61bSrn4i3i+jzRBea2hAB8zkIk6C4BaxTa6VfYTMl23E5X+izixT/0pb?=
 =?us-ascii?Q?O3Gwuv/vtgvFJjc477BJBcvZ8/eGRkQ3shT7SJDyKzyNLRvOhDkUsviMyzrD?=
 =?us-ascii?Q?d28tz8k5Y90+6MtNRDmb3BhkYLknUY4WRU6kcihST2L/vGkJ6LFBZoB+ib9m?=
 =?us-ascii?Q?EdnUIo+uYIvFqAYDagCvc+m3nlJt9uLjUgrz0jkDvTOioyYCvHK5sVhbNwse?=
 =?us-ascii?Q?BRuIVx8MkCrk4RpNxjQ6Wtp1Eq8SiqYarYYJRtRLPOS132hkRSkHjZQPof7X?=
 =?us-ascii?Q?yFhNs9zjC45urwUXc9DKSKCPX0m0YLatk2qwRVU4XE44Xx4w3d6DOpPKXYeA?=
 =?us-ascii?Q?5wbOdWUtnpjtIy/TBW7F/E3/vPu+HGzGx5R95eBCpEfSqIhisQUo71vuJ8f8?=
 =?us-ascii?Q?3HQ5MJV3tRWAzxbzPB8XsOF5Vc2NkyRlkLZNMbIh9TGuKNcNYaJPDAVCUj4w?=
 =?us-ascii?Q?+PIFtrcNavlsSyCu4aXMQT3kl8PfdIRXD13LKnKbaJQ3X6+/bxtF7gdNsqY3?=
 =?us-ascii?Q?LcGV8xD6qb6aiw+Hh3sF4wdZyhn5rP6GqbI4XDEIG3yv14SnmBLcUTDfgb/2?=
 =?us-ascii?Q?Cm5jbR9pRxFAHoGT5aMADm/PPrAinOPzhk6Fvtsbv8Ci+O3GHCDZUvKsf3zu?=
 =?us-ascii?Q?yAEENn9xbWyaG4WEsDsAQhsPpjbx4CTobq+k4f7evAhVyfihhv2+CNUWGLKM?=
 =?us-ascii?Q?3oJekReYbM80xCAMO6xHSvTo7CGrgrBVfU8m3CCiecbgdkFKif/uUBF1Q5Uc?=
 =?us-ascii?Q?RERdAPCqmE3QxpkNNPWfUp0ISLZJ0/qmrKHDvm4G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe378da-deb1-4549-0c87-08da746dc37f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 10:00:00.5862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6xTWUjTKbOwHPLyNGh2Ii58/LO4uc8Y8GdhcmKk9/9JAuFONioVX0UitKJ+A+wV0Bc7Mg4D+e2XhfwaTItM6Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5783
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



> -----Original Message-----
> From: Qemu-devel <qemu-devel-
> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Jagannathan
> Raman
> Sent: Tuesday, August 2, 2022 9:24 AM
> To: qemu-devel@nongnu.org
> Cc: stefanha@gmail.com; berrange@redhat.com
> Subject: [PATCH 0/1] Update vfio-user module to the latest
>=20
> Hi,
>=20
> This patch updates the libvfio-user submodule to the latest.

Just a rough idea, why not depends on linux distribution for the libvfio-us=
er.so?
It looks no libvfio-user packet in distribution's repo.

Hi Thomas/Daniel:

For the RFC QEMU user space eBPF support,
https://lore.kernel.org/all/20220617073630.535914-6-chen.zhang@intel.com/T/
Maybe introduce the libubpf.so as a subproject like libvfio-user.so is more=
 appropriate?

Thanks
Chen

>=20
> Passed 'make check' & GitLab CI.
>=20
> Thank you!
> --
> Jag
>=20
> Jagannathan Raman (1):
>   vfio-user: update submodule to latest
>=20
>  subprojects/libvfio-user | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> --
> 2.20.1
>=20


