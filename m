Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6099D3ED458
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 14:53:51 +0200 (CEST)
Received: from localhost ([::1]:49654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFc7h-0003pz-VR
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 08:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mFc6d-0002xi-6P
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 08:52:43 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:2648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mFc6a-0003EF-EK
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 08:52:42 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17G9Mw6N018928;
 Mon, 16 Aug 2021 05:52:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=XcmOZwVzIW+flVq7DalVW+2DDP9GkzlEaY9CENx16Q8=;
 b=OtViPVetelk5Yr95+Dc8jIRN8tKHiYJhvrgFdZx1FJpdrIjRwf/+oJmtOB3ePtNbjQ5p
 XY6jUnoscSIAMNDYrGs03Qwz2ms9rzyScN+OgeP6njUCWJIkCZpVBLOMLvfcASBd7iVh
 M4aWWyZpeY/2Usl+iJFLjUm7WyZIhKzzm9N3HAClphwE+H2qFyydju3ClWfkVxbgzZn2
 ++ecOCDnyDjh0//lPYe4NUx9wyTBf4QY3uvHtnCdsTWKl/3Q8Xb+f53GO7O+eYdWrKN8
 27nhVx5B91VJ18qQBaMwIk6CfHtviTbkvLZMIBxzBteWdBfsyPZbAPSgQrFSRiKwc5lJ gA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by mx0a-002c1b01.pphosted.com with ESMTP id 3af7gw1edm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 05:52:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsGxxZqOERWXvefg3KEY7IpP0VUIFZxpj1s8KmV9ZMzOXBarOo9ZZ8I5JVvTRnqD1SHZYBB/x8UyRpeHGSRkl+CmlyYtnDfWKCcGZ1cYgnVyE8ZqMOEBUpZYEb7KP9l/le56FTE/Sp2YSwDAXR+ucGgQcOV4vBv4OLGyFjmMv+gcWZLoMb2wFzh7D/kw6tq2XtyRkdmvTAwtnBlX5efGsoq3kiDqXhD9RLVn/1ns8HFx/dNl34y2Xxy7hmQVvxU+h3Kj7YqMaU01OB+Z5s8YnjKvIVY/xGcb9AG9h9RL5EMNdBH4Kka9cZdZ1dbUBR91cVQWwzSXZf9gV4zpy8FCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcmOZwVzIW+flVq7DalVW+2DDP9GkzlEaY9CENx16Q8=;
 b=XZkEbXHljuDDC4FyR5O8dFb6joEyfkb9OCCsbAIkeip0wHMe55mW2+I4yzsXwRh1FgjFU3tyIH8lsaRVstwzNGtHwkiqO0oo5kbfWcpGhbL4gToH8X5XTsz01zWEwajkE8PRYrfhzKYz+CWHPQOtZSDcmKQPI2cCH0Vn00+CAmCb++XTFV77KfiT3WrT0668IGZDYFuZ+s+ltSDQ33FHH26Rec7B2t4bAgWpizkFPC7f7Z6eYrHvTRBE9faaiI/8BpY2JqPSQ6MXiMVAIARPEKJm7FHQFCzn6vULHitEsEjOPWJVplL1+T4soXvxIl9SwWtcNhG8BkeyK36qdYpaIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL0PR02MB4580.namprd02.prod.outlook.com (2603:10b6:208:40::27)
 by BL0PR02MB6516.namprd02.prod.outlook.com (2603:10b6:208:1ca::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Mon, 16 Aug
 2021 12:52:33 +0000
Received: from BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::1866:bff0:809:75bf]) by BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::1866:bff0:809:75bf%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 12:52:33 +0000
From: John Levon <john.levon@nutanix.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server 05/11] vfio-user: run vfio-user context
Thread-Topic: [PATCH RFC server 05/11] vfio-user: run vfio-user context
Thread-Index: AQHXfNjaoxxwHigTkEKfYDh3ozv/7atL6j+AgCXBkYCABJWmAA==
Date: Mon, 16 Aug 2021 12:52:33 +0000
Message-ID: <YRpfkL2V96/VPfO8@movementarian.org>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
 <9ea4e77a39aaff3dfac3e463d3de76b0e4e1844f.1626722742.git.jag.raman@oracle.com>
 <CH0PR02MB7898528462CB5A47FE31F0E48BE29@CH0PR02MB7898.namprd02.prod.outlook.com>
 <81025189-1561-47E6-9E72-2E670ECC28F7@oracle.com>
