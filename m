Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBC34525C5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 02:56:21 +0100 (CET)
Received: from localhost ([::1]:45362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmnhr-0007Ty-UQ
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 20:56:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmng7-0006Q9-Ts; Mon, 15 Nov 2021 20:54:31 -0500
Received: from mga14.intel.com ([192.55.52.115]:40852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmng4-0000L4-Tp; Mon, 15 Nov 2021 20:54:31 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="233841858"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="233841858"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 17:54:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="454078585"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga003.jf.intel.com with ESMTP; 15 Nov 2021 17:54:23 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 17:54:23 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 17:54:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 15 Nov 2021 17:54:22 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 15 Nov 2021 17:54:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpdVdt1/gUGxBsjM6qlY1l9w9lIC0GKezeiSJWeFU9+OgdNqPARL74RFMJDXUUYR9eaGyR1oMBJPMyNkALaWSZYLoMa2HTBKzQWNOKp88+c/FQsPRhcF71EQSlMQgl4GYvw+NqyTNfEEfr5Nde37+pYaQ5aFLN6vpyKEiwLSxcSdZUP2sDGQjIAl5YPjtKENfuBmgaQxTI6SS/ObfnlwRRq8Fs2zuBaM/Iidw2Row3ckm0qs9hUII5qqDxVJIp2rfAhI1iQ4wEGZwH/dRVmTbfrlmEU57zaVlyJ7ZETkEJsksPxsIIchql+Gch+5k/c6St7F5c85VUfV1UJ5pemJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlLUZiD3vj4vljXDOevUJpxHLyYlIlqifh2T4H5Eb+I=;
 b=IKdwDHOTLGY+o+21x7FokwkXYBC1twKhps5EQma4ElzwjNPECVdz2xKkIVWRpJThoOtuYLb/dl2E8icnuj5iYylr0vPXY11skE8+ioQKgdqofjBsvt6RoMbI02R2SP3sMpu0ehkAzpwPnGBMkCGlz5XUBWcX6wsm2BEDuMkV+xQRjXHw9lvwX6qmf2Mt1oVgsc6pd5vf3LI/1gKaI1WT+4+aAHKZCipxnTKBOW2f6Y681EA1xy+EyCf1StwjVbh8tntOlj1mJn9NVAsaPYSNTb6GFGVum7KKl0R2fmnRnQTXa0sjcBVmanCJkWu/19Bxex6tytpmDtFzKlJDQZCBWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlLUZiD3vj4vljXDOevUJpxHLyYlIlqifh2T4H5Eb+I=;
 b=vXndDgUVcX2X4oko1B0222Z06PNdTLq9XpFRlr6AWWC83NYrrhaTwaopZL/P006PuR25NU9GJh5lYap+7lO/7l8BlFyfq1pBqg6zcs8kaongHjSg8n7TBNxDVmv6BqCCMfyJQ+VY3jIdn3hZHr6XrppNWpdoBTjPFqIpyjDTqbI=
Received: from BL1PR11MB5479.namprd11.prod.outlook.com (2603:10b6:208:317::18)
 by MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Tue, 16 Nov
 2021 01:54:20 +0000
Received: from BL1PR11MB5479.namprd11.prod.outlook.com
 ([fe80::fc12:a79b:c5db:a9d3]) by BL1PR11MB5479.namprd11.prod.outlook.com
 ([fe80::fc12:a79b:c5db:a9d3%7]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 01:54:20 +0000
From: "Qi, Yadong" <yadong.qi@intel.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: RE: [PATCH 1/2] block:hdev: support BLKSECDISCARD
Thread-Topic: [PATCH 1/2] block:hdev: support BLKSECDISCARD
Thread-Index: AQHX2dzamYXy/ElsOUmIuyd+uNaIiKwEiFaAgADYMlA=
Date: Tue, 16 Nov 2021 01:54:20 +0000
Message-ID: <BL1PR11MB54791AB7D84D33C56AB6AA37E3999@BL1PR11MB5479.namprd11.prod.outlook.com>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
 <20211115045200.3567293-2-yadong.qi@intel.com> <YZJVVzott+zsoLqN@redhat.com>
In-Reply-To: <YZJVVzott+zsoLqN@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe5ff87d-e58a-4868-9730-08d9a8a401c5
x-ms-traffictypediagnostic: MN2PR11MB3919:
x-microsoft-antispam-prvs: <MN2PR11MB391943CF3FF394CB14E44D2EE3999@MN2PR11MB3919.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oMwgQqrTYe4uPiMF0m4xTCteSJNbh2I6Gi8fDkl11SvI18BfTi9OX7MH8lnFJ2d7ZLE6X1TeNiQLyF6YvB9dX3ox2wOe8W5lX1ethQD0J+3/CgH/90exRs67UjMTSjSm07cGvV2QzBpXta5YbmBtfNpEIARIvDBVMpjddVXEI1tL6YZugTwlzh/0Ozj74LGcyEqnIAgVYuoUzuvnVWzJE4GXA54dSStqyKqOOBsV35ySCiY367g8FWhy8wsFxJ2A7deq61m8OlX/sgFXaIZ2ZePrUUhTRqmL5TiU03trIGZpzcJBeanX2GWvrHOVhPHnsCGvsqRLE/NKjaJaIhSWHITn/lvybJw1ncd/GtoKlq/TgRcaS+XxSWjYTi6kX1J+eXkjBi7rWQh+0I9qzgFcX+1T3lk4gth9QTvvJrB4mTFdC/dib7yl2X8wJK/SitVi1J5kFKSwVRcldqH/nfvFpMIje9zfg0N/frCZsGLBXaxkYC3uBrcCv5wpsR+egGyTFGt9hBSpHxDNtf+by8YSvRbQ3G2izNQXZksPJwnVIlV+mCSyMHPezUIrwoem7pyXE+QLX7q+RovtweCz3rAynphG5wlCjcIONNqO5OIyBciLbiug/1OxWlLB737tKNbX2s2p860FLFY89nvnX9/bGnOARUYzSQJ/ASX4H1RjeKNvlhLDty1yMH4RUPIdtv6m6y4T1Ii4ocJo5siV6TAB3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5479.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(52536014)(7696005)(508600001)(8936002)(83380400001)(4326008)(316002)(66476007)(122000001)(86362001)(38100700002)(54906003)(66556008)(76116006)(71200400001)(5660300002)(55016002)(82960400001)(66946007)(38070700005)(6916009)(64756008)(66446008)(9686003)(6506007)(186003)(2906002)(26005)(33656002)(107886003)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uVUzUeiNlIEeg6279Uqh6rHHJUMeg6ksjtqhG/K3aM5hbdqPobi49GcK4UNS?=
 =?us-ascii?Q?NR8sK78/pDWSXSEz9v6bNphdRluH11Ow0CqqcupltElGzq8YY/gtrlF37Khl?=
 =?us-ascii?Q?S3LnSZGuHsVho03J5slNWGHEV2k2bmDfAFXclSF6a/LgcgY3GEzoS/xYQQ7i?=
 =?us-ascii?Q?b+VsOUo+Hxd6VfYatFh/cz27teMPtt7gWWHqSOP1/Vhe/GOme98kHQ7s0JrQ?=
 =?us-ascii?Q?xTPt9iwPZ63RBCd++cT7gf0dSjysTNh3h6F/NsCmKqtAcAOkyeoYsifLyO6e?=
 =?us-ascii?Q?mWGHMGzBPeDpRkG8beaz7MGl6yEC8en1Jj4+PIbpwb+cxl7t9+wKxhzdJVPz?=
 =?us-ascii?Q?eu+RV/dXxqQ//XLTSxBUynr4xnqouYT2gt4UwkDCwz/bvc7Dz92RRS4TPhw8?=
 =?us-ascii?Q?WCoRBmbvLG4/tUiWtnhXmnkjwT/e7MhB29bzgR4BqJnklqu8ss6mn/IUFQZK?=
 =?us-ascii?Q?iin4FFKmLzksnzqrrLxmM2XMDfTV0qDCttxzxMhd8p97I4NF30U816/ZeFch?=
 =?us-ascii?Q?/wgPbs7CRqQb6/p0llDj517lZ7O8bUi9vLCYLTrTc5Vb2pR4C/eLMN/uMZr0?=
 =?us-ascii?Q?LE8iWFqIj1rQg+AV11C3Jrk9Oi6DfLV7m0fx0mAtWexc/ajRGWD3lSVh+WRU?=
 =?us-ascii?Q?kElvtkEyrlL0/IpL5JrWteavFL8jLeEWNtf1wMVBwHC7FF3P84RC5nNqiH7P?=
 =?us-ascii?Q?dufRNsnf5wGFJXCCau01541TFvgIGzf+qVya+HwtkbHymUDAJ562qReAbEJA?=
 =?us-ascii?Q?Ml4LqGpG6OMKLZ0iJyjXuUa6qaN7BMDlRbteca1ZhtmsGkXI1KrZmk86ZGv0?=
 =?us-ascii?Q?E7sW1TdK9vmHwFn6p3tRaO+Pm1Do3hJpY3jphvHDyM9/HDcEoW5y/0r0tUjv?=
 =?us-ascii?Q?+JSTO7DwjZWMyyYfGU9QPFAm4j0EzBSLnNs2QzK/+HvHBYQCBaWrCAwiDRxs?=
 =?us-ascii?Q?wgfSVj2k1JNICrHZnoeMzi2h3sZvNFUaVz+OH3SumxwB69Y70QyE7p/DeU5z?=
 =?us-ascii?Q?4eDkffVaGVyGO6Xc8udEntNLW/7KD/NR50ET/ZG3um8B0VsWOoDR66om4SyG?=
 =?us-ascii?Q?UcxdlqJSke1C4/OMQRz4K5ba58MHviuNCi/Uueak6wp0JyoMtLs8mTizf6ER?=
 =?us-ascii?Q?a9iS6KAgS9SfBQXTHRcX6KZbrsZObWxAfT0ADVi6dxhO93KHW24E6c3IzeLe?=
 =?us-ascii?Q?1hCU+vSo5T8e91Jo6kZ5BnywkvIxO/8iWJeLKfB983QmDam3XDUliKn3GXVe?=
 =?us-ascii?Q?3a9S+GOhtqq/0ibAkbffA1oSF8gkoS6ufdPJL6SBpGzCA/ORtk4oLHbFRXT6?=
 =?us-ascii?Q?tCjVhrn0F3yCBgq98F3wWpmhZdlSr2VOvFYAMyt3WMzHoYjTOJaXcYLwMRFg?=
 =?us-ascii?Q?9LXweoJXkaFtVtzMgLi5rnZVPuguAX7CNY/3Jliu6X+iu71GSjvjrob9e04U?=
 =?us-ascii?Q?ZuZuSTH7xMFJfx7LgZ2zCYRcBDWYAIS+byL1NeHnHeVac8djHPw7ERwOhXUF?=
 =?us-ascii?Q?xM6LpdmLPvB5ozy94/tBUCXy9Y2ZqM7pW/GZXjjXj1pDYLKPjsxKwYDY1dXk?=
 =?us-ascii?Q?Nqhpc9otL9lbuotkv/1E3Mc0aIKlF6rv6HBjELoU/+s4mdg436yhHkN6iher?=
 =?us-ascii?Q?/Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5ff87d-e58a-4868-9730-08d9a8a401c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 01:54:20.6310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mYUsatEn2mleuYWCoxn9zYG0csfI110mr7D05CIxkMl1mU4p5QN/68Yw97eSXQR3iVkLAmbHa2mNhE7NGVOMAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3919
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yadong.qi@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, "Chen, Luhai" <luhai.chen@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wang,
 Kai Z" <kai.z.wang@intel.com>, "hreitz@redhat.com" <hreitz@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>=20
> Notably absent: qapi/block-core.json. Without changing this, the option c=
an't be
> available in -blockdev, which is the primary option to configure block de=
vice
> backends.
>=20
> This patch seems to contain multiple logical changes that should be split=
 into
> separate patches:
>=20
> * Adding a flags parameter to .bdrv_co_pdiscard
>=20
> * Support for the new feature in the core block layer (should be done
>   with -blockdev)
>=20
> * Convenience magic for -drive (BDRV_O_SECDISCARD). It's not clear that
>   this should be done at all because the option is really specific to
>   one single block driver (file-posix). I think in your patch, all
>   other block drivers silently ignore the option, which is not what we
>   want.
Sorry for the absent for -blockdev. Will try add that.
Also I will try to split the patches.
And for the BDRV_O_SECDISCARD, it is specific for file-posix.c(host_device)=
. Maybe
I need to add the option only for file-posix.c.

>=20
> > diff --git a/block.c b/block.c
> > index 580cb77a70..4f05e96d12 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -1128,6 +1128,32 @@ int bdrv_parse_discard_flags(const char *mode,
> int *flags)
> >      return 0;
> >  }
> >
> > +/**
> > + * Set open flags for a given secdiscard mode
> > + *
> > + * Return 0 on success, -1 if the secdiscard mode was invalid.
> > + */
> > +int bdrv_parse_secdiscard_flags(const char *mode, int *flags, Error
> > +**errp) {
> > +    *flags &=3D ~BDRV_O_SECDISCARD;
> > +
> > +    if (!strcmp(mode, "off")) {
> > +        /* do nothing */
> > +    } else if (!strcmp(mode, "on")) {
> > +        if (!(*flags & BDRV_O_UNMAP)) {
> > +            error_setg(errp, "cannot enable secdiscard when discard is=
 "
> > +                             "disabled!");
> > +            return -1;
> > +        }
>=20
> This check has nothing to do with parsing the option, it's validating its=
 value.
>=20
> You don't even need a new function to parse it, because there is already
> qemu_opt_get_bool(). Duplicating it means only that you're inconsistent w=
ith
> other boolean options, which alternatively accept "yes"/"no", "true"/"fal=
se",
> "y/n".
Sure. Will use qemu_opt_get_bool() instead.

>=20
> > +
> > +        *flags |=3D BDRV_O_SECDISCARD;
> > +    } else {
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  /**
> >   * Set open flags for a given cache mode
> >   *
> > @@ -1695,6 +1721,11 @@ QemuOptsList bdrv_runtime_opts =3D {
> >              .type =3D QEMU_OPT_STRING,
> >              .help =3D "discard operation (ignore/off, unmap/on)",
> >          },
> > +        {
> > +            .name =3D BDRV_OPT_SECDISCARD,
> > +            .type =3D QEMU_OPT_STRING,
> > +            .help =3D "secure discard operation (off, on)",
> > +        },
> >          {
> >              .name =3D BDRV_OPT_FORCE_SHARE,
> >              .type =3D QEMU_OPT_BOOL,
> > @@ -1735,6 +1766,7 @@ static int bdrv_open_common(BlockDriverState *bs,
> BlockBackend *file,
> >      const char *driver_name =3D NULL;
> >      const char *node_name =3D NULL;
> >      const char *discard;
> > +    const char *secdiscard;
> >      QemuOpts *opts;
> >      BlockDriver *drv;
> >      Error *local_err =3D NULL;
> > @@ -1829,6 +1861,16 @@ static int bdrv_open_common(BlockDriverState
> *bs, BlockBackend *file,
> >          }
> >      }
> >
> > +
> > +    secdiscard =3D qemu_opt_get(opts, BDRV_OPT_SECDISCARD);
> > +    if (secdiscard !=3D NULL) {
> > +        if (bdrv_parse_secdiscard_flags(secdiscard, &bs->open_flags,
> > +                                        errp) !=3D 0) {
> > +            ret =3D -EINVAL;
> > +            goto fail_opts;
> > +        }
> > +    }
> > +
> >      bs->detect_zeroes =3D
> >          bdrv_parse_detect_zeroes(opts, bs->open_flags, &local_err);
> >      if (local_err) {
> > @@ -3685,6 +3727,10 @@ static BlockDriverState *bdrv_open_inherit(const
> char *filename,
> >                                 &flags, options, flags, options);
> >      }
> >
> > +    if (g_strcmp0(qdict_get_try_str(options, BDRV_OPT_SECDISCARD), "on=
")) {
> > +            flags |=3D BDRV_O_SECDISCARD;
>=20
> Indentation is off.
Will fix it.

>=20
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -160,6 +160,7 @@ typedef struct BDRVRawState {
> >      bool is_xfs:1;
> >  #endif
> >      bool has_discard:1;
> > +    bool has_secdiscard:1;
> >      bool has_write_zeroes:1;
> >      bool discard_zeroes:1;
> >      bool use_linux_aio:1;
>=20
> has_secdiscard is only set to false in raw_open_common() and never change=
d or
> used.
Will remove it.

>=20
> > @@ -727,6 +728,7 @@ static int raw_open_common(BlockDriverState *bs,
> > QDict *options,  #endif /* !defined(CONFIG_LINUX_IO_URING) */
> >
> >      s->has_discard =3D true;
> > +    s->has_secdiscard =3D false;
> >      s->has_write_zeroes =3D true;
> >      if ((bs->open_flags & BDRV_O_NOCACHE) !=3D 0 && !dio_byte_aligned(=
s->fd))
> {
> >          s->needs_alignment =3D true;
> > @@ -765,6 +767,7 @@ static int raw_open_common(BlockDriverState *bs,
> QDict *options,
> >              s->discard_zeroes =3D true;
> >          }
> >  #endif
> > +
> >  #ifdef __linux__
> >          /* On Linux 3.10, BLKDISCARD leaves stale data in the page cac=
he.  Do
> >           * not rely on the contents of discarded blocks unless using O=
_DIRECT.
>=20
> Unrelated hunk.
Will fix it.

>=20
> > @@ -1859,6 +1862,35 @@ static int handle_aiocb_discard(void *opaque)
> >      return ret;
> >  }
> >
> > +static int handle_aiocb_secdiscard(void *opaque) {
> > +    RawPosixAIOData *aiocb =3D opaque;
> > +    int ret =3D -ENOTSUP;
> > +    BlockDriverState *bs =3D aiocb->bs;
> > +
> > +    if (!(bs->open_flags & BDRV_O_SECDISCARD)) {
> > +        return -ENOTSUP;
> > +    }
> > +
> > +    if (aiocb->aio_type & QEMU_AIO_BLKDEV) { #ifdef BLKSECDISCARD
> > +        do {
> > +            uint64_t range[2] =3D { aiocb->aio_offset, aiocb->aio_nbyt=
es };
> > +            if (ioctl(aiocb->aio_fildes, BLKSECDISCARD, range) =3D=3D =
0) {
> > +                return 0;
> > +            }
> > +        } while (errno =3D=3D EINTR);
> > +
> > +        ret =3D translate_err(-errno);
> > +#endif
> > +    }
> > +
> > +    if (ret =3D=3D -ENOTSUP) {
> > +        bs->open_flags &=3D ~BDRV_O_SECDISCARD;
>=20
> I'd rather avoid changing bs->open_flags. This is user input and I would =
preserve
> it in its original state.
>=20
> We already know when opening the image whether it is a block device. Why =
do
> we even open the image instead of erroring out there?
OK. I will try to find another way to record whether backend driver would s=
upport
SECDISCARD.

Best Regard
Yadong



