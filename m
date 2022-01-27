Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2628549D7D4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 03:06:34 +0100 (CET)
Received: from localhost ([::1]:33390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCuBF-0008M1-7z
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 21:06:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nCu82-0006GH-So
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 21:03:17 -0500
Received: from mga03.intel.com ([134.134.136.65]:5305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nCu80-0003RW-V9
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 21:03:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643248993; x=1674784993;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s/MrbjhQjSt6W7mO9QS1xDZMUiDGJ7iFyjq6PmEHhKU=;
 b=TqHB592oN0aVe10NqMQLbAOTO6uk0o7tTIXIO2oQlqfTuq/OC3U5xUsy
 ZpwVFlaoM4e9X5MDz+YmPwj5Gm64pfw444XCpQFnxDKBmcX6WKbLGXb03
 LXVuVA8zH8csCKDrBqkhlS12g3xoCdYf2IDUzP0XhR72cp/6USFEp/DJQ
 lXjtUKVZAIJYAND5LZMqUi9x386lLo0zX3srQseC9BCcM5TEqh6fXON6T
 aHdtXbdohIrR8fGW01Lqx+uK+CSyH+4rXQoKDxaRVlOJ/5NEKqZisUxbL
 /+VjrEImghELtgIv4k4st3AAEiR09Ol+4pu4c4P7h3S6AXJWv4MniOMoo g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="246664711"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="246664711"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 18:03:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="625053404"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jan 2022 18:03:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 26 Jan 2022 18:03:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 26 Jan 2022 18:03:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 26 Jan 2022 18:03:09 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 26 Jan 2022 18:03:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cA+J0Ze0yhSsRQHRz7FaVbvqsaiV80xZg209DZWG4jT89lyq22kQpz4W3QRsww2aqJkVpIv3XjjlyRMxlAz6GSsYQBZADi1E8mCe/VuF6rRSoqtLROfF4ncmK3hLy1su4rZNwcse01aaLr6HOk00z8DYm1vyxh6QvUpqpArGm+uBr4rDvzUeU2h4A9seGzahhus15QejhZIyl3C13XOiFgY8nXt6WufYbZBq5PS8qp2/+NauFYo5tDQbbYRy/I3BxDsceLwo92bMzTpE3L+OG0dU29K/V8gN8fVR5SWtOXl+A2/4JwFzOD3beRnxIOOKWDtMb8G2kq1O0wey/gX4Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/MrbjhQjSt6W7mO9QS1xDZMUiDGJ7iFyjq6PmEHhKU=;
 b=gqM27+DX5by4T+KKS6Sm8yMDKFJwf8A2tgcTvrg1MC1NN9ETus9vJZDeEGca+GTReA88ayOMDSprsJSVOBpf3UTveqIq3obZof/Zy6r1Da+iM3PFT8mNwUTqbpYuTdxS/Lu/d9MVMz0eW4faIOpruzvgGjkcamrq5MUitx8+CPFe22+HzC+ojAjcv4u3Cuj6H/NnZFaFLWHm9fetyPJ8BfqJUzuMFAuuru4wQVbO3BoZxX9H0jfrhV7gFlhMAp7Wv4fH6zr3Vt7ahNIJq8seGNIEH70Aapjr80JcHH/acfHyl7B0SasJoU7TnXUmCDaoRJ790H/up7Jr6hYsBdgL7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DM6PR11MB4315.namprd11.prod.outlook.com (2603:10b6:5:201::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 27 Jan
 2022 02:03:07 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::b5fb:a48b:9a19:5f4b]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::b5fb:a48b:9a19:5f4b%6]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 02:03:07 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "quintela@redhat.com" <quintela@redhat.com>
Subject: RE: [PATCH 2/3] migration/migration.c: Avoid COLO boot in postcopy
 migration
Thread-Topic: [PATCH 2/3] migration/migration.c: Avoid COLO boot in postcopy
 migration
Thread-Index: AQHX/g0hm2d0nN4+Mk6HH/FoS6mtm6x12lu7gABtKVA=
Date: Thu, 27 Jan 2022 02:03:07 +0000
Message-ID: <MWHPR11MB0031CF9BE5877DACDCC658B39B219@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211231055935.1878503-1-chen.zhang@intel.com>
 <20211231055935.1878503-3-chen.zhang@intel.com>
 <875yq6pa5o.fsf@secure.mitica>
In-Reply-To: <875yq6pa5o.fsf@secure.mitica>
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
x-ms-office365-filtering-correlation-id: 4606647e-0e58-46c6-72ed-08d9e139296c
x-ms-traffictypediagnostic: DM6PR11MB4315:EE_
x-microsoft-antispam-prvs: <DM6PR11MB4315D7E33FF64D88C0D7E3E39B219@DM6PR11MB4315.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dU7N6CvxQiTxRzjfUlA2MhSpZjxqH6jaVjHvtXZAbK4ygqJpzWrEctVDebBdhr82vhPFIeSeTdIWUM5JeiR5Fzd4eKiDs77EqPvuipmy0YYczzyWFdtfDX/2B9yuqABflX8icIOU2EHDoFusksqDw7ayCHktcE5UixI5VNiOT9cZ1vi/0a7rPPWLt76E5jeIxbkXYr4bdeCMXkb9EJHxUBgc3HbcRFnsKCYC95/NqJXuxllx8QE1ufho5XGpbH8r1G/V31DUGLLJ1kTW2dSGTDpf+461JyXuwXbJlC5sM2RIPr+WZPqfHZ6XB0cqV5AU13dz6/EWTnJ80ovU89z/7qMMRKxjx2TwKq7Yil28LEDorQPjVkzkfYbwdZUfcu5GCZapIDK8VmfNnuwWKVIzjQfOwryl9mKBebOrSm4vVDXenLauZPdoM9Fgctugma6+DiaWD2uM0eFP9iI60XQae1Kj6JYJ2XiZL1opMFcDEk7ZlX/VptwPu3ZUJHTg5Gz9YB0REx8q185+R2IOpzGhjnB2NmHTfEb/e80G+wyCviFhtiszKzNLH5sQ9WkrsjTOKL4MmT5igzwSJBNSBjBMq1SlBImFcgs37t7Z7H8NKZ/sGRjzsVOZ9NK62+BtW97AXUiggJOnqp9OaDIUYTx1uUXJbegti4lkrdRj8gGEF311diVjelEKiZpsbedAciI4W1OvoyC+U9fW6MYP0G+oRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(64756008)(186003)(508600001)(5660300002)(66446008)(55016003)(53546011)(6506007)(66476007)(38070700005)(9686003)(86362001)(66946007)(83380400001)(38100700002)(6916009)(122000001)(4744005)(52536014)(82960400001)(71200400001)(33656002)(54906003)(7696005)(2906002)(8936002)(76116006)(8676002)(4326008)(26005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Vg9eHEtaGxFyaWORoP+gBHaOq3MCZBLXBs78qGbJ2Xwjcg5QRXpU4zZxVdOW?=
 =?us-ascii?Q?BqcsfGm3pbHzwQn3tPFY+8KV5l7Hu9JaHcEgomKa1+Rz1Sj2eC6GCb26IrgW?=
 =?us-ascii?Q?MirDQyOT16p9r8BCxJxlPCqXmGYt9ubkQVWrlLa7GHFcA+5DgOnoVLLysOKH?=
 =?us-ascii?Q?lviaeeROxIU5MvqKW8qiuVahuk7cGeujZZ3Av3Se8JvOUwUBIj1jqqlK0lkp?=
 =?us-ascii?Q?0G1nfgfcLLOwQutq4xvVcIiJnOnOZeY+DkPnJ09mhyAWj2MGssZ66Kb3ZdbX?=
 =?us-ascii?Q?SZzBNyYaxG6UD4uv2VFuWpXewM8lQ6+jUf5RJmyry0HwgDd5x6zdB6envOkQ?=
 =?us-ascii?Q?Q96tr6Tk4/jpuTwG4pOVkjLvBJEr9imixDjnZc7cTQrM9PHSuIKdVbtXFzgK?=
 =?us-ascii?Q?PZEyTph0x+S1SPMlpVSCucD69LG06C/ts1kqBCr3cFizygWePztd/qyoYsc6?=
 =?us-ascii?Q?Yrau4uu0yySRry5QPKt5zX2Q5UfYM0e3x/l/AjjJzcGIbn3zqmkE0PK8uQHY?=
 =?us-ascii?Q?5OreOqkkfVJS+kD8Alb1969TvQ3FeJ52a+C2xHKR3cNQnjxyuHCsjRtbNWWi?=
 =?us-ascii?Q?D1w/ddX8FSyJXPK9qhen9JImrEbrv66kxHlB5HY6sdqD/WcLTeg5G/ITxYpE?=
 =?us-ascii?Q?HLisfgstNivlm8uf0PdrucnojftMttk+v4NFRsXEaWY/7m+ZkZKj5diHai0f?=
 =?us-ascii?Q?UxiS8fB/TNAbUI+Sef8DTFdfCOnKDWpADj1nsqfFEZXy817zCpah0AgkFYlX?=
 =?us-ascii?Q?aUzG2890kMs4+ApA5vatCWOB2UIg/B6Kx2Kv1TM7Qzk+bM55uHnXIis3oM4J?=
 =?us-ascii?Q?QZ6T8//TWT4PDvAfPw2jNCA+YVgfwcIP+XeU/FO6J8EzHWwiiGCMUubfMbyH?=
 =?us-ascii?Q?15sjH7HX69dqsZMpM7UBm8Bz028DBxEq5+WKybLPTlfuk5FvnjAfmff6zBiB?=
 =?us-ascii?Q?Q0G1iFLqu+iJaYDw6ExwMt1iM+ACfGGPqE7zBpiMDOs1MsuktpOoc6ieay54?=
 =?us-ascii?Q?E+JVW48g+zeKzLQSqP5KuN9zNb1Zmv2Z3DmJcjIukJuvkgRCeE2rXiqY55Xc?=
 =?us-ascii?Q?5gWZNpGZVwkoTNhL0sXX/aQe0jXJXL2fpzFgbQ+9c1OQ6ka4CW903vJFmXzT?=
 =?us-ascii?Q?AfNOktcWH+5Y8AXqCsUC93B25FKYu0C4NmkEtDRiiG347OeI42Iqo6ydEicz?=
 =?us-ascii?Q?B/5QRZ/G/sUWVP2+ohPQh23mhZc6RHPdthUPeP17PYcp2gSn+rLPFguYadMD?=
 =?us-ascii?Q?HoRiTj6FrtwaXkluEnqp+k14IdG3i5wkQe5aD+AQ0jKtae41vRQLsS5zZ57i?=
 =?us-ascii?Q?tuypTDDcqH0eb61sMYsyHSZRhCdPjbjoOs66LLV5DS+O3D1z/vjdEmdlPnyB?=
 =?us-ascii?Q?uu6DYQ5Zt40lldliJYhd7uh88GuQURVT8/PqLosx1Gf/rXEaCWykNr1GMPpQ?=
 =?us-ascii?Q?fL0pxn3roTpwvTOlM1qfMXoaRyST+C537AVNqddylum6ay7aiLQY7usb8AxL?=
 =?us-ascii?Q?MootM95OY4OwPCxa14/BBYnlsYgR6mcNkqiUJOHjnCGQdtZc4vG5PbUE1rkd?=
 =?us-ascii?Q?Nf1/SuSz/ExovyZjBz6Kh4r997ygetOayVXRmzNJU9ORh21oxKZbMW6om10j?=
 =?us-ascii?Q?rxSag9JFUgatoUdw7FmSdOw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4606647e-0e58-46c6-72ed-08d9e139296c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 02:03:07.3369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ymDITzvf9eRW5jYD9NL++ZHP22pLPLyhZytfkc5TUjC+hfsEWYKYKtO0l03KbJR1ujA9Lk9WCmpwIOv+upoGnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4315
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Juan Quintela <quintela@redhat.com>
> Sent: Thursday, January 27, 2022 3:30 AM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>
> Subject: Re: [PATCH 2/3] migration/migration.c: Avoid COLO boot in postco=
py
> migration
>=20
> Zhang Chen <chen.zhang@intel.com> wrote:
> > COLO dose not support postcopy migration and remove the Fixme.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>=20
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>=20
> fixed the typo.

OK, already updated V2 for this series.

Thanks
Chen