In-Reply-To: <81025189-1561-47E6-9E72-2E670ECC28F7@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 970abbcb-d649-4017-33d6-08d960b4b721
x-ms-traffictypediagnostic: BL0PR02MB6516:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR02MB6516A584FF3F5DE87B8BF1E697FD9@BL0PR02MB6516.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZxpGGcsUrm6PpP9py9w/1hs8LCDHDzVbyayUQ60M/w2fsbRDfl5wOOCX6/AOIo6sb9YzuyC/TdnwcFdInFZ/mJtM1p6BX+uHuqxcdEgw01NnsXI1FMokCV+F/uDTrDYiyruFCAV5y4O4uhGMzdHrZedHLeuFIEXElY47oMJKJUC/NA29RmMUuhpw+afGroZ0ySoQ5wJa1VLJ23x3ElKugAWA4H4fSaq25OF/R9EfWmnc9MQZXHuYyY31cmqW4d3vqU37IgaPtsU6Sdd28ZOBhUNaEz4A+VGRYIMY1F5HDlLlNY8eQl1jmy9x1+6cN52Kov3sloALvuWmQRaZp9REoC1Ba89Sn+T5Jtcl+LkPMVWenvElFQaC7/ANrTCUFkWH4akizNn9QJrMspVhNHGMjizGjIlO5oJs4fQNvaJsQ2dm1D98epdoXUvOKPpP5MieQAg9UtwsF2OgHhGSSlErusdUDEGIR311nv90lsy4kYJks/D/bOoEXw4+jADQFhgSNO7c/EUw8yC7Gv5xK1VbV7/2gF2UZjiUrqJ4oBUFw5U0qoI3FGToVBPPgHpuHcspIjFfgbqnbkat6kRAXulPEQwgSeCODbz3BbVyMyAT8AbnloA5KWGoS8Uc5/QkO8pyXq3y9MtTL79U+wdCM+RWbaycWSu/KrE/1mhp7Y/Ir6Gq4HnZB+NNJ4VvnQt5M445D6FCJlCvxS96FfajXtpzTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR02MB4580.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(396003)(39860400002)(136003)(478600001)(71200400001)(2906002)(66946007)(26005)(9686003)(6512007)(107886003)(54906003)(316002)(91956017)(66446008)(38070700005)(76116006)(186003)(86362001)(6506007)(64756008)(66476007)(66556008)(6486002)(83380400001)(8936002)(38100700002)(122000001)(5660300002)(44832011)(36756003)(8676002)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rm8xR3lDNytKYlAzeU5samJIMzBwREhKaHpMdExuZVBQaURnbXllMTN3a01G?=
 =?utf-8?B?bUxIbWZyaFBoSjVXRVNrV2tRK2N5QWtlQUJyWTVRUFpZU1lIMDYxa1V5bENF?=
 =?utf-8?B?SThYMXk2TVlnNFljQlMwTk9vYnZyYlNrTWgwWGEvMVlDVHdlaUZPaStUSWUw?=
 =?utf-8?B?LzFsR1dicmdFTVFXNmZJbTN4eGdKZ0VpNmY4TWZZOEMwU2hDdVAvZFBIM3FV?=
 =?utf-8?B?YkREdUdQVEFZc2RKZzVpMlpXMHA1L3MrL0JlOTdsYlBTSkNEQTkwbDhpbFVM?=
 =?utf-8?B?dGdPRW55UWpFakI0QkVIc3NRVTRZeUtFQmpiVW4yc28wdDIxb2o0VjJFWVBM?=
 =?utf-8?B?S2RsVi9KQzdXS3BiZ0J0MGZJeEdSQWU2dnppdmxNYTdQbUovNENVQWRDRFdv?=
 =?utf-8?B?RnRuZWp4TzNXRGpoeE9hWURYZ2dCUG1HNjVwa2o0eFcwd3VBbkZwWlBOS3kx?=
 =?utf-8?B?ZVZnRnVlZUl3WWVaeFNrbXBCOGlRMnZVdThBYTE2MUxIZGpGZnhPeWoxeGhj?=
 =?utf-8?B?NTQyWUNONVlLdlA5Q0ttZC90ZGl2N0Y4djg2S1NlQkg1UUF6Q05YZElld1lz?=
 =?utf-8?B?S2RWd21Eb0Z1VHoyZUVPMTFieW1vQjhLc0phR0k2dUJIRjNaVHk3c1g4ZW5T?=
 =?utf-8?B?TGpQNkZaTGdPZ0JnRUVTNW9YNUpmMEV4M3JWaWpmYU1kTXpaVnEvYUNOQ1J0?=
 =?utf-8?B?Z3FrcUdOcGdVTk9xcldmaEg4Rzg1bzcxRVU0UDVlUEVUVjRBSU8rQ3FFSHhh?=
 =?utf-8?B?dDhnQ1pvT0hwM1pHWXdrNUJQd01PNnZVOThSMk1MZSswcjRwNGpCemk4U2Q5?=
 =?utf-8?B?a1EzN3BpdGFLQW5Zdmp2NXdmbUd6eVg3OWNYOXNpY0NpcEdMUFpyMVFNZkpv?=
 =?utf-8?B?SlRqRUp1anB5UytOU21kTVlBY3hMaVVwTFpGTzFNYjczbzJQLzl4dU5FSkRl?=
 =?utf-8?B?WklkK0l6c3V1NHVaVVl3L0JnckZ1WjBLMzBRQXloSmVyU2o2bWtUaXB2am1w?=
 =?utf-8?B?QW1ZZUpCSVJhaTRlU2ZaMUFDd0RjWUl6RWw2OVY3STBNUTlYbW9mdVgyL2dG?=
 =?utf-8?B?QjE0b0QvRXM3akNkL1Q4RllVUUJ1Ykl3Ym81Zno2K2VMT09HQU9QVHlCVW56?=
 =?utf-8?B?UnFFNkRSZU80RVJTWlZ3UWo3VnM3SEI1d0g3QVptK1NCYzl2S2hvWnFvMlRB?=
 =?utf-8?B?OEdoWDY3dnV1c1dvdm5qZzVsYVdwUHphYmxHRXhQYUhMQ21nV21FNEdWQWg0?=
 =?utf-8?B?cWlqV1QvOVBFOEF0STRXT1FWRzdMSFRmc3dKTzJlaGxneHNRbkFIVXFTd1gz?=
 =?utf-8?B?emZaMjZNL2FMdnJheEJ2L2FvSlJhYS8xS1ZsNXFMZ0xCVkRTRzVxVlRZUEt5?=
 =?utf-8?B?VVdIdTd3Y2tNQ2NQbjI3R013L1Q2bklaZ0VuZEdwVk5oOFlnNFkwc1hhbE91?=
 =?utf-8?B?amY4K0hVL2RjbnlFZ1BkQ0IvbUhjdzkydWhhb3preVZqSXpwdDZGOHp0QVZT?=
 =?utf-8?B?WTJuMHdiQWpMZmtzOEp5dHEzaDhTM2FZZHhMNXhNcXJmOXEvN1JWT01VWUJG?=
 =?utf-8?B?TkhSZDBaYWpLT3prakJFc2Q3czBweEh3YmlKV1BzTDFMTUJBSFF0aGZqZjlJ?=
 =?utf-8?B?MWZKaHltdEs3UFlySmlFOTAwQWhSYUtXbkNNUTdKMlladStMZmhPVW1haUIy?=
 =?utf-8?B?T0pIMDF2UlhQZVJqMHJ1anlCNkFWZjRMNFpHM09xa2Q4VmR5RFo4czJRdm82?=
 =?utf-8?Q?76mDDDvXo5uqxBo0o3IKxvfauZGLC23CMKclab1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAE7EB7048502F4F9727749985FF0B0D@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4580.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970abbcb-d649-4017-33d6-08d960b4b721
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2021 12:52:33.1462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i5E7n2vDLr0wFGlpf8aZQ/sowYPG8v0fWlKpzq62RaeM+Conjsy53PbKTv4UFOWzeppf5vfawNJQK1Cg8VQobQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6516
X-Proofpoint-GUID: y1q8lP1GIMeXw9oXmfQGjibmViDM4HyJ
X-Proofpoint-ORIG-GUID: y1q8lP1GIMeXw9oXmfQGjibmViDM4HyJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-16_04,2021-08-16_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=john.levon@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gRnJpLCBBdWcgMTMsIDIwMjEgYXQgMDI6NTE6NTNQTSArMDAwMCwgSmFnIFJhbWFuIHdyb3Rl
Og0KDQo+IFRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uIGFib3V0IHRoZSBCbG9ja2luZyBhbmQg
Tm9uLUJsb2NraW5nIG1vZGUuDQo+IA0KPiBJ4oCZZCBsaWtlIHRvIGV4cGxhaW4gd2h5IHdlIGFy
ZSB1c2luZyBhIHNlcGFyYXRlIHRocmVhZCBwcmVzZW50bHkgYW5kDQo+IGNoZWNrIHdpdGggeW91
IGlmIGl04oCZcyBwb3NzaWJsZSB0byBwb2xsIG9uIG11bHRpcGxlIHZmdSBjb250ZXh0cyBhdCB0
aGUNCj4gc2FtZSB0aW1lIChzaW1pbGFyIHRvIHNlbGVjdC9wb2xsIGZvciBmZHMpLg0KPiANCj4g
Q29uY2VybmluZyBteSB1bmRlcnN0YW5kaW5nIG9uIGhvdyBkZXZpY2VzIGFyZSBleGVjdXRlZCBp
biBRRU1VLA0KPiBRRU1VIGluaXRpYWxpemVzIHRoZSBkZXZpY2UgaW5zdGFuY2UgLSB3aGVyZSB0
aGUgZGV2aWNlIHJlZ2lzdGVycw0KPiBjYWxsYmFja3MgZm9yIEJBUiBhbmQgY29uZmlnIHNwYWNl
IGFjY2Vzc2VzLiBUaGUgZGV2aWNlIGlzIHRoZW4NCj4gc3Vic2VxdWVudGx5IGRyaXZlbiBieSB0
aGVzZSBjYWxsYmFja3MgLSB3aGVuZXZlciB0aGUgdmNwdSB0aHJlYWQgdHJpZXMNCj4gdG8gYWNj
ZXNzIHRoZSBCQVIgYWRkcmVzc2VzIG9yIHBsYWNlcyBhIGNvbmZpZyBzcGFjZSBhY2Nlc3MgdG8g
dGhlIFBDSQ0KPiBidXMsIHRoZSB2Y3B1IGV4aXRzIHRvIFFFTVUgd2hpY2ggaGFuZGxlcyB0aGVz
ZSBhY2Nlc3Nlcy4gQXMgc3VjaCwgdGhlDQo+IGRldmljZSBpcyBkcml2ZW4gYnkgdGhlIHZjcHUg
dGhyZWFkLiBTaW5jZSB0aGVyZSBhcmUgbm8gdmNwdSB0aHJlYWRzIGluIHRoZQ0KPiByZW1vdGUg
cHJvY2Vzcywgd2UgY3JlYXRlZCBhIHNlcGFyYXRlIHRocmVhZCBhcyBhIHJlcGxhY2VtZW50LiBB
cyB5b3UNCj4gY2FuIHNlZSBhbHJlYWR5LCB0aGlzIHRocmVhZCBibG9ja3Mgb24gdmZ1X3J1bl9j
dHgoKSB3aGljaCBJIGJlbGlldmUgcG9sbHMNCj4gb24gdGhlIHNvY2tldCBmb3IgbWVzc2FnZXMg
ZnJvbSBjbGllbnQuDQo+IA0KPiBJZiB0aGVyZSBpcyBhIHdheSB0byBydW4gbXVsdGlwbGUgdmZ1
IGNvbnRleHRzIGF0IHRoZSBzYW1lIHRpbWUsIHRoYXQgd291bGQNCj4gaGVscCB3aXRoIGNvbnNl
cnZpbmcgdGhyZWFkcyBvbiB0aGUgaG9zdCBDUFUuIEZvciBleGFtcGxlLCBpZiB0aGVyZeKAmXMg
YQ0KPiB3YXkgdG8gYWRkIHZmdSBjb250ZXh0cyB0byBhIGxpc3Qgb2YgY29udGV4dHMgdGhhdCBl
eHBlY3QgbWVzc2FnZXMgZnJvbQ0KPiBjbGllbnQsIHRoYXQgY291bGQgYmUgYSBnb29kIGlkZWEu
IEFsdGVybmF0aXZlbHksIHRoaXMgUUVNVSBzZXJ2ZXIgY291bGQNCj4gYWxzbyBpbXBsZW1lbnQg
YSBzaW1pbGFyIG1lY2hhbmlzbSB0byBncm91cCBhbGwgbm9uLWJsb2NraW5nIHZmdQ0KPiBjb250
ZXh0cyB0byBqdXN0IGEgc2luZ2xlIHRocmVhZCwgaW5zdGVhZCBvZiBoYXZpbmcgc2VwYXJhdGUg
dGhyZWFkcyBmb3INCj4gZWFjaCBjb250ZXh0Lg0KDQpZb3UgY2FuIHVzZSB2ZnVfZ2V0X3BvbGxf
ZmQoKSB0byByZXRyaWV2ZSB0aGUgdW5kZXJseWluZyBzb2NrZXQgZmQgKHNpbXBsZXN0DQp3b3Vs
ZCBiZSB0byBkbyB0aGlzIGFmdGVyIHZmdV9hdHRhY2hfY3R4KCksIGJ1dCB0aGF0IG1pZ2h0IGRl
cGVuZCksIHRoZW4gcG9sbCBvbg0KdGhlIGZkIHNldCwgZG9pbmcgdmZ1X3J1bl9jdHgoKSB3aGVu
IHRoZSBmZCBpcyByZWFkeS4gQW4gYXN5bmMgaGFuZ3VwIG9uIHRoZQ0Kc29ja2V0IHdvdWxkIHNo
b3cgdXAgYXMgRU5PVENPTk4sIGluIHdoaWNoIGNhc2UgeW91J2QgcmVtb3ZlIHRoZSBmZCBmcm9t
IHRoZQ0Kc2V0Lg0KDQpOb3RlIHRoYXQgd2UncmUgbm90IGNvbXBsZXRlbHkgYXN5bmMgeWV0IChl
LmcuIHRoZSBhY3R1YWwgc29ja2V0IHJlYWQvd3JpdGVzIGFyZQ0Kc3luY2hyb25vdXMpLiBJbiBw
cmFjdGljZSB0aGF0J3Mgbm90IHR5cGljYWxseSBhbiBpc3N1ZSBidXQgaXQgY291bGQgYmUgaWYg
eW91DQp3YW50ZWQgdG8gc3VwcG9ydCBtdWx0aXBsZSBWTXMgZnJvbSBhIHNpbmdsZSBzZXJ2ZXIs
IGV0Yy4NCg0KDQpyZWdhcmRzDQpqb2hu

