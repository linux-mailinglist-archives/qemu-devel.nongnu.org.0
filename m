Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C536E3357
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 21:47:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnlqR-0002YX-PB; Sat, 15 Apr 2023 15:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlqP-0002Y8-Uh
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:45:58 -0400
Received: from mail-am7eur03on20728.outbound.protection.outlook.com
 ([2a01:111:f400:7eaf::728]
 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlqO-0005kZ-41
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:45:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdylHDBZ2/SGL5LIgngm72WZ8YML0HK6oW6j6o63qxFHyGJAd7wFz2UhjtNdA2PacPqrOZptBIAi/eCKjLX2Ld2A0dMxIFd9HbUtSIZ0sN2mpvgPHSX4yIxQcP51zRvjuNx+OCu2w/58VnwGXk5S/WQehQkIhb5B2HuUDLDQRaLgUqnKOg5t7iuk2cEuvi+/T1lNipuQzC2Gc0WOT1QIKVshXH4hKhCQRPGVGMkEcGhCWU9Q/J7L04dpv95qZuiHVrUpJXML9XkQzkGWpFHfQDWgIxPR1x6iQzFwPftG92tkTcHgV9RrKtWIssd16BDl/vHHTTDhzgJthIVBososhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJs3diHKNhPJb5IzjRRBjiRWAxzDDbK7ixiTQKpBk+Q=;
 b=LMo5X/9CMSqRs1zZ4zmScL8iQN+oQREL2XbnVlMcH2EdcnbECKxNf5EN127Bg2JeYGG9SBg91SEzY+0OAiNDtsUpgtfmcN6hD8GshBT5q1DPKndaIOexOLOuohytifDwpRtS20HfpXjcdp/vsprEJm1J7yoxZ74GmHce+Cg9y29ZkBrlTNm0+XCSKbX72MZvRz90HdK861hbW1KeZdmBevRzhVEmcpmJR1dpiOoPCL++mrabE76sqsXIYN2fsnQYn3ZlQWvAlzRrfeLSVsxuc+JGLJtHjj0ZYPtAkLjgHhiYE9Emp42rtunl1bZrxjgsJM2PLvxprVZS4Qs3DPkjVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJs3diHKNhPJb5IzjRRBjiRWAxzDDbK7ixiTQKpBk+Q=;
 b=bVzjxI5fctJJEPpZJwREqQxCOZp9oJ7b3N35Rddn/QNxqFRFJ/vrD3q9N9VzMeZZst0daavD3krJyLxATuVsaLC61EAr8LUi2IS5ZUbiWQsU6ZZiVJ2o1d0YyZstHJFiQ1N3BokBLSAQ2ppytjDPsSgQDxv/z1JndjVRyj7t2dw=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB9P189MB1977.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.49; Sat, 15 Apr
 2023 19:45:51 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6298.030; Sat, 15 Apr 2023
 19:45:50 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 31/40] igb: Use UDP for RSS hash
