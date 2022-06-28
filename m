Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC68555BFC3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:24:21 +0200 (CEST)
Received: from localhost ([::1]:45764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67SG-00009D-Q3
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7178e17cfc=pdel@fb.com>)
 id 1o65I0-0006pW-Ev; Tue, 28 Jun 2022 03:05:38 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:49560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7178e17cfc=pdel@fb.com>)
 id 1o65Hw-0000dR-TF; Tue, 28 Jun 2022 03:05:34 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1S83007302;
 Tue, 28 Jun 2022 00:05:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=4fYisljl4N7pM7Fj1g2PyW/CyxPbijr2BACr+2EvLhg=;
 b=jxWE7tmtLtLf79KC7ObH57K+oFCnLlWLHTML0w4TqRChaQzhiz+XtQ7V2AJ72XjpkZZw
 pgzkBijmfS5qSVH55M73AnQCMNbDeto8BhjO/KtWQQN0NmlHO/sWA+FyIYKiYTq6fQSH
 RRMR2B+nxiqXb20HvvF8y0mahB85KhgdvRE= 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gyg0acp6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jun 2022 00:05:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ox1SxtQ0h+8d2xoFZ1Ks2AEcOasxCDgIgmU95r6+c3zuk3Jdbry5YoUlPcDM8Mz4yl2kNvmC8YCeGxJ5W4X0CKo8fZZhLu/n/gYDhKJVYDcoNTAFhvGwqqVwB3NNknmQwKVbTBqxcI9ciOSp3E7t1bvyL/wUojHFYZnVEP0xYLRSnfP6iKdjc+/9P+uwyJQgMt/ILPIX9j6ujAjH8QegYITXADlcYhJsbZwzA0KWqv8o8iU/LDv429Fix3Kp6UQZYjthe3CVKvE+JjCvYvVhHflR6jOQ3VpkoRC7UJpZSmtq7uwSvbCNxMKoVN8GFfybpHpPOY7eOOnVXJDUCRZ3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fYisljl4N7pM7Fj1g2PyW/CyxPbijr2BACr+2EvLhg=;
 b=PH3Lb5WjfCLQ1cPHxyrVdpYFz8e1s8qhALcJ4jKWJZsIUwp1cMmPnRb0mjaJk0Cm2yRWidfbbjsmojRwF3bsCABn1vRZGDD4eXVugsHOmOMMHP8lg3l3hY7pK1Q5u1s7ZbRM/K0SL0b4wp83UIgrPXv7n10c10IW0EUjy6Nx9BObuJS0UxFsInCHxqqdB/KJO7OYTIfBpMeIPtezIxncaOI8SpP7qwuqR/H4gUUsPZTqeTKX6fYgJ4XLJOhT88l1Ny8IZ6eKWLYVQVTdC48bwDFgs70u0RVR/Of+rq2Lcyxgj2auPBKFsi1Ga1ILxVhr+2aB3qrWGxfohtfvA8I5nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by MWHPR15MB1453.namprd15.prod.outlook.com (2603:10b6:300:bd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 07:05:18 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 07:05:18 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Peter Delevoryas <pdel@fb.com>, Dan Zhang <zhdaniel@fb.com>, Cameron
 Esfahani via <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "komlodi@google.com" <komlodi@google.com>, "titusr@google.com"
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH 04/14] aspeed: i2c: Fix DMA len write-enable bit handling
Thread-Topic: [PATCH 04/14] aspeed: i2c: Fix DMA len write-enable bit handling
Thread-Index: AQHYil/gwzsWstkoR06jgjOliriH7a1kZQiAgAABD4A=
Date: Tue, 28 Jun 2022 07:05:18 +0000
Message-ID: <497F636B-2E6A-4971-8BD8-7B6A77B95E70@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
 <20220627195506.403715-5-pdel@fb.com>
 <33f3769a-f1de-9cee-d5e7-6d342d8a579f@kaod.org>
