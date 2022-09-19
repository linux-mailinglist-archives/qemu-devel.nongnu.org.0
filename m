Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B45BD020
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 17:13:52 +0200 (CEST)
Received: from localhost ([::1]:44898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaIT0-0005wS-Oc
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 11:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oaIQ6-0002xG-6C
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 11:10:50 -0400
Received: from mga07.intel.com ([134.134.136.100]:12525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oaIQ3-0000Xt-0P
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 11:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663600247; x=1695136247;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QzLR/jjabOHMP966OK/0XW7O7LmF3tQyKVygwiZ5Cyg=;
 b=WQj2bZpJwz0xQsLD3g5s2jLN6cGf5vUH5YSiharTKgyF4Wh+CLx7ocom
 7IvmfVLnh4U8IxzTIHP9Q13FpGyfUkXN4J7XnXy76IM3UlBCJOP7KpSK2
 mk3wuqbkyoNFz4trvVXlOgH7E/5LPybVI9gWv9PCnQrtUNFvfLh4FEZZU
 YFafYvhqiRVGV2WMUWeq2E4wGHKCGuAVPlwTOVMZd7cB1j8wiIivRXyyy
 jKuk6OHMu3m6ryo4y8W8JVaZEPLOtGSYgJAan9wSKgXpS2KUbkN26Q/G5
 PIsplgASqHxqOgrcJEmukkry6S0uS1S99r+tnzX19VjMx9/Gd5EedZqeN A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="363382255"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="363382255"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 08:10:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="620886131"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 19 Sep 2022 08:10:39 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 08:10:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 08:10:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 19 Sep 2022 08:10:38 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 19 Sep 2022 08:10:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqEn15Yq8h2NfTyp9FfTtxInnVoTlHNArP2g4CafVfG18LqUcEi+JsSbHJuwdF0GxtBtVSPST3am2J1WkI8NIBuMUxCk0PjPqpvto9XW0ZqRQOdVflxKyZMNO/Q+r+UOMX9KvwOBMvJ1RiTxAYzydfTYj4OVvST8zw+NZLwZDjV9qOcBixy/Xa9PuyXCx4GlERukwpR+T9vtTsnK+jvHm2NuOgGji/hKFbWMBE+lkeCMA7lQfTJDV+09Q31sXUlm9b1SWAQAuDh7Oj47PL+RPVME5FWbMq9j5PYpXZJbSMuextsQMovggN000yGwoZPWAr3ScdmCeBftKFgw5i7bVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nr4LOWR5cm44MTxBYvOBBBQaRQ0nvpauLCBjNfFGXI4=;
 b=nIuQZ0wBuiQhHKDn8Et6hVpDqB40k6n/OufFHsRyDRMR/5hvfI3slwDCkOqUFnhRFy5wAPMEm/YllEhweHb3uvO0r15wpYyxuFSBvSlIH06evyOdY4R7f28o5kpofYKgigTr7XS4kNbSraDsJNuLfC4VZjyBF+C0DdsRnqSYa/Ao6tQb03bxeQBnYJ43uosApET6xUeDswKRbZTKtUw9Qnc4op7cIWQ0fLlk1iFjKuraS5+a4ELYM7T9+TbTJa0QrLyisCpMa96PeZGIXlu2ZD3wvbVm8JRGH9k414E4ICJMN0VTgPALDp61ebhLSNI1Uo0dpLjf0nK8AuGuI1zS5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5465.namprd11.prod.outlook.com (2603:10b6:408:11e::18)
 by PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Mon, 19 Sep
 2022 15:10:35 +0000
Received: from BN9PR11MB5465.namprd11.prod.outlook.com
 ([fe80::8d92:e474:8cbf:7fad]) by BN9PR11MB5465.namprd11.prod.outlook.com
 ([fe80::8d92:e474:8cbf:7fad%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 15:10:35 +0000
From: "Xu, Ling1" <ling1.xu@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "Zhao, Zhou" <zhou.zhao@intel.com>, "Jin, Jun I"
 <jun.i.jin@intel.com>
Subject: RE: [PATCH v6 1/2] Update AVX512 support for xbzrle_encode_buffer
Thread-Topic: [PATCH v6 1/2] Update AVX512 support for xbzrle_encode_buffer
Thread-Index: AQHYuTJBJ3WbwW/XWUSAs+dX+/oEhq3mN2Pg
Date: Mon, 19 Sep 2022 15:10:35 +0000
Message-ID: <BN9PR11MB54658EA4FFAB2DDA14156629D14D9@BN9PR11MB5465.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: BN9PR11MB5465:EE_|PH7PR11MB6425:EE_
x-ms-office365-filtering-correlation-id: a42b5f01-796d-46e7-a378-08da9a511a8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JgiTg67HLQIjYY59gwkK6mVcfKJzW57wsMnTjv348S51SGNKgNSN4SyMZvvaeP9F4tgEyVuPN2Q5E643UPNyVi1IYdoOGIvP9LW1dksv1b/Ot2oCD3WGP7YWsvpob+OqVJPFPm+1JdfK0IC6czGgLx/IyFjM2WuUYB9Ze3u3ahMK8o/dfX7TOh02r+VhUWdYypoS/E0EFft4KLwzl3CQ9ktaB+dYP7kIrcUOWM9RLli4DW6vad298XtJ2WT46FMZHuSev52Y/sh79bBOxEpTIzR1JpZbJGS2tQHN1V3W0NCUczG3f7kO9ghtOw2CcZQY2gfkPu04AH2hrPcKKS+VZfS/2heDaMKvBnWwMI5025b8hSPE8CXZoX41bJQ0KxiEMySm1BL7LPQfLY3TzRcegHC98x847pgemLa6vbc6TVS+JySL/wl9R+1NLXpkMF1+nQlkDHLWG/6DAKiUC4Ya3hLK18IfwbAFAuUW52MyxBU78G1HyOOAVDDemmJAKKeL7kgziquktOYy0yFoOw273CrD5m88/DReSdYpBrpAr3QKImBr0EtnP47Cz0Hg2hHGyC8dD0qoJFmzb+MRyo4RA2ReJ6l+jIt+4QEpqYgKSmPjL07Tov2WE22myVury9iLEj7vxR8fy0SKRpKy2aG0iW8GQUblLcbHWSjuJ79RBjGmRwA73FkyasZ1XGg/sec3UfZISvxfza8THEOsVxss8TSFvoTHN1qgRp7kI8sua+VDdDdPA6cCvq2UCJ9p6BkmLgLQUuMEwAGsrMWLjCc5vkSdeemXrz6eykhtkZ0qVx4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5465.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199015)(82960400001)(83380400001)(186003)(9686003)(26005)(122000001)(53546011)(7696005)(38100700002)(966005)(6506007)(15650500001)(478600001)(6916009)(54906003)(41300700001)(71200400001)(107886003)(5660300002)(52536014)(316002)(8936002)(38070700005)(55016003)(33656002)(2906002)(8676002)(64756008)(66556008)(76116006)(4326008)(66446008)(66476007)(66946007)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZhvRSZuT93cmg0u3Mm573FgrJkjM2PTgShe+xIFR35Fbi7Np/CY1lXg3HPTA?=
 =?us-ascii?Q?UUq7VIch3KQP970A+kOd8JDAExa7RwHb4PkkeGMO02G8C6H0Tbmhh+ejifbj?=
 =?us-ascii?Q?ux1tt9mmnnsZLtq4f4U5ap2JZ2MawROU2r+KfTpOQD0YKfbenGjPwV/ILVt8?=
 =?us-ascii?Q?kEHpDwjix3ODfDSU7eONSxbDKk4LfSxmZ3OHajPpilBYbp+y3QELsuJJSOnI?=
 =?us-ascii?Q?fhxghRHaEtCvt00+SRXQeuasfOiYPjh/5mbAM04SQtCXcRter/Vy+ixq/kTN?=
 =?us-ascii?Q?L+csDv8FrJjUAEMs2peq0nYGwPwj9EojIzC4swz6/v1dpEL54Bc5/96kPQx0?=
 =?us-ascii?Q?udAn3ZSIGiCey+VDA0yuiv4FYkjZgso5M8GexnnGIsesBAcr60N5mcknC9Rv?=
 =?us-ascii?Q?9lujBlZjl5O4m20Qgka2TN3QRjzpcdyJEIEuoHbTich+Z22wyXCgYIzgQ1oD?=
 =?us-ascii?Q?2tZcUkqMRF05tGzHPQUvjqIz2dTDyxt1hx6Tsh4i972fL7GHwinahMydBZlD?=
 =?us-ascii?Q?xf5C2Owm8tBvx363ZNiOQA2DRtbJYSu8AxiWbZm0UZ0EqsnHSBH73crbWsRj?=
 =?us-ascii?Q?pIV4JQKgLWfElgNbAISEpbmD6gTn0kjcEwCWtpTSTKusGXlxigokG0GD4X0R?=
 =?us-ascii?Q?E6KRXxLh9LwfK4t2v9D60rKzqQG0CdDwm/njXHRjgNoYOs8vAQ6pYkM/wfu6?=
 =?us-ascii?Q?OE/Gnwp1P+OWXk2uC1ooc2l5eD2MnyBe3UiDgmcEyBm4RRuYYFEGiVXWDxIW?=
 =?us-ascii?Q?J8FlE+EPNgSdVGPvo6587RwA52h8OWYiaMa92iJyge+AVvTsf/Xd0azIZ0d+?=
 =?us-ascii?Q?/r5/ENUPeTitFu3p4mwiYiuoWWBCm1POF/g3qAvm8i8itIOt/E17jJ3ZAYHv?=
 =?us-ascii?Q?UOk4Ut34f+MMcJ9ipWnjOVmCa0stcS0nqiKBxqikLP9lnWliFe6OCvxRlyI1?=
 =?us-ascii?Q?ANPVlxvKOFMKlOvjfSSqgOADG493Ppws0/Zw3h9QGkQqRJ4ri3H421nej+LA?=
 =?us-ascii?Q?gkhU1dRKoZAQKamS2nTEKdSgLOkCtIKW+QBVV37J1o7OW9cDaBM66duLPdPa?=
 =?us-ascii?Q?Wx+NdOUs4Lj2QbN1JhYKXn3MZOq/b16zOi8xCxx1tA6YvEaxLaWyrVvx/HEt?=
 =?us-ascii?Q?5C+G5fi6yi6qriF77VfYxEP36aeyz5myPXsXZT3IjEq7jM7wVPfsnxhFp6vU?=
 =?us-ascii?Q?r0PJW2mPovd6MLsdxPx762iDqidRjccS2tOVZeK9/0FH4SFRefjLU0jVBUHF?=
 =?us-ascii?Q?nScz8J7bcjkAUarpI2zpMj5/A7jIGsV5/wx1hRWkON8JlvOU3OpavMR05Ij1?=
 =?us-ascii?Q?+sUQkehG7cc8QU/giLeri1iSfaMe219fUnHL7EAMRS2vsRTxd8wXRmYbCulM?=
 =?us-ascii?Q?A8oqR//6XaLdaT3cqXO+5z/PljRnA0F5P7RhMG3CX08W7CrdBo7e92iee0LW?=
 =?us-ascii?Q?lB1lC5a1eXVpQoKvS1PuIZ0Sk63jDZnfq8Fl9elGGXxgrNf4X6dxaZshqJUy?=
 =?us-ascii?Q?UaIU0ttHf5K2McjN0hjf4fuMnMfbNM2k2sEJx9uZUb+8qqM124r7ypTX0We4?=
 =?us-ascii?Q?1zIchLZulCq2he8tkEM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5465.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a42b5f01-796d-46e7-a378-08da9a511a8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 15:10:35.4371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cnJls6co7pzep/b8rK77uLPDcND74lSgkF48pgjIDcjEer+xvcC2KQgs2O1q5242SrLE/LEcyYTlgC0bA6HXfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6425
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100; envelope-from=ling1.xu@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, All,
     This is a "ping" email~.=20
     It seems that my patch has been ignored. So I "ping" this patchset.=20
     Link for the patch: https://lore.kernel.org/qemu-devel/20220826095719.=
2887535-2-ling1.xu@intel.com/

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


