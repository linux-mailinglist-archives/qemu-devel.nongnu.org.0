Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F52F53C9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 21:02:43 +0100 (CET)
Received: from localhost ([::1]:36370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzmLp-00051X-Kc
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 15:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.peter@hensoldt-cyber.de>)
 id 1kzmIz-0004SW-0k; Wed, 13 Jan 2021 14:59:45 -0500
Received: from mail-fr2deu01on2132.outbound.protection.outlook.com
 ([40.107.135.132]:2657 helo=DEU01-FR2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.peter@hensoldt-cyber.de>)
 id 1kzmIw-0007fa-Np; Wed, 13 Jan 2021 14:59:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hW1HAbsunjDWl77fS/bZF5UVLgsROXc+Ewk170NOEIVAimyaGNMBdRQ4d7PB7YxMTDN5ofE7zRIjr7k2Pd1uLNVjz/VqWYepYmCcuXIg7DKOhIHhPemVtdennAQDCWL/NYJUc64Q1uCRD1FTg7kg/Y+P71y2L+76tz3w72l473L7wkKlY6/YGnOgx3w3rqwXu0S/sZf01buoqlicSjOsZsxAJ4MU9kUfCqrgfX4/xrz147dlKUwTat69UO+Ge5/SZ8BflVR6O7OVclDtPyUxy3B6X9SV16ZlkwAngsa6wyTGivqzucAKZUHajNWTI7VGr40QnsL59YaGbGzLRzul+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMdo4MMLV0cqntDxhJ75E39ByXBfOARpkBZnDr4doO8=;
 b=N+FDHxfw9c8qtgHjiG5S7f0BZRwCjkcYO3mf/HJkmP2EYhPADETDGFvsc9ZRcPb7qZv72m0Y3BkKvFmaCgkbV3j7N8ArlFbk+ONNjT2cV9iA6Kt/zwTMuWaYBN1DfCKowYe7BsRBXFjKwr1/+dcOs439+mL90DziKU5Ca3oIgaesO4GuZG4ILX+WbuKi3C6AHKC6u7U0ZCqUB/t/O/2GuAudAcYn8jIb5aqzUMrOUOMJPjHP7xwChayB8o/sIL2m0Sz83raoEtvg5DpLX+duPVL91ZXLlDkgqKUBypepQ8JrnBn1fv+3HTVTCUFiqseDRYjlhKau4FTSM+CUlBfHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hensoldt-cyber.de; dmarc=pass action=none
 header.from=hensoldt-cyber.de; dkim=pass header.d=hensoldt-cyber.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hensoldtcybermuc.onmicrosoft.com;
 s=selector1-hensoldtcybermuc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMdo4MMLV0cqntDxhJ75E39ByXBfOARpkBZnDr4doO8=;
 b=H58sTWAlJFps7jPmKDfpkEiD8UYdCnSC3zO5B8SEC69UYxrofzxux9dkY6X28V0tyIT/aXUArm4fo5pOanq/pR90U6K5yvULvNK14ZTLI2BPKZQaErF+9dRrrYOlj7NiUyNiiE6FlHirZ/OHnBifR33lvPqejJT3gupArJkL+gNAzS3+K6X4YfPAx6y1LHBTEi415x0HfDRE4jXqEEniV0EwJDCuBlnC+uQ4QUnX9IbA651h+yTIlcalvMe1b83xhyKyT99em4yAx7+43c1gfax6Pq/T04t/92ZV1xpKY9ngMMFQHKIPhcF6krpfmnTmOwfZu5YCo7fRFD6ZulUI8g==
Received: from (2603:10a6:d10:b::15) by FRYP281MB0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.5; Wed, 13 Jan
 2021 19:59:38 +0000
Received: from FR2P281MB0171.DEUP281.PROD.OUTLOOK.COM
 ([fe80::e5ca:d5cd:bc83:a3c]) by FR2P281MB0171.DEUP281.PROD.OUTLOOK.COM
 ([fe80::e5ca:d5cd:bc83:a3c%9]) with mapi id 15.20.3763.010; Wed, 13 Jan 2021
 19:59:37 +0000
