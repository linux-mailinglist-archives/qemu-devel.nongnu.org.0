Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB93439EC3
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 20:56:41 +0200 (CEST)
Received: from localhost ([::1]:38324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf59E-0006Wz-FQ
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 14:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf55J-0004rJ-FQ; Mon, 25 Oct 2021 14:52:37 -0400
Received: from mail-eopbgr820098.outbound.protection.outlook.com
 ([40.107.82.98]:37532 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf55H-0004aJ-2N; Mon, 25 Oct 2021 14:52:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I24Dwhsk2bPfXjUTpZLXVKa557HmU4FB4Bp0s/sqlRvUHELwCZa5uW7gJ9I3poczoFX4DpL/kGCCDEm9eXl8h2xR5Obu9fxDjd+4YCQtfNzkLTmbSe1y6YwO9FOwn4d72u+ELC+a0vPUxMT1f5iIv/9r/I3FywC8jKCek+vqGbJZBs0uzc1IX6MrcL0fmItcTJOsDZIOpMbWnmdKv36Rkks9CngFgmVJox15An2rwY07e+U8iW2N70X0E7inNr+3WWxrOA+sk/EGQ/3qdndIAVJbZziK2QI/rNRQJ2C3dVY/FdtT0jp3k/SZAHCBPYabfth7lwRLpqlxAzcGbeq0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Dc/YfOruOddSSgoQi025iyhW+OoBVlCPCJF9AbsrHc=;
 b=UlgkQVE82KBajddzNrFEKrtXUodQ8qSgtIujJssLlJp1x3IXxhxfJn1uuWafX7wUWLP6FqI2SExok+7gAGvFtigT4NGT/kMi2GaMjdd9sGvjwgdmnhl4kaXaUloKqeE3S/WWhGzsuHA3d2IzftGzbSXMh3bwTwBo871cCEO+nd8ZERR/m5oe5h0qUtbOx43RXI6bC9+oQITwHQm2/neEzTlBorGShFgDlPx0oMxmnsM7vgwBY+1JNVDeJbgH8/bxwZTJVSYTLbQsOUmXIjrEH1FFaDdqrlWq7BvMeunhrftj4OspW/TCnlaZJKhBPGPPuq53uiml0H55NtxxLcqY8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Dc/YfOruOddSSgoQi025iyhW+OoBVlCPCJF9AbsrHc=;
 b=dH8iUj6e7VpC3cfuO3TXZy9yV0Jf3FnjPTaCeHj5EIjwVW+5+HzYhehC1WNRZsoJXx95gGG9c9AAdpNaQYQxEzz3LTO4CvUGdRS26SGUIbWBogXLNmMxsUfp0FqR/Hau72ZWXGzgJfkEUIXiNyZPpIMSyNx0/fyxx4aQUdwagnjeQhtKwehQoA1QlorC3GXQVv0CNmZ0VyUEoP6UNGbS5RcUhw6NgWzMiPzU+fBZ3eV7m3rIr92ACsyu0+LZIATsPW/Q3o1gCDJ0A8ndDS9B1edPtn2z9+1K6wWp6AXku+tkAtIXkyVaD1bZFFV9tsszK6l+BQJs7r5kyBqCrjVAgQ==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4467.lamprd80.prod.outlook.com (2603:10d6:102:48::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 18:51:58 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 18:51:58 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
Subject: RE: [PATCH v3 15/22] target/ppc: Implement DCTFIXQQ
Thread-Topic: [PATCH v3 15/22] target/ppc: Implement DCTFIXQQ
Thread-Index: AQHXpjbPtLa6nxp4MUmC5E9uDZv19aveO88AgAYW15A=
Date: Mon, 25 Oct 2021 18:51:58 +0000
Message-ID: <CPXPR80MB5224F250D1B803CF21A6014CDA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-16-luis.pires@eldorado.org.br>
 <dc3ebde7-5f80-9a88-2165-b7b69eda5e05@linaro.org>
In-Reply-To: <dc3ebde7-5f80-9a88-2165-b7b69eda5e05@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0843c792-68f6-4344-ba62-08d997e885bc
x-ms-traffictypediagnostic: CP2PR80MB4467:
x-microsoft-antispam-prvs: <CP2PR80MB44673E48A00791DB8600BE35DA839@CP2PR80MB4467.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xzPPJnEjKRS5hSAcbFbjzkB++4NCEgdjBzhQCIl6WDMpmaedTSeRLmJnQKYzKmKCmRm701HRL21Wxwv1x3x+UbSNpPzhaDuHPaGfwDCJEkSopV8I5ZRk2KPiXzPXbJiGLGaBhzmfdkfwyji8Keh5woI20JkSTPZZrxJGkC993h5GZjVPz+OiNVj2XvD2uFPfouYU4wZefFg+DeFcRyWFHoLFS1RTP8Hw65djn62F380tCtG1sB0mk1oB5dhU/HrFCWRZviZoLfSMRaCVZA3B5RfQGh9nJX77DgIQGQTQfDixtQobvW4v4NcpIZEfQ1P1QWAwKh3EPrgTKwWjJO+LOThtlxdRbJtwRrq6SVhCGYRyAioOpyjjcmJ6Vl/54JX9YJkik9bHmIRy31AmOxxEuSJFxZ0zfT/Wb8sgbKf7+oxdYQwVC9CVEk86HVriqdFuOSlOFqypHZnchz95rsqNsg5mAWFf03r0T3zd7J2hRTIOiAsC5rzBOmX7Lmh1AOgYtUC9o50+JMKG8trwnpPWar+nvffF8l0pBdcv+hXvf2jpMI4cFrrPbgLTZ6gKrlnYK4UFxGSbMO24uFo0hwQNTA+buZ+yUfuZY+fiTRvapAwVddjktzxUTF/B3L3VjIEkz4WFvPMDEXT2UnhBD5TLFW49FtwrY7Pbl41wUaNhHjziR+dFcJ+zEbL3XaNFZZDPRJdWLFN2NvOU9RRPFioqzzVrd0kii4NcFXU9NG4RJyES9zyLXmtEeWA2xyRt5rtzT1vs17kjds4aqhx9XPuauX3w4zPuAeaUw3YB44Q/yuo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(71200400001)(110136005)(38100700002)(4744005)(316002)(2906002)(8676002)(7696005)(33656002)(4326008)(5660300002)(52536014)(66476007)(122000001)(6506007)(66946007)(66556008)(26005)(8936002)(86362001)(66446008)(38070700005)(9686003)(76116006)(186003)(64756008)(55016002)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmVZNTFuZmVnaURGUjRxWW8vYWFiK1YxVUt5Z1dUcC9HL1k2WTlBeVZ2NGRz?=
 =?utf-8?B?V0RCN2dMYUlTbWk5ZG5Yb1dHYkF1amZPNWovL1BOR3pVb2g2NElPSSt3Ti96?=
 =?utf-8?B?UVl5cXNYanF1K3NXbldWeE9oRGx5ZTBybWJKV09OZUF1eTNlbEdvOU9SUzlM?=
 =?utf-8?B?dmV4YjAvaFQ2eUpWKzFsY2hlcVJCaUVkeDRZcmxGa1hXNy8ydU94UXJmbjVK?=
 =?utf-8?B?NzFjZE9yR1RUV0tMamFmTjA2OTNjZ0VjQU5hdXBWK1UycFpvNXFnUE5MSGhw?=
 =?utf-8?B?RG13SDBYMFJDeXllODdQYnlCa0pmY3FacWlGRmFtbWRUbnNjc2JKaEk0Z1Rp?=
 =?utf-8?B?ekhpTGxaSDlWTko2SEV3YXpOREhEVFFHNUpCb1lkRjl3cjM5UE1tRjUvaTV5?=
 =?utf-8?B?eFRNbDI4OSs1VUpaY201SEhNaERoMUJJbzhTQ1dsWXhnUzREUzVvaGovckpL?=
 =?utf-8?B?Yk4wYnZXd1FydFY4STNSZkhZZHY0STFDMDF4RlFTeVVTem1EOU0rRGx5bGRR?=
 =?utf-8?B?UFN2SmkwTTFMUloyb1h2eHViRUcxTXE3ZXZBVzdYODZDZXdmdjl3ZUlWM0VV?=
 =?utf-8?B?elNFYkwwZWp2Ty9YdTUxYms1STlIMnJvUWp5eVVFWUIxNHlMSmZWSEY5Rllj?=
 =?utf-8?B?SkVKN0ZRc1o5b2VWeHE5bzlWOHFzVWxkZXFzemErSllGYzhDUWxCdHpoNzhU?=
 =?utf-8?B?ZEZrenpLUERLb291VWRkSEVmQUxKbTBlL1g1dXYzZENtK0Y1c3Nhb1dlKytQ?=
 =?utf-8?B?WDh3SUJBTlJPanR0aTlZV2R1eE5lNEVERVdVOHIrUFk3bWRlZ2I5b2IxbFlF?=
 =?utf-8?B?Wlp6eDB0L2x1WThZc3hxdjNjUHVyeHBQQ28weTQvM21ZY3VJVDgxT2pKeWs2?=
 =?utf-8?B?eXRuTElWWFBDdUNFeXhEMkhNMnhjaDlsTktSRmd6ampxVGtFcWkxVjRUVnNq?=
 =?utf-8?B?SWx1bzIxckE5WnBZdkgrbk5mWjA4cWttcGJvV01TbDFVOWNTREJULzN2cDVD?=
 =?utf-8?B?SEJ3OU05bVRnbmZYaWFpRm94ZnE5VFVJVlRHSCtJVndFSXZLZ3J2ckhsYklK?=
 =?utf-8?B?UFJ3MWw0elNsS0VXM0FYRjFHaDUrRmMxc1d0Uk15d29UTmRGK1ZYQ1VmRE85?=
 =?utf-8?B?OFdKaW9aQ2JSWEVPMWE5aE0rSUMwNnlDYzNXQ2E0TFBxWnp1UTA2M0VpLzdB?=
 =?utf-8?B?U1lEWnlqZlRCbWxRVzg0bVVWWUV3WWVxMjZZWmVHOGF6RWJuWUl6RSsrOHB4?=
 =?utf-8?B?dkJKVkx6Y0R2ZmtyY1hrQllBTEVlMmFSTXpleTN2VEFtaVpLS1ZVN0hrQmx3?=
 =?utf-8?B?ZVo3NHhwSHorRkxyYU5pazRsc1RMME9FbG42eHVMYVArbnNTcVRITmM2L05V?=
 =?utf-8?B?QVI3eEdBQ2tMMGNjUHgwdCtVY05Ld2FyRk9SWk9OcE82RWJDTjZsZEZ6bkJo?=
 =?utf-8?B?NWcxMmJVQUJOeitnNlZKM09zSzhQQ1FqM3lDUWVsaUZUdGRXY1NIYVA4MVNt?=
 =?utf-8?B?a1ErQzQ4STlHSE90dm9QZk9zLzZSRGd2Sm96RURIZVZVdWpxT3c1VE1WS2Vp?=
 =?utf-8?B?ejBVdlRPaXBaVGt3a3JqUDVUeHZKcWlJRC94b3gxTTQ5MjBubE9tYU9vZTVU?=
 =?utf-8?B?SEZPcllPTnVkMzdpTjM2cmk0cDY5QWpiVkFXWG1lSy9zT2pmUENQUXpTeUF3?=
 =?utf-8?B?TXlpK3ZIY0laOFcyanBwL09vNkpOL3gyMWdxcGtsMHBlMVFUZXR6elhLK2pk?=
 =?utf-8?B?ZXdSK0I3SHVUdUR3UDZZeVVWV1ppQmZ2YWJObUpWNGRNdzhKeUZ1bC9tbTRz?=
 =?utf-8?B?NHVCQXFrTy9ncTR5WFM1M04xT2tYQ0RuYTFRaDNBdlJBbkNlMmliWElKTmlL?=
 =?utf-8?B?Wi9hT292NEpkWVBFTjk3T0J0dFVMZlQ0MU5pWkJXa0VvekFJU1Uwb2t0S01O?=
 =?utf-8?B?SHUraDJNdkVKNlZzdWhLbjRKdEdxblpYeFV3Umlwb2NoN093MnBCamRsUWJU?=
 =?utf-8?B?UEd1QnpVS29PNWJVTVpHRHp2SjkvQjhaVEUyWVZJampJUmZ3S09jcXAyKzNG?=
 =?utf-8?B?TGxEZWd5dnlXT0lBbWQ2VTF5U0o1bERaejFEeUJZL1ZzMW5aY3c2Ry9HUkxM?=
 =?utf-8?B?RXpiL0VqcTU5d3YzdTdaY1NMekMvMEpkUUw1Y0dFMG5BWEkxQ1ZtaHVFanQ0?=
 =?utf-8?B?ZEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0843c792-68f6-4344-ba62-08d997e885bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 18:51:58.0491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XGq+bksQ6k0ZpszpCKPCMaaZQXvaccqStpHrNtrbOFpBi2FzeC3Sn82i6KJJRQs3hcoX0uB8DfNHCyF+K0NqwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4467
Received-SPF: pass client-ip=40.107.82.98;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "groug@kaod.org" <groug@kaod.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQoN
Cj4gPiArc3RhdGljIHZvaWQgc2V0X2RmcDEyOF90b19hdnIocHBjX2F2cl90ICpkc3QsIHBwY192
c3JfdCAqc3JjKSB7DQo+ID4gKyAgICBkc3QtPlZzckQoMCkgPSBzcmMtPlZzckQoMCk7DQo+ID4g
KyAgICBkc3QtPlZzckQoMSkgPSBzcmMtPlZzckQoMSk7DQo+ID4gK30NCj4gDQo+IEdpdmVuIHRo
YXQgdGhlc2UgdHdvIGFyZSB0eXBlZGVmIG9mIG9uZSBhbm90aGVyLCBJIHdvdWxkIHRoaW5rIHRo
aXMgaXMNCj4gdW5uZWNlc3NhcnkgYW5kIHlvdSBzaG91bGQganVzdCB3cml0ZSAqZHN0ID0gKnNy
Yy4NCg0KRG9uZSENCg0KLS0NCkx1aXMgUGlyZXMNCkluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxE
T1JBRE8NCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3Jn
LmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

