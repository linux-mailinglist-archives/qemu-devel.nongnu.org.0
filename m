Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD1B316714
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 13:48:13 +0100 (CET)
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9oui-0002yF-Li
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 07:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1l9otK-00023O-IH
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 07:46:48 -0500
Received: from mail-dm6nam10on2076.outbound.protection.outlook.com
 ([40.107.93.76]:58976 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1l9otA-00019A-T3
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 07:46:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHQTIAMD1VY804FYUgvMaBtx98nd5XvegwXJVNNcEmX0kYJrpDGJEYsVwiEfam6bTHBfuh4FhPLvmP88FWS2Ipwija/VDgUz6ZQ8R2hIUVBNkA3XeHCYuP9Fj63u06jwfW/2eZn3v17kErnEdGianZDBh5BSk58Jyaibgw+c6ox/Uz7gsFoKrZWPE0tsna5bJRS7I8O9YrbO5ZlO/o8ZxE3vOL2X5q/10KKtLdGCffGEyICjfFyP1b9r6OgD3mJ862DwvGyijZkQ3jLXkyLj5b61nI7WSICtaBbW/nqRbe81dKACcaJFmBFSGua45uX+Uh41Id9PBy/ne4evGvdVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoINKEz3cTcJLz6itHJkscPHOgmhf2aZ97HFD1Oh2dw=;
 b=aDAe3ENbBm/WEAkN8PUdXWuCqG+xEeMF8l9lL1cAYuMwN8JHrCtzwu5JSklZ+yK5ml4LcP/V5SaikHrf2k5k0GkjwA5YiPmf7G3YNMqXw2ExjnjtB0NjbvwqjRYyDXl0NZET7vHLaXpTpsUtCa2ynCxJNYK/0igFgQxcXTbWFZsyJKv2JBr1hl+8D69SAmizpYtlI9XpGf1rsO2WxvGh42CZFX3jDudybDARI4n8WLqBeG75b/ywrjxrr6RhfE8FVJY4E+xvJjzSSfGUjsHxnTtLjAMmyNg+EJPY2YH+jactoy/G+nqHU4OoKz1KQkmYeqsCxqQo0SdwA7WeiTsvxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoINKEz3cTcJLz6itHJkscPHOgmhf2aZ97HFD1Oh2dw=;
 b=CyyYC5zGUHLu6K0aVL4qEf/z14v8R+bnV4bA2wS7YAl0t8DDLjUjmVJsmkyxTpULeOh1A7CDnTu9Ho9WdfhL1CNzT9TID8foY/U8p5n/xlj2YqtDjNVh3ALnf6yHaWYdZTLWh+UPp2qg6k0CjOBpdssxaIwJdcMfMsI7bovPnN8=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BYAPR02MB5655.namprd02.prod.outlook.com (2603:10b6:a03:a0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Wed, 10 Feb
 2021 12:46:29 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf%5]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 12:46:29 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Edgar Iglesias
 <edgari@xilinx.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>
Subject: RE: eMMC support
Thread-Topic: eMMC support
Thread-Index: AdaMV1egTP30pYAoRjSnbjGpoRC6iAANeBGAAAuHn4AYk6ghgAAO2W8AAl8oqxAACPc7AAAAKIgAAYz1E6AAHi5UAAAEoMCg
Date: Wed, 10 Feb 2021 12:46:29 +0000
Message-ID: <BY5PR02MB6772A922C31C6DE6FCFC8A7FCA8D9@BY5PR02MB6772.namprd02.prod.outlook.com>
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
In-Reply-To: <10976153-915c-8399-b6b3-6091ae41ec3c@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fb344daa-6e4b-47a0-4af8-08d8cdc1e300
x-ms-traffictypediagnostic: BYAPR02MB5655:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5655DF997192680218C65D68CA8D9@BYAPR02MB5655.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LeSLya0/q5o7a7rk3fplBhxIMBNyCTT440RxFjspnSXXy+VcmA9nCoRC5vCkdjOwqdbO1zcx12bezRnuzJVtUqcGgoWVvZXVkVUouJtA+46iEBzEJ+2AiQULj3qgjrH8la32CA6/OhrMLJxxilTsJjtEAXU4Patq2Jo7bRGT4NP2PgkjhUlzgs4xRK/M85V3yauv+0rwgnIe4RpAVyf2piOh3ZrmZF7TV7LvEG29W0KconwfujD8NdxCTz/6OvGnj0WyR+T5HDsrBjBiTr8gL0x8eMqazerbSJ9ps7nliZOcMhxtQ4tK0RQezIwYw7X4IOZ7VSAq39QsreDL+lH+8zyV6NHsRxPbctyUOWElYaKHvDq2hCLcem6Q1LEh33wWMTR+q60XE83fkbp8flW84Rt/xDS6ylF0QvnTasDhCD30a1dI+hZ0HAG1lczvqNR9npeQvyqN78vGkXGmpCSjdUmrscYRDk75rj7kvPQtHL4qFtGdAfSXNqha082ttvROIKgFKfkXwUeJPPyuatmwlQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39850400004)(366004)(86362001)(8676002)(26005)(3480700007)(6506007)(53546011)(76116006)(66446008)(7116003)(186003)(66556008)(64756008)(66574015)(66476007)(71200400001)(83380400001)(66946007)(8936002)(7696005)(54906003)(316002)(52536014)(55016002)(9686003)(33656002)(478600001)(2906002)(4326008)(5660300002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?T2VyN0pIc2hEVUg3MmNVSFJHVldiK0c0TEVvRVpEcFluRjJHa3VDeGUvZzd6?=
 =?utf-8?B?ckRla1FwYTZNQUJyRGNmRHJwbnpIdjNhcUdIREc3Z0dpdGlMVFdNeno4Sk9S?=
 =?utf-8?B?S2pNTHNqSFhVS0VkbmRaWmd0ak5xdDR5NjBxb0ZNSkxoTkVlMWU2RnFzWmhU?=
 =?utf-8?B?QjRuQnJKMlo1a0xoUjFvcGwxZlo2T3JNVTlBMWIwNzlUUnJweFVCd3A1UjA2?=
 =?utf-8?B?ei9NQUhhYVJpejNRZzJEellYR0JGS1BSNTBldUZicEd1L0s4VVBGdHNzUC81?=
 =?utf-8?B?MEdJMjFuanh0ZXhBSUJyN1k0NmVZZHBBZUQ3Vmc3aXN6amduV01EYVBXNHVI?=
 =?utf-8?B?dkFTRGlXcnFzUmRBWG9BT3RpSTA1V0tDTFN4UUx5U28vWG5sWTNLRFJSb2dT?=
 =?utf-8?B?Zyt3NlJvZkxzMDg5MHphMXRsdGh2Q0IveDhUZU5MbUZIQ0VxUk9TaTNvRktw?=
 =?utf-8?B?Szh0TkZ3TnREY21haTRTaWNwSGxkRXRGZFY5QUoxTmNhQkhOSTZyYmwzbWRT?=
 =?utf-8?B?UWp5SHFPb0JiOEd5a21Ba1hoa1NDenZHODNudThyQmFaNHJVTFEvWkxoSWJQ?=
 =?utf-8?B?dExXMnlIWjdHMkdhN1Z5emJ2VnNJZEZEYWRpQ3F5SFNkOFNUTDdBQmY1R1ZJ?=
 =?utf-8?B?T2JMQ3UwdTkrZklkQ0IxR3ExNVZwZjY1UDI2M0dnRTdpUzZqWDNSOUIwL25y?=
 =?utf-8?B?MUlnbVUwSTNhVnluWmg2V2M3VjdVd1A1dHZZdkZzU2l4V0p3MnhMS0YyTHFR?=
 =?utf-8?B?SGVIYi94YjZNUHU1UmdVNDNrNHpxcTZzQWFmMGRVbWsyNVFjODhHajY2SHQ0?=
 =?utf-8?B?aXJPdFEyOUkxMFRFOWZjYWVndVlWZkJWSmtteGJ6Uzl4T09vUWNwSDVNSVMx?=
 =?utf-8?B?QWVCUG9WMkZ2Q1BJTU1nYmhPRkZUNTh4MkxLMWFGRXRpZUJ3VFFxNXhPWE1t?=
 =?utf-8?B?VFdYMTY4cUhOQy96RDd1OFpQeTZKQ1RqU2E5bVN5c1BIcGs4YmhhOWxYdWlo?=
 =?utf-8?B?YnZNakRGM0ZtWlM2eUJlMmR0YzQ2cGJKR25lQkdzTFBobC9JU1NDOFZrZE1j?=
 =?utf-8?B?ZEtqc1Q5QUl4bUwvRzhaUExaREI0S0drZmplTEhLc2hyWmxuN3ZNYUF1YkJP?=
 =?utf-8?B?K2VZTWViNjdaczdQMXFHQS9wV0tySlhRbkR6NkdYRzRTalh3T2ZiTTRkRlBm?=
 =?utf-8?B?TmtnbDRadzJVM2VnNGVZUzdzMUZ3TmNVVmhJODFobW5CN3hDa3NhVGplMnEy?=
 =?utf-8?B?d0srbC9lRXRPbHZudERLYXFjSVFmdC9BalV6V0NlZEFlazNXVGlCOEJ3eVlR?=
 =?utf-8?B?VURSMy9mSjVxMUdLb2pFREZYS043ZExib2NpaDBQV1hmbFVjMVhybU01RURF?=
 =?utf-8?B?b3EzTWc0a0JwUEVGTm9ZQUhVWjllSUp2eFlBVlIxclE0bkoyTjNzNkxCTGRO?=
 =?utf-8?B?MjVZT0E4VFVVemdCOUNQRGxvMzhtcGFESlpvWEdNMW1OZmkrYjFyYUM5ajZX?=
 =?utf-8?B?dFMvZWh2Uys2enl3R25vZVE3d3ZZRXhmVW41VlAzbVdVU1BQdGIxakR5TUdz?=
 =?utf-8?B?TVlaSkxzT3IwY01yb3FFRGpjUzVuTTN1L21PczU0d2VBTDYrcW9TZDV1Wlkr?=
 =?utf-8?B?N0wxY3A4d2krcUFFdDVPN29CcnQvOGpoenZnNjJyYjNHeHJFdHNZZSt5YlQ1?=
 =?utf-8?B?emh1ZXNMWk9WMUNwTndlZWt5SFdEb0hUQ3V3M0tkbFFDOVBIL2hUNlFwaHRl?=
 =?utf-8?Q?9faUBjjhwj+TglinVsPDRwldHJ4lur6uc4XtCg8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb344daa-6e4b-47a0-4af8-08d8cdc1e300
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2021 12:46:29.1464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: STBO/Ax6RuuSQfOXFFQqjMxR51mT1cQiLgFkU7mx8hthfrt4IlW0ZTqggumpvDd8pzt/2Qg9ceAi1GPxJf9aFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5655
Received-SPF: pass client-ip=40.107.93.76; envelope-from=saipava@xilinx.com;
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgQ2VkcmljDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ8OpZHJp
YyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAx
MCwgMjAyMSAzOjI3IFBNDQo+IFRvOiBTYWkgUGF2YW4gQm9kZHUgPHNhaXBhdmFAeGlsaW54LmNv
bT47IEVkZ2FyIElnbGVzaWFzIDxlZGdhcmlAeGlsaW54LmNvbT47DQo+IEpvZWwgU3RhbmxleSA8
am9lbEBqbXMuaWQuYXU+OyBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1Pg0KPiBDYzog
cWVtdS1kZXZlbEBub25nbnUub3JnOyBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1z
YXQub3JnPg0KPiBTdWJqZWN0OiBSZTogZU1NQyBzdXBwb3J0DQo+IA0KPiBIZWxsbyBTYWkgUGF2
YW4sDQo+IA0KPiBbIC4uLiBdDQo+IA0KPiA+Pj4gVGhlIHBhdGNoc2V0IGlzIGluIHRoZSBhc3Bl
ZWQtNi4wIGJyYW5jaCA6DQo+ID4+Pg0KPiA+Pj4gICAgIGRmOTFkMDEyNjcyYyBDw6lkcmljIExl
IEdvYXRlciAtIGh3L2FybS9hc3BlZWQ6IExvYWQgZU1NQyBmaXJzdCBib290DQo+ID4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhcmVhIGFzIGEgYm9vdCByb20NCj4gPj4+
ICAgICAyN2I3NWE3YWQzMjIgQ8OpZHJpYyBMZSBHb2F0ZXIgLSBody9hcm0vYXNwZWVkOiBBZGQg
ZU1NQyBwcm9wZXJ0eQ0KPiA+Pj4gICAgIDI4MzZjZjVhMTVhMSBKb2VsIFN0YW5sZXkgLSBody9h
cm0vYXNwZWVkOiBTZXQgYm9vdCBkZXZpY2UgdG8NCj4gPj4+IGVtbWMNCj4gPg0KPiA+IFtTYWkg
UGF2YW4gQm9kZHVdIEkgc2VlIHlvdSBndXlzIGhhdmUgaW1wbGVtZW50ZWQgdGhlIGJvb3QgYXJl
YSBhY2Nlc3MNCj4gPiBoZXJlLA0KPiANCj4gVGhlIGJvb3QgcGFydGl0aW9uIG1vZGVsaW5nIGZp
dHMgb3VyIG5lZWRzIHRvIGJvb3QgdGhlIEFzcGVlZCBtYWNoaW5lIGJ1dA0KPiB0aGlzIGlzIHZl
cnkgY3VzdG9tLg0KPiANCj4gPiBJIHdhcyBhc3N1bWluZywgeW91ciB1c2UtY2FzZSBqdXN0IG5l
ZWQgdG8gYWNjZXNzIGRhdGEgZnJvbSBib290IHBhcnRpdGlvbnMuDQo+ID4gV2UgYXJlIG5vdCBp
bXBsZW1lbnRpbmcgZU1NQyBib290IG9wZXJhdGlvbnMgb3IgQWx0ZXJuYXRpdmUgYm9vdG1vZGUN
Cj4gcmlnaHQgPw0KPg0KPiBKb2VsIGNvdWxkIHNheSBtb3JlIGFib3V0IGl0ID8NCltTYWkgUGF2
YW4gQm9kZHVdIEFueXdheSBCT09UX1BBUlRJVElPTl9FTkFCTEUgYml0cyBhcmUgcGVyc2lzdGVu
dCBvdmVyIHBvd2VyIGN5Y2xlcywgd2hpY2ggbmVlZHMgYmUgaW1wbGVtZW50ZWQgYXMgcHJvcGVy
dGllcy4NCj4gDQo+ID4gQW5kIGFsc28gaXMgaXQgZ29vZCB0byBjYWxjdWxhdGUgdGhlIGFkZHJl
c3Mgb2Zmc2V0IG9uY2Ugd2hlbg0KPiA+IHBhcnRpdGlvbiBhY2Nlc3MgYml0cyBhcmUgc2V0LCBy
YXRoZXIgdGhhbiBkb2luZyBpdCBmb3IgZXZlcnkgcmVhZC93cml0ZSA/DQo+IA0KPiBZZXMgYW5k
IG5vLiBJdCB3b3VsZCBhZGQgc3RhdGUgdG8gdGhlIHNkIG9iamVjdC4NCltTYWkgUGF2YW4gQm9k
ZHVdIFllYWguIFdlIGFscmVhZHkgaGF2ZSBhIG1lbWJlciBpbiB0aGUgc3RhdGUgInNkLT5kYXRh
X3N0YXJ0Iiwgd2hpY2ggY2FuIGJlIHVwZGF0ZWQgYmFzZWQgb24gdmFsdWUgaW4gUEFSVElUSU9O
X0FDQ0VTUy4gSSBmZWVsIHRoZXJlIGlzIG5vIGhhcm0gaW4gdXBkYXRpbmcgZGF0YV9zdGFydCwg
Y29ycmVjdCBtZSBpZiBJJ20gd3JvbmcuDQoNClJlZ2FyZHMsDQpTYWkgUGF2YW4NCj4gDQo+IFRo
YW5rcywNCj4gDQo+IEMuDQo=

