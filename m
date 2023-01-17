Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A008F66DAAA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:12:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHiwi-00072K-C2; Tue, 17 Jan 2023 05:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pHiwU-00071v-KM
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:11:50 -0500
Received: from mail-dbaeur03on20721.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::721]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pHiwS-0006TX-7t
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:11:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9tYPmjdR98qT2AqDvV9QNLm560RQPenjBDv/erjycOW5c77cLQfqJQMzwUTAQY/Qe2qzA4yyPwY92vL8a6NMk0p0RYqy/7ceZaGGz94S1d++jPuH6KWPgJcV1FX5bHyp//JYxWOcueT7GxhwsQNCKVtSz/f71o//XuNPlyI943HJ4OWi7K1EVqwKqHTnfLw+ARcZhDegdjjcry4kcq9y9j2tZrgKCaJFzeOMpxnqFm9ifvw7sR64CAeJDBBORMaVGIcfVyXLiOeAiX9902y6X3pIEaOJdR81STVDmcWXKYrDU8T/v/tJL9C6Id7oRTD4jwFU2SW2tJwuWOErCeA2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yo8r+nu910GhNCCPS4sU1agNTFvhodpLDG8w1YQCCyE=;
 b=SH/+VYBuOAvfrqfFjV4jHYJIYrYuitD9zm21Kh1WWePWV8klTYHM5CIMo/zcbHkeUoYYlVS1tu5dqbvWPav3O20x4JrWnZVhzWncUU3gDPiyPQ1Z55MHqUR4Vshw+9G24jdeCqSM1mZldGLQc6+UX9GcVPIBnd9cgQXiByyXFtkSJZ3XSQbPchSEdI3y9lMlr6B2IcGwfa8sWJ9zG9zDnpBWTY1wvNVEDmGuajxJpOw5EShHUHSmZ5asHsS8lqsRCggot/weK0pPYT/0wUa/mxMkbH1bnY19Lv2oATJG5EHkmMl7qK3ViCQwZ67OrmzP6iqZmTusXaBRfoXROCGfUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo8r+nu910GhNCCPS4sU1agNTFvhodpLDG8w1YQCCyE=;
 b=QF4E+2LIwGxjJyYt8cYjv2JggOwbRxmy54gWkbSFxrWtS3xrIwCCw/yegZV8Ub+VWZQ0457poJqlmSFm1tvybFGuEV7X+ce5teNM3jCc5oC5FqlBWGkfuGvuKrQupiYYPYs/hBllq7lT43aQorPfEbrTgw48tP2p/nessoEe+48=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM0P189MB0643.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:19f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 10:06:38 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 10:06:38 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Jason Wang <jasowang@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 00/13] Introduce igb
Thread-Topic: [PATCH v2 00/13] Introduce igb
Thread-Index: AQFRvzF/OFdPy4WzbN77JlOABjU2LK+xOEtg
Date: Tue, 17 Jan 2023 10:06:38 +0000
Message-ID: <DBBP189MB143387278B7D9D256B3BF5AF95C69@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <CACGkMEvAwrfUwQVAj0qZFy+Wib5FSBwayyN_qGbZ8edNwB_18g () mail !
 gmail ! com>
In-Reply-To: <CACGkMEvAwrfUwQVAj0qZFy+Wib5FSBwayyN_qGbZ8edNwB_18g () mail !
 gmail ! com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|AM0P189MB0643:EE_
