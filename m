Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D04042040D
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 23:18:21 +0200 (CEST)
Received: from localhost ([::1]:41036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX8sF-0003Ly-QF
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 17:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mX8rA-0002Fs-Rb
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 17:17:12 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:51762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mX8r7-0001Xu-Up
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 17:17:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1633295829; x=1633900629;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B6txsWP2N/JfZP3g4u5xbDnw3WKKBu2A8ghpMCVQqOM=;
 b=yZ+zaU0f9YzMgp54l+71CDt5DfXZtbGrMTdyn1+DWNPbQm5qVlvirr9q
 xVahKw2GxB7LofFWC46hUsDhuAUsU944AWKKTOYZZkmxVHvrXsT+VU+hV
 D9kuH7stmpuSsXVIs9BasFqnEH+c7baS7KlreG2moUIVUQszH7r7PrK5h c=;
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2021 21:16:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYg0rc3V271ytqAvWS3Sw74ISKV3polvdd+SF0LwbeS+rbhfKImy4T3JiqIBu1NSHfK8VB3uAUeUO9whsgOIk97L2UZ/w9Ps+CFyUWEQh8a3V11Y5o0HUGzhAo3q1JTu3X9vRzG/MxpIuda9ZTqm2EHB6cYPRnT8M7gQnno/JjdtKK4PyeaXMVWSZWtctbnncbrefljfqwWyPZs/U2YxQ2sbBeaMVLDcZfe+LDmRQXwdvXcUIu0E1IdkCNXXdrFSagOskaFynzYPllJF34CaB+vRFOX3CYIv4hnACJ/PcIGDSR4S0VefnnRCEfB8IiMGDYy2wUFu9EFP+Y80PTYfdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6txsWP2N/JfZP3g4u5xbDnw3WKKBu2A8ghpMCVQqOM=;
 b=P7ONNLlXg+678G3zNcBt/Q+FqZXwkwqCxrQMMJuzKxAv4sJJmaFHTWe5SThWkECSXdl5/2u82r2277E9A+6Q9xMgtz/C82eWfNkYvWkKhn6ckQF4b1+VuTFQnNhlKH6aXUrWQoRDmK360LEvOlqZ5H5iC1w8SiwNwWP1pjNlvF9K/LFzs78/y+X5r8ZAfCrbY8DmxAt7zXMRH45zaLf9tC/v7S0SAcEyZHgZqEoeRDTLXb/cWMQaD7yvqrcARNLAWVFJhP2k1+Cv/d9JP0XkPTo1BwgaCbkjD/u+m1+UD1wRY2sF3dAmJieZ2Vt3Jl0OPaPd3RcteXapNHnwU/WORA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB4895.namprd02.prod.outlook.com
 (2603:10b6:805:8f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Sun, 3 Oct
 2021 21:15:58 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::7854:5fd7:d358:e0d9]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::7854:5fd7:d358:e0d9%5]) with mapi id 15.20.4566.022; Sun, 3 Oct 2021
 21:15:58 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 1/2] target/hexagon: Remove unused TCG temporary from
 predicated loads
Thread-Topic: [PATCH 1/2] target/hexagon: Remove unused TCG temporary from
 predicated loads
Thread-Index: AQHXt/B4vJVjWceBqUmqZuI3fB9JoqvBx6bQ
Date: Sun, 3 Oct 2021 21:15:58 +0000
Message-ID: <SN4PR0201MB8808B4408B563108C9C27E26DEAD9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211003004750.3608983-1-f4bug@amsat.org>
 <20211003004750.3608983-2-f4bug@amsat.org>
