Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B76E9979
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 18:24:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppX3o-0004rY-08; Thu, 20 Apr 2023 12:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1ppX3l-0004qF-Md
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:23:01 -0400
Received: from mail-db8eur05on2071f.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::71f]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1ppX3k-0001Vz-02
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:23:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYlCsPisv7Ettc9s25Tq2sO2ftjzzAKGsHSWSl3k0Dwg54k1R2DFr4JgtLNjVCbR416I2kGxqLuWzGPkLVOSunPaEQ/an8FDiUZJCT0BOyVqeXzlcOpLigmQf4HXM9U0iQSPSZN7a2jI22KZwDolV/J5N0pLRr1bS+GY1wBQgeZ0tqSsCbEqqZAGjpU5lhqPcpxArtCiPIVGTlzztoMSfiIN/gsrjRT32kodl2Z8zNb1zeIxMMbGtY1x9+xMBeGmUS2r4lVgdDDz36qvFmGJRV0Yf+pARQ35vv220mdmiunB5JXwmnxhIw/SDdTqvrgh6MBfW3nxMThp4FZ2muGfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmAuqLquBWb/rNpccTnu2dfonX/99s1YX0dHyfNVZgU=;
 b=oH34U+WTu22/P9Fyiq91nxLibnc5URqGkMH6ubi/GzwYsqiUN9VMWGPZTh106qO2g+2OD4e80n/v5uNV/y5K/dTkoq0amSplGeZFRPvjAIg/tDEgh66ZDonk3M5iGCfYdz4Lequdy9tOUEaf+0ucGJrpdpxldCd+kaYg9XM0MD2iJKH1pHiHB5JZCO7+60nqtp3FT1yk2m1SNhrtAMsG9W6rm9xQDQGaU6S0xO/AZCi6kPTHSG7u2kX9apK6IUyoDIwVvG+lu7iVk60BJmBKGgUW2t4Y40Fwp0qOzjaDh9X7znS721n2vf0Bxmz9AiOrLvf5OO5bHCTXHRQ/Xkmkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmAuqLquBWb/rNpccTnu2dfonX/99s1YX0dHyfNVZgU=;
 b=lk6j+am9x9jOmrrCcAPGUL5eZpg7VfgUB6Tz3gORd18Ft4yoI/Qll/wCejN3unnVOPeFtE6ldmUui5++RbtY6r0Wx08hk9+iVhDa3f1aWrohCrBVpZPmGo1HQwIXGCF+gQzf5Fute0O/woCRNwgCq2Rq5aZDxR9IdRU+ACqFymg=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by GVXP189MB2103.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 16:22:25 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 16:22:25 +0000
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
Subject: RE: [PATCH v2 27/41] net/eth: Always add VLAN tag
Thread-Topic: [PATCH v2 27/41] net/eth: Always add VLAN tag
Thread-Index: AQHZc0vXm+n9GDjEuUyz5CTrZp5/G680W3VA
Date: Thu, 20 Apr 2023 16:22:25 +0000
Message-ID: <DBBP189MB14338D4E07A076E687CE70FA95639@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 <20230420054657.50367-28-akihiko.odaki@daynix.com>
In-Reply-To: <20230420054657.50367-28-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|GVXP189MB2103:EE_
x-ms-office365-filtering-correlation-id: d6bf54b0-f0b2-4c0d-f89a-08db41bb6dac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4a9PCTW5zm2x+1VajbRkkw+P1H4+ewqp6KNSmbb/2/t2MeqtY3kc3IKzC4e26g6MJz+NyUj4JZPykgkhN8kBK3Qxb1t5CGol1h7ON23T9+SfTa538vISbrVV+HtDK9idqrnodC6xClntPovjTQ0Nrx2pdhjLgCY+m1/sWADVWz8+AvSfs1nE8Bf+yx27QY/dvQ2FguVGTf+knPHjHsZtXkHa5tzCeiStRsN445i8fYWQ0Cg1RYJgBvz4ud9oUk55+MRzIhFKIcRKk0/NadlViWsFRlk6saWzKQA5WoQA+k5VTtP2h9dcwRdfc8G0t6FZtvUkgoZ54kXN0dZa1voze99YjDqBgszriIBeQBfiksT9yvAqgrcGOPH754VLTdQzfsIHR6H3qVwEJ0YWZu3QhUucxmk7tzAnWZrG8VTIf/BhIdo5DQbRFo32iV/EXN+Q689SxGj/pL3Og/7rQmUVYDb+phevlo447DbToLbZbLghctAUu+RIkoY6wQtVZQIFSRTqg5OCy5c67osxl5xkr8pLkUccDWgW5UIshDHOPqz4mtsNLfc7wRZmz/KQwgjy+1luUlWE3UAZEMMUTuy7gu6ZrZDCx0kdPlZ9G4OfvEIc6jrSwE4mpL+UMKz/FGY8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(39840400004)(366004)(346002)(396003)(451199021)(122000001)(8936002)(6916009)(4326008)(316002)(54906003)(76116006)(66946007)(64756008)(66556008)(66446008)(66476007)(41300700001)(7696005)(478600001)(71200400001)(52536014)(5660300002)(55016003)(8676002)(38070700005)(7416002)(86362001)(2906002)(33656002)(9686003)(6506007)(38100700002)(26005)(186003)(83380400001)(66574015)(44832011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGJJb3JoS25OalFGL29IMGVDVUVBSEdPNkVhQ3dNcnJQNUpyNXBVRUtNSjVR?=
 =?utf-8?B?VEJZYTErR0MyRXRjbktjOTl3R2VESkNRYk8wYmVGWXlHWVpRd21LNzJlRjYy?=
 =?utf-8?B?UC9FOXJBT3F5S3EybmZRNElUYnN1NEU1cHlYb3JSd2YxQU94azhER1h3MWdj?=
 =?utf-8?B?OFlqZmdCbjBib0lnREMvdHVDVEFqcHBjTXJ3SVhyYkIxTTJYS2NWeWYrRnhV?=
 =?utf-8?B?L0paL2JuN0FuRDFOemhOb1VSbFo4Wm9LeHBja1NNZUR1R0ZvUlhQWXFVK2xk?=
 =?utf-8?B?NG8xckZLUUhPOVVvL2RaNCtTUHpJL1BDL0E1anliMjhaczRHbWZSUzgzMjF5?=
 =?utf-8?B?OG9Gemp5NmU2SW9ybVBkdnI0NUhOUnBhNTgzSVllMEgrQ3ZwNDN3eUxoM1Fz?=
 =?utf-8?B?dTVvSm9YYnkrSmdjWWhYZmY0Q0pYOWxzdmpvcG5kR3h6NDZBekUyYld1K0Uz?=
 =?utf-8?B?SnZuZ0NpT1U1NGVCSW1McWt5d1BLaTV0bGRHd2R1L3JHZU1CWThVVExFdXpZ?=
 =?utf-8?B?V2lJSGZrdmdhSEZzcWhMeE1MbFZaRGFoeUNrN3ViRE1lRGo0OXdVMjdWLzh5?=
 =?utf-8?B?U0pDNE96OEpWSkRMNUo4RTFJditBNmJ0QVVJWnpFenk4K1ZmdVI2UktqR3Er?=
 =?utf-8?B?QmRmR2ZrWXk0VWxHaXZ3b2x1dXNQVXo5NExrVmRlMUpPbnlXQnFheTNWWjlt?=
 =?utf-8?B?SVRQZUpLVk1vSnQ1R21jRFF0SjBTM3h2UnBSYWpSUlBReEo1Z2dPQnBFVVZw?=
 =?utf-8?B?YW8zOVN0bDRUUkpMdWFBNHRFVFJGT1BBcTd6cDdYZnpCVy9zVEVmKzdvNGNS?=
 =?utf-8?B?NG5BSmdDekdtbkZQclk4UVdCZUxrMnNsU2VrNnNmYk1qUnhiYjgrV1NxK2Mz?=
 =?utf-8?B?ODVxb3h2YlQvOVloNFRqZGcxODJvWDZRdzUrbFVnN0cxN2k5Qk5NVllaSzFw?=
 =?utf-8?B?ZXpyS2ZMVG05dHpqQjlTeEdZQUdYNzFqR2ZrVE1yRkpreWhUd0YrcHBDNDBE?=
 =?utf-8?B?OFhPYTJ1YWkrUVJEL25ScVlTQUpOWUhzTFJCaVNNN1NRT3ZGZ1VmbUZBWGdD?=
 =?utf-8?B?eXpMQmNZVXN1NGtER3F2WlFVYVk0cFVmT2loUHFGc09wZDFGdUxqbUVVN3NJ?=
 =?utf-8?B?eXRibzlHekdxSHBaYUFjRmJKamJ0YUtpMG5MLzlYNElUNUs3SmVvcjVRbHlr?=
 =?utf-8?B?TmlGbVB0QzZqOFR4blJzSllUNWlMOG9hOUpOMHhUanlzbU1QWkdjbDdiMFlP?=
 =?utf-8?B?enN1a203SjBBd2xQMWwvNnp3aDFHMHphTlArM3lyL1IrYmJWTnRBRm0ra2JB?=
 =?utf-8?B?aTYycnRUa1FmZFByTy85R0VjVUlaaS9HejlzNXQwcWxOYU9Ka0puRC9Ud2pR?=
 =?utf-8?B?b3Y0K1psRmZtYlA5VkFWZjl4UHlqQ0ZZSTBMSVNUNnQ4cVJyakF2Y2pHdGZx?=
 =?utf-8?B?SWJaM3E1b2ZYZ014SDVhVVR5bmx2TDVFKzZCcXBsdlI0ODBZMmI3NUdXVys0?=
 =?utf-8?B?dWRBOG9SOHk2ZXNmN3dhNzN6eUtkUlJFQnJ6N3lHKyt0bUc0VmVYTzQ1cEFN?=
 =?utf-8?B?V3BTSkYyV2c1WG1OcmMvVHdLL3JFVmZRaEZKK1NyUTNhVGU3ZFBxaWVRLzJT?=
 =?utf-8?B?a0c5bnhDeWw2OUtlY21mYnZ4cnRlNU5NSTlwL2RQejd1ZVZCVzVQdUZ6UU56?=
 =?utf-8?B?VlhaSWs2czNyNkZCaHdnTEd1VFAyMmdGNDFpSXJPdzF4WDRUYnpMMWFJMmVh?=
 =?utf-8?B?RFdPOXJhSTEvb0tadGlsaTVGdzEwVjVDM29zNllQRm55MFRQVVFQWG9lWWpL?=
 =?utf-8?B?QzNMdFd5aXBhTGFjcDFUbjkxNm9qbEVYbWYxUko1TTJ1dlRxd05rL1MyNHJm?=
 =?utf-8?B?NnpkandRSHBOWU5rOXlVOVp2M2JCbnp4eUh0NVlkajNNYUlDVGlacWo0OUYx?=
 =?utf-8?B?a3oxUFN1anJIK2lNdDFWaktBekl0UjFOS2dyMjZLZkk3cUNINlpPZ0ZXcnBW?=
 =?utf-8?B?NmFiNUpMd3BIZC9kb25laDFSMnZoRzJKeTdWREFBOFI3b2djaEdDdllmQ3Fv?=
 =?utf-8?B?QXJZSzJoRHpTWktQS2Z6NU1TeWQ2b3E0RkdwVmtLQkFoaE1abFhBalBBRkc5?=
 =?utf-8?Q?d3xDQrvvg936LlVFUc+6jIe+F?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bf54b0-f0b2-4c0d-f89a-08db41bb6dac
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 16:22:25.7462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: otRpnsMWhOnTzbxxN6cdGtaVczMgqGR+cDvUSHDn72t8m481yMz3B4LuvAmaB1TmvnLxTMpCw41EQK2BuzdJDqMKjLEl/sbbkhxOU3CkfVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2103
Received-SPF: pass client-ip=2a01:111:f400:7e1a::71f;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWtpaGlrbyBPZGFraSA8
YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiBTZW50OiBUaHVyc2RheSwgMjAgQXByaWwgMjAy
MyAwNzo0Nw0KPiBDYzogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50
ZWNoPjsgSmFzb24gV2FuZw0KPiA8amFzb3dhbmdAcmVkaGF0LmNvbT47IERtaXRyeSBGbGV5dG1h
biA8ZG1pdHJ5LmZsZXl0bWFuQGdtYWlsLmNvbT47DQo+IE1pY2hhZWwgUyAuIFRzaXJraW4gPG1z
dEByZWRoYXQuY29tPjsgQWxleCBCZW5uw6llDQo+IDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjsg
UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPjsNCj4gVGhvbWFzIEh1
dGggPHRodXRoQHJlZGhhdC5jb20+OyBXYWluZXIgZG9zIFNhbnRvcyBNb3NjaGV0dGENCj4gPHdh
aW5lcnNtQHJlZGhhdC5jb20+OyBCZXJhbGRvIExlYWwgPGJsZWFsQHJlZGhhdC5jb20+OyBDbGVi
ZXIgUm9zYQ0KPiA8Y3Jvc2FAcmVkaGF0LmNvbT47IExhdXJlbnQgVml2aWVyIDxsdml2aWVyQHJl
ZGhhdC5jb20+OyBQYW9sbyBCb256aW5pDQo+IDxwYm9uemluaUByZWRoYXQuY29tPjsgcWVtdS1k
ZXZlbEBub25nbnUub3JnOyBUb21hc3ogRHppZWNpb2wNCj4gPHQuZHppZWNpb2xAcGFydG5lci5z
YW1zdW5nLmNvbT47IEFraWhpa28gT2Rha2kNCj4gPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4N
Cj4gU3ViamVjdDogW1BBVENIIHYyIDI3LzQxXSBuZXQvZXRoOiBBbHdheXMgYWRkIFZMQU4gdGFn
DQo+IA0KPiBJdCBpcyBwb3NzaWJsZSB0byBoYXZlIGFub3RoZXIgVkxBTiB0YWcgZXZlbiBpZiB0
aGUgcGFja2V0IGlzIGFscmVhZHkgdGFnZ2VkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWtpaGlr
byBPZGFraSA8YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiAtLS0NCj4gIGluY2x1ZGUvbmV0
L2V0aC5oICAgfCAgNCArKy0tDQo+ICBody9uZXQvbmV0X3R4X3BrdC5jIHwgMTYgKysrKysrKy0t
LS0tLS0tLQ0KPiAgbmV0L2V0aC5jICAgICAgICAgICB8IDIyICsrKysrKy0tLS0tLS0tLS0tLS0t
LS0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9uZXQvZXRoLmggYi9pbmNsdWRlL25ldC9ldGgu
aCBpbmRleA0KPiA5NWZmMjRkNmI4Li4wNDhlNDM0Njg1IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRl
L25ldC9ldGguaA0KPiArKysgYi9pbmNsdWRlL25ldC9ldGguaA0KPiBAQCAtMzUzLDggKzM1Myw4
IEBAIGV0aF9zdHJpcF92bGFuX2V4KGNvbnN0IHN0cnVjdCBpb3ZlYyAqaW92LCBpbnQgaW92Y250
LA0KPiBzaXplX3QgaW92b2ZmLCAgdWludDE2X3QgIGV0aF9nZXRfbDNfcHJvdG8oY29uc3Qgc3Ry
dWN0IGlvdmVjICpsMmhkcl9pb3YsIGludA0KPiBpb3ZjbnQsIHNpemVfdCBsMmhkcl9sZW4pOw0K
PiANCj4gLXZvaWQgZXRoX3NldHVwX3ZsYW5faGVhZGVycyhzdHJ1Y3QgZXRoX2hlYWRlciAqZWhk
ciwgdWludDE2X3Qgdmxhbl90YWcsDQo+IC0gICAgdWludDE2X3Qgdmxhbl9ldGh0eXBlLCBib29s
ICppc19uZXcpOw0KPiArdm9pZCBldGhfc2V0dXBfdmxhbl9oZWFkZXJzKHN0cnVjdCBldGhfaGVh
ZGVyICplaGRyLCBzaXplX3QgKmVoZHJfc2l6ZSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1aW50MTZfdCB2bGFuX3RhZywgdWludDE2X3Qgdmxhbl9ldGh0eXBlKTsNCj4gDQo+IA0K
PiAgdWludDhfdCBldGhfZ2V0X2dzb190eXBlKHVpbnQxNl90IGwzX3Byb3RvLCB1aW50OF90ICps
M19oZHIsIHVpbnQ4X3QgbDRwcm90byk7DQo+IGRpZmYgLS1naXQgYS9ody9uZXQvbmV0X3R4X3Br
dC5jIGIvaHcvbmV0L25ldF90eF9wa3QuYyBpbmRleA0KPiBjZTZiMTAyMzkxLi5hZjhmNzdhM2Yw
IDEwMDY0NA0KPiAtLS0gYS9ody9uZXQvbmV0X3R4X3BrdC5jDQo+ICsrKyBiL2h3L25ldC9uZXRf
dHhfcGt0LmMNCj4gQEAgLTQwLDcgKzQwLDEwIEBAIHN0cnVjdCBOZXRUeFBrdCB7DQo+IA0KPiAg
ICAgIHN0cnVjdCBpb3ZlYyAqdmVjOw0KPiANCj4gLSAgICB1aW50OF90IGwyX2hkcltFVEhfTUFY
X0wyX0hEUl9MRU5dOw0KPiArICAgIHN0cnVjdCB7DQo+ICsgICAgICAgIHN0cnVjdCBldGhfaGVh
ZGVyIGV0aDsNCj4gKyAgICAgICAgc3RydWN0IHZsYW5faGVhZGVyIHZsYW5bM107DQo+ICsgICAg
fSBsMl9oZHI7DQo+ICAgICAgdW5pb24gew0KPiAgICAgICAgICBzdHJ1Y3QgaXBfaGVhZGVyIGlw
Ow0KPiAgICAgICAgICBzdHJ1Y3QgaXA2X2hlYWRlciBpcDY7DQo+IEBAIC0zNjUsMTggKzM2OCwx
MyBAQCBib29sIG5ldF90eF9wa3RfYnVpbGRfdmhlYWRlcihzdHJ1Y3QgTmV0VHhQa3QNCj4gKnBr
dCwgYm9vbCB0c29fZW5hYmxlLCAgdm9pZCBuZXRfdHhfcGt0X3NldHVwX3ZsYW5faGVhZGVyX2V4
KHN0cnVjdCBOZXRUeFBrdA0KPiAqcGt0LA0KPiAgICAgIHVpbnQxNl90IHZsYW4sIHVpbnQxNl90
IHZsYW5fZXRodHlwZSkgIHsNCj4gLSAgICBib29sIGlzX25ldzsNCj4gICAgICBhc3NlcnQocGt0
KTsNCj4gDQo+ICAgICAgZXRoX3NldHVwX3ZsYW5faGVhZGVycyhwa3QtPnZlY1tORVRfVFhfUEtU
X0wySERSX0ZSQUddLmlvdl9iYXNlLA0KPiAtICAgICAgICB2bGFuLCB2bGFuX2V0aHR5cGUsICZp
c19uZXcpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgJnBrdC0+dmVjW05FVF9UWF9Q
S1RfTDJIRFJfRlJBR10uaW92X2xlbiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHZs
YW4sIHZsYW5fZXRodHlwZSk7DQo+IA0KPiAtICAgIC8qIHVwZGF0ZSBsMmhkcmxlbiAqLw0KPiAt
ICAgIGlmIChpc19uZXcpIHsNCj4gLSAgICAgICAgcGt0LT5oZHJfbGVuICs9IHNpemVvZihzdHJ1
Y3Qgdmxhbl9oZWFkZXIpOw0KPiAtICAgICAgICBwa3QtPnZlY1tORVRfVFhfUEtUX0wySERSX0ZS
QUddLmlvdl9sZW4gKz0NCj4gLSAgICAgICAgICAgIHNpemVvZihzdHJ1Y3Qgdmxhbl9oZWFkZXIp
Ow0KPiAtICAgIH0NCj4gKyAgICBwa3QtPmhkcl9sZW4gKz0gc2l6ZW9mKHN0cnVjdCB2bGFuX2hl
YWRlcik7DQo+ICB9DQo+IA0KPiAgYm9vbCBuZXRfdHhfcGt0X2FkZF9yYXdfZnJhZ21lbnQoc3Ry
dWN0IE5ldFR4UGt0ICpwa3QsIHZvaWQgKmJhc2UsIHNpemVfdA0KPiBsZW4pIGRpZmYgLS1naXQg
YS9uZXQvZXRoLmMgYi9uZXQvZXRoLmMgaW5kZXggZjdmZmJkYTYwMC4uNTMwNzk3ODQ4NiAxMDA2
NDQNCj4gLS0tIGEvbmV0L2V0aC5jDQo+ICsrKyBiL25ldC9ldGguYw0KPiBAQCAtMjEsMjYgKzIx
LDE2IEBADQo+ICAjaW5jbHVkZSAibmV0L2NoZWNrc3VtLmgiDQo+ICAjaW5jbHVkZSAibmV0L3Rh
cC5oIg0KPiANCj4gLXZvaWQgZXRoX3NldHVwX3ZsYW5faGVhZGVycyhzdHJ1Y3QgZXRoX2hlYWRl
ciAqZWhkciwgdWludDE2X3Qgdmxhbl90YWcsDQo+IC0gICAgdWludDE2X3Qgdmxhbl9ldGh0eXBl
LCBib29sICppc19uZXcpDQo+ICt2b2lkIGV0aF9zZXR1cF92bGFuX2hlYWRlcnMoc3RydWN0IGV0
aF9oZWFkZXIgKmVoZHIsIHNpemVfdCAqZWhkcl9zaXplLA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQxNl90IHZsYW5fdGFnLCB1aW50MTZfdCB2bGFuX2V0aHR5cGUpDQo+ICB7
DQo+ICAgICAgc3RydWN0IHZsYW5faGVhZGVyICp2aGRyID0gUEtUX0dFVF9WTEFOX0hEUihlaGRy
KTsNCj4gDQo+IC0gICAgc3dpdGNoIChiZTE2X3RvX2NwdShlaGRyLT5oX3Byb3RvKSkgew0KPiAt
ICAgIGNhc2UgRVRIX1BfVkxBTjoNCj4gLSAgICBjYXNlIEVUSF9QX0RWTEFOOg0KPiAtICAgICAg
ICAvKiB2bGFuIGhkciBleGlzdHMgKi8NCj4gLSAgICAgICAgKmlzX25ldyA9IGZhbHNlOw0KPiAt
ICAgICAgICBicmVhazsNCj4gLQ0KPiAtICAgIGRlZmF1bHQ6DQo+IC0gICAgICAgIC8qIE5vIFZM
QU4gaGVhZGVyLCBwdXQgYSBuZXcgb25lICovDQo+IC0gICAgICAgIHZoZHItPmhfcHJvdG8gPSBl
aGRyLT5oX3Byb3RvOw0KPiAtICAgICAgICBlaGRyLT5oX3Byb3RvID0gY3B1X3RvX2JlMTYodmxh
bl9ldGh0eXBlKTsNCj4gLSAgICAgICAgKmlzX25ldyA9IHRydWU7DQo+IC0gICAgICAgIGJyZWFr
Ow0KPiAtICAgIH0NCj4gKyAgICBtZW1tb3ZlKHZoZHIgKyAxLCB2aGRyLCAqZWhkcl9zaXplIC0g
RVRIX0hMRU4pOw0KDQpEbyB3ZSBuZWVkIGEgY2hlY2sgdGhhdCB3ZSBhcmUgbm90IG92ZXJmbG93
aW5nIHRoZSB2bGFuIGFycmF5IHNpemU/DQoNCj4gICAgICB2aGRyLT5oX3RjaSA9IGNwdV90b19i
ZTE2KHZsYW5fdGFnKTsNCj4gKyAgICB2aGRyLT5oX3Byb3RvID0gZWhkci0+aF9wcm90bzsNCj4g
KyAgICBlaGRyLT5oX3Byb3RvID0gY3B1X3RvX2JlMTYodmxhbl9ldGh0eXBlKTsNCj4gKyAgICAq
ZWhkcl9zaXplICs9IHNpemVvZigqdmhkcik7DQo+ICB9DQo+IA0KPiAgdWludDhfdA0KPiAtLQ0K
PiAyLjQwLjANCg0K

