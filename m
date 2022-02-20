Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FA74BD0E0
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 20:14:29 +0100 (CET)
Received: from localhost ([::1]:45230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLrfA-0003kV-28
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 14:14:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nLrcJ-0002gH-QL
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 14:11:31 -0500
Received: from [2a01:111:f400:fe08::722] (port=28558
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nLrcF-0003xk-N2
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 14:11:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXA23DnmnRYz0Ze88rLTfbZ0cj7DHzA4ND3F4sRDpqjffNsFigvY25U37jRjtIGkPsk+Xa077cTPdB5k6du5jik4Dig811aM8tTVICzjH6ZEIeL+NyalZQH3pCGS7F8GTqXeoP9DdsjJGyGtLpguPrByhe51B27fAqPxOyFplSHt8pbdq8K0CAWtQm6aF/Sl8kjzU9ZaYunke/nZUt/XxexQJu49jRoKrmN+GTy0e9K6za8fnAHjq7GtjUoxYtUvz03YDXD1W0526+PL30yBUNaxbJcHN8O6Qf/95hwd/sGZcu50q4VXsMYyWg+JCGfSEU9SrA2BTCwiRWww4WpRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8j9SdF7Rh68Ii7Eh5zcDvbD5ERYtHzdi71rkRxUFRk=;
 b=a6M372GqTvr5WiyfZNbAZZ3OedUVB7EmLRP7qLb5pWZj9GkJ0gXeAPMESnK/TGHrA4/26MOmHRgP/OKis1xTvpxGqcq02MmqNqC/1vxvbY26ZOW6Z3p7AYVBE30ZTe8GFNA5iXvEIm2sVxbKN/HIVby6G2GtL1/IibwrdyrN1y0fUhTNOSVQFSkqcr5r7SMdt+C62YKwcqKCQIVZFNBV1npr2IvmgOAigYnf9btp1Nno3TMXDFiKsC42noNNwMjy8EzpQ1thzS5w/PkKBY0sukTfabsLKwG3AmJXK5asOp1E7WaI+h/PhXYTPYetUG/iNaLL6EaeVZNrf2ws346UiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neuroblade.ai; dmarc=pass action=none
 header.from=neuroblade.ai; dkim=pass header.d=neuroblade.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NeuroBlade.onmicrosoft.com; s=selector2-NeuroBlade-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8j9SdF7Rh68Ii7Eh5zcDvbD5ERYtHzdi71rkRxUFRk=;
 b=MtP5DdUK982YpFl5Lj3g4MFgWCM5xe9o6bbVfWzu6Qzsp6xS2Uw3/dm/ZnMQ3pl5PCyEyufVpWIt2OeUPgR6F8BqEGu2VQK00AHLjW8u/vt/JUzeXsMddku9ujKZJqpyHVAvS0IY4GuRdpLaOboeiBu4ZbsBhKJbEBU0PXVwIhA=
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com (2603:10a6:102:e0::15)
 by AM6PR09MB2310.eurprd09.prod.outlook.com (2603:10a6:20b:45::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Sun, 20 Feb
 2022 15:37:55 +0000
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::4c3d:dc4c:6ad0:6e5e]) by PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::4c3d:dc4c:6ad0:6e5e%5]) with mapi id 15.20.4995.026; Sun, 20 Feb 2022
 15:37:55 +0000
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH] target/nios2: Shadow register set, EIC and VIC
Thread-Topic: [PATCH] target/nios2: Shadow register set, EIC and VIC
Thread-Index: AQHYJlrEYpGI+4rFx0Sbw+zTMvvk+Kyci96AgAAAspA=
Date: Sun, 20 Feb 2022 15:37:55 +0000
Message-ID: <PA4PR09MB488001469F85B1B615B8864AEB399@PA4PR09MB4880.eurprd09.prod.outlook.com>
References: <a0b237cd-8351-4389-bd7a-450586323e7a@VE1EUR02FT028.eop-EUR02.prod.protection.outlook.com>
 <CAFEAcA_iv9Xm0c_CNzez4fQmXfWaA_dMjUOsgxqx9JoKFj_HGg@mail.gmail.com>
