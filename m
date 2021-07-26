Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8983E3D5222
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 06:04:40 +0200 (CEST)
Received: from localhost ([::1]:48226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7rr5-0007DX-3j
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 00:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m7roi-0005es-14
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 00:02:12 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:61801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m7roe-0006oN-Rl
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 00:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1627272128; x=1627876928;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PShOYYZM+LXCBi6UHLHzRaMllbafn03ONddMGkEc5zU=;
 b=bP+GLlE53y4ppV3PHly8CbglGWOstJobmybDpcAteTQGGojpAcZH0B2S
 dCWZTWDqhfAAho2ez/8R6+Cct/IO0SW4jxbbI/3cMvPZvlET3MwTEL0Rh
 6TO5kyKqBzku0QF98JLS6ZxToGuejZkUQdI5tvDueOUtoR9v5ztLuGf58 g=;
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 04:02:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEvfs21Ns3lxhxhrsNx9KxJZc3RlOY8Cdl5Cl+vGq2slWs1rLDUensqxgbRYoYFC3JKuYU8Y9V3VQUyILZFb+MPIsbHE3jTovNh4SZVLjcxFNR27QSPILoAJYGjPwXstQHOymiGVeTDkJzWgxp1Q4m/GZl5xSxxCG+v2W6sOeMGaZfGDDE78DA669mWfkSiG78z+FB2iAmXLoTiVydnPePt0Ob0vtBSA1/W63fsBa0IxhGEQSM/ZpndbNHsI6fbzdTI3BctdPWsLPMdRrK74wIAUoHE/PHVjRmW904E1y3w2wJ37ye1RT935bMv8WaEGM6UGHIoBGlMjIYbHhxQnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PShOYYZM+LXCBi6UHLHzRaMllbafn03ONddMGkEc5zU=;
 b=fISJbu1x+nzM6DgDupmqsMK3v38dmYGNMSgoXPyp55GCwVjUprtHj6tuR9e0BhzHWATPleo9h3Ere1ofFqDDsuN/qEbdyaYPyrk7yV4CLfbvkyxTIwnD1PIMG90XtLqXg0F+n1ZwcZoaS5t7P6EIUCOBmpWa2IWBM1XMiKCjbK9vvWIpagrMwvdIVVqT7qy+DFYEiY/z6cLgdpPdgsKnNRzQJkmauquNBpX8Hb7MbjPbgksRJiSLR1Kb6nV1+e9+oun6p4lXj7Sbz69UUuuQUDOBGWqXc1WL2fkxjfLuDSGOy8GMaNhKS9Dt8SREbehdTyO14Y5V2Ag2sa2rGp2bzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB5928.namprd02.prod.outlook.com (2603:10b6:a03:123::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 04:02:03 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5%6]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 04:02:03 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 12/20] Hexagon HVX (target/hexagon) helper functions
Thread-Topic: [PATCH 12/20] Hexagon HVX (target/hexagon) helper functions
Thread-Index: AQHXcfZWGL+OPR0tyEucEZTPmQJVP6tTzC2AgAD0HCA=
Date: Mon, 26 Jul 2021 04:02:03 +0000
Message-ID: <BYAPR02MB48868BFDD44F0FAF3CB1963DDEE89@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-13-git-send-email-tsimpson@quicinc.com>
 <2da38c4d-e655-824b-09b5-adc5d630541a@linaro.org>