Thread-Topic: [PATCH 31/40] igb: Use UDP for RSS hash
Thread-Index: AQHZbsXb0QPCXEAoc0C627KKrfey9K8sxU7g
Date: Sat, 15 Apr 2023 19:45:50 +0000
Message-ID: <DBBP189MB14334CAD70DFDEA0917DFF58959E9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-32-akihiko.odaki@daynix.com>
In-Reply-To: <20230414113737.62803-32-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB9P189MB1977:EE_
x-ms-office365-filtering-correlation-id: fae45ba1-4bb3-4140-746d-08db3dea0454
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IlX3W3+EncWF8TCpXaqMf54VLF9V5QFeB5/6YkVVUeundmR2EKiSeYg8SNsop2xb9G5g+Ky7sAXI5YylzBThNOrDUK2gPJZiA57BY0uGhHMDuN/qaKnkGClJ+rDMNgPKOA+P/RHCZqBK7S3VpLI4OD2LQBoID0mOQDBwLQkU9OAviK/aptW7gBnPTngxE1XXXna7X49uDOZNZJSsq5WpHvnZQWOOMGEmdA/YFw685sGR/6xxznJkAq2dHDpsf80TMaDe0NeCyQIZChqN3dlOmF0iMSo+b3qtKTh0VdMfusczip8bIsZntHXkir7dpsinLo4mv8aR3doWGPyGxOFgIaE+KwKomh+ppUt/5J7LLjin1K+2VePjGDkJwguaDgOK1bLomgmBtK5LYKi0emqpIzw9ZjraTdtIwKDC9P5my2JJ3voekYs6Y0wB+m+vsyI615lCGqKIM0vGXOWr/2nEQBqPpVBy8bUYRrQ2+JOZdYlM3FLCq6u/cVt3sr4/kJxXEqCE5fzj+2DkGkZRF38eEMlv778RQAamwswRvMssy2k6nKxV4CyoMS5tZ1nhmCF6O1NlxXYbSOY2gs8aZbUjeuqSRSE2zOqroOTHI1MgvXhGJGlGlvfIAbRlDSZIRFTC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(136003)(396003)(39830400003)(451199021)(86362001)(33656002)(316002)(4326008)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(6916009)(54906003)(41300700001)(7696005)(478600001)(71200400001)(55016003)(5660300002)(7416002)(8936002)(52536014)(2906002)(44832011)(38070700005)(122000001)(38100700002)(186003)(9686003)(6506007)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDJFQ0g0TkRqYXNpYkFIZU93VTdVWFR4c0VxT1h3Wk0yb1l3TWp3bUt6UU05?=
 =?utf-8?B?QnRkWkoxRG9YdUFpSmJ4Rno4MWVMNEFIYWhqNTVjaStjWnlFbmMwWFMyRktH?=
 =?utf-8?B?SS9ObVkvaEhPblNhUDlCSEtVWFE0QTFSUXFOK0xWS2t2cnhsWmM5TlpIWm5E?=
 =?utf-8?B?WENhbFpyVGVGRSsxOFNMOTR5U1p1VGRYRUtJbVpMOFJsdFg5TXVleVdCUFFB?=
 =?utf-8?B?QVBhM0cvemxBYXFMTFVEeUpFZldhc3JGdVBXK05TTXYvYzRldTUwUWx0U3Qx?=
 =?utf-8?B?U1Nzek05VFVrZlVvelFEN3ZYVUJYWTF6Wko5MDl1cmZqUWpnOXpCWEYyTkJW?=
 =?utf-8?B?RFRDcEdhOG53Uld6a0V6TGR0aFFrZFMweTdBOTN0b1VnaWNKcGkvcEJ5SjF5?=
 =?utf-8?B?U0pleklyOEFlRjZTSkJRRTZWRFNOc3M4V1BseGJYMTRKeTlDNnhtSXd3dFFn?=
 =?utf-8?B?NnAydlYvNDRRemx6M2dHejlxUzdWWEhmS2V5TGNXZ2ZUeTMxOFl4V1oweVZT?=
 =?utf-8?B?eFNuT3VObUIyM0pjY1pjWmhjNTNDbGhqMkRhRENkbWovUCtXRXpHYkRTTHhi?=
 =?utf-8?B?eWZmYWtZOFdwYVltajZwTEtXZWNKSDh0eVBjZDQwSzc3VG1VOTJ1Q1ZjWWpQ?=
 =?utf-8?B?R3R3VE9ucVZtR2w0ZVVUOTZLUFNKQ3gwSG5xbXJzWUYyZHZPaFZCTXg2STgw?=
 =?utf-8?B?Zy9wWC82cXBmUU1EbGFXSmlPQmd2dU5CYVdQNmNWNW5xZDZ3dEVoRXNYaUQ1?=
 =?utf-8?B?YWxmTU1Xa1VOUlJkK0RUZ2Zwa1ZacnFkS3VQalY0ZmppaWFtKzhTZ2MyVzY5?=
 =?utf-8?B?WDRqalJFaVFaZGd3NCtSY2xpb1UrRzBnbmI5SkxkVGJDZ3g2WnJqcE90T0FM?=
 =?utf-8?B?QzJqSjVpa29HZDRGYkFQck5RTUdJN1ZaSnd0YVd2SmoyOWNYc3gyNGhxMGho?=
 =?utf-8?B?L3lVK2lJZHhRTWxHU2ZrdEc0Q2JnQ3BtVlIwZDAwQUVsdDNic3FWaDQ5RWFR?=
 =?utf-8?B?SU91QlBBT1dwMGUrQkxZTDQyZFd3OTdwNm11bEt5d1R1aEUyaTdGWlVCd3h0?=
 =?utf-8?B?SWJUaUJ2K1J2T0UrYi8rR3NxbDNkdVI2RVk0RWpEblJBQnBLMjJNSlpTR2hs?=
 =?utf-8?B?ZVpYZmtRS2oySjhPcW9VM29BVldxMUUza2RPUmpoUmorMDh1SmNXdzhZNVZW?=
 =?utf-8?B?K1ZrSE4weElURnVqcC9aSW53cmNnRStyb0JWdjZVV2RvOWlQU1krTmlKZ0RS?=
 =?utf-8?B?QjVEbElUdTlETkw3UUdRcjNZWkYyOGNRNEJFRzVONzJKR3ZhN3hES0hKem10?=
 =?utf-8?B?dnNjRWFBN2RWTDZJUk1OWS9oNlVia3NpT25kSEN3T3F6eTJ5aEtUazg5c0c2?=
 =?utf-8?B?Ny9oOXZVVHdKQjZqLytqSG9wblpMYm9ucGx2bWVYWTBkNGVOem9NRVcySk1Y?=
 =?utf-8?B?K01JT0s1N2ZpZmFyN0VLYlJOdzZDT0QvYjljVXZlMEMwK2ZCZ3pPeEhLOVJp?=
 =?utf-8?B?bURDMm80VkQzdHpZNlpFZEpCc1M0dFF4YWd1dEdkcGVFNUpJWGxISXpmZ3lX?=
 =?utf-8?B?alVGTUxFdE92NXd2dkV3TkZSb1F5UHZFMFNMQklFQm96UTRQaWVBSEdqTmhs?=
 =?utf-8?B?a1lFVVRLdDBaU2tweFpDNC9TNzJuMEhjeEM3aGJCRmREMHdjTElYclYwNTdQ?=
 =?utf-8?B?V2c2Z1lESmJRaENiaWxxa1NlYytRUUNrVkF2UUJmZGtwZHFyQ3NxdDFhSGtK?=
 =?utf-8?B?YWs0aHRCZzdHSGlqc3dsSC9XeWpwcUN6d0VQc2hlL3ZqZXN2RkNZTGdiRE1p?=
 =?utf-8?B?andOTHQvdElLRllwMWhwZXhPY1JoeW5JbzNLYjdxcmc1dVR6UUEzMmNiMlRQ?=
 =?utf-8?B?OFBnejB2V21nYWxpanA4MGhZYlZ6MGJMZzgxRDhpcml4bnYvOVhqbUJZcmww?=
 =?utf-8?B?Ri9ONEU5bngvMkZLVU9kZC9aQk1RREQwRVAwS1VSUlhoZmpFaUJhUS9QU0E4?=
 =?utf-8?B?WWszTUcwWWUybFRFRXAzM3RVTVJZdjFLY3RLUmJDQ2lQUWg4VEluR3ZWZnQr?=
 =?utf-8?B?N2k5RWptVTlNb2ltL3pSazI4TUlYb0Y5WFFhc2szYzR3dzBXcnRNYTlpLzZh?=
 =?utf-8?Q?uPh8cl6e0NiSm8R/ovltBd3Jm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fae45ba1-4bb3-4140-746d-08db3dea0454
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2023 19:45:50.7216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GbTksydto/5VmLCBhm1HkgyI7Im00waJR0zaHVqva412B8uqpJ5e3k6o1plfMfqfRW3wiW08qHaZt/FNIASaeTr6TZkMOrg6K5F7czuY2HA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1977
Received-SPF: pass client-ip=2a01:111:f400:7eaf::728;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWtpaGlrbyBPZGFraSA8
YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiBTZW50OiBGcmlkYXksIDE0IEFwcmlsIDIwMjMg
MTM6MzcNCj4gQ2M6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVj
aD47IEphc29uIFdhbmcNCj4gPGphc293YW5nQHJlZGhhdC5jb20+OyBEbWl0cnkgRmxleXRtYW4g
PGRtaXRyeS5mbGV5dG1hbkBnbWFpbC5jb20+Ow0KPiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEBy
ZWRoYXQuY29tPjsgQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjsNCj4gUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPjsgVGhvbWFzIEh1dGgNCj4g
PHRodXRoQHJlZGhhdC5jb20+OyBXYWluZXIgZG9zIFNhbnRvcyBNb3NjaGV0dGENCj4gPHdhaW5l
cnNtQHJlZGhhdC5jb20+OyBCZXJhbGRvIExlYWwgPGJsZWFsQHJlZGhhdC5jb20+OyBDbGViZXIg
Um9zYQ0KPiA8Y3Jvc2FAcmVkaGF0LmNvbT47IExhdXJlbnQgVml2aWVyIDxsdml2aWVyQHJlZGhh
dC5jb20+OyBQYW9sbyBCb256aW5pDQo+IDxwYm9uemluaUByZWRoYXQuY29tPjsgcWVtdS1kZXZl
bEBub25nbnUub3JnOyBBa2loaWtvIE9kYWtpDQo+IDxha2loaWtvLm9kYWtpQGRheW5peC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCAzMS80MF0gaWdiOiBVc2UgVURQIGZvciBSU1MgaGFzaA0KPiAN
Cj4gZTEwMDBlIGRvZXMgbm90IHN1cHBvcnQgdXNpbmcgVURQIGZvciBSU1MgaGFzaCwgYnV0IGln
YiBkb2VzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWtpaGlrbyBPZGFraSA8YWtpaGlrby5vZGFr
aUBkYXluaXguY29tPg0KPiAtLS0NCj4gIGh3L25ldC9pZ2JfY29yZS5jIHwgMTYgKysrKysrKysr
KysrKysrKyAgaHcvbmV0L2lnYl9yZWdzLmggfCAgMyArKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MTkgaW5zZXJ0aW9ucygrKQ0KDQpSZXZpZXdlZC1ieTogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJh
bS55YWduYXJhbWFuQGVzdC50ZWNoPg0KDQpVRFAgaGFzaCB0eXBlcyBsb29rIGdvb2QgdG8gbWUs
IGJ1dCB3aGlsZSByZXZpZXdpbmcgdGhpcyBwYXRjaCBJIHJlYWxpemVkIE1SUUMgYml0IDE4IGlz
IGRpZmZlcmVudCBiZXR3ZWVuIGlnYiBhbmQgZTEwMDBlLg0KaWdiOiBNUlFDIEJJVCgxOCkgLT4g
VGNwSVB2NkV4DQppZ2I6IE1SUUMgQklUKDIxKSAtPiBUY3BJUHY2DQplMTAwMGU6IE1SUUMgQklU
KDE4KSAtPiBUY3BJUHY2DQoNCg0KPiBkaWZmIC0tZ2l0IGEvaHcvbmV0L2lnYl9jb3JlLmMgYi9o
dy9uZXQvaWdiX2NvcmUuYyBpbmRleA0KPiA1Njk4OTdmYjk5Li4zYWQ4MWIxNWQwIDEwMDY0NA0K
PiAtLS0gYS9ody9uZXQvaWdiX2NvcmUuYw0KPiArKysgYi9ody9uZXQvaWdiX2NvcmUuYw0KPiBA
QCAtMjc5LDYgKzI3OSwxMSBAQCBpZ2JfcnNzX2dldF9oYXNoX3R5cGUoSUdCQ29yZSAqY29yZSwg
c3RydWN0DQo+IE5ldFJ4UGt0ICpwa3QpDQo+ICAgICAgICAgICAgICByZXR1cm4gRTEwMDBfTVJR
X1JTU19UWVBFX0lQVjRUQ1A7DQo+ICAgICAgICAgIH0NCj4gDQo+ICsgICAgICAgIGlmIChsNGhk
cl9wcm90byA9PSBFVEhfTDRfSERSX1BST1RPX1VEUCAmJg0KPiArICAgICAgICAgICAgKGNvcmUt
Pm1hY1tNUlFDXSAmIEUxMDAwX01SUUNfUlNTX0ZJRUxEX0lQVjRfVURQKSkgew0KPiArICAgICAg
ICAgICAgcmV0dXJuIEUxMDAwX01SUV9SU1NfVFlQRV9JUFY0VURQOw0KPiArICAgICAgICB9DQo+
ICsNCj4gICAgICAgICAgaWYgKEUxMDAwX01SUUNfRU5fSVBWNChjb3JlLT5tYWNbTVJRQ10pKSB7
DQo+ICAgICAgICAgICAgICByZXR1cm4gRTEwMDBfTVJRX1JTU19UWVBFX0lQVjQ7DQo+ICAgICAg
ICAgIH0NCj4gQEAgLTMxNCw2ICszMTksMTEgQEAgaWdiX3Jzc19nZXRfaGFzaF90eXBlKElHQkNv
cmUgKmNvcmUsIHN0cnVjdA0KPiBOZXRSeFBrdCAqcGt0KQ0KPiAgICAgICAgICAgICAgICAgIHJl
dHVybiBFMTAwMF9NUlFfUlNTX1RZUEVfSVBWNlRDUDsNCj4gICAgICAgICAgICAgIH0NCj4gDQo+
ICsgICAgICAgICAgICBpZiAobDRoZHJfcHJvdG8gPT0gRVRIX0w0X0hEUl9QUk9UT19VRFAgJiYN
Cj4gKyAgICAgICAgICAgICAgICAoY29yZS0+bWFjW01SUUNdICYgRTEwMDBfTVJRQ19SU1NfRklF
TERfSVBWNl9VRFApKSB7DQo+ICsgICAgICAgICAgICAgICAgcmV0dXJuIEUxMDAwX01SUV9SU1Nf
VFlQRV9JUFY2VURQOw0KPiArICAgICAgICAgICAgfQ0KPiArDQo+ICAgICAgICAgICAgICBpZiAo
RTEwMDBfTVJRQ19FTl9JUFY2RVgoY29yZS0+bWFjW01SUUNdKSkgew0KPiAgICAgICAgICAgICAg
ICAgIHJldHVybiBFMTAwMF9NUlFfUlNTX1RZUEVfSVBWNkVYOw0KPiAgICAgICAgICAgICAgfQ0K
PiBAQCAtMzUyLDYgKzM2MiwxMiBAQCBpZ2JfcnNzX2NhbGNfaGFzaChJR0JDb3JlICpjb3JlLCBz
dHJ1Y3QgTmV0UnhQa3QNCj4gKnBrdCwgRTEwMDBFX1JTU0luZm8gKmluZm8pDQo+ICAgICAgY2Fz
ZSBFMTAwMF9NUlFfUlNTX1RZUEVfSVBWNkVYOg0KPiAgICAgICAgICB0eXBlID0gTmV0UGt0UnNz
SXBWNkV4Ow0KPiAgICAgICAgICBicmVhazsNCj4gKyAgICBjYXNlIEUxMDAwX01SUV9SU1NfVFlQ
RV9JUFY0VURQOg0KPiArICAgICAgICB0eXBlID0gTmV0UGt0UnNzSXBWNFVkcDsNCj4gKyAgICAg
ICAgYnJlYWs7DQo+ICsgICAgY2FzZSBFMTAwMF9NUlFfUlNTX1RZUEVfSVBWNlVEUDoNCj4gKyAg
ICAgICAgdHlwZSA9IE5ldFBrdFJzc0lwVjZVZHA7DQo+ICsgICAgICAgIGJyZWFrOw0KPiAgICAg
IGRlZmF1bHQ6DQo+ICAgICAgICAgIGFzc2VydChmYWxzZSk7DQo+ICAgICAgICAgIHJldHVybiAw
Ow0KPiBkaWZmIC0tZ2l0IGEvaHcvbmV0L2lnYl9yZWdzLmggYi9ody9uZXQvaWdiX3JlZ3MuaCBp
bmRleA0KPiAyMmNlOTA5MTczLi4wMzQ4NmVkYjJlIDEwMDY0NA0KPiAtLS0gYS9ody9uZXQvaWdi
X3JlZ3MuaA0KPiArKysgYi9ody9uZXQvaWdiX3JlZ3MuaA0KPiBAQCAtNjU5LDYgKzY1OSw5IEBA
IHVuaW9uIGUxMDAwX2Fkdl9yeF9kZXNjIHsNCj4gDQo+ICAjZGVmaW5lIEUxMDAwX1JTU19RVUVV
RShyZXRhLCBoYXNoKSAoRTEwMDBfUkVUQV9WQUwocmV0YSwgaGFzaCkgJiAweDBGKQ0KPiANCj4g
KyNkZWZpbmUgRTEwMDBfTVJRX1JTU19UWVBFX0lQVjRVRFAgNw0KPiArI2RlZmluZSBFMTAwMF9N
UlFfUlNTX1RZUEVfSVBWNlVEUCA4DQo+ICsNCj4gICNkZWZpbmUgRTEwMDBfU1RBVFVTX0lPVl9N
T0RFIDB4MDAwNDAwMDANCj4gDQo+ICAjZGVmaW5lIEUxMDAwX1NUQVRVU19OVU1fVkZTX1NISUZU
IDE0DQo+IC0tDQo+IDIuNDAuMA0KDQo=

