Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCB9321CE3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:28:27 +0100 (CET)
Received: from localhost ([::1]:34564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEE4Q-0002EU-OQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lEDuU-0001dk-KA; Mon, 22 Feb 2021 11:18:10 -0500
Received: from mail-co1nam11on2049.outbound.protection.outlook.com
 ([40.107.220.49]:27872 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lEDuO-0003b4-Of; Mon, 22 Feb 2021 11:18:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsL2lAH8PU6vSjBURnoS53Ms3b4jWFBrXW4fAP0oWfr2yKzKgynr4/Cearu++/gBnVf1U79ESkUgsO5/a22H0ncZ+mDwiVkG+l+FnjCA4sogIveThPLc5UWmDRBF8Z5vNV6nFAo46GovFrmHRtUgmC9S2G5ujt7w3Itgb+Sfea1dnG4QwYMmcMfgBpf7E72m7tPZcEp4+QTlAv4Sx6HVP2HlvVo6BQH71UeADWoDq/EJXxUtEgzWM176T8eijss46mFJX+0DetcayeuWlKu2puGul/RkEl3fyy02Svv3jGozPbVWUmw+pgF+uQRO8zPoaBq4aVEJswHrYZFQeddLwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73uznGeRDRVktXPk+o+dg4zqXkg1Kfum1xjxBBMf+Ec=;
 b=U/R/maU7tS2xJwFp7W4jpvgPVmDNZ09C8ag6IRhi5zSYpgyT/DKkmLgq4mOJ701q+5inu/3Y66lV5g5gXBbiSspdfNlpVqnvHIk+6eu9a9eJ9S+VOHoa9QDYhLRKwdBgCUbMXcQcfJX7fXonGOqPpdQH2sITVCOu4VAXqaPExTYsWlzFlpFazoHc/N4foPRLnRLPmvsMaRoCnXLdbHe/7QusAJ4RKtoKCv86Us/J6DBodJJl7TAB9uWTQitRkhOtZUa2gxglxUTACuT0DpmmDKvrRcyGrWNr40kjgVrUsdPsOI1P9GyTvYO4hLXnZVhY97q7+6CMzssXwPntvpyHqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73uznGeRDRVktXPk+o+dg4zqXkg1Kfum1xjxBBMf+Ec=;
 b=j3mnbOE6yIjVLZaijt7fG7Y6NlHgm3kVo6+VZFqCrnj6st1tssYvw3ux0ApfEvelP6hI4Y8n1d3h3yomUK7+QgQpXvUQXielsVjwZXPydqyYJH/bGl3E7kmZbWZG9s0d/ALuHDYKb9/agLz7TOO+djSTg5qk4SYG7scOlDwxE7w=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by SJ0PR02MB7744.namprd02.prod.outlook.com (2603:10b6:a03:31b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.36; Mon, 22 Feb
 2021 16:17:49 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf%5]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 16:17:49 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Markus Armbruster
 <armbru@redhat.com>
Subject: RE: [PATCH v2 01/22] block: add eMMC block device type
Thread-Topic: [PATCH v2 01/22] block: add eMMC block device type
Thread-Index: AQHXCPMCc9P7MYpy7UqlbMux6TiW26pkE7eAgAAEaTyAAA/lAIAAAfmAgAAuooA=
Date: Mon, 22 Feb 2021 16:17:49 +0000
Message-ID: <BY5PR02MB677285E7350538C7A1ACB690CA819@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613982039-13861-2-git-send-email-sai.pavan.boddu@xilinx.com>
 <3c229241-fdc5-a445-d96e-ca16a5c0106b@redhat.com>
 <87ft1opa5k.fsf@dusky.pond.sub.org> <YDOuutVPzV2UNGjY@work-vm>
 <e6b25650-93d0-c550-5788-0478c6ad95b3@redhat.com>
In-Reply-To: <e6b25650-93d0-c550-5788-0478c6ad95b3@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [49.205.235.123]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fc7cc909-2fb8-42fe-6165-08d8d74d65dd
x-ms-traffictypediagnostic: SJ0PR02MB7744:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB77449B1192DB2FEB17080D04CA819@SJ0PR02MB7744.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zNA1HJr/b9tLghAMhaN4RCoEfiKQB7OXjYOmzmpyrJm3In5+0MBnkYf4/Lk5vsJdS0kbxgEmZRharJJuhbg3QWoddWmJozlY2BY7HEfyg2xaH5uTn+8obzTRLnq10biWJCUXsHu4Mty4LT9ZmTCrHZapFGajgxPSPWNpHuBYwC1fKbg31JT4UUu78S0EBN4n9ZpZkp8wJvC6a06ttTKbFPtGoobZWcQgkBB7+Z/TddlO6bx4rOho/YVZOgx2lBOedUBNYGrFA2bo5oCeIlhf00bUPWy49JtUZ0jElre2t0aCGTEUUs51QJ4+W46yxZTVFVdTOo3Sxdsv+ZVdX51w+MsfcBsrKigJvKJO/7K+l0Vep3oWeHnVCs4H0Z/BOtxOcJ2yPB8XzKs+qtxk40GwhgO0+TifMnR3hWVgfhGM94KeBX7eSNjVOfvHtdECDz9ENoPihQ+lOzNd3NqO1a2l0JQgAx349aH0i5j4gwcPdXB6m0rdLw1gdYsXn7C4LDFHUHu4/AkgSRw9Vp65x1lGlA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(6506007)(2906002)(64756008)(110136005)(66556008)(186003)(33656002)(8676002)(8936002)(54906003)(53546011)(66446008)(83380400001)(7416002)(9686003)(76116006)(478600001)(66946007)(4326008)(71200400001)(7696005)(5660300002)(66476007)(86362001)(52536014)(26005)(55016002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UXVVdzl1bk04dnJvVmozUHErZ3ZNekxnR2YrU1VTaGhKYTgxRnFtbzlmTjNw?=
 =?utf-8?B?dW15cHpUS2ZVY2dhdkQyNHJ5c1NqZFU0UFN1SUFjLzN2ejNqZFRURXFSYW5Q?=
 =?utf-8?B?M2cxdkZPU1l1M092LzFWTGgxMEtTSFVockE1VlloT3VCRlpIZU9zemtNbGdW?=
 =?utf-8?B?VDlMbzNXdUdWdDc1d0UrVkp6QVAvRytlM2RpbmR4dm83cGVma2tvaGZndTRN?=
 =?utf-8?B?RWQwMGNjOExrVDg3RGRnNllCbWZ2djkzQXJFT0VXK1AwK0xPR0UrN3I1ZWNz?=
 =?utf-8?B?bnZOdWN2Ry84U3pzWVZyVGZ4d3lXV1ZDMWtWMmlQNEIwY1h6a1ArY2xyYUhR?=
 =?utf-8?B?S2E1WWt4blpTUjd3aFlnUnBzQSt1YnlwQU9pa3hmK2w1VGFILy9sWSt1SUVm?=
 =?utf-8?B?dEZRQnlDRVpSK05nT1NjWk1temw3a2hILzMyY1Fzelg4UE5rSVd2emVhQVZ1?=
 =?utf-8?B?eHowZjduRE40S2I5QWEwdHpMWUo2Tzd1TmVBUXBLWllLWG5pV1hoSC9GL1Vn?=
 =?utf-8?B?cGNtVzdpTWlmOWtrcnRIRzczcmppTVZ5WlRjbks3bkJPWjA1VVoyeU1LMWVT?=
 =?utf-8?B?U0xsdC92QmpXVGxoUHVvVGZIMDJqOFZ0dVFIcUZnZ2EwaUFTaU1rTjFxejEx?=
 =?utf-8?B?KzdTakU3Y3p2RzlGT2pmZkNWcUNqMW9ib2hoZ2FuMU41MHE2Ym1YSzZjZnpk?=
 =?utf-8?B?a1UvRkV5bmljc3hMWVZja3VTSjFWTEoyT21IOWVqcEY3RU1ZZWpSYndKZWph?=
 =?utf-8?B?OWhUNVFrRzlQSDJpRTNTbTNsUmdFdXpDN3dHUjBHVUVONVNZcTlKYzVPZ0ll?=
 =?utf-8?B?VUZsQVJRTnhnVmF2ZEd5MFdmNlBLeWl0VHB1V1F6dmRsK1ZSS0hYWmw0eUEr?=
 =?utf-8?B?bkNZZDNpL21QOVc0UXRCWUtPY09mcjhQcmlFK2NsUXh5NFhFNVhUeEsvYkE4?=
 =?utf-8?B?Zm1qcENRQWZxSHpUMnZwdWh2V0pNY1orNVQwNGJhTVlkUHVOZXJuYTBJK2tU?=
 =?utf-8?B?YlN6RUYrSThXaklteDY0UWRsMisrUVViNFVBRWNqcXJ1R3Mxd1ZtcDBNZy9R?=
 =?utf-8?B?N0ErSmI4VkdkK2NGM1EzVlF3aW9LKzc1eWdBM25zSUdlbEZIVlBOVnpoRHhu?=
 =?utf-8?B?b2x3STE2b25QaFdaMFphRzFJZFZTcEl4NVRaZnlkbVdLelA5NU9hTzREeXJV?=
 =?utf-8?B?b3owaUxpSEpST1VJYVZpY0RPdFhlWENKL2JqWUF2WjlFQ0hwbk0wbkM5RGJH?=
 =?utf-8?B?VUpFSVEwN0ovc1NXL01aeFBNVkZsSTdCWmZJMzNpeFdwYVVxWWNSYnJjTkhP?=
 =?utf-8?B?aTJycE9DU1dCaGpXRnFBaEtQNnZpeFluMW5sbHMvWnNDZ01QQXZSUGsyZklX?=
 =?utf-8?B?RkFYVmlORXRLTnVvM0NHZzNlUklrNWpoTWVEM3V1WXpEM2ZnQVpZMVBpbkZM?=
 =?utf-8?B?ck9OSGtCYzNRT05FcVdpTnhvSGE3d0crMnpXRDNFSDlJVUZQZkdETEtZNkJF?=
 =?utf-8?B?N0laR2JVR3dzUSswcFJHeUw3SDNTT1lRNzU2N2VIbnFKTWppeVJDSTdza1I4?=
 =?utf-8?B?K2t3eHlLbnZ1UFZ4TXhNSStMT1kyOGF0R1NlOFJwei9iWVA5R2hBcGJXNlZk?=
 =?utf-8?B?V3o0SjNFUG5UaHZtdmZhSmFZN2dBSE4xaWsrUmd4d3lZMWwwb2p0aEhUNXFu?=
 =?utf-8?B?Y2JVNzM0Tm9CSHZFL0IvUXQyR3I2WlJZdEZXRUJEVkF5NHZBQUdjNkpWRHgr?=
 =?utf-8?Q?/bj3ccUPx90v17y3d3i2X77ASpyUv2baP7WpR4V?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7cc909-2fb8-42fe-6165-08d8d74d65dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2021 16:17:49.2623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NFQMglEyDkA0rSgwfVvg+AfEYeB7Fpkcguel1X6yeT1jB/LNOYhYJCTDv/4OI1k5lhxv9Rc5x1+EzPkDilOJow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7744
Received-SPF: pass client-ip=40.107.220.49; envelope-from=saipava@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUGhpbGlwcGUsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPg0KPiBTZW50OiBNb25kYXks
IEZlYnJ1YXJ5IDIyLCAyMDIxIDY6NTQgUE0NCj4gVG86IERyLiBEYXZpZCBBbGFuIEdpbGJlcnQg
PGRnaWxiZXJ0QHJlZGhhdC5jb20+OyBNYXJrdXMgQXJtYnJ1c3Rlcg0KPiA8YXJtYnJ1QHJlZGhh
dC5jb20+DQo+IENjOiBTYWkgUGF2YW4gQm9kZHUgPHNhaXBhdmFAeGlsaW54LmNvbT47IEtldmlu
IFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+Ow0KPiBNYXggUmVpdHogPG1yZWl0ekByZWRoYXQuY29t
PjsgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeQ0KPiA8dnNlbWVudHNvdkB2aXJ0dW96em8u
Y29tPjsgRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+OyBKb2VsIFN0YW5sZXkNCj4gPGpv
ZWxAam1zLmlkLmF1PjsgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz47IFZpbmNlbnQg
UGFsYXRpbg0KPiA8dnBhbGF0aW5AY2hyb21pdW0ub3JnPjsgVGhvbWFzIEh1dGggPHRodXRoQHJl
ZGhhdC5jb20+OyBTdGVmYW4NCj4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+OyBQZXRl
ciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+Ow0KPiBBbGlzdGFpciBGcmFuY2lz
IDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+OyBFZGdhciBJZ2xlc2lhcyA8ZWRnYXJpQHhpbGlu
eC5jb20+Ow0KPiBMdWMgTWljaGVsIDxsdWMubWljaGVsQGdyZWVuc29jcy5jb20+OyBQYW9sbyBC
b256aW5pDQo+IDxwYm9uemluaUByZWRoYXQuY29tPjsgU2FpIFBhdmFuIEJvZGR1IDxzYWlwYXZh
QHhpbGlueC5jb20+OyBxZW11LQ0KPiBkZXZlbEBub25nbnUub3JnOyBxZW11LWJsb2NrQG5vbmdu
dS5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwMS8yMl0gYmxvY2s6IGFkZCBlTU1DIGJs
b2NrIGRldmljZSB0eXBlDQo+IA0KPiBPbiAyLzIyLzIxIDI6MTYgUE0sIERyLiBEYXZpZCBBbGFu
IEdpbGJlcnQgd3JvdGU6DQo+ID4gKiBNYXJrdXMgQXJtYnJ1c3RlciAoYXJtYnJ1QHJlZGhhdC5j
b20pIHdyb3RlOg0KPiA+PiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5j
b20+IHdyaXRlczoNCj4gPj4NCj4gPj4+IE9uIDIvMjIvMjEgOToyMCBBTSwgU2FpIFBhdmFuIEJv
ZGR1IHdyb3RlOg0KPiA+Pj4+IEZyb206IFZpbmNlbnQgUGFsYXRpbiA8dnBhbGF0aW5AY2hyb21p
dW0ub3JnPg0KPiA+Pj4+DQo+ID4+Pj4gQWRkIG5ldyBibG9jayBkZXZpY2UgdHlwZS4NCj4gPj4+
Pg0KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgUGFsYXRpbiA8dnBhbGF0aW5AY2hyb21p
dW0ub3JnPg0KPiA+Pj4+IFtTUEI6IFJlYmFzZWQgb3ZlciA1LjEgdmVyc2lvbl0NCj4gPj4+PiBT
aWduZWQtb2ZmLWJ5OiBTYWkgUGF2YW4gQm9kZHUgPHNhaS5wYXZhbi5ib2RkdUB4aWxpbnguY29t
Pg0KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQo+
ID4+Pj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4NCj4g
Pj4+PiBSZXZpZXdlZC1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMu
Y29tPg0KPiA+Pj4+IC0tLQ0KPiA+Pj4+ICBpbmNsdWRlL3N5c2VtdS9ibG9ja2Rldi5oIHwgMSAr
DQo+ID4+Pj4gIGJsb2NrZGV2LmMgICAgICAgICAgICAgICAgfCAxICsNCj4gPj4+PiAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPj4+Pg0KPiA+Pj4+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3N5c2VtdS9ibG9ja2Rldi5oIGIvaW5jbHVkZS9zeXNlbXUvYmxvY2tkZXYuaA0KPiA+
Pj4+IGluZGV4IDNiNWZjZGEuLmVlZmFlOWYgMTAwNjQ0DQo+ID4+Pj4gLS0tIGEvaW5jbHVkZS9z
eXNlbXUvYmxvY2tkZXYuaA0KPiA+Pj4+ICsrKyBiL2luY2x1ZGUvc3lzZW11L2Jsb2NrZGV2LmgN
Cj4gPj4+PiBAQCAtMjQsNiArMjQsNyBAQCB0eXBlZGVmIGVudW0gew0KPiA+Pj4+ICAgICAgICov
DQo+ID4+Pj4gICAgICBJRl9OT05FID0gMCwNCj4gPj4+PiAgICAgIElGX0lERSwgSUZfU0NTSSwg
SUZfRkxPUFBZLCBJRl9QRkxBU0gsIElGX01URCwgSUZfU0QsDQo+ID4+Pj4gSUZfVklSVElPLCBJ
Rl9YRU4sDQo+ID4+Pj4gKyAgICBJRl9FTU1DLA0KPiA+Pj4+ICAgICAgSUZfQ09VTlQNCj4gPj4+
PiAgfSBCbG9ja0ludGVyZmFjZVR5cGU7DQo+ID4+Pj4NCj4gPj4+PiBkaWZmIC0tZ2l0IGEvYmxv
Y2tkZXYuYyBiL2Jsb2NrZGV2LmMgaW5kZXggY2Q0MzhlNi4uMzkwZDQzYyAxMDA2NDQNCj4gPj4+
PiAtLS0gYS9ibG9ja2Rldi5jDQo+ID4+Pj4gKysrIGIvYmxvY2tkZXYuYw0KPiA+Pj4+IEBAIC04
Myw2ICs4Myw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICpjb25zdCBpZl9uYW1lW0lGX0NPVU5UXSA9
IHsNCj4gPj4+PiAgICAgIFtJRl9TRF0gPSAic2QiLA0KPiA+Pj4+ICAgICAgW0lGX1ZJUlRJT10g
PSAidmlydGlvIiwNCj4gPj4+PiAgICAgIFtJRl9YRU5dID0gInhlbiIsDQo+ID4+Pj4gKyAgICBb
SUZfRU1NQ10gPSAiZW1tYyIsDQo+ID4+Pj4gIH07DQo+ID4+Pg0KPiA+Pj4gV2UgZG9uJ3QgbmVl
ZCB0byBpbnRyb2R1Y2Ugc3VwcG9ydCBmb3IgdGhlIGxlZ2FjeSAtZHJpdmUgbWFnaWMuDQo+ID4+
Pg0KPiA+Pj4gLWRldmljZSBzaG91bGQgYmUgZW5vdWdoIGZvciB0aGlzIGRldmljZSwgcmlnaHQ/
DQo+ID4+DQo+ID4+IEV4dGVybmFsIGludGVyZmFjZSBleHRlbnNpb25zIG5lZWQgcmF0aW9uYWxl
OiB3aHkgZG8gd2Ugd2FudCAvIG5lZWQgaXQ/DQo+ID4+IFRoZSBjb21taXQgbWVzc2FnZSBuZWds
ZWN0cyB0byBwcm92aWRlIG9uZS4NCj4gPj4NCj4gPj4gRXZlbiBtb3JlIHNvIHdoZW4gdGhlIGlu
dGVyZmFjZSBpbiBxdWVzdGlvbiBpcyBpbiBhIHN0YXRlIGxpa2UgLWRyaXZlDQo+ID4+IGlzLg0K
PiA+DQo+ID4gSSB3b3VsZG4ndCBiZSB0b28gbmFzdHkgYWJvdXQgLWRyaXZlOyAgZm9yIG1lIEkg
c3RpbGwgZmluZCBpdCB0aGUNCj4gPiBlYXNpZXN0IHdheSB0byBzdGFydCBhIFZNLg0KPiANCj4g
QnV0IGVNTUMgaXNuJ3QgYSBidXMgd2hlcmUgeW91IGNhbiBwbHVnIGRyaXZlcywgaXQgaXMgc29s
ZGVyZWQgb24tYm9hcmQgYW5kIGlzDQo+IG1taW8gbWFwcGVkIHRvIGEgZml4ZWQgYWRkcmVzcy4g
SSBkb24ndCBzZWUgdGhlIHBvaW50IG9mIGhhdmluZyBhIGRyaXZlDQo+IGludGVyZmFjZSBmb3Ig
aXQuLi4NCltTYWkgUGF2YW4gQm9kZHVdIFllYWgsIHRoaXMgbWFrZXMgc2Vuc2UgYnV0IGhhdmlu
ZyBhIGRyaXZlIHdvdWxkIGJlIGEgc2ltcGxlIGltcGxlbWVudGF0aW9uIHdpdGhvdXQgZGlzdHVy
YmluZyBtdWNoIGluIHRoZSBzZCBjYXJkIGVtdWxhdGlvbiBjb2RlLiBBbmQgaXRzIGp1c3QgZWFz
eSB0byB1c2UsIGp1c3QgYXMgaG93IHNkIGNhcmRzIGFyZSBpbnNlcnRlZC4NCg0KSSBuZWVkIHRv
IHNlZSwgaG93IGVhc3kgaXQgd291bGQgYmUgd2l0aCAtZGV2aWNlLg0KDQpUaGFua3MsDQpTYWkg
UGF2YW4NCg0K

