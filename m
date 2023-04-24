Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADBF6ECB3F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:23:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pquI2-0002CS-Ft; Mon, 24 Apr 2023 07:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pquHz-0002Bq-Dh
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:23:23 -0400
Received: from mail-he1eur04on070a.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::70a]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pquHw-0005HU-RT
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:23:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJJa1fVJK+7/OzyDznsNtVdk/TPXst2Ya1sf6NGcUQ7Gm+nTPYYKIw3B4tTBXgnY6i3pDI9ZBvPcbAcE3iKHEN8MMFggktoTyvY3VCkXDQkyZW6I4g+1xW7STaKtCtiB1Z2mAyD6JabEUZ+hZh5yWTQ/a6DEUqvtcjq+TZ04F60ajwSW+ai+ZY+bF0g1m0dYhbKTAhULofBQywMEy87EFoMMPvBTjVsjYcGtt2WUU0LMOtdpGE9MCHBiwcQLGON663WoHeNAipLIYE3mNwK5/M1byPf2NxcwX/JSN61PgufK0/v0/4KHOMPZEEY43MJNxbVuEViQ7MQEqTY84aFeww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdSsyb7ZRFUKUc6W2YvHZ/SEwMsfYKPMpmwHEc15LjE=;
 b=mlj8leKhMCg/qQieCbmg2DErebDZOx7iUguOqGEEK7i4jHQ54+LhOted0/pS+txi5sLdhRDjNSKBSb600q6H0sfXyh9oRRHBseCHrLd10akt2K1a9Q6gtuXYTCBhNv719TYen+/gDmIJvDZ6+ac0EsGlvCApE6hIOE84XEJhARLEpMiDt8rBQCXMpswgvcHyB7+Dn0HiA0y59M+ctO6LrBjcq4RrcwvMN3zuv3JfScrS56hjeuJkW1pk6+9q408kjbgz2bQL+MmFwTIg/b/w885Aqb0umbAiy2OmNI7SzvXoG3jpDnV25nSENauoe//4VRtthdZ1A+ShSF3HVCmbOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdSsyb7ZRFUKUc6W2YvHZ/SEwMsfYKPMpmwHEc15LjE=;
 b=VjoxpJNyJYGkyJ7Jr28xzDpf9g8f4+Yfr1LYM3HJfLU40dp4YFkKJKZ+2zs8LQTTTVC3OE9/PnPjRoxFezYIGU0RfE02EA/CDe5Bwx2OwXjcnAA4SsAUNAWCMdd01LZnT4l0u7U+5PoShW+NRYAKwrfWxm2qwSIzgVqwuPWd3pI=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB8P189MB1061.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 11:23:15 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 11:23:15 +0000
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
Subject: RE: [PATCH v3 06/47] igb: Clear IMS bits when committing ICR access
Thread-Topic: [PATCH v3 06/47] igb: Clear IMS bits when committing ICR access
Thread-Index: AQHZdZq/2Z1oGREstkmQglJixNV+h686LrGQgAAbjwCAAAeOcA==
Date: Mon, 24 Apr 2023 11:23:15 +0000
Message-ID: <DBBP189MB1433E2751780BD4162D85FE195679@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
 <20230423041833.5302-7-akihiko.odaki@daynix.com>
 <DBBP189MB1433159BD5A688E92C00BA8595679@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
 <410c76a1-8d1d-1835-6676-83e913f5ae24@daynix.com>
