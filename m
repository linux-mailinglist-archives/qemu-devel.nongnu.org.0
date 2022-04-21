Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FF350A294
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:34:45 +0200 (CEST)
Received: from localhost ([::1]:39634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXtM-0003oj-CO
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nhXhk-0008BD-NM
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:22:44 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:23728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nhXhd-0002ki-Uq
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:22:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1650550957; x=1651155757;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F9lWW+0XdX0ks7oJ48ANwXcCk8h3QQEMi8j/cboR0tI=;
 b=F+9/YRP6gXUQ1F8+h7HJ+ajynMtcsXNzrJe7NaIAT+5xGTel+T6125RB
 GUPNAhx2c/ZLLWCHOlQnS2nylsJJApyNRKp0nOsy3dLkGnUvkIF1Elsq2
 G6Aidu8thcqiJGs5GHoUFEeZImiR/Rn53xgQcnFDJx0fAL9/p3IEWplQE M=;
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 14:22:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doFOS8PBMFyUlwcMW3wWyhkt5PNSoMTf4rjosnGVJeZOSbYOEsH6vT+m6XQnS38ogqbuBN6Z5mm478IopZiH6fTEoPKlr2Pg/XQPGWJRuKiD5PRM6QQiFHhwWdz5TvaDvXMWdHHd+oViNph9Yrm6FFjDiLSBaD4I1I8M95/gluzIQxiw8AORrIXIqOvg9JnBxJz/XtcfCzd5O+N2M7YwYCle4nV+YHjyj2suRXzmT6u60cwMblOppXYjtrtzzH6JKd6/n4myz5jkvu2VS7GURuwGy5ce4NN61IN1b+5+5AZS/Utm6RbHBeAnrr0QbSTjgnGjsE7cWG4ekGJxo0u6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9lWW+0XdX0ks7oJ48ANwXcCk8h3QQEMi8j/cboR0tI=;
 b=DF/YusytNtnVHruSI3Wn1nRu0X1eoy3GhezPFO7pkebQejhjpthUrrUNejhYncLyGK4qSmgHy3u7KIPCtki3ESeIwVNH1LThkHS5vKaUWu3v1oLEEMZPiJ/shkT1LBdXGKSnkvX91HIpQRS/60aPPSsZL/ujOMAZc949lIwL+nEF0u5z9N5DaoJYPP1kPvN46ZHXfJ0uHcEAwHqu2zbcLqrr+YwnbC+xGzvKHMgbo+WClVSlu9jui/cFy+zvP+Z7ZxS9DIB32IJ2JyMMZdLVk3ZzpLlvuBZpaSnZGIEK0NfvjJ26vJeLrdTrBBcJjv8gS40qbiIXUMFYONC4dwSLRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB3984.namprd02.prod.outlook.com
 (2603:10b6:805:2b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 14:22:32 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::d023:a983:b893:617]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::d023:a983:b893:617%6]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 14:22:32 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "anjo@rev.ng" <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 10/12] target/hexagon: import parser for idef-parser
Thread-Topic: [PATCH v8 10/12] target/hexagon: import parser for idef-parser
Thread-Index: AQHYHdpgoR/GH1Z2RkujlSiWH7YU+6zrL9JwgAGTbwCAACzgcIANwEyAgAAohNA=
Date: Thu, 21 Apr 2022 14:22:32 +0000
Message-ID: <SN4PR0201MB880889BD2CE34C2FE9F18803DEF49@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220209170312.30662-1-anjo@rev.ng>
 <20220209170312.30662-11-anjo@rev.ng>
 <SN4PR0201MB8808765107E51ACC51D89DECDEEA9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <3553bdb8-021c-3105-f8d3-4d65fd2bc0b8@rev.ng>
 <SN4PR0201MB880894159A8E5558A97707E3DEED9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <fcc026f5-afd4-95d2-bbbf-0c2795a0e769@rev.ng>