In-Reply-To: <33f3769a-f1de-9cee-d5e7-6d342d8a579f@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9965480-ef64-445d-a2fc-08da58d48f03
x-ms-traffictypediagnostic: MWHPR15MB1453:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U/j+gJcYExT9fBQDK2JF/p8fW8RI2E1SpkXI8vDZnfFilXznabXcgJp8o67ryHMQbADr57pTz+YY1q4EXBvsn2iICMyZUQ6rNKMGofPo5Wny6k+Ui/ny2tXGCN7Wil1/JOHjcgKG5CedhQEm1BUdSHtg42Sn6u1l/qvd4ooOC5+tQEyeBR89xBr8roaxnEIiBauJD4xA/x58qvO9Q/AH6CC9wXzrtxGHPS9znY/9BSYlsyV4YT87+CL+Gzp9Q3AWx2YFj9WGS4hTq6+xUGk1mh7Cf0fLGGKfIrh8BurR5nsY49d3XCr0Atzolo08E4wcL3riuxaWFW0EBmW12gVXZMmJIsobXkZo2ZVOjUJN4CtO2/epT5VksLpsnkpTMUKtT+hd/XovyGkZf8s3uSn3vXE0lKAIRck1VBcpuyY0za+ExzfEBpniw0rAPQBrYh0el9Bsvb2WQLayxaIYJXT78NLzS9nzPxLGRRZQJTUSpwy4lWaYuExK1gmDWHZX/7kGgwgqmd/VCgMcolSeNpoWzALBscEcrYkl2TaFi4H9D7sQQ+D0Q7jb98HbfOiukLFyv7IZtbRW/fLVumbUPfv7FJ/pJVsVjPxQ+1R23UqdmSO7lXcQEVHWPzSIbGMZN+TYrYSLkCZ8xne6+A87NN9q/uoVvfNo/bO9sMY/VaXLJOibXR6BfuXGkCXqoGubxZFpK0yBHSGmMOOrvt/T1drjiCengGGMA+XCVgB8A7FtVY8wJUV0b1EBMl2SDsaJkBl0vYQhUOD4E+ZiPgmKMzINueXc9CtM+VTi51mS8TIJtrlxKZQ8+Ed72QM7bMzu0xUV53P8lGlg2EYx9iRFbCKvj4wkCRlGyTk+VfW2I1YAeWw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(5660300002)(38100700002)(83380400001)(2906002)(64756008)(122000001)(66476007)(38070700005)(6506007)(41300700001)(4326008)(33656002)(66446008)(8936002)(316002)(71200400001)(109986005)(86362001)(478600001)(36756003)(54906003)(2616005)(966005)(66946007)(66556008)(6512007)(76116006)(91956017)(8676002)(186003)(6486002)(53546011)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHhibVBOOTJYUm9Kc1hIb1A1OE95NHFTY3IzL1EzTjdIQ09tZ1pzSlJ5QWZy?=
 =?utf-8?B?VG81a0RNQjVSeFljMG12YXB3QVJIK1pWRkUxMnZuUlgvR3RSSE5MajRqZ1ZL?=
 =?utf-8?B?dGdWNE10L3Z4Zk5iMGduK1o2emFDSWNtbWh2L200MWxzSXZuODZuQWtnakJp?=
 =?utf-8?B?Ty9FUEI1UCtobFRYTDdNelM2ekdlb2FhcE04ZTNSYlhWNXMya2laa2tCNG5s?=
 =?utf-8?B?TCsvUkxaODJkSHFPcWc1Q3BXMWZmdVJvWnF6Ym5MME9GaDM0bVU3Vi9QU0lk?=
 =?utf-8?B?V1FFbWZ5M09tVWdJRVFSZWszR0VBQllVaENtMnBjUFhNTlgxbVpYK2t4Zk5w?=
 =?utf-8?B?M0p3S0VRU2liVkJHckxMRHZKd3F3U0VON091NWVUVGVmdWpFNUsvSStJaDlm?=
 =?utf-8?B?clRnbWRCd0pDejlvSVl2OEpHbUZWa3pqMTZUL2ZjeGIvSUI1V1luOTJSZHRn?=
 =?utf-8?B?TVovSTRqKzdoaXlVN3N4MnRUYWlpRi9WbDM4NjkyUjhjb2RjWTcrWWZFOFd0?=
 =?utf-8?B?RmgrSkppZnphNHBuOVBiRHkrSm1mMGp2dDJlL1F0dTlCK1ROdGNuM3cvVDE5?=
 =?utf-8?B?UVlnRmFGUkoyQm9BWkZIT0cvU3RLdHp5elExd3RkRysvOEgzNE04MmRPUTlx?=
 =?utf-8?B?RG96MlpQeEplV25OdnhpOUFGRURJR2U0cjRuRGRoMnlnS1oxZnVNWUtXV21Y?=
 =?utf-8?B?dVpVbE5nWXpmckZTR21tSHp3c0JPb1A5eENBaHpkc1JSU3VqWjNjcStidU5R?=
 =?utf-8?B?c25JOVBnZ1JqQUhQY1NxekVkT1JiZDdXMmxlM2NXUTNqeW43VGE5cExPeWJr?=
 =?utf-8?B?QytCdG80aHRoaEg4VXU0OGN4THp1ZEJ3MWhxeVpWWkdmN0J2SjFzTkdUVldv?=
 =?utf-8?B?c01RNDZNa21yaXVTQzVEVEdoWWk0QTNLeEpOU3FiSmMyQmJCSlQrYjZjc08y?=
 =?utf-8?B?djNmVUo2R3JFdHliY3lFTzZCVkczM3hrUHRhaStwZmVTV3ZrVXNQQ1NaMXpr?=
 =?utf-8?B?VUNrc3ZrVVhPWEhZbE1YUmdWd3EyS1FLVG1xTWpZQ2xiTDF1TEZ1MzdnQzFl?=
 =?utf-8?B?NklGR3VWUFp0cmJwQWYralFxNk1aNVEwKzdjYmNQeitqbHR2eGYrTk50Ty9B?=
 =?utf-8?B?Z3I3ZnRsU2Z3ZGh6ZGJjVkZFdU5EbXROMndWcjdScnNmcmpTbmozcHJWY0tu?=
 =?utf-8?B?VDFMUzkzeFg0ZThQby9qR2hDc2pSRmJOOHRSSVVYTnVKbXFSTGRaeVh4MHFs?=
 =?utf-8?B?RzJielBtR0JBTzNQSlVYL01McGg0VjNtaVBkcTJrbUV4VytJaWhQTGU4U0Mw?=
 =?utf-8?B?eTg0QVNIMkVMNU5wSmc3NGxtVnBYSFhrMnV6Y0k0blpGZHlZclgwaG9DSko1?=
 =?utf-8?B?bGpEVWF3TXkzYi9oMmdJMFd3cVRGL216VDdTOXJUYlRQcHhQU2tSZWNLTFlD?=
 =?utf-8?B?emMzbVVyNFNUeGRHcFNtamhPWnphWER3cURDMU9oaFQwQXI4R0xxRGRlVmV5?=
 =?utf-8?B?cjYzQkswSGZPLy9oKzIvMVBrZXN5NmhXZ2RINXpOSzEvZCtKd2U0OTNJYm9P?=
 =?utf-8?B?bi9KUndzMFBVQnU0RTQrb0xEcUJxaTZxRHQvQnFxblJwaGV1S1pKejNnRU5R?=
 =?utf-8?B?TEI0dVZHbm1DWE1OZkppdWhUVWNxYWNPdG80Uk15dk45U3lhSkt3NnpRNnhn?=
 =?utf-8?B?bVA5M0UvdFNXOTV6dWRiaDVFcDRGWitxQWorSEJRWDhDYzFBMzUyZXZBSUFV?=
 =?utf-8?B?V09MRU1FY0F2enBheEI2cW1IVUZFQlVBYnVVNDZwRnRMQ0FzTlNjTDJ1aFVQ?=
 =?utf-8?B?dnJ3KzBOU3JoQ3hkbTNSWFBMNDFuVXVmQzFVejd3Uk5sZm9nNXdGWDdhV1c2?=
 =?utf-8?B?bm4zMC80UlhydEJZem1lT05sK0lyQ2RDa2xjU1dtckMrUUJGRUtaY3lvYU5W?=
 =?utf-8?B?TWN5U2UvZExEMUMzU1E1TEFKbUFFRDdWOEVxZ3IwdUZaRUQvMTB4OGFRNGxF?=
 =?utf-8?B?U0xiNGx3ejNoVnNiMTdLanI0U1hOdkhscmhQY1IxZTVKaWxRZ3U3VGFhaTJx?=
 =?utf-8?B?b21hakJNRisrTmlXYVlXdUU3RVdqaXVFL2V1b0dCbFVTQzhEdlNKT2NPcm5R?=
 =?utf-8?B?NmwwbE4rZklPQ2NNTnQ0V0thVUlvOUpCaS9uOFFmdTV2SU9aeWpiUFFVTFQ1?=
 =?utf-8?B?RHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69376F2527C269448FB881F0AAF4F1F0@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9965480-ef64-445d-a2fc-08da58d48f03
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 07:05:18.1881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lvaZwsmJSG+yz3mLhTkZnZRP2hicOm21l36Op4BTbhNl9Un66pKJfpdF/MkjVWuA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1453
X-Proofpoint-GUID: phkPs4rtuvkbFIik28e7mTiyDJx1hZuD
X-Proofpoint-ORIG-GUID: phkPs4rtuvkbFIik28e7mTiyDJx1hZuD
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_09,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=7178e17cfc=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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

