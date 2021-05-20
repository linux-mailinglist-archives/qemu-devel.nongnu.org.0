Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A07438B2CD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:13:38 +0200 (CEST)
Received: from localhost ([::1]:53166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkMj-0002fI-CA
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljkAE-000341-GP; Thu, 20 May 2021 11:00:42 -0400
Received: from mail-eopbgr10099.outbound.protection.outlook.com
 ([40.107.1.99]:55780 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljkAA-0002UA-Sx; Thu, 20 May 2021 11:00:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsescZ3sElIYClXqhl9oERSQVFLk3YSxkgfdzg3s0bfkHHgh1l5wpvw3xwm1Cwf2jBnIBr54dn2/AgIvaOKChRNkgse9G5vy3Aohe9HgKJYZk6/eq4AFqIRD6lF/PRE76BGDMiXf99QJQcm7RRji5nTbfagP/7aNa2xB4CTH78TfoM3RFy8VMaJt7QiTsWaygkc4vSzspB5QE8L3LncVqSoLSnvnrrxOOEZK+dN0iveF8D324QEwvA4zseEjPFeSEjeee+hX/A/m9i9X4+IUwCDtjFbPRvBuDL5n/JETdnuiABxKk2yTianC6HLs91PjDvOrfiz1ShczsM2dEe3ovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMHlhn8rQqOWF5eT/kHSva7DEbHGhLAyWvSuCkreGXQ=;
 b=DZnGWk3O6h/iVHg3+NKXUqpeeZR7zV+OBxFVYAxBC2w67c3b53mc5d5C7Kpo7h36zH8hQo1+7HEynFhBdgU0KCvEE+Sf0p56Bvr2P/jIiBvi6QSuADofkj4XJgN4TJ9PL6eLf6IUr1WVgIT2zNwjhPFpQpj8oleoltv3HJzxwZ8R+GtnxwhCFJJL0Q3Y4xdM1ExtwqD77PdDLXUh9FAXy3oRpLYQQN3NvV+kJ5HtS91bONJhJIuFU+mTBedCJpvbxSeJnssdDSpN3imo+ZAv9110FlU0XdQ0OyttrMIn9IwGGlahOcgddbBEnfC/47NBZngEpqSYUrGoDWExnU0Plw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMHlhn8rQqOWF5eT/kHSva7DEbHGhLAyWvSuCkreGXQ=;
 b=QGb6XnvcBjB6G5NeZMQBnpi8+TSsfmqEyF1pMOu+x7NTwLLcAvfw4MYm32ynrwQEPvW9v1TVKYTg/Lv3lObHXo8t+D9Mc0v350dKZqGhfVzMOiFIeypP2JBoR4hWgs5eU5CT1h7dfyURi5gb/2pb9C1H+BakoWWJHtbSnoxWnwM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4024.eurprd08.prod.outlook.com (2603:10a6:20b:a5::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 15:00:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 15:00:34 +0000
Subject: Re: [PATCH v2 2/7] block-copy: improve documentation of BlockCopyTask
 and BlockCopyState types and functions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-3-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <833e7298-1293-5fab-4277-3ced3c3347f4@virtuozzo.com>
Date: Thu, 20 May 2021 18:00:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210518100757.31243-3-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: AM0PR03CA0018.eurprd03.prod.outlook.com
 (2603:10a6:208:14::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 AM0PR03CA0018.eurprd03.prod.outlook.com (2603:10a6:208:14::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.33 via Frontend Transport; Thu, 20 May 2021 15:00:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96d17b9b-efb7-4233-fa4b-08d91ba0050a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4024:
X-Microsoft-Antispam-PRVS: <AM6PR08MB402497A7763E99A837FC54F7C12A9@AM6PR08MB4024.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:203;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i2h40nIOV+lzcj3TSh2AQetYsNwH5ATwzuDT9SDkCXEFB3mFmGRHOEXGGb2l/bno9mTueFOelsVXTaQcyYfLP3+kIL6jMKRfXduktjLOf/sW6WQM1aoERXDWBlBnDV9+RctMuR3MhZ3c2fbOP22ILjJ2TDiNPUW0QyMZF7eIHqZSRG9vvh3xEhlXr7zKH8OH77kWZA40CBcX4jduN6yU5QudovzEPvFLPYNVzvf2TpM5O0FA1ZCNZgo0RLsb/Cb3JzQg86uvdJ2xlvBtm+Koc4IsKC/iR2KNuasAt+YgTDA1Tv67+OgMfBuIGquFTQTWswTaofnD0sQ9B/cTW56T90iLcR7ocPDUfp1fxgoFEMZGkemnJtK/E/vqzLvAh+XyugBgbmQhD+vFedm7ENlOgKny96gpWyIDLULrlT1QDuMb6bwvO3FQxjU0xONw2OhlKWiF2KNXJPi9QzYp2yP3WY7oHL09e573cMXN9DZh/wxuAoJIB12YzRRpyymxFxtt5oOk7vBoL4HHntSQ4orJL3NPmHbY+djxfF1CpdrWygNyWLPBxZZEY4KYFpfWvLYplLB92ZKBqWmtDOLyNugFRCnPVWs7laeLV9vpTYvu7/0MxW4cSlkfDW+56GGj6ibeA/SA22eE5fw0jeshuiGW/g7gBpkjqaIKrLhECHqCMPf9VBtakWwHIj3iev+EEawiigA7QtQEjzovUioBR33rFiynLKEQ/w+rSy0YBpyunh8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39850400004)(36756003)(31696002)(86362001)(54906003)(38100700002)(186003)(31686004)(6486002)(83380400001)(8936002)(4326008)(16576012)(38350700002)(2906002)(956004)(5660300002)(316002)(66946007)(52116002)(26005)(66476007)(66556008)(16526019)(8676002)(2616005)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VDJia2JWNVE3MnpMOHNZZ25RZ1VRS255SllpTTQyQ0FNRTRicmgzeDNoN2hK?=
 =?utf-8?B?UTdPOEFidVNZZTErWU5VcnBEQ0E1TVNqbGp4SmJMenFGbC9pcDAwdjdjWTYw?=
 =?utf-8?B?dVJmWTUxT0xYZmwvUm05aUFYZTlqWmRJclJ6NDdmajlMQkljRU5DeDVDM0xs?=
 =?utf-8?B?OWxNd1VxNUNFenNrc2s2d1RmbUNTeUdPSnpIQnE5cU5OMXU1bnBqSHRMVkdM?=
 =?utf-8?B?ejljbjZwTXhYUnE3OHJIVWJYT2hCT0pZdFpXb0VWUGtqTlIyTGpjZmRxRkpJ?=
 =?utf-8?B?M0pPaEkwVE4ya3l4dTZnb3JZWDhJYXova2NJa3V5T1dmVW9uUUkzYmIyTVdj?=
 =?utf-8?B?SERtb0NFUjZTSEczbDdrQ2tlVlVYb20yYWlaQW1LbUJBT2xpWmxEK2NtUitB?=
 =?utf-8?B?WER2azlVV1pPdHBRb0IzN2V2NHFDRUx1UU1wVVplYXY1S2hqcmF3YnVWVnBJ?=
 =?utf-8?B?SnNCeGRqeFVCMjhUbUcvZTEwcFE4UzhxK01IRGhGRFpwVmp3YVF4UW5XcU5W?=
 =?utf-8?B?VVhqbXBZQ0pYc0lYSW9hRk56RThxRXV2RGpvajlCVXpwRXBxTEhkbVBNV0JF?=
 =?utf-8?B?S0dRdzJ2U0NDUlg3WFlHLzBwYmJLOFMyZ2x3NVhHTGZmYk9jS3ZXTzZiSGpQ?=
 =?utf-8?B?NXc3a1dBTmVZYWcrckRPak1UM1p4UnJ3TXI1Nm5Qb0JOTjdWT0Fjcmg3YzlS?=
 =?utf-8?B?bW9iaEJnMThYSlljbDU4WmZVV0pRaTIrTFY5WGpCTXdOTUZGalZCQnQzOC9B?=
 =?utf-8?B?SEFSZTFiY3FnS3RqcHlVekUxRkVGS25pNXV0OSt3NHJYVGtWdkE0VEdQSEhU?=
 =?utf-8?B?SGIwbDR6M0hubCtiTDlDVEJOeXRJMU5hVHRWdmVZUzBvRlplWi9ndkxjVFRT?=
 =?utf-8?B?M3AyYWlwKzhvK0ZHajY2bzFsRzhmcXB2ZkJadGlod1JQTlFNRVVSSGVwS01G?=
 =?utf-8?B?OGRDMitlZ3FlNm5xOXFRbGJUeVJvZ1J1N2NUelNMMnM5clVuMUJiSS9GeEJr?=
 =?utf-8?B?QlJtbGVMT2VHZk52R2JoR3lMM3I3VVIzeWxReGROM0h4aTlyWWpFRXJyTTU1?=
 =?utf-8?B?M2ZVemNPMlRWSjZFV0xEQWVnWkpabFFISVJsY0Y3OW9ZRmszeWdKdGUrU2JH?=
 =?utf-8?B?ek1aUUs3emRKbmJlVmZ3cVErQ0xMRUYvTUF0VUYycUVVWjVHbmVSSWZmS0pz?=
 =?utf-8?B?ZjV6anp1M3lFQ052ZCtONmx5UUMwVjN4L1dMRkpyNFFOVzBGcFdkMDdCTnBX?=
 =?utf-8?B?bkM4T29Wd2M3dVBTTTZsbW5WY1BwNElxT1gyUEppc3FKSTU2VFJaL1U2VzJJ?=
 =?utf-8?B?WXp6QWhzb3BvdGhBV2JaZm9PY1Uwbkc1T21ZdExaOWljWUtBRnorRUlnaE5u?=
 =?utf-8?B?aEdrcXBiMVRTbHhwSSsrNnltNzFTMWt3ZTZhWERiNTNqbW5jWEZuUzVCWlEx?=
 =?utf-8?B?V2ZFYyt5cDNHM1RZbkRmN3BnbktvRFYwZWJjOEppS2toUExHVEJXeWtzcVp0?=
 =?utf-8?B?WC96S29KNHVUbmNCVi9Vd0szUHdXdUxrc0ZQVHU5TEhDSzZLbVpnc3ZZVHJ0?=
 =?utf-8?B?S2hxbGIrM2p1emVwS0pmZmczY1ZmRjVsUzgvK1psa1JtSVR6SGRNaXpRVE5x?=
 =?utf-8?B?akIzK1ZmK0dvUjVNc0w0eE1oN3dCTk94UWp1TDIwUEwxSWFlZnhuNmZHRkVM?=
 =?utf-8?B?emFFdkJFbkYzcnFSRnpvNE1sOXpaeE5rTDdUZEdZRC8zWEdYdFllbEpyaTlh?=
 =?utf-8?Q?Fg9fA2Ukge3S2EiwN+EwyPT0CDaK1zPdirzFrjs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d17b9b-efb7-4233-fa4b-08d91ba0050a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 15:00:34.4083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVsx+A+nyOIFQOuubIPSurUioSd4KwBL3FTMNWLk2UNIdTHw7mUBB27wMpIVurfVfr8tV20xI1dUqz/rZr3/PFG/3G2jKdIfd9sCDLJxH+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4024
Received-SPF: pass client-ip=40.107.1.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
> As done in BlockCopyCallState, categorize BlockCopyTask
> and BlockCopyState in IN, State and OUT fields.
> This is just to understand which field has to be protected with a lock.
> 
> BlockCopyTask .zeroes is a special case, because it is only initialized
> and then read by the coroutine in block_copy_task_entry.
> 
> Also set block_copy_task_create as coroutine_fn because:
> 1) it is static and only invoked by coroutine functions
> 2) next patches will introduce and use a CoMutex lock there

this change is unrelated, why not to put it into commit, which adds use of CoMutex in that function?

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-copy.c | 49 ++++++++++++++++++++++++++++++++--------------
>   1 file changed, 34 insertions(+), 15 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 10ce51a244..d2d3839dec 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -67,13 +67,28 @@ typedef struct BlockCopyCallState {
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
> +    int64_t bytes; /* only re-set in task_shrink, before running the task */
> +
> +    /*
> +     * "local" parameter: used only to communicate between
> +     * the caller (block_copy_dirty_clusters) and the aiotask
> +     * coroutine running block_copy_task_entry
> +     */

I a bit don't follow. bytes and offset are used for the same thing.. and bytes modified the same way, before running task, as you write in a comment. Why zeroes is in a separate group?

>       bool zeroes;
> -    QLIST_ENTRY(BlockCopyTask) list;
> +
> +    /* State */
>       CoQueue wait_queue; /* coroutines blocked on this task */
> +
> +    /* To reference all call states from BlockCopyState */
> +    QLIST_ENTRY(BlockCopyTask) list;
> +

extra new-line?

>   } BlockCopyTask;
>   
>   static int64_t task_end(BlockCopyTask *task)
> @@ -89,15 +104,25 @@ typedef struct BlockCopyState {
>        */
>       BdrvChild *source;
>       BdrvChild *target;
> -    BdrvDirtyBitmap *copy_bitmap;
> +

you add an empty line before group, it looks good

> +    /* State */
>       int64_t in_flight_bytes;
> -    int64_t cluster_size;
>       BlockCopyMethod method;
> -    int64_t max_transfer;
> -    uint64_t len;
>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
>       QLIST_HEAD(, BlockCopyCallState) calls;

but not here..

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
> @@ -115,12 +140,6 @@ typedef struct BlockCopyState {
>        * block_copy_reset_unallocated() every time it does.
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
> @@ -176,9 +195,9 @@ static inline int64_t block_copy_chunk_size(BlockCopyState *s)
>    * Search for the first dirty area in offset/bytes range and create task at
>    * the beginning of it.
>    */
> -static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
> -                                             BlockCopyCallState *call_state,
> -                                             int64_t offset, int64_t bytes)
> +static coroutine_fn BlockCopyTask *block_copy_task_create(BlockCopyState *s,
> +                                                BlockCopyCallState *call_state,
> +                                                int64_t offset, int64_t bytes)
>   {
>       BlockCopyTask *task;
>       int64_t max_chunk = block_copy_chunk_size(s);
> 


-- 
Best regards,
Vladimir

