Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE2241F45C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 20:08:36 +0200 (CEST)
Received: from localhost ([::1]:47322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMxX-0007UX-98
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 14:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1mWMp1-000372-QN
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:59:48 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:8618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1mWMow-0000zs-Fd
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1633111180; x=1633715980;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9rBFLqHJKB2AngI6tORh3d11KLbiJdrP72ANbY5itas=;
 b=khe5aQBPPTHTy+SAfwKn0IEvqoHQFYubwR0X2kH3g+biYRget3/AeU68
 L58cjpLtTDIfeU4bHiGVoGKv3Oda/g91jTfCXEYRPopJ/+/byuKEH033P
 ux4tpPYmhNEwoGVp/iEQbQmL2x6iQhWpGZDIO7Zay2r+v7ravFogk/TJH M=;
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 17:59:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ul7fyNmZfaQ/iCJM+fawJqMm0tdLoz9N8N+g+lHHTHX88VbKr4w3X8QcF10AYFgvp7kr6SQItt1w6NHI80IIiEKoOhtRWqwELGFYgaQjC4PUbF+Cy9Tx34m4gTH+/B2rvS3EA45z7C5EM3zL/DpI2ckZVthQNB+YWGNmQr9M2IAWqNXJbAE7mMUmCZ75SVrDzEZQrk9HShokGm3IBx8guzFQYd6pvY9BbIcU8UUlMwGLnJo2/lcfS4xZRbA40G4CaVGoyAjjsDfhx6agDtdS9cDFPlqNCo7WsonAANDrGnOJHF/dMyItWlw+nSubWD5c29HalhHk7YHPrFKEH/dlfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rBFLqHJKB2AngI6tORh3d11KLbiJdrP72ANbY5itas=;
 b=AtLXZyZE1qrJPg1y5jNvQK19IsD2GdzC/9iXPS5ALt6BOmonpOOYjc6RoFYY/MMY0KVZx9PyDWxvn3kBYlYdS4mEhluHPrI/E86lut9Pv+Q/hWVCDDtheY6Z27U7ajsElFCBxbsBjjjo5ZMKo72qdvkW18zBbPvWGfNz9By9qd5DiQeMcx9pmhWhrAAX4F8nQIXOmpph5j3M2mC5EZ5UGgAlA7ZzKrlF3HdZcdFp3m3DTvBINw6pgYTWYuc8C7pAGFBpP9Rqzxg8yWiFyzjVLWynESJaQT/9DO/9t/orssUDuU++HNktOP9FmNrVCgVyxAbz6Rj0iOFf9Bggaaq39w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SA2PR02MB7673.namprd02.prod.outlook.com (2603:10b6:806:143::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16; Fri, 1 Oct
 2021 17:59:30 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5012:ec15:af97:2c90]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5012:ec15:af97:2c90%5]) with mapi id 15.20.4544.022; Fri, 1 Oct 2021
 17:59:30 +0000