x-ms-office365-filtering-correlation-id: 6aeb8ecc-3fc0-44cd-a4d1-08daf8728632
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tJABkXSHyrRqXN7hZY2EYbS9HVxrGW4sw3i2igVxEV+unM2iGfQrlBBEF2do6U/dgFlrj6wcVMGY+bx+msBLsvpxBmlwNbuXKs2kLQ+6IhRedJKemUZEKjWMe5xFhMQ55PPNavz73uQDfkirgz+vVgz0m7Nvshtoq1QHATibDtM7K3QS8NSdmNsTG+zug1uJAn+QSdtCn16vMI9C+CDZsidS1ZFD1VC/EHzzAAwFs5KhEGQ7i4NL4E6qJFJZxOxe6pmh1relr9GUM0IztQ9YPx77G+db0QsQUvXbG/9Gs4uMzhf8YqIpZSkOxluw0odPDSgAS5B2+WWixPyEflrkRQT0cZnSSQOU5iGCkf6zHGbvR5qebLiQWinfXB2SDZAwMQDNGCWRpPUYyVUH1nKfvz4JIkfK2Rp95MRZkh1Q17/iB9FPQaw21y60K5DDns3qUJNc928BwCKwFcHwg8EBmys/wUNf1SOO3oHyYerhaIvHbYs/cV58Ef/Es2u4GIDnPQydMzNztiixqRMrg3+App2dAjsCamLprtCFRpPQD0cxFHbHxSzEho046xa8rGvbJ5VLSdzJRIa50RoZb2neHd1Gq2GdpgHMUkPmchjNifHEoTkoYbgWKYtLqroBP+8Mo8fkc+p7WwhD9e2A70C8xM7i5KrLo2856q2yDtN64nMg5NMjEDkOIspnZ3IwjSPi/cJMcACQB+dC3DRXpZsCqEbUfGdytanvUhc8bVg4z2o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(39840400004)(366004)(136003)(396003)(376002)(346002)(451199015)(38070700005)(478600001)(66446008)(186003)(76116006)(26005)(66946007)(66556008)(66476007)(9686003)(86362001)(41300700001)(83380400001)(64756008)(44832011)(966005)(8676002)(71200400001)(8936002)(52536014)(5660300002)(7696005)(33656002)(38100700002)(316002)(6506007)(53546011)(2906002)(122000001)(55016003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b21CVnQvdkV3MmYyR1IzNFM3UGtTZHBodXE2L2J5cEY1MkhLRGFTak9lK2pj?=
 =?utf-8?B?TTg4aVk2V0lZU044TUVqaWdJMkkxNEtBbG9rSVBBUnhlaVlvQlY1S0UrcmVi?=
 =?utf-8?B?aW96VkRCeXBHbUxHbXkreFVxeGtXc21oYmdpbDZnN2pyTmMzbUgvMHh5dWwr?=
 =?utf-8?B?VE8vNkJDbWVGWnN4ejRQdEtHOVNIa1FDQ2szODhBMW94c1VyR0RzNGdYYWZS?=
 =?utf-8?B?QTdvNk9pWnNiNExVRjJSOEY2N2ZXRmlPUjBmTTYzZ25wR3p3QXVFdGlOeW40?=
 =?utf-8?B?Vzkydnd6QkhyNks3WSt5dkhaVVo5L3NVR2ZnSXNUcUVSMFJnVWxTeUhrYm1j?=
 =?utf-8?B?RVBvNlRieVNPZzZjZlFwVWZ3SnZMV1lsei9SNEFvNmFFRURRUXA5cEFhUGYz?=
 =?utf-8?B?RGFUZ04zN1RYNmFKdkFRRG1xd2ZLRW1MZXdtQkV2WWJta2MrU2ZxTVdWYzk3?=
 =?utf-8?B?ZXF4ZWtWRXo3Z25kYVQ2T3MrZmFpUnFHV3ZNOGZ1NHdPaFVWd1dIZXFDcXRK?=
 =?utf-8?B?SGhUTHVvb1JZK3UvY3JFV1dJWW0xek0vbm01OTVwNEZORVNoT0lZNWI1dkZu?=
 =?utf-8?B?TlNUV1Z5ZUE3TlEvU2w4R1Y5dGhNR2JSbjlvNHVISXlpdHZSMkk3T0JxMjhZ?=
 =?utf-8?B?NVRmY205SnZRWGV0ZHlvMjZVR3Z3UDBhK0c4QkxZTnUzTFF4ZTlBdU56SmdH?=
 =?utf-8?B?cTl2QzIxWU5LSTgxdjVER2IrZGUrTm03eE93MzM1NTlUeWd0OE40ZmlzNjZV?=
 =?utf-8?B?NzM3ZmlXRXJQY1cwL3JhbkhQM1NYVTVWYXcwSWwwazNCTndZM0ZQRzE0eHhl?=
 =?utf-8?B?WVBYMWR1aTNZSWFhWGJHSy9ob0lmWGd5RW1MQU50UHFHWk1pOU9TUjNuMnF1?=
 =?utf-8?B?MzNwanFIbUZpa1lxWXBEZkRVamVmV1VFNUNGMWozMVVSd3pXZXFkUkxHUXZE?=
 =?utf-8?B?aU94ampJMHIrZElqOU5nUSt2eW44Nk1hcThPS1J4b1hpck9xbm1Cdml0a09k?=
 =?utf-8?B?WE1FYWJjSGJJcitYOGVIZWk0S2hHSWNzZWpBMzBkVzhCUnQzZTRiemFZeFdp?=
 =?utf-8?B?bysrY2IyUXpUMDQ5VW15L1BkYlRNWmVLMWVsVDN5THVEQXhYTTE0WDJTQkJ2?=
 =?utf-8?B?cjlqZm1BWFVoY0tuWkt3ejdQTXhJY1NtUEg5Ky81YkROVDJoaWMraVBNSys1?=
 =?utf-8?B?OEF1c3ZJYmM3c1p1WDBqblVsZmtmK3h0NVJtQmJ4MTMyY2Y4V1pDeE9YOFdU?=
 =?utf-8?B?WFNKUnQ5dHVsUmNQb29SRnVTdGwycU5tVHlYYkF5M0k1VE10bmJNeUNMOWxZ?=
 =?utf-8?B?WTZVRHo2RmY0b25iZ2pqQjRtdVNKeFFSNFM4QThQdmFJLzZWSmxubURJOXFa?=
 =?utf-8?B?YjNCaDc3UW9GeThSSzlYVjlqTTBaMDYydmhIMGxaWnNNNEgvY2F1eVV6djdn?=
 =?utf-8?B?WFE1UEdXZ0hKRThuaDd0eW5HZ2lob1FBQ0REaUJneDl1LzZsTXFzS0UwOG41?=
 =?utf-8?B?Ync4dXVMRzQvNDJMQjlZNkUxNDRPMkg3UXU1OXhKbHJvWng2OEtrNExtNndk?=
 =?utf-8?B?QWU5SG4yZXNvNFVNbmNzYzVpekl6RE9MWGFnUjF3ZlVnUlM2eDBhZFVUUTRC?=
 =?utf-8?B?WEcwd3BGTGtYVTNZckhidjQvbUp6S29iaW9tcUJldVhOYVNnN3FNdzlzdS9H?=
 =?utf-8?B?U3lNWFhaNmtON3lIZDF5TnhhOVpxeFV4d1hmOVNRYk9Qdm9jN0hhSjJaV0Nz?=
 =?utf-8?B?bUhTT0pUU0sxeEp2WVRyd2V2TnM0cTZZRmxGVDZqNS9FeHZZeUY2VW1uY2No?=
 =?utf-8?B?TjM3TEQ4KzZuTFJEa2svWTk3OElHdGdCbzBzem1tMW16bkI2U1FMajZXNGN3?=
 =?utf-8?B?di9vdmk4VDJjNDJsYjgrcjNzR0l0bFRtbktwY3BjTGJ4QjBVWUhHL3YzdUlr?=
 =?utf-8?B?eis2WEliclJCSmNySWxOdzR6cWcxWS9HbktVa3pjK1VkTVVhUER2RlJTbW56?=
 =?utf-8?B?SHNxT0swM3BGcUo0eEttQ3BBMUFBdWF0a0E3WUNaa0JrcHNpNXp3OURpS09h?=
 =?utf-8?B?OTQ1V3dxQVkvdHNlQ3JxMlV0RlhMZkU3TUg0LzlRQnZRQTU4clNpd1A2ZGJ4?=
 =?utf-8?Q?lvRpq8G60YhsnjxseFg0yZR1K?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aeb8ecc-3fc0-44cd-a4d1-08daf8728632
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 10:06:38.7616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +M5ozU0pfhVxTamHQ0MKExODeGitQOOmHUdhhEQUe9xiehdVzX5t5Mr23gpiT19dXxDNG4T2F73lBORY6bM3WlpdH+IZqQ26uklkK05rMlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0643
Received-SPF: pass client-ip=2a01:111:f400:fe1a::721;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2Fu
ZyAoKSByZWRoYXQgISBjb20+DQo+IFNlbnQ6IE1vbmRheSwgMTYgSmFudWFyeSAyMDIzIDA5OjAx
DQo+IFRvOiBxZW11LWRldmVsDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDAvMTNdIEludHJv
ZHVjZSBpZ2INCj4gDQo+IE9uIFNhdCwgSmFuIDE0LCAyMDIzIGF0IDEyOjEwIFBNIEFraWhpa28g
T2Rha2kgPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBCYXNl
ZC1vbjogPDIwMjMwMTE0MDM1OTE5LjM1MjUxLTEtYWtpaGlrby5vZGFraUBkYXluaXguY29tPg0K
PiA+IChbUEFUQ0ggMDAvMTldIGUxMDAweCBjbGVhbnVwcyAocHJlbGltaW5hcnkgZm9yIElHQikp
DQo+ID4NCj4gPiBpZ2IgaXMgYSBmYW1pbHkgb2YgSW50ZWwncyBnaWdhYml0IGV0aGVybmV0IGNv
bnRyb2xsZXJzLiBUaGlzIHNlcmllcw0KPiA+IGltcGxlbWVudHMNCj4gPiA4MjU3NiBlbXVsYXRp
b24gaW4gcGFydGljdWxhci4gWW91IGNhbiBzZWUgdGhlIGxhc3QgcGF0Y2ggZm9yIHRoZQ0KPiBk
b2N1bWVudGF0aW9uLg0KPiA+DQo+ID4gTm90ZSB0aGF0IHRoZXJlIGlzIGFub3RoZXIgZWZmb3J0
IHRvIGJyaW5nIDgyNTc2IGVtdWxhdGlvbi4gVGhpcw0KPiA+IHNlcmllcyB3YXMgZGV2ZWxvcGVk
IGluZGVwZW5kZW50bHkgYnkgU3JpcmFtIFlhZ25hcmFtYW4uDQo+ID4gaHR0cHM6Ly9saXN0cy5n
bnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjItMTIvbXNnMDQ2NzAuaHRtbA0KPiA+
DQo+ID4gSXQgaXMgcG9zc2libGUgdG8gbWVyZ2UgdGhlIHdvcmsgZnJvbSBTcmlyYW0gWWFnbmFy
YW1hbiBhbmQgdG8NCj4gPiBjaGVycnktcGljayB1c2VmdWwgY2hhbmdlcyBmcm9tIHRoaXMgc2Vy
aWVzIGxhdGVyLg0KPiA+DQo+ID4gSSB0aGluayB0aGVyZSBhcmUgc2V2ZXJhbCBkaWZmZXJlbnQg
d2F5cyB0byBnZXQgdGhlIGNoYW5nZXMgaW50byB0aGUNCj4gbWFpbmxpbmUuDQo+ID4gSSdtIG9w
ZW4gdG8gYW55IG9wdGlvbnMuDQo+IA0KPiBJIGNhbiBvbmx5IGRvIHJldmlld3MgZm9yIHRoZSBn
ZW5lcmFsIG5ldHdvcmtpbmcgcGFydCBidXQgbm90IHRoZQ0KPiA4MjU3NiBzcGVjaWZpYyBwYXJ0
LiBJdCB3b3VsZCBiZSBiZXR0ZXIgaWYgZWl0aGVyIG9mIHRoZSBzZXJpZXMgY2FuIGdldCBzb21l
DQo+IEFDS3MgZnJvbSBzb21lIG9uZXMgdGhhdCB0aGV5IGFyZSBmYW1pbGlhciB3aXRoIDgyNTc2
LCB0aGVuIEkgY2FuIHRyeSB0bw0KPiBtZXJnZS4NCj4gDQpJIGNhbiByZWJhc2UgbXkgY2hhbmdl
cyBvbiB0b3Agb2YgdGhpcyBhbmQgcHVzaCBhbnkgZXh0cmEgY2hhbmdlcyB0aGF0IEkgaGF2ZSBp
biBteSBpbXBsZW1lbnRhdGlvbiBhcyBhIHBhdGNoc2V0IHdpdGggIkJhc2VkLW9uOiIgdGFnIHBv
aW50aW5nIHRvIHRoaXMgc2VyaWVzLiBIb3BlZnVsbHksIHRoYXQgd2lsbCBtYWtlIGl0IHJldmll
dyBlYXNpZXIuDQpJIHRoaW5rIEkgY2FuIGJlIHJlYWR5IGluIGEgd2VlaydzIHRpbWUuDQoNCj4g
VGhhbmtzDQo+IA0KPiA+DQo+ID4gVjEgLT4gVjI6DQo+ID4gLSBTcHVuIG9mZiBlMTAwMGUgZ2Vu
ZXJhbCBpbXByb3ZlbWVudHMgdG8gYSBkaXN0aW5jdCBzZXJpZXMuDQo+ID4gLSBSZXN0b3JlZCB2
bmV0X2hkciBvZmZsb2FkIGFzIHRoZXJlIHNlZW1zIG5vdGhpbmcgcHJldmVudGluZyBmcm9tIHRo
YXQuDQo+ID4NCj4gPiBBa2loaWtvIE9kYWtpICgxMyk6DQo+ID4gICBody9uZXQvbmV0X3R4X3Br
dDogSW50cm9kdWNlIG5ldF90eF9wa3RfZ2V0X2V0aF9oZHINCj4gPiAgIHBjaWU6IEludHJvZHVj
ZSBwY2llX3NyaW92X251bV92ZnMNCj4gPiAgIGUxMDAwOiBTcGxpdCBoZWFkZXIgZmlsZXMNCj4g
PiAgIGlnYjogQ29weSBlMTAwMGUgY29kZQ0KPiA+ICAgaWdiOiBSZW5hbWUgaWRlbnRpZmllcnMN
Cj4gPiAgIGlnYjogQnVpbGQgaWdiDQo+ID4gICBpZ2I6IFRyYW5zZm9ybSB0byA4MjU3NiBpbXBs
ZW1lbnRhdGlvbg0KPiA+ICAgdGVzdHMvcXRlc3QvZTEwMDBlLXRlc3Q6IEZhYnJpY2F0ZSBldGhl
cm5ldCBoZWFkZXINCj4gPiAgIHRlc3RzL3F0ZXN0L2xpYnFvcy9lMTAwMGU6IEV4cG9ydCBtYWNy
ZWcgZnVuY3Rpb25zDQo+ID4gICB0ZXN0cy9xdGVzdC9saWJxb3MvaWdiOiBDb3B5IGUxMDAwZSBj
b2RlDQo+ID4gICB0ZXN0cy9xdGVzdC9saWJxb3MvaWdiOiBUcmFuc2Zvcm0gdG8gaWdiIHRlc3Rz
DQo+ID4gICB0ZXN0cy9hdm9jYWRvOiBBZGQgaWdiIHRlc3QNCj4gPiAgIGRvY3Mvc3lzdGVtL2Rl
dmljZXMvaWdiOiBBZGQgaWdiIGRvY3VtZW50YXRpb24NCj4gPg0KPiA+ICBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA5ICsNCj4gPiAgZG9jcy9zeXN0
ZW0vZGV2aWNlLWVtdWxhdGlvbi5yc3QgICAgICAgICAgICAgIHwgICAgMSArDQo+ID4gIGRvY3Mv
c3lzdGVtL2RldmljZXMvaWdiLnJzdCAgICAgICAgICAgICAgICAgICB8ICAgNzAgKw0KPiA+ICBo
dy9uZXQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA1ICsNCj4g
PiAgaHcvbmV0L2UxMDAwLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSAr
DQo+ID4gIGh3L25ldC9lMTAwMF9jb21tb24uaCAgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
MDIgKw0KPiA+ICBody9uZXQvZTEwMDBfcmVncy5oICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgOTI3ICstLS0NCj4gPiAgaHcvbmV0L2UxMDAwZS5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgMyArLQ0KPiA+ICBody9uZXQvZTEwMDBlX2NvcmUuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgICAxICsNCj4gPiAgaHcvbmV0L2UxMDAweF9jb21tb24uYyAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgMSArDQo+ID4gIGh3L25ldC9lMTAwMHhfY29tbW9uLmggICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgNzQgLQ0KPiA+ICBody9uZXQvZTEwMDB4X3JlZ3MuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgOTQwICsrKysNCj4gPiAgaHcvbmV0L2lnYi5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYxNSArKysNCj4gPiAgaHcvbmV0L2ln
Yl9jb21tb24uaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE0NCArDQo+ID4gIGh3L25l
dC9pZ2JfY29yZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDM5NDYgKysrKysrKysr
KysrKysrKysNCj4gPiAgaHcvbmV0L2lnYl9jb3JlLmggICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDE0NyArDQo+ID4gIGh3L25ldC9pZ2JfcmVncy5oICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA2MjQgKysrDQo+ID4gIGh3L25ldC9pZ2J2Zi5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAzMjcgKysNCj4gPiAgaHcvbmV0L21lc29uLmJ1aWxkICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAgMiArDQo+ID4gIGh3L25ldC9uZXRfdHhfcGt0LmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDYgKw0KPiA+ICBody9uZXQvbmV0X3R4X3BrdC5o
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA4ICsNCj4gPiAgaHcvbmV0L3RyYWNlLWV2
ZW50cyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzMiArDQo+ID4gIGh3L3BjaS9wY2ll
X3NyaW92LmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDUgKw0KPiA+ICBpbmNsdWRl
L2h3L3BjaS9wY2llX3NyaW92LmggICAgICAgICAgICAgICAgICAgfCAgICAzICsNCj4gPiAgLi4u
L29yZy5jZW50b3Mvc3RyZWFtLzgveDg2XzY0L3Rlc3QtYXZvY2FkbyAgIHwgICAgMSArDQo+ID4g
IHRlc3RzL2F2b2NhZG8vaWdiLnB5ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMzggKw0K
PiA+ICB0ZXN0cy9xdGVzdC9lMTAwMGUtdGVzdC5jICAgICAgICAgICAgICAgICAgICAgfCAgIDE3
ICstDQo+ID4gIHRlc3RzL3F0ZXN0L2Z1enovZ2VuZXJpY19mdXp6X2NvbmZpZ3MuaCAgICAgICB8
ICAgIDUgKw0KPiA+ICB0ZXN0cy9xdGVzdC9pZ2ItdGVzdC5jICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMjQzICsNCj4gPiAgdGVzdHMvcXRlc3QvbGlicW9zL2UxMDAwZS5jICAgICAgICAgICAg
ICAgICAgIHwgICAxMiAtDQo+ID4gIHRlc3RzL3F0ZXN0L2xpYnFvcy9lMTAwMGUuaCAgICAgICAg
ICAgICAgICAgICB8ICAgMTQgKw0KPiA+ICB0ZXN0cy9xdGVzdC9saWJxb3MvaWdiLmMgICAgICAg
ICAgICAgICAgICAgICAgfCAgMTg1ICsNCj4gPiAgdGVzdHMvcXRlc3QvbGlicW9zL21lc29uLmJ1
aWxkICAgICAgICAgICAgICAgIHwgICAgMSArDQo+ID4gIHRlc3RzL3F0ZXN0L21lc29uLmJ1aWxk
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgKw0KPiA+ICAzNCBmaWxlcyBjaGFuZ2VkLCA3
NDkyIGluc2VydGlvbnMoKyksIDEwMTggZGVsZXRpb25zKC0pICBjcmVhdGUgbW9kZQ0KPiA+IDEw
MDY0NCBkb2NzL3N5c3RlbS9kZXZpY2VzL2lnYi5yc3QgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+
IGh3L25ldC9lMTAwMF9jb21tb24uaCAgY3JlYXRlIG1vZGUgMTAwNjQ0IGh3L25ldC9lMTAwMHhf
cmVncy5oDQo+IGNyZWF0ZQ0KPiA+IG1vZGUgMTAwNjQ0IGh3L25ldC9pZ2IuYyAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGh3L25ldC9pZ2JfY29tbW9uLmgNCj4gPiBjcmVhdGUgbW9kZSAxMDA2NDQgaHcv
bmV0L2lnYl9jb3JlLmMgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGh3L25ldC9pZ2JfY29yZS5o
ICBjcmVhdGUgbW9kZSAxMDA2NDQgaHcvbmV0L2lnYl9yZWdzLmggIGNyZWF0ZSBtb2RlDQo+ID4g
MTAwNjQ0IGh3L25ldC9pZ2J2Zi5jICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvYXZvY2Fkby9p
Z2IucHkgIGNyZWF0ZQ0KPiA+IG1vZGUgMTAwNjQ0IHRlc3RzL3F0ZXN0L2lnYi10ZXN0LmMgIGNy
ZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IHRlc3RzL3F0ZXN0L2xpYnFvcy9pZ2IuYw0KPiA+DQo+ID4g
LS0NCj4gPiAyLjM5LjANCj4gPg0K

