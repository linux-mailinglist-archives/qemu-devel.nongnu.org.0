Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120ED366759
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 10:54:43 +0200 (CEST)
Received: from localhost ([::1]:56250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ8d8-0005uF-6M
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 04:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZ8bl-0005Le-ON; Wed, 21 Apr 2021 04:53:17 -0400
Received: from mail-db8eur05on2113.outbound.protection.outlook.com
 ([40.107.20.113]:42785 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZ8bi-0005Yr-QM; Wed, 21 Apr 2021 04:53:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j87DtBgWmF4OVBKAfQC5ig/RytFNUf7PPJ/izxHkxemULQ3ZpH4RYZFK+Nt8Jna6RtrtYOslRjHYZYRStHFHxRleRLcx6ElAGQklfOI4FYidkxylCUFvO2/85QcxrEi55EdbmNxtf0se2ZKHNLaY8yiQKuXhcWNj8fjLq+ThSh9YL4eGPE8eHlaGkhsuisWFQS7XKAdbeiXl7InrjpMjwCKNw+8C+Ls6N4GD9tzuK4SLBgeHLGoM+7iQ6qTJhatThV2qZKGGb5MeAwvKto010UHTDUdgLmdfiDXbRGKwIuTRjCvP+B/pv40sorcaCS/ahcQtVJRmxads/FfG2+yRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OIlV4OOW58lRsqTLncqND1Hkj5PmuPQg2FGsiaJork=;
 b=LXfYrydqJtdcttsUqiQuvTdD0GKLCPgFrA0KA1hGAbsCYnJBb7bHrhrAalcu6aUK2nz7WpYiDCUolQ+xDUQKtjAfHs5c0gEnXbh76c8MtdlJ1/91Uj1RARXy1f4KlbpTqwc7T8SiDkvlTSnbpAl7we1uXkC2x55pK63y4UHQwWhrZhT7LQ5vFVUk1b46rG5pGet2UpGPYySmspnF914Od71gvJzjsXvGKvM+v5SGCVgegw5z7HKi1Rr8ZsmFNHUOaXTZvh5D1JrwgWybMAsBFQQVEaknWM8ewxu14JLe8mKzC4i/r/mGCwOsBqCvZTr+WGRH7E6s0TmWt9WHcFmsrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OIlV4OOW58lRsqTLncqND1Hkj5PmuPQg2FGsiaJork=;
 b=sj3sSIapahkrv2rjw8jVON55rnzNOBQkjEz1TT0HGvatJtJCHx1bBSidRyzunmgGI7YZv3MdLh/bjEWepODY7TSXbC9V0uAin15WDti4zN/lM/FCh4qj5qyOX/i9X6YnzZ1Hs81CM5cVqp2zaoGucFCZZruwBJlQLYwFXKfWySI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2099.eurprd08.prod.outlook.com (2603:10a6:203:4d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.21; Wed, 21 Apr
 2021 08:53:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Wed, 21 Apr 2021
 08:53:10 +0000
Subject: Re: [RFC PATCH 0/3] block-copy: lock tasks and calls list
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210420100416.30713-1-eesposit@redhat.com>
 <570d2007-fdb9-d90c-4ea9-32a6d1dd14dc@virtuozzo.com>
 <98773aac-c971-1451-3d12-aa14c0bd2d40@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <27d07471-76f0-5c3a-79f8-824663ec14a2@virtuozzo.com>
Date: Wed, 21 Apr 2021 11:53:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <98773aac-c971-1451-3d12-aa14c0bd2d40@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.7 via Frontend Transport; Wed, 21 Apr 2021 08:53:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d4a6a36-90ab-48f7-0f27-08d904a2e3f2
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2099:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2099E907BFE29FBC05952C2EC1479@AM5PR0801MB2099.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lXDLx2mfjyXQkbCqtWEhGrh4aNxmPJtq5e4i677scgPBOqLoe1w/02RdKS04wepwptbHvqHQWaphSs+PbdUQBmODHmNdkx7DVGdNstMf+w4L5Yo6G2RRZRvHAxxYvOAWSCByCyDH4cQCgq7J/URebi28ccroFuJ2aSIP5zI3F/mxEIWXwD4JnE3EgWeg1wZO3lNQUrZIbRcaM5Qbj35Ykt9ZGkf19FI900o/+UVySrkDJkRdu3gZXhjnsEQd89CTvLZN924Uogz2kJBFmf1ntAULIn4gAOS6JpLgpolOT//c3HLt4g/ehFrwuXX9b5NSXgETFL4oC/PzsEaNRABkWIrDEl4DDtTrVJ+suKP2ADUjPGFdjooKga83EeFbWWhaF1TLafpL7HLxYrHOUB8dYPaTNvlOpkI4LUs3goUKcULMWkRLZNxMD75XVE5z2lwFwu431rDzE4qNVGLR0AeBmCua91ekPvBWtImNTnkgNqBWzXL++GX+Tf8jK6+WopMeeZAK5AcZl8ntLkTmaWCxK2SIr8zAc6aGN8XAtwiaQC/kCvCxhHhCecMtidAk0ysu1U5hUsmh+yd10GWs/8FZBsgJ+nVSH/rX5YARPTfY6q9YLLY9QJ+jy/uvIgvOCQaa8YjeopHdWBF00DziReFE58pHVWDBSgb71m/LgdiqhQ3gLoEHJKaJkSb1/ehl2curEtkIEcQOH5alFTRubFfC/MWql5djjk/EFMSIe9Um+pU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(366004)(136003)(346002)(376002)(16526019)(110136005)(186003)(6486002)(38100700002)(86362001)(16576012)(52116002)(36756003)(66476007)(8936002)(66946007)(316002)(26005)(4326008)(31696002)(956004)(66556008)(5660300002)(8676002)(31686004)(38350700002)(53546011)(2616005)(478600001)(2906002)(54906003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cGRCaHZoTmVZV0d5cy93Rkw0SnovQTg3M3VyUEhLSVh5c1RReEJQM2x0RlAz?=
 =?utf-8?B?YVJkdDNmeDRueHdRUEJlYm9UeElRU0YxelpQZXZLcjI3TWw2V0t6QkNEMFd1?=
 =?utf-8?B?QnJWcGNFYTBZQXZ3bE5QbTBtQ1hWNDdrMUtFOHVQNXl3Zmc5VExZK1VTaUtX?=
 =?utf-8?B?YXkyWjNPNXdKKzBURnBTT1NwQ3FNSkxUSEhDMHdHRGMwSEZnSWYwWG1peGVB?=
 =?utf-8?B?c1Q5YUVvb0QvY0R3Q04vWUlWSU56OVZBYitPMlVVNXRkTjZnd1QzYWd3bWVC?=
 =?utf-8?B?ck1INUo1eVg5eTdXMEpVNFFjOUZOK0RQckM3cUJQLzVoSVhmbG4vRUhHbXZJ?=
 =?utf-8?B?UWRhaEZjdmpveW5lOHlOelZyOGI0UFIwZGJTa1dUTmV3azR4MXFKL2d5cmxu?=
 =?utf-8?B?eWIyYzBpeVNsQVJGVDdFMEdSYy9qdDJNaFY0QUhRTXVmNXc2UGhsOGJSL2RF?=
 =?utf-8?B?R0VodWluaFQ4VEJ2TVplek1kM2RBNVVFWHgza2lJV0tYcFdLTFYzSGovWWhZ?=
 =?utf-8?B?VEFvT3N1bkVaWDVnZjBqMXQ5WEVPNGZsOE5aeWhtdHYwbmVEZjRzQUgrb29Y?=
 =?utf-8?B?aVFYYVpBNWxJd1NaTDY1Y2dKbm5aZitJZ1dFZ3hKT09YQktEK2I4Q2NTbHBv?=
 =?utf-8?B?SDYydENoMWF6ZTFtN1hmMnV0OUV5UW5PSTVHeS9SUlNVMEtBdzVKNFhTQ1k1?=
 =?utf-8?B?c0g2MEV2SDR6YmxIcHUydXl2TUUwZldZaTRSelZ3L3B5Vzd5TmMvLzRCdXhM?=
 =?utf-8?B?ZkczampIbEYvODZ5cVlNNm5mNTJ5bHpQVjBEUzRkV01sK1FPdnA2aG0yU2wv?=
 =?utf-8?B?Sy9QQTJpVk0rM0hZT09MNC95YXJKSHZxTXRzQUluVkNCM05LZ2N0YTFPYS8y?=
 =?utf-8?B?QmtGdkp5R0p5RDN5QzNRTkdobENGZElzU1NoaVFCa3A4TVdGMzgyT0xXcENj?=
 =?utf-8?B?M0plbDkrc0p1TkFtWTV1LzZTY0JxOHZYUGkyU3dXWGozdVRRWmNvT3RsTnU1?=
 =?utf-8?B?d3ZYM3ptaXdxWDF6NmZwNkh2bWF6S29lZjk2MVFkSXJCQUliVlNyc0NLYnM2?=
 =?utf-8?B?RWtTaDBwSGNUdm1qSSt0K2dYZ2dWSzl2OGRUQVNubnJuK3JReVJtQUdncW1o?=
 =?utf-8?B?bko5Q3lnbkZhaklxNkhOSFFyeU15Y3Zobms1S3FtR0NORUF3MWJ2cEk3VjFI?=
 =?utf-8?B?QXk0QlJBMWM4SW54NHZ0M2lTdjBVSjZLUVVQY0NadlBTZ0VvQ0RyWHgwMC94?=
 =?utf-8?B?Qlp1TXkrV1l4YkJlMHdrVnNvOGNsQTRCQkd0UG1EdUhaU3RIKzZmKzF6TWVu?=
 =?utf-8?B?R1NMdmZ4NVBzMENtblhYajN4NytpeGtHb05jSFNOcmViMFZoVzg0Y0VJVGls?=
 =?utf-8?B?ZHZBQ2Y3RkdIdlFneWxiT0JueVJVcnpySktMMGFGZ2hvV0ZNTWlUYi9LK2sw?=
 =?utf-8?B?Sm1YVzZFL2FLTnlaZDhHb2tHRkFjd1VEeWRKVHFOdHJHVWs3MHVIOVZXSDFp?=
 =?utf-8?B?WFRyRmFSbnlWMnBwTFdxMmtzK1lPbzhNMjMvRmswQ3BPMnZKelFBY3M0bW1W?=
 =?utf-8?B?aGlyQ0ZsaW16cHkrQWUzTUgwWlhlZTdWV1ZrbE11dDNiemdYWlo5RTk2NWFk?=
 =?utf-8?B?OXNtL3NBS3RLbnRHeW1nOXpQZ2p4N2pOWWlTSEFwc1huaGdGYUJBcWlqeWJI?=
 =?utf-8?B?WUk5L3NiS2ZsUVNPOHBHU3k3MDFMNzhRTFpGTC9JaXlyVFpOcXVTQi9UVGUv?=
 =?utf-8?Q?mefHdq6safA48h9FbiRl6mM6+hKksCgqEW/gbR+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4a6a36-90ab-48f7-0f27-08d904a2e3f2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 08:53:10.7699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMTlGJ+vz6ngEBNft6z+/hpCouG/RXIPPwwEl5dAhbO0a5LaCrF1oZogBafjOlbaZQ1aojbDkRVutdGpqwg5jmhTrFXF0HwWRN3HDHzJNB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2099
Received-SPF: pass client-ip=40.107.20.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.04.2021 11:38, Paolo Bonzini wrote:
> On 20/04/21 15:12, Vladimir Sementsov-Ogievskiy wrote:
>> 20.04.2021 13:04, Emanuele Giuseppe Esposito wrote:
>>> This serie of patches continues Paolo's series on making the
>>> block layer thread safe. Add a CoMutex lock for both tasks and
>>> calls list present in block/block-copy.c
>>>
>>
>> I think, we need more information about what kind of thread-safety we want. Should the whole interface of block-copy be thread safe? Or only part of it? What is going to be shared between different threads? Which functions will be called concurrently from different threads? This should be documented in include/block/block-copy.h.
> 
> I guess all of it.  So more state fields should be identified in BlockCopyState, especially in_flight_bytes.  ProgressMeter and SharedResource should be made thread-safe on their own, just like the patch I posted for RateLimit.
> 
>> What I see here, is that some things are protected by mutex.. Some things not. What became thread-safe?
>>
>> For example, in block_copy_dirty_clusters(), we modify task fields without any mutex held:
>>
>>   block_copy_task_shrink doesn't take mutex.
>>   task->zeroes is set without mutex as well
> 
> Agreed, these are bugs in the series.
> 
>> Still all these accesses are done when task is already added to the list.
>>
>> Looping in block_copy_common() is not thread safe as well.
> 
> That one should be mostly safe, because only one coroutine ever writes to all fields except cancelled.  cancelled should be accessed with qatomic_read/qatomic_set, but there's also the problem that coroutine sleep/wake APIs are hard to use in a thread-safe manner (which affects block_copy_kick).  This is a different topic and it is something I'm working on,
> 
>> You also forget to protect QLIST_REMOVE() call in block_copy_task_end()..
>>
>> Next, block-copy uses co-shared-resource API, which is not thread-safe (as it is directly noted in include/qemu/co-shared-resource.h).
>>
>> Same thing is block/aio_task API, which is not thread-safe too.
>>
>> So, we should bring thread-safety first to these smaller helper APIs.
> 
> Good point.  Emanuele, can you work on ProgressMeter and SharedResource? AioTaskPool can also be converted to just use CoQueue instead of manually waking up coroutines.
> 

That would be great.

I have one more question in mind:

Is it effective to use CoMutex here? We are protecting only some fast manipulations with data, not io path or something like that. Will simple QemuMutex work better? Even if CoMutex doesn't have any overhead, I don't think than if thread A wants to modify task list, but mutex is held by thread B (for similar thing), there is a reason for thread A to yield and do some other things: it can just wait several moments on mutex while B is modifying task list..

-- 
Best regards,
Vladimir

