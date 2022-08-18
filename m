Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE7759809D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 11:19:37 +0200 (CEST)
Received: from localhost ([::1]:32984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oObgd-0006C1-MW
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 05:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oObX9-0006Rs-NP; Thu, 18 Aug 2022 05:09:49 -0400
Received: from mail-eopbgr80132.outbound.protection.outlook.com
 ([40.107.8.132]:54337 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oObX6-0005QG-1g; Thu, 18 Aug 2022 05:09:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFYXMCTHCzL/6T6GJ5EOZaJR170o1D7Dz8cAEJCdew5mal/CNRkFCglQt9AogTPm4HAgLS1KC8uQPM0k3eBxzaxGe+OsdyWXAV79J3RDIijRaPsZzFf3VYax72VhwrwJvcBLIQyITGOS0fN52WWGXbSZUh4QtVbS+Ng7PiesBREgX+mikV1fzvXRE9jM39ReDMNhHEPtpBfUJGr+AuwhuuhQNgxyOAz2hwmZxXhlkqQj2uqE9nDQIgFyogOMCPhna0USHe+yBXk9tp+wBZFngplXzgcbhX1VprOL1GYQTqlwfw9QE91PbhmfDaQgABxO9ik7miBlLRezyhlOvl17HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqS5OeRxHDpeEQKNyHQhKvN1nhSq8ODpsVOgQs2UHv8=;
 b=LMuaX3763Z3mdUvZ2S3DBC8qZBpcn5oFGnQ5u1Q2MRewOBLyAXxepHtD9V3LuRR71TuAxWqXfkQL5yft04aK0VWh/IDIuvQnWU4UA3L7YWsrejYTKMV7aF1N0y/CNnFRZBVrzEkb6SJpchGcD00YuMWIrR62tH9jo4mxWArzPG2aqApvScIC1SFxnaPE6qNne4rjL13Df5/0DlRHl/AJYkYEZNKIMIf5ev2gLpeoBF90jCAQnA7Q+908yQM/8AFkEL+BtKdISmf4NdOTOrMBtrD4FNGIWc0m8QlhheGfVlxYEiJIs5oYst7A+OTgzGXF7hWGGtFR+kazfVFHRHBVGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqS5OeRxHDpeEQKNyHQhKvN1nhSq8ODpsVOgQs2UHv8=;
 b=YvMhuNwsFdk/dNHu75Z2cJ41lh0ZIN9gV56IZoH7gO0h6TLh0s/9jWnxosaPKIZdETdxjz5BdDPRLgDHWeLoioJqviZL5F5zzslyDNJt6WPQ6D2Y3ktQEFG4mIOs1myZn2NfE7zEjO/5VgHilvzpuNC2tgxUXfgOR+Sn3BrH/CINWYYSPvQMEVv4ncHNWzbgfMPs7LOsEI0YMNv5SlMDA6vJrLASgpk/EpqO857KkD0IsOeL6Yn/b6P3twtb3T3cNL1Xq/feWRkxa12Us2+oDkNzfVUiSs9qIK2Mii3un1xH31JL5fMUDDcKlbIKPVkoMTLCxuCNmGD6BWWsKumbNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS4PR08MB7879.eurprd08.prod.outlook.com (2603:10a6:20b:51e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 09:09:39 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 09:09:39 +0000
Message-ID: <1a976701-c283-a590-b49e-4998f349be54@virtuozzo.com>
Date: Thu, 18 Aug 2022 11:09:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/8] parallels: Use generic infrastructure for BAT
 writing in parallels_co_check()
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
 <20220815090216.1818622-4-alexander.ivanov@virtuozzo.com>
 <d9416fb0-d227-aecd-0dcc-047067360291@yandex-team.ru>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <d9416fb0-d227-aecd-0dcc-047067360291@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d1e02a7-34d7-4739-76b8-08da80f9613c
X-MS-TrafficTypeDiagnostic: AS4PR08MB7879:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GWZ1Sh9ULNvHhYqTvf14jbFacih2FQprmrchtQsJtOVxTN+PtH6YcHY34xk7NYWAXsaRMQoZ+aRRlFeD6YeXvHgDXRPzgZuKsP5ahA1//vB1yyzWUiVgXCN+xoUCqhSTXWEeDe2IBhB6zvpzcL5Tsxkk/XWj4ThGLdPW+2Hekk/TK6LxjnJH27xbQo50MnnDhhX2QSWeqGDV2jN+TAdd1rQRAJ1A68PGd8cJYrbjEVSoGMfMkIDfHrhoeBxBOczR2GIzV9Q2FAvq9DYr3JMmZgOO51ARqB38XiirUUfcvkXhMEKrxB2ThVFj/zE71yFq/48WqsLuLqa9f8VkmUyFMGgNLLhbktl+S9f6AGveUsV3ZUwwYrk+cSDcAEcH1R5sclHfSByRuleVGOlwiOQLpSmIQvDRLvtukwfm9kTK2NISF8HyXc4dXTxM2SsmPlUiD02tpISngqwNpLhI9oQzk3ja+3409UyjRcSiwgnx3cjlxfU1iXqAViuouJHZkUGnlwJ++L1oYsxh8d0DEueuuTVlWBgbGPpBcqSD1o8/v4s1G20Q/gUQkeLDKuyGNntOdPCkQ0bCfBQ9uZZKIAFiu+y4BrrrUzaNFzbM+5CgSDKU154HWM1MhtzWe/cR3FoWcVOxmJO7uMWd34cVDliEEq6prqEcS2XhVRlaYUAbptTaxGoIPAyPB08gr14cU6hG7o/gjiL1zljl6jl5ahmMAPBAzdGJaOVffEh/MEdMtbOyvOKa2R6P15hCsfOv9z8bTV5zuRO6AaA7FigMDGVpbhJMfw5Q55v9B5UjqlGSBIJt080Trlkmk9KMSHFnZz1F80PlNAndY9hB3M4S96xerg/vUqkrUfNGw5qczZ8RjIo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39850400004)(136003)(366004)(346002)(396003)(44832011)(316002)(31696002)(66556008)(53546011)(41300700001)(83380400001)(6666004)(66946007)(4326008)(2906002)(8676002)(36756003)(31686004)(186003)(2616005)(38100700002)(26005)(38350700002)(8936002)(6512007)(66476007)(6486002)(478600001)(86362001)(52116002)(6506007)(5660300002)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1NSSU5aQS9CVm5vMjdkN1JvZ3pESG9OTlBqczRyOCtjaVovTDZEcFRlSE45?=
 =?utf-8?B?OFp1Z1NqUWJ6MEI0V3g3eDFFL3N3WmZJNk01UnRrSGFDdmRhRXBzVVlBaGZy?=
 =?utf-8?B?YkphVEV1NGxYYm9vY3Fkd0pUN2ZuYUxhREJDZTFRTEh6bm1vQmFQYnR0ODdG?=
 =?utf-8?B?WmhuSDJSUjlFeUJZdHo2c01JUk0wNUpWUnRMR3h5MkRQUk44NjZqeG9sZU4w?=
 =?utf-8?B?cmJvVlloOU1xeDNUcmxaTThDc1RyTzJxclo4UitBWnhjaFY5MHBsRmNtczU5?=
 =?utf-8?B?Zk9PNFlhYlRUZ2RuZFFkNkk4ZmRHQ3FSdXBrbWxEYlpsdW03SEtuSDVGRDI1?=
 =?utf-8?B?N2l0blAxN2t0aEV3QmNXYitEMk56b1hBOC9DN1Z6TFI5UEY2SXpPMkJuSVQ0?=
 =?utf-8?B?L0NMdUpDdnBqMjNUbi9kS0pYYXRLUmZlUC9kOE9YOURRV1U3QjQyVE55Q3ZU?=
 =?utf-8?B?K0FjRnlraFdmYWc4RFBNUmE0VGlodXIrV1lqVjlNMCt6bDZ3bWs0M3Boem1V?=
 =?utf-8?B?WjY5U1VlR21lVGFxczFnMWtPTC9mUzlYU1RQU08vcXZnTHJ0ZGRwamppZVQz?=
 =?utf-8?B?UW9GNFVmSmtEMURuOER6MG9rblVRY1Z6akZFNFFFYlBCc2xyMjJodmc5L0Jv?=
 =?utf-8?B?R3VCU0daWVdtQ24rbWVjMEphakNya09sZ2hxY0ZEZmpNbm5sM1lQLzE4RCtn?=
 =?utf-8?B?aFlTWTJBSzNKK0lEQ3hiVG9vVE9YYldGTG5mSFJmYnJCdWpPWGhjdSszKys5?=
 =?utf-8?B?c0IwLzlGK29QQ2xldjFKN21NNmtmL0ZncmhiaW5XZnZyUDRDMnhwMmw0RUJa?=
 =?utf-8?B?MTFuMTlUMG9NMmxPYVoxOHZoaTRuc3ZQTk45ZjZxdy9UcWloWDRnM2hKSkFZ?=
 =?utf-8?B?RFM4MGd5SVdOZDhZQlAvdk1sbjhXRDJIR3RUaXhsR2gzVDk4QU5MUE5FNE9Z?=
 =?utf-8?B?bXAvRHJXZHlZZ1hoNUZXMFBkYURnU0UwVE1KV1lOQWc4VFg3TkVNcWZOZ2Rp?=
 =?utf-8?B?cDJyU1YyT2VUbnUwa3FHRWRyZUtjVkVic2VGemRlVlpucHY3UHAzdkNlYy9Z?=
 =?utf-8?B?UWp0YnkrMDZza043QWhoRzIyc2hJVnhsYjF0b0FQZnZZb1NmVTZSa2VpaDZa?=
 =?utf-8?B?SXdnZEoxYms4T2t5V2NObHVJNFg0S1c0dzNBUGpRaEdweWdyeW1RbFJMWGg3?=
 =?utf-8?B?WklDZDFtS3hQRFdQSXRlREF3YkZMemRrTVExTG4vaEYzUkFjRXBOWXNzWE9w?=
 =?utf-8?B?cnNRdWJ5MjArS2U3VjUwd05WV1c3UktWMVlsY0hrbk5KWFZRdzZkWmgwZ3lv?=
 =?utf-8?B?RDRnSVp0Vk8xM0ZOUmt2djY2VEtNUjJDQ0xCK2JBOENJQ3JqL2h3bUd3aHlS?=
 =?utf-8?B?Q1pBOEdsV2ZKejViRlQ2Z1dxN2Vaa25tTHlYUFp6aWFuaUtLNE1tVnZnYkVB?=
 =?utf-8?B?aUFPSVY4RitxUHFjM0dGRzhLR1FycGpHL0JEamU2aTdIU3BWYzJzU0wza2tV?=
 =?utf-8?B?SGZFNlZ6Q1YxcXBlam5keFZTWXM4WGUvODJUOS9oZHFOZ2k4aWMrL1JwRDBK?=
 =?utf-8?B?RHl1NTFVTFVzM3JyWXBBUVRVZjlWZHpnT1ZMWldLRkZSV3FaRmp5OHpSYlZT?=
 =?utf-8?B?d2NvRVpEM0F3TmdhMUNMS3ZzOVdtMXQxS0lPdEVsRGZyUVI1K0RaYjN6OVJx?=
 =?utf-8?B?dGpWTU9FdTFvYk5aeHAzc3dCdmgwMDhXNEttRG55a2I4aTM4bkY5c3lFOHJY?=
 =?utf-8?B?aEdCbU5zSmpUWWRNOVZ2MTM0bWw1MWU0QlM1cjBFdjBBcEZVdXVSeGFMTkw0?=
 =?utf-8?B?NnVBbnVKZHd3KzBMcEt6K05vajNJV2kzY2p5KzdYUjFncnM0cEFPRi9aQUFk?=
 =?utf-8?B?YTJET3FSQjNvcHkwckVUdTM0VE1FNFRCUXVjZ2FpR1MyWFcrUW5nQ3VIbjdI?=
 =?utf-8?B?cXMrTjM2dmFJVmRIclNoczZROWFQYi9ScjBpQXVKWUxoR0pnaGdlMUpwNEZD?=
 =?utf-8?B?dEhlTCtrc3hTM282NGcwMzJ3SVFWTmx2dUlDbythdXNCbTlPYmNFbkdWYmVR?=
 =?utf-8?B?bmY5WTcvb3lxSjVwbi81YkVwT29XL0ZPUmljNnNvYlE5bG9BOVVEOTVRMmJy?=
 =?utf-8?B?RjJIdWxTWXVBYmxOU3RkaGRYRWhLb0Q2Tzl1dThZT1JWVG5HLy9RQlZkYmkx?=
 =?utf-8?Q?bFh7v84xMP9cfER6WEpog94=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1e02a7-34d7-4739-76b8-08da80f9613c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 09:09:39.3982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yf2tSklAM3gHxQZ1q5Ro5OP99r1Up3u05deR4em9dE4AgxrlOC3FKvVOOoWNYqUIlf2yFj8oXh1MNOFT6FkO84pOCdLqEWl84Fxllh5z+qY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7879
Received-SPF: pass client-ip=40.107.8.132;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.08.2022 21:48, Vladimir Sementsov-Ogievskiy wrote:
> On 8/15/22 12:02, Alexander Ivanov wrote:
>> BAT is written in the context of conventional operations over
>> the image inside bdrv_co_flush() when it calls
>> parallels_co_flush_to_os() callback. Thus we should not
>> modify BAT array directly, but call parallels_set_bat_entry()
>> helper and bdrv_co_flush() further on. After that there is no
>> need to manually write BAT and track its modification.
>>
>> This makes code more generic and allows to split
>> parallels_set_bat_entry() for independent pieces.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> ---
>> v2: Patch order was changed so the replacement is done in 
>> parallels_co_check.
>>      Now we use a helper to set BAT entry and mark the block dirty.
>> v3: Fix commit message.
>>
>>   block/parallels.c | 19 +++++++------------
>>   1 file changed, 7 insertions(+), 12 deletions(-)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index 7f68f3cbc9..6879ea4597 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -428,7 +428,6 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>       int64_t size, prev_off, high_off;
>>       int ret;
>>       uint32_t i;
>> -    bool flush_bat = false;
>>         size = bdrv_getlength(bs->file->bs);
>>       if (size < 0) {
>> @@ -467,9 +466,8 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>               res->corruptions++;
>>               if (fix & BDRV_FIX_ERRORS) {
>>                   prev_off = 0;
>> -                s->bat_bitmap[i] = 0;
>> +                parallels_set_bat_entry(s, i, 0);
>>                   res->corruptions_fixed++;
>> -                flush_bat = true;
>>                   continue;
>>               }
>>           }
>> @@ -485,15 +483,6 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>           prev_off = off;
>>       }
>>   -    ret = 0;
>> -    if (flush_bat) {
>> -        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, 
>> s->header, 0);
>> -        if (ret < 0) {
>> -            res->check_errors++;
>> -            goto out;
>> -        }
>> -    }
>> -
>>       res->image_end_offset = high_off + s->cluster_size;
>>       if (size > res->image_end_offset) {
>>           int64_t count;
>> @@ -522,6 +511,12 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>     out:
>>       qemu_co_mutex_unlock(&s->lock);
>> +
>> +    ret = bdrv_co_flush(bs);
>
> Oops that's wrong. Here we probably rewrite previous error of 
> bdrv_truncate stored in ret variable.

Good point!

As you said in 8/8, now it doesn't matter, but I'll fix it for the patch 
correctness.

>
>> +    if (ret < 0) {
>> +        res->check_errors++;
>> +    }
>> +
>>       return ret;
>>   }
>
>

