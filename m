Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1972744562D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 16:19:31 +0100 (CET)
Received: from localhost ([::1]:41142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mieWY-0006IT-6m
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 11:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mieUl-0004qk-7r
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:17:40 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:52040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mieUh-0007qp-NP
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1636039055; x=1636643855;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kBMk4D1N2cl05Hbx+ZDUH7Kn1yoOR0jMiUA1tbA0BYg=;
 b=MQ3ApqR0/xr9RI4XhRr7CYSZL9aEg+47XzGs/hQiSuYnq/r+zvbWQ9ca
 v3MGh2O3/pysdi60GXCZBr8Ymz8DQcf8nBM9wNZOsHN5G6KMo/JT6KTks
 LbLO5DMw8Mwp2uU5+QN+pc4kQ0s4UUN5eWSIWKpnMyIv3aZquL9Q2gp13 o=;
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 15:17:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCNf/leg10K51uxd9jjdchpxhvspqZulmhOXtGAxXtrODkZYrDY8cy1i7uMECRIr+gmNdpKdhCXsI5S/ztKuCi0ZGEKfDfeWOHxzoC5L+Bx6109R/ybVZ84+Z733/VHkUShHplkD5V7NO3HsZgA51c8AYd3OdHT3ClD8ki2MVtagCbxkz9t2QVbjg/QcVujOTfFwc9/n3taLSr/T48bTc3JiaiO+lVDYdyOd8SjFZXtAi4V7dpIHr/cdiYq5b9UIcLcKTcmtFWsJCzTz6CORbF8DAmAR94ksVd5U++eLy3pcJKBOIbR3R3lxNojWhNYy+LFFbg4K75TrBp+exkg5Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBMk4D1N2cl05Hbx+ZDUH7Kn1yoOR0jMiUA1tbA0BYg=;
 b=goMVSPqshz3CZGzE1tCyHj4SUDAN2YIBqVThgfr1qY7WIqGB9CxVhSO+pOwc9GYIrpQIxXboIWEzsVbOhfnmZDEtg1XDxPxrnOsN+4XiAgSPGnN8OvthHaRJFOIZE8z54l0Oy7kOQ+Gc0k1CmXifw0+Y0glVUUyeC6GBVIDCgien6CEB7vPMLz1bpPAZOnXaX762QX9HripOtcEqyLrV0MpYeZ/3XwALuac+88C5M6TqLFPpBiz2pgK6gljhmnGTMp1UG1z4e5JRSjWSfpo5KjCPISxKcu2P1rfUUEw7VZngEg9CTx385bGMkarnRhsrjELUOh+eeg3gt1jButhueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB4173.namprd02.prod.outlook.com
 (2603:10b6:805:2f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Thu, 4 Nov
 2021 15:17:31 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04%5]) with mapi id 15.20.4649.018; Thu, 4 Nov 2021
 15:17:31 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
Subject: RE: [PATCH] linux-user: Add GPL-2.0+ SPDX license identifier
Thread-Topic: [PATCH] linux-user: Add GPL-2.0+ SPDX license identifier
Thread-Index: AQHX0PHZqdb+NsmfjE6yP07Qr8rC4avzFLsAgAAPZQCAAFVwsA==
Date: Thu, 4 Nov 2021 15:17:31 +0000
Message-ID: <SN4PR0201MB880896CEC8C3B4F706E2F80BDE8D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211103203146.3630550-1-f4bug@amsat.org>
 <YYOirmDXpPq16ZMi@redhat.com>
 <891bd73d-771a-1463-ff2d-5885a6081cd4@amsat.org>
