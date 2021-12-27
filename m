Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BA647F9BD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 03:17:02 +0100 (CET)
Received: from localhost ([::1]:47064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1fZM-0001Fc-RT
	for lists+qemu-devel@lfdr.de; Sun, 26 Dec 2021 21:17:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1n1fXP-0000QP-6e
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 21:14:59 -0500
Received: from mga04.intel.com ([192.55.52.120]:43300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1n1fXM-0006pJ-3o
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 21:14:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640571296; x=1672107296;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gMfSXbX66GCFT45E3ivCidFv1KQ9pm3rTeSjpnqq4Dw=;
 b=eTf2z23ak4543uwRcaLL5bSKpIl+47+V2PfwMZTv+d8KNEWBb443En1z
 dnk9ZS8vkSQB+2K8yenN7YY4042OoEpeV120ox7i/L7IAWkCt/tP57g6c
 O0a8XktIBtnH3syn79CyV8ErHbjeoA2vgV83+BoiZqB2Zx8OuESWLjNiU
 0r8DknEznr1gNDhyt93YL+w1Zx+dAZOEepV3EK+L+rWykhKc4IBJq9jgo
 aIrpsfe7RN3ZkV4Pw6kWL7NWMnuPGyq7WOpDlwKRUpujg1UwQ1ulMogDt
 w6cvGAA1wwNExNABeJA3tBOxJffPu/k1vPkNwCFr0Qe8VRB4WCLs6zeI3 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="239934553"
X-IronPort-AV: E=Sophos;i="5.88,238,1635231600"; d="scan'208";a="239934553"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2021 18:14:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,238,1635231600"; d="scan'208";a="485896316"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga002.jf.intel.com with ESMTP; 26 Dec 2021 18:14:43 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 26 Dec 2021 18:14:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sun, 26 Dec 2021 18:14:42 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sun, 26 Dec 2021 18:14:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHjpWsMMpnof7TaicMoGzOBTkSMm7N7RppobT6yIYUXEBGYsD9G69jVtM1JK7FFUhSinoIqc/QWVP9wR8ZcnRV76QlydvIeOYU5k6M/Kr9GJmSoAX1qoAz2WNjmHd3embbu09ngWGC1LBYfFuZV0Hnql1WOdAFC0OLBRlHN9QmNbSDfXVvHCxiWotT6+YtQrEeDNoyAG2rlufQMGhl6syuuxy5/4KpW8Jacme690YE/Uqw9ar8Imie29Szkvb3HX9Zn/tpqgDwxYys+YGE3fVDeWzLd8q75oQtVUm+aZmNBYHTcc8FGuiNOWE91veXEc1fdkH9rci0jvXDHH+VIxNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79S98l3V6nn+hufNNGYrvPy3iSiCw9FXrIfAZTxZJmk=;
 b=NsU0zOQZ0d7lqtD5s8PLJwKEMMJdxcAfpqdYU3VsVfL2mP6QzqsxX6pIAR8Pf/lB3wboFDHgg9GZAfcvgtVZehtDG04ndLFGCMK84AxLQIu6bx9FTC+yftJIQakgwn+Swpdl71aOxZxw7IwkkFFcuBT1Yb0dz5zFv7gQW7y2uy0pTIXZ0AFRO66XbDs6TBCjXu+wGaMY9nixI9tNnRtLbwJZxZYmmqCN5Q9YADvsWdAOTJ9/KWElVwhxwzb6nQiTfKnnLBhQffv0yndogGG5AaUXXFg/urKy8TuZmsK8Ky/9U4DSwk0/o1BoiNXqLOJ9wHjVOaa0MyLiuE0N3UjHwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CO1PR11MB4834.namprd11.prod.outlook.com (2603:10b6:303:90::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Mon, 27 Dec
 2021 02:14:41 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::f11a:c3c:6fab:a5c9]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::f11a:c3c:6fab:a5c9%4]) with mapi id 15.20.4823.022; Mon, 27 Dec 2021
 02:14:41 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Rao, Lei" <lei.rao@intel.com>, "lizhijian@cn.fujitsu.com"
 <lizhijian@cn.fujitsu.com>, "jasowang@redhat.com" <jasowang@redhat.com>
