Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B824B1D47
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 05:12:02 +0100 (CET)
Received: from localhost ([::1]:47294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nINHs-00070W-Aj
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 23:12:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nINFj-00066L-Dc
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 23:09:47 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:48164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nINFg-0007sU-OT
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 23:09:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1644552584; x=1645157384;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JD76y/XoI/22+2ESXcCUMzqHL8DBeXgYpMKCG3v6tvE=;
 b=CD0XY97xpAksKqn3K9mXczmNmxZXDCDjjsT+B1n9uf1eDvcvMw9gnCSR
 y0YxQEUvViTxKAOBdRxNCDkMGEAPNuYCojoIeKk/J/UMty7AOchMC2fLD
 +6Gh+R4KEvCDoOrlUIeWaXP5rrKqTNx+ygOdXsB+q9IZLOUWs9sR0Yk01 o=;
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 04:09:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMFjNi4DfmKSEEdTFo6iFE07woWiJRjgCsXCM4sYSGY6KRTNIPHw0vIg2tOJ3c4LcG1A3KUPf3S6ZDzDEtfmp3vLNPnc1r7w4cCcNWT+4M9/v0B4I3BQxbLDpRgGUYuHH2QhC5Sgge82qrd2/5LIdqY1dYAnXZ8ieCjxunXgmfr7aOBXX1040LQfXB55Phe0fvkHAFIIizfLehGi08QQnneXJ7wP4d82PP3BP5L0cwNbUrv3IUB/kx9PQnz0FJ4tunDjIAA50FerI+etWgOcQ0UwbV/dbrlgiIYSrinXUxEWr+zHcqBqgpQtTBnKOgomE2jzI7CQ+AFKnVTCo7L10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JD76y/XoI/22+2ESXcCUMzqHL8DBeXgYpMKCG3v6tvE=;
 b=mcIxvqXMztfzS7nkcCeJQ0bf7rx5ttcHhK2ORszd484zhUklHO7Tfljppk4QPuuFNJc2tYRUf2cWxxLKB/7Q2JJfdKdyTLinlOlEueOFXHN5jLXKhKCi159E5JdGRhQi6Mfs00twOGhkdNMw2Py9EX4VmpGzpdspeAjJf0bit/s4/vMIvrd/TDXmcphxpoRKKJZ39nPnKqqtRD04LV7ca98xMOLKSjNfI1ZdtXjK5tKn8Jkl9qYSfCOLTGvIVd7ChE/VbWRLgU3BmVKhkjG8it3K3fErXaT2LMusbAG4V81/rFtx6wrNmTJtxNq+IP0jSxqaugdCYJWBDQTvTkd06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 04:09:39 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10%9]) with mapi id 15.20.4951.014; Fri, 11 Feb 2022
 04:09:39 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 06/12] Hexagon (tests/tcg/hexagon) test instructions
 that might set bits in USR
Thread-Topic: [PATCH v2 06/12] Hexagon (tests/tcg/hexagon) test instructions
 that might set bits in USR
Thread-Index: AQHYHiQ1WydRNAOe4kK9AnkLCCqTB6yNidiAgAAy1qA=
Date: Fri, 11 Feb 2022 04:09:39 +0000
Message-ID: <SN4PR0201MB8808A8A9299D3F91AA5CEFEFDE309@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220210021556.9217-1-tsimpson@quicinc.com>
 <20220210021556.9217-7-tsimpson@quicinc.com>
 <c8f58005-0431-5640-13e6-b0ef889ec49c@linaro.org>
