Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316004426F9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 07:03:09 +0100 (CET)
Received: from localhost ([::1]:55248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhmt1-0008MY-E3
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 02:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mhmrC-0007JY-Ve; Tue, 02 Nov 2021 02:01:15 -0400
Received: from mail-mw2nam12on2046.outbound.protection.outlook.com
 ([40.107.244.46]:15073 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mhmr5-00038V-IN; Tue, 02 Nov 2021 02:01:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QexxgbnxwP4a2CF2xc9CvTgWZULS54f3eTYoZuPXWDM4OFXxkxa1ftahMLgGL8pkcM+nHquNGvURJme73cvzwI+gr/yWecfqShJmZAqSMl61o+fDzfEPa53zNNRV6S+mID/sXyJ2sSwjQIqEJy+PsHijp2fpDfFV2fn8A5ptIdXwSgTJfRU2QiUTlZ5gZTUwx6jNGkzY8ttxllBQuUJwoFISG8LzK+Xze8nNZsQvxOPZbo03X7zdLh2daam5Za0JvWwRZjPbhw9QaPm284csXzEfy1PiPdzNX3Lg+oWcQGqVIhc0yPLyXTq9onJ1hjWOoM7fNaU4tsH8hMuliLl3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRPOYcf12VR5KHP7G+oQA1fTz9oFb8C3prOfIVC48Ok=;
 b=OoR7+bK0WELkf9npO5vPXsfQnqf0FYF9UuRNoPXfvfKiynPAimLbRaBHw3fv2q069JERJTj8wJ9fUEfoqRbDxWaXqJWaUohAWoIh7+tv+FiFy4QN/HwxB/8YWb6TZFi2Dzeso34Q3ZqYL5xqbeyBz2PPlJNkG7dHQlOk8OFTwthUOv2B6JFWacLtiR0Loy5cW3TLDHfH4WSpDIHkVTRFBcqY+6FZ6YMk3wdltBqGq2+9ER3KMhRNw1cfLRnoqpAQi4bLrCssx1tWkDHYrzbRZ14IowSlYERP1K+GiQ3LlQBFellENKKLTp2PJKDOvW64k22SIQmZvkTHkGtbw2ypog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRPOYcf12VR5KHP7G+oQA1fTz9oFb8C3prOfIVC48Ok=;
 b=STPUz/tAg0JF/ztewVY46UcuYGAr7e6UoNDZ8n5HFN1w5MiOU7OehqTHD/H2LiVnIjNxKq+jIBzEYSRIx0Ukg/RQVCSPYjv+/UNjnKzrPSpMm5hnhshYVOkor9g4ZlH3bw9DN+zA3FldJ2O/MpTowILhrKfuAP1GlVhEk9FkAc6AZ5U8Oxqlt5Ed6iz+1RkxaD0jBg7+gYlQPmEUK3dXtxM3SP7NoR4U4IL/+J3a84oayvSM/RG9O8AFfAs7dQyPlXX1IiixbAWphKGyXXHDZ54/dd3YTCirEDCabifvwlfSQqEyfilmOmX6AYUTnon5vllMNDAx7sPh24au7YRv6w==
Received: from DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39a::17)
 by DM4PR12MB5117.namprd12.prod.outlook.com (2603:10b6:5:390::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 06:00:59 +0000
Received: from DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25]) by DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25%5]) with mapi id 15.20.4649.019; Tue, 2 Nov 2021
 06:00:59 +0000
From: "Xueming(Steven) Li" <xuemingl@nvidia.com>
To: "mst@redhat.com" <mst@redhat.com>
CC: "zhangyuwei.9149@bytedance.com" <zhangyuwei.9149@bytedance.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-stable@nongnu.org"
 <qemu-stable@nongnu.org>
Subject: Re: [PATCH v6 2/2] vhost-user: fix VirtQ notifier cleanup
Thread-Topic: [PATCH v6 2/2] vhost-user: fix VirtQ notifier cleanup
Thread-Index: AQHXzvvrfyswAWFy40q+CJbpwTjwIqvvKR8AgACW6oA=
Date: Tue, 2 Nov 2021 06:00:58 +0000
Message-ID: <577f4d01d84af101cd567bede5e40812712b97c9.camel@nvidia.com>
References: <20211101083813.1224522-1-xuemingl@nvidia.com>
 <20211101083813.1224522-3-xuemingl@nvidia.com>
 <20211101165311-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211101165311-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f69c529-c290-498e-ad74-08d99dc62475
