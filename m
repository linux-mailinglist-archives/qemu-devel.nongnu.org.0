Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9764597F4D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 09:36:38 +0200 (CEST)
Received: from localhost ([::1]:51116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOa4z-0007hZ-DN
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 03:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOZzw-0005nh-8a; Thu, 18 Aug 2022 03:31:25 -0400
Received: from mail-eopbgr60118.outbound.protection.outlook.com
 ([40.107.6.118]:11561 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOZzs-0003qC-SX; Thu, 18 Aug 2022 03:31:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccR6lbeIyTqbF20B08tmKQZnobhaNNh8GlsEAN+rWrPmdxL50P02ZKaVqIeSzt24MWUP60FDGu8afzC5QF+mr/FkoPMxjug1e9VqvyA2SCHZof6p80pVZY8+D2DwvaBa/fGvJU1ywSzmqxCBBjOMTCvE0rgrpO0V8nKg3kbWl9GcJRvKTILKwl/6XGxwTBMppa6c3b2LihSB4nCb16KtwICD1r1wv3OA+o2heHvy6gPpxpOqMtP9jcGtVdvrgcaloZVxmPMKL88XjPBgKB27i6+I49CIdqntHIpH3RFHnsJXQxVNFvBXS7nlNyWeTkBXGtzuSQ+lKsSwYJvnrN65Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtGSx+NgLcxvF8tj66rww0EUXt56OelQF52HezaEcHQ=;
 b=meFP9XF8mIGeQbApGi/APh6hs8zQFrnjWCYjwwQW/Q+ScmoFiq7IGr2aExwh+DfGiXsiZ+B2iOWOxsdGPMIjOwdDVaHVi0TfvLt6m4IumbcaYPO+09oji+locA4AeAX2QSzgpxVHmQpu6PUixo9Raa/Qg7dbOAAcB9nzyQ/9mqqqIdrhNPBsclNtJjDxrUo6SnSDdOObnZIq3MGg3yh16sP1EtjYflxY/yhPrXIMMSopuH8D9YUMPcCOug9sveHoPis9phJkgbgEMZIMt8IBel1S/rdVVBn7d3XYrj6U0VPgVZlaMNUz2ipdMyLvH+0ql94Fm0tNRGgGHcrBP6ImaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtGSx+NgLcxvF8tj66rww0EUXt56OelQF52HezaEcHQ=;
 b=e7ML40ZA1zvKz89Kl2Di+wUO/UY0xgC391HyXWqr5GFBnc6cRX7MLIU8gSMYpNOXUbG7egHXlAFm9rZ3hk0Pd+JsEtIImQIEIsOoJqy9BaHIPlSnV0n4UUglqvSizMTVKU9XggdbdUyx9tsFEpAZ4QRwpCSb6CfNeF1TQcODZfgu1ICufpHmp4XCVXx8BZv3qWxZHTh2hIJhYN8fvh1Ji8XeAQBTbmqCMIzrlwy0H/M7yHiKp4/zAdzvs0J00su1okd3hql3mxrIpDOXwiH8HhwHXdqjRhAQTVWQqumjtDvK0RUvvhzD/sU+pVvs0154Nq3fz9tClGifpE6mrbyf7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB6PR08MB2694.eurprd08.prod.outlook.com (2603:10a6:6:1f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Thu, 18 Aug
 2022 07:31:15 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 07:31:15 +0000
Message-ID: <2ff378ce-c732-307c-b1e2-33570b78b2e4@virtuozzo.com>
Date: Thu, 18 Aug 2022 09:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/8] parallels: create parallels_set_bat_entry_helper()
 to assign BAT value
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
 <20220815090216.1818622-3-alexander.ivanov@virtuozzo.com>
 <c35ccd2f-ac15-c5dc-e817-a81e86ebddac@yandex-team.ru>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <c35ccd2f-ac15-c5dc-e817-a81e86ebddac@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c222381c-e0db-4cbe-e67d-08da80eba224
X-MS-TrafficTypeDiagnostic: DB6PR08MB2694:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J1hP1UzgUyArFywyL2VSXzan0WgOM4ZJDdP/MYVDCzUSOZq2x1jVpRSlz6V3jr4zUqn5F9deRvTi7JdT6mWG+NhBRJwbk8if8dBErhhrPKWB6za3r9np18os9dFiCEqTL9EomdkmQFAPQpLJEPqoQtQn8dxYI8/ALpt7v7Hk06wQDia/Dx7rGGCGq6nWFzkJUySWiQdrgdU9DrBtdCiExLQ6l6GOlga7kYKOR/99FuJTWd+0Vnh6SahgIpxwe09dPWIODEeA6LRnKHvWwdcSDjZqZjL2fhDLVC9SgxiXDWbSTgcFBbVF4RhrcZipVnUXBX1tVdfgmO/qohZkqEMzNMjn7WOzxQq4LOQRuSNxPHHik1pKhSol83sdKGPH/J0alHkHKfIuaHExDCVv6MWgyuMGLPd1DBGrDOZxQJK4vtfk+YLY9k/8gZ5wfm8xVqG7maYuQTbAgTXhD0b8bNjwZFxccCJi7iA9OlMpscGAP15iypiIK27BkL6qVKUe607/ncGLh3JVdNb+a+ryGj6TmoQTFw4qWCXeSLNT+x/P2bdfqk7WXbrl8gQnZ45jynwSjBzxSnpbKFu5JauPDcko66036LYyAauq80+aI22wBvdhPEI1ukaROoOzS3lv+24jlL8GhZ6IqaUdNasQHpBsv+VlySrKrZFE2R5midhApvWdUcq77qZotePEX+0QGJVXN3rblLRdwrGnbPkldqMiJsVVRfIaEzxrsAdk6BxjPvFFpQDFrZiPkdUtbZ0BD0e1Zj2Hn8Ta7Xwl6wQhuDmJIhecLFbWfVCCTnZ8HiiAAnBcESfHAbsbWlO04LuWZz2LVPkjcHN9BDe6wFrotr4fNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(39850400004)(346002)(366004)(376002)(36756003)(31686004)(186003)(6486002)(316002)(2616005)(41300700001)(52116002)(26005)(6666004)(6512007)(4326008)(8676002)(38350700002)(83380400001)(66946007)(66476007)(66556008)(6506007)(31696002)(2906002)(38100700002)(5660300002)(8936002)(53546011)(86362001)(478600001)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHdOVk93Zk8ranRtanJodDNkVmN6QVdvbVJ6WXI2cXprNFFlMkpSUG5tbUp0?=
 =?utf-8?B?RTZ6RHdiU2Y4UFF2T05yLy9Bdjlab1V2djE4eVUzVm9NTzY4RTlidzRTUWNs?=
 =?utf-8?B?emg0b1lDMW1KN0Z3TkxBS1QzcDAvVDMwbWovYVVBbEFzMjU0ZVJLaDNKVTMr?=
 =?utf-8?B?T01ML3F0c29ndjYxcDAvR1YwaEJvcm10dDZlQnlqcVp3ZHZFRGpEME96S3l1?=
 =?utf-8?B?S2N4WnFBR0JjRmF4eDlmSUk3MzVra1hwbTZ0SWpzbTZMTDdaT3FuSzdFNTc2?=
 =?utf-8?B?K0lHTkdQYncvdmlOM2lEVkxXVXhqcCtGbklPNm9xSlhFYUtlM2NSWmZOaWN5?=
 =?utf-8?B?ZUtxeDFUbmdCQ3ljRndNQWphZTFTMEE2dUdUVnJQWkloQTRTU1cyTmRDVWQv?=
 =?utf-8?B?TjY3N0l3N0gxVTJFVEsxT3dhZW1sT05nWlU5RkVia2k1Unh4MlNXZ0JGb0J2?=
 =?utf-8?B?SEF6NWtvSWRQNGRQOGdtdUJGNDhVZmkzVzBoYTNKVUo0bTRBUkswcHIxMzF5?=
 =?utf-8?B?cU1KbjN3RFpNRitIamx3Nm1JaHVoUHhieG1BTjJuODVYVFdYMHNTVzNYUDRa?=
 =?utf-8?B?QTYxUC93TDc5WHlYdVpuY1ZtOW1LblQwSmo3S2g2WUlzbmVPamMraGtyNFpF?=
 =?utf-8?B?QmxnN0p1N2xSSXQ3TVB4eVpCdE00M3ZxR2lnSVd2MHpqcnJXbnZ1V1ZIVVl6?=
 =?utf-8?B?a0FnRzlNbk12cEc1R1lobndyYXdyYUtielo5K1MxR0lCdWp4TWVOVkZYWjV2?=
 =?utf-8?B?NlN5eTBBVE9QTnNuaDlBWWRNOHFzdnZwYUtKeDhocFg5dHBUOVBpSTgzKzUz?=
 =?utf-8?B?R3VYa2JRMzY5NzVYaEo5d0xobUVjVk9zcFZsMnYxL2dzVHNpWnhuZ2JWdE1R?=
 =?utf-8?B?ekJxNXZ5Z1c0bWxpaE0wTkhiSU9jK2pscld0SFdqeTRmZGcrUkxmNWtqM2NR?=
 =?utf-8?B?aUwrd2YrZDFDVGJhdEpjMFd5M0ZwWG8xekdLZEJzS0dzNDB0RTJvcFdpMU8v?=
 =?utf-8?B?T0VUcmtpam4xdkpzTU5JYllJMkV1a2k0UmY4ZUZqSXdrU2NYSmJiQzJya3lw?=
 =?utf-8?B?dXdWbjdTN1Rjb1I5R1N5RVVtbHpWUDZMRVdaRlN5TVhaR0RsT3ppREthako0?=
 =?utf-8?B?NHFzYXNUYnR5eFZMMnowSGp5cDYwMDN4MkdCdWwybkwrbitTQW85QUFmY1hz?=
 =?utf-8?B?UkdoRkc2ZzVvb0tMSkRjMmNWRVVYZUNDeWJYTkJrWUxMdDNudjRYeTA5L0Rh?=
 =?utf-8?B?d1VVMGJyS0ZrakM3d3hlREZLM1F5L01iNmIrcjM1ZTh0eURrbnRLOUFOdUpY?=
 =?utf-8?B?WSthTlZNNjEzb0JjWTFTazE1QjZPS3cwYmR6QnNnSUxJdWZjMGw3czk2MFRi?=
 =?utf-8?B?SHNzeFJTVThKSVhDSnpEQkt6V0trWmtiK1JRWkFBbWJmbE8vZFVEdW42TDAx?=
 =?utf-8?B?bnpDYTV1dWZ4VEdvNEczdWUxQ1BTRDhBZC8xRjlVb3NOelNhdGphTmNzUnVC?=
 =?utf-8?B?ZUhtenA2TWJwbFdDYjVLckkwNXlRcy95aFJkT2pZVFZyZjNKWWE0dXRNTDFZ?=
 =?utf-8?B?RzlTbHZvQUpHekJGVWZVVk1lT1FNbWxoRXllN0o0NWltYU5Mai9sS3NDamhZ?=
 =?utf-8?B?aS9DZi96Z2pkOUFBZ1RCdnVqQ0xJOWkzUDVvcUFtSE0wR2tETEdXSEtZQkRv?=
 =?utf-8?B?Rk4rODAxS2ZEcHVLRERWMlRsT0FWTGNGYmlZZ1FpYzgrQ1orWG5SYkIxRFZl?=
 =?utf-8?B?NE8rWG9FcEJOQ01xakVsaHJUUTZ2QVdSNi8wbmlTWEZzNDVxQ1ZUbW5aRVFz?=
 =?utf-8?B?K3kyb2x6ckh0alhoNXZGOERoclFjamVZbDNJMGpKRmovb0NCY3V2c25mRTlK?=
 =?utf-8?B?cXFYN0ZCK2RPVENMVFNldzdiVHZ2S1RHSFZqWWRPUFVKK3NWQndWdGxOM3Bm?=
 =?utf-8?B?NnZkWURDMVJRcGxHRnpqQ0UwNDFpRlZ4bU93OGNiVFpNN2xrd2dkVWdhTDFQ?=
 =?utf-8?B?VlJMVGE3ek1tSmt0eHBWbXdPTUh0TUdhekpWTnFRd244bkdVMDVKSUo0ZEtR?=
 =?utf-8?B?M1lmQzl3eE45Sk1SUXFxa0V6TDdhRVVueXR5eE1xLzhaVmw4YjgwSThYUStz?=
 =?utf-8?B?bnFzUTV3WVltM3h2RFVXTnV2Rjk1bjAwQWpQTmtNWlluT3Rsd2g4a0lIRU8v?=
 =?utf-8?Q?1jen4Ze5FcD8FjfB6k/+fG0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c222381c-e0db-4cbe-e67d-08da80eba224
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 07:31:15.4374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKJ+W8aToPOX+F/y3l3R7bwHvr3NOgfCpkYbJFGH3BrhpR918AKcYdykQkw6KeBlogUjo1Rv2ecsMjthVG6BdlXgHfv3NzBtnPIdgR8J8nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2694
Received-SPF: pass client-ip=40.107.6.118;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 17.08.2022 21:21, Vladimir Sementsov-Ogievskiy wrote:
> On 8/15/22 12:02, Alexander Ivanov wrote:
>> This helper will be reused in next patches during parallels_co_check
>> rework to simplify its code.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>
>> ---
>> v2: A new patch - a part of a splitted patch.
>> v3: Fix commit message.
>>
>>   block/parallels.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index a76cf9d993..7f68f3cbc9 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -165,6 +165,13 @@ static int64_t block_status(BDRVParallelsState 
>> *s, int64_t sector_num,
>>       return start_off;
>>   }
>>   +static void parallels_set_bat_entry(BDRVParallelsState *s,
>> +                                    uint32_t index, uint32_t offset)
>
> Rather unobvious that offset should be passed already converted to LE. 
> Worth a comment? Or may be do convertion inside function (depends on 
> further usages of the helper)
I agree, it would be better to convert the offset inside the helper.
>
>> +{
>> +    s->bat_bitmap[index] = offset;
>> +    bitmap_set(s->bat_dirty_bmap, bat_entry_off(index) / 
>> s->bat_dirty_block, 1);
>> +}
>> +
>>   static int64_t allocate_clusters(BlockDriverState *bs, int64_t 
>> sector_num,
>>                                    int nb_sectors, int *pnum)
>>   {
>> @@ -250,10 +257,9 @@ static int64_t 
>> allocate_clusters(BlockDriverState *bs, int64_t sector_num,
>>       }
>>         for (i = 0; i < to_allocate; i++) {
>> -        s->bat_bitmap[idx + i] = cpu_to_le32(s->data_end / 
>> s->off_multiplier);
>> +        parallels_set_bat_entry(s, idx + i,
>> +                                cpu_to_le32(s->data_end / 
>> s->off_multiplier));
>>           s->data_end += s->tracks;
>> -        bitmap_set(s->bat_dirty_bmap,
>> -                   bat_entry_off(idx + i) / s->bat_dirty_block, 1);
>>       }
>>         return bat2sect(s, idx) + sector_num % s->tracks;
>
>

