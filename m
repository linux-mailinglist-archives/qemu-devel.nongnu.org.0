Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FC550668A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 10:10:04 +0200 (CEST)
Received: from localhost ([::1]:55268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngivw-0000m0-KG
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 04:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nggwH-0003hp-B0
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 02:02:13 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:50192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nggwE-00064x-No
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 02:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1650348130; x=1650952930;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JGzo44+7BoOyR29jmOEJlEcItWw0myQf80vlX2NpHFI=;
 b=VOZecpOEYhltTtgt7n78gTDL7vpCeDew1OGmMcyt0VLqN1/mRpb9lX/I
 5aICuMTJI/msKeXdVauKs4ggIcTaJjamOuJqcrh2i10jr8pL3JDlhhC2v
 li/rDC8CqXyfUVu+dd8g3tRLtAgbO2llsC5jvckiP3yXpA8wlbXu9cKak I=;
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 06:02:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maWuXy3rMv3w/Dgl1jfvGl75ONyEA4JbZBn5CVMUT71Iu8MKjEXqMElhmi7Wn97iHI9r63d9VhFARo1hYYdp/j/LFMixFLnrwkoQ8N1OKYDVVtClJnkqcOOzAvTdAd8pGy9rL52m2kVImtjhYiKpbzr+etsXYQOSSCvVxqDF/ZdpYPa5EQrZrsSpwpIe0ckI+CHAAyoHztsT1g0ULpJEae+/d7fbcBWy+6+hyM7KSR/Fk7FZNfQ+nCOzqpV+p3k/OeGRE9vN+KnE/utac1uICNYRJpsc42+PZNodEF//TO+z7eG9MdkRjVVKKsFU44rCK7hsnNKL/EzSYvNV0P46Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGzo44+7BoOyR29jmOEJlEcItWw0myQf80vlX2NpHFI=;
 b=YMrprIYvf6Z0EABA4DGcROhbcHhBLo3AICjGKXAVyndMhTp7oB/JBEb+ZxtRzleGhSyLYtgyVBhItKjX7RaSrtV0M/sdkMgCIBg9113y5ZnKqS5D9vYYnhNywooualyT0gTmHWLlUf+rn1k2+PiUpItTZwOH5xUkPrK5RRh7PU80jG9ZLu4fHzONu7ofMYBkxqAy3tGpfs8+bts0Z9Dp9FIXfUdVMO/gOlDTjpiPKPIXlXZc2JWGKfvGvFCGd+kWvBQrHTil/RFk38HIMzOx+zuNlpzIhPCBioSwO2IaOfX9SZwjKYTWiDoMFX5mgONImt3/Z8ziH8HuNthVHsw7sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by MN2PR02MB6352.namprd02.prod.outlook.com
 (2603:10b6:208:1b8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 06:02:05 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::5c0b:b589:ed93:eaef]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::5c0b:b589:ed93:eaef%9]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 06:02:05 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: Question about direct block chaining
