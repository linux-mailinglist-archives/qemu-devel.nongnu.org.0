Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934A955BF5B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:14:20 +0200 (CEST)
Received: from localhost ([::1]:55580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66MV-0001QJ-LP
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7178e17cfc=pdel@fb.com>)
 id 1o65TC-0007AY-MA; Tue, 28 Jun 2022 03:17:12 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:50908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7178e17cfc=pdel@fb.com>)
 id 1o65TA-00027k-8I; Tue, 28 Jun 2022 03:17:10 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1Rr2028853;
 Tue, 28 Jun 2022 00:16:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=3nB86+BzntqGVC62FT7tknv3tQpF3V8fkbKA2eJIhCA=;
 b=MnlWstAjVz2C3uC+ozOD1d12QL10p7Ge59fY8poU2JRwX4dAJvxysNNu9W53Ri2WuTX7
 8s2F5AccNBYTIkW7aZF6mTGJkwvO1fERZ+1FFa2TYGobibNhOXdIKlMmlRfwgcm5HAfO
 CqOuQVP/F97/QriLpLswd6HFZoNRleoHp18= 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gwwpqghgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jun 2022 00:16:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPnNU0ZR4JRJZUzJWctVzGAxmsesstf11GPMeTm4yXMXwp30lZgumFj1fWUryQ63qji+yQU5jhIL34YZwmBiGv6qjGHrbYbfKJ945Uulo0OD1y1U/c5YcNZzSm1Tl+HdiXy7+LlpTYVXXaHq9zgNfAuOCLh5Eunj4ki7GKCZxcv2Zf6Ak2olKGZqdCZQWSF/3sKGAYi5H0n++GSjzOFAsMCdtAI6eYD27lwtn4JC8Q2GIwcG7Y/mvcibFAb6v8Bl9MjD+ftBO348r1LpQPquUTvZ7TlGLNX5lku1DNjUlIXPskuoWqhLyoLMmoLZ4EJxEsm9CMKPad08IS0Dopn0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nB86+BzntqGVC62FT7tknv3tQpF3V8fkbKA2eJIhCA=;
 b=YixJZ0sg79SwJqJDz93qF/jsVMXpxmUPNiS6OZ2/y+jKeVGcwkmtm86Du+5+2E0u7TiLCNh93EnyMGjJJObcKJZgbpK0XwXNEqBS/SRVcz9qBAzeqVAEWIC/4ylPuxHcG/th9zEzamUUXQnvqfCvCehPJfouEmtMDosUrz3y58dM4kxiXLMdKthR4TPV8OO91y4xTadl6xAi9bL3GgKuDDkxMvLHMafyB9SJP4N07dIXFUfEoVbeHk1KfnCbLyW9aEmT8hk3YwTgh3ZrvHRE783m+0apb6N+ycmvcq6WzKgK9L0NVXExKNM+VL2DifZfonydMWqx0GqkkW/4N+7zSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BN7PR15MB2273.namprd15.prod.outlook.com (2603:10b6:406:8a::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 07:16:55 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 07:16:55 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Peter Delevoryas <pdel@fb.com>, Dan Zhang <zhdaniel@fb.com>, Cameron
 Esfahani via <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "komlodi@google.com" <komlodi@google.com>, "titusr@google.com"
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH 00/14] aspeed: Add I2C new register DMA slave mode support
Thread-Topic: [PATCH 00/14] aspeed: Add I2C new register DMA slave mode support
Thread-Index: AQHYil/W7ZvhxdBEVUmbdlk0gMVBHq1kZhCAgAADRYA=
Date: Tue, 28 Jun 2022 07:16:55 +0000
Message-ID: <C8F2CDE2-EBA8-473B-9D33-2AE781DC7FFB@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
 <94b12c69-cee0-192e-fe9c-19b9d85ae6b4@kaod.org>
