Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3D6413A93
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 21:14:14 +0200 (CEST)
Received: from localhost ([::1]:33468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSlDY-0000hv-Tn
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 15:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSlBd-0007Vu-7K; Tue, 21 Sep 2021 15:12:13 -0400
Received: from mail-eopbgr140111.outbound.protection.outlook.com
 ([40.107.14.111]:13140 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSlBZ-0002HQ-Vc; Tue, 21 Sep 2021 15:12:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zt3FKAbq7d+XAT3PfMiy2HIrOk2dfVHeksXtYyZdnwo0SBBSwVAlc3QHoGBfhqK0fiZsovhh3oDhnZOxPoSdr+jir0ZKRKZ1aFaBFPSEhByj9+dcrZ8x+5m4hnQyMiDYewQI/ApLehZ4qVldY55V/RzMs3ZTE73g/sHVUMIrciKVTtdUZGYXHNX1+1LxPEULXVnW1Alt16J+AcvlxaLDEZFc2dSFnyPm9GtuZH65EGHmjU0jy3dOBzVfwevjlhv+bClh8DFVDqmoVtmBiI4ceIR6tx8q6PUvPyffhHlIY4UkHKGL/I+L+9Fe2rKUMHjWyzwX/EwUeovoT6kgIWmupA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=97PUxs/ygy2XEcRfEMg/x0VpT+LLzZL6oL7qNPBglNQ=;
 b=bJQJj7O0jBSflptQb3BHRjcy3prli9jWQkAkZAKkmWOaiiGHjSK3G/Yd9+hmSjjTJ0h6NTz6C5TItH7izqKjY3j5KQ96VFYbT6hXEktNyrwTuPGoUcQMIYannf2UuFlBKZvcnOdSIRNZKFb3e/EikghR+sjfAzkRNr225u5rTBdwqEy8CsvLXev9fnsnYNPapvY19tdZqoJ5qPwS5L8tGQ+Fvr/cKUs+0krI9sBT41dzkkMi7npewq/qb6OKRDOIRPFOEj58t3wcZLHZJ9d8nY0FlOMhFPu9QKgrmFlrameb+NkwnZiq9/X9gdWSNzrITrBcv75ILZKa1jnyC+DvpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97PUxs/ygy2XEcRfEMg/x0VpT+LLzZL6oL7qNPBglNQ=;
 b=m9xt4zlCBzhiWWqPlt4j+5LFKm1g5+ucArlPquhGMW/4h4PoT2rq2Nrz7wPAODwRdGmmnfKia4OxKrS5H0JqwXErW0iUPer3IVxaolNnsEuYMaEKFyCTlJnrerOE08y4gbkOUn65vMd2xkryklOMLjJZMemW4WNRVtZsuEmBTkQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 19:12:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 19:12:05 +0000
Subject: Re: [PATCH] nbd/client: Request larger block status by default
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, hreitz@redhat.com,
 Kevin Wolf <kwolf@redhat.com>
References: <20210921161703.2682802-1-eblake@redhat.com>
 <5b9402dd-4c37-2fc6-7c65-a13c4c5e6383@virtuozzo.com>
 <20210921180843.6tfubsqvf56hkyro@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <95d19c17-1541-4a34-fe3c-6a085255a586@virtuozzo.com>
Date: Tue, 21 Sep 2021 22:12:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210921180843.6tfubsqvf56hkyro@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0266.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR0P264CA0266.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 21 Sep 2021 19:12:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64a5b993-83a8-4420-a31d-08d97d33b2e2
X-MS-TrafficTypeDiagnostic: AM7PR08MB5336:
X-Microsoft-Antispam-PRVS: <AM7PR08MB533660CA224BD0B1AC555D33C1A19@AM7PR08MB5336.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXpNobqPOpWrpgFSy33cfBsx28GI6U6c8VEEZdRvNpjEkyvmkelHoUFSmKPULhvIV4q2GnR9x9tDxwQIECjEhlyLQ5lxr/azKgCfr3S6jQ2/Sx3fXn5fBjjTG5y6+icgvq2zfhCW2vo39YIgX2UY5NcfZozLEu3uhCpEZZau+PomClaxqtyf7/R/ZjhhUHBhRjWw5P5NoQpdh/UkdtmwepK1G08hqQ2TLdXilCQ3Ye9lCH6g/8V5Q5UDLp7DIsCRs/LqGKOM3Vg/j4OYZxCM8Qmc/GmW42Ktys6E7x0HfcfJI9OcY7D9JHIKkOBDh57AxvFcn9CuMWYpp7pAl4s4bzPE8ocvI3sDDPNpA6XzkfZcKYxgw8FYQDtHhypF79EvsXrjaXXzwdC25m9qn6X77N1d0RNAreXTN7I9uhu6osaIT2+FEg88OBeVJasqzcHuBxm8dDY5KTL0I4ah4dCDmA054DD3duzXUzOsVRSLK1Gr7UTSp0xmOyPnLFNpbDbrRGQSlp+qvEiaylGcTC4S9uAfH4X0ovegcdITv2eTcg7g3FT3Eh6+q/RQ3mOHBra0ZL4mXRWmvWSpRnyswhlF2yFkMFniKuu3ElybRDdXI4BjP8sz5AeZDUwjt4hB/qE9zasQgBWi/HDJV0I/xPDcgHREm4yw8BYst683JN/SPFJiWAjHjCjke3ev9OAtttzbXGLkSfBIk9a4GmyN6KPlERGgsk31doGUWGtDAEI8UsBQcumiZu59CzPKw7Sv2MeJrZsSmRnRCpRhF0raVoRHJsGBMyuhG3+/MjxuTcBWZPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(6486002)(38100700002)(38350700002)(316002)(6916009)(16576012)(186003)(2906002)(26005)(66946007)(956004)(66476007)(8936002)(66556008)(2616005)(8676002)(4326008)(31696002)(508600001)(52116002)(83380400001)(86362001)(36756003)(31686004)(2304002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnBLOXZucGN1c1p6TitlQ25yckZEV3ltSVlwS0kraURkWkNCK2l2dHlYS2Vu?=
 =?utf-8?B?MndpSE9nb2oyMXpCUDd2YUNyODlORHlHY2JnaWxwQWlnWGx0WWJUNTlNbXo1?=
 =?utf-8?B?V0t5VjdOaG5yUzNUZ3ZuQ1F6YUtkeWZLTHZwbUU0d0d6OWNIT092OU1ndjd1?=
 =?utf-8?B?NzFUL20zODVVTVp3UWVTK2w5c1lxN2dMdkJsUnZUdmhTUU9iaTRuSEh2d1Rk?=
 =?utf-8?B?aG1xYU82RDByOGtENFkxS2xnT2lucVcwancyVm4wVVlnRGhxNWhQOENzU1Zy?=
 =?utf-8?B?VktoNWJJMXdCMCtveUFGaTZJYlhsL1NIOEsyN2ZLVzV3UnEvVUtHTVN0R2JQ?=
 =?utf-8?B?MFZIeEpla0N6RjZhQk1vciszSWhMVFFleEI2Umc5cW55Nk5Od0JYclVxRW1J?=
 =?utf-8?B?S1hHMnlXT0xmVzNVMi9LaWlsNFZDVDJzYWY4M2drb1BKTi9Hay9KSkRqSUZL?=
 =?utf-8?B?eHNkQzhxYnByWUdOS2ViSUtMODljd0tpcW0zOC9XeVRmTjRXemVRQVI3UDBy?=
 =?utf-8?B?UWpWMDNFRDAzRTBIQzVlRE1VSUpRREd2VS9HWkxCblJCR1hDZDVFUnhBa3FN?=
 =?utf-8?B?RGpPNUZ4eDZpQTVvczk1Y2M2bVhPejVRSzh0N0lqWGtVYWFkWEpyS045UTkr?=
 =?utf-8?B?L0R3ODdZdTVuamhpZGJyNUJML1VaR0paa2VjWGdxUUw2dTIzNUdPTngxQm5V?=
 =?utf-8?B?WWswUGcwUlViWWowSjZSMDlqc3NuWXc3Y1ZJenhyeWM4SmQyL1FNVjNBZ1h5?=
 =?utf-8?B?eGxSR3Rza09iS09ZMk5xdDNsampvUzA4azlMbE9nSWhLZTV4cFBRSnRmZFpK?=
 =?utf-8?B?bkxaUzZURHpKRCsxbmJRSXZNRjdDZnpYSmlPMGw5ZW8ydkh5cVJNcGJWTmV0?=
 =?utf-8?B?ckNsUFFRcjdwcFQ4bHdpUXJkN0tNUURIeDl6aFRiZEE3NWF3ekhsVTh2N3Zs?=
 =?utf-8?B?TkxxR1IxTWw1SldWT0dLM3dBcmNzUlFyVVdzWEpQYUM1SytMUm43MG50UW0x?=
 =?utf-8?B?WnQxRkY1QTNEbXByejVkSTRvVFltMXZGTU1ER2lSZzVlWVdvTEU5UVpZZTVq?=
 =?utf-8?B?VkQ3Y1lXbldqbTRDSmJJTFdwR01TbHZGVitTdWY5WkdnVkdkZFhpd3FhYlBX?=
 =?utf-8?B?cWIwU3ZSZVRCclNtYTdkQzk0N2FhOXpMaEliYzdRUU13QUZkQXRhMTc1Smg3?=
 =?utf-8?B?Wm1PeVNNTEM2MHFYRWJ2TTIwS1FXa0U5THR6T2JKdDB1R0k3L1dCNVNUWVdq?=
 =?utf-8?B?a2NqRXFSdWYyTUtJR1BTQTU2Yy9leWRaTW9PeFpXSlRIS0dFVUFpR2lJS3hE?=
 =?utf-8?B?SkJwS3RWdjNONFFvWEZwbTdDcytsU1I2MEx2eGExanRsWDM4d3hGM1NTRU40?=
 =?utf-8?B?ZEFsVE9vRE13ai84Sml0aVdnQzZTaXRQaU51RmFUV1ZIM2w3a3MvQXB3UmRn?=
 =?utf-8?B?NXVsWjVxbVJjN2NPY09ZZFdOYyt4NEhIckcrSWpLa0xVQ0ttdkYxWmROTzRE?=
 =?utf-8?B?RDlFMk1FbkJ0OXhrNFE2d3k1cGd3SUsyTU5aSG1KWjJvc3luVnBsZkVHNHFO?=
 =?utf-8?B?c2FUWEZNWXpmOVNGZjVDYkdMNUhEaDNySTFDTStyNzdkd1hYTjQ2WS9CVFB6?=
 =?utf-8?B?MmltS0o3MkNpejRmOWJtM0hSZXBPS1VPdFpHQmR2MWVhZjltSzA5b0hTQ0V6?=
 =?utf-8?B?RkRuV25udHVobkpndEoxMWIyT3I3RExWdVBJeDVWOHRZSC8xaXVlM0RtMHVY?=
 =?utf-8?Q?4XD0AdoudBI/6CdIPXTO4In+tho5Csx+ByWwuZu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a5b993-83a8-4420-a31d-08d97d33b2e2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 19:12:04.9638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOEYK6bGv7paR7uM50CKCPSLnyVOUfvo82Nzb9LIBqI/ayshkJSkuQOX/p0gfxHzKneCxBPO6WhJ4MmR/iOZRSd5gUi4tpNggTgTIbm9MTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Received-SPF: pass client-ip=40.107.14.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

21.09.2021 21:08, Eric Blake wrote:
> On Tue, Sep 21, 2021 at 08:25:11PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 21.09.2021 19:17, Eric Blake wrote:
>>> Now that commit 5a1cfd21 has clarified that a driver's block_status
>>> can report larger *pnum than in the original request, we can take
>>> advantage of that in the NBD driver.  Rather that limiting our request
>>> to the server based on the maximum @bytes our caller mentioned, we
>>> instead ask for as much status as possible (the minimum of our 4G
>>> limit or the rest of the export); the server will still only give us
>>> one extent in its answer (because we are using NBD_CMD_FLAG_REQ_ONE),
>>> but now the block layer's caching of data areas can take advantage of
>>> cases where the server gives us a large answer to avoid the need for
>>> future NBD_CMD_BLOCK_STATUS calls.
>>>
>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>> ---
> 
>>
>> I remember we already discussed that, but can't find.
>>
>> The problem is that it's not for free:
>>
>> In server code in blockstatus_to_extents, we loop though the disk, trying to merge extents of the same type.
>>
>> With full allocated qcow2, we'll have to load all L2 tables and handle them, to merge all block status into one big "allocated" extent.
>>
> 
> We don't have to loop that far.  The NBD protocol allows the server to
> stop looping at whatever point makes sense, as long as it makes
> progress.
> 
>> Maybe, we need some additional negotiation flag, to allow BLOCK_STATUS command with NBD_CMD_FLAG_REQ_ONE flag to return an extent larger than required when that information is available for free?
> 
> That's one possibility.  Another does not add anything to the NBD
> protocol, but instead limits the code that tries to loop over block
> status to deteremine a larger "allocated" answer to return to instead
> stop looping after a finite number of extents have been merged
> together.
> 

In this case we should answer a question: when to stop looping? I'm not sure we can simply drop the loop:

For example, for compressed clusters, bdrv_co_block_status() will return them one-by-one, and sending them one by one to the wire, when user requested large range would be inefficient.
Or should we change block-status behavior for compressed clusters? And may be add flag to block_status() that we are not interested in valid_offset, so it can return an extent corresponding to the whole L2 table chunk (if all entries are allocated, but not consecutive)?


Hmm. So, if not update spec, we'll have to "fix" implementation. That means actually, that we should update spec anyway, at least to note that: "clients tend to request large regions in hope that server will not spend too much time to serve them but instead return shorter answer"..

And you'll never have guarantee, that some another (non-qemu) NBD server will not try to satisfy the whole request in on go.


In other words:

1. We want block_status of some region
2. If there some free information available about larger region we are happy to cache it

With your solution, we just request a lot larger region, so we lose information of [1]. That means that sever can't imagine, how much of requested region is really needed, i.e. if we do some additional work to return more information (still within boundaries of the request) will it be:
  - good work to minimize network traffic
OR
  - extra work, waste server time, client will cache this information but probably never use (or even lose it soon, as our cache is very simple)

With additional negotiation flag we don't lose [1], i.e how much client wants now.


So, for me, modifying the protocol looks nicer..

Another approach is do request without NBD_CMD_FLAG_REQ_ONE and handle several extents.


Are you optimizing some concrete scenario?


-- 
Best regards,
Vladimir

