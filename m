Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4222FA76D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:24:47 +0100 (CET)
Received: from localhost ([::1]:55132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YGj-0008SZ-Fw
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1YDR-0005hH-BC; Mon, 18 Jan 2021 12:21:23 -0500
Received: from mail-eopbgr10126.outbound.protection.outlook.com
 ([40.107.1.126]:13434 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1YDN-0003N8-GJ; Mon, 18 Jan 2021 12:21:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kk0oILb/XKX97FkIRuWczCJsmoAtfH1EHqsGAbtJzbUy8ECluSAthbmBEg+9itzYM5RvcARVvUPUmiXjONHMNFE13T3mS53saQqOj/o9Rc6W0THYu89O4La92DsIY9/TJ7DNdjIDxPmgYwesnv5TFWsG1+AjUXknRHRVP6jaJvoNNqu2re33bQTSrK6pm6dtb1Cct2VAY4tFFhyxjDyaNMaErFtjWOMpzXAzzGlPST41AN3w9mR6Va3Kx/3K1XyQQ0ZryxvVArMbjVyRRHKfEI23d4BVfxAAz4SC7xwmuGthSOcYAtmzRcMCLtdYy+zxEg8s+w3T1cTD4/1Bo+IcXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRSrKnurYwrAiwzlkHhE3shx3+EJ9uXLWpTQk8z+1x4=;
 b=G06jt2ju+1oDBDFVS0M5Q4+zeTBBueVHOAhWbs7/nUQlJDyHfHL0dBIVfxWoFgMrscWw8zxf7e7BMsKf1iv0JuOWzlIQZPY3/JAuZ0F+3PlS4ue36rYSgMpaDbWjZwBhgih/P8GbE4Vtr8sldhQVaMNJEHbomEirtU3Mw8BvrWOnOEdrWy/bzTyWgsLqgBPIESWAiIUGUkeXdbilIyS6WbotI82BG4UeRiH5nyMjB3uENpu3cyqmTZ7iqHyT580iBaMzvhq/+SBD5u2SvZHBFug0P9LvmZR0iQfHfgH1VcuZXKK7h5i4gRCfxI2A2HHoQBF7KdLoXuApGx2AWBOBaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRSrKnurYwrAiwzlkHhE3shx3+EJ9uXLWpTQk8z+1x4=;
 b=jgMBAK1b8xjIbQDxAAklLx4K/XvhRFM7m7GX+kfGW0AekdiEIWXZ6GwGqGQK3oxWwQDNajbYq6izM++Q69ZQ/LVY99ZhRWvzwgAk7CGvFzXoA1daUvOh4VDcuuYc4wyBaWIW6z/UxG01B4IV58HFk5tcYZCsPQ2A+/pSq23zN4A=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1908.eurprd08.prod.outlook.com (2603:10a6:203:4b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 17:21:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 17:21:13 +0000
Subject: Re: [PATCH v2 03/36] block: bdrv_append(): don't consume reference
To: Kevin Wolf <kwolf@redhat.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-4-vsementsov@virtuozzo.com>
 <20210118141820.GD11555@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d1f414b0-9cdd-a715-0310-64f34191c1a9@virtuozzo.com>
Date: Mon, 18 Jan 2021 20:21:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210118141820.GD11555@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.76]
X-ClientProxiedBy: AM4PR07CA0023.eurprd07.prod.outlook.com
 (2603:10a6:205:1::36) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.76) by
 AM4PR07CA0023.eurprd07.prod.outlook.com (2603:10a6:205:1::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 17:21:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 780ea3cc-9ec1-4289-c727-08d8bbd5744a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1908:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1908B52359C853D023B449AFC1A40@AM5PR0801MB1908.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WeKg1+rN41IkmE3FwkCrolYnZCPmFjCtj8RRLZ+fEwt+BuOui3clBT8l4WaAxw5f5Kbmo84XY9JHUyMRz78kad4ponarO/ZvdpObhaL/xjrAS5utgSBVl+hE8Bf4z1ZX+D/5CDZRAbXPGfWpw/wQdT59LN9CG+qNKSO/XE7/dzMrOU4lX1bkELWaVn6QgnaCLyppbG5geAbCZolFesca+rbq0PDWGHkj58IW8Kmicqhll7M5YT51AS4RMOhl7nWPx5wu34oZgvcr0TiuYLsUomgLNAV3WEbfY8Tfk+lFVp+PyqJErUVip9CSoO1mkpcmzzFBmhwUDBG5KmF1xPVxuCKIuL6eYMQUxQvGKTGx1oVlpnIqFAuOS6pUHEvBptdijOfVrlSL55pBxhqm3rwsOfevKutuOcuejTRuHPbBQSFh5RYj3ueDR9409cv0CnJjd0PBRVukRnwASYyNPKpHndVTtYsSOWto79rafHSL0WU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39830400003)(346002)(376002)(316002)(6486002)(86362001)(107886003)(8676002)(2906002)(52116002)(2616005)(36756003)(31696002)(83380400001)(956004)(4326008)(31686004)(16526019)(5660300002)(26005)(16576012)(8936002)(66556008)(66476007)(66946007)(6916009)(478600001)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b3lnby9TWkx6STd1ZkIrK2thZ0NGNld4R1B4cytwTTJBTVVWOFNCYXNFQ3F6?=
 =?utf-8?B?MTZJaENBbnY1MDhrUG5aZ3MxZ1IzYkZBWTU5VXhWaEJPck96S0tVbllsTEtO?=
 =?utf-8?B?UVNnS3BrQWJKU3c0N3ZJKzRSMjc3TkpyR2ZWTGlMMFp4WTFsbTM2ZVRVeldw?=
 =?utf-8?B?OHlEdHB4eURCTmZyVGcxeUIySXlBT0RtU09pZExEaUkzOENKMkFnS2ZwWEQv?=
 =?utf-8?B?djU5d2hvcHUwK1luNEFYUlRNVjhGcWpodDYvYTRGbGdvZCtZRm5ZbWx1VG4w?=
 =?utf-8?B?L1RZMDRsWmY2aGlZYjU2MW01VXhnbDFBK0hlNThtM1BKWDNvalhIUEgrOWps?=
 =?utf-8?B?Zjh6dHNPNGFaMDZhZnBRT1JET01GRzIveVRGNUZHT29mbW1zaGhENHE2U3Bt?=
 =?utf-8?B?ZiszOUJ5U0U5UVJZdm91VWVLREpHeXk1RndURmVwc29DZHdoSGQ2OFF6RFAr?=
 =?utf-8?B?enVCK0pBUUhkeU9ER2FzTUF6NDVUeWpEYUFHZ0YzV25Xd1JyVnU0N3R4b3Z1?=
 =?utf-8?B?VXVLU2xHMXp0UktENi9UM0orcDc1Yit5VmtDamFFbGNMZFF1UHVwZkJNQVF4?=
 =?utf-8?B?L2p3ZE93OCt6RVpFRmRyTTlUSWltRDl6ZVdCMjN0SFY2Wnc2SnVtSEFpSnoz?=
 =?utf-8?B?a1drcitFcmppYVhSNmYzQnlJcnRDZ1g5MWVzOHBVbkFCeTFjZjRvYXpEVFhj?=
 =?utf-8?B?S2R4WU1jQkU0RnlzcUFMQTBPcERpSDZSRG12b0NjZlUwRUJzN3N1bUtBTEto?=
 =?utf-8?B?c2IzeW12eisybTZGZEp5WGVERHFxVGZqSXlwT2ZwR0w0NzJkSjdTdEs2MW05?=
 =?utf-8?B?SEhjZW9Rd2lmZTBZMCs1RjlQblJPMURkd2ZtRXN2dmJFVWg5TTFkR2dFMlhG?=
 =?utf-8?B?OTlrdmJQZU9NQng4d1lYWDNpbDhKRzFsY1hsdS80SkFzbElTK0RWVlF4VjNI?=
 =?utf-8?B?a2F6U3Y0U0FhYytkUTFjeC92Qm81SkV1VVFXb0hBTkQzYW5wcEp5bmZJdUtW?=
 =?utf-8?B?clE4b1pDbkNTUjUwQ2JoMThBVGZJT2tUcXpCNW0vYThJLzVkN21YNENRNGpX?=
 =?utf-8?B?em9LdUdiUDJmQy9lRCtGcFJuaFhJZnRZZ2dQMTJKSDZMdTFqZ3VYTEtpSWl3?=
 =?utf-8?B?TjlHTERHSm9ZSVVxY2ZWUGlZYWc4b1dlUnR3UlFrWjNKaEdRMnFOZDhtckRO?=
 =?utf-8?B?RjhHSU1welN4RnJ4eUpxZkpDdThwMHBiam1GTUR6SHlncC9qbXA1anpqM1Ez?=
 =?utf-8?B?K1F0Tkp5bTA5dDNwWithbERDVlY5d3R0V0piak1NeVQ3ZFdiZGFFcmlBYVk1?=
 =?utf-8?Q?mZboBeOU2Jxpe+7+i7n5Iqt/z5NjHgX9DC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 780ea3cc-9ec1-4289-c727-08d8bbd5744a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 17:21:12.8780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sab7+ytEFlXBWW+qmeazMe9/86tmHoytfEuE0V6agUyYbnhOS42iiVaesyRdw4qbZwoaBY1FpiQimsC/08qMAoy/x5rqNdKuebFcn12ryg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1908
Received-SPF: pass client-ip=40.107.1.126;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

18.01.2021 17:18, Kevin Wolf wrote:
> Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> We have too much comments for this feature. It seems better just don't
>> do it. Most of real users (tests don't count) have to create additional
>> reference.
>>
>> Drop also comment in external_snapshot_prepare:
>>   - bdrv_append doesn't "remove" old bs in common sense, it sounds
>>     strange
>>   - the fact that bdrv_append can fail is obvious from the context
>>   - the fact that we must rollback all changes in transaction abort is
>>     known (it's the direct role of abort)
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block.c                     | 19 +++----------------
>>   block/backup-top.c          |  1 -
>>   block/commit.c              |  1 +
>>   block/mirror.c              |  3 ---
>>   blockdev.c                  |  4 ----
>>   tests/test-bdrv-drain.c     |  2 +-
>>   tests/test-bdrv-graph-mod.c |  2 ++
>>   7 files changed, 7 insertions(+), 25 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 0dd28f0902..55efef3c9d 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -3145,11 +3145,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
>>           goto out;
>>       }
>>   
>> -    /* bdrv_append() consumes a strong reference to bs_snapshot
>> -     * (i.e. it will call bdrv_unref() on it) even on error, so in
>> -     * order to be able to return one, we have to increase
>> -     * bs_snapshot's refcount here */
>> -    bdrv_ref(bs_snapshot);
>>       bdrv_append(bs_snapshot, bs, &local_err);
>>       if (local_err) {
>>           error_propagate(errp, local_err);
>> @@ -4608,10 +4603,8 @@ void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
>>    *
>>    * This function does not create any image files.
>>    *
>> - * bdrv_append() takes ownership of a bs_new reference and unrefs it because
>> - * that's what the callers commonly need. bs_new will be referenced by the old
>> - * parents of bs_top after bdrv_append() returns. If the caller needs to keep a
>> - * reference of its own, it must call bdrv_ref().
>> + * Recent update: bdrv_append does NOT eat bs_new reference for now. Drop this
>> + * comment several moths later.
> 
> A comment like this is unusual. Do you think there is a high risk of
> somebody introducing a new bdrv_append() in parallel and that they would
> read this comment when rebasing their existing patches?

Or even later, someone may remember that bdrv_append() eat the reference, and then face some strange behavior with a new call of bdrv_append(), finally go to check the function code and see the new comment.. I don't insist, we can drop the comment

> 
> If we do keep the comment: s/for now/now/ (it has recently changed,
> we're not intending to change it later) and s/moths/months/.
> 
>>    */
>>   void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>>                    Error **errp)
>> @@ -4621,20 +4614,14 @@ void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>>       bdrv_set_backing_hd(bs_new, bs_top, &local_err);
>>       if (local_err) {
>>           error_propagate(errp, local_err);
>> -        goto out;
>> +        return;
>>       }
>>   
>>       bdrv_replace_node(bs_top, bs_new, &local_err);
>>       if (local_err) {
>>           error_propagate(errp, local_err);
>>           bdrv_set_backing_hd(bs_new, NULL, &error_abort);
>> -        goto out;
> 
> Can we leave a return here just in case that new code will be added at
> the end of the function?

sure

> 
>>       }
>> -
>> -    /* bs_new is now referenced by its new parents, we don't need the
>> -     * additional reference any more. */
>> -out:
>> -    bdrv_unref(bs_new);
>>   }
>>   
>>   static void bdrv_delete(BlockDriverState *bs)
>> diff --git a/block/backup-top.c b/block/backup-top.c
>> index fe6883cc97..650ed6195c 100644
>> --- a/block/backup-top.c
>> +++ b/block/backup-top.c
>> @@ -222,7 +222,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
>>   
>>       bdrv_drained_begin(source);
>>   
>> -    bdrv_ref(top);
>>       bdrv_append(top, source, &local_err);
>>       if (local_err) {
>>           error_prepend(&local_err, "Cannot append backup-top filter: ");
>> diff --git a/block/commit.c b/block/commit.c
>> index 71db7ba747..61924bcf66 100644
>> --- a/block/commit.c
>> +++ b/block/commit.c
>> @@ -313,6 +313,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
>>       commit_top_bs->total_sectors = top->total_sectors;
>>   
>>       bdrv_append(commit_top_bs, top, &local_err);
>> +    bdrv_unref(commit_top_bs); /* referenced by new parents or failed */
>>       if (local_err) {
>>           commit_top_bs = NULL;
>>           error_propagate(errp, local_err);
>> diff --git a/block/mirror.c b/block/mirror.c
>> index 8e1ad6eceb..13f7ecc998 100644
>> --- a/block/mirror.c
>> +++ b/block/mirror.c
>> @@ -1605,9 +1605,6 @@ static BlockJob *mirror_start_job(
>>       bs_opaque = g_new0(MirrorBDSOpaque, 1);
>>       mirror_top_bs->opaque = bs_opaque;
>>   
>> -    /* bdrv_append takes ownership of the mirror_top_bs reference, need to keep
>> -     * it alive until block_job_create() succeeds even if bs has no parent. */
>> -    bdrv_ref(mirror_top_bs);
>>       bdrv_drained_begin(bs);
>>       bdrv_append(mirror_top_bs, bs, &local_err);
>>       bdrv_drained_end(bs);
>> diff --git a/blockdev.c b/blockdev.c
>> index b5f11c524b..96c96f8ba6 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -1587,10 +1587,6 @@ static void external_snapshot_prepare(BlkActionState *common,
>>           goto out;
>>       }
>>   
>> -    /* This removes our old bs and adds the new bs. This is an operation that
>> -     * can fail, so we need to do it in .prepare; undoing it for abort is
>> -     * always possible. */
> 
> This comment is still relevant, it's unrelated to the bdrv_ref().

I described in commit message, why I dislike this comment :) I can keep it of course, it's not critical

> 
>> -    bdrv_ref(state->new_bs);
>>       bdrv_append(state->new_bs, state->old_bs, &local_err);
>>       if (local_err) {
>>           error_propagate(errp, local_err);
> 
> Kevin
> 


-- 
Best regards,
Vladimir