In-Reply-To: <94b12c69-cee0-192e-fe9c-19b9d85ae6b4@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66ad1185-8a26-4bed-7b7d-08da58d62e7d
x-ms-traffictypediagnostic: BN7PR15MB2273:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9gr/WX9WKeK8+uMdx8oicjJvLcVEe0Mp3hf+IoK3Rxq73sLa/AE93IZdkealTuhDNY5pUXKLQO9Q8FIQCCztACp2luSMY6O/8s/LHO1geJZlCdHIysm8slYYbzbHAM2w6MDZ7G0TPCHzkydi398lQNCeC4zCq1LrXy7Oryn7s/HgPadQCXvkbHgRmf1oeWuszZtIO8i8dqVI8TfzRzLTUTknd8HpS91bWkNFoyqsxU+xotEPlq4N9saIwKD915ABod/w5138WRJnBCd7ee/fkejEgNEfsNe+GZS0Qm9T/sstKg8Ou1sMbblCrygSpE6I+YKAiGOxdF4Lv2WLJIRt5B1XF13hGaT7E8tcDr0mHU6RjSfr6gDAQ6L0NJ+R0JqST47LysALs//jVY5pMtktzEnoP2675OarYRdKrQfyMp8Gvt6qjmo6EyTXxlWgh9iox+7E3s98zT47A2ZNUbcTWgZFsxQiKXWXh+4c1hcyaYKZ+OyRFESysvxaGCvtRbdjKPTVE+gpLoj0zf7podPtUR7mNoidKAh9t3paNbP/AAKQKKm2jWyruNr83aYpLws2twfrW9eZ1AFn8cOgGWB+BHuPMGob0DyW4lAHi2+yzfKroRKp30U+pC9SXgXPObBYjNcxqzY5c9iwgrnVH5O99tNo5Ej+oLhHwM9ja7F0nd8ZqF70fRkTGMHY8ZnatpOtvW3FyVuofny3a4yOSkKIbI9EJn5umjoOT6UfpuadcS7QHm90EarJ1UJ5IcNZteYzAW8UNc44EJYrVAOS7mkWLz1AyC1MuxHfaxHABB/ntppw8NCLSbHDD8y4y/NoqmeSJFMA053GTRBYJHnwL5rdbQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(53546011)(6506007)(122000001)(6512007)(8936002)(66476007)(8676002)(36756003)(109986005)(6486002)(76116006)(4326008)(83380400001)(478600001)(66946007)(66556008)(86362001)(186003)(66446008)(64756008)(5660300002)(316002)(2616005)(38070700005)(71200400001)(41300700001)(33656002)(2906002)(54906003)(38100700002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDR1NDNlZEhVL1dQU1M3b0EzM0xnOXJqZFdrU1d6MlZFTThBT1FzUUMyVU9p?=
 =?utf-8?B?SHlnd2JHSGYyTi9vUlAwMFZVdVk1U0dQcnQyK2JhdTM3WDRyZElFK2U3bnE2?=
 =?utf-8?B?c09LejNyN2pIM2R0UkVCUEEyMmZGa2lnYnh0c3htRlltNGIxSyt5NEVqbm1M?=
 =?utf-8?B?ZnBBcHJqakFjbDZoZW9zZ3B0MGRzeVI2SjFqUG5DdnllWHNmY1hzUU1rRFFH?=
 =?utf-8?B?YU9hbkF4OXdFOWxoRS82bTdaWWNmU3BiSEJXV1FWMitLN0F6Z0NiZkIwbFc0?=
 =?utf-8?B?ZUN3SkNOa0VjZFFuTHJoVC9WWEdSK0RPZjh6WjNKeWQ2K21aQ2RxMC80aFV4?=
 =?utf-8?B?Ui94UmE2akROeEFvd3QvR284ZXFaNzlWZXRQeVN0QVYxNkhITGk1NWRoaW5W?=
 =?utf-8?B?cTRHYWpWKzdMelgreE1UVEs3V251MW5PTlpkU0xMcDdWN0RqSG13ZFJnUTZ6?=
 =?utf-8?B?a2ZadlpHTituR1lXZFZVSVpzendsd25ncFo2a0I0UzNldDFKWGttRXZZK2J5?=
 =?utf-8?B?alByeEI3bXdmaWlHcThkU29oM2tNNjRPbkpDTXZMVDdNWElUOUhiUkZyWG4y?=
 =?utf-8?B?VWxiUXVsS1AyNkpnclpUNm84eXJVMzZhenc2SGNYY2U2S2FqTFNkbk14S1I5?=
 =?utf-8?B?dDRzQTVjdFdjSHRyUklPanhkNGlQdWZLQzBsWGR0VEx2V3JZNkdTbHgxMjZr?=
 =?utf-8?B?NDVKbWlPajhkS3RBblJWeThVcEdBM0VwYjBOYlltWG53VmZTR0d6NTY0T2NC?=
 =?utf-8?B?UytoTVZ4cEpkcTE5TnN5MTJrWnltZ1FVdGtzNGI3UE5UOUtJU3h3dytKK0Ri?=
 =?utf-8?B?WXEzVDhXQ1hKSmgzbTk2ZVQ1bGRaOXVHR0MwVjA0OVlBQmxDdVdBS3RhdXFD?=
 =?utf-8?B?ZnNRNGJTUkhwb1BvSjY5bEhtcXJuMWxTMlNEb3hEUVlTeS9HWW5QdGpRcitn?=
 =?utf-8?B?M1F2dmFVL2lLVkhwdERmUU9GZHEzcWw5eXljM3d3OGlCZkViYk82Q0dQYXky?=
 =?utf-8?B?cXRVdk00cW5kbEFWSDdjU25RNEZjckc5TmI1NE1IUmpUZHVIUFpKMmczWTdk?=
 =?utf-8?B?UjdjUURDaG9tUEJacTRXTVBRWU85Q3d5OUNvUElkcnV1MXRBSG1CdnpSWGpq?=
 =?utf-8?B?bGQzZ2pkRVQrWkhLcWk4ZXpab25ScWFxem5MVFBiV0h0a1RBN2ZqazBDT0Ry?=
 =?utf-8?B?Mzh3THNXem5FcDJUT2lsY0Q0TnVZaXNsVWNGKzVqM1c3d04zdk5oTFMweGk5?=
 =?utf-8?B?RWw4bXNUNGRXYWoxS3dsVjJIUkpNOWUwaDliQldHRnlNWHh2ZXdFSGJXcjFU?=
 =?utf-8?B?dG9BMG5obkV0QXFYanhyYS9LVG1aaGRKWUs4V0szR09NdkYxUGJKcDRtWUUz?=
 =?utf-8?B?ZzJyMVh6RVV2RHJFbFpjeE12NFk3T3hQTXplQjlVdkpaZEVHSE16a0E2c2pu?=
 =?utf-8?B?anprbGpSS25TZGZKaFZBV3hQbmRxTVFMeU51dC9wNHlXVTNTNnN0VDZEQWUx?=
 =?utf-8?B?a3AwYTlKc1d5LzQ1NXNFT2NTamI3NWhNelBkR1NKemo3Ui9tVTB2QkdFV3BD?=
 =?utf-8?B?SDdFenUzL0ZuNGRndVpCTjRteEtTQytvd0I0YVhVU1lBdlJZUm9pKzdCbDNl?=
 =?utf-8?B?UkV6N291MCtkT0crWUxpOTgvWC9BdmdUZVQrbTAwbzV0U0dZZE1VWkRYdHg2?=
 =?utf-8?B?NEd6akM1QUVOQkJVNmZTVTFrV3FBb3p6TmZscGpLUlN1amdtUDVjNUpPQS9w?=
 =?utf-8?B?T2FaU2Rta0NneVphYlVreFVVYnB0UjNTSHBIUGVERUJNYVdoYUVVdlhCMWF5?=
 =?utf-8?B?bFVWdDBDK0NIQmFsUFFQeFB2WTRXVnBxMUNyTzk2N3kwR3oxZzNiR1lmM2Uw?=
 =?utf-8?B?OGlKLzAvYTBUclFBUG01M3Z0NHZtYSt4eVdFa3ZSSDNMY05PYmlvS3ZGQjJo?=
 =?utf-8?B?UXNlc2RBRTFNQU1lT3YvYVRXMVlPN2NlellHT2JncjZZVG1ocVZ4bmZIUE5j?=
 =?utf-8?B?eG9kbGRVRGNsbXR5alZ3WU43c2padGRiY3ZlbGg2SExWZFhCY3dLR2loQXVw?=
 =?utf-8?B?LytnVVBhclhFdTJ1QXF3VGlDRGNRVGNiR2NLb1QzaWs5aE02NmEvZVZ2YlBQ?=
 =?utf-8?B?WS9tTkR3YWVFc01lcW5BQlVmYmVSbjdjOHJYdjFpK08vQ1pSODRZTk1rUHpN?=
 =?utf-8?B?TEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B6646C79A102244813723F0AEAC2B7D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ad1185-8a26-4bed-7b7d-08da58d62e7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 07:16:55.2098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QXqsV60BsK/z2ABFX6H6sL0WhSvBPnI4HJ4xlNL+GMllABOncuF5byAQ6LCPQlCl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR15MB2273
