Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205254043E4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 05:19:41 +0200 (CEST)
Received: from localhost ([::1]:47732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOAbE-00014X-6Z
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 23:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas.weissschuh.ext@zeiss.com>)
 id 1mOAa6-00081F-BX; Wed, 08 Sep 2021 23:18:30 -0400
Received: from mail-eopbgr70102.outbound.protection.outlook.com
 ([40.107.7.102]:9363 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas.weissschuh.ext@zeiss.com>)
 id 1mOAa2-0001Dz-CO; Wed, 08 Sep 2021 23:18:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMwRfhwqpWZ05Ctrrfp8SnzhPHJT3EDhdBau7IdtfGfgg2RDvRqoPX0WtBLT3zERhY7v6ol/78aMMa5bZjj46AEszLhx/ArblLnqXklz5OpxsetV1zRwjal4TMukYTSCkmLY+afPDz+QyxUl9gL/19L50ONwitqxA3lQL1vQm1HXJKmIiBuwhL+by/NmqFwCkHW5dp9yDJYd8Rt/TRctpXqB3Vuh1yM6bH1BNSjX78/9xpDgWR7vBakqyQgftaubmAo+mZJnP5NI1AJAI4SMtcod248vhE8JyEHNWPLKVhJsHb+9maY3H71ld8LS9WfNs/sM4aQBvhP+YyAG2yiZFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=jXIhsGYDIWyrvlFv58PpFtfSyMoLoMIyP1bkfeQu2jg=;
 b=KjlmiuZYCNCEz26BMipj3/rNs6NXqR+jnlSb/+qpCvsmORRO7XIFukDo8c8zADkfJBx487ehnBSIQd3RDA2CQj11aqS73u7+uyZkGx/UQn5z0EYt28CcMpAhvF/xVXujlrbmxOZ8ZIbwxFHMrk7cF6aJAYuiOeSoI8c6u3DBLGbwL1no9sWk4wYuQDXSTHuQbBo7qPUT2TyCmtw5QYKGqcljLHWfcOcxaKdN3qxbmDfdWnrJvwaDEZc3ktKafoTr85CEtS2ZL2pXAGRi5BGn2ZpWtOpOo/lfy79HfgldNOBYLMmPfpErkaxBIU9rs8er+A4PV73jFtHPREU4b8Ij7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zeiss.com; dmarc=pass action=none header.from=zeiss.com;
 dkim=pass header.d=zeiss.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zeiss.onmicrosoft.com; 
 s=selector2-zeiss-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXIhsGYDIWyrvlFv58PpFtfSyMoLoMIyP1bkfeQu2jg=;
 b=lFgrMJmtabk6o5HYG2dR1KURNb9td2uNEIMxFNXm6qysfCjcFEZwqbyS20W1xWJVQZ3naLXAOw7nXaIlpwAy1VIZ1tNob1jMIWoGyT/vjnMQRVxMHyyJAk6xyLtbHP4Cm+PHIVCcePKE76iMFwER3vpa7odZwRERTIIVjFo9ZwU=
Received: from DB8P190MB0699.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:fd::24) by
 DB8P190MB0729.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:126::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Thu, 9 Sep 2021 03:18:21 +0000
