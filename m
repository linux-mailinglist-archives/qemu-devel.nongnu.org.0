Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890636E9972
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 18:24:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppX3m-0004qB-2s; Thu, 20 Apr 2023 12:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1ppX3j-0004oY-LM
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:22:59 -0400
Received: from mail-db8eur05on2071f.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::71f]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1ppX3i-0001Vz-7V
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:22:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhcCKMEjNOiMOdEekNrsraxEJbC311vrSUYTwTn6PnskzMfdvg5bUzUxvlmIFJ+lCJ4lKWMpaw3G+vR1nFebv66+cIQVJWlo8Drqm6QIlUc2D6yist5DbKl+60Byk7qmjkEB8S/P0HmcNpXTNpIMT3mIRTcswFNsoaQSZWt16HVOZ6v2a3khEc2auctcNhinWtqif19S8xEzJAxris/zk9Kwbazb8flzKRJuyOjUvZOd7cbx3B1vCXbZq3Z+nYTj0n9cwTGjOi7EEGqNM5atWVg6e5m7QeiOZCcme7aJ+yISpTZXu5ZFPQSXAyMOikSp5BmXxdSWVQBZxjiw8+aaUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiw6BunPFL3vbe/Iom52aka3qZHUdRbX6GCgFrDmwA0=;
 b=jWZsVhrCMIC1TGcZCi7HxepKP8MkKgWuOA5TXiqIKZmfLdL2cNNKIQnT+l7rbN4zZybWvVbLe1ywl2S0zjSMvu0ZMSuUHApBEeJ9FSvO1Dk4i2QxXKo10drMfZ1fS0cIXb2K1IzrtZNEr5OVvqL/mGSZK9CHcCC5MzU8GUkiEKxx/Ko6YWZPavHRsYpd9vSnzIS2FJr3bZakQDJCqYyiL+Wpa3O7GylTdSOlwbN+dH2h5BDZ7rkr38A2sgdEWzspfo66+emznhaGBlIqz1inpkyWZhnCNq/JtRteZTx8/WETAF7GWq3WSP/VhN/4GDEYjAOZB50Sg2+3RX0uubmCDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiw6BunPFL3vbe/Iom52aka3qZHUdRbX6GCgFrDmwA0=;
 b=jO+3F0Lqmq3AieMAUYWOxY7qvrwKOmapw5nAXYeV1HZTRKrF+mRrTbggOJEbs6h9lu9sOQ+utOVt+Rri7AEiCyDc5+YfUIiM1ObnYbxrJlt1wwZMEbcdy11qiUuSNiEy3HQxzohHQDHJxRVW2yKfGCRykBBEsOH5rJ8oVmx1Ra4=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by GVXP189MB2103.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 16:22:23 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 16:22:23 +0000
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
Subject: RE: [PATCH v2 23/41] igb: Add more definitions for Tx descriptor
Thread-Topic: [PATCH v2 23/41] igb: Add more definitions for Tx descriptor
Thread-Index: AQHZc0vOyWleHWONskmVVLrWXJf0WK80WqCw
Date: Thu, 20 Apr 2023 16:22:23 +0000
Message-ID: <DBBP189MB143386893B84842B047A424595639@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 <20230420054657.50367-24-akihiko.odaki@daynix.com>
In-Reply-To: <20230420054657.50367-24-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|GVXP189MB2103:EE_
x-ms-office365-filtering-correlation-id: f111e132-d5dc-406f-81e7-08db41bb6c1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xv2Ib81FH4vhxJPanR6aOq8pJMHzM2geoBmW+osz2yzGwXkHxEZuGf+sBkc4LSiaz5ekiXZhfq6HlxvV8UgExAA1tcPAOLZ056ohNaGqsARHaPguBrG354boCU5SPgKrJVuerQA/7NVvoOqCCT60tDB5iRscPksXSDGHUZidzoaDBR7Fnj/A6UL2Or9/T09rN7yiQFO+08N/ywFd4ibEsHrzWxhCS5CoGnhnq5Qff4ssUxj5lTs5M7+f5PgeX5IIKBLW/e1ocGOx9z/H8eViZC+rEwOoN++WbJc5TDmnWr03bHZUYeup+1VXKLj1BsCYmqUqIeJ2PkHXpG9dvSDEC/IX6noJXlEE8C65n1sy9zVs/XVLadPjOksUXj03/1VK1ZlQOzJAMXHBVZ7QqZmi+qlFjmcxtj+EoopB9PfBtq7pUipDH8Qqm0nwOZD5a3BmLT8Hj9pLaase5kjLUWgMG00SQVF69WSrGhP410+borNGXkYPk2uELyhJ3lccpaghJzkDviTK02KIDS5ztz9mPwGsaIIL/4JtNFcjsHw+9lw9sW0kiIpTQrBdcT6stDonONH5rfACTmTky/zr9Wg7cz+ILlbl5fXyu0mJf5+cjObmhT7DNRkGnB7VEthDxx6X
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(39840400004)(366004)(346002)(396003)(451199021)(122000001)(8936002)(6916009)(4326008)(316002)(54906003)(76116006)(66946007)(64756008)(66556008)(66446008)(66476007)(41300700001)(7696005)(478600001)(71200400001)(52536014)(5660300002)(55016003)(8676002)(38070700005)(7416002)(4744005)(86362001)(2906002)(33656002)(9686003)(6506007)(38100700002)(26005)(186003)(83380400001)(44832011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmI1b0orcnVSd09TVnlCcnNYN2xRdWxjeGhLbmwvNTBIUGZBejBkSE5ueTVv?=
 =?utf-8?B?eUNXRnh4VnFieVZIeUVRK0dqdTZhVzNjNDgvOUtxQkwzZkNaYlF0aGdrdWFL?=
 =?utf-8?B?allGWHhndUVrRGZFZTdiUHNlWjJqdFhLQmw3ZWJEM1ZIeWFnRkVpU2pxdkl4?=
 =?utf-8?B?eStwZDZPQVE3ak9tK3hQR3NzM3MvVEorVmtNSDZ6MStORmVxb3A1R1RqZDkv?=
 =?utf-8?B?MXNxTTFGMUEzb2xqMEJHOUoxcHlxYmQzM2NHZUdHZVg4UTE0NjFKeG51bnMy?=
 =?utf-8?B?Tm95MWxXY0VuUTBsK0xiTkpEanVKRVE4eGVGemJ0OEY5SHB3aE5tTjJxM3dB?=
 =?utf-8?B?emc5REJKa0ZBeUh2OElNMDlkZlo0M3d4aGE0MHBXNW5Zc25aUzlNbk05V3ZN?=
 =?utf-8?B?Ujl2RVVPOXMxT1A5TlJHemw3K0wvNHpHVXREZk43b1pBN3BWcHU2KzNzV21I?=
 =?utf-8?B?LzFvUGorR1B4cWFKZEVxQXBtVTl1V1dNWkdEQkxrYXNkbk9ob3d2aGlPc0ta?=
 =?utf-8?B?cnUxTHNBMmtvdkd2MXljMW10VmJEYU03TlJCd2UwK3lQMXhSdTFFSWpYTm5X?=
 =?utf-8?B?YVRYNmRmT1poTTFVOVVhcndpcTh6ZDNPb0hlcHdVZCt6NXova09rWm4zZ1pB?=
 =?utf-8?B?WjJUelo1SU1DeU5iLzAvRXhYaENvREtRSGZWVVFCV0F1WGNYUFJ3dXVwS0JE?=
 =?utf-8?B?bDg4UHpmSFJacWJVWHNiVUw1b2w2dDJucm4xZXVlMEgwSDhneDUzaG0rOWR0?=
 =?utf-8?B?Qy9IWTRnb0k1dDVlUDhrbzRuRG5PQmRZUEc0eFdFRk9jaXJzVnc0b3JaZFZE?=
 =?utf-8?B?d0xVb2drMi8zU05YTXFEK3B3YjQwbzd5Q2RuYXI2L3pmeEpqZFdJZm0xenN0?=
 =?utf-8?B?RFBYZTYrcHhTYml6SVB6dDU3ci8xUm5PbXpDWks4T2xHMyt6V2NzaE1wQUkz?=
 =?utf-8?B?dG53NU1oZzZMTXVPWGtZNlA5UE5rNXZaVXdmeEVKcktScWYweDNoK3ZMREU1?=
 =?utf-8?B?NjRIV2ZFSGFNcElUc3JUYVd1bUhKaVNJL2MvL09xRzNyYlZJd2d3Q1E3K1lK?=
 =?utf-8?B?dWpCQ3pCNEdwSENmdVNuYzkwNzRrazdpczRmbXB5eTQ5NHZjZ1dNZXR3d0Qr?=
 =?utf-8?B?K0J3L2EvRzRlTWY0amhFd1k1dkJEeVpyZ01tNldIRjA1Q1F1MFVpMWRWUkhM?=
 =?utf-8?B?Y3VLRWVHb3l6UVFjaUtrR1M5VGxHVkpPaHg1K2lrVnJ2bjJNYjBKQlo4R28y?=
 =?utf-8?B?Q0hPekhrSlYxeFhPR0MzTW1iUHBlU2J0UGk3bllXa3A2cDhPQnJ0RmR2YzFp?=
 =?utf-8?B?bGVrWkFqWWQ4NHZ1a2V0OUNEUEdMU0FFbTdoS0kzTDBXR0FOaElQSThNVW1M?=
 =?utf-8?B?MUUxTytwTFV6cXJKOEVpZlJ0Y1Bndjduc2ltb2EyaGM4K1FucUpieGo1MkJi?=
 =?utf-8?B?cFhQNnZsVUVhWGZlaDZUd3ZOTzN3ZTZ6QkV1SzFXWG1UUGZlRDh1Vm5UZ0k5?=
 =?utf-8?B?L2t0a3QwMGNDMlFNdGxTbHBmY2VObnpOcVc0MXFwZWZGVGVtT2ZsWEdObXNR?=
 =?utf-8?B?bjNMZVlyMUlNbnRlK0Zud2lLRlFaZzZIUG10ZTByanVKeFBZWFd3dVhmdUdS?=
 =?utf-8?B?ejV0L1ViSGJPRFlqeWV1aDNmNXpQSzN6SGNVQnNEQ2VvUlJPc1d4ZkV2bmRY?=
 =?utf-8?B?cjNqK1F5VkdtVXVzSUszMzluNm9KcHAycnJoaUFxZ3Z2NWxHODQ4V0o2OVo1?=
 =?utf-8?B?QnRGcUxLcjAyU0VkdVJ3Y2c2aUZWaWc2SVhndVk3cnIyVGNncXovUEU4bFZT?=
 =?utf-8?B?YXY0ZU96dnVweUttRzJ0eTlPRDR3L2ZrZXNFa3JKNHkvMGR4UG5GdXBKU0Vn?=
 =?utf-8?B?RGZKWUNlUnRRSm1vVWlCeDJRcmlPUlgwd2xHNHUrbjhQU1dVNXQ1NUFkNjFE?=
 =?utf-8?B?R3ppSWtYbmlEU2kyUEYrNXFMV1kxdGxiRzMvdllKSEZmWEJGYzVQcDJXbmd3?=
 =?utf-8?B?ZDJxK1NyNFRYU0xuKzdQeFFXeEtIV0JrSUVmYmZNdlEzc0NBMFZSTzVPK2dC?=
 =?utf-8?B?M25HVm11d3F5V052QmNlQmlIcmFOalYxOXo0N0F5MHh3eU5VRXhDV1ZqRDll?=
 =?utf-8?Q?e1dvVjXSQBZ77nI1FPNiB8Tt9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f111e132-d5dc-406f-81e7-08db41bb6c1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 16:22:23.1494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TcJ2uzQfsZFLmgukJKIIbG3tTaRy8irOhMTzghUecZUo0VV1Qu1aFd/bxlapy7vzuZl2aOxdFRjkesh6K8MlzJdg3VoGcYkmrk9xZJBQxg8=
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
Cj4gU3ViamVjdDogW1BBVENIIHYyIDIzLzQxXSBpZ2I6IEFkZCBtb3JlIGRlZmluaXRpb25zIGZv
ciBUeCBkZXNjcmlwdG9yDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBa2loaWtvIE9kYWtpIDxha2lo
aWtvLm9kYWtpQGRheW5peC5jb20+DQo+IC0tLQ0KPiAgaHcvbmV0L2lnYl9yZWdzLmggfCAzMiAr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiBody9uZXQvaWdiX2NvcmUuYyB8ICA0
ICsrLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkNCj4gDQoNClJldmlld2VkLWJ5OiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFt
YW5AZXN0LnRlY2g+DQo=

