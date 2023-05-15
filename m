Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B369702BB4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:41:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyWZq-0003IT-9p; Mon, 15 May 2023 07:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pyWZW-0003Ev-6k
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:41:00 -0400
Received: from mail-vi1eur05on20728.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::728]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pyWZU-0006G2-OB
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:40:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwKf6L75TZAbhSI0FzynRyYgseoNBuSVjUdpFhFOzLC0vYYln+QOJl9ohhp/9i6yNGECBcDeRbCcciECRUV5mVYAtiEUCrD0bD4T9SQ8dK2T1GRCEH4xkQYtdLXQbbaEi5qwndFsdueArsrm7ZRKVncuPdDnNUFsiq9A+liSxe/4UktW+LwFFg6M7mjd35pFZUx7W3C2iPfjIy9PVw67Rj1HE0nFSCuarbAivw2LX9XP8OoHRn0hGe33KijNZwK+wKoxLeDVYKqqiqg7bdpYoN89zaAnqj1V7QgpJ1j9wH6EMTmV5pKFX051RWS4Z2m0sHmwFjqRDfYX5KYZZj1tvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UShk2MO9NlYP0jqui0a6r0rXyoBpBQOeHhJR2Uu+uSE=;
 b=kXZ5j4BnTuDGayxItECTl8yOYaJMmW3M2uVC9M94HMWWFtF01tsYxe1njJ2sX1DqGTI6/5WSiafpSakeSe4Lx0mgUHb4x8L8VSt54BGsF8Uc8ri4PJW1+d++vF0Np3IGStb5Hv0NJPy6VlTF22FYrtAjwx7FONQTXAzFIkrXdCfN9YPx7Msg2Ef6ArM7BT+tG6DGe++AgGAHcoZu8BJXXzoqCJHASmObvO7lY7Ybs5lknEx28mh5YvbVfUGPExfASff9fTzFw5GLtUI8nRVt6PXqCZeZ8kliCNexDTpC8Oq1GmT2W0PUiu2zsKoDsdKCypBMgvNBTCloPA1doR4kwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UShk2MO9NlYP0jqui0a6r0rXyoBpBQOeHhJR2Uu+uSE=;
 b=eZ1Luy2LZ6HbM1jfcmTw470AQOvvGZ7qPXg2TIKj2CChuTiqaXW2Y7If0C6SZQueumi5PVqsnj1ITDSVbeDPVv+v8DWxdEuFXVIjGDofW3HB51wB4arWAy3BQriJiDC8KytvV/Vg3NN+X1PYYfGVMrv41IHVYph93VkSQ+f9NV8=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB8P189MB0699.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:12c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 11:40:53 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%7]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 11:40:53 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "akihiko.odaki@daynix.com"
 <akihiko.odaki@daynix.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "k.kwiecien@samsung.com"
 <k.kwiecien@samsung.com>, "m.sochacki@samsung.com" <m.sochacki@samsung.com>
Subject: RE: [PATCH v6 2/7] igb: rename E1000E_RingInfo_st
Thread-Topic: [PATCH v6 2/7] igb: rename E1000E_RingInfo_st
Thread-Index: AQHZhOiOR7xAZ5hGq0WgQ/rsI68EfK9bOlHA
Date: Mon, 15 May 2023 11:40:53 +0000
Message-ID: <DBBP189MB143351FA8AE2B5DD1684EE4E95789@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
 <CGME20230512154349eucas1p13a45e562689049eec9f7dbf225b682d0@eucas1p1.samsung.com>
 <20230512154335.2536-3-t.dzieciol@partner.samsung.com>