Received: from DB8P190MB0699.EURP190.PROD.OUTLOOK.COM
 ([fe80::c855:bcdb:7de:5d2a]) by DB8P190MB0699.EURP190.PROD.OUTLOOK.COM
 ([fe80::c855:bcdb:7de:5d2a%3]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 03:18:21 +0000
From: "Weissschuh, Thomas [ext]" <thomas.weissschuh.ext@zeiss.com>
To: Eric Blake <eblake@redhat.com>
Subject: RE: [PATCH] vmdk: allow specification of tools version
Thread-Topic: [PATCH] vmdk: allow specification of tools version
Thread-Index: AQHXpNj9vU9uquH9K0qH3PMxr8GsBKuaa76AgACbm2A=
Date: Thu, 9 Sep 2021 03:18:21 +0000
Message-ID: <DB8P190MB0699F94F1C4E384A14759A74B8D59@DB8P190MB0699.EURP190.PROD.OUTLOOK.COM>
References: <20210908174250.12946-1-thomas.weissschuh.ext@zeiss.com>
 <20210908175436.7xnongfo7st42ixb@redhat.com>
In-Reply-To: <20210908175436.7xnongfo7st42ixb@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=zeiss.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f95350c2-a448-4148-73f4-08d973407a4a
x-ms-traffictypediagnostic: DB8P190MB0729:
x-microsoft-antispam-prvs: <DB8P190MB0729A0CEBC28EDA0436FE094B8D59@DB8P190MB0729.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PQhmmA/cywJtJs3Tw7xhGefAWiK063bQhlI3PmhaA5bbOuHrDcHHYv+HsbVX1JffluMND5Rd5Jw2PJRnIUfzyST5l21suXQwTQL8SXumXaCv++uiD2ZeQJTd9vosS8PiwVO0AGhnqSu+WqyYotWMnaJT9x9E1Z2LsUELNNHEZdDTio00fGFQm8AHB+p4a0Xcv1xTx7clC2BGy1y2AkGQlLlp/c14fWFGSc3pm9IlCHTBGdptKIjjO1nc4PPmNiNiIJ+uk/hekqfuEqidH0BOU6yYmbsrLtBVkHA+Rmsbe8GYYXn+LhqPE4Vq10K8rOQscA0BJ6vAAgi0TSFmVT41KEM1YcScQbfD54f3QmChJPpExypTyfJ0hbC5mcRCZPfgEJw/JEF0N96Ir2OpH1thR4pKCKrBSjDPMFwlMSJXfUZX2ceCMPw43Ee02DjyGzXngCC8vGk9xcChzpOkCc1s48XESU0iHOtOWT+TJGshbPwcQK6ptyOWpe9/2d1qRS03bAL8HCunUol8XsbqSJFFAlh5JbqIb3aks5aBVWljJJfYLg+r/qig8dHxH9nzVt2JvkdkmGmBesA6e3PNR1LhQLug31ZL4JMmAzY8IjgIRz50QHQW5301FqePJ2PrC514GS5kEhwpuzFF2hzLxzHNT3G+OfSwme4n+obm5Kggfj+W52iHdfh10RBGyszRCTKd7N7suX+EkyKl7mRen1aZSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8P190MB0699.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(6916009)(66574015)(6506007)(53546011)(186003)(2906002)(52536014)(122000001)(86362001)(83380400001)(38100700002)(9686003)(55016002)(316002)(4326008)(5660300002)(7696005)(66946007)(66476007)(54906003)(66556008)(26005)(478600001)(33656002)(71200400001)(66446008)(64756008)(8676002)(55236004)(38070700005)(76116006)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2crT1J5Zm04Y2J2YnBhU3p6UU5XaXhvcTBGNlBmU3BQNlpML0dQcDQzMDJR?=
 =?utf-8?B?bldIb1NrcE1aY3haR0I2YmhHTFpQOTJaN1JCbXd4bTFCZFdNdTRXWGMyZXA5?=
 =?utf-8?B?dzRFOGJKeXljNTNIY0FEUndCV2p0bWp4c1JXL3E0V0VJOWpZQ2VpZTZZTjdt?=
 =?utf-8?B?WG04YVpsRlV6TFVCakpjWWo4eVQxUjA1WlJMVTRybnhPV0czNjRocGJUVi9L?=
 =?utf-8?B?VmpGUnN2dnE5bG9HYURDV3hNeHA3a1pydzlKcElxZWZDWE84VzZEN0R2RmtD?=
 =?utf-8?B?ZVgrVDladHRSWlhsNSsydWJEWUhjVStGYzhmUWgxaW0rRi9JdkgzS1NtNjhM?=
 =?utf-8?B?ZkZmMGQ2bTVNZkpHTDlwWmZwdUlRSk9rUDVWTGJ2U2tTbzMxMkQ0SC9CQlUx?=
 =?utf-8?B?emxJRW91K0UrbmcxdTl4WDZzSlRlNzZ0QXJ3MXNyYXljaSs3VGFEL2ZSR1J1?=
 =?utf-8?B?d1d6L21KVUh4Ym9HUGVoTjlvRzFwL3hLNU1RTmppREF4YVRRVklkQWpmYXVO?=
 =?utf-8?B?VUNSaGUxUmcrTTIxd1QvQVRYak1VYU5mYzYrRDBXTVZJU0VhM1NjWktXT0lJ?=
 =?utf-8?B?MndRbU85eFFMMTNweVNCT1JBYlFRRDJ3OUV1d2JwcTFNZm5wcllQNVVKeWxh?=
 =?utf-8?B?aVU0TGZoMFBqY0R6a2NYQUZQWVA2eHMxWkVCMWFBbnh2U2hiSklZTFY1eThI?=
 =?utf-8?B?Z1lwSENFdkRtYmo4dzVmdHM4VDZYUDZIZzBpSzdVQjJrRmp1azZKZjZIeHIr?=
 =?utf-8?B?MGNWNzllMEwzSkpnMUpZeXRvNDhyMnAzaEJkT3pYcjJUU1Y2YlJNVVE4eHFC?=
 =?utf-8?B?OXFFUFpOM2RsUFUyV2lMNnhMMTYrV0QyQnlRQ3diREp4bnRUa0ozMnlOb1Ir?=
 =?utf-8?B?YnhNV0IrNkNLZEpyYjF1NDJETDUrY1ZhNGZsZFVWL2R4VGZUNU5UYlQyQVdz?=
 =?utf-8?B?V0RoVjhJVTJnUVRoUWNvaVBXRTdVOGt2eGVnenpWMWw3SzZwVWN3SGNFazBH?=
 =?utf-8?B?KzZzaU5jUmFmQ3h0OURQRy90WEFhTVdKeEJmdFoxTEZITXBwTFBpRTI4ZTg5?=
 =?utf-8?B?UHhybHY0Qkd4Q0ZsRm9jOFhwa3I2TE5HcmFEYk1pQVlxNHZiRmYzamh0Zk8r?=
 =?utf-8?B?MDJ4MGZhMUZyWDA1TkpieUsrandselZvbHdnajhhU3hzYkg3NEtIMHNiZWFX?=
 =?utf-8?B?QjJnbGZSYlMrMGlNRXVIQzFQZUI3V05la1ozNUVsWkVkY25XaVpua1hCUmQ4?=
 =?utf-8?B?STRQbStDYXVMY1dZVkYzdTVXR2hLcnpBaFM3MWVnN1NjeEFaZTVhemcwK2RC?=
 =?utf-8?B?a3VvWndvSHZuSnkvbzh4eGVlbDBKc2ZGbnRpWDBYb0RlNmFvY0wxUlhjNUhh?=
 =?utf-8?B?OE5wajN2Wlh4cGpLY2U0MVBCSWo3cVo4RGFmMURFQXh4aW1FT3JkVHpnVzZp?=
 =?utf-8?B?cS9rQ3BRVU1QMnVjeG9TcEFQNVYrOFkwV3F6M0QrVlV1QnJ1eUpTdmM3YVpp?=
 =?utf-8?B?Nml2RVBCY3VMZ2JzWmVOVVQ4MVU4ZzFsdnRNMFV5bnFQQlNrM0d5RWJBOHkz?=
 =?utf-8?B?OXRveWZ4cTJ4Mndtd1pVczYwSjdIZlVUWU1ZTHJ5bTloVFVuY1g1aVhpcFB2?=
 =?utf-8?B?Q0oyZGVnUTZQUCt1VUxmUzVGOVE4Qm9Fb1BoMHRMZVJ1WDl0OUY5T2FZR2F1?=
 =?utf-8?B?cGprWXU3SXNidjJkU1RJZDVEWlJkQU4raHd5KzhnNVRpbkthSWhqbWZYbzhF?=
 =?utf-8?Q?POFlAH57Me5qi5n0AM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: zeiss.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P190MB0699.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f95350c2-a448-4148-73f4-08d973407a4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 03:18:21.5560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 28042244-bb51-4cd6-8034-7776fa3703e8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HdKhA4N9DYzIF7HAaBFsZ/Tgjx+a3eKQ0AldQ3g7tj+lvK4N4X6KAbY0gwSVOf8YS+cMbTuIigomDlEGgSbHnLGUlMrT94VY8gwCeqKJEfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0729
Received-SPF: pass client-ip=40.107.7.102;
 envelope-from=thomas.weissschuh.ext@zeiss.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, "thomas@t-8ch.de" <thomas@t-8ch.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFcmljIEJsYWtlIDxlYmxha2VA
cmVkaGF0LmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgOCwgMjAyMSA3OjU2IFBN
DQo+IFRvOiBXZWlzc3NjaHVoLCBUaG9tYXMgW2V4dF0gPHRob21hcy53ZWlzc3NjaHVoLmV4dEB6
ZWlzcy5jb20+DQo+IENjOiBGYW0gWmhlbmcgPGZhbUBldXBob24ubmV0PjsgS2V2aW4gV29sZiA8
a3dvbGZAcmVkaGF0LmNvbT47IEhhbm5hIFJlaXR6DQo+IDxocmVpdHpAcmVkaGF0LmNvbT47IE1h
cmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT47IHFlbXUtDQo+IGJsb2NrQG5vbmdu
dS5vcmc7IHRob21hc0B0LThjaC5kZTsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIHZtZGs6IGFsbG93IHNwZWNpZmljYXRpb24gb2YgdG9vbHMgdmVyc2lvbg0K
PiANCj4gT24gV2VkLCBTZXAgMDgsIDIwMjEgYXQgMDc6NDI6NTBQTSArMDIwMCwgVGhvbWFzIFdl
acOfc2NodWggd3JvdGU6DQo+ID4gVk1ESyBmaWxlcyBzdXBwb3J0IGFuIGF0dHJpYnV0ZSB0aGF0
IHJlcHJlc2VudHMgdGhlIHZlcnNpb24gb2YgdGhlDQo+ID4gZ3Vlc3QgdG9vbHMgdGhhdCBhcmUg
aW5zdGFsbGVkIG9uIHRoZSBkaXNrLg0KPiA+IFRoaXMgYXR0cmlidXRlIGlzIHVzZWQgYnkgdlNw
aGVyZSBiZWZvcmUgYSBtYWNoaW5lIGhhcyBiZWVuIHN0YXJ0ZWQgdG8NCj4gPiBkZXRlcm1pbmUg
aWYgdGhlIFZNIGhhcyB0aGUgZ3Vlc3QgdG9vbHMgaW5zdGFsbGVkLg0KPiA+IFRoaXMgaXMgaW1w
b3J0YW50IHdoZW4gY29uZmlndXJpbmcgIk9wZXJhdGluZyBzeXN0ZW0gY3VzdG9taXphdGlvbnMi
DQo+ID4gaW4gdlNwaGVyZSwgYXMgaXQgY2hlY2tzIGZvciB0aGUgcHJlc2VuY2Ugb2YgdGhlIGd1
ZXN0IHRvb2xzIGJlZm9yZQ0KPiA+IGFsbG93aW5nIHRob3NlIGN1c3RvbWl6YXRpb25zLg0KPiA+
IFRodXMgd2hlbiB0aGUgVk0gaGFzIG5vdCB5ZXQgYm9vdGVkIG5vcm1hbGx5IGl0IHdvdWxkIGJl
IGltcG9zc2libGUgdG8NCj4gPiBjdXN0b21pemUgaXQsIHRoZXJlZm9yZSBwcmV2ZW50aW5nIGEg
Y3VzdG9taXplZCBmaXJzdC1ib290Lg0KPiA+DQo+ID4gVGhlIGF0dHJpYnV0ZSBzaG91bGQgbm90
IGh1cnQgb24gZGlza3MgdGhhdCBkbyBub3QgaGF2ZSB0aGUgZ3Vlc3QNCj4gPiB0b29scyBpbnN0
YWxsZWQgYW5kIGluZGVlZCB0aGUgVk13YXJlIHRvb2xzIGFsc28gdW5jb25kaXRpb25hbGx5IGFk
ZA0KPiA+IHRoaXMgYXR0cmlidXRlLg0KPiA+IChEZWZhdWx0aW5nIHRvIHRoZSB2YWx1ZSAiMjE0
NzQ4MzY0NyIsIGFzIGlzIGRvbmUgaW4gdGhpcyBwYXRjaCkNCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aC5leHRAemVpc3MuY29tPg0K
PiA+IC0tLQ0KPiA+ICBibG9jay92bWRrLmMgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysr
KysrLS0tLQ0KPiA+ICBxYXBpL2Jsb2NrLWNvcmUuanNvbiB8ICAyICsrDQo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IFVJIHJldmll
dzoNCj4gDQo+ID4gKysrIGIvcWFwaS9ibG9jay1jb3JlLmpzb24NCj4gPiBAQCAtNDU5Nyw2ICs0
NTk3LDcgQEANCj4gPiAgIyBAYWRhcHRlci10eXBlOiBUaGUgYWRhcHRlciB0eXBlIHVzZWQgdG8g
ZmlsbCBpbiB0aGUgZGVzY3JpcHRvci4NCj4gRGVmYXVsdDogaWRlLg0KPiA+ICAjIEBod3ZlcnNp
b246IEhhcmR3YXJlIHZlcnNpb24uIFRoZSBtZWFuaW5nZnVsIG9wdGlvbnMgYXJlICI0IiBvciAi
NiIuDQo+ID4gICMgICAgICAgICAgICAgRGVmYXVsdDogIjQiLg0KPiA+ICsjIEB0b29sc3ZlcnNp
b246IFZNd2FyZSBndWVzdCB0b29scyB2ZXJzaW9uLg0KPiANCj4gTWlzc2luZyBhICcoc2luY2Ug
Ni4yKScgYmx1cmIsIGFuZCBhIGRlc2NyaXB0aW9uIG9mIGl0cyBkZWZhdWx0IHZhbHVlLg0KDQpJ
J2xsIGFkZCB0aGF0IHRvIHYyLCB3aGljaCBJJ2xsIHNlbmQgYXMgc29vbiBhcyBzb21lIG1vcmUg
cmV2aWV3IGNvbW1lbnRzIGNhbWUgaW4uDQoNCj4gPiAgIyBAemVyb2VkLWdyYWluOiBXaGV0aGVy
IHRvIGVuYWJsZSB6ZXJvZWQtZ3JhaW4gZmVhdHVyZSBmb3Igc3BhcnNlDQo+IHN1YmZvcm1hdHMu
DQo+ID4gICMgICAgICAgICAgICAgICAgRGVmYXVsdDogZmFsc2UuDQo+ID4gICMNCj4gPiBAQCAt
NDYxMCw2ICs0NjExLDcgQEANCj4gPiAgICAgICAgICAgICAgJypiYWNraW5nLWZpbGUnOiAgICAn
c3RyJywNCj4gPiAgICAgICAgICAgICAgJyphZGFwdGVyLXR5cGUnOiAgICAnQmxvY2tkZXZWbWRr
QWRhcHRlclR5cGUnLA0KPiA+ICAgICAgICAgICAgICAnKmh3dmVyc2lvbic6ICAgICAgICdzdHIn
LA0KPiA+ICsgICAgICAgICAgICAnKnRvb2xzdmVyc2lvbic6ICAgICdzdHInLA0KPiANCj4gSXMg
aXQgYW4gYXJiaXRyYXJ5IHN0cmluZywgb3IgbXVzdCBhIHZhbGlkIHZhbHVlIGFsd2F5cyBiZSBw
YXJzZWFibGUgYXMgYQ0KPiBudW1lcmljIHZhbHVlPyAgSWYgdGhlIGxhdHRlciwgdGhlbiBtYWtl
IHRoZSBRTVAgcmVwcmVzZW50YXRpb24gbnVtZXJpYw0KPiByYXRoZXIgdGhhbiBzdHJpbmcuDQoN
CkluIHRoZSB2bWRrIGl0c2VsZiBpdCBpcyBhbiBhcmJpdHJhcnkgc3RyaW5nIGJ1dCB0aGUgYWN0
dWFsIHZhbHVlcyBzZWVtIHRvIGJlIGFsd2F5cyBudW1lcmljLg0KQnV0IEkgZG8gaGF2ZSBzb21l
IHZlcnkgZmFpbnQgcmVjb2xsZWN0aW9uIG9mIHNlZWluZyBub3JtYWwgdmVyc2lvbiBudW1iZXJz
IChhLmIuYykgdGhlcmUgYXQgc29tZSBwb2ludCwgYnV0IGNhbid0IGNvbmZpcm0gdGhpcyBhdCB0
aGUgbW9tZW50Lg0KDQpUaG9tYXMNCg==

