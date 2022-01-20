Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C304955E7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 22:22:27 +0100 (CET)
Received: from localhost ([::1]:45452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAesx-0006IY-Bs
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 16:22:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nAYr5-0005Ib-JQ
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 09:56:03 -0500
Received: from mga04.intel.com ([192.55.52.120]:23069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nAYr1-0008MJ-O1
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 09:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642690559; x=1674226559;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=72HV4JQgBaVUfIHfSFB+WeQ59RAjwNqokPMyAwhEoTE=;
 b=GHTKHpwLeHxmMIxDfXjoNyxLKhaK9xDIgR/7yCrSS5k8v5cebZSDYUEG
 r7usoJ03RSwlTcCC8Fhoo9tG+P5QIK5bLbCWjMx7wuV9qXcIjdmzhWuC/
 ESkBuuZ4GWriwcXm7eKDV/NjaDPbXUfSWnl1qsiKuLiqYBvMWvbUA5lPQ
 b62Zzjf3DyDo5zgAE+314oqGauZaf6UOQ38nq4k78KX2TuNJ3c/ytJPQw
 pyHXwODIKhOW0Nt9Cwnf8mdEVNsbwbH1qgNp2MOz/6f0prf/Jc6yc7Q8U
 /gmrBGgiotjZ5ypDofOGn4wWpQEEWfr579pmnebp90i36H1URj2fNWH4S g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="244188606"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="244188606"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 06:55:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="616106318"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jan 2022 06:55:58 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 20 Jan 2022 06:55:57 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 20 Jan 2022 06:55:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 20 Jan 2022 06:55:57 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 20 Jan 2022 06:55:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KV/l1sf7Z2qKFZ7mCLMbCi87klswrrZY631mMrqmSB259+AKUN4fAEenTgl1PNM/lAfGU40x7AX+c+JfaLF+HWHV3s+WKT98MShqN3sIJH7x5IF1Hh37yH8H2ll2cVaWkNUPQWIY8F0wgqWKpLUhTl6De08RC+cuoM4cQmeTC3lIbb5aprh5AAn2t63Os9XCciGPec9ZL/COGVb7qE7RghRmTYg9Kn6RgCeJErxgbychLjbwsVSIc7TOshxJIVR8mT4vPw5R4mHAoq500ulPtaaLKtS9OHxVdjSH/Kej6d3QAOQu8WV/oZx4dWx/9B31lNs6ZXvXKAIbFuhVMa1H0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ButC32Ev0jo0qFULyadIZhgQB1ZbTsOLoSPFsnGltMg=;
 b=kKHUqTqdBLOLJKcsrGMxuzKoqLXj4CMzbFkphoXM6fnfAfKEJdlJO8JKoLGUMYRgljmTDn9DpW+lLEWMrRcycft06zIDiVTDdGyeMup+J24W4DHDvKAk2eefAmrOgyX15v0zOx5txv74YrYAh9HYT74DreU68bFeEvFOWqtYvH75eqKncPtKR5inPj6nm4Q7TGbz+sltIc9oZjDJsIyzZR3RoseAo2BDLtdW53TCF7FoRzVffwOFraklPuU3FxDsVRd2ISYawowEjPUx+WD4VwlUgqBhTW2p9FubNaJIwSvDBRsHKPwe+HLyklDBp7waMJroVIvBteewJ3Rb5VMH1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 20 Jan
 2022 14:55:55 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::b5fb:a48b:9a19:5f4b]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::b5fb:a48b:9a19:5f4b%6]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 14:55:55 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [PATCH 1/3] migration/migration.c: Add missed default error
 handler for migration state
Thread-Topic: [PATCH 1/3] migration/migration.c: Add missed default error
 handler for migration state
Thread-Index: AQHX/g0hfNygLz7t906Hu6N0z4XHmKxqvm+AgAFgduA=
Date: Thu, 20 Jan 2022 14:55:55 +0000
Message-ID: <MWHPR11MB0031471F7FE6BD7A3FF97E109B5A9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211231055935.1878503-1-chen.zhang@intel.com>
 <20211231055935.1878503-2-chen.zhang@intel.com> <YehPxVQn8AuC0gut@work-vm>
