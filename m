Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58153321386
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 10:57:54 +0100 (CET)
Received: from localhost ([::1]:50698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE7yT-0000W4-Ez
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 04:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE7wb-00085g-I9; Mon, 22 Feb 2021 04:55:57 -0500
Received: from mail-dm6nam12on2070.outbound.protection.outlook.com
 ([40.107.243.70]:39264 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE7wY-0004ig-Pw; Mon, 22 Feb 2021 04:55:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1Jrc7OnvrhJc/f6kl7+D/LndEYEKJZQ5eSL2gBHeZqx3lsOopmZtEgFYZrFHIexNcw5z32x2Hody4LP/6GK+ZXp+g4SdlnbI18OTRCg55HPOza1c72zkFMG3RbaK+GN7Pr9BDg3i94UCnHX9EvSCZCOId3fSpORCZeaE9mrSknHLsv1zjLCpgYdKDgghgKcvNwkd7ckWPegf3VALdwfI2+iBsfkg/QDen86NKOn+6BKOn8W28I+pzRivvzbwvls/O2J+w8Z4lD78SGBIxNe19THpKrPOLeHBHP7YTLYWDZpDnxm3aGw3hBS0F6PeZ4fgUA5l2VnXi2uTbGFcQQZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igtOM3GZXATtbBtdANN1KFqC/XGDlvMbuS/eQhMpox4=;
 b=Il4/Ot+ajKhv4+TBhcvh5jTSK/Il7GtidYcWEAF1tndfpUAjZeSmu0rjqAB6af4Zw6lZRS+aXJ7K0HA09F2fZFcfD1KqWOss1/6NsFxEgDOBU/OEyyrUGSsgaH8Qsbsn5n0SxqPLyYtwvqIp7MUWJbgvQFdkljCVgXL21g5mM68rdru1tv7xLjAKHsSwMQuH5FBjBcfpAnzVKhH3YeJQHfNIwl21BMcbZqqk10PaJ2+5bOvmg0WY91+ZoD7TgBuGQdjEora354YzUDkPP5vuXVzCZ2/D/GNJzXvVA9ZsbU6ueEGFWeJI6AnxtYZ593xXAZ6Rv11pGoIPaN6PcN4LeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igtOM3GZXATtbBtdANN1KFqC/XGDlvMbuS/eQhMpox4=;
 b=UlGbMQBLpXD9cNHJNjhQhEJy9TBuwaUgWeHb9D4ugoV1IDru2/hHGId4MiqmGZF+TSQF0zJPWwg68ecby/qMokmOwxy3PPyPvyw33C33yNCMqenlclNkVOgmNXeMzUWL1fjPqNlDpoW/lrm6Z0ySNXAnhNeVC+1xuYUVPgRzElM=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BYAPR02MB5974.namprd02.prod.outlook.com (2603:10b6:a03:125::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Mon, 22 Feb
 2021 09:55:51 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf%5]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 09:55:51 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Markus Armbruster
 <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, 
 Eric Blake <eblake@redhat.com>, Joel Stanley <joel@jms.id.au>, Vincent
 Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Alistair
 Francis <alistair.francis@wdc.com>, Edgar Iglesias <edgari@xilinx.com>, Luc
 Michel <luc.michel@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: RE: [PATCH v2 04/22] sd: emmc: update OCR fields for eMMC
Thread-Topic: [PATCH v2 04/22] sd: emmc: update OCR fields for eMMC
Thread-Index: AQHXCPL33zBUwdT030SltW3OkTwyOqpj7s0AgAAAdQA=
Date: Mon, 22 Feb 2021 09:55:51 +0000
Message-ID: <BY5PR02MB6772C9D63BF057B28E981EEDCA819@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613982039-13861-5-git-send-email-sai.pavan.boddu@xilinx.com>
 <ccaf04a2-0eb7-69fa-5431-3c5401d267a4@kaod.org>
In-Reply-To: <ccaf04a2-0eb7-69fa-5431-3c5401d267a4@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [49.205.235.123]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 87faef7d-3cfb-414b-f5dc-08d8d7180982
x-ms-traffictypediagnostic: BYAPR02MB5974:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB597464AC734465530A56686DCA819@BYAPR02MB5974.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r9RMkENiG6uyKroMU1UcNodbONlsyy4EbaFuXJIj58O2uwVtuMPydPhQ5f7atTibdIm7hAAmxSC110gAxLh9VBzpqwZa8fda5aU4g1Zw4iEbLdbIcY/61MD8ZUhHacyIfrCtj82QIvXcg/CXN1E4a68059Ric/dZvy8ycRWIVMXbmQJ1T/sVk6UeGe9PouOTM/eqWBg6U/MPnv9U3S+ogeH1XGp6SW0lnov/HGhy7KxZJkp+CeJJDVD/AwNWsjLw2XyU4qFcjjrEOHw1Cuktam+cfHRWLBcW0A/q85aVO2fcFzwx7nJx0HhdOvmo+0O2A42MW0EbUe1y1Q/tOa0ZbOb/0owN6fvz9D/z6164CgdJ4A/TOrNFp74kIoBU1EU1+bt3DrOJvmHRhdQj8+qMQWyRYGIWuo1waGGxCtK2fKroifoM6nLMjjRSUB0ll0SO7Y36WFbA0Cg/h8tgZttoJOxtonDiBvh70a1tQ2KrinZLqFb0hok9oF6FSKdYx/BcDibdw+qbXa34ng4pX/B93lx+4CXRLRwausxe2TZto4elDWcRiNT6aJ7XgCsgyIrL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(7416002)(5660300002)(55016002)(110136005)(64756008)(66476007)(53546011)(4326008)(66446008)(66556008)(8676002)(8936002)(921005)(15650500001)(2906002)(9686003)(52536014)(71200400001)(33656002)(7696005)(86362001)(76116006)(478600001)(54906003)(66574015)(186003)(66946007)(316002)(6506007)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cDFteDd5WUk5UVRPS1RGYnp3eFNEL09KOVNycHFlMU5DREZkLytkckxENXIv?=
 =?utf-8?B?K0RrSXFDQnBzWENPSnlCMmQ5dlZHek5wSE5tcjRubVBmZXg1bUtjMTh6RHpY?=
 =?utf-8?B?MGtjV1R2TjEzRmJPSHZUUVpUYjhYekhoNDU3aWZzaE5jc1hpQURWYUVLS096?=
 =?utf-8?B?UXp1akZMSFF2YW0rQXE5bnhWajdQcEN4RWR5T2lJSnJPcXhWZkpsTEM3bGRt?=
 =?utf-8?B?YUR3aUl2UkFHblhVdW9GU3loTXkzMm5TUnd5NUhrYytRMzU4SkRaRWk3ZHRT?=
 =?utf-8?B?UmNITGg4aGRDWGtaMGlvZG1seTA1QUw1emNYaTlyVGU0ZUh0c09Bb01JODIz?=
 =?utf-8?B?QVhWd3JBdURkb1lPQU1QNmRxMEVtYnVidjhGdU90VTBDbi90Y3NtMFVZUnZa?=
 =?utf-8?B?UkphN2tDeVpOSVBjSE1odmpHQjJzMDRWak9EU05xcWJIT0hxekJQeW9kRmRa?=
 =?utf-8?B?MS9Vbi90UG54WkJ1ZEgwUHRYZGs3NldScE1WZWYzbm5ZWVQwamFCWmNQRkpC?=
 =?utf-8?B?MDdxSUZVT2tBQTlEWVF6dDMrWGdnd0E1WnU3VGgzYlF4V09UM2NHaVdybUd4?=
 =?utf-8?B?T3AyQkx6cjBVNklBYnJQdGNpOTJ0RVhDSUo2dnJvajVscktnVGZ1K2czdkp3?=
 =?utf-8?B?bHhTVndMQjdWVnM5VGZsclFYY2hZYWdyNytBTGlzeHA0SzVjem5jMlpIVlVs?=
 =?utf-8?B?b1lVVUFTR2FPZW5OYmlHQTBXZCtsNnM3ZFl4RXhjRTJsZnlkSWlmWThIOGR6?=
 =?utf-8?B?a05pZm5WSjVLM1FMZ2JjdERXYWxpNndOK1ZyTlhONzlaOTdtM0I0YlBVTERC?=
 =?utf-8?B?ZEt0WWNVNzk3MTI3d20vUVQ5ZVpsbHZhMVJxUW5qMk1CTXhVZTBLV3dOcGg3?=
 =?utf-8?B?TExQVEpaL2wvSmxDek5rL3UxZWtiSGk5clZQcWRyRlVhMm1ES1o2bnpVcG9Y?=
 =?utf-8?B?MmhBeXIzZmNZRy95NHFPRVpuVjlhYjBkSlNzRkUyeU12ZitZeVNKRDRMdmlr?=
 =?utf-8?B?TUhVRHk0eWxSRzFUYTVxaHBRRDdxZW42MUFlSU9uQStoMnZIU2dTdUZnMGZ3?=
 =?utf-8?B?ZSs0K3NTbHQ2UVVQMHVvY3pSUXJVK2I1ZHhhakkyK0xrdjZOcEpPM3VsSTA1?=
 =?utf-8?B?RWhuNEU4dVpLaEJCTG9BZm16c01VdzdiVndBdTNlMEYyejYwb05YekVKbzVh?=
 =?utf-8?B?SFYxZEdQdUVlVWNSR1E5SFNLOGZwYVl2bEEzeGtVM0thajhjMFY3dWkvdjYy?=
 =?utf-8?B?YTArKzg3R2JLZHVDOWowc3cwUitVVmhTQTlDUzhXNjd2eTBzZ3NJV0tWV045?=
 =?utf-8?B?YUd5bHgxdElCRHNXZytPMkFmVVZRV0RuVnVMTFE0YWExT2lWTzZLaU04T1Nh?=
 =?utf-8?B?M2RrNmpLaU9Scmg1RjNyeGtTc1lSamlKM0VENzhvWGQ5RjFzVU5zdXFtMTNK?=
 =?utf-8?B?bUR0Z0w5ZTVOdWtXYUtGbENra3ZNazdHNkx4L1lnd1FhZEVueDZXSk5raWR0?=
 =?utf-8?B?S1ZxdFM1dXB0UjhsOGJXOXloemdaU2NPQ1FpcjVxeGVKdlR2em41cHp5K1A0?=
 =?utf-8?B?OU01cFVCN1ZJU0F0TWdoRGZKQW84RllJaVo2UEhhUzAySHhxeE5wbkJlckFi?=
 =?utf-8?B?V3gxTWp6OGZEUTNBQjFIbmxUY0c3SERJM3FjSk5RbzBKbWwyNVQvVGFnRmJl?=
 =?utf-8?B?MTZoQisvaEtJZFFiN3ZWVHFiTHpaU3VlUzUwMnRCZG91dVZqRE9lZDZURkQv?=
 =?utf-8?Q?Y4KfV5qnG1TSMA4a1LFCGOaklhx0FlsPk69dVoK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87faef7d-3cfb-414b-f5dc-08d8d7180982
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2021 09:55:51.1092 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: noQg3ey2aKbDipjO+PSMzSs0EhHXFVmRpm4uRms6IqIIbGlf3PvZ3OKXw6Frc4bIZtCuqEh+4eNvHJADeicdjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5974
Received-SPF: pass client-ip=40.107.243.70; envelope-from=saipava@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgQ2VkcmljDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ8OpZHJp
YyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAyMiwg
MjAyMSAzOjIyIFBNDQo+IFRvOiBTYWkgUGF2YW4gQm9kZHUgPHNhaXBhdmFAeGlsaW54LmNvbT47
IE1hcmt1cyBBcm1icnVzdGVyDQo+IDxhcm1icnVAcmVkaGF0LmNvbT47IEtldmluIFdvbGYgPGt3
b2xmQHJlZGhhdC5jb20+OyBNYXggUmVpdHoNCj4gPG1yZWl0ekByZWRoYXQuY29tPjsgVmxhZGlt
aXIgU2VtZW50c292LU9naWV2c2tpeQ0KPiA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPjsgRXJp
YyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+OyBKb2VsIFN0YW5sZXkNCj4gPGpvZWxAam1zLmlk
LmF1PjsgVmluY2VudCBQYWxhdGluIDx2cGFsYXRpbkBjaHJvbWl1bS5vcmc+OyBEci4gRGF2aWQg
QWxhbg0KPiBHaWxiZXJ0IDxkZ2lsYmVydEByZWRoYXQuY29tPjsgVGhvbWFzIEh1dGggPHRodXRo
QHJlZGhhdC5jb20+OyBTdGVmYW4NCj4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+OyBQ
ZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+Ow0KPiBBbGlzdGFpciBGcmFu
Y2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+OyBFZGdhciBJZ2xlc2lhcyA8ZWRnYXJpQHhp
bGlueC5jb20+Ow0KPiBMdWMgTWljaGVsIDxsdWMubWljaGVsQGdyZWVuc29jcy5jb20+OyBQYW9s
byBCb256aW5pDQo+IDxwYm9uemluaUByZWRoYXQuY29tPg0KPiBDYzogcWVtdS1ibG9ja0Bub25n
bnUub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmc7IFNhaSBQYXZhbiBCb2RkdQ0KPiA8c2FpcGF2
YUB4aWxpbnguY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA0LzIyXSBzZDogZW1tYzog
dXBkYXRlIE9DUiBmaWVsZHMgZm9yIGVNTUMNCj4gDQo+IE9uIDIvMjIvMjEgOToyMCBBTSwgU2Fp
IFBhdmFuIEJvZGR1IHdyb3RlOg0KPiA+IEZyb206IFZpbmNlbnQgUGFsYXRpbiA8dnBhbGF0aW5A
Y2hyb21pdW0ub3JnPg0KPiA+DQo+ID4gZU1NQyBPQ1IgcmVnaXN0ZXIgZG9lc24ndCBoYXMgVUhT
LUlJIGZpZWxkIGFuZCB2b2x0YWdlIGZpZWxkcyBhcmUNCj4gPiBkaWZmZXJlbnQuDQo+IA0KPiBD
YW4gYSBwYXRjaCBiZSAiRnJvbSIgYSBwZXJzb24gd2l0aG91dCBhICJTaWduZWQtb2ZmLWJ5IiBv
ZiB0aGUgc2FtZSBwZXJzb24gPw0KW1NhaSBQYXZhbiBCb2RkdV0gTm8gSSBzaG91bGQgbm90IGJl
IGxpa2UgdGhpcy4gTXkgbWlzdGFrZSwgSSB3b3VsZCByZXNwaW4gdGhlIHNlcmllcyB3aXRoIGNv
cnJlY3Rpb25zLiBGZXcgb3RoZXIgcGF0Y2hlcyBtYXkgaGF2ZSB0aGlzIGFmdGVyIHRoZSBzcGxp
dCBJIGRpZC4NCg0KUmVnYXJkcywNClNhaSBQYXZhbg0KPiANCj4gQy4NCj4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogU2FpIFBhdmFuIEJvZGR1IDxzYWkucGF2YW4uYm9kZHVAeGlsaW54LmNvbT4NCj4g
Pg0KPiA+IC0tLQ0KPiA+ICBody9zZC9zZC5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysr
LS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2h3L3NkL3NkLmMgYi9ody9zZC9zZC5jDQo+ID4gaW5k
ZXggNDJlZTQ5Yy4uNDMwYmVhNSAxMDA2NDQNCj4gPiAtLS0gYS9ody9zZC9zZC5jDQo+ID4gKysr
IGIvaHcvc2Qvc2QuYw0KPiA+IEBAIC0yODMsNiArMjgzLDE1IEBAIEZJRUxEKE9DUiwgVUhTX0lJ
X0NBUkQsICAgICAgICAgICAgICAgIDI5LCAgMSkgLyogT25seQ0KPiBVSFMtSUkgKi8NCj4gPiAg
RklFTEQoT0NSLCBDQVJEX0NBUEFDSVRZLCAgICAgICAgICAgICAgMzAsICAxKSAvKiAwOlNEU0Ms
IDE6U0RIQy9TRFhDICovDQo+ID4gIEZJRUxEKE9DUiwgQ0FSRF9QT1dFUl9VUCwgICAgICAgICAg
ICAgIDMxLCAgMSkNCj4gPg0KPiA+ICsvKg0KPiA+ICsgKiBlTU1DIE9DUiByZWdpc3Rlcg0KPiA+
ICsgKi8NCj4gPiArRklFTEQoRU1NQ19PQ1IsIFZERF9XSU5ET1dfMCwgIDcsIDEpDQo+ID4gK0ZJ
RUxEKEVNTUNfT0NSLCBWRERfV0lORE9XXzEsICA4LCA3KQ0KPiA+ICtGSUVMRChFTU1DX09DUiwg
VkREX1dJTkRPV18yLCAxNSwgOSkNCj4gPiArRklFTEQoRU1NQ19PQ1IsIEFDQ0VTU19NT0RFLCAg
MjksIDIpDQo+ID4gK0ZJRUxEKEVNTUNfT0NSLCBQT1dFUl9VUCwgICAgIDMxLCAxKQ0KPiA+ICsN
Cj4gPiAgI2RlZmluZSBBQ01ENDFfRU5RVUlSWV9NQVNLICAgICAweDAwZmZmZmZmDQo+ID4gICNk
ZWZpbmUgQUNNRDQxX1IzX01BU0sgICAgICAgICAgKFJfT0NSX1ZERF9WT0xUQUdFX1dJTl9ISV9N
QVNLIFwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgUl9PQ1JfQUNDRVBU
X1NXSVRDSF8xVjhfTUFTSyBcDQo+ID4gQEAgLTI5Miw4ICszMDEsMTYgQEAgRklFTEQoT0NSLCBD
QVJEX1BPV0VSX1VQLCAgICAgICAgICAgICAgMzEsICAxKQ0KPiA+DQo+ID4gIHN0YXRpYyB2b2lk
IHNkX3NldF9vY3IoU0RTdGF0ZSAqc2QpDQo+ID4gIHsNCj4gPiAtICAgIC8qIEFsbCB2b2x0YWdl
cyBPSyAqLw0KPiA+IC0gICAgc2QtPm9jciA9IFJfT0NSX1ZERF9WT0xUQUdFX1dJTl9ISV9NQVNL
Ow0KPiA+ICsgICAgaWYgKHNkLT5lbW1jKSB7DQo+ID4gKyAgICAgICAgLyoNCj4gPiArICAgICAg
ICAgKiBEdWFsIFZvbHRhZ2UgZU1NQyBjYXJkDQo+ID4gKyAgICAgICAgICovDQo+ID4gKyAgICAg
ICAgc2QtPm9jciA9IFJfRU1NQ19PQ1JfVkREX1dJTkRPV18wX01BU0sgfA0KPiA+ICsgICAgICAg
ICAgICAgICAgICBSX0VNTUNfT0NSX1ZERF9XSU5ET1dfMl9NQVNLOw0KPiA+ICsgICAgfSBlbHNl
IHsNCj4gPiArICAgICAgICAvKiBBbGwgdm9sdGFnZXMgT0sgKi8NCj4gPiArICAgICAgICBzZC0+
b2NyID0gUl9PQ1JfVkREX1ZPTFRBR0VfV0lOX0hJX01BU0s7DQo+ID4gKyAgICB9DQo+ID4gIH0N
Cj4gPg0KPiA+ICBzdGF0aWMgdm9pZCBzZF9vY3JfcG93ZXJ1cCh2b2lkICpvcGFxdWUpIEBAIC01
MjEsNyArNTM4LDExIEBAIHN0YXRpYw0KPiA+IHZvaWQgc2RfcmVzcG9uc2VfcjFfbWFrZShTRFN0
YXRlICpzZCwgdWludDhfdCAqcmVzcG9uc2UpDQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgc2RfcmVz
cG9uc2VfcjNfbWFrZShTRFN0YXRlICpzZCwgdWludDhfdCAqcmVzcG9uc2UpICB7DQo+ID4gLSAg
ICBzdGxfYmVfcChyZXNwb25zZSwgc2QtPm9jciAmIEFDTUQ0MV9SM19NQVNLKTsNCj4gPiArICAg
IGlmIChzZC0+ZW1tYykgew0KPiA+ICsgICAgICAgIHN0bF9iZV9wKHJlc3BvbnNlLCBzZC0+b2Ny
KTsNCj4gPiArICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgc3RsX2JlX3AocmVzcG9uc2UsIHNk
LT5vY3IgJiBBQ01ENDFfUjNfTUFTSyk7DQo+ID4gKyAgICB9DQo+ID4gIH0NCj4gPg0KPiA+ICBz
dGF0aWMgdm9pZCBzZF9yZXNwb25zZV9yNl9tYWtlKFNEU3RhdGUgKnNkLCB1aW50OF90ICpyZXNw
b25zZSkNCj4gPg0KDQo=

