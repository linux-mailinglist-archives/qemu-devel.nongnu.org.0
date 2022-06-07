Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BEC53F80A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 10:19:46 +0200 (CEST)
Received: from localhost ([::1]:47510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyURF-00060n-A9
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 04:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nyUP6-00054i-Bd; Tue, 07 Jun 2022 04:17:32 -0400
Received: from mail-dm6nam04on2086.outbound.protection.outlook.com
 ([40.107.102.86]:40289 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nyUOz-0005dS-5l; Tue, 07 Jun 2022 04:17:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F532eN3I4ppa+0nTr+WCR8C/bEibsUgBY7ncqjXgW3CInaghSKrUq1u+Vk06P3U7z8XhLSM/gF/hqfSX/1lO8NCjkLJr4rTLlHsqf5deyxnhr3fJxr6vDVVQGOr86Ula3hZAqdOtozm3hDYNQakeMcRhnTSX+QyLVJY11lzDUYX7RtX4icsAIXM/Ai0b9raXMbtnKyj5t0HB5+YkkMqxhSUyVcm6+E4XpXVFNkvEa1nDIHM1Qtk3XRy6s7Jihh7oPiHL42vxl6wYO6exVb23r8KWwRYI+dCqSKPUdc85y0jg1yRFW8CvRr8uEou3RET4QfhjBUYzslrIkdNqaMYGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XddzQWMR1dYW99BKJFZl5elXr23kQnyInunZS5khmlI=;
 b=YHFxCbIWKUEodJq0YRWtjLGMyKqx4Pw8qMG3z4FAIPTpIE87fCREb5GLr0xLrl4/4t4LvrqF+pr3NnJB+hEDfpclzbtZKiUTNGgWeA4tsgNNu9MW0XGQH3DVHOdM2N1rbBK5tWr5ZiuWh80gMAweRD4x7oZ3HYPcFdEpfPAWQKKJxRzWyfpd1S3EvKKUGDrpHer8cVMlRFahGkbjHJaB9hQH5P0IiqNndbNQKIujYpDkQMZE4kJmkdVL5P9pb1j0aJui6FJLVLWmKPx6dhX9acDmLryxLSpDAovOJu1rMAxwtTSIe2D0HKKW0OEQ2hfE1oNKUMyM4q0pf5lZ+dEEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XddzQWMR1dYW99BKJFZl5elXr23kQnyInunZS5khmlI=;
 b=WtjNC8/Ijtq5KGu9/H/p1R690mgCQOryHnmq9GzGTIC8tYF/C1E/AQQQadE4LH+eo0Q8oZcTyIOI5iy8lsV5TUgho59G/Qr2XCgZtorfzl46INmyAosUEhQ+FyAKrksNEpLkfrsiftk7rk5VY79jMVyuReiaSofjpjyWu6osTss=
Received: from BY5PR02MB6354.namprd02.prod.outlook.com (2603:10b6:a03:1fd::12)
 by BN0PR02MB8112.namprd02.prod.outlook.com (2603:10b6:408:164::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 7 Jun
 2022 08:12:05 +0000
Received: from BY5PR02MB6354.namprd02.prod.outlook.com
 ([fe80::8c23:a5ca:69f4:8b85]) by BY5PR02MB6354.namprd02.prod.outlook.com
 ([fe80::8c23:a5ca:69f4:8b85%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 08:12:05 +0000
From: Frederic Konrad <fkonrad@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>, 
 "alistair@alistair23.me" <alistair@alistair23.me>, Sai Pavan Boddu
 <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>, "fkonrad@amd.com"
 <fkonrad@amd.com>
Subject: RE: [PATCH v3 0/4] xlnx-zcu102: fix the display port.
Thread-Topic: [PATCH v3 0/4] xlnx-zcu102: fix the display port.
Thread-Index: AQHYddxpyor1H8N2FUGAaHXDeRZ6Xq1CMi0AgAFuZ7A=
Date: Tue, 7 Jun 2022 08:12:05 +0000
Message-ID: <BY5PR02MB63541AA2BC93B35ECECAF54FCCA59@BY5PR02MB6354.namprd02.prod.outlook.com>
References: <20220601172353.3220232-1-fkonrad@xilinx.com>
 <CAFEAcA_YB0-RHib7vUt3Mj3Nf5V0Pt0foqwUoMyMfaN-vhpOSw@mail.gmail.com>
In-Reply-To: <CAFEAcA_YB0-RHib7vUt3Mj3Nf5V0Pt0foqwUoMyMfaN-vhpOSw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d0bd4db-371b-47fc-4af8-08da485d68fe
x-ms-traffictypediagnostic: BN0PR02MB8112:EE_
x-microsoft-antispam-prvs: <BN0PR02MB8112205F1076343DAE97DCABCCA59@BN0PR02MB8112.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G2AyxERYVn7opEYrT66xKvsLVkcFYDTDcGkrsFIM4LXUe/gTOdelCWg5ERRhuZzIhSzX16lV7wzeS9iO3ylO21pZ9WME0qbVtpnSws4wd3eUKAljJJUsYE6duPcLL5vtodsPV69KeDUfzksT7hQjL4nf5d7BgRzD8VRocweSDOZbv9jQq+njNhtkMv8tER18O7aPSa+9t+fryqazbrMh1O/tbPE4IX9HekXD8uhNbVEXL32mOBJBTHberskk2vwe3Xz1amh2V4YXY2dYBPa8LY4WpMV4H3VLJNwatDKdcQc/we5IxAZRGy7YQfY1IqDwFfGf+qnE2dfYn0qH6InPh2Pk4klUxiGso3oFjUq15EjhzbdpLVDYyOcrb5CCHvtB5km2BcT4QTM4N57GRHlYqM6w+y1QuuI3x2BHPChRjWvdeUbrewvYs/wuAyQ6ipjbN2g1LtgBS2GImY5ivT++A63UAdUeAR5JYHkrskM5fBfFEANKY423ByUaLi2SCgitEzC+gealJ8IYiFYmcon8GtVCL58MBqXcbn2f+4Cfk77sVAUfRwCyr4c4yas1wrQcy/b6St+Wslm0LxtTX66HuD5R3rCnGPz98IcPFWZy9aQsrFhU74I9ASA77RE5td2QzsP/8RdwjnuFOG/BCWjTgGcm3Q5DFz8C9Lf+Ld4PsdEHggEYlQCsBRTaxm8VXnmVKBHqE517qRQ6PaGs8S28kg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6354.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(54906003)(508600001)(52536014)(6916009)(8936002)(71200400001)(55016003)(38070700005)(5660300002)(83380400001)(26005)(9686003)(2906002)(66946007)(186003)(38100700002)(86362001)(76116006)(66556008)(66446008)(64756008)(66476007)(316002)(33656002)(8676002)(4326008)(53546011)(6506007)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDBkTHhrQVIvdE9INTl2TCtzRW1pNXNaeklWbXVsdUdmSTExSmJadlpTUlVk?=
 =?utf-8?B?VURoUGM4ak1yT2NVK01RY1BRazJ5cEpSdzhjeEdwendLZmk2QSswb21nT0U1?=
 =?utf-8?B?Qkw1VktUYzJCWEFJU0EzMDVxaW0yV2NnL1FOelNJTjE5dDJIY05GREs0cEV1?=
 =?utf-8?B?MUVLSDV4QUhqR05RZkVOelNRVU05TVlQS1JGU1hGYVlsRGxKYTNCVFRFRk1D?=
 =?utf-8?B?RmFVK1VzdlpLK3FPeXY2eE9CWGNMaklMS01LaHorSDllRSs4dnBYNFlEYjI3?=
 =?utf-8?B?dUE1UWFHdjZ3a1pmNDU2eTk0YUlRUGt5V2Y2VWYxK0U2Zm5kTzFoV2JHWEgr?=
 =?utf-8?B?WGtLRGhjNTU3dHlaUjVEZzhYVmJEaDVZN28zeFYxWEhqNzdQK3VEQm9qamx3?=
 =?utf-8?B?anlkb3ZxWThnRlk3VHpxd0JNWWNBb1kzMHRwdTNyRVpvaDJ4VjIvVStLdklV?=
 =?utf-8?B?WHR6NDU0Zys1ZnRkTFdkSmpsVFJla0tqVHgrWXlya21VNkxMYXE3L2piYkZy?=
 =?utf-8?B?UDlTZ0tNbk9ZekdLTzFQRi83UFdBbmh1TE5rOFlGT2hPd0liU2Jnb3NyZWZz?=
 =?utf-8?B?Q015cmI2N2tPWE5PR3Nsa0xINklzaEV1OE9iTGpPa3dPZ29PNk1mNHp3SVpG?=
 =?utf-8?B?M0VBZFhrbVhqV3JTWDdPcG5nbmpkN0tEOEFlS05lR3c0WitYRC9KTG55K3Q3?=
 =?utf-8?B?SmRrYWNxSVVxZkYwL3NiYWhlc3FOdVNuMUE0TnFKNkhmam5aaWk2ZXVQY0Vq?=
 =?utf-8?B?M3Y1TjBwbktKdkh1MnM2RFFMNGsyWlVTY0lpcTJKWkZvaGNmN21FeUsvNW5a?=
 =?utf-8?B?eHo1Umo2UVhMWWZDZFBSVzlDeUNBQkZBUHBHRml3d3NKalFtY0p4bFJJOWZF?=
 =?utf-8?B?SVBhVnkvYXhaajBzaCt5RmtxSWdIZFNOazh2TTVhY3VBbGxLZFIrNXcvQzNE?=
 =?utf-8?B?T3NkN3B6NVYzaW8xeHpKNVVwcWxRNkJjcmprdXllRjV2Nnd2NDFHRGlQK1Mw?=
 =?utf-8?B?aWRzcGE3MDhSUy9CR0pVOHFHOUtycmljOTM2azJnNlFMSm9wbCttM1Frc3lW?=
 =?utf-8?B?RjVBazNQRmxTekhOQlVqZmFnd1Z0Z21ZQUlDamdJMmpGaVppN0kxMW5Vb1cy?=
 =?utf-8?B?QlRZZnlQVW5LT0ZxVTIzR2Nsc2xvQks2TXp1T3RhSFg2aCtVSmhTWG5yQkUw?=
 =?utf-8?B?Z3NtdDZEamZPVVhkRGRBV3dRS3dkYXY5SmpmN2ozakxrSHNZYXdvUlhQVTNj?=
 =?utf-8?B?aU5NZlVycFRQMDBtSU5nczdZUGlIZHdZUnh6UHJkNW5SZVE5bUl0N1NpMml3?=
 =?utf-8?B?MzBveFdMMERUdGxWVWIyZEg0RVJFVVhDdDNPUHBYalVzdjlxdmpiUVFLaWRm?=
 =?utf-8?B?RzZBUjk1aWlPU2o1d1FuQWIwcllLN090ZXRDRmlWMFpBb1FxQW9jMzhzSC9O?=
 =?utf-8?B?UlVScVFqQVNUU3JDS1dacGk1d0k4UE9tY0swUWVMZUFCRGQ5SGNCVGpjRXNO?=
 =?utf-8?B?ZnpuZy90Q1FCNm94emVNa09sNXB4SGlGUjZMRWIwdHBVamUyajhKYVJiY1hu?=
 =?utf-8?B?ZzNNY0llMVRWZDUxTWxmOUUwYkFGUjlPdUlDenJFRUxjN0IrMTlQWlpFL2d3?=
 =?utf-8?B?MVFyaUJJTGdSK2U0WFZOclVJWlMzQk0zMHR0MEVlU09ZTU9hME0wZTNRV3Qw?=
 =?utf-8?B?WXdRNXZmOXlEalN0Q1daVHc3elRtMlk2MW9yay94L0p6WnVaam91b0l3aU9p?=
 =?utf-8?B?RXIzcW1pZi9SU2Q0cHQybVlIUWRhSnZiZENTU3pab2JhRGlIYkhlbGhuUkJu?=
 =?utf-8?B?MURxa1hoZ2crQk4wa0wya1RzNytYaWhVWXBVUm1idkhsZ0YyTTNDdmVVQk45?=
 =?utf-8?B?NCtiZ2RxUXBCRWJUSWpoQkt6Z0hFQUxINSt2TUtmT3pYb3ZqcWRyQlZ0bGY5?=
 =?utf-8?B?VHdUWXNGWFBlbGdEMnUza3FpVytsd05FbWJHOG1JVmJsRGRheXBsL0RYenVC?=
 =?utf-8?B?d0hSVU1yQ2ljL0FSRW9ERlFnWXZaaTlrNk9NQlY1VWhnREx6ZWpEVDFRVDlv?=
 =?utf-8?B?T1phdURyZ0NHV000VVJjZXdBMG02aCtvNFExRmNhdVJCWW14UjFwNVRObWht?=
 =?utf-8?B?dFhTTExwQ25WU01RQlhVd0dBVlhaOEk2c1lldjhyTUh2VFErTzFaSzBTQ2d6?=
 =?utf-8?B?N0FwNnlObk9OZXhqeFdTMXp6eG1NWGNxQTdKNmdJU0E3UVdIcFh3TkpwcWFt?=
 =?utf-8?B?cFNWTHpFakZTM0hBUGs1RjJyUVpRbktNQ1Z6NkJkT3dUMDhUcDNSUVRBcmY4?=
 =?utf-8?B?RjJhS0lsMFZCN3Q4TEo2cTdmUlNCb0Mxa2xRVmlPZjd5azhaZmU4QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6354.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0bd4db-371b-47fc-4af8-08da485d68fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 08:12:05.6688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5mnmoqRPIlGSHpdrgVIFUAVIWV/CrTTlxi0O5m2As0HZc7MFRQkh/qJBNDRaxaDf4JPdXvArLcy5zMhvMg9eJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8112
Received-SPF: pass client-ip=40.107.102.86; envelope-from=fkonrad@xilinx.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiAwNiBKdW5lIDIwMjIgMTE6MjANCj4g
VG86IEZyZWRlcmljIEtvbnJhZCA8ZmtvbnJhZEB4aWxpbnguY29tPg0KPiBDYzogcWVtdS1kZXZl
bEBub25nbnUub3JnOyBxZW11LWFybUBub25nbnUub3JnOw0KPiBlZGdhci5pZ2xlc2lhc0BnbWFp
bC5jb207IGFsaXN0YWlyQGFsaXN0YWlyMjMubWU7IFNhaSBQYXZhbiBCb2RkdQ0KPiA8c2FpcGF2
YUB4aWxpbnguY29tPjsgRWRnYXIgSWdsZXNpYXMgPGVkZ2FyaUB4aWxpbnguY29tPjsNCj4gZmtv
bnJhZEBhbWQuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMC80XSB4bG54LXpjdTEwMjog
Zml4IHRoZSBkaXNwbGF5IHBvcnQuDQo+IA0KPiBPbiBXZWQsIDEgSnVuIDIwMjIgYXQgMTg6MjQs
IDxmcmVkZXJpYy5rb25yYWRAeGlsaW54LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBGcmVk
ZXJpYyBLb25yYWQgPGZrb25yYWRAYW1kLmNvbT4NCj4gPg0KPiA+IEhpLA0KPiA+DQo+ID4gVGhp
cyBwYXRjaCBzZXQgZml4ZXMgc29tZSBpc3N1ZXMgd2l0aCB0aGUgRGlzcGxheVBvcnQgZm9yIHRo
ZSBaQ1UxMDI6DQo+ID4NCj4gPiBUaGUgZmlyc3QgcGF0Y2ggZml4ZXMgdGhlIHdyb25nIHJlZ2lz
dGVyIHNpemUgYW5kIHRodXMgdGhlIHJpc2sgb2YgcmVnaXN0ZXINCj4gPiBvdmVyZmxvdy4NCj4g
Pg0KPiA+IFRoZSB0aHJlZSBvdGhlciBvbmUgYWRkIGEgdmJsYW5rIGludGVycnVwdCByZXF1aXJl
ZCBieSB0aGUgbGludXggZHJpdmVyOg0KPiA+ICAgLSBXaGVuIHVzaW5nIHRoZSBWTkMgZ3JhcGhp
YyBiYWNrZW5kIGFuZCBsZWF2aW5nIGl0IHVuY29ubmVjdGVkLCBpbiB0aGUNCj4gYmVzdA0KPiA+
ICAgICBjYXNlIHRoZSBnZnhfdXBkYXRlIGNhbGxiYWNrIGlzIGNhbGxlZCBvbmNlIGV2ZXJ5IDMw
MDBtcyB3aGljaCBpcw0KPiA+ICAgICBpbnN1ZmZpY2llbnQgZm9yIHRoZSBkcml2ZXIuICBUaGlz
IGlzIGZpeGVkIGJ5IHByb3ZpZGluZyBhIFZCTEFOSyBpbnRlcnJ1cHQNCj4gPiAgICAgZnJvbSBh
IHB0aW1lci4NCj4gPiAgIC0gVGhpcyByZXF1aXJlbWVudCByZXZlYWxlZCB0d28gaXNzdWVzIHdp
dGggdGhlIElSUSBudW1iZXJzIGFuZCB0aGUNCj4gPiAgICAgaW50ZXJydXB0IGRpc2FibGUgbG9n
aWMgZml4ZWQgYnkgdGhlIHR3byBsYXN0IHBhdGNoZXMuDQo+ID4NCj4gPiBUZXN0ZWQgYnk6DQo+
ID4gICAtIGJvb3RpbmcgUGV0YWxpbnV4IHdpdGggdGhlIGZyYW1lYnVmZmVyIGVuYWJsZWQuDQo+
ID4gICAtIG1pZ3JhdGluZyB0aGUgcnVubmluZyBndWVzdCBhbmQgZW5zdXJlIHRoYXQgdGhlIHZi
bGFuayB0aW1lciBzdGlsbCBmaXJlDQo+IGNvcnJlY3RseS4NCj4gDQo+IEhpOyB5b3UgZm9yZ290
IHRvIGJ1bXAgdGhlIHZlcnNpb25faWQgaW4gdGhlIHZtc3RhdGUgc3RydWN0IHdoZW4geW91DQo+
IGFkZGVkIHRoZSBuZXcgZmllbGQuIFNpbmNlIHRoYXQgd2FzIHRoZSBvbmx5IHByb2JsZW0sIEkn
dmUgdGFrZW4gdGhlDQo+IHNlcmllcyBpbnRvIHRhcmdldC1hcm0ubmV4dCBhbmQgbWFkZSB0aGF0
IGNoYW5nZSB0aGVyZS4gSSBhbHNvIGFkZGVkDQo+IGEgbm90ZSB0byB0aGUgY29tbWl0IG1lc3Nh
Z2UgdGhhdCB0aGlzIGlzIGEgbWlncmF0aW9uIGJyZWFrIGZvciB0aGUNCj4geGxueC16Y3UxMDIg
Ym9hcmQuDQoNCk9vcHMsIHRoYW5rcyBmb3IgdGhlIGZpeCBQZXRlci4NCg0KRnJlZA0KDQo+IA0K
PiB0aGFua3MNCj4gLS0gUE1NDQo=