In-Reply-To: <891bd73d-771a-1463-ff2d-5885a6081cd4@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d319703-1f8b-4163-9740-08d99fa638bb
x-ms-traffictypediagnostic: SN6PR02MB4173:
x-microsoft-antispam-prvs: <SN6PR02MB41730CDBE71E45B55496E0F4DE8D9@SN6PR02MB4173.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z1/Bmn3hLFggxhpXlz4iiP3l06SKoyFrPPElRNG5k7rrqDQ3+U81BfXlqtU9RG6IKEFghsGw0BANYalAhEdeGToP1VOMfg1CWe0EnALulpTrXRhf1hdr/ppggRUFgRztP/0XpunFXNPufCkvuFU4Ih22dT0GGC+gK/O7c7RVRuzS4RQdc6KO7yD+Q26H69FEEc7abEHeKJsXblO+pM7J7CjUKL9GReUKuB7qmc3lbnuaYUsIHYgw6ocKYj+35954hsNMG6yMvEqxTzKtC39usJWtfvtZlacQaND0n+kP+c9wKxsnYgVHCQJg+KS9Y6GANRDfhrc4SX3yWkTkoAAk4MvQjKYbIakSWTyOKhZupD/eYrVNBYChJuOuncrXZINdwxFdbRYmIo+Bu45Lzu+nK6y8BONtjeeP2hpCI7/+lVkUX+zrUyO3/2kDgNSM4GysoD94iCWSArI6lHe+xTf6L610VG2UlCx0bUnDo9q3XUb9/QgWzqP8HXSUlDEdfJfVXzmNk7bzgF60AtgzxYWW6G9LChyMt5cvZRciw1LQEGvl2IEq3bvDt83pWaXV5sQv+8wcgJqflqEw5N/citTE3UxjTusvMRfc8JXY4ZtqaqzGDcEwruHwagHV3rt4uoY7JUXjGpAFNkZmzCWim1GYrtWDWq1nDrXLOFADFz36vLfm6JknQiG+i2D6dICk01wTxOG2FieJiq9OhU/xKW1b5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(64756008)(52536014)(38100700002)(76116006)(66946007)(54906003)(8936002)(86362001)(33656002)(5660300002)(66556008)(2906002)(186003)(8676002)(53546011)(316002)(7696005)(55016002)(83380400001)(9686003)(38070700005)(110136005)(122000001)(66446008)(26005)(508600001)(71200400001)(4326008)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXcyeUN4aUhCMFVneWo3RWkyd1psWDFnemZzcTIwandJTGQ0OFE5N0ozQWMr?=
 =?utf-8?B?TEVyYlZoZUozUFBnRnVTSTZZVnFBRjFJZFI3YzgrcEIvcWRaSE1Id1FEOGJs?=
 =?utf-8?B?eExUTkFEdnlMUUZvcXQrWWJzbVdlbWpRRWhZbjZGaXVyQUJDZXJFbXlaNkhH?=
 =?utf-8?B?YXF0cHpXZTVKRFNrV1BxUHNYSkNCMG1heklCMll3cE1qVFYvcmpaZVRlWFpl?=
 =?utf-8?B?MEkvVDJpaUVGQTBsekhXNm45cEFYZ0tTUUV2VGVKR29sNWNkVFQxaUx1UG10?=
 =?utf-8?B?TFA5UkpGS05Xb0xGdlYraEpXMlpIaFI3Z200S3Z5U1ZRNU1tTVJpYWsxUWs1?=
 =?utf-8?B?R3B5akZGaTNsZnRZR21lNWd0RnFVbFgvWVhYazBycDZUcFQrLy9BSEJ3ZEpN?=
 =?utf-8?B?c0JndmdOWS9xbzRKN054d3hxZERUWlVBTytxYnhXa3RzQk9SNUNqZUtaVTRq?=
 =?utf-8?B?Z3ZZZHBRN01haVg5L3ZRYUxrTUlPc1hBSzU0akZzY2xKSS9PZXpYMGJidXRo?=
 =?utf-8?B?YTRNaTdZZzU3Tkl3dmVxUDMwY0FSaTZrQTJoRHJpb0JLd2twZmZkTEg2UUcy?=
 =?utf-8?B?aW54M09yN0x0eTZ5VFNKVmc2angvS3FPTFE5WDJnMEZWeWtwRkNHQ1NFU0lK?=
 =?utf-8?B?TnB3MDVybzB1aFQ3OVQrS01aUExPZStHZDBkQ1d3ekdYM2JMblAwSFIwNWxz?=
 =?utf-8?B?S25BVFpKSEVRN0pWaWFqVkRWR1dtd2NrbXVHODVGSFhsak5oa3pPN21pOGpt?=
 =?utf-8?B?NU1zYjRaTGtPd09peU9mMGpOcFN2SStlb3JhRFJPZjZuZFZ4THM3RkZ1bUJa?=
 =?utf-8?B?eU5YRGVKWWk0TC9FQ2RBNWoybnJqdEV1MHRnaVFQK240S2Q2dDhNTHVIRDdi?=
 =?utf-8?B?WmlSRkFkSmZ0cU5mcVAxakxQdUFBUVhjbU5yVXFBcGZrbk5KYWExcHRsUkI2?=
 =?utf-8?B?T3AwV1Q2VkJXZ1YrSkl2RFY1RVprVmF5ek5zNzUvM1ErZTZHTE54Y0FXV0NM?=
 =?utf-8?B?V2FLNjZFQVNDeE11Q29uc2JLM0c2UnE0MVN6MEFCaWpKTlQ0VDlZVnQ5czg4?=
 =?utf-8?B?ZGxtRlFvMVdEVHNuRlljOUx2dlZCY1FLZyt4UXpaRWNEZFhzQXcwdXd3b1Z1?=
 =?utf-8?B?SHVzeEtLK1ZzMTJNT2p0UlM2MFEvUjVQSnZDdC90L2NKNDMyQ2xlQ24vZzhY?=
 =?utf-8?B?T2dGR3JiTDBaVHJyVnZYMHdIQlBNTEUrVmJDTzNFL0hGbzRqSVU3b2duNU5D?=
 =?utf-8?B?ZHJBeGZ4cG56YTBNNjBDalJ2dXlYK3VpczhiTENFeHJXQ0pnd3ZFRVpDSkM2?=
 =?utf-8?B?dFN6Q0tNNXYwUmFnNVhrL0p0YVFpNjF1Mzdud2ZmVjcvOHllOThKZjNXWGZK?=
 =?utf-8?B?NS84VForWk5xNWQ4b2ZDTnk5U045eWp5NFRTVU5aWVEyeEdkZDJpSzFyNGNV?=
 =?utf-8?B?dTZ4cENSL0RiNGJoQjhDV2lUM05oZ0RrL3U3QktNdWRaOENGaWZ6U09QZ1hK?=
 =?utf-8?B?RzFtdjR3cHJlOWNEMEFVNmVzcnUxc0hydE5IZFpDUjk1UC82M2U2REhZbk1O?=
 =?utf-8?B?cUJEcUlIRWpDQXVncE9mL3hwVjZ6bWhsMUpJSXdsRkhFR3FNbmFBUkhQbkFV?=
 =?utf-8?B?RE54a2F5VmtqOVFRSW5vOElMZGxrSEd3dnZZSS8waFVReHVSaEI5cjhhLzVp?=
 =?utf-8?B?aUJPenZVQUpjQXVjb25oMldNUjFhNi92MjMzV2pTclFXWTVpRmtja1RVM1p4?=
 =?utf-8?B?cGZ4MkhZZWdCd3lBN0pRU21OaURxQ01ObUh2amdHcHpicTYxbTR3Ni9tNGZt?=
 =?utf-8?B?UW1VeGcwbDQxamx3YW1zMjdJdEdGS0VhZkhhR3c0N1YyTUxHMFo3TDE1bDRk?=
 =?utf-8?B?QjFyNTZuM3kvWmZxM2RSNkwyNTRFN0QxdjRkOXhWUDVwUUdDWnpqS05IaCtC?=
 =?utf-8?B?ZktYemhEN2NXZk1VL0ZSa0JiSThSeUVTVksvT0JQTXdqNEFJU0hYRmExNGwr?=
 =?utf-8?B?dDNYcTB0OFBsZTNaN2JZM3pHZ213Ri9BTWhuVCt2bFVYS28zcGwrR2xaZzNV?=
 =?utf-8?B?U09lVXJFQ1p6N0RUOEtvN3hLazh5VnpuUHdIVlY0aWpYTTJNUGJFUTlWTTJW?=
 =?utf-8?B?SkQ4MmNORWt6OTVMVHZzZld2dlU0NEJRcGpjNldKaERVdzZpOGdFcDU2RkJy?=
 =?utf-8?Q?XRlLkPoO1k+y4h28gNGdF9c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d319703-1f8b-4163-9740-08d99fa638bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2021 15:17:31.3965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: odW5x+7mra6hUaYy2srSpM7AA04ctQ0lZ6it9jPeB+aALHJFypl0ts42lhS6Flv/UYBErMHvAvUMdkk9UdDakw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4173
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDQs
IDIwMjEgNTowMiBBTQ0KPiBUbzogRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0
LmNvbT4NCj4gQ2M6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IFJpY2hh
cmQgSGVuZGVyc29uDQo+IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPjsgcWVtdS1kZXZl
bEBub25nbnUub3JnOyBMYXVyZW50IFZpdmllcg0KPiA8bGF1cmVudEB2aXZpZXIuZXU+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0hdIGxpbnV4LXVzZXI6IEFkZCBHUEwtMi4wKyBTUERYIGxpY2Vuc2Ug
aWRlbnRpZmllcg0KPiANCj4gT24gMTEvNC8yMSAxMDowNiwgRGFuaWVsIFAuIEJlcnJhbmfDqSB3
cm90ZToNCj4gPg0KPiA+IFdoZW4geW91IHNheSAgIm1hbnVhbGx5IGFkZCIsIGNhbiB5b3UgY29u
ZmlybSB0aGF0IHlvdSBleHBsaWNpdGx5DQo+ID4gaW5zcGVjdGVkIGV2ZXJ5IGxpY2Vuc2UgaGVh
ZGVyIHlvdXJzZWxmIHRvIHZhbGlkYXRlIHRoYXQgdGhlIHJlcG9ydGVkDQo+ID4gbWF0Y2ggdHJ1
ZWx5IGlzIEdQTC0yLjArLCBiZWZvcmUgYWRkaW5nIHRoZSBTUERYIHRhZy4NCj4gPg0KPiA+IEFk
ZGluZyBsaWNlbnNlcyB0YWdzIGJhc2VkIG1lcmVseSBvbiBhIDYwJSBtYXRjaCwgd2l0aG91dCBk
b2luZyBodW1hbg0KPiA+IGluc3BlY3Rpb24gd291bGQgYmUgcXVlc3Rpb25hYmxlLg0KPiANCj4g
WWVzIEkgZXhwbGljaXRseSBpbnNwZWN0ZWQgZXZlcnkgbGljZW5zZSBlcnJvciBiZWZvcmUgbWFu
dWFsbHkgYWRkIHRoZSB0YWcsIGJ1dA0KPiBJIGFtIGh1bWFuLCBzbyBwcm9uZSB0byBlcnJvcnMs
IHdoaWNoIGlzIHdoeSBwZWVyIHJldmlldyBpcyBpbXBvcnRhbnQgOikNCg0KVGhpcyBzZWVtcyBs
aWtlIG1vcmUgb2YgYSBxdWVzdGlvbiBmb3IgYSBsYXd5ZXIgdG8gcmV2aWV3IHRoYW4gdGVjaG5p
Y2FsIHJldmlld2Vycy4NCg0KSSByZW1lbWJlciBkaXNjdXNzaW5nIHRoaXMgd2hlbiBJIG1hZGUg
dGhlIGluaXRpYWwgc3VibWlzc2lvbi4gIEF0IHRoYXQgdGltZSwgdGhlcmUgd2Fzbid0IGEgYnJv
YWQgcG9saWN5IG9uIHRoaXMuICBIYXMgdGhhdCBjaGFuZ2VkPw0KDQpUaGFua3MsDQpUYXlsb3IN
Cg0K

