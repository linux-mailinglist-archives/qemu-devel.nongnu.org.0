Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4F36511A8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 19:17:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Ke8-0004sd-Cs; Mon, 19 Dec 2022 13:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=3352ecff70=pdel@meta.com>)
 id 1p7IV3-0004Ij-5w
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:56:23 -0500
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=3352ecff70=pdel@meta.com>)
 id 1p7IV1-0001St-9M
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:56:20 -0500
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJDwdC2025685; Mon, 19 Dec 2022 07:56:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-id :
 content-type : content-transfer-encoding : mime-version; s=s2048-2021-q4;
 bh=rJnOz+9inCqn3o4l0JGY+vdtHg0k6ujTBviv5Rk0xwg=;
 b=NQxytMwnXnHyxMU7FnA3iTBXMuE6CwBLZS3lhQWZo56IreP8BSexo5wMhUyWaGWxbiA2
 5uHrfwd8961k+2ge30V8Cbg1gqDntzWi9Yg85Ip35PvO1/vtVOGb3Mmlj3JgfwsAl0rq
 EyLtGFbrnPd319EbagSTdLyiMbEaBIRFatFvoDPjDG+zs3dJA4b1kKXsHeBSBx+Wj6Di
 Vh8ncWbnh+nmPXsTLkMNfiQ5BhzyWPuLFPgpWEbHNrDX204+W73BtxWz3Mby8eUtwR5B
 v7O94l3oS9x8M13SKSEcSF4N2xfBTK8ZSn1H7wnVXdy4jjYKTqvJC5d77RRdJ2aHrW4x WQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3mhapqyjcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 07:56:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdxwwbpQ5h7bAMXSLd0Zj7gcmwbixLWFetFR9E8MrE3Y989kIsBuNG+BODwrM1+aCSgPN63Ck9HZYn+W6GjevsM5eIQZfzmKirWRWzYGEZGmHOj4cX8a+SYrvcnB/bTogeR9iO9i7A76DyDQP+a8yT7oHZMJ0vMwMd+P3zerIXs+gev67PzhDtigSbYBHGZLct5ueu5UI2UJo7t4pfU3vgKnKlsyP7iekZEZMVNexZHALYnAYBwfa4mUwnGEivUF54JreveCmC1R2+RzVoXXK8zbNxMjOVPTTMXhfkFlcRVnk69uRexYjVaodtRHE5juIgchWYVZAkaDw6PgdZEnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJnOz+9inCqn3o4l0JGY+vdtHg0k6ujTBviv5Rk0xwg=;
 b=NmaR9oMPXlw1s4FbWwzuiNfHj/ZE/1RiaGm7mJQeZNOMunhs5ufHazTNgSCER+ZKwpNzyAeBxlm93T/PWlGEUibqpk/svCo06ECS9D72qEw0c1yG8J6pwukZ5QpuSzUc8GAGHLJyaskqV6nNFAxf9RDuzBzDzx1xBJl+J/1gvATe/dUfOrsQ5z8Dq/DoraAbBH8Sxwkv+ryaqEm6nwovyyuLRLKEyJ1Rav6LEwHOOpm/CcgwuPJxnt2NLWF7cKSSkOWQwSG4saAgsfsw4xEP48nYqitqo5DQtqjyUTZZH/t0ho4rNbpagN+dvRKsgKF4/9tYiUIxczlV4o0TwmaJGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by MN2PR15MB3598.namprd15.prod.outlook.com (2603:10b6:208:181::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 15:56:11 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::4084:2548:f657:d950]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::4084:2548:f657:d950%3]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 15:56:11 +0000
From: Peter Delevoryas <pdel@meta.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
CC: Peter Delevoryas <pdel@meta.com>, =?utf-8?B?QWxleCBCZW5uw6ll?=
 <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>, Iris Chen
 <irischenlj@fb.com>, Daniel Mueller <muellerd@meta.com>
