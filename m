Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F366F65E7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:37:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puTWU-00042Y-LY; Thu, 04 May 2023 03:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puTWQ-000419-7h
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:37:02 -0400
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puTWN-0004ON-H7
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683185819; x=1714721819;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LWe/4jm/+1AHdde9mnxabGNIE5tAjHT9Ucfgcn2QduA=;
 b=dVB1sLr6t6wDbbmtQn2bpcReHA1rEh1ZCQtZrqd5l3iV3PEh0fid46Ms
 9vtsdNU4uximJN4V9mDLoZ0xGbwcLz9timxZOKyyLZten8YSI1Ts7DPOy
 i+6m59WfU0ttTnLz9XupRR2Z9BjH2aA1cmpKxaWVw8E5hJ6nNY3x1Cgi0
 DqCpEP3yC3wHRexZXHbMzeBarsdtu0TpIyXI68Bl05hCEUCEJYYhs1XJS
 OSSmF39xb/gTTrXChtGHvoUDe7ij1allynx37lfvDdUu8N8jUnHt0sOZL
 JaWgfhONeZhiLb6qaLQxE2OOnHAN9+ekAcY+5Xx/4oEWOEfyaECPW2u/X A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="338000448"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="338000448"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:36:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="699734812"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="699734812"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 04 May 2023 00:36:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 00:36:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 00:36:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 00:36:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWjVnfe2w0Krz0vwbsJykTa9j8NNILVn9mqGJCdsRzY7hk0reEhFPrRBvWD0Q+TsBT2H1dWk9O0bXoxFuI7y1XuV4IKmR6liZ7Mch68A8pKFcl8BvusmbiSCgbwyKQFD8NgFFzi7aSwUsbJ55DSJo+L09otrnreq1V1/JavYtEKRSlpHtFo8dCU0A0wDGpIoa7fXAhtVb5Zo6508JYOxSxXzsRQLg8lHLo8tdC64GvanvFSAVCDHnznilI/yZhmrbj0NPzxalaM0S7JDbDqD8dC8dKKecaq74wGjo9OwWk4Hc1mA8YSMqzJnbYNea5DuX1o8rRRBsv8fLr+NAED8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHooh7AIgnQtTMEk9MamJd7Fr2iJS5U4yXGyAwuU7/Q=;
 b=H+yDqtHWVjGLIApW+oeJKgzltL+yH25jy0MfWgY14NNqdiBUi7Z6l7cUFkTpOeGm0jugzuNOfw0T4gH61BGRp9LBx3Df0+OWHBa6h6baTUSEJnUjvMdA6aIOc6L+Jfd0nMgBWcrXFwxKQB3zkeb+9zvBZltqfuCWJsOrMYHn9uCL9GBsVpR77ajgOcscyeZDdh1oZMu3CaAAtEzhNDtcRAHPUkvp7oEzX30euhBYPQNht3htMR6T/c9KBzTd0hhGeI9IfxaGIc1hupBpTJgbfhaihZxYzVXwX+JULMsp8qGaPplFMohCDfxIU+TVKAJv+zDElb4KWO3hMYpQhPwlkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 07:36:00 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 07:36:00 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "lukasstraub2@web.de" <lukasstraub2@web.de>, "quintela@redhat.com"
 <quintela@redhat.com>, "Zhang, Hailiang" <zhanghailiang@xfusion.com>, "Peter
 Xu" <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>
Subject: RE: [PATCH v4 02/10] colo: make colo_checkpoint_notify static and
 provide simpler API
Thread-Topic: [PATCH v4 02/10] colo: make colo_checkpoint_notify static and
 provide simpler API
