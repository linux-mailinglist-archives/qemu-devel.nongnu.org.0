Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BF539D99C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 12:27:00 +0200 (CEST)
Received: from localhost ([::1]:39696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqCTD-0007oR-GW
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 06:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqCR4-0006RX-6j; Mon, 07 Jun 2021 06:24:47 -0400
Received: from mail-he1eur04on071d.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::71d]:19519
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqCQz-0004OS-Jh; Mon, 07 Jun 2021 06:24:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2lKna4tU3jrLR0kYB1swzYIH1KwEOh6zXzJrfgwYObtngGY/8xeWflToA7EX6365uT76Jvi7hF6fHJKDH34Q+AVSyOLHWgC+5otCVGG9Iji//j2rDZpuwVFcgjj5UD1j/c6yyCDhxFCZ5tpmsNNxoAqc3NmLoMZbLwZe1FAmcNE1x4xLzWrzTWutltwQDcIyYhHlAzdERR0nHLwkVtt9/iwShZvEitbqKQ63FX4lEGSdEQ8uOmuUuhokpruZJpFFTjK7NnKRfs+DcagDwwH+4yH9IbYGfd3GiwHuccTeG36t8G9tFAUFSjiKhILBZgg3sc5iS7I9pJFlwmpEzWxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ae9kUeSXyqjt1G/DPTPfoZCF2vmewKwvoFC2iKlvPVg=;
 b=UjLYEq8Koudi88Cqe33krb6eB8LVPRswkomcq6DyuL/vdbCIwrhiAwbz8cdXRqWYX3IgatMAqsaD35LfjfcJlFftN48ofZ8OX1qXtdso1BHUyDxCeY9R1GGBp2pKNqX827jYv43bL4XVK3vQOP/0pP+1jg2embaW5TcgaltrveCgr9y8gMP9IH7wU8Kl+hYg5UBr7uG2RolxcxnfiXPB93QlECLulywaRWz6jkhIsv1sXOTa/vF+AJmMe3bWYSCTpEq/YLNgJoDcvss1qISsyF4pRZ60DTsqDz9A5cvf5oYvxfkhH2VKP5hzdtf5AkBmLaJD/K1ROQb7r+Zvq2FGpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ae9kUeSXyqjt1G/DPTPfoZCF2vmewKwvoFC2iKlvPVg=;
 b=PqL3extuIqu74MfXY2iX35yl2UP8ZNf+1YuatCe0MHm/USGOojqzt5kXEES/IGjXq2t3U222LmiAXLbcLK9ITWdjwef7d8J7VajoT+W6aA0ZdS6FvGqqurdfoPtapPyTLWj11LOxm+ksBdzIxVnsw/7+SuD8orIijpWoSaqtmko=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2610.eurprd08.prod.outlook.com (2603:10a6:203:97::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Mon, 7 Jun
 2021 10:24:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 10:24:37 +0000
Subject: Re: [RFC PATCH 00/11] hw/nvme: reimplement all multi-aio commands
 with custom aiocbs
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
References: <20210604065237.873228-1-its@irrelevant.dk>
 <6addc825-917e-e3b3-f2b3-af311beb6b00@virtuozzo.com>
 <YL259FilxX0aqFYb@apples.localdomain>
 <a9104cf3-efed-524b-803f-b49d93fd062f@virtuozzo.com>
 <YL3uMOfMBKGM9KpQ@apples.localdomain>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <16744314-bf91-9d4e-72b8-64b55891d36a@virtuozzo.com>
Date: Mon, 7 Jun 2021 13:24:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YL3uMOfMBKGM9KpQ@apples.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.227]
X-ClientProxiedBy: PR0P264CA0099.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.227) by
 PR0P264CA0099.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 10:24:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f87bce9-b36a-4597-4930-08d9299e739d
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2610:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB26101E46C54FC20232A95D8DC1389@AM5PR0802MB2610.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h9KfGl5pv8zBpqJ8ack+tVd5j5iA6wZMeVywkX82doR8oJHgmp8hgUDbZb6t6kD254Xra7dBpzE9Tnh7oOcJcZCZJrBDaHqY9AjC0224KrQ2aTld7nIJmN7D3dA1wQ+Dav4QgFbvNXYdYzp28sf7rxo7vVhTuhzQwTiVa97JazjW6+/U3+ODVFNG1b+XX8J7ejrGKh2h1WJaazBVgLUgHGcZMfq0J7TqgUfEFykwKXCPwpcNcg+2TF8LK4H+bwI9U65DWkitr7KViVjLsa8SgYhQtVsYPzuzKg78ZrWQnz+JGWVagFfUvkTiS5AH7WDWtQTarjyLqeLD5TgVSgoQJKoF+s5Uj+m8ZQBhCy92/wAL1n/bocoiNv7oMVkDMh0ciSxmk0/3FOssGnAJxBP1vFCEVi+TqffCcBJoJXWAAbVVbns+C2awjkELcvZv5mg94BNlO2ZkpUhuYIYp1qXfCi07ztdZVX/Xb+ascfn+7CGCMVe+o++6GdAiqRmJkh0gReah1tEDbRdPcNWMhkbSMGC7mQ9EWJSlk8d6mM979TISSWn7O0MjHHbDShzWsjBO9vLO5GCKT7JaMzyrNLdMq7sPsIzPQjFz6BCR0/MsyLZHR9SvpVSAJDnsG1eagwIUSdxOgCCrhOJ9H3Go22tD3EZryYHpphcevRw5gsnON7VaTlcTBLOD7TS9tY4WAk/KA1h+/PDQA5F8Wd2+EbqnlKai5GbG497g+qz7a/N2sy4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39840400004)(366004)(136003)(83380400001)(36756003)(38100700002)(38350700002)(8936002)(6916009)(16576012)(316002)(31686004)(31696002)(52116002)(86362001)(4326008)(186003)(16526019)(8676002)(66476007)(26005)(66556008)(66946007)(2906002)(5660300002)(6486002)(956004)(2616005)(478600001)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TG1CbU5FRGl3ZTRSTnBtOXhpbnprYUk5OGhWdTBVdHVRTno0VlZxODBYdEVt?=
 =?utf-8?B?WmRyeE5EMFBsMkJLbTJsQXF2SFlNZ3U4SEZ5VG5BeEtpSmRpTmFtYWtrU2ZN?=
 =?utf-8?B?ZmZ1amhsSy82djE5a2c1c3hvR05QVXNnUnhsK0xLRTkvTjgxWGU1aXhwQnJ1?=
 =?utf-8?B?b3F4b1FMSmdKWWJ0andHb3F6b0JQWHF4YXJCT2FFRFhTYldQVmNJbDV4WFFS?=
 =?utf-8?B?VVBrbWdMWnZTODBoUHR0MjhEQlgyMStSZU5vdXJOYVI3cHBvaFVzckhZdkpP?=
 =?utf-8?B?NFNoSjZTK0VFVGRaOHJHTjRrSmJyZXNqTGlRNS9mTDBnalM2V0Z4c3dzNUhG?=
 =?utf-8?B?WjJkSXVSemNyNjNYeEIzLzYzeGMra0x3M0s2UzdzeEh5ZmZSUkt2OHgvalNP?=
 =?utf-8?B?bVpPc2IxaXFQR3djem5PQktzWkkxNktSdGdoNXBGN3A0SmtCWUFEbFd3RnRY?=
 =?utf-8?B?VFBuSVR1SUNmMVdMb2FFckt0MEdUbndqMXRiVUlVQThxdEI4RktZdUpndjQ1?=
 =?utf-8?B?Z0kxdkdQM2lrVEpUeE4yOTZuS2RGaW9kdVZvMnBDZ3hqckloaFNYQlhLbUg0?=
 =?utf-8?B?Ym5DdjB2cUdzVjJFcGRJSHNWbTJNUkMweW1QdkpYNHZhcUlSUFVaWi9tNi9X?=
 =?utf-8?B?bUsvQ09RY0VxVFAwYjJMalcwa21vYmRnS3pMaXpYWUVKL1JjNFc2dUR4b21Y?=
 =?utf-8?B?amw1VWRlL1dsME42WHRCZ2pjZkgxM1lIcTFuQ3QwYWtNR25TenFQMVZlaWhn?=
 =?utf-8?B?TWY2QUxyaXZJdFg2RXdWTnZZbGpkL1pUeW9OMXJ6cUdwZERYMWtTK2tWZjdB?=
 =?utf-8?B?Z0I1T2o1MFk0c1ZXZE4vdDhsZkViVy93SkdRUTVBTmF2K0IzdklXV3RNWTNh?=
 =?utf-8?B?Z0h3RXBYbDBZRXpDK3BTVkd5UGFFMEtGb1BGN1JacTUyVjZUaXRhZWlYYTBK?=
 =?utf-8?B?cjZEY0FJOHBaUW0xNDZZakw4dHZVazJFcWdKc3JSVnNZcUVQRlZ6QzJ3bWVK?=
 =?utf-8?B?dnB5b1BsbFVOYUthZG8yMkFjK01BME8yaFA0c2JaR3ExclQrY1IvWkIxMGRE?=
 =?utf-8?B?b3lBWm9aOUh5UFZIRXRZdVBldUVBVXQ1ZUVqR1pORkxkNCtzWHJLbUJNNTMv?=
 =?utf-8?B?eDFSc3MrUmtZOTF6bjFJSkZCZWpKVHBKUngzRGNHeTNUKzVrSTFtY1RxNENz?=
 =?utf-8?B?QzlwU09QSDAzKzNFUDBwemErUWlGRnpBWHVNSGQ4T0ROOE5uNlo2U28zL0dB?=
 =?utf-8?B?dy9oT3N3M1EwRnU5Y1EzZUc5aVlOWG9VVUVMQStFYnlSTHVHakllKzBDbWlo?=
 =?utf-8?B?YWtTYmFlR21oNjBnT2FtZjlkUUhPVHFSaWRBZnNJRFJYaW5iaUY5aFQ1alda?=
 =?utf-8?B?UUlaYmxLalBFNDBFQjVKVTA0d203VjlpVHFYZ3orQXVqL1BVbk5MeHhwWncv?=
 =?utf-8?B?Snh2ODFRYTVzdHJvOEd0Qm9PTFh1SDVVckFneHdJR1EyOWlpdUdHTU5mQ2E5?=
 =?utf-8?B?c0lsMkVqckE2bjZoY3p4TmtLOTN0NEtNNHM2ZDB4T2x0VWJ6RWN6TU5uSitk?=
 =?utf-8?B?c2hvNlBSQzBhRUhXdXNCa3hqcCtyRDlKUjJwQ0tDMkoyM01XZTdsQlBxZUZt?=
 =?utf-8?B?ZU5TQlVMME5pQnVveXVSMFlRSWdDOHpNYU5zOFZDWEduT3FhSDhyU2o2aVJ0?=
 =?utf-8?B?MVdjSWcyd3c2d3dYRHV3VGJnZC95K2FQaWc0R0c5emY0NnFnUTlETHkreUdr?=
 =?utf-8?Q?ZSpBKsX57No3JZWWprbX4NP+9OLHrMZnYUs3moL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f87bce9-b36a-4597-4930-08d9299e739d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 10:24:37.2737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJxA19/ei+H5tdhEOSGRrMrdU/PYLosnjf7znGP/z844wTs3vIKLXAi5JJe+ItbU6wofjzgYHyzS7nMZ8zSftt0/JUTQoJUxh8CIaiiFFbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2610