In-Reply-To: <YehPxVQn8AuC0gut@work-vm>
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
x-ms-office365-filtering-correlation-id: d0b11bde-fa7d-4a3c-57a0-08d9dc24f61b
x-ms-traffictypediagnostic: MW3PR11MB4524:EE_
x-microsoft-antispam-prvs: <MW3PR11MB4524A4D5C6E0BAC56F5F84A79B5A9@MW3PR11MB4524.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:177;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: of89SsAWZfiNW3kcIlo3XbPeQXY3HH52Y1jbYMTGF4rxb0rLH9Jf6ZrSg2kBDCGj2wbhEgoEIetNegTP0VfWF1uS1UmZYN5aRXwwlyZv+1udcneB/KaINyE5sZFlfgxaRVpALX409pIlyujFOrAEnboQWxkQ+5QyMGBXPsKjw+Yz+ERZEiC5ZyskpeLHSYN9hlQVNi3kJa3pW+UVlXa+zmMoCYvzsUQ4FDUttiuBGntvd9m0kMLV8KPxxjLC1D++dIIoguwldiLk/EoCIvt9Z+mmzuBDKEBnEeoxMgmsntDEVTGQl6d8uOlX9Zqxk/SRpxxkvljYHvUu1yElltfqiYm8VRPgUAW8zKUga69NtMvdwpZDmYoqwmbaj/+gE8lrl6dZykAgokIWa5AgvuMtztFsDMNr8JW0KaeEFf4DztC6HTzoCvMvnxNAAChwPGwgb+rlg30aGCEnGwadowudxCk5LZmUrHKHzwuikKXaTyv0L2ZC8GEkajqVRKlSK8rNRsWktPwsFB11/O44Dz0QWbn8Wg8kYfdqS71CmxPDdCAOEfvl6hM37BubnwYcIr9atnV1NQfK0xxsYT7dj9gDfQkBcyzz/4UzUOlGrDEfXcMdhkgj+t3zt5+P7GLWKW8LrVSF0JaTLUCDLa9m3VSn61+eLxSXM+pKEHF6fRVv0FeOhXbo2dG4D8h4TEYA9dLE8/Hf/vSpM9Do8iolEHl7cA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(5660300002)(8676002)(6916009)(316002)(54906003)(83380400001)(186003)(508600001)(86362001)(26005)(38100700002)(71200400001)(55016003)(9686003)(122000001)(82960400001)(4326008)(52536014)(2906002)(7696005)(64756008)(6506007)(53546011)(33656002)(66446008)(76116006)(66946007)(66476007)(66556008)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KGPmkKjJ8PKqYngXexuYSgp5GVvlCTUKx8v28h213npACb/PjO+o0F3PZQtt?=
 =?us-ascii?Q?MDV2jgbWrbRPGpKOV2sUiCERZvXNeRh89Oj/BAnX6qkeasm36yi+G21mfIwu?=
 =?us-ascii?Q?zPHK2RDuPuy0c+ECgkXxfJFscRDDsvK12xTGZZINXqSscIMJCQ2/9Bmi0UB3?=
 =?us-ascii?Q?UYwivOLFIpeRYThdQo/bvKaeS9LHmMW84/2cFDpbqrWKNZ8I6TRP0WK935AZ?=
 =?us-ascii?Q?j7nWqCwkRksiU8M9DvqkuZAyR5Ef0KbHUSLxUQ1PNXOpTt1USc0hAdK0xcKe?=
 =?us-ascii?Q?k8HzmoFs7maDYZ4DGWCdAmZ6AqVg3vngJuciw2S7NhBA2gclTpAq9PoyUGLO?=
 =?us-ascii?Q?1O1GjEusCbVEB7GCy61u4caOrmJhnawy3h8iXlNZC+W5QAFN5iSA/8PqVdGt?=
 =?us-ascii?Q?YRhoghhsErCtTGwQ9gyar/FQRSgUhHep/Zu42I7Lb5YLTkYMTaY539HX8mv0?=
 =?us-ascii?Q?E4zSJ7TauycaNaTta4P2JJqW4MLhrUGJKKUdUyN5PFQlKhNS+e9eLpVhJ5kH?=
 =?us-ascii?Q?eJn03hOu4BtlrPd3nD3YZvoZkXUmRjEg6AhgQXxwrZ+Oq9kybMaznZrrc5DK?=
 =?us-ascii?Q?ms1XPDufdGl02NFEDFon3XqVx508lP1KZsifsYUQL22RXKGDli3sNl0yo+jt?=
 =?us-ascii?Q?qEHzHRURkbp+h1I7p7bkwaj/1aW7qtcG8FdZny620kNkEuu259ifHsAW99Z6?=
 =?us-ascii?Q?IvFWJsDqtlbAAA9eQzc0LxtkPbFp3sZKRg1nJCVRquJc6qPLLL5gdmJOLxWp?=
 =?us-ascii?Q?1QLyVfvcxZc/gnBn0p0RzTJMvxyBkjcTOaNejQKzcDYfvZMkOYaDux09yQSv?=
 =?us-ascii?Q?5InlX9L1WafUR2Gw2/KF6p1wqkbmVc8s3DwFbo+QhtPcxu59YOKTURk93fKc?=
 =?us-ascii?Q?EVc632yS4VkLuR1C+ex7EaZQcQrp7NWKw103rhd4DUSDvKsJg4I0q34YMwY+?=
 =?us-ascii?Q?RQKzIiqPYuKhAwZ33GJfuR/WkcCrL73DCst0mnVRlDqlonbosZJ0H+goNkDD?=
 =?us-ascii?Q?V3O19sirSRVdWKcQ9CYPmDPTc2q6TRkVO982sVreHGaMw+XRhmHoBCa3Wstt?=
 =?us-ascii?Q?eisFAMhJwVW/KCBLyliXo3GMx43I7ZdPaApDqK+ozJB+y24cU8FPYQcMoXcV?=
 =?us-ascii?Q?lB7J4Jgxh9bk6ALSy/iKDtmn0NiNXolF1IgFzrbxpAX59j7qLz7n/PHOTbWD?=
 =?us-ascii?Q?45JCVMxaWWB1jsz+xJ8as3KItsXxwmC7H7UIecsVk0kuXYhsRo/LTqM6l8OV?=
 =?us-ascii?Q?o4nfiolLrybGWTyQl52yT5a0MJK95yOKK4uaCJzZE99d3oyhroJRh5h5RT2I?=
 =?us-ascii?Q?lIyKd0YC1ytBLtMkElMAuX09vxBDQohtPmtBUiZm+eWcFqjU8XzKc3e4tyuH?=
 =?us-ascii?Q?WCztIz08ePND86rSN52hzvFvF/HBZKAMO7NXW6MBucZQZjYTXdlO2rfFIGGx?=
 =?us-ascii?Q?E/htkbtUsyN1LZnW7vRQA90T0DyQ4AXEw0Z0Equuf0wYXpFBgNjyi1/1J93s?=
 =?us-ascii?Q?kUPxz9taDD5i8p0dnCrZXcDosGPayKrJahKgPQW/uVJ59J8+mo58Lwg0j2J4?=
 =?us-ascii?Q?CdiqPcic9aTwkqyAev8JsWu9QioyVUrf7NeHFIf590oB/TQtfwmWa82NCRYD?=
 =?us-ascii?Q?sQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b11bde-fa7d-4a3c-57a0-08d9dc24f61b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 14:55:55.5087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q9J4Eslv5hxkjV7SoGWaUlkMa1HMWMTbzz6ejlt4wmKOdfnw8En3YSdqSzVPAIsR+E5VeHMY1VNhORktxEdm7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=chen.zhang@intel.com;
 helo=mga04.intel.com
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
> Sent: Thursday, January 20, 2022 1:52 AM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Juan Quintela <quintela@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>
> Subject: Re: [PATCH 1/3] migration/migration.c: Add missed default error
> handler for migration state
>=20
> * Zhang Chen (chen.zhang@intel.com) wrote:
> > In the migration_completion() no other status is expected, for example
> > MIGRATION_STATUS_CANCELLING, MIGRATION_STATUS_CANCELLED, etc.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>=20
> I think you're right;
>=20
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>=20
>  however, did you actually see this trigger in a different state?

No, I just read the code and found it.

Thanks
Chen

>=20
> Dave
> > ---
> >  migration/migration.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/migration/migration.c b/migration/migration.c index
> > 0652165610..2afa77da03 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -3205,7 +3205,7 @@ static void migration_completion(MigrationState
> *s)
> >          qemu_mutex_unlock_iothread();
> >
> >          trace_migration_completion_postcopy_end_after_complete();
> > -    } else if (s->state =3D=3D MIGRATION_STATUS_CANCELLING) {
> > +    } else {
> >          goto fail;
> >      }
> >
> > --
> > 2.25.1
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