Thread-Index: AQHZegs+8GA+ulYJFUiP1pOpOhmTua9JwfgA
Date: Thu, 4 May 2023 07:35:59 +0000
Message-ID: <MWHPR11MB00315D97180D5579814219269B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-3-vsementsov@yandex-team.ru>
In-Reply-To: <20230428194928.1426370-3-vsementsov@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|CO1PR11MB4820:EE_
x-ms-office365-filtering-correlation-id: 92f79754-61c8-44a7-be7e-08db4c7234db
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qJAyzkMIv97qhrqa6cREzWsdj3HrqoXZZ3XM4I0uTB7Fx2/HwYluE4is0JpJ994aG0j3v7VHNeJ+oQDPywdf0flYBT8cgcbRmB8Bu4IKEB/yh8cT9YPT7SLCyHPwiU3MLwy35yQIE81S3tdZvjXKDOc40/y18AVaiX2iUwJBsIY+5RSkttQwIv9fUo9zBUVyKLqw4s0QK9X+4CFBMDTCqPycOexNb+3rqwyeYAfIN+BdqFMAV7TZqAq+yr3eBwxsWMlofi8qdJKx1LWYtseWLlWNBlZ8moKHEHvpl8alQSOcmAhcUVzvXm1+rdyEfe5tGzL+bvbQkJ43kv/QfhFdZXL6/nhpQTuIItkmKdX4xc+R5yjLDeX6sjGzpwzYq0w0y1RcVR2QLA4IjuNAmi9/bIByXP5EAGci76VGF1WKlep05+OYyTnFcA6rU1fAN2jHV50IcqHW9+cph3AIn13FbECpvdWFneoYiHO5CTXhnUW6NNwcK05ub9YW0YpvJWoYJp4x/t4RGxoNUTsYcj9NmIPE+iZFqfI7ot878BL3tnG9wZ+v0+d9zKANbVHDi3DLSa6LlYhfMQhXkTBlgr628fGrnr025L9Z2bUd38JxUHv4ySYQGwoYoFrNt6gCkmTI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199021)(6506007)(26005)(53546011)(9686003)(186003)(110136005)(54906003)(83380400001)(71200400001)(7696005)(316002)(55016003)(5660300002)(82960400001)(478600001)(2906002)(33656002)(4326008)(38100700002)(86362001)(122000001)(41300700001)(8676002)(38070700005)(8936002)(66946007)(52536014)(66476007)(64756008)(66446008)(76116006)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b0EoDlplerd74+cpDyLFjFPRrBmzabSUONwmqmgeriTPgPezVfrWjxEOcYs0?=
 =?us-ascii?Q?YIMwLf+P8BV4cPZZF43vCCjU875TpjoE2QQMeHRfV81dHrKxJ4O8htPG3Mo6?=
 =?us-ascii?Q?9btQumLbARgVV95kzFqfU//D/t0UXiWmHIZ5MawIBVY2v6dGP3eH1T1lapqB?=
 =?us-ascii?Q?1EW3OAgxdbHdu5Iy/o8csHQ88GUAMkSW77HRjoZhb7rtOkggbyBSNA9gFDzQ?=
 =?us-ascii?Q?O0wcSfBtsL3kApURW8v1NYFJ92rtiPBHDcMau1smhpqvUnzRGkWvItrri4nJ?=
 =?us-ascii?Q?4bfH/YwCMQBLFq6Poc4f96q7Nsbsny90JIaM7sdOepj5Ta6ibbtCdZAhXQ0b?=
 =?us-ascii?Q?cxJYY1NkXJRQWfPk2ouVO/HO1V2FSS0B90mfRcWJhPVFnC4TeYYVYFYNRKSI?=
 =?us-ascii?Q?Iw5FZmW8Mykxw79AMnAlb8pjkUc8cb90krbh9q7Q6bWksSJnKW90rdW62rUo?=
 =?us-ascii?Q?xoQ1JT3AKK8bG1n3tr2mhNk1nchhE+2rAifylsjCc/0xGYqBonY8yvZL/QQm?=
 =?us-ascii?Q?4/DSwEfoWTPweRGA0MZvXEsGOZibGnQdEN5vZ97zrtKalN4luUw+WBiEWhcw?=
 =?us-ascii?Q?kKV7pb+uLSqvqVJcQMwgO4VLxCjfIIH/7yxBkVvAwH0wzX0IxDEHWUR7mIHw?=
 =?us-ascii?Q?A4eTunQy4r18MalDwBps5Y1cI3IYgkZHileQlUhdqHdNIGSTSlSDh2gD3pjX?=
 =?us-ascii?Q?fjhqLjMicQ4FxUEIEUnB0PQq7RG881yCZLQja7JH+V/M8vRBqDkM33vxIvAv?=
 =?us-ascii?Q?EetjdlHM7Zb6N3QKIgSeBjs6WgxxOEi4MU3pXqhdoLmYRwHLpbt0VOjFaySZ?=
 =?us-ascii?Q?yGlkf8W2tyQPNB4dTIRaySNa0gXNEupd43zbf4455VEY+/clEWve/SSJx1MA?=
 =?us-ascii?Q?dXv6n2Z4P3LS0GyVT6k3s46Egw5tHQ10enrLYWIOGQKLvfkGM3W5GQJzINvB?=
 =?us-ascii?Q?H7/PQEmspNpDHtNQAJf8zlNZ7HUu+6nRAdC7AosNGo3Q4mATHloO34xN7mHn?=
 =?us-ascii?Q?sSf1+qoEBrZ2zRT7BfMuRlf4vRFBmpMzpARFrTHGt0xYDmk4A9Be5K7snqs0?=
 =?us-ascii?Q?ntyOyetEMDQmA9ABiATi/FkksL3zEt/ozOjT8szdQMTXwrnJPfEnOx3iuLkf?=
 =?us-ascii?Q?z8oy5fdCY5E3oz4EJVOqln+dLfDZo/XIlKie+msukUJaZBwkWU8Of++57MLk?=
 =?us-ascii?Q?pCBOYI9T9Nd1X5siMTIPlDFGxVRherA8dZDXfMgEbTLMjhBfaI4SKwH3tAxD?=
 =?us-ascii?Q?sIohPahjTlWgn8sb0yghTjTUQJOtoZ6VSp5pYd8PIzv21UrKHyV53SshM0Dm?=
 =?us-ascii?Q?RKOOI9N8CScredIWPQGfY5wCby0tzBoIIQHA28+d/tjFNkR68dX6ZdBjVUih?=
 =?us-ascii?Q?b4slvuIdJOzElo586qERT/YVKSC1wVacxM5H/17Zht1cR/ydy00COgmzcikF?=
 =?us-ascii?Q?AWJv9+imT8fz4K14Z3omXrYWmZe2ymcNRhd36CJpZL8YHFnr1KepmceR8Jbr?=
 =?us-ascii?Q?Z9eeSXE4MYd3t7VOOwXmfu+vdSkC6pjHUBZUfsyV8qEiu9zQj+QMGZTKu4fb?=
 =?us-ascii?Q?LAOGhYcJmAPR6Fgv7eMg+R7a1TRaNDE1F06GwwWO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f79754-61c8-44a7-be7e-08db4c7234db
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 07:35:59.9331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C0gvzQ/mBLGbXAQrjNSN+Iv+atndtltJl4ee+cLDwI12fSo1AbCw9bfqmJGuRRK/1TqSf9KbmmKoQ49SqniFzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4820
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
> <chen.zhang@intel.com>; vsementsov@yandex-team.ru; Zhang, Hailiang
> <zhanghailiang@xfusion.com>; Peter Xu <peterx@redhat.com>; Leonardo
> Bras <leobras@redhat.com>
> Subject: [PATCH v4 02/10] colo: make colo_checkpoint_notify static and
> provide simpler API
>=20
> colo_checkpoint_notify() is mostly used in colo.c. Outside we use it once
> when x-checkpoint-delay migration parameter is set. So, let's simplify th=
e
> external API to only that function - notify COLO that parameter was set. =
This
> make external API more robust and hides implementation details from
> external callers. Also this helps us to make COLO module optional in furt=
her
> patch (i.e. we are going to add possibility not build the COLO module).
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  include/migration/colo.h |  9 ++++++++-
>  migration/colo.c         | 29 ++++++++++++++++++-----------
>  migration/options.c      |  4 +---
>  3 files changed, 27 insertions(+), 15 deletions(-)
>=20
> diff --git a/include/migration/colo.h b/include/migration/colo.h index
> 5fbe1a6d5d..7ef315473e 100644
> --- a/include/migration/colo.h
> +++ b/include/migration/colo.h
> @@ -36,6 +36,13 @@ COLOMode get_colo_mode(void);
>  /* failover */
>  void colo_do_failover(void);
>=20
> -void colo_checkpoint_notify(void *opaque);
> +/*
> + * colo_checkpoint_delay_set
> + *
> + * Handles change of x-checkpoint-delay migration parameter, called
> +from
> + * migrate_params_apply() to notify COLO module about the change.
> + */
> +void colo_checkpoint_delay_set(void);
> +
>  void colo_shutdown(void);
>  #endif
> diff --git a/migration/colo.c b/migration/colo.c index
> 07bfa21fea..c9e0b909b9 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -65,6 +65,24 @@ static bool colo_runstate_is_stopped(void)
>      return runstate_check(RUN_STATE_COLO) || !runstate_is_running();  }
>=20
> +static void colo_checkpoint_notify(void *opaque) {
> +    MigrationState *s =3D opaque;
> +    int64_t next_notify_time;
> +
> +    qemu_event_set(&s->colo_checkpoint_event);
> +    s->colo_checkpoint_time =3D qemu_clock_get_ms(QEMU_CLOCK_HOST);
> +    next_notify_time =3D s->colo_checkpoint_time +
> migrate_checkpoint_delay();
> +    timer_mod(s->colo_delay_timer, next_notify_time); }
> +
> +void colo_checkpoint_delay_set(void)
> +{
> +    if (migration_in_colo_state()) {
> +        colo_checkpoint_notify(migrate_get_current());
> +    }
> +}
> +
>  static void secondary_vm_do_failover(void)  {
>  /* COLO needs enable block-replication */ @@ -644,17 +662,6 @@ out:
>      }
>  }
>=20
> -void colo_checkpoint_notify(void *opaque) -{
> -    MigrationState *s =3D opaque;
> -    int64_t next_notify_time;
> -
> -    qemu_event_set(&s->colo_checkpoint_event);
> -    s->colo_checkpoint_time =3D qemu_clock_get_ms(QEMU_CLOCK_HOST);
> -    next_notify_time =3D s->colo_checkpoint_time +
> migrate_checkpoint_delay();
> -    timer_mod(s->colo_delay_timer, next_notify_time);
> -}
> -
>  void migrate_start_colo_process(MigrationState *s)  {
>      qemu_mutex_unlock_iothread();
> diff --git a/migration/options.c b/migration/options.c index
> 53b7fc5d5d..865a0214d8 100644
> --- a/migration/options.c
> +++ b/migration/options.c
> @@ -1246,9 +1246,7 @@ static void
> migrate_params_apply(MigrateSetParameters *params, Error **errp)
>=20
>      if (params->has_x_checkpoint_delay) {
>          s->parameters.x_checkpoint_delay =3D params->x_checkpoint_delay;
> -        if (migration_in_colo_state()) {
> -            colo_checkpoint_notify(s);
> -        }
> +        colo_checkpoint_delay_set();
>      }
>=20
>      if (params->has_block_incremental) {
> --
> 2.34.1


