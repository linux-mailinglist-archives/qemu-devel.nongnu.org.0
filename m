Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7431E558D19
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 04:06:32 +0200 (CEST)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4YiN-0001jx-2O
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 22:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o4YgL-0000WB-1S
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 22:04:25 -0400
Received: from mga01.intel.com ([192.55.52.88]:11713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o4YgI-0003a9-4X
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 22:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656036262; x=1687572262;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Txvo3RC5nlYJG0c1qrI9ZrsnfebsJGZedBga/A7BuE4=;
 b=deVu6THwiQ9qCfFXOiXEmTwQ6No0icwIUR3WL9joay+IO8Z8P3LH487B
 mzuGoj7bcMdptJWi44sgN0qeXgFJV/ha2PFQOVu8+k7mhjq8uqr261b0c
 MKqNq51+d49hfqfKYmjSN2H2nSgiMoZ2FMjVbVST8pxxJiOELc3L4CQzq
 MKxLDD1I5ybgUI14fHNyD09tdeG1XFy9s3JtVoDKvwnvOSX8k5BLqOcxH
 nQePKXPAjd7cz+vos/I7sdd/CUiJe6jeIlTa2KswOb86yWw5t/yMLxdGx
 XcWCNGdGBRjqwRWZPCgJOg0ykWCfctOh5gZOWFfZO1qY2WMXAW8ZoUw14 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="306361890"
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; d="scan'208";a="306361890"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 19:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; d="scan'208";a="593000744"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 23 Jun 2022 19:04:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 23 Jun 2022 19:04:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 23 Jun 2022 19:04:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 23 Jun 2022 19:04:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 23 Jun 2022 19:04:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVtAzGKBBsws/ULFFP3MuEmWy6uALrnemB6/Jvz3LhUdxjC4SxCZAHiuyYlLSXWDJfI699msZs2PScRE6O9xyaB/NosaHmljaDVVgNLGmPr/rbohV1rJSuthNmcvHFPGlYkLO+BWf0e4KiERKtEgDyjONOU5itz1EKFdPynqZmlhfjdP0ds0cHravBJjk/Kasmumxjvb9rAI2uuvUHiVYCov2G2G1eZiAcslvMwQiLuLlNGjr8YD84J3F4Dppwy+8XGIrbm7kBfX+rl8J5Uww4rESf9GHH7XdOriDGuHY2D7WBWmycbfzFmJfliuttA6sde0Ax8BHgHARcNHkewm0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5zwnYMG4bK3vSveBFO/jziF7CH5yBENChEPVbExIMw=;
 b=cRNJ41PJvS+L5hvXy4fALlbgx+UESWWQXgrYsFxCudeDvZjgSsZX0etU9X3KUroa92Vu/SxSw0o8Xg3HBwAmAjZVCnITRpEx6qIXcVs9P8AlMx+krpbOYNPjLMFEQReG6UfK5JF7tFjO9/plAUJJNan8njFuBFEVk1veJM3zHC1p3QTJAQjeRUihx5KqbtSBDu6o0ZG6ENvlXOc1fWH71sZpeZJwegBfQOQ7IVLOChKMOzd34IN4QbCaeR3B74NVVvlitDjulSGvaIfRSlWJHubhOcJ600mFjAB+U7X0sqWb3iwb+GwPkCEacTILvC4W7aCYCmkHZBnDqR2kX+WcxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by SA0PR11MB4768.namprd11.prod.outlook.com (2603:10b6:806:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 02:04:06 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e1f5:a0f0:bccf:9c42]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e1f5:a0f0:bccf:9c42%7]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 02:04:06 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Yao, Yuan" <yuan.yao@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, "Zhong, Yang" <yang.zhong@intel.com>, "Connor
 Kuehl" <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Yao, Yuan"
 <yuan.yao@intel.com>, "Yamahata, Isaku" <isaku.yamahata@intel.com>
