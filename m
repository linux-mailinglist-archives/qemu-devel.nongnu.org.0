Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2292495513
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 20:54:46 +0100 (CET)
Received: from localhost ([::1]:36842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAdW9-0007xz-GY
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 14:54:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nAYoi-0003fx-4k
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 09:53:36 -0500
Received: from mga17.intel.com ([192.55.52.151]:9851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nAYoe-0007pM-VQ
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 09:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642690413; x=1674226413;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n31Ewvh1wQAKq44PfrRjz4RHLsn+Wp+Iehw/imXaUxY=;
 b=elWnbTzAiw9t0ZZr4Tb5MFFFii/9RwTC01Yjpr2eqoBpAxEm5yUifFGQ
 g/nG5inuikgjmiWqrXFFz9aqEOmwDOqGUwSncjI85bN7P4ft0+vxdJVpE
 HJO9/N4/WF1fSIbAvKMYTGFnrTAYp4ExibItVyGWyDIiJfEBjqkUWOX9m
 RnxitnJaEVAj7NL9vhE4NBknZlzhB5D/wJi+f/VfvVVw9lxUj+cGGxPj3
 VSJE3iv+a88sLPZSTEzU2tmIPxqFUbpVyybSjnBm7zZSIEQ7tpCw+uJlQ
 B5sgMYkP5S6SYI+B7hBGoi2MLbkOxa1S3nQIOPvlxYRbBFboByaX9qbof A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="226043082"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="226043082"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 06:53:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="765326877"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga006.fm.intel.com with ESMTP; 20 Jan 2022 06:53:27 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 20 Jan 2022 06:53:26 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 20 Jan 2022 06:53:26 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 20 Jan 2022 06:53:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLHe7CnKLY8M3/DuFPbYIBIDEiCIqb4KNllenFFnAMfWwJcmn7ktJxE7+rVRj6XOmwVg30m6tL4/DQaNzHbQXFpyhEjxEX+hMynRY6y8Jdxo7npH+7gjQOy0kou0Msgt0eR+2wtMLNAOf7ydrCfkmYoDssa5lbuvYvGuFzNswJxf/vt68Tl+W6iF84HrmEomGMrpBBDSPkWjGnfzI/0Jy+CgEmT3wcQrSb17UAU/A/AsxhPAvvf5y0NTxCPlABz181QEUsXUYI0za+2D8AJu9yTX5eKQtEWC+Tqp/KqyBJJ001dVf648ZYavaWMLv/a6/H9AXsLREcz9DKuTl36xWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CI6/8058HBj2Rn1m9UeQxmoAyiL5Mp7zmrwDeUk4L2c=;
 b=bCe0U/8m0nB3aH593HCq2h6xCz6Qofv/2/Yas6ASyPd4dHPEqo46vuj+ydUJ7cGsX0nBzhsAPdexN/RTxI6H+4ey+vn+/1I8iyeeKdY0tqcfKUE+MN7r+S/dA9JkBRAFowleA5f7LGqM3YDoHqhZv61//TUH89Vy/5TI2engTIeIjrXS325ufDlNGRh9SpORz8aLQjA8mC4hweS3ALMXw1yurg8/po41KH3jC70aGIvVWtKNul/YDnFCl6qqu7RnjVNYaXD19XaEBCj1par1nqSFEPgTl79U9oQmbhLdLBWKonEu8pdym95qfcxwVxndw4xXNZ18gJOuAwCOg9ccfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by BN9PR11MB5226.namprd11.prod.outlook.com (2603:10b6:408:133::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 14:53:24 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::b5fb:a48b:9a19:5f4b]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::b5fb:a48b:9a19:5f4b%6]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 14:53:24 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [PATCH 2/3] migration/migration.c: Avoid COLO boot in postcopy
 migration
Thread-Topic: [PATCH 2/3] migration/migration.c: Avoid COLO boot in postcopy
 migration
Thread-Index: AQHX/g0hm2d0nN4+Mk6HH/FoS6mtm6xq3M6AgADg7jA=
Date: Thu, 20 Jan 2022 14:53:24 +0000
Message-ID: <MWHPR11MB00312C0E5400F5FE64C5CB739B5A9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211231055935.1878503-1-chen.zhang@intel.com>
 <20211231055935.1878503-3-chen.zhang@intel.com> <YehpP5C5LNvz59Km@work-vm>
In-Reply-To: <YehpP5C5LNvz59Km@work-vm>
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
x-ms-office365-filtering-correlation-id: 8fa98190-9a57-469f-4257-08d9dc249c3b
x-ms-traffictypediagnostic: BN9PR11MB5226:EE_
x-microsoft-antispam-prvs: <BN9PR11MB522622D55C034BA6A8B5F8599B5A9@BN9PR11MB5226.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6WGpknxiL9a+Etm92ieqOdsF6sCiwjThJCey9Yq1mD3qFV8/xbVSriCXqZech2QIynBbXNSp7Olr7M/IXAzmidRZQoCSa6I3XSs8YWx2fGHqV2dayq5AXRf0iZ4tViJFj99/pSrpOkLUsTohGOa2/O1ODMHZyAWh5GEvZK7SBcPk5SXf/91o8bgolpsK2fxVEo/iYvOqwAR/qHtOSwy/UqNxmgk8nYDWh/KG5Kdc8DAb1ktkqNOR6SXxafe4p9jeuFH4hYMNqC1U1Iv/SRqBFIWEXhhKP+KJD5S/apv7DVs6ckq3vxIX+64wd7ldqmykxi/7C5zTiF6ZyXcQ4fyeELQWX9RtHcbZ1AOjX3xZJd0MQTTRWhaZV+rE176JQwlbtxRQlaFSumpBLychSUd01hvZDoNK4bGdCl8D17+cs0JCkOhvvL2bpN+wQ2NoNmIY05FGo4al0Lrg3LWEA7C7Zk6xCzY9onyx/16KimqlRll8BHmLc7JUmXk7imR08zWweaEFn8jbl473pRKpTqQdsanpZhj1X1YFnQNqVyzwjjln1N0U+WBZ87WkamnAtNuApu05JDjPJhlyrDCuSS1cOP0k99aTLyX12XN8nDiLPLvlJ3/QvP27LrmWU6yjx0TB9EMvhRPbFtDAPOSZsWsNmRLg09LNnaENtCXh5fzjIoQL+Pfwcx/uLQvWEj8ls4f43C4VC9OW9fLYeCj+KmgB8xIT13lNXou9Pd3i/kClV1CZHQQuWzRREPryhzri2ynykDi1A3UHs1JzPXoiOZFIL0rhS6cKfKRWZFa9qMohMBE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(6916009)(54906003)(966005)(53546011)(8676002)(122000001)(38100700002)(9686003)(33656002)(52536014)(66946007)(64756008)(66446008)(76116006)(8936002)(66476007)(2906002)(186003)(83380400001)(508600001)(26005)(55016003)(86362001)(5660300002)(7696005)(71200400001)(66556008)(4326008)(316002)(82960400001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0jyDvrFa5AZwe2IOsgk25HgTNXunIRbYJ6Dzb1JAPoRoIUv5VXrIFVraVsoh?=
 =?us-ascii?Q?qpoBVJmpN4bEvjD1YGP52xtwuc3ZMIik+O4r/zY+Cbn6pko3sQarLB/oSf0q?=
 =?us-ascii?Q?caRUUg2lvstV5niTsbHy6EhYI9YlnVL+6KArE9xIVYKJxkXEjXs762gLPDh0?=
 =?us-ascii?Q?v+OQMLNxjTgzIUJfZz1xo/YzXe/KD8CohmAIXowXQL57+1UVPV3eEkBasty2?=
 =?us-ascii?Q?mzl5CKR4O2M7nWvMEdLUgix45wIwcTlK1LTy9NMeXvy/7V2h7L5SHsac0uWU?=
 =?us-ascii?Q?8DPsiQoye0Ksm353u6fvYAveyFwLpQ1IeQW7bg12t+hdD4+Ofb45t+bR2aza?=
 =?us-ascii?Q?w7aLbsPVQgdYgWQcDGHRU1mc58/iZ9Y+rK+LDl5WjEo1aJ5SjyWY0/OUxJOc?=
 =?us-ascii?Q?MNm5fW8IfVUByU3OTJ3o26NiMgWOKvnwFZyT4nYiTuNHWYgwBBwanjwqb12d?=
 =?us-ascii?Q?rHWdvdU+lrWF3IqkoK2ol7HIEq1z2emvJrKQZH0Q0ReHn5QGCGRKI+VvBUg/?=
 =?us-ascii?Q?0t95fYkulKB5pwyCS68M45kj046h4JDWmr507pKOLLbQlTcXcqVRwrRJCHnp?=
 =?us-ascii?Q?vxCgJbq8o4XjzD9HHeF7AO/KffzJlYP5wzLlLCpG+8TChOZRAjZTzrP6/FyA?=
 =?us-ascii?Q?7GehMNLtc0vnS3bmxSKfHVKD7/VQ9qTj6u62IgbcX4qJhRjdHp3UWejpJO0u?=
 =?us-ascii?Q?8Kbs+3XiDPmpUpKmSnN3UfxoMFx8Fhn3+1zcWDmBC3Y6GOrc1qdCRkHia27T?=
 =?us-ascii?Q?7fXNaEG1gHxmdzufPR0BbCBDipp445M6ablygqdJPSvweXM5HGQfkJdOcdg7?=
 =?us-ascii?Q?m9YvwqGKFKogjhg/aZfL2XLoLqVNtiL1rYFqEPy2rFwvefJidmGUXvCG622X?=
 =?us-ascii?Q?hrO8NTqvWOooWE4zXY+rSL1cKoct+yUkWYYCQOBQPW3WyqDjd/JYdd0KNEDO?=
 =?us-ascii?Q?BfaIeDZ/rCW0doAYlRe352Eu23EI//ndmaMtd5QolwFe6dzEgd49U3R7d3Wm?=
 =?us-ascii?Q?Qq/v2N8PSzNmpRaJxflXbavUft/ZV1Dn59jhSGnijO+V2xjC6QCpoAK0fZu6?=
 =?us-ascii?Q?v6WmvZzqtznaCLJDzzDQIc3fi7IOOLXni0UaMocjIlE5YHZgxbWyJdCbTDnn?=
 =?us-ascii?Q?YWiLGy0ZS6WdHZ/QXxXaB7+ExcPfHckHoBlx4jQoX7g3MK5yaXHsef6z/Amj?=
 =?us-ascii?Q?BWDRIaG9UeHsBriS0ULFGs08MLxJBOgWUNdApa+b1dAYGEJUVnG5KEeCLCRr?=
 =?us-ascii?Q?1BF4qOv9AaD1eLp32D8h8WPZFjEPwWEmv/DUD5nXyARCKMCa3P5tT0U3bA1J?=
 =?us-ascii?Q?z245jigABoHBBRmnw7l3sRsydo+9N9ud6wY4rQREjuktqAjeq3dtgKpyjRYA?=
 =?us-ascii?Q?G1BQf8NNTF7ZjS6hv5ENAkT50CqWIFUc4MzQcIlnJi2dMmjVS5703gUZjvVW?=
 =?us-ascii?Q?ixP3+na3ltruNn46WP+hvlf5TOaKaJtspWO5ZOqDYjkSnzpVOZe9wgDKFsAb?=
 =?us-ascii?Q?pMe2qYf53s4bCtEcAgFNRWamLRoF6kpB7bJezCBXxh5kTVNEKa86LVVzhO9H?=
 =?us-ascii?Q?5Xy1JOFSdeHGiGxSh7lP2Sp5aI4zVlbSjWqwHOPBqjjQehw1A/u5VJ1M9e+l?=
 =?us-ascii?Q?3A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa98190-9a57-469f-4257-08d9dc249c3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 14:53:24.7229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g35YqbANEBzNIdUvI0sI0cn25NHETog2mz9FnXKGRGjD3h7Lp0vs8SRNwfUZbBndoP/Ya8r9jfhdt4VtP17tdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5226
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Sent: Thursday, January 20, 2022 3:41 AM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Juan Quintela <quintela@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>
> Subject: Re: [PATCH 2/3] migration/migration.c: Avoid COLO boot in postco=
py
> migration
>=20
> * Zhang Chen (chen.zhang@intel.com) wrote:
> > COLO dose not support postcopy migration and remove the Fixme.
>=20
>=20
> 'does' not 'dose'
>=20

Yes, typo.

> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  migration/migration.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/migration/migration.c b/migration/migration.c index
> > 2afa77da03..3fac9c67ca 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -3230,7 +3230,11 @@ static void migration_completion(MigrationState
> *s)
> >          goto fail_invalidate;
> >      }
> >
> > -    if (!migrate_colo_enabled()) {
> > +    if (migrate_colo_enabled() && s->state =3D=3D
> MIGRATION_STATUS_ACTIVE) {
> > +        /* COLO dose not support postcopy */
> > +        migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
> > +                          MIGRATION_STATUS_COLO);
>=20
> I'm a bit confused; where were we setting the source state to COLO before=
 -
> I can't find it!

Yes, please read this mail:
https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg03525.html

After that I found I missed something, so this patch disabled postcopy migr=
ation and try to fix it.

Thanks
Chen

>=20
> Dave
>=20
> > +    } else {
> >          migrate_set_state(&s->state, current_active_state,
> >                            MIGRATION_STATUS_COMPLETED);
> >      }
> > @@ -3621,10 +3625,6 @@ static void
> migration_iteration_finish(MigrationState *s)
> >                           "COLO enabled", __func__);
> >          }
> >          migrate_start_colo_process(s);
> > -        /*
> > -         * Fixme: we will run VM in COLO no matter its old running sta=
te.
> > -         * After exited COLO, we will keep running.
> > -         */
> >           /* Fallthrough */
> >      case MIGRATION_STATUS_ACTIVE:
> >          /*
> > --
> > 2.25.1
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