From: Brian Cain <bcain@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: hexagon container update
Thread-Topic: hexagon container update
Thread-Index: Ade25RCxllT+hUwlRb2vNrqCSUbc9QABASCAAABlCPA=
Date: Fri, 1 Oct 2021 17:59:30 +0000
Message-ID: <SN6PR02MB420572E9084C240BE8E698CAB8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <SN6PR02MB42057F473618E661B72E1FF3B8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <107df921-3339-7b73-15f3-daba2d61882e@linaro.org>
In-Reply-To: <107df921-3339-7b73-15f3-daba2d61882e@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44326ae8-04db-45a4-3a74-08d9850537d1
x-ms-traffictypediagnostic: SA2PR02MB7673:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR02MB767327EDC75BCFC108103BCEB8AB9@SA2PR02MB7673.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dXE/QekDzX3AcHS7O2cOKCGe0ixbiW+KCL9dnlZBs4x4Zm0jXDR4DYO/naGw/bfzux8udWt4+MIJi18LIX3Is/hRtPd2v4wG7wWb51Dgiqyyn4WPATEmZeHdYUzBZi1qf0kItdqCV2a++p4F2B7AkOGyFbN5xXFz2xRGAtPOVZHeizpAwGWGYMfmOIq0+qC3zX7Pj2WBRCc98cwDpZWhnKHwLR+76T++xz2BpuE1wA8xJTv8x2b3U3J15tQpWoa+BnlDoUUuLty5NbQsUqFU0/bCQ6pqE1ZfvBePdeDGvN5uBHDnM6MXl0p4ptlMxsaj+2tm++2kYIyJXieJki3BZ8w3QID9mshbmvks2w+rA6Ho/6k1+U/52fL0qiULr4ScXBN6RC98ubC4Uw7KMfqkAjSB0mS4ZgeHXeINTWSlMmBgA/Y0+6P39sS2R/1XPAey41G3vHBg7ZpsZUzuDA0FwJk8GfcxYWGmAIf0XqJIu6T+l1H6LIKmQs8sDrInI4WUM66mtUfJAx1JKv6BL1h6uwcixljkgtUCeMtDMu2AuHUPMfammvjh97RSa0VinqsThSVL0x28RuxTfJd8/ejFiA2P/QVEFXbVAvTeZLPWRH33xqg5W71UOwsUTjyY0f2kImv0kfl7tn56uLcchbmKmEHHvM3BUXppODMyo/s2Vg+7iqpNuFjnXi8Y7eIT7WXGhzBSioPHOx2IPIoPx2iJuQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(8676002)(55016002)(38070700005)(8936002)(508600001)(110136005)(9686003)(2906002)(186003)(316002)(7116003)(52536014)(66946007)(53546011)(7696005)(6506007)(66446008)(122000001)(76116006)(107886003)(3480700007)(64756008)(86362001)(15650500001)(4326008)(5660300002)(71200400001)(33656002)(66556008)(38100700002)(66476007)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmRoNHZXcTZvNVBKSTMvc0lvMGNJTGZPM0EyTlZ4TWtXU2llcGlOY0p3dFYv?=
 =?utf-8?B?TGtjZWRPaE9tVzBXUXZqU0p2TnhZU1hRcUVUd3VqOHJtVVBrSElMNmQrWjEv?=
 =?utf-8?B?Nmh2QWx0MlNyNkt6aHNIN0o1TzBDMnZLd0FkZzg4TGlaOThJRFFJL2lmUkJt?=
 =?utf-8?B?SWtkWmVVcWxBa2dCQmN3WTdNNExEM1NpR1o2Z3dnVmc3eDBCYUNtWjBycHBD?=
 =?utf-8?B?Unl4SjUxdXVKM1RBaVByYWZTeFZrMThJUjNKY1U0N3hyMXdSYUtBemZubS9F?=
 =?utf-8?B?d1VlR1ZKekZKWXJNd0VvTWhTclRhTklxOG5DWDZ6RFAxbEtvY0lqMGxaQUNL?=
 =?utf-8?B?NHBKN3ZiN3NqTFZjMXV5azFRSXAxSS8zb0NOQzlhMUVnZEZQT2VXcDhaYmVr?=
 =?utf-8?B?NVFCcnlZbHZzd3VDdWhNYkFQVEZ4MW15NWttZHBTdnVPekRKdUJVZWNadVVX?=
 =?utf-8?B?VzdaSzZQbFhhdWdxVXdLTFJJdzFsanQ3b2x4RDFURktMY1ZuMTRZNkEveDJ1?=
 =?utf-8?B?Y3NvYTVIMUxHMmFFbEFZeGh6LzdjTjN0M1Fudm03WUNVZU9nb1Q3aTFSZ2JQ?=
 =?utf-8?B?aWtDbVpmN2dqb3hqUUQzY0N6WUlhbFhaY1U0NmJ0MXEyT1dPdTJhQW1JQ2di?=
 =?utf-8?B?dVBJNG5WUmlQbzhRdUx3YkRQTnRsU00vMlF2c1Qrb0J2bG1ad29kQ09ZSkRT?=
 =?utf-8?B?WXhGd1lEOTBuUmRZOW10S1QxeUlrM1F2WkgxT3BRd3BMY1c5eEdKUkw1Skha?=
 =?utf-8?B?QXZ2RWNmeGNRS0tjWXNVTm1wdW01aGRNcU9vQzVveGZKZW9ITlErSzVqZTZN?=
 =?utf-8?B?Wm9qWW1saVNibGZIaHZYeXZvVEhRbW15ZklidGVoK3pReWNSbGZWVXRrMTJs?=
 =?utf-8?B?V3YrbU5mZjlENktYMmxMazA0dk9FM0E0T1dtNU4wOGhreklZVlA0WlhaVlNp?=
 =?utf-8?B?OXMxUzFBVCt0NW9RSG1IeENWbjE2cml1ekp6WnhDb1puenNZUVRlNEhDRXBl?=
 =?utf-8?B?VWtJUmV4dXpTalRUU2RyYlNva0NtSnhyaEVhUkQxNDRNa3ExcFpTUS9nOTNT?=
 =?utf-8?B?SlIrcW95bHkyOFdDU3dpd2tkdEwwNG9uUHhjVmNUWThKMUtIV1hCT2IrQzRw?=
 =?utf-8?B?VXZFSEhWUm5rZEp5dXZoeHlQd28xc0tOc3NDMjhJbk9MSEFLL0ZiUHI4NXVL?=
 =?utf-8?B?RGsvalFWQ2Rzdm1vRFFCSDI2blhOS1V6NnZJUmExOGlQN3lwMXJoMytZNncz?=
 =?utf-8?B?dGtvSnlJVWFocmNNSmpBb1I5a3lTMWdCZEhpS3dOZmxYZDYrY1hEUDRFdmta?=
 =?utf-8?B?VkFaR3RyWmxUQkVYemUvNUJoWU1IdEtlYjhXMXpLRUZuUGtGbURxUWhVZ1Bo?=
 =?utf-8?B?OExTMEswVDErYkpGRHhJTzBKUWQvLzZsNGQ5OHZ2c05mQUQrYzFySEoxSXlr?=
 =?utf-8?B?WWRwZnVZajFtcmZGOXJrOWZuVVZxOU90TCtXN1hmdGFMTSt4bGkzUit2R3J4?=
 =?utf-8?B?bTRJU1kyMWo4OXdYSmw0bVFDNkc1SHBTaVFXVGpTdURKWHM0OEpEMjI1cTdB?=
 =?utf-8?B?OThxMzBiUStzNnVDREtSSmF3blh4WlcyeDIwOTNOR2Vmb0gvU2wvN1NGeTg3?=
 =?utf-8?B?eVpZOHZGdDlpQS8vMGFOakdRL3lwaXFOZG9TUHhBdmNDRWFZTUVodzc0dUY0?=
 =?utf-8?B?eDQwZFhlYXF2YjNTMGlUNGNLKzBYalZkU1hEMUE4N1lRdHMxZVFreXB0N24x?=
 =?utf-8?Q?3gpazW9CYaJX/7HpjKdlha+roZICCdCdOIRH3BX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44326ae8-04db-45a4-3a74-08d9850537d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 17:59:30.6296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mgPu8rTPmgxwqas6uK7rg+ktmxqfIooOg2/H9Szu2t3p72q+uaHc5VvAzvrqi9uwtrHsbnYUWz3B6rs/akBfrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7673
