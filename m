Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE604B169C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 20:55:46 +0100 (CET)
Received: from localhost ([::1]:53490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIFXd-0006E5-AO
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 14:55:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nIDXZ-0002Sa-1R
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:47:33 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:49900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nIDLw-0005yf-6k
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1644514532; x=1645119332;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GKn/s2OAsEmT85WKAi4vJfS0ApdHbiY97L18SL0xk00=;
 b=MPDVRaXoL/jCkLkXa6OtSGipMoco7tRJr/3H+Siw6NB1P3pLxiZHJ3up
 4lLaxJ6ApwrgCNw7+oRiSzoGayk/mrNwDJoB/Aogg60/yhe0bV8UyOv+X
 9QZ8U2tmdYujUzgE+CmNKG08/qga2DrWwFgKB6rEICAm40c8snkqqqdgt M=;
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 17:35:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpdNH/Z6N/fuonR/gUYxU0gpdbRzIB6/l5jG9OWMDoBRDV0xFS1Q/CeAI9otz0uQtwmzhn9so6c2qqG/nXMWisXeXS2/heHzW0mKM1kXd4nThxm9POXFIyFA2LFeRiM3hEa0Qa6LO92MnO8tBOod8MvpgcmS+Hm/1ol67i56j1dS/6RZ9NTaYNITqDFhnFj5+Litpe2PK9ebjUbiu/MbPfbdvZkjpgviUG73rj8e7NZcRntmyDB6nyCmzVAphMTXrh/HtHki4MDyZxFoIQ83hyAtwvpZowD5RK9QD2z+i1gmvl/VoArQZA6QhFt4mRp2r/eLws40tWYV2a9qzsmGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKn/s2OAsEmT85WKAi4vJfS0ApdHbiY97L18SL0xk00=;
 b=Fce7MJSeeialSLiDjCLNTzts544Hm3fAL1aSxF+l5ygYELwsdahVjoJ45FSc8HQ87bcDImefamxhdj+qdI0qr5dMieyXYe6L5fRjZEWvf9QghPVMKm7m/hda9CfsHloxK5iuB1JCh9Xo9GrusSC/eeayPrCBfcLrP4EUToYuhh7qax8yTC/8z0qeBxsFg4Kpa+SIXQ+NZeSoT/OogLLdNyi3cAvlu1b5wCVUt6DOeor59v9vYs/s+79ENWV6ml8PBaQRQIrAL8JHmI9BJalVFhT574eT/05xktEvJJFKhMUk/YtVoE59ad7/wfZwfgZXEQ8vlJUAKcbNPOdOs0SAEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DM6PR02MB6345.namprd02.prod.outlook.com
 (2603:10b6:5:1fc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 17:35:24 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10%9]) with mapi id 15.20.4951.014; Thu, 10 Feb 2022
 17:35:24 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 11/15] target: Use ArchCPU as interface to target CPU
Thread-Topic: [PATCH 11/15] target: Use ArchCPU as interface to target CPU
Thread-Index: AQHYHgF2SVTRlM5SbUGKmF4H97ngoayL0hWAgAE1szA=
Date: Thu, 10 Feb 2022 17:35:23 +0000
Message-ID: <SN4PR0201MB8808BEEAFCF4A89EDBB2165DDE2F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220209215446.58402-1-f4bug@amsat.org>
 <20220209215446.58402-12-f4bug@amsat.org>
 <83e91592-af1b-de86-83ce-a3fcf467fdf7@linaro.org>
