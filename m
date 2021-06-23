Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5BE3B1992
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:06:58 +0200 (CEST)
Received: from localhost ([::1]:48150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw1ej-0000Xe-Tw
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lw1d9-0008At-K0
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:05:19 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:32062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lw1cz-00068W-2t
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1624449908; x=1625054708;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yg0OErPZBVtOZXKB06EGiVQEO8TTTi0OT5VvPB91qjg=;
 b=mW8wznQ5DFmJUDLCHNwkHZlNqXPIUfYcfv9tygyPkl5wo/UhZrrt2wZP
 7QfS3C0Vzu+Lofg8PqShw6DcbFq3n4uuYIVK2gnZVY/ZBx2N1oylH+Mnb
 911sHSCD7SoKCCLcuFTmtsp8cI5Np6Bw/DvVE4s56Aume0BHnuu/ZL1MZ E=;
IronPort-SDR: bM8YVqyRvPFP+Fx7GWTjkr7GUXgaw8wHtp3/2+DCRW7HrqQU8DscQNyVNJOPtzFNJZB+YCoTQB
 Xa+PIPwzqMMNT0wZZHIbP4cfbVx68WZv5UwsSRCxMAUSJCDwH0+SOK+shRw1E/iMSOkRTPI9os
 3ACcbdA2LCGpDRRcJEXG5mabp7gDfUbYZYrszO6TQuV3MtciM2Jtnyfw52A003kOsKO/VhpX50
 Rp00LDFSGDi3cN9fdiXwQEoauvQuvMiztd6NG0w9SqNYSF5fK26ExnyvWCSPLBsGhjh5JnUUxP
 9pM=
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 12:05:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWYrGDjIqXlV105HHjhtR4kP0+pnFhfGYrXBwCKD+bbCyGbkjgaNMXHDXNZPLAIRNlpmXvHsz48P0BKfV6eB/F9WR2x/5y0n7GZHE0uGuwAwbrhPJ8zNCz0f1nFxQQd7YrxSaJ+khvA5D4+eO8VNQtDC8G20SB4NegK/3Cz8HTG7oxDs3YIH6qwBkK+hO3w2SiZU2TczIRcIyDwlAmIRx+ok55jap5JmIzugjZDBso18zA3lAAhUf9LcgEYRkjgZdxeQ3fqm0FIHl6rexH38/64BIevAkvvJBR9OP9w0xscMVYfE8X7uSi6yiq6Mj3TnZrttic4rlN+0G8iJrALx8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yg0OErPZBVtOZXKB06EGiVQEO8TTTi0OT5VvPB91qjg=;
 b=czaILY5llB3DXCYO0ynKMuoj0LjSEEEE74D6iNK32PfFHS9xB7yreURHV2zT4y1bodSexLz6j6N2LniBT3HMu2XL1U/gNW4wg8pBZ2x/eiXg3OfgypDkCY6mm5bRTN7qKY5Gqvk/6+johRNKS7eNcP1l1IzgVh7+XXn3INvsuDAWRX3c+/d39sfLaRMSjfQKxElKYHtsZc0uC+viN8/xcYfVf0p8CDh0aSL7mhsRJQI6doKJJ6URrPNmIHWPs7vII3RRq32FRDVAl9RnkB8n5v2yqJufiupGyfRlYBBFv/2G6P4WTeri8+4pf5KESHaqJ7hqTP2c9zzWUmwzE/wa4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6993.namprd02.prod.outlook.com (2603:10b6:a03:23f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 12:05:00 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 12:05:00 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v5 06/14] target/hexagon: introduce new helper functions
Thread-Topic: [PATCH v5 06/14] target/hexagon: introduce new helper functions
Thread-Index: AQHXZO7CSPh8OP1ifkigfhzs4PWBs6shhMow
Date: Wed, 23 Jun 2021 12:05:00 +0000
Message-ID: <BYAPR02MB4886BFECEB3909FFCBEA7233DE089@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-7-ale.qemu@rev.ng>
In-Reply-To: <20210619093713.1845446-7-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88fff2ea-e64b-4c38-194d-08d9363f2081
x-ms-traffictypediagnostic: BY5PR02MB6993:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB69934A9D0673B341743CCBBADE089@BY5PR02MB6993.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:565;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vEDwcRndh5yOggnjS0xVtjYS4V4x31PBv2jabPU312+uAYrv8qlR5XJKYWdn/JU0CVx0zTE+03ZXry0SSs6/8TVbv0GLIqO9WbmdYBwhrR6FA6e48hd+RXxgv/REpXKdBcEsaHGibcueBUxfy9kK9w+Wj3LHxq94gcIZ30XcehdKcEimIANF+3fDm1CSCWDnL4lwc4N8FhRGdaoR70gCy7lcSrC8RKNEkTCkcJ1t3OZTQ168f9qSyuW4zH9jAUnK9vcQpg8GUNLiRHv7C5cqMRAmV5Z1ACcnHZv81uFed+YnkR9NqfioDxq9yMrIq8X8dgXMQUNAhd3WSSK0X43xWTwGxbdeTjt0UPvHSo1j94WTpbir913/9KtnAu+cOnjHLEGTNT/OSllnxrMF2Cwks4pjDeNwp93qIc0gzOYg3HR/qLZOzYtsOvLndA6+bjZkNFVn4DTqMmC+RL0dKScybD5bv7h64FWFVVEfn0ny76fikF4UO76cZ9O9fMTu1x74FzG4kOWGgzvNiORBrEB6IR5Yx0CZqvw3weZskOZv+HS8IZqUZBzc1E/gi35lYa2aEt3wVV/qUZdRTRqQKz6UqMmrfIfrBrUnTI2YKz6aopY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(9686003)(4326008)(5660300002)(71200400001)(122000001)(55016002)(54906003)(316002)(110136005)(52536014)(38100700002)(7696005)(478600001)(2906002)(83380400001)(8676002)(86362001)(33656002)(6506007)(66946007)(53546011)(66446008)(64756008)(66556008)(66476007)(8936002)(26005)(76116006)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFNLc3hzc21UemdtTVExOGtnbTBsSGUyb2pWR2ZRL25xNUhMdFpJRnV1bmc1?=
 =?utf-8?B?eHF5YmNISkRaaEdQVU5XZndSb3ZRdVZEaUtXcFJ0Z0V5RkJqQ2hlSnM4TjJ3?=
 =?utf-8?B?U3dnRlRta2xLaHhFclp4ZUFKTHpzQVRtT3MweFdvK2hiTEw3WEZSK2VidUdO?=
 =?utf-8?B?a09MMGtRNkxHU0w5TGQ1amxsYzZoQW1oQ1c5L3piTktQaDVhN1h2SFcyT1RL?=
 =?utf-8?B?bmtFMUtSRCs5RThwZ1VCS29HWEZGYkV4OUhMNU84b2JOejRmNGNqVk02cDBK?=
 =?utf-8?B?d3cxWU9jS1R1bTBZNUd0Ynk5ejVmTnZDbEQ2dU5aS1RsU2lwRDZSS1VWNkNP?=
 =?utf-8?B?TXNwV2pWL3Z3alN6VUprZFdvOXZacm1TMkRMODJ0K2RFSUt5Zk10TXhMMGJ6?=
 =?utf-8?B?andUb0gydFNwVjIwSkFMSjRZcXM1bmlydFdGNWtWc0s1RExaMnRDYWR1RnRT?=
 =?utf-8?B?Tm5Vdkx5UDNsYklnRUdYdmRtNEhlZWEyaWQ1cEhBNWd4RkNaYVJ1L1MzM054?=
 =?utf-8?B?NURxOTdSVmFLK09KNjBmRFV5R280bzRIQVQzeUQ2NUpDOFBQNTRwNFQ1NFpK?=
 =?utf-8?B?Nno3akFpQ0preEpQRS9IWWtVS2JKSE9lMFd5Z3VIb2NrUWkwZm5lSjJEdm5Z?=
 =?utf-8?B?MWFPNFJxcHRxY2V0b0RrUXVPbVZnVlYxNUZXSWRMTFVsckd6WHRFaERBZzdH?=
 =?utf-8?B?cWtqQ0lKcnBNelZuai91NVJOL1NCOUU1YjlvQzdrb0I1NW5ETzBOSlI5RjJi?=
 =?utf-8?B?RVdzMnBNTUl0ODRLQ2ZlZFYyUk9xRERvYmxRR2NER0hkejdlMUszR3BvVUxX?=
 =?utf-8?B?Z0hLVXNxZ1Y1emZDN1hVNEFPMmxSRE9GZ0hXTjV1ZWRsWkFwbHZoYjg2eWRh?=
 =?utf-8?B?dFB5MG5IRUhZbCs3cm9Ic0hIV0VUN0s1NkpVRVZ6TksvME9NOW5TcmdEWWlH?=
 =?utf-8?B?YTM4WVVDY2c0eTNMTWVzdDlwTm9zS0hYMXJ3MmU1aXZ5QjBpUWtFY1Q3QUg3?=
 =?utf-8?B?L01ianEyOVVaT0hRLzczRzRaV0E4eWFIY1Y2M1RaK3RNZlErKzNHUDc4VDYr?=
 =?utf-8?B?UHBVUXZRZmpMRC8zL1FYSkFyYVFKSXd2R09aeGtZN0dQeFpXUUNtTFZ1YkNx?=
 =?utf-8?B?ckRDVVVkbzc0ZDZxMExPSTk0eDYrK25pLzZBZk1zajFxdEFYTTNES1ltOW1P?=
 =?utf-8?B?aWJuemsybmZVbENzOU5Oc3FGalljd1pINHBuVU9Ga0c5TmdhbFRuaWt0YjlX?=
 =?utf-8?B?TUVpYkdvaHFCVUNSRDh6WkVlU0tRRldrUmFpdHZNcmlTQTBPV2hEV1NldEhw?=
 =?utf-8?B?ODJPWVhZekg0N0NrWmpwc0wySERsMC85QzQxR3VyYkU3SWNCemZYMzRmU2tj?=
 =?utf-8?B?ejBQd3kvZWhnT24yaHRQT0JXeDhKOTJJZytDSm9ycHR1M0NKbnRPcVR4YzhS?=
 =?utf-8?B?MzVKaGRhZzJlSmUzendpVEYxMGFXUVUyaGwreTQ2UFRVM2c0OWRyM09xeTkx?=
 =?utf-8?B?Znkvc1E2Vm9lMk9pck1HbUNjazd2SG9UNTh5SlB2UlMwMVFvaHdkWmhhMFov?=
 =?utf-8?B?NGE2b21sd3dZd0JBcXMrcmdKcjV6OGVhZWZEWTNwdGFBa2V0MXExblg1cCs4?=
 =?utf-8?B?czdUY25iQmZaK3J1WWdDRVY0bHU2K25XUWMwbUxTTzU1MGd6UlhHcUtMR1dZ?=
 =?utf-8?B?TnBhZWU0RjdWZ0t3Q1Flb01odU9sK3RaaU5TRHNrQ3d6TC9PWWwwdnh0OUN0?=
 =?utf-8?Q?FjOpxMjv9RtXYyLqQqCGo+1cougHLkhh7Pk8zAA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fff2ea-e64b-4c38-194d-08d9363f2081
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 12:05:00.4197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bU9AeICzn/08ovBvqUKY4TH70se2vC2V+vXQW5Z/P/bQwWdMwZIvxrojaRBkCUQyaA03pn4J8xZ8XcLnVIQMHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6993
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxlc3NhbmRybyBEaSBG
ZWRlcmljbyA8YWxlLnFlbXVAcmV2Lm5nPg0KPiBTZW50OiBTYXR1cmRheSwgSnVuZSAxOSwgMjAy
MSAzOjM3IEFNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IFRheWxvciBTaW1w
c29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNpbmMu
Y29tPjsgYmFidXNoQHJldi5uZzsgbml6em9AcmV2Lm5nOyBwaGlsbWRAcmVkaGF0LmNvbTsNCj4g
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsgQWxlc3NhbmRybyBEaSBGZWRlcmljbyA8YWxl
QHJldi5uZz4NCj4gU3ViamVjdDogW1BBVENIIHY1IDA2LzE0XSB0YXJnZXQvaGV4YWdvbjogaW50
cm9kdWNlIG5ldyBoZWxwZXIgZnVuY3Rpb25zDQo+IA0KPiBGcm9tOiBOaWNjb2zDsiBJenpvIDxu
aXp6b0ByZXYubmc+DQo+IA0KPiBUaGVzZSBoZWxwZXJzIHdpbGwgYmUgZW1wbG95ZWQgYnkgdGhl
IGlkZWYtcGFyc2VyIGdlbmVyYXRlZCBjb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxlc3Nh
bmRybyBEaSBGZWRlcmljbyA8YWxlQHJldi5uZz4NCj4gU2lnbmVkLW9mZi1ieTogTmljY29sw7Ig
SXp6byA8bml6em9AcmV2Lm5nPg0KPiAtLS0NCj4gIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jIHwg
MTYzDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCj4gIHRhcmdl
dC9oZXhhZ29uL2dlbnB0ci5oIHwgIDIzICsrKysrKw0KPiAgdGFyZ2V0L2hleGFnb24vbWFjcm9z
LmggfCAgIDkgKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE4MCBpbnNlcnRpb25zKCspLCAxNSBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyBi
L3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGluZGV4DQo+IDZmMjgxNmY2ZTIuLmNmNDVjMjhmNTgg
MTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jDQoNCg0KPiArKysgYi90YXJn
ZXQvaGV4YWdvbi9nZW5wdHIuYw0KPiArdm9pZCBnZW5fZmJyZXYoVENHdiByZXN1bHQsIFRDR3Yg
c3JjKQ0KPiArew0KPiArICAgIFRDR3YgbG8gPSB0Y2dfdGVtcF9uZXcoKTsNCj4gKyAgICBUQ0d2
IHRtcDEgPSB0Y2dfdGVtcF9uZXcoKTsNCj4gKyAgICBUQ0d2IHRtcDIgPSB0Y2dfdGVtcF9uZXco
KTsNCj4gKw0KPiArICAgIC8qIEJpdCByZXZlcnNhbCBvZiBsb3cgMTYgYml0cyAqLw0KPiArICAg
IHRjZ19nZW5fZXh0cmFjdF90bChsbywgc3JjLCAwLCAxNik7DQo+ICsgICAgdGNnX2dlbl9hbmRp
X3RsKHRtcDEsIGxvLCAweGFhYWEpOw0KPiArICAgIHRjZ19nZW5fc2hyaV90bCh0bXAxLCB0bXAx
LCAxKTsNCj4gKyAgICB0Y2dfZ2VuX2FuZGlfdGwodG1wMiwgbG8sIDB4NTU1NSk7DQo+ICsgICAg
dGNnX2dlbl9zaGxpX3RsKHRtcDIsIHRtcDIsIDEpOw0KPiArICAgIHRjZ19nZW5fb3JfdGwobG8s
IHRtcDEsIHRtcDIpOw0KPiArICAgIHRjZ19nZW5fYW5kaV90bCh0bXAxLCBsbywgMHhjY2NjKTsN
Cj4gKyAgICB0Y2dfZ2VuX3NocmlfdGwodG1wMSwgdG1wMSwgMik7DQo+ICsgICAgdGNnX2dlbl9h
bmRpX3RsKHRtcDIsIGxvLCAweDMzMzMpOw0KPiArICAgIHRjZ19nZW5fc2hsaV90bCh0bXAyLCB0
bXAyLCAyKTsNCj4gKyAgICB0Y2dfZ2VuX29yX3RsKGxvLCB0bXAxLCB0bXAyKTsNCj4gKyAgICB0
Y2dfZ2VuX2FuZGlfdGwodG1wMSwgbG8sIDB4ZjBmMCk7DQo+ICsgICAgdGNnX2dlbl9zaHJpX3Rs
KHRtcDEsIHRtcDEsIDQpOw0KPiArICAgIHRjZ19nZW5fYW5kaV90bCh0bXAyLCBsbywgMHgwZjBm
KTsNCj4gKyAgICB0Y2dfZ2VuX3NobGlfdGwodG1wMiwgdG1wMiwgNCk7DQo+ICsgICAgdGNnX2dl
bl9vcl90bChsbywgdG1wMSwgdG1wMik7DQo+ICsgICAgdGNnX2dlbl9ic3dhcDE2X3RsKGxvLCBs
byk7DQo+ICsNCj4gKyAgICAvKiBGaW5hbCB0d2Vha3MgKi8NCj4gKyAgICB0Y2dfZ2VuX2RlcG9z
aXRfdGwocmVzdWx0LCBzcmMsIGxvLCAwLCAxNik7DQo+ICsgICAgdGNnX2dlbl9vcl90bChyZXN1
bHQsIHJlc3VsdCwgbG8pOw0KPiArDQo+ICsgICAgdGNnX3RlbXBfZnJlZShsbyk7DQo+ICsgICAg
dGNnX3RlbXBfZnJlZSh0bXAxKTsNCj4gKyAgICB0Y2dfdGVtcF9mcmVlKHRtcDIpOw0KPiArfQ0K
DQpSZW1vdmUgdGhpcyBmdW5jdGlvbiBhbmQgY2FsbCBnZW5faGVscGVyX2ZicmV2IGluc3RlYWQu
ICBUaGlzIHdhcyBmZWVkYmFjayBmcm9tIFJpY2hhcmQgSGVuZGVyc29uIG9uIG9uZSBvZiBteSBw
cmV2aW91cyBwYXRjaCBzZXJpZXMuDQoNClRoYW5rcywNClRheWxvcg0K

