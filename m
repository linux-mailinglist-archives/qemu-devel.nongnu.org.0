Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B776F66E2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 10:11:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puU2m-0000oU-3r; Thu, 04 May 2023 04:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puU2k-0000o6-57
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:10:26 -0400
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puU2h-0001yD-5U
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683187823; x=1714723823;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pegswrsXHj91W6+TmuBQ4DbK62FkEZcHqkOpAoea5sg=;
 b=hxi8lr9lwrm+dPpuPPikPKkUgOJNTB5qxEOWvSRjHcCxRIjaaGaGcedZ
 AtZnuZY+CAuSsvjwFDjsDd9iV3NKq98BNM2fLi2I5TjdrivtT4z3etHBy
 9YNZF82B7AWSA5yS12Fuks+BAAImKQYd0L3Tg+a7hVd87X6Ke499dMynD
 wCBfIn9qWlnFpti4Gmtus61+V8lIR5Wp4tSo/loPVGFhy58/PfLASQdC0
 dQPndDdECq32218k8qw1EmK4QYVNLKzHDzu60VSbKMURahZrt/bjUaU3O
 267/lfwLjyCouxRjhH+SlevTO7jPmDqUFLsSHtr5Xvv0kb8CyPJzSqMxZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="338007655"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="338007655"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 01:09:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="699743847"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="699743847"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 04 May 2023 01:09:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 01:09:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 01:09:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 01:09:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 01:09:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNghsxqwz/mhKoM5MuglZT8NWxeT8EdsaClN8eHDY3IpQNz47MYVQVui0GfKf4b1TIA8Cu8VSqh5d28EI5/6/yQ+Ulb6y1ziuR3NIvutIPWWMLykEFEcojQ6rCB9FuZQegZlYZkorK7yLeCksJR1020hiix7NyInBiSGNUMzPyK0xRValswk5rOtCOMUko1LeqDsnXFAdh2pE+PVSQ7PllZS71I9RloM/9HZkQuGTsmq1uqYExJPHhEpUN7B+R0nSTduvZfad3ssn2CF0eNIjE8PFDFc6ndl6T8zp48X/+WvHNRxYSU9e90HTJo5z0tO7gE+pirvF8ahdr3zf7m9wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XKwOciK2pT3oO5f/DiS5f8BXJKysx6CGvk6BwWvKZE=;
 b=oMCOqhJLjwA7LfLl35X+AE1XC+AmGDAn8pcWM+kdMFElkeOLyyVZB41dx9pNJ7lzM9t8Hf1iDLl42SaHeRhZMNPqo9TVMbrRLpqEmfvaD06oQpuaEJhI2KB16Z6BZmnR2Gr7rltv2G48LixscBMOyhDHOTTKdk+dKUIaMaczjKuWJbPFJn8v3CpWAIp9GmVTvWavNCM5OdFlXUhpRbfRaUna2HCAYwIk4/0KR1tdHENayIN3b7OKizxhadeGjFiwKh5jDRQytSYjQAqi9GZvEXLupa6+wqDG8CwkbuApbzyEUA/FJQcCmWRT3pkurbW4ONMkUtd4PhjYg3IZ3cO1zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CO1PR11MB4850.namprd11.prod.outlook.com (2603:10b6:303:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 08:09:41 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 08:09:41 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "lukasstraub2@web.de" <lukasstraub2@web.de>, "quintela@redhat.com"
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>
Subject: RE: [PATCH v4 09/10] migration: disallow change capabilities in COLO
 state
Thread-Topic: [PATCH v4 09/10] migration: disallow change capabilities in COLO
 state
Thread-Index: AQHZegtAGuphHXh150+pUWY8oIbegK9JyphQ
Date: Thu, 4 May 2023 08:09:41 +0000
Message-ID: <MWHPR11MB003113F9302058F9BA7F20479B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-10-vsementsov@yandex-team.ru>
In-Reply-To: <20230428194928.1426370-10-vsementsov@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|CO1PR11MB4850:EE_
x-ms-office365-filtering-correlation-id: 9324234f-c806-440e-505a-08db4c76e9b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: faRvWNBNsZ9Guh51RilJXYy2cE+QnYZowWbzT7pe1ZKzhgAyyLU7hkhwvvjgDeU6meXwKfIwGZ4jqrcRspBDF0zCDd3chpai6XdyOGE2kwJ0bA+KEhb9Ney2vN2emA4NJYD5p6sGNr/cpYK5mq5MSQh6M0NyUUUwktfN+P2RAmg13dAunFVDV7yUW3owjEPraQ55Mx2JCZ2mwbBhYgePjl4oQdZXa8wAabKQCO1OuGU2d+BUT/6z1xTnOUmnbNfb61lQ9Nw4VGVcdNioiYoKZushmBjwehE/DWEu8zkbZaa76G3neIBvLWYCXiZxdvA0VSIjx2e3MvylaR7UKNjaHjelPmM++5yTaCOQfuCFS4foFAs92SCyHZoJW5VTkQNKZDCCc3mawTQw+0zNs5jPcGDOlRL8kXsb3x/Bu9CJQJTqAUxkHikTHq+7fClWP5HmPz5R7ZiYbpzvJNQkWK0mDrZWFCJBpNGZh6Hl+44TU+Cs/EkwMzrxxGE8piJZmtBUR7IfM5BSy8/tOYbFN7NxmflYZj+NuK1RzKCI56Lf4hjCETc6EnOolOweFo9uNDF2O7UaJ1SbjVLONrcNvVITVwbcD88FfE5y0gYF9ZIwKENMQJJvwXqw72n0O96Xmob/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(64756008)(2906002)(52536014)(8676002)(41300700001)(8936002)(5660300002)(316002)(66446008)(66476007)(66556008)(4326008)(66946007)(76116006)(54906003)(110136005)(86362001)(478600001)(38070700005)(55016003)(38100700002)(71200400001)(82960400001)(7696005)(122000001)(33656002)(83380400001)(53546011)(6506007)(9686003)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tP1JC3EpM7ncYiyqRldzbaePu6+cnp3q/CFbeRCMZwFPz3gka8H25zTTTfCZ?=
 =?us-ascii?Q?INUh5TXxlzC6dGGneML0ahZ5R2QlxI/OUEPqT7ckuhlRcLxMfFn5fDGQKVQ0?=
 =?us-ascii?Q?w4OVAX9/3qAvn5IVcvEc1mTwZw1WsIDrcObWIS2k7/pz0DeW/MJVfhbka9+r?=
 =?us-ascii?Q?SY3we1K1GabmgXepQfzx+34DY3Gv0E9hOAzwclGfoqbXxTScNPuSQDPqb2Kx?=
 =?us-ascii?Q?gyN4uCY8anCIuC+0BpRGQpbArjVPtwPWeEHsWuRnxHGG4iCaTvh/CRyjnXnP?=
 =?us-ascii?Q?iv4FLjA8q0Xwks+nFJ8doXEH8ehzLSkoz6DuOUme9oslYbSmS+pGzrF07D0i?=
 =?us-ascii?Q?TSQs+NmIoVAA8o9XCdmOlCrp6DlrhSSRe3ycZf2S/VO7ULA15Fzln7TpLPTO?=
 =?us-ascii?Q?soQNzNVbVb+mULu9Sr/eHIBsA5L4s0J/qoOflJ3CHMp+oYCL5f6xNWwhzeK8?=
 =?us-ascii?Q?qIOe1bQaZV3B6IzHL6CLsy/DSSPzssIkO2pihEUcfMcGRnvoHo5PseuwM+9V?=
 =?us-ascii?Q?RwGmhrnjjaLesOjez2rqPDg/b5Gc/XpboEI4Qsfnex+v/v25k6hnzfw43T9a?=
 =?us-ascii?Q?AYjKrw9PRtD0Xfkk8Gf03Duzll4LLUPqz+kYB86JomrVjb34lPVjwyOVFffT?=
 =?us-ascii?Q?+6hQr0qr2JpGhgaZU6BXxSDSlV8j4CtrxoPSaS/+YLK9kP5SbrqxESfV963J?=
 =?us-ascii?Q?7AwrsdD3+QKo7O/ZpqoGDw0BFbReWWOIkHMxYb1WsVIVz8xsrw/30LdfQdfN?=
 =?us-ascii?Q?xPr2i4T4yrOjw8tLkS6Zkr6IgmLrnB4l54oz9TyQRP091gdNKoAf4q3pp7vq?=
 =?us-ascii?Q?cyFn92ro6rn148mliPQ1wIqJYJS/Vlq2x1FZW2WXoSIVgjOUXup9ZlY9G/nO?=
 =?us-ascii?Q?s3kKgEtaL+NH6Csc08xmdpD7+d11JuXU4MxfSx4KWBaqPpk4arxw8BmlKSwz?=
 =?us-ascii?Q?CKUjc+f9R3KCJgTP5Mo3RLEU8qPMD7oQtxMML3HTQ3BhSIqxBX1uLV8XE2X0?=
 =?us-ascii?Q?yBFPRoTQE6uhbqq4YRz+i0pcNBLhnwcjZGk11x2WJ1l31Aye+R/hn8ErN+wA?=
 =?us-ascii?Q?xUuDKPx7CwpwmnkjGueEj7Me6NBM1CyRC3JxZgEAac0XSklBBIN6Jv95PtDF?=
 =?us-ascii?Q?ZMtfS36SVSDASi/g7OpU8b21Mi0RYRpiXHY63PBZy1HQYzt9wNZeFNbtxxQv?=
 =?us-ascii?Q?J6Stcgadj3PtxcRha7WmeqCIIPG1Mya0Li39yaYqvxenAquS04Hf9XjZfCD4?=
 =?us-ascii?Q?PMyBCIokCJrgbL1O6zNbI3BRJyyfUkI2rl0w9+WBQf8esFGL9kCJkWkws1O0?=
 =?us-ascii?Q?yR3JFwW1corZdaPJkSzswfVegV4BMr5uDhYMRsz33onsiwyl5SP8+ughUXHn?=
 =?us-ascii?Q?XDrX5oAgH6R8CN7Od1h7us4+HWDfinzumA7/TMzudyGJr1e4gvzhhZ7ViD6H?=
 =?us-ascii?Q?Fxi7UrDpQyJYWKqxp21b8s1gSa7EuLM2e/ouyMCHLaekeQME77woHpbufyYA?=
 =?us-ascii?Q?FOpSViKXSvBK7yAludfpGnxnIgbdILMU8lk30+I/udrO3WMp7RSszRCBnxs/?=
 =?us-ascii?Q?NMthb5XmwoPR0poS83vk4N2+OezPxb05MvAFyqxC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9324234f-c806-440e-505a-08db4c76e9b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 08:09:41.3537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iEFQozMEOgbZQY6T0DHOVagjktBzxdUvSho6GcyaI/1cBfFuJ5sy/vPvMzMSMHKyvpWf6ILHqujNnkGEqiTa7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4850
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Sent: Saturday, April 29, 2023 3:49 AM
> To: qemu-devel@nongnu.org
> Cc: lukasstraub2@web.de; quintela@redhat.com; Zhang, Chen
> <chen.zhang@intel.com>; vsementsov@yandex-team.ru; Peter Xu
> <peterx@redhat.com>; Leonardo Bras <leobras@redhat.com>
> Subject: [PATCH v4 09/10] migration: disallow change capabilities in COLO
> state
>=20
> COLO is not listed as running state in migrate_is_running(), so, it's
> theoretically possible to disable colo capability in COLO state and the
> unexpected error in migration_iteration_finish() is reachable.
>=20
> Let's disallow that in qmp_migrate_set_capabilities. Than the error becom=
es
> absolutely unreachable: we can get into COLO state only with enabled
> capability and can't disable it while we are in COLO state. So substitute=
 the
> error by simple assertion.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  migration/migration.c | 5 +----
>  migration/options.c   | 2 +-
>  2 files changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/migration/migration.c b/migration/migration.c index
> 0d912ee0d7..8c5bbf3e94 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2751,10 +2751,7 @@ static void
> migration_iteration_finish(MigrationState *s)
>          runstate_set(RUN_STATE_POSTMIGRATE);
>          break;
>      case MIGRATION_STATUS_COLO:
> -        if (!migrate_colo()) {
> -            error_report("%s: critical error: calling COLO code without =
"
> -                         "COLO enabled", __func__);
> -        }
> +        assert(migrate_colo());
>          migrate_start_colo_process(s);
>          s->vm_was_running =3D true;
>          /* Fallthrough */
> diff --git a/migration/options.c b/migration/options.c index
> 865a0214d8..f461d02eeb 100644
> --- a/migration/options.c
> +++ b/migration/options.c
> @@ -598,7 +598,7 @@ void
> qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
>      MigrationCapabilityStatusList *cap;
>      bool new_caps[MIGRATION_CAPABILITY__MAX];
>=20
> -    if (migration_is_running(s->state)) {
> +    if (migration_is_running(s->state) || migration_in_colo_state()) {

Make the "MIGRATION_STATUS_COLO" into the " migration_is_running()" is a be=
tter way?
Like the "migration_is_setup_ot_active()".

Thanks
Chen

>          error_setg(errp, QERR_MIGRATION_ACTIVE);
>          return;
>      }
> --
> 2.34.1


