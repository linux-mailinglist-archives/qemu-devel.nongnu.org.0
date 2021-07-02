Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB693BA279
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 17:03:44 +0200 (CEST)
Received: from localhost ([::1]:47980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzKhj-0006rH-T3
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 11:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnick@vmware.com>)
 id 1lzKfW-0004Y9-FS; Fri, 02 Jul 2021 11:01:26 -0400
Received: from mail-mw2nam12on2063.outbound.protection.outlook.com
 ([40.107.244.63]:33484 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnick@vmware.com>)
 id 1lzKfU-00047u-DV; Fri, 02 Jul 2021 11:01:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpoOJnj9UkFs4b/c9dywAUxYLbnCfZU2bU+sA+9cYuwqYTlk6DOqjduPcwTeMip50eIGX1+p57gToDILCCkS6lCLtjOR3g5VD/QeUhDld9VYzg7IAwhJuSCkaXjg30hcv6ov9UtnsZskTloRqOYbZ3UCEW1xj0+Ts3B1exxQ0t/K3JYpmZKY+8MzA4ZBvaJcC/nN4e1dsUb6lY9pQN3fz1FTF15yL6x9XOfW/FYzzo2uD/Tb8B/NE5dVjtcjYSONwYliWEhZgGrcPZLoHiMaNa0cmtu2PrjhOsA1gVW0LT2Wb3fVyTi06xl8CeV0mKmTgUf/QqlPc8th4t3set887A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5gn14tH3jnX/ZNhbNCkRXn4/GCRa6AGHXgMEwayAos=;
 b=AcGhY5GnGkLdOMUyQSN85pMaEXWPvshmMNd+a0G9lpO/Q3ltgX3Y7Pg0v4L59WaNdMYO27tO/X6MTX4UMVFULeYJSPZ4jIUQrwXUN3Yzkhyzsjypm19i9zMEEuUPfMq6l7AIdz3cU5csMr50U8/a+kOXa01u0R9yCoLiaEeE4aDKTuzRzkY9M255ftfeuor71gKatX7lpSu0FjCk8lzLNMl7QcJlrUIQGvutRC3ApYhx8n4J0uBgVb3+ZK5sOGAA9YZl1M7VO18iS9q2dvU8x7j2U7FIkR04voNcxW0SDJv8peNxCCagsIoSSLUOg0/mLOf+pksMt6kaVIo4X/jQTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5gn14tH3jnX/ZNhbNCkRXn4/GCRa6AGHXgMEwayAos=;
 b=ic+1KatLTvSyqZ7nJGqq0JuDcc4dvohrSn0JzvEdjw1NRMQtYj0ag+Nw3pzTzn37Jt0H9NmJl4sndrqOkYgVngYkac3ZwQK/SDlzeBw8H1sX2D4nlqEnfBENX3Khoz47QRaW1E033OTjR5+uV1ISz/x7y93J2fEyohTRl7zUt14=
