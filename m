Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301676F6638
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:47:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puTfy-0007sW-6S; Thu, 04 May 2023 03:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puTft-0007nk-Ag
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:46:49 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puTfr-0006tl-Fz
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683186407; x=1714722407;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FLlDjGxL9Zs+Yj1JqDseIFkF7PClidF7TnrFOP95gXA=;
 b=Yf9FiWY37HtfB6X0eo1FnFT4h2IBhQzsDsjXDB2qSkP1BMbghU36NQnY
 U0UtbKkaxJZfGV5/Bx8gJ61Yzy6fzmXNsGYuQLC51GMj6DrczM/C+zpCA
 QI+QNSXu7VqAfHpZ7JbHkmNDS/BKBnAQbLAq2CWiLD3X9gjAyJX0F6X4f
 6x+a8uZIR5plbkeSfMhPjozSI7duRZIOaa8sFM19klMM6erZRt5KVCo4x
 mHF7m35ddc22wpUimCAZZ+ML2jDADOsIf7ygONyZAXAHOln/IMYOJZJhf
 5+gXnOFwVznu2VHYuT6Q2AABoDEOVx5I6Az+P4Y1nRx3h6u87OOq/Nc9y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="348902745"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="348902745"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:46:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="1026826404"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="1026826404"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 04 May 2023 00:46:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 00:46:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 00:46:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 00:46:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXucPTVnX6S49HD7fql35fm435R/P2Ubfgnl26ArMxrs3BBFT+y5m/SN1bZ9dbmSQGRCY+0TZmZoDpGpD9jOnI0x9rh72GGH/VPAXmLu/NcbMN3oLqoLRTwmawxJv0tB8eM3/6tAtReJX8egMUcd7cwydRAroh8xNBKm66PUipkNUL5ef4Sq7iJk3H6h5xh0gf8HgJ3gBbvmHJTkiIom1jXvOg1h+Hj8Pr8Aw+AG9ihBQVo6gRkg0okOhGSHwrhXMVMv7NFnXHxKP/u8qpw+yS0x5/1Amd/BvD78ycJKDWBLqf5bM5O9aHZsv8Rfn7hBo/rozH3L8R3eX/GE1WtL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXIaQJFEJ4kQkmrHswRHLD258qc964J999FNRHlzSD0=;
 b=gbds7jCS0ZpRh6uUVZI8fG3FWgehtJU9ObrBZrsI93v+wx5ODK4KQ8EXBI2uBYVmoN0kLR3RWgdWXPHSW8UmE5nC1jroSXYAlxoAMYB+ZEDRMKxBdh2EgkH3Vq7C0MMrQ/IxDU9giNA/i9JWUZcpl3izgBTdbh6R69CaFnehzZevmuALJZXW7aD5FHewjsxBRTt5Oo9xQDm0d9jYPXWaAZWEcff5SUbn+FBSMntZDLeY3fdN5MnvN68949DyVP+QXhYjA7OKCjn0bLAnXXV6gKHnmOXBvhPVAvOvBq9kmOoGoxmPA5zrq/yQ2ueyKNjBOb/XIg2uHH2uEbtVFMf1Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DS0PR11MB7191.namprd11.prod.outlook.com (2603:10b6:8:139::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 07:46:31 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 07:46:31 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "lukasstraub2@web.de" <lukasstraub2@web.de>, "quintela@redhat.com"
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>
Subject: RE: [PATCH v4 05/10] migration: drop colo_incoming_thread from
 MigrationIncomingState
Thread-Topic: [PATCH v4 05/10] migration: drop colo_incoming_thread from
 MigrationIncomingState
Thread-Index: AQHZegtA+ItxwHZTV0us+rE4+KxjHq9JxPDA
Date: Thu, 4 May 2023 07:46:31 +0000
Message-ID: <MWHPR11MB003170B0C3F8FD1B795777F29B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-6-vsementsov@yandex-team.ru>
In-Reply-To: <20230428194928.1426370-6-vsementsov@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|DS0PR11MB7191:EE_
x-ms-office365-filtering-correlation-id: 12308534-15f7-4d9d-de33-08db4c73ad58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WoZ4tbgiIW+WKVNQ6F40srv2K0K7kxmp1KE7Q2K93bOXHc3w9XA9adQNaMtaIBAeU8HdS+WZE8sd6m5Kmw0XeVs1hY0+9iP18RAoNIO9Ay0wUOq1EKVD/88jL897IebcWefJFGTggdvz22dAVR2bWJIAb5HWe6bCZwbsZ9Hq/jB6TxfCeboeQDpZgsDdmNjKchXzhe3iYbg9R8/T+BD0/2qIGzJNRjJwVAX4DC4jHYUGFIcirVh7vxi6yijmwebJVyb5ZzNL2XOPqK0qGdGJHcYRciUsAfJ1ISRGM53j3zD8WH+uL42fSIluyNeM7EH8JghuJElrurWW0liY6/X31VPtjUJh8Vi7XRWIdxsSs/a66oD23mEBXdMmXnILtire0y36aQS3cvKcHylmVDBc0OEpTsrCDstQjG4tEByCefXmimCoiJmNQsfdS5kA7P92EoaLuzFCWDWRzhEirk0ou7o2Wn3q1GdkS49DF3pXVlL+gyW7MKR4PaR8ZZb1aCncTzwphCF9uNhSfNIPXxy1Mj49ypRQGs9LzjkXZlenLWntXM3ErUUpFOAKJDo+H7lgzRk3R+kSWhvP2O9xr3Q8l1yrsmxQm478oznAcDhkForZBp0Z1OWHIruPZkJRH2mW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199021)(83380400001)(2906002)(5660300002)(33656002)(8676002)(8936002)(110136005)(66446008)(66476007)(41300700001)(86362001)(66946007)(66556008)(52536014)(76116006)(71200400001)(478600001)(4326008)(54906003)(316002)(7696005)(64756008)(55016003)(122000001)(38100700002)(82960400001)(186003)(53546011)(38070700005)(26005)(6506007)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lpuHz5nyHLznfOzsoxF4/ZYCCegDiwoN/HR3WM16beWfUhnpRF/CTIDncb9M?=
 =?us-ascii?Q?dUPolMx/taHIYn+FHtkUau0vb1d0z7K6IrIJJkdlMU7N4NORXSEkT+0iMTR5?=
 =?us-ascii?Q?gXIYSlpYJnwt4meXqOjn9O+PfxSI5Ck2L8cxUy66cFgJNYqFv1qXFwMlZZNy?=
 =?us-ascii?Q?++88hR8iZT4A2gnpBL5eLUsGaDLfvLNolAR501EKysPr2WgQOHK+wFJwbei0?=
 =?us-ascii?Q?ymPsObJRdnqXOIcKZdqv/PWEwcrtinuihVMlju4nZIHLj1K4ZrjY+2dTRisK?=
 =?us-ascii?Q?vF/HtO45JAYEE1WJUC+mCUwQ254P38d6tahWtPN4cCU/IRMTh2X5uVJUGC/r?=
 =?us-ascii?Q?hYROupwk7/QboUl6LF5dd7wZ4lvR8TYX8yjS7OKpOOIv7c8W04p3f9kfiLkJ?=
 =?us-ascii?Q?5BeCl2Auz8iQVxZd8MV+/GDe2qKlHZTNTwqfC+NJaK+94CM6arqVFl32TBph?=
 =?us-ascii?Q?KRbCtnia7eG1WBV+J5aLOr7M+E3PJjd2882deaS6jTx3Pl6ToV1tEo0j23qu?=
 =?us-ascii?Q?4K2fH+xnRohWp/OGmwj3QGc8F/7PFyOLamZOuYRWuWiIkulZ10dfiJgntAdZ?=
 =?us-ascii?Q?ChnWRM6QvV983t5p0+tH87A1vsGrumk1+uWqtRHF+F3u4E8calDEDIPKSOjz?=
 =?us-ascii?Q?72bZnFqokqgvgghgoSxXdkTO0ipTCEAGldxDsLUH0wesK2YLMHhAi3oZ12+i?=
 =?us-ascii?Q?036v22RlPh+XxzzDEso5JZLDxzxIPWApu1WDQmyW6HzIuUOWCazf2FiPZ0No?=
 =?us-ascii?Q?1Xu6NSWIqcAitcOK+XDz2lU7bhSn65KUMNbkXay6eZOvnI3kNCHyB6rqX6x1?=
 =?us-ascii?Q?QPa7RNgEQ2Z5VstN8PkBXq4AXAEFeiq1t8/A7biQ/LxZF1+9cJqcr0seoe32?=
 =?us-ascii?Q?Dod5AWmZcNxnd8HkTzvIZzXZ3H+WKnBrueX9U8R6WhKNOwbjuHlNQeXs0EBq?=
 =?us-ascii?Q?n5pQ7tuOJwBkULwQBciWuQB/y9rMYFmfvpay0u5mhuE/xJtvRTKYTJyxoneE?=
 =?us-ascii?Q?AAieFsxsVJecl7VzMOS45twNh2g75DfOPRwAse9BBNy9N0g2LBfKwt8Uxs94?=
 =?us-ascii?Q?KiqMJ6lD6Ei1DWpUjhcoo+eHlB1z2RHPEEmAleJUf9b/AODeJEPTT+972yHG?=
 =?us-ascii?Q?4uuogt51t1IH9SFTPTy6ndSt0CCl7/NQOMWrhRgIMjHUJDKXbV4hYqPm3CX1?=
 =?us-ascii?Q?p7gBPWJmtDMC2zkWNBK9n39zDQ+m5nsAWIx8YCsBoZmfXxnDEIx0oTt+i9gu?=
 =?us-ascii?Q?SnDkAlI1Na46/TrHYOajB6nauyhYbzCtDzvvBeD6ht2cGJTAYqYhv3VwQEi/?=
 =?us-ascii?Q?XxIbi6aj0bugmn7BfXDdGP6tYxTAO7Veph8r4wQUpEdhIwSvUC7DlIE1Zyws?=
 =?us-ascii?Q?O3oBuaf/XTPpRfjV183UFczPKhF6/AxJdBb6AQj/w93TE33AJ+Zl6sVSQESj?=
 =?us-ascii?Q?1gNCxAnsQSq6atjEfF5yRKuL9xbHYA8LNvhLn9ZEZX/xmpb43h9PGUsnXB9e?=
 =?us-ascii?Q?8lmtYqzu3MiY2Rp6PZgrvemTsTIACK68Pc26sRDhgJHsoH3l7LS0H0Ttj1Cr?=
 =?us-ascii?Q?WMfr625QXwwPPqrTjxDoKc1OwFsqTb+SPfnQK0MD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12308534-15f7-4d9d-de33-08db4c73ad58
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 07:46:31.5899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lA67w1zHp1Bpxl4Aii2AH9rMsFe2nd2/3jNAyvPHo3zWjH4WVgujO4u4/q5oc4nTO1uk7FcvKVKRQrObbZO0qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7191
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
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
> Subject: [PATCH v4 05/10] migration: drop colo_incoming_thread from
> MigrationIncomingState
>=20
> have_colo_incoming_thread variable is unused. colo_incoming_thread can
> be local.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  migration/migration.c | 7 ++++---
>  migration/migration.h | 2 --
>  2 files changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/migration/migration.c b/migration/migration.c index
> 0c14837cd3..d4fa1a853c 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -535,6 +535,8 @@ process_incoming_migration_co(void *opaque)
>=20
>      /* we get COLO info, and know if we are in COLO mode */
>      if (!ret && migration_incoming_colo_enabled()) {
> +        QemuThread colo_incoming_thread;
> +
>          /* Make sure all file formats throw away their mutable metadata =
*/
>          bdrv_activate_all(&local_err);
>          if (local_err) {
> @@ -542,14 +544,13 @@ process_incoming_migration_co(void *opaque)
>              goto fail;
>          }
>=20
> -        qemu_thread_create(&mis->colo_incoming_thread, "COLO incoming",
> +        qemu_thread_create(&colo_incoming_thread, "COLO incoming",
>               colo_process_incoming_thread, mis, QEMU_THREAD_JOINABLE);
> -        mis->have_colo_incoming_thread =3D true;
>          qemu_coroutine_yield();
>=20
>          qemu_mutex_unlock_iothread();
>          /* Wait checkpoint incoming thread exit before free resource */
> -        qemu_thread_join(&mis->colo_incoming_thread);
> +        qemu_thread_join(&colo_incoming_thread);
>          qemu_mutex_lock_iothread();
>          /* We hold the global iothread lock, so it is safe here */
>          colo_release_ram_cache();
> diff --git a/migration/migration.h b/migration/migration.h index
> 3a918514e7..7721c7658b 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -162,8 +162,6 @@ struct MigrationIncomingState {
>=20
>      int state;
>=20
> -    bool have_colo_incoming_thread;
> -    QemuThread colo_incoming_thread;
>      /* The coroutine we should enter (back) after failover */
>      Coroutine *migration_incoming_co;
>      QemuSemaphore colo_incoming_sem;
> --
> 2.34.1


