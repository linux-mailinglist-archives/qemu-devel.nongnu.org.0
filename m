Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F48241D0BE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 02:48:59 +0200 (CEST)
Received: from localhost ([::1]:60886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVkFu-0006tQ-BQ
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 20:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9907073e8e=pdel@fb.com>)
 id 1mVkDt-0005X0-DD
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 20:46:53 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:50138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9907073e8e=pdel@fb.com>)
 id 1mVkDr-0007ZA-J9
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 20:46:53 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18TNkDoX012202; 
 Wed, 29 Sep 2021 17:46:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Jx+crZfVNEYOBVbeFAckpaBoyCyNmAJYLz5Ml4T48lw=;
 b=cCLORTA+OxKEgt434Vjucq/55h/3KLr14sUdJ61nYxba6OW31RjyNpgUHGiLSu9Gl44E
 xKyO47Ov6kkf4BeyqhURNPLsIbQKSDIwG9OYlEw63230d0jzhNzK2MqGxhyKQit4RhBV
 klyN3t3Z47hOvD5rN7OthelGnEdh3uAsPlw= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3bcvwqapad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Sep 2021 17:46:42 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 29 Sep 2021 17:46:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2+uxQYEneN6zUKe1BuViaALD0NWFNwUHxGSqzh+sBkeVS6Nbeg1dmONPk/0bsWjZWOJ56YTizwSfIcRuVCSordvb6023V8A/2xS5tQd4S7nYh6GSVYW5oK5LZDpQ7pbUC/qQ4VyXaxL3Xw0M1XyP6uS9NNooZ15MGIvGsfvVf7ThCv4CTPRe8csHbYo+1iUHKHTkeo/nbwYSnZTt7lilq+2w6YymCq4x1iDrh2YdBkXnD7vaJjzzi+nysbx+zIB2GlxmP3ju0XUVk71p1GQronK9NG++SJx+bItptM9+wzj2MVWy43htJT6YxbmOcosDumYc597REu4joJ6gcKkqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Jx+crZfVNEYOBVbeFAckpaBoyCyNmAJYLz5Ml4T48lw=;
 b=Jfb2g2ZgsIL7rsFJ9kC74RTjF3T0PpE1VLzeLQwER0W0YUj4kE1Luu0ScvAMeg015wf4YgkqCIfN+KNvydvKegp/CnI9soDTzljc9Bx0vs0L8Am3487mizsJPLjrn8mUIb/5FTWP7JifQNaN6Z35YhXUHmMavCEtymEaU43xtkjzwJoDNDwg09pD2l0SVl8qH20ifBj+cjGHy/xJeZ3q1fffOSe/4DOcCRnzxdTvjmRDaKCneWUwQyTr14hQ7RIOhxxKnSahlAJ6Cfo+896ejhtwBhoLYDrGZdIG84ZnV/YcOBEZ91hgjnd4ZM7zUo69RHUpVlUJLV1BzajXcva9qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BYAPR15MB2710.namprd15.prod.outlook.com (2603:10b6:a03:153::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 00:46:39 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f%7]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 00:46:39 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, "rashmica.g@gmail.com" <rashmica.g@gmail.com>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>, Dan Zhang <zhdaniel@fb.com>
