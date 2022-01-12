Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897B248C7B7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:57:03 +0100 (CET)
Received: from localhost ([::1]:57682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fzi-0008I2-Il
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:57:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1n7fg0-0004Q1-T9; Wed, 12 Jan 2022 10:36:40 -0500
Received: from mail-bn8nam11on2072.outbound.protection.outlook.com
 ([40.107.236.72]:35992 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1n7ffw-0004JP-RL; Wed, 12 Jan 2022 10:36:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/M82+tCXiegx4BIIQCwMXUQGxdgtKALxQBkRswRWOszPU8DWrqkmVLN9ckwmy2oCN3zlTj9r5CdPnxKU6tBePkCdIQMfV3/36wKGiGk4o/7IQ/zy3w2I2JwSpMqIpUmj3CgYSyzksNYwVlzq9z93cvCyzEd64D1IbXIa0EfxLjjfRnK4BGU08jYY+Ryt046jXytlDW+CXEDL5cvoAc/R9Y6bKMCvtG2s1SJYCWDx8OCJyVde4kHaEeeKsgwi4Oqan05sTW/Pex5F0Bd1tfmxa/Bhlg/C0nlisyy6//eSwNbR7T7zqTd++6yuY+AvnWQ/9uGlUgTJC8uP2Wnqx1Ldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpDS2pavwys9Af9jb9ztGMcMZ8mb7tevKKDlTvDar80=;
 b=NZA1pxes1jPZqgQ/y/RgBgW93rOM3tHewOQtwz+ZcXnChCRW94lZrLbvsd3AVUijT4dWkm5t5Ouj/jRdJXY3SLd9R+VzEcC3XA0hnlrUhw/ExPmTNfZHId1DkjAdHMpSR+ucvQ4dD2sumuJRw2rz8yltYGPFUSqI4ZbvmkR+fYK2bQjC+LT6WTt5q2FubBSwsIezlIchyhXTw2BxJSkym7JLPICjJ5TKbLPmmsu3O3Yr4o9TC+aafVUpz7ECYQBvUm6tlX3LpJYRfevNCDj2CjNzZTK4Jjdm0qVqvIGjx/hUp9UKjE4b2oPk0m14qob4Mc/HvYZ2FkuCZqHcPb3R0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpDS2pavwys9Af9jb9ztGMcMZ8mb7tevKKDlTvDar80=;
 b=uG2bxTd+2QzqqPob5kjQhe7a5mEfnMYEmwYjTvwJ/d0ZN0323iYH2oTlCIzsG58TG6wVD46j2j26nSHi+omwBDRTPFLYKZHzcsfu4jmYxMu+AKik5Pp1P/YsUo/S8bALJX3fvh1U+2sDXDhS5EsEEF3RJbTDru11s2WEQI5bJnYBEj4qwE/BDtCfFJhqXGp5JaSZ27MEqrcigWjzPLIn3Kwto+Cid+FlCEa0V3Afbq48k/H0PmQMPqI1a3WD3tw6nk7nC67YAKnk3aNGm97pxiEw39UCpohqhjcgltbOKSOf4OKpIf4oUGtWQDPfysK8UszmcYdNIlnXxPh634BJYA==
Received: from DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39a::17)
 by DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 15:36:33 +0000
Received: from DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::9ca9:4188:fa32:54b2]) by DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::9ca9:4188:fa32:54b2%4]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 15:36:33 +0000
From: "Xueming(Steven) Li" <xuemingl@nvidia.com>
To: "mst@redhat.com" <mst@redhat.com>
CC: "zhangyuwei.9149@bytedance.com" <zhangyuwei.9149@bytedance.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-stable@nongnu.org"
 <qemu-stable@nongnu.org>
Subject: Re: [PATCH v6 2/2] vhost-user: fix VirtQ notifier cleanup
Thread-Topic: [PATCH v6 2/2] vhost-user: fix VirtQ notifier cleanup
Thread-Index: AQHXzvvrfyswAWFy40q+CJbpwTjwIqvvKR8AgACW6oCAAAz3gIBwKT6A
Date: Wed, 12 Jan 2022 15:36:33 +0000
Message-ID: <d802a92c00c4dad3abc03ffeaf04489e015e3860.camel@nvidia.com>
References: <20211101083813.1224522-1-xuemingl@nvidia.com>
 <20211101083813.1224522-3-xuemingl@nvidia.com>
 <20211101165311-mutt-send-email-mst@kernel.org>
 <577f4d01d84af101cd567bede5e40812712b97c9.camel@nvidia.com>
 <20211102024402-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211102024402-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be8349de-bdfc-44d8-0b96-08d9d5e15017
