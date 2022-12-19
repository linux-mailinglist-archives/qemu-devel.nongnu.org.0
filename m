Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B2650942
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:19:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7CIy-0007qY-IQ; Mon, 19 Dec 2022 04:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p7CIv-0007q8-F1
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:19:25 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p7CIs-00057J-UV
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671441562; x=1702977562;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2Gm2SSmSxRFbhprUG28u+5lvtz1srn4OQWoVC9AyVqc=;
 b=WgiXHPwKI6KcxXKmBCt4VipIW6lgy7h00rfTNh5L0URgnSIwR3O2RiY9
 LMFuVm55lbJndeFyg2fWFNcW8YuelJxclz/lm96UzOn3oIrKMiziOwq6l
 iNFyk+JWPli3wqbGugJP+IgYImcARFEaARBv++k7EF7xIGAnFyyLjOYUO
 2rTJQ1BeqefzZXT+SqMVyTpX8oT0u6UDDcGPHL8likgzKHsVxfXZ7YYNy
 zAALB58f9QotxFBPgAVhdgLNYl/kK5KrrAIfCSjkzN/8nBtF7xrr8QC1o
 xdFJK1ZWWw/ywxwU8p128UBxgTlmzk3F5yee9uHf/V6s4p09FJsumcVFc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="321198398"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="321198398"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 01:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="682951248"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="682951248"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 19 Dec 2022 01:19:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 19 Dec 2022 01:19:18 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 19 Dec 2022 01:19:18 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 19 Dec 2022 01:19:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoCmkMMzlsGZyLiobmb8Dt+eqB6eCjMFmg5xqXmRCILYOD4cmIW91sW9tCD3xwcJ+hCAe6C9UT2TMPQmlpT5iocuJTTgVQiGoy2qtVCSHUjgBqdVoQw3AFgRX8FCvlHK8t/1giLR9nRAoJ1gWEGpMgO/jXpzUICQVkHIxFbVi3RmjTT1b3RfI0Eu3PeSNxsMsGpyNFmV8YhVvW6CpKZql5VcYUTFI0fJuMADb2oHh1I+JW8/i1/arpeVO+4NJNAxfxJgWKp15fkSDEEnQQbpz1DqBF3sIzJE5sG/Nem2oh22sbxmrUCFAcjeYDvSdeAfsQ343r/hF1nesBvPjwOj+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Gm2SSmSxRFbhprUG28u+5lvtz1srn4OQWoVC9AyVqc=;
 b=NFcVN6m9/zeLUjw39eo3CKggj643mtJ5ifQaC3jeS3Rf0FTDQuvzBZ3iHj9Fc8zZTGsphhFbqsvaZfMxGi/dXzppk6dKGAfH+0g5jzqaSKSMO9KVtWVBZDC+vZmOA9zEp/rztj5fIUW16w5b/9n0Rbe5ow4Y6UyptuemAYhMocs5VG004SHCz7Ah+czObnREE5Rrwk7SmJOyjakQpu/kWH8DAiALQH3JD1hctP93ccGMrdLRtWNEB1AaAZXsFTDqN1kYaB+/C/9/hd3WIDhaiej63gVo0SNxcWRAMia+OQAgTrq0pr8LGQWvNKsmkNVVY0nBYDx4upfzDeLu2U+vyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by DS7PR11MB7905.namprd11.prod.outlook.com (2603:10b6:8:ec::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 09:19:16 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3%5]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 09:19:16 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Paolo Bonzini <pbonzini@redhat.com>
Subject: RE: [PATCH] target/i386/hax: Add XCR0 support
Thread-Topic: [PATCH] target/i386/hax: Add XCR0 support
Thread-Index: AdkAvHco0a5CAnUYQy+c+kGSr8NH7wAFo4SAABncpzAB0e1YoAABn9+AAAAL14ACv7QkMAAAfUuAAABMOFA=
Date: Mon, 19 Dec 2022 09:19:16 +0000
Message-ID: <DM6PR11MB409052F90245828F6033A56F87E59@DM6PR11MB4090.namprd11.prod.outlook.com>
References: <DM6PR11MB40909B4A33D66A3100F6D219870E9@DM6PR11MB4090.namprd11.prod.outlook.com>
 <4e35a2b6-12ca-e43c-6ee7-7090280c9341@linaro.org>
 <DM6PR11MB40906BFDB7E263064C1BBC4587189@DM6PR11MB4090.namprd11.prod.outlook.com>
 <04484bf1-c6fc-d430-9939-474c0dab158f@linaro.org>
 <DM6PR11MB40901A46FA5D76F2FCA47E9B87E59@DM6PR11MB4090.namprd11.prod.outlook.com>
 <be555e77-f650-787b-e9a7-6cd92d34234c@linaro.org>