In-Reply-To: <20230512154335.2536-3-t.dzieciol@partner.samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB8P189MB0699:EE_
x-ms-office365-filtering-correlation-id: 323b43ec-343d-4ae0-0860-08db55393d2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B1xUciaod4uagdGzWmTX54Z0/9UHF4+CryE/fnJapqkp58+0Uk57W+bNT4IcCWCpRAx7xA1preJuLSmayWzOFcgmBpcsdCu/DFEpq4iNwFn4gknf3Dj2ZrfodDIag4GQxawgTB+boJvGmSNRY0koawXMcmjOe0stf6ebIcf7uT70ktIbtjhr0WAablNpTbbMiSIodUWJihjvrtRcLJRyEW7RmT+xjfdJxTO9AL6RTlOsPV4V2pI8eqRYESq5q2NkYxD1clkzWXsdSXIjMI/PVSkQsLuQuBrP1y1coeLStvLeTh3i+I+bU0xmN5hI+yBEzugB9cubXvzht8QL3jybrNIlABg964PLNJLrNO6luUsUH7SwrgRCYIVnw6mBh2lryjXbianW+edLJtQiKGZJk+zHHs6gVYcdWwPSZhNmDiVEfrtqCX7Xv5VYj+nlDXqm8NnOrJ8YgrFRS+LFPhh/1jMJp5jeT+Tx1p7YroRmQvfQl71qEn8k5haJqpAYPZ2KPxCRSE6+6ZoWIOD/iQt6BjWJ4wwoa6O5aU2/CMhdX7ppjN6GUB/dWAlhNdTD2YLbVyVeuxxEQjlP3A2XulQSUWHluPLbPh11k4RhPak/LYcXJwob42DNivmsBgd1qsNR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(136003)(376002)(39830400003)(451199021)(83380400001)(66476007)(66556008)(64756008)(66946007)(66446008)(76116006)(55016003)(7696005)(26005)(6506007)(53546011)(478600001)(5660300002)(54906003)(110136005)(71200400001)(44832011)(186003)(2906002)(52536014)(4744005)(86362001)(8936002)(33656002)(8676002)(9686003)(4326008)(316002)(38070700005)(41300700001)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bG50NzUxQ2RnaG1JVFJXWE5OTGtCc0FROC8xL1dwemU1UUxFSmhiT2x6NnhC?=
 =?utf-8?B?MSsxdkV0aGNCekpiS21JUGR4RDFBRGJOQmJPU1dMajBRRjU4MUNBbFZOR0Qw?=
 =?utf-8?B?blVlSmdhRWhzUzdGbFhxQkUvVUlmQk5sUmR3WkJxWGJuZWMzdVpXaFkvQjVJ?=
 =?utf-8?B?MkFObE1LYjZ3Zm1SM3E2YnBFOEVPSGRuZFpMbzVlWjE5QmVkQ2J2OWdTb2Fz?=
 =?utf-8?B?c3V4d3l3bUw1N2ZNbThyWEI2U1VUdUJ6a0czTmJXeHBmRnBZVU1MTm96UlVh?=
 =?utf-8?B?OEIrTG9LUzdwSjlnck9vUFNPZ0ZkZkpIMS8vRDJyWlFZbG5DSFZWdjlRU0ZU?=
 =?utf-8?B?YUFCcjJnNjlmTnR5MnNYNkJQWUlTZ0ZEQ2JQekRyMlE0UXJIUHR4NjZMbUdO?=
 =?utf-8?B?bTlSNHNkd1Z6MlgwMVdUQTk1WGk3aWpMdldRWXVJUmhWbXpUUytzVXRld21s?=
 =?utf-8?B?NkZyOUNGSmYvcE1xWUFRWFNldU1SNldFaTVkUE5hTEZXNGkwL2xqQ1NUMzR2?=
 =?utf-8?B?VXFwekZ1U0ZGelloZDR5N2VqSkRrSTk4cVVIZVhDNUNZSjVuaUFHaVhLMWpn?=
 =?utf-8?B?S2VRUkhoU3N6bXBhaUVtd3ZIb1dZQytmbkNSZjVMV2pwd091UG5nTUsrenlY?=
 =?utf-8?B?cDdKQ1FHdVYrdjR0bGYzOXNxUWpDWFc4Y2FrY3V1S0JNbStQZlJPYnloY2J4?=
 =?utf-8?B?aWRIaTczcE1Zc3V1SGc1WmpLRG45R2xwMVZFUVBnY2FOM2wxbkM1dFoxeTBr?=
 =?utf-8?B?T0pja1YxK25GWTcxaGdXU3ZIdHBLVEZMcitWNlpELzFGNzVHdWx5M0VIdTNP?=
 =?utf-8?B?QnNQUDNJRWVRdDRpQnlmOEw5UFdhOVltUmpZeDZTZEtPQ1RmdTdBdDY0SGxl?=
 =?utf-8?B?M0d6VGo4WXh0UnJ5ODhvZkJkdk5xS1F0WjRUdGlHL1NoWFpwOGc2TVdBbkpQ?=
 =?utf-8?B?bUN4V21DRDR0cTdZcFkydUYyNVRjdTg2ZW4yY1o5ampjV2MzaDY5VjlmeGFO?=
 =?utf-8?B?NFJvYmF6Y2dmTjNCY0ZRZWI5aGxwek5mVXZaMmt0eE9zK2plenJnQVZDWVFV?=
 =?utf-8?B?QzhZN1F3d3U2b0ltcDIxaVV6RVpQbmFQbnN5YVgyWUhndXpHYmtNdU1WNHZ1?=
 =?utf-8?B?T3QwajhKN3p3VThkN3k5aUw0TWJFbjVHSnk2QXdVdUNKUWV0ZFVlaDFmdGcw?=
 =?utf-8?B?M1c5N1I4MUUyUndXQkpYa0JDM0FIRTlYUjhjSkVoWDNncUpsWXhOTkVndmxz?=
 =?utf-8?B?bHhWb0taNWwwTXllT3FqcHJZdkNRaGNLN0ovUHpKQ2ZTZ1AxNGxQRnNmRHpF?=
 =?utf-8?B?dEhrYVRHODVGVEJ5dm9EYVRxdEE3M2p5RUlYOWt2RXdjTVFLY1BUdk1JV1FU?=
 =?utf-8?B?NGVteE1iYWFNQ0Y5V3JOSXdKTTQ4c00vSEc0a3NpcDdTandlOUNFNmY3NGJN?=
 =?utf-8?B?UWtEZVRSY280VFpiNmwvaUc0RG9VcS9YdU1OYTJWYnRPczB5eThXMjlhRUVI?=
 =?utf-8?B?SXJXL1o1bjdIaFZ6S2o2ZlloUXhWVlJXeGdYc2lNUWxDUnAzK3RSQWEyMTdB?=
 =?utf-8?B?RWw1RmdaS0R2dm5FSTBkVHdrVlJpWG4zSnhoMmhVOG5iWGo3QzRMM1Y0ZXlM?=
 =?utf-8?B?eklyaWxIclBrTFBudGVkcS8zUHB4U1pCeTlkVVhyRGZudkZZcWYyZ1hJcTRo?=
 =?utf-8?B?VVY0eGFONGJWMXhqOGFEdjU0ZmJJckFUSytmMGMxS21ZL1dzd1Jzb0hjdGZj?=
 =?utf-8?B?c2dVZVJGSUkzdy9mc0hTVHV1SXhtQ0crVGY3RFZxQ05vV0RuYnNjREtJOGxp?=
 =?utf-8?B?TXhhS3FIenUreWtuaEFCMWxDMExobzFEUEFsZ2hGL0M2cWZrUWQ3ZlpTc29o?=
 =?utf-8?B?YXRrRDczNkdjZUhKZnFYR0NsdVN1SDU5M3dZV3hhcmlodkg3Z1Z0UEdoeENL?=
 =?utf-8?B?eGtGUWV0YW9kNkhCK3FSSHU3bmNpZmltZHByMmdNVGIxZlBBSlU2elEzdDBo?=
 =?utf-8?B?QlFyREFmY1MwWDE0bko3QXpOUkFHYi9BaHBSc0x6bFBqdEVxWG82dk1GMXVw?=
 =?utf-8?B?elVLeStXdXVmdDhUVHpsS3NWUUMyZjhwYUt0WDRORGdxdk01MTc5NTVNN1Jk?=
 =?utf-8?B?SUpTNzVZVW9iY3BZTGFVS3g4WVRiaXF3Y2xFaHJxWmlrb2FGUm8zbUNEeGp1?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 323b43ec-343d-4ae0-0860-08db55393d2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 11:40:53.0658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I6Cc/V4QU7Knnay1ZoIEJiQgUO1ct/OD2kkipgviZgNc0G82BovTw0VJo5XTpEzxqf2yHYpw7yTL7OnOjmUg7IvKGWiCJOOs7BwAekWAIFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0699