Received-SPF: pass client-ip=2a01:111:f400:fe0d::71d;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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

07.06.2021 13:00, Klaus Jensen wrote:
> On Jun  7 10:11, Vladimir Sementsov-Ogievskiy wrote:
>> 07.06.2021 09:17, Klaus Jensen wrote:
>>> On Jun  7 08:14, Vladimir Sementsov-Ogievskiy wrote:
>>>> 04.06.2021 09:52, Klaus Jensen wrote:
>>>>>
>>>>> I've kept the RFC since I'm still new to using the block layer like
>>>>> this. I was hoping that Stefan could find some time to look over this -
>>>>> this is a huge series, so I don't expect non-nvme folks to spend a large
>>>>> amount of time on it, but I would really like feedback on my approach in
>>>>> the reimplementation of flush and format.
>>>>
>>>> If I understand your code correctly, you do stat next io operation from call-back of a previous. It works, and it is similar to haw mirror block-job was operating some time ago (still it maintained several in-flight requests simultaneously, but I'm about using _aio_ functions). Still, now mirror doesn't use _aio_ functions like this.
>>>>
>>>> Better approach to call several io functions of block layer one-by-one is creating a coroutine. You may just add a coroutine function, that does all your linear logic as you want, without any callbacks like:
>>>>
>>>> nvme_co_flush()
>>>> {
>>>>   for (...) {
>>>>      blk_co_flush();
>>>>   }
>>>> }
>>>>
>>>> (and you'll need qemu_coroutine_create() and qemu_coroutine_enter() to start a coroutine).
>>>>
>>>
>>> So, this is definitely a tempting way to implement this. I must admit that I did not consider it like this because I thought this was at the wrong level of abstraction (looked to me like this was something that belonged in block/, not hw/). Again, I referred to the Trim implementation in hw/ide as the source of inspiration on the sequential AIOCB approach.
>>
>> No, I think it's OK from abstraction point of view. Everybody is welcome to use coroutines if it is appropriate and especially for doing sequential IOs :)
>> Actually, it's just more efficient: the way I propose, you create one coroutine, which does all your logic as you want, when blk_aio_ functions actually create a coroutine under the hood each time (I don't think that it noticeably affects performance, but logic becomes more straightforward)
>>
>> The only problem is that for this way we don't have cancellation API, so you can't use it for cancellation anyway :(
>>
> 
> Yeah, I'm not really feeling up for adding that :P
> 
>>>
>>>> Still, I'm not sure that moving from simultaneous issuing several IO commands to sequential is good idea..
>>>> And this way you of course can't use blk_aio_canel.. This leads to my last doubt:
>>>>
>>>> One more thing I don't understand after fast look at the series: how cancelation works? It seems to me, that you just call cancel on nested AIOCBs, produced by blk_<io_functions>, but no one of them implement cancel.. I see only four implementations of .cancel_async callback in the whole Qemu code: in iscsi, in ide/core.c, in dma-helpers.c and in thread-pool.c.. Seems no one is related to blk_aio_flush() and other blk_* functions you call in the series. Or, what I miss?
>>>>
>>>
>>> Right now, cancellation is only initiated by the device when a submission queue is deleted. This causes blk_aio_cancel() to be called on each BlockAIOCB (NvmeRequest.aiocb) for outstanding requests. In most cases this BlockAIOCB is a DMAAIOCB from softmmu/dma-helpers.c, which implements .cancel_async. Prior to this patchset, Flush, DSM, Copy and so on, did not have any BlockAIOCB to cancel since we did not keep references to the ongoing AIOs.
>>
>> Hmm. Looking at flush for example, I don't see how DMAAIOCB comes.
>>
>> You do
>>
>>  iocb->aiocb = blk_aio_flush(ns->blkconf.blk, nvme_flush_ns_cb, iocb);
>>
>> it calls blk_aio_prwv(), it calls blk_aio_get() with blk_aio_em_aiocb_info, that doesn't implement .cancel_async..
>>
> 
> I meant that most I/O in the regular path (read/write) are using the dma helpers (since they do DMA). We might use the blk_aio_p{read,write} directly when we read from/write to memory on the device (the controller memory buffer), but it is not the common case.
> 
> You are correct that BlkAioEmAIOCB does not implement cancel, but the "wrapper" (NvmeFlushAIOCB) *does*. This means that, from the NVMe controller perspective, we can cancel the flush in between (un-cancellable blk_aio_flush-initiated) flushes to multiple namespaces.

Hm. But it will work the same way if you just not implement .cancel_async in nvme_flush_aiocb_info.

> 
>>>
>>> The blk_aio_cancel() call is synchronous, but it does call bdrv_aio_cancel_async() which calls the .cancel_async callback if implemented. This means that we can now cancel ongoing DSM or Copy commands while they are processing their individual LBA ranges. So while blk_aio_cancel() subsequently waits for the AIO to complete this may cause them to complete earlier than if they had run to full completion (i.e. if they did not implement .cancel_async).
>>>
>>> There are two things I'd like to do subsequent to this patch series:
>>>
>>>   1. Fix the Abort command to actually do something. Currently the command is a no-op (which is allowed by the spec), but I'd like it to actually cancel the command that the host specified.
>>>
>>>   2. Make submission queue deletion asynchronous.
>>>
>>> The infrastructure provided by this refactor should allow this if I am not mistaken.
>>>
>>> Overall, I think this "sequentialization" makes it easier to reason about cancellation, but that might just be me ;)
>>>
>>
>> I just don't like sequential logic simulated on top of aio-callback async API, which in turn is simulated on top of coroutine-driven sequential API (which is made on top of real async block API (thread-based or linux-aio based, etc)) :)
> 
> Ha! Yes, we are not exactly improving on that layering here ;)
> 
>> Still I can't suggest now an alternative that supports cancellation. But I still think that cancellation doesn't work for blk_aio_flush and friends either..
>>
> 
> The aiocb from blk_aio_flush is considered "un-cancellable" I guess (by design from the block layer), but the NVMe command "Flush" is cancellable from the perspective of the NVMe controller. Or at least, that's what I am intending to do here.


-- 
Best regards,
Vladimir

