Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9EF44C1A7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:55:32 +0100 (CET)
Received: from localhost ([::1]:35742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkn8V-0007oN-W3
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:55:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mkn6p-0004xh-MV
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:53:47 -0500
Received: from mga04.intel.com ([192.55.52.120]:49621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mkn6m-0004DC-Gt
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:53:47 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="231383260"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="231383260"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 04:53:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="503952305"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 10 Nov 2021 04:53:41 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 10 Nov 2021 04:53:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 10 Nov 2021 04:53:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 10 Nov 2021 04:53:40 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 10 Nov 2021 04:53:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMepBrnieXOn9vF7YVdlx0NlYnkoO6rBLjtGq4o5YDtn3psSul8JlMWO9YqyqAlPBAqczpB88uRQ24t3tfAv0wdKMY4OGcl9frPy74BbfaJAiMajQznf4AcPin1pnoEMsh5AABZkFhQkwtZPBx5uMZekZaSd3OBoGJMXhma2TpJeBOz6RrobaVPfMrpm+KYWKkQ2WkM+HUh54lKbAnLT6NF8XZEDkKmGcN9EKuFc9aBvh9ZjCVYEHBlsC/GN/6QwezESt+wWRF/qJU8MbVPTH+cQoAbLArJBQB6cu8+Rm+yGbX5xC9UJWCLwUjSsJgUQ/qTQno3v8wF8WEGJMU385w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMaeSngsMLJptPvkLRvx8UzHBSY6FGWADtKz2wEVV2A=;
 b=nNBvl7YC29EJi1TpWObN53DndekfznkIrwF0vXzUlkUhgwkyqV6nhOXcUVzRXYqdhcScIbPt4aqohi/MqnvztQpn8akTAGhIpaPYEuUJuxr1vryXeVQrJod7gZaIUPLjgAAG3I1wO5sw+3D9BE0772UC1F7O2XXBURdHQVhTswnx3/0R1Ccvhy7Ma6SzZiDGTECsyEasaRR+aEp3Ldp2iDack/hcZEKunIhvrXqUuYGWPUYBY3Rmjf+69xPVeCcuS2jmOidIo1vTAFvB1C/GFV1RdRvkgg/8VF1+0te+moQ6jLg8hPzErRv9xLQdDERPmDOHRJxiRQRuKPOBc6RTZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMaeSngsMLJptPvkLRvx8UzHBSY6FGWADtKz2wEVV2A=;
 b=KGSe47K+l+oj7Ijs3Jx9nNMvD+uSFsx+ahq9Iq/gpalpVqcAuZ17wTJ93yMTXsfhjKSmkNHdlsRYMfgXSeRdsAAZnj0TceO4boarMlVOgDekURRj6nYZVYCQuD1nupIVoSrqRXbcdGmjqU8YCavYtPURNoLiu5LohEd5zjnGUZ0=
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 DM8PR11MB5670.namprd11.prod.outlook.com (2603:10b6:8:37::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.16; Wed, 10 Nov 2021 12:53:39 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::9c4d:5c63:9fdd:53da]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::9c4d:5c63:9fdd:53da%4]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 12:53:39 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: "quintela@redhat.com" <quintela@redhat.com>
Subject: RE: [PATCH 1/2] Fixed a QEMU hang when guest poweroff in COLO mode
Thread-Topic: [PATCH 1/2] Fixed a QEMU hang when guest poweroff in COLO mode
Thread-Index: AQHX1g9gfc/LJw+oaEGg5cm8SrEQbav8hg+cgAAw23A=
Date: Wed, 10 Nov 2021 12:53:39 +0000
Message-ID: <DM8PR11MB564075141FEA68713735E898FD939@DM8PR11MB5640.namprd11.prod.outlook.com>
References: <1636533456-5374-1-git-send-email-lei.rao@intel.com>
 <87ee7o2v46.fsf@secure.mitica>
In-Reply-To: <87ee7o2v46.fsf@secure.mitica>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75321400-4fb1-424a-3445-08d9a4491e3c
x-ms-traffictypediagnostic: DM8PR11MB5670:
x-microsoft-antispam-prvs: <DM8PR11MB567037C700F2F5E23C4F5747FD939@DM8PR11MB5670.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:632;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4HkinZXUszufgdAQtIngxA3/N8RoDoiD5qzFtONGZwUemlymXgBNwf9vCfcrYDOea7qYZHK6SyxGOes7QIsIpvNX9a5qOUPfpUUOgapNpz06xTSxKK5tKHSn3uypLGfkyLjkgLdJGwjOsX6RA6Ea3VZGtGFXulzkOJFWtGIvKXXPReU40UlVeAMik+5KBqwKoaVFya4E3O2ZKguiOX+IHwlTTJ/Ceff1L+WiVOoIqEcFd/ZC9cNFtwQlSNQtcL3IeJ6qgminSDAA9gMGqom3mc3mOz6r8URrjoU5SPaSnAl7HSy2fXbiYvVf8Jmm5IaO9y/YVTsO/c4i7x9+r6Jc729iZNOELAaQC9j0UIdSI/gpxB8iV5y2tNSMzRn/no4w9y3jG35GHXnO+xJgnnB1VbyP4J7rv4Lpm/9gqGBglqhWXFl7+ZcCCUIlWVLRWCsSDTS5X9inThB8/hhABRt2SlBgsr7o1PPN9xu2FEkjai8jSzEoesu8/ZBTpRl244xEHQPPytc8rBFE3EuGBzsyIThjRr/73AP0lUuVJjMjWtwASEBvLBrOt/oHF+lIX629iskcP7kk5RdNX2o6vM7I1fW8+dpGyFy+vrVxRUY9IoxnIuUZ40RKnRbwxEty9QtJMdL/3Jx+gv3hEWkU/+4BIEckxbGaFaANQC7wrwQhSWA0SGKcHHSj9sOyRr2zEWfGd8YOZChjID062q0aYdX2Uw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(38070700005)(316002)(6916009)(55016002)(82960400001)(71200400001)(33656002)(66946007)(76116006)(66476007)(83380400001)(6506007)(54906003)(8936002)(4326008)(508600001)(2906002)(9686003)(5660300002)(52536014)(122000001)(53546011)(66446008)(26005)(186003)(38100700002)(66556008)(64756008)(7696005)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KVcwQLtM8GaZw+myo7MPKqbTgz0gu/eEq6Pt+U1wIEhm8p4xo/6ELC7hPeVG?=
 =?us-ascii?Q?0Nave2lcbQgRkiS6q6ab3VK+KyIarjCdmgETD67s2JbiLSUNurV6eypOVzlH?=
 =?us-ascii?Q?MZpx96Oad7597Urx24kEwhvBY4RVbE9vgJHRwPZHv30+omM3rDk+7SwdWgxm?=
 =?us-ascii?Q?dtGwkE30/831klCNkvvOJCDNuD83i8/8CWrsG1GrENmwYS4jfHnJadEoLulD?=
 =?us-ascii?Q?DFBcN+TG4ptLt1j45zZgotPeciQVZ+JYR+BIl3LJY2mhbBxacVENaszpdrK+?=
 =?us-ascii?Q?cnnFU9OGxIfuhzk7ogWk9CJNcR7gnbP6tfKGJQBhTnc4mQgQ+aVLpb9tlMaI?=
 =?us-ascii?Q?xgvjsVjcJHHFJO59dnPhDSoEuJxcg+ZvBb/DfLxsjMgoXjrT4A0VizK/euED?=
 =?us-ascii?Q?5jOq3FOEehKh/IKybZFOXynJ9SER4PFKeudI14ctOrJcXOsRpi172/WE6hdl?=
 =?us-ascii?Q?tn7Qk2J+wIYGrxpKcZnco6Vs7EoX7StZYA4abS9sk5KnvlIjYO1G6vHpXXdY?=
 =?us-ascii?Q?1ka5+7mmdseHVuYMGNU6R1PHgvwVaIIQnGl6UraHENLc0g5mhul+zLQz25wG?=
 =?us-ascii?Q?qvVBjxw9MpWy6OEasTnu5D6NcpYK4h4hQitu3e0jRhwQevAh8B7x19Fd8RBg?=
 =?us-ascii?Q?tOpaG6VTpQKudRjIbwuwkxHXxLvRMeGPYhR+FUVcxuPuL3Y4hHje2e1bdJnB?=
 =?us-ascii?Q?PA6WTl2QN7JOK8yYQdP+qPOJTJS7SIJ46MWsP73ihfvMR/ZPwdPQ9fwoYL2Y?=
 =?us-ascii?Q?g6eW2Ki5upFUMM80Wgf5LL/fDMVgh5nNP4rKnyME6rq1uvE/UfGrmtAWWTZM?=
 =?us-ascii?Q?cxs5tDtEh0DQKmPEZT1GqnDFL/vCtyyketzwzdAM/n9Cg6i/9lW03It8PhKT?=
 =?us-ascii?Q?yeGGkibQ4OUPW/dkObmlfNVFDkTtjEZkeS+n6z5Cs2olC06a88Wy11GmDpmh?=
 =?us-ascii?Q?HT+fvWW9vYKAznIx8TH/3xpjWY2CIeGMcV7dOjTpQpPyhMupbrvv4TO2jiTa?=
 =?us-ascii?Q?s/yh2dZGlZbD0tXUy8npj/0ZmyKUz9ZiSLoT0idaLKCZxfIycdXl+vfS3zFo?=
 =?us-ascii?Q?6WTsCwZm0h4sCGAExc+8K+MkzUAXskd87ImILblzDLzobO0DGvX+h9UpFC8D?=
 =?us-ascii?Q?pYDAVzBS3e51f5ji4Vo1SDDVUB2VWnQvej2jsGP5D4N9H+HFhC4SeH6gcXWr?=
 =?us-ascii?Q?z2muCuPy1QizNPWtcVOg3j0DD9ZM5IsnuGxTbuD/hVrQgujClwElu3FriZB/?=
 =?us-ascii?Q?OIpQ77SlgtKyqM53FS4BgjuHAFzOED3M2WdEuYwZCR+eUWrMb39A2eKPq2dL?=
 =?us-ascii?Q?zG4tTCPXYHjqInB+9RD2d2546acY9vXKNGxtrJzL5QZ9yt9wwbifLIQXlbCj?=
 =?us-ascii?Q?KF4kxHkgCVkxbF7RY9KGkntYaucxl+OCdDJEeHmHbJxLh66qbtfzEFa/38iX?=
 =?us-ascii?Q?z+7RjaIU5lmQWBgosLyGej9mHWKzH75citjGwEYoUqSY4G4RyDY7fOASgAAS?=
 =?us-ascii?Q?6QMqlWzicU+g7yoRy8knZbSQSLU3XNTKh9DfExTVekYvGOb6Bz6+xJZNANPM?=
 =?us-ascii?Q?hd+kuP++cs/uRwEGR8xM0wF5ZS/8AwoAJ8/vayMfhUa/H6RWI1m4HkeZGeXH?=
 =?us-ascii?Q?L8GUAyFxIc+ukAQ4RzBDZiw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75321400-4fb1-424a-3445-08d9a4491e3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 12:53:39.5490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FLxP5rQzfSsE6V/SW/pRwQWlUgt0dwoBNGdrqG1bKjsdJT+3830K2/0ljiNCM+tQj2GEqSBpFXtXIBnTevSLDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5670
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=lei.rao@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>,
 "zhang.zhanghailiang@huawei.com" <zhang.zhanghailiang@huawei.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OK, will be changed in V2.

Thanks,
Lei

-----Original Message-----
From: Juan Quintela <quintela@redhat.com>=20
Sent: Wednesday, November 10, 2021 5:55 PM
To: Rao, Lei <lei.rao@intel.com>
Cc: Zhang, Chen <chen.zhang@intel.com>; zhang.zhanghailiang@huawei.com; dgi=
lbert@redhat.com; qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] Fixed a QEMU hang when guest poweroff in COLO mode

