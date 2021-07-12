Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABB13C66CD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 01:09:58 +0200 (CEST)
Received: from localhost ([::1]:43826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m353l-0002Ar-RJ
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 19:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m352a-0001W0-3D
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 19:08:44 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:57959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m352X-0000Rv-FX
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 19:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1626131321; x=1626736121;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CUikPvrbxCeeygaTIFBPsXChvJsqCd/33gietMb4ajY=;
 b=fTwcepq95cul1TYU4wxBC7Tv0heT3WbDPOSvNubgCkA7aQvM7B9wgsYH
 LiBElWh3z/RnDMZVrM5KnGitHv6DxX69XFU2vgcp67gW26Y9MNkJgd97A
 SMtWCa564OPzXU7QSfRqjsNK+PdmEJuyNWapYQaTQhTG/tyk3niMzEOvV M=;
IronPort-SDR: f7BDdjp7h2+YNnUpko5Iab4ci4rxOmsRMEZm3Iich2HpfvADKARzuKn5S/eJuwSQFldvbzJ1is
 wdX+RoTFk1Un1QDbowjNqIeXcRhe/z/eslfXamcr2bf1Avv7jrapSyTHspvB83BJlT3F+isLpA
 n6nOd5MMd5jTwdGUuwiszfy7F2ONQG9eGIQ8O73mBHx8Ok5WnCyr5WKUHzEeoFYmEl2hHjemtV
 cT4Kvxq1/lwM+HHumi3YqyVPfwOd3siagpmT+809mugUFF5hJXp92hPIMK8K++R/I+UM4JKVhK
 71w=
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 23:08:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0fpLLcZvkBSWDfGS15cTNitR/J6hWpYGwhJi0tL05FJRUf21bHkUb30LlR7Z9GTCj2tyD13pSeWcbQllP4hftXCiWHlLreBCLgpjjLPa2cR+OqDaSbUNLhkkQPOcabM3ib5VtLTr6CPP65PPV2dXn7F4gadQx8x17PZok4fb63htsmdOiq3xCaFNFr1lvP0lJatcXJLNxkTQ3BQdvYa4XgemFHyzL5e21l8DrPiSxy1huwwVWke8i/uQ9x8nutafwOy9sd9aYIjf/TrkqTTGe4Y8Kg/mFFXVe3Z1KNqJYPZXZPvVeywfWOt5YypSUbQUdLzDH8gJfV1vPQq4921oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUikPvrbxCeeygaTIFBPsXChvJsqCd/33gietMb4ajY=;
 b=k3VYPsi0v1o02qNeiHNsYoT1j4K7CFAy6HQRgBMOoJOlwZW34WC6i43c3Kw1IhmGSmdakBbi30auhufKS2HZtSyJp9q9h+3kWwhe37NJQbSqXeLHku6zawj7Epwsf4pspS+9nhRHYvzeAsW8JrrBopvpUdWlHr534oXRBiXJTlpsHblwSamlV0Hf6yWXcG/lzEFu98OPY7IF8vGue6u8khRX28TNImoTuGEEvC+oU0Cwo7AJYrMfBRMI/biRHtkqH0CinJ4j68xnrrLQJUUZikaGpNiEcnfLRbR40L6FBxR2i7Ge4m95SdA2WxoxjN8zQKLJfnJjxUEwPlU3qwsjig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7310.namprd02.prod.outlook.com (2603:10b6:a03:29d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Mon, 12 Jul
 2021 23:08:37 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 23:08:36 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 19/36] linux-user/hexagon: Implement setup_sigtramp
Thread-Topic: [PATCH v2 19/36] linux-user/hexagon: Implement setup_sigtramp
Thread-Index: AQHXcsGh9619kEzjdUy3Lo29AwtgJ6s/2yWA
Date: Mon, 12 Jul 2021 23:08:36 +0000
Message-ID: <BYAPR02MB48863B351334BAEFC12A9AEFDE159@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
 <20210706234932.356913-20-richard.henderson@linaro.org>
In-Reply-To: <20210706234932.356913-20-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 800a715d-2fff-4b40-ff8a-08d94589fac7
x-ms-traffictypediagnostic: SJ0PR02MB7310:
x-microsoft-antispam-prvs: <SJ0PR02MB7310B93DFE06F5174D9BD8CCDE159@SJ0PR02MB7310.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +JKiAhaHgD7wAcRj0ZbUREX8D8K+8E0tsse5X37cPWlFZ0ByEX/aZH+zMVZHcAABqS6lFuc0CrqR51FNLbcV3/fadWO5rntr1gBjxy4/D/b6tN57eExCXP1jULUtUMDDe8tAdCmS/0ESMkjzy5E+dXRMSt4e+vV51cjfyw4mkk9N1M2IeeqzYFuR+H9Z5ivKEsujyjZ/zeQUWThqhQtt5PICM4LBbmPPCAZAW1Da2lEf8PBIhZALlH1E+vHVNnfE99vrnTJHe8h9buRY+YyIhPoSZ4me/eQHARrKAXHXs7EmvNuTywgxWKggToBtDfAG3i6iLsTFOfw9dw9DSFvGH/6U6rmxYGDkzZk11xwvw+UaTAvkiPBB5ok51von4EbxrYR2bAK1txaLxvFN2Je5LheUToy6ZxlhUqVEMf6t8YGWev0Sy6b0vclhcbpfNvmJo+W8nE4d7MBllcE9EWJYdJOFD+bfiiIw73QwNoZCEfoxDYvn+G5Fi9OSHFW8eCHxQcASesnKmNLG9YmO++LQSu/eTZ1x6kaLGlHze9pjHNuwxwGfLVStXHsybcr1Il0GYA1qvEgSl96kcrSARMD3vV5ejWOGYz9JY1Q9++XALBI5Cwa6asesN94lOrG72jvSJeHgD8kTWLDNG7YgVpyLrg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(64756008)(66446008)(66946007)(8676002)(66556008)(66476007)(53546011)(6506007)(186003)(83380400001)(86362001)(26005)(55016002)(76116006)(9686003)(8936002)(478600001)(52536014)(4326008)(33656002)(122000001)(7696005)(71200400001)(5660300002)(38100700002)(2906002)(316002)(110136005)(54906003)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2FWWFUrWHRlOTlsSGN0ZEd0MGdqbmhGTnNqS0o5TnBYUDVUQU85Wkh3OXc4?=
 =?utf-8?B?T2FYU3podFBkTmZKMk9XOXZSdm9PbVlFc212YmpHa09tY3NtSGQwckNQanlV?=
 =?utf-8?B?S2lvQUIwbXpuaGJhNGx1QjNob3dZVUxhNUtxTWYxZ1V0RFErNTZSOEJ5ZWVx?=
 =?utf-8?B?WHk0RVY2Q0RvTkZCRld3NGdXWWdTVExmaTJhVDRScTVLQTNHVGdqK1YvTE5B?=
 =?utf-8?B?ZWsvcGltcmhaVDFKM2dQeGxsTFVpZU81d3MxaGhVSEJYSU5jZUlld2t2QVkz?=
 =?utf-8?B?UExMejNENWd3RzJqUVFBN1hPMndZNVpIZzdSZFlHSjFIMFNRTy80M1FVRDdp?=
 =?utf-8?B?TWFJbGQrbkJHWWc1MnhQaTRTbEF5NDArV00reDF6NXhndW5GVUthK3gyYTcv?=
 =?utf-8?B?WnZBOEh0S1BmU0JNdUdoU3lVcW5WYk1kUDMzb3hsQzNGM3ZsUlFZeGd6bGw1?=
 =?utf-8?B?OUNvREZmWCt3YXpWY0VGdURpOENyeVgyQlFzUUR5dHZSUzBHL0YwK3Z4L1I4?=
 =?utf-8?B?VFhDSGpXL2JMSkFKZzN4ME5SVEZaVXhuTU5taVM1c2d0cUNvMlRkZlhZYW1O?=
 =?utf-8?B?RnZMdmZIeVVDWFJnYWhHdkcwektsMUtUcWJZa2U3Z1REcGhQMWU4SlNNRnNW?=
 =?utf-8?B?enVJTHpFSjlBeXdFVE9RU3d0UXlqdG85cFJKbm13b016VFdmaEZpVVRIdmlO?=
 =?utf-8?B?cHIwTGNKaWtaTE5jUnUwZFZFNjFlbTVIU29TVldCTVdlUVF0Y2JnUGRDWWhJ?=
 =?utf-8?B?VmJ1Y3VhajVQeHF2TXBSOW5LRHA4cHVuc2EzMU5GbEVmYVgzeFlZdXp5UUFX?=
 =?utf-8?B?OVFaVnhldzNkRzZyZXVUU1FJVFQ4QlNkeHpaQ05aQTB0VUJmaG5rQ1I2MWNF?=
 =?utf-8?B?Y1lWd2Y4bUJtVS9Ba1A4NGdsQkFmNUFFeDFWR0RHSk9YZkYwVzFOUEJlZW96?=
 =?utf-8?B?OXcreFRJanNIckFDdmJJVkZibnRtekZuM0pzdGpyb2pWR3hOWUc2UTVFOUxE?=
 =?utf-8?B?Y3pXYUJBYXhEOGg3WWtCQWJwR1NMQUZmZzc0M1RWWlRTMTZDMklqdWZIYnJR?=
 =?utf-8?B?czdEaElFN1doRXBVTFVpRkZyNDRiMW9QbVBYaFFhakNTZzJnSGNvWjFJbEJy?=
 =?utf-8?B?RVVBQ1VjMmFZNkJocGsyOXU4SHRCNFJFY3hQdDFtQWQrTmxnUENkQ1Z6eS9H?=
 =?utf-8?B?VnRYQTlpdElqQlpXL3E2UkpWRWxDd0dYRXdmNWJ5MGtzUFFOTmJEZHM1K2tp?=
 =?utf-8?B?U3lIQXBxa0s3R0tmRTBHS0xjVDRlWk4veDN0WnJORERoSVVUZUFLKzRKb29p?=
 =?utf-8?B?SHVCSHNsVVAzRWthbUg0SHFQTS9kNXJHTHAzMlJvWFZ3azdCVnFwc2pLUTZH?=
 =?utf-8?B?cjM3ejBrRTk0QVJJck10K1Z2T0FEWG0zSXJQRktydzF3VXZPRHlwQ0x3TG5Q?=
 =?utf-8?B?cDNZWnBiV21ySlVQVXk2d01iTHVVZStDZkFpeTdnSVM4WGJrUFJoVXlrbXRI?=
 =?utf-8?B?Q3hsaGlWUitjQ2JNMUlndGJhSW9XUjVTZDVRMmVHR3JGa2Q0REwyUDVNa1R4?=
 =?utf-8?B?MkJTMVdKdmE5QW5mNkp2b29EekV6akFPVlFvbSsyd3UxQTlCcTl0Z3o4NTdk?=
 =?utf-8?B?VDFXQlphSlVjTlZhbllST1hvS3ByV0dERlNMU0JlbExFMDkxU1gwM0E4UHQ3?=
 =?utf-8?B?NEVMNy9TS2VKY3VVMUhiTXlzWGJNVzB6UVZidnZSdExwWlpXWENvQmdKdWc0?=
 =?utf-8?Q?xlIDWE3gMGU2OZ47xXjrG7PwhiNFjxj6QUAVeem?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 800a715d-2fff-4b40-ff8a-08d94589fac7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2021 23:08:36.9223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w6Aoi4ZFTrfb4CBz+hCL878D1ezfQHEOLKYzY4ZoIQb4BTdyQQF8TV2pvAV3UJPDRRT5ii8Kx+DJlqFo0idE0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7310
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkg
NiwgMjAyMSA1OjQ5IFBNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGxhdXJl
bnRAdml2aWVyLmV1OyBhbGV4LmJlbm5lZUBsaW5hcm8ub3JnOyBUYXlsb3IgU2ltcHNvbg0KPiA8
dHNpbXBzb25AcXVpY2luYy5jb20+OyBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1z
YXQub3JnPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMTkvMzZdIGxpbnV4LXVzZXIvaGV4YWdvbjog
SW1wbGVtZW50IHNldHVwX3NpZ3RyYW1wDQo+IA0KPiBDb250aW51ZSB0byBpbml0aWFsaXplIHRo
ZSB3b3JkcyBvbiB0aGUgc3RhY2ssIGFzIGRvY3VtZW50ZWQuDQo+IEhvd2V2ZXIsIHVzZSB0aGUg
b2ZmLXN0YWNrIHRyYW1wb2xpbmUuDQo+IA0KPiBDYzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29u
QHF1aWNpbmMuY29tPg0KPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0
YnVnQGFtc2F0Lm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hh
cmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgbGludXgtdXNlci9oZXhhZ29uL3Rh
cmdldF9zaWduYWwuaCB8ICAyICsrDQo+ICBsaW51eC11c2VyL2hleGFnb24vc2lnbmFsLmMgICAg
ICAgIHwgMTkgKysrKysrKysrKysrKysrKystLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpSZXZpZXdlZC1ieTogVGF5bG9yIFNpbXBzb24g
PHRzaW1wc29uQHF1aWNpbmMuY29tPg0KVGVzdGVkLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBz
b25AcXVpY2luYy5jb20+DQo=

