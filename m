Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6433B1DCD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:48:09 +0200 (CEST)
Received: from localhost ([::1]:59500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw56m-000656-ES
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lw55F-0005O0-7A
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:46:33 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:36152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lw55A-00082h-78
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:46:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1624463188; x=1625067988;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rKhFCpMSZeCCk1F2rK/CuhalsqStkYW3+CxUyhRw6YA=;
 b=lzwh8bMop+/LKBjv18UZ6/Y83GMaa7Yso4r0mu7fvseKH1dobmRTckXT
 FiKev9KbTuORUh7hC3KK8wZ6KVxmGRO5a6/CO8/iXv46bX9c8MZwcopCY
 hHpDcyAeHImS6VlRcg5Hl2NgCDY13dBDKNRSLuT7xcrkqle6Ky7DDt4bw k=;
IronPort-SDR: VCOX7pz7fjo08ORVOn9OrdTVuQrRZgIRWsGejgDJim3Wh65/U75HQPja1EZmdLDV8FIR1WBmr2
 RZKc7IgXehFd7U7rVA8Vb78rAudp4in0dNMjKvS2PS4NHpHhLtTjW3XeRE0bX69yLLE7Imxvt2
 Bk++N9zu1iHuloeLYGd9Ne8U5UyZ+JUCDwJCtezeT3GfUbZa7sbApmWC6UIiFZuKd50JWPYJf6
 HfHxfcoBy7BFQ3GjJvl/AdqhLvuO/5wQMCHUamgRAMj0RtGJAHw7agDnw1Bk66aEfOxDOAXO+s
 i4k=
Received: from mail-bn8nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.174])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 15:46:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaP0sVYGVhQ07+H1Hn02PH8UAH/+Rwkw7KUJt03RXomzM0l2469e64q81jBL+m0NBmZBVJLjvFbFuK3f8HyzQaoP8AZHpmZX6s4keKODGcppGau2x/0RReWpc8NahrpdmP00M02WqzZlUAd6GPaXuH2CYwqMHx0ZlNoAKySd0sv3QGO4U207GkV3t7qxyIx+KiwTs7JGGPxFEy2bz8g0YMfACJ6d/ETRNJiD6iNvECcOAIDrqjk+Ed1Q9OHFxRjJlKtAZd/N5x8h6mnljy0/AGefqfLjTPf8p2D10hKrvPloLILb+nBbEHQiH466F+c+7hCJ487zj3dMg2G4geQ3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKhFCpMSZeCCk1F2rK/CuhalsqStkYW3+CxUyhRw6YA=;
 b=SbmkyDpx8ecPXIASCR+cVwrzVS69h4onQ2TJatUCevoUEo81FzKgzUF0SHxSX5EZMDT94zYXnyDUh8j8p6Le2lx7mGFrzsw+wlqgYXrvFrJV7goM26kCgXT8ZhpRjPO5RTglX1W+oE6PIf0bEDRzgi5SpWWJgXd6DXedD5E4IRZx54sjbA6DDqeVDdVitjLNtcosKJd49uFPm+kP4slh+iNv8OahFYW9tEeij1IPdzofgd9rujQfZTvhnn0qkEMJ3NoTZX5tmuuq3eUB84zgRywq8SwqHViY3xLTe1Kvt7FPhnEVoB/F0oUTO149fiZNmjNqNF6W/WobOKsZG9Q+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB5590.namprd02.prod.outlook.com (2603:10b6:a03:96::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Wed, 23 Jun
 2021 15:46:22 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 15:46:22 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v5 03/14] target/hexagon: import README for idef-parser
