Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E28753E138
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 09:01:33 +0200 (CEST)
Received: from localhost ([::1]:40156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ny6jz-0006ZO-Bx
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 03:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@intel.com>)
 id 1ny6DR-000103-7b
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 02:27:57 -0400
Received: from mga03.intel.com ([134.134.136.65]:1744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@intel.com>)
 id 1ny6DL-0002Em-Rp
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 02:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654496867; x=1686032867;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3W9akdXJq/vphoscbASXhh8F+E2/qDH7gO0ZR74XGrY=;
 b=fFyJupYIBZxe9lF+USGIfM0QzKVssXC1XHlNDyPBQJ1RTs8jo4bWecJK
 bDpWfOqHhC5g0vjDdfeKxFiSJ34sLoYMD/AtfAGADP+G4aEniSpf6oumv
 jq+TPNo8TLXQD2cuB8FEZkN4d3IWqLFU7UOWgYv8IUFj1lggaVIR9Zk2S
 W0xIjBRvFrUkbSaTMLLPBGnUiN9gYoC/tgKxbLJCi/32iaYO/fXSH6+Dg
 qdJR9ERTHmBREA631vS81HwyXTdsH1nqfC7YcHJDgnkB1QlCizvwAsEU+
 W3swRItxXCsRlEumUk0pfxmbLN4lH3C2xAK0B0szgN7zJUIA0p6udMRvJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="276795446"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="276795446"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2022 23:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="906393627"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 05 Jun 2022 23:26:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 5 Jun 2022 23:26:42 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 5 Jun 2022 23:26:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 5 Jun 2022 23:26:41 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 5 Jun 2022 23:26:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RltsQcYmbe8DwYs5UnIvC34HdpDSm7Md3dTr/AHG00eGJ9X0A8rGw9StNiSP1539M4WDJNEIRCT+Dh+t00FRB5tkPZxdsy83gt+4v6wDTgApP5VI4/elCibs+ubzPj5AqLnGy9LgZvUlRbKJoMNBh+pUkmGvtGVpm8a1+A9rsaAq/EszY+Y+lJP5OccFL2n+yolvAZz3o4Rv5N4FGRx2TLpVrkmNLPCjhybnWdQ3gy5dLrQ6t4JxfRJV3dRdeJvuS/fyv1TiVr5RGFhUAtnE4peSNdmLCPyGOYQunLgUUuwBa52NPBrrvmhjs26ScLRYFSBTJNb46rXxorHOJRwO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sDAqDKcRHq6NFlcwJLj/qTqoAbiZ1qs7KxJ4OCTPC8=;
 b=EyE1FtUE5wUW9pt2IVoP4jl+5DmI6mrM6Eujl8G2pmLndFVjxLQbJUtqt3EUC3Bge//QcG1kAcgj7HJQ/S1ZE1JfDtv2+o2+bFxT25Nv5vRPbKk+NmGfpIWjP3k5yTzOfqhmKrzxMqb8H5QKC6N6RMvZLNuGRwUhQ/SF00g777xurLYBhXKYuAEQRR4X0jjC9yr/zcJllrDoHIT2t8IIxC7N4NyYHXCGDzxr7vPtF8jRDy9mLjUhUFxxQEmxfhCcYN4BIg9rCL8UMrEJEsIVJ8bz/6mlpd2FsZaU3a1uBiJQ0B5OeN3cXGdp1lZaR25s9O8Voeu14YH2FhMN74QFBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5453.namprd11.prod.outlook.com (2603:10b6:5:398::15)
 by LV2PR11MB5975.namprd11.prod.outlook.com (2603:10b6:408:17d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.16; Mon, 6 Jun
 2022 06:26:38 +0000
Received: from DM4PR11MB5453.namprd11.prod.outlook.com
 ([fe80::851a:a55e:1b13:748d]) by DM4PR11MB5453.namprd11.prod.outlook.com
 ([fe80::851a:a55e:1b13:748d%3]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 06:26:38 +0000
From: "Hu, Robert" <robert.hu@intel.com>
To: Robert Hoo <robert.hu@linux.intel.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "ani@anisinha.ca" <ani@anisinha.ca>, "Williams, Dan J"
 <dan.j.williams@intel.com>, "Liu, Jingqi" <jingqi.liu@intel.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [QEMU PATCH v2 0/6] Support ACPI NVDIMM Label Methods
Thread-Topic: [QEMU PATCH v2 0/6] Support ACPI NVDIMM Label Methods
Thread-Index: AQHYc9cRg/tP0R+YoUCIQ5bZ5sgyH61B9QMQ
Date: Mon, 6 Jun 2022 06:26:38 +0000
Message-ID: <DM4PR11MB5453B7809D32D982A9437503E0A29@DM4PR11MB5453.namprd11.prod.outlook.com>
References: <20220530034047.730356-1-robert.hu@linux.intel.com>
In-Reply-To: <20220530034047.730356-1-robert.hu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cbb0ffd-d324-4084-4969-08da4785832f
x-ms-traffictypediagnostic: LV2PR11MB5975:EE_
x-microsoft-antispam-prvs: <LV2PR11MB5975C2CC9B429F2D3B91A4F5E0A29@LV2PR11MB5975.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sf7R6yUNdlPCW1xf5KwUql8XVbk/Al42z/SCbRh7lGeZMrk3dd/95RoIxAQfl6rKRmtThjbU/xkz8LWmr1WsmWWlLQ+s5Gea3jSaRljGcIAVlahaJviOHxTDhvvWkMExEPwOigtMD+ErX+niICBs8YTD7/2OxAjl+JVI8Zjpb2j+Scl1VBwCcv4X4gHdpQuMHi+GzVap8zd53ZRUttJrF29yK4m0jXY5Hqb7n3OTEpBd3ZN4UNcIcCwRyG9qJu5vNzofmUcxf0kIrOK/q8JcX5Huwlhp1NdaaE4LcNLuTkCYVwtqV4tQjZPqZCY0jdkN4S/ivGyLC4quxaWn0saRpswAVUVzFKIVX8lXfadSih/7WsJ6sGiVs2iL5K+jAVHHtTJHBwMT34Qa/jY4NPZb11UWNpM/HotClFBgWwqyeHJ7ZTSsMdbn+O2gac3F1J1FZGtYT4wQIi1NRUwy8US6O9qHiU4ywtDyY29FXvKX9xYOBFJY/qvrOr6uI3QMbB8yDoAeVM4m7Gjkwb/MJdAeacPn/NYNaeQWtIr5j5Gc3qtLYj9hwSynes6Lzs6h6q7ZrLLb2jokFCD0BuNPdX99m6LbvWgb6fn48XfXyN1dJSMfVdBjOJ+s2W8TK8BcednatR5warnypWagKFTLC/tQDGN2EJJZZT2dXfaXHRY4c9z3fyrfDQIk1yFJVnYDBEk79sCWaw/lJf60PknC12tovBG6oKaVezwD1QRAu6Wim218siO7prfNeK2sZyWuhFw2F6Z6rMX8AQhs4LRTjPynVYMpRySxSbyrkfgr5dM3nG4nYZXg+Jn59NwYST50SWHsVaHMmtuR3nBy+2XkWX2TDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5453.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(26005)(508600001)(8936002)(38070700005)(9686003)(82960400001)(7696005)(6506007)(966005)(53546011)(66556008)(76116006)(64756008)(66946007)(8676002)(66446008)(66476007)(4326008)(122000001)(86362001)(71200400001)(110136005)(52536014)(5660300002)(83380400001)(316002)(2906002)(6636002)(55016003)(33656002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pbMYhxIwbQXOHGmZbmvub8kv5KxzlY0dOxElV7ODj7M9r6dTK47s+q4mRo6B?=
 =?us-ascii?Q?pUtZzdU0xaSABTksVk/g0sVv4U0BZFAcAobwbW4rEHA8Grmf/QQAO+12oKN7?=
 =?us-ascii?Q?pP+RXvBaee66k+xlY+rprUlJlIDJZ9cQDAQtOT3VyN64k+H527Kwo+DcTFU7?=
 =?us-ascii?Q?KR5OrgsJQWBao6ZkfzMQVpwZkqusPJdJq5ItAbcH0iMaaN3kJ4iVn5mnd/VI?=
 =?us-ascii?Q?OllIywW67oEi3Xybp6JdBQoGXDjP2u+KnMmpZFEVfR2FxJF79TRPdsCpJmPr?=
 =?us-ascii?Q?bjF7h49RxhiD93RVM3KoE5sDDgNouJg4VVWsOpAVDgDhswlD3YRTpeCICJuf?=
 =?us-ascii?Q?7dUTru+ooaJDV2blQOrcPYUPCobduUeSAgBeemujrzC+24fsfVZGapNZgEwX?=
 =?us-ascii?Q?AZtvzBKSV1cSSk7VNrnn5LaAOZlvSqChIo2hI0ZYGdht35QO+AvKSw0xMojk?=
 =?us-ascii?Q?+Pgh2ilz9BYYXQ5oZoOJSp2tBKXbwg6gsm4saMr2MCMkd0/vZRG5BokemtR4?=
 =?us-ascii?Q?s29aIpxPQBklEZCDZaq0wTP5wggtBpC1o8FekrE8vxhs1TBnzxVlRqcr7SZi?=
 =?us-ascii?Q?tCZNOZB+uXdGBK6B33TeXHAMAnV8naVq0rL+CRfpg5DQ6dsuCN0LhhX/uMpx?=
 =?us-ascii?Q?BUYyBk8LwK8IExSb1GUUrpIG8/6rDl3Yga3DDIyR85OM/9JLqYAT9qfrNSS2?=
 =?us-ascii?Q?ssR3F0KbOhd5OCbqCtToS3NM6lLhh4Gu522ND3aLqhBX+S0ort7pNCgG8uUi?=
 =?us-ascii?Q?2M7MXwekAPa7uT82uQ8lHhMgCyHctNB2Yw2Hb0zbInLg3TsIHNdNYgp2eZTk?=
 =?us-ascii?Q?5f1jCbec0aeFIS4N3DmNtKWWptuSUgNJyZ5tOj+5WVtNPzV7+W94Q1/E7rzi?=
 =?us-ascii?Q?qTWDHSoXS4f5gpa6sZwoBt9jqEPI1sgahhZkPSbuPAZBy/5M56w8d/eGjA8u?=
 =?us-ascii?Q?Lags2GSLG0CO60O8Jk3PrLa2KM+ZFXVRg6UdPvMcs1jSM5+VIwkEFxN3smxC?=
 =?us-ascii?Q?mAIrhZg2VzSo64FbkIbmzvJY5j66pfdon+n3R3gZLIQf/5bZjloXkDOLwX1x?=
 =?us-ascii?Q?X2XXpi/z9E9wWtZFqByitemdmVh6Mt79b38D2OD/S+5dMDhYgtS4Hz3WW/+L?=
 =?us-ascii?Q?j+8PaDWxR9ZV7m1emnEyGO0eonnejngAueySCTUL7+YT2jHUlCotJm5g1YxC?=
 =?us-ascii?Q?X0DbN6/phw+XhoLNcbwnrNgCdKFxrKvyYojvW09P5ctGdS6H3T+y1/tlQdWH?=
 =?us-ascii?Q?llPno4xI8FFirdqdirztt80U1By6eeGMBOqydGD/rgFdV1DUTkV5YBwjKnvA?=
 =?us-ascii?Q?GPoGti+rdy/s3FDonvJkOvmT1k+p1+n1t0YSlHF+VN7Q1vxNqTRNorWJ8Rak?=
 =?us-ascii?Q?fdX78Xf/P13xDCGqyo/1Nenilv3r55pVgOAd/ORe4dLhkZdejZDvdW58fcyl?=
 =?us-ascii?Q?KO/WlNnLVaeibJ/BxaPRf4fyQ9u41xQQfGy/nAe2w3jyY1zhCcgfK7kagEKI?=
 =?us-ascii?Q?u8z36hAEMclHee4IyLlln0NCC+b3yKcCjgqJUmqbEYf52Fd104HcDAu17+py?=
 =?us-ascii?Q?pBdPwFeV/WYxrsnZbdy8MlRyN/7LoXhOgIUt175tDlivDGLZDTUotODk9iSJ?=
 =?us-ascii?Q?ANXp4THd+LoWbBmlW6mrGvsgOW5dcnH1jIryF8w4r+egqAVOluoJheZhSEyL?=
 =?us-ascii?Q?Rf3ftPr9xHqzWYDnXeUrgPrekDfL8AmId4YlNu1l6BjkmJTBafLQiM61Oiq9?=
 =?us-ascii?Q?MRQtkeP0pw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5453.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cbb0ffd-d324-4084-4969-08da4785832f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 06:26:38.3014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n1S4cLLr+DEIdH/zdYCXX/iZb8guXttVzBoiQpm4C4PQ6ysRURFNn4uXjsNTn0KGBmAkmDEffz+SYJ3sLdvsUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5975
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=robert.hu@intel.com;
 helo=mga03.intel.com
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

Ping...

Best Regards,
Robert Hoo

> -----Original Message-----
> From: Robert Hoo <robert.hu@linux.intel.com>
> Sent: Monday, May 30, 2022 11:41
> To: imammedo@redhat.com; mst@redhat.com;
> xiaoguangrong.eric@gmail.com; ani@anisinha.ca; Williams, Dan J
> <dan.j.williams@intel.com>; Liu, Jingqi <jingqi.liu@intel.com>
> Cc: qemu-devel@nongnu.org; Hu, Robert <robert.hu@intel.com>
> Subject: [QEMU PATCH v2 0/6] Support ACPI NVDIMM Label Methods
>=20
> (v1 Subject was "acpi/nvdimm: support NVDIMM _LS{I,R,W} methods")
>=20
> Originally NVDIMM Label methods was defined in Intel PMEM _DSM Interface
> Spec [1], of function index 4, 5 and 6.
> Recent ACPI spec [2] has deprecated those _DSM methods with ACPI NVDIMM
> Label Methods _LS{I,R,W}. The essence of these functions has no changes.
>=20
> This patch set is to update QEMU emulation on this, as well as update bio=
s-
> table-test binaries, and substitute trace events for nvdimm_debug().
>=20
> Patch 1 and 5, the opening and closing parenthesis patches for changes
> affecting ACPI tables. Details see tests/qtest/bios-tables-test.c.
> Patch 2, a trivial fix on aml_or()/aml_and() usage.
> Patch 3, allow NVDIMM _DSM revision 2 to get in.
> Patch 4, main body, which implements the virtual _LS{I,R,W} methods and a=
lso
> generalize QEMU <--> ACPI NVDIMM method interface, which paves the way
> for future necessary methods implementation, not only _DSM. The result SS=
DT
> table changes in ASL can be found in Patch 5's commit message.
> Patch 6, define trace events for acpi/nvdimm, replace nvdimm_debug()
>=20
> Test
> Tested Linux guest of recent Kernel 5.18.0-rc4, create/destroy namespace,=
 init
> labels, etc. works as before.
> Tested Windows 10 (1607) guest, and Windows server 2019, but seems
> vNVDIMM in Windows guest hasn't ever been supported. Before and after thi=
s
> patch set, no difference on guest boot up and other functions.
>=20
> [1] Intel PMEM _DSM Interface Spec v2.0, 3.10 Deprecated Functions
> https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf
> [2] ACPI Spec v6.4, 6.5.10 NVDIMM Label Methods
> https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf
>=20
> ---
> Change Log:
> v2:
> Almost rewritten
> Separate Patch 2
> Dance with tests/qtest/bios-table-tests
> Add trace events
>=20
> Robert Hoo (6):
>   tests/acpi: allow SSDT changes
>   acpi/ssdt: Fix aml_or() and aml_and() in if clause
>   acpi/nvdimm: NVDIMM _DSM Spec supports revision 2
>   nvdimm: Implement ACPI NVDIMM Label Methods
>   test/acpi/bios-tables-test: SSDT: update standard AML binaries
>   acpi/nvdimm: Define trace events for NVDIMM and substitute
>     nvdimm_debug()
>=20
>  hw/acpi/nvdimm.c                 | 434 +++++++++++++++++++++++--------
>  hw/acpi/trace-events             |  14 +
>  include/hw/mem/nvdimm.h          |  12 +-
>  tests/data/acpi/pc/SSDT.dimmpxm  | Bin 734 -> 1829 bytes
> tests/data/acpi/q35/SSDT.dimmpxm | Bin 734 -> 1829 bytes
>  5 files changed, 344 insertions(+), 116 deletions(-)
>=20
>=20
> base-commit: 58b53669e87fed0d70903e05cd42079fbbdbc195
> --
> 2.31.1


