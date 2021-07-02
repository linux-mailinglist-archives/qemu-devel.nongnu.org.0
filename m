Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E173B9CEB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 09:29:55 +0200 (CEST)
Received: from localhost ([::1]:56380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzDcY-0006dZ-9T
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 03:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lzDYq-0001lR-QK
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 03:26:05 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:52916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lzDYn-0006ra-Ru
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 03:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625210760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8OmCOE2xH5N+dO0GHgWazxra62tizVyscOE6wJLmr8=;
 b=TlRRD+sZmMjkx0qQ/nDsf9Huy1TH3z2bl3YqaNxELszpY1snpPt0pgpRLl3jAf/0gDqEpy
 9jEcM8WFwfBjPv/ED+tj8GG5YWYioQqsE+6xHyXErDqQdhVwXDbw9CXCtuk6yO0ZlMcxLm
 SqY6XrjWx83EK4H028iKB8uOpHsBQks=
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-1YZlOw2hNLKldHXMtQhNhw-1; Fri, 02 Jul 2021 09:25:59 +0200
X-MC-Unique: 1YZlOw2hNLKldHXMtQhNhw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDwyPJvw8byKPO2cHB3QW7Bx/WTGgmxcK9JJRVbhvUuX+T6HMwQ5H9yc5lpcKjuyyRezH/u8dMejbH+o0itAFvSfxa9unYZ4rGhlcAOfZlz2j3gfhMx8pgUWzwV7BcuCmw3IIVHQg/4FKahqa2/7mLMlsOYy0/ha0WPYEqueVOrOAUrvjjjH/P/+v8PSaBUCMOLa9b1tFGszlqunsnRQ1ySiaTu46xjBi3UcS3P9xD2h9GT6e5bSP6c2ULiHaua7FXvykaGaGjKR3aG34EYx7fenVKA9/fEY74q7HggPmYE/oBvMqqoh+o5/v4/wPyA2y6Wjf4ACSSe56qYNmKgWIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8OmCOE2xH5N+dO0GHgWazxra62tizVyscOE6wJLmr8=;
 b=UZx4L9cGxy0kpbReRafskMHv1/BD3jTeXKnFSk/wcTHYygg/k05FoyV4CyIhdFRkLH70GGKHKutxGEaj+bN58/mCDNkQ02IpPDsLpNf1RaLJClG5sd7atMVYr1suDTUM/jdiW9gKwsQnshbtJ5ZFR85H0WDqw33ZdU0lskPiKmgibnWQMb6Xq+e6FWawOzcxUelLAj4qUiiHOQSTKTF5cIu9/iZYMXROlOWbOaB/qVqekH1sobhQY2BPGR2xgRszr//Q+RtdXck7yCF11aXEeYXFATL/IPtR51ozLJAN1eS0Mwed63SLVFGwBiG9sgo3pMf+6JmOVbMD3DIKofKRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0401MB2240.eurprd04.prod.outlook.com
 (2603:10a6:800:29::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 2 Jul
 2021 07:25:58 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4287.022; Fri, 2 Jul 2021
 07:25:57 +0000
From: Al Cho <ACho@suse.com>
To: "thuth@redhat.com" <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
CC: Claudio Fontana <Claudio.Fontana@suse.com>, "cohuck@redhat.com"
 <cohuck@redhat.com>, =?utf-8?B?Sm9zw6kgUmljYXJkbyBaaXZpYW5p?=
 <jose.ziviani@suse.com>, "cfontana@suse.de" <cfontana@suse.de>
Subject: Re: [RFC v6 08/13] target/s390x: split cpu-dump from helper.c
Thread-Topic: [RFC v6 08/13] target/s390x: split cpu-dump from helper.c
Thread-Index: AQHXbPHnGa4lPsO2YUWHI108apQXA6suETcAgAE75IA=
Date: Fri, 2 Jul 2021 07:25:57 +0000
Message-ID: <1fc14922aa88d7cd6cbfe3e5e76e10aa8150fe4a.camel@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-9-acho@suse.com>
 <f4848e38-ecce-c6b1-254b-e93fe45711ca@redhat.com>
In-Reply-To: <f4848e38-ecce-c6b1-254b-e93fe45711ca@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.2 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
x-originating-ip: [1.169.23.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e82a4af-4863-4e8c-4c46-08d93d2aa2d2
x-ms-traffictypediagnostic: VI1PR0401MB2240:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0401MB2240A84C6C7BD8FF598F2EDDA01F9@VI1PR0401MB2240.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xjiIIR2X7wZqaNRFolaVZyuSwk6QfWbPWUakCWEdPe0/dKk4dgChkfRIz/k1lWdB85RrfleiPjaQ0bcHcuwpHLEdt4gvXg3CvyIEtkCs1CLgXD7xQJASEh2A5Y76uTVumuiy03bh+chMd2uF321hY0XHhkHtFz6TDR4oWDu2jR0K3Q0XC9qxu9I0AsgH4Enr8CjnmQae5tTiqSsHWnJxahB0KKL+MGvnMB9bgsyJxfAgXnOpywriuPa7cydBMceNLsrUkkeNuIh8HU/gJp2fzN1+1IqFIRUjiZzxXBAmrzurX7TafiW6CCQD7UMWyiXzR7ba+Bjtu87E4GYZeDrejcP+QiRr8wYhAMkVg6i4dtR7fRhDwwj2yJq5+h5/0dpro1XKFg043lv73BMg4Yu+5H8iU4ZRvvdybJCdEUfibBKgkPmbVHzrBgQB7dNxe5pTtgKuNI0+88BCRYBtNjAIGHqOWllC2K80yS7Kj3JwMNTh64B3BMOzaQ7eHTPMicX9F7rzQZYjoLOYb+iV79WKoN+QMgSFQz2eP6B3aVpMuGUb2i78S2QE5d41uywmNUHymPl4Ku9Vml89Npq5QRMMB+QjhCLpDZxs0g4dtFimgyVqIk4UHQ/LldN8aXoRgtuh81CKZEyqV9EbYEQIvf+J8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(376002)(366004)(136003)(39850400004)(38100700002)(86362001)(8936002)(6506007)(64756008)(6486002)(8676002)(122000001)(2906002)(4326008)(6512007)(36756003)(54906003)(5660300002)(4744005)(26005)(316002)(66446008)(66946007)(76116006)(110136005)(186003)(66476007)(91956017)(2616005)(71200400001)(66556008)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGdpRGtkRkh3YzBIeFlNaU5Nb3BPNFNpRmM0T1hTbWJmaGZGS3U5eFJjUzdo?=
 =?utf-8?B?bE9jSnh5MzQxWkRRYUFQbWk1cnBXeE1pQU03USt2K2V3SnQ1dzlLWlBJZTJN?=
 =?utf-8?B?YXNGalluclMyY3V1cHp6eVBRR2dVWlJzb3owNjgzaVhZRFlLOGNTMXI1bXJo?=
 =?utf-8?B?NFNLaE1MWHZkZW5WNGs0bXdFZ0M1aExxK29ybTg3RWpHOGFiUU5hck1sR2No?=
 =?utf-8?B?WDF4Uisvdi9PYnJJYlJwM3l0WnhpT3lPSnlXMTBua2NXb2J6eFdhd21YYm9O?=
 =?utf-8?B?VHBSZ094ZnYzYm1YTTA1UHhoOUxWdGJpanAyVXJiSkJLek5McSsrMkZyVTNy?=
 =?utf-8?B?VXU4OFZmbGVOYWV1blErQlUxTWRiKzJ2MVhzNFBnQW9ndmduRjlxVjdHOGF1?=
 =?utf-8?B?YXFPRnhuNzY5M2poeldWbWdiMm9rS2tUSGxBWVJOU1lIbEg2RnlCZDQvdXE4?=
 =?utf-8?B?a2pxUGdNZWNJQmxNUEliU1haWTlFYWRVNjdTbm14Ti85WUVIR3UxSjhCc25D?=
 =?utf-8?B?T2FGR0xtL0NtWmhmNVlmMURnSnNqVDlyUUsrcFBRWDQ3WkxUTHpUdGJabWlo?=
 =?utf-8?B?emxRZ1pvSE5hTzNQbGhYblVpSHFPbkovK2g4OC9WN1FWUjAyS2ZieGtqeGVV?=
 =?utf-8?B?VlJYcWY2VXR6aUY2UHdIeW9uL1hoUHlzUGo1OVNoTDV5a2hpN2FhMjYzUFNv?=
 =?utf-8?B?V3pCb3FRdHlkclRlaUZzVUpGYWFkMWJXaXZFRnFlSEtPUVZmaGRycG9oalVx?=
 =?utf-8?B?NnlHSWRaWktDMWlVRzh5THNGZThBT25GbTBsdGgvM3BxZjU2dVJmc1lWS2JE?=
 =?utf-8?B?bzlGVjFZc3JFbWZmV3Z3VUpraWlDeEJXc3NBR0hWK09SQ3h1SjY0M0xKSEg3?=
 =?utf-8?B?V1ZobTQvREVlZUMwRW5WZkh4VFhWWlFrSnlhOGx4VXJEakpwU1JXcHZOdHdC?=
 =?utf-8?B?TG8vM3VPVk5hSXJTTW9QWnROL2lrM0IrNmpkRGFFM2ljWnNnM0MvNnVqTlA4?=
 =?utf-8?B?NnlvRkZ2UldKZ2FKWnBUNXRwclFnZHR1RUZWSWRiODJuOU1sQTc2czBvZ1Fv?=
 =?utf-8?B?UXlXT2xncnJLVjd4YzF3ZUVRNmFsdHlyd3lMZGNvSktKaXVoak8wcHRhVU1x?=
 =?utf-8?B?aitkL3FScnV3d3JFVEVEV2JoMTlrVW5Bc2VLTVR3dE9EanVxMllncVVRcjl2?=
 =?utf-8?B?VWRxNWZNNHdrT1R2cGs0L1gyclJDc0VrekRDcnBrb0NLQ3dMWVFNNzJYWXp4?=
 =?utf-8?B?M2VXdU14T1lKeS9xMFFLMzNDMU0yN2hXenI0dVpDU21aSldkU1EwZ0dONTZu?=
 =?utf-8?B?NCs3ZkI0NG8ySytYaWYvelVLTTEweDk5eTBhM3JZOVZFTzlQSjRpaHpiQWdK?=
 =?utf-8?B?TVkvQU43ekxZKzdrMHRDZWQvNDl0Y2pTZUNzVmRPbEdSM2NaWHpQa2hqWnR5?=
 =?utf-8?B?UjNaWmxOVHd6NDZGVmsvV1VIdjhLYlJBMU4yODNoQnIxKzhwSzdKZjlyb3ox?=
 =?utf-8?B?clJDUmJJZUpWbTVqRC8xelprYUJFWmZYOUtkTGdaRWFsMGlKbmFoTVM1SXZN?=
 =?utf-8?B?K2lQVlhWdDlUamk5MW9Ib1l5bjBGMmg3elMrMTgxVHZpb0dpaWRWY0R0Zy9W?=
 =?utf-8?B?Uno4SFJHYXY2TXpiZExXYzRsK1hSRm9MRkwxTW45YnBRclNyM1d4Wloxb2NC?=
 =?utf-8?B?NWNsZ2JScjJBbHNMcTlob2x5TUxIc2xobXZad1Z5a3hLTE1jakVqQ2I3V0Y3?=
 =?utf-8?Q?1sMY4vcDxsIt9nTi8ixGLJ6mok9aRW0dQJnMp0r?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <999D1E60D0BC6B4D9E7A5EFC9936A842@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e82a4af-4863-4e8c-4c46-08d93d2aa2d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2021 07:25:57.8428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aGjQ8ZF0I1TWx0vAq3pjKATa2FoAx28oSoQrSVOtvpsZh+Tc3n49EfOEb4fnrmFR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2240
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVGh1LCAyMDIxLTA3LTAxIGF0IDE0OjM1ICswMjAwLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4g
T24gMjkvMDYvMjAyMSAxNi4xOSwgQ2hvLCBZdS1DaGVuIHdyb3RlOg0KPiA+IFNwbGl0dGluZyB0
aGlzIGZ1bmN0aW9uYWxpdHkgYWxzbyBhbGxvd3MgdXMgdG8gbWFrZSBoZWxwZXIuYyBzeXNlbXUt
DQo+ID4gb25seS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGlvIEZvbnRhbmEgPGNm
b250YW5hQHN1c2UuZGU+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hvLCBZdS1DaGVuIDxhY2hvQHN1
c2UuY29tPg0KPiA+IEFja2VkLWJ5OiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4N
Cj4gPiAtLS0NCj4gPiDCoCB0YXJnZXQvczM5MHgvY3B1LWR1bXAuY8KgIHwgMTc2DQo+ID4gKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IA0KPiBBcGFydCBmcm9tIHRo
ZSBkdW1wKCkgZnVuY3Rpb24sIHRoZSBvdGhlciBmdW5jdGlvbnMgaGVyZSBhcmUgYXJlIHVzZWQN
Cj4gaW4gDQo+IG90aGVyIGNvbnRleHRzLCB0b28sIHNvIG1heWJlIHRoZSBuYW1lIGlzIG5vdCB2
ZXJ5IGFwcHJvcHJpYXRlIGhlcmUuLi4NCj4gV2hhdCANCj4gYWJvdXQgbmFtaW5nIGl0ICJjcHUt
c3RhdGUuYyIgaW5zdGVhZD8gT3IgaW5jbHVkZSB0aGUgZnVuY3Rpb25zIGluDQo+IGNwdS5jIA0K
PiBkaXJlY3RseT8NCj4gDQoNCm9rLCBJIHRoaW5rIG5hbWluZyBpdCAiY3B1LXN0YXRlLmMiIHdv
dWxkIG1ha2UgbW9yZSBzZW5zZS4NCg0KVGhhbmtzLA0KICAgICAgICAgICAgQUwNCg0K