In-Reply-To: <CAFEAcA_iv9Xm0c_CNzez4fQmXfWaA_dMjUOsgxqx9JoKFj_HGg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26366728-950c-49b7-0a71-08d9f486f6fa
x-ms-traffictypediagnostic: AM6PR09MB2310:EE_
x-microsoft-antispam-prvs: <AM6PR09MB231081C516D56465949E3E77EB399@AM6PR09MB2310.eurprd09.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fSdka/O+LNUmNMGQn2oOavuvaTAGkLiY9JJvWeNBojessWJdM+KuxX9XGhwT2Sw1m+BYRx1PvRa1gNYmO4tQFYx3IhsADMZFxmnWlogmDMWrY+E8bFv06fmQFUlEAvjux0zsboXA7T6FmaOUsgIKbWsIrnRBlC7QOZSpoh80gGysOUB2sm3GcDv7boI+sOGv7Qzk7q3lEk43Fmj7DIY2FKpLFAyuxGsE9LT8WMm4f6y2b+8bkjVWlpJqlWZrOq/LRDlY8vX71/C0URzVWXhCtmO1aDHUti0pQoPCx/0VNLn71hUL+zQkUb4eB6XJ3mavMylg4u3n8WAsMtRTBtbf+djLT2xDesVGWOMU6Ahl4PIXcvbAw/3mjVDxB32aO/X3/c2pxJtqytHNVbWeXsVj0oj/cybcGRkbm6EEzSVZrV7FZ3/EIIxL374gpm6oXGaJkW4yI+OK0zHqQl08nT/YYVA596yj1SWMGQYtENi6U/xKhOkHKPiKqnYrvWsqQwR2J/kof4IyN3pMmb8Bj+NQYXE9xeWORmOFyShxtZMjk4iU6GmLGyJRvbNzcVootPwqV68JvloDPJ+7fCxMlT3Lc9NvtOScu345VOYJ7S/2Cg7pO2FtuaxGqUjwPV++wBpiqL9jQS3YBrtb84nZrRLEHY7YTnPGnmITn3nD9SJGbFngn7/yPKWCVeloaDXJx/w8z9M3RwZ836lJWRZOOYvp7cG66Q80vF/hVMvCCerKpOaQVNkw6ReX3k1urDjI/nimBbx4SA5Bdqg+VIwIL/9zzDx9COMKvjNfhQICIRxstgQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR09MB4880.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(376002)(39840400004)(366004)(346002)(136003)(396003)(7696005)(9686003)(6506007)(8936002)(71200400001)(44832011)(53546011)(5660300002)(6916009)(54906003)(316002)(64756008)(66446008)(66946007)(76116006)(8676002)(86362001)(508600001)(38070700005)(66476007)(66556008)(52536014)(55016003)(966005)(4326008)(2906002)(83380400001)(122000001)(38100700002)(33656002)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXZaS1ZCbU5TUmp5SzNLa0xIbEE3MTI2K09JWDhtWERyYmNPM3ppb0plOXY0?=
 =?utf-8?B?VXpxTHBVbjBUbHArbTNPSXpyTzIxUFlEUFE3RW1Zc1draCswN3l5VjFRTDBw?=
 =?utf-8?B?dkg0VHplcStTa3BoeEtTZzRwUllzVE1TQ3d6YWY3aVZEb0lOcUhhR1hLODhs?=
 =?utf-8?B?RnJSd2hKcmpOZHI3Yk8wUm9hU1BoWFJpSDExY3FsaW1FU2E2VnRKY1NVMlhI?=
 =?utf-8?B?emIrK0lTeHYrTThUSFVWYTNTVm91Y29xakdrdzUwb0pHcXM1TGlOYmcwVi9h?=
 =?utf-8?B?eHkxYWd4VU1kcmlYMFlsMm1mTmVpcDFUREkvaWRGMnhzekx3MU1keTRiSDB5?=
 =?utf-8?B?WlBQSm04SytaaE1aYTExNUFTSUEyRmFrWVR1SXBKWlNXVmxveml4Uzd5WjJs?=
 =?utf-8?B?d1lQbFR2Z0l6dEh4cW92L0s2cERKa1piOFZHTEs2Q0pLeS9CYVBha2M0N0Mw?=
 =?utf-8?B?WTFJMzJDRmxmZXkxTXQ5WnZGVHpjRlROZzM0TUVIbTRtV0JjQXhYdE43akFY?=
 =?utf-8?B?dFJlT3AyakY1NUdpcXc1T0RVQ0ZxSmpHdzNjSWt3OUo3d0FOa2ZiQTVtUDNF?=
 =?utf-8?B?YU5GcENaTDVONCt5U3VDRHZGMWtZRjdYdkpuUkM2R1dKd3FWaE94bVZqSXNL?=
 =?utf-8?B?aTlVYzVFSVpNVkVoOHBJMFNBV3k4RXJTTWNSWmRORExtT0NISW9xMzVydlJ4?=
 =?utf-8?B?UzVIckNDdWEzRGFCV0NzTm1YaDhPNjV0dkpTWlJoSnYvSzdRTU9WSU5idkdD?=
 =?utf-8?B?RHJhQ2R0Mm9MTFhGd1dGL1l1SjJsYUZoR09GRGZ1WWZkT29kYWZ4cUpkSzhs?=
 =?utf-8?B?QURSbFNyUTl3cGhjR2tTY1lmMEZYUHZpNDhMSDhxZHRKbmRtR2EwdHlid0w4?=
 =?utf-8?B?anpvWmVyL2ZFMWxQZDVRZ1hraXAyWkhoOHpTUDRtUmFVUENMSW9IWWJXTzN1?=
 =?utf-8?B?R2xwWVVqVUg5U0RySzVyN3FNU1dYMFFJYXhRMHF1Z0NsZUswd3hUQk9MMllI?=
 =?utf-8?B?akNqSVZrMkVhMVNod21nb2hubWFTajVweGlQWjFINHp6QU1wOHdjU0w0enFp?=
 =?utf-8?B?emFjeTUvS2d4bmY3WHY2R3QrVW01QW5XQ3BvaVJDcGtENlh5bUFkQWt5ZlNQ?=
 =?utf-8?B?R3J0UUpNRjZzYlN4VUlQQ3J1MmhZWmtDbm9aZXZRd3pzRjdRSmViVGVGZk9M?=
 =?utf-8?B?ckZDZDEyZGphYnJNL0tLR2kxTHBNYjYxcUViVE9VYzE5V1Y0azhCMFRFTXF6?=
 =?utf-8?B?TFlmQmZKaW9ncVFubmNPR2w0YVRIRkoxVjJjQlQ2bXIzOVYyenFRbXQvRERz?=
 =?utf-8?B?SHE0YzdoQUdONHRTQmdnaU1uSXpKelpwdlF1QlVuSUl5S1haYnE5SGxYMis4?=
 =?utf-8?B?Qk10eUhtMkhQNWFzVzFaL2orbzk2NU5kVFFFdzBUS3lnRC83YzdBRmpoSWU4?=
 =?utf-8?B?OTRENXhXZmREblNTcGhFcFZVZjZuanFCbEZySGVVb0Q0aDcySnNrUlZ3UUZ5?=
 =?utf-8?B?SG40aFhZMjJXVXhidWVSNVVBaWtLdWlVYS9HbzNmOC91Qk43UCtCRGE1dkVL?=
 =?utf-8?B?UEtRMHNwcExlY2ZBTE9PS2hib1ZMZ2RUYnR6VnJnTmY2ZENpTmNoVTBEdVRE?=
 =?utf-8?B?MkhTZXY3NWtta1pPUGxpZGVwWEMrQ0x1WEV5aStqQ2txUjFNL1pNTERkS0dN?=
 =?utf-8?B?bUVEWWlIM0cxckpneWZ4WTJQd2NLUVNLY3lPZTFDNWlrbXppQmFQNlY0TFlG?=
 =?utf-8?B?S0YzR3J5SldnZUNmNVZGSm04cVdDVDdsdGhtRUlvWk1XbHRCcytUUDJ0dFpj?=
 =?utf-8?B?UzlSY3ZlTm9Va3M0S2NDb2x4czVDc04xellsWHRRZHp1a3hNUlBpd3N0ZmNh?=
 =?utf-8?B?WWNLbmVveE5aOHJLY3UxVnVFWUtuWEJVUGxQTDZKdGY1RDhMTzFQbEx0c2F5?=
 =?utf-8?B?d1lHcER0djB4NGZWS3NVUWt6T0YyTHcyMml0d0ZvYm52bURGK3dRNldxZGMv?=
 =?utf-8?B?VjNuZEdDWFRjSFlZUlQ4U3dCaWVBV3hVeUE4YTFtMHNwdFBUNjhQc29PUldm?=
 =?utf-8?B?bTRocWFaUzZvQ0FyVXpBQW9rTVliNkd0VHlIRThQTGFJM1d1ZWVJTTdLdEhP?=
 =?utf-8?B?NUo1TmJJdHlvbFd4bHBPVEg4SzlUazBUSXA4bEZFUkZ4TUJuN29wYWgwclJ3?=
 =?utf-8?B?TStpQ1VBWG9oTFc3RGtmQ3RHaU94ZWxMV0VLcGhBRGJkQ1BvWUVXMlRyWkdR?=
 =?utf-8?B?VWdMZlhwVEVJeHcxRlRWTHlKZkRBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR09MB4880.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26366728-950c-49b7-0a71-08d9f486f6fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2022 15:37:55.5387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JDMTNQq3Run5CGbEDFLkH4PQ9HHvH+Bzo8x6YGQb53nP43RbKjV9wYyiiZB1bdMfqaWeFvCrwqmxOLBnoDQbyutp9bm4FiR5kGx8gsR4CNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR09MB2310
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe08::722
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe08::722;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUGV0ZXIsDQoNCkkgY2FuIHNwbGl0IHRoZSBWSUMgZnJvbSB0aGUgY29yZStFSUMgY2hhbmdl
cywgYWx0aG91Z2ggdGhlIGNvcmUrRUlDIGNoYW5nZXMgbWFrZSBsaXR0bGUgc2Vuc2Ugd2l0aG91
dCBhIFZJQyB0byBpbnRlcmFjdCB3aXRoIHRoZW0uDQpIb3dldmVyLCBJJ20gbm90IHN1cmUgaG93
IHRvIHNwbGl0IHRoZSBjaGFuZ2VzIHRvIHRoZSBuaW9zMiBjb3JlIGludG8gbXVsdGlwbGUgcGF0
Y2hlcy4NClRoZSBzaGFkb3cgcmVnaXN0ZXIgc2V0LCB0b2dldGhlciB3aXRoIHRoZSBFSUMgaW50
ZXJmYWNlIGFuZCBpbnRlcnJ1cHQgaGFuZGxpbmcgYXJlIHZlcnkgbXVjaCB0aWVkIHRvZ2V0aGVy
Lg0KDQpSZWdhcmRpbmcgdGhlICJmaXhlZCBlcmV0IiAtIHBlcmhhcHMgSSBkaWRuJ3QgcGhyYXNl
IGl0IHJpZ2h0LiBXaGF0IEkgbWVhbnQgaXMgdGhhdCBlcmV0IHdhcyBjaGFuZ2VkIHRvIHdvcmsg
Y29ycmVjdGx5IGluIHRoZSBwcmVzZW5jZSBvZiBhIHNoYWRvdyByZWdpc3RlciBzZXQuDQpTbywg
dGhlIGNoYW5nZXMgdG8gZXJldCBhcmUgcGFydCBvZiB0aGUgc2hhZG93IHJlZ2lzdGVyIHNldCBz
dXBwb3J0IG9uIHRoZSBjb3JlIGFuZCBjYW5ub3QgZXhpc3Qgb24gdGhlaXIgb3duLg0KDQpJIHRl
c3RlZCB0aGlzIG9uIE5ldXJvYmxhZGUgYm9hcmQgd2l0aCBKVUFSVC4gSSBkaWQgbm90IHdpcmUg
aXQgdG8gYW4gZXhpc3RpbmcgZGVtbyBib2FyZC4NCg0KPiBodHRwczovL3d3dy5xZW11Lm9yZy9k
b2NzL21hc3Rlci9kZXZlbC9zdWJtaXR0aW5nLWEtcGF0Y2guaHRtbA0KPiBpcyBvdXIgZ3VpZGVs
aW5lcyBvbiBwYXRjaCBmb3JtYXR0aW5nLg0KDQpJbiBmYWN0LCBJIHRyaWVkIHRvIGZvbGxvdyB0
aGVtLiBJJ3ZlIGFsc28gcnVuIGNoZWNrcGF0Y2gucGwsIGV0Yy4NCkNvdWxkIHlvdSBwbGVhc2Ug
cG9pbnQgb3V0IHdoZXJlIEkgZmFpbGVkIHRvIGZvbGxvdyB0aGVtIG9yIHdoYXQgSSdtIG1pc3Np
bmc/DQoNClRoYW5rcywNCkFtaXINCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4NClNlbnQ6IFN1bmRheSwg
RmVicnVhcnkgMjAsIDIwMjIgNToxMyBQTQ0KVG86IEFtaXIgR29ubmVuIDxhbWlyLmdvbm5lbkBu
ZXVyb2JsYWRlLmFpPg0KQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgQ2hyaXMgV3VsZmYgPGNy
d3VsZmZAZ21haWwuY29tPjsgTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQpTdWJqZWN0OiBS
ZTogW1BBVENIXSB0YXJnZXQvbmlvczI6IFNoYWRvdyByZWdpc3RlciBzZXQsIEVJQyBhbmQgVklD
DQoNCltFWFRFUk5BTF0NCg0KT24gU3VuLCAyMCBGZWIgMjAyMiBhdCAxMzowNywgPGFtaXIuZ29u
bmVuQG5ldXJvYmxhZGUuYWk+IHdyb3RlOg0KPg0KPiBGcm9tIDk5ZWZjZDY1NWU4M2YwMzRiY2Uy
NTI3MWZlNTkyZDg3ODk1MjllNTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQo+IEZyb206IEFt
aXIgR29ubmVuIDxhbWlyLmdvbm5lbkBuZXVyb2JsYWRlLmFpPg0KPiBEYXRlOiBUaHUsIDE3IEZl
YiAyMDIyIDE1OjQzOjE0ICswMjAwDQo+IFN1YmplY3Q6IFtQQVRDSF0gdGFyZ2V0L25pb3MyOiBT
aGFkb3cgcmVnaXN0ZXIgc2V0LCBFSUMgYW5kIFZJQw0KPg0KPiBJbXBsZW1lbnQgbmlvczIgVmVj
dG9yZWQgSW50ZXJydXB0IENvbnRyb2xsZXIgKFZJQykuDQo+IFRoaXMgaW5jbHVkZXMgRXh0ZXJh
bCBJbnRlcnJ1cHQgQ29udHJvbGxlciBpbnRlcmZhY2UgKEVJQykgYW5kIFNoYWRvdw0KPiBSZWdp
c3RlciBzZXQgaW1wbGVtZW50YXRpb24gb24gdGhlIG5pb3MyIGNwdS4NCj4gSW1wbGVtZW50ZWQg
bWlzc2luZyB3cnBycyBhbmQgcmRwcnMgaW5zdHJ1Y3Rpb25zLCBhbmQgZml4ZWQgZXJldC4NCj4g
QWRkZWQgaW50Y19wcmVzZW50IHByb3BlcnR5LCB0cnVlIGJ5IGRlZmF1bHQuIFdoZW4gc2V0IHRv
IGZhbHNlLCBuaW9zMg0KPiB1c2VzIHRoZSBFSUMgaW50ZXJmYWNlIHdoZW4gaGFuZGxpbmcgSVJR
Lg0KDQpIaTsgdGhpcyBwYXRjaCBzZWVtcyB0byBiZSB0cnlpbmcgdG8gZml4IG11bHRpcGxlIHRo
aW5ncyBhdCBvbmNlLiBDb3VsZCB5b3Ugc3BsaXQgaXQgdXAgaW50byBhIG11bHRpLXBhdGNoIHBh
dGNoIHNlcmllcywgd2hlcmUgZWFjaCBwYXRjaCBkb2VzIG9uZSBsb2dpY2FsIHRoaW5nLCBwbGVh
c2U/IEluIHBhcnRpY3VsYXIgYnVnIGZpeGVzIHRvIGV4aXN0aW5nIGNvZGUgKCJmaXhlZCBlcmV0
Iikgc2hvdWxkIGJlIHRoZWlyIG93biBwYXRjaGVzLCBzZXBhcmF0ZSBmcm9tIHBhdGNoZXMgYWRk
aW5nIG5ldyBmZWF0dXJlcy4NCg0KPiBUbyB1c2UgVklDLCB0aGUgbmlvczIgYm9hcmQgc2hvdWxk
IHNldCBWSUMgY3B1IHByb3BlcnR5LCBkaXNhYmxlDQo+IGludGNfcHJlc2VudCwgY29ubmVjdCBW
SUMgaXJxIHRvIGNwdSBhbmQgY29ubmVjdCBWSUMgZ3Bpb3MuDQoNCklzIHRoZXJlIGEgcGF0Y2gg
d2hpY2ggd2lyZXMgdXAgb25lIG9mIHRoZSBuaW9zMiBib2FyZHMgdG8gZG8gdGhpcyA/DQoNCmh0
dHBzOi8vd3d3LnFlbXUub3JnL2RvY3MvbWFzdGVyL2RldmVsL3N1Ym1pdHRpbmctYS1wYXRjaC5o
dG1sDQppcyBvdXIgZ3VpZGVsaW5lcyBvbiBwYXRjaCBmb3JtYXR0aW5nLg0KDQp0aGFua3MNCi0t
IFBNTQ0KDQpUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBtZXNzYWdlIGFuZCBhbnkgYXR0YWNo
bWVudHMgYXJlIGludGVuZGVkIHNvbGVseSBmb3IgdGhlIGFkZHJlc3NlZShzKSBhbmQgbWF5IGNv
bnRhaW4gY29uZmlkZW50aWFsIGFuZC9vciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uIGFuZCBtYXkg
YmUgbGVnYWxseSBwcm90ZWN0ZWQgZnJvbSBkaXNjbG9zdXJlLiBJZiB5b3UgYXJlIG5vdCB0aGUg
aW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgbWVzc2FnZSBvciB0aGVpciBhZ2VudCwgb3IgaWYg
dGhpcyBtZXNzYWdlIGhhcyBiZWVuIGFkZHJlc3NlZCB0byB5b3UgaW4gZXJyb3IsIHBsZWFzZSBp
bW1lZGlhdGVseSBhbGVydCB0aGUgc2VuZGVyIGJ5IHJlcGx5IGVtYWlsIGFuZCB0aGVuIGRlbGV0
ZSB0aGlzIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50cy4gSWYgeW91IGFyZSBub3QgdGhlIGlu
dGVuZGVkIHJlY2lwaWVudCwgeW91IGFyZSBoZXJlYnkgbm90aWZpZWQgdGhhdCBhbnkgdXNlLCBk
aXNzZW1pbmF0aW9uLCBjb3B5aW5nLCBvciBzdG9yYWdlIG9mIHRoaXMgbWVzc2FnZSBvciBpdHMg
YXR0YWNobWVudHMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4NCg==