In-Reply-To: <2da38c4d-e655-824b-09b5-adc5d630541a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 576b365e-513e-4abc-a2bd-08d94fea2090
x-ms-traffictypediagnostic: BYAPR02MB5928:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB59280A4CCA41ADBAD5A3FE87DEE89@BYAPR02MB5928.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:499;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7i+8W7HEFKo+Uw+60nsAnPVSwiQZbFHU2t7pvcKAsBGERBejetx4J7vJsUDr8jUCdPhIxUTzPpmhFOXk9PK/ZhUFguAEW1BqtysppTJX3/7V8JinPNqdpL8MeuSmq+nSz7WklpIJxlh2usfyIZIQPZFR+PHRtNbpIxMobnYUAzTemTMXR4FYZ/QuXgC8Qs6Yn/a+PNKAagpLIBUZRMmFJ7/xyAYtJfzfAxSiMDpMn0LHuXIOJaOJM+zF5fZYEmp+9ocsKxWnFWSfKlJg86ty9gIAf+UIygZgJBvpxSrTrvPLltxXqwKW5BRnrucNZW91ANsAj2oFyjk24Kw1VDSx/qwD4BtLzaZe8f3Na9yhb/d9wLjeD8t10+OxOCsO/nJSJ0yaS2YuoBRTI/i6AfmYlsMniQoz/sYxxAP67yz9cjtHMfYy4P0uoA2Nz3ZXUuwiBnjHPDAKtpLqqVOb5UO8PZvW1fLijAUpr/GEPzDxbA0sYrbUpgdqGXMcgvZZAdPDZEx0Pm2l9nyRENHtkth5m8WiuqF/r/kz9kcoELl/BW/Ut/A6hVePgfw4OUFZDCGmgEmKQn+9KpZCY/c16T0EpMW3rorDpwny/hJZPCQ86R3eUMU7ws3plrJXJxobgGG5StWbZwNa/48ij4XhD/BUYuiCRC+0ERkdCL/yvBEvX2dz5MbGqrog3Iq8LSDcd8TafH5E8PPb6WhSkzxVoWSN8g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(9686003)(508600001)(186003)(26005)(71200400001)(66556008)(122000001)(55016002)(66476007)(66946007)(33656002)(64756008)(4326008)(5660300002)(8936002)(38100700002)(66446008)(6506007)(110136005)(316002)(4744005)(8676002)(54906003)(2906002)(83380400001)(7696005)(52536014)(86362001)(53546011)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1NFWHdKNDliK3lRRFVMOVpLQWN4VDArMDJua09zSlA0eUp0OVVpYnB2VFBC?=
 =?utf-8?B?VHVtSVNlVjdXNE52bmZpK2g2cXBlMzMzd2NpTzRVRCsrYzNlbFpOcDFlR2hm?=
 =?utf-8?B?UVJZbjk0MDhvQ0hmbGN4UVAxVkV1YlNHYy82b1dtVWJFT1Vkc0NzMDlybzBH?=
 =?utf-8?B?am1zd3dpMWoxTHFlSjFVY1JNMWd0RFFLMCtKSUJaSEtvbUFwTDRzaTdOMUdo?=
 =?utf-8?B?SnFjVzMxWm5oV3lXRE51UklpV0N5WVk1dE9vZENVY3ZpaU1NS2JZSjhrMENJ?=
 =?utf-8?B?SG12Z1hCbWdxU0Ziek5wRXJ5T0g2SWVMZTBIMHVjRy9xdkp2OW92cjVBYSs2?=
 =?utf-8?B?K21aUGR4MnVWVGN3OGNEU3hlNkRYa1o1MHR6Z0VyaGlxM0xHWmlBaU4xalZK?=
 =?utf-8?B?cTJBUjBxUnVydExYWTNSS0wrSW5OR3UreWNpRU8xYW54SCtEcjd4bEs5N2Nn?=
 =?utf-8?B?VWRQclU1UmQvSlpraDQwK1BQVHU0Ujc3MHNHbGlTS2tQZ3ZINzZWMGFIdmd2?=
 =?utf-8?B?SXloZzJUZWJIdmo0MEQ5dmNMR2Zqc0dCOWozYlpXR1psMXhJaDFVUXp5Yk5p?=
 =?utf-8?B?UW1mcndZVEp5N3V6eXErTUQ2cTFCOXdsd05PbWxrRnA1bmpjTk1pcnAvbmhG?=
 =?utf-8?B?VG5weFlRN0FkUEF1bDJvV1lvaExWaFIxcXNtRytKSk9WTEFFVWRGcmloWit4?=
 =?utf-8?B?RGhOb2dpQjlDVnlXZTZXTGFLZ2IyRzY1aEQ3eWQyMHBvUTNrbVJ4dDhSN1Np?=
 =?utf-8?B?UnZVeThiNndiVmJqL1UvekdENnd1UlZzZzhReUpkNU5BMThlaWFQUGJoc3g2?=
 =?utf-8?B?U2hmWStOeUpta0syVVFTcVRZeVlnaTNWYmMwWitFc2J4cWpKWkRoVnlTeTQx?=
 =?utf-8?B?U2QyN1FScHdwMU5TU1VDT2Nuc01FUmJCYUtpdHorM3JyUVI3WXk5REJaK0Uz?=
 =?utf-8?B?Z3A3bk1Lc0pJMEE4eGVIKzNKOVhiQmhKT3BCN0RQODNJZU1ERExGRGpHcFE1?=
 =?utf-8?B?QXN2OE1ZKzNEbEp5bDFuVUllUjlhejRlaDlHVUpJN1doNTRIOGo2UkI5Tkdi?=
 =?utf-8?B?THNkazRhWlFkZlZ2RlR0RjNTVXp6aFhDN1Z0TlAyMi93RXkreEpsTWFlanhS?=
 =?utf-8?B?ZDBYeFlHcmV3N3ZwdFl2Ty8xN29sYndCRytCdy9vaVpodUZZak5SbFdRa2ZZ?=
 =?utf-8?B?d1Fod2FhMmRHWU11RGF4cGtycFh6KzlVT09Hdkg5Q3lESVo3c0RlRDZiOVFG?=
 =?utf-8?B?VDdYOGh6RWNGTnJPMDFoaVJTdklOSFZ0YnJKTWFOT0VHSUViQWoyMnRMU0sy?=
 =?utf-8?B?MWllWTRKZG9EcFU2SHNubmNxUW9wRWFsRTBOR0NpU1ZPN3d2OG94Tk02am5q?=
 =?utf-8?B?cGQ0VkNYM1dSZ3FIcGFpQnIweUdMNzd6alYrcjN0Qi9OajZneGpwQlVBZG4x?=
 =?utf-8?B?T0dndlcwS3FIRzBOZlYxSnZuV2NySXVWdVQ3OEU2SndCSWpxREJOWTR3dEJF?=
 =?utf-8?B?b1NmVFhHeEJiK2RaSzI4SmozNWg0SGVYZFlHbUNBL3NOODhhNGZac2VzeS9O?=
 =?utf-8?B?c3FzWW9UMjVXOHFzODBPbXU4ejFsREFMUE1uVy9jVDVUOUtmaVZoVjJ3Q1lU?=
 =?utf-8?B?eitTbnRyTWhsRDMvbjh0T0lmbnljY2I4djJVa3dldWRiMUw2L3B6c1NEL0cy?=
 =?utf-8?B?OHNjbHNPUzhMUmFhc1YwM1IzREE3WU1VZ1A1SEVDSkJVdzNqdENVaEN0dW1Y?=
 =?utf-8?Q?pk4xmA77VGUEN3FgtP3KbIP5vgh1MmJHputGY2A?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 576b365e-513e-4abc-a2bd-08d94fea2090
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 04:02:03.6067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xkXBz2kAMfnPz9UvEcAWUCzQ/b0WbyWseUR1g3aIURtTYy0GVzE1fVbKBdFy9fXB8W75amr0WjdQl5Df1aA4/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5928
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFN1bmRheSwgSnVseSAy
NSwgMjAyMSA4OjIyIEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5j
b20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IHBoaWxtZEByZWRoYXQuY29tOyBhbGVA
cmV2Lm5nOyBCcmlhbiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT47DQo+IHBldGVyLm1heWRlbGxA
bGluYXJvLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEyLzIwXSBIZXhhZ29uIEhWWCAodGFy
Z2V0L2hleGFnb24pIGhlbHBlciBmdW5jdGlvbnMNCj4gDQo+IE9uIDcvNS8yMSAxOjM0IFBNLCBU
YXlsb3IgU2ltcHNvbiB3cm90ZToNCj4gPiArICAgICAgICAgICAgICAgICAgICBwdXRfdXNlcl91
OChlbnYtPnZzdG9yZVtpXS5kYXRhLnViW2pdLCB2YSArIGopOw0KPiANCj4gTm8gcHV0X3VzZXIu
DQoNClllcywgdGhlcmUncyBhbHNvIGFuIGluY2x1ZGUgb2YgcWVtdS5oIHRoYXQgSSdsbCByZW1v
dmUuDQoNCg0K

