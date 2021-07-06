Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483633BC816
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:48:31 +0200 (CEST)
Received: from localhost ([::1]:40310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gko-00019q-BA
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m0gja-0000R6-T6
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:47:14 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:24167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m0gjY-0007uG-6A
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625561228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fxdg9Zkdgdn6bXolWYigjAGfyzmv+nDuha/rt6nlj/8=;
 b=PrTZvSOITtHfmeZ8oZX36/MQ5irDRpr/M8Jl73qhM7FmbnC5bgVhkytIFgBtzxadTBdlwv
 SlYWxFDU2p6pYRUZvtiwtbDOUIhSKvm52yeCvcF4ZKyyDSIC8sCZhZZw5Ct0cWHDYbMFBa
 Zc7cMR714JtxWgw6Q36aZXiiGylsUEg=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-9srq6AUaPaSHcYBiX764ig-1; Tue, 06 Jul 2021 10:47:06 +0200
X-MC-Unique: 9srq6AUaPaSHcYBiX764ig-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQXcTkqtHQ2WLsCBfbfRNe0/uVHpCRXPL4RdgQylL28QOCTrpoaxpY1CVjzDsOspsEadikCAjb/BVUDXSktqdf48FU2V7Ap2IrJBEru4W9vKnoptcO+HFwJ6IZ2uwBy/OhZL8y+7Xx3t68CBNXO0T0lPD+9fzV7GNX8ZMzfrOHfXTp2P1g/aWX09/co/x27llbQqZ9KdMnAk6OlvQ/hegqoUvip2oxP/MS2HMPzY8Ps8G1rJ+riyHjxmdVA29SFsK48XywemZP0e8UrTF8b1xZK/BZ+8OOFvpJzq/oIkLmDLPxrS8SNcc8wv7bxt2AW1ngbUy8eqnPbSgpP/DQwHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxdg9Zkdgdn6bXolWYigjAGfyzmv+nDuha/rt6nlj/8=;
 b=mufo8X+tJ+fHGx0HUdazrG/w7eBPeIQfBwSRmLoOT92IUcZyXfbYKGglpj2lklrhq3GfTjKbu54Rkp/mUG9te6WpIOj0jPl7ZR29ZmsEuuOLW/rcqtw0pHoOvW7l9pxPkRZkf5SmFxc0nePci+Z47LKWqskSO2VRJlQ23jOEQEFGnXUmUK6BKru9QFsGqgCwn7jjXyFXN8eYIcJ7swSRSoptupej5R5qQG1ptn2PrDtMbaIbLHn4TUKtANXiNXxdBUmogTFNqt5Jmv9yhUDCnt0fr4oBken+KtbcIXoX49Axos/anKSW1tH5AUelHEzaVcnFGvLzdjxYKmbN1+GdnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB2992.eurprd04.prod.outlook.com
 (2603:10a6:802:9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 08:47:05 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 08:47:04 +0000
From: Al Cho <ACho@suse.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "thuth@redhat.com"
 <thuth@redhat.com>, "cfontana@suse.de" <cfontana@suse.de>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
CC: Claudio Fontana <Claudio.Fontana@suse.com>, "cohuck@redhat.com"
 <cohuck@redhat.com>, =?utf-8?B?Sm9zw6kgUmljYXJkbyBaaXZpYW5p?=
 <jose.ziviani@suse.com>
Subject: Re: [RFC v6 08/13] target/s390x: split cpu-dump from helper.c
Thread-Topic: [RFC v6 08/13] target/s390x: split cpu-dump from helper.c
Thread-Index: AQHXbPHnGa4lPsO2YUWHI108apQXA6suETcAgAE75ICABKYBAIABufuA
Date: Tue, 6 Jul 2021 08:47:04 +0000
Message-ID: <27d64c9b946b8d7183b6f7d5154aa36fad9dec23.camel@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-9-acho@suse.com>
 <f4848e38-ecce-c6b1-254b-e93fe45711ca@redhat.com>
 <1fc14922aa88d7cd6cbfe3e5e76e10aa8150fe4a.camel@suse.com>
 <101135a9-2b08-ab8b-dd48-8fc1d8f00358@suse.de>
In-Reply-To: <101135a9-2b08-ab8b-dd48-8fc1d8f00358@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.2 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
x-originating-ip: [1.169.31.224]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e63d940-84bc-4956-7013-08d9405aa172
x-ms-traffictypediagnostic: VI1PR04MB2992:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB2992B81EC804039AB42020ABA01B9@VI1PR04MB2992.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cnvRO9zK4qeFBU51ot3Y3qrOjIb5rcTDCNIvhNUYaNei1E83Eapani1NKIohmEcmjyccWfv0ktG4bxSQFxPfniCMdFMseg8OlpeWbqJpCk01uOae3IIyHZN3bxYm3biS8GliGunI2E8cYm7/3hOPRpNB3ptkn4lX+xCz0WBUpDMH8bvVPK18xP51VtzBnvS6D3EHulJvodaPbmMF2bfPX6iXVUwv5E8wQnlUq4Hm1reHPntvegdAZdZwnmXHlfQX2b5AX6wEyAH8UZtH33IAR7N+Jpv7fWRhy6Z/ula0jW6D0tWL5Ix+PIx693MeufZDZpnC1xax0Pjp+5xEB/eH7+qnTq+LAvVUpKQA6LAIb0706GFTZJknQMKTnLDoWil7eXtq0/8C+jTeB0Zdv/+pnoHfEVAeaHWgzYq1VsNR0x6atJOB7xh6bNVptGRV0RZ3LQ4Vf5Ox3Rb7NFCf4AqUDxe+MrmZUhURI73lEI4Z+f+CicqJYnPnbn9PdMa5Y54B0ggTuJ9xE8VgK0etiK1HQHhrX1nVvVUc+cYsbUiXbmCQzqm2zhxmTtmGbIj0Ig3aVQVwHYHac5qyhrcxr12uuhzk3U9ejH+Ae22pT2G+MGIcWWrRXu5cGrYrzRexqzdVTr9FeCzJsKhSv8ANbLi7cg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(136003)(39850400004)(396003)(110136005)(36756003)(2616005)(6486002)(6512007)(26005)(2906002)(54906003)(186003)(4326008)(6506007)(64756008)(66946007)(86362001)(66556008)(122000001)(107886003)(8676002)(53546011)(5660300002)(71200400001)(38100700002)(76116006)(8936002)(66476007)(66446008)(316002)(91956017)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGJyUFVOM2lOcGRrejhqT1NZZTNNRy9mbloya3hJV0IyUGlIb21nQkNFUmVZ?=
 =?utf-8?B?L0d6dUVZQWsvdEdKUWllSHZITEVpby8zUStZSjVwaWVxWUtFaFFtTWhGWTNE?=
 =?utf-8?B?bXFhWkx1TUpGM2VyRkVTU2swcHdNMFVJcExWQ0NqUUFxOFUxd3d5bFBmSzUw?=
 =?utf-8?B?SUFCWkdNTzBhdlZTMmdvN2FOM3BYU1JBZVpybGZtWFhUNHZHaUIxTTdGNXE5?=
 =?utf-8?B?aGdwWWZJZU9DcFhwYm4ySHkzS1N2bm8rZkpqVmJjQUQzZGx5U09DMWVCTnRu?=
 =?utf-8?B?elVJZXlEbS9hYnI5bWRtQkJ2TmtYZkhFaTYwdnQxNW95dGtYaTAxRlZiOC9I?=
 =?utf-8?B?NlQyV2wreXUyV0VhV01ldXVEZ1o1Tzl4RWJxc281Z3BmS0ZLSCtQcFlGUGRa?=
 =?utf-8?B?cEhDTkdwMS8ydXZRKzkxTU5jeGx6TlM1VURqRWIrRjRLR2pqWXpHQVd4YVNh?=
 =?utf-8?B?K2V5NFN1UEk5Q01kSzFNak0wVU0ybEhVTHRHeVlUY1V0MC8zbHdHVWVSbmM1?=
 =?utf-8?B?V0dERWJIZFB3RWJscm1wa200R1A5UGNTN2c5eFlQaTNBMU5jcVRaUlpLWUh6?=
 =?utf-8?B?cklaME5hK2JSYWJhcEdGeTZDOXk1Um1pWEhjNzB5QmVSZkZQb1ZNRU1yd3Uw?=
 =?utf-8?B?Z2NsK1VCQndpOGN0Ulp2TXh3ek5ZR0NyZUxkMFR4bWcxU2JxZDdaN2ZRMzNa?=
 =?utf-8?B?bERQZnZxcXkzcEN1eVIxUkIwMHlpaUpCdldXRm95VGdFbGZ0bnZ3UEl3QmRD?=
 =?utf-8?B?UWxwUkdWajdPSU9jU0ZrbGJzUFNoU2h4U1VHeWNuNWZUb25QV08wRjc3R21y?=
 =?utf-8?B?Rjk3a0ZKQ0k2ZUM0SW4xZm5XazBYYkNRV0loTk45K29senNQckxscFRPNHdR?=
 =?utf-8?B?MzNpcCtndUNTVFQrOG9KRCtRUHZSaWVPbjRUS2t4VHhKRU9pUnpObEVjUCtN?=
 =?utf-8?B?MlpEeDVjbVJzeWRWTVZ6bm9FRy83NFZaeHhSN0lmdG92ZTloS3FDRkNPRUVq?=
 =?utf-8?B?Mk5rRlBwWmM2SGxSVzA0Q2pIQW1CS3dvMWdxWVBYRjVFNWF3RmR2bVdJMWlU?=
 =?utf-8?B?Y3U2NnhNWDFoTGV6Y0ZrYWxUeGg0YTUxQTd6WUYzR2xoMFppMkRRNkJsN3dl?=
 =?utf-8?B?N3YyRzBvY0VMOUk1RVEyMHZFa3RoL3hlaFpsMm9sVmxhWGtodmlyazJwVGV5?=
 =?utf-8?B?U0lRU3RlSjVJYkpJNTlBS0NmVDNKWXlMQTk0S2VsQXVjTERoNFdYQVV6YnNv?=
 =?utf-8?B?VjFtKzdJUW9qcXdmdWNPODdXaGRIUlIxVHBYSmNnckVaRzBHM1BWei94NzZX?=
 =?utf-8?B?WVNiMkJleGorVUNhQmxFalFId1hnc0VBSVFLUkhNLzYrWk4xVnhHTWVmeHlu?=
 =?utf-8?B?Rkh4YVcxaGVFd21xVmxRYVg4VDYxVTNLQUlmN0VPejBNTU1ITHFqMmJRcXRO?=
 =?utf-8?B?T1hZN2JYb2pQeFhWNkI3M1ByVEZ0NTRKNGhOdzg4V3VCR1FQVWZyTlF3d3oz?=
 =?utf-8?B?M29XUW81UUkxblJWQ2RLMXQ4NGMwRVRQRDV2RGdwVG1obkZZZXdKVXl4Yks3?=
 =?utf-8?B?ZEdnbytvZE5ER0gvU3FYZkwzdFhhMkJ4Y01UNExQZUF5c0FUN0J6Z2JhdUxq?=
 =?utf-8?B?NktHdWYvRjF1SDd4R0l4am5IQkpobmlMSTZFNHdVOWFOV0NwU1piUThrNHlC?=
 =?utf-8?B?OTltS0dIbEZSNzNpSDZXMmQreFFnUmkxbXVoMlc3b09FU2xhTkZydVE2OFJZ?=
 =?utf-8?Q?qaSvo+qbiiDm0ozxloolix61l1JEC6MWZz+Od4W?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8094285149C70F4A88B051E3145B4FFF@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e63d940-84bc-4956-7013-08d9405aa172
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 08:47:04.8032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8U8t9fJpVFXU3mR99QZWWlG4xUIncZuIealuoJl5SUSWCUkPZMoPiMbW46M0+Xfk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2992
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

T24gTW9uLCAyMDIxLTA3LTA1IGF0IDA4OjI1ICswMjAwLCBDbGF1ZGlvIEZvbnRhbmEgd3JvdGU6
DQo+IE9uIDcvMi8yMSA5OjI1IEFNLCBBbCBDaG8gd3JvdGU6DQo+ID4gT24gVGh1LCAyMDIxLTA3
LTAxIGF0IDE0OjM1ICswMjAwLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4gPiA+IE9uIDI5LzA2LzIw
MjEgMTYuMTksIENobywgWXUtQ2hlbiB3cm90ZToNCj4gPiA+ID4gU3BsaXR0aW5nIHRoaXMgZnVu
Y3Rpb25hbGl0eSBhbHNvIGFsbG93cyB1cyB0byBtYWtlIGhlbHBlci5jDQo+ID4gPiA+IHN5c2Vt
dS0NCj4gPiA+ID4gb25seS4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENsYXVk
aW8gRm9udGFuYSA8Y2ZvbnRhbmFAc3VzZS5kZT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hv
LCBZdS1DaGVuIDxhY2hvQHN1c2UuY29tPg0KPiA+ID4gPiBBY2tlZC1ieTogQ29ybmVsaWEgSHVj
ayA8Y29odWNrQHJlZGhhdC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiDCoCB0YXJnZXQvczM5
MHgvY3B1LWR1bXAuY8KgIHwgMTc2DQo+ID4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiA+ID4gDQo+ID4gPiBBcGFydCBmcm9tIHRoZSBkdW1wKCkgZnVuY3Rp
b24sIHRoZSBvdGhlciBmdW5jdGlvbnMgaGVyZSBhcmUgYXJlDQo+ID4gPiB1c2VkDQo+ID4gPiBp
biANCj4gPiA+IG90aGVyIGNvbnRleHRzLCB0b28sIHNvIG1heWJlIHRoZSBuYW1lIGlzIG5vdCB2
ZXJ5IGFwcHJvcHJpYXRlDQo+ID4gPiBoZXJlLi4uDQo+ID4gPiBXaGF0IA0KPiA+ID4gYWJvdXQg
bmFtaW5nIGl0ICJjcHUtc3RhdGUuYyIgaW5zdGVhZD8gT3IgaW5jbHVkZSB0aGUgZnVuY3Rpb25z
DQo+ID4gPiBpbg0KPiA+ID4gY3B1LmMgDQo+ID4gPiBkaXJlY3RseT8NCj4gPiA+IA0KPiA+IA0K
PiA+IG9rLCBJIHRoaW5rIG5hbWluZyBpdCAiY3B1LXN0YXRlLmMiIHdvdWxkIG1ha2UgbW9yZSBz
ZW5zZS4NCj4gPiANCj4gPiBUaGFua3MsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBTA0K
PiA+IA0KPiANCj4gRm9yIGNvbnRleHQsIGNwdS1kdW1wLmMgbWltaWNzIGhvdyB0aGlzIGlzIGRv
bmUgb24geDg2LA0KPiANCj4gc28gcmF0aGVyIHRoYW4gY29taW5nIHVwIHdpdGggY3JlYXRpdmUg
bmV3IG5hbWVzIGZvciBlYWNoDQo+IGFyY2hpdGVjdHVyZSwNCg0KSSB0aGluayBDbGF1ZGlvIGlz
IHJpZ2h0LCBJIGRpZG4ndCByZWNvZ25pemUgaXQgYmVmb3JlLiBzb3JyeS4NCg0KPiBJJ2QgcmF0
aGVyIGVpdGhlciBwdXQgdGhlIGNvZGUgaW50byBjcHUuYywgb3IganVzdCBrZWVwIHRoZSBleGlz
dGluZw0KPiAiY3B1LWR1bXAuYyIgYXMgaW4gdGhlIGluaXRpYWxseSBwcm9wb3NlZCBwYXRjaCwg
d2hpY2ggbG9va3MgbGlrZSB0aGUNCj4gYmVzdCBvcHRpb24gdG8gbWUuDQo+IA0KDQpGb3IgbWUg
anVzdCBrZWVwIHRoZSBleGlzdGluZyAiY3B1LWR1bXAuYyIgYXMgaW4gdGhlIGluaXRpYWxseSBw
cm9wb3NlZA0KcGF0Y2ggd291bGQgYmUgdGhlIGJldHRlciBvbmUgb3B0aW9uLg0KQnV0IGl0J3Mg
YWxzbyBnb29kIHRvIG1lIGlmIHdlIGtlZXAgdGhlIGR1bXAoKSBmdW5jdGlvbiBpbiBjcHUtZHVt
cC5jDQphbmQgcHV0IG90aGVyIGZ1bmN0aW9ucyBpbnRvIGNwdS5jLg0KDQpDaGVlcnMsDQogICAg
ICBBTA0K