In-Reply-To: <83e91592-af1b-de86-83ce-a3fcf467fdf7@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 023896b3-2780-4245-df26-08d9ecbbb857
x-ms-traffictypediagnostic: DM6PR02MB6345:EE_
x-microsoft-antispam-prvs: <DM6PR02MB6345AC6C162B598C258C971CDE2F9@DM6PR02MB6345.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wJcqFtXdDeKOz8dR0vYmXa3wyHUSmdmVfiV6jN1Vc0Vgb9KPDNxfAwxSM+z4M3wbu7tR5LQ9yLRhc8EpZIQI8w6JZJLYQW92krhrkZnDtdx6MbG117MHmnDY0EaU/EJKbRDaRAg9CbXPPGyaqZPBW07Fsroiinoq8bLnfpZPdrhZdrX7tavKIfEQUKzqdKoBLBZVooo+YnObybXrYT4noeJ6xd4/xw3XSeYF2DwqSWVbJLRqqDCoomQbbRyUUFIEjO3fhbeHjJk9nHa87NS+Xj92YmzUzNfW9DlxIXnFwjODmy2jlkTOltQcOqACBZCMe3JsK7Zz1iXUx5Mz1ns/j1vm9nyHo1Sh4bfDJFRQrr3HKoal++VXyCEtHsRp82IHUbli2U5xej4YhI5q8DvS9Ld+cgHPV3kfZgIf9/yl65axvMNOfo/srFGnMHOMQ626cwvUWBIyDSWA6PLvf9n1SCNB+2iCrOyni4d781c9zHxTRvkVbr3WOZDyEqBNINYQiRb/ZJ+Rt0irGZsFBZL22gehwgIvkTWBww68Ut5RwnQwn8WYwF08S8G3nNNvldtToQ1leftOqGWvQFN0zaaIG7T3iC/DPjxpvAUT2Oq2qLZkCefdPlFQjPce+7aqfpTD9H+4gZsBEvOz3QlUqnVOvg4hQDW7vRvpHsdr0KmQuiWohuTCdWsCi+UxaRlEq59bwkp9xSoOnIotJIXSfzjVQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(76116006)(66556008)(53546011)(55016003)(38100700002)(52536014)(66476007)(54906003)(86362001)(8936002)(4326008)(8676002)(316002)(2906002)(71200400001)(122000001)(6506007)(7696005)(38070700005)(66946007)(110136005)(83380400001)(5660300002)(186003)(33656002)(26005)(508600001)(66446008)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEFJeXhQVnpaNWxkVSs0MzdGVStiY3M1V2p1c3ppOElnK09nVTNmVEFscjd4?=
 =?utf-8?B?Ujkvd21pSXNKUGt6Zlc4UStsQ1BQS3orME5UUnh2aHRUSWk2RGlFNkRpQzlj?=
 =?utf-8?B?NTJlYUFzTTU5WlM2LzI1V3lJcVdTTjRaR1M1SzZPYTRzajBsRm5yWHdNR0xQ?=
 =?utf-8?B?eFJKUG0wT3FQTlpYWGtIV2U1RG1mbmYwZnBVMzN0ejhvMHdjWXlTSFo5T0d6?=
 =?utf-8?B?Ly9wRU1sRDcvazZ3UEdxUExxTm5SalhTR09jR1dUaS9neGtQaitlRjRybGNu?=
 =?utf-8?B?RmVQeWl1Z1BkamdPWUViUGZuckFRV0JVcU5IMUtVNjJHcTdodWdqQ0t2OHZz?=
 =?utf-8?B?dVF2K1RDRGM3WVRvMnh2Q3VCamJ1TDVsNW1aNDFPRWJYRVNqSjd2TjhhMWJI?=
 =?utf-8?B?Y3NHTG14L2V5NnNmRnMxeWVSRVQrUkU3VlVsRHVScXhqd0pLOW83T3JFd21D?=
 =?utf-8?B?UUVYWlJWMTRic042bE9FVnQxSXRSRHVxRjF5RXpnRmhJTmRQK1dMSGpMMmlt?=
 =?utf-8?B?TTRWYUNkWnRDb04zbkNnbXRTN1dBckJPaC9xcnhUazFJRjdSMFMrWE9KSE1q?=
 =?utf-8?B?b0RKK0g2WG1PTUJnVFYrU2hBSEtpUjQwclJmWFFVV0ZidlFPaHRGOFdFbm5W?=
 =?utf-8?B?R2lCTnBqbDc4dHNLaS9qTG9CRlFqWnVua2lOeXV2SjRmL0cxK3N5d21hWHhh?=
 =?utf-8?B?bDQ1WGMwL2hqYW01dDhxVkF5ZDNwVlp6NG5QZUVRQkVNOUNqOUl0cHFEekVr?=
 =?utf-8?B?QjA5OVltZFhicTV0R01QcEMxRGVGQzZudG5KR3JKeEVrZGdQS1Y5QmhaNmo5?=
 =?utf-8?B?V2hzamZjQUFKVUNDKzJRZmtOM3J3Wk55NlpsT2Z2ZHBEeGREWFZIM1FmcFJl?=
 =?utf-8?B?djRYL0NDaG9aYkd3UjlDelJLb3NFckY5ZGwrTTdSUlkvNnJvL2JyRGVvMGRW?=
 =?utf-8?B?VkFYa1BRUTdadkRYbUlTYnRtWjBac21FaVQ4d0lTa3VrbTludHNIVkJwOHBH?=
 =?utf-8?B?K3grUE1ySC9PS2VvMjYrSjRvZ1IyV0p6S0VESERyc01iUFYvNUQ2dC9mZVJV?=
 =?utf-8?B?UjY2alRYUUdwMFVvZ04yck55Nnh6KzI3ZXh1eHhlTldFMFZodHNEWk4zZHll?=
 =?utf-8?B?OEZrRTRqQStkTUk0WS84RHNZQmRtL3ZlaUZkVlNQa3hTeVZsMjA3RFFMeWVU?=
 =?utf-8?B?MGZCekI5T1N3MGxIVTE4Z0crNTlWNngvWlFoMGJ6NUxVZCs1c3JTOVZVSXZG?=
 =?utf-8?B?MkNvVi95eUIvTGdMNFJEcGQwYlQ0UWJDb0YvT29TWmZXRTl4c1V2ZWpFMUI0?=
 =?utf-8?B?Uzl2VzFEa0JUdEprNUlPV2N2ZC9IV21VcE1qcjJwWG5VcDFweUQrazFCcWhn?=
 =?utf-8?B?bm5ndW15OGZiMm5GUEZsVzN5ald2TTk0VGtsRVUvMlQ1YkhFb2VNRCswRnhw?=
 =?utf-8?B?ZFBRVkhxSlBDaTFmMnJxQzFlVW0yUGpyWTc2N3VpWTFWKzl1ZG5XYmwxTHM4?=
 =?utf-8?B?T1NTMlI3bmpTWnU4Y0hrbFNnaVFkM3JId0RBWHVsdmk5bDlsTXl0VXdjd2JQ?=
 =?utf-8?B?eEtrRURnSHd0U3FlOHFpbjBzT1lLcHBlUzdOa3N2YjR0MU0ydTJUaTNnTnIr?=
 =?utf-8?B?a3UvbG9TNTV2Q1hBMksrK0drMXVmVm1Eamc1ZnRCL3pkU0tURzVva2EwWGhD?=
 =?utf-8?B?VmtYZy9RaStDZUx1YU1oWkVEZ2YvRGJLekdOOUVYbFN3dWtRc083eEhFRmpI?=
 =?utf-8?B?NjNxNmlYdE00VC9GUG9mU1A3elpHYTV5SThUUitSY0NBOXNOb2hBQ0tCa1VM?=
 =?utf-8?B?VXlva2RuKzVEakU5bnJrdFgxRFl6SExuaUJYc1NSdjg2OXhsTVhaSXU0RVVS?=
 =?utf-8?B?SzZUd3EwL1FobFFCcEpZMFJrNUQ0a2NZcnhORXQ3Mzk5K2VKNmR3UEFrTjZQ?=
 =?utf-8?B?alZWQ3dweGZWeXBQMGwzenk3QmFZbTFkQXFnUm94QlAyekZJYjU1U3YyOGgx?=
 =?utf-8?B?NGlZVU5ROGRWK042TEk4SExNeG5YeEw5ZDdxSUtodWtJZHdwd3NMNkRKYnFm?=
 =?utf-8?B?Ui9QQUdDeC9PT29nRlNOWlBDY3cyNzBIVWVReittUUdUcUZVdmhjbnNWQ1Bj?=
 =?utf-8?B?eThXK3ZhdnN5aXhyalQ5a1EwVG1KY2dRNkwxT2g1WHg4ajRZNEF4RXd0MktM?=
 =?utf-8?Q?eUgfzizo3eJkYG3CnQeoA3k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023896b3-2780-4245-df26-08d9ecbbb857
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 17:35:23.9661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rXVOElFtb1l4cZnkvDj2AjXa6ct+daEabLKg9S5TP4bIsOnxkIPuXi+m/gWH3RStHS0iQBNI+WuKmZhL/k6dyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6345
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVi
cnVhcnkgOSwgMjAyMiA0OjQ4IFBNDQo+IFRvOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRi
dWdAYW1zYXQub3JnPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBQYW9sbyBCb256aW5p
IDxwYm9uemluaUByZWRoYXQuY29tPjsgVGhvbWFzIEh1dGgNCj4gPHRodXRoQHJlZGhhdC5jb20+
OyBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMTEvMTVdIHRhcmdldDogVXNlIEFyY2hDUFUgYXMgaW50ZXJmYWNlIHRvIHRhcmdldCBD
UFUNCj4gDQo+IE9uIDIvMTAvMjIgMDg6NTQsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3Rl
Og0KPiA+IGRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9jcHUuaCBiL3RhcmdldC9oZXhhZ29u
L2NwdS5oIGluZGV4DQo+ID4gMjVjNjdlNDNhMi4uNGRjZTQwYTM2MCAxMDA2NDQNCj4gPiAtLS0g
YS90YXJnZXQvaGV4YWdvbi9jcHUuaA0KPiA+ICsrKyBiL3RhcmdldC9oZXhhZ29uL2NwdS5oDQo+
ID4gQEAgLTE0Myw3ICsxNDMsNyBAQCB0eXBlZGVmIHN0cnVjdCBIZXhhZ29uQ1BVQ2xhc3Mgew0K
PiA+ICAgICAgIERldmljZVJlc2V0IHBhcmVudF9yZXNldDsNCj4gPiAgIH0gSGV4YWdvbkNQVUNs
YXNzOw0KPiA+DQo+ID4gLXR5cGVkZWYgc3RydWN0IEhleGFnb25DUFUgew0KPiA+ICt0eXBlZGVm
IHN0cnVjdCBBcmNoQ1BVIHsNCj4gPiAgICAgICAvKjwgcHJpdmF0ZSA+Ki8NCj4gPiAgICAgICBD
UFVTdGF0ZSBwYXJlbnRfb2JqOw0KPiA+ICAgICAgIC8qPCBwdWJsaWMgPiovDQo+IA0KPiBUaGVy
ZSdzIHN0aWxsIHRoZSB0eXBlZGVmIG9mIEFyY2hDUFUgYmVsb3csIHdoaWNoIG91Z2h0IHRvIGJl
IHJlZHVuZGFudA0KPiBub3cuDQo+IEl0IG1heSBvciBtYXkgbm90IGJlIGxlc3MgY29uZnVzaW5n
IHRvIHNlcGFyYXRlIG91dCB0aGUgdHlwZWRlZiBmb3INCj4gSGV4YWdvbkNQVS4NCj4gSXQgZGVm
aW5pdGVseSB3b3VsZCBiZSB3b3J0aHdoaWxlIHRvIGNvbnZlcnQgaGV4YWdvbiB0bw0KPiBPQkpF
Q1RfREVDTEFSRV9UWVBFIChjYyBUYXlsb3IpLg0KDQpJSVVDLCB0aGUgY2hhbmdlIHRvIGNvbnZl
cnQgdG8gT0JKRUNUX0RFQ0xBUkVfVFlQRSB3b3VsZCBiZQ0KZGlmZiAtLWdpdCBhL3RhcmdldC9o
ZXhhZ29uL2NwdS5oIGIvdGFyZ2V0L2hleGFnb24vY3B1LmgNCmluZGV4IGMwNjhlMjE5ZjEuLjNi
NjM2NTk1YTMgMTAwNjQ0DQotLS0gYS90YXJnZXQvaGV4YWdvbi9jcHUuaA0KKysrIGIvdGFyZ2V0
L2hleGFnb24vY3B1LmgNCkBAIC0xMzEsMTIgKzEzMSw3IEBAIHN0cnVjdCBDUFVIZXhhZ29uU3Rh
dGUgew0KICAgICBWVENNU3RvcmVMb2cgdnRjbV9sb2c7DQogfTsNCiANCi0jZGVmaW5lIEhFWEFH
T05fQ1BVX0NMQVNTKGtsYXNzKSBcDQotICAgIE9CSkVDVF9DTEFTU19DSEVDSyhIZXhhZ29uQ1BV
Q2xhc3MsIChrbGFzcyksIFRZUEVfSEVYQUdPTl9DUFUpDQotI2RlZmluZSBIRVhBR09OX0NQVShv
YmopIFwNCi0gICAgT0JKRUNUX0NIRUNLKEhleGFnb25DUFUsIChvYmopLCBUWVBFX0hFWEFHT05f
Q1BVKQ0KLSNkZWZpbmUgSEVYQUdPTl9DUFVfR0VUX0NMQVNTKG9iaikgXA0KLSAgICBPQkpFQ1Rf
R0VUX0NMQVNTKEhleGFnb25DUFVDbGFzcywgKG9iaiksIFRZUEVfSEVYQUdPTl9DUFUpDQorT0JK
RUNUX0RFQ0xBUkVfVFlQRShIZXhhZ29uQ1BVLCBIZXhhZ29uQ1BVQ2xhc3MsIEhFWEFHT05fQ1BV
KQ0KIA0KIHR5cGVkZWYgc3RydWN0IEhleGFnb25DUFVDbGFzcyB7DQogICAgIC8qPCBwcml2YXRl
ID4qLw0KDQpJZiB0aGF0J3MgY29ycmVjdCwgdGhlIHR5cGVkZWYgc3RydWN0IEhleGFnb25DUFVD
bGFzcyBzaG91bGQgTk9UIGNoYW5nZSB0byB0eXBlZGVmIHN0cnVjdCBBcmNoQ1BVLCBhbmQgdGhl
IHR5cGRlZiBvZiBBcmNoQ1BVIGJlbG93IHdvdWxkIHN0YXkuDQoNCg0KU28sIElmIEkgc3VibWl0
IHRoZSBhYm92ZSBhcyBhIHN0YW5kYWxvbmUgcGF0Y2gsIHRoZW4gUGhpbGlwcGUgd291bGRuJ3Qg
bmVlZCB0byBtb2RpZnkgdGFyZ2V0L2hleGFnb24vY3B1LmguICBDb3JyZWN0Pw0KDQpUaGFua3Ms
DQpUYXlsb3INCg0K

