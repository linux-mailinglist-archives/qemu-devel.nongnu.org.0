Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F4F453EE1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 04:23:23 +0100 (CET)
Received: from localhost ([::1]:50626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnBXe-0007dT-9J
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 22:23:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mnBWD-0006s5-CK
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 22:21:53 -0500
Received: from mga05.intel.com ([192.55.52.43]:50184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mnBW6-0003yZ-Ib
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 22:21:52 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="320085582"
X-IronPort-AV: E=Sophos;i="5.87,240,1631602800"; d="scan'208";a="320085582"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 19:21:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,240,1631602800"; d="scan'208";a="735903132"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 16 Nov 2021 19:21:42 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 16 Nov 2021 19:21:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 16 Nov 2021 19:21:42 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 16 Nov 2021 19:21:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhX3yoYrQHpTpZ2Upag3sEOSOfAoN9gNvdPs/3DxpNE8hylXSRu9rM2/ufuzeH3WgzlH8fu8kqfFW57mT5VSO5BSvYaMtCsKy/p3fU2pIfK3uMzue0cCnWXwHkpnXxWIjqbP3cMpXF2MLQ9FH6KbVoSEwmwKfIWx3Va6cK+lFza5nKLtcgMOWlC0j0WTFeWRViWmxgEQVXjwEv/ACA/pzL1GZ5ZaSLuPTs4RhsUMBvw8D/HxsW1Gl0mDjoP6NHsLkQ7A5QKxOxGbb80nIcwOE39jjjpFu6MOga2JW6qMZUc1zcSOPnfhHSMRRPBReXXCIOaelmtrUrf3+miL7FfhhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jp6Bw6j2c6WPUz8BnQi8JDAtreRhRGi7lCw03nUsKPA=;
 b=DcTNKhlxcxR2Ko3I31oJ71v1knAFYG//GQqNw17WvEv6dPnoNVIeqCY8FCv4eVKV6v1KYxqApq0QFOBB7ZYUOFqcze4ptHaJZFBKkLpaEWoHhjL8cTzb3hciGbgv4rsQxeMgCqXRBv1mZr4xd67fChghbk3eFNjgJngh5r8z7KMMehWivlLPFhEzxfKAXNBpOBY/+P2V7SmKki6xs2E9ZDzi9r186R+JVSNKE3rJlz9xCZX4sAt1lttCgyL8RWnXj1C2ZVjOSQmTgSl/lXUxdllOm0qDOV3HYn1b2L7xVUyBtvP7HAbxQNPpVd4i25GSuPwe2ld1oZ9jXnikl73MAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jp6Bw6j2c6WPUz8BnQi8JDAtreRhRGi7lCw03nUsKPA=;
 b=fI7dO6Hmd7X4hklS1wyO4Ditn+kCMzx9kGHh7ddgzqfiFnErzprRTbp4ZvJOsxsengU4XcDlWeVvvVFLI5cjaxYvzXhPpjXx1YQuN/NDCsTzFuL9E41YCkkxUqhzNOnCoNmCpNCAmfPJRiiTgxG4BUxLnQipowupIDEXPufamzo=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 17 Nov
 2021 03:21:40 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 03:21:40 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "quintela@redhat.com" <quintela@redhat.com>
Subject: RE: [PATCH 1/2] migration/colo: Optimize COLO start code path
Thread-Topic: [PATCH 1/2] migration/colo: Optimize COLO start code path
Thread-Index: AQHX1lugwlMKwlpaZUygNIvcC1c+EawGYUofgACm4GA=
Date: Wed, 17 Nov 2021 03:21:40 +0000
Message-ID: <MWHPR11MB003171BA9C71FFC191FD86B39B9A9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211110174156.3834330-1-chen.zhang@intel.com>
 <87lf1ouku8.fsf@secure.mitica>
In-Reply-To: <87lf1ouku8.fsf@secure.mitica>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a786e47-955a-4657-46db-08d9a9795f68
x-ms-traffictypediagnostic: CO1PR11MB5139:
x-microsoft-antispam-prvs: <CO1PR11MB51396BE563155038614FB8DC9B9A9@CO1PR11MB5139.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:139;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bct7jcmdk0cQXfV2ezuJ+Uhuc/pXbln66hpUdbSZ8mJwsVpI+591ENKfK65bmlt0AGWMshXU94SXVxB0B7LpycU4smh5s2UGjWkfevnAl0WzdrmYeFcDW25xKGNQhDAkP4vWUyBPZ20IY1jO3J1ob7V7/iK+WDsBJJLn4IE12w8LVpNjZNuOwqxrrOojCmgD/r4+adQfrHYH/7pHvdTQpna/kT1ihLom0oiX3zqPN5EeLqDUa6pciGhGAUbEy9t8pQchRjYQAnibgNWc6PxrOWMyJ8bnJBmGpneWOdHVf9EjcYPLeLCBsOU3PWtMHhtKT6objxHPMsmHwkMzzmL/cAduU/ZLr7BHyGslw/08ddtRP/wj/AX1Zll1CN2UABEpv1UPfQePpEsagsudaCjCOs45J7vhvW7OhiJRvu/q4GPBsRZnarEnQOzyJEhRtWaqAEEq0xsklq1AG5FpIC5SoojX9ed8zEVccDJkBvxc/Dh5Zh56tbMQ4KfATNrbDVYFMqDgOiukojP7sE6TnzDf2+jevRhlFMbmNY2Vcox1f3R7aknkJndu134WUgktRl4QiOmBDhIWe5TlpbwVIBguY+I3svTuRs+5QJW/1HQTD5gPL0esjeQ4pn/wsNHBzNiMQ9jp9O3fyJEV2Tl27Q/W6ZBy4wlO/VhuxiViiWjqigXBkHgkkpv5OmCaxHEXfouK0mJi9BKhcQ+0HleEWfINMc04jjRGFdxanf1uAbfMFb8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(76116006)(66476007)(26005)(71200400001)(66946007)(53546011)(66446008)(55016002)(54906003)(6916009)(66556008)(2906002)(82960400001)(64756008)(33656002)(4326008)(186003)(38070700005)(6506007)(86362001)(83380400001)(8936002)(38100700002)(8676002)(508600001)(9686003)(5660300002)(122000001)(316002)(7696005)(52536014)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?C4svQpMzU8K4YnKo/GqsUGoTI4cXB/22jNs5d8KK88rTRcZmpnHf1/c4cwaW?=
 =?us-ascii?Q?gb3b7oNo9AcQwLWz00R2p7D/Amy0E8RkTWpQGnMn2lazuMizjJ7eoUL0xiB9?=
 =?us-ascii?Q?0q0pVHxIG8jcnLePxCtJ6zZbLcNcVl4cyhZrtj0kYGWQFN6nc8DlljG2tsTa?=
 =?us-ascii?Q?boBdB1j604ZbGl5MRZQAWqW3cUb0NV33j6FFLiVwZKOxr0Ohq2hXvGjuA/Oe?=
 =?us-ascii?Q?WBBejupBh+rTwwxShEXerx2xcj1QOV7/pJaxoaaFnEEtLarCzFnXKQeaY450?=
 =?us-ascii?Q?1QvMXQmqjE6y/IkAur15sUsA+jZI20xQ6tAtUB0nOY4IUUeNC9OkqJugejxf?=
 =?us-ascii?Q?X7FFw6X6aU6S9C77JVX50Dx2B75lcLG1Ye/sV5tLGBx84ykPgdHRykRxcx4t?=
 =?us-ascii?Q?n86t7xzMJ4mj9XOV2ypTpOH089WogAzaQU7yz2HBLBqdbp/fq2e/MsKO6WEe?=
 =?us-ascii?Q?uGr09zdbIkhwqpKs8EaMTCaLVVDEeTpK1M8xU7lIFYKawL5ITpaCvqNU7xno?=
 =?us-ascii?Q?akQD/h7CnGEFXSyU2oNbtg9qYWauluHy+Zq4FL43hZBGxpxd8QfQte0hcfW0?=
 =?us-ascii?Q?vX8nl3ikswOs+/Q5uBQqvsQin3gDoGs+fv5q4/Nc1Q1ggdQXSg0CZTtdvgdv?=
 =?us-ascii?Q?tRNae1uY4caaibQvdXRds+Tp4ZQSll7iGvsL4EuqY3YUGhRwh0ExfeYmQVky?=
 =?us-ascii?Q?P6vEHlb7S1H2D8XcPRwJcoxLBOI1C9xmeZDYzTKCUEQPOvCeQtEgM2HT5BcM?=
 =?us-ascii?Q?EqWfzx0ChLcip5YePfXQ9uNV+mJD3EErHT/LkMgWEqVcxaPi9vT+SL7YS1Bb?=
 =?us-ascii?Q?IkkgfxRJXNmcHcC6jHwy12e4QLj/AleCKfEVOl7qjCojkoSwnvc/y8iKx8TR?=
 =?us-ascii?Q?Lq7g53KCRDLYzI4kMQL+mVWgtEHcR0JRarqL42YZYbntuRvY3Wd7lgq3AMfx?=
 =?us-ascii?Q?KS5WE68w6q+o6lxSE5k5YI5rft1MmUe666ombui55VQJsY7ZwARsd0XPUs0J?=
 =?us-ascii?Q?zluDnaEKFngbKg4I7vVZgCtSwE1tTpYzlts755SE3Yl6zb4MM1KWqwc//2Za?=
 =?us-ascii?Q?JbZNJNAb86/uv7cDN9HG1rJ0Qz2nuEYAj7VjMkmFRlntLu95Aqfj2tS/anSk?=
 =?us-ascii?Q?Dty5EeZCb88IkJsUTmpKkWjD68NKX4Tja9p0rHw77ewuOZJ0/PQ2nNhSCggQ?=
 =?us-ascii?Q?zz2cUkQ7cf3LV1UKZbKZJaY0m1yH5u5VyImh2jm0cyr4+ybc/dCmFy+unHQz?=
 =?us-ascii?Q?mqzMuAeuJlO9y1HKCjrZ6dvsM7xCErz19VQHocLaAAp75XZCHItCKtO1e1YL?=
 =?us-ascii?Q?5JIamqSF/si1gB6Ve7wXp5+BWUg61ji9UIsvkJz1kBOH7+QGOZlINjz/2Oz8?=
 =?us-ascii?Q?gQN5KqmMLZ+bieC6MoP1RGmRwJGpsnTgR7ex2Zndh0c3nZB0p5jHgI60/97C?=
 =?us-ascii?Q?Og4lDeVjqSBY76Odc7hkAaqMNAYNqMzBNi83iluNNPqOqsIkl3wFTULCsVRO?=
 =?us-ascii?Q?BskyZnTydDwAfSGRlXQnZvLGoDSHF66NfAVtrqu8rzVCGHADdgZz+pbcI/tf?=
 =?us-ascii?Q?2n8o2BOSkm51G5kTSsA797i71cuFz0HnXmWxViBeUSErjOwAD+ec027y+i8A?=
 =?us-ascii?Q?hw9S+A6vR2K7uH9Ki/mcm14=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a786e47-955a-4657-46db-08d9a9795f68
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 03:21:40.5003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ekxrJknIbSdwn1ftNRgHaAHgoz4R/oTMuSTwNSO+eDbGX/EOvyaWtzGrcN1YXuacjmQ60Iuqyj001ZDfVA+29g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: qemu-dev <qemu-devel@nongnu.org>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Juan Quintela <quintela@redhat.com>
> Sent: Wednesday, November 17, 2021 12:28 AM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>; Dr . David Alan
> Gilbert <dgilbert@redhat.com>; qemu-dev <qemu-devel@nongnu.org>
> Subject: Re: [PATCH 1/2] migration/colo: Optimize COLO start code path
>=20
> Zhang Chen <chen.zhang@intel.com> wrote:
> > There is no need to start COLO through MIGRATION_STATUS_ACTIVE.
>=20
> Hi
>=20
> I don't understand what you are trying to do.  In my reading, at least th=
e
> commit message is wrong:
>=20
> void migrate_start_colo_process(MigrationState *s) {
>     ...
>     migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
>                       MIGRATION_STATUS_COLO);
>     ...
> }
>=20
> and
>=20
> void *colo_process_incoming_thread(void *opaque) {
>     ...
>     migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
>                       MIGRATION_STATUS_COLO);
>=20
> So colo starts with MIGRATION_STATUS_ACTIVE.

Yes, this patch just optimized COLO primary code path(migrate_start_colo_pr=
ocess()).
We can see this patch removed the=20
 migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
                      MIGRATION_STATUS_COLO);