In-Reply-To: <be555e77-f650-787b-e9a7-6cd92d34234c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4090:EE_|DS7PR11MB7905:EE_
x-ms-office365-filtering-correlation-id: 49932d7f-b3a0-429d-2490-08dae1a21a40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o/kLLCcWvryIfv79UfQh0LU8OlUXDId8KJtlA+1QlIgaeT7PO6qyM3Y2qV6HIYbKKktTDEb1MPTGcRMD5UhzlX94EzXhhu77YbojeiikEq5pfKSmgMUjLoVdQuB+ztVNKPyJ9m5xLQHV3G33gp8z1Coz1P/Y3IseBwSv2lCWugMQBOSBhqJSz0BBkMRNKt140UyqZ3NvLLhRZX3pcdbdhZpyaycFUXLzKKSyFVG2pCp2kuXBxajI/ucXIOJH7cJla68HDSa3bMbgyoK+R/iQQmimcyuwGuVEgC8JNHh6WzSCNn2p5GalAR2woxOyPR+sXO+lvDLoEek7ScywaXMBJ9vwHDhFM3lvZVfczWh9+QBPSXakK0JuphDVkUDtBduD8baQoDXiqJ14BNyiuBUjPiZGVh1wgDzqPvTNQTcOPb+P9bdT1LaoCfHYN8se784GTpDGsltAc3db4ojzU7mIsxEc7+LI8eopA7Z2SZx5evridGFWo3/2k1Pbg2MO/Y/B/s+Jm8OpzOFUna+FcnEe61t+RqJ5FXDhGe+sAOu1Yl3/g9/ihZFOJNsU6pVDX13ZP3MYxEfkSzmrcxwH9M6Y6V9hVFKzNc0xt/1JGXAGSbl0ELSw/FcfjNS2g8pDlFJ78u2Bt0j4Xq8eYonaHtuh+yriPOUr5n45njmwtzVzyD31DtWltnFriR1haVZbdDD6T+bOssSGFWSD55Vlo892kQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(478600001)(33656002)(71200400001)(7696005)(6506007)(55016003)(86362001)(186003)(9686003)(66556008)(26005)(316002)(110136005)(66476007)(66946007)(66446008)(64756008)(76116006)(38100700002)(41300700001)(8676002)(4326008)(83380400001)(82960400001)(2906002)(52536014)(53546011)(122000001)(8936002)(38070700005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGFGZ1dHTmk1MG5sOEFVdFErZHNjZXgwMWFGcENoWGVTajlOOHYrUHRDT05y?=
 =?utf-8?B?MWpDR3Vrcjk1QXUyUGY0a2M4K1pnL0htOGF2QWZzN2dTRmRabWd5YzBuS09P?=
 =?utf-8?B?VHJpc2tNZUx2WGE2YkFCRVNGVGFPR014eGhWWDVDN0RWWWZyc3AxRERxbGMy?=
 =?utf-8?B?d1RMckVob0VpQWdQMzRUZHVqQlc4a3hxMTBrcUR0OWtDUzhzZmFvZC9vam5M?=
 =?utf-8?B?d3ZXOWd0RUdabERIQWE3VjZXeUNkZHVqd2NtbTVkVDZ0WlpRT1hmeGh2YmRC?=
 =?utf-8?B?d240QXg2MHdJWENXSEVTMDZwclNFd21vRm5zSTVSSTdDK093WFdGdno1M1Vz?=
 =?utf-8?B?WUJ3QWtpTkJrRmswaTRONERQVmZTeEJWYmFtdWtQdmR1VVRzZDQxK05yaTFL?=
 =?utf-8?B?UTNrS1FxT1YxcmNEeGQrQzVOeHNZK1pPYUFUSVFCVVZTaGl5SURBRElrazBW?=
 =?utf-8?B?YnM2S3ZIMDA3Qzl4bzEwbWNCbnRNZktneWRrd2ZPeVZTRVd2RUl4SXg5cnR5?=
 =?utf-8?B?MVVmbjZFU1lPWW1uTkJlVUd5eHhnc2FiZTAvVi9SajV4cEdvWE1memdNL1Zt?=
 =?utf-8?B?YmJGYlVsV1FWR0pRQjBUclI3KzRQa1FVWUVXeW5aR2Q3SUg1S0tOVGFGa2R4?=
 =?utf-8?B?SXI3YUIwVnRtMG4xNUhjRVd0NkVGcERWWENGSGUzVnhrWWNNQi9tTUNFcUha?=
 =?utf-8?B?SG8vWDVtRTdtZWxDNXhQbFpTN0RIZEJXd3V4Q0k2bmE3a202U252UzJmOWJQ?=
 =?utf-8?B?b25OUmwxUWZleHRvd2xoc3c2U0tBSEZpK1AwL0s1R0E3SjZ4Z3JhS3BkTytB?=
 =?utf-8?B?cHA0ZDBjc2kxSy95bjRnblR4WldMbnBaMHArSkRnaDZtMERpOVdtV0EyVTgz?=
 =?utf-8?B?MG5nZ053RlpZYWN4dDkvQUVwRE1oZDVOSStyOFJPallFckg3QkJzcEptU3Zu?=
 =?utf-8?B?WFJGZkR3S1Y1MEUyUFVQK2l5QjNiQVhDN3BuOFhlSkxYaXZiaC94aDFyUzVi?=
 =?utf-8?B?U3NKV1pSZk9rUndJaVpxdmIzOGhuZjdBNFRvNlQ1N05BaDA4WExLVjJjZmVh?=
 =?utf-8?B?R3dwTHAxRzlpeWZGeklxcEVLUDN3ODdZL0N6UE0ycHNKa0N5NmtLNEhNcVRU?=
 =?utf-8?B?dkYydzZkaWZlNmVYOE9aM3FNc2JzbVFqeHB1V0VYYjZRQXFMUHFOSXIvdVF4?=
 =?utf-8?B?bUlXQk82UkNiTkhadXhYdEszcFV3VnlpNGp4TXRjT3UrVFVlcGZVS3V0TTFx?=
 =?utf-8?B?R1N5ZFdGUzUyYzJuaXlqUG9HSDN6TmVIRzRGdzNaU09ZN1lYZ2gydGlyQ21t?=
 =?utf-8?B?dUUxZmFROFd4aWRoMWZPZllUWk9uZjZ3UDRGSDVtK1N4UFJEVG5KdzB6UWdv?=
 =?utf-8?B?bFc4alFkRWFsMEpXOTdjQ2xQdzRtK2FLZFlpa1gxWnE1dTdlK3hjUWZtUXVt?=
 =?utf-8?B?TnUyMTd1REtKdkI1ZVlLUHJPRUNBUnlKNEIyTWw1ckhXU1VVS0srVS9EK2FD?=
 =?utf-8?B?WG51Ti93YjBKUEJLalpaM3l4ZUpndDFEQ3pDUTZoRUJQcVFqbFFDRERtQ2dH?=
 =?utf-8?B?QSttaEk2SHd0RXZoTHFOQ3pxL0ovVjFud3Y5NDNGWHlXRnd4dmtUTWNGdnVH?=
 =?utf-8?B?MzgxYlEyaldkOHI2cWFheXVnRStXQk5lbkZTVnMyK1l5eTZMM2J5dk9LM1lQ?=
 =?utf-8?B?MGR1dEFPVTN2YVF4cmpnNUN6RFNxTlFjK21Pa1FkZzlZRjhHZGxFWGx5ZHl5?=
 =?utf-8?B?c2xqdDZVMjIzVitvdm5JN3BYcW1SUFhSd2ZHd2d5WGFNU0JyQ204ZDVhS2dy?=
 =?utf-8?B?TWJsRjdVckxleWVYR2drRGovblpBUjc3RUoyTGptYU81VXVMMHlTbFB3QU9H?=
 =?utf-8?B?M09BSVVDOGxraFRDWXZBL211N1ZiZGR3WjNCK05aQzRHSjdIZzJLeXFEd1lZ?=
 =?utf-8?B?K242b0U0dC9XZVZWTGlEVHlaRzZTdmd2L1RnOXNYR29SdFhTc1MyTnBJUW5r?=
 =?utf-8?B?bWh6Z2FKUWF1NkFCbHN0NFdoZHdjbXgvNkVuN1pJbUJDZUNJd081WTNGaHNI?=
 =?utf-8?B?cjU1cUdaQjJRVmx3NkZQdVErUVZOemtrUVhVWUF4Y0ZnLzcwNWhFNEF0bGtZ?=
 =?utf-8?Q?L53eyf5SCfm3luOdIJXBovsso?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49932d7f-b3a0-429d-2490-08dae1a21a40
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 09:19:16.7240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ci71AFKqFAahAADnTOB9NJt80wJy7ASZ6SLyI1V1TvWTDlviXPdXSKx2RQj5LBSDUkOKBrY/0LdcqS82a+bN1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=wenchao.wang@intel.com; helo=mga03.intel.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

VGhhbmtzIGZvciBQaGlsaXBwZSdzIHJlcGx5IGFuZCBoZWxwLg0KDQoNCkJlc3QgUmVnYXJkcywN
CldlbmNoYW8NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4gDQpTZW50OiBNb25kYXksIERlY2VtYmVy
IDE5LCAyMDIyIDE3OjEwDQpUbzogV2FuZywgV2VuY2hhbyA8d2VuY2hhby53YW5nQGludGVsLmNv
bT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KQ2M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJl
ZGhhdC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSB0YXJnZXQvaTM4Ni9oYXg6IEFkZCBYQ1Iw
IHN1cHBvcnQNCg0KSGkgV2VuY2hhbywNCg0KT24gMTkvMTIvMjIgMTA6MDEsIFdhbmcsIFdlbmNo
YW8gd3JvdGU6DQo+IEhpLCBQaGlsaXBwZSwNCj4gDQo+IEFzIFBhb2xvIGRpZCBub3QgY29tbWVu
dCB3aXRoIHRoaXMgcGF0Y2gsIGFzIHlvdSB1c2VkIHRvIHRoaW5rIGl0IGxvb2tzIGNvcnJlY3Qs
IGNvdWxkIHlvdSBoZWxwIHRvIG1lcmdlIHRoaXMgb25lLWxpbmUgcGF0Y2ggYXMgbm8gb25lIHBp
Y2tlZCBpdCB1cCBzbyBmYXI/IFRoYW5rcyBhIGxvdC4NCg0KSSdtIHByZXR0eSBzdXJlIFBhb2xv
IGlzIGJ1c3kgd2l0aCBLVk0gc3R1ZmYgYW5kIHdpbGwgdGFrZSB0aGlzIHBhdGNoIHdoZW4gaGUg
c3dpdGNoIHRvIFFFTVUgKGl0IHJlYWxseSBpcyB3aXRoaW4gaGlzIGFyZWEpLiBJZiBoZSBkb2Vz
bid0IGNvbW1lbnQgSSdsbCB0YWtlIGl0IHdpdGggYSBnZW5lcmljIHRhcmdldC8gY2xlYW51cCBz
ZXJpZXMgbmV4dCB3ZWVrLg0KDQo+IEJlc3QgUmVnYXJkcywNCj4gV2VuY2hhbw0KPiANCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2FuZywgV2VuY2hhbw0KPiBTZW50OiBN
b25kYXksIERlY2VtYmVyIDUsIDIwMjIgMTc6MTANCj4gVG86IFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogaGF4
bS10ZWFtIDxoYXhtLXRlYW1AaW50ZWwuY29tPjsgUGFvbG8gQm9uemluaSANCj4gPHBib256aW5p
QHJlZGhhdC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIHRhcmdldC9pMzg2L2hheDogQWRk
IFhDUjAgc3VwcG9ydA0KPiANCj4gVGhhbmtzIGZvciBQaGlsbGlwcGUncyByZXBseS4NCj4gDQo+
IEhpLCBQYW9sbywNCj4gDQo+IENvdWxkIHlvdSBoZWxwIHRvIHJldmlldyB0aGUgcGF0Y2ggb2Yg
SEFYPyBJZiB0aGVyZSBpcyBhbnkgY29uY2VybiBhYm91dCBpdCwgZmVlbCBmcmVlIHRvIGRpc2N1
c3Mgd2l0aCBtZS4gVGhhbmtzIGEgbG90Lg0KPiANCj4gDQo+IEJlc3QgUmVnYXJkcywNCj4gV2Vu
Y2hhbw0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiBTZW50OiBNb25kYXksIERlY2Vt
YmVyIDUsIDIwMjIgMTc6MDUNCj4gVG86IFdhbmcsIFdlbmNoYW8gPHdlbmNoYW8ud2FuZ0BpbnRl
bC5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGhheG0tdGVhbSA8aGF4bS10ZWFt
QGludGVsLmNvbT47IFBhb2xvIEJvbnppbmkgDQo+IDxwYm9uemluaUByZWRoYXQuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIXSB0YXJnZXQvaTM4Ni9oYXg6IEFkZCBYQ1IwIHN1cHBvcnQNCj4g
DQo+IEhpIFdlbmNoYW8sDQo+IA0KPiBPbiA1LzEyLzIyIDA5OjM1LCBXYW5nLCBXZW5jaGFvIHdy
b3RlOg0KPj4gSGksIFBoaWxpcHBlLA0KPj4NCj4+IERvIHlvdSBhZ3JlZSB3aXRoIG15IG9waW5p
b24gYW5kIGlzIHRoZXJlIGFueSBmdXJ0aGVyIHByb2Nlc3MgdGhhdCBJIG5lZWQgdG8gZm9sbG93
IHRvIGdldCB0aGlzIHBhdGNoIG1lcmdlZD8gVGhhbmtzIGEgbG90Lg0KPiANCj4gSSBkb24ndCB1
bmRlcnN0YW5kIHRoaXMgcGFydCBvZiBIQVhNIGVub3VnaCwgYnV0IHBlciB5b3VyIGV4cGxhbmF0
aW9uLCANCj4geW91ciBjaGFuZ2UgbG9va3MgY29ycmVjdC4gSSdsbCBsZXQgUGFvbG8gZGVjaWRl
IDopDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gUGhpbC4NCj4gDQo+PiBCZXN0IFJlZ2FyZHMsDQo+
PiBXZW5jaGFvDQo+Pg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IFdh
bmcsIFdlbmNoYW8NCj4+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMjgsIDIwMjIgMTY6MTENCj4+
IFRvOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+OyBxZW11LWRl
dmVsQG5vbmdudS5vcmcNCj4+IENjOiBoYXhtLXRlYW0gPGhheG0tdGVhbUBpbnRlbC5jb20+OyBQ
YW9sbyBCb256aW5pIA0KPj4gPHBib256aW5pQHJlZGhhdC5jb20+DQo+PiBTdWJqZWN0OiBSRTog
W1BBVENIXSB0YXJnZXQvaTM4Ni9oYXg6IEFkZCBYQ1IwIHN1cHBvcnQNCj4+DQo+PiBIaSwgUGhp
bGlwcGUsDQo+Pg0KPj4gSXQgaXMganVzdCB0aGUgZnVsbCBwYXRjaC4gQ3VycmVudGx5LCB0aGUg
aW1wbGVtZW50YXRpb24gb2YgSEFYTSBpcyBzaW1wbGUsIHdlIGRpZCBub3Qgc3luY2hyb25pemUg
dGhlIHZDUFUgcmVnaXN0ZXIgZm9yIHhjcjAgZnJvbSBRRU1VLiBIQVhNIHdpbGwgaGFuZGxlIHRo
ZSB4Y3IwIHN0YXRlIHdpdGhpbiB0aGUga2VybmVsIHNwYWNlLCBpbmNsdWRpbmcgaW5pdGlhbGl6
YXRpb24sIHVwZGF0ZSwgZXRjLiBUaGlzIHBhdGNoIGFkZHMgdGhlIHhjcjAgdmFyaWFibGUgZm9y
IGFsbG9jYXRpbmcgZXh0cmEgOC1ieXRlIGJ1ZmZlciBvY2N1cGF0aW9uLCB3aGljaCB3aWxsIGJl
IHBhc3NlZCBiZXR3ZWVuIFFFTVUgYW5kIEhBWE0gd2hlbiBoYXhfc3luY192Y3B1X3N0YXRlKCkg
aXMgaW52b2tlZC4gV2UgaGF2ZSB2ZXJpZmllZCB0aGUgcGF0Y2hlZCBRRU1VIGFuZCBpdCBjYW4g
bGF1bmNoIGFsbCBndWVzdCBPU2VzLiBUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuDQo+Pg0KPj4N
Cj4+IEJlc3QgUmVnYXJkcywNCj4+IFdlbmNoYW8NCg0K

