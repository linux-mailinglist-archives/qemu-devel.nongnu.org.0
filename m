Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F326F7153
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:42:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoP-0006yn-Ee; Thu, 04 May 2023 13:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1puYMZ-0005P3-D4; Thu, 04 May 2023 08:47:11 -0400
Received: from mail-vi1eur04on071e.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::71e]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1puYMW-0000jW-SN; Thu, 04 May 2023 08:47:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOzObjt4//J3FZjy144iimL7l8pgQODUP9u4kDiglZyH7o3e/oXLVeJTfgb1o9PcA5dOlDegBQ9XSd1dsBVt0OAisMiMgqzqqst7AXftBB5bHtAsH0HQR1k2xOeqUNMZHuV/60G/pu5HCQvWPS+pqHp6bPpSXP1OSfAn3y1Tz31qk+edN8GNCzTeBt/O/eln5hCQ5P4b4m4gQX6E6jO35v4ca7DKJXjEcVYPomavacoz8FHr/NKJbvOocXcibBecL7MmvchZ6Tyf4YaCWxIKJmIS0ZV6iYCTZWcWfaDmgIf4HW+A24O9r31T3fxfnWovaBBECAQfQ8NCQZnMH2p2fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWM1kW3WeJ1ivLxx3f8sSQZPyoZdW+9SHNA7U3rqCB4=;
 b=doS2Sl4mGkRhIJGdKVbm9w8Z0QismZRdCMxXO00CJMIAEccLJktrPsYAcuwB7EsGIV0bmswuF/X1co9lNnhGGnP2MzEJIlIa+Px+IbWq5Zk/ZRZstjNtbB/ZaoDO3D5lEFdUdq2AMeL3XxvY1vgdponl8+jxsKcCvb5ch4u4qoj5qP32L9kb3P95qcToDoxzrfzSePqxjUFsWoyKbo6imDtboa6TVaPQByrOBdDbpZNHf5mk0crtK/hyobwlO/yI8z21l2uJSWutEj9gFLEI52FnijPq7wET3yuxzp47LhcrJebL71XMG9gNDEKzov30em5nDeEkQJF0ezIkE+45xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWM1kW3WeJ1ivLxx3f8sSQZPyoZdW+9SHNA7U3rqCB4=;
 b=tFDqzSUsY3+eZpIzQMjXy3iu8SJ8WJ804t83G88NcBPozmD6P/2djr5vLZzU4+V9tdRtUF+I7tyz6s3QutZaewRCYLRo4rNmGAthgQ3SO5afP4YjTg8EE0A+zaIPMaYU42UpNBiW5Oz6EaM1EH6uwVQurmCtiwT6bM0NPmXaWKdVGrek5mTW2dl7aBz2n9SPZo+a5C50qhxEOdr6wabMbjsVsiq8gR+5UFj9Yq3Aoc/WVlR3N0tIZr2AD3YnnPWrOrm6Id+dHkHVOxRHZ+v9K8GPbiwwU+JxwtDFkudV4tYNAzIIp2voyvAjUt44ZixJ1asMPVYfCXgo0i6UZSKzrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PA4PR08MB7387.eurprd08.prod.outlook.com (2603:10a6:102:2a2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Thu, 4 May
 2023 12:47:03 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%7]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 12:47:03 +0000
Message-ID: <36032b83-1b0b-b007-eced-fefe427d2e8a@virtuozzo.com>
Date: Thu, 4 May 2023 14:47:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 3/5] parallels: Add checking and repairing duplicate
 offsets in BAT
Content-Language: en-US
To: Mike Maslenkin <mike.maslenkin@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, den@virtuozzo.com,
 stefanha@redhat.com, vsementsov@yandex-team.ru, kwolf@redhat.com,
 hreitz@redhat.com