In-Reply-To: <410c76a1-8d1d-1835-6676-83e913f5ae24@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB8P189MB1061:EE_
x-ms-office365-filtering-correlation-id: 5c9da150-aae8-4fe2-b986-08db44b64be5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gv0ND7pinhmDSIMHMQPw0ShR98r1syiUOJWpBkalwH/sUWvpGKLwJTia/wv60yy6W0CAF6GxShccqH8ZUuB0u4nFZFS+1nUM9h2ieFiqNjSCqNq052p2cZwAioYZTI1gXgOWJ2vLlyVjwI3MKuNON5+fXTJ6oCJZEfmaX8GoupWq+u4/5wSOGVQgZW43PgD+N8LErdcBmZUVJ4n+R5rQyut5Yl6z9QhKw0kNfodpUvEn2wTDSY4uZhyvxU6Bi8u0KpyVbsOHZ2aawRoKyJiWh0/oK+9wf73I3DeXljp45gQAGa6d+f3UqytKgylPLb9x+SOty6E84nxJ42cTIXKQG34vQk0tnN+iZ2gqs5j//9eOZBdLbkgXftQRJoEwQiZ+U07TRgyZ8+hu467pnOAVA7ELR/YFU2yctfoxLsH/7Pjx9ROS9wtpr6ghA7HRLkyQfIpMcNSYp/iqGM5y9ihQcMWA/FRWFAC10Yr4MUwrfpZreZP0X7XqpouCdWKREMesoLnZgpdaZrroCu87HWj5nwDgjlNNlDBIrVaxKiCrt+H3ZeglPdKfSB+yozSGoIH/c/JD2iivG4bx5AFL+nSyiXdalmr4v99CdN1lIWZAOyM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39840400004)(346002)(376002)(366004)(136003)(451199021)(38100700002)(966005)(122000001)(6506007)(9686003)(53546011)(26005)(55016003)(186003)(83380400001)(66574015)(44832011)(33656002)(2906002)(8676002)(8936002)(7416002)(52536014)(5660300002)(54906003)(478600001)(7696005)(71200400001)(38070700005)(316002)(4326008)(6916009)(41300700001)(64756008)(66446008)(66556008)(66946007)(76116006)(86362001)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEFsRGVBUk5YbW5CbGhMQzdTaVY1R08zZzhMS0NyWWNLMktlWXU0TUEwOGVj?=
 =?utf-8?B?M2NjVDhRcldsQ041MWJQQTM5M09CUlY1Q2JjOXlDQWg2WXhPaEM5WmlFZzcx?=
 =?utf-8?B?M2lNQW1vNUgySE9jVmQ3NER3K3R0TVc0VkxzL3JPZzlIRnZIVVFMTDJYYUZR?=
 =?utf-8?B?WThXbzFDNkY0MVc4VWhPakpzS2NxL1p0UzJUUkVUbUtRUGw5ZHFITHU0TFlK?=
 =?utf-8?B?VkMrcVFPNldKRFltbjJBMzI5c2N6bHpydDZ1WHNVT0RkdFhxWWdiZVZHSEpI?=
 =?utf-8?B?NktXeGFUc05PczhDMWxCcjZHSDl2ZnZqTE5qVXp0S3NwRkkrbjVZQjEzeWNO?=
 =?utf-8?B?N24zTmdSK2c3ZDN0ZWd5NldsWDkveWRYSjgrTk11K0tyQll4R2k4NW5GMS96?=
 =?utf-8?B?UUN3eDBscjRnckdhYW9NVTZKdjYyTUI1Y3VQZTRGRXFaZFM5ZUxVRHZtOVMy?=
 =?utf-8?B?Y2l2d2JVemozRElzbm9RalNWVmdxYnJVM21ndFhXSkJXd1MvLzdrME9mRTlX?=
 =?utf-8?B?U1NzcVY0OEljb1Y0MFR1SCtqQWx3L1hURmRHMVNJYWVFM1l4WTQ1ZFB3MS9p?=
 =?utf-8?B?emtLL1dEL0RQTklabVlHaENtNXo3NGdWMmRrYy9LVzFqYStKeW1pUnE1a1Ni?=
 =?utf-8?B?S1grYjJlRFZFbk05anF5Rk5LNzQ3MlpVZVVsM2lDa3FvUm1TR0VpaGw0eFBP?=
 =?utf-8?B?MU9OMWZ6MkNXcG95N2s1RVhFWEF2QkdQd3pCN25rRTdZUFFuTDQzMEFRWjJu?=
 =?utf-8?B?a1l2RjNJMVNFU3lXcDZuUkQwRUxnTzFVYkxYYUhwM04zNFMwUktmQjVQUXl2?=
 =?utf-8?B?eHZXRlBDSy9ESGhXNU4xZHZBTXBNSmdYYWdCdXNSYUw4YUFtNXB0SjRUaTZx?=
 =?utf-8?B?YWRwUWtTMVIyUTV0T1I0NkR4TkREV29Xb0RGeG9Bd2t5OTZuMUpJZWdPaUpJ?=
 =?utf-8?B?amtpbjErN2dLUGQwQnk2R3doY3BhMHhPSFpTVGNjMXo0bVJjWTVxdlJkekF5?=
 =?utf-8?B?czk4VGxRUU12eHgzWTJTUnVwVXR6eHlLZC82MVVmM0N4ZWllZzRnOVlBOU5S?=
 =?utf-8?B?em1SYkFZRFBEcFdlNmZraHVobHc1YjBLUGQyVFJaRE1iUzRsMzh2L3ZucW11?=
 =?utf-8?B?RHlsYzQ4R3d1SzJWc1p0U3ZsYjJNTitmSERoaWhhSDAyVnNEK0Q2aXBoMWdH?=
 =?utf-8?B?YyttRVZpV25pejF3ZmlOZXAxaTRCZWpBZi94aUVNT3JObnZ1bnR1cWlLbkd2?=
 =?utf-8?B?LzRaUWF0SExUUE44Vk9tbGxGQmFHVnY1YkdEUTBLSS8zT1AveVIvcWkweDdE?=
 =?utf-8?B?bWtLRVZ5WlpubzF4Q3hDTlk1aVdYcjR2ZGRNM0ZkUWZOaXZXTElSL1JqbGYw?=
 =?utf-8?B?akpZRjVzZmlNdWVrWkhodUJtV2JNSGxzRE13UzFlZVNhU3drRTZLR3MvMUp0?=
 =?utf-8?B?OENnM2hjZXg0SmtwalRYalFhRkZOWjk4UC9iTVc3K0hESGxaZlFsZGVZOVJP?=
 =?utf-8?B?NWN4OC9xVFhjd2JXY1Rmd2NYL3NyQWtOcUo4bjh3K0Rqd3ZxVjQ0WmJLZit3?=
 =?utf-8?B?eStYOGR0U2lQb0YraVc3QnhSdWx4TUpMeHlacThJd1hPU3pTNElkeEV1NU11?=
 =?utf-8?B?emIvZWFhVjBvbFZoblZtS2JydmE3dUxUS0NERitvaXAxWTdmbGZnTkVYN2hH?=
 =?utf-8?B?TFFjSU92U3V2ODdiMXN6MENnZVZXY0RGWDAvVjRub1QveUswWTRVYXZwOTNP?=
 =?utf-8?B?V1JqL0NZN0ZPM0R0RDhKd0hDZzI3Y3ZhUlI2VEsrZ0lvb0ZwcjFKbkJoT0dt?=
 =?utf-8?B?ejJJaEVhNGRJQzMwZ1NyeHZKVC9mU1FhRkFqUEltNy92SU5PMXczMVN4UnI3?=
 =?utf-8?B?VllVUlJkL09JVWNOelRualVCNytOMkI2dzZsQ0VYTXZUdnREblJ0eW80MDda?=
 =?utf-8?B?L0xnMytJbkt0Wk9OeWxxUHVHcWRWbHhNZW1ycFNaZ2lUSS83UmRRUDZzOWh2?=
 =?utf-8?B?aWRZRFJpTnI2STlmTlIxRTZiL2xFUEZQTy9wbnkyTnRPU0lJcmhUUTFNWjFK?=
 =?utf-8?B?L3AwUm9qc0pFUW00Mm00Zm03bmJQWGxIY0NpL2xwZTBNaitwZFZnejViWVRl?=
 =?utf-8?Q?te+3EbYjo++QBRmcgGWfLmaJr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9da150-aae8-4fe2-b986-08db44b64be5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 11:23:15.0664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AXfjtHcae8lqhY/w+iHorogsXM301ocqa64EE2VlbGwupXdgmCgnUbq20wkBjVmslANZw3Bhpen+/iEiaupNo5IMlbYIYvSMWatrSVCw9Kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1061