Thread-Topic: Question about direct block chaining
Thread-Index: AdhTMV3HLYuwsChLQJeeFj0sDaStrwACOdQAAB3If6A=
Date: Tue, 19 Apr 2022 06:02:05 +0000
Message-ID: <SN4PR0201MB88081EEA0FCEB2A1B3B49B87DEF29@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <SN4PR0201MB8808BF460C02884C603641A4DEF39@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <aa16cc6b-0ff9-5870-118b-ceb24b584fe4@linaro.org>
In-Reply-To: <aa16cc6b-0ff9-5870-118b-ceb24b584fe4@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 106212f2-d059-457b-b76e-08da21ca2188
x-ms-traffictypediagnostic: MN2PR02MB6352:EE_
x-microsoft-antispam-prvs: <MN2PR02MB6352E69FAF2BD8AA1C0E399BDEF29@MN2PR02MB6352.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NxD+6BNW78hhbkwoQZWzUelSFB23I/JC3aDN+Q2E8tc/IbcK0HBGWecG4sSYjixxGqN+7TOaLI8N0y2SGjyrQsjnsgB5SnZzAb4nUFHLQgJ2IftnDXygiJLpBk9rGy+wTcTPwyvYZmmMHigiIy9XjRxu7I6K9Y3ZvBCUcIAaM0otSgKnS7y9bAc3sBXEK02rIldUqn34FwUQh/pi8NU5HXc2isvjXZdBOi6YdYtYqGuagzR+vP08NyFkorcjTzMu90xyVrIUszFdXdLuddeZIu0uOyiStex/5TRlkyovTSNBlc6mm0MOLGnmFlQJ1FMNmF/ShknaGwfdINZBKw0UvptvYih8M8M0RPkSNYQTWYjHtdYHsyNFmg93YnnZMNfnZcDwlmZ0GHu0wKN0Bzm/QJ3gVtp8ohAfxjFnOiEqdujzCE3otlQHWl1m/+GbGJmgtYot/5QpHwzf9OihvuUNQ165gdDnNKWVaiSz4KLR0yKIEmOXDUGi4QsaVYzAwWr+jzQtr9kckBy24aPQTi2vqPIplk0Emr3zUKrdYR+Y7zgO4wunjuKpWklIB9Wt0a6u66qFB9MgUigBJw3tUfSeJHuxpd8FV7+bMBJLj1ZrQ1w/zlcyjfqrbc5GhUZTDZqp8+E1IzfMOz/4RMlMII9GKq6nLV2brmtV+140JCyNRwPt/4y9Uw9QBGTYLW4/RKrUWCHpOtiTE+5cctZNY1KdWg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(26005)(83380400001)(8936002)(6506007)(52536014)(86362001)(7696005)(33656002)(186003)(9686003)(53546011)(38070700005)(38100700002)(110136005)(2906002)(5660300002)(71200400001)(122000001)(508600001)(55016003)(66556008)(66446008)(66946007)(4326008)(64756008)(8676002)(76116006)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1I4bGxMbWVwbVcwbFAvWUtIWEdNZ1l5YjQ1c2VhaE95RkdpMDRIWGNUTmlJ?=
 =?utf-8?B?Q0lhZjV0ekdTam84VGQrR0RxRXp4OGZFUUY2MHNKTDdTOWdMd0tKMVNrWWwy?=
 =?utf-8?B?S3BLQkUyRllKcFVjeVVHQW1JMWFjeFdKSFVZcU9rNDJqT1hjT09JRk8xNEZV?=
 =?utf-8?B?bzhJRmZSWXZMTUp0RDZUdFR4ZTVjQno4SXZCTFY1RHJNeTBycit2bDdpT2FK?=
 =?utf-8?B?MkU0b1dNZ1R4dDNuc1FCK2VySHg0aC9uY3M0OTF2aXdnZnIwQ3d4OFJiaE1E?=
 =?utf-8?B?SGpYUTJEbXdUWk0wbjJ4VUJKdUVhb2lxQnRMUzZ0aklQbkFDNWJ0REhxbHhi?=
 =?utf-8?B?aFdSUzZhOW1UMkNjbmdKSWRIMlNiU2FkZURrMkxWbUN4cGlWMDVlUllETDVP?=
 =?utf-8?B?YSt5ZTdaUGRHUzdTZ3lXdXJIcER2czV5NzRTaWM5ZnJZay9VVlhDd01hTW10?=
 =?utf-8?B?YnRLSUVKZkhaR0hWelVYeWVyNUEwVzRKWU9yaFo0bDQ2RytOUk1MMlFuMVBy?=
 =?utf-8?B?bVZsSGU0a1NqWFRLYVdCejZ4QU5NdVVML3pud3VEZG9NU2FvaWlVL0cwLy9B?=
 =?utf-8?B?VjI4RGUrd3FZNSsreHFhQnZRR2tFR1dJWFhhY25VQTZ1YS9DaHNSYkk3QlA3?=
 =?utf-8?B?TTNLekxJaDF6MENIUm1pZnZpcnRPekFPcXpTaGJQejNuVUF0WXdkZnBmOW9O?=
 =?utf-8?B?d3hmWFNQM0JFUU9ta0pmaDZER2xaaVJ2SEJjWGpaOTdmaVRxZ01XaW9vUnRt?=
 =?utf-8?B?bTBsRERJc1BQc0NDRmxjQjkrcCtWMDZXMkNVVi8rd25SWm5uOERJQmZTS3gv?=
 =?utf-8?B?N1hjNUxDaGp4TzBrcnIvMXRXeU5sRjErUnE3SVRMdVdPaE1zWndrTld3Tmh1?=
 =?utf-8?B?b0VpbldBNit4eDlXQjJDQmlpWGN1cFJrSnNTUmUvQUplS05TdnZqRU1hUE1I?=
 =?utf-8?B?ellLUk5iZzR1TFdyeDBzZEh2blU4bWJLeFdoN1FjZnZuTnk0Q3YxM3FFRXlB?=
 =?utf-8?B?Qis5Qk4reXg2MXlIbFByMk9OK3BqeU41WERoUEZpVTRsZzU3MjlBS0cra21y?=
 =?utf-8?B?SUJVNi9YdUZ0cHJxVlpiai9GRTBPMWRhT01jRGR4TkhTVHRMOU5yWlBQa1hs?=
 =?utf-8?B?eU5BWE9uZ2RaRTd2RURYaXJOZlliWS9pRnp0UmZUeVkzbTVLZWJvaEx5cTN1?=
 =?utf-8?B?L0tId043NzNDOU5oS0lvSFZaMXhRK3FoY3Mva0VMQVdLMGVtOXNrNTA2N1Fp?=
 =?utf-8?B?dG5TWDhQMm5MWE9hUExOMFZSQlBpLzZOdTNST01RQ0preHB5QUdxOFN6aTZm?=
 =?utf-8?B?YkIwS2VsalpwMkxtOXl2a1ZaMWtSa1R0YThlZUE2TXR6VzUxb2JDM3g1RSta?=
 =?utf-8?B?TnludWM5R0p6UmUrOE8yV0pVY1VrMThwbTh0K1dOdjlBdEJqQTJGMnpvRWdY?=
 =?utf-8?B?cXR0c2hGa3duc1lXWjE3azd3NFd4aEZBRDhWTklDb21YcWY3QVdoaUVpMWR2?=
 =?utf-8?B?MnRVS3NvUWdlR2htZXBlbnBmaVR4cHJGZEhxYzdDVDJGRDI2dnhxZlBUVGl6?=
 =?utf-8?B?SW1aNTBxOUJHdW9rOXhLeGF1djRSTm9zemZTVFdoNWc0amtZcmNDb1dpZDJm?=
 =?utf-8?B?cGk3d2FKTVo3enBHMFo4dENrTjBDZW1sRFZ0QjhiclN0WEJNVTE3R29qSmc1?=
 =?utf-8?B?dHZjRzhCYVJMekdkdTJPU1lMRGZxSmtkTE13dHFodW5OYnJ0MzhVYjZPYlFY?=
 =?utf-8?B?OVNtdExlcUFlMGJYYXNtQTNheHJmbVMxa1MydG8xU0Y0RDZtREdBMXJwc1hv?=
 =?utf-8?B?MjNiRnJBZk91YnBveUJ3SXdOM2VJZmZ5WSs1ZnlGS0lLMFk5WDRlb0E0R0VM?=
 =?utf-8?B?RGtSeGJFTEp4Ymc0TDlad2JmdTRockN3ZEJJNnRjVW1MaG5qNWdXY01lQ0lt?=
 =?utf-8?B?TG13YUlLKzdJZnB6TCt3amhRci9ROG45aVlsRHVyQXhNSk5NNVF2eTcxOGk0?=
 =?utf-8?B?VmFYTUdRTkFIeGo5NUpBcytLamZNaHJaT3hCWDlMWkZwY3pYNkJQd3orQ2Jo?=
 =?utf-8?B?dFlCVmp0RWJDaEtoUXJUZWZzVmNHR0xmcU1nMDlkenZrbFZrWEI2elJ3WnBG?=
 =?utf-8?B?bVV0dHB2K2E4cWZCeWU1VEFyaEVEU0dlWGhxeHlOdWY0VGE3Q2lidUhhZU1K?=
 =?utf-8?B?Rlg1Wm9nY08zTXZ4TUIrM2ViWmFKZW1PR3ZJTU5XaDRGUGdjdStGdzZMOWZD?=
 =?utf-8?B?ZXlKSjV0MDU3RzgwVWtRZVRzZHY1K2M2VVhOOW4vNTl6K1gvTlpTYloyZjht?=
 =?utf-8?B?UHgwbHpEMUpESytRN0F4YjZTWm85NzRvSDVvMlFXRWIyTjZTck5vQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 106212f2-d059-457b-b76e-08da21ca2188
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 06:02:05.5596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JB90l0VKulkxWALTB/LB0G52eDcXNoIBtzbrRJwJlg9NizPgcRNFoBEvqeEHC7Xwc12Jw06M+CP/1PmZ9LpiPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6352
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
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
Cc: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgQXByaWwg
MTgsIDIwMjIgMTA6MzggQU0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5j
LmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgPGY0YnVnQGFtc2F0Lm9yZz4NCj4gU3ViamVjdDogUmU6IFF1ZXN0aW9uIGFib3V0IGRpcmVj
dCBibG9jayBjaGFpbmluZw0KPiANCj4gT24gNC8xOC8yMiAwNzo1NCwgVGF5bG9yIFNpbXBzb24g
d3JvdGU6DQo+ID4gSSBpbXBsZW1lbnRlZCBib3RoIGFwcHJvYWNoZXMgZm9yIGlubmVyIGxvb3Bz
IGFuZCBkaWRuJ3Qgc2VlIHNwZWVkdXANCj4gPiBpbiBteSBiZW5jaG1hcmsuICBTbywgSSBoYXZl
IGEgY291cGxlIG9mIHF1ZXN0aW9ucw0KPiA+IDEpIFdoYXQgYXJlIHRoZSBwcm9zIGFuZCBjb25z
IG9mIHRoZSB0d28gYXBwcm9hY2hlcw0KPiAobG9va3VwX2FuZF9nb3RvX3B0ciBhbmQgZ290b190
YiArIGV4aXRfdGIpPw0KPiANCj4gZ290b190YiBjYW4gb25seSBiZSB1c2VkIHdpdGhpbiBhIHNp
bmdsZSBwYWdlIChwbHVzIG90aGVyIHJlc3RyaWN0aW9ucywgc2VlDQo+IHRyYW5zbGF0b3JfdXNl
X2dvdG9fdGIpLiAgSW4gYWRkaXRpb24sIGFzIGRvY3VtZW50ZWQsIHRoZSBjaGFuZ2UgaW4gY3B1
DQo+IHN0YXRlIG11c3QgYmUgY29uc3RhbnQsIGJlZ2lubmluZyB3aXRoIGEgZGlyZWN0IGp1bXAu
DQo+IA0KPiBsb29rdXBfYW5kX2dvdG9fcHRyIGNhbiBoYW5kbGUgYW55IGNoYW5nZSBpbiBjcHUg
c3RhdGUsIGluY2x1ZGluZyBpbmRpcmVjdA0KPiBqdW1wcy4NCj4gDQo+IA0KPiA+IDIpIEhvdyBj
YW4gSSB2ZXJpZnkgdGhhdCBkaXJlY3QgYmxvY2sgY2hhaW5pbmcgaXMgd29ya2luZyBwcm9wZXJs
eT8NCj4gPiAgICAgICAgV2l0aCAtZCBleGVjLCBJIHNlZSBsaW5lcyBsaWtlIHRoZSBmb2xsb3dp
bmcgd2l0aCBnb3RvX3RiICsgZXhpdF90YiBidXQNCj4gTk9UIGxvb2t1cF9hbmRfZ290b19wdHIN
Cj4gPiAgICAgICAgTGlua2luZyBUQnMgMHg3ZmRhNDQxNzJlMDAgWzAwNTBhYzM4XSBpbmRleCAx
IC0+IDB4N2ZkYTQ0MTczYjQwDQo+ID4gWzAwNTBhYzZjXQ0KPiANCj4gV2VsbCwgdGhhdCdzIG9u
ZSB3YXkuICBJIHdvdWxkIGhhdmUgYWxzbyBzdWdnZXN0ZWQgc2ltcGx5IGxvb2tpbmcgYXQgLWQg
b3ANCj4gb3V0cHV0LCBmb3IgdGhlIHZhcmlvdXMgYnJhbmNoeSBjYXNlcyB5b3UncmUgY29uc2lk
ZXJpbmcsIHRvIHNlZSB0aGF0IGFsbCBvZiB0aGUNCj4gZXhpdHMgYXJlIGFzIGV4cGVjdGVkLg0K
DQpUaGFua3MhIQ0KDQpJIGNyZWF0ZWQgYSBzeW50aGV0aWMgYmVuY2htYXJrIHdpdGggYSBsb29w
IHdpdGggYSB2ZXJ5IHNtYWxsIGJvZHkgYW5kIGEgdmVyeSBoaWdoIG51bWJlciBvZiBpdGVyYXRp
b25zLiAgSSBjYW4gc2VlIGRpZmZlcmVuY2VzIGluIGV4ZWN1dGlvbiB0aW1lLg0KDQpIZXJlIGFy
ZSBteSBvYnNlcnZhdGlvbnM6DQotIGdvdG9fdGIgKyBleGl0X3RiIGdpdmVzIHRoZSBmYXN0ZXN0
IGV4ZWN1dGlvbiB0aW1lIGJlY2F1c2UgaXQgd2lsbCBwYXRjaCB0aGUgbmF0aXZlIGp1bXAgYWRk
cmVzcw0KLSBsb29rdXBfYW5kX2dvdG9fcHRyIGlzIGFuIGltcHJvdmVtZW50IG92ZXIgdGNnX2dl
bl9leGl0X3RiKE5VTEwsIDApDQoNClRheWxvcg0KDQo=

