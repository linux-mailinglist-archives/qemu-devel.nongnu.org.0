Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5A3313B44
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:44:54 +0100 (CET)
Received: from localhost ([::1]:52794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Aaj-0008P1-Iu
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l94c9-0006wg-HX; Mon, 08 Feb 2021 06:21:58 -0500
Received: from mail-db8eur05on2127.outbound.protection.outlook.com
 ([40.107.20.127]:60128 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l94bx-0007sK-7e; Mon, 08 Feb 2021 06:21:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T68B3gVHln2SEimIiors5Fwp0QYGgmb69pFVBvYgJUOcpfkGTPxlMdeMCmUozQQnOFQ8T7KoMP6P3Kx36AvZNSKwUmiprbS830qgg3PLEgK1zafXS47m4/oeCPRdXBVkZRHG9owx2XQhcZFqLMSgo1w7GyWtXFSfrnuUQQ2r51BCtTTw2f92MOcdGCnifIDLJKg97HAjDxsMgrg/j3LTqKolKt9E3LeL8zoSQd6qnMsI6QG9ONniZTPgXqZ1TGgUR6nluWVKFreJ7d5wWl9G1JlnzGZrjLTUBYWPyfhyNIwH4WNJX+5XbyPf7YVo5d3J8u8sqq1ESh+L/Ah8kgbf5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQJWrb8nyvUVju11mtkFO9wcJ8sPjUC1zVTba/lfMSc=;
 b=hqrUN40mJjzlW2gFx0JHbJYeaGM4QfoHBgkQZ9S21c6LSlv0UvwKUAQdo3aG7K7AClxAoevAkdDupAbwZtrT+BbMnhnhlMlNG8Kot5vSvLZK1Ph6+BtTuR84N8Jm9D+dCIotpZZta/4/LIwe3cBZRlygXxDe4WDiuVZeMUDwqlZUa4QErlpUF8jAM3T6MMS6tQEisPgnffc0e6Pw1b0ltXDlpV9IIlUE1AjnssyWNVDc0OgUmkuSWfEF3AsoobS6H60QiKBrHfMb5EHsn1Ar3sIKkJreaprD/eelhxISeos/D9OXLhFb55tL02KtT+xXu3sVoGza8rAkiQTtPyW1hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQJWrb8nyvUVju11mtkFO9wcJ8sPjUC1zVTba/lfMSc=;
 b=RoICFxCbZrZu0BXrDRbxxhTzrQhnvt3RDzYsVwEnYtW8RsWYDuqbqMh/aHMHzPA/D8XoB9dN3qyjkj+ES+S6YV7VNGjlPni63P5RkXUIflPhGqvlmz5antO3cx5MwJVNmzGbA8BSakwiduKvzFzRpk0rU/RcqeN4fcaFaoDRv1w=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6117.eurprd08.prod.outlook.com (2603:10a6:20b:292::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Mon, 8 Feb
 2021 11:21:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 11:21:37 +0000
Subject: Re: [PATCH v2 30/36] block: bdrv_reopen_multiple: refresh permissions
 on updated graph
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, mreitz@redhat.com, den@openvz.org
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-31-vsementsov@virtuozzo.com>
 <20210205175706.GI7072@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <88b2a88e-e5dd-9ce6-a11c-20ba2c4befa9@virtuozzo.com>
Date: Mon, 8 Feb 2021 14:21:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210205175706.GI7072@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.199]
X-ClientProxiedBy: AM0PR02CA0081.eurprd02.prod.outlook.com
 (2603:10a6:208:154::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.199) by
 AM0PR02CA0081.eurprd02.prod.outlook.com (2603:10a6:208:154::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Mon, 8 Feb 2021 11:21:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06c86469-85e9-489c-9ab6-08d8cc23b2f1
X-MS-TrafficTypeDiagnostic: AS8PR08MB6117:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6117006AAD3A6973E1DA0A71C18F9@AS8PR08MB6117.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fvpGu9I76BZlaxRcmxMO4mpgZw/3OQzKgmaSqxbUFwQ1ji0T+MGcoE110mMSmL3xKqjRfWtZjurvpaXlvvdMC/yKLzvOLjzNcHYoHjWYyl4UoOxpqMimpFyK9i2Aa47sRHoQR5PV+d2sfMwIJKrKzzGHProEoPiF9gctxl9e6AAth6N/A6/hEirmMZea7RLmv3KObGIEIfURgiUuHttL4qQgx9PzOFkAIO7t/No669qtVahTQA+JRydlXlFSuFfDAzKARO5cepETbJbh7P1rTosdBK2gSkM6BGESIABRZwoZmsf7U/B5At5BPAkcsPnrADRMTOv/KtFqGIM19OhhlCjjXZrOLXKFPQcdxs98hhHaLhsA04vH3cK8mGF6hBaY/gy0wPSaITP+T+ppzm+awMYinfox9kFznYzeAa3DuN9MgffaA4Hj2ukjNEM8oPA8+KaCAvU3PDyxJaoaLXzsI1ZtNM9rXAK5u7Y4rveoz4wurCyjyeEupHb8SVxs7swOGJaoGfmwE2ghFIzmUvnIuAZq9VQqsf7ilyRMLpQ4FTTmMCvHu/Bxoo22uI/cBsHQkTe1GI7dsND5C0Caf76ZQPSdc9HIkRL3mAtZ1HfBNxs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(136003)(366004)(396003)(346002)(26005)(6486002)(52116002)(83380400001)(16576012)(2616005)(4326008)(31686004)(2906002)(8676002)(36756003)(956004)(6916009)(316002)(16526019)(186003)(15650500001)(8936002)(66556008)(478600001)(31696002)(66946007)(86362001)(107886003)(66476007)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L0R6Y3JTL3FRQ1FPa1BvNktzRG5CeUFJNTRjbUk0OGNWajZGQVdmSjIvZE5m?=
 =?utf-8?B?eVErS0FPdFdNaWRuUmFRcVM3cjlQM3I1dkx2OXJWNXVObGlhOUIrY24rZlNW?=
 =?utf-8?B?RGR6WjFPN0d2b2loVm9rRHUzVjlPNEFHT2o0c29kcm5FcjNaTi93WHloczBX?=
 =?utf-8?B?eWQ4TW0zMGJXMjA3VjVQSllqOXZRMHgzaGhtWTlaVEUrUlNhOE5xZldrU0FN?=
 =?utf-8?B?NnlaS3FHa0Q3S010aGVPbU8zV3A1blBIVzhoZTNkR0ZTS3BwY1RoSUlnOHQz?=
 =?utf-8?B?L3hlN1Q3N0ZIVEJ2TGxXbk9OTitGcmFxVGpqRElIQWFjeUhwTHB5SkpwUldt?=
 =?utf-8?B?ZVhncnhKa0RPcVRsVWMxR3JCUUdtYlN2Ymt6THZIdzAreU9kcUs0RWdzUFhG?=
 =?utf-8?B?NkxuQ1U5NW1qcEk0LzJQRHd3VTg1OUtSaWtOdzU5TWtsQXhFakptamN3NVhn?=
 =?utf-8?B?SklaUlovbHlDWGE3VW1zVXJxQzRUTWVBbEsvUkRRRG5yNHNYTlM1a1pGbE5D?=
 =?utf-8?B?eXl6ZnNoT0sxN25TTlBwd2JiL3UwbzhoS0ZMREVaRENSNnJrY2dKNVNnQ3BH?=
 =?utf-8?B?SXlJTUFDcHFzby85QjY1TkNNNGw0ZWtZVUdUU0NieXlMdHRxSm1qWHNZWjVK?=
 =?utf-8?B?a1JROEFXUUlyc3FaeFNwTWNWbmpmVWNjRERKNStFemF4UWJFQU9KbGJ1T0tq?=
 =?utf-8?B?OENoQXJrWkE0QXJOQ3ZJUXBaUkNERWFaYXRRdndjTElzc2JBbXhlZTAxSFBN?=
 =?utf-8?B?OEtTTlFiSm1rZGJwZml5YWZnS3NLamxsamNoSU1Hc0dXbFVOMmhNRnVwSHlj?=
 =?utf-8?B?UXBTaGpiUSsybkJiY1ZQb0hYUXoxWHRaazBic202ai9hM0JwSmxWeUVHU0hH?=
 =?utf-8?B?amhwTmY0OVIxY3R1V1MvcVp2Mk1UUE91ZGdtNU9BSXVrR2Y0S3FuZ21mazRv?=
 =?utf-8?B?VXZUS0R2cWwwYW1kSzlxVHRsRmpmMGVJck1BSkxheDdlNVJseGtvR0xnbFNi?=
 =?utf-8?B?dllpSjJPRG1XS01RVzZkUmNXcFgrcWphTWErYTg2SCtXNkJSRmxKazJzVi91?=
 =?utf-8?B?SWhKMENURDRqMURGbEQzNkZ6ZG5DZDhxTEJYS2NvRk1KaVdtMnRmdVpPNzRa?=
 =?utf-8?B?VTM0a2c0VW1SRnlNdlplQ2lJY0haV3ExekRoQVdKUXlNeXJmSkVSZUNUNWRC?=
 =?utf-8?B?bjc5V3dvbVdZZ0JjNnV3MEdhZGErUDllRHdwbU9GdHhCb0E3SWo3eVBCcEhT?=
 =?utf-8?B?OTZTbDNxWkNxdUpxQVRKS2ZNR3cyZVg1d3I5ejZQdlM2VVlnR25PZ3kweG03?=
 =?utf-8?B?eVc0YUdQVW5aSTVTQUQrZVU3aWFvUkpITUppaWhwamZmNzBDeXFaK09qWWJ6?=
 =?utf-8?B?S0E5bHNGVnc4bHRocm1EUFowa1M3SWFxRzA2QzhVQWhRbXBmNzdDd2R6L3hZ?=
 =?utf-8?B?dUgraXNJdEpyK0sva1VRWW96d05QWmE5d2Zvd0hwbGErcmM5YjJUY29pd2ln?=
 =?utf-8?B?a1FPQjY4TU5HZ2cxQW9PU1VYY21SMEF5aFQzNjUycTk3UyttSjBkRnA1eVkx?=
 =?utf-8?B?SERyQXZ0ZEVtNDZpajI1OE1oZ0VseWJaUEZBOVRUUHUwQ2F0V0VFVHMvWnhn?=
 =?utf-8?B?NU5CWENQOENVZ01ucmZydmpjeEloUmQ0TjY2dUN1blZCbHJZS3dwRHQ4dDZv?=
 =?utf-8?B?TEo1UVp1bFZmRlVtQWtDMWdJcXdualRpNUxEYVJpSEV4MmNOTXZkcDAyV2tT?=
 =?utf-8?Q?tUkH3ULCX9OXBzYN+GGSYUtWv5FDS6o95hef7xD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c86469-85e9-489c-9ab6-08d8cc23b2f1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 11:21:37.2548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tC283V6NVQIV5sibnKmG37KNvYqyqx/Fu5wCzsgcP+S2FGzpL1T0pvKkv5NUciYeTfBnXrDeJZPhOxrpOSIa228v7FSR62ogDk3aQ/cJuv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6117
Received-SPF: pass client-ip=40.107.20.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

05.02.2021 20:57, Kevin Wolf wrote:
> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Move bdrv_reopen_multiple to new paradigm of permission update:
>> first update graph relations, then do refresh the permissions.
>>
>> We have to modify reopen process in file-posix driver: with new scheme
>> we don't have prepared permissions in raw_reopen_prepare(), so we
>> should reconfigure fd in raw_check_perm(). Still this seems more native
>> and simple anyway.
> 
> Hm... The diffstat shows that it is simpler because it needs less code.
> 
> But relying on the permission change callbacks for getting a new file
> descriptor that changes more than just permissions doesn't feel
> completely right either. Can we even expect the permission callbacks to
> be called when the permissions aren't changed?

With new scheme permission update becomes an obvious step of bdrv_reopen_multiple(): we do call bdrv_list_refresh_perms(), for the list of all touched nodes and all their subtrees. And callbacks are called unconditionally bdrv_node_refresh_perm()->bdrv_drv_set_perm(). So, I think, we can rely on it. Probably worth one-two comments.

> 
> But then, reopen and permission updates were already a bit entangled
> before. If we can guarantee that the permission functions will always be
> called, even if the permissions don't change, I guess it's okay.
> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/block.h |   2 +-
>>   block.c               | 183 +++++++++++-------------------------------
>>   block/file-posix.c    |  84 +++++--------------
>>   3 files changed, 70 insertions(+), 199 deletions(-)
>>
>> diff --git a/include/block/block.h b/include/block/block.h
>> index 0f21ef313f..82271d9ccd 100644
>> --- a/include/block/block.h
>> +++ b/include/block/block.h
>> @@ -195,7 +195,7 @@ typedef struct BDRVReopenState {
>>       BlockdevDetectZeroesOptions detect_zeroes;
>>       bool backing_missing;
>>       bool replace_backing_bs;  /* new_backing_bs is ignored if this is false */
>> -    BlockDriverState *new_backing_bs; /* If NULL then detach the current bs */
>> +    BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
>>       uint64_t perm, shared_perm;
> 
> perm and shared_perm are unused now and can be removed.
> 
>>       QDict *options;
>>       QDict *explicit_options;
>> diff --git a/block.c b/block.c
>> index 617cba9547..474e624152 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -103,8 +103,9 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
>>                                       GSList **tran, Error **errp);
>>   static void bdrv_remove_backing(BlockDriverState *bs, GSList **tran);
>>   
>> -static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
>> -                               *queue, Error **errp);
>> +static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
>> +                               BlockReopenQueue *queue,
>> +                               GSList **set_backings_tran, Error **errp);
>>   static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
>>   static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
>>   
>> @@ -2403,6 +2404,7 @@ static void bdrv_list_abort_perm_update(GSList *list)
>>       }
>>   }
>>   
>> +__attribute__((unused))
>>   static void bdrv_abort_perm_update(BlockDriverState *bs)
>>   {
>>       g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
>> @@ -2498,6 +2500,7 @@ char *bdrv_perm_names(uint64_t perm)
>>    *
>>    * Needs to be followed by a call to either bdrv_set_perm() or
>>    * bdrv_abort_perm_update(). */
>> +__attribute__((unused))
>>   static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
>>                                     uint64_t new_used_perm,
>>                                     uint64_t new_shared_perm,
>> @@ -4100,10 +4103,6 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
>>       bs_entry->state.explicit_options = explicit_options;
>>       bs_entry->state.flags = flags;
>>   
>> -    /* This needs to be overwritten in bdrv_reopen_prepare() */
>> -    bs_entry->state.perm = UINT64_MAX;
>> -    bs_entry->state.shared_perm = 0;
>> -
>>       /*
>>        * If keep_old_opts is false then it means that unspecified
>>        * options must be reset to their original value. We don't allow
>> @@ -4186,40 +4185,37 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
>>    */
>>   int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
>>   {
>> -    int ret = -1;
>> +    int ret = 0;
> 
> I would prefer to leave this right before the 'goto cleanup'.
> 
> Not sure if I fully understand all consequences yet, but overall, apart
> from my concerns about file-posix and the potential AioContext locking
> problems, this looks like a nice simplification of the process.
> 
> Come to think of it, the AioContext handling is probably wrong already
> before your series. reopen_commit for one node could move the whole tree
> to a different context and then the later nodes would all be processed
> while holding the wrong lock.
> 

Probably proper way is to acquire all involved aio contexts as I do in 29 and update aio-context updating functions to work in such conditions(all aio contexts are already acquired by caller).


-- 
Best regards,
Vladimir