X-Proofpoint-ORIG-GUID: e5tiETnYm8a4WiFCMqpBi2uO2CwdEKZY
X-Proofpoint-GUID: e5tiETnYm8a4WiFCMqpBi2uO2CwdEKZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_09,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=7178e17cfc=pdel@fb.com; helo=mx0a-00082601.pphosted.com
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

DQoNCj4gT24gSnVuIDI4LCAyMDIyLCBhdCAxMjowNSBBTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiA2LzI3LzIyIDIxOjU0LCBQZXRlciBEZWxldm9y
eWFzIHdyb3RlOg0KPj4gSGV5IGV2ZXJ5b25lLA0KPj4gSSdtIHNlbmRpbmcgYSBiaWcgcGF0Y2gg
c2VyaWVzIGZvciB0aGlzLCBidXQgb25seSB0aGUgbGFzdCBjb21taXQgaXMgcmVhbGx5DQo+PiBp
bnRlbmRlZCB0byBiZSBhY2NlcHRlZCByaWdodCBub3cuIEknbSBqdXN0IGluY2x1ZGluZyB0aGUg
cmVzdCBvZiB0aGVtDQo+PiBiZWNhdXNlIGl0IGRlcGVuZHMgb24gdGhlbSBmb3IgdGVzdGluZy4N
Cj4+IEtsYXVzJ3MgY2hhbmdlcyBpbmNsdWRlIHRoZSBtdWx0aS1tYXN0ZXIgc3R1ZmYgaW4gaHcv
aTJjL2NvcmUuYywgYW5kIHRoZSBvbGQNCj4+IHJlZ2lzdGVyIG1vZGUgc2xhdmUgbW9kZSBzdXBw
b3J0Lg0KPj4gTXkgc2VyaWVzIG9mIHBhdGNoZXMgaW5jbHVkZXMgYSBidW5jaCBvZiBjaGFuZ2Vz
IHRvIGVsaW1pbmF0ZSBtb3N0IChpZiBub3QNCj4+IGFsbCkgb2YgdGhlIEkyQyBlcnJvcnMgcmVw
b3J0ZWQgYnkgdGhlIGZiIE9wZW5CSUMgZmlybXdhcmUgZm9yIGZieTM1DQo+PiBDcmF0ZXJMYWtl
IEJyaWRnZSBJbnRlcmNvbm5lY3QgKEJJQykgKHNob3J0bmFtZTogb2J5MzUtY2wpIHVwb24gc3Rh
cnR1cC4NCj4+IEluIHBhcnRpY3VsYXIsIEkgbmVlZGVkIHRvIGFkZCB0aGUgSUNfREVWSUNFX0lE
IHRvIHRoZSBpc2wgdm9sdGFnZSByZWd1bGF0b3INCj4+IGltcGxlbWVudGF0aW9uLCB3aGljaCBy
ZXF1aXJlZCBhIGZpeCB0byB0aGUgcG1idXMgaW1wbGVtZW50YXRpb24gd2hlbg0KPj4gc3dpdGNo
aW5nIHBhZ2VzLiBXZSB3ZXJlbid0IHJlc2V0dGluZyB0aGUgYnVmZmVyIHN0YXRlIHdoZW4gc3dp
dGNoaW5nDQo+PiBwYWdlcyB0aGVyZS4NCj4+IEkgYWxzbyBhZGRlZCBhIHBsYWNlaG9sZGVyIGlt
cGxlbWVudGF0aW9uIG9mIHRoZSBQRUNJIGNvbnRyb2xsZXIsIHRoYXQgZG9lcw0KPj4gYWxtb3N0
IG5vdGhpbmcsIGJ1dCBkb2Vzbid0IHByb2R1Y2UgZXJyb3JzLg0KPj4gSSBhZGRlZCB0aGUgZmJ5
MzUtY3BsZCwgd2hpY2ggb2J5MzUtY2wgcXVlcmllcyB1c2luZyBtYXN0ZXItbW9kZSBUWCBhbmQg
UlgNCj4+IGNvbW1hbmRzLg0KPj4gQW5kIGZpbmFsbHksIEkgYWRkZWQgYW4gImludGVsLW1lIiBk
ZXZpY2UgKEludGVsIE1hbmFnZW1lbnQgRW5naW5lKSB0aGF0DQo+PiBhdHRlbXB0cyB0byByZXNw
b25kIHRvIHRoZSBmaXJzdCBJUE1CIG1lc3NhZ2Ugc2VudCBieSB0aGUgQklDLiBJIHVzZWQgdGhp
cw0KPj4gdG8gdGVzdCB0aGUgZmluYWwgcGF0Y2gsIHdoaWNoIEkgYWN0dWFsbHkgd2FudCB0byBt
ZXJnZSwgdGhlIEkyQyBuZXcNCj4+IHJlZ2lzdGVyIERNQSBzbGF2ZSBtb2RlIHN1cHBvcnQuDQo+
PiBBbGwgdGhlIHBhdGNoZXMgZXhjZXB0IHRoZSBsYXN0IG9uZSBjYW4gYmUgaWdub3JlZCBmb3Ig
bm93IGlmIHlvdSB3YW50LA0KPj4gYWdhaW4sIEkganVzdCBpbmNsdWRlZCB0aGVtIGZvciB0ZXN0
aW5nIHB1cnBvc2VzLg0KPj4gVGhlIGZpbmFsIHBhdGNoIGlzIHByZXR0eSByb3VnaCwgYnV0IEkg
d2FudGVkIHRvIHN0YXJ0IHRoZSByZXZpZXcgaW5zdGVhZCBvZg0KPj4gd2FpdGluZyB0b28gbG9u
Zy4gSSBleHBlY3QgdGhlIGludGVycnVwdCBoYW5kbGluZyBwYXJ0IHdpbGwgYmUNCj4+IHRoZSBt
YWluIGJsb2NrZXIuDQo+PiBUaGFua3MsDQo+PiBQZXRlcg0KPj4gS2xhdXMgSmVuc2VuICgzKToN
Cj4+ICAgaHcvaTJjOiBzdXBwb3J0IG11bHRpcGxlIG1hc3RlcnMNCj4+ICAgaHcvaTJjOiBhZGQg
YXN5bmNocm9ub3VzIHNlbmQNCj4+ICAgaHcvaTJjL2FzcGVlZDogYWRkIHNsYXZlIGRldmljZSBp
biBvbGQgcmVnaXN0ZXIgbW9kZQ0KPj4gUGV0ZXIgRGVsZXZvcnlhcyAoMTEpOg0KPj4gICBhc3Bl
ZWQ6IGkyYzogRml4IERNQSBsZW4gd3JpdGUtZW5hYmxlIGJpdCBoYW5kbGluZw0KPj4gICBhc3Bl
ZWQ6IGkyYzogRml4IFJfSTJDRF9GVU5fQ1RSTCByZWZlcmVuY2UNCj4+ICAgYXNwZWVkOiBpMmM6
IEZpeCBNQVNURVJfRU4gbWlzc2luZyBlcnJvciBtZXNzYWdlDQo+IA0KPiANCj4gSSAgZGlkbid0
IHJlY2VpdmUgdGhpcyBwYXRjaCA/DQoNClllcywgc29ycnkgYWJvdXQgdGhhdCwgdGhlIEZCIGVt
YWlsIGZpbHRlciBpcyB2ZXJ5IGRlbGljYXRlLA0KdGhlIGJlaGF2aW9yIGlzIHNlZW1pbmdseSBy
YW5kb20gdG8gbWUuIEnigJl2ZSBiZWVuIHRyeWluZyB0bw0KZGVidWcgaXQuIEkgcmUtc2VudCAx
Mi0xNCBtYW51YWxseSwgYnV0IHJlc2VuZGluZyBwYXRjaCA2DQpkaWRu4oCZdCB3b3JrIGZvciBz
b21lIHJlYXNvbi4gSeKAmXZlIGJlZW4gYXR0ZW1wdGluZyB0bw0Kc3dpdGNoIHRvIGEgcGVyc29u
YWwgZW1haWwsIG1lQHBqZC5kZXYsIGJ1dCBJIGNhbuKAmXQgc2VlbQ0KdG8gZ2V0IGdpdC1zZW5k
LWVtYWlsIHdvcmtpbmcgd2l0aCBpdC4gSXTigJlzIHJlYWxseSByaWRpY3Vsb3VzLg0KUHJvYmFi
bHkgaGF2ZSB0byBzdGFydCBicmluZ2luZyBhIHBlcnNvbmFsIGxhcHRvcCB0byB0aGUgb2ZmaWNl
Lg0KDQpJ4oCZdmUgYXR0ZW1wdGVkIHRvIHJlc2VuZCB0aGlzIHBhdGNoLCBudW1iZXIgNiwgb25l
IG1vcmUgdGltZSwNCmp1c3Qgbm93LiBJ4oCZbGwgaW5jbHVkZSBpdCBhZ2FpbiBpbiB2MiwgYW5k
IGhvcGVmdWxseQ0KSeKAmWxsIGhhdmUgbXkgZW1haWwgd29ya2luZyBhdCB0aGF0IHBvaW50Lg0K
DQo+IA0KPiBDLg0KPiANCj4gDQo+PiAgIGFzcGVlZDogQWRkIFBFQ0kgY29udHJvbGxlcg0KPj4g
ICBody9taXNjOiBBZGQgZmJ5MzUtY3BsZA0KPj4gICBwbWJ1czogUmVzZXQgb3V0IGJ1ZiBhZnRl
ciBzd2l0Y2hpbmcgcGFnZXMNCj4+ICAgcG1idXM6IEFkZCByZWFkLW9ubHkgSUNfREVWSUNFX0lE
IHN1cHBvcnQNCj4+ICAgYXNwZWVkOiBBZGQgb2J5MzUtY2wgbWFjaGluZQ0KPj4gICBody9taXNj
OiBBZGQgaW50ZWwtbWUNCj4+ICAgYXNwZWVkOiBBZGQgaW50ZWwtbWUgb24gaTJjNiBpbnN0ZWFk
IG9mIEJNQw0KPj4gICBhc3BlZWQ6IEFkZCBJMkMgbmV3IHJlZ2lzdGVyIERNQSBzbGF2ZSBtb2Rl
IHN1cHBvcnQNCj4+ICBody9hcm0vYXNwZWVkLmMgICAgICAgICAgICAgICAgICB8ICA0MiArKysr
KysNCj4+ICBody9hcm0vYXNwZWVkX2FzdDEweDAuYyAgICAgICAgICB8ICAxMSArKw0KPj4gIGh3
L2FybS9weGEyeHguYyAgICAgICAgICAgICAgICAgIHwgICAyICsNCj4+ICBody9kaXNwbGF5L3Np
aTkwMjIuYyAgICAgICAgICAgICB8ICAgMiArDQo+PiAgaHcvZGlzcGxheS9zc2QwMzAzLmMgICAg
ICAgICAgICAgfCAgIDIgKw0KPj4gIGh3L2kyYy9hc3BlZWRfaTJjLmMgICAgICAgICAgICAgIHwg
MjM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCj4+ICBody9pMmMvY29yZS5jICAg
ICAgICAgICAgICAgICAgICB8ICA3MCArKysrKysrKy0NCj4+ICBody9pMmMvcG1idXNfZGV2aWNl
LmMgICAgICAgICAgICB8ICAgNiArDQo+PiAgaHcvaTJjL3NtYnVzX3NsYXZlLmMgICAgICAgICAg
ICAgfCAgIDQgKw0KPj4gIGh3L2kyYy90cmFjZS1ldmVudHMgICAgICAgICAgICAgIHwgICAyICsN
Cj4+ICBody9taXNjL2FzcGVlZF9wZWNpLmMgICAgICAgICAgICB8IDIyNSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPj4gIGh3L21pc2MvZmJ5MzVfY3BsZC5jICAgICAgICAgICAgIHwg
MTM3ICsrKysrKysrKysrKysrKysrKw0KPj4gIGh3L21pc2MvaW50ZWxfbWUuYyAgICAgICAgICAg
ICAgIHwgMTc2ICsrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgaHcvbWlzYy9tZXNvbi5idWls
ZCAgICAgICAgICAgICAgfCAgIDUgKy0NCj4+ICBody9udnJhbS9lZXByb21fYXQyNGMuYyAgICAg
ICAgICB8ICAgMiArDQo+PiAgaHcvc2Vuc29yL2lzbF9wbWJ1c192ci5jICAgICAgICAgfCAgMzAg
KysrKw0KPj4gIGh3L3NlbnNvci9sc20zMDNkbGhjX21hZy5jICAgICAgIHwgICAyICsNCj4+ICBp
bmNsdWRlL2h3L2FybS9hc3BlZWRfc29jLmggICAgICB8ICAgMyArDQo+PiAgaW5jbHVkZS9ody9p
MmMvYXNwZWVkX2kyYy5oICAgICAgfCAgMTEgKysNCj4+ICBpbmNsdWRlL2h3L2kyYy9pMmMuaCAg
ICAgICAgICAgICB8ICAzMCArKysrDQo+PiAgaW5jbHVkZS9ody9pMmMvcG1idXNfZGV2aWNlLmgg
ICAgfCAgIDEgKw0KPj4gIGluY2x1ZGUvaHcvbWlzYy9hc3BlZWRfcGVjaS5oICAgIHwgIDM0ICsr
KysrDQo+PiAgaW5jbHVkZS9ody9zZW5zb3IvaXNsX3BtYnVzX3ZyLmggfCAgIDEgKw0KPj4gIDIz
IGZpbGVzIGNoYW5nZWQsIDEwMDIgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pDQo+PiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGh3L21pc2MvYXNwZWVkX3BlY2kuYw0KPj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBody9taXNjL2ZieTM1X2NwbGQuYw0KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBody9t
aXNjL2ludGVsX21lLmMNCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody9taXNjL2Fz
cGVlZF9wZWNpLmgNCj4gDQoNCg==