x-ms-traffictypediagnostic: DM4PR12MB5117:
x-microsoft-antispam-prvs: <DM4PR12MB51175F1C0521B87E2C387804A18B9@DM4PR12MB5117.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XTKkFhnMShky0JfRToyEsvXpjOIHFpdKWiQxhSLOS45AYCar8O2RZDfjyDenlfGOmg3g5H6VlHCCCYDVOfBzhWsXBIKzQTZxMLIjk5hVKAdGPXiy0p5g/0LASq1tByRfW6lIC7tDE8KEWzWIHkUnzTp1LfSSMqIKIrugJ4YFwSvIbqNcbcwYmr0xHtBj2DbkzglSKmD9Iy3Og+MIO5QOrRpd3k9smL8+F2i5f+ppZYJmDOrhMBX0J3oNK4WfODWjbg1pmef6FfbQT/EnxHxn/aIMIZrGbeuvdGYrt3MEr5MJuPi7rDNogelYt06rp5dFXHPqlICL60tD8BPXszjgTC91d7JtlRienjUreHBXgVOAQaFYI+RwR7FXyL8oa94UCZz9/Q6uh1cQgE+v22aQB16WvnFsF74TyVI/FTNlI8UtJ4XAAopbgSPWmVkPFFf4bGCGKEe3JC5+I+21UBBPTOoxYrN5xuCcYRbvFZh3PR9rP6jAFaASu/9s6sGbaJASX1tyT8VhJMJLWJ0lkkj+E5ygDic/9QKotSdvTYZxK5AvI/s66EahCIILFqYbjmqybnOqF913ELEb2nYTAFHmyKSs9Ga082CoVhYHGyazsJYyp7jV6VS3Lrq7RM9L5MlTN9bRvu0m1hW/6pWf91giE1a4QvP3Xabq3TYRTTy9RvongRu9keWEOXniA1/8+l8iHk7kUbuFHuHCWrD2TGpNaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5373.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(4326008)(122000001)(186003)(38100700002)(54906003)(6916009)(6512007)(8676002)(38070700005)(6506007)(71200400001)(5660300002)(316002)(36756003)(91956017)(76116006)(66446008)(64756008)(66946007)(2906002)(66556008)(66476007)(508600001)(86362001)(6486002)(26005)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1pFZmQwWWFFU1o3L3RTVkhDdDU5NXovdm9hYm5VNnprbmpTbjNBcWg5OUpL?=
 =?utf-8?B?VDRsT3ZER2xiSVNreC9aMTNVcHJhdnZHTnVCeE9NSlRIdUhQZzVIeFFqUTlR?=
 =?utf-8?B?QXRuTmdGYzF0N2ErVmhvNVh5bkpxUVFSTE16dml5UUpLWTk4L0NQQXRFU2Y5?=
 =?utf-8?B?dEZsRG4wMUNGN1FLWEhnZ3VydjFtVzFTN1c3YmhkR1JIWU9MUFRxRzZ5NVFU?=
 =?utf-8?B?VUhlKzZxWk0zQW5xZHMxZ0JITkl3Z2tMcWFudURMS0pCcnpYbThGZTQwZGg0?=
 =?utf-8?B?Y1pqb21kc3FSSitFWFZMcnlnWW1JSHlGL0dYUm1HaTk1ODdGZUgvNlM2VG01?=
 =?utf-8?B?WmN5TjVRZndwdGJvbUp2SDc3M0UyRkE3T3JXbXVKdUxXbUVRbzJMcHB1bk1p?=
 =?utf-8?B?U092VjlWWVFPanZpUlpyZnoyb3NOQjJPWXlocUNnV2VDUUlQaVl5L1R6QnFI?=
 =?utf-8?B?eUIyVXptdGJYblg3QzJYelNZU2MyODlzaXBXWE02N0IvWVlxWkE2ZUpJdjFH?=
 =?utf-8?B?YlZ0eWsyZ2ZWUjFFNmJhZG9nVkdmVEhUUnJZSXZvUld3cFhLSyt6N0JTODFy?=
 =?utf-8?B?bmp1OUdCQ0pkNnNDbFNBZFpYOXBVa3NRVW14REc5SWx3bjFCdzRlWTViOERL?=
 =?utf-8?B?THF2OFExc0p6QkhkTWN2V3VYVk42Q2ZncjcwTUF4aFZDb2tDOWpUeTNRWjhG?=
 =?utf-8?B?UER0d3BIRlRCL056YjFXMm04d05kUVVmTCtiN1BtZU94Z3BtN0ZOL1VVbThw?=
 =?utf-8?B?MzdpOWJPRC8zWk9CUjZ6MWcrNE84b0ZnNVlwTWY4cThtQ2ZCTm9mQ3ZmRGZn?=
 =?utf-8?B?QXBSekJFTWNKaXozNVc1djhNV0xGd0xFdmRHSmNmT2x1bVdsV3VzaXUyREhy?=
 =?utf-8?B?cnN2aHAwdXZQM2k2UVVNNVhTZmdoQmJEVElENkVyelY5Z1pCYmFNMEhJV3VU?=
 =?utf-8?B?TjZHd2VCbTJ6ZFJhTjJhNW9zNHltRnpPVXFUayt2MXp4bTdlRDJrWUFXRC9q?=
 =?utf-8?B?c2MyTEtQb2VqMDMxQTVBeE9JbWJ0NXpVUXFDMndGWkNiTHFvamx6QkJFN2Nj?=
 =?utf-8?B?SzlqSzVwQkovaURKRkp2MThPL0k2Q3hYdG9kdEI3d24wc2orc1hHRzRIcjZa?=
 =?utf-8?B?bnIvSVZHUk1DcUZQa21OcnRLSjhGcllGWU11dG5FcitsOElxbHRObC9kR3lF?=
 =?utf-8?B?QUdYV1VIOWhGN3pGWU9MU1FBYzJiV3J6eDRhY3liUGFzZnp5dlBpVVVsQVcr?=
 =?utf-8?B?ZTZQTWlWMk5tZjA4L0w3cGJ2SE5lMWxQNnM2OUx0V0ZnQzZLTUV1WWN5cjVm?=
 =?utf-8?B?SzlVOHBpVmJOaU10aTl1NGZmdXRsUjlOb1dYRmcvTzh3Y0VLUXF5QjRIeWRC?=
 =?utf-8?B?RHNtUVV1UFhiSGFVSCtGOG5PNEw0VHFIZXRtZWthUWtHTlRQeldubldsNmlh?=
 =?utf-8?B?Qy8vR2FRdFZ6aXJqMWk0NHhMTk9vcUI1RHpPNjFwd3o3U1hJQnNEdXBNZTdP?=
 =?utf-8?B?cEo1ZnoxbEUrTWo1YXZpdUpTbGxjRnl0anVnMWxOUU4zUXM0NkpMRVl4ZFRM?=
 =?utf-8?B?ZDh2MXAyd1MwMlg1NHo4VS9GNjk1L1N0cG5mKzRIblI2ZkphM3JxT0RwSzN2?=
 =?utf-8?B?eGE5TlVhL0lWK2ZtSGRhMFE3d0ljUnlTNWJENlJHTUJCMGxva2xtTWhMNGgv?=
 =?utf-8?B?anBlOWZJdmYvZ2hlSzJhTzFCMElDLzY0TW5XQit6UnBxbHZkYzdOdW1NSExR?=
 =?utf-8?B?U1ZCMzc0ZVlWM0NGeFdpeFkwM2RIVVNUenpndEtuejd2cVhhcE5YK2xJOUlD?=
 =?utf-8?B?ZlNocEZyZmVRbGNqRTN5WWhqbC9TTGkxeW8zdE5KMTlSdWczTnEvb2gwZlNW?=
 =?utf-8?B?dFQrR2gwTG5kYTNnN2tVWjhtUk1IOGlXWlVZNWFVVjgrYUhHajE0WXZEa2VR?=
 =?utf-8?B?djN2YUdTTHIvdkpZTUlxWm1wTXVDRjJEQXZKR21zaFdOa080WjJkRkZZdGxE?=
 =?utf-8?B?Tnp0cWJGaUVnNGc0cERmQko5Z1R3aWdlRWZodDlrT3pyL2ZCY0RNNGx5L3Rw?=
 =?utf-8?B?OUhYWjdRN3FQbGxPYTQzWDdVcjlJMmx5NzRHei9nOW1sMzFIQ3JteWYwQ1pp?=
 =?utf-8?B?QXZCTkFBdnptZE55RFFiUWJWSHFiZmIvS3VBTUdkeThkN1RFWEZ1eUcxaG1J?=
 =?utf-8?Q?pXNBIu6gkr/nelPPFjVOeFQCiuJuL1C7LHxX4Mmd+mLv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86A300A3396394418A820F1CC6C40E6E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f69c529-c290-498e-ad74-08d99dc62475
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 06:00:58.9347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EBRsKdq/p1EKUdkfONcJp0zxRHpJBMHTxJDWk4VQjIPOQTYmgM3PmZUViFybhpY//E6ejNsbRitG8HbF8LwBFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5117
Received-SPF: softfail client-ip=40.107.244.46;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
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

