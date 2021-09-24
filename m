Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C80417B51
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 20:52:13 +0200 (CEST)
Received: from localhost ([::1]:39666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqIu-0005kn-AZ
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 14:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mTqGh-0003z2-7w
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:49:55 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:65245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mTqGd-000723-6S
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1632509391; x=1633114191;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xp0IVRI6Zi9eT5fICEE4L//U/Myoez28OlCMI+GW59w=;
 b=QFQ49I4EuUb02G8FRUV+yFJMKeVOaLHo3kyIqOYrNjcWiAy405E9qlf8
 FL8cl/8uy2xFuueLKut0pA3sLKVcAKWD2nqigPJRcLxgjQ3VP4ksT+FDl
 OvUYyghtfQI0lgQTt/bh2J5/y1DS95UopaKqEhE5we3oNULvF/duFV+e8 Q=;
Received: from mail-dm3nam07lp2042.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.42])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 18:49:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ix1BNgIeRi/6r2IUwY4kwv7drg6DFa1HCjMYsv4rzJJMDR2TkOMOMEhz9FaWvLGerHJKFNZi0pW6JTyNwNpwfAkqX9q8R3bj5BgYXZdcLLm+QtpyT9TiOJy4y6lQJe9BLh3rmpVY/wY7yuWJStaepZbG4aeKGD7i/MN7EvrTHPxxXQTz7VyOedBumo76BfV2GBLztsJBwSumhSQQ+yai2ZlstkuDtDZ9WFSsiiCMq6ApslqN1/DDiyDPFg7HuCx8coWqsXCqDLr/cyKJ39OHoGPFVVavFYEQUsyusHy5QZIqfWZcmlLsTAhjLRFzDgKlA6t5n6MfeYOwAfAPl4nHpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Xp0IVRI6Zi9eT5fICEE4L//U/Myoez28OlCMI+GW59w=;
 b=nOUSn6tT2ymjqknspAjyjreiJx+q3lSIDXvn7HiAIcm4/5S7c8mevKO1ysAZQigNROVZnIFt7bf1tweBdDSKbFmBAzDidLfdruItR111UFx1zR0liBMC/0QGrskGRTMQIQEAP1VsJZdYhhkzW/GDCTzDbWNZMGYkjsAGRcVAXBZ6Ue1N3BpIr0wVXfjeioksuTk1eS198XSUfgOihans0/wW3lbpUZmMFQB3WWnmShV4zm3MhUXGjw/2WSEObdA8ZUZHAchGeAZ62iPB8hl7t+3w+lqMHH5Bw0mGPb9uIyfMbzn8cKjDmR8G1wdxx00IBvdpVkjYjY+79Ax/pbv4wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB8687.namprd02.prod.outlook.com (2603:10b6:a03:3f3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 18:49:44 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::351d:3400:b3d0:b000]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::351d:3400:b3d0:b000%3]) with mapi id 15.20.4544.015; Fri, 24 Sep 2021
 18:49:44 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v6 21/40] target/hexagon: Remove unused has_work() handler
Thread-Topic: [PATCH v6 21/40] target/hexagon: Remove unused has_work() handler
Thread-Index: AQHXsSg4f4EIGRVQS0S4sDLnjl/MNKuzPTEw
Date: Fri, 24 Sep 2021 18:49:44 +0000
Message-ID: <BYAPR02MB4886BAF7CA58ED0FF9840A03DEA49@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210924093847.1014331-1-f4bug@amsat.org>
 <20210924093847.1014331-22-f4bug@amsat.org>
