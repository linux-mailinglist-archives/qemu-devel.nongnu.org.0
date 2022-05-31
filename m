Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C965395E5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 20:09:13 +0200 (CEST)
Received: from localhost ([::1]:36458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw6Ip-0003Y4-Oq
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 14:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=715083ab97=pdel@fb.com>)
 id 1nw6Ag-0000lJ-3y; Tue, 31 May 2022 14:00:48 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:24188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=715083ab97=pdel@fb.com>)
 id 1nw6Aa-00039X-S9; Tue, 31 May 2022 14:00:45 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24VFiJHX020530;
 Tue, 31 May 2022 11:00:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=HfsrQd8QCktUHTMKwn2UGKzHmlPuv/nWqEiuoDJlU4I=;
 b=m2qrqRm1PZ1FYJfSrvIA3IiHZPI3vCrXQ+DNmGjIg12mQXUsjmwuIBnKo5Ws6MIx0Meh
 Imxc2joWc6fIyA4vtAMWRKVAHqPnsj7gDo3kyfrN/H9cpCiXkRlbOSUybAQrHbfqeByr
 WO2x3n+ExD658FujmNI4hOt705SU6F1v/9c= 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gbguqqchm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 May 2022 11:00:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nu9F9sGtCFGE25ryokeVFlnNyG8SoffZZQwFqInu5tAI2M2q9p19NEm5UXJldikA9ecZ4asST8o9CKLONVbEIDVSHukEVnFcyTHLKrzqedOevXZI3P5dHSVohXZozE6ZCHBs5jERzBrxAXsm98LW99C8zioboiw68um+5VYZuuwDwhYqdo4EYd8xqPt5RWt7puH7DhnnsCXTbGXexxumomOgZvi5QJJqPaufUEYJvvCA69M+Sv9O8XbYVIf+9Wbv81ld8ibZSx9Bep+ygg1+qxQ+Lcopqfir3/qllP2+MIJV8NTgiGpjWrDFLmOYf8TRM2IPeJE+wii/FsY4kylnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfsrQd8QCktUHTMKwn2UGKzHmlPuv/nWqEiuoDJlU4I=;
 b=Gqo928xCX4Gmmz3bX8yVo+dq7UbBsczUERl1/UEUyWixcKvl5BMjE4EWB3hkFHZaFUtwqFvjbKdEG9dcIl7sksloXs17BXCCpDT12G0PvwRbfpabeTglch3xlhxsqUCd+L4+M6ALEkU+KzP/CPVscPoOWLNDqiss2+D9twKKZKx1Mfm3wi1mIm/3g0ZmG6clC7tSLYWS4Z/wMN5ISF8uRS+lb8f1AZIu8UZYLbtBD/spDvAMlTNPXrgzm2BRBIb34gqKME1uPPCHXhFQf833WO0mRbib5zliSrgeKGJZxSwjbsiNB0+J0kqsWBpMzITCOJAK3z3rxck/dsq8qeHXBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by DM5PR1501MB2168.namprd15.prod.outlook.com (2603:10b6:4:a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 31 May
 2022 18:00:08 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::5812:71cc:63fb:1081]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::5812:71cc:63fb:1081%6]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 18:00:08 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, qemu-arm <qemu-arm@nongnu.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Peter
 Delevoryas <pdel@fb.com>
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Add fby35 machine type
Thread-Topic: [PATCH 0/1] hw/arm/aspeed: Add fby35 machine type
Thread-Index: AQHYXy6+7tiiaA0Gq0SF+yxrT9QWG60NrPWAgAAUQwCAKfSGAIABvGqA
Date: Tue, 31 May 2022 18:00:08 +0000
Message-ID: <CA907729-9BCA-4780-903B-BB25128B40A0@fb.com>
References: <20220503204451.1257898-1-pdel@fb.com>
 <f0143ab9-54e9-09cd-d203-e779f9d8d6e4@kaod.org>
 <A0BF3AA6-C57B-4A95-BCE2-92CE7A3733A8@fb.com>
 <13cfe1ad-63dc-dc5b-7955-67f7f70f160b@amsat.org>
