Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0FB6E3372
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 22:14:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnmGl-0006Mc-Pq; Sat, 15 Apr 2023 16:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnmGk-0006MO-3g
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 16:13:10 -0400
Received: from mail-db3eur04on0723.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::723]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnmGi-0001VP-7y
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 16:13:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7T7giOAW1/8wPptcjVfWN66E7+jeMZuMfD3BGYNT8+XvDcdO0m6wFQ9KAxKvGgAmWQaS5gtbx0cq1a8B0BvWKoEBXXC1jF4XNbGtip7bRScGsrObhmgF8EqbxdF6Hqkg0NHYkhGT643s65SZ1rx5fMnUrSKKkUPgsrZYOHSccH1ZYEo5Jy0UblVDN9IMyidEsWKnpuMjkJ0J5n0NxN1y4E6UnsGswELfEHbkSWFkPRX5+7WDCQtjr2C8boCeeQjoJPOW9q9tZ/yjHyGZ+dBgIRHQ8WYlCSl16/aa+uabR5DNA9SneOpxEHcsVS4aZ715njKqbYE59R+jranu1FWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWPs2pGaQA6uCM3H4ATKj39gUFsDOXkgjIBFCLpgw3w=;
 b=N9d25dK/7pcuLNb1e6siIgiIavB4FGYsPHkb1dgO6Rtfu5Gvh6Car/YyDHemyZ2O3eXW6K6l2buM8feeNlrA4am0sR6TQvoyl/6nQ1j+zBPrfocFf6wqt/8oCljEPLlOSzRPjoGyPal8DnbkUJ7ZNlHouxWTdTmofutIYDkyprttsxTHK/R4VroTkZ0vhu9giH92e/Ru1QwA2Et3mVB+fhKuT+SVsp4q5Yy0P53eK4UMiogHJ+60vQiZG1EAO/wviDkXeCKXna0SN5WD4Di93vRxWcmZJLH0VOWLH/TyuYJeohrp6ebmsAzahIrxuMvNj4rGdiXlkaMYNoK/tn6HbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWPs2pGaQA6uCM3H4ATKj39gUFsDOXkgjIBFCLpgw3w=;
 b=VbYhew7OxVY/6BAOWxy6IFBgHy8Dpb3FvNld3DK0niociHH3p1dVfhDseVh2hhWhisij95ATx/lM+SUJDw8fMDTv255Q6xSTYgN5+Hs/7iZPRK5ohJ4EcJ1gukSwyDSQ5S5c5qbCxSJfKt/Lk8HoA5QGykX+EH360rLKRh9z/yk=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB8P189MB0837.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:166::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Sat, 15 Apr
 2023 20:13:03 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6298.030; Sat, 15 Apr 2023
 20:13:03 +0000
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
Subject: RE: [PATCH 37/40] igb: Implement Tx timestamp
Thread-Topic: [PATCH 37/40] igb: Implement Tx timestamp
Thread-Index: AQHZbsXmg6VCdYAa4UiQV0mfGSwYMa8sz2Nw
Date: Sat, 15 Apr 2023 20:13:03 +0000
Message-ID: <DBBP189MB14332F381054D17A49A0A8E8959E9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-38-akihiko.odaki@daynix.com>
In-Reply-To: <20230414113737.62803-38-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB8P189MB0837:EE_
x-ms-office365-filtering-correlation-id: 103991fe-99ba-4f07-d981-08db3dedd173
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XMkzEP2WfBQb/M+4l2sISYUbrbHkEPdaodNV3AJUZJO2KLr1JF2AF4NF5iBAMbB3r2o0BkV0xOXFXW1Wbm/mCbX2YQOYm95zB6niAlr4Z/mdHXD2v8FzkOnMMgQ1B1wyvSisrhCG1ckgGWLLOGR4iojKvvFG7LFdKfqvW/cJmu0A85oPMNqCAlvT69wvUxbZFKT77SXugH8UAp9dHcAH+TCb0dzfgNPOp91tqFpHLmrQLfK9uruVOWdg52gyqs3/nXVAlKMbMJSXA8DmtQ1pzO8zxhNHEPck61AePM2jUES7YfU1HvLphAvl4LDdXJIk1o9xzYktWu41ai+Uh0eJxb1ClSiiJY5mREZMSuNFNZYVw0mT9xlMdAbbGD3UU4nKIIumiyZ58gppCIRA3LUZZ3j3S6H2s/XiNhk6kaBaa/2gAgGjyAtOleoTSO28UUTNKRHGP3fhUCdc1mMfEwC3IiJsZwPcacYfoNJb7Jc21er3Ahwo9SFFd0L9mzGHCQOut07WI02oQxDJ4x6uIxBV2dqWuDcN3opulJ72F73DkjrOMBfRk5/heSewz+XNQF71KgN5bWget76U9jUkXWhdG0LSBTS/GLasCYW27ZGb3XBOzdH9XWfkCjwaHN1PEQp9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(39830400003)(346002)(396003)(376002)(451199021)(9686003)(55016003)(2906002)(6506007)(33656002)(186003)(26005)(38070700005)(64756008)(8936002)(38100700002)(83380400001)(122000001)(86362001)(66946007)(66556008)(76116006)(66446008)(66476007)(7696005)(71200400001)(478600001)(5660300002)(44832011)(7416002)(52536014)(4326008)(316002)(6916009)(8676002)(54906003)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3FyY3lsczJneVRxdlRXaEdvWkxqazFUeU82MW84OGxKUkZMQnVmTFhLRjRB?=
 =?utf-8?B?SW5iY3dZeVd1VmRRdjlrMUgrM3pOQlpTMUltRzVWLzFWMDBWdS83bXNvOXMw?=
 =?utf-8?B?ZFIvSVM2SGFOR1F6bXloKy8zNmJpSVE4WmJtVlZYeEhoaUFxMllvTWZhY25W?=
 =?utf-8?B?QUppMXJITEF2SHRXemZzZklUcWw1bzMzcG52N25IalMwNk5qZDRjVmZiU3FX?=
 =?utf-8?B?Y1U2SHZaMkg2RlBlTEZOeUVDc1lPRC81ZlhSVkpIVWt6dzZWdk45ZHM2WnRh?=
 =?utf-8?B?cEtreEc5Qm9OR2pZNysvVnNOWTlsRTN0b1NheDdQOVhVMEFlSG02YTd1aGhw?=
 =?utf-8?B?blpWb0ROWVp3N0kwY1pXLzk5cnJBeFEra1pQWlJSOTlUelhWbkVsR3ZwWW55?=
 =?utf-8?B?TVVtMUVSZDFyaU9PN3JibUJIR0NqUC8vSGVJaGZ0N0NJSjBGYXlBMVU0TTRr?=
 =?utf-8?B?VEJQYjh1WnZaU3lUZjJaVEExODhRZkNIRWFhRGRsZ1RkSXpoYmpHbUdyb1Fm?=
 =?utf-8?B?c2tWSEhmU3Q5M2EwVE9QMHdQVzNxT21CTmJ5V1lNd2VzZklCaDhFRXpTK2tK?=
 =?utf-8?B?Y3NiVG5wMEdiaVI3QUZkWWtROUE3MjNRZGhLNmlGRlh6Ni90ejcvOVI5MzE0?=
 =?utf-8?B?L3hhR3N4aTdsNHhWanRaMkVOYVdOOFJHbXluWklRYUt5TEd3WThybHhCUGwy?=
 =?utf-8?B?WGQ5WFV6UDNVQWtBQ1YwQU1nT1FXZkJMVWVmbGZYbnZTaEFjREpGbFJGc0R0?=
 =?utf-8?B?c0F4N1VLWHdVWUhQc3RTNjkyNEdlbUdxUCt4dTEzYUxwNURWVVpUSjlXZys0?=
 =?utf-8?B?VzhBTjNjM1VlUE5JY01RVHEySy9Pb3diT2dpeEpuSTRrYVgyR1RqNkhoQmp6?=
 =?utf-8?B?bW5nWlNDQWdXYmJmeDhoUWg0U2ViSTRnajNtdTQ0SnhZWk1mM0grZ05jK0dU?=
 =?utf-8?B?UGtCQUxHemdDZDJRVnJIWElFYlRtL2hKZk1OUHJqc1h3em56ZTFkZk1jbVhG?=
 =?utf-8?B?V09xN0RVRVEvYTg0cXhDbDQwVDZNM2I0bmJsT2Z1dTZWb3hBMmZ0LzBxVVJq?=
 =?utf-8?B?N0pHeEtkMlVPaWloYW53elNzNnhaZi9oNGNNakdsdXgyNVJPK0FwVkNqQVBY?=
 =?utf-8?B?OThJbERsUlA2TjUvUGJaMFZmYmRQZlMvRFVOQ25SclVtOXBmWEZZTzRZZE5D?=
 =?utf-8?B?cm82U0FpVTR2cDNRRmtCd3BCSjhaQUs4Ky9MYVZxMm9aNTFuR2h0R2g2Z3JZ?=
 =?utf-8?B?eHVEaEx2Nm0rSGV4Z2tOU05iTDFSSzdiQldSd3dQejFMQ21oNS9PZU94a1I4?=
 =?utf-8?B?ZSsvRE5DSlRtTmYrNnZJYmpBZFAzNWRMbTlkQ3cxYldVVWtNUzd4UHdUNjZv?=
 =?utf-8?B?U3pPaGpmck5BR25rczBhQmtiamxzdCtGTzdpSlVVY1pndXNrVnVadVVNQ3Rn?=
 =?utf-8?B?YXBmU2VtWmtoa0d6TnBCaWtYYkpXSHIrVThGWlhneEJuSkRrMTBMc0x3MGNw?=
 =?utf-8?B?RTMyUFZ6WUx3Z0VTOUJSam1KOW1wdFZSS01CRmNmdHUwYkNFVlBCOVlyTjJn?=
 =?utf-8?B?QS9sZUYwNTJTQTYvVXVQZkNPbnVXdThXUjBvS3duNUR5bU5nK1N2d1RwNGpK?=
 =?utf-8?B?WVdVNDZkUnR4dUV2Z0t1emJmMUNaTUhGYmcvM1IraG9IdjE3Vk01RjdiYkZT?=
 =?utf-8?B?cGhDckZEcThQOGNkSFRBYXBXaS9QaUo2WEhoSHk2dVFPMFJ3TWEwVHcvN0ky?=
 =?utf-8?B?OGF5V2lVZ25mUHRtaUxvbFJMdVd2OWEzcFhib0lWcm4zNkdWVE5RL0JPMDFV?=
 =?utf-8?B?TmZtSXAxUkR1TW5yL3BIUWJmNVNtM0lTTHVhbXRaemtTdlFxN2txOERXOTA0?=
 =?utf-8?B?eGMyTWI2aHBVMDRpUkFoalA5TEIzZ3ByWXcvVlg1akVQYVM2bnZKZzJUeklJ?=
 =?utf-8?B?RzRZRnYyWklhZytrUHhGYVY4SXhWTVFqMDk0ZXlrdmxsNHVZR2xPdVZjZVg0?=
 =?utf-8?B?MjJOSmlPS2RZdVVndWY1RGhmRDYya3FtSCt4bzBvdVZlWnBhaUdHUnB4N05X?=
 =?utf-8?B?YzZ1KzZNcFJRVFdRZGpWMGZqR2NQa2tMVzRyenQza0laL2dIaXUzMWxoZmZD?=
 =?utf-8?B?SEIwaWZ0YU5JUTdocG82d0dOeW5tdzl5Q3dEMEdsRmhaMWNlMEw0VDI1Z3E0?=
 =?utf-8?B?Q2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 103991fe-99ba-4f07-d981-08db3dedd173
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2023 20:13:03.3477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FXAQaiYlOmi1OQNdBIKcMq2GsD10pcNbatOJ0FtL+Xnbs2nMoD6tbc3WkRlL6WXd1KOHLm3trcvtVyLllM5MrFKmPnwwlJwnPIuu0p9arW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0837
Received-SPF: pass client-ip=2a01:111:f400:fe0c::723;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
MTM6MzgNCj4gQ2M6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVj
aD47IEphc29uIFdhbmcNCj4gPGphc293YW5nQHJlZGhhdC5jb20+OyBEbWl0cnkgRmxleXRtYW4g
PGRtaXRyeS5mbGV5dG1hbkBnbWFpbC5jb20+Ow0KPiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEBy
ZWRoYXQuY29tPjsgQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjsNCj4gUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPjsgVGhvbWFzIEh1dGgNCj4g
PHRodXRoQHJlZGhhdC5jb20+OyBXYWluZXIgZG9zIFNhbnRvcyBNb3NjaGV0dGENCj4gPHdhaW5l
cnNtQHJlZGhhdC5jb20+OyBCZXJhbGRvIExlYWwgPGJsZWFsQHJlZGhhdC5jb20+OyBDbGViZXIg
Um9zYQ0KPiA8Y3Jvc2FAcmVkaGF0LmNvbT47IExhdXJlbnQgVml2aWVyIDxsdml2aWVyQHJlZGhh
dC5jb20+OyBQYW9sbyBCb256aW5pDQo+IDxwYm9uemluaUByZWRoYXQuY29tPjsgcWVtdS1kZXZl
bEBub25nbnUub3JnOyBBa2loaWtvIE9kYWtpDQo+IDxha2loaWtvLm9kYWtpQGRheW5peC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCAzNy80MF0gaWdiOiBJbXBsZW1lbnQgVHggdGltZXN0YW1wDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBBa2loaWtvIE9kYWtpIDxha2loaWtvLm9kYWtpQGRheW5peC5j
b20+DQo+IC0tLQ0KPiAgaHcvbmV0L2lnYl9jb3JlLmMgfCA3ICsrKysrKysNCj4gIGh3L25ldC9p
Z2JfcmVncy5oIHwgMyArKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2h3L25ldC9pZ2JfY29yZS5jIGIvaHcvbmV0L2lnYl9jb3JlLmMg
aW5kZXgNCj4gYzcxNmY0MDBmZC4uMzhiNTM2NzZkNCAxMDA2NDQNCj4gLS0tIGEvaHcvbmV0L2ln
Yl9jb3JlLmMNCj4gKysrIGIvaHcvbmV0L2lnYl9jb3JlLmMNCj4gQEAgLTYxNCw2ICs2MTQsMTMg
QEAgaWdiX3Byb2Nlc3NfdHhfZGVzYyhJR0JDb3JlICpjb3JlLA0KPiAgICAgICAgICAgICAgICAg
IHR4LT5maXJzdF9vbGluZm9fc3RhdHVzID0gbGUzMl90b19jcHUodHhfZGVzYy0+cmVhZC5vbGlu
Zm9fc3RhdHVzKTsNCj4gICAgICAgICAgICAgICAgICB0eC0+Zmlyc3QgPSBmYWxzZTsNCj4gICAg
ICAgICAgICAgIH0NCj4gKw0KPiArICAgICAgICAgICAgaWYgKChjbWRfdHlwZV9sZW4gJiBFMTAw
MF9BRFZUWERfTUFDX1RTVEFNUCkgJiYNCg0KU2hvdWxkIF4gYmUgdHgtPmZpcnN0X2NtZF90eXBl
X2xlbj8NCk90aGVyd2lzZSwgUmV2aWV3ZWQtYnk6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0u
eWFnbmFyYW1hbkBlc3QudGVjaD4NCg0KPiArICAgICAgICAgICAgICAgIChjb3JlLT5tYWNbVFNZ
TkNUWENUTF0gJiBFMTAwMF9UU1lOQ1RYQ1RMX0VOQUJMRUQpICYmDQo+ICsgICAgICAgICAgICAg
ICAgIShjb3JlLT5tYWNbVFNZTkNUWENUTF0gJiBFMTAwMF9UU1lOQ1RYQ1RMX1ZBTElEKSkgew0K
PiArICAgICAgICAgICAgICAgIGNvcmUtPm1hY1tUU1lOQ1RYQ1RMXSB8PSBFMTAwMF9UU1lOQ1RY
Q1RMX1ZBTElEOw0KPiArICAgICAgICAgICAgICAgIGUxMDAweF90aW1lc3RhbXAoY29yZS0+bWFj
LCBjb3JlLT50aW1hZGosIFRYU1RNUEwsIFRYU1RNUEgpOw0KPiArICAgICAgICAgICAgfQ0KPiAg
ICAgICAgICB9IGVsc2UgaWYgKChjbWRfdHlwZV9sZW4gJiBFMTAwMF9BRFZUWERfRFRZUF9DVFhU
KSA9PQ0KPiAgICAgICAgICAgICAgICAgICAgIEUxMDAwX0FEVlRYRF9EVFlQX0NUWFQpIHsNCj4g
ICAgICAgICAgICAgIC8qIGFkdmFuY2VkIHRyYW5zbWl0IGNvbnRleHQgZGVzY3JpcHRvciAqLyBk
aWZmIC0tZ2l0DQo+IGEvaHcvbmV0L2lnYl9yZWdzLmggYi9ody9uZXQvaWdiX3JlZ3MuaCBpbmRl
eCBiODhkYzlmMWYxLi44MDhiNTg3YTM2DQo+IDEwMDY0NA0KPiAtLS0gYS9ody9uZXQvaWdiX3Jl
Z3MuaA0KPiArKysgYi9ody9uZXQvaWdiX3JlZ3MuaA0KPiBAQCAtMzIyLDYgKzMyMiw5IEBAIHVu
aW9uIGUxMDAwX2Fkdl9yeF9kZXNjIHsNCj4gIC8qIEUxMDAwX0VJVFJfQ05UX0lHTlIgaXMgb25s
eSBmb3IgODI1NzYgYW5kIG5ld2VyICovDQo+ICAjZGVmaW5lIEUxMDAwX0VJVFJfQ05UX0lHTlIg
ICAgIDB4ODAwMDAwMDAgLyogRG9uJ3QgcmVzZXQgY291bnRlcnMgb24NCj4gd3JpdGUgKi8NCj4g
DQo+ICsjZGVmaW5lIEUxMDAwX1RTWU5DVFhDVExfVkFMSUQgICAgMHgwMDAwMDAwMSAvKiB0eCB0
aW1lc3RhbXAgdmFsaWQgKi8NCj4gKyNkZWZpbmUgRTEwMDBfVFNZTkNUWENUTF9FTkFCTEVEICAw
eDAwMDAwMDEwIC8qIGVuYWJsZSB0eA0KPiB0aW1lc3RhbXBwaW5nDQo+ICsqLw0KPiArDQo+ICAv
KiBQQ0kgRXhwcmVzcyBDb250cm9sICovDQo+ICAjZGVmaW5lIEUxMDAwX0dDUl9DTVBMX1RNT1VU
X01BU0sgICAgICAgMHgwMDAwRjAwMA0KPiAgI2RlZmluZSBFMTAwMF9HQ1JfQ01QTF9UTU9VVF8x
MG1zICAgICAgIDB4MDAwMDEwMDANCj4gLS0NCj4gMi40MC4wDQoNCg==

