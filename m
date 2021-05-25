Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F6738FDA6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 11:20:54 +0200 (CEST)
Received: from localhost ([::1]:60076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llTF4-0007IJ-BN
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 05:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llTDe-0006RH-5h; Tue, 25 May 2021 05:19:22 -0400
Received: from mail-eopbgr00121.outbound.protection.outlook.com
 ([40.107.0.121]:6030 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llTDb-0007e8-6J; Tue, 25 May 2021 05:19:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBswWvNZk226pSv0nkuNrVcniuT9tAOQYMkX1SONpuS9xiCcpBlzWKDWf0DP/ndLwIYZw8SKogyUMg2/QehDeuf4BlT8DN/bom4psSaUPA0LTpvGU5wUdqqHgQxRuEfAZOeOlpMwcYufEWgvwJ0yftgKyVb1epS5IEyt5PNtTqbL46H9pVDIsi+7y7z5FedaVMXm1ylM4bWtq2+7+8BiDKFjevR2QCvP90BBV0VBTxNxzf0p+JlcvPH9ekXvZwP/x6tXrSC+ttrHFEstk9QRT24o5lLnllNQxS7wVqN5TqHRSYMvOqhNcrn1Fquy/ippwlgjx9OuWwUwCqMS/u0MEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMJmcp4ftvdjqNIvSIb7KchZXAQABaxUJJlvvaKhFtQ=;
 b=iLKVkKS5i62DGKaMZb6MA1IuI1cEKwK4zezaeovaIs8rnfJHhlPnegk7qHLt9C0UwGuKMtqZzenuy82Jkc0i5dCJorjWxfb2eD3Tj6r25XzyaKvkSgiBhxM5gfQt+EP7J+z6lpjWnHxJq1EYZkKAyqag8Php6UsnYYdUF8cgbCGqDxhzUDIx0G/6D/EKnsrRiBUA4hdYpfsKiNXnXYxbZW1I4K4Dwisaccj7AegRSugOmKsTIcacqxRdSmx6ZOdlQcKuy5LwEiaNaPK0MVbdZrOChJGXyWHtiD//Z0seMobVKalEIfZ24bGbeV8DJNA0LmqSf1uuhQB1RvUrqz+aNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMJmcp4ftvdjqNIvSIb7KchZXAQABaxUJJlvvaKhFtQ=;
 b=T32zZwMVkPj2dKoW0WxR2ebHZPKT4oMFPNdNesXdzfELzOPFUqK/LNrqE0q8IVUgPITpupOINAuxqnOm2DLoReuP0H+GmeAj4hC0kPZQvmkp4lCTPsfxPUoa0F+ByXD7xKEvOI9nDhD7ZhX5iAyGDOBciVm4EbrrD/aTOSF/bAU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1908.eurprd08.prod.outlook.com (2603:10a6:203:4b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Tue, 25 May
 2021 09:19:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 09:19:14 +0000
Subject: Re: RFC: Qemu backup interface plans
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 yur@virtuozzo.com, Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>
References: <ad71ced7-d0f6-5d99-4678-7d0e2d3e2561@virtuozzo.com>
 <eba2f2c5-a867-91bc-64ab-08dcd67a295d@redhat.com>
 <e3853894-ec71-bdd4-adea-b61fceee4ba5@virtuozzo.com>
 <60dd7a7a-3838-8d11-66f4-2cbd08fbf575@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <998c92cc-2d32-cd96-9fa4-9abff189e7a0@virtuozzo.com>
Date: Tue, 25 May 2021 12:19:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <60dd7a7a-3838-8d11-66f4-2cbd08fbf575@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: AM3PR07CA0066.eurprd07.prod.outlook.com
 (2603:10a6:207:4::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 AM3PR07CA0066.eurprd07.prod.outlook.com (2603:10a6:207:4::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Tue, 25 May 2021 09:19:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dc064cd-a5d4-4309-e8ee-08d91f5e29f9
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1908:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB190827AA439A9D73EF892ACBC1259@AM5PR0801MB1908.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: svpGgq+l7WaR8ZTxb/LPCM+h37Y/InDTTP0Jg+1LNmhLfw/CFvehU1YRwrN7IjXz91GEzUDXQxbj79Kpa095LZSb4jWonQ7x1DaD4v/qOAY3gYmkn4L3n2GnpkhFD+EihZHHvtBIDIUKWucr7YM505pxUNZZ0ogqCt1Z4qgIC17jNatvvWmZBO8KoUUYsMkvwVt/OA4jOwUtq3QPV+fuoiUQDVYwv7NQe4YWZxDmKp8vl/rpWGlR6Q5D01iro1BGA5Af118JXCkcjVX49FfuiI2jG5xfm9lsRGoJ/K8ZIT/Ygt1wCMjTYS0jZMiYCRGMCWaaMKItFyW0L6p0BvSJpPvr890ckAlotNNDiGJ/Gnn/XaU3RgOL/SVjwkc3EMxZW6t0IHw4PetziGNMO50kOGCvz23bp/8BwmZ5n72y49d1fIyvnqF3tHnrwaO5V1QKpfcaYaDQDft8DRAtcrE0gEj5A8LKR7funriQ6H+nQQjsO6EKlFMFsc/3SfHokKpqj8H+M7T2lSF0R7CS8uuBFohONA15BlYEUhLG8SLLSq9guhUgsN1yrlsohPDMbgdinSrQs7rbjLu4TPvXxFfazESfimgK22HYwzZbKJOyh5Y+jm97mkWs8YYP5Zr3i9Qda69zocgz4uHTjpQSXtN6kCemSG+8qritiydTTvK46fCdIaEy1fGFgjq7jRANPXv3BYDptLAtjcJXC0tuZvTzx6cUH4cZNmOcRj08qEPGwwQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39840400004)(136003)(346002)(366004)(8676002)(6486002)(66476007)(36756003)(53546011)(31686004)(16526019)(66556008)(316002)(16576012)(66946007)(186003)(4326008)(478600001)(5660300002)(83380400001)(86362001)(26005)(956004)(52116002)(54906003)(2906002)(38100700002)(31696002)(2616005)(8936002)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c0hmTUd3aXd6Z0YrUzBxQnFKWk5PMWhNM2dObFlJOHBBTFRsNDdGQktUKzFN?=
 =?utf-8?B?VUR0RTMyODdOSk5LTVhZSDl0amdOL2V6bUg4R0JtMm5kOTloQ3VLRnJYMklE?=
 =?utf-8?B?ZzlJTW8wcVNPWGF2ZmNwam04aHJkWHV0NlJYRHhSY2VmVEhZQ1Y0TWtIeFdH?=
 =?utf-8?B?cUFyN1FRc1UzVzRxby9CREJDSm5DYlRuZjhTdXM0RUdSellMdllWbGMrZWVV?=
 =?utf-8?B?SkJCTXJMTHB2NzUxbHhpNlVOa1pWc3Z1R1R4OHZDZkhTeEZZN1dFK2pFMUpZ?=
 =?utf-8?B?TmpzeTJtc0x2QmkyQnhQUGk4TzBNZTFJY0ZNd09WMzArMGNpMmpFOURmeFpj?=
 =?utf-8?B?VTdPTUx4aEVnR2RLeHJYS0daZkMzclBOWGhFR01RR1hMcm1adnA5cVNjWWxF?=
 =?utf-8?B?RXlpaUJlWWRJbTQ3QmFYQlUwZjIybXd6VnFDYXY4ZzBhUjhmSXM0bjRycVdi?=
 =?utf-8?B?dStjMzZIeElZa2tYWXVkaFIxTkJSdHY1K3YxYjFXZERtSmxMYThIa2ZOTnIw?=
 =?utf-8?B?M3BwTTVGbEIyaUpZek1JdFROTUhlVm1JVjdycXJKbjVzUm9odld2WnhSMXVk?=
 =?utf-8?B?VHlKSVA2aCt4eU1wVEVoRXptdjZzazE4a0JQWk5UL0pJdWZWUWtDRk15NWFy?=
 =?utf-8?B?TmJ3ZUFLcHJUZ1NtUkRmd2dvTURhL3BFak80SDAwMWlFTjZoNHIvMklxTXNO?=
 =?utf-8?B?WmpzUW1oYkZqQm0yUk1iSmcybGNOcmV3RCt1ZnNpajc3d29MNmVWTGRsa090?=
 =?utf-8?B?VU1TQkhTQzR0bVhDYXlQWnhKSWhlZU8vRmxkRDVTOFVlU0grNjRxVTcrQTNj?=
 =?utf-8?B?VHBScHZaRENWVjFqWC9qMFppZzYrb01vNG9GLzFYSXgzbmFwbmM0RUhIMGRh?=
 =?utf-8?B?OVVISEQwTHpNWGpyaDIxOTBVYXpXL2F3Vzk5ZHFpQWJwY05WR3BYOElGZHh3?=
 =?utf-8?B?TUhPY1FPMWQ2cUxWVndyVDM0RnJtcVVqcHpFK0xzK2Z5K3prc01CZm9LaUQ5?=
 =?utf-8?B?NnhFZEQwQVFQZlRtQ2cwbnhTZC9YWWdxV2tmY0ZEWEdwUjVBQWhZU1hVM2dF?=
 =?utf-8?B?ek84NGFjUFE1Q2poYkZza081emNHbGY4dXNLRitlSUYzUktrZlB0R0hNUEFC?=
 =?utf-8?B?S2JXSHpVQ0QydTMrMEVOQnRmSHc3b2kvRGN3a2NpT1dKTnd5OTAyL0VXOTQx?=
 =?utf-8?B?TXpKN1VsMmVURGM5VkVIZm5BLzh1Vm1pY2xPYklhckdrUHQ1MDlxZldSY1Z6?=
 =?utf-8?B?NGU0b1JYTTNrbi9ZaU9sMU1ldk5YRDloekdQb01VYWFkZU15UFhKRTRPVmNv?=
 =?utf-8?B?UmpFc1RsTFE5MktCZ1FYV056RXlNRXByMlFNd3hVdHk4OWhkMVVSUnlWd1hl?=
 =?utf-8?B?ZVBNcGxKd1lOdW1RVENYVTAyWVV5am5vdDVGRjJpWVRSVWtNN1ZyelAxbjdL?=
 =?utf-8?B?czU0VEhZZUJlZkNkeG93VjhMSkRXUmhGNWNCMXg2YXpMUkFwRzZBUGhNMlVD?=
 =?utf-8?B?SmVZQy9wNHEzMjh1UFNwN1JONFUxdWtMelVxNHNKTmJyOE50SVk0ckNLVnlt?=
 =?utf-8?B?eXp6WHhWQVlpaE5QQXAvNCtaVFVuK0s3S3F3WWk4Q0lPNy9HU3hLSkFnZnUx?=
 =?utf-8?B?RHBVdzFWaDNJUmUvVGxjWUs5Mld1c0ZUUFlFNktJSG9SclNvOXNaczZCWVZo?=
 =?utf-8?B?c0dzUzNYMFU2c0hRVjh6RU5PRFpKMStYODVMNmdKTTlCVnN2aTJybWFHRHN1?=
 =?utf-8?Q?ZnmPt1HMyWFrXntGhDguyhrrsXRseUooDdmklVD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc064cd-a5d4-4309-e8ee-08d91f5e29f9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 09:19:14.2750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bD9qbiRVx2Oqs75XoMTxKNpuyGAL/nJrn8U4jl0+ss+wu1wOmq9uQ9TQQUMW7VKceIbEiIw1i5Kz/iQ9BVRVCuBPU12EUQGJc3fPAOuKf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1908
Received-SPF: pass client-ip=40.107.0.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

25.05.2021 11:50, Max Reitz wrote:
> On 19.05.21 08:11, Vladimir Sementsov-Ogievskiy wrote:
>> 18.05.2021 19:39, Max Reitz wrote:
> 
> [...]
> 
>>> On 17.05.21 14:07, Vladimir Sementsov-Ogievskiy wrote:
> 
> [...]
> 
>>>> Not also, that there is another benefit of such thing: we'll implement this callback in qcow2 driver, so that backup will read clusters not in guest cluster order, but in host cluster order, to read more sequentially, which should bring better performance on rotating disks.
>>>
>>> I’m not exactly sure how you envision this to work, but block_status also already gives you the host offset in *map.
>>>
>>
>> But block-status doesn't give a possibility to read sequentially. For this, user should call block-status several times until the whole disk covered, then sort the segments by host offset. I wonder, could it be implemented as some iterator, like
>>
>> read_iter = bdrv_get_sequential_read_iter(source)
>>
>> while (extents = bdrv_read_next(read_iter)):
>>    for ext in extents:
>>      start_writing_task(target, ext.offset, ext.bytes, ext.qiov)
>>
>> where bdrv_read_next will read guest data in host-cluster-sequence..
> 
> How would you implement this, though?

I don't know :) That's why I wrote "I wonder".. Anyway I have enough work with all previous steps.

> qcow2 doesn’t have a reverse mapping either, so it too would need to read all L2 table entries and sort them, wouldn’t it?
> 

Hmm, yes. With current qcow2, it seems to be the only way. And we'll be limited by memory, so probably, read several L2 tables, do sort, return sorted extents, read next bunch of L2 tables and so on.

And then, I agree, we can just implement with help of current block_status() implementation.

Or probably we can implement reverse mapping in qcow2 as extension. But I doubt that it worth the complexity.. Still, it depends on how much extra IO will it cost (almost nothing, as should work through qcow2 cache) and how much performance benefit will it bring (no idea, it should be measured).

-- 
Best regards,
Vladimir

