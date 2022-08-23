Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A54159D6A6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:37:32 +0200 (CEST)
Received: from localhost ([::1]:57666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQLi-0007Ba-PJ
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQIh-00056U-LE; Tue, 23 Aug 2022 05:34:29 -0400
Received: from mail-eopbgr00097.outbound.protection.outlook.com
 ([40.107.0.97]:49910 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQIe-0006VU-HV; Tue, 23 Aug 2022 05:34:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwQv+alI8E+ih+bkcuFGEPYLSZTprCCM7LZ6CajeU1CavnaRguwbxnU+oFgEgoOdDObAWVii81vFlY/ZJZsVL3h43CoJH9KgHI/ht1El3ZAuNcw87SkFyRzcZRsfZIgelpBmivhY6q/6xr6sBDdGUCLQupR+PN0dv803GfB8M5KBPfzwrzQ3V9UB76Tncc7X+zrAqt4XouwuIJkFUN0vOKORmHYMJC9/XK28COpH3GWhWy7YzkPuBNLqE4oNgxAkqdcikXkv+AW12LdQoe6AHhVGYq1kAWmOF3bT+NYCGPhDTXVTLfutMVcbulKWtgkhLLrjjCn9RA5ph72YHnLR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+in1ajmG+xTodyrCsQE8XFNmY/bUs44HlaUuIbGlYX4=;
 b=jJthMgZip6ShndoBX0IhujZiEkxh37RSxmxId7+tNX4rX+NsFxhvDyDvzyYmP4GFGKqb3cpI3dnFs/n6/47RClad6Nk/OCUNiw2vW31D2urVvxsC8PrrJaKzwC/dci3uOY2+GcuaVspkG0ilmv7RwToacEoCMy2h7mrjqZtE7I+5d0HtwYGf5d3hKHHCClzp27BlBXrZBuXva0skcQmJk/dMCNvR6BwJGAl0dyUPsv6nen/MzmTwwBbyiYYB1OMzVG7gycZzOA/dvDPkb+pWN79bBIz1SoFTtKYexBy/r7SAgwFDbjvynh42VRFqT7ZWLsUTn8SUP/aXYketmNAkpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+in1ajmG+xTodyrCsQE8XFNmY/bUs44HlaUuIbGlYX4=;
 b=LJ2VO47sMIusqm08UOO2FdkHkVQO1zZ6TQwZdgogEgQG81oKxOU7sR5GnfqQSoQL/gnDfgABEAq0pNky9G+SWYfsDBurQePEZatfF1t7v2hQyOcHMkE3KZRyeITnkPCX+1bXZnmfTA3DkJc8HwNqK5oWwWhwGiskU4nEUQmNPC1dii5+Vin5/Oy6YE5Q+3GgdvailAlfObKEh2qz5EuygRSSLU36mU8ZFvV3TmaqEefHwvLeTZrjqUN3ach/hXXs8d7Pu3P2D0SgvLCQ1mc9wzQBu4KiZtfVUF7aSfBz1+jcE8+KI+o9/DJQIqX+b/TSbYx2d3wgGy3z9mSrNpcv2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM0PR08MB3601.eurprd08.prod.outlook.com (2603:10a6:208:e1::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Tue, 23 Aug
 2022 09:34:13 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.014; Tue, 23 Aug 2022
 09:34:13 +0000
Message-ID: <68dc52ea-514a-3561-719b-172acbade2ab@virtuozzo.com>
Date: Tue, 23 Aug 2022 11:34:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 1/9] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-2-alexander.ivanov@virtuozzo.com>
 <8a010bb8-82e3-8b74-8ce6-414d3638c7ad@yandex-team.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <8a010bb8-82e3-8b74-8ce6-414d3638c7ad@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0091.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::32) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc11e6cd-8e37-49ed-28af-08da84eaa40d
X-MS-TrafficTypeDiagnostic: AM0PR08MB3601:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9wrEMXwtyyyNeEJfMp20AwOspvwzN3fbl6yu7n3FxxLcp38F9VZidBcKk28oeblJv+fEsQJFtT73Ain7qEiHnnyv72g4/b2//KkHGwZ5tCSHlTz5qV3E2ZkUnDwJmRHCsM7mIMKzkLp05K+4GknUTXq5xbPygQ2u/YswgkYGrVCRKtHEmODB70oe+MIRLXh0Rwvo24OkZYsZzDhNVmoSR6KiGbNeMU6rjiha6trRiPLXSlNG1++ajmDg9d8VoLuXYzjpKqb2WRLWluqLlDhBg0k71P0eg5oLSe6xDS7d4T+GucSfN4sZhgEX3wprf+FQKQ8Jx3uogKhSHZlEGHAfrYs7FMCJcRVUeaNbrd/Mdhx0MkZ2LvzTTVAgG+EtjioPsKacukbR0YXg61esOktxtbTwaF/jzZTqzP4cwLEriZUfeCpvvU0/iQWVHhcvp99Nzof6RnfNQ4D2TGJ8ILSxGFkiat6J6PTd0liJ1Mrm68FKi8CJEs3ybNS19M5RAmAHauzhlrUygqg0V50R/d4qNhGlYDtHuWDExToU0Pbv031CWywHLnv1PC8CMXFqxsB97Ka/GrFT/dgbPwoR/zxpjze323je7cGfBQ+ALXdKadeNU/FwKiHd8baqFGC+adbm52sd2q8+Y1a8LOvPkoZ9EfIMJdrPNa3I17Yecs84fwz2/E40uCeO/0V7ZmDDkPIIHhrcPuxc3A5Dq/TLNg4NTnhrA0R0+kVahVEB7Yx3DW+IsUmIZ0WUSIA3TbPtTHwf4dnotZM58bgWNC2cUZZ+UFZ34bBeVM0GFXWYfhM+WqzeF1AI1N/dl2+VlCZP87tke2vDO9nE7n9mWKDP6ElBXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(39850400004)(396003)(366004)(346002)(66476007)(66556008)(8676002)(4326008)(66946007)(110136005)(36756003)(38350700002)(38100700002)(31686004)(86362001)(31696002)(83380400001)(186003)(52116002)(26005)(8936002)(6512007)(478600001)(41300700001)(6486002)(6506007)(316002)(53546011)(2906002)(2616005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkZvZUlxL1E0VmtiTEp1SVdGdHpSeWpORlRpcDVXdzFHUFlQN01ENnBkazZ6?=
 =?utf-8?B?RlVBQ2hLRmw5ZGEremxFaTRZak1DSlVkZGNpTkJEUWpNTFRiQ3JtZVF3elZR?=
 =?utf-8?B?TnVJYXR5ZmZ2dVdLT01tVkFaZWtFZmdVbkVzRmZHaVpoZC9OZGZPYnJwZWZC?=
 =?utf-8?B?aVNGaDYxZklqWnhBRjQ2ZXNUZTJIYi9ISFV3OXgxdmdydVRiSVEvWnJQS21r?=
 =?utf-8?B?RFFSR0duMHdsV3hNUUxpZGhUMGd6MjdQeVMyWGlwUEVKeStRRGlGWk5ZUjNJ?=
 =?utf-8?B?V1NyTEl6V0txZkM3cWdPL1p1T3J0Zy9taVAwZHJmWXgvRUtKc3k2Uks3d3Vz?=
 =?utf-8?B?R2tVQmx3MkFVZjErZkFTcXNlUVU2Z28vWXFRaDVNSE8vMmZ6SUZ2OTA4K3E5?=
 =?utf-8?B?ZFlqVDdPQktZcjlBSTVLemRoNGN5Ui9nZ1RuVy92ZnZ5SVQ2YWpERHZqbDJI?=
 =?utf-8?B?MFRWZ0ZrZ3U4MDYzTnNiZE5qbndHcTZuWnIwYjRpenFTZEVSZ2xGaS9WTkMx?=
 =?utf-8?B?eGtHcERMMEZEemtnWHB6bWpscmJnZjNSKzBpNUxjRi9Bc3lvY3ZoazVGMzgr?=
 =?utf-8?B?K05ranA0UGJ2Yk1jQVRKa0h1Skl5Skw0Y2lhMnJUbTIzRU1Eb2ZTeXY4ZHdC?=
 =?utf-8?B?dlc0REdEbGtLSFVhZ2k0S0R4VGNnZk1PTWpudmhvU1pJVnlId3kvNis1VExo?=
 =?utf-8?B?UUpBbFBxd2hzM1ExbzY1MjMrY3hyc0dXRkpUZ3BZS3NOZzhHM1orcGN1Y216?=
 =?utf-8?B?M3hqdmE1ZEJ4REN2SEZxTkRQMjBTSU1PMHJ3Mm1xYkhxWjlrKzI2dmYvTTBz?=
 =?utf-8?B?MDNiaEZOK29jL281VE5JRVhzaGRjREpRdjFuUytNenJMeEtpSEk0Ly90dG9G?=
 =?utf-8?B?dnVSS0tkcVFLNmpRUXVQUm1Lb2E5QU5pbzZ0VldJY0E4TXVhcmkvMndzN0Fp?=
 =?utf-8?B?WXNSdjRuQTQ0RndZSDgxWHh1RkVMaFlhYzFCL1NDdWZDMTcwT0t2Vm5TYVhP?=
 =?utf-8?B?a1VSY3l1dXEvZ2owV0praHVjb1c1ampnMkF3aSt4clNvNXVSN1dPaTFMVnNC?=
 =?utf-8?B?M3IwWVlrbEFaWkNkZS9LQnUxaTA5ZUFJdUtOeXp3T3I0V3Q1RXlIenU0SWZw?=
 =?utf-8?B?OUJJMk9qZHFRcjVMbk1qNGtNZFh2N2NrcFVGSEFtWUV4R0I2cXh2TnVPSXo4?=
 =?utf-8?B?eGcrUzZUQzMrWlQ0SzlFT0tSTEhXNnZFc1lIbk5NUldFVEtVQ24wS1FvK0dr?=
 =?utf-8?B?S2IzVUpjNXlZOFc3SGtMcCthYm84alNyb2MwY3pha2ZsTjZRTVNhZmpIcHdp?=
 =?utf-8?B?M2RjMXlNL3hDbm84bkl4QkxiR0cwRkhvTkxFNXRhWENSUWJBUjdOYnp5SHl5?=
 =?utf-8?B?NmJPbDE5anh4T2UrNzVpeGRxazVDRmZpZEE5dFlBUmdFWDh6QXFwZUUvQU5H?=
 =?utf-8?B?K3Q0VVgrWUpPTmp5RjcydnA4Y3o4dzhrRGUxS2w3WTZIbE83WkV1R0pWUmR5?=
 =?utf-8?B?Z2NPQTBKWkZZOTJNRTlRQVB4K2M5K2g0dmNKSDBjT3BJNi9jRHNTQ1hqWm1T?=
 =?utf-8?B?YjYrV2RmS0pST2tDUTNsaWNXajJRa24vL3NZSlBkcXEzcjVMVk1SNnl0Q3ox?=
 =?utf-8?B?N21JZjNVVk9RWTRzZllwWnorK2ZuWW9nQWRPdVFmd0F4eGhYeENiVmR2MG1G?=
 =?utf-8?B?K0lNejVFTE5CYk8wOXQ1cnpoRG4xSVNXdk5KQlRDVWI1c3JLMWlHT0JlVXow?=
 =?utf-8?B?bEJzc3Vrb1JmM1ErOHk4Q2x6bzlyZzlodFJEWHlKbHY0bmkzazFhWGpUSnZo?=
 =?utf-8?B?L3VvVkcxdUw5WlBzN3I1ck0wam43T2RucFRoM0hvc3R5N09DUU96V0hrVDYx?=
 =?utf-8?B?U2xmVEhHRnZ2SFRzcEFPNENHaERXY2wwdGdWR3FuS2s3RmU1K21HcFl2Zjc3?=
 =?utf-8?B?cXVEMWVSSDdXK2QrMndITkgveFRJUjZ4WjFPRFZoWmVWTGJvVFFDWC9mNHVv?=
 =?utf-8?B?K3Nwa0hYbWdkQzdhS3ZtN05CWmtMSU5FVXM0bjVNdE1paWpaMDhpL3JNYVBz?=
 =?utf-8?B?MXRTMEVLZGFFM2hsTmY0VjJYb3grdElNVDNET3lSRWQvV2UzZGhCMWp1MFpi?=
 =?utf-8?Q?Dzh1JBannRrR2t+0prT5G6ds7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc11e6cd-8e37-49ed-28af-08da84eaa40d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:34:13.7292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4i2nCUzRwHrog5QjXI5zkXSTdRytt+Ig10bQLLlAzLG3VyGMC6Nn5hiOiMmxJmWaCsglXYQiafTktOIE/xfvdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3601
Received-SPF: pass client-ip=40.107.0.97; envelope-from=den@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

On 23.08.2022 08:58, Vladimir Sementsov-Ogievskiy wrote:
> On 8/22/22 12:05, Alexander Ivanov wrote:
>> data_end field in BDRVParallelsState is set to the biggest offset 
>> present
>> in BAT. If this offset is outside of the image, any further write 
>> will create
>> the cluster at this offset and/or the image will be truncated to this
>> offset on close. This is definitely not correct.
>> Raise an error in parallels_open() if data_end points outside the 
>> image and
>> it is not a check (let the check to repaire the image).
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> ---
>>   block/parallels.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index a229c06f25..c245ca35cd 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, 
>> QDict *options, int flags,
>>       BDRVParallelsState *s = bs->opaque;
>>       ParallelsHeader ph;
>>       int ret, size, i;
>> +    int64_t file_size;
>>       QemuOpts *opts = NULL;
>>       Error *local_err = NULL;
>>       char *buf;
>> @@ -811,6 +812,19 @@ static int parallels_open(BlockDriverState *bs, 
>> QDict *options, int flags,
>>           }
>>       }
>>   +    file_size = bdrv_getlength(bs->file->bs);
>> +    if (file_size < 0) {
>> +        ret = file_size;
>> +        goto fail;
>> +    }
>> +
>> +    file_size >>= BDRV_SECTOR_BITS;
>> +    if (s->data_end > file_size && !(flags & BDRV_O_CHECK)) {
>> +        error_setg(errp, "parallels: Offset in BAT is out of image");
>> +        ret = -EINVAL;
>> +        goto fail;
>> +    }
>
> If image is unaligned to sector size, and image size is less than 
> s->data_end, but the difference itself is less than sector, the error 
> message would be misleading.
>
> Should we consider "file_size = DIV_ROUND_UP(file_size, 
> BDRV_SECTOR_SIZE)" instead of "file_size >>= BDRV_SECTOR_BITS"?
That is a different check. We need to be sure that file_size is authentic,
which worth additional check.

At my opinion, this worth additional patch later on. Let us agree here,
queue and proceed with further pending fixes.

We should use something like the following

     data_start = le32_to_cpu(s->header->data_off);
     if (data_start == 0) {
         data_start = ROUND_UP(bat_entry_off(s->bat_size), 
BDRV_SECTOR_SIZE);
     }
     if ((file_size - data_start) % cluster_size != 0) {
         error();
     }

>
> It's hardly possible to get such image on valid scenarios with Qemu 
> (keeping in mind bdrv_truncate() call in parallels_close()). But it 
> still may be possible to have such images produced by another software 
> or by some failure path.
>
>
>> +
>>       if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
>>           /* Image was not closed correctly. The check is mandatory */
>>           s->header_unclean = true;
>
>