DQoNCj4gT24gSnVuIDI4LCAyMDIyLCBhdCAxMjowMSBBTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiA2LzI3LzIyIDIxOjU0LCBQZXRlciBEZWxldm9y
eWFzIHdyb3RlOg0KPj4gSSBub3RpY2VkIGkyYyByeCB0cmFuc2ZlcnMgd2VyZSBnZXR0aW5nIHNo
b3J0ZW5lZCB0byAiMSIgb24gWmVwaHlyLiBJdA0KPj4gc2VlbXMgdG8gYmUgYmVjYXVzZSB0aGUg
WmVwaHlyIGkyYyBkcml2ZXIgc2V0cyB0aGUgUlggRE1BIGxlbiB3aXRoIHRoZQ0KPj4gUlggZmll
bGQgd3JpdGUtZW5hYmxlIGJpdCBzZXQgKGJpdCAzMSkgdG8gYXZvaWQgYSByZWFkLW1vZGlmeS13
cml0ZS4gWzFdDQo+PiAvKiAweDFDIDogSTJDTSBNYXN0ZXIgRE1BIFRyYW5zZmVyIExlbmd0aCBS
ZWdpc3RlciAgICovDQo+PiBJIHRoaW5rIHdlIHNob3VsZCBiZSBjaGVja2luZyB0aGUgd3JpdGUt
ZW5hYmxlIGJpdHMgb24gdGhlIGluY29taW5nDQo+PiB2YWx1ZSwgbm90IGNoZWNraW5nIHRoZSBy
ZWdpc3RlciBhcnJheS4gSSdtIG5vdCBzdXJlIHdlJ3JlIGV2ZW4gd3JpdGluZw0KPj4gdGhlIHdy
aXRlLWVuYWJsZSBiaXRzIHRvIHRoZSByZWdpc3RlciBhcnJheSwgYWN0dWFsbHkuDQo+PiBbMV0g
aHR0cHM6Ly9naXRodWIuY29tL0FzcGVlZFRlY2gtQk1DL3plcGh5ci9ibG9iL2RiM2RiY2M5YzUy
ZTY3YTQ3MTgwODkwYWM5MzhlZDM4MGIzM2Y5MWMvZHJpdmVycy9pMmMvaTJjX2FzcGVlZC5jI0wx
NDUtTDE0OA0KPj4gRml4ZXM6IGJhMmNjY2Q2NGU5MGYzNCAoImFzcGVlZDogaTJjOiBBZGQgbmV3
IG1vZGUgc3VwcG9ydCIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBEZWxldm9yeWFzIDxwZGVs
QGZiLmNvbT4NCj4+IC0tLQ0KPiANCj4gTmljZS4gQ2FuIHlvdSBtb3ZlIHRoaXMgcGF0Y2ggYXQg
YmVnaW5uaW5nIG9mIHRoZSBzZXJpZXMgPw0KDQpZZWFoIHN1cmUhIEnigJlsbCBkbyB0aGF0IG9u
IHYyLg0KDQo+IA0KPiBSZXZpZXdlZC1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9y
Zz4NCj4gDQo+IFRoYW5rcywNCj4gDQo+IEMuDQo+IA0KPiANCj4+ICBody9pMmMvYXNwZWVkX2ky
Yy5jIHwgOCArKysrLS0tLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+PiBkaWZmIC0tZ2l0IGEvaHcvaTJjL2FzcGVlZF9pMmMuYyBiL2h3L2ky
Yy9hc3BlZWRfaTJjLmMNCj4+IGluZGV4IDJjZmQwNWNiNmMuLjZjODIyMjcxN2YgMTAwNjQ0DQo+
PiAtLS0gYS9ody9pMmMvYXNwZWVkX2kyYy5jDQo+PiArKysgYi9ody9pMmMvYXNwZWVkX2kyYy5j
DQo+PiBAQCAtNjQ0LDE4ICs2NDQsMTggQEAgc3RhdGljIHZvaWQgYXNwZWVkX2kyY19idXNfbmV3
X3dyaXRlKEFzcGVlZEkyQ0J1cyAqYnVzLCBod2FkZHIgb2Zmc2V0LA0KPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUlhfQlVGX0xFTikgKyAx
Ow0KPj4gICAgICAgICAgYnJlYWs7DQo+PiAgICAgIGNhc2UgQV9JMkNNX0RNQV9MRU46DQo+PiAt
ICAgICAgICB3MXQgPSBBUlJBWV9GSUVMRF9FWDMyKGJ1cy0+cmVncywgSTJDTV9ETUFfTEVOLCBS
WF9CVUZfTEVOX1cxVCkgfHwNCj4+IC0gICAgICAgICAgICAgICAgICAgQVJSQVlfRklFTERfRVgz
MihidXMtPnJlZ3MsIEkyQ01fRE1BX0xFTiwgVFhfQlVGX0xFTl9XMVQpOw0KPj4gKyAgICAgICAg
dzF0ID0gRklFTERfRVgzMih2YWx1ZSwgSTJDTV9ETUFfTEVOLCBSWF9CVUZfTEVOX1cxVCkgfHwN
Cj4+ICsgICAgICAgICAgICAgIEZJRUxEX0VYMzIodmFsdWUsIEkyQ01fRE1BX0xFTiwgVFhfQlVG
X0xFTl9XMVQpOw0KPj4gICAgICAgICAgLyogSWYgbm9uZSBvZiB0aGUgdzF0IGJpdHMgYXJlIHNl
dCwganVzdCB3cml0ZSB0byB0aGUgcmVnIGFzIG5vcm1hbC4gKi8NCj4+ICAgICAgICAgIGlmICgh
dzF0KSB7DQo+PiAgICAgICAgICAgICAgYnVzLT5yZWdzW1JfSTJDTV9ETUFfTEVOXSA9IHZhbHVl
Ow0KPj4gICAgICAgICAgICAgIGJyZWFrOw0KPj4gICAgICAgICAgfQ0KPj4gLSAgICAgICAgaWYg
KEFSUkFZX0ZJRUxEX0VYMzIoYnVzLT5yZWdzLCBJMkNNX0RNQV9MRU4sIFJYX0JVRl9MRU5fVzFU
KSkgew0KPj4gKyAgICAgICAgaWYgKEZJRUxEX0VYMzIodmFsdWUsIEkyQ01fRE1BX0xFTiwgUlhf
QlVGX0xFTl9XMVQpKSB7DQo+PiAgICAgICAgICAgICAgQVJSQVlfRklFTERfRFAzMihidXMtPnJl
Z3MsIEkyQ01fRE1BX0xFTiwgUlhfQlVGX0xFTiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEZJRUxEX0VYMzIodmFsdWUsIEkyQ01fRE1BX0xFTiwgUlhfQlVGX0xFTikpOw0KPj4g
ICAgICAgICAgfQ0KPj4gLSAgICAgICAgaWYgKEFSUkFZX0ZJRUxEX0VYMzIoYnVzLT5yZWdzLCBJ
MkNNX0RNQV9MRU4sIFRYX0JVRl9MRU5fVzFUKSkgew0KPj4gKyAgICAgICAgaWYgKEZJRUxEX0VY
MzIodmFsdWUsIEkyQ01fRE1BX0xFTiwgVFhfQlVGX0xFTl9XMVQpKSB7DQo+PiAgICAgICAgICAg
ICAgQVJSQVlfRklFTERfRFAzMihidXMtPnJlZ3MsIEkyQ01fRE1BX0xFTiwgVFhfQlVGX0xFTiwN
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEZJRUxEX0VYMzIodmFsdWUsIEkyQ01f
RE1BX0xFTiwgVFhfQlVGX0xFTikpOw0KPj4gICAgICAgICAgfQ0KPiANCg0K