Received-SPF: pass client-ip=2a01:111:f400:fe0d::70a;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFraWhpa28gT2Rha2kgPGFr
aWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gU2VudDogTW9uZGF5LCAyNCBBcHJpbCAyMDIzIDEy
OjUyDQo+IFRvOiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0LnRlY2g+
DQo+IENjOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsgRG1pdHJ5IEZsZXl0bWFu
DQo+IDxkbWl0cnkuZmxleXRtYW5AZ21haWwuY29tPjsgTWljaGFlbCBTIC4gVHNpcmtpbiA8bXN0
QHJlZGhhdC5jb20+OyBBbGV4DQo+IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+OyBQ
aGlsaXBwZSBNYXRoaWV1LURhdWTDqQ0KPiA8cGhpbG1kQGxpbmFyby5vcmc+OyBUaG9tYXMgSHV0
aCA8dGh1dGhAcmVkaGF0LmNvbT47IFdhaW5lciBkb3MgU2FudG9zDQo+IE1vc2NoZXR0YSA8d2Fp
bmVyc21AcmVkaGF0LmNvbT47IEJlcmFsZG8gTGVhbCA8YmxlYWxAcmVkaGF0LmNvbT47DQo+IENs
ZWJlciBSb3NhIDxjcm9zYUByZWRoYXQuY29tPjsgTGF1cmVudCBWaXZpZXIgPGx2aXZpZXJAcmVk
aGF0LmNvbT47IFBhb2xvDQo+IEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+OyBxZW11LWRl
dmVsQG5vbmdudS5vcmc7IFRvbWFzeiBEemllY2lvbA0KPiA8dC5kemllY2lvbEBwYXJ0bmVyLnNh
bXN1bmcuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDA2LzQ3XSBpZ2I6IENsZWFyIElN
UyBiaXRzIHdoZW4gY29tbWl0dGluZyBJQ1IgYWNjZXNzDQo+IA0KPiBPbiAyMDIzLzA0LzI0IDE4
OjI5LCBTcmlyYW0gWWFnbmFyYW1hbiB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogQWtpaGlrbyBPZGFraSA8YWtpaGlrby5vZGFraUBkYXluaXguY29t
Pg0KPiA+PiBTZW50OiBTdW5kYXksIDIzIEFwcmlsIDIwMjMgMDY6MTgNCj4gPj4gQ2M6IFNyaXJh
bSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVjaD47IEphc29uIFdhbmcNCj4g
Pj4gPGphc293YW5nQHJlZGhhdC5jb20+OyBEbWl0cnkgRmxleXRtYW4gPGRtaXRyeS5mbGV5dG1h
bkBnbWFpbC5jb20+Ow0KPiA+PiBNaWNoYWVsIFMgLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT47
IEFsZXggQmVubsOpZQ0KPiA+PiA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47IFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47DQo+ID4+IFRob21hcyBIdXRoIDx0aHV0
aEByZWRoYXQuY29tPjsgV2FpbmVyIGRvcyBTYW50b3MgTW9zY2hldHRhDQo+ID4+IDx3YWluZXJz
bUByZWRoYXQuY29tPjsgQmVyYWxkbyBMZWFsIDxibGVhbEByZWRoYXQuY29tPjsgQ2xlYmVyIFJv
c2ENCj4gPj4gPGNyb3NhQHJlZGhhdC5jb20+OyBMYXVyZW50IFZpdmllciA8bHZpdmllckByZWRo
YXQuY29tPjsgUGFvbG8NCj4gPj4gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT47IHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZzsgVG9tYXN6DQo+IER6aWVjaW9sDQo+ID4+IDx0LmR6aWVjaW9sQHBh
cnRuZXIuc2Ftc3VuZy5jb20+OyBBa2loaWtvIE9kYWtpDQo+ID4+IDxha2loaWtvLm9kYWtpQGRh
eW5peC5jb20+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCB2MyAwNi80N10gaWdiOiBDbGVhciBJTVMg
Yml0cyB3aGVuIGNvbW1pdHRpbmcgSUNSDQo+ID4+IGFjY2Vzcw0KPiA+Pg0KPiA+PiBUaGUgZGF0
YXNoZWV0IHNheXMgY29udHJhZGljdGluZyBzdGF0ZW1lbnRzIHJlZ2FyZGluZyBJQ1IgYWNjZXNz
ZXMgc28NCj4gPj4gaXQgaXMgbm90IHJlbGlhYmxlIHRvIGRldGVybWluZSB0aGUgYmVoYXZpb3Ig
b2YgSUNSIGFjY2Vzc2VzLg0KPiA+PiBIb3dldmVyLCBlMTAwMGUgZG9lcyBjbGVhciBJTVMgYml0
cyB3aGVuIHJlYWRpbmcgSUNSIGFjY2Vzc2VzIGFuZA0KPiA+PiBMaW51eCBhbHNvIGV4cGVjdHMg
SUNSIGFjY2Vzc2VzIHdpbGwgY2xlYXIgSU1TIGJpdHMgYWNjb3JkaW5nIHRvOg0KPiA+PiBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51
eC5naXQvdHINCj4gPj4gZWUvZHJpdmVycy8NCj4gPj4gbmV0L2V0aGVybmV0L2ludGVsL2lnYi9p
Z2JfbWFpbi5jP2g9djYuMiNuODA0OA0KPiA+Pg0KPiA+PiBGaXhlczogM2E5NzdkZWViZSAoIklu
dHJkb2N1ZSBpZ2IgZGV2aWNlIGVtdWxhdGlvbiIpDQo+ID4+IFNpZ25lZC1vZmYtYnk6IEFraWhp
a28gT2Rha2kgPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgaHcv
bmV0L2lnYl9jb3JlLmMgfCA4ICsrKystLS0tDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2h3L25l
dC9pZ2JfY29yZS5jIGIvaHcvbmV0L2lnYl9jb3JlLmMgaW5kZXgNCj4gPj4gOTZhMTE4YjZjMS4u
ZWFjYTViZDJiNiAxMDA2NDQNCj4gPj4gLS0tIGEvaHcvbmV0L2lnYl9jb3JlLmMNCj4gPj4gKysr
IGIvaHcvbmV0L2lnYl9jb3JlLmMNCj4gPj4gQEAgLTI0NTIsMTYgKzI0NTIsMTYgQEAgaWdiX3Nl
dF9pbXMoSUdCQ29yZSAqY29yZSwgaW50IGluZGV4LA0KPiA+PiB1aW50MzJfdA0KPiA+PiB2YWwp
ICBzdGF0aWMgdm9pZCBpZ2JfY29tbWl0X2ljcihJR0JDb3JlICpjb3JlKSAgew0KPiA+PiAgICAg
ICAvKg0KPiA+PiAtICAgICAqIElmIEdQSUUuTlNJQ1IgPSAwLCB0aGVuIHRoZSBjb3B5IG9mIElB
TSB0byBJTVMgd2lsbCBvY2N1ciBvbmx5IGlmIGF0DQo+ID4+ICsgICAgICogSWYgR1BJRS5OU0lD
UiA9IDAsIHRoZW4gdGhlIGNsZWFyIG9mIElNUyB3aWxsIG9jY3VyIG9ubHkgaWYNCj4gPj4gKyBh
dA0KPiA+PiAgICAgICAgKiBsZWFzdCBvbmUgYml0IGlzIHNldCBpbiB0aGUgSU1TIGFuZCB0aGVy
ZSBpcyBhIHRydWUgaW50ZXJydXB0IGFzDQo+ID4+ICAgICAgICAqIHJlZmxlY3RlZCBpbiBJQ1Iu
SU5UQS4NCj4gPj4gICAgICAgICovDQo+ID4+ICAgICAgIGlmICgoY29yZS0+bWFjW0dQSUVdICYg
RTEwMDBfR1BJRV9OU0lDUikgfHwNCj4gPj4gICAgICAgICAgIChjb3JlLT5tYWNbSU1TXSAmJiAo
Y29yZS0+bWFjW0lDUl0gJiBFMTAwMF9JQ1JfSU5UX0FTU0VSVEVEKSkpIHsNCj4gPj4gLSAgICAg
ICAgaWdiX3NldF9pbXMoY29yZSwgSU1TLCBjb3JlLT5tYWNbSUFNXSk7DQo+ID4+IC0gICAgfSBl
bHNlIHsNCj4gPj4gLSAgICAgICAgaWdiX3VwZGF0ZV9pbnRlcnJ1cHRfc3RhdGUoY29yZSk7DQo+
ID4+ICsgICAgICAgIGlnYl9jbGVhcl9pbXNfYml0cyhjb3JlLCBjb3JlLT5tYWNbSUFNXSk7DQo+
ID4+ICAgICAgIH0NCj4gPj4gKw0KPiA+PiArICAgIGlnYl91cGRhdGVfaW50ZXJydXB0X3N0YXRl
KGNvcmUpOw0KPiA+PiAgIH0NCj4gPj4NCj4gPj4gICBzdGF0aWMgdm9pZCBpZ2Jfc2V0X2ljcihJ
R0JDb3JlICpjb3JlLCBpbnQgaW5kZXgsIHVpbnQzMl90IHZhbCkNCj4gPj4gLS0NCj4gPj4gMi40
MC4wDQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWdu
YXJhbWFuQGVzdC50ZWNoPg0KPiA+DQo+ID4gQW4gYWRkaXRpb25hbCBxdWVzdGlvbiwgc2hvdWxk
IElDUiBiZSBjbGVhcmVkIGlmIGFuIGFjdHVhbCBpbnRlcnJ1cHQgd2FzDQo+IGFzc2VydGVkPw0K
PiA+IChBY2NvcmRpbmcgdG8gNy4zLjIuMTEgR1BJRTogTm9uIFNlbGVjdGl2ZSBJbnRlcnJ1cHQg
Y2xlYXIgb24gcmVhZDoNCj4gPiBXaGVuIHNldCwgZXZlcnkgcmVhZCBvZiBJQ1IgY2xlYXJzIGl0
LiBXaGVuIHRoaXMgYml0IGlzIGNsZWFyZWQsIGFuIElDUiByZWFkDQo+IGNhdXNlcyBpdCB0byBi
ZSBjbGVhcmVkIG9ubHkgaWYgYW4gYWN0dWFsIGludGVycnVwdCB3YXMgYXNzZXJ0ZWQgb3IgSU1T
ID0gMGIuKQ0KPiBTb21ldGhpbmcgbGlrZSB0aGlzPw0KPiANCj4gVGhhdCBpcyBoYW5kbGVkIGlu
IGlnYl9jb21taXRfaWNyKCksIHdoaWNoIGlzIHJlbmFtZWQgdG8gaWdiX25zaWNyKCkgaW4gcGF0
Y2gNCj4gImlnYjogTm90aWZ5IG9ubHkgbmV3IGludGVycnVwdHMiLg0KPiANCg0KTW0sIEkgbXVz
dCBiZSBtaXNzaW5nIHNvbWV0aGluZywgYnV0IEkgc3RpbGwgZG9uJ3Qgc2VlIHRoZSBJQ1IgYml0
cyBiZWluZyBjbGVhcmVkIGlnYl9jb21taXRfaWNyL2lnYl9uc2ljcigpLiANCkZvciBlLmcuIGUx
MDAwZV9tYWNfaWNyX3JlYWQgZG9lcyB0aGlzIGV4cGxpY2l0bHk6DQogICAgaWYgKChjb3JlLT5t
YWNbSUNSXSAmIEUxMDAwX0lDUl9BU1NFUlRFRCkgJiYNCiAgICAgICAgKGNvcmUtPm1hY1tDVFJM
X0VYVF0gJiBFMTAwMF9DVFJMX0VYVF9JQU1FKSkgew0KICAgICAgICB0cmFjZV9lMTAwMGVfaXJx
X2ljcl9jbGVhcl9pYW1lKCk7DQogICAgICAgIGNvcmUtPm1hY1tJQ1JdID0gMDsNCiAgICAgICAg
dHJhY2VfZTEwMDBlX2lycV9pY3JfcHJvY2Vzc19pYW1lKCk7DQogICAgICAgIGUxMDAwZV9jbGVh
cl9pbXNfYml0cyhjb3JlLCBjb3JlLT5tYWNbSUFNXSk7DQogICAgfQ0KDQoNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9ody9uZXQvaWdiX2NvcmUuYyBiL2h3L25ldC9pZ2JfY29yZS5jIGluZGV4DQo+
ID4gZWFjYTViZDJiNi4uYWFhZjgwZTRhMyAxMDA2NDQNCj4gPiAtLS0gYS9ody9uZXQvaWdiX2Nv
cmUuYw0KPiA+ICsrKyBiL2h3L25ldC9pZ2JfY29yZS5jDQo+ID4gQEAgLTI1MjksNiArMjUyOSw5
IEBAIGlnYl9tYWNfaWNyX3JlYWQoSUdCQ29yZSAqY29yZSwgaW50IGluZGV4KQ0KPiA+ICAgICAg
IH0gZWxzZSBpZiAoY29yZS0+bWFjW0lNU10gPT0gMCkgew0KPiA+ICAgICAgICAgICB0cmFjZV9l
MTAwMGVfaXJxX2ljcl9jbGVhcl96ZXJvX2ltcygpOw0KPiA+ICAgICAgICAgICBjb3JlLT5tYWNb
SUNSXSA9IDA7DQo+ID4gKyAgICB9IGVsc2UgaWYgKGNvcmUtPm1hY1tJQ1JdICYgRTEwMDBfSUNS
X0lOVF9BU1NFUlRFRCkgew0KPiA+ICsgICAgICAgIGUxMDAwZV9pcnFfaWNyX2NsZWFyX2lhbWUo
KTsNCj4gPiArICAgICAgICBjb3JlLT5tYWNbSUNSXSA9IDA7DQo+ID4gICAgICAgfSBlbHNlIGlm
ICghbXNpeF9lbmFibGVkKGNvcmUtPm93bmVyKSkgew0KPiA+ICAgICAgICAgICB0cmFjZV9lMTAw
MGVfaXJxX2ljcl9jbGVhcl9ub25tc2l4X2ljcl9yZWFkKCk7DQo+ID4gICAgICAgICAgIGNvcmUt
Pm1hY1tJQ1JdID0gMDsNCg==

