Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3204B6D4BA1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 17:18:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLvX-00039Y-9V; Mon, 03 Apr 2023 11:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pjLvU-00038M-9f
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 11:16:56 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pjLvS-00074P-0J
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 11:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680535013; x=1712071013;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pahaD83rRo2+aFMSz5bBXufAQq+KdE3PB1gV6Su2HSo=;
 b=TGvOt8GMDXk/1vtz7LQSYpD9FQAPeyunPlEl7m5gzdnGOcIruazIvll4
 86v2h4f4z6OehP4ZKlpHFNPPuJKUUrAeAJmdOUo3eohEoSWpC8/TyI5+h
 XRfKIQTYPyAT6b2pdSUmD3nfjNFi4/o6kbJ8y5ZYu6dNaxDCPHNkQDTpe
 RtRUWZpoxQYO05mLwOhs5JgLwpU1vLgcx1iDaebUVfvqEARyQ92ki1Si6
 jmYRdRr+Dcf1C2TYsb3J4yKuq2n8LIAQk0uwEqwWIMiirLVtG23AilffJ
 MIq/Z/Z7MjFpbU7U3x44NtK1ZmSX+nmd5YOblwysZzWoQ7PAo+vkp8spE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="341951231"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="341951231"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 08:16:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="860240563"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="860240563"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 03 Apr 2023 08:16:45 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 08:16:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 08:16:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 08:16:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDXy3R8mSISvbvqpkvCqC2hId5Xj2xV5g8GVSnWDoD7DnKv1jGJqIQpz8M9QVLjm0hKmU19wP+srv5oKSw4S0NRvtWAFr0B2j5fXKJB92chswnsNDbalLnj9lr1k1ISUWg6ndspHFc7dht9mPKVQU0vCwx+0/KBjMCGYZWf2wyGEBmCV/kxdbIyuO6I4MnS3Am85QjDQUJ6bs3ZUx3shsFD7A39mbTtPRwZVWJyTbXG5MVCd4l1/Y66jTdugFOQoajYsqSHtUO23z4LXxnV1c0fpwoHeLWIMEBjJmHukinm7YJNYltr3hJVFZ24AqSnPIjE19Jh1NArO2n85cIkrVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxplYNY77DTxpUs5RLfD/pyjRdWCcLUG9kDXwphfnds=;
 b=VvZprtAaNRc5nQIq+5r1MDS4WWnkmHKWOt86BrNbcJgTAZHRF41XvbgHbFortAyizaHwfwjd83r1epQB5JBHWTmR+uOAtX3kE9U7NltqHmuEJbx3VnepAzmuoMSsAN+AbL5lyzYJ4kN3Q7nq8gCZfW3DcHr6C48LiZ+47uaGYyZWeoPV7ADZvbaVVXBzOaIDAYf6V9uWReBIJnX1MK/q3oSLgIf7JSz6Jdqdmua9ZBMEBsmkRUhjJ7Gvjwf0GhSnltFHeq7TATPgdV97KZKOOgTfNetGsrio+WjuS7au9jCcfwpqiuRuQVn+JTewVed2NuJtEwor2fTF95A6Wt+EAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by BY1PR11MB8078.namprd11.prod.outlook.com (2603:10b6:a03:52a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 15:16:42 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e4cd:5e80:f8dd:13c3]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e4cd:5e80:f8dd:13c3%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 15:16:42 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "dave@treblig.org" <dave@treblig.org>
CC: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: RE: [PATCH] MAINTAINERS: Remove and change David Gilbert maintainer
 entries
Thread-Topic: [PATCH] MAINTAINERS: Remove and change David Gilbert maintainer
 entries
