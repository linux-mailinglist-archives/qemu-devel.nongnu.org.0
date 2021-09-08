Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B93403F40
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 20:49:30 +0200 (CEST)
Received: from localhost ([::1]:41004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO2dV-0003pl-G3
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 14:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=888587b7d3=pdel@fb.com>)
 id 1mO2bG-00027b-0B; Wed, 08 Sep 2021 14:47:11 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:54840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=888587b7d3=pdel@fb.com>)
 id 1mO2bD-00055x-Db; Wed, 08 Sep 2021 14:47:09 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 188IfHRA001471; Wed, 8 Sep 2021 11:46:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=UV5wgr3HOrHsgh7nv1DzcrWeSrE4P3zkSLqzfK3/tk0=;
 b=pFzt3O9ykJoepRM6+STJkQj9lut9ak+u6nFJbiIPFdG8v7vhq56fpQD6UvlcpicmB/Ck
 StkX6NVxsbLh/w95PI0SHKuIAl2EJo321uNmZk4pz22JybtjZy1gbZeEeMb4xZfApBR7
 64J6irlWs1+Q1OIEd8/iTShZg4TF+08Dldc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3axcqfftap-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 08 Sep 2021 11:46:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 8 Sep 2021 11:46:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtMLMW57uws7CyY+6iM6axgj7bqM6yhkHMfLE676QNNBbOfWveqSywwSFVSQ5VjMxCXBy4idnMIstQA0Gapv6gOh+6blC4PIqx3MzJ7r3IVSa+xgCa3iRZn/cmEuB6AbGCJKSrvCvAiGwHoZvlfF3S9Hl6M3KQFdVzI85CEfaL4S7bQgS3+kisuA0G+myYjXAimH9f2XtV1yN+nLgoTLwlQHQJ47SYcaFPLD+nyE8tKHbVVuN0SeUnTW3jBKkSPKVGZObZnzVpYggX8LYByfaLy7017bViLd9fHxOfZQOo4S4ei6w7g1vDh5ba7H3guNIEj7ewXTlqNdDkxcv6ofOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=UV5wgr3HOrHsgh7nv1DzcrWeSrE4P3zkSLqzfK3/tk0=;
 b=efcuo+Tu5K62rbjc9pe1md9TuWowRzHzfhBnNklFNKQRYRhar+IvzFcx/As+cLatYT4nxb5cJA/8fPd+zwhdBwrtzgzYzBUOjOgXRRFYwL7TuMBe7KPahXsmj6CU7KqQr/1cTyX+hgeBKDgxGbVJo3c/SD/NpkArNCfBRJlDUDnb09ixG9xc19acHGotDqtz6em4hg5Js1xewBzS2RMhgc5fvCjyg8tPJQtP6h+zxm4OqY+tUatc4GkC7VCcAfZtn1HrLGTmreIQKen/spP2zNjHnIXzT04K2cCKoT232lM8LpAe3YSCDouDql3H05Tv8YHy5HHIBbUjKb5PeS+Qnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by SJ0PR15MB4188.namprd15.prod.outlook.com (2603:10b6:a03:2e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 18:46:44 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368%7]) with mapi id 15.20.4478.025; Wed, 8 Sep 2021
 18:46:44 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Alistair Francis
 <alistair@alistair23.me>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>
Subject: Re: [PATCH 01/10] aspeed/smc: Add watchdog Control/Status Registers
Thread-Topic: [PATCH 01/10] aspeed/smc: Add watchdog Control/Status Registers
Thread-Index: AQHXo7XGcmrI2qF28kuhQf2sHH/ATquafFCA
Date: Wed, 8 Sep 2021 18:46:43 +0000
Message-ID: <632B8EA3-1A9E-46A9-A930-7ADD2C25F154@fb.com>
References: <20210907065822.1152443-1-clg@kaod.org>
 <20210907065822.1152443-2-clg@kaod.org>
