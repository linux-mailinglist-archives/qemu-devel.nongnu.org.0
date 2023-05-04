Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FF46F6643
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:49:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puThR-0000lA-K2; Thu, 04 May 2023 03:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puThP-0000jn-1y
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:48:23 -0400
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puThL-0008OB-Kx
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683186499; x=1714722499;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T+rvTnuwhOOGJ6oZBy/zeRupJ2Nl7ccMzisw/64VKNc=;
 b=SFCjTYSQx80HpBTuyZupwfkQZAWfxXR6z8PC2L/pulAOXcnOUaj9wb2n
 2H5u/OUnjBFb81de569gfLBIX3aVPR9VXbM16hpG9oxKNOdzafmhynCON
 ixKwaLIL+PWVAcbG7rA9aPB+IIVi49b7Oh9CfTneAkZC9Z5MARNdNtrKu
 QsdtEMtggABVubbfnJn+KPZYwyzByvqsmOlpf35Jki/X2fvqMVLYcNePU
 lFUznVOHdjdQdhEH3Tv2M3MQS13h8w4EKulfOB2qF6j79SNcJA53delcB
 nMzjGcELujbm5zBpMc6Rig0rYRUixK1i0pAv2eHB4JLdyIeadbirHwdgv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="351851382"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="351851382"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="786417662"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="786417662"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 04 May 2023 00:48:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 00:48:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 00:48:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 00:48:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 00:48:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQu8+xl9NZVQV252AYtlXx7HnUrZA0a34hXhVAoY6pb+uDHpuW/U1mju/kR/RCJ5Tr6APvE7RpiIKHGzVkZnZoFwKvqOuCG2OGdFnw+DV8c162ZL7uxAVDepxd5xOB118Y6gUEBhSoGXzIxS36UyXRSDePjwjV1NAKT+q4NK/AKW9oSgBssfytGlOBq5cT+/kpcnstIMD+UDj0DGFG+tu0E95zFtRdRpGNWZTUlrM+PSpEnaULhOida25JtnXO40RNXCzbjhues5qSgF5J9aLHBOgCzzLFQIyMxy9WQ5EOGGNwCAevLCuuobNBjQazx7GUAXUu7LMicvmpmi9Om4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ct/9VKkGQGo+cMVwTn22k+lu/IX3KdvW8708mZbGwhU=;
 b=SeIHv14QoUgJnFF8VKDK/MsQr5wk7ybw8SxDbcfUEUs61gOBHiDUbOjNKePZe03jfmtLYo11plG2tEXE3lqQ6mIeKm0m1ECQOGVenLtIS1RQKDb6EgomZsEDggLl5GIdovqwtJyLkkkyRvNbvLO6U3L3gy1l/EW5Hz8zqCz3fYrdPu3sfI6EpcFI3pqeiAZxc0Dl2KQtIwlPWcHdq0TvlM6gL4tjZ04enJX0AVbb3t5/ty8N2iju673NIorG2DU8sRf2ZRs4hAStq7ryzobb/I+HCy8E6cRoq0EH59LnFMX9RneAxwgNQPqtMw404WMzl9CJ7TNV+SW1iWCItJVokg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DS0PR11MB7191.namprd11.prod.outlook.com (2603:10b6:8:139::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 07:48:11 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 07:48:11 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "lukasstraub2@web.de" <lukasstraub2@web.de>, "quintela@redhat.com"
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>
Subject: RE: [PATCH v4 06/10] migration: process_incoming_migration_co:
 simplify code flow around ret
Thread-Topic: [PATCH v4 06/10] migration: process_incoming_migration_co:
 simplify code flow around ret
Thread-Index: AQHZegsXJZ94GHrtr02y0xVdaM0qvq9JxWUQ
Date: Thu, 4 May 2023 07:48:11 +0000
Message-ID: <MWHPR11MB0031471552D8C6AA9B6F37EC9B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-7-vsementsov@yandex-team.ru>
In-Reply-To: <20230428194928.1426370-7-vsementsov@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|DS0PR11MB7191:EE_
x-ms-office365-filtering-correlation-id: c6a94d64-4393-4e7e-304a-08db4c73e89a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sCn4iWdzs9af0jG4YF5XbpFrq5Aj7hReLEdfj4FDW3qcJvQV6PQrfyf5uQPBiYxG65SmNXP66mUgTGs7PkA/wk0KSNp2fE/OcNGcmSq2DG70eYDJMk2zquMJrXRCJgoyyP7U4bdDjgUbd/Ibjnnv524YFwcwgtrBbUfVnrKeaohJKSXwpK+WSV3T6vn+QtDAWMwAu/5tKVWseF7J7MR+m0iWnh20rZS8NS7aDqCgs/moy2RQ+Zky6/FfdUHwiKsY9StxG6Cax29cRvDw54/ipQv8u0p9xgyoZkAMk7Ge8hO8LJoA0FbyCAgP60sl6iCN5bdT0deEUhvtbreAh0i94eJFksDikMPQzxXTzWI4cm+vUlUIAUeJbLUljTHCuXtsuTB01SVWNXPu97HGCpIB3LunwEdOewPF+9lXC5OEcSvWyJDkzWNJ9vZuOas+TvyzHXYQEBk5PYZT+Nc+A5aotWycYDGKgCVuonKtbyKuzI4OZtIypEPrqRKyMWZvnQnCK+JMGxMYuYo0Hbz8pJjV4HbQpjJpny+NI+GgLIXEuOGOxRVDJU/LjRbVvcyJbWNGm5VQtvt9/RtZ2IrpLJ4nGhwR93Fv70UhQRUznP4KmrTgeJKbT/x0q4aS/JS8z4To
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199021)(83380400001)(2906002)(5660300002)(33656002)(8676002)(8936002)(110136005)(66446008)(66476007)(41300700001)(86362001)(66946007)(66556008)(52536014)(76116006)(71200400001)(478600001)(4326008)(54906003)(316002)(7696005)(64756008)(55016003)(122000001)(38100700002)(82960400001)(186003)(53546011)(38070700005)(26005)(6506007)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KD45Idj/e+G1PLvpSsxRUpUGtd0bisEt3LUsC5bNbFFOSaa/UHbHoYQZ7qWr?=
 =?us-ascii?Q?oe50TrCT4aN8ZmmhlBEG0e8l6VLeYcb9xCQlxFgWvzHT41lrNGAEhgKECdO5?=
 =?us-ascii?Q?NeeU/42EHQbtfTwrF7XMaWCYfVSB1cBFXgEL8+6rFYRGNr7bVMPGz/iI1LyE?=
 =?us-ascii?Q?2sx0M3dD/JA+ZT8gmJPa4HSF5XSAovnMvhCh/hc3KhQS2evrPaXsYkonW5Qs?=
 =?us-ascii?Q?t2kH4WfUa70EQBlEljApY/pHgfikBpaA3YWRtVBtrGIDLy2LI4Kv91QpTle9?=
 =?us-ascii?Q?8H3d4SoxUjDPWI8MRCoOB5Iq5OZV+/vkT1Vp2XjXhirQIuchluxJe5Kp/4BF?=
 =?us-ascii?Q?0QPfdkDHSDP6Xo4B7vNtaq0awFLc88es1EHeFpdbG7xejoH8tXfRTi7bDRwr?=
 =?us-ascii?Q?ezJgdMUD/hUlaljcG1cI9iH4FMRtwpCZLx2t9+RYMK8QF4M/lgStukROd1ly?=
 =?us-ascii?Q?tpB3AWhb8oEDhdqj1bCekfyoHPyv4z1ZiP1AA7W7yW/OYoZ/7ufjnQZRyaOf?=
 =?us-ascii?Q?p5kynp8zojIGuuD6hbv9ib9EeEmFQlD7MUY1YmglSGcR+9bZuHnherwbBbTb?=
 =?us-ascii?Q?TzwbvbBANyhcylCnGFoLiJEsHJL7ifgU5D2+qqfS0H5CiiFe+LufxeUOOS3n?=
 =?us-ascii?Q?1yqlYdlaI/SalAuk0ul1P3KUifGFCzcyrCz2OfobQUMZW2hApeN33UPEBvyQ?=
 =?us-ascii?Q?fKz5PGUUpxI9FseW3EmRET22o3lX+ocOgEEp4xXYIOm+H91fyJUJnjUjkqOQ?=
 =?us-ascii?Q?b0ntAWSPNcbbwVuwrelm/M13IUpDzFh9poY8wJyqtuK7sXN6ar1u+e6UC2gm?=
 =?us-ascii?Q?is2gcesjf+3vPGxMXGOgkSCX4M9RJiZFhIK2vuEKStxFmzul3oiECNRN7UHF?=
 =?us-ascii?Q?nvNILijxV+/bSx8APOweI8kNMYPJSsYgHNJIoAwan5zheRswNZcLuRaOkOEc?=
 =?us-ascii?Q?MqVv5uhoHHHPwwygOTEg/O+3PqnptCr0xPu7IrE80x+QU5j3BipK4oyQLuFu?=
 =?us-ascii?Q?bFyx7/rPddenvrdsadUYsUiGNx4Az/xkYSN8YAf6IskxMP8ALDRS9vkoudP8?=
 =?us-ascii?Q?fjtjKxihdVb+CvLPqS6d0fD78t90W/V1oaj29K/4iwqxkYfNWr0qW7sktPUf?=
 =?us-ascii?Q?hnd4Ns6pdgx24ZoD5fKPtGSi27C2TMSHdHRLaeA+0V32DbTsM+b22qg0gFge?=
 =?us-ascii?Q?im4pdVo4bk2esnAqHbd8Tp/l8xhDNNl8Bnb+MltYkKa/vWzoh7WQgIC/Vyga?=
 =?us-ascii?Q?A8DF0DuzgLgxLSOT+lGonRp+1P2WUixvuT8WDF4JZmkZgHIiH5sbzmd9oY+B?=
 =?us-ascii?Q?W7wj7QY0Jf7TYrg9dcRgSgutP0GaM1vW9SJd+3nO1dmRLGoGKR0zlcGyv2Hw?=
 =?us-ascii?Q?6vZK/b2mqd9LNEPDB4o0ewiTmD3r1DqRpFNUIOTmk2888uRkAURe5yTuV5hr?=
 =?us-ascii?Q?0Zg0aJThh0Dj4t+uquU5Nz0DC+qDZiqBuQCbNBtsUOYUDnOAzHVHziC7JgEl?=
 =?us-ascii?Q?x+178fUanE+MxaPzwDgbGXBR4rPhP6tphH6wiG2zX85DgCUuZU37JvbLvHYG?=
 =?us-ascii?Q?dwnLVESyOm5HB3eY6tPNu3WbTsPCYSO5/bZojHM0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a94d64-4393-4e7e-304a-08db4c73e89a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 07:48:11.0286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yIez8p6tFb6EAn/mSGdnRh0bl1H6ZSv7GNhG2IH6Gdb6kWQLTyD9vVu3XY+cHEZEfpwPQSHe5htH4W1ueStXew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7191
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Sent: Saturday, April 29, 2023 3:49 AM
> To: qemu-devel@nongnu.org
> Cc: lukasstraub2@web.de; quintela@redhat.com; Zhang, Chen
> <chen.zhang@intel.com>; vsementsov@yandex-team.ru; Peter Xu
> <peterx@redhat.com>; Leonardo Bras <leobras@redhat.com>
> Subject: [PATCH v4 06/10] migration: process_incoming_migration_co:
> simplify code flow around ret
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  migration/migration.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/migration/migration.c b/migration/migration.c index
> d4fa1a853c..8db0892317 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -533,8 +533,13 @@ process_incoming_migration_co(void *opaque)
>          /* Else if something went wrong then just fall out of the normal=
 exit */
>      }
>=20
> +    if (ret < 0) {
> +        error_report("load of migration failed: %s", strerror(-ret));
> +        goto fail;
> +    }
> +
>      /* we get COLO info, and know if we are in COLO mode */
> -    if (!ret && migration_incoming_colo_enabled()) {
> +    if (migration_incoming_colo_enabled()) {
>          QemuThread colo_incoming_thread;
>=20
>          /* Make sure all file formats throw away their mutable metadata =
*/
> @@ -556,10 +561,6 @@ process_incoming_migration_co(void *opaque)
>          colo_release_ram_cache();
>      }
>=20
> -    if (ret < 0) {
> -        error_report("load of migration failed: %s", strerror(-ret));
> -        goto fail;
> -    }
>      mis->bh =3D qemu_bh_new(process_incoming_migration_bh, mis);
>      qemu_bh_schedule(mis->bh);
>      mis->migration_incoming_co =3D NULL;
> --
> 2.34.1


