Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10D2532639
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 11:18:42 +0200 (CEST)
Received: from localhost ([::1]:55878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntQgb-0002Nw-QX
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 05:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1ntPwE-0000pO-5O; Tue, 24 May 2022 04:30:48 -0400
Received: from mail-mw2nam10on2062c.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::62c]:23648
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1ntPw2-00048b-TT; Tue, 24 May 2022 04:30:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipIHwwVDmFV8n1K3KhaLJGUiIX2u3Hd4st5+ceBg4aDPi+9SORXWJXjcRm1k4/S+39VpcfFlEiB6ZQtJZm3HqK+E2w4JtOH2cuXdG1zJSvOOM/gnHWkU2hRbNwPqjlackiBxEIlSib6y7DweUW7Px1jm3bbxfsNpMIRroFo3H1+H3bNWBPis+S987I98V4VfVaIKzkktkhF1KfmsJCa8V+WyV00ryP6k9B4sGi9PU7b804nqLGRpp61Zz/l6lnBxitiFH0Nywwfrt7XbISl2OHBdhHj9BfYAdh5IPjgG9aDBxzZeEz8oOuicmP59Xg1U17tq8YhWQT/iLA1uFrNCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5v9SgZyyoqBJ1hs5adfTVXuq7+btX1FqUFFXNnhKkc=;
 b=nMs1od0ZKjNsrt2c1+QaNk9kPXHRnzuoyLoQrid3/hs2g2eQVoEOr+LD1iYUwAiiocn6YnjqUSrC8X2wtshYRpHm8RolcAvxdfcXGUDAt1vAp64aLK7mB/2EhnVcXnSgOlBboyXVNpdQR7z6DLIqMPZnSOAT6wNFPFdCw+ED8V+KbR19Rm2x2Z0qBywAiqcTRj7VsJGhXGbBWp0Zv/08FnV4hJhB7xiTR6GJ8iWz4bX+i+RegFf2bjkwfpaYYeizgOL9yTo/VgBO7zTOpwwB+avUYXL4Uwx6FA2X9c5AsYKH2q/pBa83p/+sbUizPTSBElMzdjbw3DRsFnaDC8+jBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5v9SgZyyoqBJ1hs5adfTVXuq7+btX1FqUFFXNnhKkc=;
 b=krU0+rjA2X4xGqhLt6DXYWJDSfPllkX0RizG+xtjz/V/VgQd51jj/JpzHpk9bJypKpRLS6IDnqU0V/k1P/XZfiPSQijbDXgRkd27ruEE4q7gMbWP7NmgsTSSjnCmHrr4m9Zd6HDIigIlY1hxE1L/sXcKFpDufEn20BQ8Fsa1ovk=