In-Reply-To: <20210907065822.1152443-2-clg@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7b8da4c-3e18-4a09-07db-08d972f9012d
x-ms-traffictypediagnostic: SJ0PR15MB4188:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR15MB4188401BF186C72E02005647ACD49@SJ0PR15MB4188.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a5L0ACOxBe4zm78yQmHI3rJzVRCeq8o0ga9iA8I7Dtcg0C8lt05cghRKps+P7vuRSMVSETWtx8oyT47VcJDdksxqryEm6shHxgXV+z/vFa6izfTuy+zSQi9UQXs54faEuaFt94nmpS6XKsAxxdgMpDZ4lqMugAYLo7X9iI8LDpCWBIqYRTKkQASDGtCEs/kLW3zajLwqQvBrTxddFhvH/EjwvQRocqHkyREJZnKZZW8scaovrm1xHetVK90M+wZM971OYm+8DQ8GRsW/22C67LrFM28XRYjAtBkLmc6ToTL+cmVL9KbYYRNce04wLL0KsecNRn4Jf5yC6CLLuwvkanPdYJ6aGI0Qdx2ZMgcR2vDYPgFUfR2FE9ddzo+QbWes+L0fFPNmmFcuooNtaw1fysaCoE844TCrIit6mK6CPK0CQ3HsCyV/i41+yqUmIOzkO//LYhdemAGwI2v2calso67pv3BTeqxzpIJH5zyUXYWXm63b/7Rk/VZq1FmEzAjXlHgnm4utrjMYwFRPVSoI9/7tMRcdwuLFIv0gDA7OJrcf+d7jCs14V37/8RUDSUtm4g3ysSRHKqCCt81wpyag3R23nkiUd30vmD0L7jJC4WbA15eh7X9+TgZsG9gSRVMdbRjxXj9t/Wqbmc1CxhJb2SR4EuNubMxklU3f9AJNs6YVsD6hKsQJLIsxQa4LNpc/oyfuAOZ9W9/oVrr/K6DhpFYJK3tJ1yEfIra4jifWAkk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(38070700005)(76116006)(6506007)(53546011)(2906002)(8676002)(38100700002)(66556008)(54906003)(66476007)(6486002)(2616005)(83380400001)(6512007)(122000001)(8936002)(5660300002)(66946007)(4326008)(66446008)(64756008)(6916009)(33656002)(86362001)(186003)(316002)(36756003)(71200400001)(478600001)(66574015)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDNZbWRsS0JjTzJlVTVvc2NGWWhzYUxVbzZYOCtTUDM2REZUWEZ4MFJITXpv?=
 =?utf-8?B?YWlPbmdod1FSRHkxb2NVNnByUnFBNFRJTHRNQmpoeWRuc3lCMjJUMGxMb2Yv?=
 =?utf-8?B?dThhTGhjZXB5Wmsra1NVS3hrckFnZDEzbHZYODVRUU9neTQ2MnIxUllOSjZQ?=
 =?utf-8?B?a3ZicnZaRVQyOXVHQmJESU13akRTUGtwOXdsdmRtbkgwRTF0RGl4aFIvNUhR?=
 =?utf-8?B?d1R1bEE0MGt4RWhBMG40dkNOUlJIUnNHOGN6RWJ2Ry9yaWd3b2VXV2hwYTlH?=
 =?utf-8?B?bDBzSG5WWlNaK3lJWS85R3ROMldqYXlZS3dORmc1QTlmMitVVUNxcVJrM0tR?=
 =?utf-8?B?UDRpLzNGZC92M296OUxhcVZnS0c0aWRyODhuWlE5K3lQZHpwTDJ1OThTVVN3?=
 =?utf-8?B?dnBuclhqazByZ0FoZU0wczdoNHd2TTJTZDhsWlZQMXd5V1dvNjcxZDY4WklW?=
 =?utf-8?B?RFY4aXNwY0tldXV1ampZK1JuVVBub3ROL0MxQ3d4N3JhcDRKam13bUh3SW1X?=
 =?utf-8?B?TWcwT2krRDN2cmkwWWttK29YZmxNWW9xN2Nqemw4R1p3QzNuWUhxM2RoMk5j?=
 =?utf-8?B?Z2o2L3B4UzgzUTh2Qi9NU3ZFdmtaZjl6aUdaeGxhQ0NPcmdsdTNRcEF0cHBK?=
 =?utf-8?B?RllBQjBqc0dyS1JmWCs0M0hSbnNIb2h6T2x2SXlCT0ZFdkFJSnhIVVQ5Sitq?=
 =?utf-8?B?UTJJVjRSQkF6YUxuVGVOZnRTQ05FemFjYUhlNXBOaE83TDFpSThkeUx6aTF6?=
 =?utf-8?B?aGVNbUx5S3hPMmVYUnBXekdUOXRiYjhITE5lNXV5Sm9YWUhxeVlIZGFYSXZ4?=
 =?utf-8?B?MjVKSHVDblYzS3hkVWo3R0cxN01XNkhwTHhHUjVqRml5S2EzUWNPMzE3WmJR?=
 =?utf-8?B?WFA1anhGN3JvV2xzbFMwcWZUYisrUnJpY1BiWmpJRU9NbXdPWjJRSHlPTGgr?=
 =?utf-8?B?ZFc3aE93NlhqRm5qTXBkcFVnTGhmWUxaakp5VFVOeHhQRWtlN2JtamFidkNt?=
 =?utf-8?B?eG9zVTVvSlBFZXpMTkNwVk1GREdRZStNZ250N2MzMCtJU2NwSDV5M0hQc1NF?=
 =?utf-8?B?TTJEK2FDaHZEdkY1REJzdHo3NE03aXpockdiTW55R1FndjhXbzA3VG41WXND?=
 =?utf-8?B?YTZGR2FCMFk3YXhGU0NaTjlrdEc3dStxWXZlTzRLaytHSjZydGZZYmNGZTVw?=
 =?utf-8?B?Z04vTFNUK01zRVFGUkhTcFZ1SEVDdmZUOVJtQWN3b1ZJM0Q3bVJTdjNtUUZH?=
 =?utf-8?B?dE9KYW11TUhsZUUzREZ1MkViNVgyY1FpRGhUaXdpWkZPTjRNWXRXRDVXK2g5?=
 =?utf-8?B?bmJpN2VlbjZUdFJwQWRSdTJjV20zNDM1NVlyV001Vm1GWnZZbzNVTENqNFZ6?=
 =?utf-8?B?anlNMDNCQjdoTUxWQ0tMNGNEajVpdUx0MlpQZGpJSkZwcU1zVnpwV0pqaXps?=
 =?utf-8?B?T3hBTDRseHFzU0d4V3JNRjZDdkRqWEJGUFZoNVhlR3A3RW9wNzYxVUpFQ0Rj?=
 =?utf-8?B?R1Z4MGZmVjVJK3BGMzFVVml4ekZoOXVrTk1QTE11Mlo4NUNqMWlhYk5WUHo4?=
 =?utf-8?B?MDZDeUhpZktUd2t6MzRJSGhDUC9hS1pSY0NXZEltR0gzeTBSZFZVOGVoYUpZ?=
 =?utf-8?B?ZVVLRTV3V0lkS2poeG1wQkhwMGRJYkNYQVh0N0VIUHRuRFczSi96bi8yS3Fo?=
 =?utf-8?B?a2NaL1NvVG1ERU81NkNxb09nSFhtZGpKWTFuZVNnV3dxS0gzQzlReDZTUUxS?=
 =?utf-8?B?NHBFN1lsK0NzbmNzeUgwMnZWK2hrc1Q0azcweGZYbkxYYmpVV3lmWG4wUVla?=
 =?utf-8?Q?rg4ZtwjhN79L/hxurSs1sr+xSBAWSKJk35tXU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <246E05A600C8EB49935D6977091E31C3@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b8da4c-3e18-4a09-07db-08d972f9012d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 18:46:43.9558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VnePK7E2B7Ve1nYPyRbHduXyuMDvRarG9+LjIoO56vLcBppGeG2z5pCkMSP+2KXa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4188
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: HUNsV1OCkkk5unWfdbyJgAlLUanvTeZn
X-Proofpoint-ORIG-GUID: HUNsV1OCkkk5unWfdbyJgAlLUanvTeZn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-08_06:2021-09-07,
 2021-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1011 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109030001 definitions=main-2109080117
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=888587b7d3=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gU2VwIDYsIDIwMjEsIGF0IDExOjU4IFBNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPiB3cm90ZToNCj4gDQo+IFRoZSBBc3BlZWQgU29DcyBoYXZlIGEgZHVhbCBib290
IGZ1bmN0aW9uIGZvciBmaXJtd2FyZSBmYWlsLW92ZXINCj4gcmVjb3ZlcnkuIFRoZSBzeXN0ZW0g
YXV0by1yZWJvb3RzIGZyb20gdGhlIHNlY29uZCBmbGFzaCBpZiB0aGUgbWFpbg0KPiBmbGFzaCBk
b2VzIG5vdCBib290IHN1Y2Vzc2Z1bGx5IHdpdGhpbiBhIGNlcnRhaW4gYW1vdW50IG9mIHRpbWUu
IFRoaXMNCj4gZnVuY3Rpb24gaXMgY2FsbGVkIGFsdGVybmF0ZSBib290IChBQlIpIGluIHRoZSBG
TUMgY29udHJvbGxlcnMuDQo+IA0KPiBPbiBBU1QyNDAwL0FTVDI1MDAsIEFCUiBpcyBlbmFibGVk
IGJ5IGhhcmR3YXJlIHN0cmFwcGluZyBpbiBTQ1U3MCB0bw0KPiBlbmFibGUgdGhlIDJuZCB3YXRj
aGRvZyB0aW1lciwgb24gQVNUMjYwMCwgdGhyb3VnaCByZWdpc3RlciBTQ1U1MTAuDQo+IElmIHRo
ZSBib290IG9uIHRoZSB0aGUgbWFpbiBmbGFzaCBzdWNjZWVkcywgdGhlIGZpcm13YXJlIHNob3Vs
ZA0KPiBkaXNhYmxlIHRoZSAybmQgd2F0Y2hkb2cgdGltZXIuIElmIG5vdCwgdGhlIEJNQyBpcyBy
ZXNldCBhbmQgdGhlIENFMA0KPiBhbmQgQ0UxIG1hcHBpbmdzIGFyZSBzd2FwcGVkIHRvIHJlc3Rh
cnQgdGhlIEJNQyBmcm9tIHRoZSAybmQgZmxhc2guDQo+IA0KPiBPbiB0aGUgQVNUMjYwMCwgdGhl
IHJlZ2lzdGVycyBjb250cm9sbGluZyB0aGUgMm5kIHdhdGNoZG9nIHRpbWVyIHdlcmUNCj4gbW92
ZWQgZnJvbSB0aGUgd2F0Y2hkb2cgcmVnaXN0ZXIgdG8gdGhlIEZNQyBjb250cm9sbGVyLiBBZGQg
c2ltcGxlDQo+IHJlYWQvd3JpdGUgaGFuZGxlcnMgZm9yIHRoZXNlIHRvIGxldCB0aGUgRlcgZGlz
YWJsZSB0aGUgMm5kIHdhdGNoZG9nDQo+IHdpdGhvdXQgZXJyb3IuDQo+IA0KPiBSZXBvcnRlZC1i
eTogUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEPDqWRy
aWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+DQo+IC0tLQ0KPiBody9zc2kvYXNwZWVkX3NtYy5j
IHwgMTYgKysrKysrKysrKysrKysrKw0KPiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L3NzaS9hc3BlZWRfc21jLmMgYi9ody9zc2kvYXNwZWVk
X3NtYy5jDQo+IGluZGV4IDMzMWEyYzU0NDYzNS4uYzk5OTBmMDY5ZWE0IDEwMDY0NA0KPiAtLS0g
YS9ody9zc2kvYXNwZWVkX3NtYy5jDQo+ICsrKyBiL2h3L3NzaS9hc3BlZWRfc21jLmMNCj4gQEAg
LTEyNCw2ICsxMjQsMTMgQEANCj4gLyogU1BJIGR1bW15IGN5Y2xlIGRhdGEgKi8NCj4gI2RlZmlu
ZSBSX0RVTU1ZX0RBVEEgICAgICAoMHg1NCAvIDQpDQo+IA0KPiArLyogRk1DX1dEVDIgQ29udHJv
bC9TdGF0dXMgUmVnaXN0ZXIgZm9yIEFsdGVybmF0ZSBCb290IChBU1QyNjAwKSAqLw0KPiArI2Rl
ZmluZSBSX0ZNQ19XRFQyX0NUUkwgICAoMHg2NCAvIDQpDQo+ICsjZGVmaW5lICAgRk1DX1dEVDJf
Q1RSTF9BTFRfQk9PVF9NT0RFICAgIEJJVCg2KSAvKiBPOiAyIGNoaXBzIDE6IDEgY2hpcCAqLw0K
PiArI2RlZmluZSAgIEZNQ19XRFQyX0NUUkxfU0lOR0xFX0JPT1RfTU9ERSBCSVQoNSkNCj4gKyNk
ZWZpbmUgICBGTUNfV0RUMl9DVFJMX0JPT1RfU09VUkNFICAgICAgQklUKDQpIC8qIE86IHByaW1h
cnkgMTogYWx0ZXJuYXRlICovDQo+ICsjZGVmaW5lICAgRk1DX1dEVDJfQ1RSTF9FTiAgICAgICAg
ICAgICAgIEJJVCgwKQ0KPiArDQo+IC8qIERNQSBDb250cm9sL1N0YXR1cyBSZWdpc3RlciAqLw0K
PiAjZGVmaW5lIFJfRE1BX0NUUkwgICAgICAgICgweDgwIC8gNCkNCj4gI2RlZmluZSAgIERNQV9D
VFJMX1JFUVVFU1QgICAgICAoMSA8PCAzMSkNCj4gQEAgLTI2MywxMiArMjcwLDE4IEBAIHN0YXRp
YyB2b2lkIGFzcGVlZF8yNjAwX3NtY19kbWFfY3RybChBc3BlZWRTTUNTdGF0ZSAqcywgdWludDMy
X3QgdmFsdWUpOw0KPiANCj4gI2RlZmluZSBBU1BFRURfU01DX0ZFQVRVUkVfRE1BICAgICAgIDB4
MQ0KPiAjZGVmaW5lIEFTUEVFRF9TTUNfRkVBVFVSRV9ETUFfR1JBTlQgMHgyDQo+ICsjZGVmaW5l
IEFTUEVFRF9TTUNfRkVBVFVSRV9XRFRfQ09OVFJPTCAweDQNCj4gDQo+IHN0YXRpYyBpbmxpbmUg
Ym9vbCBhc3BlZWRfc21jX2hhc19kbWEoY29uc3QgQXNwZWVkU01DU3RhdGUgKnMpDQo+IHsNCj4g
ICAgIHJldHVybiAhIShzLT5jdHJsLT5mZWF0dXJlcyAmIEFTUEVFRF9TTUNfRkVBVFVSRV9ETUEp
Ow0KPiB9DQo+IA0KPiArc3RhdGljIGlubGluZSBib29sIGFzcGVlZF9zbWNfaGFzX3dkdF9jb250
cm9sKGNvbnN0IEFzcGVlZFNNQ1N0YXRlICpzKQ0KPiArew0KPiArICAgIHJldHVybiAhIShzLT5j
dHJsLT5mZWF0dXJlcyAmIEFTUEVFRF9TTUNfRkVBVFVSRV9XRFRfQ09OVFJPTCk7DQo+ICt9DQo+
ICsNCj4gc3RhdGljIGNvbnN0IEFzcGVlZFNNQ0NvbnRyb2xsZXIgY29udHJvbGxlcnNbXSA9IHsN
Cj4gICAgIHsNCj4gICAgICAgICAubmFtZSAgICAgICAgICAgICAgPSAiYXNwZWVkLnNtYy1hc3Qy
NDAwIiwNCj4gQEAgLTEwMTksNiArMTAzMiw3IEBAIHN0YXRpYyB1aW50NjRfdCBhc3BlZWRfc21j
X3JlYWQodm9pZCAqb3BhcXVlLCBod2FkZHIgYWRkciwgdW5zaWduZWQgaW50IHNpemUpDQo+ICAg
ICAgICAgYWRkciA9PSBSX0NFX0NNRF9DVFJMIHx8DQo+ICAgICAgICAgYWRkciA9PSBSX0lOVFJf
Q1RSTCB8fA0KPiAgICAgICAgIGFkZHIgPT0gUl9EVU1NWV9EQVRBIHx8DQo+ICsgICAgICAgIChh
c3BlZWRfc21jX2hhc193ZHRfY29udHJvbChzKSAmJiBhZGRyID09IFJfRk1DX1dEVDJfQ1RSTCkg
fHwNCj4gICAgICAgICAoYXNwZWVkX3NtY19oYXNfZG1hKHMpICYmIGFkZHIgPT0gUl9ETUFfQ1RS
TCkgfHwNCj4gICAgICAgICAoYXNwZWVkX3NtY19oYXNfZG1hKHMpICYmIGFkZHIgPT0gUl9ETUFf
RkxBU0hfQUREUikgfHwNCj4gICAgICAgICAoYXNwZWVkX3NtY19oYXNfZG1hKHMpICYmIGFkZHIg
PT0gUl9ETUFfRFJBTV9BRERSKSB8fA0KPiBAQCAtMTM1MCw2ICsxMzY0LDggQEAgc3RhdGljIHZv
aWQgYXNwZWVkX3NtY193cml0ZSh2b2lkICpvcGFxdWUsIGh3YWRkciBhZGRyLCB1aW50NjRfdCBk
YXRhLA0KPiAgICAgICAgIHMtPnJlZ3NbYWRkcl0gPSB2YWx1ZSAmIDB4ZmY7DQo+ICAgICB9IGVs
c2UgaWYgKGFkZHIgPT0gUl9EVU1NWV9EQVRBKSB7DQo+ICAgICAgICAgcy0+cmVnc1thZGRyXSA9
IHZhbHVlICYgMHhmZjsNCj4gKyAgICB9IGVsc2UgaWYgKGFzcGVlZF9zbWNfaGFzX3dkdF9jb250
cm9sKHMpICYmIGFkZHIgPT0gUl9GTUNfV0RUMl9DVFJMKSB7DQo+ICsgICAgICAgIHMtPnJlZ3Nb
YWRkcl0gPSB2YWx1ZSAmIDB4YjsNCj4gICAgIH0gZWxzZSBpZiAoYWRkciA9PSBSX0lOVFJfQ1RS
TCkgew0KPiAgICAgICAgIHMtPnJlZ3NbYWRkcl0gPSB2YWx1ZTsNCj4gICAgIH0gZWxzZSBpZiAo
YXNwZWVkX3NtY19oYXNfZG1hKHMpICYmIGFkZHIgPT0gUl9ETUFfQ1RSTCkgew0KPiAtLSANCj4g
Mi4zMS4xDQo+IA0KDQpMb29rcyBnb29kIHRvIG1lIQ0KDQpSZXZpZXdlZC1ieTogUGV0ZXIgRGVs
ZXZvcnlhcyA8cGRlbEBmYi5jb20+DQoNCk9uZSB0aGluZzogc2hvdWxkIHdlIGVuYWJsZSB0aGlz
IGZlYXR1cmUgKEFTUEVFRF9TTUNfRkVBVFVSRV9XRFRfQ09OVFJPTCkNCm9uIGFueSBvZiB0aGUg
U01DIGNvbnRyb2xsZXIgbW9kZWxzPyBJIHdhbnRlZCB0byB0ZXN0IHRoaXMgd2l0aCB0aGUNCkZ1
amkgaW1hZ2UgYW5kIG1hY2hpbmUgdHlwZSBJIGFkZGVkLCBhbmQgSSBuZWVkZWQgdGhlIGZvbGxv
d2luZyBkaWZmDQp0byBlbmFibGUgdGhpczoNCg0KZGlmZiAtLWdpdCBhL2h3L3NzaS9hc3BlZWRf
c21jLmMgYi9ody9zc2kvYXNwZWVkX3NtYy5jDQppbmRleCAzMzFhMmM1NDQ2Li5iNWQ4MzVkNDg4
IDEwMDY0NA0KLS0tIGEvaHcvc3NpL2FzcGVlZF9zbWMuYw0KKysrIGIvaHcvc3NpL2FzcGVlZF9z
bWMuYw0KQEAgLTM4OCw3ICszODgsNyBAQCBzdGF0aWMgY29uc3QgQXNwZWVkU01DQ29udHJvbGxl
ciBjb250cm9sbGVyc1tdID0gew0KICAgICAgICAgLnNlZ21lbnRzICAgICAgICAgID0gYXNwZWVk
X3NlZ21lbnRzX2FzdDI2MDBfZm1jLA0KICAgICAgICAgLmZsYXNoX3dpbmRvd19iYXNlID0gQVNQ
RUVEMjZfU09DX0ZNQ19GTEFTSF9CQVNFLA0KICAgICAgICAgLmZsYXNoX3dpbmRvd19zaXplID0g
MHgxMDAwMDAwMCwNCi0gICAgICAgIC5mZWF0dXJlcyAgICAgICAgICA9IEFTUEVFRF9TTUNfRkVB
VFVSRV9ETUEsDQorICAgICAgICAuZmVhdHVyZXMgICAgICAgICAgPSBBU1BFRURfU01DX0ZFQVRV
UkVfRE1BIHwgQVNQRUVEX1NNQ19GRUFUVVJFX1dEVF9DT05UUk9MLA0KICAgICAgICAgLmRtYV9m
bGFzaF9tYXNrICAgID0gMHgwRkZGRkZGQywNCiAgICAgICAgIC5kbWFfZHJhbV9tYXNrICAgICA9
IDB4M0ZGRkZGRkMsDQogICAgICAgICAubnJlZ3MgICAgICAgICAgICAgPSBBU1BFRURfU01DX1Jf
TUFYLA0KDQpXaXRob3V0IHRoaXMsIEZ1amkgd291bGQgdHJ5IHRvIGNsZWFyIEJJVCgwKSBvZiBS
X0ZNQ19XRFQyX0NUUkwsDQpidXQgdGhlbiB0aGUgZGVmYXVsdCBhc3BlZWRfc21jX3JlYWQoKSB2
YWx1ZSB3b3VsZCByZXR1cm4gMHhGRkZGRkZGLg0KDQpFcnJvcjogdW5hYmxlIHRvIGRpc2FibGUg
dGhlIDJuZCB3YXRjaGRvZzogRk1DX1dEVDI9MHhGRkZGRkZGRg0KDQpBbmQgdGhlbiB3aXRoIHRo
ZXNlIGNoYW5nZXMgYWRkZWQsIHRoZSB3cml0ZXMgYW5kIHJlYWRzIHdvcmsNCnNvIHRoYXQgQklU
KDApIGFwcGVhcnMgdG8gaGF2ZSBiZWVuIGNsZWFyZWQ6DQoNCkRpc2FibGVkIHRoZSAybmQgd2F0
Y2hkb2cgKEZNQ19XRFQyKSBzdWNjZXNzZnVsbHkuDQoNCnJvb3RAYm1jLW9vYjp+IyBkZXZtZW0g
MHgxZTYyMDA2NA0KMHgwMDAwMDAwMA0Kcm9vdEBibWMtb29iOn4jIGRldm1lbSAweDFlNjIwMDY0
IDMyIDB4ZmZmZmZmZmYNCnJvb3RAYm1jLW9vYjp+IyBkZXZtZW0gMHgxZTYyMDA2NA0KMHgwMDAw
MDAwQg0KDQpJIGRvbuKAmXQgdG90YWxseSB1bmRlcnN0YW5kIHdoeSB0aGUgbWFzayBmb3IgdGhl
IHJlZ2lzdGVyIGlzIDB4YiB0aG91Z2g/DQoNCj4+PiBiaW4oMHhiKQ0K4oCYMGIxMDExJw0KDQpU
aGlzIGRvZXNu4oCZdCBzZWVtIHRvIG1hdGNoIHRoZSBtYWNybyBCSVQoLi4uKSAjZGVmaW5l4oCZ
cyBpbmNsdWRlZC4NClRob3NlICNkZWZpbmXigJlzIGFyZSBjb3JyZWN0IChJIGNyb3NzLXJlZmVy
ZW5jZWQgd2l0aCB0aGUgZGF0YXNoZWV0DQp0byBkb3VibGUgY2hlY2spLCB3b3VsZG7igJl0IGl0
IGJlIHNvbWV0aGluZyBsaWtlIHRoaXM/ICh6ZXJv4oCZcyBmb3INCnRoZSByZXNlcnZlZCBiaXRz
PykNCg0KPj4+IGhleCgwYjExMTExMTExMDExMTAwMDEpDQonMHhmZjcxJw0KDQpUaGFua3MsDQpQ
ZXRlcg0KDQo=

