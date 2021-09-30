Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9212941D9A9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 14:20:45 +0200 (CEST)
Received: from localhost ([::1]:43816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVv3M-0005Zm-36
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 08:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mVv1V-0003tF-10; Thu, 30 Sep 2021 08:18:49 -0400
Received: from mail-eopbgr80128.outbound.protection.outlook.com
 ([40.107.8.128]:63953 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mVv1S-0000wO-47; Thu, 30 Sep 2021 08:18:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLo2jwdqvYGSUGhf7bndhz30rht74f4kfmkz1VH7hmdmzikiHS28yQd/DqsMLAS9NLxQDfn5FPVQoZZlMC7IXcpTYI01Qu/v2f+08mM0NBuQaLhD85Pbv1//j9brK2tAOBCTEZwKg0ehIDnD15KzZYuKc3S4LEaTFup/Ug9sk5k03kaxjdrP72Dy/Jo2y2wQ8/I59s8++PD61TK6sEiSYRifH6g1j+jW9PMnMvdOZBcXiQZvQmDDALf0syAcbyd/i4H5M4Aw84rNpjNa5Z2iqWRZT1//rXuJRmC3kVETvB1VjEq/SaW1wR72iUmqAuP/gXj1ZQ/FEX1otH06NL70HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=eaUW6GWO+RPGmTLEDFUzpnYfE3p5Ds95M+c5jWXCOj8=;
 b=Lfk6ng4YuEFSUSlm6I0pL+fsVlEpQbBrfcKGLR4AwuGQ0L1Eaz9dc4cAfgytN/MZRPg2ZOm/9BI/JpQDQuar148acZVL1wVWGNHYenkj7kWzeWaOiVgBY8QCFamHcppSud6KogA8LiYAxculQFyY18ZhHXSCwaBzhbVxSsLzc0lj9A8dOnr/GeA+Ef7G2CmDdBFZRb4xyW/6bFvoz9xWTtG/SgADehc4meyv8oyhH/quFU7C0+SuuaJyq6S5QwwmmkdYtwv5iacwuIecESiefKGB9MyG0O2EcOWHUfchk4e4UWGda9BjMGisYHb84Re0qNAsoNh7YPDgqSnuW0YX8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eaUW6GWO+RPGmTLEDFUzpnYfE3p5Ds95M+c5jWXCOj8=;
 b=T7XWGu4d7CHOqdTwdgy6PI0XFh6zKRZCR2mkvrg3Ij9JwRUGrS2XQzl+kZcYdq40Wl9TDwVBR/oCjZYeRa7aalYPzDL20XKwaedIrKzMSozz/HUw4E4eZsSD+qsEAMmJrf9odw8ZHwFJsLSXmRSTIrER7W3uMkwhDKqBIcrb9G8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5495.eurprd08.prod.outlook.com (2603:10a6:20b:104::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 30 Sep
 2021 12:18:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 12:18:40 +0000
Message-ID: <be93f4d4-6521-a691-fe7a-68b998d5c4df@virtuozzo.com>
Date: Thu, 30 Sep 2021 15:18:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH qemu v2] QEMU coding style mandates spaces for
 indentation. This change replaces TABs in block files.
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, ~farzon <farzon@farzon.org>
Cc: thuth@redhat.com, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 jsnow@redhat.com, Eric Blake <eblake@redhat.com>
References: <163295635969.12353.14555479457179645848-0@git.sr.ht>
 <YVWHaCOdHUaRbpmc@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <YVWHaCOdHUaRbpmc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.227) by
 FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.7 via Frontend Transport; Thu, 30 Sep 2021 12:18:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c19e06a2-22ec-4712-82a6-08d9840c6ffd
X-MS-TrafficTypeDiagnostic: AM7PR08MB5495:
X-Microsoft-Antispam-PRVS: <AM7PR08MB549534CB98C1AF0AF3D68CA9C1AA9@AM7PR08MB5495.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iH3C7xdXO19vPJXk/FlsakQBjEw88yXe8dShkr62PGhSy+HsI8XolxSx9r+LRj7KV8ndijF+ZJDvJErK32y2xeKYQCeBbLjA5GgDtVJ4bf8c4mvEgetNVkfXnkfsms2n/GWoqoPDr5yuFdNigpXlKr4rGTkSrPB2lSikrOGbtfsrtFw78xVh2NwVciFGjdCr98gqe/lqA/Vwk6S3KTAE65j4OARm7HjIuDYCbw6hiSVRs32yA8uauxb0WvXPTpKjH6e9dJf/ay4PT+t61BnUFwYQkDA3msDXru/KLyAOLqFE1PppJVy8AXjuw6xBu43ICXN2KZXVh7pRkQJmvxq88I1M5CU8oyiC9LZzFMAuAPBEbENcygVIigZb1RNMDaobVpdpopBZneRjmkGR5SfcU1yfBcif0SCnoAJtSPH6Ur/k0DT51ZmPvn7Q2wA1WStJ//e3Uc9lfx/vqNnvLvZoDE6+8V+kuhzup0pdbBshPSO9cGYDfgYAXuglxqBBi2sf4OhNJklNzxY8nTV81QuvObCoecVKjItEOtVhktb80UxfdVMAIuEZq/WwsDNpE5xrpbPBiTewNsyAyF9yArfckhL38lCiRGtyt7tG59Pfqi0S9FDIqwYPDaIOlaz/ysgNUTTENFgn6tHhdLnXnKCQ31k3b/xJ9z3eYRuqyHOjcBWtdQGBybdjtmVmv7IPNTqat6UjilSKgzGHzxytjK0I/bnS6croZiy8C7wvAds2B6HDUwbfRM1UExt3vNZK20j3e+8l+SzgAbA9oqD5XgdLoLWH9AKeAX/DwGvzti15m7gah5ZT+iX/qAsxgT4iH18qz1gRROZE72cP5so/3aIcoqPocJMF21+rDBaokkN6M6I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(86362001)(110136005)(54906003)(4326008)(5660300002)(38100700002)(38350700002)(66946007)(2616005)(66476007)(16576012)(31686004)(31696002)(316002)(66556008)(956004)(36756003)(508600001)(6486002)(83380400001)(186003)(52116002)(8936002)(8676002)(26005)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Njg5amVlQjBPTVZEQzNnSE8reHc5QVFxc0ZBNkY1UlZuelAvQyswaUdxc0Ey?=
 =?utf-8?B?Z3R1cS9raGVEdjFoR2ZJTTJtb2EyZjZ6aU10ZXFiQzd5cktid2lKM2M2K2Zu?=
 =?utf-8?B?dThSRngxY3NFRHV4NlFJN3JTYWx6K1liT0ZZd0RhYVN5VDExY2RmQ3RrYnNZ?=
 =?utf-8?B?bjljQzVuaktVTytMMENNTVgrRDM2MHd0Ynk4VDRWUkdlYVJPQzU5bjB1MWpq?=
 =?utf-8?B?SFRMTjJFMGVRTFRRNSs1aHdQVzdzK2RrTEwrME9YYW12cjBIRFhVUS9BZ0Rs?=
 =?utf-8?B?ams5aVFadXNaVGZZaUNacjViWGRXTFhWQ053eEpxa2Q2NFMyc3RVbDdkQzhN?=
 =?utf-8?B?cm5qdmY2RnFjekxrYkNCdldhVDJra3lZMUZ3L1ZEemRHeXJJb2phbFZad1Rw?=
 =?utf-8?B?WEdaTjFCUUNYdi9najZoUW1WbXdiajQxa1JMKzhucHVwVGhmME9hME1rRHJp?=
 =?utf-8?B?Q3VNYmFndFpHVzVyMzNQcDFEMkNHWE1vdWZZeVRRSFBJdnZFaEkyaFh2ZVBL?=
 =?utf-8?B?WTRuTmVnUmh6eVJGcDZ0K0EvRnBucEdRRE5kUHdNQVNoRG5DUHJQVnBzUEI1?=
 =?utf-8?B?TXRsR3dSaWNvL0ovUDNscmRDQmxXeU9vZ0czMGNqd1FkWHBEMnk2U3J4Nklv?=
 =?utf-8?B?czhmOEJYb09HMDV2NjhRc3hma1JTTlBZYkVFeEJZUlZtTHFlcHFqUlozMTZR?=
 =?utf-8?B?ZkI3RDdPOWczeHJGWk9KZHVsZ0Zma0dYZi9UdExYelpUUjkwVC9jdGMwdTlP?=
 =?utf-8?B?RFlNbTFETkFxUVFOOFd2dXZyS0Jkc0xWb0VxcEIwUlNVWHhNdldIMDV3Tnhx?=
 =?utf-8?B?NzFjNHhoQnl6ZW10TmN0UXMvSlUzck9rWUtKbjJQNk1XYm1WN2I1cXpESG5i?=
 =?utf-8?B?aFlDTDk1RkFQazVaSXM5dGEwRy9WWFVBaFBLRU1Ca0lSU0kzOEZ5bmZUQ2Vh?=
 =?utf-8?B?aGlCOFBmcHhZZ2ZTNHgzZllyc2E1Mis1WloxTmI2MFkvTHdweUU5NmcyYnJk?=
 =?utf-8?B?RjhQWjd6VEx2MVN3NlpidUtISWI3RnlMbnAwOUpyZkJaSGJwRlZRZG1HejQv?=
 =?utf-8?B?NS83aWNnK1pJL0dZYncxa1M2SDhMckJydEJqODN0VjViT1hXZEIvbjBnOVFD?=
 =?utf-8?B?QjBKaFVEdEJWSmFMcXhEVDFGRGxjQVNvVnM1aTNjQ2I2R0hGOGw2U3d6a05M?=
 =?utf-8?B?SVpYU1BUdHZVNTRnRmJJK1M5UmkyL1hFTVJJaG8xc1BZRTNTZTBmVDBsMU1i?=
 =?utf-8?B?R3g0SjRITnZQNDFpeVROYitwZlY3RENROW5XenZDTDFzU3pxd3k3ZjZtYkU4?=
 =?utf-8?B?TXdONFpQYm84V0pJejRmcnhaSWxuZWhvNGJIM3RjQU1EbFJMaGxQam54TFdO?=
 =?utf-8?B?L055RVdwRnNmUEc2YTBuQW5iN1dXSDBRUC96b3B4NjliN2QzSGxNendwNnN2?=
 =?utf-8?B?cytVWUhUZzNVWS9adkVtWDEyNFJ1bnRBTnJkUm5mUFYvTGY2aXNaS3d0bG9p?=
 =?utf-8?B?eE9Xa2hhQmxtNnozS0l3TzBIMk40NUJTNTBVdjZnRVhQb3JXeVN2TFIwcWda?=
 =?utf-8?B?a29nWXVzNXJ3ZnoybER6L0pwbDBodWdFYVF3d1Vmam5odTIwb3NlZkhQTGpS?=
 =?utf-8?B?Yk5nc2kvVmw1dXBHNWsya0hzK01TVkFzVnhyNTlRQ3EvNUhjN1Y5eGVONElQ?=
 =?utf-8?B?ZmViemh6RXZwbzQyeTEvaG94dXR3Q3FndGZmeUJYUlRNMlRwbDJqalk0Tmgv?=
 =?utf-8?Q?MgCViCKdtN0WJ8Nv6c8tWCXOyp5XvMxcunr2BI+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19e06a2-22ec-4712-82a6-08d9840c6ffd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:18:40.4289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rINgxaizw99P+PPm7vmqZur6TYPcSqLKyi3x2qvbokhV/4nU7iSKmHLly4gf4MaGar4WJQEPgg9jLd+QCD6wwVkm+bB+x3JavX8ZSQyWEK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5495
Received-SPF: pass client-ip=40.107.8.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.127, RCVD_IN_DNSWL_NONE=-0.0001,
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

9/30/21 12:46, Kevin Wolf wrote:
> Am 29.09.2021 um 07:30 hat ~farzon geschrieben:
>> From: Farzon Lotfi <hi@farzon.org>
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/371
>>
>> Signed-off-by: Farzon Lotfi <hi@farzon.org>
> 
> Just picking one example, but it applies to most hunks of the patch:
> 
>> diff --git a/block/parallels.c b/block/parallels.c
>> index 6ebad2a2bb..629d8aae2b 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -916,11 +916,11 @@ static void parallels_close(BlockDriverState *bs)
>>   }
>>   
>>   static BlockDriver bdrv_parallels = {
>> -    .format_name	= "parallels",
>> -    .instance_size	= sizeof(BDRVParallelsState),
>> -    .bdrv_probe		= parallels_probe,
>> -    .bdrv_open		= parallels_open,
>> -    .bdrv_close		= parallels_close,
>> +    .format_name    = "parallels",
>> +    .instance_size  = sizeof(BDRVParallelsState),
>> +    .bdrv_probe     = parallels_probe,
>> +    .bdrv_open      = parallels_open,
>> +    .bdrv_close     = parallels_close,
>>       .bdrv_child_perm          = bdrv_default_perms,
>>       .bdrv_co_block_status     = parallels_co_block_status,
>>       .bdrv_has_zero_init       = bdrv_has_zero_init_1,
> 
> When we're changing these lines anyway, let's make sure to have
> consistent alignment with the surrounding code. So I would prefer
> something like:
> 
> +    .bdrv_close               = parallels_close,
>       .bdrv_child_perm          = bdrv_default_perms,
> 
> Rather than:
> 
> +    .bdrv_close     = parallels_close,
>       .bdrv_child_perm          = bdrv_default_perms,
> 
> In most cases, there are already inconsistencies in the BlockDriver
> definitions, but let's use the chance to make it a little better.


Or may be drop alignment around '=' at all, to have

    .bdrv_child_perm = bdrv_default_perms,
    .bdrv_co_block_status = parallels_co_block_status,
    .bdrv_has_zero_init = bdrv_has_zero_init_1,

?

This alignment in definitions is

1. source for alignment inconsistencies
2. infecting logic-changing patches by fixing surround alignment (or having to add separate patches to adjust old alignments, which is a real waste of time)
3. [1] and [2] will never be helpful for rebase conflicts resolution, when need to backport/forwardport commits.


and for that all we have a bit more readable definition, which is rarely read as is. (I think, it's more often used to navigate by tags, like bdrv_open -> jump to invocation in qcow2.c -> jump to qcow2_open)


-- 
Best regards,
Vladimir

