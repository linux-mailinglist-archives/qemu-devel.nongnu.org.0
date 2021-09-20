Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA0D41268B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 20:59:44 +0200 (CEST)
Received: from localhost ([::1]:47550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSOVz-00012c-Gc
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 14:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mSOSC-0005Wx-O5; Mon, 20 Sep 2021 14:55:49 -0400
Received: from mail-sn1nam01on0710.outbound.protection.outlook.com
 ([2a01:111:f400:fe40::710]:12032
 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mSOS9-0004wr-Mk; Mon, 20 Sep 2021 14:55:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EINLz8VafT+H9wGK2ph19JZyd5x68wf8C/jjAc9puHIidwg9hGANhiVEHpeLr+vw+PlV6Vyhkce2aZfhpyBtSBgOnklLlC2khEHqib9uExgw/8NHA9OA0h9vHIB2cWm6pZTo2ASaarmkxUcAM7BkAstoReCB9l+HNKcxKCWXSJaaJQKA/kK1t8uk/Lcjl3ejswyDcFknX1MB+PbWytJ6PYkmN74h3Bvqi2ZqBwyENj5WFFqpAmLAIU9746PUni+hUeIGX16Yw+SOE/1Au6QMYvbnk1+wi95eEMR6lBG4sLS93kB4ub48eYoNiU9z8ED1DdKulyLza9TPOc/z5wx5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=kHAWpAjmjrER7CGIC7EQRmzoqS5aabtmkWi7ecVRjO8=;
 b=llVBfHFI8RB2dZFgpe0OfgO1ZZFw8TrHm3nnbbEHr05/ZrzktdEtzUN4YBwN3aExCHhlTftjClTNJD0tLLcyEb2IFbF3zDOrGku6vVzZVFquZ6b7vsdPNnUqP9lHVX3n0hKjGU8WM68VuoDu/wEpwCv6i6gH0Xl/zBkGhpBJoBv4uVjCuEY4efEjlsICTRG7wUSo72cqRMXhxKJj7se+DX6asz0vPquyfTtPkDY0FTUQaDi4GmnN7+gwvjHDM1qDuwYYYoIlUaZVs7NAPgrL5BEPSUxJuxQXLXouGWEinFHhss6ltkCr9fYWJnm8IAAaotbmB8gc84GhSGr4XDp8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHAWpAjmjrER7CGIC7EQRmzoqS5aabtmkWi7ecVRjO8=;
 b=tGl4gIqtSc/XT2OY7vqitWhBwaR2iqG/imt1NSm8RF5aVXt/+0QS4tbFA9ZzNy9ibh0BWI0GalWfftascTq2Jk0puzk0b31i3Xa0gwoPka2LMhxDTgetsZyubkCLdYgCXGoQiN1FhEm+jw5vDBTqJhCesT21vSuC0Nt14yjr1TeUi/pPXOswQQ0aN2CM5rrgYz3iUq+KImckjpPtMYc1jUHDvbVVBbd5NP+gJjcj3b2MMny8eI4VF6PCzP8OsWLg/ZMvyCk4NupL6dlUE2/CcI6xAm3TL8zAxmabRHtuZK7vYTpMZVLYjDdpcJWcL68U38WXX4Ph33XnCEFxIHj1rQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB5697.lamprd80.prod.outlook.com (2603:10d6:102:11::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 18:50:39 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::506a:7080:4ca3:6c91]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::506a:7080:4ca3:6c91%5]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 18:50:38 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-ppc@nongnu.org"
 <qemu-ppc@nongnu.org>
Subject: RE: [PATCH v3 00/22] target/ppc: DFP instructions using decodetree
Thread-Topic: [PATCH v3 00/22] target/ppc: DFP instructions using decodetree
Thread-Index: AQHXpja4IvIjEbc2t0SH+LWMV6tdGKutUqyA
Date: Mon, 20 Sep 2021 18:50:38 +0000
Message-ID: <CP2PR80MB36685955837B010A35386926DAA09@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
In-Reply-To: <20210910112624.72748-1-luis.pires@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: eldorado.org.br; dkim=none (message not signed)
 header.d=none;eldorado.org.br; dmarc=none action=none
 header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3eb07ec1-c472-484b-9f4e-08d97c678a0d
x-ms-traffictypediagnostic: CP2PR80MB5697:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB5697C0115E02B77F4C137960DAA09@CP2PR80MB5697.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BVK64ZJsSXAmUcDpynQY95ZylUYYZ95IyO6kOjeXHlrD4p7rfth4bT7knhdzVYtG3eti0ua92oKmIdPeK4EKFqKDr5ur2JuoNWkCALkT1P1eC/akCVGG4lcOu2hDVFNyQsUwsai9ubHvA3wD2153k+tAf9h1Yc7nxTYEeXfRFpXB5/KMZmM05HtSqx9elKwLbtpKB7JQRK1vtZj2YqjiIdmT/K7kyeQ+yxhScoh4sn5E4tP+IoUpq1Zjgqk+qoPZAl5G1lHtBvBImre3yP2TyBoOJzb8kuRU8CLD13tXwBM6fwS9T2nhpB0lrO5cmkGnLLc3kGzdyahUPfVVwtyWrdOzMLu6bZD5mCbg8x324JYKLy3bwyWe6h9Ln76dBwGl7FP8b2g1Q24BCZZHIBGW/Y3966X5Ays1c5gwgtZJSicQ934OTfRKSRvwX8tMOMIaQfMpWf3E+9Rg5NHmvAWYo86d0LcbfotRhJk2KXF9jbaQ47dXsgQ4znbBH78baiI4Y+/IUBWXIdvis02EGP8pgibBC9h2tmFEpUcbWpP81kQH/uraEA78FEEzbZ9Prchxv3jj+5+uq2SgDUdMwmbWqngTcfxU1iQ7JnQc4C4r2u5O5OjHESf18buhKvJfckUZk0TlSbpItxetsd6fqojBm6mt7qXaUJY2O4HrZ7ETQRsq5V6yIur3mgZuiOOS5BN1ygDatPtFcCFqlCgFpOIfIGpkfc7Y8ucBCFpP22pDoUIeq97gZRuiWayo4+32tdbZx9naXVYh/7lTHUGlM7L1cCE1dNuEXfnv9l67vct5fNY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(136003)(396003)(39850400004)(33656002)(83380400001)(71200400001)(478600001)(55016002)(7696005)(26005)(38100700002)(110136005)(54906003)(52536014)(8936002)(316002)(8676002)(38070700005)(19627235002)(9686003)(5660300002)(186003)(66556008)(86362001)(66446008)(64756008)(4326008)(66476007)(76116006)(2906002)(66946007)(6506007)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzVQcTJiNkV4NGtBakhHOWxsUmx4R05zTWVianhmeStPWTFCeCtEK3E0Z2FO?=
 =?utf-8?B?UFpsVEV5cmJ6U042WWdFZ2w4czU0aitiam9CNGMvWjBjVVBSNHNiVi9lWmhZ?=
 =?utf-8?B?VXVIcHVZaGU0clo3VzZaZGVPK2NCa1VOZVRRNU1MSFFOb0d0RExSQkRuRzlP?=
 =?utf-8?B?c2JxY3R4Um9DS2lZczhCMnNTNmZJMmtzZnNpMURYOUgzZzhBcTJnZ3k3MW9I?=
 =?utf-8?B?TVA1SHNtWFlXMnpMTm1yd3RCbUJyeHpGUEo5OXFPeW5RaFhicnVyR3pLMDE1?=
 =?utf-8?B?MmltZ1A0bG9scUh6VHQ2MlBpcjY0R0YzVE9CUGlJeE5qMHN6UTBGSDlwckxS?=
 =?utf-8?B?RUFDdzB1MnZ3cnRuSWJjMFBxMjJjWmx0Q05nL1hIVExNL1lXS0xNcXRYUWdm?=
 =?utf-8?B?MzNxQmZxc2xCU0NZYSs5anZuUWEyVW5SdFBmQXBWd1FISC8rMjJkamZaK0w2?=
 =?utf-8?B?TkkxU0pQZW1Ja21PMFpDQ0VGSnFFdzU4QlcvV0VJT1c4YTdpeGhxZEhwS2Rt?=
 =?utf-8?B?L0hocnA3SXRjSDhCTTdjR0VrSnMrMGc4TDVFZGU0dTFQbVJwaW8wUk9hRllC?=
 =?utf-8?B?aWtVblRLL3BlTGEwWEExMXRqcGYwV3lNc0tqak9SRHYxbjVuY1lsTDVyZW1h?=
 =?utf-8?B?RXYzMUFCZHRDMklEcERPMWR2TmJ2bWpDbHFmM2RBajVHbGErWjlTWlpIR20w?=
 =?utf-8?B?NHRacHJjLzNucDNCb2JwUTZ2dW4vWG9MUHRhcjJ4UVdqK0ZSVzYwb3VZNEJM?=
 =?utf-8?B?VmI5VmZwZzMzNUR3M2JlbXFrYlNRd3Q4M3p0ekxCdW9rNmN3S3dTdHdkRHpv?=
 =?utf-8?B?TTRBenRQTmRPODE1S3A1MUY2eVBTT2s0V3lZdEFjR0IxWU1CWkxJdzBnc0JZ?=
 =?utf-8?B?dHVYTGg5ai8zWlhiQVdPNDk2OWdOUWhuMHpEcDlVMEI1QVB6c3FBVXFjaGha?=
 =?utf-8?B?THRiZG54YUJRSm4ydlBnMDIzZDhSYWlyMS8xM1RlVkIyRUV3ZE1Ia2NjVkM4?=
 =?utf-8?B?OGJHRE5RRFJpeWV1MnNmY001VG8vYnhPbWcxMjkvM3lPMTR1NlNHWVpxc1A0?=
 =?utf-8?B?K0dwaDFlcHI4Z2p6dDQ3UmFKMERqUmRRZk5MNXQ4dVJxYStsUUk2dzdxc3No?=
 =?utf-8?B?VmdiWlRNMWZ2UFNpZEZueFI0cUhob0FodE80dmdmVmJiaVc0QVIzTFRPd1o2?=
 =?utf-8?B?eGZibU1qRmVEbnZ6Y3hWNTRJQjZCek5kL3hOa3VjQzZGWlRXV2pCM0RnVC8x?=
 =?utf-8?B?YnRISWNZbTJObUozUlZLWXRCRUV1UGxHSE9YL2lOL2Y0S0tuQk9Cc2NJK1kv?=
 =?utf-8?B?aThUNkZWVUJxdHJtY1MvZ1gvbGNHKzRkRnl5aXE4Z1lMbytUTkt6djNzR1VQ?=
 =?utf-8?B?cWU2OHA3ejQxY2RxMXRVeEdWOWdqdkFld0phUGxZeGg3SkgyaDh6dHBxQXFo?=
 =?utf-8?B?WmRQWm15UzBzNi9XUHMzMVdZTVBzNTdWMXBZeVhXNGg4Wk9FbHBMckZaL3hQ?=
 =?utf-8?B?T0hvZ1IyeU5KUGJ4SmlCZEpwNlJnUTYvb09yaWNCLy8yck5HU0hRNmVmaUVT?=
 =?utf-8?B?cUlhRWNpd3E1V2UyQTFaTlNWOHhqa2RpRy83K1IwU2p6ZlFUQWh0UzhLY2R5?=
 =?utf-8?B?QUJwK0JBamdBNTduUTd6M1lQc0V5czRzMU9VN3VYbHJ0blN4TkM3bm9FR21j?=
 =?utf-8?B?Sm5Gdjk0cXUrWDh4OU9sY2pGbVNYbUI2bGp4S0xFYXR2RVlHZ3JjMVpiLzVZ?=
 =?utf-8?Q?jnHDY/Wr1qOVO9fVA5c+zlMIS7CVbCZOs8j+Vb2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb07ec1-c472-484b-9f4e-08d97c678a0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2021 18:50:38.6201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hjfUKJ6NKW40k1PWutcOTFct63khHRsLQzcTw58UqOxYYVoByMMJxzXCYMWrujxhTM7nQ5kJssxvetQh1Ew96Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5697
Received-SPF: pass client-ip=2a01:111:f400:fe40::710;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Cc: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "groug@kaod.org" <groug@kaod.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGluZy4NCg0KUGF0Y2hlcyAxLTQgd2VyZSBhbHJlYWR5IGFwcGxpZWQsIGFuZCBwYXRjaGVzIDUt
OCwgMTIsIDE1LCAxOCBhcmUgbWlzc2luZyByZXZpZXdzLg0KDQpUaGFua3MsDQoNCi0tDQpMdWlz
IFBpcmVzDQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURPDQpBdmlzbyBMZWdhbCAtIERp
c2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQoN
CkZyb206IEx1aXMgUGlyZXMgPGx1aXMucGlyZXNAZWxkb3JhZG8ub3JnLmJyPg0KPiBUaGlzIHNl
cmllcyBtb3ZlcyBhbGwgZXhpc3RpbmcgREZQIGluc3RydWN0aW9ucyB0byBkZWNvZGV0cmVlIGFu
ZCBpbXBsZW1lbnRzIHRoZQ0KPiAyIG5ldyBpbnN0cnVjdGlvbnMgKGRjZmZpeHFxIGFuZCBkY3Rm
aXhxcSkgZnJvbSBQb3dlciBJU0EgMy4xLg0KPiANCj4gSW4gb3JkZXIgdG8gaW1wbGVtZW50IGRj
ZmZpeHFxLCBkaXZ1MTI4L2RpdnMxMjggd2VyZSBtb2RpZmllZCB0byBzdXBwb3J0IDEyOC0NCj4g
Yml0IHF1b3RpZW50cyAocHJldmlvdXNseSwgdGhleSB3ZXJlIGxpbWl0ZWQgdG8gNjQtYml0IHF1
b3RpZW50cyksIGFsb25nIHdpdGgNCj4gYWRqdXN0bWVudHMgYmVpbmcgbWFkZSB0byB0aGVpciBl
eGlzdGluZyBjYWxsZXJzLg0KPiBsaWJkZWNudW1iZXIgd2FzIGFsc28gZXhwYW5kZWQgdG8gYWxs
b3cgY3JlYXRpbmcgZGVjaW1hbCBudW1iZXJzIGZyb20gMTI4LQ0KPiBiaXQgaW50ZWdlcnMuDQo+
IA0KPiBTaW1pbGFybHksIGZvciBkY3RmaXhxcSwgbXVsdTEyOCAoaG9zdC11dGlscykgYW5kIGRl
Y051bWJlckludGVncmFsVG9JbnQxMjgNCj4gKGxpYmRlY251bWJlcikgd2VyZSBpbnRyb2R1Y2Vk
IHRvIHN1cHBvcnQgMTI4LWJpdCBpbnRlZ2Vycy4NCj4gDQo+IFRoZSByZW1haW5pbmcgcGF0Y2hl
cyBvZiB0aGlzIHNlcmllcyBtb3ZlIGFsbCBvZiB0aGUgYWxyZWFkeSBleGlzdGluZyBERlANCj4g
aW5zdHJ1Y3Rpb25zIHRvIGRlY29kZXRyZWUsIGFuZCBlbmQgdXAgcmVtb3ZpbmcgZGZwLW9wcy5j
LmluYywgd2hpY2ggaXMgbm8NCj4gbG9uZ2VyIG5lZWRlZC4NCj4gDQo+IE5PVEUgMTogVGhlIHBy
ZXZpb3VzLCBub24tZGVjb2RldHJlZSBjb2RlLCB3YXMgdXBkYXRpbmcgY3R4LT5uaXAgZm9yIGFs
bCB0aGUNCj4gREZQIGluc3RydWN0aW9ucy4gSSd2ZSByZW1vdmVkIHRoYXQsIGJ1dCBpdCB3b3Vs
ZCBiZSBncmVhdCBpZiBzb21lb25lIGNvdWxkDQo+IGNvbmZpcm0gdGhhdCB1cGRhdGluZyBuaXAg
cmVhbGx5IHdhc24ndCBuZWNlc3NhcnkuDQo+IA0KPiBOT1RFIDI6IFNvbWUgYXJpdGhtZXRpYyBm
dW5jdGlvbiBzdXBwb3J0IGZvciAxMjgtYml0IGludGVnZXJzIHdhcyBhZGRlZCwgZm9yDQo+IG5v
dywgc3RpbGwgdXNpbmcgNjQtYml0IHBhaXJzLiBJbiB0aGUgbmVhciBmdXR1cmUsIEkgdGhpbmsg
d2Ugc2hvdWxkIG1vZGlmeSBhbGwgb2YNCj4gdGhlbSB0byB1c2UgSW50MTI4IChhbmQgaW50cm9k
dWNlIFVJbnQxMjgpLiBCdXQgSSdsbCBzZW5kIG91dCBhbiBSRkMgdG8gZGlzY3Vzcw0KPiBob3cg
dG8gZG8gdGhhdCBpbiBhbm90aGVyIHBhdGNoIHNlcmllcy4NCj4gDQo+IE5PVEUgMzogVGhlIGhl
bHBlciBuYW1lcyBhcmUgaW4gdXBwZXJjYXNlLCB0byBtYXRjaCB0aGUgaW5zdHJ1Y3Rpb24gbmFt
ZXMgYW5kDQo+IHRvIHNpbXBsaWZ5IHRoZSBtYWNyb3MgdGhhdCBkZWZpbmUgdHJhbnMqIGZ1bmN0
aW9ucy4NCj4gUHJldmlvdXNseSwgdGhpcyB3YXNuJ3QgdGhlIGNhc2UsIGFzIHdlIHdlcmUgdXNp
bmcgbG93ZXJjYXNlIGluc3RydWN0aW9uIG5hbWVzDQo+IGluIHRoZSBwcmUtZGVjb2RldHJlZSBj
b2RlLiBBbm90aGVyIHN0YW5kYWxvbmUgcGF0Y2ggd2lsbCBiZSBzZW50IGxhdGVyIG9uLA0KPiBj
aGFuZ2luZyB0byB1cHBlcmNhc2UgdGhlIG90aGVyIG5ldyAoZGVjb2RldHJlZSkgaGVscGVycyB3
aG9zZSBuYW1lcyBhcmUNCj4gZGlyZWN0bHkgcmVsYXRlZCB0byBpbnN0cnVjdGlvbiBuYW1lcywg
ZXZlbnR1YWxseSBtYWtpbmcgUFBDIGhlbHBlciBuYW1lcw0KPiBjb25zaXN0ZW50Lg0KPiANCj4g
QmFzZWQtb246IDIwMjEwODIzMTUwMjM1LjM1NzU5LTEtbHVpcy5waXJlc0BlbGRvcmFkby5vcmcu
YnINCj4gKHRhcmdldC9wcGM6IGZpeCBzZXR0aW5nIG9mIENSIGZsYWdzIGluIGJjZGNmc3EpIFRo
aXMgc2VyaWVzIGFzc3VtZXMgYmNkY2ZzcSdzIGZpeCBpcw0KPiBhbHJlYWR5IGluLg0KPiANCj4g
Q2hhbmdlcyBpbiB2MzoNCj4gLSBTcGxpdCB0aGUgdWFiczY0IHBhdGNoIGluIDINCj4gLSBJbmNs
dWRlZCBwYXRjaCB0byBmaXggbWlzc2luZyB6ZXJvLWV4dGVuc2lvbiBpbiBkaXZzMTI4DQo+IC0g
Rm9sZGVkIGRpdmlzb3IgPT0gMCBpbnRvIHRoZSBkaGkgPT0gMCBjYXNlIGluIGRpdnUxMjgNCj4g
LSBNb3ZlZCB1ZGl2X3Fybm5kIGZyb20gc29mdGZsb2F0LW1hY3Jvcy5oIHRvIGhvc3QtdXRpbHMu
aA0KPiAtIFVzZWQgdWRpdl9xcm5uZCBpbiBkaXZ1MTI4DQo+IC0gUmVwbGFjZWQgaW50IHdpdGgg
Ym9vbCBpbiBkaXZzMTI4DQo+IC0gQWRkZWQgdW5pdCB0ZXN0IHRvIGNoZWNrIHRoZSBkaXZpc29y
IG5vcm1hbGl6YXRpb24gaW4gZGl2dTEyOA0KPiAtIFJlbW92ZWQgJ2lubGluZScgZnJvbSB0aW1l
c18qIGZ1bmN0aW9ucyBpbiBwcGMvdHJhbnNsYXRlLmMNCj4gLSBVc2VkIHVhZGQ2NF9vdmVyZmxv
dyBpbiBtdWx1MTI4DQo+IC0gUmVtb3ZlZCB1bm5lY2Vzc2FyeSAnZWxzZScgZnJvbSBkZWNOdW1i
ZXJJbnRlZ3JhbFRvSW50MTI4DQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIFJlbmFtZWQgYWJz
NjQoKSB0byB1YWJzNjQoKQ0KPiANCj4gUGF0Y2hlcyBtaXNzaW5nIHJldmlldzoNCj4gICBob3N0
LXV0aWxzOiBmaXggbWlzc2luZyB6ZXJvLWV4dGVuc2lvbiBpbiBkaXZzMTI4DQo+ICAgaG9zdC11
dGlsczogbW92ZSBjaGVja3Mgb3V0IG9mIGRpdnUxMjgvZGl2czEyOA0KPiAgIGhvc3QtdXRpbHM6
IG1vdmUgdWRpdl9xcm5uZCgpIHRvIGhvc3QtdXRpbHMNCj4gICBob3N0LXV0aWxzOiBhZGQgMTI4
LWJpdCBxdW90aWVudCBzdXBwb3J0IHRvIGRpdnUxMjgvZGl2czEyOA0KPiAgIGhvc3QtdXRpbHM6
IGFkZCB1bml0IHRlc3RzIGZvciBkaXZ1MTI4L2RpdnMxMjgNCj4gICB0YXJnZXQvcHBjOiBJbXBs
ZW1lbnQgRENGRklYUVENCj4gICB0YXJnZXQvcHBjOiBJbXBsZW1lbnQgRENURklYUVENCj4gICB0
YXJnZXQvcHBjOiBNb3ZlIGRjbXB7dSxvfVtxXSxkdHN7dGV4LHRzZix0c2ZpfVtxXSB0byBkZWNv
ZGV0cmVlDQo+IA0KPiAtLQ0KPiBMdWlzIFBpcmVzDQo+IEluc3RpdHV0byBkZSBQZXNxdWlzYXMg
RUxET1JBRE8NCj4gQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFk
by5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0KPiANCj4gQnJ1bm8gTGFyc2VuICgxKToNCj4gICB0
YXJnZXQvcHBjOiBNb3ZlIFJFUVVJUkVfQUxUSVZFQy9WRUNUT1IgdG8gdHJhbnNsYXRlLmMNCj4g
DQo+IEZlcm5hbmRvIFZhbGxlICgxKToNCj4gICB0YXJnZXQvcHBjOiBJbnRyb2R1Y2UgUkVRVUlS
RV9GUFUNCj4gDQo+IEx1aXMgUGlyZXMgKDIwKToNCj4gICBob3N0LXV0aWxzOiBGaXggb3ZlcmZs
b3cgZGV0ZWN0aW9uIGluIGRpdnUxMjgoKQ0KPiAgIGhvc3QtdXRpbHM6IGZpeCBtaXNzaW5nIHpl
cm8tZXh0ZW5zaW9uIGluIGRpdnMxMjgNCj4gICBob3N0LXV0aWxzOiBpbnRyb2R1Y2UgdWFiczY0
KCkNCj4gICBpMzg2L2t2bTogUmVwbGFjZSBhYnM2NCgpIHdpdGggdWFiczY0KCkgZnJvbSBob3N0
LXV0aWxzDQo+ICAgaG9zdC11dGlsczogbW92ZSBjaGVja3Mgb3V0IG9mIGRpdnUxMjgvZGl2czEy
OA0KPiAgIGhvc3QtdXRpbHM6IG1vdmUgdWRpdl9xcm5uZCgpIHRvIGhvc3QtdXRpbHMNCj4gICBo
b3N0LXV0aWxzOiBhZGQgMTI4LWJpdCBxdW90aWVudCBzdXBwb3J0IHRvIGRpdnUxMjgvZGl2czEy
OA0KPiAgIGhvc3QtdXRpbHM6IGFkZCB1bml0IHRlc3RzIGZvciBkaXZ1MTI4L2RpdnMxMjgNCj4g
ICBsaWJkZWNudW1iZXI6IGludHJvZHVjZSBkZWNOdW1iZXJGcm9tW1VdSW50MTI4DQo+ICAgdGFy
Z2V0L3BwYzogSW1wbGVtZW50IERDRkZJWFFRDQo+ICAgaG9zdC11dGlsczogSW50cm9kdWNlIG11
bHUxMjgNCj4gICBsaWJkZWNudW1iZXI6IEludHJvZHVjZSBkZWNOdW1iZXJJbnRlZ3JhbFRvSW50
MTI4DQo+ICAgdGFyZ2V0L3BwYzogSW1wbGVtZW50IERDVEZJWFFRDQo+ICAgdGFyZ2V0L3BwYzog
TW92ZSBkdHN0ZGNbcV0vZHRzdGRnW3FdIHRvIGRlY29kZXRyZWUNCj4gICB0YXJnZXQvcHBjOiBN
b3ZlIGR7YWRkLHN1YixtdWwsZGl2LGlleH1bcV0gdG8gZGVjb2RldHJlZQ0KPiAgIHRhcmdldC9w
cGM6IE1vdmUgZGNtcHt1LG99W3FdLGR0c3t0ZXgsdHNmLHRzZml9W3FdIHRvIGRlY29kZXRyZWUN
Cj4gICB0YXJnZXQvcHBjOiBNb3ZlIGRxdWFpW3FdLCBkcmludHt4LG59W3FdIHRvIGRlY29kZXRy
ZWUNCj4gICB0YXJnZXQvcHBjOiBNb3ZlIGRxdWFbcV0sIGRycm5kW3FdIHRvIGRlY29kZXRyZWUN
Cj4gICB0YXJnZXQvcHBjOiBNb3ZlIGRjdHtkcCxxcHF9LGRye3NwLGRwcX0sZGN7Zix0fWZpeFtx
XSxkeGV4W3FdIHRvDQo+ICAgICBkZWNvZGV0cmVlDQo+ICAgdGFyZ2V0L3BwYzogTW92ZSBkZGVk
cGRbcV0sZGVuYmNkW3FdLGRzY2xpW3FdLGRzY3JpW3FdIHRvIGRlY29kZXRyZWUNCj4gDQo+ICBo
dy9pMzg2L2t2bS9pODI1NC5jICAgICAgICAgICAgICAgICAgICB8ICAgNyArLQ0KPiAgaW5jbHVk
ZS9mcHUvc29mdGZsb2F0LW1hY3Jvcy5oICAgICAgICAgfCAgODIgLS0tLS0NCj4gIGluY2x1ZGUv
aHcvY2xvY2suaCAgICAgICAgICAgICAgICAgICAgIHwgICA3ICstDQo+ICBpbmNsdWRlL2xpYmRl
Y251bWJlci9kZWNOdW1iZXIuaCAgICAgICB8ICAgNCArDQo+ICBpbmNsdWRlL2xpYmRlY251bWJl
ci9kZWNOdW1iZXJMb2NhbC5oICB8ICAgMiArLQ0KPiAgaW5jbHVkZS9xZW11L2hvc3QtdXRpbHMu
aCAgICAgICAgICAgICAgfCAxNjMgKysrKysrKystLQ0KPiAgbGliZGVjbnVtYmVyL2RlY0NvbnRl
eHQuYyAgICAgICAgICAgICAgfCAgIDcgKy0NCj4gIGxpYmRlY251bWJlci9kZWNOdW1iZXIuYyAg
ICAgICAgICAgICAgIHwgMTMxICsrKysrKysrDQo+ICB0YXJnZXQvcHBjL2RmcF9oZWxwZXIuYyAg
ICAgICAgICAgICAgICB8IDE2OCArKysrKysrLS0tDQo+ICB0YXJnZXQvcHBjL2hlbHBlci5oICAg
ICAgICAgICAgICAgICAgICB8IDEwNiArKysrLS0tDQo+ICB0YXJnZXQvcHBjL2luc24zMi5kZWNv
ZGUgICAgICAgICAgICAgICB8IDE3MSArKysrKysrKysrDQo+ICB0YXJnZXQvcHBjL2ludF9oZWxw
ZXIuYyAgICAgICAgICAgICAgICB8ICAyMyArLQ0KPiAgdGFyZ2V0L3BwYy90cmFuc2xhdGUuYyAg
ICAgICAgICAgICAgICAgfCAgMjMgKy0NCj4gIHRhcmdldC9wcGMvdHJhbnNsYXRlL2RmcC1pbXBs
LmMuaW5jICAgIHwgNDE5ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCj4gIHRhcmdldC9wcGMv
dHJhbnNsYXRlL2RmcC1vcHMuYy5pbmMgICAgIHwgMTY1IC0tLS0tLS0tLS0NCj4gIHRhcmdldC9w
cGMvdHJhbnNsYXRlL3ZlY3Rvci1pbXBsLmMuaW5jIHwgIDEwICstDQo+ICB0ZXN0cy91bml0L21l
c29uLmJ1aWxkICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ICB0ZXN0cy91bml0L3Rlc3QtZGl2
MTI4LmMgICAgICAgICAgICAgICB8IDE5NyArKysrKysrKysrKysNCj4gIHV0aWwvaG9zdC11dGls
cy5jICAgICAgICAgICAgICAgICAgICAgIHwgMTQyICsrKysrKy0tLQ0KPiAgMTkgZmlsZXMgY2hh
bmdlZCwgMTE2MyBpbnNlcnRpb25zKCspLCA2NjUgZGVsZXRpb25zKC0pICBkZWxldGUgbW9kZSAx
MDA2NDQNCj4gdGFyZ2V0L3BwYy90cmFuc2xhdGUvZGZwLW9wcy5jLmluYw0KPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHRlc3RzL3VuaXQvdGVzdC1kaXYxMjguYw0KPiANCj4gLS0NCj4gMi4yNS4xDQoN
Cg==