Received-SPF: pass client-ip=2a01:111:f400:7d00::728;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVG9tYXN6IER6aWVjaW9s
IDx0LmR6aWVjaW9sQHBhcnRuZXIuc2Ftc3VuZy5jb20+DQo+IFNlbnQ6IEZyaWRheSwgMTIgTWF5
IDIwMjMgMTc6NDQNCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgYWtpaGlrby5vZGFraUBk
YXluaXguY29tDQo+IENjOiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0
LnRlY2g+Ow0KPiBqYXNvd2FuZ0ByZWRoYXQuY29tOyBrLmt3aWVjaWVuQHNhbXN1bmcuY29tOw0K
PiBtLnNvY2hhY2tpQHNhbXN1bmcuY29tDQo+IFN1YmplY3Q6IFtQQVRDSCB2NiAyLzddIGlnYjog
cmVuYW1lIEUxMDAwRV9SaW5nSW5mb19zdA0KPiANCj4gUmVuYW1lIEUxMDAwRV9SaW5nSW5mb19z
dCBhbmQgRTEwMDBFX1JpbmdJbmZvIGFjY29yZGluZyB0byBxZW11IHR5cGRlZnMNCj4gZ3VpZGUu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUb21hc3ogRHppZWNpb2wgPHQuZHppZWNpb2xAcGFydG5l
ci5zYW1zdW5nLmNvbT4NCj4gLS0tDQo+ICBody9uZXQvZTEwMDBlX2NvcmUuYyB8IDM0ICsrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0NCj4gIGh3L25ldC9pZ2JfY29yZS5jICAgIHwg
NDIgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQ0KPiANCg0KUmV2aWV3
ZWQtYnk6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVjaD4NCg==