Thread-Index: AQHZYu4BedZjv6iwTE+6lgDGnXEcf68ZtPlQ
Date: Mon, 3 Apr 2023 15:16:41 +0000
Message-ID: <MWHPR11MB00315234A946CE3EC60AE42F9B929@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230330095524.37691-1-dgilbert@redhat.com>
In-Reply-To: <20230330095524.37691-1-dgilbert@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|BY1PR11MB8078:EE_
x-ms-office365-filtering-correlation-id: 80031bce-bec0-4a06-66dd-08db34566dfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8uuDuhmd1Kg0nKjXV4e9HJuVOFuLhftlaPP5zuTgrIjfOdJueVok/XXjJcwltxNBTtrfVIK0GRI+Vi+GCV+iP40rDADB4/t3nXiHRJ5TUVUOfhS2Yh+/ugUs1SDPnLwzn/gE2afqIGzFiwVM2GODHhAmZJ/gN7XNwW5/XbKbNLjEXy4/9M1x26KMtdBd8GbbxYRROINvMTYyVIczG1vFJXqKP7+ICipwe/vLsOMKcYMIDcG04gOfvqMyqy5jTlG7re1n9doUBt14rWBid1o/V7dhnG8nMKoFkcpGjrN/F7o9/8svMI6iLx2qSTp1vVKBbJ+UjzeJsxeI0DTFeZHwTM7npRiAaLHnPy1dhpmsHamPc6BXZGj0IwWKDLJeMGgFTfo/GGY48D5PpuAJhmhu7YOCLo2TgACDMdiKVm9RkSUunBjTW1jw0KSYx3Zhw3jvjNL8HVVSfVntvV15VoyFZYwakaBMRoYQG2HBSoxQS3Nph9Z3Tn/NQxPJda52QZbqbntUgZ3ksbjzdt5MFb/RdLUAzy8EHlfuU+BDd9nlYwiONvqusL8ZKVgy5Zj7KaWmPeh8ZjLw1if1uKf6FZ9LeIp03aBCVJGCuG1wz7aQ/E8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(55016003)(8676002)(66446008)(76116006)(66556008)(64756008)(66946007)(66476007)(54906003)(316002)(478600001)(110136005)(4326008)(52536014)(8936002)(122000001)(41300700001)(82960400001)(5660300002)(38100700002)(53546011)(186003)(83380400001)(7696005)(966005)(71200400001)(6506007)(9686003)(26005)(86362001)(33656002)(2906002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0gbm1TNLculIOGj0hGffRoKagUzWKweavyQMTFF3fHi0zmN/kNbBGgzQoIO+?=
 =?us-ascii?Q?1AgydDvHf0u77NmidoMBc3ZsqpgMxskwgxSm9kTJ/OB/VCDfSaw8rt3cXcM+?=
 =?us-ascii?Q?geB5BKuiaIUSWwEqauMbEnDHYwkod9UxGpUgCzZjiFICHUYiSVV0HH6y/dUH?=
 =?us-ascii?Q?Nkliz35svGcSS99zXbzFuWEhKE0/ixQPyu9QLDAdM3RvhMV9qCQ0XNjDEpLX?=
 =?us-ascii?Q?ySVgf+pHmuxkcs6w4lL0dqZfk0NIrSodptESvRzKg41+4umk5Pqr4z2QFE9T?=
 =?us-ascii?Q?XMFxL55glCayGD1vPqHC/8yIwxOiRG2Tyqsy+6u7bvxq9r7FX3M+WCzRYLul?=
 =?us-ascii?Q?MbI+9n2dAWKeksn5D1YA3CWL9UjNX6kH27/OrvKCBg7mi0ZANGAmjZZ1ECDh?=
 =?us-ascii?Q?1FybyH1IViymhdt1UyInYYpWWD3UCdqsKTozAmkvY0iJ/8eAELMOMv8bjeg1?=
 =?us-ascii?Q?E/XMo6oNGibZSnt2HdWG0aWuvpFcFuJQn9nt5/LEquesG5I7/9xoMKqpuoFa?=
 =?us-ascii?Q?Bp6qL/L+IZpF9GU5g3F8EelC7rkcovrMqNJSIriBVJqS2xVJz/iyhDskM9sT?=
 =?us-ascii?Q?GG8SPQupyZaaTDlOyUhB1d/mlqAqWPEoXhmFD0cgn7F5XEwv8jW17tjvlgQ6?=
 =?us-ascii?Q?7qnWNENkdYGl/7YG4mP+2BQLS71XvtlCGPs0xYL+y883N3/TR5SfTQ3o5Jv0?=
 =?us-ascii?Q?R9zTMrr7pim/hqrfEmVm8Q6Y8i1DUyQjxoCt4q++eVVGUD0Z7hE4+HKaTtKR?=
 =?us-ascii?Q?xQNCzRqvjw5707KfwtnPFAKCvbMUeCW+mC8OGq8nsbh6dNb+uzjV8V6UpPQl?=
 =?us-ascii?Q?4GJlVSG3aZd0gi7NkTG2BJdLQw2jcppQ8mz+h4zZPnJKPNjwqhe9KjCspUBE?=
 =?us-ascii?Q?iXktSq9N3qgZZPerzaGqspgVEBG9PC64YXrsc5asiGOYxpetiHaUSnVmjMft?=
 =?us-ascii?Q?BCLwj1Oxw9ETeiP7mHPxMh2JAan8v23uOKR7RBGjs6sOURNtDbbDIF0FeUaj?=
 =?us-ascii?Q?76iygiD2UJGcvXlOn26OsB0uLxGbCpZnT34KH9KF4lRPQ26vCdR7Y8w2yOAn?=
 =?us-ascii?Q?OsTXOlaol7wSgSdscWoozGnSSw3LobQLpw7vLatISojisClvQaYF11N5OcB1?=
 =?us-ascii?Q?g54vhPgWiKM8jHZ2CRRr5Kz08sJZWNyj/E0v8t5x2Op1K8NJ/XqQxh96OpvY?=
 =?us-ascii?Q?Zp0gZysy2ZFZVNMb0v7yJ0+jQyTmg8dkV2EuTwU7wcxTDoOsfNQqI1tHPpfW?=
 =?us-ascii?Q?UMROaUonzSWSt305inL6H4Q9VfaGmhqMMQtBrVkWORafbkQX1SotSeJd5YD7?=
 =?us-ascii?Q?7kGYE5tvdLPsVIZCxC/V+ZMkbqj+g+qxIre9M3E+j8g0JSMY2nwBP8lKK3RQ?=
 =?us-ascii?Q?SAc5qGZL69Z5TS3bjL8s6tnCuXCsXCZQRjHvHePdK9/nV23OjVcn9ozZ3rIg?=
 =?us-ascii?Q?tmKBC7WzV09jSyFiVUFiNEsU3gvvxbYzSYprBNk31wbzzJFYZ66bSJKzmrAG?=
 =?us-ascii?Q?xjzIKkGxFU5yglgoyy23zoHp4+sNB+7dzxVBKt0engtYXv8hFzY8OqN0vARk?=
 =?us-ascii?Q?trsfRIxmdarZxna5Srjm4o4S0zutj3w9sJJSO6Gg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80031bce-bec0-4a06-66dd-08db34566dfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 15:16:41.9764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mGNERC62nkLBM2i0InmR7eF5UsGznXE4VoORAvYCHhpUcQm1CuA+5OQ+Xpq2P7V7wtugovSO/OYVYVZNDPDjmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8078
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: qemu-devel-bounces+chen.zhang=3Dintel.com@nongnu.org <qemu-
> devel-bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Dr. David
> Alan Gilbert (git)
> Sent: Thursday, March 30, 2023 5:55 PM
> To: qemu-devel@nongnu.org; stefanha@redhat.com; quintela@redhat.com;
> dave@treblig.org
> Cc: peter.maydell@linaro.org; alex.bennee@linaro.org
> Subject: [PATCH] MAINTAINERS: Remove and change David Gilbert
> maintainer entries
>=20
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> I'm leaving Red Hat next week, so clean up the maintainer entries.
>=20
> 'virtiofs' is just the device code now, so is pretty small, and Stefan is=
 still a
> maintainer there.
>=20
> 'migration' still has Juan.

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks for the guidance and help with the migration/HMP/QMP... over the yea=
rs.
Good luck Dave.


>=20
> For 'HMP' I'll swing that over to my personal email.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  MAINTAINERS | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef45b5e71e..f0f7fb3746 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2119,7 +2119,6 @@ T: git https://github.com/borntraeger/qemu.git
> s390-next
>  L: qemu-s390x@nongnu.org
>=20
>  virtiofs
> -M: Dr. David Alan Gilbert <dgilbert@redhat.com>
>  M: Stefan Hajnoczi <stefanha@redhat.com>
>  S: Supported
>  F: hw/virtio/vhost-user-fs*
> @@ -2863,7 +2862,7 @@ F: tests/unit/test-rcu-*.c
>  F: util/rcu.c
>=20
>  Human Monitor (HMP)
> -M: Dr. David Alan Gilbert <dgilbert@redhat.com>
> +M: Dr. David Alan Gilbert <dave@treblig.org>
>  S: Maintained
>  F: monitor/monitor-internal.h
>  F: monitor/misc.c
> @@ -3136,7 +3135,6 @@ F: scripts/checkpatch.pl
>=20
>  Migration
>  M: Juan Quintela <quintela@redhat.com>
> -M: Dr. David Alan Gilbert <dgilbert@redhat.com>
>  S: Maintained
>  F: hw/core/vmstate-if.c
>  F: include/hw/vmstate-if.h
> --
> 2.39.2
>=20


