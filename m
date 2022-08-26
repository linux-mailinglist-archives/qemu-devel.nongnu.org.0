Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D04B5A242E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 11:23:12 +0200 (CEST)
Received: from localhost ([::1]:39556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRVYU-0007Ek-Ud
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 05:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oRVT5-0003QR-Jf
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:17:43 -0400
Received: from mga04.intel.com ([192.55.52.120]:40044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oRVT2-0000Ch-16
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:17:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661505452; x=1693041452;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7Jx8sNoy+FZJ+KgXskPCCji+ityKLRRHSBAFiALACi4=;
 b=jgcoe2zsP7rdInvEAllsdHxtUkutc7mu5K/afRG0H2MZSkTPRSvdIBua
 gGTH1DdjBwfe32r1sryXPaIcEs57u7SiWMfMfqRox89AyEFiWVNkR451u
 s5d+AyiEY03opPr9+U3VQ6Uif+ynsben14sl4bL7dH30uONDqL/8QWruO
 LOqduBjNB0I/PFLMzghfmSBBtq4L44UXIEtX5JqWvVxUJCM81Pyv2YzhU
 XZH2JnfwxliCa9epxUFKjx48Pl3+gkhFfokb44cvvmH2NlEW+NmEJbiBj
 fVPD0N991Z2UvR/+VM9cGbBxzi5eaFGb5i6HvkUqaYVAKbVb9X47CMXdM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="293206412"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="293206412"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 02:17:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="561378117"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 26 Aug 2022 02:17:27 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 26 Aug 2022 02:17:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 26 Aug 2022 02:17:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 26 Aug 2022 02:17:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 26 Aug 2022 02:17:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbBQp8V/3X1zX7WpzI5n5xQSLNyECtMIUkhad8AQMYQNE8j+D0dfcK24CXEPCoJYG0xm8f3FKehmn9SIL/loASAoqdGvPGRmI3UqMhBI4a9azM+0UEKO+SxuhC9MeaGynkqifY3bUwgjoyzw7aKPEJ6jv1yrOQtgXd36j9uH/hl2Ri5Xzh3zrBo1AizmXU3ywFyBpoiflXM4oY5YY60JT9Ci5bbwEkcl8PzaoMwC4aJtAjlurJUOSMGaJ+8zwItf9IoIou9s7b5PjqpyvOLM3sQNECpUKyZNI3yj3j1wFt7KlppPsq0aSZL7b668bwBYC57SPYMOS/k2TxacrJyJHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=de8y3IBdYYD3xkNoaBvMNI+CG40xVgP79fmBnXgS7TE=;
 b=bau8SY4rTYwgxjdlfZ4KTG/At39Mcoejnef3vzLdY+7ka/9pDkt64aDGCW+GoxvopDcZlmRVf7dvAGlfOot1sfvpuW8JJghDE4o2PGZZQIgH0I8NV1RMWRaUGuPSJkqf8Tb0Ux2kHWq7jgY0/VM01Z+xfwpLs+wZTo6ugRs6Ctr1izirG4nWtSQYifQLS4nmO2KctEGXKWstmWhn2tR6GS5alFRClmdrKgt5sFo7YY9r6HqcPBh2cJn+4rjhGjaTmghV6ZKJZU2Iq5TH9p4IIM1dtOs8BJksg/kvCHgq29TDjnwfLrxVddMTFj0/8V+f4f17likYIb/7zj3xNwcOyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5465.namprd11.prod.outlook.com (2603:10b6:408:11e::18)
 by BN6PR11MB2035.namprd11.prod.outlook.com (2603:10b6:404:3c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 09:17:19 +0000
Received: from BN9PR11MB5465.namprd11.prod.outlook.com
 ([fe80::e9b7:c3cd:e2d3:6d99]) by BN9PR11MB5465.namprd11.prod.outlook.com
 ([fe80::e9b7:c3cd:e2d3:6d99%3]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 09:17:19 +0000
From: "Xu, Ling1" <ling1.xu@intel.com>
To: "quintela@redhat.com" <quintela@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "Zhao, Zhou" <zhou.zhao@intel.com>, "Jin, Jun I"
 <jun.i.jin@intel.com>
Subject: RE: [PATCH v5 1/2] Update AVX512 support for xbzrle_encode_buffer
Thread-Topic: [PATCH v5 1/2] Update AVX512 support for xbzrle_encode_buffer
Thread-Index: AQHYsuX3Hrx305NqzESpRZTgRwiDJ629xQzSgAMsazA=
Date: Fri, 26 Aug 2022 09:17:19 +0000
Message-ID: <BN9PR11MB5465549CBD71ABAEFFDE82C3D1759@BN9PR11MB5465.namprd11.prod.outlook.com>
References: <20220818093559.2342594-1-ling1.xu@intel.com>
 <20220818093559.2342594-2-ling1.xu@intel.com> <874jy2yqw2.fsf@secure.mitica>
In-Reply-To: <874jy2yqw2.fsf@secure.mitica>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f6f174f-a8ba-4145-d841-08da8743c712
x-ms-traffictypediagnostic: BN6PR11MB2035:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xivb7I5q6Bsf8GE5kBIPKzSLcXtZTezv5K3OvqrE0N56/NuxjVSxK6Tvsp0Hs0UepqR9EWjGbztc+PRHwHoC5gJR/KCFQuu7BYS66QbRaVr7NqEwALHwEX47ec0fA75OR177cFbXgt9jKqPit/9ROp/V1S9AqGIGHKKbVojNYWXC7ngBzkF4VqX6JvCCvavY+p9y/UKiPVlGmwFkWUWAVXwm5fd5moxzQaffyKk1Apc20270ehOGXcOaggHDqYkru0vWK140ccm0OgF9UP5FnYbh22gN2SLTvbqGrsh5KV5W9Geq8YiDavAIJMEPRBLqtDpAbWRV3vcud0RPnnLyXIuAyq6USj2Z22gW+dv/TAVfkslnCVHFPisc6Tb3SQjPVgmQ3FNGO/E4/Wc+tQoLBVtUetKCduIFxUpEyR55hAiaG+ewRNZmDILC/ni8oY0/wpfobocYTUvMf/TEU+rcBRW4AmsKwHGfRmF5hG6xd9dbbxQteJgSaACocDnyDHYvHULoHKyyouCOfqAtn+8wNXf9b9eQLxb2SHKC015uJ0iBTvik8gv5qdsGRtWZBDv/T+fWFmQxAnpw0EfT7+zYOxsphmopiB/2fbKyQD/HN0vll7dhKfnMBxFi3rCWxJ+wxr78oWi6kLdSbXuSKB3tkH8+aFIzmFvJPPa8bP73k9dRhmVSexKUL2lKuCRQDKuQhrgdPxLbeYDOMx8dP7Heaj43zo4COm26wlemt7lirBlPDXs7umUalaIKsNx0F6Jx2VWz+UccKP+5mZYpKihtmw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5465.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(136003)(346002)(366004)(376002)(64756008)(66446008)(66556008)(66946007)(66476007)(76116006)(6916009)(316002)(54906003)(8676002)(478600001)(33656002)(86362001)(122000001)(38100700002)(38070700005)(82960400001)(83380400001)(7696005)(9686003)(53546011)(186003)(71200400001)(107886003)(41300700001)(6506007)(26005)(5660300002)(4326008)(15650500001)(55016003)(52536014)(2906002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nSDJOEMHnp+AbFbQY9yBE4/x4zvm7VGqnmMy1/AY0oAGQZcW4qMgdIu+CbGP?=
 =?us-ascii?Q?UHiZ4iQzwJsPEf4zX160Es91sDEOJSLBAEF+nZIZ10MaSgsGwslAoIbqcgaj?=
 =?us-ascii?Q?MMh7wg+j76fkXCRiHQ10HwpS5fq7o2cozbBsu0Mrss+XbkHONXZcBjDGGlqd?=
 =?us-ascii?Q?ZiLPaEHsOSTXel93KqEvCHJ6UrJlMQQsGGL45hU6LRIVJYYLwI9b6PVusKPm?=
 =?us-ascii?Q?k+CBnsgIRoAtw+fOlAed7iQX3zpsV1l6Dl6xOgasnvi5beMmSRvmAzKDEyLu?=
 =?us-ascii?Q?fGW/4n+s13c3trrTC92/8Sn972h0XgO9ekwdSntbkq/vUhKqk5ZDunN+Ckh9?=
 =?us-ascii?Q?D9nxQwfVpdlPJhM1Vv7/womvn6cD51CA3X7fUnGV7vQSIpOeqX+n7X4LBaQA?=
 =?us-ascii?Q?/nYs+LjKjJWbvyoijkLxJCb6VCODBCIyM5xZEEIybGsOuZHh/14XDcCwsi16?=
 =?us-ascii?Q?zmhfTGD7cbMTJzj/3XJ7BxSydN2yMoaIu5hSs+6z3XjHlFja/FcN1Wu6Hoz/?=
 =?us-ascii?Q?rxOnuelXAf5ccTyIOyqAF3Q9C/EU2w2MSn/UHyV9grVdoR40c2WD5+gmCNVw?=
 =?us-ascii?Q?Co9nFtLQSB3YBZY3vsUS0hjNv/vPHtMQgguuSq+HuYd9mt7RtJtX9Ql5kxhf?=
 =?us-ascii?Q?Pg1RSfJbvn4ycsj0ZSaHg48XcMx7cK9vQs33qQ2NsTqGrFAbxejoET41Omlw?=
 =?us-ascii?Q?IYZsO/IZtDKZMLWKuLKNxQElc+CQ4Z7zH2d+upjMSoBPoicyXrqOPJQK/ov3?=
 =?us-ascii?Q?8VA83R7mbDKTkyca0YJNQvidD+xTh1S/rARko1YrzgSwoTpE9xra27WWEvCr?=
 =?us-ascii?Q?C8kEUIzFGFmWY0hZWQmeo7qXJyAuccj2/CiUqkwnlVB7XzIIFSnQy4RBpu60?=
 =?us-ascii?Q?9kEDnmE5+Xp+Lb1gnpKD0VcRK8JW9ubdm9RXqpXCP1o8E5qwPZRLWJ20u9bn?=
 =?us-ascii?Q?qMAISlA5GU6W0Y0dfVzOp3pcAotvtzOqZImkK+8BahR0F9T8gjL3tMQU0VgI?=
 =?us-ascii?Q?m+JGCOZwgEuOniNlo7Ekijs5tSigE0UFCnsC9Yy1pXagrD4gF2xhk7JFYkKo?=
 =?us-ascii?Q?SsLI73hjDy1GdXBoiAbxS2eCxvmgjyQM1i1iubx6aYAlpPSgyBaxN7CwHWIe?=
 =?us-ascii?Q?hLppsbsMV42LdCAnaiXJ/EvOME+RpxrHQnZTqlese5FrRnYrzrCM008CRX8D?=
 =?us-ascii?Q?WofxaXJmkifxlPGcMBdCURqPmBwNyY5cp6wvQmt4wQOlfHprhnkDUrEZIAky?=
 =?us-ascii?Q?wG1PPLmid6vwYpIeyl7TpDhuyiEZVF74wlWkEyPRnqtXXJcM4IjupG3jKsOg?=
 =?us-ascii?Q?HG8rJgC2adcHVnIjZ9aJkuJyzThE1ROXSVolOotPwIMf8T8S+LzGSxIe+kKT?=
 =?us-ascii?Q?9yM+gQksNPo9B1KAyzULYSRDWpdLjJakL8mzfV10B18c1IJc+aKmvKH0mUIi?=
 =?us-ascii?Q?g24u6LB8o8lz4HFCzHQtrXBH9/LZQyNLqeNYTpiMxofiZGL2T3ao4dOC+dMj?=
 =?us-ascii?Q?yC1cJ8xpYvsX81GKiVsbrblLWU7LM8y+VHaCWgWaJLQUru+EMEw2eUj3dgxs?=
 =?us-ascii?Q?4FWDDoeQcJyJGSAWwv1sF7C41nXNexklq4uRGqCk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5465.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6f174f-a8ba-4145-d841-08da8743c712
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 09:17:19.8337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tVtJLuNDVGay1pLADkypPOHOmg65/H0OcO23PHSo/ppoX6dazufm5c7r5/Iqahpm55yAUzJDCkfr5BtghUkMJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2035
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=ling1.xu@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, juan,=20
      Thanks for your time and suggestions on this patch. We have revised o=
ur code according to your nice comments. We will submit patch v6 to update =
these modifications.

Best Regards
Ling

-----Original Message-----
From: Juan Quintela <quintela@redhat.com>=20
Sent: Wednesday, August 24, 2022 4:42 PM
To: Xu, Ling1 <ling1.xu@intel.com>
Cc: qemu-devel@nongnu.org; dgilbert@redhat.com; Zhao, Zhou <zhou.zhao@intel=
.com>; Jin, Jun I <jun.i.jin@intel.com>
Subject: Re: [PATCH v5 1/2] Update AVX512 support for xbzrle_encode_buffer

ling xu <ling1.xu@intel.com> wrote:
> This commit updates code of avx512 support for xbzrle_encode_buffer=20
> function to accelerate xbzrle encoding speed. We add runtime check of=20
> avx512 and add benchmark for this feature. Compared with C version of=20
> xbzrle_encode_buffer function, avx512 version can achieve 50%-70%=20
> performance improvement on benchmarking. In addition, if dirty data is=20
> randomly located in 4K page, the avx512 version can achieve almost=20
> 140% performance gain.
>
> Signed-off-by: ling xu <ling1.xu@intel.com>
> Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
> Co-authored-by: Jun Jin <jun.i.jin@intel.com>
> ---
>  meson.build        |  16 ++++++
>  meson_options.txt  |   2 +
>  migration/ram.c    |  35 ++++++++++--
>  migration/xbzrle.c | 130 +++++++++++++++++++++++++++++++++++++++++++++
>  migration/xbzrle.h |   4 ++
>  5 files changed, 184 insertions(+), 3 deletions(-)
>
> diff --git a/meson.build b/meson.build index 30a380752c..c9d90a5bff=20
> 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2264,6 +2264,22 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_opt=
ion('avx512f') \
>      int main(int argc, char *argv[]) { return bar(argv[0]); }
>    '''), error_message: 'AVX512F not available').allowed())
> =20
> +config_host_data.set('CONFIG_AVX512BW_OPT', get_option('avx512bw') \
> +  .require(have_cpuid_h, error_message: 'cpuid.h not available,=20
> +cannot enable AVX512BW') \
> +  .require(cc.links('''
> +    #pragma GCC push_options
> +    #pragma GCC target("avx512bw")
> +    #include <cpuid.h>
> +    #include <immintrin.h>
> +    static int bar(void *a) {


> +      __m512i x =3D *(__m512i *)a;
> +      __m512i res=3D _mm512_abs_epi8(x);

Cast is as ugly as hell, what about:

      __m512i *x =3D a;
      __m512i res =3D _mm512_abs_epi8(*x);

??

> +static void __attribute__((constructor)) init_cpu_flag(void) {
> +    unsigned max =3D __get_cpuid_max(0, NULL);
> +    int a, b, c, d;
> +    if (max >=3D 1) {
> +        __cpuid(1, a, b, c, d);
> +         /* We must check that AVX is not just available, but usable.  *=
/
> +        if ((c & bit_OSXSAVE) && (c & bit_AVX) && max >=3D 7) {
> +            int bv;
> +            __asm("xgetbv" : "=3Da"(bv), "=3Dd"(d) : "c"(0));
> +            __cpuid_count(7, 0, a, b, c, d);
> +           /* 0xe6:
> +            *  XCR0[7:5] =3D 111b (OPMASK state, upper 256-bit of ZMM0-Z=
MM15
> +            *                    and ZMM16-ZMM31 state are enabled by OS=
)
> +            *  XCR0[2:1] =3D 11b (XMM state and YMM state are enabled by=
 OS)
> +            */
> +            if ((bv & 0xe6) =3D=3D 0xe6 && (b & bit_AVX512BW)) {
> +                xbzrle_encode_buffer_func =3D xbzrle_encode_buffer_avx51=
2;
> +            }
> +        }
> +    }
> +    return ;

This return line is not needed.

> +}
> +#endif
> +
>  XBZRLECacheStats xbzrle_counters;
> =20
>  /* struct contains XBZRLE cache and a static page @@ -802,9 +831,9 @@=20
> static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
>      memcpy(XBZRLE.current_buf, *current_data, TARGET_PAGE_SIZE);
> =20
>      /* XBZRLE encoding (if there is no overflow) */
> -    encoded_len =3D xbzrle_encode_buffer(prev_cached_page, XBZRLE.curren=
t_buf,
> -                                       TARGET_PAGE_SIZE, XBZRLE.encoded_=
buf,
> -                                       TARGET_PAGE_SIZE);
> +    encoded_len =3D xbzrle_encode_buffer_func(prev_cached_page, XBZRLE.c=
urrent_buf,
> +                                            TARGET_PAGE_SIZE, XBZRLE.enc=
oded_buf,
> +                                            TARGET_PAGE_SIZE);
> =20
>      /*
>       * Update the cache contents, so that it corresponds to the data=20
> diff --git a/migration/xbzrle.c b/migration/xbzrle.c index=20
> 1ba482ded9..6da7f79625 100644
> --- a/migration/xbzrle.c
> +++ b/migration/xbzrle.c
> @@ -174,3 +174,133 @@ int xbzrle_decode_buffer(uint8_t *src, int slen,=20
> uint8_t *dst, int dlen)
> =20
>      return d;
>  }
> +
> +#if defined(CONFIG_AVX512BW_OPT)
> +#pragma GCC push_options
> +#pragma GCC target("avx512bw")
> +#include <immintrin.h>
> +int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int =
slen,
> +                             uint8_t *dst, int dlen) {
> +    uint32_t zrun_len =3D 0, nzrun_len =3D 0;
> +    int d =3D 0, i =3D 0, num =3D 0;
> +    uint8_t *nzrun_start =3D NULL;
> +    /* add 1 to include residual part in main loop */
> +    uint32_t count512s =3D (slen >> 6) + 1;
> +    /* countResidual is tail of data, i.e., countResidual =3D slen % 64 =
*/
> +    uint32_t countResidual =3D slen & 0b111111;
> +    bool never_same =3D true;
> +    uint64_t maskResidual =3D 1;
> +    maskResidual <<=3D countResidual;
> +    maskResidual -=3D1;
> +    uint64_t comp =3D 0;
> +    int bytesToCheck =3D 0;
> +
> +    while (count512s) {
> +        if (d + 2 > dlen) {
> +            return -1;
> +        }
> +
> +        if(count512s !=3D 1){
> +            __m512i old_data =3D _mm512_mask_loadu_epi8(old_data,
> +                                                      0xffffffffffffffff=
, old_buf + i);
> +            __m512i new_data =3D _mm512_mask_loadu_epi8(new_data,
> +                                                      0xffffffffffffffff=
, new_buf + i);
> +            comp =3D _mm512_cmpeq_epi8_mask(old_data, new_data);
> +            bytesToCheck =3D 64;
> +            count512s--;
> +        } else {
> +            __m512i old_data =3D _mm512_mask_loadu_epi8(old_data,
> +                                                      maskResidual, old_=
buf + i);
> +            __m512i new_data =3D _mm512_mask_loadu_epi8(new_data,
> +                                                      maskResidual, new_=
buf + i);
> +            comp =3D _mm512_cmpeq_epi8_mask(old_data, new_data);
> +            bytesToCheck =3D countResidual;
> +            count512s--;
> +        }

It is basically the same in both branches of the if, what about:

        int bytesToCheck =3D 64;
        uint86_t mask =3D 0xffffffffffffffff;

        /* I am assuming this is the opposit of the if condition */
        if(count512s =3D=3D 1){
            mask =3D maskResidual;
            bytesToCheck =3D countResidual;
        }
        __m512i old_data =3D _mm512_mask_loadu_epi8(old_data, mask, old_buf=
 + i);
        __m512i new_data =3D _mm512_mask_loadu_epi8(new_data, mask, new_buf=
 + i);
        uint64_t comp =3D _mm512_cmpeq_epi8_mask(old_data, new_data);
        count512s--;

BTW, once that we are here, why not to be consistent:

bool is_same;
uint64_t maskResidual;

just use always Cammel case or underscores, but half and half ....

Later, Juan.