In-Reply-To: <fcc026f5-afd4-95d2-bbbf-0c2795a0e769@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75e058d9-863e-4ece-e940-08da23a25fda
x-ms-traffictypediagnostic: SN6PR02MB3984:EE_
x-microsoft-antispam-prvs: <SN6PR02MB3984D50B3E1677E5F3864534DEF49@SN6PR02MB3984.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jhpY5D5uVg1s/wrG9ofUcqt6CW/NggijvRV4ZI/Kb0VyewFBOTT8BLeZEvj92ndtMKtOihRUoN0HoVIcijJ7H+bCzu/Wfcr5rbwMmb9Vq2FgMb+YLb2ZQx2IwXtFdGfc4c8hYzFLAMRofLCOqk1HgZsqPbhHIX//yEr8ag5UmDmHcgW/lcd1vNXmqD8jmFBKlSsFjA6eHCi6/gvkQnyl8jRm3+O09huw1H/lvEpl93vHsKTpj5iO5yUSdXVkgplH6PqIBeTmhodiLhDiJxiLhkxc3vIEFV0KYQellXyu0L82+eB5Fad9tPp9is/5LzieE9AGKQIQpZWISlEhpzZ/sS/bW+VkCNSrKA46VV71jmN/1cZ/NdQyU9qvUk18l1OF7K//EN5s844+VHF01KSGGVoUanAFDuKUdT9a7T86eTlZZQhZNxSbQ4uuIfd79vu8S5CDxyIBZz9Tf8X3ggdb2qMxrpdAfVFwTzNrOB352u3TUy64bvoKX4yRAt5l+vkeyXbAimT6FlxOx0IbKzEjq46gR3K//ceu2YMuDPjNneDpYyheNJh6utJRqVKboHg28bk/I9jyxA2yXtW6MDrGlAn+BkYDbJiGD/PfZ0bjYq9UHTt5hjxGL24KRimQBdIzaPXeeMlLTE8/RJcJ99+gp1E9h56S0SXrqk5lIMUDzc8T6E3/2bSxb3Z6CsE0Q4hzx9I4YzUQwJ/ZZDbYtMrfd95aERwqLZj+w3g9018CyHWkX0ablT1DG4ymYSuHCCkwamRMBJ39Em/riWhoErCPj82thtsuNi1tBBFHcu2lKLQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(53546011)(110136005)(52536014)(5660300002)(26005)(38100700002)(38070700005)(2906002)(966005)(33656002)(122000001)(7696005)(8936002)(71200400001)(186003)(6506007)(54906003)(66556008)(4326008)(66946007)(64756008)(8676002)(66446008)(66476007)(9686003)(83380400001)(55016003)(76116006)(86362001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTh5K2NUQ0RPY2dyWHNjZ2Y3ZVlYR0lpR0ZyNjNpV1NVOWhET0lPM2hJRjNI?=
 =?utf-8?B?UnNVTmJtU2I3d1dFb2QwZllIb2FIdTFJTlVzU292M1ZhNnRLUlRJY0ZPdVdx?=
 =?utf-8?B?cGRGVmZzZEsxOXArQzByb2hSd0tDLytaekpXZC90NVpjczE1L2toQ1ZwZlZL?=
 =?utf-8?B?RysvS2xvQ0VteURKQkd3SWFLalpCWWNRbjlneWk3K3Y2L2RTSnlBZk00dURt?=
 =?utf-8?B?bnluMG5qM0xPUk9nQjh5ejRmTTl4OTBRbUxQWURuUFNoREMzZjBiUEwvcHYx?=
 =?utf-8?B?Y3lsalVheFFTRHhWcjl1MlYrV0pQdnFna29wZ2R0eFlTOFQybU9BdllReGxv?=
 =?utf-8?B?WndwODF2NEZmVlgzbXJOdEtWVjN5ZGh2Y0JFSG9MNVRjTDZmVTB0bFNlcmtT?=
 =?utf-8?B?aVhrMkM4NDdLRFJGRkp4MWtoL0pOT2swZnIzOXUyVXpiQysreE9ZWVNGTmZo?=
 =?utf-8?B?UGJvdFhOWGhrK0pNWkVtU212bGd5TmZmZi9TUW1Ia0dBTFpiMDFaNElrSUZ5?=
 =?utf-8?B?MEQ0Y2N5VEo2Tm5Dc2JhT21BYjBiczlsYzRzalJpTHpYQWl6MWFEdlo0bklG?=
 =?utf-8?B?WldpKzJhTjAwNmkvSFNGcnIwSmRjZGZTakFMMGFyUEN3TExGMzNlZUJyTFRC?=
 =?utf-8?B?SmUxYmI5SmFlNjk1cnRRcXh6ZzR0ZzNkalY1MDU2eWxiVUJQSWJqTE5GcXpM?=
 =?utf-8?B?VjArWGFlL3FiK2hKdFNXWFJTN0NPUDh1UW9yb04ycGJGWmdiblFqTWxCbGF6?=
 =?utf-8?B?Yk8xS1B2OVJxU3ZrUWxBcHVHK3p1YnVuMEVXOHBmZFJFWXlSc0gyUnc0WENR?=
 =?utf-8?B?NHJvbnZYRUZIQjNTMGhaRDBTSzcvTCtpK0ZNZFBTTzdqK2FwcFhvTW05d3gw?=
 =?utf-8?B?bWpoUndueWlSdTdjUFV4VjYrQW9aa3R3Vzl3YnJVb0lyWlluVTNFQ2FrSFlE?=
 =?utf-8?B?ekNYUjhPeVFlZHlEMVkrOGh2blhxYnVja2NDUlJXNVlxSTNQZ2d1MGxBbnlu?=
 =?utf-8?B?K09hMC9lVXVVSlU5bGNOMklpTm1sa2h4cGNXYkRxakQ2dlZUS2djVWRFV0tT?=
 =?utf-8?B?YWRsNlFxbDBsaHBJMzcxM0g0bDV6K0dZWkVwUnlVS1BEcm9qMFJaY3pXWXF0?=
 =?utf-8?B?MlFRL0RodFIyRERzazVmMFZaN0RtMzVHVlFJc3ZxQjBSUHQ2alY0My9UQTZ5?=
 =?utf-8?B?bmZDR2FLdm93L05ndlBjNWk1UmhxcWRHSzBSUTNkRnJaZVNPY3Bod0N6b2xL?=
 =?utf-8?B?N1JDeDJOOUd5VmFEQVF5eXVRZ01uSEJjc1g5QS9HQUIzaTFjdXkwZ0pSdHJ4?=
 =?utf-8?B?WDFQUklCcVJyYjlycTROK0VwcnUxTXVMZUxOR2c3WDdCbVNoQTlDd0phWTZv?=
 =?utf-8?B?YUd0c3FaRllUYlJhNzhYck04OW4wbmZDVDVzcjBlQko0RFNkaWdheWF2aCtN?=
 =?utf-8?B?MVZVVVNvazJJc1JiVk9iWEFoMURXSmRnWjdXQ0RUaXVLWnZ5QmZhelF2MUl5?=
 =?utf-8?B?eExUVXNCNUlJTEVtMGNmeWRhajhjck9GTk12cEQxaWcvRDYwRk0xR2x5bm9j?=
 =?utf-8?B?eXpSenFobFpJeDVpMnZybENUVERhZ0Y0NWNkZldnY3dYaWxCc2l0QW5hVDVF?=
 =?utf-8?B?OTM5dzl5RVl2MUZWUG9xalYyNXdMQmRhRk1yN1ROc2Q2YzBMd2svYkU5L0ZW?=
 =?utf-8?B?UVBQdHplU1ZWaDBqK1dIM1Q5MnUwZyt1aGF5SFdKSXlqc0FSWUFkNE1Vbmkr?=
 =?utf-8?B?Mk8wU1kzR2hFOVNlWkpEQkplKzBFQWtqclNyK1RqOHpsTk96RlhsZnFHL05o?=
 =?utf-8?B?ZWx5UmN0STROMDE5cEhYbUhTc3lOV29qT2lHNE1MZkp3U016ZTFwWUpJTUJX?=
 =?utf-8?B?LzI5VnlUZzVoaGdnQzdjdWpOcFFKUVU3NjRRMHRQSXBVSHc4Tk9WcWxvR1ho?=
 =?utf-8?B?d0NTYW1hTU53NUx3SG1sVXZyTUlSQ2xpSVFTbGR3UHlDeGMxWC9FVW1Odm1h?=
 =?utf-8?B?bXNwZkMzQjdEMTF6cXorZlNIdzMrR01INFFYUmtzbGtFTXNQbUxXMC9ZVE5Z?=
 =?utf-8?B?b1pjT2tJeUZmcDBvSlVCL0FCaDVmdWF2K21Ramx6amFIQXI3bGJJSWJ6NGNX?=
 =?utf-8?B?L1Zmc0FiR2JCOHJlOS95R3J3U3NUbDZ5MzdmZmVIUEpCUW1xWGxzS2dNV1JR?=
 =?utf-8?B?V3Nid0dJdHBEeDFqOWVMZGVCcjJiU1J4azFCeXREaXNXNGNzWjVJbVFESkdS?=
 =?utf-8?B?KzR1YmNXZzh4R1Q4VXBwOFNFd3pxOS9vbDkxNlBoNWw3RkNrSzExNEFkK0hJ?=
 =?utf-8?B?U2EwcTFFa3RBcXowTnF3WmlIQXpFWTFSZFhqUjFqNDU1bGdnUnlLQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e058d9-863e-4ece-e940-08da23a25fda
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 14:22:32.6046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1WgZrc+QbvVeuwm0SLbvX5CObBWi6w+jTV5RvgxP6zlkSTE6SIJpNqB4T6SzJEgHCEAaByBcMomQX6iiqwUDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB3984
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 Michael Lambert <mlambert@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gSm9oYW5zc29u
IDxhbmpvQHJldi5uZz4NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDIxLCAyMDIyIDY6NTEgQU0N
Cj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZw0KPiBDYzogYWxlQHJldi5uZzsgQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5j
b20+OyBNaWNoYWVsIExhbWJlcnQNCj4gPG1sYW1iZXJ0QHF1aWNpbmMuY29tPjsgYmFidXNoQHJl
di5uZzsgbml6em9AcmV2Lm5nOw0KPiByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjggMTAvMTJdIHRhcmdldC9oZXhhZ29uOiBpbXBvcnQgcGFyc2Vy
IGZvciBpZGVmLXBhcnNlcg0KPiANCj4gDQo+IEhlcmUncyBhbiB1cGRhdGVkIHZlcnNpb24gb2Yg
YGdlbl9zZXRfdXNyX2ZpZWxkX0lmYA0KPiANCj4gaHR0cHM6Ly9naXRsYWIuY29tL0FudG9uSm9o
YW5zc29uL3FlbXUvLS9ibG9iL2ZlYXR1cmUvaWRlZi0NCj4gcGFyc2VyL3RhcmdldC9oZXhhZ29u
L2dlbnB0ci5jI0w2NzMNCj4gDQo+IElmIHRoaXMgbG9va3MgYWxyaWdodCBhbmQgd2UgaGF2ZSB5
b3VyICJyZXZpZXdlZC1ieSIgb24gdGhpcyBwYXRjaCwgSSdsbCBnbw0KPiBhaGVhZCBhbmQgc3Vi
bWl0IHRoZSBuZXcgcGF0Y2hzZXQhIDopDQoNCj4gLyoNCj4gICogTm90ZTogU2luY2UgdGhpcyBm
dW5jdGlvbiBtaWdodCBicmFuY2gsIGB2YWxgIGlzDQo+ICAqIHJlcXVpcmVkIHRvIGJlIGEgYHRj
Z190ZW1wX2xvY2FsYC4NCj4gICovDQo+IHZvaWQgZ2VuX3NldF91c3JfZmllbGRfaWYoaW50IGZp
ZWxkLCBUQ0d2IHZhbCkNCj4gew0KPiAgICAgLyogU2V0cyB0aGUgVVNSIGZpZWxkIGlmIGB2YWxg
IGlzIG5vbi16ZXJvICovDQo+ICAgICBpZiAoZmFsc2UgJiYgcmVnX2ZpZWxkX2luZm9bZmllbGRd
LndpZHRoID09IDEpIHsNCg0KUmVtb3ZlIHRoZSAiZmFsc2UgJiYiDQoNCk90aGVyd2lzZQ0KUmV2
aWV3ZWQtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCg0KDQo+ICAg
ICAgICAgVENHdiB0bXAgPSB0Y2dfdGVtcF9uZXcoKTsNCj4gICAgICAgICB0Y2dfZ2VuX2V4dHJh
Y3RfdGwodG1wLCB2YWwsIDAsIHJlZ19maWVsZF9pbmZvW2ZpZWxkXS53aWR0aCk7DQo+ICAgICAg
ICAgdGNnX2dlbl9zaGxpX3RsKHRtcCwgdG1wLCByZWdfZmllbGRfaW5mb1tmaWVsZF0ub2Zmc2V0
KTsNCj4gICAgICAgICB0Y2dfZ2VuX29yX3RsKGhleF9uZXdfdmFsdWVbSEVYX1JFR19VU1JdLA0K
PiAgICAgICAgICAgICAgICAgICAgICAgaGV4X25ld192YWx1ZVtIRVhfUkVHX1VTUl0sDQo+ICAg
ICAgICAgICAgICAgICAgICAgICB0bXApOw0KPiAgICAgICAgIHRjZ190ZW1wX2ZyZWUodG1wKTsN
Cj4gICAgIH0gZWxzZSB7DQo+ICAgICAgICAgVENHTGFiZWwgKnNraXBfbGFiZWwgPSBnZW5fbmV3
X2xhYmVsKCk7DQo+ICAgICAgICAgdGNnX2dlbl9icmNvbmRpX3RsKFRDR19DT05EX0VRLCB2YWws
IDAsIHNraXBfbGFiZWwpOw0KPiAgICAgICAgIGdlbl9zZXRfdXNyX2ZpZWxkKGZpZWxkLCB2YWwp
Ow0KPiAgICAgICAgIGdlbl9zZXRfbGFiZWwoc2tpcF9sYWJlbCk7DQo+ICAgICB9DQo+IH0NCg==

