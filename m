Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5213AA63E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:39:20 +0200 (CEST)
Received: from localhost ([::1]:34182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltdFn-0006fl-FO
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ltdDn-0005r9-V8
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 17:37:16 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:8147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ltdDk-0002GM-5T
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 17:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1623879431; x=1624484231;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7Gs/J97AEMnjRjaFWhqHK3ppeukrBanpqa8d5tOoo0E=;
 b=zaoBRIdL28EsI91TUOGqg5ZyTqN+6RpfmGZKuVHjnlH3nasp1ACYzdqx
 +I7CzkiSyJvEFVzy+j/ERAX1LMAHcTFAbtNDNfblpwtFUR0wdqxNDuAyi
 HOSMuTqF8oYxNTuUAyRaZ5GdqZARox8FAL+wMdhAy3z88PT9hEK26JWih w=;
IronPort-SDR: BTqS7enFkjhRbTYTbHQBs2N/DtDimOkTIhdhizrBh+9G8nnbLSVxZVUBcLSCAI2FuqrfN9cuxF
 Dn5orUruoWSXyk6QdlfhGih/Z6jbDOH/lkv8QNcpdyh1QKGZDhfNwKLtaGww/MH06j8bKA3qZR
 48JAG6bn0TyUg9J5n/IU4p0j3buFskk60KczI4FtubYODrw2jJSzwlliXkWgtdMXKK+hJjyNz7
 1KkhON17J6sAvOtwmRQyz7cjfgkR2TRWxkBf2tyIhGPUTZG7Nkb1qtxZdheKP4daXKdoAgOGoY
 tlE=
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 21:37:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqTOJxOY0MZnxbOOtLgTehjDc6jw5Okc4h6ALvqnfhRvWEnPbJHrDOEkMmX1y715bp8sqNyvRWz3lPuWSMmEZGppLvxMAu4K6/yGs8f+Vawt1p2r73Sov7V3zLFraI2aQKpjCZGQJyF2P3kZZG8nY/3EJ/PD3DypcimwZYBrwpVqj5h0R2IzajNZ7XxW8jSUi421TlRpWrlWqlVAQBTNOx7LOogwZCVmjY3hpVtbgu0X7bDcXKEOFecCsSD23S7iGTFvgLI+w0hryD4E+F3p8lJO+fTmNhyaZKuD9IDGFUrHcaueRE9xNjRU2B1fq1ZcTRhaXMTrDIMId0eI7qzksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Gs/J97AEMnjRjaFWhqHK3ppeukrBanpqa8d5tOoo0E=;
 b=KA+xK6wpVxY9ec4ZOqexf3xTljj8iu8teY8+MgtLolsTkwy/YjAlM7qFtPYCSlK+1M7/uer0UaMENdtosHizgf+oFjLdfrMy8XhwIe7wn+YcUEHZ/4ELeONL8innrnuv6u0T0j110LGg+PJ/JgePq4pJUwmois4onwhCsZwjh+g/p3jptkSvuGzbxrwJpXT+xKhQWTEZo7XePPazRJ+JXPoJb9Zu4HtNEwkTXBIylveq/YP3ZuXYG3Z8mXRo0MjpAf/ybQCFGwJMn5QyafiOPJdYmBvr1zonV517y08PbNwqJmm7nPL1inBK0Kwa3AAVFvgVwMpML9iDTxB6pxnY1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7263.namprd02.prod.outlook.com (2603:10b6:a03:2a0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 16 Jun
 2021 21:37:07 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4219.026; Wed, 16 Jun 2021
 21:37:07 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 07/21] linux-user/hexagon: Implement setup_sigtramp
Thread-Topic: [PATCH 07/21] linux-user/hexagon: Implement setup_sigtramp
Thread-Index: AQHXYkyzNdayBzbnRUaRV3HjqzQbNKsWRWOQgAB4BgCAAAyoAIAAYE5Q
Date: Wed, 16 Jun 2021 21:37:07 +0000
Message-ID: <BYAPR02MB48867798284EBC45752A8FD7DE0F9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-8-richard.henderson@linaro.org>
 <BYAPR02MB488698AB4CECA0A05F1B3AB7DE0F9@BYAPR02MB4886.namprd02.prod.outlook.com>
 <43f61832-1d76-31dc-4ba4-e35007b16fe7@linaro.org>
 <94c4e258-e1c3-9d58-f53e-72c4249ea93a@linaro.org>
In-Reply-To: <94c4e258-e1c3-9d58-f53e-72c4249ea93a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8074deba-fc07-4df8-f3b1-08d9310ee448
x-ms-traffictypediagnostic: SJ0PR02MB7263:
x-microsoft-antispam-prvs: <SJ0PR02MB726355C65FDB2CC0F2F53F9ADE0F9@SJ0PR02MB7263.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cbwehNF2HD1QIxc3db4AJxw3rH5Jh2vU0t7UxLdP069wZB0EbmQVcDDrh1FRcn61IGU4W5tpbd9vSKOOj2m9LGa/cRoRNbA37S73adYs+9f+/Vhswl+XpOutU63QU3lTjrbd388XYFOwcjJfuwbYQfylPfq1jq6V19E2ul4OiCrOxeg0OhqsvdFyDABpbxCc9g/AfEeC4gw4RaxxB8e4voygecnISQggaYo1rIXLq2xBMsTGDP3X38sYNxHWDC3OmAvVBAiFtbh/yv/ivI4XAy6cQQVMjaXuT03ZyQXrK4xImBk1nqcCf7MLanB4Ov/38Bk+Wyu5brMVQwsYfwptVAbBh+1r5IgBejt0uwP1ytjdhsTXQ0McCTpRz1qD73ipHqNPA0xdOzeNEiTVbaFvSMIYiw+oXchhI/ikh+/UgIgCfH1Rcx1sXEhj8WMvL/l42zh4lOJvsKm9aYRM6Iz8BrPKzmYBXSToiXhsDL9pgfKUpxmukpILjAtcK9/1NInXdu0YX2KuhJOkT0b+ZKJdzv4p47EJAR3VD799xOYIUzf5xiEg9jd4uFT2RAx4ENRwXu13OE0jbRJz/wzzpGTpjWBi7LAUmWB3atkkiIfG57c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(4744005)(5660300002)(86362001)(6506007)(9686003)(53546011)(186003)(26005)(8676002)(7696005)(38100700002)(83380400001)(71200400001)(52536014)(8936002)(4326008)(122000001)(110136005)(55016002)(54906003)(33656002)(76116006)(316002)(66556008)(478600001)(2906002)(66946007)(64756008)(66446008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFZzMnBWNVVub1MxRTNYL0dYa21nRWhRblRFK3MvSDRXVm1xTWVqaHMrLzIy?=
 =?utf-8?B?UmtOZFdaUXZCQXhnN2lDcXo5RDJEeGcxd2loa1BJVVBndUQxWmp0WTBqbWpQ?=
 =?utf-8?B?SkxMaHdXTWk1SS9PWDhqOVNJcnREeE9hcDgxTEZsQ2FUL0xIcloyRDgxSC82?=
 =?utf-8?B?UnNzZS9DRlNERVp1UXc3SzFNYjEyem04L0ttamtjSUFQNnVIU3crNWVzMFVD?=
 =?utf-8?B?QmpGREc2QUhzcFVhTnhpeTN3d0Rma2dlSUZtWDVYNTBjbDcvYk4xOFFKUHZv?=
 =?utf-8?B?VlkwWVRBNnZWVWUxV0R2VVh0azZrSllIWTcrUmdyZUtOU0VIeVF5Q09XTGt1?=
 =?utf-8?B?NVpQNGdkQzRnNnBORUJVZkpFUkV2OGxkMWFyOXNHZW40M0kzRXhoVnlMVEsv?=
 =?utf-8?B?K1F2MzQxR3dwRW1UMFltdjVaRElHK09mOGdyU2Y0by9td1ptVXdHc0hobmds?=
 =?utf-8?B?RWh3cTh1U09NMElxVStQTklZZjZjQS95Um1iWEFITi9hRzFCRDZPSkRCOUg3?=
 =?utf-8?B?NThpZTkwZG0rWnZSWWZnNnYrUDV2RjMzclpNdEhXeGcvUnNacUR0b1ZoWm5y?=
 =?utf-8?B?M1Q0L2NXMzdpcHR0aDBvcHFnL212U3p2eE4vdHhGNWFCTllnZ001TEx4SEFX?=
 =?utf-8?B?MGxUM0JOSFIzV0Iyc2hCWUhUZGluNDdsWVpndEUwSWQ4SG12djNBY0g4WVlN?=
 =?utf-8?B?VG1ZY2d4clNlOXZtRG5Qc2J2MThDbnFvSXVub0pqRk1GV0VITWVOdFlkdTB3?=
 =?utf-8?B?VEh3RmFzTDJrRDBISmhpRkNidXdDMzZaU254NlhxUks1cGZIa2VRSVFvaGRh?=
 =?utf-8?B?VEN0L08xR3JDQ1NmV1B0bVZ5TDBvbEdVL05TZTROaTNaaDNiZzVESG1YR2J5?=
 =?utf-8?B?Zm1FWVR0aFZCb0ZTWDJ6NkYrVFNpdkcrVnlZZXNmaHdrdVB2UUlGemZjN29x?=
 =?utf-8?B?YmpPYzhjbVZaNGxoRkVtYjhlUDJrSkZ5UzZQMUZEMGxFZE9pc0ZmN0Z0OGpw?=
 =?utf-8?B?ZmRPdEdvUVRnRUdIazJsSWpVb3lCd25ZU2J3cmNEcGl4a2J2clhaT1dENDVk?=
 =?utf-8?B?YkpRa281Q2w1S01pWVc5WWIvT2dkNHBwMzR4Skx1cmFVVFlxSVVlaG9aelpK?=
 =?utf-8?B?QjlNeUhuVmxQYXhUTU90NGJJN25mdXlqSnl3eGN0andMNXJ4dXRkbFVJNVpY?=
 =?utf-8?B?UVVoOGgxOEpwZExjOExCeXdHaVBtbU1LSVk4dXdyZm5FNGtBT3FkWmZ5dW5Q?=
 =?utf-8?B?cFhnV0tGTkJVVWFwcFBTWk1NMGd4V3RyMEEzb2w2SDRDZGFSZ1B1SThsaXNB?=
 =?utf-8?B?SDExV2Y2ZzZVeHhoQmRGQjhkNnMrUjRZcHJNeHRDcEh1eit3NysrQTBOVkRz?=
 =?utf-8?B?K2NxS3l4VU1RL3hKb1hoS0xaWVN4RmJQeEJjVEgyMm95clVzRldvWGR4MFFt?=
 =?utf-8?B?eUljaFpCQnhOalJHd25CTDMxcHB0bW5XVWs1citRZ1BVT0NSWVR5RjJ2TFNV?=
 =?utf-8?B?UXJRT0duOTNGRGtFRG1kTWgxd3JiODBrYm5WbmlpdlllWU5wVk5Pa294Ulhn?=
 =?utf-8?B?Ym03bTd6dnRSMmkrdnZtc3YrdXUvblpnS1VhUkhNVktkeGNWUzRTaDAzbFdO?=
 =?utf-8?B?UnBzcVk2b09PY2lvNWxuVlhWZXMxaEI0QUFQRm1OeUtNZlBib3pmRGJueG0x?=
 =?utf-8?B?a3h6UFRYNXYvZXNDcFl6bXhZcjF2TXBRVE8wZ3IxSFl1VWxVM2gwaitMTnJ2?=
 =?utf-8?Q?SajX71XFdto94LsJmfySK1waJIAgRuFBoXZjR14?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8074deba-fc07-4df8-f3b1-08d9310ee448
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2021 21:37:07.7715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wplMgR7TZs9DWlFHCpsE9BHxeLjwcTmLub7BtjUCzky9unvJfzMqFYC4++SCC46+TqeEjlE2I3em7ZQPLNIemg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7263
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVu
ZSAxNiwgMjAyMSA5OjUxIEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2lu
Yy5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGxhdXJlbnRAdml2aWVyLmV1OyBh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDcvMjFdIGxpbnV4
LXVzZXIvaGV4YWdvbjogSW1wbGVtZW50IHNldHVwX3NpZ3RyYW1wDQo+IA0KPiBPbiA2LzE2LzIx
IDg6MDUgQU0sIFJpY2hhcmQgSGVuZGVyc29uIHdyb3RlOg0KPiA+IE9uIDYvMTYvMjEgMTowNyBB
TSwgVGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4+PiArwqDCoMKgIC8qDQo+ID4+PiArwqDCoMKg
wqAgKiBUaGUgb24tc3RhY2sgc2lnbmFsIHRyYW1wb2xpbmUgaXMgbm8gbG9uZ2VyIGV4ZWN1dGVk
Ow0KPiA+Pj4gK8KgwqDCoMKgICogaG93ZXZlciwgdGhlIGxpYmdjYyBzaWduYWwgZnJhbWUgdW53
aW5kaW5nIGNvZGUgY2hlY2tzDQo+ID4+PiArwqDCoMKgwqAgKiBmb3IgdGhlIHByZXNlbmNlIG9m
IHRoZXNlIHR3byBudW1lcmljIG1hZ2ljIHZhbHVlcy4NCj4gPj4+ICvCoMKgwqDCoCAqLw0KPiA+
Pg0KPiA+PiBIZXhhZ29uIHVzZXMgbXVzbCwgbm90IGxpYmdjYy7CoCBTbywgSSdtIG5vdCBzdXJl
IGlmIHRoaXMgaXMgbmVlZGVkLg0KPiA+PiBUaGUgc2lnbmFscy5jIHRlc3QgcGFzc2VzIGZvciBt
ZSB3aXRob3V0IHRoaXMgY2hhbmdlLsKgIEFyZSB5b3Ugc2VlaW5nIGl0DQo+IGZhaWw/DQo+ID4N
Cj4gPiBJIGNvcGllZCB0aGUgY29tbWVudCBmcm9tIHRoZSBrZXJuZWwgc291cmNlLg0KPiANCj4g
QWxzbywgSSB0aGluayB5b3UncmUgY29uZnVzaW5nIGxpYmMgYW5kIGxpYmdjYy4NCg0KWWVzLCBJ
J20gY29uZnVzZWQuICBXaHkgaXMgc2lnbmFsIGZyYW1lIHVud2luZGluZyBpbiBsaWJnY2M/DQoN
CkFsc28gRldJVywgd2UgdXNlIExMVk0ncyBjb21waWxlci1ydCBpbnN0ZWFkIG9mIGxpYmdjYy4N
Cg==