References: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
 <20230424094309.197969-4-alexander.ivanov@virtuozzo.com>
 <CAL77WPDgx5gsnDZAbir+ae5f6N419WxHQVHZhUr=M4E63AZk0w@mail.gmail.com>
 <792ee284-473e-b659-2a33-3c15f8bae2b8@virtuozzo.com>
 <CAL77WPCAWgD=69LdXgMZ+5a2sDHATWbvR53RfwVbWvmmXvA3pQ@mail.gmail.com>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <CAL77WPCAWgD=69LdXgMZ+5a2sDHATWbvR53RfwVbWvmmXvA3pQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0227.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::48) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PA4PR08MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: e8439f30-1f23-4c05-2403-08db4c9da8c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YD164JhYyqDjIPQns7xL7r0VLzBtKkJmlNFwpu2lb+gU/UkHsyS3xUJkncp7sdscuoHwuZ9lua9voAbG5in5sgKcm4aviglnFnQqsoYdMCmrhmPziC5SCCbIADEcscbuvUbiWY6VfbpQ94AFKMHwO9469JOgUyuBY3nnJbMveAApnp4HryEysV5FOJLaJ7HmVO9pKYXOI7ZQyxAMJGh4kRN6ip+uuoSaVw532RMcCPxud19QHzTOK/o4wjKLdSDttF3ruyc/jKu3czLIVfpJvigp05yl6/r+auBT17khnsPw0WBXI23FK/+S9dajT4UBg8ncU1X8lB+rCzWc29cOebbhfDWdsfztGy+uMYzRVJuFkYBtaPAT4dg+NBF+hD1XIkwh2ALdVohMceEiVYsIiFQCnxSW0YPjeY7HJebbHEDuuRJiMbBu8wz/VPbDY9cdFJjZDcwHRujIljGQhOVHTvE9OTA2dUfnFRIdwi+xASQ8mauHqttEV0r7XSJPt62IhA5+eN4J+l18ZRk2NBfA7i+p0vP/sFyDtKGF2cOKEWpHzDnp2ucQ6pHfI0wfMk/0few5e6VtgqkCOOUqmmvQVHAf5bmDsMgYns+RD7z4x4b18DQgAnISkeXo6D7NqFgXWi3bfLaeSgAZAnkahbsTm1CTg6O6mjKKGzrm9+Za91qTCqysW86OJ13GN6wIVvVh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(366004)(136003)(39850400004)(376002)(451199021)(316002)(2616005)(38350700002)(38100700002)(8676002)(2906002)(8936002)(41300700001)(4326008)(31696002)(86362001)(6916009)(66556008)(66946007)(66476007)(186003)(478600001)(31686004)(44832011)(5660300002)(36756003)(53546011)(6512007)(6506007)(6486002)(52116002)(26005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDBZMEdYbTJjSnp5V1lacFZmZ1ZHMzhrQ2l4TEMvRGNSUlpaQkkwQ3pHYmZx?=
 =?utf-8?B?clRYeXhlbmhmTENQM0hHZ0tkT25WRXNUUnpubVB3M01LcDZMN2ZVbVVNSzVu?=
 =?utf-8?B?bldKOERBaG9lMVZpai80Zi9PNzZ5aHdSUXpzN1BHc3hHbFhhWDNGY3J0V2FG?=
 =?utf-8?B?S2x6QmZOMUowa1E1TlNCeWpqVHY5U1BjQktwRDFVMFNPeDRjRjZEQUZ0UlhE?=
 =?utf-8?B?QjBVMjNPeUwrT3lCZUVqcVRMUmtyL3FCbTk5dHQ3WDQzTG1zRU5EVGp6MSt5?=
 =?utf-8?B?ZkNTNVRtdXFVNEVCRURUdjJ0SG5RbzNJL2hpSDB6cUNEandxUU1xcHQwTCtl?=
 =?utf-8?B?SndRQSsrWEVaUHcvMGRCc01YTlNzeUtWdEtNVGdOK25FMm5TbmlYWlRzTkZr?=
 =?utf-8?B?dkk1OEtucHd0MjRGYnA0VmZhaWV0WnN4WkNIM0JYYTg3QXduZEx2LzQrYVRW?=
 =?utf-8?B?cm95ZzNjNmErakk4djZocjhSZFRFeUNOUHlyV0tDREhMMWlzN2d2MldXaTZM?=
 =?utf-8?B?VmcvVmZReDcvNldPRGJEd2xDc2NKUGpRYlRwTURJNWZIaHlyRXBESWM3aC9R?=
 =?utf-8?B?NUptem5xR2JzcUExcWZGQ1k3KzNCR2poVFJIaGFHT3MxZzNTOXNkUUJXWnFn?=
 =?utf-8?B?RlJVUjE3TVVUcnpQOElIbDhLV29Da2hJVkVtS3JaYkFHeXFzYVlNdDlKUkdz?=
 =?utf-8?B?bXd3TDd6NWJEcC9PaUkzWENsZkJEQXpJUzZvR3pRRkxYcnUzWG01ZFFNZ3Nm?=
 =?utf-8?B?S2cxelY4cUpqeUxrL1JzK3g2OEtvb1N5VitoMnIrNTBoSms4andHSjJuSk9q?=
 =?utf-8?B?QXV5NnJ6eUpqMFZlL3ovNVhreTNRd21PL2p4SktLTGVGUXBuQkRiU3BLSXdP?=
 =?utf-8?B?eElrT29tQitGTnJVSmduM3dGVmdFclNtU3pWZWZkRllYbkVDL0hneG1OUnVq?=
 =?utf-8?B?eUxWV0doZW9CVE9FOFZCOUNPdkw5VmpwVVJhMXd1d1JONTkrRlMxcmd3R2FX?=
 =?utf-8?B?U0hnU0tGU2o0RnB0TmU2TXlSc04vRlRZYzBCeFlSa1pLSG5ZK1VYODByZ05Q?=
 =?utf-8?B?U0NJZmlRKzk4ZVVxK3JJZWovT3hldmoyRjU3NjF3QnJScXpkbHZpcDJvRGtn?=
 =?utf-8?B?NEsvT3ZFMGdwdUl2SmJyR0hRY0s5SW5ZenVRWHZDMXNvM05VK2haTE5lVk5N?=
 =?utf-8?B?MXpXN2Nld1JlZWZIOWpMODZ6NHB5aExOZTMrSDA2Ymd3bHl4aStNd1ZrUnBS?=
 =?utf-8?B?VWliRWE1Y21EdkQ2M3JqejdTSGk1bU9nWlM0bHhuUWE2UUlxemNNZEo1aVZx?=
 =?utf-8?B?NjgzRE1DbTh0dU9LVG1FWjVZZ0J3QVZNSTJYckluTDBQUjFNQno1NVR1bXJD?=
 =?utf-8?B?b2kxZk1ENlN0SFlQRVdmUktaTWVhWHN3Rjh5VitrdTE5a1BFa09qTzJFY045?=
 =?utf-8?B?YXNiUDY4TjcvRktYVjhkekVOUXZ6RmhXcVdVNW5US05aSVFMNk5zNTVkblFP?=
 =?utf-8?B?Q2Fib1lPTnZYaHRaM0ROVkdCbXlNcHlCKzYxY1kwbWdQWVFNVy84dmlRY0Yw?=
 =?utf-8?B?SGZMUFMxSWF4Mmd3QzRyTmU0ZXQ4MXZ3YTE2ampwZ1VLZHpQUVd1c255bWIv?=
 =?utf-8?B?eFI4UmE0bTcwVksyY0YxYUtsYjBMYkdJQVJBeVNtN3NVYndkR25oK0EwbnFy?=
 =?utf-8?B?T3FJM0ViYUpDK0FsanlZT3lZTzY5ZTFIZGNEeU5aYVRkRzBLT045aVJ1bGRh?=
 =?utf-8?B?NGpBU0ZKVDM5eURmckM4blBYMTYzaVZLUXkxQmxTK0ZwN21BTXJQOXMrTklG?=
 =?utf-8?B?ekViWVZuWXc2M1NxSGRFRUl2RmtVNEhxV2oyRUkxZDM0M05hWVNHNDZzSHls?=
 =?utf-8?B?V2E3Y2FNVm5RMzA3bkIrRVJWLzdBYWFucU5lWTJjMjR4MnJVa1BDdDAxMUR4?=
 =?utf-8?B?SC8vL3pDVUVHYnNkZ2xrbVlaWmpFK0hBSDhRWjRCY3Q3WUdUa0RUdThwZ2k2?=
 =?utf-8?B?VzVxV2sxeEYycnZQSDAyZnJiZVFRSU5wOTlmNkxDbnEwVnBNSi9jNEtFbVdE?=
 =?utf-8?B?M1NiNUcwSDlKYWFxRy9HNE1WQVBoMy91VjZNQnVIa2JNOHY2SUJkWWxka1ZV?=
 =?utf-8?B?ZEpxN25tMDEydk94WC8vN1B1STZSUWFVK1BqK0lML0pnSlpIS2xBQ1BPODMr?=
 =?utf-8?B?bUE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8439f30-1f23-4c05-2403-08db4c9da8c6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 12:47:03.0041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7KuHe5U7gT/zUEuchpTR6ThRCJx4vMx6JsNQNeJOBHraUPLSmb9Se/hCE7/R1HuUNfgBBh4EG72XlosmDXS/YMHQMEn6kkTSlrx18C5Ddk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7387
Received-SPF: pass client-ip=2a01:111:f400:fe0e::71e;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Yes, there is a bug. Thank you.

On 4/29/23 00:15, Mike Maslenkin wrote:
> There is another issue with host_cluster_index() function.
> After this patchset applied `qemu-img check -f parallels  some_disk`
> aborts for  empty (just created) disk image.
> The problem is that host_cluster_index() returns 0 and then
> bitmap_new(0) rises an abort.
>
> For default empty disk s->header->data_off=2048, and
> res->image_end_offset = 1048576, so:
> static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t 1048576)
> {
>    off = 1048576  - le32_to_cpu(2048) << 9;
>    return 0 / 1048576;
> }
>
> Could you check this case?
>
> Regards,
> Mike.
>
> On Thu, Apr 27, 2023 at 3:29 PM Alexander Ivanov
> <alexander.ivanov@virtuozzo.com> wrote:
>> Good point. Thank you.
>>
>> Best regards,
>> Alexander Ivanov
>>
>> On 4/26/23 23:56, Mike Maslenkin wrote:
>>> On Mon, Apr 24, 2023 at 12:44 PM Alexander Ivanov
>>> <alexander.ivanov@virtuozzo.com> wrote:
>>>> Cluster offsets must be unique among all the BAT entries. Find duplicate
>>>> offsets in the BAT and fix it by copying the content of the relevant
>>>> cluster to a newly allocated cluster and set the new cluster offset to the
>>>> duplicated entry.
>>>>
>>>> Add host_cluster_index() helper to deduplicate the code.
>>>>
>>>> Move parallels_fix_leak() call to parallels_co_check() to fix both types
>>>> of leak: real corruption and a leak produced by allocate_clusters()
>>>> during deduplication.
>>>>
>>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>>> ---
>>>>    block/parallels.c | 134 ++++++++++++++++++++++++++++++++++++++++++++--
>>>>    1 file changed, 129 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/block/parallels.c b/block/parallels.c
>>>> index ec89ed894b..3b992e8173 100644
>>>> --- a/block/parallels.c
>>>> +++ b/block/parallels.c
>>>> @@ -136,6 +136,12 @@ static int cluster_remainder(BDRVParallelsState *s, int64_t sector_num,
>>>>        return MIN(nb_sectors, ret);
>>>>    }
>>>>
>>>> +static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t off)
>>>> +{
>>>> +    off -= s->header->data_off << BDRV_SECTOR_BITS;
>>>> +    return off / s->cluster_size;
>>>> +}
>>>> +
>>> I guess  there should be:
>>> off -= le32_to_cpu(s->header->data_off) << BDRV_SECTOR_BITS
>>>
>>> Regards,
>>> Mike.

-- 
Best regards,
Alexander Ivanov


