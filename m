Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5E16B724A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 10:15:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbeGR-0005le-N0; Mon, 13 Mar 2023 05:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1pbeGK-0005lE-UA
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:14:36 -0400
Received: from mail-psaapc01on2106.outbound.protection.outlook.com
 ([40.107.255.106] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1pbeGD-0000jp-38
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:14:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TP/91IaVZD+Pcq3aHO66j35C9kW0UW/lZJsDIkXCnhxU3SmPlPB0mlXGS4IoMh2Vh8CdOhaSxJPLzK6LSfkcEKHzX0WYOLmpT4d7rNzjQhy2eDqbk7aieSm1iNzc6yYlRY7UpyA9KnEAi/arc4d2MO2WzEiZycctw0omUiW9T2FO+axGLEJxkqmXxOmI2Xcav2+orhYdVrbJsfGrLIcCPgLzZgtGtoE/iAJckzfaA9g/QhCLOVg2PX6yHN2y7/3uBi1PNPzKvpmTzjOXJidG5rEAT+LwrdYyC5d7ySyVU9CeeMFsRoGSZnQ7B4BBPnu34HDtnYmcqG+cH6dnLmpWdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0kKrNDl5AQqFjHGwZZP76Z6Czvz8AqnwwW0+7hyGyU=;
 b=ViFIfpJYzIXutJZJJbkkvQrJld7jNXDYQXERUhcuWOUV2PhIinsRGgajXOHm8WEdlNaE5yPn1cjv4ZfVIFtpXwRoTvb2jMOuG1r8ffG0CzR0UnEQKvRRWw2pqHTULsRd+MxHFNKKPVAulHNMSZQs6x1mQo6J4JoF4AcrIBt2+oNDdf8HQ+WRWTQ/+UghcHakdnfFf9AFua+1xaP8u2vzhlnpssBOWVRaQ9K3qYdePoaJtWnodSRBNI+pwuy7TLsxT916JhEJPzrD5HWnaegURrT4UjKVjBI+KKxHYhJqkkjSzuDyUEdO7Iw5R8TuFsahyLT3Z3i166l/vv6O+ZL+Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0kKrNDl5AQqFjHGwZZP76Z6Czvz8AqnwwW0+7hyGyU=;
 b=UVtlUfao5jN+OnpjxpDltdToRCPz6yw95HdGpwTvE3ODSZqvwGqoHmWtFBELd8e2G1svnc7+4wDt68w3aSU731y+3rYlxfESkJSwgp7Opfj7YfnwvDLryBnJTC09SvcD5z8/A6Kr+cCA8QXaQQRFN6dcmslq7cGAQGfNT2qXO9jfwfBNiN68xQuVBTCDu+1Qq5aAZD1UESNdRkaJVhutV41TDStI3fJJyigQ4uGXGD2FBQ4yf41nvK60G8KH/MsQD3N072soxoGfLsyTn+wekGFa4fmykaA6dEm7InVDaUqjhc8c3GmvmD7FpsKvzJ6SO/uOSDL1y+K49Xw1bO3QRQ==
Received: from TYAPR06MB2158.apcprd06.prod.outlook.com (2603:1096:404:19::21)
 by KL1PR0601MB5840.apcprd06.prod.outlook.com (2603:1096:820:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 09:09:19 +0000
Received: from TYAPR06MB2158.apcprd06.prod.outlook.com
 ([fe80::9ba0:2077:3447:d0c3]) by TYAPR06MB2158.apcprd06.prod.outlook.com
 ([fe80::9ba0:2077:3447:d0c3%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 09:09:19 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Steven Lee <steven_lee@aspeedtech.com>, Howard Chiu
 <howard_chiu@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: RE: [PATCH v2 03/10] contrib/gitdm: Add ASPEED Technology to the
 domain map
Thread-Topic: [PATCH v2 03/10] contrib/gitdm: Add ASPEED Technology to the
 domain map
Thread-Index: AQHZU3qlcW554Svh7UujMsUhPQ6glK74b5/w
Date: Mon, 13 Mar 2023 09:09:19 +0000
Message-ID: <TYAPR06MB2158E6E8730EB3BEEE371A0E8AB99@TYAPR06MB2158.apcprd06.prod.outlook.com>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
 <20230310180332.2274827-4-alex.bennee@linaro.org>
In-Reply-To: <20230310180332.2274827-4-alex.bennee@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYAPR06MB2158:EE_|KL1PR0601MB5840:EE_
x-ms-office365-filtering-correlation-id: 89aa3682-5397-4975-fa64-08db23a2a0d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xaqz/X9HOKM/49fe1PkbQh911cvdjqITlQQuAqdIPW+qyOjSATVuympnMwWMlT2olrjAkdsgXLHmLBRA4H0kFwxHd+GgHns1dFmwgyQXg6SBsuKw6IGUySDTbp5Rw0kYUxsrWfJAVQNHlTDf44s+A3qDTuu9D0wSFTm2ImPTvoQ4xylDhzbuIe8Bt1PK5jDpo9XU78L7hh2lpA1JGVaPFDLh6O3CKIzqvN30gOOeethm7jl9zLKgKudi0OG6m8yIhVvzxctKgYxdANOAJOkg4wJY0PdrErQZrSdoUv4f/euc8v7h8JRoBhXMdTEtdisw9Yu7SwPgVleC1BoXjDgTO1ggiUyRiPJuSHMj6EgE2udUC/J5Lah1Pm9ysAKNF4Fpr24nJssvZ4pjm79+SsjuFfe+cRrSb/+jzQH5aKSwpbOrGHqf9JlCTlgEau45Fk4iDHybCIPyVHq++J50EeTXUfUjxA7+rFA6NvUth6TJ62lvtyAYS2xaVRh/J9j15CXoUy4STSRidv0dLQuhByG2OCSC2gU8EeCRGWVlCiqPYR4yy/dhuvzp0tLsTYNfDcoIXqoWcoCNo5GYUgUJEfsJJtxzbFbOUVWpcNoc0YEeZZQenhkRIPLVOl0gtSn68iTcle1nm1lGgLn7EyYraH8W/QscGlrfAyZOOqdNRWzIzmeEUNOSlX2Y7IJkyY2/AeUmEzprZRWe+f/YRuSgKGTSxg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYAPR06MB2158.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(39850400004)(346002)(136003)(396003)(451199018)(4744005)(5660300002)(83380400001)(186003)(478600001)(71200400001)(26005)(6506007)(107886003)(7696005)(53546011)(9686003)(38070700005)(8676002)(66476007)(76116006)(66446008)(33656002)(64756008)(66946007)(52536014)(66556008)(4326008)(41300700001)(8936002)(86362001)(54906003)(110136005)(316002)(38100700002)(55016003)(122000001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWJtOHIyOEM1RTJHR0x5b2x0aCt3eXBUdFlETXFlNy94M3UrUmtzcjFOcG50?=
 =?utf-8?B?bS84S0dDdGlkeHh4TEFocG5aVzlxUHhuZlpmQnhaUUlFVEVZczZrV09nakx1?=
 =?utf-8?B?R3JJc2wwTzBFYjk4a2NLY0EweUxscVRzM2x4eHkrTGY2YnVtNVZwTmZYUFM4?=
 =?utf-8?B?eUpOUVpmMDJrR1Y3RGRlblJrTG1pTDdyNzhmeHlRdVFjZ0VNWGVkTTJYbWFJ?=
 =?utf-8?B?cEljcEFSM2ozd3BsRmE0TjlSQzJEYUp1OGJDVDArZXY0ZWxVTkFJV1d3VUF5?=
 =?utf-8?B?c3MxbFFXNTl2MFpDWEQ2MSt2aUZYKy9UemRsWFU4NXZkeDBrT3hDNDdiNXpN?=
 =?utf-8?B?L3lVM09LYlo1Vm9KYVVNQ2NjV05mV09GVURSVzBMTG1uU0VQZ25sL0xMR3lF?=
 =?utf-8?B?K1gwZWhkeFdqMCtISEQzY01UUGg2UEVCbFNudjFXNm5iVFMvZUx6WVhpNW9p?=
 =?utf-8?B?RitMMzJRc3prUDhCMTQ0OHY5WVg3Y21SOW02YVB3dlFRTzdqaG02VjI4V3Fr?=
 =?utf-8?B?bzUrSkZKRU1LY1RqVlA0WnhrVTcrTGhjS1YvWUVHZkR1bmZIK1VtbkNzYTRs?=
 =?utf-8?B?SmNQbGZuL0lSd2xjTEZ3clA3SzQzN1NDN05KVDlhMWpnY0g0UVpFWFZVSDcx?=
 =?utf-8?B?V21TQXd3Z0xiM21Ld1lKQmUxcWUrUXVtZk94NHlsUmRFek1Wbk94NTZuMHlF?=
 =?utf-8?B?eGRVZTdUM1A4TzJndEZnTUZSVUxMMGZpZUxUUDNRT2Z6a0NVbmxCdTJIajk5?=
 =?utf-8?B?TXI1NXNWQWFuSmd1NXdPRG91VjlIbmU4dmNPTmlhQ0xTTEhzN3UvbWVjMG8x?=
 =?utf-8?B?NUVMcXBmdXRyb29ROXc3WFlpeVYwL0laYUswL01hVS9YYTlYbFVEdnUvN3dk?=
 =?utf-8?B?ODhJK0RPL1dCSytPT3RVNEJ0OVFSTEhDMmtMVWZBd3lkK1N4SE9TVVV3NXRn?=
 =?utf-8?B?bk9VNEtyeHRYcklBd3hKb0dKR2NoRHVZcXRBVlgyRnMzTE5LYm5QYVNuMXJq?=
 =?utf-8?B?TFhlTjBWUHRXaWlWUjNOREQ0YWF4UUh3bFpCMmV4Wm16Z2RTMTVwMnl2U3Jm?=
 =?utf-8?B?V2YwOEovdFpXazJrVUs5T1J5aTlxZkQ3RE9tTks4MVEzZFUrMTU3aGRVUmVN?=
 =?utf-8?B?aTIrTmk5T0s1THdEaW1abEQwa1o1NHUvN2dhTzdJVGU2cEZOcW9rUXNwOTVY?=
 =?utf-8?B?THl1VERWNHdaUFFBLzlmZ2tSYzhMeTM0Yll2ZTdidXN5ZjNra2RIdktoOENW?=
 =?utf-8?B?UW9jWU5UMUpUWUZ3VDAwb1FuQ01BMDIyTU0wT2VUZ0tKWU8wczRJak9halh6?=
 =?utf-8?B?TVUrb2hrd0dyalF3UzhRZS9BNGt2WXBxS2xQaDdRZktqUkZVdlVvWnhiVDIw?=
 =?utf-8?B?VW1CMXpYU3V3Zm9oRjlZWEthUHNtZWh6cjNQQUd6OEN2emtGK3pYUUlOUzdw?=
 =?utf-8?B?L1pVeGtPc05nK2YrWVZ4QVdSSTJGZHFydEtJeC9FM2VObGpPRTByZlNNT0xl?=
 =?utf-8?B?d29rU0hsQ3BMb25Xa1hwSnQvbFBlY0VWSC9TeC9MVHg0bThQYm10eUJ0UlJU?=
 =?utf-8?B?N1pjZ2h6dWw5bi9qY0dMdTMybUhPRGRNZTFkV0RoR25JNHJxOVUvV1NVNDVX?=
 =?utf-8?B?SFlSM2NSTDRaU0N1ZnVVY1laMktUbUozUEY5dG5iR2w3Y1FvVDJJL0pLVFZj?=
 =?utf-8?B?bC90aTJaVWJNc0RSM2hOYW5Db2xvUjB3NmxWNE5rcVNyU0FzNXVUb3Y2WmRq?=
 =?utf-8?B?UkJxeE5JMnp1d045Y2VJSC9NQVN6bkNRMm13QldOVjRKWjZSR1IrV1d5eFc4?=
 =?utf-8?B?aURwaXpvZERSRnd1clRyVy9vLzQxK3pXbkJ6WnlINFgzbjhJTFQ5U2hUTVR0?=
 =?utf-8?B?ZDNKVTRZRmJZUm5BM3J1aERwZk1SZVFOdUpZclNDTjRWU25vQTJ6SGlwbjZV?=
 =?utf-8?B?WmJmU2s5MjVBNkcydEErM3B1djd1TTJxQjNad2ZnbVVGZEczaU1ER0hwK1p3?=
 =?utf-8?B?TW9uRjdtcVQrc3F0NTJTK3Zlejl0aFgwVWVDZGQrSTRONnJ4VDdTK2ozZW15?=
 =?utf-8?B?QXp6WFAyNHZCWmVBQ3pJazdUVk40dWY4elFpdEZtZkp4bC9qRWdiRHNXMnlD?=
 =?utf-8?Q?cRYL5HkPEoLisKqSw6rbihCcV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR06MB2158.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89aa3682-5397-4975-fa64-08db23a2a0d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 09:09:19.2887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DtmMCcjMJs47+MZhAxFbTNywc11Vn7Y/kAY3z2xMuPM3pnMMFbDFmGjY6VoxB03KGFpfJnmwQ/gsn+VGo2G9OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5840
Received-SPF: pass client-ip=40.107.255.106;
 envelope-from=troy_lee@aspeedtech.com;
 helo=APC01-PSA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SGkgQWxleCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4IEJl
bm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFNhdHVyZGF5LCBNYXJjaCAx
MSwgMjAyMyAyOjAzIEFNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IEFsZXgg
QmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47IFN0ZXZlbiBMZWUNCj4gPHN0ZXZlbl9s
ZWVAYXNwZWVkdGVjaC5jb20+OyBUcm95IExlZSA8dHJveV9sZWVAYXNwZWVkdGVjaC5jb20+Ow0K
PiBIb3dhcmQgQ2hpdSA8aG93YXJkX2NoaXVAYXNwZWVkdGVjaC5jb20+OyBKYW1pbiBMaW4NCj4g
PGphbWluX2xpbkBhc3BlZWR0ZWNoLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyIDAzLzEwXSBj
b250cmliL2dpdGRtOiBBZGQgQVNQRUVEIFRlY2hub2xvZ3kgdG8gdGhlDQo+IGRvbWFpbiBtYXAN
Cj4gDQo+IFdlIGhhdmUgYSBudW1iZXIgb2YgY29udHJpYnV0b3JzIGZyb20gdGhpcyBkb21haW4g
d2hpY2ggbG9va3MgbGlrZSBpdCBpcyBhDQo+IGNvcnBvcmF0ZSBlbmRlYXZvdXIuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+IENj
OiBTdGV2ZW4gTGVlIDxzdGV2ZW5fbGVlQGFzcGVlZHRlY2guY29tPg0KPiBDYzogVHJveSBMZWUg
PHRyb3lfbGVlQGFzcGVlZHRlY2guY29tPg0KPiBDYzogSG93YXJkIENoaXUgPGhvd2FyZF9jaGl1
QGFzcGVlZHRlY2guY29tPg0KPiBDYzogSmFtaW4gTGluIDxqYW1pbl9saW5AYXNwZWVkdGVjaC5j
b20+DQoNClJldmlld2VkLWJ5OiBUcm95IExlZSA8dHJveV9sZWVAYXNwZWVkdGVjaC5jb20+DQoN
Cj4gLS0tDQo+ICBjb250cmliL2dpdGRtL2RvbWFpbi1tYXAgfCAxICsNCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2NvbnRyaWIvZ2l0ZG0vZG9t
YWluLW1hcCBiL2NvbnRyaWIvZ2l0ZG0vZG9tYWluLW1hcCBpbmRleA0KPiA3YTgwNzdlMjQxLi5i
ZDk4OWQwNjVjIDEwMDY0NA0KPiAtLS0gYS9jb250cmliL2dpdGRtL2RvbWFpbi1tYXANCj4gKysr
IGIvY29udHJpYi9naXRkbS9kb21haW4tbWFwDQo+IEBAIC01LDYgKzUsNyBAQA0KPiAgIw0KPiAN
Cj4gIGFtZC5jb20gICAgICAgICBBTUQNCj4gK2FzcGVlZHRlY2guY29tICBBU1BFRUQgVGVjaG5v
bG9neSBJbmMuDQo+ICBiYWlkdS5jb20gICAgICAgQmFpZHUNCj4gIGJ5dGVkYW5jZS5jb20gICBC
eXRlRGFuY2UNCj4gIGNtc3MuY2hpbmFtb2JpbGUuY29tIENoaW5hIE1vYmlsZQ0KPiAtLQ0KPiAy
LjM5LjINCg0K

