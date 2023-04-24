Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5929C6EC918
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:35:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsb0-0000OD-4y; Mon, 24 Apr 2023 05:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pqsap-0000LY-Rz
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:34:45 -0400
Received: from mail-am0eur02on20710.outbound.protection.outlook.com
 ([2a01:111:f400:fe13::710]
 helo=EUR02-AM0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pqsaj-0007sI-26
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:34:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgkWA8/r/dMoQ9rsN+CrMk8OvUi9mRBYNTdPtscDKHCKcfBj2i1ccr5LajQckrZ8Q5dynkFrAlqOYUSI86hWP3g9zVAEowHfs4FyaFL9OFXflUUloRSEXr84UamOyxBr7DSqiNMj5IXtFDJgfjjSDGpuEx/lNDGbYepYNoj7ZTRSdhHaCo2mSaly0RMIv7P7HsZkoPXui5Uc1QBOg5rdw5VGErQ6w3YivSt0T3zvjnG7gdc4yVrnKva+Uq4kgXTapgVtPNLYTMmcZui209oHnDZXZlZ758B8p4/is8wuFgXqO0yexU1XO5Hu6rv2m56VGcfr/8OwCQaWROCOIwWVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kamWO3i/NRFKGfD7Yis6+oqI7WjVx2pjo2KWpGsT/rw=;
 b=OJsLG/KUAnQ6VUg9hUpNLd4a+m3IhEq+pC6R6XRoTJkYqSfE5CpvOKHLGGARxnYRHB72KeeY6ydGL18ObbZD61SQQbuaLnkFaXy2VWYxhn++klAWnI+y5vKlAPyE2Vk6E9jBABlibqiSS3uaOnvc698cWXvGnZKVxVrzn4WY+shnGtu236eHUq+aaLcAtjvgRHXFInwnVmpGl17CLSmAZiZAA2m1S9Vlk/N17qd1nfH5snkWquZILj52MVjZsqoQIAgBW0KI5EzxinztYt45EFrckhr4lmZLUxfV7WuXBhsoyJQUSpK7C6IGtGeUg5MqGmS6fmrNw2ed6Dtg2kCOYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kamWO3i/NRFKGfD7Yis6+oqI7WjVx2pjo2KWpGsT/rw=;
 b=EOehX2zDMNsmCmieRQUcuS7p93opVGiEFEX5jUtgR3Xu/ZqsFU51FMbog6aUpbf1ZDwDZthcogFtfO4IJcqIt/rv146db1ZvhP5epLO5G37eCQhCTt14LFGKd8sbF4m/RqLoUjI2ikpCPtZ53rPW0Km/ybjgx5F6xlJNSYq6Zj8=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PAVP189MB2388.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:30b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 09:34:34 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:34:34 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Tomasz Dzieciol
 <t.dzieciol@partner.samsung.com>
Subject: RE: [PATCH v3 37/47] igb: Implement Tx SCTP CSO
Thread-Topic: [PATCH v3 37/47] igb: Implement Tx SCTP CSO
Thread-Index: AQHZdZr9kaxE6GXKpEy4pPuQuEqx5686NKzw
Date: Mon, 24 Apr 2023 09:34:34 +0000
Message-ID: <DBBP189MB1433C053612B2B0125E865D695679@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
 <20230423041833.5302-38-akihiko.odaki@daynix.com>
In-Reply-To: <20230423041833.5302-38-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|PAVP189MB2388:EE_
x-ms-office365-filtering-correlation-id: f4bbe0f2-35cd-4e9d-0908-08db44a71d4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L6DhqBgyCNHFUxOJHcskAZAbj1Y+zyFk1xxm11W3IpQQTIBazFB2uUWRRe/+BiU/UFgCESQew734mevdQX6z2eBMCfko5qbminb6atgiMN5iZrGx1AUc/KWPesdr6fYtf4qrPSKmJMrUD2nCTqAW2zGyfNQ/UrSoQFyfvBlC400eEKZOFuumnN2z7/knXhpPWwKkYFaQJSNR5CGbGZYShLhbIz6yY0vl706+vDxQhmbW/vWbwssnTJ8iQUCQYpaDWF56bSARiFlcoJvtA8C7JGwDHZK8k32TTY1tx45GGrPSF6xZj/9QZwa9KrhUtAzfF0g10yo9QG56XS7EqzPH2aIV9UjIb2uRPiFGKKodVwhm/i1nWuzuoqh47kIXpYyCwoS7s9/TW5x6a1clzvZhDqvy8yCCuB3TXGA2DxIXaEdgnA7hqUhRR4jkhtf/vMpBY3DIju3BMC20vvr17NJBhPe+Do2lgKbdB5+arhsNrvRNJfzCQ1lCEm0It1Iaeff38Q0TFKZgbYCuAkJznzXfE6cjp7SdcpTQlnqt8ghVNBQwg/JGvpLZaPto7a4PkkjM0j+xYWh1Jz8hMVXoY+Tu/Wi7lKH0s08fzCkmJ5MD5+u0AxqpVpNptveNSJ5f5Kt1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39830400003)(376002)(366004)(346002)(451199021)(9686003)(6506007)(26005)(38070700005)(55016003)(83380400001)(186003)(38100700002)(122000001)(66946007)(478600001)(76116006)(86362001)(6916009)(64756008)(66556008)(66476007)(66446008)(8936002)(8676002)(54906003)(7416002)(44832011)(52536014)(5660300002)(71200400001)(7696005)(41300700001)(4744005)(2906002)(4326008)(33656002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWg5Rlg2VmYwTmlKelpMKzRHNmxOeGI3TXc3THlNTFprWkxRUndxdDB0SzhO?=
 =?utf-8?B?NWJmeWpvZWRKQWpsblpHai9teVhGT2dzbXRtSmRYOE9zdjRTZFprdWpncmx1?=
 =?utf-8?B?TEZlc3RyeGhPVXk3NDNJL0tveEp3RUw5Tkx2b2o2a3hQbXFtek85TDZkOVI3?=
 =?utf-8?B?RG8xeldrZStBMUlKbEVhbnZ6NERPR29MajBOWlM3MkN1UW80Rm1BWXVyZUsx?=
 =?utf-8?B?TXdKN3RrU2tFMndwUktyYWFIQTE0aWtXWTJnM1M5TWhidGhUZkY0bVNWYkRl?=
 =?utf-8?B?d29GN0VyekxiQmt3TVlTQXk2S0pNN3lFNjJtaFo0QVZMVm9uUkhMcVAyWGVp?=
 =?utf-8?B?bURHUUZHNGx3ZVpJZEtpMkxaVUpZVnNlS1E3bDh6QUJMcUx3N0JTZUJEbXV1?=
 =?utf-8?B?Tm9iMWZ3YXoyNDQwN1lHeGhuL2YzQ0loazhwUmhVbHZyYUdtQ3FlNWdrNnE3?=
 =?utf-8?B?ZGxDeWI1VnFPYllnYzNtazgwWkZtaCtRT2FLOU5adVo1MXBiQWpCV3JzbnBD?=
 =?utf-8?B?NmpTZ1ppR2U3M2d3NStOMkR1UFZ2U3lkdjR6WjJobTlmWFMzQmYwMFR4NjRr?=
 =?utf-8?B?QmVhaUk4MkJPVUg3U1Mzd01JTkVWWVhXTU9QMkJ3UFg5N21vZHA2aVVWMXVV?=
 =?utf-8?B?NXVFcVJFcC9vTElkbVV2WldvYnQrTW85ZUJnOUU3UjVOQlp4UjVaRXlSU0F0?=
 =?utf-8?B?bksyeUhhNEdsVE4zb1Ewbk51eG5yTDNNcXpaTmZGbzZaaUNyYm0zKzRNZzRB?=
 =?utf-8?B?T3VTUUhIa2RRVXZSWkxwT3pQUWxMMklueG5kMmFlUmlWRHJFSGhQbHVKQ2dz?=
 =?utf-8?B?aUhiWUd3V1UvRTZuNDFDaHRtM0l4cUNSSjV2MTNnRk1BR2VsSjUvK3FOcmRr?=
 =?utf-8?B?c2lrN0tNQWg0K0tkanQ2ZHVLck5hZU1kdDhJZCt1RXpxdjdPc3RPNmJwRUtO?=
 =?utf-8?B?cWdUSVoyY0hQeVg3L0RBa0RlRC9YQ3pLaXZ1cXJ5NGtWblo3NzZuamRkZUV1?=
 =?utf-8?B?N3phcUNRQzlvVlF5VWtNWUFHS2UyMmJnMlZxMTR0RE0vY2hWOW5vcENERVZx?=
 =?utf-8?B?SWJUUmNlYzJkdFdwclFZTlc0VmdtQm04N0RUTVo4U1JmMVNmL1hrNTdXQzJQ?=
 =?utf-8?B?MEE0a2YwWlYrWlYycGJzV3gydGNZZ2VaVndjNVlFY1ZpSVNQUXdQZ0Z2anpr?=
 =?utf-8?B?WTYvZkNZemdNZmdsTi9VcHZPdExSQmZ2MDBDRjE3dTFGdjBWSGRDOG40MFR0?=
 =?utf-8?B?TjlpQlBnUW85cWdTcmpvNmdDSzhiVHl1cW9QS0JCK3laQzdkU2hCS0RkMjBj?=
 =?utf-8?B?Q3ZUSXJYbXd6UFNFckxEK2JTQ1dsMGhQSHlvampoUnF1SXBDU3hZeXpuWE9m?=
 =?utf-8?B?Z2ZlT3JhYVZ3UEdKbDF1TkcyOTV6dGYxUnB6RVhVTTh0SjhxV2NkTEdHSldk?=
 =?utf-8?B?aWptRmdIR3UvblBNdWhZL214ekVhbklTMTd1RGdlVDBVOTkzL2tYT3JUV21s?=
 =?utf-8?B?SWlvYkZDVVpqUmNkVFZ2dmh0VFJiUWFNWTRKblpFVnVLSWZlenZocXVkdmhl?=
 =?utf-8?B?SENQZzY0S0U2MktieWR5YzhFOHJTb3NZSkFabHBYeVd2a2thdlo1cUdudENF?=
 =?utf-8?B?RFV2SkJBdDFLN09FSFRXNE1qNFMrcHppWE16aWtoeFhIMy95bDNvbFMxYjBu?=
 =?utf-8?B?enpOdGkzUVNScGgzQmNhdmhraDBNTWFuQmFYLzN0QUNZeGhWYmVuTWhBMEFw?=
 =?utf-8?B?a095VklFSWRET0pFa1BXbzZQUDRPL3grdkQra3BEdTV5dnVaR2JuL3kvN0Iz?=
 =?utf-8?B?emhkc0pDMFZvb29lWFhQZXhGQUNORTNLRmZVQjgrRjhnRWdsRGNZaUlUa2lL?=
 =?utf-8?B?SnZLajhScVhYeFAzTSsyK01YR2I0WUNLUWt1OTNlbWJ4SGVJYVlxVFdDUHJG?=
 =?utf-8?B?dG5JQU5ORkJwendhVTRvaHZRU1Z4WEJZdEczbEJoKzdNKzVtNnVtTEpkUVpD?=
 =?utf-8?B?bkVEcDZSL1hvNGxVaWg0UGhYNHYzanQ3YjhwR2V0T1ljRk1tTitpc1I3Z0ZX?=
 =?utf-8?B?MjJQcE9wbXY0SEtVVHNkY2UzUW5xRm9FT3RyTEFqSEZtUFg1bzJjVGFPTVpG?=
 =?utf-8?Q?GH9SmjolHVZbAf9qo9PN32iQC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f4bbe0f2-35cd-4e9d-0908-08db44a71d4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 09:34:34.4808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nUNI1HtwWNGYNG9Mm0oe9IJQbOGhttInotfURHOXxtb9FLLvZujJwIGvcWaNTcJf/DsTY/NzxRLOockPCNlFLPtpJ7gkoHST/AYKpG0e3Dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2388
Received-SPF: pass client-ip=2a01:111:f400:fe13::710;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR02-AM0-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWtpaGlrbyBPZGFraSA8
YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiBTZW50OiBTdW5kYXksIDIzIEFwcmlsIDIwMjMg
MDY6MTgNCj4gQ2M6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVj
aD47IEphc29uIFdhbmcNCj4gPGphc293YW5nQHJlZGhhdC5jb20+OyBEbWl0cnkgRmxleXRtYW4g
PGRtaXRyeS5mbGV5dG1hbkBnbWFpbC5jb20+Ow0KPiBNaWNoYWVsIFMgLiBUc2lya2luIDxtc3RA
cmVkaGF0LmNvbT47IEFsZXggQmVubsOpZQ0KPiA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47IFBo
aWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47DQo+IFRob21hcyBIdXRo
IDx0aHV0aEByZWRoYXQuY29tPjsgV2FpbmVyIGRvcyBTYW50b3MgTW9zY2hldHRhDQo+IDx3YWlu
ZXJzbUByZWRoYXQuY29tPjsgQmVyYWxkbyBMZWFsIDxibGVhbEByZWRoYXQuY29tPjsgQ2xlYmVy
IFJvc2ENCj4gPGNyb3NhQHJlZGhhdC5jb20+OyBMYXVyZW50IFZpdmllciA8bHZpdmllckByZWRo
YXQuY29tPjsgUGFvbG8gQm9uemluaQ0KPiA8cGJvbnppbmlAcmVkaGF0LmNvbT47IHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZzsgVG9tYXN6IER6aWVjaW9sDQo+IDx0LmR6aWVjaW9sQHBhcnRuZXIuc2Ft
c3VuZy5jb20+OyBBa2loaWtvIE9kYWtpDQo+IDxha2loaWtvLm9kYWtpQGRheW5peC5jb20+DQo+
IFN1YmplY3Q6IFtQQVRDSCB2MyAzNy80N10gaWdiOiBJbXBsZW1lbnQgVHggU0NUUCBDU08NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEFraWhpa28gT2Rha2kgPGFraWhpa28ub2Rha2lAZGF5bml4LmNv
bT4NCj4gLS0tDQo+ICBody9uZXQvbmV0X3R4X3BrdC5oIHwgIDggKysrKysrKysNCj4gIGh3L25l
dC9pZ2JfY29yZS5jICAgfCAxMiArKysrKysrLS0tLS0NCj4gIGh3L25ldC9uZXRfdHhfcGt0LmMg
fCAxOCArKysrKysrKysrKysrKysrKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQpSZXZpZXdlZC1ieTogU3JpcmFtIFlhZ25hcmFtYW4g
PHNyaXJhbS55YWduYXJhbWFuQGVzdC50ZWNoPg0K