Received: from BY5PR02MB6354.namprd02.prod.outlook.com (2603:10b6:a03:1fd::12)
 by CO6PR02MB8788.namprd02.prod.outlook.com (2603:10b6:303:143::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 24 May
 2022 08:30:26 +0000
Received: from BY5PR02MB6354.namprd02.prod.outlook.com
 ([fe80::dda8:64bd:1979:8134]) by BY5PR02MB6354.namprd02.prod.outlook.com
 ([fe80::dda8:64bd:1979:8134%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 08:30:26 +0000
From: Frederic Konrad <fkonrad@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>, Frederic Konrad <fkonrad@amd.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>, 
 "alistair@alistair23.me" <alistair@alistair23.me>, Sai Pavan Boddu
 <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>, Sai Pavan Boddu
 <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>
Subject: RE: [PATCH v2 2/4] xlnx_dp: Introduce a vblank signal
Thread-Topic: [PATCH v2 2/4] xlnx_dp: Introduce a vblank signal
Thread-Index: AQHYa5kqJyHPd0osMEii1HXWJ/2an60sgVSAgAE37iA=
Date: Tue, 24 May 2022 08:30:26 +0000
Message-ID: <BY5PR02MB63545EA0884179C8650BD3A5CCD79@BY5PR02MB6354.namprd02.prod.outlook.com>
References: <20220519153829.356889-1-fkonrad@amd.com>
 <20220519153829.356889-3-fkonrad@amd.com>
 <CAFEAcA-v6fr3tqSKNuc5T3X=Wnp8+UHsUHqKFWzYgg41p1_G1g@mail.gmail.com>
In-Reply-To: <CAFEAcA-v6fr3tqSKNuc5T3X=Wnp8+UHsUHqKFWzYgg41p1_G1g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d9c937f-a91b-4923-c5e1-08da3d5fa74e
x-ms-traffictypediagnostic: CO6PR02MB8788:EE_
x-microsoft-antispam-prvs: <CO6PR02MB878879A27B5560E1FB2A9959CCD79@CO6PR02MB8788.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ENZpc92JNPqu3h1wsT9jjtQXtdkZchkF6AXS9B0Or8og7WOUVHQwfEABPv/0ArxypSmg5OBzm99WrTUQ52xy5KTVcrdkFEKYBtaNg4C16rQmDKUck1/psDDS6JtyVlinfB0b4wmMeUc9TPR8MdRHtOjIXhPLV2MfvZX1xxwjvlIoCiD/7T2cRW7aNA+Kmdkxu7N7ZxMQZD8ZtiGgEeJ2O3vgWFgcCiBkZVGouqLMY27/eP4gSZKIa64H7vWU6sHbk5B2upqIjLakM86v/6P7Xc9F5w6epfyiBQPz8ThUZqbeLYgaRoSkgzt3+CLkOZnfhakVUp+AhmyLHUBUED2xhkqI1ASUSoQ0Qo8meoB7ymjStrKmw+KP8NqYhEjONlKhaI0a09xrPcA3my9KhG3K9OECuGXXYAlKEg2U8BY6+dhJRJ+5n4X5IRuiEfUJ1WBcGHqamDtpVkc5F0wZNJNk+oVbQuLY8J9RHAF8Q9DA6UlZQfWjcnfZXS88CXfI++bhqjflDWE0PACvDoQmV5d3wQHBOQWHM0048LUH/eBKqok23HzquG8Hax677007NeGdHMw5SGAn1j6wlVXkQ2ds8HdNvjsh7W4gX1USTKhYt/ClJdhZY9754gTKn0bPjYP+Jl+oYO3ov/c5wG5qOqKbuZ5TKTCWFbU18xIeODInZjc21+mpKvvhrY1V2BatLkUtnP2gEYeqDPcN0/rroNB9zQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6354.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(122000001)(54906003)(316002)(38070700005)(110136005)(4326008)(83380400001)(8676002)(66946007)(107886003)(66446008)(64756008)(186003)(66476007)(66556008)(76116006)(86362001)(5660300002)(55016003)(71200400001)(508600001)(26005)(9686003)(53546011)(33656002)(8936002)(7696005)(6506007)(52536014)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWQ0aTdSL2tTTzhReWpDVVBYWkMxMFk2T1lVVUpTekMyaW9DMis0WFNWaC9V?=
 =?utf-8?B?elcvemp5MlVrSFdZaXo2bWJSMEFNdWJMbmtJVVdIUkQ0eTdzeG9aaGg1ekpJ?=
 =?utf-8?B?SXF0Z3JLUjY0N1R4dHNZS04vek13WjhHL1BwNzNMV1VRekVoR0VWNDFtem02?=
 =?utf-8?B?NGNZYTVUZVZLN01Gd01nN1dVaDl1MkNzaUttWCtsSVZaSUFtLytZam1vOFY2?=
 =?utf-8?B?YVdLNjVRU0RRbCtGMVU1a0NRK2hXUERTb2JaWTBWRkRmUTNYTVMrOGt3L282?=
 =?utf-8?B?K1cyNS9zb0s0a29taHFZVjd3TWVZN1BYRllWUHlzRzFHTUVQeU1LR1JmdG5v?=
 =?utf-8?B?emQxVERZQjBvZThITERLMGNEUjlIYUsrQzByYVFFWll1cmpBK0F6aHJmdGNF?=
 =?utf-8?B?U01zUkdIVElubGZWNVFlWEEyMkZoOSsvUG1XMjM2K1lMeVJlY0l1UjlxYUZz?=
 =?utf-8?B?bjhHRUVqSGxzdzN2ankrSjM5OTRhWWFTOHpYT3pqeUdiYTB5ejAwd1UxSEhV?=
 =?utf-8?B?bkduWmJGWmZyd3IxN284M3d0cmEyOGZrRXp2RVFjTkY0UDVnVTNzcGl0ZDlW?=
 =?utf-8?B?NHZCSWt3NXVYUkRNNlBqSmQ3WVFMdXUvelBCM3VvQmE0MkZ3SmVBL3ArRklm?=
 =?utf-8?B?Zk9PRUxha2tlWmpDQ2hKK0FzZDhWend4Uy9BWmRjYkt5RjFYSW5uaG11SGxt?=
 =?utf-8?B?N3ZBZUdaUjk5dUlsTzc4S3Y5UzluaERtOVdWRFJHSUpyeXR5dXhJcTEzSFlN?=
 =?utf-8?B?MWkvajVOeUNpcHhtU3FnNzRBSnFzb0RaMjV5MSsxY0FPd0VwZUkrbitRd3hH?=
 =?utf-8?B?KzFjY0ZDbnF3eVRWaSt2eXdGZUhuZUlCbUNBS0hnVTFFN3JZdFJ0R25ScUlj?=
 =?utf-8?B?Z2lWREJPbmdsaTJ5MU9weDNTVkhoQXErSG44bjFVaVdCZ2xzMnBxMzk2d0JG?=
 =?utf-8?B?ZldkK1p0R2dsbEk1cDVRU2k5VmN5bWRkQUhhUFFWYnZDQm4yZi9JbFhpZzdU?=
 =?utf-8?B?cVVtT1BoR1BVd0dKQzNqQmNMNE5mSkNaQi9IWHgrbDQ3WVhnVGgwOFRSaCt4?=
 =?utf-8?B?OHRSeXFWdEJpNVlTTHh2dG83bkpVQzNkN3lXS2hhMmt4eVd6VEVWMTM1dTNK?=
 =?utf-8?B?S3JOTCt0RXZJMUZiSThSb1dlUHlYYmVBZ2lhYXN6OE5IZC9vWDZHUjZhV2k4?=
 =?utf-8?B?b012RzM0dVNJM1JJYkVWMXlpQmdoSjBwSDlIYlI5RldvRkcrVnYvcHBmNU5a?=
 =?utf-8?B?REgvY3k5MFdXYXdOSUhpcm9HMlBxN2x3Z04xNlM0RG1UQlBmbnpVeEY4TkR5?=
 =?utf-8?B?MmhOdnllL0VleFNma3pLMUpEaTRia3RBV1l0d3BXTU1MTUhWbmNld0N0Szlr?=
 =?utf-8?B?QUt4bUduaU5ZR3h4eGE4YlE4eHBRVTcrcjJZZEE3VjUyY1hQT3c3S2EwQ3RH?=
 =?utf-8?B?MGxGaEZKT0tVSjJYQlZBOWxFWk81bUxiUS9Ndk5FUFF4ckYvM1ZWa2V1eU96?=
 =?utf-8?B?bHUyM1Raem9wR04wdjUvY1VvS2lIajFUODJDTzlWSm1xR24xaG9jUGlpaXBU?=
 =?utf-8?B?L0M0dnl4Q2liNSs1UFl1VjB3ZURGZStaeEs4QmVQWGFNVGRsYkN4cnFaNnVu?=
 =?utf-8?B?ajlzMU03WlM3djMxYzlucmsrYjUwV1FPZVRHL0krck13N2Z2U29FSlB0NzRK?=
 =?utf-8?B?UHRNZXFiQ1NKSnJRQ0d4c2RxRCtRWWJGbHNvWUdiS0FFNSswOUY1WmdlbjVE?=
 =?utf-8?B?SUcwVjFESktzRUlRb0RqQjE4MWZEcWg0YUdsSHhDVDgzek02dkUyZ0dxOXlz?=
 =?utf-8?B?bTZqRm93OTRaWG5kQzFkQTRVYURPMXlGdlhXSE9CZ3QwUnRKNU8rV0xFOVll?=
 =?utf-8?B?RWxkSFFVQlhCN1k5S2gzZTUvNzY1NkczN2RVdjJCajRPc2ZlRUR3VFF3VVFK?=
 =?utf-8?B?eGN3blRPWENTM2pHMzA1WkdIQVFpR1lvRTBqRWhQNlhrR2V6eTFzdHlVSlVa?=
 =?utf-8?B?WG5wU1Nza0kxMktRSTYxcEJFb1B0TE8yTVVqMm5tWGFGT3F1bEdrRmlkSXl4?=
 =?utf-8?B?UUtMVkpsaUhVY1NiMEFlMHRKbit0WHBhbFZXNW52YU1vbnh4MEZTbTYxVlB5?=
 =?utf-8?B?NjJQOWpYSVQvTG5QRFNJdlpGT0Z1RGI4NDhsOU5yaEthV0prbENWMVYxa3NF?=
 =?utf-8?B?QkNIL2V0ZDdnU3RlaUFEc005MFEzUFM4dGZhaExVL1QvaExYWi82djFwRHkx?=
 =?utf-8?B?blVBZmpmTkhLbGVBaVRXZ3FQcGpvc0ZwbXhhOUVORVZsOXdxY3ROZnQ0U3Fx?=
 =?utf-8?B?azFyMkIwS1REN1BLaXdzN0NCNEhyb20ySkZ4VUlDaE85M2dJR0VXQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6354.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9c937f-a91b-4923-c5e1-08da3d5fa74e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 08:30:26.4022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UiJukIOjkIehcUHQ9pzwC0CDdkwTN6L0MXZp1AkuaYotMKPWFlFgOgmcdD67svIfTySnkiX7HWiKGHQLHRcH+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB8788
Received-SPF: pass client-ip=2a01:111:f400:7e89::62c;
 envelope-from=fkonrad@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCA8
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiAyMyBNYXkgMjAyMiAxNDo1Mg0KPiBU
bzogRnJlZGVyaWMgS29ucmFkIDxma29ucmFkQGFtZC5jb20+DQo+IENjOiBxZW11LWRldmVsQG5v
bmdudS5vcmc7IHFlbXUtYXJtQG5vbmdudS5vcmc7DQo+IGVkZ2FyLmlnbGVzaWFzQGdtYWlsLmNv
bTsgYWxpc3RhaXJAYWxpc3RhaXIyMy5tZTsgU2FpIFBhdmFuIEJvZGR1DQo+IDxzYWlwYXZhQHhp
bGlueC5jb20+OyBFZGdhciBJZ2xlc2lhcyA8ZWRnYXJpQHhpbGlueC5jb20+OyBTYWkgUGF2YW4g
Qm9kZHUNCj4gPHNhaXBhdmFAeGlsaW54LmNvbT47IEVkZ2FyIElnbGVzaWFzIDxlZGdhcmlAeGls
aW54LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzRdIHhsbnhfZHA6IEludHJvZHVj
ZSBhIHZibGFuayBzaWduYWwNCj4gDQo+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4gDQo+
IE9uIFRodSwgMTkgTWF5IDIwMjIgYXQgMTY6MzksIEZyZWRlcmljIEtvbnJhZCA8ZmtvbnJhZEBh
bWQuY29tPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IFNhaSBQYXZhbiBCb2RkdSA8c2FpLnBhdmFu
LmJvZGR1QHhpbGlueC5jb20+DQo+ID4NCj4gPiBBZGQgYSBwZXJpb2RpYyB0aW1lciB3aGljaCBy
YWlzZXMgdmJsYW5rIGF0IGEgZnJlcXVlbmN5IG9mIDMwSHouDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBTYWkgUGF2YW4gQm9kZHUgPHNhaXBhdmFAeGlsaW54LmNvbT4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBFZGdhciBFLiBJZ2xlc2lhcyA8ZWRnYXIuaWdsZXNpYXNAeGlsaW54LmNvbT4NCj4gPiBD
aGFuZ2VzIGJ5IGZrb25yYWQ6DQo+ID4gICAtIFN3aXRjaGVkIHRvIHRyYW5zYWN0aW9uLWJhc2Vk
IHB0aW1lciBBUEkuDQo+ID4gICAtIEFkZGVkIHRoZSBEUF9JTlRfVkJMTktfU1RBUlQgbWFjcm8u
DQo+ID4gU2lnbmVkLW9mZi1ieTogRnJlZGVyaWMgS29ucmFkIDxma29ucmFkQGFtZC5jb20+DQo+
ID4gLS0tDQo+IA0KPiANCj4gPiBAQCAtMTA3LDYgKzEwOCw4IEBAIHN0cnVjdCBYbG54RFBTdGF0
ZSB7DQo+ID4gICAgICAgKi8NCj4gPiAgICAgIERQQ0RTdGF0ZSAqZHBjZDsNCj4gPiAgICAgIEky
Q0REQ1N0YXRlICplZGlkOw0KPiA+ICsNCj4gPiArICAgIHB0aW1lcl9zdGF0ZSAqdmJsYW5rOw0K
PiA+ICB9Ow0KPiANCj4gVGhlIHB0aW1lciBoYXMgaW50ZXJuYWwgc3RhdGUgd2hpY2ggbmVlZHMg
dG8gYmUgY29uc2lkZXJlZCBpbg0KPiBtaWdyYXRpb24uIFRoaXMgbWVhbnMgeW91IG5lZWQgdG8g
ZWl0aGVyIGluY2x1ZGUgaXQgaW4gdGhlIGRldmljZQ0KPiB2bXN0YXRlIHN0cnVjdCAodGhlcmUg
aXMgYSBWTVNUQVRFX1BUSU1FUiBtYWNybyBmb3IgdGhpcyksIG9yDQo+IGVsc2Ugc2V0IGl0IHVw
IGFnYWluIGluIGEgcG9zdC1sb2FkIGhvb2suIE90aGVyd2lzZSBpZiB5b3UgZG8NCj4gYSBtaWdy
YXRpb24gb3Igc3RhdGUgc2F2ZS9sb2FkIHdoZW4gdGhlIHRpbWVyIGlzIHJ1bm5pbmcgdGhlbg0K
PiBvbiByZXN1bWUgdGhlIHRpbWVyIHdvbid0IGJlIHJ1bm5pbmcgd2hlbiBpdCBzaG91bGQuDQoN
CkFoIHllcyBpbmRlZWQsIEkgZm9yZ290IGFib3V0IHRoYXQuICBTaW5jZSBjcm9zcyB2ZXJzaW9u
IG1pZ3JhdGlvbiBpcyBub3QgcmVsZXZhbnQNCmhlcmUsIHRoZSBWTVNUQVRFX1BUSU1FUiB3b3Vs
ZCBiZSBhY2NlcHRhYmxlIHJpZ2h0Pw0KDQo+IA0KPiBBcG9sb2dpZXMgZm9yIG5vdCBub3RpY2lu
ZyB0aGlzIGluIG15IGZpcnN0IHJldmlldy4NCg0KTm8gd29ycmllcywgdGhhbmtzIGZvciB0aGUg
cmV2aWV3IDopLg0KDQpGcmVkDQoNCj4gDQo+IC0tIFBNTQ0K

