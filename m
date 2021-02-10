Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76441316C28
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:11:52 +0100 (CET)
Received: from localhost ([::1]:49334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9t1r-0004hN-HP
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:11:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1l9sjV-0002RY-EN
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:52:53 -0500
Received: from mail-dm6nam10on2066.outbound.protection.outlook.com
 ([40.107.93.66]:6688 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1l9sjT-0002wR-0N
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:52:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DN0g2P4g/vRybAP3lvt5/++4R//ZQOVJ7DB0BuVz6EJLf/Y5/iivYQ4ynhHtKYn4ukPLoV9U6KSUH+wtL6ZqdsxmLLuqzAfst9KBig3CVL73F3nJ7YgCXGQKVuE2MQ9Iss0fE3LbjjbAk1izNe7aBdEJ/PPO/+826GbyPpn2Lf679LeOTjWGfDiz+qjjKlYWblFsXecS3EXlz66Qj2XSCR/ekosTxLkAM5LcVefkE8TMOqz5BHHd6K+gojqtc1w9if2LEInW+r4+t8wikIPfM1pIbA23zVDxooFRYixgOtROWU3qNETkjttkOiUJe3nERN5P4Jhtt4Gv+NtalCbddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7549J0KfSRXPaMu9AnC0J87MeyIVy6nR65Tth2igk/A=;
 b=EIULACCGk71bB/PbbJN6YVio1G97GtMCHu1lrQ/CGs2oSaTSgEbEgyhDMGtt2zOIwU82KnHDfFgg4/5Zpo2txjX8FOEXHii7XVuak6NGIzT+OUz8kQoZNCLGv062Q3gkEDHulV+mlpe2qhF6MP6Y7kTc8rx2921mzZhewwQ1OzsWkKC9gNti/KOLwnZephSYR4a4WmT4EDlnXtScPr+JOb7ybPP7dWyXOc/wQphQQoKDGIPWfsr54gVF9+tsHIRQOKCBX+HwjgAEJrn5rtBEcQCqE/xFKUceCA9GFNPxocvbcX6QHfT48P5iLCeezDH1RH4/6YqMFfgBhSrj2WTyGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7549J0KfSRXPaMu9AnC0J87MeyIVy6nR65Tth2igk/A=;
 b=dEApjvrWrzEbG9a97vw2zLxRlVn4ZTIedmYdX5uLYUOHGWSZmzzYx9XwmDYSX4kSIKoJbpEyqwNVKxs6W/g4vaNa1xKSnNSitCjUyaa+fMtcA9bbGeauoXHMoFrDM6x9F9kenWDpyCtZaSXLYUW1BGbInXFzllcVxG5RUAOR+TA=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BYAPR02MB4791.namprd02.prod.outlook.com (2603:10b6:a03:4f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Wed, 10 Feb
 2021 16:52:46 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf%5]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 16:52:46 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Joel Stanley <joel@jms.id.au>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
 <clg@kaod.org>
Subject: RE: eMMC support
Thread-Topic: eMMC support
Thread-Index: AdaMV1egTP30pYAoRjSnbjGpoRC6iAANeBGAAAuHn4AYk6ghgAAO2W8AAl8oqxAACPc7AAAAKIgAAYz1E6AAHi5UAAAGk/uAAAdSfyA=
Date: Wed, 10 Feb 2021 16:52:45 +0000
Message-ID: <BY5PR02MB677271F27656B673967CCFF6CA8D9@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <BY5PR02MB6772761F83EDC56737969C18CA210@BY5PR02MB6772.namprd02.prod.outlook.com>
 <CACPK8XexXLYrwMenkyou0Xkc8Tx+p1SNi7jbFBj6aObAKHcBwQ@mail.gmail.com>
 <6a30107a-abf1-635b-c96f-af3d63f93bc8@kaod.org>
 <6c1e1335-887e-0459-f1c7-f37daa008c4d@kaod.org>
 <d0ef7bbd-2b2b-422f-9420-29ca620db130@xilinx.com>
 <BY5PR02MB677227AB2EE184B02E1E90B8CAB69@BY5PR02MB6772.namprd02.prod.outlook.com>
 <e401d119-402e-0edd-c2bf-28950ba48ccb@kaod.org>
 <13ff3712-e187-9555-057f-3612654d25c9@kaod.org>
 <BY5PR02MB67726489BD76132422D6297ECA8E9@BY5PR02MB6772.namprd02.prod.outlook.com>
 <10976153-915c-8399-b6b3-6091ae41ec3c@kaod.org>
 <CACPK8Xec5o-+9La6AGaVZpfXXFOJ59x6iW9eEO=c016ga+az9A@mail.gmail.com>
In-Reply-To: <CACPK8Xec5o-+9La6AGaVZpfXXFOJ59x6iW9eEO=c016ga+az9A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c55e8afd-b65b-4aeb-0db1-08d8cde44a98
x-ms-traffictypediagnostic: BYAPR02MB4791:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB47919D0FEEBF152AC4762EF7CA8D9@BYAPR02MB4791.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TBfQ39NnxL7HChcSbKckWRcKF9wYoXrFQZ0jVFI7O85gQBQp3zSxOKw2i7J7g46EE5G5qRcgeM6gD52dd7t4huQE2baJSqwo33A1rO4WlXTm7a2DqVcS1jOn2mq7vTEsHVhu2pu/T+FFDV6SyrwjbE4CXNb3riRQDu8afvgpOSlcPYT00alibeuSEYgnovMOwuAA0M536t2MWKdbs/c+9NYki6VcBPLWvtGYRds58OFDguuA7CBwGlv/SB1gj1ct9tPMZFp7hVAx/wnFvht0qqt48FmvUh2UzHIIy3IwCss5BqiqikHUsriHbLVoFJjbEVKEL/pxe0tgxA5iPzjMlHXuEZyG0hO/HQ6nLqIR3YrIey1qu/2jzZedvGALFdDHmYTToHQsVtWC4uv6ewud+Uu2pCX6oDaXa+UXWpNJvWUFA1kvGFbIrmkZrDVgZKGh2rW/tP4nKkXvqY3/pEMeSDKA2XQ3mn5oDOHcM/kK8Wx5eDlSogtElvxbvLxqn5tJGY5VTHJJ6xllp6FQ96yfiQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(76116006)(66446008)(64756008)(53546011)(66556008)(66476007)(4326008)(8676002)(9686003)(478600001)(110136005)(6506007)(7116003)(54906003)(71200400001)(8936002)(66946007)(33656002)(7696005)(86362001)(5660300002)(186003)(2906002)(55016002)(66574015)(3480700007)(52536014)(26005)(83380400001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UUJPYkJFekZ1MldIMU5sQi9yZlYrcUJNUWZIYWphQmN4TzJBZm5PNWVrMmxN?=
 =?utf-8?B?RTBsR0Y0RC9EZE9vK1FwYVJaMER5WEc0RUVPOW5OT3Y2L2JTQkRxZjIwRDFa?=
 =?utf-8?B?aEpKY1BLTEhMMHFnc1cvV1lOK0svK1NTQ1VhRVJqUWMwbHRsa1pIS2RyYVJ6?=
 =?utf-8?B?OS9iU1ZKN2l5amE2NWtQS08wS0duMVlSTTkzcXpYYXREVUM2R2R0cUVCdjNz?=
 =?utf-8?B?ZlBFYUt6dFhSOTN5a0RZb0tUZUI4K3p3azdxWHBiWWhvNXpOK2FXelcreG5i?=
 =?utf-8?B?OWh4S24vM0JpZ1l3anl0WkVvWnVzdVpPTk5kZHRZVFdOVVZvNmEvbndEOEw5?=
 =?utf-8?B?K0JaWStRTUZOdmpIeFZ5NTZmUEh3NGJiUkF2SUMwdFVQNldwbEhiSlRVd3J5?=
 =?utf-8?B?aDUxK0hjc2VDMXNhd1M3cXg2NXZTenEweTlBRm5hME5hQkVjTGR2eDRoRE1S?=
 =?utf-8?B?b25DQ0ZjcUdYVE9sL2VoNjRiNEhrRnNYQm0xZFV5UG90K1Z3UW0rc0p0RUdh?=
 =?utf-8?B?Q2t3dUM3UFJJQ3FjYTJIT09yaUNEMVNCeUFJSVhURGtuK3VqNFI3dWkzVFNh?=
 =?utf-8?B?Nmg4VzRqcHlwREZnYkp3cHB5dllsaFg3VjJZd3A2U0pKbGNVb3dDZ25XWkU5?=
 =?utf-8?B?enBPTXFKdi9qZFJWNllZczdyUDlaNnZrMFlaWWJ0cGNIKzNkZlZoKy9kT3B0?=
 =?utf-8?B?UEtrWDVjV1NoUTIwOTIwS1RBNjJrRnp6bGtKTUU5UjcvSTJEN2cyYm9taXpI?=
 =?utf-8?B?TGxmVmV0bWhZTzI1YVNTK1ZNSmdsdWdOYVVsRkJzY0lTTk5JYVFaRnhja1NF?=
 =?utf-8?B?VW9QOWVmTkhCemxONUZUdlBLRlJUVjRFU2ZkL3Qwd2cwaW5LS1VSSkJ6YTk0?=
 =?utf-8?B?MnNwRmxXRmRpVGJ3YUMraGFWTHk3SnNmT1E4UVhacVJKUC9IM3BzaTVJZy8v?=
 =?utf-8?B?M3ZXWVdEbUdqdjZYTVYzMkR3RWFhOEMya3B1QTVJUzEvOGtYMm1SZ3VYbFc5?=
 =?utf-8?B?M3RsQXdXaUh5eHN5eHFXVHdMZmpnSzFJNjVyL0R5SUQvcURkN0owYmVrdElr?=
 =?utf-8?B?WUFFb3NnWVJZWHZLYmZoajl0ZmxSSDRqbnp0SmRsM2dMV0k1ZDRrakUrM2Zs?=
 =?utf-8?B?TU9zZGUvRkN1aFpWVklaM1hGRkMyOWw0OUdHTzIrM2NwcUFJc0hMeFZJdTJV?=
 =?utf-8?B?MHNIdmY3d09nbHJiN1drV2RwNjVMZ3dvY2NZckRib1NRazBFNlFiWElrYWJm?=
 =?utf-8?B?Y1NGOVIwSGFuQzVXOVArd0YvR1NTNkRmVjFSR29ZRHg2aldxYVhVTWlTdTlh?=
 =?utf-8?B?VFpIK01xdVk4Y3RZUDZaRnlaenpNTEhVQnJ5R1l4SmZ3aVVseFlYcS9SdERI?=
 =?utf-8?B?Um9iRElMZG9oU0EzRkFpUXhlcHEyZ0F3bXJwT2JEY1dodmFBK2RqcVNnaXY4?=
 =?utf-8?B?dkdtaVNpL0JKOENtZzc3amtQUWdQR0tLcmprSjBKZURDY2l0cXNZZG92U1dw?=
 =?utf-8?B?eEY3YVN4S1dzSE9NTWd6K3ZwNHNjaDdCY1Y4VDZpRCtWam5iOVZ1MGoyUitn?=
 =?utf-8?B?RDdiVmxRRjJpeWo3cnlrbGJyL0Q4dEluV3BnTlZsc2hwaWtyejB3UG9CdlhR?=
 =?utf-8?B?dk9XbTdqYk8zaXc5UEh3ZUNCdXlYR2JsWDRvZ05oQmkyNzFhd1pmSUhWdW5O?=
 =?utf-8?B?MVVnd2Jvb2VheVdvRVk2RDFla21xKzArc3Q3NWk4Q3M0aGVUbkhyaW5zNGw2?=
 =?utf-8?Q?bm7AYonCRlhFzR0L+T0BtNWPWDhTVbf3wEeCkUZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c55e8afd-b65b-4aeb-0db1-08d8cde44a98
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2021 16:52:45.8331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nSR31SBLlkMOFR7PYjyLXFkPr6qWYalJN31E0YZQ5aEX1TRYWL79lWbqquVs8CxtWM1QjWf0G6QuDknkpJCqqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4791
Received-SPF: pass client-ip=40.107.93.66; envelope-from=saipava@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Edgar Iglesias <edgari@xilinx.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgSm9lbA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvZWwgU3Rh
bmxleSA8am9lbEBqbXMuaWQuYXU+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMTAsIDIw
MjEgNjozNSBQTQ0KPiBUbzogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4NCj4gQ2M6
IFNhaSBQYXZhbiBCb2RkdSA8c2FpcGF2YUB4aWxpbnguY29tPjsgRWRnYXIgSWdsZXNpYXMgPGVk
Z2FyaUB4aWxpbnguY29tPjsNCj4gQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZzsgUGhpbGlwcGUNCj4gTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFt
c2F0Lm9yZz4NCj4gU3ViamVjdDogUmU6IGVNTUMgc3VwcG9ydA0KPiANCj4gT24gV2VkLCAxMCBG
ZWIgMjAyMSBhdCAwOTo1NiwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gd3JvdGU6
DQo+ID4NCj4gPiBIZWxsbyBTYWkgUGF2YW4sDQo+ID4NCj4gPiBbIC4uLiBdDQo+ID4NCj4gPiA+
Pj4gVGhlIHBhdGNoc2V0IGlzIGluIHRoZSBhc3BlZWQtNi4wIGJyYW5jaCA6DQo+ID4gPj4+DQo+
ID4gPj4+ICAgICBkZjkxZDAxMjY3MmMgQ8OpZHJpYyBMZSBHb2F0ZXIgLSBody9hcm0vYXNwZWVk
OiBMb2FkIGVNTUMgZmlyc3QNCj4gYm9vdA0KPiA+ID4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBhcmVhIGFzIGEgYm9vdCByb20NCj4gPiA+Pj4gICAgIDI3Yjc1YTdhZDMy
MiBDw6lkcmljIExlIEdvYXRlciAtIGh3L2FybS9hc3BlZWQ6IEFkZCBlTU1DDQo+IHByb3BlcnR5
DQo+ID4gPj4+ICAgICAyODM2Y2Y1YTE1YTEgSm9lbCBTdGFubGV5IC0gaHcvYXJtL2FzcGVlZDog
U2V0IGJvb3QgZGV2aWNlIHRvDQo+ID4gPj4+IGVtbWMNCj4gPiA+DQo+ID4gPiBbU2FpIFBhdmFu
IEJvZGR1XSBJIHNlZSB5b3UgZ3V5cyBoYXZlIGltcGxlbWVudGVkIHRoZSBib290IGFyZWENCj4g
PiA+IGFjY2VzcyBoZXJlLA0KPiA+DQo+ID4gVGhlIGJvb3QgcGFydGl0aW9uIG1vZGVsaW5nIGZp
dHMgb3VyIG5lZWRzIHRvIGJvb3QgdGhlIEFzcGVlZCBtYWNoaW5lDQo+ID4gYnV0IHRoaXMgaXMg
dmVyeSBjdXN0b20uDQo+ID4NCj4gPiA+IEkgd2FzIGFzc3VtaW5nLCB5b3VyIHVzZS1jYXNlIGp1
c3QgbmVlZCB0byBhY2Nlc3MgZGF0YSBmcm9tIGJvb3QgcGFydGl0aW9ucy4NCj4gPiA+IFdlIGFy
ZSBub3QgaW1wbGVtZW50aW5nIGVNTUMgYm9vdCBvcGVyYXRpb25zIG9yIEFsdGVybmF0aXZlIGJv
b3Rtb2RlDQo+IHJpZ2h0ID8NCj4gPg0KPiA+IEpvZWwgY291bGQgc2F5IG1vcmUgYWJvdXQgaXQg
Pw0KPiANCj4gVGhlIHNvbHV0aW9uIEkgY2FtZSB1cCB3aXRoIGhhcyByb29tIGZvciBpbXByb3Zl
bWVudC4gVGhlcmUncyBubyB3YXkgdG8gdGVsbA0KPiB0aGUgcWVtdSBzZCBkZXZpY2Ugd2hhdCBi
b290IHBhcnRpdGlvbnMgaXQgc2hvdWxkIGV4cGVjdCB0byBmaW5kLCBhbmQgbGlrZXdpc2UNCj4g
dGhlcmUncyBubyB3YXkgZm9yIHRoZSBlbXVsYXRlZCBtYWNoaW5lIHRvIGNoZWNrIHRoYXQgdGhl
IGltYWdlIGlzIGZvcm1hdHRlZA0KPiBpbiB0aGUgd2F5IGl0IGV4cGVjdHMuDQpbU2FpIFBhdmFu
IEJvZGR1XSBJIGd1ZXNzIGJpdHMgb2YgUEFSVElUSU9OX0NPTkZJR1tQQVJUSVRJT05fQUNDRVNT
XSwgd291bGQgdGVsbCBTRCB3aGljaCBib290IHBhcnRpdGlvbiBuZWVkcyB0byBiZSBlbmFibGVk
Lg0KPiANCj4gSWYgdGhlcmUgd2FzIGEgd2F5IHRvIGFkZCBtZXRhZGF0YSB0byB0aGUgaW1hZ2Ug
KHRocm91Z2ggcWNvdzI/KSB0aGVuIHdlDQo+IGNvdWxkIHVzZSB0aGlzIHRvIGRlZmluZSB0aGUg
Ym9vdCBwYXJ0aXRpb24gc2l6ZXMgaW4gdGhlIGltYWdlLCBhbmQgaGF2ZSB0aGUNCj4gbW9kZWwg
dXNlIHRoZXNlIG51bWJlcnMgdG8gcG9wdWxhdGUgQ1NEX0VYVC4gSXQncyBvbmx5IGFuIGlkZWEs
IGFuZCBJIGRvbid0DQo+IGtub3cgaWYgcWNvdzIgc3VwcG9ydHMgdGhpcyBraW5kIG9mIG1ldGFk
YXRhLg0KW1NhaSBQYXZhbiBCb2RkdV0geWVhaCBuaWNlLiBJIGRvbuKAmXQga25vdyBpZiBxZW11
LWltZyBoYXMgYW55IG9wdGlvbiBhcyBzdWNoLg0KQW55d2F5IG9ubHkgZmV3IGZpZWxkcyBpbiBD
U0RfRVhUIGFyZSB1c2VmdWwgZm9yIHVzLCB3aGljaCBzaG91bGQgYmUgb2sgdG8gaW1wbGVtZW50
IGFzIHByb3BlcnRpZXMuDQoNClJlZ2FyZHMsDQpTYWkgUGF2YW4NCj4gDQo+IENoZWVycywNCj4g
DQo+IEpvZWwNCg==