Subject: Re: [PATCH 08/11] contrib/gitdm: Add Facebook the domain map
Thread-Topic: [PATCH 08/11] contrib/gitdm: Add Facebook the domain map
Thread-Index: AQHZE6QhLDDngQII9kW5GzQZ/01CO651VC4AgAAHZQCAAAHrAA==
Date: Mon, 19 Dec 2022 15:56:11 +0000
Message-ID: <83112C4B-A6EE-4903-BF83-BF61E8DDF926@meta.com>
References: <20221219121914.851488-9-alex.bennee@linaro.org>
 <052012F1-2E78-40FC-990B-6AA3C95FDB37@pjd.dev>
 <4d316fbd-963b-6fd6-fb70-708719cdcacb@linaro.org>
In-Reply-To: <4d316fbd-963b-6fd6-fb70-708719cdcacb@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR15MB3032:EE_|MN2PR15MB3598:EE_
x-ms-office365-filtering-correlation-id: e3ddf650-5005-4ca5-eb34-08dae1d98cb2
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QudgvZpHMmQivV72tKj3yKq5tWPr21uIGbXkgBU8SDC8IAuCPaH173C3OWwlzy3VQl1akKVbPWOlh9XOF6i/Anayibrk2ifSh9xeYvupPv/ZUprriEZfEdzUthxQ3+gKHe/e2Hh9Q2bzC0ifkteUrpGhlW0kUSoRicSnTQ3ctFKArdUqcs39D8ub22iaabxcE63lPkXmBIM/W8dpr/egw3co40fSSuIPdSGiURZnnNPfAcw6g75liLZKJc7a28kIc06tOAT3eEogqbbC52zNOSVZ8mnMwPAZziBY/8t+9SRQm6lVZMyvjzHK/RIwk/bKwxo5leb8FeKvFvVu8QWSoGmCEY9Cbd+r/64DAKVDDhBd6pn19/ywMTihspJ+UPFa1KJM1PX7DsObAPLQH96EPM6WC1uw9QkLg2ItWR5+lukcwyPIW6xyBNOVObFW2Fu+ffFBA1JDPjWRvONgw2h3s4/wQlqa61j1DPhusQDG9REZX+eHhD628fdww2s3MXKIVjG2ey6069GC439oI25x2Eaa6LuJeSqKPcSJyiaal5kKWjX1FLH9fY82c3GbFLHjQe+pwLm2l0rUsCkC4sAcaqq4rhPip2ktXEUaxj3SmRZVndxOHWL7Va6sWrhkULmmR3ykUJR/UTkvd1vypU1ytFK+ac1axfohusx96JGhuMf+177oEjbaL1meeitNp42eHlJGoRB+pRU1XN9vEsNWvJgDGvq985+PpUuQ1Qg7XMA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(47680400002)(451199015)(8676002)(4326008)(5660300002)(54906003)(6916009)(76116006)(66556008)(66946007)(66446008)(2906002)(66476007)(64756008)(71200400001)(6486002)(478600001)(6506007)(6512007)(186003)(107886003)(41300700001)(53546011)(66574015)(86362001)(83380400001)(2616005)(36756003)(38070700005)(8936002)(38100700002)(316002)(33656002)(122000001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjZoeWNMS2NHandiNFB3ZTFEOHpVSGZpZXJ2aDlQSTFRQ0tOZC9hMnowQmN5?=
 =?utf-8?B?SmJQRHJLUXBsSTFuWE1aSjVSdlZ5eFJ4RVU5VWJ6OTlDbERjUHVnMDQyL0Vy?=
 =?utf-8?B?cC9hdzh2UnJiOFowNC9TMUlPMGdGOGdoRnIvRWFVOXN6SUZRS3VmTG9RYTly?=
 =?utf-8?B?N3NDeG1ZbFBuRFZaVE9zbWR3NGZqVkRkaFc0WWY5d0d2UjM5a1JieEE4V2lx?=
 =?utf-8?B?MHBqRjFWZjRnV1dOd1NqOHpKdS90VEpEL3Q2eFlSODBJYW91RW1OTWtLZ1Vo?=
 =?utf-8?B?TEJNeXpvYmZaTzhjcThJVkEzZ200aGVHYlJ1aGtsVEEvR0FBSEg1ZnpiMThx?=
 =?utf-8?B?UDZIRTV6ZXh6QkVXR2hMU1ZZUFJraVVBWTBsWG4zU1BWc1hGbUh2a3ZUL2tj?=
 =?utf-8?B?bjZXNUZGMThPdzlMNmF6UTF3ekpGZ2crM0J3NHNlN1dHQXdEY3NLVHVMa1ov?=
 =?utf-8?B?dzF1QUpuZFg3Z2VZczZJT1NFS0lLSGw4Yys2OE45bVVtQksrd3N3WXVmRnhB?=
 =?utf-8?B?TytHR0ZCeTQvQ2FPSzk4SXpQZXAwV2l4UlJKMW9PcURDYmY0aU44VUFBcWxm?=
 =?utf-8?B?VG8vMTlUK1JvUHZSRUtwWHBkWUNTbXlhbGYrbHJvd1VEdGxtV3dJQ1NNSHcz?=
 =?utf-8?B?cW1WRFF2NVM0Z3VrTWJ3VUhBQ0xEeGhOcDM4VjRoajZWNTFZaHc4QTNDMCsz?=
 =?utf-8?B?S0FFenB3d2xTcDdrOVV4NVFyamJySWFSUnp0TWtackxNRkVWTFFpVzZEMkNV?=
 =?utf-8?B?Y0dZVEJOWko1TjZ4d1F1ZUhFNFpRbmZDYkJaVSt6Vm9VbFp2aHhlSW9VUEhG?=
 =?utf-8?B?cmVWUUE2TXVoNTA3RXF2Z0NOdzB3RFJPRnZmZitKU3htWWNCU3E5Y1hNZ09v?=
 =?utf-8?B?Y0puYUptT3FFRlQyNTB2VUl6bDZacyswczdWM2YrRTh3d2dkS1RESDV6bjNJ?=
 =?utf-8?B?bXBxaVgrZlkrdXBFVzcwV25MUVZid0VyUG42STJ5S1k4RGtjSjIyL01URHYv?=
 =?utf-8?B?K0grbUNVMG96enlBZW9BWGVscngwTDhzZ1BEZlRiZGM5REhOTFJ5SHg2NjZJ?=
 =?utf-8?B?L1ZLVysrdjVwNHU5VER3MVpzU0h1U2ViWGdXT1U4ZlRCZFoyYzVwa1daNWg3?=
 =?utf-8?B?S3RNK1RJL21JbEVqVTBMZjEyOThYWERHSzdzL0d2SXlObG9QOHAzZkgzMFNE?=
 =?utf-8?B?b1RiRXJUd1BvaTVVdjZLUHV3OVNUdlQ0azdTMk5WRGVMa3lORVQ4WGw5M1RU?=
 =?utf-8?B?OTd4emlYSUpzWXNtcFkzOHlLTnJzdzhkZ1VlbktDSDRVN0t4ZW5zY3ZiYXhF?=
 =?utf-8?B?MkYxcVIzZ1VuR2s4MVh2WGhlZXZtdHl5M0RScHFJMitSSm52eTM5OG5PMHo4?=
 =?utf-8?B?Nnl4ZXo5N3BnUE9kY1ZkNHQvMXkzNEN6N3FRMFNpVWlqcEtyYjE0MkEzamN2?=
 =?utf-8?B?MzV1b09JWGIrVXNiTVVyd2xzZDBjOWdvaUExb0NLZmpMN3U1ZHFNaTBKRGI4?=
 =?utf-8?B?enlvVzlpV2hDOTBJVVZydnVvSW9kUm04U3I1a0dSd3pCSVlSbjJIOTlUbGk2?=
 =?utf-8?B?Nk9BelFVUmtjSXgxd2VQQTBXNjZJdnB3SGlwSmw1VGhETEpZWm1SVEgvQzd5?=
 =?utf-8?B?OEdCc25ucFVMZHBibTdkcTJudHB3U1l6cEp0U3luY09kUzYzemVRQ3loVnFy?=
 =?utf-8?B?R01aakNVdDJaYW5KQkJEZWkyd0NDbTRQT1NEc3VIaTEyU3FZS2lEb1hqcUR2?=
 =?utf-8?B?NGkwUzZjamJnRnBnT3JKNWpsN3kyMktxTnFuUVh5SElJcE94K2Z4QkdPZ1RB?=
 =?utf-8?B?MHYvWndPUzhVOFlGaEMvQ2hMMDkxNTJ4cU11YTVML3hyQzdGc1RmeWVEdGZi?=
 =?utf-8?B?bDkvVUNHbzd3OXB5cWduQkd6Vk44M2FpVWFmQWNGVC9TL1JRSXJuT0VFeXcr?=
 =?utf-8?B?eDFGeVNWS2RneWt6UDdNL1Y0RjJuL2M0RTNUVlVIZnZPTnZyaE8xVVJyaE9G?=
 =?utf-8?B?d20rMy9MQVpkc2piWnpPS3BHb1RsTzU5N1hYb3F6eGJ5dDBDL2d1RzdJOTkz?=
 =?utf-8?B?QTJVK3BwYTQ0V3BGdFc1dlM1ZnliOWI5R1pJbFJOY0ltQlBRNTBJRnNTYUU0?=
 =?utf-8?B?RURQNTJGSjk2cGxLZlFYMnA1NGh2cWM1cm5FOS9pVXdTUHNFTHBEREM3THFE?=
 =?utf-8?B?emc9PQ==?=
Content-ID: <B0AAE832D65C024F8039B9DF014A1DDF@namprd15.prod.outlook.com>
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ddf650-5005-4ca5-eb34-08dae1d98cb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 15:56:11.0878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sR2ymTB9mqHVeAbDUNBDFqnsJPjxQDL4z3UKQHLNyEj3hh5qNyDXYIjM0MrrF5Jj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3598
X-Proofpoint-GUID: pegbXMNTA68CbzRZMHuYYFWUu4ZYWo5w
X-Proofpoint-ORIG-GUID: pegbXMNTA68CbzRZMHuYYFWUu4ZYWo5w
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=3352ecff70=pdel@meta.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Dec 2022 13:13:41 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gT24gRGVjIDE5LCAyMDIyLCBhdCA3OjQ5IEFNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gIS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18DQo+IFRoaXMg
TWVzc2FnZSBJcyBGcm9tIGFuIEV4dGVybmFsIFNlbmRlcg0KPiANCj4gfC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0hDQo+
IA0KPiBPbiAxOS8xMi8yMiAxNjoyMiwgUGV0ZXIgRGVsZXZvcnlhcyB3cm90ZToNCj4+PiBPbiBE
ZWMgMTksIDIwMjIsIGF0IDQ6MTkgQU0sIEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJv
Lm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4g77u/IS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18DQo+Pj4gIFRoaXMgTWVzc2Fn
ZSBJcyBGcm9tIGFuIEV4dGVybmFsIFNlbmRlcg0KPj4+IA0KPj4+IHwtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIQ0KPj4+
IA0KPj4+IEEgbnVtYmVyIG9mIEZhY2Vib29rIGRldmVsb3BlcnMgY29udHJpYnV0ZSB0byB0aGUg
cHJvamVjdC4gUGV0ZXIgY2FuDQo+Pj4geW91IGNvbmZpcm0geW91ciB3YW50IHBqZC5kZXYgY29u
dHJpYnV0aW9ucyBjb3VudGVkIGhlcmUgb3IgYXMNCj4+PiBhbiBpbmRpdmlkdWFsIGNvbnRyaWJ1
dG9yPw0KPj4gT2gsIGhleTogeWVzIEkgY2FuIGNvbmZpcm0gdGhhdCwgSSB3YW50IHBqZC5kZXYg
Y29udHJpYnV0aW9ucyBjb3VudGVkIGhlcmUgYXMgZmIgc3R1ZmYuDQo+PiBCeSB0aGUgd2F5OiBy
ZWNlbnRseSwgZXZlcnkgRmFjZWJvb2sgZGV2ZWxvcGVycyBlbWFpbCBoYXMgbWlncmF0ZWQgdG8g
4oCcdXNlcm5hbWVAbWV0YS5jb23igJ0uIFNvIG5vdyBhbGwgbXkgZmIuY29tIGVtYWlsIGdvZXMg
dG8gbXkgbWV0YS5jb20gaW5ib3guIFdlIG1heSBvciBtYXkgbm90IHdhbnQgdG8gaW5jbHVkZSBi
b3RoIGVtYWlscy4gSSB0aGluayB0aGUgZmIuY29tIGVtYWlscyB3aWxsIHN0YXkgYXJvdW5kIGZv
ciBxdWl0ZSBhIHdoaWxlLCBidXQgeWVhaC4NCj4gDQo+IGdpdGRtIHRvb2wgaXMgb25seSB1c2Ug
dG8gZGlzcGxheSBzdGF0aXN0aWNzIGZyb20geW91ciBwYXN0DQo+IGNvbnRyaWJ1dGlvbnMuIElm
IHlvdSB3YW50IHRoZSBnZXRfbWFpbnRhaW5lcnMucGwgc2NyaXB0IHRvDQo+IHVzZSB5b3VyIHVw
ZGF0ZWQgZW1haWwgYWRkcmVzcywgeW91IHByb2JhYmx5IHdhbnQgdG8gc2VuZCBhDQo+IHBhdGNo
IHRvIHVwZGF0ZSB0aGUgLm1haWxtYXAgZmlsZS4NCg0KT2s6IGF0IHRoaXMgcG9pbnQsIEkganVz
dCB1c2UgcGV0ZXJAcGpkLmRldiA8bWFpbHRvOnBldGVyQHBqZC5kZXY+IGJlY2F1c2UgdGhlIGVt
YWlsIGZpbHRlcnMgYXQgRmFjZWJvb2sgYXJlIHNvIG9uZXJvdXMgYW5kIGRyb3AgdGhpbmdzIG15
c3RlcmlvdXNseSBhbGwgdGhlIHRpbWUsIHNvIEnigJlsbCBwcm9iYWJseSBqdXN0IGtlZXAgdXNp
bmcgdGhhdCBJIGd1ZXNzLiBCdXQgbWF5YmUgSeKAmWxsIHRyeSBzdWJtaXR0aW5nIGEgc2luZ2xl
IHBhdGNoIGFzIHBkZWxAbWV0YS5jb20gPG1haWx0bzpwZGVsQG1ldGEuY29tPiBzb21ldGltZS4N
Cg0KVGhhbmtzIQ0KUGV0ZXINCg0KPiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUg
PGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+Pj4gQ2M6IElyaXMgQ2hlbiA8aXJpc2NoZW5sakBm
Yi5jb20+DQo+Pj4gQ2M6IFBldGVyIERlbGV2b3J5YXMgPHBkZWxAZmIuY29tPg0KPj4+IENjOiBQ
ZXRlciBEZWxldm9yeWFzIDxwZXRlckBwamQuZGV2Pg0KPj4+IENjOiBEYW5pZWwgTcO8bGxlciA8
bXVlbGxlcmRAZmIuY29tPg0KPj4+IC0tLQ0KPj4+IGNvbnRyaWIvZ2l0ZG0vZG9tYWluLW1hcCAg
ICAgICAgIHwgMSArDQo+Pj4gY29udHJpYi9naXRkbS9ncm91cC1tYXAtZmFjZWJvb2sgfCA1ICsr
KysrDQo+Pj4gZ2l0ZG0uY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAxICsNCj4+PiAzIGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBjb250
cmliL2dpdGRtL2dyb3VwLW1hcC1mYWNlYm9vaw0KDQo=