"Rao, Lei" <lei.rao@intel.com> wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>
> When the PVM guest poweroff, the COLO thread may wait a semaphore in=20
> colo_process_checkpoint().So, we should wake up the COLO thread before=20
> migration shutdown.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>

A couple of notes.

> ---
>  include/migration/colo.h |  1 +
>  migration/colo.c         | 14 ++++++++++++++
>  migration/migration.c    | 10 ++++++++++
>  3 files changed, 25 insertions(+)
>
> diff --git a/include/migration/colo.h b/include/migration/colo.h index=20
> 768e1f0..525b45a 100644
> --- a/include/migration/colo.h
> +++ b/include/migration/colo.h
> @@ -37,4 +37,5 @@ COLOMode get_colo_mode(void);  void=20
> colo_do_failover(void);
> =20
>  void colo_checkpoint_notify(void *opaque);
> +void colo_shutdown(COLOMode mode);
>  #endif
> diff --git a/migration/colo.c b/migration/colo.c index=20
> 2415325..385c1d7 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -820,6 +820,20 @@ static void colo_wait_handle_message(MigrationIncomi=
ngState *mis,
>      }
>  }
> =20
> +void colo_shutdown(COLOMode mode)
> +{
> +    if (mode =3D=3D COLO_MODE_PRIMARY) {
> +        MigrationState *s =3D migrate_get_current();
> +
> +        qemu_event_set(&s->colo_checkpoint_event);
> +        qemu_sem_post(&s->colo_exit_sem);
> +    } else {
> +        MigrationIncomingState *mis =3D=20
> + migration_incoming_get_current();
> +
> +        qemu_sem_post(&mis->colo_incoming_sem);
> +    }
> +}
> +
>  void *colo_process_incoming_thread(void *opaque)  {
>      MigrationIncomingState *mis =3D opaque; diff --git=20
> a/migration/migration.c b/migration/migration.c index abaf6f9..9df6328=20
> 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -225,6 +225,16 @@ void migration_cancel(const Error *error)
> =20
>  void migration_shutdown(void)
>  {
> +    COLOMode mode =3D get_colo_mode();
> +
> +    /*
> +     * When the QEMU main thread exit, the COLO thread
> +     * may wait a semaphore. So, we should wakeup the
> +     * COLO thread before migration shutdown.
> +     */
> +    if (mode !=3D COLO_MODE_NONE) {
> +        colo_shutdown(mode);
> +     }

don't put the code on the main path.

Could you just put all of this inside a colo_shutdown() call?

Thanks, Juan.

>      /*
>       * Cancel the current migration - that will (eventually)
>       * stop the migration using this structure