Thread-Topic: [PATCH v5 03/14] target/hexagon: import README for idef-parser
Thread-Index: AQHXZO7AJqIw09nN6k+2R6vMISAIbqshvr1A
Date: Wed, 23 Jun 2021 15:46:22 +0000
Message-ID: <BYAPR02MB4886DE05AED7A197547EE290DE089@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-4-ale.qemu@rev.ng>
In-Reply-To: <20210619093713.1845446-4-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f82106c-93d5-401c-5466-08d9365e0d50
x-ms-traffictypediagnostic: BYAPR02MB5590:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5590400A365AAAD364DF743DDE089@BYAPR02MB5590.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lm6RP0d6a7sN7TppR6zhJ8GyvVH7SNqn+rfmthffXcGEIOZle7lKTb34sWYahN/rT7ylag3tQPeZ01geLxNRMFcxCm24BJsdl8xzIXo0Vl4FJtENAXzPLrdtnXE08LNqlXQ16MmntwjK0GM0vkmkDlF6vEFKOi/tYiksUTbPlOYt0DEDaKzbdNWFxZG/Y3LowQOc1SPBNEBRVHQB+WHYCox2vqM6wRk5XgaKOnLuhI1O0aLaMok/UWeKsaRwgLhllwD6zzJMwyM/bb3UI1sqXZPADXO50Elz/a1M+Fzyz9IX6zNQcEbBumvWeZBdlJMlBFSgrBdIoNlvimHSMp53kwyW0whDOsnwdd0TnPytG+HxmnI4iAodgpRs1U60E+LqVqqBhzxPQMIfTR1bzE6zapyeCD6O/E70XBDU4kfHZrq/+EW1/mFSyI9Th6oGSU93fIRnMf5EpCiV8wcOa06zy8p/KP01oNt2h3aS2bQJQDhZJqkPHI5rfbIRIGlUPXNX8CPzX9jTrJRDuHg42Bf/1pTIIfs83T53u0vinIQZfSNH7PCyqh5O76BsoCF6xxnzpSLqAZOjFz/3t1K49cKb0R1AFCdEU6eYLKOTsCOil4wgOF2PBpTe0mGeJ3TlKA8M2u+fCVw53Xmwx/U94JOrCQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(366004)(346002)(83380400001)(4326008)(66476007)(66946007)(66446008)(64756008)(52536014)(9686003)(5660300002)(66556008)(55016002)(478600001)(76116006)(8676002)(53546011)(71200400001)(122000001)(86362001)(2906002)(7696005)(110136005)(26005)(186003)(38100700002)(8936002)(316002)(6506007)(54906003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHdVbzYxcVIwY2poVEVLSXhPSzNlYmRyOVZoMU05Y3FTNlZ5eTRsbnNQY1g3?=
 =?utf-8?B?bmYxREpwUUtvUUxqeWpveFdIaDNlb3h2Nk1LUWZlQmZ3WHZyNVV1Y2pPS05I?=
 =?utf-8?B?L3VuZWxIeDRpQXJ3S0RBUm9UVUp1RjlBYXRNUlVkc0dENWJXb08zbU5zQ1dk?=
 =?utf-8?B?ejlyWFRHMEE1ZHVFdk0wTFVsSk0xMk12KzlkbGVZUWJ2WFZCRnZxY3k4NDJX?=
 =?utf-8?B?ZTJ0aExTQm9MemlWSWk2YTNSNE1EWTNSTDFwSC9tM0JUV3ZQRG5CSXFvOUdV?=
 =?utf-8?B?Y2t2c3RYUDZYNWRRSFp0dk9DUVl0SjExWVN3T2tSR1QwUnFEQi9EdWYzcndG?=
 =?utf-8?B?MTFsM2w0WjN3anJmWkpRRTZxU1NMdkpYRmMyaUZ4K0l2VzRhbnRYa1BlLzJR?=
 =?utf-8?B?dmJRYzZLNDU2UXY1RFFrb1FSeG5salhLcHNMZnYvSjJsbVNXTHJCcVJya0lJ?=
 =?utf-8?B?cVh6YWlxbE94TjA5bmIrRXc1T0hGS3lOd1NhWlRVM0h5OUkzVU5jT2dqSk9Y?=
 =?utf-8?B?UWMrNGkvZ1owZXhRUHFBNncwdDVaOGxxTlREd25nZkFJVG9jTkpidmI5aWla?=
 =?utf-8?B?dDBZZXNmZnQzRDdiUVFJUkVURHByY3J4YUlRa042RjdBbTN3b0F1V2tGSXc5?=
 =?utf-8?B?bXo5bEZlbmhkZFFqeENLcldCM2pXYll2cXl4NS9uYlY0eWRUd0RTRlk0eXMz?=
 =?utf-8?B?UC85M2VoME1ORUs0bytjbDluNVpQRC9zNHdvZHBxN1ZlL08zOVhUZFJFc0JU?=
 =?utf-8?B?TjEzTFRVNXhqTUxHM0ZiTWNCMWxXY1VKUkVTVXdRb3U2WVJpRmdXczcwNVcw?=
 =?utf-8?B?d09hSVpjWFpJMERpTTFsZmlDa003NDdqSTZSUlY1bzhNR1JuQVU4QjVRcHJp?=
 =?utf-8?B?S29ualJVUnlWSGlveFk5SEVrTWhSeFUwQjI0eFUrQnZRV3FxK2lFckF6NSta?=
 =?utf-8?B?T0ZlcHF4YzBZVVBpbmNJd1E1c1gxaDRnWmtmT2xqUVo4TVNITmRvR29VWXZL?=
 =?utf-8?B?OTVIR0hRWHRhZlhiTXpOQWJ6OWI0bG92Sk9TbWxKRE5UclF2RzRERmFyenBs?=
 =?utf-8?B?K3JrYnQ4bjEzV3RUSUNMcVExNEl1WVRENERYa3JERjViZFRCbnhCYTVNWDNr?=
 =?utf-8?B?YmUyUk1Jcmszc1UyTktSZkRDd1FoZzZDeUxWb2puckMwRmRleFY3a2tUd3dS?=
 =?utf-8?B?dXhvR2lSR28xaklpVnRXc21qSldDWlk0TjhBL2Zha2FOLzJEY1F1dlYzZkx1?=
 =?utf-8?B?K0tRN2x0ZzZJY1l0bXVXZFhKTjRCRnlod0FDcHJSQ0dsdXd1enpxQzk0N0M3?=
 =?utf-8?B?SnlDc2U2SlpSSy9SWHBzQ3BiTmxwditBZGhtaXNJdWpibjlOZkM5MFhLWWg4?=
 =?utf-8?B?YmZ5aXBkcVVOZmVydkNWS1k3OUc1WDF6L1Z3a0ZoakVBb1FuZnZ6eGNoSlJz?=
 =?utf-8?B?Wk9DUmhBMWFSM0dlK2t3SnNyS0QvNElzbUdocHdxZ1Y1UTBFN3VBbzlpRjJ0?=
 =?utf-8?B?NklRQ1czQ0Job1IyQzI2R0pmaS9CWTVESWQvWUZ4dGdZOGZPdDFSNEJaZ1oy?=
 =?utf-8?B?UkxVK2xaQkR2bkgwUW1VNXhndCtwbU11OFVMVEVmSU1lSUlSR2IrOHJsd2wz?=
 =?utf-8?B?aU5ibTNWdWNiUlVOL0lRU2RsVjJZNlN2VitsNHNIcGdrMENlbjdYanY1aWpt?=
 =?utf-8?B?clBMN0xNbm9GcXZOL2RxSStTUXVHK2VJVU5la09pR1JSTGhuQnhLa1RTd2U2?=
 =?utf-8?Q?OvC0r+6MAYi+YhQtoJwdXisKGQ2m/dI0+XW/7bW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f82106c-93d5-401c-5466-08d9365e0d50
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 15:46:22.6470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+e3fZV5xjzaOCHLTrgZEDiasRvEVy9Q87MbvdX/+0BTVVDC4jZs9iGYvVykpyWd9bWnEMq6BVsqD+aR6cPHRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5590
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxlc3NhbmRybyBEaSBG
ZWRlcmljbyA8YWxlLnFlbXVAcmV2Lm5nPg0KPiBTZW50OiBTYXR1cmRheSwgSnVuZSAxOSwgMjAy
MSAzOjM3IEFNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IFRheWxvciBTaW1w
c29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNpbmMu
Y29tPjsgYmFidXNoQHJldi5uZzsgbml6em9AcmV2Lm5nOyBwaGlsbWRAcmVkaGF0LmNvbTsNCj4g
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsgQWxlc3NhbmRybyBEaSBGZWRlcmljbyA8YWxl
QHJldi5uZz4NCj4gU3ViamVjdDogW1BBVENIIHY1IDAzLzE0XSB0YXJnZXQvaGV4YWdvbjogaW1w
b3J0IFJFQURNRSBmb3IgaWRlZi1wYXJzZXINCj4gDQo+IEZyb206IEFsZXNzYW5kcm8gRGkgRmVk
ZXJpY28gPGFsZUByZXYubmc+DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGVzc2FuZHJvIERpIEZl
ZGVyaWNvIDxhbGVAcmV2Lm5nPg0KPiAtLS0NCj4gIHRhcmdldC9oZXhhZ29uL1JFQURNRSAgICAg
ICAgICAgICAgICAgfCAgIDUgKw0KPiAgdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIvUkVBRE1F
LnJzdCB8IDQ0Nw0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCA0NTIgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRhcmdldC9oZXhh
Z29uL2lkZWYtcGFyc2VyL1JFQURNRS5yc3QNCj4gDQo+IGRpZmYgLS1naXQgYS90YXJnZXQvaGV4
YWdvbi9SRUFETUUgYi90YXJnZXQvaGV4YWdvbi9SRUFETUUgaW5kZXgNCj4gYjBiMjQzNTA3MC4u
MmYyODE0MzgwYyAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L2hleGFnb24vUkVBRE1FDQo+ICsrKyBi
L3RhcmdldC9oZXhhZ29uL1JFQURNRQ0KPiBAQCAtNDMsNiArNDcsNyBAQCBoZWFkZXIgZmlsZXMg
aW4gPEJVSUxEX0RJUj4vdGFyZ2V0L2hleGFnb24NCj4gICAgICAgICAgZ2VuX3RjZ19mdW5jcy5w
eSAgICAgICAgICAgICAgICAtPiB0Y2dfZnVuY3NfZ2VuZXJhdGVkLmMuaW5jDQo+ICAgICAgICAg
IGdlbl90Y2dfZnVuY190YWJsZS5weSAgICAgICAgICAgLT4gdGNnX2Z1bmNfdGFibGVfZ2VuZXJh
dGVkLmMuaW5jDQo+ICAgICAgICAgIGdlbl9oZWxwZXJfZnVuY3MucHkgICAgICAgICAgICAgLT4g
aGVscGVyX2Z1bmNzX2dlbmVyYXRlZC5jLmluYw0KPiArICAgICAgICBnZW5faWRlZl9wYXJzZXJf
ZnVuY3MucHkgICAgICAgIC0+IGlkZWZfcGFyc2VyX2lucHV0LmgNCg0KVGhlIG91dHB1dCBmaWxl
IGlzIGFjdHVhbGx5IG5hbWVkIGlkZWZfcGFyc2VyX2lucHV0LmguaW5jDQoNCg0KPiBhL3Rhcmdl
dC9oZXhhZ29uL2lkZWYtcGFyc2VyL1JFQURNRS5yc3QgYi90YXJnZXQvaGV4YWdvbi9pZGVmLQ0K
PiBwYXJzZXIvUkVBRE1FLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAw
MDAwMDAwLi5mNGNiNDE2ZThiDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvdGFyZ2V0L2hleGFn
b24vaWRlZi1wYXJzZXIvUkVBRE1FLnJzdA0KPiBAQCAtMCwwICsxLDQ0NyBAQA0KPiArSGV4YWdv
biBJU0EgaW5zdHJ1Y3Rpb24gZGVmaW5pdGlvbnMgdG8gdGlueWNvZGUgZ2VuZXJhdG9yIGNvbXBp
bGVyDQo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gKw0KPiAraWRlZi1wYXJzZXIgaXMgYSBzbWFsbCBjb21waWxl
ciBhYmxlIHRvIHRyYW5zbGF0ZSB0aGUgSGV4YWdvbiBJU0ENCj4gK2Rlc2NyaXB0aW9uIGxhbmd1
YWdlIGludG8gdGlueWNvZGUgZ2VuZXJhdG9yIGNvZGUsIHRoYXQgY2FuIGJlIGVhc2lseQ0KPiBp
bnRlZ3JhdGVkIGludG8gUUVNVS4NCj4gKw0KPiArQ29tcGlsYXRpb24gRXhhbXBsZQ0KPiArLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KPiArDQo+ICtUbyBiZXR0ZXIgdW5kZXJzdGFuZCB0aGUgc2NvcGUg
b2YgdGhlIGlkZWYtcGFyc2VyLCB3ZSdsbCBleHBsb3JlIGFuDQo+ICthcHBsaWNhdGl2ZSBleGFt
cGxlLiBMZXQncyBzdGFydCBieSBvbmUgb2YgdGhlIHNpbXBsZXN0IEhleGFnb24gaW5zdHJ1Y3Rp
b246DQo+IHRoZSBgYGFkZGBgLg0KPiArDQo+ICtUaGUgSVNBIGRlc2NyaXB0aW9uIGxhbmd1YWdl
IHJlcHJlc2VudHMgdGhlIGBgYWRkYGAgaW5zdHJ1Y3Rpb24gYXMNCj4gK2ZvbGxvd3M6DQo+ICsN
Cj4gKy4uIGNvZGU6OiBjDQo+ICsNCj4gKyAgIEEyX2FkZChSZFYsIGluIFJzViwgaW4gUnRWKSB7
DQo+ICsgICAgICAgeyBSZFY9UnNWK1J0Vjt9DQo+ICsgICB9DQo+ICsNCj4gK2lkZWYtcGFyc2Vy
IHdpbGwgY29tcGlsZSB0aGUgYWJvdmUgY29kZSBpbnRvIHRoZSBmb2xsb3dpbmcgY29kZToNCj4g
Kw0KPiArLi4gY29kZTo6IGMNCj4gKw0KPiArICAgLyogQTJfYWRkICovDQo+ICsgICB2b2lkIGVt
aXRfQTJfYWRkKERpc2FzQ29udGV4dCAqY3R4LCBJbnNuICppbnNuLCBQYWNrZXQgKnBrdCwgVENH
dl9pMzINCj4gUmRWLA0KPiArICAgICAgICAgICAgICAgICAgICBUQ0d2X2kzMiBSc1YsIFRDR3Zf
aTMyIFJ0VikNCj4gKyAgIC8qICB7IFJkVj1Sc1YrUnRWO30gKi8NCj4gKyAgIHsNCj4gKyAgICAg
ICB0Y2dfZ2VuX21vdmlfaTMyKFJkViwgMCk7DQo+ICsgICAgICAgVENHdl9pMzIgdG1wXzAgPSB0
Y2dfdGVtcF9uZXdfaTMyKCk7DQo+ICsgICAgICAgdGNnX2dlbl9hZGRfaTMyKHRtcF8wLCBSc1Ys
IFJ0Vik7DQo+ICsgICAgICAgdGNnX2dlbl9tb3ZfaTMyKFJkViwgdG1wXzApOw0KPiArICAgICAg
IHRjZ190ZW1wX2ZyZWVfaTMyKHRtcF8wKTsNCj4gKyAgIH0NCg0KVGhlIG91dHB1dCBpc24ndCBh
Y3R1YWxseSBpbmRlbnRlZCwgYnV0IGl0IHdvdWxkIGJlIGdyZWF0IGlmIGl0IHdlcmUuICBUaGlz
IGlzIGVzcGVjaWFsbHkgdHJ1ZSBmb3IgaW5zdHJ1Y3Rpb25zIHdoZXJlIGFuICJpZiIgb3IgImZv
ciIgc2hvdyB1cCBpbiB0aGUgZW1pdHRlZCBjb2RlLg0KDQo+ICsNCj4gK0Fub3RoZXIgYXBwcm9h
Y2ggdG8gZml4IFFFTVUgc3lzdGVtIHRlc3QsIHdoZXJlIG1hbnkgaW5zdHJ1Y3Rpb25zIG1pZ2h0
DQo+ICtmYWlsLCBpcyB0byBjb21wYXJlIHRoZSBleGVjdXRpb24gdHJhY2Ugb2YgeW91ciBpbXBs
ZW1lbnRhdGlvbiB3aXRoIHRoZQ0KPiArcmVmZXJlbmNlIGltcGxlbWVudGF0aW9ucyBhbHJlYWR5
IHByZXNlbnQgaW4gUUVNVS4gVG8gZG8gc28geW91IHNob3VsZA0KPiArb2J0YWluIGEgUUVNVSBi
dWlsZCB3aGVyZSB0aGUgaW5zdHJ1Y3Rpb24gcGFzcyB0aGUgdGVzdCwgYW5kIHJ1biBpdCB3aXRo
IHRoZQ0KPiBmb2xsb3dpbmcgY29tbWFuZDoNCj4gKw0KPiArOjoNCj4gKw0KPiArICAgc3VkbyB1
bnNoYXJlIC1wIHN1ZG8gLXUgPFVTRVI+IGJhc2ggLWMgXA0KPiArICAgJ2VudiAtaSA8cWVtdS1o
ZXhhZ29uIGZ1bGwgcGF0aD4gLWQgY3B1IDxURVNUPicNCj4gKw0KPiArQW5kIGRvIHRoZSBzYW1l
IGZvciB5b3VyIGltcGxlbWVudGF0aW9uLCB0aGUgZ2VuZXJhdGVkIGV4ZWN1dGlvbiB0cmFjZXMN
Cj4gK3dpbGwgYmUgaW5oZXJlbnRseSBhbGlnbmVkIGFuZCBjYW4gYmUgaW5zcGVjdGVkIGZvciBi
ZWhhdmlvcmFsDQo+ICtkaWZmZXJlbmNlcyB1c2luZyB0aGUgYGBkaWZmYGAgdG9vbC4NCg0KSXMg
dGhlcmUgYSB3YXkgdG8gZm9yY2UgdGhlIHBhcnNlciBub3QgdG8gZW1pdCBhIHBhcnRpY3VsYXIg
aW5zdHJ1Y3Rpb24gKGkuZS4sIGZhbGwgYmFjayBvbiB0aGUgcmVmZXJlbmNlIGltcGxlbWVudGF0
aW9uKT8NCg0KDQo=