From: Michael Peter <michael.peter@hensoldt-cyber.de>
To: "damien.hedde@greensocs.com" <damien.hedde@greensocs.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: Re: [PATCH] Initialize Zynq7000 UART clocks on reset
Thread-Topic: [PATCH] Initialize Zynq7000 UART clocks on reset
Thread-Index: AQHWwoHQiM0NUtwtTU6wGSn3YTG5+6oc2pyAgAjLpoCAAKH1gA==
Date: Wed, 13 Jan 2021 19:59:37 +0000
Message-ID: <a0031b33ac498bd6930301a2f4c06f07170df410.camel@hensoldt-cyber.de>
References: <FRYP281MB0158389968A2A1C231F3A585ABFB0@FRYP281MB0158.DEUP281.PROD.OUTLOOK.COM>
 <CAFEAcA9-EP7s-gNCsXf_59eOfo+hvTX_EwJjg02dHt0eyWOk9A@mail.gmail.com>
 <15fc51bf-1473-2808-583e-c58eb1620577@greensocs.com>
In-Reply-To: <15fc51bf-1473-2808-583e-c58eb1620577@greensocs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: greensocs.com; dkim=none (message not signed)
 header.d=none;greensocs.com; dmarc=none action=none
 header.from=hensoldt-cyber.de;
