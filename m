Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC445315773
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:08:58 +0100 (CET)
Received: from localhost ([::1]:57498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZJh-0002ns-Qx
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1l9Z5t-0007PD-0X
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:54:41 -0500
Received: from mail-dm6nam11on2054.outbound.protection.outlook.com
 ([40.107.223.54]:34400 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1l9Z5k-0003Nv-GR
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:54:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g48MH++WH26ym1ob9Za1wNRa3/2p/2Ut4NFUzAYMon/EY6k/qoKUZ/MVJwmegEUpNNwu4ORolws3EMQmFQm7lcZjEYbeuOhTyaPe0gPXhTUyzz2Wdhy+QvKTM2BSJj8uZsQP96PwS6vx7aP1YYJc8WbGImGFyyYjRzGEGj1ns6QOCqQnvn/++iVvYEt4eP5d2pJNpVqUEOmeQ3rywqzvJm4E3v6q/NquwS6+5RNOSA7Tb2pYxaJ3IpXhEdW+3VevRK4zD/FRbYdx1C034eqTzUKh/hEcAXhFPQoEsKCQBzX/zeT6WSGfDBhkbPoScHvxR6qIMSr1f14tS3nnwQSQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HViLJsHIUUbkd4gtXOCSZzlRe79k6tZHXPhhDgOJgAo=;
 b=COZOkcHjdR6WNpSpiVs5gkQePa8YYilNNUKQfl2FFxp0rXP3hrm+wxBVpDdMYGN+Fi0BvkbTDnM60DGlU0hz7/KhdVAvThitTXf4YmhY2vUwvBzHxGeRW0NqeZREPdinLOksyg4dTZQl2Tn4MoO06BGOIRtDtiN3S3g/+wH6POlfHs4RjB7U45ByjC2AB3UTkr/zs7lsRetD6R75jLmlTXjD18dmKzERyAiBQWRgP65MbCxosgm2p/yEyf8w6O8jhv2WMZWt21Eerx85Xn4ig/X9yd8xpF1/eG25+7NLaosGR/PHTXN0QQBhSaSJqLRO43DNvV4xx8JyNl9fhpodiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HViLJsHIUUbkd4gtXOCSZzlRe79k6tZHXPhhDgOJgAo=;
 b=SEJhRiLnv29Lq124RAJrOttCU/D3HqruSTDo9H4S/2xQTGQNZuPf4O0TmsOAA/56y2cf+mv0/7Ta5TcGXPlUhKntnnUXn1yZ29KLyA44LdomdZYkiZ1FtX4qWhGXi4qSOTLk/bXnP7F/kH+2J+EHSpKKWW2m3ai8TDVB63BgmGk=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BY5PR02MB6932.namprd02.prod.outlook.com (2603:10b6:a03:23a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Tue, 9 Feb
 2021 19:39:26 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf%5]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 19:39:26 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Edgar Iglesias
 <edgari@xilinx.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>
Subject: RE: eMMC support
Thread-Topic: eMMC support
Thread-Index: AdaMV1egTP30pYAoRjSnbjGpoRC6iAANeBGAAAuHn4AYk6ghgAAO2W8AAl8oqxAACPc7AAAAKIgAAYz1E6A=
Date: Tue, 9 Feb 2021 19:39:26 +0000
Message-ID: <BY5PR02MB67726489BD76132422D6297ECA8E9@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <BY5PR02MB6772761F83EDC56737969C18CA210@BY5PR02MB6772.namprd02.prod.outlook.com>
 <CACPK8XexXLYrwMenkyou0Xkc8Tx+p1SNi7jbFBj6aObAKHcBwQ@mail.gmail.com>
 <6a30107a-abf1-635b-c96f-af3d63f93bc8@kaod.org>
 <6c1e1335-887e-0459-f1c7-f37daa008c4d@kaod.org>
 <d0ef7bbd-2b2b-422f-9420-29ca620db130@xilinx.com>
 <BY5PR02MB677227AB2EE184B02E1E90B8CAB69@BY5PR02MB6772.namprd02.prod.outlook.com>
 <e401d119-402e-0edd-c2bf-28950ba48ccb@kaod.org>
 <13ff3712-e187-9555-057f-3612654d25c9@kaod.org>
In-Reply-To: <13ff3712-e187-9555-057f-3612654d25c9@kaod.org>
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
x-ms-office365-filtering-correlation-id: 7f1b6272-ac75-4ab0-9593-08d8cd326916
x-ms-traffictypediagnostic: BY5PR02MB6932:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB6932DB7431700B8F85ACE1DBCA8E9@BY5PR02MB6932.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FtYDFmw7blRvU7K6xviJAiorTXYf+edx6IPaU9lXovpzlt1kEkH+VyJMVdZOlp7NQpGWrJ6pBUxFN6YvR7gxzJ0EqvU7hkFE4DG4MZV20X1oZ4OUC1iNCRYj2IuTMpTilDJ5Rd+9AFRNxOSLPyL8IXo+bcYGMnrNIJQyNPT6i6KeeMfon6PKj0PhhMM1xkglCJ99DvkLM/w0g10eOKQTljsk+9lvJ0TWrjXWyenB1Ma3kKell/VPGcWt8pGtRW8HF8iW+DLuQYoTyeprrWUBi9ydjfnYISoBH5pgtkg9/NvI1Cg+f0vLq5bx6Tvnq60xw67Akc4C7DXkX1XWaTvAR7e+kf8GKrkbZ0jZ6M1PmcJMbMAUUd/eeXRN8yJ7niXTozNy3A9iMqTO+vzUh6own3F6q/kQqLA/N6Y+rFY9itTY4DLRIyT1cJnLBjmacuicdcDTCw3eRo1eqymyaGrWSBVByigRban9qGSNSHTqwVC7GNNwQ8be9l2o8/6f40Tp1sKQhAYb14sAxuAm8EoQ5zg8MuqK1klXI+mh87zkW/EasUWG7JvGbIfALqLdAvXcDU3aRjLShVj76dFpe53J1ICZHPAcK81KN56SCrAB6WI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(7696005)(478600001)(110136005)(54906003)(966005)(5660300002)(4326008)(66574015)(3480700007)(8936002)(316002)(8676002)(2906002)(71200400001)(52536014)(64756008)(66476007)(66946007)(66556008)(76116006)(66446008)(55016002)(9686003)(7116003)(83380400001)(33656002)(6506007)(26005)(86362001)(186003)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bmJWYzhWTHhIbG9kWmQ1dHhjeWQ2Q21Xd2duNnc4eHRiN1NWS015NHhXMzMz?=
 =?utf-8?B?eHNFVWxYbDlTZXg5TDBLUmxMUnZ3eE8rOG85dUdkeUNWY1Z1VXNpMFptUFox?=
 =?utf-8?B?MEhyc3lmRXVVcFErVVQ4Y0JlT1JWMWJGNE9VZmRNYkFZakJnZlYvVkpUMmhZ?=
 =?utf-8?B?SGtHOUljSHZONjQzR1pDQzBGSVAyZGVuQ25oMFlmTmxueW91bXpJNEpqS09N?=
 =?utf-8?B?aWFDSnJ5TTVrNWlKNXFVR25qRnNiUm96MDJGbzRwclBuT0YreFZwWGQ4aCtw?=
 =?utf-8?B?MTBSNDJ0Z0V6NTNzamRJRXd1Yk1FSVp6ZjRiTW91MUdPeWZpM1Y3WVVON1Fa?=
 =?utf-8?B?QUJ1aEplZ1AyNUZtcmxBV285VW9RcFgvdFVVM0hNV2pxcTN3N0REWVI3dVQ2?=
 =?utf-8?B?dDhvbC8vb0lFZjVHaXoyWUduTFE1d0ppSEpTWW9NdSsrcldad1JPekxudjRL?=
 =?utf-8?B?YklvSzZGUlpydndWUStLSnRTV28zOWpnckFnZ01KQXF4V3FCa2pscGZaNnVX?=
 =?utf-8?B?bStQNWVUY0dlSEMwaFVHN1JMM3V6VEwwSmdqZUxrUU9WcHpCTmlxRXNaUWNq?=
 =?utf-8?B?SEpYdlgyYW5NYnBuMHN3NFhQOGFseUp6L25GcGJIUTNOb3FUZTY0TkFyTVk2?=
 =?utf-8?B?S0h0Ykp4YUhnYjJ1T0kvQnZvRTAwSHk2Yk4rVGpvanZxd1piQ0VZZUQwOVJS?=
 =?utf-8?B?aGZnTTRhbVg3OEJXZFRBME5WQll4bEdTVi9jRUxxdHI1dGdOanhvZnR2aEh5?=
 =?utf-8?B?NEV2SFRxcDVSRFBxT25tWmllamhLSDlaelNDTmxzZzBoQVNObG04VG10cnJr?=
 =?utf-8?B?a3l0Ym1UbWREQlJNVjArZldJOE15eGxXYklxQmJTeDB1KytUcllpZi8xdmlJ?=
 =?utf-8?B?dzJ0SS9QU2V0WXR3c3lSbXNibTQ2SFo1V292TmdRWTdReXE0aVA2U2FEOEZB?=
 =?utf-8?B?MTIvS21RYUJzalcwSHFTUzNsWFdMRXF1Z0lvMmhZRnNmclBiYm9jVGg2bVJQ?=
 =?utf-8?B?WlVpNHg5RVV5QTduUWJEWjhmT29iUlFxSk9ERXNqaE5oamJHWEYzVGNYYWFy?=
 =?utf-8?B?N3NQei9wY2xXZENZelRPcjIwS08waVFKZGdTMUZXVnRySnAySzVPVmNRbWE4?=
 =?utf-8?B?clpUYm1Vbm9ZWTRIVDhDREZ6RFExYTNEeE5ieE96Vy9MWXQ5QW82SERuZVpl?=
 =?utf-8?B?d0FyN1cvYUZGZXQ0RjZkQjZXbm5Ec25aTzFUa1RYT09BNEFpcFlidDIrWi9p?=
 =?utf-8?B?Y0NWbUx0UE50VlI0R25XODBCZ0YvOVBKVTd1ZVRoSVY5Q2w5YUJCNmFWWGo1?=
 =?utf-8?B?WXVsWVIvTUZueWhNSVdOVGRFam9heGNSUldwNTg1c2ZpcHNGcmFOb0dQLzhh?=
 =?utf-8?B?bHphd1RsRXJueENHalgvai9IRVovNCs5R1RPT3VFOTZKVklHUHd5QTl5MjJh?=
 =?utf-8?B?QXJZdzkzTWpxQWRjaXo5MS85TWFTZDRkbW5VV3hZcE5aTVFzSVlqVFVRdDR4?=
 =?utf-8?B?SExzSllMQ0s5cjZoUVJIVjh1NzREeG5GTjUzNzU2SU5vUjJwdFA1OURxWFYw?=
 =?utf-8?B?YlNoMnh4R2JPMDdMTmMvY3BZMFlPTzBBb3F6QkhLUmxIcHRMQ2l2bEJrWFd5?=
 =?utf-8?B?amFxdTIwSjIrMEp0ZTRYMmFxcDBVZ00yTnlHeW01M1YyZmhCQ1hBVTFoSTFq?=
 =?utf-8?B?OW5FSUNQL1QwQWhxZ2VtR1RteGI3TmFXbEpKaTRZQklCYTJVbkxTN3hTUUk4?=
 =?utf-8?Q?XsyMPHgGCTSF0cdTc5c2N/aryqHbzLk6Xax3rQC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1b6272-ac75-4ab0-9593-08d8cd326916
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 19:39:26.7554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1vgz7bO43N6ZjZgoK6XKQpW2NAzKrFD1oRuG2zUIsyRBrT9o966J0jCvrNACgHcwwDHqrrZzwW77bRw80NqX9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6932
Received-SPF: pass client-ip=40.107.223.54; envelope-from=saipava@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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

SGkgQ2VkcmljLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEPDqWRy
aWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDIs
IDIwMjEgMzozNyBBTQ0KPiBUbzogU2FpIFBhdmFuIEJvZGR1IDxzYWlwYXZhQHhpbGlueC5jb20+
OyBFZGdhciBJZ2xlc2lhcyA8ZWRnYXJpQHhpbGlueC5jb20+Ow0KPiBKb2VsIFN0YW5sZXkgPGpv
ZWxAam1zLmlkLmF1PjsgQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4NCj4gQ2M6IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZzsgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0
Lm9yZz4NCj4gU3ViamVjdDogUmU6IGVNTUMgc3VwcG9ydA0KPiANCj4gT24gMi8xLzIxIDExOjAx
IFBNLCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToNCj4gPiBIZWxsbywNCj4gPg0KPiA+Pj4gRllJ
LCBhc3BlZWQgbWFjaGluZXMgc3VjY2Vzc2Z1bGx5IGJvb3Qgb24gdG9wIG9mIDE2RyBlbW1jIGRp
c2sgaW1hZ2VzLg0KPiA+Pj4gSSBtZXJnZWQgc29tZSBvZiB4aWxpbnggcGF0Y2hlcyBvbiB0b3Ag
b2YgdGhlIGFzcGVlZC02LjAgYnJhbmNoIHRvDQo+ID4+PiBpbXByb3ZlIHRoZSBtb2RlbCBjb21w
bGV0ZW5lc3MgYnV0IG9ubHkgdGhlIG9uZSBmaXhpbmcgcG93ZXJ1cCB3YXMNCj4gPj4+IHJlYWxs
eSBuZWNlc3NhcnkuDQo+ID4+Pg0KPiA+Pj4gVGhlIGluaXRpYWwgZGlmZnN0YXQgaXMgcmF0aGVy
IHNtYWxsLg0KPiA+Pj4NCj4gPj4+IMKgaHcvc2Qvc2QuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMTY4DQo+ID4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tDQo+ID4+Pg0KPiA+Pj4gV2UgY2FuIHN1cmVseSBmaW5kIGEgd2F5IHRvIG1lcmdl
IHN1cHBvcnQgaW4gbWFpbmxpbmUgd2l0aG91dA0KPiA+Pj4gY292ZXJpbmcgdGhlIHdob2xlIHNw
ZWNzLiBUaGUgRXh0ZW5kZWQgQ1NEIHJlZ2lzdGVyIHdvdWxkIGJlIHRoZSBiaWcNCj4gPj4+IHBh
cnQuDQo+ID4+DQo+ID4+ICovW1NhaSBQYXZhbiBCb2RkdV0gSeKAmW0gcmV2aXNpdGluZyBlTU1D
IG5vdywgbWFkZSBzb21lIHBhdGNoZXMgb24gdG9wDQo+ID4+IG9mIHByZXZpb3VzIHNlcmllcyBz
ZW50IGJ5IOKAnFZpbmNlbnQgUGFsYXRpbuKAnS4vKg0KPiA+Pg0KPiA+PiAqL1dvdWxkIHlvdSBs
aWtlIHRvIHNoYXJlIHlvdXIgY2hhbmdlcywgd2hpY2ggbWFkZSBhc3BlZWQgbWFjaGluZXMgdG8N
Cj4gPj4gd29yayA/LyoNCj4gPj4NCj4gPj4gKi9SZWdhcmRzLA0KPiA+PiBTYWkgUGF2YW4vKg0K
PiA+DQo+ID4gVGhlIHBhdGNoc2V0IGlzIGluIHRoZSBhc3BlZWQtNi4wIGJyYW5jaCA6DQo+ID4N
Cj4gPiAgICAgZGY5MWQwMTI2NzJjIEPDqWRyaWMgTGUgR29hdGVyIC0gaHcvYXJtL2FzcGVlZDog
TG9hZCBlTU1DIGZpcnN0IGJvb3QNCj4gYXJlYSBhcyBhIGJvb3Qgcm9tDQo+ID4gICAgIDI3Yjc1
YTdhZDMyMiBDw6lkcmljIExlIEdvYXRlciAtIGh3L2FybS9hc3BlZWQ6IEFkZCBlTU1DIHByb3Bl
cnR5DQo+ID4gICAgIDI4MzZjZjVhMTVhMSBKb2VsIFN0YW5sZXkgLSBody9hcm0vYXNwZWVkOiBT
ZXQgYm9vdCBkZXZpY2UgdG8gZW1tYw0KW1NhaSBQYXZhbiBCb2RkdV0gSSBzZWUgeW91IGd1eXMg
aGF2ZSBpbXBsZW1lbnRlZCB0aGUgYm9vdCBhcmVhIGFjY2VzcyBoZXJlLA0KSSB3YXMgYXNzdW1p
bmcsIHlvdXIgdXNlLWNhc2UganVzdCBuZWVkIHRvIGFjY2VzcyBkYXRhIGZyb20gYm9vdCBwYXJ0
aXRpb25zLg0KV2UgYXJlIG5vdCBpbXBsZW1lbnRpbmcgZU1NQyBib290IG9wZXJhdGlvbnMgb3Ig
QWx0ZXJuYXRpdmUgYm9vdG1vZGUgIHJpZ2h0ID8NCg0KQW5kIGFsc28gaXMgaXQgZ29vZCB0byBj
YWxjdWxhdGUgdGhlIGFkZHJlc3Mgb2Zmc2V0IG9uY2Ugd2hlbiBwYXJ0aXRpb24gYWNjZXNzIGJp
dHMgYXJlIHNldCwgcmF0aGVyIHRoYW4gZG9pbmcgaXQgZm9yIGV2ZXJ5IHJlYWQvd3JpdGUgPw0K
DQpSZWdhcmRzLA0KU2FpIFBhdmFuDQo+ID4gICAgIDQyYzlkNTdmNWNkMCBKb2VsIFN0YW5sZXkg
LSBzZDogbW1jOiBTdWJ0cmFjdCBib290YXJlYSBzaXplIGZyb20gYmxrDQo+ID4gICAgIDIxODMw
MTQwNjYwNyBKb2VsIFN0YW5sZXkgLSBzZDogbW1jOiBTdXBwb3J0IGJvb3QgYXJlYSBpbiBlbW1j
IGltYWdlDQo+ID4gICAgIGRmMDQ1MjkyM2I1NiBDw6lkcmljIExlIEdvYXRlciAtIHNkOiBtbWM6
IEFkZCBFeHRlbmRlZCBDU0QgcmVnaXN0ZXINCj4gZGVmaW5pdGlvbnMNCj4gPiAgICAgNDE2YzAy
YmJmZDMyIFNhaSBQYXZhbiBCb2RkdSAtIHNkOiBtbWM6IEFkZCBtbWMgc3dpdGNoIGZ1bmN0aW9u
DQo+IHN1cHBvcnQNCj4gPiAgICAgYTIyOGFlZjFhMjA5IFNhaSBQYXZhbiBCb2RkdSAtIHNkOiBt
bWM6IGFkZCBDTUQyMSB0dW5pbmcgc2VxdWVuY2UNCj4gPiAgICAgOWIxNzdkN2JhZjhlIFNhaSBQ
YXZhbiBCb2RkdSAtIHNkOiBtbWM6IFVwZGF0ZSBDTUQxIGRlZmluaXRpb24gZm9yDQo+IE1NQw0K
PiA+ICAgICA2Njc3ZTRlYjY4MTIgVmluY2VudCBQYWxhdGluIC0gc2Q6IGFkZCBlTU1DIHN1cHBv
cnQNCj4gDQo+IGhlcmUgOg0KPiANCj4gaHR0cHM6Ly9naXRodWIuY29tL2xlZ29hdGVyL3FlbXUv
Y29tbWl0cy9hc3BlZWQtNi4wDQo+IA0KPiBDLg0KDQo=