Received: from BYAPR05MB5623.namprd05.prod.outlook.com (2603:10b6:a03:79::10)
 by SJ0PR05MB7438.namprd05.prod.outlook.com (2603:10b6:a03:28b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.12; Fri, 2 Jul
 2021 15:01:14 +0000
Received: from BYAPR05MB5623.namprd05.prod.outlook.com
 ([fe80::71e2:b6b6:2ac7:3bbd]) by BYAPR05MB5623.namprd05.prod.outlook.com
 ([fe80::71e2:b6b6:2ac7:3bbd%7]) with mapi id 15.20.4287.017; Fri, 2 Jul 2021
 15:01:14 +0000
From: Nick Hudson <hnick@vmware.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
Thread-Topic: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
Thread-Index: AQHXbMCSdfZjmXjSHUOdWVc01tqN36sqvr6AgAAOaQCAABNegIAE4o2A
Date: Fri, 2 Jul 2021 15:01:14 +0000
Message-ID: <30A12551-3860-4FDD-B20E-A5CBECF94898@vmware.com>
References: <20210629082713.31396-1-hnick@vmware.com>
 <CAFEAcA-vSoriA2iCwyvBWofj1UvtMuRbEnqNuCsoG_hz1Yth_g@mail.gmail.com>
 <35FFA736-504A-482B-B78C-17F7381C7D70@vmware.com>
 <CAFEAcA-AvYq5ujspY1bxqjzX=1EYP4zY0ortFdNhJwPU+pDJGA@mail.gmail.com>
In-Reply-To: <CAFEAcA-AvYq5ujspY1bxqjzX=1EYP4zY0ortFdNhJwPU+pDJGA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 686d60d7-6fd8-40ef-dd79-08d93d6a3c96
x-ms-traffictypediagnostic: SJ0PR05MB7438:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR05MB7438DCCCAB1818B8B9A85CD4C81F9@SJ0PR05MB7438.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cxpGNlby5oGCVCqKWCX2OVuzI1OCjLlP5pZTA2+11p+kmVWZ1Jyu23ZbruUebWFlkVlPvcTvJnlgCySjTQKBK2VSdpxJ4xAkJlzHuk+zSyZGIUb44rYDLNIgAKo3wPnIusr3gHcyon0Viwre7kkYt0GHk2z9JqGo/fpcyPq63KSFh6+CDxW20HDiBWfvwxCjFMhJ//HAEdM4cv2thrMKwrK/f1XKVlw83a8rXEPTLCE8ZaWVy4xPzAymqjOCeXq9yO9AAr8+sVy+I0MarpVeqnYCLtXRoTpW+YZ4TyFiTV2kQmqgY7lwyy6jWDlrMEMk4IzPdua1XkWHDupCIfh7gS638OTFZz0mBG7qRKy0RByuu//he6M0tgNSHgI+KDkUhJK/1l+Q4czFo65iK16tozHQR+uxokI/IvqA487SES2+N8jP6sPzI6m8BqfixnS2Poa6XrvRDYA39tcyVmCxTf3wesykhowLaDfYFrbK8FurpGH/aDG3HIht5Z42va9IDfWH8MO+/AoyqBVmeaDjwREx76XYAkMCKv9MDEY44GHjrFd+ON3C5xkWACoCxM50CDwLFHxblhquJiAbCwTFAo93BF2jbWQ6nRTFfErOWHIzLapADxm//OqFNzjhzBsLYJx7sTFALh2Pwy0fMDroNC4v3rxKhv34OjAxroLoSmUDXVI1fu90OyuQy7XncXbKJeOr/lMcQYXWcgW3HvyuAw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB5623.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(6486002)(36756003)(8936002)(83380400001)(91956017)(6506007)(53546011)(6916009)(2616005)(33656002)(66476007)(54906003)(5660300002)(66556008)(64756008)(66446008)(71200400001)(86362001)(66946007)(2906002)(478600001)(122000001)(4326008)(38100700002)(186003)(8676002)(316002)(76116006)(6512007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWNuaWtCQWRPQlRRSFA1amxIVk9ORFNmQk1FUzNwMzRicUsxRFRPMDg5Unoy?=
 =?utf-8?B?bG1YeVFJbmpSZnVtVlZxTjFLUkZhZ0t2bWZjdVdFa0pkZmR3U2FpOHJuaFVQ?=
 =?utf-8?B?enZOYi90RGpWcnF0RFIrVkF4bXM2eVN4Y0pzSmlwSE54NEdiVG1XZS95S0p4?=
 =?utf-8?B?K1BITVlndGVqTjlWYkJNQ1hKbFk2ZmljcWY0M0RzNlgzSzBYbkxsb2k2OFV5?=
 =?utf-8?B?U1FLY0RFOVR4b3BIV1VKZjArWVB5WFJXYXYxNExETElnekxyTUJSM2NPT1hT?=
 =?utf-8?B?VXhIMEp0eGxCVU1BMG9BYWRNZEwzajVrZVZGVWRxSnRocnVNbmJOUGQwM1hz?=
 =?utf-8?B?dWJveFdoWG4xYU5zdXdUNytVNDUxdm00TzQyRUErUHkzY2Jaei9iQlhIODIr?=
 =?utf-8?B?V09SUHZ3bGhMbkJtTG1OU3A1YWZUUDFYakwxc0FURnp2L1YxSGtnRDFZcDlz?=
 =?utf-8?B?M3k2ZXVmemsrNTc5aDA5c2hFemhuazR4Q3pjUWxDUWVOQXNPbW8za3N1QTZh?=
 =?utf-8?B?M3VtOVhEL2JGY0ptaVBuTDhLTVh6SnpTZTJZWDN2Q2NjSXZsd2RUV1ZtYlFX?=
 =?utf-8?B?bGRLdEFMWFdLUlFOM0ZFTEZRNTB3U2xoa1NmeVV4bjJranlzNXBWRHdTeTBB?=
 =?utf-8?B?cDZScmpjaEZBSTJMbkllY1p0SmN3VW43VE5xaWx4d2dKSGY4VjRxWU05STBX?=
 =?utf-8?B?MGdnLzZscm1SRElWakpTU09XNHdiTkVMWExIbngzcWxNeEs0Ui9QcElOTytH?=
 =?utf-8?B?TGlzdGN2d2tGcFlLYXFvVjZadzlqTG5HWFVDbDB6MWJBMi85TEgwRGZ1dDh3?=
 =?utf-8?B?ZGlrdXFHMSsxNllEN2JhdU5JbHJZWnJ2bXhTaVB0MmhKWHFWTGJQSmVhbWpY?=
 =?utf-8?B?Y1I3Q2d4eE40djVzcWdBVlBwdTVtR1Q2bTB1M240d2dOR1J4S1VLdWtFcnlh?=
 =?utf-8?B?dmdhcmFaaWxKVlRjOWxIakJ2RmVLdGc3R29Lam51eVhvRDRUaFN5SGlYMWlL?=
 =?utf-8?B?aXVBYnVuS2VlOEJSL25SYW1ISUtUNDY1NzMvL01uZEQwRDVvNXZuVThOSHln?=
 =?utf-8?B?MXZsbTBjWkpyMlpHbUlJWTU1OUlKRGwxdlN0dWQxUnE0OWxieXNpcDZDaXpm?=
 =?utf-8?B?ZXJ3Sy95TGRaZ25wQUZyNUI0R1MzbXhRZWhQbHNoVUF6OTlmMFpXamVhUXlY?=
 =?utf-8?B?TXBjQit4aFRCZ1BZSnYrYUwzTXZMTWE2WXZ0V1l4czZUVnZCQjhtS2VmZm9E?=
 =?utf-8?B?d2xZL21PWmFYVU94L3A1YnZpTlo5V3RxRGJvWVlnMzNWWFhUM3VnNzdPWThq?=
 =?utf-8?B?STZ6aDlUa3AraXA4Rlpjb2IxYXh6eURvTElPUnJOaGJlTXA0N3FrbjBiWGd1?=
 =?utf-8?B?SHM0Tmh2a20zZDNHd0lmd0YrZzdUQk9yam9wRWJMNVVnTWxsNU9JbFNVZ05z?=
 =?utf-8?B?QTM0ckkxQ0Q4U0F2SjVZbzhnTVpBdXQzVTlMYXdTR0hGTHROcHlxNklvTmZs?=
 =?utf-8?B?ZW5mWk04TE1LY3ZQVE9WaHVJaVJZQXRJVk5sWk4vK2FEb0ljMXgzSjcvM1pZ?=
 =?utf-8?B?QjJ0a2RPbkRENGVTTGdqMVBqeTlKUWR0dERBRUVoN2RTMGxZN2JqRnFWZTBs?=
 =?utf-8?B?R0NPQU54QlJrVXc0UVhQTHhPMXVmUUNNVy9VdmRPRGVzaGtZbmNOZ3hTS1lK?=
 =?utf-8?B?K3lPUVp6SUhQNUVReTExOWM3YnRseEs1SkpOTzBlOTRYazFJN3dJSFVYOUFP?=
 =?utf-8?B?NzRlSllnd0R3cHI2QXh3Vkl1c1ZQN3Z2K3kwaWMyT1F1Z0FIZ043ZktEZ3ZM?=
 =?utf-8?B?d3RxdDlNSFNpaDlWa000WmpzNysrNXhxdjhKOGNXYWZlRGVwMUw3UzB3bUpJ?=
 =?utf-8?Q?FdFLufp/m2D7i?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <750CCDD9E30E5D44A3BC56951E8DDA2E@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR05MB5623.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686d60d7-6fd8-40ef-dd79-08d93d6a3c96
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2021 15:01:14.0434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cnnHDjUJMv5PuR1NUBc3PDl1rDkk+QjRs3o1tHaPGnfpoBpaQ/fmDImyb+0Eo3GIqOEaL3LfX424FOeeuhOe0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7438
Received-SPF: pass client-ip=40.107.244.63; envelope-from=hnick@vmware.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gMjkgSnVuIDIwMjEsIGF0IDEyOjUwLCBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlk
ZWxsQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gT24gVHVlLCAyOSBKdW4gMjAyMSBhdCAxMTo0
MSwgTmljayBIdWRzb24gPGhuaWNrQHZtd2FyZS5jb20+IHdyb3RlOg0KPj4gDQo+PiANCj4+IA0K
Pj4+IE9uIDI5IEp1biAyMDIxLCBhdCAxMDo0OSwgUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVs
bEBsaW5hcm8ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBPbiBUdWUsIDI5IEp1biAyMDIxIGF0IDA5
OjI3LCA8aG5pY2tAdm13YXJlLmNvbT4gd3JvdGU6DQo+Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBOaWNrIEh1ZHNvbiA8aG5pY2tAdm13YXJlLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IHRhcmdldC9h
cm0vaGVscGVyLmMgfCAyICstDQo+Pj4+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBhL3RhcmdldC9hcm0vaGVscGVy
LmMgYi90YXJnZXQvYXJtL2hlbHBlci5jDQo+Pj4+IGluZGV4IGE2NmMxZjBiOWUuLjcyNjdhZjc5
MjQgMTAwNjQ0DQo+Pj4+IC0tLSBhL3RhcmdldC9hcm0vaGVscGVyLmMNCj4+Pj4gKysrIGIvdGFy
Z2V0L2FybS9oZWxwZXIuYw0KPj4+PiBAQCAtNjMzMCw3ICs2MzMwLDcgQEAgc3RhdGljIGNvbnN0
IEFSTUNQUmVnSW5mbyBkZWJ1Z19jcF9yZWdpbmZvW10gPSB7DQo+Pj4+ICAgICAqIFdlIGRvbid0
IGltcGxlbWVudCB0aGUgY29uZmlndXJhYmxlIEVMMCBhY2Nlc3MuDQo+Pj4+ICAgICAqLw0KPj4+
PiAgICB7IC5uYW1lID0gIk1EQ0NTUl9FTDAiLCAuc3RhdGUgPSBBUk1fQ1BfU1RBVEVfQk9USCwN
Cj4+Pj4gLSAgICAgIC5jcCA9IDE0LCAub3BjMCA9IDIsIC5vcGMxID0gMCwgLmNybiA9IDAsIC5j
cm0gPSAxLCAub3BjMiA9IDAsDQo+Pj4+ICsgICAgICAuY3AgPSAxNCwgLm9wYzAgPSAyLCAub3Bj
MSA9IDMsIC5jcm4gPSAwLCAuY3JtID0gMSwgLm9wYzIgPSAwLA0KPj4+PiAgICAgIC50eXBlID0g
QVJNX0NQX0FMSUFTLA0KPj4+PiAgICAgIC5hY2Nlc3MgPSBQTDFfUiwgLmFjY2Vzc2ZuID0gYWNj
ZXNzX3RkYSwNCj4+Pj4gICAgICAuZmllbGRvZmZzZXQgPSBvZmZzZXRvZihDUFVBUk1TdGF0ZSwg
Y3AxNS5tZHNjcl9lbDEpLCB9LA0KPj4+IA0KPj4+IFRoaXMgZml4ZXMgdGhlIGVuY29kaW5nIGZv
ciBBQXJjaDY0LCBidXQgYnJlYWtzIGl0IGZvciBBQXJjaDMyLA0KPj4+IHdoZXJlIGl0IGlzIGNw
PTE0IG9wYzE9MCBjcm49MCBjcm09MSBvcGMyPTAuIEJlY2F1c2UgdGhpcyBpcyBvbmUgb2YNCj4+
PiB0aG9zZSBzeXN0ZW0gcmVnaXN0ZXJzIHdoZXJlIHRoZSBBQXJjaDY0IGFuZCBBQXJjaDMyIGVu
Y29kaW5ncw0KPj4+IGRvbid0IG1hdGNoIHVwLCB0byBmaXggdGhlIEFBcmNoNjQgZW5jb2Rpbmcg
d2UgbmVlZCB0byByZXBsYWNlDQo+Pj4gdGhpcyBBUk1fQ1BfU1RBVEVfQk9USCByZWdpbmZvIHdp
dGggc2VwYXJhdGUgcmVnaW5mbyBmb3INCj4+PiBBUk1fQ1BfU1RBVEVfQUEzMiBhbmQgQVJNX0NQ
X1NUQVRFX0FBNjQsIHNvbWV0aGluZyBsaWtlIHRoaXM6DQo+Pj4gDQo+Pj4gICB7IC5uYW1lID0g
Ik1EQ0NTUl9FTDAiLCAuc3RhdGUgPSBBUk1fQ1BfU1RBVEVfQUE2NCwNCj4+PiAgICAgLm9wYzAg
PSAyLCAub3BjMSA9IDMsIC5jcm4gPSAwLCAuY3JtID0gMSwgLm9wYzIgPSAwLA0KPj4+ICAgICAu
dHlwZSA9IEFSTV9DUF9BTElBUywNCj4+PiAgICAgLmFjY2VzcyA9IFBMMV9SLCAuYWNjZXNzZm4g
PSBhY2Nlc3NfdGRhLA0KPj4+ICAgICAuZmllbGRvZmZzZXQgPSBvZmZzZXRvZihDUFVBUk1TdGF0
ZSwgY3AxNS5tZHNjcl9lbDEpLCB9LA0KPj4+ICAgeyAubmFtZSA9ICJEQkdEU0NSaW50IiwgLnN0
YXRlID0gQVJNX0NQX1NUQVRFX0FBMzIsDQo+Pj4gICAgIC5jcCA9IDE0LCAub3BjMCA9IDIsIC5v
cGMxID0gMCwgLmNybiA9IDAsIC5jcm0gPSAxLCAub3BjMiA9IDAsDQo+Pj4gICAgIC50eXBlID0g
QVJNX0NQX0FMSUFTLA0KPj4+ICAgICAuYWNjZXNzID0gUEwxX1IsIC5hY2Nlc3NmbiA9IGFjY2Vz
c190ZGEsDQo+Pj4gICAgIC5maWVsZG9mZnNldCA9IG9mZnNldG9mbG93MzIoQ1BVQVJNU3RhdGUs
IGNwMTUubWRzY3JfZWwxKSwgfSwNCj4+PiANCj4+IA0KPj4gQWgsIHllcy4NCj4+IA0KPj4gQXMg
TURDQ1NSX0VMMFszMDoyOV0gb25seSBtYXBzIHRvIERCR0RTQ1JpbnRbMzA6MjldIG1heWJlIGl0
IHNob3VsZCBiZSBhbGwgUkFaPw0KPiANCj4gV2VsbCwgeW91IGNhbid0IG1ha2UgaXQgYWxsIFJB
WiwgYmVjYXVzZSB0aG9zZSAyIGJpdHMgZG8gc3RpbGwNCj4gbmVlZCB0byBiZSBtYXBwZWQsIGJ1
dCBJIGd1ZXNzIGluIHRoZW9yeSB5ZXMgd2Ugc2hvdWxkIGRlZmluZQ0KPiByZWFkIGFuZCB3cml0
ZSBhY2Nlc3NvciBmdW5jdGlvbnMgZm9yIEFBcmNoNjQgTURDQ1NSX0VMMCB0aGF0DQo+IG1hc2sg
b3V0IGV2ZXJ5dGhpbmcgZXhjZXB0IFszMDoyOV0uDQoNCihBcG9sb2dpZXMgaWYgeW91IGdldCB0
aGlzL3NpbWlsYXIgdHdpY2UgLSBteSBlbWFpbCBpcyBkb2luZyBzdHJhbmdlIHRoaW5ncykNCg0K
SGkgUGV0ZXIsDQoNCkkgdGhpbmsgdGhlIGZvbGxvd2luZyBpcyBhY2NlcHRhYmxlIGluIHRoYXQg
cWVtdSBkb2VzbuKAmXQgdG91Y2ggTURTQ1JfRUwxIGFzIGZhciBhcyBJIGNhbiB0ZWxsLg0KUGVy
aGFwcyBJ4oCZbSByZWFkaW5nIHRoZSBjb2RlIGFuZCB0aGUgQVJNIEFSTSB3cm9uZz8NCg0KICAg
IC8qIE1EQ0NTUl9FTDBbMzA6MjldIG1hcCB0byBEQkdEU0NSaW50WzMwOjI5XS4gU2ltcGx5IFJB
Wi4NCiAgICAgKiBXZSBkb24ndCBpbXBsZW1lbnQgdGhlIGNvbmZpZ3VyYWJsZSBFTDAgYWNjZXNz
Lg0KICAgICAqLw0KICAgIHsgLm5hbWUgPSAiTURDQ1NSX0VMMCIsIC5zdGF0ZSA9IEFSTV9DUF9T
VEFURV9BQTY0LA0KICAgICAgLmNwID0gMTQsIC5vcGMwID0gMiwgLm9wYzEgPSAzLCAuY3JuID0g
MCwgLmNybSA9IDEsIC5vcGMyID0gMCwNCiAgICAgIC50eXBlID0gQVJNX0NQX0NPTlNULCAucmVz
ZXR2YWx1ZSA9IDAgfSwNCiAgICAvKiBEQkdEU0NSaW50WzE1LDEyLDU6Ml0gbWFwIHRvIE1EU0NS
X0VMMVsxNSwxMiw1OjJdICovDQogICAgeyAubmFtZSA9ICJEQkdEU0NSaW50IiwgLnN0YXRlID0g
QVJNX0NQX1NUQVRFX0FBMzIsDQogICAgICAuY3AgPSAxNCwgLm9wYzAgPSAyLCAub3BjMSA9IDAs
IC5jcm4gPSAwLCAuY3JtID0gMSwgLm9wYzIgPSAwLA0KICAgICAgLnR5cGUgPSBBUk1fQ1BfQUxJ
QVMsDQogICAgICAuYWNjZXNzID0gUEwxX1IsIC5hY2Nlc3NmbiA9IGFjY2Vzc190ZGEsDQogICAg
ICAuZmllbGRvZmZzZXQgPSBvZmZzZXRvZihDUFVBUk1TdGF0ZSwgY3AxNS5tZHNjcl9lbDEpLCB9
LA0KDQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IHdhbnQgbWUgdG8gcG9zdCB0aGlzIChvciBh
IGRpZmZlcmVudCBjaGFuZ2UpIGFzIGEgbmV3IGRpZmYuDQoNClRoYW5rcywNCk5pY2s=