Subject: RE: [PATCH v2] net/filter: Optimize filter_send to coroutine
Thread-Topic: [PATCH v2] net/filter: Optimize filter_send to coroutine
Thread-Index: AQHX+r/+9kDDwJdc7U23dCbnDT2fCqxFmTWg
Date: Mon, 27 Dec 2021 02:14:41 +0000
Message-ID: <MWHPR11MB00316E1420745466BD09EB809B429@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211227012028.545526-1-lei.rao@intel.com>
In-Reply-To: <20211227012028.545526-1-lei.rao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7a179b6-fa9e-45e1-53ab-08d9c8dea499
x-ms-traffictypediagnostic: CO1PR11MB4834:EE_
x-microsoft-antispam-prvs: <CO1PR11MB483482C805D1FAC34465E2689B429@CO1PR11MB4834.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:308;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jcMhUb5EJftWEd67MOCho8H7ey0nWaVsP9ueazlxE2uLmP5654ec8splQt65rcHjQ0gz9lZbxe/0ZJJtbpoKu9GDO5Gspk2OaFcXQEmpqjI07HxcOXNC0n0mMLb3M6X7uQMe33MoKjtMzNclQOnzuVGa+sc2sTTv/ttz8TYHH0GbHUtDUCZFai/DsPi06wyNPjugiE3GhuDs+J6dq2XR884/cEa4gJfaFliAr5iKkzQJvchrTgChiKHbkt8LBhjAbJYc9QzrhoolXRzztj84KNsm1LNpYpfiX85h7q+7N2HL6pVUHPBA0kz/UL8sDp8CrhOpfXgS4rheD5TrA5LE0Pbu2v1u3XRPQ4vRjYJj9uTlWJugpq9EHYq2sX45i2nvDFrA3HEjGg2eoY9MLSl9rj5OJ3fJ7AnNvMT/Ym6xs3Qm/JkgBdp7nQJgbtdB5QhC9D1HoGdqEeVwjyvqxsbCBVFFdf/yagtS/enhJIES/72kk3AzdRMk14ShZuU0HHuo2uJUjVc9kTtmkNeVxowEbBJbdyAclDc8W8YZAGEIY5iPxhPoov42kfT8spLj40CXC6MvuJBzHw6qLhretX/HhBo65i5+tV3h4f1OsLMMVy7kBRlPsKImxeqLoustrfdo7dgq8BxhLItpfPdLEgYZ6+PhVQHwhVcawjC5AaoiY5VIIfiwT9xyTS0WFpIgH9wlby05CexbJjn220jY1PpRyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(110136005)(86362001)(82960400001)(38070700005)(66946007)(186003)(76116006)(66476007)(26005)(55016003)(316002)(6506007)(38100700002)(122000001)(54906003)(5660300002)(71200400001)(8676002)(9686003)(7696005)(52536014)(4326008)(66556008)(8936002)(508600001)(83380400001)(33656002)(2906002)(64756008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ce1yDmYz1WRK9Pfn5g8SzeELZWhYhLF8+LiQK0aEMgExGZZ+K8AhgDjsXY0L?=
 =?us-ascii?Q?fj0g70mlJkHLP+oLGs4wrYSOGaRUYxgTjkr/R7dxowe2K7qBiSoUuuu5wy+N?=
 =?us-ascii?Q?6ZncVXzbvivMvVlxPGbHcg3D0Jl5YNFH+b2/gFIiKqCDAZVwO3I/QHBPsyGF?=
 =?us-ascii?Q?3F615jQxyDUEfqYx2uEiFJXhUiRcifPMX7r1w8vsAlreyFA9bknQyLIxgt/+?=
 =?us-ascii?Q?82BkBTHEh1pm1JFOviVTJEucTbTzevzXugVvh+e1xBpFTzQ71n/1ukF3QY0j?=
 =?us-ascii?Q?j7j6/0pGkYU0/fe6Q4Q01jmiNUiKLEtp0VZLvE0694+PvBy3LSQTacuo/R3u?=
 =?us-ascii?Q?Ht4JtvELTDOLyJk3YNEuMXB24hMkipFgqPPOadMHfMfy7dl8zkG/mGg6FUWq?=
 =?us-ascii?Q?cFVMyV6p9i4MfyevAHaCLmqj0glFPGXGBPDVjqk25APL80VlNTNsvdK1ZG5J?=
 =?us-ascii?Q?VqPS/XJige+7qjng03khbt5HmGJXepENVYZ8NTepwFURySjKCV2CRyzpr7pl?=
 =?us-ascii?Q?rGokzREjy5s46Nts9HcdIJw/nm03vTQV+bJHGFo9mikOdNy0D/vjvFnuQnwE?=
 =?us-ascii?Q?+42/hjoC6n+W6KtgYF3Idt3hwHVpNtyHJ1WsMg0lmE8rAojRDeD/07HZehkX?=
 =?us-ascii?Q?rla+5uqBzNTL/e9X79H9NMq+6NqPNUgyY6T8s+TsC1guWzB0Z7SrKdyysMby?=
 =?us-ascii?Q?kiccfHiHjZaP6q7VPdxUW5Vw/B69bRtCctXbA4WkwjDLsxTY4ZE8RqH8hBtQ?=
 =?us-ascii?Q?oZ26tgGeOZ0HgfCKtshOUfPpk9WQbs+3C+64/PN0Thto3Z0CFmMQmO+zpRjU?=
 =?us-ascii?Q?qUi0vISICvblEQTTi74OqowQSUaNs4IdKuIM6mwP3tfiMXhlXv7Ij8aUXc2O?=
 =?us-ascii?Q?40DGsrFlaIEIPOl9rEbWFmUZnYhn2oSJ+ROm51UJCKx15qqc46DIpA2U1Osi?=
 =?us-ascii?Q?/Dp3yRZHpc5350nDFA3XHrdRzhp6mTKoUxEq+Q0GETibHVj+AT9zuW1aaeYD?=
 =?us-ascii?Q?XulYeTcg43wMUMH0UzhYLTIT1NUFofWYOJvM8fxB2fqmcSKIy3FAwHh/zlq6?=
 =?us-ascii?Q?/y0slorZSd4+y11/tJy7Ef83alakYUao2fjf3JWVXwzgfwz0ibST3Xf92bqa?=
 =?us-ascii?Q?7ZDA2NBiPNbJblYaaWoWDDBXyjF16oTx/ylSE9KQwNnR4OnuclFLCVtJtXDa?=
 =?us-ascii?Q?Ullutczzn2d17v+FwlArRlhqIZnaApJjakKrpO9EbbD2nSOUHB9Rp8bOnVzN?=
 =?us-ascii?Q?VVorRD0l2E4q3yzLqDnYvr6oijH+StK10/Dri9E25ZmeUNxKaiCUbYjmTRts?=
 =?us-ascii?Q?mnzl5ER7DyVkogIsL1xogbhP55D+o2NLCDFExPaeqIrqlMfkOWLqrVK3BzSj?=
 =?us-ascii?Q?Uau3d4WePyqe8to2NVukmCjPGEg9fan1rH449gsqR64MWyEKCN2ZXTgmuHC9?=
 =?us-ascii?Q?WnQLJN1H2k/3dAedeZkxS+DpLqBShlXtuCyAFzMdBfrEZAZB0WIJNro7+39j?=
 =?us-ascii?Q?Ta5GcnfXkWGAUQif+m9NzoUDOqr6nlMtYXJ1OSh1lgsVj8z1ugpLJPNxEay0?=
 =?us-ascii?Q?T3sAHi9QZReDUon14T5i01auHMbjhlz2f/pIyK4E2TQLRR2n3o9NLoe9eu9a?=
 =?us-ascii?Q?Vg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a179b6-fa9e-45e1-53ab-08d9c8dea499
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2021 02:14:41.8661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dwsYeAEaj5nVK8cPGAbqc7KcTZQkbqPKxZ9rS5y2+HQ0yPAkRQhfZD1BoHmfhIT6ivbqINIiakfeYI2feyZIqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4834
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=chen.zhang@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Rao, Lei <lei.rao@intel.com>
> Sent: Monday, December 27, 2021 9:20 AM
> To: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;
> jasowang@redhat.com
> Cc: qemu-devel@nongnu.org; Rao, Lei <lei.rao@intel.com>; Li Zhijian
> <lizhijian@fujitsu.com>
> Subject: [PATCH v2] net/filter: Optimize filter_send to coroutine
>=20
> This patch is to improve the logic of QEMU main thread sleep code in
> qemu_chr_write_buffer() where it can be blocked and can't run other
> coroutines during COLO IO stress test.
>=20
> Our approach is to put filter_send() in a coroutine. In this way,
> filter_send() will call qemu_coroutine_yield() in qemu_co_sleep_ns(), so
> that it can be scheduled out and QEMU main thread has opportunity to run
> other tasks.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>

Looks good to me.
Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  net/filter-mirror.c | 66 ++++++++++++++++++++++++++++++++++++--------
> -
>  1 file changed, 53 insertions(+), 13 deletions(-)
>=20
> diff --git a/net/filter-mirror.c b/net/filter-mirror.c index
> f20240cc9f..34a63b5dbb 100644
> --- a/net/filter-mirror.c
> +++ b/net/filter-mirror.c
> @@ -20,6 +20,7 @@
>  #include "chardev/char-fe.h"
>  #include "qemu/iov.h"
>  #include "qemu/sockets.h"
> +#include "block/aio-wait.h"
>=20
>  #define TYPE_FILTER_MIRROR "filter-mirror"
>  typedef struct MirrorState MirrorState; @@ -42,20 +43,21 @@ struct
> MirrorState {
>      bool vnet_hdr;
>  };
>=20
> -static int filter_send(MirrorState *s,
> -                       const struct iovec *iov,
> -                       int iovcnt)
> +typedef struct FilterSendCo {
> +    MirrorState *s;
> +    char *buf;
> +    ssize_t size;
> +    bool done;
> +    int ret;
> +} FilterSendCo;
> +
> +static int _filter_send(MirrorState *s,
> +                       char *buf,
> +                       ssize_t size)
>  {
>      NetFilterState *nf =3D NETFILTER(s);
>      int ret =3D 0;
> -    ssize_t size =3D 0;
>      uint32_t len =3D 0;
> -    char *buf;
> -
> -    size =3D iov_size(iov, iovcnt);
> -    if (!size) {
> -        return 0;
> -    }
>=20
>      len =3D htonl(size);
>      ret =3D qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)&len, sizeof(l=
en));
> @@ -80,10 +82,7 @@ static int filter_send(MirrorState *s,
>          }
>      }
>=20
> -    buf =3D g_malloc(size);
> -    iov_to_buf(iov, iovcnt, 0, buf, size);
>      ret =3D qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)buf, size);
> -    g_free(buf);
>      if (ret !=3D size) {
>          goto err;
>      }
> @@ -94,6 +93,47 @@ err:
>      return ret < 0 ? ret : -EIO;
>  }
>=20
> +static void coroutine_fn filter_send_co(void *opaque) {
> +    FilterSendCo *data =3D opaque;
> +
> +    data->ret =3D _filter_send(data->s, data->buf, data->size);
> +    data->done =3D true;
> +    g_free(data->buf);
> +    aio_wait_kick();
> +}
> +
> +static int filter_send(MirrorState *s,
> +                       const struct iovec *iov,
> +                       int iovcnt)
> +{
> +    ssize_t size =3D iov_size(iov, iovcnt);
> +    char *buf =3D NULL;
> +
> +    if (!size) {
> +        return 0;
> +    }
> +
> +    buf =3D g_malloc(size);
> +    iov_to_buf(iov, iovcnt, 0, buf, size);
> +
> +    FilterSendCo data =3D {
> +        .s =3D s,
> +        .size =3D size,
> +        .buf =3D buf,
> +        .ret =3D 0,
> +    };
> +
> +    Coroutine *co =3D qemu_coroutine_create(filter_send_co, &data);
> +    qemu_coroutine_enter(co);
> +
> +    while (!data.done) {
> +        aio_poll(qemu_get_aio_context(), true);
> +    }
> +
> +    return data.ret;
> +}
> +
>  static void redirector_to_filter(NetFilterState *nf,
>                                   const uint8_t *buf,
>                                   int len)
> --
> 2.32.0