Received-SPF: pass client-ip=216.71.140.77; envelope-from=bcain@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIEhlbmRlcnNvbiA8
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCi4uLg0KPiBPbiAxMC8xLzIxIDEyOjU5IFBN
LCBCcmlhbiBDYWluIHdyb3RlOg0KPiA+IEFsZXgsDQo+ID4NCj4gPiBXZSBuZWVkIHRvIHVwZGF0
ZSB0aGUgZG9ja2VyIGNvbnRhaW5lciB1c2VkIGZvciBoZXhhZ29uIGZvciBuZXcgdGVzdCBjYXNl
cw0KPiBwcm9wb3NlZCBpbiBUYXlsb3IncyByZWNlbnQgcGF0Y2ggc2VyaWVzIHVuZGVyIHJldmll
dy4gIFRoYW5rZnVsbHksIENvZGVMaW5hcm8NCj4gaGFzIHByb3ZpZGVkIGEgYmluYXJ5IG9mIHRo
ZSBoZXhhZ29uIGNyb3NzIHRvb2xjaGFpbiBzbyBub3cgSSB0aGluayB3ZSBjYW4NCj4gc2ltcGxp
ZnkgdGhlIGhleGFnb24gZG9ja2VyIGZpbGUgdG8gc29tZXRoaW5nIGxpa2UgdGhlIGJlbG93LiAg
SSBob3BlIHRoaXMgYWxzbw0KPiBtZWFucyB0aGF0IHdlIGNhbiByZW1vdmUgdGhlIGV4Y2VwdGlv
bmFsIGhhbmRsaW5nIGZvciB0aGUgaGV4YWdvbiBjb250YWluZXIuDQo+ID4NCj4gPiBJIGNhbiBw
cm9wb3NlIGEgcGF0Y2ggYnV0IEknbSBub3QgcXVpdGUgY2VydGFpbiBob3cgdG8gdGVzdCBpdC4N
Cj4gDQo+IG1ha2UgZG9ja2VyLWltYWdlLWRlYmlhbi1oZXhhZ29uLWNyb3NzIE5PQ0FDSEU9MSBW
PTENCj4gDQo+IGFuZCB0aGVuIG1ha2UgY2hlY2stdGNnIHRvIHVzZSB0aGUgbmV3IGltYWdlLg0K
DQpPayAtLSBzbyB0aGUgaW50ZW50IG9mIHRoZSBOT0NBQ0hFIGlzIHRoYXQgaXQgd2lsbCBmb3Jj
ZSB0aGUgdXNlIG9mIG15IG5ld2x5IG1vZGlmaWVkIERvY2tlcmZpbGUgYW5kIG5vdCB0aGUgb25l
IGluIHRoZSBxZW11IGNvbnRhaW5lciByZXBvc2l0b3J5Pw0KDQo+ID4gVGhlICItLW5vLWNoZWNr
LWNlcnRpZmljYXRlIiBhcmd1bWVudCB0byB3Z2V0IGlzIHZlcnkgYmFkIGJ1dCBJJ20gbm90IHF1
aXRlDQo+IGNlcnRhaW4gaG93IHRvIHVwZ3JhZGUvY2hhbmdlIHRoZSBjb250YWluZXIncyBjZXJ0
aWZpY2F0ZSBzdG9yZSB0byBhY2NlcHQgdGhlDQo+IGFwcGFyZW50bHktbGVnaXQtYnV0LXBlcmhh
cHMtbmV3ZXItdGhhbi1leHBlY3RlZCBjZXJ0aWZpY2F0ZSBwcmVzZW50ZWQgYnkNCj4gY29kZWxp
bmFyby5qZnJvZy5pby4NCj4gDQo+IEh1bS4gIFRoaXMgYWxsIHN1Z2dlc3RzIHRoYXQgaXQgd291
bGQgYmUgYmV0dGVyIHRvIHVwZGF0ZSB0aGUgYnVpbGQtdG9vbGNoYWluDQo+IHNjcmlwdC4NCg0K
SWYgdGhlcmUncyBhbnkgdHJ1c3QgY29uY2VybnMgd2UgY2FuIHZlcmlmeSB0aGUgZG93bmxvYWQg
aW4gdGhlIGRvY2tlcmZpbGUgdXNpbmcgdGhlIGhhc2ggZmlsZSBmb3IgdGhlIHRhcmJhbGwgYW5k
L29yIHRoZSBncGcgc2lnbmF0dXJlLg0KDQpUaGUgYnVpbGQtdG9vbGNoYWluIGlzIGEgYml0IG9m
IGEgaGFzc2xlIGdpdmVuIHRoZSBwcm9jZXNzaW5nIHRpbWUsIGl0J2QgYmUgZ3JlYXQgdG8gYXZv
aWQgaXQuICBJZiB0aGUgaGFzaCBvciBzaWduYXR1cmUgY2hlY2sgZG9lc24ndCBzdWZmaWNlIEkg
d2lsbCBpbnZlc3RpZ2F0ZSBob3cgdG8gdXBkYXRlIGRlYmlhbjEwJ3Mgc2lnbmF0dXJlcy4gIEFy
ZSB3ZSBib3VuZCB0byBkZWJpYW4xMCBmb3IgYWxsIHRoZSBjb250YWluZXJzPyAgSWYgdXNpbmcg
YSBkaWZmZXJlbnQgYmFzaXMgd2FzIGVmZmVjdGl2ZSBhdCByZXNvbHZpbmcgdGhpcyBpc3N1ZSwg
Y291bGQgSSBzZWxlY3QgYSBkaWZmZXJlbnQgb25lPw0KDQo+ID4gUlVOIGNkIC90bXAgJiYgXA0K
PiA+ICAgICAgd2dldCAtLXF1aWV0IC0tbm8tY2hlY2stY2VydGlmaWNhdGUgJHtDTEFOR19VUkx9
DQo+ID4gUlVOIGNkIC9vcHQgJiYgXA0KPiA+ICAgICAgdGFyIHhmIC90bXAvY2xhbmcrbGx2bS1T
ZXB0LTIwMjEtY3Jvc3MtaGV4YWdvbi11bmtub3duLWxpbnV4LQ0KPiBtdXNsLnRhci54eg0KPiAN
Cj4gWW91J2Qgd2FudCB0byByZW1vdmUgdGhlIHRhcmJhbGwgYXMgd2VsbC4NCg0KWWVzLCBnb29k
IHBvaW50Lg0K

