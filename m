Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5C360EDD5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 04:14:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onsO0-0002wx-QL; Wed, 26 Oct 2022 22:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1onsNx-0002Wm-Q3
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 22:12:45 -0400
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1onsNu-0006MT-Kz
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 22:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666836762; x=1698372762;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PkwHmvis+rnQQ4ce3lWGo4odFix4ytGh4QsbpeEQLKc=;
 b=WbsqdeNN96GgcYxlRJ1Nwc8DHcEIQ/kgWmvv/wR7SS/dchLj4+mh/1a9
 AIBB5+R3S5NuGInIq1UsZIl1FxgW5iw09rsOCSmv2XL9xXWI1QPxy1DF3
 z1WzTAqT0odDz3DUgp5/1hedBvAXfvWrtv15STI5URgmEMwYsWmSKArqI
 6yS2+EN5N2MCM6JhVuiPSeS1jMx1hO8x6ghnvoOoq2TJSGc0GeUaekHMh
 W8gYjFduWNlVJ5zxLYMcMOA9tbp09/TPhCqqBlts1mlBJ+sugeHQWMy8E
 Ms0WbiKliiBxiq4eX2023o/jJmbs3fxaAqI7889GjZAC5FkVq0SpQ+YJj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="370176751"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="370176751"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 19:12:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="627006042"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="627006042"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 26 Oct 2022 19:12:23 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 26 Oct 2022 19:12:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 26 Oct 2022 19:12:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 26 Oct 2022 19:12:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8VfoqywtY/U0UOglGuJKnJ0rKq4D9XojXrktPWETyoLNX9arDFAliNbkp0rb/S+JrrmpaCDtuoeaed3iSjNgnxLTTIIQrx6yuQVxeI+t9NqhmxpBS2/j0KRJJA7fMltuqDELYaHTPN0NzlE0BHECOGIlpq9YqIbTLjRn31aCWQGMua79DWJqhBj3axx+53P8x823rtxDW9rFPYNkbPDNXb7naopr03E1WPP2Bvi2FYfQCylyDYSlvk3ENZsy76Alo/p7loTMPsX34Hi3jffLacQLXVNf2dHrmX9jfFsCZZ9veZZKwbHpLjpZqS5k28Slk4jzfuUHWF7fSC6EqdyOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leo2SoVs7MPutTDKHZKRHPWhFMvHJCKIx9lD7HfXCss=;
 b=CLopMHuQKdppb/dcSkcJ+rhRiZUsS9EuOxdvQYSwpXR36Jr0dhIy04H7FMOvPDM2Kc5XeBpKvm5C9G321+CG6ZKeNa/3a38qkkCByxzQ6V2DtiRzP3nyjoyyrN2qUEp0x1+3oNh53W0iPGfdhQN/IRojWDxlDQ6PxlqU16l+ab2OBuVnnU2iMhrQiF3x4i/ZkJaXBzN44EHmMhnV3+gX2oKryulzCMJ4al1aBaA+7RnpR3WwTMHiUfdNpIN5TG2hh2rOlT4505Z6FIjb5ikC1aoJOxG4B/1wm//YXysJffZZzyLPnQoOxyE1ZWI8NcrQD57r0tnIF2S+uPFCE+e4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5465.namprd11.prod.outlook.com (2603:10b6:408:11e::18)
 by SA0PR11MB4573.namprd11.prod.outlook.com (2603:10b6:806:98::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 02:12:14 +0000
Received: from BN9PR11MB5465.namprd11.prod.outlook.com
 ([fe80::dd2f:3316:cf45:4d8d]) by BN9PR11MB5465.namprd11.prod.outlook.com
 ([fe80::dd2f:3316:cf45:4d8d%6]) with mapi id 15.20.5723.033; Thu, 27 Oct 2022
 02:12:14 +0000
From: "Xu, Ling1" <ling1.xu@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "Zhao, Zhou" <zhou.zhao@intel.com>, "Jin, Jun I"
 <jun.i.jin@intel.com>
Subject: RE: [PATCH v6 1/2] Update AVX512 support for xbzrle_encode_buffer
Thread-Topic: [PATCH v6 1/2] Update AVX512 support for xbzrle_encode_buffer
Thread-Index: AQHYuTJBJ3WbwW/XWUSAs+dX+/oEhq4h3LrA
Date: Thu, 27 Oct 2022 02:12:13 +0000
Message-ID: <BN9PR11MB546551C3F991C60BDD046FF7D1339@BN9PR11MB5465.namprd11.prod.outlook.com>
References: <20220826095719.2887535-1-ling1.xu@intel.com>
 <20220826095719.2887535-2-ling1.xu@intel.com>
In-Reply-To: <20220826095719.2887535-2-ling1.xu@intel.com>
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
x-ms-traffictypediagnostic: BN9PR11MB5465:EE_|SA0PR11MB4573:EE_
x-ms-office365-filtering-correlation-id: 79fde1e7-e52d-4313-7f1f-08dab7c0aa5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SwJjfd4jetDNFa65wcbBcQfLUYBEt5yBCdH+lDkrdXVCOcLrO9yTxRp4Lw5UB5uXEMY7Kju0TWNrO26Yh9uzutJLRK9gho5WW37265SDzGat3rlXpQ3lcmmUMRBvvY0N2nLOf9eAEVyBwVuW3604Dz1M+k5OMnrpk0p463ZhLlIzLpup57oVO3xfmBawA9o6KHE4PBUKzes7BfdieMXA1mN1IbH/YgDcmzUCKZ+21s5h+VNgX7M0fDAYZNJZSUiQbYtF+myddNuDZorFHiBsXtoHii+o8fku6nRLQq3egFpLCLry8vVKQwr9GOhoCEQQk87fmVxV7aqBKD245P51nC7zJ1mDwxRjsuowIBgdudo3zzDt+RcafK9DlZ/GROO9/RHBSUqQ+Vv0JobrrK1gWGK95FCfEgwmS2FiYmG2t7dWJZ72kg5grj55cakqoPczjZ05W/DZ2d2Ioy/TTCdtGhYTR8DDEkJ/m6tv89nac5ItL3w8xfqlW7rKpyvFQA15rvQOBUHLbg1DvHMXsgPaGYw4KuXISqxzK7BTRlGCiBAhCvViF73sZskb4r5Ai96JXTx8nw9w+p95FyZScdZpZFyRwaGptT+jRyr9wTqza98isrJugSiqBcrzA3X5WAmT48EEKn+tkdpMRtYHVTfA6MwOLiiNubJ4yakWmKHo68nQR0MQaHwncJX10M0UwVuEwI/nScNeJrRyEVMa2pYR/53YbDt1J332wjUKI405xgkUDRXuXQ4iZfE9S8zZDlpUwTEGuMApMG03+pK2BRPZ1P2yU+ds8VXF0B9ZhgANsnc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5465.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199015)(107886003)(9686003)(26005)(186003)(83380400001)(53546011)(6506007)(7696005)(2906002)(15650500001)(478600001)(55016003)(4326008)(6916009)(8676002)(66556008)(66476007)(316002)(54906003)(66946007)(76116006)(966005)(66446008)(71200400001)(52536014)(41300700001)(8936002)(5660300002)(64756008)(82960400001)(86362001)(33656002)(38100700002)(38070700005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?S5GufJufDaI/5o8Kx2+lB0y7oFJIQx5dpmg30V6FL6fiahut41lAwAjAyvEM?=
 =?us-ascii?Q?Vp5elx/648zKZ+WLhAcEh/vqM+V88TGNNNRgQJIcJfjfMFz334rL6p53O0EH?=
 =?us-ascii?Q?lRJkziGp/C+imwn2+bLuBJPWlWur1/JoDew10aIVHbY+vzQDhhHO141VOTYR?=
 =?us-ascii?Q?lYhshbAYqFIfWrHG0QSxygoB4ckVx8GIwJCqnPipNB3rciSkq+CDJk2sUMMr?=
 =?us-ascii?Q?ahFQFFaKbyUmNG8S29giFT6G4L2iSCIWwgLy2TDtsCrVjqMCVm8tAvEc6dbG?=
 =?us-ascii?Q?8VHWdErHJeQskst/+TmXjp1UGqobv4RN8Fa1SVCGLeGBzu5OmxZBN75VGiRR?=
 =?us-ascii?Q?G0ZCOUlcD8hNEa3fMInF5l4yP62sZDzXWkcCQdGIwhquzmHqftIrocQJkFiw?=
 =?us-ascii?Q?/KzMI7QK3PEOofXcYvY4N2oZFS/r5ZtXmq9UqGpQvWNdtAFgfhCyqzmCgw+u?=
 =?us-ascii?Q?3WDW2TeKCvmZ2gh9f2xAFiECfB3Jpz+AlFjy9K43RfBaiRhGiHm9mCxlAV8B?=
 =?us-ascii?Q?N9F432MSr/Z8WWUQJss+TfCRoJJR5lwPPPDCSbEw0DS9qVLIhkaNITF3B+IK?=
 =?us-ascii?Q?NXySEdnD0t8O+hw9rYaQ0f8ObSNw15OYzxb9PAK20f8AbbXyWFNM/oKmqnfs?=
 =?us-ascii?Q?vLkc2t5DHa/LhOA6TGUBp+ePRwrP8df208DVx0tV6lTzpMBA/mPkSIQ4vKqE?=
 =?us-ascii?Q?HCnirM3LKARxE36eiMh5Ds6Q3MMSphXuoOYQpkxMTAU+6RPKI1eQu2CCGwLz?=
 =?us-ascii?Q?f8SvNzbRalYYnRdIjCfhAQyp1LnDpajGLgJn4USR1pTRetZhp/qCOdOpCZuf?=
 =?us-ascii?Q?5MmjJWZqeN3Dr1w91+dAyFWW6weK4qQk8toh+xmJ5rfHt/bvqcGh2aIXUxmS?=
 =?us-ascii?Q?CgfbToVlX5YN0dwyhpLlw9zTu21yARYk9X7H+xOpGv/8RaLtbKWLue/fhSk4?=
 =?us-ascii?Q?FLmTya0E4rZ+rFz6l5HFlgmcQPn666L9xYUF2H/UIY1EVXfJVnqIgbfbt6Ej?=
 =?us-ascii?Q?d3Mx61jH2sRkj2A/wz5agedBl3Vs9e1dKVd7qxfVTNIWM7V4ysae4+iGN9gO?=
 =?us-ascii?Q?yQhCxO4u9UzEkFGcZeWnf1/2T9ykjZHqGQIxLekXDeX5OxB0O4j/GRvN8O5b?=
 =?us-ascii?Q?0z9d7x2B6tto0efjR6PdDfdzZH4tcfnA3khguoSca0Xd/M/P+Rp9nCFU3kXK?=
 =?us-ascii?Q?FLN8aFgTVeP2+sq9VrZ28H3I1g48/THgq5dSVITYg3s3ve+phy8S5RsQcRiF?=
 =?us-ascii?Q?hXc7m70fecvvu0kEjm4PxulLf6J1K4t5izg/GLiOwRLsqde9PLkYCmwvfd3K?=
 =?us-ascii?Q?z/9lJilzwZt9PS1RCfrL9EeoIN+WxyGAGcZP2b2iT5HhLsVi7X137gv1x/M1?=
 =?us-ascii?Q?6X7jfLgaNcZpzXb2DPBeneuZZofXaNOFYSDw7SDeLj0t+FnE4ah1d+iERam3?=
 =?us-ascii?Q?7jJ8Uw/3/1fGMTgsmHOWrOA27MT2c0hEY3UC5pww4LodJsiMHiDDatm2barH?=
 =?us-ascii?Q?o2HIm138WxsEiFmi31PP/Cig0sxO56FeeE1cm1TVVV8998ony92IddWlM4M7?=
 =?us-ascii?Q?3VA/FzMgmkX0OjVQf+qCbNsYXXPrbO0JoZza5FFZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5465.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fde1e7-e52d-4313-7f1f-08dab7c0aa5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2022 02:12:14.5694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1fiVViU7UMoBvvC1nl1mxRSLhrtAyl6iWiRhgt0mrp3oMeAzsvRBI19LnszS44M3gj09pjz6TUuamcnWV4BUmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4573
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=ling1.xu@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi, All,
     This is a "ping" email~.=20
     It seems that the newest version of our patch has been ignored. So I "=
ping" this patchset again.=20
     All comments and suggestions have been revised and updated in this V6 =
version patch, and link for the patch is below:
     https://lore.kernel.org/qemu-devel/20220826095719.2887535-2-ling1.xu@i=
ntel.com/
     Looking forward to hearing from you!

Best Regards
Ling

-----Original Message-----
From: Xu, Ling1 <ling1.xu@intel.com>=20
Sent: Friday, August 26, 2022 5:57 PM
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com; dgilbert@redhat.com; Xu, Ling1 <ling1.xu@intel.com=
>; Zhao, Zhou <zhou.zhao@intel.com>; Jin, Jun I <jun.i.jin@intel.com>
Subject: [PATCH v6 1/2] Update AVX512 support for xbzrle_encode_buffer

This commit updates code of avx512 support for xbzrle_encode_buffer functio=
n to accelerate xbzrle encoding speed. Runtime check of avx512 support and =
benchmark for this feature are added. Compared with C version of xbzrle_enc=
ode_buffer function, avx512 version can achieve 50%-70% performance improve=
ment on benchmarking. In addition, if dirty data is randomly located in 4K =
page, the avx512 version can achieve almost 140% performance gain.

Signed-off-by: ling xu <ling1.xu@intel.com>
Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
Co-authored-by: Jun Jin <jun.i.jin@intel.com>
---
 meson.build        |  16 ++++++
 meson_options.txt  |   2 +
 migration/ram.c    |  34 +++++++++++--
 migration/xbzrle.c | 124 +++++++++++++++++++++++++++++++++++++++++++++
 migration/xbzrle.h |   4 ++
 5 files changed, 177 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 20fddbd707..5d4b82d7f3 100644
--- a/meson.build
+++ b/meson.build
@@ -2264,6 +2264,22 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_optio=
n('avx512f') \
     int main(int argc, char *argv[]) { return bar(argv[0]); }
   '''), error_message: 'AVX512F not available').allowed())
=20
+config_host_data.set('CONFIG_AVX512BW_OPT', get_option('avx512bw') \
+  .require(have_cpuid_h, error_message: 'cpuid.h not available, cannot=20
+enable AVX512BW') \
+  .require(cc.links('''
+    #pragma GCC push_options
+    #pragma GCC target("avx512bw")
+    #include <cpuid.h>
+    #include <immintrin.h>
+    static int bar(void *a) {
+
+      __m512i *x =3D a;
+      __m512i res=3D _mm512_abs_epi8(*x);
+      return res[1];
+    }
+    int main(int argc, char *argv[]) { return bar(argv[0]); }  '''),=20
+ error_message: 'AVX512BW not available').allowed())
+
 have_pvrdma =3D get_option('pvrdma') \
   .require(rdma.found(), error_message: 'PVRDMA requires OpenFabrics libra=
ries') \
   .require(cc.compiles(gnu_source_prefix + '''
diff --git a/meson_options.txt b/meson_options.txt index e58e158396..07194b=
f680 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -104,6 +104,8 @@ option('avx2', type: 'feature', value: 'auto',
        description: 'AVX2 optimizations')  option('avx512f', type: 'featur=
e', value: 'disabled',
        description: 'AVX512F optimizations')
+option('avx512bw', type: 'feature', value: 'auto',
+       description: 'AVX512BW optimizations')
 option('keyring', type: 'feature', value: 'auto',
        description: 'Linux keyring support')
=20
diff --git a/migration/ram.c b/migration/ram.c index dc1de9ddbc..ff4c15c9c3=
 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -83,6 +83,34 @@
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
=20
+int (*xbzrle_encode_buffer_func)(uint8_t *, uint8_t *, int,
+     uint8_t *, int) =3D xbzrle_encode_buffer; #if=20
+defined(CONFIG_AVX512BW_OPT) #include "qemu/cpuid.h"
+static void __attribute__((constructor)) init_cpu_flag(void) {
+    unsigned max =3D __get_cpuid_max(0, NULL);
+    int a, b, c, d;
+    if (max >=3D 1) {
+        __cpuid(1, a, b, c, d);
+         /* We must check that AVX is not just available, but usable.  */
+        if ((c & bit_OSXSAVE) && (c & bit_AVX) && max >=3D 7) {
+            int bv;
+            __asm("xgetbv" : "=3Da"(bv), "=3Dd"(d) : "c"(0));
+            __cpuid_count(7, 0, a, b, c, d);
+           /* 0xe6:
+            *  XCR0[7:5] =3D 111b (OPMASK state, upper 256-bit of ZMM0-ZMM=
15
+            *                    and ZMM16-ZMM31 state are enabled by OS)
+            *  XCR0[2:1] =3D 11b (XMM state and YMM state are enabled by O=
S)
+            */
+            if ((bv & 0xe6) =3D=3D 0xe6 && (b & bit_AVX512BW)) {
+                xbzrle_encode_buffer_func =3D xbzrle_encode_buffer_avx512;
+            }
+        }
+    }
+}
+#endif
+
 XBZRLECacheStats xbzrle_counters;
=20
 /* struct contains XBZRLE cache and a static page @@ -802,9 +830,9 @@ stat=
ic int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
     memcpy(XBZRLE.current_buf, *current_data, TARGET_PAGE_SIZE);
=20
     /* XBZRLE encoding (if there is no overflow) */
-    encoded_len =3D xbzrle_encode_buffer(prev_cached_page, XBZRLE.current_=
buf,
-                                       TARGET_PAGE_SIZE, XBZRLE.encoded_bu=
f,
-                                       TARGET_PAGE_SIZE);
+    encoded_len =3D xbzrle_encode_buffer_func(prev_cached_page, XBZRLE.cur=
rent_buf,
+                                            TARGET_PAGE_SIZE, XBZRLE.encod=
ed_buf,
+                                            TARGET_PAGE_SIZE);
=20
     /*
      * Update the cache contents, so that it corresponds to the data diff =
--git a/migration/xbzrle.c b/migration/xbzrle.c index 1ba482ded9..05366e86c=
0 100644
--- a/migration/xbzrle.c
+++ b/migration/xbzrle.c
@@ -174,3 +174,127 @@ int xbzrle_decode_buffer(uint8_t *src, int slen, uint=
8_t *dst, int dlen)
=20
     return d;
 }
+
+#if defined(CONFIG_AVX512BW_OPT)
+#pragma GCC push_options
+#pragma GCC target("avx512bw")
+#include <immintrin.h>
+int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int sl=
en,
+                             uint8_t *dst, int dlen) {
+    uint32_t zrun_len =3D 0, nzrun_len =3D 0;
+    int d =3D 0, i =3D 0, num =3D 0;
+    uint8_t *nzrun_start =3D NULL;
+    /* add 1 to include residual part in main loop */
+    uint32_t count512s =3D (slen >> 6) + 1;
+    /* countResidual is tail of data, i.e., countResidual =3D slen % 64 */
+    uint32_t count_residual =3D slen & 0b111111;
+    bool never_same =3D true;
+    uint64_t mask_residual =3D 1;
+    mask_residual <<=3D count_residual;
+    mask_residual -=3D 1;
+    __m512i r =3D _mm512_set1_epi32(0);
+
+    while (count512s) {
+        if (d + 2 > dlen) {
+            return -1;
+        }
+
+        int bytes_to_check =3D 64;
+        uint64_t mask =3D 0xffffffffffffffff;
+        if (count512s =3D=3D 1) {
+            bytes_to_check =3D count_residual;
+            mask =3D mask_residual;
+        }
+        __m512i old_data =3D _mm512_mask_loadu_epi8(r,
+                                                  mask, old_buf + i);
+        __m512i new_data =3D _mm512_mask_loadu_epi8(r,
+                                                  mask, new_buf + i);
+        uint64_t comp =3D _mm512_cmpeq_epi8_mask(old_data, new_data);
+        count512s--;
+
+        bool is_same =3D (comp & 0x1);
+        while (bytes_to_check) {
+            if (is_same) {
+                if (nzrun_len) {
+                    d +=3D uleb128_encode_small(dst + d, nzrun_len);
+                    if (d + nzrun_len > dlen) {
+                        return -1;
+                    }
+                    nzrun_start =3D new_buf + i - nzrun_len;
+                    memcpy(dst + d, nzrun_start, nzrun_len);
+                    d +=3D nzrun_len;
+                    nzrun_len =3D 0;
+                }
+                /* 64 data at a time for speed */
+                if (count512s && (comp =3D=3D 0xffffffffffffffff)) {
+                    i +=3D 64;
+                    zrun_len +=3D 64;
+                    break;
+                }
+                never_same =3D false;
+                num =3D __builtin_ctzll(~comp);
+                num =3D (num < bytes_to_check) ? num : bytes_to_check;
+                zrun_len +=3D num;
+                bytes_to_check -=3D num;
+                comp >>=3D num;
+                i +=3D num;
+                if (bytes_to_check) {
+                    /* still has different data after same data */
+                    d +=3D uleb128_encode_small(dst + d, zrun_len);
+                    zrun_len =3D 0;
+                } else {
+                    break;
+                }
+            }
+            if (never_same || zrun_len) {
+                /*
+                 * never_same only acts if
+                 * data begins with diff in first count512s
+                 */
+                d +=3D uleb128_encode_small(dst + d, zrun_len);
+                zrun_len =3D 0;
+                never_same =3D false;
+            }
+            /* has diff, 64 data at a time for speed */
+            if ((bytes_to_check =3D=3D 64) && (comp =3D=3D 0x0)) {
+                i +=3D 64;
+                nzrun_len +=3D 64;
+                break;
+            }
+            num =3D __builtin_ctzll(comp);
+            num =3D (num < bytes_to_check) ? num : bytes_to_check;
+            nzrun_len +=3D num;
+            bytes_to_check -=3D num;
+            comp >>=3D num;
+            i +=3D num;
+            if (bytes_to_check) {
+                /* mask like 111000 */
+                d +=3D uleb128_encode_small(dst + d, nzrun_len);
+                /* overflow */
+                if (d + nzrun_len > dlen) {
+                    return -1;
+                }
+                nzrun_start =3D new_buf + i - nzrun_len;
+                memcpy(dst + d, nzrun_start, nzrun_len);
+                d +=3D nzrun_len;
+                nzrun_len =3D 0;
+                is_same =3D true;
+            }
+        }
+    }
+
+    if (nzrun_len !=3D 0) {
+        d +=3D uleb128_encode_small(dst + d, nzrun_len);
+        /* overflow */
+        if (d + nzrun_len > dlen) {
+            return -1;
+        }
+        nzrun_start =3D new_buf + i - nzrun_len;
+        memcpy(dst + d, nzrun_start, nzrun_len);
+        d +=3D nzrun_len;
+    }
+    return d;
+}
+#pragma GCC pop_options
+#endif
diff --git a/migration/xbzrle.h b/migration/xbzrle.h index a0db507b9c..6feb=
49160a 100644
--- a/migration/xbzrle.h
+++ b/migration/xbzrle.h
@@ -18,4 +18,8 @@ int xbzrle_encode_buffer(uint8_t *old_buf, uint8_t *new_b=
uf, int slen,
                          uint8_t *dst, int dlen);
=20
 int xbzrle_decode_buffer(uint8_t *src, int slen, uint8_t *dst, int dlen);
+#if defined(CONFIG_AVX512BW_OPT)
+int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int sl=
en,
+                                uint8_t *dst, int dlen); #endif
 #endif
--
2.25.1