T24gTW9uLCAyMDIxLTExLTAxIGF0IDE3OjAwIC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3Jv
dGU6DQo+IE9uIE1vbiwgTm92IDAxLCAyMDIxIGF0IDA0OjM4OjEzUE0gKzA4MDAsIFh1ZW1pbmcg
TGkgd3JvdGU6DQo+ID4gV2hlbiB2aG9zdC11c2VyIGRldmljZSBjbGVhbnVwIGlzIGV4ZWN1dGVk
IGFuZCB1bi1tbWFwcyBub3RpZmllcg0KPiA+IGFkZHJlc3MsIFZNIGNwdSB0aHJlYWQgd3JpdGlu
ZyB0aGUgbm90aWZpZXIgZmFpbHMgYnkgYWNjZXNzaW5nIGludmFsaWQNCj4gPiBhZGRyZXNzIGVy
cm9yLg0KPiA+IA0KPiA+IFRvIGF2b2lkIHRoaXMgY29uY3VycmVudCBpc3N1ZSwgY2FsbCBSQ1Ug
YW5kIHdhaXQgZm9yIGEgbWVtb3J5IGZsYXR2aWV3DQo+ID4gdXBkYXRlLCB0aGVuIHVuLW1tYXAg
bm90aWZpZXJzIGluIGNhbGxiYWNrLg0KPiA+IA0KPiA+IEZpeGVzOiA0NDg2NjUyMWJkNmUgKCJ2
aG9zdC11c2VyOiBzdXBwb3J0IHJlZ2lzdGVyaW5nIGV4dGVybmFsIGhvc3Qgbm90aWZpZXJzIikN
Cj4gPiBDYzogcWVtdS1zdGFibGVAbm9uZ251Lm9yZw0KPiA+IENjOiBZdXdlaSBaaGFuZyA8emhh
bmd5dXdlaS45MTQ5QGJ5dGVkYW5jZS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogWHVlbWluZyBM
aSA8eHVlbWluZ2xAbnZpZGlhLmNvbT4NCj4gPiAtLS0NCj4gPiAgaHcvdmlydGlvL3Zob3N0LXVz
ZXIuYyAgICAgICAgIHwgNTAgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0KPiA+
ICBpbmNsdWRlL2h3L3ZpcnRpby92aG9zdC11c2VyLmggfCAgMiArKw0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9ody92aXJ0aW8vdmhvc3QtdXNlci5jIGIvaHcvdmlydGlvL3Zob3N0LXVzZXIuYw0K
PiA+IGluZGV4IGM2NzE3MTllOWIuLjVhZGFkNGQwMjkgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvdmly
dGlvL3Zob3N0LXVzZXIuYw0KPiA+ICsrKyBiL2h3L3ZpcnRpby92aG9zdC11c2VyLmMNCj4gPiBA
QCAtMjUsNiArMjUsNyBAQA0KPiA+ICAjaW5jbHVkZSAibWlncmF0aW9uL21pZ3JhdGlvbi5oIg0K
PiA+ICAjaW5jbHVkZSAibWlncmF0aW9uL3Bvc3Rjb3B5LXJhbS5oIg0KPiA+ICAjaW5jbHVkZSAi
dHJhY2UuaCINCj4gPiArI2luY2x1ZGUgImV4ZWMvcmFtYmxvY2suaCINCj4gPiAgDQo+ID4gICNp
bmNsdWRlIDxzeXMvaW9jdGwuaD4NCj4gPiAgI2luY2x1ZGUgPHN5cy9zb2NrZXQuaD4NCj4gPiBA
QCAtMTE0MywxNSArMTE0NCwyNyBAQCBzdGF0aWMgaW50IHZob3N0X3VzZXJfc2V0X3ZyaW5nX251
bShzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsDQo+ID4gICAgICByZXR1cm4gdmhvc3Rfc2V0X3ZyaW5n
KGRldiwgVkhPU1RfVVNFUl9TRVRfVlJJTkdfTlVNLCByaW5nKTsNCj4gPiAgfQ0KPiA+ICANCj4g
PiAtc3RhdGljIHZvaWQgdmhvc3RfdXNlcl9ob3N0X25vdGlmaWVyX3JlbW92ZShzdHJ1Y3Qgdmhv
c3RfZGV2ICpkZXYsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaW50IHF1ZXVlX2lkeCkNCj4gPiArc3RhdGljIHZvaWQgdmhvc3RfdXNlcl9ob3N0X25v
dGlmaWVyX2ZyZWUoVmhvc3RVc2VySG9zdE5vdGlmaWVyICpuKQ0KPiA+ICB7DQo+ID4gLSAgICBz
dHJ1Y3Qgdmhvc3RfdXNlciAqdSA9IGRldi0+b3BhcXVlOw0KPiA+IC0gICAgVmhvc3RVc2VySG9z
dE5vdGlmaWVyICpuID0gJnUtPnVzZXItPm5vdGlmaWVyW3F1ZXVlX2lkeF07DQo+ID4gLSAgICBW
aXJ0SU9EZXZpY2UgKnZkZXYgPSBkZXYtPnZkZXY7DQo+ID4gKyAgICBhc3NlcnQobiAmJiBuLT5v
bGRfYWRkcik7DQo+ID4gKyAgICBtdW5tYXAobi0+b2xkX2FkZHIsIHFlbXVfcmVhbF9ob3N0X3Bh
Z2Vfc2l6ZSk7DQo+ID4gKyAgICBuLT5vbGRfYWRkciA9IE5VTEw7DQo+ID4gK30NCj4gPiArDQo+
ID4gK3N0YXRpYyB2b2lkIHZob3N0X3VzZXJfaG9zdF9ub3RpZmllcl9yZW1vdmUoVmhvc3RVc2Vy
U3RhdGUgKnVzZXIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgVmlydElPRGV2aWNlICp2ZGV2LCBpbnQgcXVldWVfaWR4KQ0KPiA+ICt7DQo+ID4gKyAg
ICBWaG9zdFVzZXJIb3N0Tm90aWZpZXIgKm4gPSAmdXNlci0+bm90aWZpZXJbcXVldWVfaWR4XTsN
Cj4gPiAgDQo+ID4gICAgICBpZiAobi0+YWRkcikgew0KPiA+IC0gICAgICAgIHZpcnRpb19xdWV1
ZV9zZXRfaG9zdF9ub3RpZmllcl9tcih2ZGV2LCBxdWV1ZV9pZHgsICZuLT5tciwgZmFsc2UpOw0K
PiA+ICsgICAgICAgIGlmICh2ZGV2KSB7DQo+ID4gKyAgICAgICAgICAgIHZpcnRpb19xdWV1ZV9z
ZXRfaG9zdF9ub3RpZmllcl9tcih2ZGV2LCBxdWV1ZV9pZHgsICZuLT5tciwgZmFsc2UpOw0KPiA+
ICsgICAgICAgIH0NCj4gPiArICAgICAgICBhc3NlcnQobi0+YWRkcik7DQo+ID4gKyAgICAgICAg
YXNzZXJ0KCFuLT5vbGRfYWRkcik7DQo+ID4gKyAgICAgICAgbi0+b2xkX2FkZHIgPSBuLT5hZGRy
Ow0KPiA+ICsgICAgICAgIG4tPmFkZHIgPSBOVUxMOw0KPiA+ICsgICAgICAgIGNhbGxfcmN1KG4s
IHZob3N0X3VzZXJfaG9zdF9ub3RpZmllcl9mcmVlLCByY3UpOw0KPiA+ICAgICAgfQ0KPiA+ICB9
DQo+ID4gIA0KPiA+IEBAIC0xMTkwLDggKzEyMDMsOSBAQCBzdGF0aWMgaW50IHZob3N0X3VzZXJf
Z2V0X3ZyaW5nX2Jhc2Uoc3RydWN0IHZob3N0X2RldiAqZGV2LA0KPiA+ICAgICAgICAgIC5wYXls
b2FkLnN0YXRlID0gKnJpbmcsDQo+ID4gICAgICAgICAgLmhkci5zaXplID0gc2l6ZW9mKG1zZy5w
YXlsb2FkLnN0YXRlKSwNCj4gPiAgICAgIH07DQo+ID4gKyAgICBzdHJ1Y3Qgdmhvc3RfdXNlciAq
dSA9IGRldi0+b3BhcXVlOw0KPiA+ICANCj4gPiAtICAgIHZob3N0X3VzZXJfaG9zdF9ub3RpZmll
cl9yZW1vdmUoZGV2LCByaW5nLT5pbmRleCk7DQo+ID4gKyAgICB2aG9zdF91c2VyX2hvc3Rfbm90
aWZpZXJfcmVtb3ZlKHUtPnVzZXIsIGRldi0+dmRldiwgcmluZy0+aW5kZXgpOw0KPiA+ICANCj4g
PiAgICAgIGlmICh2aG9zdF91c2VyX3dyaXRlKGRldiwgJm1zZywgTlVMTCwgMCkgPCAwKSB7DQo+
ID4gICAgICAgICAgcmV0dXJuIC0xOw0KPiA+IEBAIC0xNDg2LDEyICsxNTAwLDcgQEAgc3RhdGlj
IGludCB2aG9zdF91c2VyX3NsYXZlX2hhbmRsZV92cmluZ19ob3N0X25vdGlmaWVyKHN0cnVjdCB2
aG9zdF9kZXYgKmRldiwNCj4gPiAgDQo+ID4gICAgICBuID0gJnVzZXItPm5vdGlmaWVyW3F1ZXVl
X2lkeF07DQo+ID4gIA0KPiA+IC0gICAgaWYgKG4tPmFkZHIpIHsNCj4gPiAtICAgICAgICB2aXJ0
aW9fcXVldWVfc2V0X2hvc3Rfbm90aWZpZXJfbXIodmRldiwgcXVldWVfaWR4LCAmbi0+bXIsIGZh
bHNlKTsNCj4gPiAtICAgICAgICBvYmplY3RfdW5wYXJlbnQoT0JKRUNUKCZuLT5tcikpOw0KPiA+
IC0gICAgICAgIG11bm1hcChuLT5hZGRyLCBwYWdlX3NpemUpOw0KPiA+IC0gICAgICAgIG4tPmFk
ZHIgPSBOVUxMOw0KPiA+IC0gICAgfQ0KPiA+ICsgICAgdmhvc3RfdXNlcl9ob3N0X25vdGlmaWVy
X3JlbW92ZSh1c2VyLCB2ZGV2LCBxdWV1ZV9pZHgpOw0KPiA+ICANCj4gPiAgICAgIGlmIChhcmVh
LT51NjQgJiBWSE9TVF9VU0VSX1ZSSU5HX05PRkRfTUFTSykgew0KPiA+ICAgICAgICAgIHJldHVy
biAwOw0KPiA+IEBAIC0xNTEwLDkgKzE1MTksMTIgQEAgc3RhdGljIGludCB2aG9zdF91c2VyX3Ns
YXZlX2hhbmRsZV92cmluZ19ob3N0X25vdGlmaWVyKHN0cnVjdCB2aG9zdF9kZXYgKmRldiwNCj4g
PiAgDQo+ID4gICAgICBuYW1lID0gZ19zdHJkdXBfcHJpbnRmKCJ2aG9zdC11c2VyL2hvc3Qtbm90
aWZpZXJAJXAgbW1hcHNbJWRdIiwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXNl
ciwgcXVldWVfaWR4KTsNCj4gPiAtICAgIGlmICghbi0+bXIucmFtKSAvKiBEb24ndCBpbml0IGFn
YWluIGFmdGVyIHN1c3BlbmQuICovDQo+ID4gKyAgICBpZiAoIW4tPm1yLnJhbSkgeyAvKiBEb24n
dCBpbml0IGFnYWluIGFmdGVyIHN1c3BlbmQuICovDQo+ID4gICAgICAgICAgbWVtb3J5X3JlZ2lv
bl9pbml0X3JhbV9kZXZpY2VfcHRyKCZuLT5tciwgT0JKRUNUKHZkZXYpLCBuYW1lLA0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlX3NpemUsIGFkZHIp
Ow0KPiA+ICsgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICBuLT5tci5yYW1fYmxvY2stPmhvc3Qg
PSBhZGRyOw0KPiA+ICsgICAgfQ0KPiA+ICAgICAgZ19mcmVlKG5hbWUpOw0KPiA+ICANCj4gPiAg
ICAgIGlmICh2aXJ0aW9fcXVldWVfc2V0X2hvc3Rfbm90aWZpZXJfbXIodmRldiwgcXVldWVfaWR4
LCAmbi0+bXIsIHRydWUpKSB7DQo+ID4gQEAgLTI0NjAsMTcgKzI0NzIsMTcgQEAgYm9vbCB2aG9z
dF91c2VyX2luaXQoVmhvc3RVc2VyU3RhdGUgKnVzZXIsIENoYXJCYWNrZW5kICpjaHIsIEVycm9y
ICoqZXJycCkNCj4gPiAgdm9pZCB2aG9zdF91c2VyX2NsZWFudXAoVmhvc3RVc2VyU3RhdGUgKnVz
ZXIpDQo+ID4gIHsNCj4gPiAgICAgIGludCBpOw0KPiA+ICsgICAgVmhvc3RVc2VySG9zdE5vdGlm
aWVyICpuOw0KPiA+ICANCj4gPiAgICAgIGlmICghdXNlci0+Y2hyKSB7DQo+ID4gICAgICAgICAg
cmV0dXJuOw0KPiA+ICAgICAgfQ0KPiA+ICAgICAgbWVtb3J5X3JlZ2lvbl90cmFuc2FjdGlvbl9i
ZWdpbigpOw0KPiA+ICAgICAgZm9yIChpID0gMDsgaSA8IFZJUlRJT19RVUVVRV9NQVg7IGkrKykg
ew0KPiA+IC0gICAgICAgIGlmICh1c2VyLT5ub3RpZmllcltpXS5hZGRyKSB7DQo+ID4gLSAgICAg
ICAgICAgIG9iamVjdF91bnBhcmVudChPQkpFQ1QoJnVzZXItPm5vdGlmaWVyW2ldLm1yKSk7DQo+
ID4gLSAgICAgICAgICAgIG11bm1hcCh1c2VyLT5ub3RpZmllcltpXS5hZGRyLCBxZW11X3JlYWxf
aG9zdF9wYWdlX3NpemUpOw0KPiA+IC0gICAgICAgICAgICB1c2VyLT5ub3RpZmllcltpXS5hZGRy
ID0gTlVMTDsNCj4gPiAtICAgICAgICB9DQo+ID4gKyAgICAgICAgbiA9ICZ1c2VyLT5ub3RpZmll
cltpXTsNCj4gPiArICAgICAgICBhc3NlcnQoIW4tPmFkZHIpOw0KPiANCj4gSSdtIHByZXR0eSBj
b25mdXNlZCBhcyB0byB3aHkgdGhpcyBhc3NlcnQgaG9sZHMuDQo+IEFkZCBhIGNvbW1lbnQ/DQoN
ClNlZW1zIG5vdGlmaWVycyBhcmUgcmVtb3ZlZCBieSB2aG9zdF91c2VyX2dldF92cmluZ19iYXNl
KCksIEkgdXNlZCB0aGlzDQphc3NlcnQgdG8gY2F0Y2ggZXhjZXB0aW9uLiBXaWxsIHJlbW92ZSBp
dC4NCg0KPiANCj4gPiArICAgICAgICB2aG9zdF91c2VyX2hvc3Rfbm90aWZpZXJfcmVtb3ZlKHVz
ZXIsIE5VTEwsIGkpOw0KPiA+ICsgICAgICAgIG9iamVjdF91bnBhcmVudChPQkpFQ1QoJm4tPm1y
KSk7DQo+ID4gICAgICB9DQo+ID4gICAgICBtZW1vcnlfcmVnaW9uX3RyYW5zYWN0aW9uX2NvbW1p
dCgpOw0KPiA+ICAgICAgdXNlci0+Y2hyID0gTlVMTDsNCj4gDQo+IEknbSBhbHNvIGNvbmZ1c2Vk
IG9uIHdoeSB3ZSBjYW4gZG8gdW5wYXJlbnQgZm9yIG5vdGlmaWVycyB3aGljaCBoYXZlDQo+IG5l
dmVyIGJlZW4gc2V0IHVwLiBXb24ndCBuLT5tciBiZSBpbnZhbGlkIHRoZW4/DQoNClRoZXJlIGlz
IGEgcGFyZW50IGNoZWNrIGluIG9iamVjdF91bnBhcmVudCgpLg0KDQo+IA0KPiANCj4gPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9ody92aXJ0aW8vdmhvc3QtdXNlci5oIGIvaW5jbHVkZS9ody92aXJ0
aW8vdmhvc3QtdXNlci5oDQo+ID4gaW5kZXggZjYwMTJiMjA3OC4uMDNhYTIyZDQ1MCAxMDA2NDQN
Cj4gPiAtLS0gYS9pbmNsdWRlL2h3L3ZpcnRpby92aG9zdC11c2VyLmgNCj4gPiArKysgYi9pbmNs
dWRlL2h3L3ZpcnRpby92aG9zdC11c2VyLmgNCj4gPiBAQCAtMTIsOCArMTIsMTAgQEANCj4gPiAg
I2luY2x1ZGUgImh3L3ZpcnRpby92aXJ0aW8uaCINCj4gPiAgDQo+ID4gIHR5cGVkZWYgc3RydWN0
IFZob3N0VXNlckhvc3ROb3RpZmllciB7DQo+ID4gKyAgICBzdHJ1Y3QgcmN1X2hlYWQgcmN1Ow0K
PiA+ICAgICAgTWVtb3J5UmVnaW9uIG1yOw0KPiA+ICAgICAgdm9pZCAqYWRkcjsNCj4gPiArICAg
IHZvaWQgKm9sZF9hZGRyOw0KPiANCj4gVGhhdCdzIG5vdCBhIHZlcnkgY2xlYXIgbmFtZS4gSXMg
dGhpcyBsaXRlcmFsbHkganVzdA0KPiAiYWRkcmVzcyBmb3IgdGhlIHJjdSBjYWxsYmFjayB0byB1
bm1hcCI/DQo+IE1heWJlIHVubWFwX2FkZHIgdGhlbj8NCg0KTEdUTSwgdGhhbmtzIQ0KDQoNCj4g
DQo+ID4gIH0gVmhvc3RVc2VySG9zdE5vdGlmaWVyOw0KPiA+ICANCj4gPiAgdHlwZWRlZiBzdHJ1
Y3QgVmhvc3RVc2VyU3RhdGUgew0KPiA+IC0tIA0KPiA+IDIuMzMuMA0KPiANCg0K