Subject: RE: [PATCH 1/1] i386/monitor: Fix page table walking issue for LA57
 enabled guest
Thread-Topic: [PATCH 1/1] i386/monitor: Fix page table walking issue for LA57
 enabled guest
Thread-Index: AQHYe9xdBLdP93I72USqJR6nGYCmra1d47Bg
Date: Fri, 24 Jun 2022 02:04:05 +0000
Message-ID: <MWHPR11MB0031A5DE80B1DE817BFB3A399BB49@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220609083456.77946-1-yuan.yao@intel.com>
In-Reply-To: <20220609083456.77946-1-yuan.yao@intel.com>
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
x-ms-office365-filtering-correlation-id: b57ba20a-138e-4ad7-da19-08da5585d1aa
x-ms-traffictypediagnostic: SA0PR11MB4768:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q7xdVmclCS/rcLvgxMyLdf9rhC7ZaJEx4bCjckqBmjbpxW6p7G4K+d/NrQjw5rIL3w8dSL15f58jJvTQl+UMLHQFZI6IexOu1gUNtZgIDOOxnv+a/xRCfzCUrt61eQerQ5+ujVhzGYgc/Z6qXEkZIp0Jec9J5bZL7Ovg9njf4jSPh3KgSZtwtvmEvDdZTtgyb3xuMm3UY2rxCegQwWi6rqsZAgXc5usd8U//Csn71UtjCdXZlCeCBGWses8sZQAXsvtNEJ7RmskUmHZUyWDTBEnHmYG02uWZlRBGyROtz9StKZLcpH87W3TRuYPUkjG9q0lnqBs0UyKsN8PiU/nq1d3ejKBichzNQ0+dEcDRnqtSFBlwce3oG+mB5OHPtBFv3ieUZbEqnkBrA6Y6zsouGQBootpvd0v/i/P140ybzXrJKgPRo/SWWBkZV7VwzsEEQVSjOF+ZzqLxwFFFJ3oCXsm7h+QGi5bbrpoJMK0Y2uJWJSWxTlZkdWXl2B6Y2MMd3vlaHc6xS7XMQssUO0HU3Mj1rSGGbNXu3q5q0je+ppJ02soPc5sUGggvpeqqFdLo4gXSJZ+YXbY3zSzrbThAst13BsDdJ+k6b1un/kTvfn6FfZoC54J2XjuMQ9aGDyh7S2UDEE1DZxY3K/4PjBgaimnqnltXQy5+AVfq+lmzDAwEKgc70PBKyz4keWb6XPonA+SgltI4dDtXGL7CHrOzGJaFAb+ODpjvoWko3VUT8SsUGv5ManputmCQejDKusuwkBfyHBpsuwODNYk5bOoVcKGih8q/5dP5bXN+IUpxUQP8VdaRy7HYmBt0eP9+KrzO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(366004)(346002)(136003)(39860400002)(7696005)(55016003)(478600001)(33656002)(2906002)(316002)(26005)(186003)(83380400001)(6506007)(9686003)(5660300002)(53546011)(86362001)(38100700002)(66446008)(66556008)(38070700005)(52536014)(82960400001)(66476007)(8936002)(110136005)(8676002)(107886003)(66946007)(4326008)(76116006)(41300700001)(122000001)(921005)(54906003)(71200400001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?GSN4YbkTmLReo/j8az1+bYlmQVvnQ5tcf+tBdAjViexk4b2dEX+N7pJVvT?=
 =?iso-8859-1?Q?ac47N4SfmQFV06qxC4mA2sWYQ7vdkh2fo8dJV6Sb/ZONIA75qsiy5V24Ms?=
 =?iso-8859-1?Q?4b/1Ds5cIqY+iwGDED70syw4B1gqVkFOMcdTut3FGgDdV84pybhMDtbuuB?=
 =?iso-8859-1?Q?JVQNEtyOobr+riALOt68Z5xf33tITsVQV8KUe2Asi5AaBJtyQIlU/RfPpv?=
 =?iso-8859-1?Q?FElimtI6cFNAeBKpEH2u+eyqiINsn22rbh62COU/9AHanVPz1SotQHiU6K?=
 =?iso-8859-1?Q?byXRQTe5ugJWbnDzf3PG6St88Po0prDVCa+EzaR/hPuI8Y8w3BnFSErru8?=
 =?iso-8859-1?Q?lGGzSCYAhHxYltj5UxlGInWjvb4XvrI8LuWYgqGXBMmo6CUV9BNwbcVO1f?=
 =?iso-8859-1?Q?y54i5qb/rbWdQ5z+f0Ljtv40VlY/PnLqf6i0UYloK+6VtNmJRMD2pZMiat?=
 =?iso-8859-1?Q?s7YT3UqcqIk1BooqHmjezBWUoarjOcqUzzFM221O2B6FAOjE5n/LMFn18I?=
 =?iso-8859-1?Q?/bEHoiLkBswZko7oG+Q+8DybHFxfCLnvFtWoZi0dPISUxDZ32c8VJv319l?=
 =?iso-8859-1?Q?VWFtC2KcxA7OjGRb492O1NdEWVSk3luhU8jwnMnJYCsZCcdwuMawj/f17m?=
 =?iso-8859-1?Q?KMrfU8WDWMERIVC0GqYX4XdrGjl2iJzHlWQrGgWwvN35Y1RkCbqFMnfz2t?=
 =?iso-8859-1?Q?nYmrJ8/m3FazngrMYJa8MZvZTElsW7IBZ+C2v2bVpmSX5M6tMDr5Q8THWL?=
 =?iso-8859-1?Q?09s/gdDenehIsUbkqFEeZ9UjjBYZTRVQFAIFBJobDU2YPsBXeBWZ1KkxKI?=
 =?iso-8859-1?Q?Hn7DJPizZcdQY876SZtqt9Vbngk0GJ0hu39l3pBEVNjkHk74gYmOEVV8mg?=
 =?iso-8859-1?Q?87U2ylIvX/FCm2iNJGpqGHPrDAIaXRPIrqsA9NtrRFzPqfiqoYldYs5O8w?=
 =?iso-8859-1?Q?oKijaJ83B6Ig1VbdkiPSO+MlLOvOgxrmOY/8o17Ltk8fx0GTHN61EfdpOC?=
 =?iso-8859-1?Q?y4FkcJlcjlcFQGo9i/cq5XahM4rV5AqOYbNv5Km12YT8kx2tMNAWicLVeW?=
 =?iso-8859-1?Q?62LXaLxqckIVqgOr0uUCO8k9/+xwmz26LpgQZFuwDGz5wLyPeGTzfPdtud?=
 =?iso-8859-1?Q?SPJUdayZdcYP8xxKA0uB2EADYe+w6n50i5hJrnB23W/Jfg80lTHMMxUmxE?=
 =?iso-8859-1?Q?dBS5jtEGFjJ2p5evdT5CXGLwJskWwine3CRCUX7zDdJItR19qfU1KMHVj8?=
 =?iso-8859-1?Q?pcWsHvEc3wplYJ95XPGtzVoCa3akW3Hq8L3QrFmoTH7DNItts5uHXR8+vz?=
 =?iso-8859-1?Q?QHL7JZtd3it+b4DRzsC3v1OeCrGtzXLEtsjAjSAj3K+LKgdOd4i3D1+Qy1?=
 =?iso-8859-1?Q?T/k9UW5nbIqosOt5uC2R3mRpOb25Y/EPC1xs9oRibFin/qVzktpUeFeDfn?=
 =?iso-8859-1?Q?k3x9VOWr1v5zI0RjPPjSMEmK0MXXlBWHmzfGNCHIupwcOjYWaEJPC7v4Ri?=
 =?iso-8859-1?Q?Y0vdUweUjuAaeIUV49vS6VEPoVuSySduTXAGvYJXkalhJRZf8XamwOluFg?=
 =?iso-8859-1?Q?Z4RgFU53aLXUKpIba8kAp6EpIyxbOIf6GwXMpUUR3Gl4ZffdGpOfUJqFqe?=
 =?iso-8859-1?Q?DdBNMgZiRABCAlgDcgCt5Mqe6FvJyOyp1qcXfhE0urEXSzv0Umm1CEUOsh?=
 =?iso-8859-1?Q?SwpGbttPnwv/nmn/Z3aVUw8xCKZtbexapirM8glL2evoyDrqx03JWSf15M?=
 =?iso-8859-1?Q?hwYje9l60yPm9SheaujuMkKpl1bucTG42ZbWrTIFYdqiTOWfAQL0lnYHv2?=
 =?iso-8859-1?Q?9QACIKdkUQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b57ba20a-138e-4ad7-da19-08da5585d1aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 02:04:06.2367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A6dFt654oxLxXkHKvjm4iEoG7GjpMnyV3kYvcTLGIx1wfolSpEfLT2BV4TN6Qz7PGcob6JA/1q82qAG1ufJC3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4768
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Yuan Yao
> Sent: Thursday, June 9, 2022 4:35 PM
> To: Paolo Bonzini <pbonzini@redhat.com>; Philippe Mathieu-Daud=E9
> <f4bug@amsat.org>; Dr. David Alan Gilbert <dgilbert@redhat.com>; Zhong,
> Yang <yang.zhong@intel.com>; Connor Kuehl <ckuehl@redhat.com>
> Cc: qemu-devel@nongnu.org; Yao, Yuan <yuan.yao@intel.com>; Yamahata,
> Isaku <isaku.yamahata@intel.com>
> Subject: [PATCH 1/1] i386/monitor: Fix page table walking issue for LA57
> enabled guest
>=20
> Don't skip next leve page table for pdpe/pde when the PG_PRESENT_MASK

