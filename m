Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5046E3347
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 21:10:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnlGd-0000VL-Ne; Sat, 15 Apr 2023 15:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlGc-0000V8-L6
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:08:58 -0400
Received: from mail-db5eur02on20727.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::727]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlGb-0007N3-8F
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:08:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2poOfL17sWDU0tNAE576dGRjjAqT4pq0+DsB3xXF1/v79ogHKX6kQ4ZVjUhGhZZGrbwvkqNRp88wQLl9kl56Sqv9vvHVjSfx2Mn6HFb0BR8v1LVy51w8nnbnhyHZdFQzMVYWxY1fyagaxED61ekUma26KiG7Krp5JuNd+WRfCrwLzEFUu4RrBNIXT8kJcVvPqfqrs0paueG3Z64wL2OK3/n3N9DHgkmcNPdX2yFx8m+21s5Wm2fz9Mrp08COwv5Jcr+7eAAlu/3UROJv3Kb2nEGmZJyyNiaxBMocoXy8PvOl/OZZcniXYi+zWpEe7pU2Y4NIk9gejdTPSgFZ28xPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytbF/rjjNKHCEGqBSjBRmna+J85u9pizYq+fszxMV8Y=;
 b=lUuBAKliHVDu/CRPq1lde7guTtxJR8ZybHt0Qxul4f4xIQj/Ta9AkGw9TPhthtcbUAwkcPg3oc+Ds7QFwUZj9u3cN6gzrZS3qHyl/g56MMw3u9QJUbo4N54oeKRNOPLAj7mNv2iPUbGQzXR4BvdLTBnGaUw0SrZw3r3PoiDVqzraf4NWT51q+P3uatufuIhHamOuKWyltZEDPz2V/5v8GvINYg63LgwWzS487gW4m11vF3AiaEKD3gt6UXu4O9gWZMvukZcSmphr1oydnUZzsUWSK6/Ppoox7Av/WevleWfHp2ILPa5CWlUqVKHrbI8I4EVUjG4ke13zrqxBlPXYlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytbF/rjjNKHCEGqBSjBRmna+J85u9pizYq+fszxMV8Y=;
 b=EzpiyqxwMfT8evnth5qvCtAZpR2oKsf1Srb20zH4lHuaeKaw6rvyMIuJqnlFfvP1O5FJ+Nxn9INfzj+0OMccVU93CHQrugvd2CedWeX7jyW/9rkAaVJKZM46J7EFnx9K4HTCyrqOCz9yFoLYvez5ffC/Y9gSWOX+xWOSS3wiWLc=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2239.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Sat, 15 Apr
 2023 19:08:40 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6298.030; Sat, 15 Apr 2023
 19:08:40 +0000
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
Subject: RE: [PATCH 18/40] igb: Remove goto
Thread-Topic: [PATCH 18/40] igb: Remove goto
Thread-Index: AQHZbsW/sUiWYbRcVkavUcKok1cGb68sTRqQ
Date: Sat, 15 Apr 2023 19:08:40 +0000
Message-ID: <DBBP189MB1433B44B21DEAF3B24BBBFAD959E9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-19-akihiko.odaki@daynix.com>
In-Reply-To: <20230414113737.62803-19-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB4P189MB2239:EE_
x-ms-office365-filtering-correlation-id: 9bdddd6b-55ae-4bac-9caf-08db3de4d315
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6EjbVKg3nf4x35t63taotiDkQwl8dpUHXJMk/tM9VUg/XfqP9OvP9ikGMIK3gEDnn4ysj/S+cib8ygxhzF0vrUfRwDBExSnpjhAJneu0tXUWA55MwiO4gWWRK3YTT1pznhgDa45ogIqFX/Zy0d08Y4rgy8nQGimM8S9vt9xNkD/uayuTwrxc9H6MmrnS1/HIAsriKRqc/vhd09cWh7rmXZ232wgrfmp46JQUEvnE/xl5k9LLRNbM5zAVzrh9kevqontkoTUHC+F4y+tdkx2vqR2T6QzaFx2tSN8BEBeZPLbdyrrwhhZih8TbhCLZjF3y9Q0T6yvzt5EyCYelRLcqewfhuJPoHTgzcWYeRwcXstc45fHeSod74sUolVXvpbPDSa/+DZeb67vpsVLUGkbaJLezIA0errGub/0EuIcbgSykDEHjJHzraJW0VrJNaIuYaLfiF6jDdNFQqyjkjP3ji3yNM7M6kLSLv2r2DWiHi1N2+qyiM337c84sIj02nOZ0jeJV0dde2zYCntOLSvhXpz8KOLC3ixjAqaDbG5+an1bWq6ntz2XqUwoTbFjM98PX0Z/F/ZUQ6TXRUoQjynrK/CpSi+QoKX7MAvHxLN9zpFR4STWvGlhWdD6jjs9VW44i
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39830400003)(376002)(366004)(136003)(346002)(396003)(451199021)(55016003)(71200400001)(7696005)(38070700005)(2906002)(33656002)(26005)(6506007)(9686003)(86362001)(122000001)(54906003)(8676002)(6916009)(4326008)(41300700001)(66446008)(316002)(64756008)(76116006)(66946007)(66556008)(66476007)(38100700002)(4744005)(5660300002)(44832011)(7416002)(478600001)(8936002)(52536014)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2hCdTFLdUZ1OTNVTFdlZG5pSjlkb2NieDY1YzJ1blZyWTNKalR3Q1phQmpk?=
 =?utf-8?B?V3RLZXJFNlFLRGF0OWY3T3BVMlFwTmp5NUxBdkdlZ2xoZmRzUFZ3ZkVpNjhq?=
 =?utf-8?B?MGJCdWF6ajlXbnJEanRGcnJvTkFINTd2NHJRNm52SWZzdmhyOS9MMGRLcDVn?=
 =?utf-8?B?Wm5hZW4zS2R1eTFEVHlVNlZmUWEvbEVwU2xZV0pyNnpUWVAwWWFkTDJ4eUNN?=
 =?utf-8?B?aVVOd2VMcDdOWncyMFc5cXkzM3EyQ2dBMmZoOVU3UEpiQ1JQL3FDK2JQaS9m?=
 =?utf-8?B?dnpSSVpkb0tIc2pVNWtINUIxM05mQm8wOGpoeXZvT0lqQzVFMGd1dUxadFgx?=
 =?utf-8?B?NGtsSWxGS0dLQlZYYXhUY01LcEdDQWVGUzQ1YSt3QmVsNllTeEYxQUJ3aG8w?=
 =?utf-8?B?cDdWcUE5dzN0cGdVSGJpSTh6QmN0UEEyMlZuWEZuaHJFVjVTS24reXhsRTVH?=
 =?utf-8?B?UlRQbnlZNnNGeWtOanFYa0dJVGxRR3dXMHJOUzdDS0NUOU9acTFEODhKZnpV?=
 =?utf-8?B?WEM2TVpWNUwxcTBYb0xmN1RsNTNZR2tBNmU2N2d0SUczT3FjSnBDTzY2OFZn?=
 =?utf-8?B?Qk9HbXUza2xVaXZDTkd2T1VKN0VjK0R2WUhITTVsd2ZPYmtqUlM0aVFwL2Ix?=
 =?utf-8?B?c3hOQW0wUS9VK2FmdDNETk5FeFpKRlpPaWpDSVBySktQRHJlbS9mTk9pSXlv?=
 =?utf-8?B?cHVyOXZKS3VzQTY5L3VQbDJIby9CYVRFSGZhSGM4bmFiVHRlOGF0UU9BVGRW?=
 =?utf-8?B?QjBQRVYvWVprSFQ0TldYN3N5Q2d4bjh1bjVBaFQrUHZzNkdyWHNvK3RjeGQ5?=
 =?utf-8?B?RkdGeVdSQTk4WFE3UFdwcGtkZ1Z3QlpmUm5Oa3JYQnUvWFNXb2hIbmo5WkdB?=
 =?utf-8?B?TGRROUdPOEVHdlFSUUxNaEFTMDI5SlZOYXc3OExOTkZHL3MwaDJtbFl1US9x?=
 =?utf-8?B?SDRwWHd4aWo0UXFiaE03MzIwRjNCdlF4S1J2N2F6VWdzUVEwM3BzV0hyeWQ2?=
 =?utf-8?B?TG5ZTWdVM1JrcS9wYm1nL2k5Y0RqQXZnejd4RGhiMWFQdXgvRmt5U2JNR0hS?=
 =?utf-8?B?anloT1c1MllHdXVLOGR5cTB6ZkF0WS9uMEZsbUdkS1RGTHZibDV4OEYxeVNl?=
 =?utf-8?B?RnlwaTRkSkhlaURHWS9uUDZmOHIrZVBERXVaUFZxcnBOM0RwcXFRRzF4TTJv?=
 =?utf-8?B?d0xUN3NvQTVnRG12WE5DQUpCUnlTb2lMYUdtN245YWd6VkZIYldPN0t5UVh2?=
 =?utf-8?B?NjlXcDV4UE05Y2d3UjNjTlVzR1pFY2xPWFlGNHk3Uk5FaXJ1cFY2ai9FdTJJ?=
 =?utf-8?B?SjRMaHJDMzkrL2lTOTVLUnJjbDRYR3U1dWNCc0gyTkhNY2pMZXBKaEk5Zy9l?=
 =?utf-8?B?dnpaRGU5djBPbkl1dEFkQ1Z5ZjdRUEtUS2grd0lkcWVzaC90YzM4dk9Gc0xS?=
 =?utf-8?B?VEh6TnBMOW1aQUxabytFS2RoTDBGQzhCcGtSM2lmbVpmRWJXSSt1cXU4ajV4?=
 =?utf-8?B?M3M0Um0rOHRBbWhQSU1XNUhVaWxhRzBRNllsWk9jN053WHZUZVl0WWxNbHNO?=
 =?utf-8?B?cVBncERxdkFOSnZKS3ZBT1g0dXhUeHhOZWJnUVpFa3JoOXdaelBNbTVGdFIr?=
 =?utf-8?B?RXpycUVrblB6TzZMMVV3VFIrcUxiY3hHSk9odG5EdjI2QjJZcUVvM1hKOHNq?=
 =?utf-8?B?Qyt1ei9NOWFHTHZnMzg2YkVxMitGcWVoS1VIbGNkMVR0WWNIQzNRVVozS3Vt?=
 =?utf-8?B?dmlqRW1lU2xsaGRuR0svcFFPRThPdXE3amQwb0ZpWUhvbEl1Y1c0UzVtRm1P?=
 =?utf-8?B?NWticklzN1hpN2xrK1ZtUGRLREovbndQOXE0UzVqR2VkY1YyWXhsb1IvL0Fq?=
 =?utf-8?B?b2kzckJZRHlneFFpdDgxRXgwMUVLU2JiT0hwdUFwcmMvSXlFVjRJMnR2c2la?=
 =?utf-8?B?OHVCYldUZmlnMEhxSzVKM3NNV0UxdlpKeUFDRTJrT2FNTlpGcDE3ZmI1cm5Q?=
 =?utf-8?B?K0YvMFpCOUlxTnQ4K1lUbWNQd1l0K2pYUWt2eEVYc055dmZvd3l1dnNqaFVm?=
 =?utf-8?B?K1Vzci9XaXZnRzRnazdOWEUweGZ2VTFISTRNWFVURWxleTFMSTRYdHJzeTFF?=
 =?utf-8?Q?L6byfYCERniEMFLAmcutlHV+J?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdddd6b-55ae-4bac-9caf-08db3de4d315
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2023 19:08:40.5905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O82+5aapYhVskhAHrfVTe+jBbxBuQ1WUmENDNjRTcCJ1iUtzy+fCsMiMYTwFmctN4TQlnKGBffXKVtnWy3cuRHDyZLODqO2d/Xi4m/OLO+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2239
Received-SPF: pass client-ip=2a01:111:f400:fe12::727;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
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
DQo+IFN1YmplY3Q6IFtQQVRDSCAxOC80MF0gaWdiOiBSZW1vdmUgZ290bw0KPiANCj4gVGhlIGdv
dG8gaXMgYSBiaXQgY29uZnVzaW5nIGFzIGl0IGNoYW5nZXMgdGhlIGNvbnRyb2wgZmxvdyBvbmx5
IGlmIEw0IHByb3RvY29sIGlzDQo+IG5vdCByZWNvZ25pemVkLiBJdCBpcyBhbHNvIGRpZmZlcmVu
dCBmcm9tIGUxMDAwZSwgYW5kIG5vaXN5IHdoZW4gY29tcGFyaW5nDQo+IGUxMDAwZSBhbmQgaWdi
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWtpaGlrbyBPZGFraSA8YWtpaGlrby5vZGFraUBkYXlu
aXguY29tPg0KDQpSZXZpZXdlZC1ieTogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJh
bWFuQGVzdC50ZWNoPg0KDQo=