x-ms-traffictypediagnostic: DM5PR12MB1753:EE_
x-microsoft-antispam-prvs: <DM5PR12MB1753EB88B57CBF67F6604139A1529@DM5PR12MB1753.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: opBN491fDS52yZzQL9AuwD+IUA2dzRnTo27czK19sdl1IxbF89NlG7gyRVK98rNdowdCD4UE/rR0YusSz2MVJHgxKVKm9qgPbvV1ShroUi5PgDdJgUoUwhyfKEOMhs6KrIbHGDTHtjwdMEOSwpkJDLW4M5eYQN7BgxY/LSdkrY7moLG0fCEIe2z+YZPkjqfunWNn7UmkxUO8/wey9ldvr4DJLeXE1hP6Gmv5MLHkzRVF9XJAx9ANnQ7pRquzek1jnu0Q9lEzuAivL/F/vbtH7VBR73A7EAIbnJsvblOlpwz7cYOvy+xhwdO8IBjGAAQUhbI7+Qe0cLHrReAnRXftKFaKIMh8eYITHZvJ8tggxFz6/kwZhB4G1JesWTo9rEkB+l5G7Cjurt3apuqG85Ek5QejZ2odg/vnCgEl6olwM5DWlCH1hf90zDmYhlS30Pys1RmqDOmEx67hSK5ePxsWf/zDXXm2BiJ0hFdzzNXk+tuEpqPn+kemdVzpigpDiXIx/MPBH9JMYH6qnaXoekgW6GCiI9UZpOzJ2H0amqaSgLex8FhicTA1PQ0EZfXe7Zybc3kaJEMdI+4j0XR/R8+/GCSYMxy6ig04jYl0sAL1Z1DFfgQ0x0+1w2V8PTlb9SyDM8xAHDf6aSW3Y3MC0XReNO3AaaUHgKdyhz8A60MDKqHTDMMT0fPSuuxCESQmXBJ/09i9UGxUz1a6/civ8fVOYw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5373.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(8676002)(66556008)(36756003)(6512007)(64756008)(76116006)(508600001)(316002)(66946007)(122000001)(6916009)(2616005)(4326008)(83380400001)(91956017)(66476007)(66446008)(5660300002)(71200400001)(6506007)(186003)(26005)(54906003)(38070700005)(86362001)(2906002)(6486002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWZRR1VERHFqaktuTXZucXZ2NXcyR0dvcGdBV2RlbWlMdk9FMllFUjVad0Rm?=
 =?utf-8?B?eHpVQ0ZpQytBYWpGZDV1aGFra3RIK2ZIcEtqb0oyVi9pNDZXejZrUEo0SVR1?=
 =?utf-8?B?UlVDNk5JZkppUU1va1VEMkh6emJsTlVEaDFibGoycEQ5Q0VjZkh4S0sxSVlk?=
 =?utf-8?B?Y21CckhScmF2dUxwaEwwK1NYZ2ZLTlFPb2ZsMDhWVk1vQkI0TC95Kzd0eWZP?=
 =?utf-8?B?MmpabTg4RDVnLyt4LzkyTGsyWnBSZDdzeFNBbmU5dG9nbVgvQzY0dGlxSUNK?=
 =?utf-8?B?M3lkT2QzQjJkRDZjL3o3cm5EbzBEU0tUaE54bWlMOWo5cm02NFQ4R2VoK0tD?=
 =?utf-8?B?RHZZb25OTDRsL20rOHJZOVE0VndpTGI1M3ZOTzZ0M2EycnA3cHdQOE43Q1pV?=
 =?utf-8?B?bzV0M0d2Wmwzci85OS9MYjNONXYxRkxRNzFQV0NSZGtTb2h1b0lhRHhrUVdr?=
 =?utf-8?B?czBEdnIvMXBYZUJrM0l6VWxXWFhFbHBGblJxbG1ndnFKcHBmMDdoNEtMdEVj?=
 =?utf-8?B?ZEtqbldSbDhRVzlEWnM1NGVCMnFpcFRBbllBNi9IY2VEcUhTeW8xTTBOOU8z?=
 =?utf-8?B?YTdoaWNaN014dGI2eitva3VnUEUybjBBVnZ4K0l2dy91bGxBOTNUSEpTSk9t?=
 =?utf-8?B?V3F6ZkkzcjNtOU14MlZtdjNHRjdjdnBkbUlDRzl0ZnZRVmdMTTh0em41ampk?=
 =?utf-8?B?TnNla1MxYk8yamp6S3RlUk1WQnpLbU0rclFRV2N6ejZ2VHBuVEtLRHNZMkpa?=
 =?utf-8?B?Y2FkaEt6Qm10MGgyL0FKeXFMdXhUZUNJbldCdzdIMXVyeHJJSnRMRkFzbHIr?=
 =?utf-8?B?M01mUnpCRjJIZiswSjBycnVYY2t4U3pGcFpRY1BiSXNFVWlCV3ZLR0xFb081?=
 =?utf-8?B?NlBucGwyZGpLbGxVakhWRldLcGVCYldkZlphY1ExbzN1dWw1TTFVSExFSFBV?=
 =?utf-8?B?UzB4VmZKczlxdjVHRjF3RzB1OVo0VVMzNVJ3dEtqcW13Slp0V2NyWmpZeTJm?=
 =?utf-8?B?MnpZNzlab1UzTjNnSktoR0VwY0NPVXRPWEpJZjBIOVJ0OWhxbTlrR0lPOE43?=
 =?utf-8?B?bWdRT0xYVXhGNU5Oc2NxU0gzeGtKb3FEYWtveXlzd1dnQ1ZneTJITjVIa1ho?=
 =?utf-8?B?SkpnL2l6aEszZDZxZ0xrTTZpMk95V3IybzBOVmJMSkFJT1pWcTViSnhZdzRP?=
 =?utf-8?B?Ynd5YUZ0YlNoRUpDWTJUZmk1UVpMaW5pM3VjUTN0dW8vV2pCS2IwRnZsbUhH?=
 =?utf-8?B?ZE9SL2ZLNTM0SWJEcWJyR2pQRnJhOEFHWjl2ck9JNXRZN0k4L2xQYXRDT2Ey?=
 =?utf-8?B?N2kyVGozdndKSzhlbzQzVlMyWDM0bGlLMjFuMHJNWHZhWGJVSzhiUTlBeitq?=
 =?utf-8?B?WnhFTUVrdzNhTzh2Q0svVk1KaDZOSDBuOS8rbGdjTytycFFIM2V4dk14Q2lz?=
 =?utf-8?B?ZXQ2bE9ia25DMUJHRkJJc2NWTVJ0NGRnTHJFOTVmVGZDSysxSkFrVjdLajhL?=
 =?utf-8?B?ekF1QmVaQzdTc3kxcy9jY0EwRGhKclBpRHJGeU5NdGJLYkpRdWZXRERLdktI?=
 =?utf-8?B?N0d2OTMvYlpMUis3SFJhNmg3bmR6RHhsZ2dlaWxEcDVySVRsTkFpTEErNytG?=
 =?utf-8?B?SS9QNW5ORlFBSTVpQmg2MVlsMXNUR3kvN2tCdFI0d0ljRU45YXBDRlFpUml0?=
 =?utf-8?B?YUlxY1Y1SVFaRVNLcFFaMFB5Ym43MjArdVFYNlJLSWE2TGY2b0hYZlpTLzRn?=
 =?utf-8?B?RW41WG9nUmcvc09GcWJyOVdsOVlyTlpBdkczblpKRmd4Z3lCUmUvTGZOQ05U?=
 =?utf-8?B?dkd0OTFMK3VoSW44MHJ4RVppb1FPc0JNQlY2eUFETm1ZZWZTbGxIaWkvVHBj?=
 =?utf-8?B?VXFqU1R1N045a3JSb29ENkIrdlBzM1NWU08yS1hPWVVRR0lPNWVnOHZ4cW9v?=
 =?utf-8?B?RmlzN0ZtdmV3OHRUbGUyQ2RPM2pyRXcyQWZSVjFibkc3QVYyd3RoOW5IQXp4?=
 =?utf-8?B?c2tOS2FuTXFVdUNONTZDaDJRUE9DOWFualhHM01ybktRN0g2YktWL0xFa25V?=
 =?utf-8?B?NW5vUVNBMTQxTENVaVIrcnlqTTZGdEI2WEw2U3diS25hdlVCdEZhY3BMWFhw?=
 =?utf-8?B?bkpWVmNyUlJPR0w0MnE1eTRjelBKUXpGY3hoRmRaRjg1a282bXVQR01oVjJ4?=
 =?utf-8?Q?7Ha2MltQXgVd8UIRyQhy9czQYXPf2UlaE1n7ByUCSOrw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C0181689A25A443A122E2212ADD4957@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be8349de-bdfc-44d8-0b96-08d9d5e15017
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2022 15:36:33.7056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l+gm9t05uNuuCseWXBYa1TaC58Wm+vsIRU/qwdIEHwaZSzPhaus4PBBoiiX8jkmtKmAf/xrbPoiw3XAn9TNu7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1753
Received-SPF: softfail client-ip=40.107.236.72;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVHVlLCAyMDIxLTExLTAyIGF0IDAyOjQ3IC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3Jv
dGU6DQo+IE9uIFR1ZSwgTm92IDAyLCAyMDIxIGF0IDA2OjAwOjU4QU0gKzAwMDAsIFh1ZW1pbmco
U3RldmVuKSBMaSB3cm90ZToNCj4gPiBPbiBNb24sIDIwMjEtMTEtMDEgYXQgMTc6MDAgLTA0MDAs
IE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPiA+IE9uIE1vbiwgTm92IDAxLCAyMDIxIGF0
IDA0OjM4OjEzUE0gKzA4MDAsIFh1ZW1pbmcgTGkgd3JvdGU6DQo+ID4gPiA+IFdoZW4gdmhvc3Qt
dXNlciBkZXZpY2UgY2xlYW51cCBpcyBleGVjdXRlZCBhbmQgdW4tbW1hcHMgbm90aWZpZXINCj4g
PiA+ID4gYWRkcmVzcywgVk0gY3B1IHRocmVhZCB3cml0aW5nIHRoZSBub3RpZmllciBmYWlscyBi
eSBhY2Nlc3NpbmcgaW52YWxpZA0KPiA+ID4gPiBhZGRyZXNzIGVycm9yLg0KPiA+ID4gPiANCj4g
PiA+ID4gVG8gYXZvaWQgdGhpcyBjb25jdXJyZW50IGlzc3VlLCBjYWxsIFJDVSBhbmQgd2FpdCBm
b3IgYSBtZW1vcnkgZmxhdHZpZXcNCj4gPiA+ID4gdXBkYXRlLCB0aGVuIHVuLW1tYXAgbm90aWZp
ZXJzIGluIGNhbGxiYWNrLg0KPiA+ID4gPiANCj4gPiA+ID4gRml4ZXM6IDQ0ODY2NTIxYmQ2ZSAo
InZob3N0LXVzZXI6IHN1cHBvcnQgcmVnaXN0ZXJpbmcgZXh0ZXJuYWwgaG9zdCBub3RpZmllcnMi
KQ0KPiA+ID4gPiBDYzogcWVtdS1zdGFibGVAbm9uZ251Lm9yZw0KPiA+ID4gPiBDYzogWXV3ZWkg
WmhhbmcgPHpoYW5neXV3ZWkuOTE0OUBieXRlZGFuY2UuY29tPg0KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBYdWVtaW5nIExpIDx4dWVtaW5nbEBudmlkaWEuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+
ID4gIGh3L3ZpcnRpby92aG9zdC11c2VyLmMgICAgICAgICB8IDUwICsrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0NCj4gPiA+ID4gIGluY2x1ZGUvaHcvdmlydGlvL3Zob3N0LXVzZXIu
aCB8ICAyICsrDQo+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDE5
IGRlbGV0aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2h3L3ZpcnRpby92
aG9zdC11c2VyLmMgYi9ody92aXJ0aW8vdmhvc3QtdXNlci5jDQo+ID4gPiA+IGluZGV4IGM2NzE3
MTllOWIuLjVhZGFkNGQwMjkgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2h3L3ZpcnRpby92aG9zdC11
c2VyLmMNCj4gPiA+ID4gKysrIGIvaHcvdmlydGlvL3Zob3N0LXVzZXIuYw0KPiA+ID4gPiBAQCAt
MjUsNiArMjUsNyBAQA0KPiA+ID4gPiAgI2luY2x1ZGUgIm1pZ3JhdGlvbi9taWdyYXRpb24uaCIN
Cj4gPiA+ID4gICNpbmNsdWRlICJtaWdyYXRpb24vcG9zdGNvcHktcmFtLmgiDQo+ID4gPiA+ICAj
aW5jbHVkZSAidHJhY2UuaCINCj4gPiA+ID4gKyNpbmNsdWRlICJleGVjL3JhbWJsb2NrLmgiDQo+
ID4gPiA+ICANCj4gPiA+ID4gICNpbmNsdWRlIDxzeXMvaW9jdGwuaD4NCj4gPiA+ID4gICNpbmNs
dWRlIDxzeXMvc29ja2V0Lmg+DQo+ID4gPiA+IEBAIC0xMTQzLDE1ICsxMTQ0LDI3IEBAIHN0YXRp
YyBpbnQgdmhvc3RfdXNlcl9zZXRfdnJpbmdfbnVtKHN0cnVjdCB2aG9zdF9kZXYgKmRldiwNCj4g
PiA+ID4gICAgICByZXR1cm4gdmhvc3Rfc2V0X3ZyaW5nKGRldiwgVkhPU1RfVVNFUl9TRVRfVlJJ
TkdfTlVNLCByaW5nKTsNCj4gPiA+ID4gIH0NCj4gPiA+ID4gIA0KPiA+ID4gPiAtc3RhdGljIHZv
aWQgdmhvc3RfdXNlcl9ob3N0X25vdGlmaWVyX3JlbW92ZShzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYs
DQo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlu
dCBxdWV1ZV9pZHgpDQo+ID4gPiA+ICtzdGF0aWMgdm9pZCB2aG9zdF91c2VyX2hvc3Rfbm90aWZp
ZXJfZnJlZShWaG9zdFVzZXJIb3N0Tm90aWZpZXIgKm4pDQo+ID4gPiA+ICB7DQo+ID4gPiA+IC0g
ICAgc3RydWN0IHZob3N0X3VzZXIgKnUgPSBkZXYtPm9wYXF1ZTsNCj4gPiA+ID4gLSAgICBWaG9z
dFVzZXJIb3N0Tm90aWZpZXIgKm4gPSAmdS0+dXNlci0+bm90aWZpZXJbcXVldWVfaWR4XTsNCj4g
PiA+ID4gLSAgICBWaXJ0SU9EZXZpY2UgKnZkZXYgPSBkZXYtPnZkZXY7DQo+ID4gPiA+ICsgICAg
YXNzZXJ0KG4gJiYgbi0+b2xkX2FkZHIpOw0KPiA+ID4gPiArICAgIG11bm1hcChuLT5vbGRfYWRk
ciwgcWVtdV9yZWFsX2hvc3RfcGFnZV9zaXplKTsNCj4gPiA+ID4gKyAgICBuLT5vbGRfYWRkciA9
IE5VTEw7DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0YXRpYyB2b2lkIHZob3N0
X3VzZXJfaG9zdF9ub3RpZmllcl9yZW1vdmUoVmhvc3RVc2VyU3RhdGUgKnVzZXIsDQo+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZpcnRJT0Rldmlj
ZSAqdmRldiwgaW50IHF1ZXVlX2lkeCkNCj4gPiA+ID4gK3sNCj4gPiA+ID4gKyAgICBWaG9zdFVz
ZXJIb3N0Tm90aWZpZXIgKm4gPSAmdXNlci0+bm90aWZpZXJbcXVldWVfaWR4XTsNCj4gPiA+ID4g
IA0KPiA+ID4gPiAgICAgIGlmIChuLT5hZGRyKSB7DQo+ID4gPiA+IC0gICAgICAgIHZpcnRpb19x
dWV1ZV9zZXRfaG9zdF9ub3RpZmllcl9tcih2ZGV2LCBxdWV1ZV9pZHgsICZuLT5tciwgZmFsc2Up
Ow0KPiA+ID4gPiArICAgICAgICBpZiAodmRldikgew0KPiA+ID4gPiArICAgICAgICAgICAgdmly
dGlvX3F1ZXVlX3NldF9ob3N0X25vdGlmaWVyX21yKHZkZXYsIHF1ZXVlX2lkeCwgJm4tPm1yLCBm
YWxzZSk7DQo+ID4gPiA+ICsgICAgICAgIH0NCj4gPiA+ID4gKyAgICAgICAgYXNzZXJ0KG4tPmFk
ZHIpOw0KPiA+ID4gPiArICAgICAgICBhc3NlcnQoIW4tPm9sZF9hZGRyKTsNCj4gPiA+ID4gKyAg
ICAgICAgbi0+b2xkX2FkZHIgPSBuLT5hZGRyOw0KPiA+ID4gPiArICAgICAgICBuLT5hZGRyID0g
TlVMTDsNCj4gPiA+ID4gKyAgICAgICAgY2FsbF9yY3Uobiwgdmhvc3RfdXNlcl9ob3N0X25vdGlm
aWVyX2ZyZWUsIHJjdSk7DQo+ID4gPiA+ICAgICAgfQ0KPiA+ID4gPiAgfQ0KPiA+ID4gPiAgDQo+
ID4gPiA+IEBAIC0xMTkwLDggKzEyMDMsOSBAQCBzdGF0aWMgaW50IHZob3N0X3VzZXJfZ2V0X3Zy
aW5nX2Jhc2Uoc3RydWN0IHZob3N0X2RldiAqZGV2LA0KPiA+ID4gPiAgICAgICAgICAucGF5bG9h
ZC5zdGF0ZSA9ICpyaW5nLA0KPiA+ID4gPiAgICAgICAgICAuaGRyLnNpemUgPSBzaXplb2YobXNn
LnBheWxvYWQuc3RhdGUpLA0KPiA+ID4gPiAgICAgIH07DQo+ID4gPiA+ICsgICAgc3RydWN0IHZo
b3N0X3VzZXIgKnUgPSBkZXYtPm9wYXF1ZTsNCj4gPiA+ID4gIA0KPiA+ID4gPiAtICAgIHZob3N0
X3VzZXJfaG9zdF9ub3RpZmllcl9yZW1vdmUoZGV2LCByaW5nLT5pbmRleCk7DQo+ID4gPiA+ICsg
ICAgdmhvc3RfdXNlcl9ob3N0X25vdGlmaWVyX3JlbW92ZSh1LT51c2VyLCBkZXYtPnZkZXYsIHJp
bmctPmluZGV4KTsNCj4gPiA+ID4gIA0KPiA+ID4gPiAgICAgIGlmICh2aG9zdF91c2VyX3dyaXRl
KGRldiwgJm1zZywgTlVMTCwgMCkgPCAwKSB7DQo+ID4gPiA+ICAgICAgICAgIHJldHVybiAtMTsN
Cj4gPiA+ID4gQEAgLTE0ODYsMTIgKzE1MDAsNyBAQCBzdGF0aWMgaW50IHZob3N0X3VzZXJfc2xh
dmVfaGFuZGxlX3ZyaW5nX2hvc3Rfbm90aWZpZXIoc3RydWN0IHZob3N0X2RldiAqZGV2LA0KPiA+
ID4gPiAgDQo+ID4gPiA+ICAgICAgbiA9ICZ1c2VyLT5ub3RpZmllcltxdWV1ZV9pZHhdOw0KPiA+
ID4gPiAgDQo+ID4gPiA+IC0gICAgaWYgKG4tPmFkZHIpIHsNCj4gPiA+ID4gLSAgICAgICAgdmly
dGlvX3F1ZXVlX3NldF9ob3N0X25vdGlmaWVyX21yKHZkZXYsIHF1ZXVlX2lkeCwgJm4tPm1yLCBm
YWxzZSk7DQo+ID4gPiA+IC0gICAgICAgIG9iamVjdF91bnBhcmVudChPQkpFQ1QoJm4tPm1yKSk7
DQo+ID4gPiA+IC0gICAgICAgIG11bm1hcChuLT5hZGRyLCBwYWdlX3NpemUpOw0KPiA+ID4gPiAt
ICAgICAgICBuLT5hZGRyID0gTlVMTDsNCj4gPiA+ID4gLSAgICB9DQo+ID4gPiA+ICsgICAgdmhv
c3RfdXNlcl9ob3N0X25vdGlmaWVyX3JlbW92ZSh1c2VyLCB2ZGV2LCBxdWV1ZV9pZHgpOw0KPiA+
ID4gPiAgDQo+ID4gPiA+ICAgICAgaWYgKGFyZWEtPnU2NCAmIFZIT1NUX1VTRVJfVlJJTkdfTk9G
RF9NQVNLKSB7DQo+ID4gPiA+ICAgICAgICAgIHJldHVybiAwOw0KPiA+ID4gPiBAQCAtMTUxMCw5
ICsxNTE5LDEyIEBAIHN0YXRpYyBpbnQgdmhvc3RfdXNlcl9zbGF2ZV9oYW5kbGVfdnJpbmdfaG9z
dF9ub3RpZmllcihzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsDQo+ID4gPiA+ICANCj4gPiA+ID4gICAg
ICBuYW1lID0gZ19zdHJkdXBfcHJpbnRmKCJ2aG9zdC11c2VyL2hvc3Qtbm90aWZpZXJAJXAgbW1h
cHNbJWRdIiwNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVzZXIsIHF1ZXVl
X2lkeCk7DQo+ID4gPiA+IC0gICAgaWYgKCFuLT5tci5yYW0pIC8qIERvbid0IGluaXQgYWdhaW4g
YWZ0ZXIgc3VzcGVuZC4gKi8NCj4gPiA+ID4gKyAgICBpZiAoIW4tPm1yLnJhbSkgeyAvKiBEb24n
dCBpbml0IGFnYWluIGFmdGVyIHN1c3BlbmQuICovDQo+ID4gPiA+ICAgICAgICAgIG1lbW9yeV9y
ZWdpb25faW5pdF9yYW1fZGV2aWNlX3B0cigmbi0+bXIsIE9CSkVDVCh2ZGV2KSwgbmFtZSwNCj4g
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZ2Vfc2l6
ZSwgYWRkcik7DQo+ID4gPiA+ICsgICAgfSBlbHNlIHsNCj4gPiA+ID4gKyAgICAgICAgbi0+bXIu
cmFtX2Jsb2NrLT5ob3N0ID0gYWRkcjsNCj4gPiA+ID4gKyAgICB9DQo+ID4gPiA+ICAgICAgZ19m
cmVlKG5hbWUpOw0KPiA+ID4gPiAgDQo+ID4gPiA+ICAgICAgaWYgKHZpcnRpb19xdWV1ZV9zZXRf
aG9zdF9ub3RpZmllcl9tcih2ZGV2LCBxdWV1ZV9pZHgsICZuLT5tciwgdHJ1ZSkpIHsNCj4gPiA+
ID4gQEAgLTI0NjAsMTcgKzI0NzIsMTcgQEAgYm9vbCB2aG9zdF91c2VyX2luaXQoVmhvc3RVc2Vy
U3RhdGUgKnVzZXIsIENoYXJCYWNrZW5kICpjaHIsIEVycm9yICoqZXJycCkNCj4gPiA+ID4gIHZv
aWQgdmhvc3RfdXNlcl9jbGVhbnVwKFZob3N0VXNlclN0YXRlICp1c2VyKQ0KPiA+ID4gPiAgew0K
PiA+ID4gPiAgICAgIGludCBpOw0KPiA+ID4gPiArICAgIFZob3N0VXNlckhvc3ROb3RpZmllciAq
bjsNCj4gPiA+ID4gIA0KPiA+ID4gPiAgICAgIGlmICghdXNlci0+Y2hyKSB7DQo+ID4gPiA+ICAg
ICAgICAgIHJldHVybjsNCj4gPiA+ID4gICAgICB9DQo+ID4gPiA+ICAgICAgbWVtb3J5X3JlZ2lv
bl90cmFuc2FjdGlvbl9iZWdpbigpOw0KPiA+ID4gPiAgICAgIGZvciAoaSA9IDA7IGkgPCBWSVJU
SU9fUVVFVUVfTUFYOyBpKyspIHsNCj4gPiA+ID4gLSAgICAgICAgaWYgKHVzZXItPm5vdGlmaWVy
W2ldLmFkZHIpIHsNCj4gPiA+ID4gLSAgICAgICAgICAgIG9iamVjdF91bnBhcmVudChPQkpFQ1Qo
JnVzZXItPm5vdGlmaWVyW2ldLm1yKSk7DQo+ID4gPiA+IC0gICAgICAgICAgICBtdW5tYXAodXNl
ci0+bm90aWZpZXJbaV0uYWRkciwgcWVtdV9yZWFsX2hvc3RfcGFnZV9zaXplKTsNCj4gPiA+ID4g
LSAgICAgICAgICAgIHVzZXItPm5vdGlmaWVyW2ldLmFkZHIgPSBOVUxMOw0KPiA+ID4gPiAtICAg
ICAgICB9DQo+ID4gPiA+ICsgICAgICAgIG4gPSAmdXNlci0+bm90aWZpZXJbaV07DQo+ID4gPiA+
ICsgICAgICAgIGFzc2VydCghbi0+YWRkcik7DQo+ID4gPiANCj4gPiA+IEknbSBwcmV0dHkgY29u
ZnVzZWQgYXMgdG8gd2h5IHRoaXMgYXNzZXJ0IGhvbGRzLg0KPiA+ID4gQWRkIGEgY29tbWVudD8N
Cj4gPiANCj4gPiBTZWVtcyBub3RpZmllcnMgYXJlIHJlbW92ZWQgYnkgdmhvc3RfdXNlcl9nZXRf
dnJpbmdfYmFzZSgpLCBJIHVzZWQgdGhpcw0KPiA+IGFzc2VydCB0byBjYXRjaCBleGNlcHRpb24u
IFdpbGwgcmVtb3ZlIGl0Lg0KPiANCj4gVW0gSSdtIG5vdCBhY3R1YWxseSBhc2tpbmcgYWJvdXQg
dGhhdC4gYXNzZXJ0cyBhcmUgZ29vZCBidXQNCj4gaG93IGRvIHdlIGtub3cgdGhpcyBvbmUgaG9s
ZHM/DQoNCk5vcm1hbGx5IG5vdGlmaWVyIGlzIHJlbW92ZWQgaW4gZ2V0X3ZyaW5nX2Jhc2Ugc3Rh
Z2UsIG5vdCBzdXJlIHdoeSBoZXJlDQp3ZSB0cnkgdG8gY2xlYW51cCBub3RpZmllcnMgYWdhaW4u
IFRoYXQncyB3aHkgSSBhZGRlZCBhc3NlcnQgdG8gY2FwdXRyZQ0KdGhlIGNhc2UsIGp1c3QgZm9y
IGRlYnVnLiBXZSBkb24ndCBuZWVkIGl0IGZvciBzdXJlIGFzIGZvcm1hbCB2ZXJzaW9uLg0KDQo+
IA0KPiA+ID4gDQo+ID4gPiA+ICsgICAgICAgIHZob3N0X3VzZXJfaG9zdF9ub3RpZmllcl9yZW1v
dmUodXNlciwgTlVMTCwgaSk7DQo+ID4gPiA+ICsgICAgICAgIG9iamVjdF91bnBhcmVudChPQkpF
Q1QoJm4tPm1yKSk7DQo+ID4gPiA+ICAgICAgfQ0KPiA+ID4gPiAgICAgIG1lbW9yeV9yZWdpb25f
dHJhbnNhY3Rpb25fY29tbWl0KCk7DQo+ID4gPiA+ICAgICAgdXNlci0+Y2hyID0gTlVMTDsNCj4g
PiA+IA0KPiA+ID4gSSdtIGFsc28gY29uZnVzZWQgb24gd2h5IHdlIGNhbiBkbyB1bnBhcmVudCBm
b3Igbm90aWZpZXJzIHdoaWNoIGhhdmUNCj4gPiA+IG5ldmVyIGJlZW4gc2V0IHVwLiBXb24ndCBu
LT5tciBiZSBpbnZhbGlkIHRoZW4/DQo+ID4gDQo+ID4gVGhlcmUgaXMgYSBwYXJlbnQgY2hlY2sg
aW4gb2JqZWN0X3VucGFyZW50KCkuDQo+IA0KPiBJdCBkb2VzIG5vdCBzZWVtIHRvIGJlIGlkZW1w
b3RlbnQgdGhvdWdoIGluIHRoYXQgaXQgZG9lcyBub3QNCj4gc2V0IHBhcmVudCB0byBOVUxMLiBX
aGF0IGlmIHRoaXMgaXMgY2FsbGVkIHR3aWNlPw0KDQpUaGlzIHBhdGNoIGludHJvZHVjZWQgd2h5
IHdlIG5lZWQgaXQ6DQoxZjg5ZDNiOTFlM2UgKCJody92aXJ0aW86IEZpeCBsZWFrIG9mIGhvc3Qt
bm90aWZpZXIgbWVtb3J5LXJlZ2lvbiIpDQoNCklmIGNhbGxlZCB0d2ljZSwgbi0+bXItPnBhcmVu
dCBpcyBOVUxMIGFuZCBvYmplY3RfdW5wYXJlbnQoKSB3aWxsIGRvDQpub3RoaW5nLg0KDQo+IA0K
PiA+ID4gDQo+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvdmlydGlvL3Zo
b3N0LXVzZXIuaCBiL2luY2x1ZGUvaHcvdmlydGlvL3Zob3N0LXVzZXIuaA0KPiA+ID4gPiBpbmRl
eCBmNjAxMmIyMDc4Li4wM2FhMjJkNDUwIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9pbmNsdWRlL2h3
L3ZpcnRpby92aG9zdC11c2VyLmgNCj4gPiA+ID4gKysrIGIvaW5jbHVkZS9ody92aXJ0aW8vdmhv
c3QtdXNlci5oDQo+ID4gPiA+IEBAIC0xMiw4ICsxMiwxMCBAQA0KPiA+ID4gPiAgI2luY2x1ZGUg
Imh3L3ZpcnRpby92aXJ0aW8uaCINCj4gPiA+ID4gIA0KPiA+ID4gPiAgdHlwZWRlZiBzdHJ1Y3Qg
Vmhvc3RVc2VySG9zdE5vdGlmaWVyIHsNCj4gPiA+ID4gKyAgICBzdHJ1Y3QgcmN1X2hlYWQgcmN1
Ow0KPiA+ID4gPiAgICAgIE1lbW9yeVJlZ2lvbiBtcjsNCj4gPiA+ID4gICAgICB2b2lkICphZGRy
Ow0KPiA+ID4gPiArICAgIHZvaWQgKm9sZF9hZGRyOw0KPiA+ID4gDQo+ID4gPiBUaGF0J3Mgbm90
IGEgdmVyeSBjbGVhciBuYW1lLiBJcyB0aGlzIGxpdGVyYWxseSBqdXN0DQo+ID4gPiAiYWRkcmVz
cyBmb3IgdGhlIHJjdSBjYWxsYmFjayB0byB1bm1hcCI/DQo+ID4gPiBNYXliZSB1bm1hcF9hZGRy
IHRoZW4/DQo+ID4gDQo+ID4gTEdUTSwgdGhhbmtzIQ0KPiA+IA0KPiA+IA0KPiA+ID4gDQo+ID4g
PiA+ICB9IFZob3N0VXNlckhvc3ROb3RpZmllcjsNCj4gPiA+ID4gIA0KPiA+ID4gPiAgdHlwZWRl
ZiBzdHJ1Y3QgVmhvc3RVc2VyU3RhdGUgew0KPiA+ID4gPiAtLSANCj4gPiA+ID4gMi4zMy4wDQo+
ID4gPiANCj4gPiANCj4gDQoNCg==