Subject: Re: [PATCH 0/1] hw: aspeed_gpio: Fix GPIO array indexing
Thread-Topic: [PATCH 0/1] hw: aspeed_gpio: Fix GPIO array indexing
Thread-Index: AQHXtBsWPq88pZQZpkKSFod53KaUd6u7wQuA
Date: Thu, 30 Sep 2021 00:46:39 +0000
Message-ID: <8EC0D138-31B3-4681-8B69-E558BE9ACB40@fb.com>
References: <20210928034356.3280959-1-pdel@fb.com>
In-Reply-To: <20210928034356.3280959-1-pdel@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9989279-6cfb-4eca-39c3-08d983abc3e0
x-ms-traffictypediagnostic: BYAPR15MB2710:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB27108AAD99450F8FD8283BF9ACAA9@BYAPR15MB2710.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HbxLwfcpoCchp/n1rjRm/XKtR3bKAZsS30mIT6QwM0mLXtX9u7tDOiCgyVAfkmjWsbgwhomsVsZkZ16ac3Gt3zjKElJwaVTNSiMqdcbyzYdZ5OxiBEHORGIbzAv3xb5NyE239py9GmVf2o/cE3VvD3MgFd4X8jXc7S3i7rfH5Uawa0JslW//fuHZPvn+7rLlftQyYqNV3ncqQGORr6Vwam1q8tpVIcDHVsUPo07IkYRenMTr1Vq2yEkI/Tjm/gh8uorHjctQdHnfRfzAd323QoRWPyHgQ5b+02PwituPTB7Eg0E4WxSWlkmuyoe9A+cIDD+Kzetd87Qton0grZ7DSIQ4l+RhwNX0QLXppgTZaDFSBepoPEUts6zIdRakbux1dBslWQuiDKghiFzmPa6hoaM1MMvXca7RzFaSY1eWad5kL2iQ673430RCOlSv34euylufHIiX7i/5Jq3bIo/UpZBEq20spM1phWGCoaW+mWLL4etMxIEEAYunITjkn5Sv0D4wq20wWHii+rtzMrdee9PIFA4tqOPu+9a2TTEMYpGcWO8YfWTe8zFCl1bNFKpvEEF9KEDQ57Z5l5mxz5eDzSBADdsuQyiscw2C1K9l1MQYVMmIkSL8ZWfUdRYWYULHiHy6lB3mKjZIO0jtJDNNmqWx7Q5zEFQ5JuEmP2DTnIai3HXIaLRamT9R8jHFOQAzpI7fQRWDiMMftGvxsBmI4KsmaT6MZLAO6ssBbfKPP4hmF4aVYeKJ0uWfrlUEmG2kW3fTEQUB3OVNjET9uYxd2sgDO9ouS+I9JzMHAWgmJWqTZhNi+yD1WfLh+M3FxTGQKQrukMcEf6OCBU0dpZ1Ljg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(38100700002)(122000001)(66946007)(76116006)(86362001)(966005)(66446008)(66476007)(316002)(66556008)(64756008)(2906002)(4326008)(2616005)(71200400001)(36756003)(508600001)(109986005)(38070700005)(54906003)(53546011)(6506007)(83380400001)(5660300002)(8676002)(6512007)(186003)(6486002)(8936002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dk9CWjhNZ1RBVk9lbmxlRENtZldyajhUZXVMSml6WFhsMzhMdXFhV2o1S3hu?=
 =?utf-8?B?VEZyaUZWTGd5SmlOckF6dFBSZERQSkZHODdCS2NvS0h3NXVRRU5WUk5Ua2hP?=
 =?utf-8?B?cmZpdnFIN282eXhRMEt1dVpoN3Y0ajZ5eEl5QkRUalVZTENVK2xYNGlXcGlt?=
 =?utf-8?B?cHB0TnpDL0ljSnlVbnZmbmtDd2VmRzZueUZNcGFqYnBIYkozbWsrL2FvME5n?=
 =?utf-8?B?ZDd1YlRyLzByTGZlQmhGK2w1K0JKU0ZRUTVBRzNnMDIvTmhVTGc1am5MdU9n?=
 =?utf-8?B?aEYxU2dCWTJWbFBLSWxLbElNRC93N2grTmlyS0ZEUW9GUDFsaTBWbGIxMFBO?=
 =?utf-8?B?MzlxZ2QxUzZIWG1BYUxweW9RZGZDRkp4MjV1a0pjemhCVkhxc2g0a1FjeG9t?=
 =?utf-8?B?T05MZDNLWGNUSmJoeWxEdjdrajRKaGVPaVlXMDllM3FLSVVSWmJBUzZoeDNT?=
 =?utf-8?B?NitFL0xxa2N2Q1NjR1Z4S0UrcWl4RzdLVGs0NlpXaVZqOWxMYXBOczErOU9X?=
 =?utf-8?B?YUtEQnFIODZ3eldzaDBXN05maUo2YkFSelBSMElZeGdjQ0V4M3V6MnJkQnlF?=
 =?utf-8?B?ZnRBSnhKQWRTSVJvYVdZTVg4YXpDNHNjRkhPMXdDTmk0QTV0OFJOKy9lYitt?=
 =?utf-8?B?dXU4YURCbFU0QnNld0FXVUUvU1c2cGNyb1NuOVZKODZhekdkdXRacVprZVZ1?=
 =?utf-8?B?d1ZnNFJLbXZ2WS9UbzVWejQycHY0UmNYVE9sVEdaRzBBdSs2aVB6alNtTncv?=
 =?utf-8?B?MGJYV2EwSm1wN1pyaFlnSDFmUUp5RHFsSFJvbisvMSsvUEI5WUkzR2lVY0tv?=
 =?utf-8?B?M0tNSXorblU5OWc1ai9CM0ZCN0c3Mm5VcUdydHh5M1JGQ0JhMkxGaDBXbGJK?=
 =?utf-8?B?TitxVmszSlFoSjJxakd1U3c4Y1BhYnJVMytnQWJsTEZKcVFhYjdiR1FmUHM2?=
 =?utf-8?B?R3Q4eEZIWFhmNS9VdTI0OTlzeEJvM3F0ZzNUUmlFVlJDbll5WlAvb3E5Z09p?=
 =?utf-8?B?VnZaT3BoZG0zNWZQN01BdEVJSERGUzJvT1lwWFBXZkJYVUxJMlV1YXA2b21Z?=
 =?utf-8?B?M3NWTCs5aTREZXJaZ2Jjb096dThtMWtja3JvYnZBNkgzcGgyeG04dXpUSWNp?=
 =?utf-8?B?Ym41ZnJDQzd6NmZCa1J4TkxLWEgyMjZqK2ROUmxsN3gxNU53WG9od09IbSt0?=
 =?utf-8?B?dHlJeVora2J3TVdBUzRiZThoV2YvNDNhOUFiekdOMmdsaFZNWkhhTGNGZk5O?=
 =?utf-8?B?NjdacmdMV0krK3pDSzJYeTFIaFVZZG5hTlBHMEFWaXNjWnlkZm5tTjVpc253?=
 =?utf-8?B?azNzaFp2NmFmd2V4QjZCQ1Jua3Rab2piWUJrVzdtN011aVFQTzh2Q25vNWpJ?=
 =?utf-8?B?OHNiU2lsU08zL0s0V3ZDbmZ1Z0UzRFF1b2RPZkdTbjFvUzE4Z3l2d2ZMa0x1?=
 =?utf-8?B?dUY1S0FsYVEwU3RTZ2JnVTRpaG5GOWtYYTZlNzBvM2hkRm9JQkdHRW9hTlA4?=
 =?utf-8?B?bm40NGZTMjU4K2ZIYkl3VVFzLzF6cWdRTTl1bFlRWmhaN1JqTjFkRDk0dzlp?=
 =?utf-8?B?eXlvUGNDVEFZY3ZWR1FvL0l2TjBhZVBUcEF0V3pVL242Z21nZ1NRdmZ0eGsw?=
 =?utf-8?B?cGt6K05oWVAvZ2xYRWxEU1RqV1ZXMmhqMnVxUS9lbkx5MTY0VlRkb1Q1UVJK?=
 =?utf-8?B?Uk5oSlZ6WlcwQlpMV2I1SExKNzBoZ0Nab3BUYkFuUTNOZXVKWWxlUStVRUVj?=
 =?utf-8?B?a3JzNjJaNFcrZkpDQXViZUcxQlFCWjBwZDV0VEQ0b2V1bHhDOUNpeENWQTZ4?=
 =?utf-8?Q?KREiz2//QXPZRNx7enCHEKQZA8P5VRCi+LicQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74CF0CA4594F184DACF6C8C5004D4579@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9989279-6cfb-4eca-39c3-08d983abc3e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 00:46:39.7254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y9VSQfSCNF76be2POrQsRBa6TbvFWfSMucKHVJTWEsWIK0pADXIg/eZD9ViX3pJQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2710
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: A2vFKF4-Oo7fbs-UZsLAF8T8bCfDjFPO
X-Proofpoint-ORIG-GUID: A2vFKF4-Oo7fbs-UZsLAF8T8bCfDjFPO
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_09,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109300001
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=9907073e8e=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

