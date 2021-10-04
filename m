Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134FD421521
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 19:25:34 +0200 (CEST)
Received: from localhost ([::1]:58018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXRiX-0001Pb-1S
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 13:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mXQIJ-0001FH-Lw; Mon, 04 Oct 2021 11:54:23 -0400
Received: from mail-co1nam11on2083.outbound.protection.outlook.com
 ([40.107.220.83]:53180 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mXQIE-00019w-4B; Mon, 04 Oct 2021 11:54:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgjQheGQmcw2IlilDtXxwUwwmkApnqpAH1ImO76pcjw6vLC/I0owCwsip07BNMCkOKctb9DhCVuXVG+l03qFOgSIenU5yG8ls/qxK1zwNVX2K3LCwoDDFhUATKQ2v/eArThHANCsn1icCcftDYMTSuznw/8ekOzl6+3Yirb1b7+JnCH02wzubdH0zLwDiEU/48lIb8GAtugFyO2CaxP3+rK0xf3F8onhX5GzML8dbGimwLf+EW/OF9YC8mkdu2fWmkj+sAc9PuqKDdeGAG5P3jzgvKRcDKW2W2n+gw/zIsbtPDKpd6eYSf03IqedNU8WfBbanWmt0n8MHQhJdbLVsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yd7rzeM7G4Y8aFV1P+/1MwhkfhEYbsceaj7yqWx8grs=;
 b=HXls/CsHv9/rHN4z9mB6OPWe/pm/4558qKQ+xBMeJIroym1b43vFaE4bQdZXSwgl6GD8BdcGxb/hdp2JJ0BT07XUIPt//QhAq/9xqVZJX1pCiuHXd4s2aGffYs67lZzlOyuf6gyxkXozmdCpD+e6J5iPUxlW+TPlOHT4pUs879Si6XU9/PInHQzyCF0V/Aet4Ogr1AG1CAyqCHzP80gAJHchJvJf88d/ERF5PmKuoYucdE1+3c5DsRh/WI//Kaz5v67TSk0qM5Kp3qh+VZbWcyj03E+K4rfWy+imQsg7YmWi7VlE786rAlwdIicl+c9mDsXSBpYN5TafCNkYcH4uNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yd7rzeM7G4Y8aFV1P+/1MwhkfhEYbsceaj7yqWx8grs=;
 b=E/eLGz8LMf56d+4Coez8u85r4K19PKSZl7yDst0vKqUSDPlu0V2AbbeRkCQX7DCvPru3XpOxyvP42xOwnaRDD3NF/DaHu94iYelGvTJfL8A9R8JdhT/kruCqIeVqcX2tucn0f08ZHvPMPxs2AqC61bn2Gtu60HPkGEeSXcvrCyA=
Received: from BYAPR02MB4038.namprd02.prod.outlook.com (2603:10b6:a02:fc::28)
 by SJ0PR02MB7632.namprd02.prod.outlook.com (2603:10b6:a03:321::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Mon, 4 Oct
 2021 15:54:13 +0000
Received: from BYAPR02MB4038.namprd02.prod.outlook.com
 ([fe80::90b3:8e6a:7d06:dcad]) by BYAPR02MB4038.namprd02.prod.outlook.com
 ([fe80::90b3:8e6a:7d06:dcad%3]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 15:54:13 +0000
From: Tong Ho <tongh@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v3 0/9] hw/nvram: hw/arm: Introduce Xilinx eFUSE and BBRAM
Thread-Topic: [PATCH v3 0/9] hw/nvram: hw/arm: Introduce Xilinx eFUSE and BBRAM
Thread-Index: AQHXt3g7C97p19NJBEq4q/XFlVrfh6vDAJ6Q
Date: Mon, 4 Oct 2021 15:54:12 +0000
Message-ID: <BYAPR02MB40381A62103A15406DB2132BCDAE9@BYAPR02MB4038.namprd02.prod.outlook.com>
References: <20210917052400.1249094-1-tong.ho@xilinx.com>
 <CAFEAcA9_nVnW3DnvomvytX8xH53KM24xfn5rCSywa3WWCwEZ4g@mail.gmail.com>
In-Reply-To: <CAFEAcA9_nVnW3DnvomvytX8xH53KM24xfn5rCSywa3WWCwEZ4g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=xilinx.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9d31e4b-6a0c-4dc7-aba8-08d9874f362a
x-ms-traffictypediagnostic: SJ0PR02MB7632:
x-microsoft-antispam-prvs: <SJ0PR02MB7632CCD4F6ABDC4BBCE689C8CDAE9@SJ0PR02MB7632.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h7ojeCvPHGk+iGTSDt8lcwvtZwGe8yfjuc+p3py3aGsxT/Ut6j1VJ83q+70gB845yU7tz/cCIQnPY3bfGnNl2YnCRlndEDLZ7MWqXkX47CXGvCwpVD1xFLT74DSozT2una/eL8hE4FED9Qi6g5O5xfRHUTG6k0+G0oHE99YPk0YJwlgw9W0vKaWNrBZG/HxcjQMK8vPp3UO0/ayCpYTgs6sz/SJ3ym3+0afArTMpZS7Zuq9MslgQMSy5hzQZLVrdQbDFCUoVtC6q//hcJzkAZucknvB3CBzlaCmYq/eLLfTlUVULQCS0tw7SZHowFfLkqjktgxfgi764AYFueVHjNn3jDMXyshrltvjFC2iJmRvOiKiii0pw36DPAH6NNJYr8QCRd6OtHaU7WbXv0smBmyewH1AVsIXyqjuI791ZHB3lN3JxO8C3qrWni6NvhxmmuZ6rosLLUkjVxgPIa62lJpcYm69Nf0RfGxP1i4Kgkk3nnNsr76QLuOv14bk6KxNj/WUog4qN1m0Hh1PjQ3HNyhYVwm9KnZoDlwfiC2Nk4Li+1AdzzxqQi57n2+sJAWjn3eVytgxJhsnjT8bJC/R4+u//0zZ3nM0sZvmLndAWFCUv8Di9rYhmoYRKC2nKsacW4ipC6A3/drlmrHSzlGvsyxhaOD4pV8nzXsTN2spnMW7Q/yYYVnyPmqklYmzLl1b2FaR4Vt04ZiGrFN6lxLPDbg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4038.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33656002)(66556008)(64756008)(83380400001)(66946007)(66476007)(53546011)(6506007)(8676002)(5660300002)(26005)(66446008)(52536014)(38070700005)(2906002)(6916009)(186003)(76116006)(54906003)(508600001)(4326008)(316002)(55016002)(38100700002)(44832011)(7696005)(71200400001)(9686003)(122000001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1VEOEtHdURVSDdZOTRsR3RLZGE0QjZYOWR0ZGNXNmFXaHEwQW5YZHlHZnVJ?=
 =?utf-8?B?VmtTa283R2FRc2Jra0I5NExBZEZJZ3YxdUl6dWFBV3NWRHFwVmorWjNFT3pI?=
 =?utf-8?B?ZkhHVUFwUmpZekpoaDFCeXUyL3VRM2ljaVdVcUVBeXhSZ2NIc0VVYWV0eUlC?=
 =?utf-8?B?KzZxTk1NMWtrZUp5b05QTWVYQXV6M0djVHM2QllNbEFIS05IbTlCV1g3Y01l?=
 =?utf-8?B?QjdIY3dQeEd4ZXliemtJdCtWcUpqRnFCenpLdUhZNnQ1YzA1UmxCVyt1Um1a?=
 =?utf-8?B?b24xOEtTeWtyQ3E3NklDMU91UkRyU0RDbzBUZFRESGY4YTE5c0hoa1hqNXlD?=
 =?utf-8?B?ME1lNlAvcCs2d2VKSFpuTW5vK01FeCs5bmJkWDBxRGRTVmFmdnJSMDJkeGM3?=
 =?utf-8?B?MXdYVFJSTDNFR1NLV3I4R0RhaU5ubnRuNmdobmd3azNMVWxzU2VZOWcrQUQ3?=
 =?utf-8?B?RlB3eUhIRjc2ak5kYVFyMWp4YnBFc3JrdTVXcHlMRzE1T01nVFZlWGJHam9R?=
 =?utf-8?B?L3lielk1SU1Tazg5MTZZWmc0SWlJbllFUGh3VVVrWXlMYmVLeXc3enpYZytG?=
 =?utf-8?B?dTNvTkFKRllPZGdxOHBIWlZteDlhNHRYMUNEOWNjRDVwZ3JDVWJHZEh5U2Zm?=
 =?utf-8?B?Z0pVa3c0TWlHTGZCRGFlTGhycHNjQnJhT1BudGR6TTRwQ2FjNGZxL3hNYUht?=
 =?utf-8?B?QVJWU1NubU03elFCN2Q1ZjFXWk1EZm5LalhseFJtbWdJbnQ3NXlwbTlJdlFp?=
 =?utf-8?B?aFBJRHhMOEJmcG12YU5sdHhXdXJLQ096N3lFVGptcjFFWnVyb2E0YU9xTFJQ?=
 =?utf-8?B?L3BXdnFBS2V2Y0U4YmoxU2plTTdlRmJta0I5NzNLVTZ4aldBbG1wbGpBT0lv?=
 =?utf-8?B?ZVM3ODZqcnhSZGc3QS92M25QL0lWL3U0eWZuOUxGK3duU1Y4d3lNVnNtbnpC?=
 =?utf-8?B?WkxTUjZHMG92VHJQT0NWSitCVWUyRDRQSHNKNExSdzRJdUJVT0RiZkxlYjg1?=
 =?utf-8?B?RlFkRUd5V2dOVjlGbDMrNCtzUWR1RlFQUVh4ekdCL0E4ekRQZkE1RVRqMFZ3?=
 =?utf-8?B?LzdFUmJUVDZRb1hHVHNwOFNHczFKeGYrTkYrbFdiTXlwL0ROVzlrM050VmlR?=
 =?utf-8?B?STNpUytWWHVlcFVXcmc4WHpKVGwyVFlibU92b0VEQ0dGWkpJMUZuNExocVBT?=
 =?utf-8?B?d002d3JmT1JMaW44Nk04UTlCb1lSRWxYc2hkRm8yVVE0d2t1OTF5YkpTWklS?=
 =?utf-8?B?WmtyQkIxZzh0S3pnbWdRRHc1cWdhSjAzR3lhVno5ZXR5OFd2UFljL1VrbmtH?=
 =?utf-8?B?RGtzb3FIUU1LVlVHby9GeVFMUkNuYlJXblNHTVQ2dHFMakxFcnZ2U2lkZVJ5?=
 =?utf-8?B?ZkI4Z0FHdS9Kb1hTd3Z3cUxvR2dPdmVINHhVcXB1RWRqYzR3WlBGczFUaVNn?=
 =?utf-8?B?V3duNTFVRWxPQk5QNFFyQU5wQURBNDRWU2NFQktKczlBSkE0eWFhTFBCUjBB?=
 =?utf-8?B?SjNWeVFOd2JESXZ2bWJzcHNPdkQzbisvQ0puVVZzYit5MFdRRjFEemJwa2JC?=
 =?utf-8?B?bUJWUU05a1JOYVJWaVdZSEhIeFlWR3YxMUd0TS9nN21ZM3FRRUROWHMzMnVs?=
 =?utf-8?B?cEFtSC83NmpBdUVDMnBPRWllc28vc1JXdHJzRmpFNG4xdXdGSm5kazFhS21j?=
 =?utf-8?B?Yi9jZ213NEtMU09sUzVKSWQ3UWxNVTNLZ25RY1pYWTA0ZDg3clhnMkN5a3Av?=
 =?utf-8?Q?XF4SoQQ+qfHAYFVj20=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4038.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d31e4b-6a0c-4dc7-aba8-08d9874f362a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 15:54:12.8679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CkYX/cM1/np77x6VM1BG12sPtulyJbTluiGPZPQh6QoBdcffrs56rxesTwTC0PtOPcxLbaGevcIlgT8qT3RO4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7632
Received-SPF: pass client-ip=40.107.220.83; envelope-from=tongh@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 04 Oct 2021 13:21:29 -0400
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUGV0ZXIsDQoNCkkgd2lsbCBmb2xsb3cgdXAgd2l0aCBwYXRjaGVzIHRvIGZpeCB0aGUgbWVt
b3J5IGxlYWtzLg0KDQpXaGVyZSBjYW4gSSBnZXQgYSBjb3B5IG9mIHRoZSBDb3Zlcml0eSByZXBv
cnRzIHRoYXQgaGF2ZSB0aGUgMTAgaXNzdWVzIHlvdSBpbmRpY2F0ZWQ/DQoNClRoYW5rcywNClRv
bmcNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBldGVyIE1heWRlbGwgPHBl
dGVyLm1heWRlbGxAbGluYXJvLm9yZz4gDQpTZW50OiBTYXR1cmRheSwgT2N0b2JlciAyLCAyMDIx
IDM6MjggQU0NClRvOiBUb25nIEhvIDx0b25naEB4aWxpbnguY29tPg0KQ2M6IHFlbXUtYXJtIDxx
ZW11LWFybUBub25nbnUub3JnPjsgUUVNVSBEZXZlbG9wZXJzIDxxZW11LWRldmVsQG5vbmdudS5v
cmc+OyBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpckBhbGlzdGFpcjIzLm1lPjsgRWRnYXIgRS4g
SWdsZXNpYXMgPGVkZ2FyLmlnbGVzaWFzQGdtYWlsLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0gg
djMgMC85XSBody9udnJhbTogaHcvYXJtOiBJbnRyb2R1Y2UgWGlsaW54IGVGVVNFIGFuZCBCQlJB
TQ0KDQpPbiBGcmksIDE3IFNlcHQgMjAyMSBhdCAwNjoyNCwgVG9uZyBIbyA8dG9uZy5ob0B4aWxp
bnguY29tPiB3cm90ZToNCj4NCj4gVGhpcyBzZXJpZXMgaW1wbGVtZW50cyB0aGUgWGlsaW54IGVG
VVNFIGFuZCBCQlJBTSBkZXZpY2VzIGZvciB0aGUgDQo+IFZlcnNhbCBhbmQgWnlucU1QIHByb2R1
Y3QgZmFtaWxpZXMuDQo+DQo+IEZ1cnRoZXJtb3JlLCBib3RoIG5ldyBkZXZpY2VzIGFyZSBjb25u
ZWN0ZWQgdG8gdGhlIHhsbngtdmVyc2FsLXZpcnQgDQo+IGJvYXJkIGFuZCB0aGUgeGxueC16Y3Ux
MDIgYm9hcmQuDQo+DQo+IFNlZSBjaGFuZ2VzIGluIGRvY3Mvc3lzdGVtL2FybS94bG54LXZlcnNh
bC12aXJ0LnJzdCBmb3IgZGV0YWlsLg0KDQpIaSAtLSBub3cgdGhpcyBoYXMgbGFuZGVkIHVwc3Ry
ZWFtLCBDb3Zlcml0eSBwb2ludHMgb3V0IGEgbG90IG9mIG1lbW9yeSBsZWFrcyBvbiBlcnJvciBv
ciBsb2dnaW5nIHBhdGhzLCB3aGVyZSB0aGUgY29kZSBkb2VzIHRoaW5ncyBsaWtlOg0KDQoqKiog
Q0lEIDE0NjQwNzE6ICBSZXNvdXJjZSBsZWFrcyAgKFJFU09VUkNFX0xFQUspDQovcWVtdS9ody9u
dnJhbS94bG54LXZlcnNhbC1lZnVzZS1jdHJsLmM6IDYyOCBpbiBlZnVzZV9jdHJsX3JlZ193cml0
ZSgpDQo2MjIgICAgICAgICBkZXYgPSByZWdfYXJyYXktPm1lbS5vd25lcjsNCjYyMyAgICAgICAg
IGFzc2VydChkZXYpOw0KNjI0DQo2MjUgICAgICAgICBzID0gWExOWF9WRVJTQUxfRUZVU0VfQ1RS
TChkZXYpOw0KNjI2DQo2MjcgICAgICAgICBpZiAoYWRkciAhPSBBX1dSX0xPQ0sgJiYgcy0+cmVn
c1tSX1dSX0xPQ0tdKSB7DQo+Pj4gICAgIENJRCAxNDY0MDcxOiAgUmVzb3VyY2UgbGVha3MgIChS
RVNPVVJDRV9MRUFLKQ0KPj4+ICAgICBGYWlsaW5nIHRvIHNhdmUgb3IgZnJlZSBzdG9yYWdlIGFs
bG9jYXRlZCBieSAib2JqZWN0X2dldF9jYW5vbmljYWxfcGF0aCgoT2JqZWN0ICopcykiIGxlYWtz
IGl0Lg0KNjI4ICAgICAgICAgICAgIHFlbXVfbG9nX21hc2soTE9HX0dVRVNUX0VSUk9SLA0KNjI5
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIiVzW3JlZ18weCUwMmx4XTogQXR0ZW1wdCB0byB3
cml0ZQ0KbG9ja2VkIHJlZ2lzdGVyLlxuIiwNCjYzMCAgICAgICAgICAgICAgICAgICAgICAgICAg
IG9iamVjdF9nZXRfY2Fub25pY2FsX3BhdGgoT0JKRUNUKHMpKSwgKGxvbmcpYWRkcik7DQo2MzEg
ICAgICAgICB9IGVsc2Ugew0KNjMyICAgICAgICAgICAgIHJlZ2lzdGVyX3dyaXRlX21lbW9yeShv
cGFxdWUsIGFkZHIsIGRhdGEsIHNpemUpOw0KNjMzICAgICAgICAgfQ0KDQpZb3UgbmVlZCB0byBm
cmVlIHRoZSBtZW1vcnkgaGVyZS4gQSBnb29kIHBhdHRlcm4gaXMgaG93IGl0J3MgZG9uZSBpbiB4
bG54LXp5bnFtcC1jYW4uYyB3aXRoIGdfYXV0b2ZyZWU6DQoNCiAgICBpZiAoQVJSQVlfRklFTERf
RVgzMihzLT5yZWdzLCBTT0ZUV0FSRV9SRVNFVF9SRUdJU1RFUiwgU1JTVCkpIHsNCiAgICAgICAg
Z19hdXRvZnJlZSBjaGFyICpwYXRoID0gb2JqZWN0X2dldF9jYW5vbmljYWxfcGF0aChPQkpFQ1Qo
cykpOw0KDQogICAgICAgIHFlbXVfbG9nX21hc2soTE9HX0dVRVNUX0VSUk9SLCAiJXM6IEF0dGVt
cHRpbmcgdG8gdHJhbnNmZXIgZGF0YSB3aGlsZSINCiAgICAgICAgICAgICAgICAgICAgICAiIGRh
dGEgd2hpbGUgY29udHJvbGxlciBpcyBpbiByZXNldCBtb2RlLlxuIiwNCiAgICAgICAgICAgICAg
ICAgICAgICBwYXRoKTsNCiAgICAgICAgcmV0dXJuIGZhbHNlOw0KICAgIH0NCg0KQ291bGQgc29t
ZWJvZHkgc2VuZCBzb21lIGZvbGxvd3VwIHBhdGNoZXMgdGhhdCBmaXggYWxsIG9mIHRoZXNlLCBw
bGVhc2U/IChUaGVyZSBhcmUgMTAgY292ZXJpdHkgaXNzdWVzLCBjb3ZlcmluZyBwcm9iYWJseSBh
bGwgb2YgdGhlIHBsYWNlcyB3aGVyZSBvYmplY3RfZ2V0X2Nhbm9uaWNhbF9wYXRoKCkgaXMgdXNl
ZCBpbiB0aGlzIHNlcmllcy4pDQoNCnRoYW5rcw0KLS0gUE1NDQo=