In-Reply-To: <20210924093847.1014331-22-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f0c6fc0-dedd-4e7d-c437-08d97f8c1350
x-ms-traffictypediagnostic: SJ0PR02MB8687:
x-microsoft-antispam-prvs: <SJ0PR02MB86875520F548C7748B6E94F1DEA49@SJ0PR02MB8687.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:366;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /Nn02gPcB5niGynFijqiRX4nipbesXwBtzXI3eIbW2reKGwMI6DMvODnC29FrTyuLhxy1+f9eXJLGd0MUjJrsdfhVxBb5G7wO0YjGRTN3O9VNFzSxc65HueVe2pSty/pFoCQ/wl2ShFd6pzpB6FYzWZzqlGcJrd+jiNau2uPXc19xRVr7gLO5Y7xuyA6WLIk339/769onXwlzfbRrU1tRoxaM+Of6+vwqtsp6xx0FGco2WfFP9pud86ALpP4oIQrOmHyihfoQMSwVekqRT9b6ldLMwIAsFsAdA+d766aKviqP+Ua1CQzmIaBjYKyGtx5jsG0sFsew6Wd6mqXUczhrOpQvsQraiQyI0ZRlm9tXtrxiEgvfbev6QR9VHZFNU8Bpq0+3nYucxEXIL70dA+T82DTsj6txJk6l6PY9NgavJI5iIjrmTt8VzQDVPLrtl3Kv3OTjQo6k3Crc9a/x04gE9eux65cSv1ANGKnuWsD1/a/3dtKs27IIGnNtVvpa3laiwwQgqj/SRSHrpAKr3YpF4hneXVLDO6F9m26+jJ4VaxNde4DeY7DfyrJshIN459NEliithXsOdx+i6MfpdOT9TUXULQAIPkYOhPD7i6rKd/mfIwgWwt4aC4T5N7q81uFERM5Q7OUJrJZnlDyvrEDFEz9C6DmmqYSjYdnhcoZuL3P0xBBNFAe+vaJqoyG3lBM5WDUSqBCVpnhg/5PDEM/yQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(76116006)(38100700002)(66556008)(122000001)(2906002)(8676002)(52536014)(64756008)(9686003)(66446008)(4326008)(33656002)(26005)(5660300002)(6506007)(66476007)(8936002)(38070700005)(508600001)(110136005)(53546011)(83380400001)(316002)(86362001)(7696005)(71200400001)(55016002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGp0SjVVc08wSEN6T0xyeXdEQkRTUGJwTGtUa2p1TldrYWpUUTgzVHpJTVVN?=
 =?utf-8?B?QWVPR3ErTDB3SDZSM2VXVXNUUEVPVENUd3lPMTdkdlRLQnhsaXFmUG9NdWdj?=
 =?utf-8?B?VkR3ajZncUtLMThXTW56QTVFSVNwMWpzZldaSEFIL1FOaVA4Wi84UjRuRnFN?=
 =?utf-8?B?NVJsblc4Y0lkaERwYU83WVBZQWRySTM2a3N2UDB5bDN5V3d6ZWN6ZXZpM2c1?=
 =?utf-8?B?VEdqTGM2bFNqNmlFWEpJMmFuY0tKaHRUZ0MvSHRoMFp2RldyVGtudGdHdDN4?=
 =?utf-8?B?ZHlZR01pem5VbXJtUUVOYWJHQ0pvTnBkRlIvNldoTmQ0K1Iyd0tMblF1REVz?=
 =?utf-8?B?Zi9BMnVEYUJrMTVFYUxUb2ZEVWJNbUl1cWRXai9nUzBEMlIrRW1PY081cWVZ?=
 =?utf-8?B?S3BEc1N5WmZZcC9kaVgzYVVZVTRHNFZBblFxUzB0bkpDMEdlLzRBc0t2c0ps?=
 =?utf-8?B?ZGRPMmhaWTR4aDBLVnFrV3RycVFEMGJwemNheU9ZWTNXZy9rNWZkK1R2UzhX?=
 =?utf-8?B?c3kvV3BBQ3djQ1pqTGd0bVYzd2VDWGpKcUpTTW0vMTEvUFMrK0JaR1BsN2U2?=
 =?utf-8?B?Y2pYWTdBSWRHczdMTXc0SmdIWXMwTWxkOER4a1BpRm13d2M4bm40b1B5MTlq?=
 =?utf-8?B?cERqUWYzUFNNK2xvYSt2S2lGNVJGWFlSMjB4SEJVQ0JFRnpaeUZCMXFOY2xt?=
 =?utf-8?B?b2VXZ2U1Q21vMzJyV0wrT21oeFBoWTVGUkFLdnpwdHpUa2JxSGt5dEFqSXhZ?=
 =?utf-8?B?bHNMUFpKbitpLzB6aUxKMmdoTlFIVXZRc2ZaMmF6b1FzTm04Vm1DUXVucTcw?=
 =?utf-8?B?c0NCQ3FDbEJQdlhVR0pkNGdFZTV1ME9UN2oyUTNFVktUT05wRE9LVDZJQUlV?=
 =?utf-8?B?VkZIVm1uMTN4VWYvUW5WOUR6b0RqaEE1bkxPSVBFcTcydVpYcHNhbU14aVVL?=
 =?utf-8?B?S1NLK2xzRlYwc1p4NG1GdkFxUjVYK3YrVFhGdWF0dk1VYVFUUUhPL0ErTS91?=
 =?utf-8?B?cXBxZm1QcmFrYUlXTTZkT1QrRTYzZ0V2RnQzTW9ZR05POUVDR0lJZy9QY2hM?=
 =?utf-8?B?NUVMaDBzSnNhMWxTenRrWGtuU20xVEtRSldWMTdaU0g1Z1NJSjQwQkdWTHJ2?=
 =?utf-8?B?Y2M2M1F5cVBmSEFrVFRzNzhPanJmanlUb1M3dHFDSS95SHExaTUrcElVZ293?=
 =?utf-8?B?RVRDbytDRHFwQ2txdWtyN1BuaW5jUVFoVGF0VzdCaytoUDJOaEZNTll2Zk03?=
 =?utf-8?B?L1BYZEx4alhuckJSZ3o0d2FOd2dqajVkbGtYeTdJaExadkNoSmZiTUJPaFB6?=
 =?utf-8?B?clI2clZlOFpaU2dJL24rc0NrazFaZGV2a3pwdTVoNll2RXZVUUpZYW9SSXVT?=
 =?utf-8?B?NFpIVnY4dHlQSURTL3JtMVpKRGF2MGlIcmdkNUk2anNNaGt1eGFRd0w2SHIv?=
 =?utf-8?B?QXpYYjY1cTRrby9BQWVSUEhYeXp3cWg2UE04RDlRejNwNnEwZ3E5eG5aeG5x?=
 =?utf-8?B?b1kwb05xbEloajRQZlM4b0RVaHh3bzV5VDJMUWpMYkQyK0RaNGo0ZVBhVkRp?=
 =?utf-8?B?MmR4eU5UbnB1VitXaUNLSkQ5T1FZZVVFcys1eUxtYXQ0aFI1cW1sUnprQ25W?=
 =?utf-8?B?QWQwU3FpK1U0ZU1XY1hSVXVzSXVuMlR0OVVmeWNXRlRPdklYcm9WaXNxUi9Y?=
 =?utf-8?B?M2tiV3hPWGJYQVUwVXdRcy9hSE85RWJpVWs1TWFkMlRSQmg3R3piajZ4TVFy?=
 =?utf-8?Q?1CVrm342rx3gQVbJtzn3OH1+eRkGxIg9gCGL7S8?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0c6fc0-dedd-4e7d-c437-08d97f8c1350
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 18:49:44.4375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p8kuFaUg+SLeb3Mx0bTTGw8vpV7rgcFTs7WG1TnQjiILO9KeW9uDdkNrGNPSUghu2GZHVi8WkJ6x3cePP8/hsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8687
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMjQs
IDIwMjEgNDozOCBBTQ0KPiBUbzogcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBSaWNoYXJk
IEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz47IFBoaWxpcHBlIE1hdGhp
ZXUtDQo+IERhdWTDqSA8ZjRidWdAYW1zYXQub3JnPjsgVGF5bG9yIFNpbXBzb24gPHRzaW1wc29u
QHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjYgMjEvNDBdIHRhcmdldC9oZXhhZ29u
OiBSZW1vdmUgdW51c2VkIGhhc193b3JrKCkNCj4gaGFuZGxlcg0KPiANCj4gaGFzX3dvcmsoKSBp
cyBzeXNlbXUgc3BlY2lmaWMsIGFuZCBIZXhhZ29uIHRhcmdldCBvbmx5IHByb3ZpZGVzIGEgbGlu
dXgtdXNlcg0KPiBpbXBsZW1lbnRhdGlvbi4gUmVtb3ZlIHRoZSB1bnVzZWQgaGV4YWdvbl9jcHVf
aGFzX3dvcmsoKS4NCj4gDQo+IFJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFy
ZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4NCj4gLS0tDQo+ICB0YXJnZXQvaGV4YWdvbi9jcHUu
YyB8IDYgLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9jcHUuYyBiL3RhcmdldC9oZXhhZ29uL2NwdS5jIGlu
ZGV4DQo+IDMzMzgzNjVjMTZlLi5hYTAxOTc0ODA3YyAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L2hl
eGFnb24vY3B1LmMNCj4gKysrIGIvdGFyZ2V0L2hleGFnb24vY3B1LmMNCj4gQEAgLTE4OSwxMSAr
MTg5LDYgQEAgc3RhdGljIHZvaWQNCj4gaGV4YWdvbl9jcHVfc3luY2hyb25pemVfZnJvbV90YihD
UFVTdGF0ZSAqY3MsDQo+ICAgICAgZW52LT5ncHJbSEVYX1JFR19QQ10gPSB0Yi0+cGM7DQo+ICB9
DQo+IA0KPiAtc3RhdGljIGJvb2wgaGV4YWdvbl9jcHVfaGFzX3dvcmsoQ1BVU3RhdGUgKmNzKSAt
ew0KPiAtICAgIHJldHVybiB0cnVlOw0KPiAtfQ0KPiAtDQo+ICB2b2lkIHJlc3RvcmVfc3RhdGVf
dG9fb3BjKENQVUhleGFnb25TdGF0ZSAqZW52LCBUcmFuc2xhdGlvbkJsb2NrICp0YiwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdGFyZ2V0X3Vsb25nICpkYXRhKSAgeyBAQCAtMjg3LDcg
KzI4Miw2IEBAIHN0YXRpYyB2b2lkDQo+IGhleGFnb25fY3B1X2NsYXNzX2luaXQoT2JqZWN0Q2xh
c3MgKmMsIHZvaWQgKmRhdGEpDQo+ICAgICAgZGV2aWNlX2NsYXNzX3NldF9wYXJlbnRfcmVzZXQo
ZGMsIGhleGFnb25fY3B1X3Jlc2V0LCAmbWNjLQ0KPiA+cGFyZW50X3Jlc2V0KTsNCj4gDQo+ICAg
ICAgY2MtPmNsYXNzX2J5X25hbWUgPSBoZXhhZ29uX2NwdV9jbGFzc19ieV9uYW1lOw0KPiAtICAg
IGNjLT5oYXNfd29yayA9IGhleGFnb25fY3B1X2hhc193b3JrOw0KPiAgICAgIGNjLT5kdW1wX3N0
YXRlID0gaGV4YWdvbl9kdW1wX3N0YXRlOw0KPiAgICAgIGNjLT5zZXRfcGMgPSBoZXhhZ29uX2Nw
dV9zZXRfcGM7DQo+ICAgICAgY2MtPmdkYl9yZWFkX3JlZ2lzdGVyID0gaGV4YWdvbl9nZGJfcmVh
ZF9yZWdpc3RlcjsNCg0KDQpSZXZpZXdlZC1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1
aWNpbmMuY29tPg0KDQo=

