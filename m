Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B40135724D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 18:41:32 +0200 (CEST)
Received: from localhost ([::1]:56902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBFD-00019e-Gq
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 12:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lUB1M-0003hh-FU
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 12:27:12 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:52174)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lUB1K-0005Zr-2o
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 12:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617812830; x=1649348830;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rzlLXmNifiZJcnqBePkyUtAzZb5Zlw39tavag3QERy8=;
 b=L6sn1bslGb+b2J47iIIIkeSGd3LNNi1jSvZG/TMYNmPWB+MiKaHXxsXK
 m229rZr/eA42N/k/G24SVbYLmOqcwTbNstsNHd+mhNldCaHFM3wdmRtK6
 Q14slGRyRcEfo7iRSLaPkhUmSb4q2OV2lzfaMwtHCUFEM1f+QaYG/z8xr E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Apr 2021 09:27:07 -0700
X-QCInternal: smtphost
Received: from nasanexm03h.na.qualcomm.com ([10.85.0.50])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 07 Apr 2021 09:27:08 -0700
Received: from nasanexm03f.na.qualcomm.com (10.85.0.47) by
 nasanexm03h.na.qualcomm.com (10.85.0.50) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 09:27:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 7 Apr 2021 09:27:07 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB7091.namprd02.prod.outlook.com (2603:10b6:a03:21c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 7 Apr
 2021 16:27:01 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.3999.033; Wed, 7 Apr 2021
 16:27:01 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 17/21] Hexagon (target/hexagon) circular addressing
Thread-Topic: [PATCH v2 17/21] Hexagon (target/hexagon) circular addressing
Thread-Index: AQHXJqqetCRz+CE7yEq/IPpHZKn00qqoFl4AgAAGB0CAAStVYA==
Date: Wed, 7 Apr 2021 16:27:01 +0000
Message-ID: <BYAPR02MB4886E9354030F26FCB57C713DE759@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-18-git-send-email-tsimpson@quicinc.com>
 <365724a7-1013-e04a-43b1-dae87103fcd1@linaro.org>
 <BYAPR02MB48868074F14C421E3D07AEB4DE759@BYAPR02MB4886.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB48868074F14C421E3D07AEB4DE759@BYAPR02MB4886.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8cb6e3f-5d21-4a4a-b1f4-08d8f9e1f95c
