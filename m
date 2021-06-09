Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7043A0F70
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 11:13:59 +0200 (CEST)
Received: from localhost ([::1]:38058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lquHe-0006qV-HH
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 05:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lquG0-0005zC-Pj; Wed, 09 Jun 2021 05:12:16 -0400
Received: from mail-eopbgr130132.outbound.protection.outlook.com
 ([40.107.13.132]:5894 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lquFu-0005ME-Nj; Wed, 09 Jun 2021 05:12:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gT7Qrg1UGzABmvjM89bovKczd3KS6/1KrfBI6PDk1VJcmUdWenl7jf2vvOE2ZhxTKG01Fn11PDDHWL09QZADNY+/ABpxDNk3Inft72JNN2qS4uw6+1FEfMK66hetX1aarjfsu2eI3CbHbUK9XI5X0ezmgXPCTKMoxOUVWfkjANo4DQ5WLtEHQSfyUIwuNq0JxIiybPI+1/K098c3lL/8DeqVRAIC0tDJxggBQF9pqhvv71Php8WP67622eAKRhPDU1ySDKAXIV5ceY2tpxWrizDxwWuL8EsPFVBcYcQqz2EHj4ljDhxyP/a0M7T3/EBnoMTd1VSDxOlA7a/0MIskxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7aDth6M2BewCc2L9QsyNW5BLMIo0CZofvJgr5RO4As=;
 b=WGj1wtZyvk3z+FemKpoMlpY+dSS4g8A+LPSzmnkLPc9wPxVu1HLsdyTdxmtW3ZWvv2BG17f7pdRjMTdSPHxb5NOOiWzQq8UqoRWA5ymAzAS19SjcdEJbeCTDnBWKhHV5JxhSF6Dch5nztbx9xEJpfT3HCUK1UjodqdnQp4yxaWF6lIwShb3wOZiSrVxaTB7B22IHM/LtOUnXY3Uo1Tf05hpd4znP0K0FDe9f8IT80T1LZDSK4iLUmYMUQ8HB/bwakxCno66BDK050RXIPvE/u2VhuB6plpU7bmABKvbJLLv0XRkjEJFwl/uMS1AiqWq1+QheiG2K0izVcGhpO8A9wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7aDth6M2BewCc2L9QsyNW5BLMIo0CZofvJgr5RO4As=;
 b=Fsa9PGAasIkRyJMCQXXBue08UlccmRueN73JeKfQ7CWqcLrQl/kwYabLwysIdvT4K7KdaPhl60rbi/jzBdYUTlfmVVvM1uyCLUPzgDWtOy9ZtVWZrnDU+r9a+MfkDXw4034VPVm6dSr5lf2QGuYnRQ25WMHesp2AH1mMB7sQDfA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Wed, 9 Jun
 2021 09:12:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 09:12:06 +0000
Subject: Re: [PATCH v3 2/5] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210608073344.53637-1-eesposit@redhat.com>
 <20210608073344.53637-3-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b466cc82-3905-acba-a2f8-e0b3cbbe2af1@virtuozzo.com>
Date: Wed, 9 Jun 2021 12:12:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210608073344.53637-3-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR02CA0109.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR02CA0109.eurprd02.prod.outlook.com (2603:10a6:20b:28c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 09:12:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66da5de6-015e-4267-14d9-08d92b26a749
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-Microsoft-Antispam-PRVS: <AS8PR08MB61196759B6D8CC79D10E8F37C1369@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i2bmOBjSK62kB5f+NYC0adw6pWfldfrkPS0UnMo4z55lJQ96kcRe7k4csI4yVHPR6hbWa8O9/iW/R4IRlIbZpldHsoMwr1Rjb0Cfb+OkMnboMmujKo7XGwgVpFDc4pD5Lt4vTEm9VLsWxMJZc2QcqKlvo9sjhdJpwoWkIs4vsxM3VRXAZUvvuDXm2ry5Edm1NzGgQ9QN8ZeiSzuKtkrYwxe9GC0cN4PY507pZZRzm5IhfXl0xou5phgsKzes2Sre1iV959BzXxRJBT8c0FM24hmaKapCRLuCeu2+hVQ0MdsJJBE3r23jPdcOwX5pM72iXHClgyd/ljd5Os1g22DUIzN8NwrlAtHRguc3utwT5woWG1xzulgK1k4mSmuXIiaDwaeGGhzMA53U7dmct36DpLF7J+zyttTTQZCzFDnm69cm5N0QjKBJGyxScYlAtSx4uGSx7tTHaRnUS1N3j3UceWv1w4cTOcKfFjtY9g5KHC0SHkFb6Y2rlx03kXBGxkQBt871WNTfz+uWwQWcVQrn9k7VaUSWcTyDipSyUMLD7aBohom3VkBksjcWSuzxCFQWxF/tH2fAxDLd7tZMTsPvPZvaW/GPPgfw/IMEEc7Bcx3KvaFf5YIL43nMzc/N+S05c8/4m6Ts4ip8RJ4sfpzMlrG5gy2+mTRbpFRiA5la/DufADsvBJgILmNOjLC+yCzjANvdBdr54bNmKFmapw2RGt7p8n8+d6hu+tyVOoYPIvA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(376002)(366004)(346002)(52116002)(8936002)(26005)(36756003)(8676002)(86362001)(31696002)(16526019)(186003)(6486002)(38350700002)(478600001)(66476007)(38100700002)(66556008)(5660300002)(66946007)(2616005)(956004)(16576012)(4326008)(316002)(54906003)(2906002)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WmRGZFp0dU5DQUJnM0NDbFpqUTV3WENKMklOSUx0ak50eFhPaHo5SG9RMEkz?=
 =?utf-8?B?VjQ4aWZ5eTBYeFZsVmNmdmZIMkhsZDZXLzhkejF6ZzMzSXAwZ0wyaHBiMWZt?=
 =?utf-8?B?SFpxUFR4VG94Sis5UlBJUnRyYitPMDJ0YUkzMWd3emNNUUg5WE9CYmZ4T0dX?=
 =?utf-8?B?cUh0eE9JdkhoV1BRcTU4cWlqT2daTzZraVp4UjZoeDd2U2NGWk94SmNlaGwz?=
 =?utf-8?B?ZHZoVXZVYlc1MUhwanJmM1Q5aUlTUFhFclpHUzlkR01TT1FXRTVuVEVOS1Vo?=
 =?utf-8?B?V3dVVlB1YnFvVDI1b09mbnJ1eThtSXJ5MW95SG1EWU5uSXFWMWxBZlYyVlVK?=
 =?utf-8?B?WWZVS0NUT3VSKzlOM0gwclpRNHVqVDNRK3pRRHFjK3hiTXZsL2pFRTR0R1ZY?=
 =?utf-8?B?WTZSNjhJSU1aQ3hBRTVZUXYxM2ZEM1lzb2d5MlhhWFNRMEhDNnZoa0xDcUVv?=
 =?utf-8?B?Z3pKUWh4eTNab0FxWXlhZllkMGxXelI4QU53WVd3MWlkcHhiSTZ6RVlmazZ5?=
 =?utf-8?B?d25LYytrNzZscm11Mm5sODZQTTZ5Szc3c2pjaDRWeUY3VHF6clVPSlJpTmov?=
 =?utf-8?B?amxTWmFuZUhvOVNhbWduMFhrYlZWM05wbXVVK2tjR2hnV2NxQXNHRWw1bllV?=
 =?utf-8?B?VTdvRmxCeWw4d2hmYVQvMEtKTEhFdHM4RW4xcDNZeVh5MTNnckFMTWNKay9s?=
 =?utf-8?B?NU5sWm9NWmthU0NwRUZ0azBRK2ZZVmJlNzVxNUZLOVZwcjVPLzdUTW0vOER1?=
 =?utf-8?B?aTZBcSsycnkwTjVFc2N4K0RqS1FONWFLT3VHRzI1S1paR0d5SDlXMmlTLy9Q?=
 =?utf-8?B?c2JSSTZhcjJ3ZUlBS1NObmdId2pWMzhmcExsV0dGN3pQbXZqSkc5S1FjT2lw?=
 =?utf-8?B?T0FDRmExT0R5ZGpPcjNKV08vNjRlLzNMLzFKMEM1emNLT3ROZjJrU0dyU1pl?=
 =?utf-8?B?TWJWbk41UU40YUpNaEdVeUVQR29pSjBJdjU5U0dlWGl4MmMwYjBRR256TW5U?=
 =?utf-8?B?UjJwRUIrcVhubTBic0t1TUt3aGYrRStjT0k5Wk9NbWhHU3o5NkV2Sis0d1FS?=
 =?utf-8?B?ZXNPWmJyNDJsUHAzcVlQV1ppVEdvUVd1RUFWcFlFcWJUcG41azd4RGlabHRI?=
 =?utf-8?B?N3NrZE5vZFRhMTZtK01DZTRWd3cvVVAwcmtrRWd0NHFqZFNUTGRkakUrY0Nw?=
 =?utf-8?B?TXpZMGx2VGZaTGhQdzlnM243S2JNQ3QreXFwSWhaUXQ5YzNUUyt6ZXI4azUw?=
 =?utf-8?B?M2tGem1WRkxFMWdxLzRWVTEyNDJQMUxQUWFrSE1lZzRNdXcvbW9Bc2JHTk1y?=
 =?utf-8?B?QXQ1Z0lla2RJNk1GYWpXa1NVekRIOTlyeXozbC9uWEwxRVBNakw5Z1hHbE8r?=
 =?utf-8?B?VlV5b0tsTFRsbGk2SUVXc3FkM0FkVENHc2xUMmQ3K05kbWRCWGZCSGZFNExv?=
 =?utf-8?B?T3RlcnI5Zkxvd3Q5cWZaSk1VTEQwY25rZzl0QTNoVDRlTndtWTJrYmY4RDI4?=
 =?utf-8?B?K21mNFlWYzdibmdSdStlM3EweVMxR2V1Q0NTNFJWUWlhY2l5WEtlakhBUE9k?=
 =?utf-8?B?YnNyV1haL2djb29URE1sUnRKUjZXRmdJd2sxL0pxeThIVkNnaVlGT2dMY3Zk?=
 =?utf-8?B?R1Q1dkpwMFJUa3R5ZW5QZ1pZVFZIdjdXaDhyVnVBZEhmRkxVRlJqdWM2NlJK?=
 =?utf-8?B?REdQVVJVdnNtTnRrUmpwbTlsd25wUloyczBlcUhIRFcyUk1Kb2ROQlNwOFpt?=
 =?utf-8?Q?awHe7FLq0d+6OD/KlNoQw1ynjR+gYIo/LWj6moZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66da5de6-015e-4267-14d9-08d92b26a749
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 09:12:06.5997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWzNw5kelFE1vGOhAXxJLrpF6ayZg14eUJLlByBOasTN73EDAwXXXXNQ9GjFJwL3sMvuq5RK479NMO1Mz28LxX0+YZjfuxBysPwpmawnLLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.13.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

08.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
> As done in BlockCopyCallState, categorize BlockCopyTask
> and BlockCopyState in IN, State and OUT fields.
> This is just to understand which field has to be protected with a lock.
> 
> .sleep_state is handled in the series "coroutine: new sleep/wake API"
> and thus here left as TODO.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-copy.c | 47 ++++++++++++++++++++++++++++++----------------
>   1 file changed, 31 insertions(+), 16 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index d58051288b..b3533a3003 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -56,25 +56,33 @@ typedef struct BlockCopyCallState {
>       QLIST_ENTRY(BlockCopyCallState) list;
>   
>       /* State */

Why previous @list field is not in the state? For sure it's not an IN parameter and should be protected somehow.

> -    int ret;
>       bool finished;
> -    QemuCoSleep sleep;
> -    bool cancelled;
> +    QemuCoSleep sleep; /* TODO: protect API with a lock */
>   
>       /* OUT parameters */
> +    bool cancelled;
>       bool error_is_read;
> +    int ret;
>   } BlockCopyCallState;
>   
>   typedef struct BlockCopyTask {
>       AioTask task;
>   
> +    /*
> +     * IN parameters. Initialized in block_copy_task_create()
> +     * and never changed.
> +     */
>       BlockCopyState *s;
>       BlockCopyCallState *call_state;
>       int64_t offset;
> -    int64_t bytes;
> -    BlockCopyMethod method;
> -    QLIST_ENTRY(BlockCopyTask) list;
> +    int64_t bytes; /* only re-set in task_shrink, before running the task */
> +    BlockCopyMethod method; /* initialized in block_copy_dirty_clusters() */

hmm. to be precise method is initialized in block_copy_task_create.

And after block_copy_task_create finished, task is in the list and can be read by parallel block_copy_dirty_clusters(). So, @bytes is part of State, we must protect it..

method is only read by block_copy_task_entry(), so can be modified without any protection before running the task.

> +
> +    /* State */
>       CoQueue wait_queue; /* coroutines blocked on this task */
> +
> +    /* To reference all call states from BlockCopyState */

That's a misleading comment.. not all sates but all tasks. I don't think we need this new comment, just keep @list in State section.

> +    QLIST_ENTRY(BlockCopyTask) list;
>   } BlockCopyTask;
>   
>   static int64_t task_end(BlockCopyTask *task)
> @@ -90,15 +98,25 @@ typedef struct BlockCopyState {
>        */
>       BdrvChild *source;
>       BdrvChild *target;
> -    BdrvDirtyBitmap *copy_bitmap;
> +
> +    /* State */
>       int64_t in_flight_bytes;
> -    int64_t cluster_size;
>       BlockCopyMethod method;
> -    int64_t max_transfer;
> -    uint64_t len;
>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
>       QLIST_HEAD(, BlockCopyCallState) calls;
> +    /* State fields that use a thread-safe API */
> +    BdrvDirtyBitmap *copy_bitmap;
> +    ProgressMeter *progress;
> +    SharedResource *mem;
> +    RateLimit rate_limit;
>   
> +    /*
> +     * IN parameters. Initialized in block_copy_state_new()
> +     * and never changed.
> +     */
> +    int64_t cluster_size;
> +    int64_t max_transfer;
> +    uint64_t len;
>       BdrvRequestFlags write_flags;
>   
>       /*
> @@ -114,14 +132,11 @@ typedef struct BlockCopyState {
>        * In this case, block_copy() will query the source’s allocation status,
>        * skip unallocated regions, clear them in the copy_bitmap, and invoke
>        * block_copy_reset_unallocated() every time it does.
> +     *
> +     * This field is set in backup_run() before coroutines are run,
> +     * therefore is an IN.
>        */
>       bool skip_unallocated;
> -
> -    ProgressMeter *progress;
> -
> -    SharedResource *mem;
> -
> -    RateLimit rate_limit;
>   } BlockCopyState;
>   
>   static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
> 


-- 
Best regards,
Vladimir

