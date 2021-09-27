Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892364191C8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 11:48:34 +0200 (CEST)
Received: from localhost ([::1]:44672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnFR-0007iK-6g
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 05:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1mUnBu-0005dJ-Qt
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:44:54 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:41042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1mUnBs-0005rp-IG
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:44:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1632735889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dB1kitshacYsmsCtioLWoZecclga3RJMxZ9RRM1eW0s=;
 b=lAw4VkqYxTNCAgqmbKIyZdLWASf2hRSaKZ0PUvbwzFhkSSBmF4WReEm9BfkCfsWnginnlV
 MtsVTbU30uyQi6oAV7KpLRaUOC0aDVlX0XWcU7S82hRc0sF3UgC51DPMticcumY4u64xO2
 6Egtye2YTGnN1fZoHy9uqWQswr2djug=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-YLFzukOfMVST2tVthuQKqA-1; Mon, 27 Sep 2021 11:44:48 +0200
X-MC-Unique: YLFzukOfMVST2tVthuQKqA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDm2ZeNEb7fvXnssXFgJDQ4LWDS7YLSmFPOuDyHGtfnfWMJhOQAbFZek71fIotX5uIgXUGArOekfveQRp38bZE72oUAbstrIZ1jTiW/OAc4OkEW8qmn4ldu6CZ7But/ttsRDZay1XvYYi6ye5hwwD8G9HXsuhUIkMZFzDW8JCNUBI6Ucz6q7GVI6LMsXjFWOx6rv5hdi6SWDs9Ih9qHQoHIC4eZp4KaYdj2FcqlXcg5Eu364yCJcp/u2Kr9G1Y8AvKHCesFslotZDsDPa1cXDTqng8aMnjLLn5drHXS7gckwrdjzB7Jy1V4on8ztPEY8OMOHx9OOmWOBPmFgCk+Tqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=dB1kitshacYsmsCtioLWoZecclga3RJMxZ9RRM1eW0s=;
 b=GvNudZVkJzUYuCjw1DQVZIojieUJf17+UlrLffb3Y+Jw0qe2rWHPu4faojDm1Iiv22hK0vy3Mt9Pi7q8swkBhcgOLoO8j/HyLCKI9IFs4JqwjcsXYMcGR3aij1TP9vpJdSKJSkwh1nItlJD2qEo7x5oEB02dueWDac40R68ayW/AFJrnPmr8t9JN+uF/yOLXH2unnsgiuH79zYRo4QZSgC8XZuwgRC0s2GRIzST453au1Qm5JD/AmSiWIA4oUW4QPNVkDXIXKdnYoD4//5Wv/ZqJlb+mAtgrwOsEILXmTKisTMCV6ADz7hMnAfAYadZPt7bXW841D/N4Vkzjpvmsww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from AM6PR0402MB3733.eurprd04.prod.outlook.com
 (2603:10a6:209:1c::25) by AM5PR04MB3188.eurprd04.prod.outlook.com
 (2603:10a6:206:e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Mon, 27 Sep
 2021 09:44:47 +0000
Received: from AM6PR0402MB3733.eurprd04.prod.outlook.com
 ([fe80::3578:887b:860b:3943]) by AM6PR0402MB3733.eurprd04.prod.outlook.com
 ([fe80::3578:887b:860b:3943%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 09:44:46 +0000
From: Al Cho <ACho@suse.com>
To: "f4bug@amsat.org" <f4bug@amsat.org>, "berrange@redhat.com"
 <berrange@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "thuth@redhat.com"
 <thuth@redhat.com>
Subject: Re: gitlab-ci: amd64-opensuse-leap-container job failing
Thread-Topic: gitlab-ci: amd64-opensuse-leap-container job failing
Thread-Index: AQHXsvtLmgHRw8LgnUGljaT+IjZioqu3j0EAgAATZAA=
Date: Mon, 27 Sep 2021 09:44:46 +0000
Message-ID: <5a6e12b7b1180d6e81d489f2f564faf2cb903ac1.camel@suse.com>
References: <657cbef7-11ac-196c-01e2-aeb9744fe446@amsat.org>
 <YVGCStPffR/gss2f@redhat.com>
In-Reply-To: <YVGCStPffR/gss2f@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bf2fde3-fd16-4ead-8a2a-08d9819b7144
x-ms-traffictypediagnostic: AM5PR04MB3188:
x-microsoft-antispam-prvs: <AM5PR04MB318844DF2F27D391A359916EA0A79@AM5PR04MB3188.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ekklTpzaMAYiZyklxBndeN+A92SqcgEktt1D6lnDFFnSkzi7YPCQP91J2DVSy65VlMmEwe4RIHZYxBln8b7JLRS3fDrogMEA4r3rhm9a3l1IzEhI6boacLmA2+/NWns4Oikrjg59EgVjyHjOLEkV9z/M8oI/UUrgQnPaPtBHLhac8CaViEwFts5annWk8sxBxTJRr/HI5giNMSU3Qbu+5ZFnefVnM+S2tf/V145iDySeot2qo1n9DDgTyrQgLqC2d0A2t7NLZR7PSRQLIvpG7liTPOFa+600erPh6hBnu6iY1OhqxNhZ1Avj3qOZF6Blkxk5t/PwZB0b5fxyCjlKS1XTKUWoU0RDHKRj7jKjGwR+tiexa0bISdSrOsWwn6zd3uvKUBupuCN48g7vbpkVzbyOXsXurngUViG9wB4UppgNMyQJlHqL0Xbrnss7lYWtnxmSaBVHj/rqFj/ePA6T7YGnqqyv6jHJfevb65YjCArQf6mcjsgh+3O4GTSMqaBQwIr5g/d/I49g7Nu2zDTJpvNoNcrQvSH/ySMiwTM9vZ4nsePBy6SIS4u/bYaQZAgN+SC9IVTwKeSO2NZcVikpeVfZxHUrJKaAX7xmcl345L8UNTHNpfR2WwR+5lvnGynnm3vZiLK6Rs07SA6PV542hJpAbkzyM6QzvyhprUFYmR/OAZsbSCOaxOzOQ/wqEREdTJSdshW5iNLJ8hbx1XsyV7WxFX7KxX8fYN21sgxgs3TELbf1q3wWKZwenpwxfZ8a+yo3Iq6LQ9ke+ykcLvtI56Ai7T/hbdNGXq3Wnlw742Gs96wCJHXNL4RhvXMRvSVq+h86guOhAP463oidH+3A9CsAQAp9Jzq+sXdi+sQq9IE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3733.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(122000001)(38070700005)(966005)(36756003)(83380400001)(8936002)(38100700002)(4326008)(2906002)(110136005)(54906003)(2616005)(6486002)(316002)(186003)(508600001)(86362001)(26005)(5660300002)(8676002)(6506007)(66946007)(64756008)(66556008)(66476007)(66446008)(71200400001)(6512007)(91956017)(76116006)(11716005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkNKOW5qa2dqZC9pN1ZaZ0w3dkQyanFIUlA3UWdDbG5weFlsTTRxc2loZFRL?=
 =?utf-8?B?Ynk2VXRRamQxM25YQXAxR2lKMmFXWGRuTERwSG9UTXR5eG03aEx2QXFqbUhO?=
 =?utf-8?B?aUM5YVV2VTBKalVEWEJ1ME0wMnVUb25YU01OUFNqTlI0blR1UEtIZmNIY3N3?=
 =?utf-8?B?Zk5FSERQdDlVMVh4SFEzbWFXQkxWNyttdnEwUUszempVeEZ4RmEwNVFEYzZG?=
 =?utf-8?B?WXpKbXBjZWZyazNvb3VWdXJDTkpnWWplQUhMRW9GdndrRnJpZWNTWXk4KzdV?=
 =?utf-8?B?TktjNzZBWXdMd1FIQnVGcmxLRU9Wd2JXU0VjclVrOHZ5TldUUUkrQTZ3SHRr?=
 =?utf-8?B?NEt3RVp3VlY1Y1ZBRVUwNEI5TVhFVXQ3dlJKYlpHaGZIRXRZaGJNRXowRnB3?=
 =?utf-8?B?bXg1SnBzY3lkOFBkQTRROUQyVGxIZ013a1djWkEyUUJ0cmRPdUt5V0hSakVX?=
 =?utf-8?B?bG1BUGFOUW9vcGpTaGNyd05FU1NXai96RDFmMWdVRmczeSt4OFpxSDIwTGxw?=
 =?utf-8?B?eHRReUlsMU5CZlhzdUlaVSsxRDkxYXBJNkptd1lCV0syOUpQOVRod21NQ2VC?=
 =?utf-8?B?L3RicThOckMxNHo3UFpHTmlCYVd4S1I1SWVnNEc3V3N5SUMzQ1ZEclhKdWRj?=
 =?utf-8?B?UFU2NzhyMEVUSHgwVTQxZmcxeVJ1bjNJZlVFRVB6SXVsd0RpYUpRK0dNQTRp?=
 =?utf-8?B?RVErbE1PS3BlSm81bE5RdEV3RlVlbENMVkRWaVVkNkkvakd1N29DQXlIS3Zm?=
 =?utf-8?B?VXFOd1ZNN2doeGd0SGNoMkJaSkpqNlhSMjBZR3VGandFdXQ3bDhnZVE2MGJT?=
 =?utf-8?B?d3JYWFZJMk05d0RCZzJGenFpL2tIczVHalNWTzNlNklNalRZWjU1dVhnK1Bv?=
 =?utf-8?B?RE10N2ZIT2hFSjFJQnpIL3pMRTM5alk4MDVsNkp4SHp4UWtoNzRIOVFZd0Qy?=
 =?utf-8?B?eWJHNnNyWjFsYTdrZDVodlpGZTVUTmlNWnNmQUc5eG5WWHRHSWQzeUY0NkRH?=
 =?utf-8?B?T0JiaU52aUN0RGlKWFlLdmE4dWR0ZHZ5Q0piY2d6eUlPV3BMUldhbk9LSVlO?=
 =?utf-8?B?V0R2QmErai9uN25YTW9OaThyd2U5VENzR3hERVNZbU5LR2c1ck1Vc0RsSm9t?=
 =?utf-8?B?dHplUUVUYTF4Vi9rMnVqZnIxUzc3bkNSOHRib29PeEZwOTZ2TlNJS0pldkU5?=
 =?utf-8?B?VnhvZHR6M0MwOXhkMEpnZWorWm9pOVVZVUFUUk52RmNDdDZSaHNzRmFOcU81?=
 =?utf-8?B?VndTTjZJMk4rbHpWZmZndG9LVFpzV3ZFaEE3OVNnYkprQXgvSG1wMVcvckZq?=
 =?utf-8?B?b1pobGludmF2M2YwWXZUT1cxTWNHblIvV1dlUU5uV2hhdDRBR3h4ZmVpdm1X?=
 =?utf-8?B?Q0JRZlpvdUc2dlBKeXlQUWVsM2FKcVZjeklwSUtZYkQ0ckJQMVBKc0JIcXFr?=
 =?utf-8?B?b3BBM2IxYUdWVVRLMHl3L1BTN3F4Y0ZTSmR4bTJmV2VXUnV4c2xsTVBhb1kv?=
 =?utf-8?B?ajhJQ0s4bGd0OVdZbVd3alpST3lNdWVtNWFoR3dIeDlIWHROaHN0S3pSZkRa?=
 =?utf-8?B?TFNSelhiSW9abVRHcktldXZoYm5XSVRRWXhWOGhkaC9OWVN1ZkNrRW5hTWs3?=
 =?utf-8?B?cktFUXpWMHQ5N2JHM2U5YU1TRlY0NkNzRHdZblUzeHJtRm1QOG9yVmxiYUVa?=
 =?utf-8?B?MVdiYy9oU3V1Y3d2d1l0V0ZiUmZ3VDgzWDVUOXVkZjIyTm9HR0V4MUUvRSt5?=
 =?utf-8?Q?xtsq/WoHfxsVSGVOuubSvTHZDEJzpqulicjVSTz?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <36AF3D9D27B972408B9D3B51F670E8B8@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3733.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf2fde3-fd16-4ead-8a2a-08d9819b7144
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 09:44:46.8997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PXeN89wW08dAfdGZwzm/1qS/QYp7A8RgzIodoq6vpn73Oj7BFJrs8swXi3DHNovH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3188
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

T24gTW9uLCAyMDIxLTA5LTI3IGF0IDA5OjM1ICswMTAwLCBEYW5pZWwgUC4gQmVycmFuZ8OpIHdy
b3RlOg0KPiBPbiBTdW4sIFNlcCAyNiwgMjAyMSBhdCAwNzoyMzo1NlBNICswMjAwLCBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4gPiBIaSwNCj4gPiANCj4gPiBGWUkgdGhlIE9wZW5T
VVNFIGpvYiBpcyBmYWlsaW5nIHNpbmNlIGZldyBkYXlzLCBpLmUuOg0KPiA+IGh0dHBzOi8vZ2l0
bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2pvYnMvMTYyMjM0NTAyNg0KPiA+IA0KPiA+IMKg
IFJldHJpZXZpbmcgcmVwb3NpdG9yeSAnTWFpbiBSZXBvc2l0b3J5JyBtZXRhZGF0YQ0KPiA+IFsu
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
ZXJyb3JdDQo+ID4gwqAgUmVwb3NpdG9yeSAnTWFpbiBSZXBvc2l0b3J5JyBpcyBpbnZhbGlkLg0K
PiA+IA0KPiA+IFtyZXBvLQ0KPiA+IG9zc3xodHRwOi8vZG93bmxvYWQub3BlbnN1c2Uub3JnL2Rp
c3RyaWJ1dGlvbi9sZWFwLzE1LjIvcmVwby9vc3MvXQ0KPiA+IFZhbGlkIG1ldGFkYXRhIG5vdCBm
b3VuZCBhdCBzcGVjaWZpZWQgVVJMDQo+ID4gwqAgSGlzdG9yeToNCj4gPiDCoMKgIC0gRG93bmxv
YWQgKGN1cmwpIGVycm9yIGZvcg0KPiA+ICcNCj4gPiBodHRwOi8vZG93bmxvYWQub3BlbnN1c2Uu
b3JnL2Rpc3RyaWJ1dGlvbi9sZWFwLzE1LjIvcmVwby9vc3MvcmVwb2RhdGEvcmVwb21kLnhtbCcN
Cj4gPiA6DQo+ID4gwqAgRXJyb3IgY29kZTogQ3VybCBlcnJvciA1Ng0KPiA+IMKgIEVycm9yIG1l
c3NhZ2U6IFJlY3YgZmFpbHVyZTogQ29ubmVjdGlvbiByZXNldCBieSBwZWVyDQo+ID4gwqDCoCAt
IENhbid0IHByb3ZpZGUgL3JlcG9kYXRhL3JlcG9tZC54bWwNCj4gPiDCoCBQbGVhc2UgY2hlY2sg
aWYgdGhlIFVSSXMgZGVmaW5lZCBmb3IgdGhpcyByZXBvc2l0b3J5IGFyZSBwb2ludGluZw0KPiA+
IHRvIGENCj4gPiB2YWxpZCByZXBvc2l0b3J5Lg0KPiA+IMKgIFdhcm5pbmc6IFNraXBwaW5nIHJl
cG9zaXRvcnkgJ01haW4gUmVwb3NpdG9yeScgYmVjYXVzZSBvZiB0aGUgYWJvdmUNCj4gPiBlcnJv
ci4NCj4gPiANCj4gPiBJIHRyaWVkIHRvIHJ1biAnenlwcGVyIHJlZicgd2l0aDoNCj4gDQo+IEl0
IGlzbid0IGNvbmZpbmVkIHRvIG9ubHkgU3VTRS4gSW4gbGlidmlydCB3ZSd2ZSBoYWQgc2ltaWxh
ciBwcm9ibGVtcw0KPiB3aXRoIHNldmVyYWwgb3RoZXIgam9icywgdGhvdWdoIGFyZSBzdXNlIGpv
YnMgYXJlIHRoZSB3b3JzdCBhZmZlY3RlZC4NCj4gDQo+IEdpdExhYiBoYXZlIGZpbmFsbHkgYWNr
bm93bGVkZ2VkIGl0IGlzIGFuIGdlbmVyYWwgaW5mcmEgaXNzdWUgYWZmZWN0aW5nDQo+IG1hbnkg
dGhpbmdzOg0KPiANCj4gwqDCoCBodHRwczovL3N0YXR1cy5naXRsYWIuY29tLw0KPiDCoMKgIGh0
dHBzOi8vZ2l0bGFiLmNvbS9naXRsYWItY29tL2dsLWluZnJhL3Byb2R1Y3Rpb24vLS9pc3N1ZXMv
NTU5MA0KPiANCj4gPiAtLSA+OCAtLQ0KPiA+IC0tLSBhL3Rlc3RzL2RvY2tlci9kb2NrZXJmaWxl
cy9vcGVuc3VzZS1sZWFwLmRvY2tlcg0KPiA+ICsrKyBiL3Rlc3RzL2RvY2tlci9kb2NrZXJmaWxl
cy9vcGVuc3VzZS1sZWFwLmRvY2tlcg0KPiA+IEBAIC0xMDksNSArMTA5LDcgQEAgRU5WIFBBQ0tB
R0VTIFwNCj4gPiDCoMKgwqDCoCB6bGliLWRldmVsDQo+ID4gwqBFTlYgUUVNVV9DT05GSUdVUkVf
T1BUUyAtLXB5dGhvbj0vdXNyL2Jpbi9weXRob24zLjYNCj4gPiANCj4gPiAtUlVOIHp5cHBlciB1
cGRhdGUgLXkgJiYgenlwcGVyIC0tbm9uLWludGVyYWN0aXZlIGluc3RhbGwgLXkNCj4gPiAkUEFD
S0FHRVMNCj4gPiArUlVOIHp5cHBlciByZWZyZXNoICYmIFwNCj4gPiArwqDCoMKgIHp5cHBlciB1
cGRhdGUgLXkgJiYgXA0KPiA+ICvCoMKgwqAgenlwcGVyIC0tbm9uLWludGVyYWN0aXZlIGluc3Rh
bGwgLXkgJFBBQ0tBR0VTDQo+ID4gwqBSVU4gcnBtIC1xICRQQUNLQUdFUyB8IHNvcnQgPiAvcGFj
a2FnZXMudHh0DQo+ID4gLS0tDQo+ID4gDQo+ID4gYnV0IG5vIGx1Y2s6IGh0dHBzOi8vZ2l0bGFi
LmNvbS9waGlsbWQvcWVtdS8tL2pvYnMvMTYyMzU1NDk2Mg0KPiA+IA0KPiA+IFNob3VsZCB3ZSB0
ZW1wb3JhcmlseSBkaXNhYmxlIHRvIGpvYiBhbmQgaXRzIGRlcGVuZGVuY2llcz8NCj4gDQo+IEdp
dmVuIGl0IGlzIGJlbGlldmVkIHRvIGJlIGEgZ2l0bGFiIGluZnJhIGlzc3VlLCByYXRoZXIgdGhh
biBhIHByb2JsZW0NCj4gb2Ygb3Vycywgb3Igc29tZXRoaW5nIHdlJ3JlIHVzaW5nLCBJIHRoaW5r
IGJlc3QgdG8gd2FpdCBhIGxpdHRsZSBsb25nZXINCj4gdG8gc2VlIGlmIHRoZXkgZ2V0IGZpeCB0
aGUgaW5mcmEuDQo+IA0KDQphZ3JlZSwgYW5kIEkgYW0gYWxzbyBjaGVja2luZyB0aGUgc3RhdHVz
IG9mIGl0Lg0KZm9yIG5vdyB0aGUgaHR0cDovL2Rvd25sb2FkLm9wZW5zdXNlLm9yZy9kaXN0cmli
dXRpb24vbGVhcC8xNS4yIGFuZCB0aGUNCnJlcG8gd29ya3MuDQpXaWxsIGZvbGxvdyB1cCBpdC4N
Cg0KQ2hlZXJzLA0KICAgICAgQUwNCg==