In-Reply-To: <13cfe1ad-63dc-dc5b-7955-67f7f70f160b@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d2b0cfa-e8fa-4cd1-4ec7-08da432f6680
x-ms-traffictypediagnostic: DM5PR1501MB2168:EE_
x-microsoft-antispam-prvs: <DM5PR1501MB2168C189B74770E9CFB2E178ACDC9@DM5PR1501MB2168.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RX7v1FmzHL6eka1soTI/a3iL5c6AoVKYkK4RsIw2YenEs16Shr+bQVSV5jCVZfMbBVLOMELrvl7k3XZoMYVlMD3GhZCiUA3c1cMKjx+KcdJwejeaMwo5vG/DHeHGH1mszNDhWubaJh5X7yeZ6mmadKSfGK0rpDhEJC0WzNdvRDA/VTbXG+OrBw7W2bxhZTMgHHa7qz6srdVycpwGS3VcJvOtuiNZGD1usoSOo0BN0bear4I4Du0ai7SkFyImdF04qBF036RjvXlOKKGBI8jckE4ZFeM3TDJRLlkmgVDpBEk3hqOS0uLBV2xI8eVVdcUqhqnTZFhi5nVB2LASqnxdaYNntjokxV7y1CWn0+cR4GpOJ6jXJenIwx71NOhH1d7U1QJAKtT+JqQaW3O3BP411ZJVAJerxWow3i4731DdW59dPJHGKHOvFlHqLo9i0GhS4IxVxdOY15odfdf8/r9I4mFafeLwbZk9Sv/YaOfSMau+1nxvTC+fiGtLJbEfMJOcHc1REztUZkSyedNCc/QuGoXnW3CEMbrE4EHDcU8/nV78Qva6k8y7t+jJ7BCi7EbUrWXM8TSW/fCrlIbx2w+ZiRCnx46Ri3PIltWWDqkE2Cl/qjrltRcRKGLUNBw3QZXq1cByy/0+TLHYq6r7e3OOjPESXZuMwjpqxXDa3rlB+xMYxQ1Z8iR4QsGOZ4nhA7TOi37efps7HyHJPk0pMFkEol3fReVHCTpz03eOcrCBWkCsdDelfXABJzX+p0pkrtCo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(54906003)(6486002)(86362001)(71200400001)(8936002)(6512007)(66574015)(186003)(109986005)(2906002)(122000001)(83380400001)(508600001)(53546011)(6506007)(5660300002)(38070700005)(38100700002)(64756008)(66446008)(66946007)(66556008)(66476007)(33656002)(91956017)(8676002)(4326008)(36756003)(76116006)(2616005)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmhJSGRQK3UxNklNWlNyakZ3UVRBeWduWUJicjc5SW5JUnRUZlRPVzFpbDk0?=
 =?utf-8?B?YUxMQjRQYlBtY05PRmk1L3FkNmhZUDRhK3B4SWtxb3NUeXkzNUMxM2hINEkv?=
 =?utf-8?B?QnY1OFFsRHN4VjZaQ0cxbzFjSk4vbUh6c0pzM0pURFhBOWZJUUdOMXhZKzRH?=
 =?utf-8?B?U24yMGN1a3ZsMmttamk0QityYTNGdnVYQXFsR3czVEZYWDB0cjFFSStUWFZv?=
 =?utf-8?B?RjBzbjJLcXI5bVA5ejVWc2daNit5U0JESE5pTjFZeW9CazZzc3BZcDY1YkpG?=
 =?utf-8?B?cnNIOEhoQjFXdnFCT0RYc2tuNXhiWHVJM0RlSk8xdjY1UFhDOGZoRktSYk5k?=
 =?utf-8?B?QVUvc2UvTDMzamFYWjY1Yi9CelNLMVRuYTNQOEl3dnNQVU9MKzBacENwT1Fh?=
 =?utf-8?B?bEwvSDZ1aFhZdE1yTXVlMUhHdEVBeU12bFg1UDJweVJkSXJva1FiMlhwVmoy?=
 =?utf-8?B?UjJnWXQyZUJkTUNCK3dSNzdUR25FdFd0R0htd0d3ZGhZMXJUMFZWMWExWUEv?=
 =?utf-8?B?QTgyOXJxSStBR1FzaEVzSDFCdUgxVzJEWG1VcUw4b3RuOUo3aGVnb1F1aTJi?=
 =?utf-8?B?MjRWUHlTaWtpRFRLd0xiZGlLNnlXcEhMaTVIdFpHMy90NjFqdmpjY0pscFcy?=
 =?utf-8?B?NzdOMi9SUlVjK2pHMklGT0NMZFY3cFRRQ2EwMmpBT25mZ0JQbFRkaFNySVg5?=
 =?utf-8?B?Y3ByQmd0WDFZWWQzWFJnSmphWnVDVklWaHNmODhCeFZFTnFuc0hjRTV4blBZ?=
 =?utf-8?B?UkVQYlRSSDE5Uld6ejF2YWZLdjhTblphRmljZDRETmliTDVUVjJZblNaSkNs?=
 =?utf-8?B?R2NMTllaZ2hqemx4c2JpS1FNQ3hsVGYzNDM3cWFSd0NXa1Boa3RiY001VTJz?=
 =?utf-8?B?M0Z5REtBOVBYR0pRVE0ybVQ0a0dOZ1RuM3E4Zjd0MDAzRE5mMHdyTXdGQ1o3?=
 =?utf-8?B?N0J5MWhyTzk1YmFnMm9WRENTQzM1c2tyVmY4MW5PS0tmcFJRbUk2WkJOUnB3?=
 =?utf-8?B?L2MwaUYvTTFJUnNGVXRYVEJ5MUxJOTkyQlJRNmxYcjVpYXM3dTJlM1JRaDR0?=
 =?utf-8?B?bzZvcEVYdW1rTjZjTmlBcFQycjQ2Y1FYVGgyVklYbVpaY3VkQlRHU1UySUo0?=
 =?utf-8?B?aGVBSUtoWW5pa0RZN0syNyt4VEpiRzlDRHJrZEFBMEIvV2hTeGFRUUtYMEE1?=
 =?utf-8?B?L3RBU3k2d05vT2RPYnNSUjVmQ3o4L3pqaytXSzZQSEVqT3M1dW00aVFONkVw?=
 =?utf-8?B?cUtwaVpSTEZzbDVQWEJOMzhXVWZYeEJFSVVVOFNxdWlOSjZaUnJyRmhRS0VB?=
 =?utf-8?B?bFFuMlNaUlV1TE0vWjBlTmlGOU5IVEQwTmpYUnlTT3d6NDR0Nnd3Q3RZdDBa?=
 =?utf-8?B?Rk83TTM5OHRtUjZ4T0wrVW5CMTNYYisxdVhtWDNibnh6c1hjQW1iM3NYekpY?=
 =?utf-8?B?Mkg5WWx1QzE5Qnh5amd4WmV0alpYeW1zbmRhOEgwZEI2QTJKNHMrUWlJeXVN?=
 =?utf-8?B?Kzk1aGsveURSM2orT2VXak1yWG9zek9Ua0ZUOCtVMnUwc3hvTDNWKzVTNitv?=
 =?utf-8?B?elc1czF4WENWWmkyUVBzTWEyelR4UTF2YVdkN0V3d3FqVlAyZEQxSWVvOUYx?=
 =?utf-8?B?Wm9NWGQzQ2pONUE1RVBFL2xVWk9VQ2M1S20xdFpaZnAzVnZ4ZFB2K013WU1q?=
 =?utf-8?B?dnFZUXRsNWtyelBOY2Zmc0hoaW90UlJNdVdObFZxaWwzMTNnSGdBeGhJcDdM?=
 =?utf-8?B?YVN1VGkxK2RaSkczWWwzRkdBTXE0b2hQU2FXbVRjOWJsbnFnbUl4K1RlaktD?=
 =?utf-8?B?Mmp1VzVuRGpRMlM3ekNqQ09mTmVETGVhWEQ2bEpVUEx4dDFtMFBWV2x5MkdY?=
 =?utf-8?B?ZHVjSjRnUndybXdaQVRHMkZDMWxOWFMxT3dKWnh4Q2YxUHVaZ1h0ekdNNXl0?=
 =?utf-8?B?WVFsVmNUaGg5dkJmOElKdm9FbFNUSE04MGU0NVA5OFdKNFQ5WWhvRCtIeHNx?=
 =?utf-8?B?dDFmQkVtYzZrQjc2Vnp2RElLcW82bW5xVGV5UERWZlI3OHFhU1JHN0FvTmJZ?=
 =?utf-8?B?T1F4MGN1QzVDWHB1NDZqc3RLWWhHQitIcHNxNjFkZjF6L1VBNlpnMjR5VVFW?=
 =?utf-8?B?QkJmTWh2T0ZCZjQ4aEJXVHFzZE1lV1JnMFpCMmN1anFsc2lTaDNNUXp2SHdh?=
 =?utf-8?B?T0RYbUR2ZXpCQ0svbm9GbFNvNTcwYjlQTytwV3RQcGhlQ3h1VytYamMyN0E4?=
 =?utf-8?B?YW1XemwvVVlLcGp1Y0R3RVYxWGNaYVdyTkxueGU3aEZKOHhVUndpVXZodEFB?=
 =?utf-8?B?RG1WSnpQeGhjazU3TzVWSERlTSs1eHNhdFBlMjVRVitSeG1kTEVibnJ6YnlW?=
 =?utf-8?Q?Am9qSCNNOetQm0Ag=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <12755075200D734CAE64F193C08A5A0E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2b0cfa-e8fa-4cd1-4ec7-08da432f6680
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 18:00:08.8398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3i9vUBx3aCX55bG1LrXpv17iLxx6RLk4lrslLq12FzzQUAWq3eNsphb4VQDZMu0u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1501MB2168
X-Proofpoint-GUID: gXeOb-ZlSMJKbCdTCJfy6h690zSepYtP
X-Proofpoint-ORIG-GUID: gXeOb-ZlSMJKbCdTCJfy6h690zSepYtP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-31_07,2022-05-30_03,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=715083ab97=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTWF5IDMwLCAyMDIyLCBhdCA4OjI5IEFNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSB2aWEgPHFlbXUtYXJtQG5vbmdudS5vcmc+IHdyb3RlOg0KPiANCj4gT24gNC81LzIyIDAwOjQ3
LCBQZXRlciBEZWxldm9yeWFzIHdyb3RlOg0KPj4+IE9uIE1heSAzLCAyMDIyLCBhdCAyOjM1IFBN
LCBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPiB3cm90ZToNCj4+PiANCj4+PiBPbiA1
LzMvMjIgMjI6NDQsIFBldGVyIERlbGV2b3J5YXMgd3JvdGU6DQo+Pj4+IEhleSBldmVyeW9uZSwN
Cj4+Pj4gSSdtIHN1Ym1pdHRpbmcgYW5vdGhlciBGYWNlYm9vayAoTWV0YSBQbGF0Zm9ybXMpIG1h
Y2hpbmUgdHlwZTogdGhpcyB0aW1lIEknbQ0KPj4+PiBpbmNsdWRpbmcgYW4gYWNjZXB0YW5jZSB0
ZXN0IHRvby4NCj4+Pj4gVW5mb3J0dW5hdGVseSwgdGhpcyBtYWNoaW5lIGJvb3RzIF92ZXJ5XyBz
bG93bHkuIDMwMCsgc2Vjb25kcy4NCj4+PiANCj4+PiBUaGlzIGlzIHRvbyBtdWNoIGZvciBhdm9j
YWRvIHRlc3RzLg0KPiANCj4gVXNlOg0KPiANCj4gIEBza2lwSWYob3MuZ2V0ZW52KCdHSVRMQUJf
Q0knKSwgJ1J1bm5pbmcgb24gR2l0TGFiJykNCj4gIEBza2lwVW5sZXNzKG9zLmdldGVudignQVZP
Q0FET19USU1FT1VUX0VYUEVDVEVEJyksDQo+ICAgICAgICAgICAgICAnQmlnIGluaXRyYW1mcyBh
bmQgcnVuIGZyb20gZmxhc2gnKQ0KDQpUaGFua3MgZm9yIHRoaXMgc3VnZ2VzdGlvbiENCg0KPiAN
Cj4+IEVyZywgeWVhaCBJIGZpZ3VyZWQgYXMgbXVjaC4gSeKAmWxsIGp1c3QgcmVzdWJtaXQgaXQg
d2l0aG91dCB0aGUgYXZvY2FkbyB0ZXN0IHRoZW4sDQo+PiBpZiB0aGF0IHNvdW5kcyBvayB0byB5
b3UuDQo+IA0KPiBObywgcGxlYXNlIGtlZXAgdGhlIHRlc3QuIFdoaWxlIGl0IHdvbid0IHJ1biBv
biBDSSwgd2UgY2FuIHJ1biBpdCBsb2NhbGx5LCB2ZXJ5IHVzZWZ1bCB0byBiaXNlY3QuDQoNCk9r
LCBJ4oCZZCBiZSBoYXBweSB0byByZXN1Ym1pdCB0aGUgdGVzdCBub3cgd2l0aCB0aGUgQHNraXBJ
ZiBhbmQgQHNraXBVbmxlc3MgZGVjb3JhdG9ycw0KKFNpbmNlIHRoZSBtYWNoaW5lIGRlZmluaXRp
b24gaGFzIGJlZW4gbWVyZ2VkIGF0IHRoaXMgcG9pbnQpLg0KDQo+IA0KPj4+PiBJJ20gbm90IHN1
cmUgd2h5IHRoaXMgaXMgKHNvIEkgZG9uJ3Qga25vdyBob3cgdG8gZml4IGl0IGVhc2lseSkNCj4+
PiANCj4+PiBUaGUgZnVqaSBoYXMgdGhlIHNhbWUga2luZCBvZiBwcm9ibGVtLiBJdCB0YWtlcyBh
Z2VzIHRvIGxvYWQgdGhlIGx6bWEgcmFtZGlzay4NCj4+PiBDb3VsZCBpdCBiZSBhIG1vZGVsaW5n
IGlzc3VlID8gb3IgaG93IHRoZSBGVyBpbWFnZSBpcyBjb21waWxlZCA/DQo+PiBZZWFoLCBvbmUg
cmVhc29uIGlzIHRoYXQgRmFjZWJvb2sgT3BlbkJNQyBtYWNoaW5lcyBoYXZlIGFuIHVubmVjZXNz
YXJpbHkNCj4+IGJpZyBpbml0cmFtZnMgdGhhdCBpbmNsdWRlcyBhbGwgdGhlIHJvb3RmcyBzdHVm
Ziwgd2hlcmVhcyByZWd1bGFyIE9wZW5CTUMNCj4+IG1hY2hpbmVzIGhhdmUgYSBzbWFsbGVyIGlu
aXRyYW1mcyByaWdodD8gSSBkb27igJl0IGVudGlyZWx5IGtub3cgd2hhdCBJ4oCZbSB0YWxraW5n
DQo+PiBhYm91dCB0aG91Z2guDQo+PiBJIHRoaW5rIG1vc3QgRkIgbWFjaGluZXMgaGF2ZSBtb3Zl
ZCB0byB6c3RkIGNvbXByZXNzaW9uIHJlY2VudGx5IHRob3VnaCwNCj4+IGJ1dCB0aGlzIG9uZSBt
YXkgaGF2ZSBiZWVuIG1pc3NlZDogSSBjYW4gZml4IHRoYXQgb24gdGhlIGltYWdlIHNpZGUuIEni
gJlsbA0KPj4gYWxzbyBleHBlcmltZW50IG1vcmUgdG8gc2VlIGlmIGl04oCZcyBzb21ldGhpbmcg
d3Jvbmcgd2l0aCB0aGUgaW1hZ2UsIG9yIHBvc3NpYmx5DQo+PiBhIHJlZ3Jlc3Npb24gaW4gUUVN
VS4gSXQgd291bGQgcmVhbGx5IGJlIHN1cGVyIGF3ZXNvbWUgaWYgaXQgY291bGQgYm9vdCBmYXN0
ZXIsDQo+PiBzbyBJ4oCZbSB2ZXJ5IG1vdGl2YXRlZCB0byBmaW5kIGEgc29sdXRpb24uDQo+IA0K
DQo=