x-originating-ip: [2a01:c22:6e1a:9300:f420:32ae:7f47:900c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7880759-473c-44f5-2256-08d8b7fdc1dc
x-ms-traffictypediagnostic: FRYP281MB0208:
x-microsoft-antispam-prvs: <FRYP281MB020810070D89542E467F76AAABA90@FRYP281MB0208.DEUP281.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jLC/M/zwp3NwIWmmycFWLd2sUi+4IOpMSGyqkXTaAbuBgKGDsu4OVK1JWV69AOEU2otvvFt7zC8Xb87FZJ5VNZTRMpOZTAqy0g5VUUDLixWJT8J5xrPgL9toF9UKNs2yqQcwyPy5QKglCMqsffYz8g9kdNtGWeKSD+9v+igJL5WLFZZjoxnei22iqyxpdVRpW7zEQOcjt1wqPZnAVZJY/U5TsR81nNduZeqpqRH5x5NPS83qwacG/a5YEN7UdR9dEMkxn60vKB0/HTmUPpdH6rIOVlzbSCTTx3AlWQwg0pPmn355WQA5InIJl8vNXaZzZVkOxQeHlSPvROpPhNKrx16Fj+dZlzufJAIL6Jx73Kg0S/75UWTNQ9mSqD4qOXarnMM0vMsEC13P8ayLkSU1o2ppofj+oIdZQX2whmOZO0GcEab4ilUm+NvmCVvuekuM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FR2P281MB0171.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39840400004)(346002)(376002)(5660300002)(8676002)(4326008)(86362001)(54906003)(66446008)(186003)(6512007)(53546011)(64756008)(110136005)(6486002)(83380400001)(316002)(478600001)(76116006)(91956017)(66556008)(2616005)(6506007)(71200400001)(36756003)(44832011)(66476007)(66946007)(2906002)(8936002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OC9nb1lxaHNoT0hSeVZHWHBvaGVYSkFHSWxkSG9lZmNVVmVTZ2NGODVYdFVh?=
 =?utf-8?B?a1JzMEx6NnFHb3FPVW5MbUpjS2NnYTZFQUNlVkczd2lBMnBQcHYxMFk5ZVNw?=
 =?utf-8?B?WmRPMVBib1dINE5vUGhIUGFIT0swSFh5bmZqQ0hpSVBaUmtPdWFVRWN4T2pO?=
 =?utf-8?B?a05jZVhzWDI3THNjU0l6OFhHYmpueFFUU1RUSFBIWGxqQS9YZG9udThnenZ6?=
 =?utf-8?B?Y2p5RFA4OUZHUlhpdkxIVUtoaGdQU3krbWk2S0llOUVTRE5tZ1BRV0RoZmxt?=
 =?utf-8?B?Z1pseVF6WVJOZmZIanRLaFAxQmpBUFlBQkRCaHNta2pDcGQ5bjFEOGJtK0VW?=
 =?utf-8?B?UG9QSXFva3hBUHg2SWszc21OYnpjdDRoSEFUMXNWYkIrb3ZCOXRUM21kSEY3?=
 =?utf-8?B?d3FWUmhMVnVXZHVHMGo5VVpVVzFDcmFXS1BrK3drcmNydmFmZU55alRaTyt5?=
 =?utf-8?B?RWNOMEI5TUUrMC9CWGRYTVNDMnJiUE5oQjhNUWN0eW1hVTNBYSsrS1B1Rnly?=
 =?utf-8?B?SVhLR1VBMGNtOHdLQzRJUDA4ZE9mZVI0aGNxN1VFZk9PSzR5YUkybVJ2dEl0?=
 =?utf-8?B?aEVNcnZmWmVkenhvOFhmVEtqRTZDMzkzZ09qZ215UldGYkhQd3dkSGx6cDZW?=
 =?utf-8?B?ditIc0ZScFN3dTdPUzFqVVJYZ2lxWCt5TlljcUNiWmVkOUhFVXN3VVZYcWpn?=
 =?utf-8?B?VnNRYWNTaUlWNzg0YTBMVGFBUitJQm40K010N25VR3VHVm10cFZtUmdvU1Bu?=
 =?utf-8?B?aTBRWmQ1OW43NHc3OFBXZVJnUG1EQ3ZBaWNjcFdXY0FQVDJ2UExZa1N6R2tn?=
 =?utf-8?B?Z1BOVUV0bGUxaUpvb25oT1V2Y3RDalUyVzJwQ0hzRXNEa2Z4dW5HQXc1NVdo?=
 =?utf-8?B?Q1kzWGF2c0VuMjNuVjdkRm04Y2lWVG1qSVloTXFBUFJGdmZ2SkhQQUlyQjdD?=
 =?utf-8?B?aWt2RkYrZGQxZkR5TlNMTTY0d1dObVE0dXczUFN6Zjk3aUJYd2ljMG5TRHNu?=
 =?utf-8?B?ZmF0RTZpdnp6dURPMEtJb21tUFNobmRDMUVrWWRWQ0xhRDN1citMS2YzWXky?=
 =?utf-8?B?UzFQd3FpQVRyZGtDVSszVDdWUWs4emdBb1REeTFhL1F0Mi84RHg5S1ZacW04?=
 =?utf-8?B?WXN6MkNFbmR6UW5WcnN4eHdBUjQ1MEw0VVh2WVNEc2lMMFk5VzZrWVpKc0RZ?=
 =?utf-8?B?Qm4rR3kyWmF3bUluMEg1a0ZrVytLenlVUHQ0QmRUaUdacEZDT3NkQlRMaCtN?=
 =?utf-8?B?SW15S01DWVYvdG8xeEl1SU5QMmI2QklBdXhiQ0FOYml4S0NSWEJhQWRRT3M3?=
 =?utf-8?B?RlNHVTM1VXhpakIrNHFUOTZGSm5QZE5qTzJvQ2hUNTloeTE2SXpVU3RZZDdU?=
 =?utf-8?B?ZXk2czhLeTBOM2RYVmlNZ3FhckxsQ0J3NDUycCtmUTUvV1dBTmM4S1N3Y2ZR?=
 =?utf-8?Q?Yvql7UvI?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <96243C69850FAB4397C8FB8B50B7DFF8@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hensoldt-cyber.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2P281MB0171.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d7880759-473c-44f5-2256-08d8b7fdc1dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 19:59:37.8599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 77dfadea-3647-43b9-b48b-9c5540a475cd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eYOufxPmbwWDwzaV0KAvzxFPhJJOcpOdTKplhHJ5p5xF6e2WNoSP3qMsxknFo2OrwbY3G1NN3b8kuowmu1urSZJLPedLb+F0N/hcCAUZgrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB0208
Received-SPF: pass client-ip=40.107.135.132;
 envelope-from=michael.peter@hensoldt-cyber.de;
 helo=DEU01-FR2-obe.outbound.protection.outlook.com
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
Cc: "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQpEYW1pZW4sDQoNCk9uIFdlZCwgMjAyMS0wMS0xMyBhdCAxMToxOSArMDEwMCwgRGFtaWVuIEhl
ZGRlIHdyb3RlOg0KPiBUaGlzIGlzIG9rIGJ1dCBJJ20gYWZyYWlkIHdlIG1heSBlbmQgdXAgZG9p
bmcgdGhpcyBraW5kIG9mIHRoaW5nIGluIGENCj4gbG90IG9mIGRldmljZXMuIFNvIG1heWJlIHdl
IHNob3VsZCBjb25zaWRlciBjaGFuZ2luZyB0aGUgYmVoYXZpb3Igb2YNCj4gZGV2aWNlX2lzX2lu
X3Jlc2V0KCkgc28gdGhhdCBpdCByZXR1cm5zIGZhbHNlIGluIHRoZSByZXNldC1leGl0IGNhc2Uu
DQo+IFdoYXQgZG8geW91IHRoaW5rID8gKEkndmUgYSBwYXRjaCBmb3IgdGhpcywgd2hpY2ggbWFr
ZSB0aGlzIG9uZQ0KPiB1c2VsZXNzKQ0KDQpJIGNvbmN1ciB0aGF0IGEgZ2VuZXJhbCBzb2x1dGlv
biB3b3VsZCBiZSBwcmVmZXJhYmxlLiBNeSBwYXRjaCB3YXMgb25seQ0KbWVhbnQgdG8gaGlnaGxp
Z2h0IHRoZSBpc3N1ZSBieSBwcm92aWRpbmcgYW4gYWQtaG9jIHNvbHV0aW9uLg0KDQpUaGFuayB5
b3UgZm9yIHBpY2tpbmcgdXAgdGhlIHRvcGljLg0KDQpCZXN0IHJlZ2FyZHMsDQoNCk1pY2hhZWwN
Cg0KPiANCj4gQnV0IHRoaXMgcGF0Y2ggZG9lcyBub3QgaGFybSBzbywgYW55d2F5Og0KPiBSZXZp
ZXdlZC1ieTogRGFtaWVuIEhlZGRlIDxkYW1pZW4uaGVkZGVAZ3JlZW5zb2NzLmNvbT4NCj4gDQo+
IE9uIDEvNy8yMSA5OjAwIFBNLCBQZXRlciBNYXlkZWxsIHdyb3RlOg0KPiA+IEFsaXN0YWlyL0Vk
Z2FyL0RhbWllbiAtLSBjb3VsZCBJIGdldCBhIHJldmlldyBmcm9tIG9uZSBvZiB5b3UNCj4gPiBm
b3IgdGhpcyBYaWxpbnggY2xvY2stZ2VuIHJlbGF0ZWQgcGF0Y2gsIHBsZWFzZT8NCj4gPiANCj4g
PiB0aGFua3MNCj4gPiAtLSBQTU0NCj4gPiANCj4gPiBPbiBUdWUsIDI0IE5vdiAyMDIwIGF0IDE4
OjU0LCBNaWNoYWVsIFBldGVyDQo+ID4gPG1pY2hhZWwucGV0ZXJAaGVuc29sZHQtY3liZXIuZGU+
IHdyb3RlOg0KPiA+ID4gDQo+ID4gPiBQYXNzIGFuIGFkZGl0aW9uYWwgYXJndW1lbnQgdG8genlu
cV9zbGNyX2NvbXB1dGVfY2xvY2tzIHRoYXQNCj4gPiA+IGluZGljYXRlcyB3aGV0aGVyIGFuIHJl
c2V0LWV4aXQgY29uZGl0aW9uDQo+ID4gPiBhcHBsaWVzLiBJZiBjYWxsZWQgZnJvbSB6eW5xX3Ns
Y3JfcmVzZXRfZXhpdCwgZXh0ZXJuYWwgY2xvY2tzIGFyZQ0KPiA+ID4gYXNzdW1lZCB0byBiZSBh
Y3RpdmUsIGV2ZW4gaWYgdGhlDQo+ID4gPiBkZXZpY2Ugc3RhdGUgaW5kaWNhdGVzIGEgcmVzZXQg
c3RhdGUuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUGV0ZXIgPG1pY2hh
ZWwucGV0ZXJAaGVuc29sZHQtY3liZXIuZGU+DQo+ID4gPiAtLS0NCj4gPiA+ICBody9taXNjL3p5
bnFfc2xjci5jIHwgMTIgKysrKysrLS0tLS0tDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2h3
L21pc2MvenlucV9zbGNyLmMgYi9ody9taXNjL3p5bnFfc2xjci5jDQo+ID4gPiBpbmRleCBhMmIy
ODAxOWUzLi4wNzMxMjJiOTM0IDEwMDY0NA0KPiA+ID4gLS0tIGEvaHcvbWlzYy96eW5xX3NsY3Iu
Yw0KPiA+ID4gKysrIGIvaHcvbWlzYy96eW5xX3NsY3IuYw0KPiA+ID4gQEAgLTI2OSwxMiArMjY5
LDEyIEBAIHN0YXRpYyB1aW50NjRfdA0KPiA+ID4genlucV9zbGNyX2NvbXB1dGVfY2xvY2soY29u
c3QgdWludDY0X3QgcGVyaW9kc1tdLA0KPiA+ID4gICAqIEJ1dCBkbyBub3QgcHJvcGFnYXRlIHRo
ZW0gZnVydGhlci4gQ29ubmVjdGVkIGNsb2Nrcw0KPiA+ID4gICAqIHdpbGwgbm90IHJlY2VpdmUg
YW55IHVwZGF0ZXMgKFNlZSB6eW5xX3NsY3JfY29tcHV0ZV9jbG9ja3MoKSkNCj4gPiA+ICAgKi8N
Cj4gPiA+IC1zdGF0aWMgdm9pZCB6eW5xX3NsY3JfY29tcHV0ZV9jbG9ja3MoWnlucVNMQ1JTdGF0
ZSAqcykNCj4gPiA+ICtzdGF0aWMgdm9pZCB6eW5xX3NsY3JfY29tcHV0ZV9jbG9ja3MoWnlucVNM
Q1JTdGF0ZSAqcywgYm9vbA0KPiA+ID4gaWdub3JlX3Jlc2V0KQ0KPiA+ID4gIHsNCj4gPiA+ICAg
ICAgdWludDY0X3QgcHNfY2xrID0gY2xvY2tfZ2V0KHMtPnBzX2Nsayk7DQo+ID4gPiANCj4gPiA+
ICAgICAgLyogY29uc2lkZXIgb3V0cHV0cyBjbG9ja3MgYXJlIGRpc2FibGVkIHdoaWxlIGluIHJl
c2V0ICovDQo+ID4gPiAtICAgIGlmIChkZXZpY2VfaXNfaW5fcmVzZXQoREVWSUNFKHMpKSkgew0K
PiA+ID4gKyAgICBpZiAoIWlnbm9yZV9yZXNldCAmJiBkZXZpY2VfaXNfaW5fcmVzZXQoREVWSUNF
KHMpKSkgew0KPiA+ID4gICAgICAgICAgcHNfY2xrID0gMDsNCj4gPiA+ICAgICAgfQ0KPiA+ID4g
DQo+ID4gPiBAQCAtMzA1LDcgKzMwNSw3IEBAIHN0YXRpYyB2b2lkDQo+ID4gPiB6eW5xX3NsY3Jf
cHJvcGFnYXRlX2Nsb2NrcyhaeW5xU0xDUlN0YXRlICpzKQ0KPiA+ID4gIHN0YXRpYyB2b2lkIHp5
bnFfc2xjcl9wc19jbGtfY2FsbGJhY2sodm9pZCAqb3BhcXVlKQ0KPiA+ID4gIHsNCj4gPiA+ICAg
ICAgWnlucVNMQ1JTdGF0ZSAqcyA9IChaeW5xU0xDUlN0YXRlICopIG9wYXF1ZTsNCj4gPiA+IC0g
ICAgenlucV9zbGNyX2NvbXB1dGVfY2xvY2tzKHMpOw0KPiA+ID4gKyAgICB6eW5xX3NsY3JfY29t
cHV0ZV9jbG9ja3MocywgZmFsc2UpOw0KPiA+ID4gICAgICB6eW5xX3NsY3JfcHJvcGFnYXRlX2Ns
b2NrcyhzKTsNCj4gPiA+ICB9DQo+ID4gPiANCj4gPiA+IEBAIC00MTAsNyArNDEwLDcgQEAgc3Rh
dGljIHZvaWQgenlucV9zbGNyX3Jlc2V0X2hvbGQoT2JqZWN0ICpvYmopDQo+ID4gPiAgICAgIFp5
bnFTTENSU3RhdGUgKnMgPSBaWU5RX1NMQ1Iob2JqKTsNCj4gPiA+IA0KPiA+ID4gICAgICAvKiB3
aWxsIGRpc2FibGUgYWxsIG91dHB1dCBjbG9ja3MgKi8NCj4gPiA+IC0gICAgenlucV9zbGNyX2Nv
bXB1dGVfY2xvY2tzKHMpOw0KPiA+ID4gKyAgICB6eW5xX3NsY3JfY29tcHV0ZV9jbG9ja3Mocywg
ZmFsc2UpOw0KPiA+ID4gICAgICB6eW5xX3NsY3JfcHJvcGFnYXRlX2Nsb2NrcyhzKTsNCj4gPiA+
ICB9DQo+ID4gPiANCj4gPiA+IEBAIC00MTksNyArNDE5LDcgQEAgc3RhdGljIHZvaWQgenlucV9z
bGNyX3Jlc2V0X2V4aXQoT2JqZWN0ICpvYmopDQo+ID4gPiAgICAgIFp5bnFTTENSU3RhdGUgKnMg
PSBaWU5RX1NMQ1Iob2JqKTsNCj4gPiA+IA0KPiA+ID4gICAgICAvKiB3aWxsIGNvbXB1dGUgb3V0
cHV0IGNsb2NrcyBhY2NvcmRpbmcgdG8gcHNfY2xrIGFuZA0KPiA+ID4gcmVnaXN0ZXJzICovDQo+
ID4gPiAtICAgIHp5bnFfc2xjcl9jb21wdXRlX2Nsb2NrcyhzKTsNCj4gPiA+ICsgICAgenlucV9z
bGNyX2NvbXB1dGVfY2xvY2tzKHMsIHRydWUpOw0KPiA+ID4gICAgICB6eW5xX3NsY3JfcHJvcGFn
YXRlX2Nsb2NrcyhzKTsNCj4gPiA+ICB9DQo+ID4gPiANCj4gPiA+IEBAIC01NTgsNyArNTU4LDcg
QEAgc3RhdGljIHZvaWQgenlucV9zbGNyX3dyaXRlKHZvaWQgKm9wYXF1ZSwNCj4gPiA+IGh3YWRk
ciBvZmZzZXQsDQo+ID4gPiAgICAgIGNhc2UgUl9BUk1fUExMX0NUUkw6DQo+ID4gPiAgICAgIGNh
c2UgUl9ERFJfUExMX0NUUkw6DQo+ID4gPiAgICAgIGNhc2UgUl9VQVJUX0NMS19DVFJMOg0KPiA+
ID4gLSAgICAgICAgenlucV9zbGNyX2NvbXB1dGVfY2xvY2tzKHMpOw0KPiA+ID4gKyAgICAgICAg
enlucV9zbGNyX2NvbXB1dGVfY2xvY2tzKHMsIGZhbHNlKTsNCj4gPiA+ICAgICAgICAgIHp5bnFf
c2xjcl9wcm9wYWdhdGVfY2xvY2tzKHMpOw0KPiA+ID4gICAgICAgICAgYnJlYWs7DQo+ID4gPiAg
ICAgIH0NCj4gPiA+IC0tDQo+ID4gPiAyLjE3LjENCg==