In-Reply-To: <c8f58005-0431-5640-13e6-b0ef889ec49c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b01f2d3-1c0b-4a09-1885-08d9ed1452e0
x-ms-traffictypediagnostic: BN7PR02MB4033:EE_
x-microsoft-antispam-prvs: <BN7PR02MB40336EDA3D6F5F091D0A0CF2DE309@BN7PR02MB4033.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pRClYo6zwQ/65/5EfyAheytGW4xeEZAQXvxBIPxWd+8oYsaO239WTMkTQwYos48mL3O0PoVsoJhJn8GucRJggoxpowgPf4tTEwhCf2TXMXNeGIMsp5i9Kk9WkXaaRnTR8kpv+a0bX8nbsSQWqF4B0N8I75GqYP2Aj7sgXRLu9Q07zVzrcxvt9xBGcShXxxk5Q5mjU14L+izf9totMmVvUc+O2E2AX1AZo4ElfOg5aJ5etg+GUwO442MTNkseFS2o3otPNeZ8cSnj6NwmBIqZSpNwkfH+vUpCl2q262YSxocU+sUUVNx5R6D7ZLDkyWeDvz6ecIld31K0Fhurfv80FJ7nVKAmHoPHLL0CFDLf5daLod76ODr/asd6+ZFqAlW1BaKmcqQ1vOvrnjI/A8Rjh1/C9JsXkVXBwY7MvWXtZMFZ0qkWszCaA2v3dZfH5W7cb22fWOfVNeWhFEIrgcNCcTzGpiTlYLQ4Ih4hmiqt66G7DOZlyhz571qoyd8EjOPc4RnE8AMaUA0HdTADgpttu0HI9arXGIv/3zqmNGGz7YFk4Wi3PJOj+emCYJgS80I1UL624ejQdvywe6qb+i7bAJqOmI39OH9XSobNjyzKVQxongguDYgIONobr/cFoSFszn+kG7o8g5dQbj+6Bo0ZuEpLapZsiZpBP++TX//jIj3TmKDttYvVulG8Ns3+ofZ7+vjoRzIJch1EZ731Dqg25g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(4326008)(66446008)(9686003)(7696005)(76116006)(52536014)(66476007)(86362001)(38100700002)(33656002)(53546011)(508600001)(55016003)(66556008)(8936002)(6506007)(64756008)(8676002)(5660300002)(316002)(107886003)(2906002)(110136005)(186003)(4744005)(38070700005)(54906003)(71200400001)(66946007)(122000001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDVIMjBpZm93RGtmVi85Y0g1TFphK0Y2NW51S1IzOW5sVlZGUVBXa3dSeVB5?=
 =?utf-8?B?K3pYNHZpT3VCWUpLMzdiR01jaWJ5MkIvQnVjZEsvVWhqS1VBUjRsNTdNenpT?=
 =?utf-8?B?eC95UVcyc1hTV3dhaWo2MmpRMys5MXJDclFaQjNCaWZzNVNLTndDTDU4MGNX?=
 =?utf-8?B?RWU5QmtiZTlRQkQrQzYwS3FsdnNZSzVsSWRnNkhuZTBmRXZTTkxCWHRtQUts?=
 =?utf-8?B?Z2JVMzFhQUxCN2lqYW1FY0UyMVhRK252bDB6Mmd2VzQ5Uk9tOGQ2UjNxbUF4?=
 =?utf-8?B?ZHU3N3Y4WVVsWEJtTEJITVFBQmM1eHpSSHFzN1g2cEJQTTF2cFB0UENqK3Ew?=
 =?utf-8?B?MEdkT2N3RmN5Z2VwQklFcklyU2FzbERtazF1U1lwU0VFVXZCenNnRUFEOEpH?=
 =?utf-8?B?ejhzTGJyWG9ROFF0dDlvNGw1bDRGejE3ZmpXSmhkZjZneGRCVzY4emtmbVU2?=
 =?utf-8?B?R0tIRW1ZOGRmUUlGMHJIWThvYXJJNXBFLzhaL0Jpc0xoSzdtRmRZM3JEbkdz?=
 =?utf-8?B?Q05OZTI3MWJBVkc0dGhoK2JFUC8zdnhqNmtSUEt1QW1aZmhiSXkrZE9ITkQx?=
 =?utf-8?B?aGNwMnViZWhvL1UrNllyck92cDkwL3oxOEJ0WGlCTTJEQXFBZWZvVmpjOHJs?=
 =?utf-8?B?OW1DUkllVlRjQTBzVnlva1lPc3NKSEZxU2VyT2dVeUdWSHd5SUhHVEJyRGNy?=
 =?utf-8?B?MGllWGt3OWEwQmMxYzFuOG1heVRGVVE3Z0ppNldsNGV4Z2hZUDB4TW80eWp5?=
 =?utf-8?B?NTdKN0lSd2taRDh0YUkvbU9NckhvR25GYkZZUkI2dXZWSm5PeHRtbTRrdks2?=
 =?utf-8?B?UzF4NGxlUjJqbVJZNExabUJETVVLNExPS2prWTdmK2s3STJHQXJkdm1VQ1FO?=
 =?utf-8?B?UWNveDRpcGxOUnU5LzNsNGU0Yno2cFNlK09SdlpvcmFEenh3ZGZmNWx1ZElt?=
 =?utf-8?B?UHFQZjFSSWU3emZKd2xYcmg2MklJUkp2TGU3ZVlaNnRYOGtpQ2JFTCs0dCts?=
 =?utf-8?B?MzkwdU1Ra1pxVVRzK3M3b0haMDhYQXNEYmxVRG9RTWJlNUwxTjVhNkNWMCtS?=
 =?utf-8?B?RHE3T2M4NG9yZjJrL2U1bWw2YUN1NExack9EUjNtUndWTVpQRmtxVFlzWmFk?=
 =?utf-8?B?TVpFZmI2WEUwK2dHcHFEakdsN2VvbGoxWTMyczlJTnNvdnFiQ3BkQ1ZCWFBU?=
 =?utf-8?B?dGY0bXBHT1JsQWFKUkpmTS92UzZ3TnFVZVhlTE9EZGlmM0xuMGx2YUdPY3gy?=
 =?utf-8?B?Q3VsclhJdFlwREJFWmRHdTdYYkdEVGZjMnlTUmVwZE8vYmMyQ2tBc1ZTWXJJ?=
 =?utf-8?B?MTdzdnBqU0ZBQlZnaFFsMThHa3NhWjJvNmt4YkZSQm9HNDJIbGFOd0x2U0FI?=
 =?utf-8?B?TWRpMFJLajc4TjliVmFaS1pUblJ0dDFLV1gvS2lKNUcraHJpMkFuUUQ2UXRj?=
 =?utf-8?B?d09pV1hYQ1ppS1dhT1g4VU1jbVpjY1FqRDRnRS9rMkhJRkFPdEMzdWlXT1Fh?=
 =?utf-8?B?VUtzUERPKy9pWTdSNUdPY21iWHNuY0xNMjFkUkt6UVN1bk5YT01SSEJFOThh?=
 =?utf-8?B?WitGSTdqS1oycWViR3RQNStvOHdZT0l3Mm9EY1AzUkU4blBITmo4VEhHUUk2?=
 =?utf-8?B?VmxURGc3R3I5NnpzSmdsbXlpek43YTdSbFo0M05uSUo1S1hWRDhwSWlBTCt0?=
 =?utf-8?B?dGVEdjQvWG12S2xFUnp0cjlzd29qUC9ySEJ2ZFVrM2l4NVFxWkFNMXU5MENE?=
 =?utf-8?B?bFVRTFB3dGlRbkcrQmJrWXZVb2xDSktHRDF3U2M5Vk40bW1tZCtyT1NWVTlp?=
 =?utf-8?B?NTdoZEcwT3NQS1BuY1V3eXpzelV2aEdWSUhiTGp4cGZzWkhxRG9MQkZJZzI3?=
 =?utf-8?B?aVBaOU5CV1hLZUpYMzl2SHJIUGtyZ1g3QXVpOHU4bHdqU3VGbHJMMVpYY0xJ?=
 =?utf-8?B?N24wTXUvSDNsN2ZhN05kN3pRSi9MdUIyMEpCYzMyNURHOG16MlBUUGRxNllJ?=
 =?utf-8?B?dEdGbWdFb0RNS3R5Q2FGcWFqRlZtV1gwQWNaN284RUFwbS9NdVVnSFNzbWpx?=
 =?utf-8?B?RUpzTzZmZ0o1RmcxY2JRTzBjZDNxRjJJS21DYUcxM3oyY3cxVzk0N3dza0Yr?=
 =?utf-8?B?VnM5azNHWkxkeStHdW9Eb3NEdHc3VzNnUmFuS0FKeVMvMFFWU0xqSzd1dElO?=
 =?utf-8?Q?xtJ9I40IgJPegVWSQWBnEbA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b01f2d3-1c0b-4a09-1885-08d9ed1452e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 04:09:39.4089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xxOb7PBwaKrIkmKwFI3VhoSlbjq+2ehOjwwvla8RlAx9P+ZdMxCygV4rvQ4eSNgoEP2d7qE/g7SZoK5ABCzzBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4033
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 Michael Lambert <mlambert@quicinc.com>, "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBGZWJy
dWFyeSAxMCwgMjAyMiA3OjAzIFBNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVp
Y2luYy5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGY0YnVnQGFtc2F0Lm9yZzsg
YWxlQHJldi5uZzsgQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+OyBNaWNoYWVsDQo+IExh
bWJlcnQgPG1sYW1iZXJ0QHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA2
LzEyXSBIZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdvbikgdGVzdCBpbnN0cnVjdGlvbnMNCj4gdGhh
dCBtaWdodCBzZXQgYml0cyBpbiBVU1INCj4gDQo+IE9uIDIvMTAvMjIgMTM6MTUsIFRheWxvciBT
aW1wc29uIHdyb3RlOg0KPiA+ICsjZGVmaW5lIENMRUFSX1VTUkJJVFMgXA0KPiA+ICsgICAgInIy
ID0gdXNyXG5cdCIgXA0KPiA+ICsgICAgInIyID0gY2xyYml0KHIyLCAjMClcblx0IiBcDQo+ID4g
KyAgICAicjIgPSBjbHJiaXQocjIsICMxKVxuXHQiIFwNCj4gPiArICAgICJyMiA9IGNscmJpdChy
MiwgIzIpXG5cdCIgXA0KPiA+ICsgICAgInIyID0gY2xyYml0KHIyLCAjMylcblx0IiBcDQo+ID4g
KyAgICAicjIgPSBjbHJiaXQocjIsICM0KVxuXHQiIFwNCj4gPiArICAgICJyMiA9IGNscmJpdChy
MiwgIzUpXG5cdCIgXA0KPiA+ICsgICAgInVzciA9IHIyXG5cdCINCj4gDQo+IEl0J3MganVzdCBh
IHRlc3QgY2FzZSwgc28gaXQgZG9lc24ndCByZWFsbHkgbWF0dGVyLCBidXQNCj4gDQo+ICAgICAg
cjIgPSBhbmQocjIsICN+MHgzZikNCg0KT3VyIGFzc2VtYmxlciB3b24ndCBwYXJzZSB0aGUgfi4g
IFNvLCBJJ2xsIGhhdmUgdG8gZ28gd2l0aCAweGZmZmZmYzAuDQoNClRheWxvcg0KDQo=