In-Reply-To: <20211003004750.3608983-2-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85a238b0-ab2c-4298-66dd-08d986b2febf
x-ms-traffictypediagnostic: SN6PR02MB4895:
x-microsoft-antispam-prvs: <SN6PR02MB4895F8F8AE6A06B5E3A51B50DEAD9@SN6PR02MB4895.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:309;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZD7rOVJzsRQDC6DRCBoAsv9Zh+EJF0/CnrvOgIkZ91GlM0yCsm7I0SvYYSNUwUJyQo6YMjlzGtlCbZyZ29jNmJL6M148/NEU3KdVwD4fM4ohrGEHKPIJqax9KVyu1jfqHoyBfI7GIqdBXVUKm6b8FihB23TIjLEJHUIA3uyPLqzPhTzuH0n65D75+TREbEmB8eBnw2K7Tqo4q2lwcjd6aT9k4zlppk+ylGUC9hRallYDTokCVIIqCHTAE62oxQMabClLo0aIzbTI6TdeR6a5XH0nSXHEKe6/m48GMhGgVYUGLLcGoJoGWpMmGvxI3weI63Xnm3UQ7/XJ4o39oCFQv+EZqzJqQYgaUNqVRd8UYSlN8TQ2T/GHy1kBzvPfMn8TYDwI8A9lyjHavgvbl/p88jjJ6znFHjOWBIrDJxteXcR/h3nc4PKaV3UWlOqoyLfhh95TUawZS5jtwB57CBWU7iP7DUkjwAe86XOllhG1l3KtOMLW5fgK9WkG60VYeE+M+3xdCvlWYdoajS1vlaaBsPpTg6lpJID1JY/OSl5tcq0g+6MSQ1c5l9IC1x6sTALgWkWzsqAHsvst955Tc/53yym+WUW5iE5xJWdOs20P9G6P/u2Zbg09bpAFayDBNMg7S+S969lTqb8jEU2tSEG3U1TguJB8SWZGIm7BS/1EB1t14y473dkCavrzOq1JVfoneyF/OW/ORxSVrcDCicR+Mw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(64756008)(55016002)(52536014)(76116006)(66946007)(186003)(66446008)(86362001)(26005)(9686003)(66476007)(4326008)(66556008)(71200400001)(83380400001)(122000001)(38100700002)(8676002)(8936002)(33656002)(7696005)(316002)(38070700005)(508600001)(2906002)(5660300002)(110136005)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVZkTU5FcWp0Z25Ybnl0bzhCRVYzam1TclhDdU85UnpldFd6N2Qzd2Nydi9J?=
 =?utf-8?B?UHBsVzZDUjFmR3VKakVmL2dVdG1yNHZYU2JIeEp1bkFOcFM4ZTd1VkF5RU93?=
 =?utf-8?B?Y08rM2FlbDNyeHEyZlZnb1hEcitRcjVtaHlqaDh6QzQ3aGdVWnNhTlZYUnFl?=
 =?utf-8?B?UmR0ZUk1VGZvbmJJcS96VzhaTkg2cDRlOFlVMWl4a05PM3FEK1pGSUhBYW9W?=
 =?utf-8?B?UVRTN1M2UmpHc09FRlVxOHgxU3grem1MVjJHdWRTT25vZ0ZscDV2bUlUdXAv?=
 =?utf-8?B?RXNGTEFTTC9LanNFck1KUU5weCtWY0k1a0hYY3V2OVRtaS94TzQzQVpScU5T?=
 =?utf-8?B?ZmRoZUFtMGQxVkZOcW54WHRMWDdHSkVOYng4V0FuZUJhNS9aUU9manFrTUlh?=
 =?utf-8?B?bnBYVWIrVnZ1UUF5cmduK0VSdnM1d3QrQjYwaVE2cnh1ajNBeS9RSVlsamlj?=
 =?utf-8?B?V3pwZUI0TUV5ZCtya0ErRXRkck5BNmZqRW00TUo0V0xHV2JaVFVsOXdwOFg2?=
 =?utf-8?B?UFJ3SXBzVjhUZ1BVaXlOYUpFZXpsa29kWFRONW1LeGhUbUluNkh6SUkzMURM?=
 =?utf-8?B?Tmg4OW1hSjU5VFNiQ0xqUlZwSUJvZlFpYU0xS3Y2RmZsL2cyR00xaWc5Z2Np?=
 =?utf-8?B?YzZ2VEpsTEUzOFpGS0drTU5IS1pHVSt6WXo3dHZmb05HcXh6ckNoV1R3NEl5?=
 =?utf-8?B?SXZuem9HcDFacTgvTHNpUFpCSFpVTk1NY0Z2NHhGRnVkRStHbHNSQ1VEWXVV?=
 =?utf-8?B?blloUGlVT2t4b1o4UmdNNzRqS0dHVmphQVNTbHg3cHJSNTZkcjdMTHRIblBP?=
 =?utf-8?B?MGRsNFljdExNQkJ6b2ZyWFRwNXhTcUlpMjVnTFVQdG5jR3dvTmM3alpocy9a?=
 =?utf-8?B?NFBNZzRaQlpKR0oyYlJTSWwvNWFwYnErQmxaalZCc1psUk9TWnVjT2IvclhG?=
 =?utf-8?B?aHcrV2NhUzdRdng4azZrQWtaNjlBVWhKUytqN25VQUJnSW9OQVVHTTFmMkpM?=
 =?utf-8?B?K0ludmMyM3A3aVFqcFp0OURyc3k2VjdwUzFvMW9idlAzVmxES3JNVTZOQ3Jn?=
 =?utf-8?B?OHU3MFIyKzZtOU1BZ0x6SUx4YUMxaVpVdkZDeFZ0OFFZcEU0Szl4c25FUXd0?=
 =?utf-8?B?MWpJRWd2SEVHTG5sOC9sUnI5Z3ZITU1iMDZHb0M3cjd3NGFGQ2dobXdUM1Jy?=
 =?utf-8?B?R2FkRTk5c3daZ2VkQzA4UUkxRHdaNzJ0TStCcjlLWVVUVFR0MlNTZ2xrc2V3?=
 =?utf-8?B?d0ZIeTBKemVHMUs2TUh6Z1JqKzRXNjJBdDNWTS9jYmxOMDJPdExBaWRzZ016?=
 =?utf-8?B?S1hrYitiQjVQZWRhTVVuMHZ4T3dqMWpmN2xOeTl6L0d4enRkZVU0T21HTjZ0?=
 =?utf-8?B?aDVhZFk2Y01rY0tEQjFxckw3M2dQZTZ3aVAwYWpIOENFUUhqeG5DTWpsNXB3?=
 =?utf-8?B?cFhHRldxN05EQ1IvNUpmME8rV1NQUmx4a056NzNONWZkNGVrNlpVcE5hbDBw?=
 =?utf-8?B?cVNxcHhZZjdJU1FiWTdMRHZDbk1wYWFPaXJvWkZoM1E3eWtaV0xoWmFQWTl1?=
 =?utf-8?B?VEptYWRNYUZRNWRQZjBDeVYxUTA2YXpLVHhGMWZQSVVxZmM2TS8valpiWllz?=
 =?utf-8?B?NVpiM2Z6YmxaaDNtS2lITjFTc0Y0RjNhMklybE5WYTFKVWdQS0ZZNmZiUmRW?=
 =?utf-8?B?QTFyMDljWHhHWTRIdmIvUERRRVQ2NEwzWFpJbXRpam9aOWUxWXRSZUt1cGo3?=
 =?utf-8?Q?rc5XF7X/d9FknXEGXXmgh1nxFrB7FebHCw4Zt77?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a238b0-ab2c-4298-66dd-08d986b2febf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2021 21:15:58.5235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o9c68Ft75dzaUZw9bi02fatTHh5oiOCeV1KhG3Gw3M/5BVeMPXSx0+u263VuW4W3y1tBoE5xfCmMm81S0tRMQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4895
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogU2F0dXJkYXksIE9jdG9iZXIgMiwg
MjAyMSA3OjQ4IFBNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IFRheWxvciBT
aW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IFJpY2hhcmQgSGVuZGVyc29uDQo+IDxyaWNo
YXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPjsgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gPGY0
YnVnQGFtc2F0Lm9yZz4NCj4gU3ViamVjdDogW1BBVENIIDEvMl0gdGFyZ2V0L2hleGFnb246IFJl
bW92ZSB1bnVzZWQgVENHIHRlbXBvcmFyeSBmcm9tDQo+IHByZWRpY2F0ZWQgbG9hZHMNCj4gDQo+
IFRoZSBnZW5fcHJlZF9jYW5jZWwoKSBmdW5jdGlvbiwgaW50cm9kdWNlZCBpbiBjb21taXQgYTY0
NmU5OWNiOTANCj4gKEhleGFnb24gbWFjcm9zKSBkb2Vzbid0IHVzZSB0aGUgJ29uZScgVENHIHRl
bXBvcmFyeTsgcmVtb3ZlIGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4NCj4gLS0tDQo+ICB0YXJnZXQvaGV4YWdvbi9tYWNy
b3MuaCB8IDIgLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oIGIvdGFyZ2V0L2hleGFnb24vbWFjcm9z
LmggaW5kZXgNCj4gMDk0YjhkYWJiNWEuLmFlNjY2M2MwOWZlIDEwMDY0NA0KPiAtLS0gYS90YXJn
ZXQvaGV4YWdvbi9tYWNyb3MuaA0KPiArKysgYi90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaA0KPiBA
QCAtMTkwLDcgKzE5MCw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fcHJlZF9jYW5jZWwoVENH
diBwcmVkLCBpbnQNCj4gc2xvdF9udW0pDQo+ICAgICAgVENHdiBzbG90X21hc2sgPSB0Y2dfY29u
c3RfdGwoMSA8PCBzbG90X251bSk7DQo+ICAgICAgVENHdiB0bXAgPSB0Y2dfdGVtcF9uZXcoKTsN
Cj4gICAgICBUQ0d2IHplcm8gPSB0Y2dfY29uc3RfdGwoMCk7DQo+IC0gICAgVENHdiBvbmUgPSB0
Y2dfY29uc3RfdGwoMSk7DQo+ICAgICAgdGNnX2dlbl9vcl90bChzbG90X21hc2ssIGhleF9zbG90
X2NhbmNlbGxlZCwgc2xvdF9tYXNrKTsNCj4gICAgICB0Y2dfZ2VuX2FuZGlfdGwodG1wLCBwcmVk
LCAxKTsNCj4gICAgICB0Y2dfZ2VuX21vdmNvbmRfdGwoVENHX0NPTkRfRVEsIGhleF9zbG90X2Nh
bmNlbGxlZCwgdG1wLCB6ZXJvLCBAQA0KPiAtMTk4LDcgKzE5Nyw2IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBnZW5fcHJlZF9jYW5jZWwoVENHdiBwcmVkLCBpbnQNCj4gc2xvdF9udW0pDQo+ICAgICAg
dGNnX3RlbXBfZnJlZShzbG90X21hc2spOw0KPiAgICAgIHRjZ190ZW1wX2ZyZWUodG1wKTsNCj4g
ICAgICB0Y2dfdGVtcF9mcmVlKHplcm8pOw0KPiAtICAgIHRjZ190ZW1wX2ZyZWUob25lKTsNCj4g
IH0NCg0KUmV2aWV3ZWQtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4N
Cg0K

