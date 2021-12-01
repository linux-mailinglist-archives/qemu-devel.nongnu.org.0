Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76998464830
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 08:27:00 +0100 (CET)
Received: from localhost ([::1]:36312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msK15-00047t-2J
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 02:26:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1msJxW-0002uK-2a
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 02:23:18 -0500
Received: from mga04.intel.com ([192.55.52.120]:51256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1msJxR-0001ZD-JO
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 02:23:17 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="235131192"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="235131192"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:23:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="560221790"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 30 Nov 2021 23:23:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 30 Nov 2021 23:23:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 30 Nov 2021 23:23:02 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 30 Nov 2021 23:23:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ou/G629K8D/pzjyETl6b92ODF3Lf0m79Z20yddrY2pNJtZKZAzCIkUPvrr2FYt2O4tWyX45Z4Ib+SuLKNOq+0xYSovIHb6ZFGFKYk8GJkKtdpVtmX+m255iIos2T0kubFzH7+RMMDJE0gkI7zYdQVrqmoXkn8ZvWOyiSnrhMWAt+x5lOk+8o1Q5HsqoJdORJeFaS5e7VoPWYXL65eRP63ncjXvx6PLyOa7q1VpBfx3FJMkLPyaKPiVRFlQYE/+B/LtaX+6hyV3sg/x36AZXFcKQWil7sbdNqK8deytLeSQW2Wh5sl4gm44xp4UN3AniIhe+BTZmq/nv6Qvz+5mmHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7YlTox5AdaOVx8TL9wABnWY3CjZEzk9zl3F4CjdZ+c=;
 b=FFwmf131ICf6PL84jaVaTr5k7N/h2S7HWcQYNNbZjkDNSTwA5SnOZbFkRmBj17ArIwXRz74zaKqxO+FRgpOMdEq+W3n410yAEf6c70SHmVKiABwmR6Ps8tZJczdt68ATPUtoBKBDfXPw4sNPs3TliFlzynLd/v+yhRrjWVPXpKOje39cd64UwSB1l0ZHNNVjWNslfasBol08VoSwQRTXfC4GB/RS61TDkAfyw/WRNwH3+jFW8I1lKQt+572g8KWLTYry5Yiceu9G8Jq2a6Y3LHB2EDUtIySu2JvioE1/eJ1pirHTERUeBf48GblJf3etT+Cq0IRm7hh8F0IqPpkoNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7YlTox5AdaOVx8TL9wABnWY3CjZEzk9zl3F4CjdZ+c=;
 b=G609NU26jy7CA5bF3xUFQCXbUUTy0HxyOcv8G0IbPb+CMDYGqsuC2aNCamMv33cFacOHM7/nAtCRzZwexj6oKjdZYkWMcagQ5ULgLmlxyLDt/DJS11o28ORQysilO/+5prozClO2MAcqswMSlQff+TXr1FhkRkBQMK3I8i+FXG0=
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB5675.namprd11.prod.outlook.com (2603:10b6:510:d4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 1 Dec
 2021 07:22:59 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::68d8:8332:4e66:914c]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::68d8:8332:4e66:914c%8]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 07:22:59 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Ani Sinha <ani@anisinha.ca>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>
Subject: RE: [PATCH] docs: fix section numbering in pcie.txt
Thread-Topic: [PATCH] docs: fix section numbering in pcie.txt
Thread-Index: AQHX5n72fOV9aIa1+0Gpao/keXB6L6wdNyMA
Date: Wed, 1 Dec 2021 07:22:59 +0000
Message-ID: <PH0PR11MB56588B7A28ED377902BB87B7C3689@PH0PR11MB5658.namprd11.prod.outlook.com>
References: <20211201064307.107293-1-ani@anisinha.ca>
In-Reply-To: <20211201064307.107293-1-ani@anisinha.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79942b70-38fb-497f-5f7b-08d9b49b673b
x-ms-traffictypediagnostic: PH0PR11MB5675:
x-microsoft-antispam-prvs: <PH0PR11MB56751A545E7C1E19BD948F25C3689@PH0PR11MB5675.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v3FNsiIRMngqntKeOysGWaYUFirOUZ0/ZYtBfFOU9MD2A/QczQLLpqyYjHVACi/BqNYPFCZmpWJt+3cDihcqV1rbuYJvAeJkehttjLvIy8v5Un1ePIE9aiGov9uDXKqEpc0ayqmFmKgLhF5Kk6EsHsCh7ssFh/dexpVNNR6JiwIonjWjKROGfZ/XX6l1kezL2qatAx2trDFFq8O109gde1ug6FE2XuqfPmXauJ3Nj9PAOTGWZRYjnLDG0oF5AWZrygWNdVp+VSk38Ruw5bodbQhtzbymU4frE2nj9+Tzgkj0xx4JEkwmNzxJmMUFLhiXM9VXTmJB4sqUC/pzD6yMXPtXwL6Op5kYZe2lCSvELiZZ77u8YeOcfA0u/oqB374gD0YoCaqMe20u/KDouHNq99wU7L/mBsOgQo/jUwTI47g4RcFJhIfvxy5frSuGvko6tX7kNiFg6j8hM+2WMPKCvSgbC/pIkFWG9NRARAR11qtD53hpf14WkWSvVWIJEGZ4gU2x0rbasR/wB6MzZq3knC4Y8XVkQmml0wuWAheD0rCVA8i11RuBm5g+adSskQQjD+u5NUP2tK6XQCh/VFGtMO5zeeh2sJNw1JQ4QxH7L9lfrVyayfMVFb+ojfemMNUg7KKznMWHnzmyCj4UE0grPA6Y/80bqN2JzkkTHP7Nq10eimsN5X3MCY7XXeLcKKIppeU0lOw1IBXjcQzlL3cZow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66476007)(2906002)(66556008)(83380400001)(26005)(66946007)(9686003)(64756008)(66446008)(8676002)(5660300002)(186003)(86362001)(76116006)(71200400001)(38070700005)(82960400001)(6506007)(508600001)(38100700002)(52536014)(55016003)(316002)(110136005)(122000001)(33656002)(7696005)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1+pRuv5Nf+b9y4hy/iP8Xc7xMKU8YW9NQI9igmmfqF2+pXCnxUhE5rd+PpO4?=
 =?us-ascii?Q?J/X/7SPmTaJHwPhncnylNUl4Epr+dzC8TzSnwb/eX0zbE1mstTnE2ibOgiLL?=
 =?us-ascii?Q?C4aHBcHS3854eijPL+wv4kNn5VttbYnwlMocwVklRyk650k9S7UzXGT5ikSD?=
 =?us-ascii?Q?hDuA4oMGWij/H+d5saZe5dsyYRYUaqhKi0GCAqx4u86Hd03VD1Fqd7PEUjVJ?=
 =?us-ascii?Q?kuHOeKo/SATk9rE3XcjKwjJFqqUyWIMa5koURx2s+b9DbjmEp2Y9XyrRUcmo?=
 =?us-ascii?Q?rHZaZZHAVSnpnyfVuFjGSbh4zLJfyPzJGew59rwbNFaB2IkpdaDfrsZtC9s+?=
 =?us-ascii?Q?PUsqra+c+3AHabftv6ZGJHcaBI3frFma41CZJfCE3ezlIJrSQoWgl9hXx8tl?=
 =?us-ascii?Q?t6/dLWPx3r6i+PA2HP+GAeKv+4bu28jsyoNTdFwaDUP8rnvd/3rH1zZQbpG2?=
 =?us-ascii?Q?w+xyz14CI/5XVlMRovlnkDo7r1L78QLPWL3lsZTMNm5yXK3Dy7Lou8UxXSyO?=
 =?us-ascii?Q?3qIa/hkRG7+4Rg4g4TcguQCacTjN1dEpIkTkvJgiGJ1LKU8nm5GzQfn0rkhc?=
 =?us-ascii?Q?b+VeLtRKof6Bf8H+zh4oMtWJSzJQaBvvn0FW6lUKIkNTRQyu6iPcSIzmwyar?=
 =?us-ascii?Q?mGwCAL2RiPNci5JaPlaVXwNXXDChAWVTX7yV/pBdw8krs188yX9qusel57it?=
 =?us-ascii?Q?/p/kjZUn7TslspFF2foVtLKOi7VoMb7e8SeZAAC6wLdg5FuiJY4Fe2njc8nb?=
 =?us-ascii?Q?m5M1TEu75a28pRUIlXHAtXp6hY9B7eX3d+HXWkmECEnS4q57aPBKrdUZ6pTZ?=
 =?us-ascii?Q?HdKuyZ8QFTGyuintvGcaHj6E64SaEBDMb/8LHJXerLR8/B9X5O4gSxI3Ouh1?=
 =?us-ascii?Q?5XtUR7yPn5R3rkSudPPjzDYSbj9+08b9uADISz6eHqBDqScq3RP+SkTRfp0E?=
 =?us-ascii?Q?m8h08dv4oRC7BJI3N+RQPpOCnqkSRfQ1x+3dj3XSQE0qaPkFfjIGw4wZRm/r?=
 =?us-ascii?Q?I2wTl4Er2rRKKIMkfmHWIdumK+9KizHe1C2lpFyHLN0KV2tYBXt662wDA0cA?=
 =?us-ascii?Q?i/ml9nTGe36CkVVrcC0W7u7KjoR2rO6HxhPkDHgX9eR5+wXWXzUzawAlRGHj?=
 =?us-ascii?Q?TPCbLTkSWW8s6agJjLnvn7/6f1F6MCy4a0mH2CUympqvu8Xpm6t3PPRy/JSt?=
 =?us-ascii?Q?FaUaKUIeT22JHg2iMdZcX5XbpA5c37LnlJMEDM5AV7jmw466HRGa6TsK4zcO?=
 =?us-ascii?Q?hJ2NWcbhc+GH3WaFb6RNG7GUSiSs4f9isvhwcCwTvTnSLN5TK2MdB2D7DjGf?=
 =?us-ascii?Q?ypvmfZfm143UOVTiioxcefGerx1v4gW+fQ3ZiEnAck4KyxIWmioIHV3xfeKi?=
 =?us-ascii?Q?+V39/f3KodotjmLPzAeVYN4U8YrjQl/oMj6IYlFtVK/YNc3GazNHvYEoioC+?=
 =?us-ascii?Q?31moP1U8Z7Up4ZSAUQpTJMfWLrBgQu0O5zNpSkTuVRICj2hPKiiZFpG7eGmy?=
 =?us-ascii?Q?bR/64s4E4t2Se7hJHarPzjt729YcBjVaYiEfOTV5MY/htnhW5ggmRr2qTrt1?=
 =?us-ascii?Q?BDt0k+GprOnohYXQEBnNwjd2fhINCZNpEeSDcwkGcdELunkrG+9DP6cp3BYx?=
 =?us-ascii?Q?dtE8GBuWC7rZxWAs5qWJv0E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79942b70-38fb-497f-5f7b-08d9b49b673b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2021 07:22:59.3614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WBZfMFEqfnhcJyVAS+Opgay4jBHaaqxFj5uk7+areIbh0+ndA2FhpHi5bYt3ciZuVRisihF5aRCMfagGMs1Mng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5675
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=yi.l.liu@intel.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Qemu-devel <qemu-devel-bounces+yi.l.liu=3Dintel.com@nongnu.org>
> On Behalf Of Ani Sinha
> Sent: Wednesday, December 1, 2021 2:43 PM
>=20
> There is no 5.2 section. Section 5.3 should really be 5.2. Fix it.

Reviewed-by: Liu Yi L <yi.l.liu@intel.com>

BTW. Is a fix tag needed?

Regards,
Yi Liu

> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  docs/pcie.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/docs/pcie.txt b/docs/pcie.txt
> index 89e3502075..90310b0c5e 100644
> --- a/docs/pcie.txt
> +++ b/docs/pcie.txt
> @@ -262,7 +262,7 @@ PCI Express Root Ports (and PCI Express Downstream
> Ports).
>          Port, which may come handy for hot-plugging another device.
>=20
>=20
> -5.3 Hot-plug example:
> +5.2 Hot-plug example:
>  Using HMP: (add -monitor stdio to QEMU command line)
>    device_add <dev>,id=3D<id>,bus=3D<PCI Express Root Port Id/PCI Express
> Downstream Port Id/PCI-PCI Bridge Id/>
>=20
> --
> 2.25.1
>=20