S/leve/level

> is set.
>=20
> This fixs the issue that no mapping information was collected from "info
> mem" for guest with LA57 enabled.
>=20
> Signed-off-by: Yuan Yao <yuan.yao@intel.com>

LGTM.
It should same with the excp_helper.c/mmu_translate() la57 implementation.
Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Add Eric and Markus for double check.

Thanks
Chen

> ---
>  target/i386/monitor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c index
> 8e4b4d600c..3339550bbe 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -489,7 +489,7 @@ static void mem_info_la57(Monitor *mon,
> CPUArchState *env)
>                  cpu_physical_memory_read(pdp_addr + l2 * 8, &pdpe, 8);
>                  pdpe =3D le64_to_cpu(pdpe);
>                  end =3D (l0 << 48) + (l1 << 39) + (l2 << 30);
> -                if (pdpe & PG_PRESENT_MASK) {
> +                if (!(pdpe & PG_PRESENT_MASK)) {
>                      prot =3D 0;
>                      mem_print(mon, env, &start, &last_prot, end, prot);
>                      continue;
> @@ -508,7 +508,7 @@ static void mem_info_la57(Monitor *mon,
> CPUArchState *env)
>                      cpu_physical_memory_read(pd_addr + l3 * 8, &pde, 8);
>                      pde =3D le64_to_cpu(pde);
>                      end =3D (l0 << 48) + (l1 << 39) + (l2 << 30) + (l3 <=
< 21);
> -                    if (pde & PG_PRESENT_MASK) {
> +                    if (!(pde & PG_PRESENT_MASK)) {
>                          prot =3D 0;
>                          mem_print(mon, env, &start, &last_prot, end, pro=
t);
>                          continue;
>=20
> base-commit: 6d940eff4734bcb40b1a25f62d7cec5a396f994a
> --
> 2.27.0
>=20