DQoNCj4gT24gU2VwIDI3LCAyMDIxLCBhdCA4OjQzIFBNLCBwZGVsQGZiLmNvbSB3cm90ZToNCj4g
DQo+IEZyb206IFBldGVyIERlbGV2b3J5YXMgPHBkZWxAZmIuY29tPg0KPiANCj4gSGV5IGV2ZXJ5
b25lLA0KPiANCj4gSSB0aGluayB0aGVyZSBtaWdodCBiZSBhIGJ1ZyBpbiBhc3BlZWRfZ3Bpb191
cGRhdGUsIHdoZXJlIGl0J3Mgc2VsZWN0aW5nDQo+IGEgR1BJTyBJUlEgdG8gdXBkYXRlLiBUaGUg
aW5kZXhpbmcgdGhhdCBtYXBzIGZyb20gR1BJTyBwaW4gdG8gSVJRIGxlYWRzDQo+IHRvIGFuIG91
dC1vZi1ib3VuZHMgYXJyYXkgYWNjZXNzIGFuZCBhIHNlZ2ZhdWx0IGFmdGVyIHRoYXQuDQo+IA0K
PiB0bDtkcg0KPiANCj4gVGhlcmUncyA4IHJvd3Mgb2YgMzIgcGlucyAoOCAqIDMyID09IDI1NiB0
b3RhbCkgb24gdGhlIEFTVDI1MDAsIGJ1dCBzb21lDQo+IG9mIHRoZSBwaW5zIGFyZSBub3QgYWN0
dWFsbHkgYWN0aXZlOiB0aGVyZSdzIG9ubHkgMjI4IHBpbnMgYWN0dWFsbHkNCj4gYWN0aXZlIGlu
IHRoZSBBU1QyNTAwLg0KPiANCj4gVGhlIEdQSU8gSVJRIGFycmF5IGhhcyBsZW5ndGggMjI4LCBi
dXQgd2UgaW5kZXggaXQgdXNpbmcgYSBtYXRyaXgNCj4gaW5kZXhpbmcgc2NoZW1lIGxpa2UgW3Jv
d11bY29sdW1uXSwgYW5kIGVuZCB1cCBvdXQtb2YtYm91bmRzIGZvcg0KPiBoaWdoLW51bWJlcmVk
IHBpbnMuDQo+IA0KPiBJIGZpeGVkIHRoaXMgYnkgY29udmVydGluZyB0aGUgSVJRIGFycmF5IHRv
IGEgbWF0cml4LCB3aGVyZSBzb21lDQo+IG9mIHRoZSBlbnRyaWVzIGFyZSB1bmluaXRpYWxpemVk
ICh6ZXJvKS4gVGhpcyByZXRhaW5zIHRoZSBtYXRyaXgNCj4gaW5kZXhpbmcgc2NoZW1lLCB3aGlj
aCBJIHRoaW5rIGlzIGVhc3kgdG8gdW5kZXJzdGFuZC4NCj4gDQo+IE5vdGVzIG9uIHJlcHJvZHVj
aW5nOg0KPiANCj4gSSB3YXMgdGVzdGluZyBib290aW5nIEZhY2Vib29rJ3MgT3BlbkJNQyBwbGF0
Zm9ybSAiWW9zZW1pdGVWMiIgKGZieTIpDQo+IGFuZCBoaXQgYSBzZWdmYXVsdDoNCj4gDQo+ICBx
ZW11LXN5c3RlbS1hcm0gLW1hY2hpbmUgYXN0MjUwMC1ldmIgXA0KPiAgICAgIC1kcml2ZSBmaWxl
PWZieTIubXRkLGZvcm1hdD1yYXcsaWY9bXRkIFwNCj4gICAgICAtc2VyaWFsIHN0ZGlvIC1kaXNw
bGF5IG5vbmUNCj4gIC4uLg0KPiAgU2V0dXAgQ2FjaGluZyBmb3IgQnJpZGdlIElDIGluZm8uLmRv
bmUuDQo+ICBTZXR1cCBGcm9udCBQYW5lbCBEYWVtb24uLmRvbmUuDQo+ICBTZXR1cCBmYW4gc3Bl
ZWQuLi4NCj4gIEZBTiBDT05GSUcgOiBTaW5nbGUgUm90b3IgRkFODQo+ICBVbmV4cGVjdGVkIDQg
U2VydmVycyBjb25maWchIFJ1biBGU0MgNCBUTHMgQ29uZmlnIGFzIGRlZmF1bHQgY29uZmlnDQo+
ICBTZXR0aW5nIFpvbmUgMCBzcGVlZCB0byA3MCUNCj4gIFNldHRpbmcgWm9uZSAxIHNwZWVkIHRv
IDcwJQ0KPiAgb2s6IHJ1bjogZnNjZDogKHBpZCAxNzI2KSAwcw0KPiAgZG9uZS4NCj4gIFBvd2Vy
aW5nIGZydSAxIHRvIE9OIHN0YXRlLi4uDQo+ICBTZWdtZW50YXRpb24gZmF1bHQgKGNvcmUgZHVt
cGVkKQ0KPiANCj4gSW4gZ2RiOg0KPiANCj4gIFRocmVhZCAzICJxZW11LXN5c3RlbS1hcm0iIHJl
Y2VpdmVkIHNpZ25hbCBTSUdTRUdWLCBTZWdtZW50YXRpb24gZmF1bHQuDQo+ICBbU3dpdGNoaW5n
IHRvIFRocmVhZCAweDdmZmZmMjBlZTcwMCAoTFdQIDE4NDAzNTMpXQ0KPiAgcWVtdV9zZXRfaXJx
IChpcnE9MHhmZmZmZmZmZjAwMDAwMDAwLCBsZXZlbD0xKSBhdCAuLi9ody9jb3JlL2lycS5jOjQ1
DQo+ICA0NSAgICAgICAgICBpcnEtPmhhbmRsZXIoaXJxLT5vcGFxdWUsIGlycS0+biwgbGV2ZWwp
Ow0KPiAgKGdkYikgcCBpcnENCj4gICQxID0gKHFlbXVfaXJxKSAweGZmZmZmZmZmMDAwMDAwMDAN
Cj4gIChnZGIpIHVwDQo+ICAjMSAgMHgwMDAwNTU1NTU1OGUzNmY1IGluIGFzcGVlZF9ncGlvX3Vw
ZGF0ZSAocz0weDdmZmZmN2VjZmZiMCwgcmVncz0weDdmZmZmN2VkMGM5NCwgdmFsdWU9MTI4KSBh
dCAuLi9ody9ncGlvL2FzcGVlZF9ncGlvLmM6Mjg3DQo+ICAyODcgICAgICAgICAgICAgICAgICAg
ICBxZW11X3NldF9pcnEocy0+Z3Bpb3Nbb2Zmc2V0XSwgISEobmV3ICYgbWFzaykpOw0KPiAgKGdk
YikgcCBzLT5ncGlvcw0KPiAgJDIgPSB7MHgwIDxyZXBlYXRzIDIyOCB0aW1lcz59DQo+ICAoZ2Ri
KSBwIG9mZnNldA0KPiAgJDMgPSAyMzENCj4gIChnZGIpIHAgc2V0DQo+ICAkNSA9IDcNCj4gIChn
ZGIpIHAgZ3Bpbw0KPiAgJDQgPSA3DQo+IA0KPiBXaXRoIG15IGZpeCwgSSBjYW4gYm9vdCB0aGUg
ZmJ5MiBwbGF0Zm9ybS4gVGhlIGltYWdlIEkgd2FzIHVzaW5nIGlzIGhlcmU6DQo+IA0KPiBodHRw
czovL2dpdGh1Yi5jb20vcGV0ZXJkZWxldm9yeWFzL29wZW5ibWMvcmVsZWFzZXMvdGFnL2ZieTIu
ZGVidWcubXRkDQo+IA0KPiBQZXRlciBEZWxldm9yeWFzICgxKToNCj4gIGh3OiBhc3BlZWRfZ3Bp
bzogRml4IEdQSU8gYXJyYXkgaW5kZXhpbmcNCj4gDQo+IGh3L2dwaW8vYXNwZWVkX2dwaW8uYyAg
ICAgICAgIHwgNzIgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gaW5jbHVk
ZS9ody9ncGlvL2FzcGVlZF9ncGlvLmggfCAgNSArLS0NCj4gMiBmaWxlcyBjaGFuZ2VkLCAzMSBp
bnNlcnRpb25zKCspLCA0NiBkZWxldGlvbnMoLSkNCj4gDQo+IC0tIA0KPiAyLjMwLjINCj4gDQoN
CmNj4oCZaW5nIERhbg0KDQo=