In the migrate_start_colo_process().

Current COLO status path:
 MIGRATION_STATUS_XXX   --->   MIGRATION_STATUS_ACTIVE ---> MIGRATION_STATU=
S_COLO ---> MIGRATION_STATUS_COMPLETED

This patch try to remove redundant " MIGRATION_STATUS_ACTIVE " in COLO star=
t.=20
MIGRATION_STATUS_XXX   ---> MIGRATION_STATUS_COLO ---> MIGRATION_STATUS_COM=
PLETED

Actually COLO primary code did nothing when running on "MIGRATION_STATUS_AC=
TIVE".
But for COLO secondary (void *colo_process_incoming_thread()), it shared so=
me code with normal migration. No need to do this.

So, I will fix commit message to:
Optimize COLO primary start path to:
MIGRATION_STATUS_XXX   ---> MIGRATION_STATUS_COLO ---> MIGRATION_STATUS_COM=
PLETED
No need to start primary COLO through "MIGRATION_STATUS_ACTIVE".

How about it?

>=20
>=20
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  migration/colo.c      |  2 --
> >  migration/migration.c | 18 +++++++++++-------
> >  2 files changed, 11 insertions(+), 9 deletions(-)
> >
> > diff --git a/migration/colo.c b/migration/colo.c index
> > 2415325262..ad1a4426b3 100644
> > --- a/migration/colo.c
> > +++ b/migration/colo.c
> > @@ -667,8 +667,6 @@ void migrate_start_colo_process(MigrationState *s)
> >                                  colo_checkpoint_notify, s);
> >
> >      qemu_sem_init(&s->colo_exit_sem, 0);
> > -    migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
> > -                      MIGRATION_STATUS_COLO);
> >      colo_process_checkpoint(s);
> >      qemu_mutex_lock_iothread();
> >  }
> > diff --git a/migration/migration.c b/migration/migration.c index
> > abaf6f9e3d..4c8662a839 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -3222,7 +3222,10 @@ static void migration_completion(MigrationState
> *s)
> >          goto fail_invalidate;
> >      }
> >
> > -    if (!migrate_colo_enabled()) {
> > +    if (migrate_colo_enabled()) {
> > +        migrate_set_state(&s->state, current_active_state,
> > +                          MIGRATION_STATUS_COLO);
> > +    } else {
> >          migrate_set_state(&s->state, current_active_state,
> >                            MIGRATION_STATUS_COMPLETED);
> >      }
>=20
> This moves the setup to MIGRATION_STATUS_COLO to completion time
> instead of the beggining of the process.  I have no clue why.  I guess yo=
u can
> put a comment/commit message to say what you ar.e trynig to do.

You are right, no need to setup here.
I will remove this in next version.

>=20
> > @@ -3607,12 +3610,7 @@ static void
> migration_iteration_finish(MigrationState *s)
> >          migration_calculate_complete(s);
> >          runstate_set(RUN_STATE_POSTMIGRATE);
> >          break;
> > -
> > -    case MIGRATION_STATUS_ACTIVE:
> > -        /*
> > -         * We should really assert here, but since it's during
> > -         * migration, let's try to reduce the usage of assertions.
> > -         */
> > +    case MIGRATION_STATUS_COLO:
> >          if (!migrate_colo_enabled()) {
> >              error_report("%s: critical error: calling COLO code withou=
t "
> >                           "COLO enabled", __func__); @@ -3622,6
> > +3620,12 @@ static void migration_iteration_finish(MigrationState *s)
> >           * Fixme: we will run VM in COLO no matter its old running sta=
te.
> >           * After exited COLO, we will keep running.
> >           */
> > +         /* Fallthrough */
> > +    case MIGRATION_STATUS_ACTIVE:
> > +        /*
> > +         * We should really assert here, but since it's during
> > +         * migration, let's try to reduce the usage of assertions.
> > +         */
> >          s->vm_was_running =3D true;
> >          /* Fallthrough */
> >      case MIGRATION_STATUS_FAILED:
>=20
> I guess this change is related to the previous one, but I don't understan=
d colo
> enough to review it.

I think this patch is the general code, little background needed.
You can simple understand COLO is two VMs(primary node and secondary node) =
entered a state of cyclic migration.
Thanks your comments.

Thanks
Chen
=20

>=20
> Later, Juan.


