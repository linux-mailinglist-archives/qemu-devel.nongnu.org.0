Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CB04142A3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 09:29:19 +0200 (CEST)
Received: from localhost ([::1]:39424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSwgw-0006MO-E4
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 03:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSwg7-0005YQ-Ft; Wed, 22 Sep 2021 03:28:27 -0400
Received: from mail-eopbgr20131.outbound.protection.outlook.com
 ([40.107.2.131]:52609 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSwg4-0004eP-NR; Wed, 22 Sep 2021 03:28:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRwRzQe7Jm9Kn69Ativ+ll51y7t4JglCslLBkHiQ6pmQzrJvwcHAkq0BuSLJYCc48dMDaNSd9nUn4dscQY/wVDJYLvS8pEIgaCwoLjEzVkZbG/kPaQCFrOmChs68XfOO5/R6+FNrlSahReC41vuVu/ibgznUE3d0uGYTeeMRXRhzp8NdOtJ76UiN6SygLsmuOHvJ3x1rOSsMbuos4D9hZSrATocE5B+7IK211aNuRm/aKxxpeWfLIdoVF4yU/JJ3HqxfcMcdKOlBSSm1MqSw+1tqxZQepxEsA+PTM0a6lnhTdpEy7gzZuXpa1WP50V5ajhIQIBOun91o75tiOI3OmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=JC5OHr3gv8c1RRwUcf+GApYDPrvbi8ZmW07QvMqQh+g=;
 b=SRPJV3Gk5YoVw5wUTQF+1/kGnFDwb1iFj5kNPg+CP/Zq1Cn83zL6sLdm/vBznhYYazESKz7/ucKqya2Xzj75FlVlX7lq/tZqZ8954ytoDjbvCrJNOUf2kAi/esbS3UZMUREC+i3VHzUvfzsE8zWTemNBaUNulUgfrgNyHro7e6/yiGDQE3GZrPo5eqgVjuWUgxMwPZOfwC5/kTRcdwrgF9PpAVe3hsf5//+GM29j+YakAab+CHiAUcVLfYBWvfjYQcxstdY9aKQ/Ffua4hQZHFgViUEt0BF4rOMCKW79nP2MdvAY7aZ5EoLM2sgPDMjAss8Vo6wHXtPK4lIll0xjGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JC5OHr3gv8c1RRwUcf+GApYDPrvbi8ZmW07QvMqQh+g=;
 b=dhB+lfkmQeOUKgnlGCLRCyA9M29BSbPzi+vAY80qSA9l5pGVq3N5xLzPqIylvEUEyw/K5BCujvY2LGaZxsH4izt77ur69pP1Oef94KmHghEwT4KYiltfi/E08rfUYkT6I8lmbFppctdnCy1HQqoN2JWBmqLnrPQEusdPRAwJLzI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Wed, 22 Sep
 2021 07:28:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 07:28:20 +0000
Subject: Re: [PATCH] nbd/client: Request larger block status by default
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, hreitz@redhat.com,
 Kevin Wolf <kwolf@redhat.com>
References: <20210921161703.2682802-1-eblake@redhat.com>
 <5b9402dd-4c37-2fc6-7c65-a13c4c5e6383@virtuozzo.com>
 <20210921180843.6tfubsqvf56hkyro@redhat.com>
 <95d19c17-1541-4a34-fe3c-6a085255a586@virtuozzo.com>
 <20210921200017.huvks6mtothvv74p@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c435642f-43ae-4de7-cf17-30ed7035c4cd@virtuozzo.com>
Date: Wed, 22 Sep 2021 10:28:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210921200017.huvks6mtothvv74p@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0234.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR0P264CA0234.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 07:28:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d34913a7-4541-4fe6-d13e-08d97d9a8d82
X-MS-TrafficTypeDiagnostic: AM6PR08MB4689:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4689C2175EB57AE8171D3DA0C1A29@AM6PR08MB4689.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SUUWunA91y72SXIFJIytWgWGXz/ZnYmcu9fiHmZiO6JcNDGNwHvOJgGLhKsG3Wp9Eb0vR0L67l7cJfQEbdRe8tK1La3dHXjo9HOCI/RRy6zW/znPgKWf0rmyoediAPgw6ZY29W1RJL0HosnS42aTNYtVQuiTYBhEiOOeaqTVEObbo3h0PWSyjSzw9LVRO9O2hX2F3lrKfcufBTmzHks4vRdbzgoNSYQ7ROSFCLhtooH0rcNU9ZV45B59Udo401XAhm6YiyhXzceJe2vJ1fdwGNE38XIHJGUapvY/4W/Y4AyeyADUUoyzivqPhWfDal3d+AQtYOHrPHZBEN9iPQ/oRoLzYyovNn2ZVEgYB634t/si5nCMsEyVauMSOUZ37Q20PIuvYDpYPAzN0eRYv/J6k3yJKyDCyWudCKJbJJPnAaQKE6qq+gKICMStaeDwNyEJskFIBABkpcBGfW8iLSMqAqt6zxS3Pk2FtU5F2KS1mhunA0kBD/v/sWakNnPehiplZL6mTMd2fYaHYGND29E3eGU8YV5ZYs2iONr3p5hcEbiEMCiaQoAFiFjuwGBwVDj0jjD/Uof9/rVScxNDJIEkg69S3IV271tE8Ld6E3pDhbLERbAWnEN2Mse132FNHKOKZw6m+F0Y2D5C6XKS2AjTe235YGLWy6WGQB3BaKC6bEY7bkCAdD4sP/CqZg9qe52g9Iok3oybGO9gBbeo3RPE3hC/bIdpoabrEAW0NGqx5AA+wGgUNhR0n2BkL3677XQ/mqLmmxInbkEG2+RX+XP2gzge+Urjq6y3RC720b7Y+sU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(2906002)(6916009)(66476007)(508600001)(26005)(16576012)(8676002)(8936002)(2616005)(52116002)(5660300002)(316002)(31696002)(36756003)(38100700002)(38350700002)(956004)(186003)(6486002)(83380400001)(66946007)(86362001)(4326008)(66556008)(2304002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGZPVGJOdGd6NHllUlZ1ZmpaclZkaXdlZlRIZFJKZ1d3a2l4WWJtNzVDYmM3?=
 =?utf-8?B?aC84TXpQdUJnOWYzK0pINzRDcnBHVHo1YzFGNkxSS1VmMk1XMEtLbnAzSTY0?=
 =?utf-8?B?SlM3MkprcVdqWGxVNWFNSEJ3WkVJUDJkd05oeHhhYUplT01aYzRodU4rSnJu?=
 =?utf-8?B?NlZ5RURCWkE0bnNiTnRXSXA4eGVqajJQbmYxZ3g0eXlNVkNUc05nVkFtYlBo?=
 =?utf-8?B?eXMzdXBiVHFNK24rOUV5cmMyQ3kwQlQrNTR4YTlpbjZ5WVcrVkwyODhkNElB?=
 =?utf-8?B?NzFzRm12RHBsc0hnNDlxWFpTOEdPSTFaYWlkTER0bEh0QndJNnFPbHVsNFlW?=
 =?utf-8?B?ZHJ1VTFWY25RQXdTOWZ4bmQrOExmalRBdng0Z3RpUEk2cjZCTld0ZzlZUE83?=
 =?utf-8?B?cXZmaEp0TWx4WlpRc0wxeisrS2RmcWhuRjhsd3Fpc1JEekdvNHZrQmFDUGpZ?=
 =?utf-8?B?ejJHVDdxeU9zVUNVU2MrUEhuRWFicE5tdStjL0loTTZqWElmL0VJdCtOQkdJ?=
 =?utf-8?B?Mi9VRVIvL0dTTkEwbEsrKzlXOEtsekFPZkp2S0JFSkRndHJWZmRKNkJlbWlD?=
 =?utf-8?B?QnllQ2lhb3hvbk1yZjhLMjJxOFF4OWZBVHluMXNlbkp1bUF3UityTC9pc2I3?=
 =?utf-8?B?NVUyZ1JhbHpmUzdsZmM2clptaW5QRnpaVkk3NDBXY2xzNk1ldS8zcmZtNWQ2?=
 =?utf-8?B?NVBGaFpyTldNRURqZzFJQ1U2ZUY3VW5mOGx5bWFXRkdOclZ0L2NsVVNDWHNl?=
 =?utf-8?B?OVI3cGRoVXBtdzg5TmF0aEswU1NYVkp3eXBZc21YaUloSjE5MjFJa09HYTAx?=
 =?utf-8?B?Wno1NDhIUDNXdUIvUzlYY2ZMZTJsOTY0d3YzWVA3eGkrdHRSRjVGdVNlR1cr?=
 =?utf-8?B?NjIwZTRCcWZPTWVHSG5tRTR6U0M2dTBWVXY2YjQrMDhKMkxmRnRUc1RCUU02?=
 =?utf-8?B?cTkyRG0raEZDTktnOW1vT0VJelVGSGl4TFVaYmVJajhDeEZFMHphazhvY05M?=
 =?utf-8?B?akNheklzaFNyYldBOEdEMHUxL1hnVUYzdC94dkk3WWU5SXpPSUY2VkhnMGE1?=
 =?utf-8?B?TE9ZaW9FV081V0lqem9hSXg1V2xqeHFmQWdjOXBoeXdjMkxRNGFwNFFwUExq?=
 =?utf-8?B?dmIycEtUc3k5SE1Hc2I0dk11Vk1qaVUrZ3FBRWwrQS9maTVCcVBkam5xbmd0?=
 =?utf-8?B?aGJjUW02Yit1SFRPVkx1VUcrMWdWcnVJUGdXd1AvazV2MFU5WEV0cEg1WDdy?=
 =?utf-8?B?OUFnV0V3YTVhQ3JkYnRMZFkzbWlNL2JqNXFsVTJrbmpLdzd3b0JNOWVCNzla?=
 =?utf-8?B?amNMaGl1bVExMWpIQjN4MllKbEZTYmtKTnJ6emZjWjZKT2lkc1hIOExPbVFh?=
 =?utf-8?B?cFIyNFdTWGVsUEdBMnE4bVlFcDl4Um1FRHVIWkVUMXgzSml6bXpNN0s1Mk8w?=
 =?utf-8?B?NElpVG5yVlU5V2J1Z20yMDRhYmlQV3ZQSU0wTFc4ZjcycExYRUJHTHlCT3JY?=
 =?utf-8?B?aWFQTmIydWpQOXB3ckNoZzBFNTRNclRYamxkWTIvQlF6bjJwNlRBaHpqNW8v?=
 =?utf-8?B?QnBBbGFsMTVYeERvaVlpSExLVEFsTkxyK1kwRG1TcG1LT0lkMnZObVovNjNV?=
 =?utf-8?B?Z01yMzk4MkNpV05oMCs4eG9zSlE4MmJtcTlZU1lma0lwUDJLRWRWY0VqdHFu?=
 =?utf-8?B?aUw5eUNjeW42YXF2aGgvbjJaRWdIYXgvM2lhaDEzMnIyWFVJWmxTY0Y1K0N5?=
 =?utf-8?Q?gKPjHHybrGghNoq5FrfUM8rDnQZavutq4SPXyOa?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34913a7-4541-4fe6-d13e-08d97d9a8d82
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 07:28:20.4313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEXIGz7e1JjmZ4ffEOMLTmhfLQCsM+kAWG370IkDwmvWKA5tohsCqQ6pL/rd2F25r56syBlBuFIACN7EEUabw1ZiVErG7L2mMtfxA5b9YHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4689
Received-SPF: pass client-ip=40.107.2.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

21.09.2021 23:00, Eric Blake wrote:
> On Tue, Sep 21, 2021 at 10:12:02PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 21.09.2021 21:08, Eric Blake wrote:
>>> On Tue, Sep 21, 2021 at 08:25:11PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> 21.09.2021 19:17, Eric Blake wrote:
>>>>> Now that commit 5a1cfd21 has clarified that a driver's block_status
>>>>> can report larger *pnum than in the original request, we can take
>>>>> advantage of that in the NBD driver.  Rather that limiting our request
>>>>> to the server based on the maximum @bytes our caller mentioned, we
>>>>> instead ask for as much status as possible (the minimum of our 4G
>>>>> limit or the rest of the export); the server will still only give us
>>>>> one extent in its answer (because we are using NBD_CMD_FLAG_REQ_ONE),
>>>>> but now the block layer's caching of data areas can take advantage of
>>>>> cases where the server gives us a large answer to avoid the need for
>>>>> future NBD_CMD_BLOCK_STATUS calls.
>>>>>
>>>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>>>> ---
>>>
>>>>
>>>> I remember we already discussed that, but can't find.
>>>>
>>>> The problem is that it's not for free:
>>>>
>>>> In server code in blockstatus_to_extents, we loop though the disk, trying to merge extents of the same type.
>>>>
>>>> With full allocated qcow2, we'll have to load all L2 tables and handle them, to merge all block status into one big "allocated" extent.
>>>>
>>>
>>> We don't have to loop that far.  The NBD protocol allows the server to
>>> stop looping at whatever point makes sense, as long as it makes
>>> progress.
>>>
>>>> Maybe, we need some additional negotiation flag, to allow BLOCK_STATUS command with NBD_CMD_FLAG_REQ_ONE flag to return an extent larger than required when that information is available for free?
> 
> That's already the case when FLAG_REQ_ONE is not present.  The reason
> that REQ_ONE clamps things at the requested limit is because older
> qemu had a bug that it rejected the server sending extra information,
> even when that info was free.
> 
>>>
>>> That's one possibility.  Another does not add anything to the NBD
>>> protocol, but instead limits the code that tries to loop over block
>>> status to deteremine a larger "allocated" answer to return to instead
>>> stop looping after a finite number of extents have been merged
>>> together.
>>>
>>
>> In this case we should answer a question: when to stop looping? I'm not sure we can simply drop the loop:
>>
>> For example, for compressed clusters, bdrv_co_block_status() will return them one-by-one, and sending them one by one to the wire, when user requested large range would be inefficient.
>> Or should we change block-status behavior for compressed clusters? And may be add flag to block_status() that we are not interested in valid_offset, so it can return an extent corresponding to the whole L2 table chunk (if all entries are allocated, but not consecutive)?
> 
> Currently, bdrv_co_block_status() takes 'bool want_zero' that says
> what the client wants.  Maybe it's worth expanding that into an enum
> or bitmask to allow finer-grained client requests (the notion of
> whether valid_offset matters to the caller IS relevant for deciding
> when to clamp vs. loop).

I think, sooner or later we'll do it anyway

> 
>>
>>
>> Hmm. So, if not update spec, we'll have to "fix" implementation. That means actually, that we should update spec anyway, at least to note that: "clients tend to request large regions in hope that server will not spend too much time to serve them but instead return shorter answer"..
> 
> I'm really hoping we don't have to tweak the NBD spec on this one, but
> rather improve the quality of implementation in qemu.
> 
>>
>> And you'll never have guarantee, that some another (non-qemu) NBD server will not try to satisfy the whole request in on go.
> 
> That's true, but the NBD spec has always tried to encourage servers to
> provide more information when it was free, but to give up early if it
> gets too expensive.  It's a judgment call on where that line lies, and
> may indeed be different between different servers.

Hmm. Okay.

Still, if we go the way this patch suggests, we'll need at least improve our server implementation of NBD_BLOCK_STATUS around qcow2.

> 
>>
>>
>> In other words:
>>
>> 1. We want block_status of some region
>> 2. If there some free information available about larger region we are happy to cache it
>>
>> With your solution, we just request a lot larger region, so we lose information of [1]. That means that sever can't imagine, how much of requested region is really needed, i.e. if we do some additional work to return more information (still within boundaries of the request) will it be:
>>   - good work to minimize network traffic
>> OR
>>   - extra work, waste server time, client will cache this information but probably never use (or even lose it soon, as our cache is very simple)
>>
>> With additional negotiation flag we don't lose [1], i.e how much client wants now.
>>
>>
>> So, for me, modifying the protocol looks nicer..
>>
>> Another approach is do request without NBD_CMD_FLAG_REQ_ONE and handle several extents.
> 
> _This_ idea is nicer.  It allows the client to request an actual
> length it is interested in now, but allows the server to give extra
> information back if it is free.  And it works without changing the NBD
> protocol or existing qemu server; it is a client-only change, just
> like this patch tried to be, but may have nicer performance
> implications.
> 
>>
>>
>> Are you optimizing some concrete scenario?
> 
> Not at this point, so much as observing the effects of commit 5a1cfd21
> and seeing if we should update our behavior to match.
> 
> For v2, I'll try switching to just drop our REQ_ONE artificial
> limitations from the client.  We are still throwing away a lot of
> useful information because we don't cache anything beyond the first
> extent returned by the server.  At worst, maybe it will require adding
> a tuning knob in the QAPI when creating the NBD client to decide which
> of the two approaches to favor for a given client's connection to a
> particular server.
> 

Great!

-- 
Best regards,
Vladimir