x-ms-traffictypediagnostic: BY5PR02MB7091:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB7091DF18845149AE7B8714B7DE759@BY5PR02MB7091.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WotQ1qSIS7RcPB70CvYnKbqtu9i+OXGOf68np+fnNIyKpKJmw/78vMDiQk+wmujEjvmB62ryu4D1/surZl9Le2PtBKXifxHOUyMxABsErUtGdODyxoY9eK5mjkyhmdX3ZKB7sI0OW26R4H4kWwpldFaHkZOWjrcDRVvF2pNypwPzGWnOudX05cmJzCpmyDIfXRIIzyTQUWfSKj22xgr/NpvoVg+YH5eY0Ylod3slV35mbJkZxK9+frV2NN5UeTBDAt8rnCd52epteIOpmFBCM5tWKsk5UZvh4+4bRqMWrEtkry7+u/zwnnOKd8gwpFia0nsN7QxmpZTPTHfXMZqr6oP2P9DXJVMTsUL5E38AU9hq1+LTGwpivksLf3YkjZR334BNF00PO8W2MqjL0pbvGKMbkPaliQcGzRR2LRsDE3+/Vrr3Y+XOeDAHeVnQ9PRuiavPYEGnw9l77UyAerpDEhX4ViKkGIqiyfnErzWZrGpSRJ/fMhHiDncZWiFhwDMGrUJKaRzeiUU1KUSxS4R560rhOZDI4v2FxxUBxx6+lbr0tQGy43FoVZ8uUrJLDE/lL1pcG1EHcbQIZ22hs1LmC8yNx13nh76zbhOfsa8+kSmlqNtRDWwFspK/n0dZqEGlBgAi5zLtxAoqnT26gadJNmG3iWgaw4UB1tYZj8xRHoU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(66446008)(64756008)(83380400001)(52536014)(2906002)(71200400001)(9686003)(5660300002)(66946007)(76116006)(66476007)(66556008)(33656002)(55016002)(54906003)(26005)(186003)(2940100002)(86362001)(478600001)(8676002)(53546011)(110136005)(8936002)(107886003)(4326008)(316002)(6506007)(7696005)(38100700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?a2Z5UkEyeGNhcm5RQVF1RzZMZndVQksvS01TcTJEQUtWeTZUMGxsMkJReng5?=
 =?utf-8?B?Znp6UFBBTFNMenJaZXRNaHpZM2l1TGxNSmlObHB4ME03dHZDdWVwSThIaElS?=
 =?utf-8?B?aVJ1WHdqaEFaVlBBRGpoNzdVbzkzcFVZK083bXZFQVRzbk9OTFFNR2lIb2hr?=
 =?utf-8?B?UVJSQmJ3ZnlKd0U3ZVdOUnVlMGRIYnQwWE0ybnkvRER3RlFhYUk4R1JiaTF5?=
 =?utf-8?B?TDhIVjN3T2dmYnBKZmJHckVVMWx2b1M4UG0vTS93QmR0UGlKRVNld2JNazY3?=
 =?utf-8?B?U2hVSVdKYkloVmJDTFhYdng1NHRLRmhnbXFEMzhNZlRFam9qVEhJSzdHRXds?=
 =?utf-8?B?NmZudkovTGFDSExnV3IyU2VHdFpFN0tGTXRtbHRFVnQxMTFZMFVYSC9vbkdX?=
 =?utf-8?B?eTYzcnBDRnlpQlp2RWhsTUlrQVkxY3Q0VW5Ed3l2bVlIOENSWFpmN21xMzF2?=
 =?utf-8?B?bWNGeTI4TlovMVdIY3U4TVp5bDlncGthNDVneVM3dWlIT0lyNFRCR25FampC?=
 =?utf-8?B?V2xnNWVKZzJyZVo2SGYrS2FiNnFsc0diQTJBdzNPVXdQSWVGQmJyUUt4Unht?=
 =?utf-8?B?Wi85WnZ6eU1tWGpFY0RQVXVtN1EzdWJyejdHRGRnZ3BFS2ZrS3RYelAybFhl?=
 =?utf-8?B?YUp6Q1hxa0IrTFdtS0toUFhPcGNIY2hJeXFEazYwRnRnRVdvOXVMUmY5eUxu?=
 =?utf-8?B?bk1GYndBSHJVS2FOU2lEODFoQWZoM08xaE9QN09RbEN0RXdTQlpER3dRamov?=
 =?utf-8?B?VVNEdndVSjltai9JelRhZUF1NmJwM200MXQya0p2ZW1Hc2Y0eWdmelNBcjZL?=
 =?utf-8?B?ZEZ3LytWcnBkRWtMN1B6dFpXbWZ6ZHZuWDM2ZHVXK0tBRUZUcXV5bXQ4bjRX?=
 =?utf-8?B?TmhXL3NWaCswbW5MVUpaK0tsRWFYNkpWYzUvUWxkK1doeUZ1emsyTnVnYWlK?=
 =?utf-8?B?eXRyY3FaeGx4ZWtJeGFkcEdoV0Z5OVY2Z3JMSkFCaVMvcHA5akxNWllOeGxW?=
 =?utf-8?B?UW43bEcwYlhZa0w3Q2FxRUd2TFlTRG93Rnc1ZlR4UVl2VTIyWXphejVWUjA0?=
 =?utf-8?B?cE8vdFZCcG8vVm0yT0dJVFFUb3ArcEVCdmw1alFYR2tnS09reUMzRG1oVTJz?=
 =?utf-8?B?L2ZvTS9kamZ4T3h5Y2RIVFViRjhEcnRkaWFMcGhFV0lONTIwUWd1dHJXbVFr?=
 =?utf-8?B?TlJKTmVPSVBzQlZjUzE5OENNQ08vVjl1cU4vSEZiVUhnRkovSDNWZ01SbVJB?=
 =?utf-8?B?Rm0rQktrU0YwYURGSzF5M0t0VlVRaVJ5bnFGcW5TZVhjRFBCanU3dkVDM2g4?=
 =?utf-8?B?WWdxV0ZJKzJ3RitEMXIrSHFHTEdUL1VRMHB3WWI0Tml2TndEMytOMHo2N25a?=
 =?utf-8?B?b1BuVlFDU2UrWCtsUEhvSldlUk84SmIyTGNEL0l2OStCZHplcjIwTGJnVWxT?=
 =?utf-8?B?ZVpZeXJkdkx5bnVnbGVydE82NDBXZVVhdU5TbTRzVUxKdjhaRWgvU29UTDJa?=
 =?utf-8?B?anlROFp0dzdVb3Nwb3g1M2k4bkpTcUJlY0ZVNlJqYUE2S2xNU0dzcFNCMWs2?=
 =?utf-8?B?MUo0bjh3amd1TFZPRmhtMDVUTTB1MjVJZDZEUTVQQndVdWxJcVJVaENaL1VJ?=
 =?utf-8?B?enAwTFVXQXRjaVJGTHI5eHpZYmJTSSt0UVNiWk4xV0ZHRkszZDN6eStGRVJE?=
 =?utf-8?B?bTUyMGZ3cENZY1FWb0N6Y2pVNnloUWpsTk1EZWRENi96TjNWTGk1Wm04RGJD?=
 =?utf-8?Q?pzA+AhKcggm1z1N/9iCLFfkjfCQLQsnyTv3jrNQ?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2Vpo6wxIeNpsl6/TSoRRprCcEirgbW7FFpFojGKittrs//FH7RZkTa0L3wR0hco1xVAMGRdW+HGPMnNui6CTqVDIyhifRwuoYothifufk8NUaYo4ICFfovrFoDho8NjCX2jkkDA/CWuINBke+ooc3KYRRNmW5whdHhLlZ6Qk4QK2KUMUgvDLgfZ1KERY8oP1UOJGkZaXMb1siYt4eaSUXTAH7pWGhBVR+k+jnGIHJnHLx/JozV8gNAkKJ72sGGj020p+WHZsClFOgDI2DaUAOOU/FCdO9vnphza3289Dgo/cvUKjSCGGeqsJlpBMkDac/nuUwGaEg5XeKkLZBL93g==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nidh8aRE5SIVXh0Dl8ESGeCcUXZ9SdIZOjC3GnEtRDQ=;
 b=oIGwn9gkeq8Y9/pe7YqYF2kI7mk1fOggNdlN24iddrqTwmTflGgmPaXZWI1GtJOPuaug/Rw4cLOCtDP/sNQELI12NnwGYd5U1R/o/fG52BAEa34K9SAYt/jx5R5Yrc/HFPGM9GdB4ltk2Zaa2XNzypJTEOEfdmdpiSs91DJuvMyiLUTkUkHa1OgT1FWrcunoPqrkmvjuE7n259fyX4besz/rUypxya6mB16GmsafGpZPoIyEbJfrApCFYG0dOBHxBvE52HsLZDdQXTZ8uNqDW4o+6P6JGMXaZ+AoNsOniYmqpANFkLBjUMiALcPHLuk1Te4Ry62nQOOmLiFQ8Islcw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: a8cb6e3f-5d21-4a4a-b1f4-08d8f9e1f95c
x-ms-exchange-crosstenant-originalarrivaltime: 07 Apr 2021 16:27:01.8045 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: oyW+WQO5wtrhEtmtFmLwX9iOhMybzWTokfbnYhsNDzbmFJkl1F4BEf6IyEKTUgo/+YTv0O1/puAr+YNNA1ao8g==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB7091
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGF5bG9yIFNpbXBzb24N
Cj4gU2VudDogVHVlc2RheSwgQXByaWwgNiwgMjAyMSAxMDoxMiBQTQ0KPiBUbzogUmljaGFyZCBI
ZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+OyBxZW11LQ0KPiBkZXZlbEBu
b25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsgYWxlQHJldi5uZzsgQnJpYW4gQ2Fp
biA8YmNhaW5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjIgMTcvMjFdIEhl
eGFnb24gKHRhcmdldC9oZXhhZ29uKSBjaXJjdWxhciBhZGRyZXNzaW5nDQo+DQo+DQo+DQo+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBSaWNoYXJkIEhlbmRlcnNvbiA8
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gPiBTZW50OiBUdWVzZGF5LCBBcHJpbCA2
LCAyMDIxIDU6MTIgUE0NCj4gPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+ID4gQ2M6IHBoaWxtZEByZWRoYXQuY29tOyBh
bGVAcmV2Lm5nOyBCcmlhbiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT4NCj4gPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYyIDE3LzIxXSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgY2lyY3VsYXINCj4g
YWRkcmVzc2luZw0KPiA+DQo+ID4gT24gMy8zMS8yMSA4OjUzIFBNLCBUYXlsb3IgU2ltcHNvbiB3
cm90ZToNCj4gPiA+ICtzdGF0aWMgaW5saW5lIFRDR3YgZ2VuX3JlYWRfcmVnKFRDR3YgcmVzdWx0
LCBpbnQgbnVtKQ0KPiA+DQo+ID4gVGhlIHVubmVjZXNzYXJ5IGlubGluZXMgYXJlIGJhY2ssIGp1
c3QgYWZ0ZXIgaGF2aW5nIHJlbW92ZWQgdGhlbSBpbiBwYXRjaA0KPiAyLg0KPg0KPiBUaGUgb25l
cyBpbiBnZW5wdHIuYyBuZWVkIHRvIHN0YXkgc28gd2UgY2FuIHN3aXRjaCBiZXR3ZWVuIHRoZSBv
dmVycmlkZXMNCj4gYW5kIGhlbHBlcnMgYW5kIGV2ZW50dWFsbHkgdGhlIGlkZWYtcGFyc2VyLg0K
Pg0KPg0KPiA+ID4gKyNpZmRlZiBRRU1VX0dFTkVSQVRFDQo+ID4gPiArc3RhdGljIGlubGluZSBU
Q0d2IGdlbl9yZWFkX2lyZWcoVENHdiByZXN1bHQsIFRDR3YgdmFsLCBpbnQgc2hpZnQpDQo+ID4g
PiArew0KPiA+ID4gKyAgICAvKg0KPiA+ID4gKyAgICAgKiBTZWN0aW9uIDIuMi40IG9mIHRoZSBI
ZXhhZ29uIFY2NyBQcm9ncmFtbWVyJ3MgUmVmZXJlbmNlIE1hbnVhbA0KPiA+ID4gKyAgICAgKg0K
PiA+ID4gKyAgICAgKiAgVGhlICJJIiB2YWx1ZSBmcm9tIGEgbW9kaWZpZXIgcmVnaXN0ZXIgaXMg
ZGl2aWRlZCBpbnRvIHR3byBwaWVjZXMNCj4gPiA+ICsgICAgICogICAgICBMU0IgICAgICAgICBi
aXRzIDIzOjE3DQo+ID4gPiArICAgICAqICAgICAgTVNCICAgICAgICAgYml0cyAzMToyOA0KPiA+
ID4gKyAgICAgKiBBdCB0aGUgZW5kIHdlIHNoaWZ0IHRoZSByZXN1bHQgYWNjb3JkaW5nIHRvIHRo
ZSBzaGlmdCBhcmd1bWVudA0KPiA+ID4gKyAgICAgKi8NCj4gPiA+ICsgICAgVENHdiBtc2IgPSB0
Y2dfdGVtcF9uZXcoKTsNCj4gPiA+ICsgICAgVENHdiBsc2IgPSB0Y2dfdGVtcF9uZXcoKTsNCj4g
PiA+ICsNCj4gPiA+ICsgICAgdGNnX2dlbl9leHRyYWN0X3RsKGxzYiwgdmFsLCAxNywgNyk7DQo+
ID4gPiArICAgIHRjZ19nZW5fZXh0cmFjdF90bChtc2IsIHZhbCwgMjgsIDQpOw0KPiA+ID4gKyAg
ICB0Y2dfZ2VuX21vdmlfdGwocmVzdWx0LCAwKTsNCj4gPiA+ICsgICAgdGNnX2dlbl9kZXBvc2l0
X3RsKHJlc3VsdCwgcmVzdWx0LCBsc2IsIDAsIDcpOw0KPiA+ID4gKyAgICB0Y2dfZ2VuX2RlcG9z
aXRfdGwocmVzdWx0LCByZXN1bHQsIG1zYiwgNywgNCk7DQo+ID4gPiArDQo+ID4gPiArICAgIHRj
Z19nZW5fc2hsaV90bChyZXN1bHQsIHJlc3VsdCwgc2hpZnQpOw0KPiA+DQo+ID4gVGhpcyBkb2Vz
bid0IG1hdGNoDQo+ID4NCj4gPiA+ICsjZGVmaW5lIGZSRUFEX0lSRUcoVkFMKSBcDQo+ID4gPiAr
ICAgIChmU1hUTigxMSwgNjQsICgoKFZBTCkgJiAweGYwMDAwMDAwKSA+PiAyMSkgfCAoKFZBTCA+
PiAxNykgJiAweDdmKSkpDQo+ID4NCj4gPiB3aGljaCBoYXMgYSBzaWduLWV4dGVuc2lvbiBvZiB0
aGUgcmVzdWx0Lg0KPiA+DQo+ID4gICAgICB0Y2dfZ2VuX2V4dHJhY3RfdGwobHNiLCB2YWwgMTcs
IDcpOw0KPiA+ICAgICAgdGNnX2dlbl9zYXJpX3RsKG1zYiwgdmFsLCAyMSk7DQo+ID4gICAgICB0
Y2dfZ2VuX2RlcG9zaXRfdGwocmVzdWx0LCBtc2IsIGxzYiwgMCwgNyk7DQo+DQo+IEdvb2QgY2F0
Y2ggLSB0aGlzIGlzIHN0cmFuZ2UuICBUaGUgdmFsdWUgZ2V0cyBwYXNzZWQgdG8gYXMgdGhlICJN
IiBhcmd1bWVudCB0bw0KPiBIRUxQRVIoZmNpcmNhZGQpLiAgVGhlIGNvZGUgdGhlcmUgZG9lcw0K
PiAgICAgaW50MzJfdCBLX2NvbnN0ID0gKE0gPj4gMjQpICYgMHhmOw0KPiAgICAgaW50MzJfdCBs
ZW5ndGggPSBNICYgMHgxZmZmZjsNCj4NCj4gSSB3aWxsIGNvbnN1bHQgd2l0aCB0aGUgYXJjaGl0
ZWN0cyBvbiB0aGlzLg0KDQpOZXZlcm1pbmQsIHRoaXMgZ29lcyB0byB0aGUgb2Zmc2V0IGFyZ3Vt
ZW50IChpLmUuLCB0aGUgbnVtYmVyIG9mIGJ5dGVzIHRvIG1vdmUgdGhlIHBvaW50ZXIpLCBub3Qg
Ik0iLiAgVGhlIG9mZnNldCBjYW4gYmUgbmVnYXRpdmUsIHNvIEkgbmVlZCB0byBmaXggaXQuDQoN
ClRoYW5rcywNClRheWxvcg0KDQo=

