Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF106F1707
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 13:50:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psMbC-0006Jd-GA; Fri, 28 Apr 2023 07:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1psMb4-0006J7-Dn; Fri, 28 Apr 2023 07:49:09 -0400
Received: from mail-dbaeur03on2070d.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::70d]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1psMb2-0007Ug-6h; Fri, 28 Apr 2023 07:49:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCezGWY8Iz8y5I9pDFEhkElupyXhp6O+vOiAngmdV+e2eyPGsEccsVABe3CSmfcO+5qrPhWvZnpmTI/3bKcwee4EL8G4JfwA7pZajr3hHHkerEo5Bh/9nsE9W9I1zzvgYRe9ae6y//KmdECr8L6YyMMnGzhnXb+TrrGJmOH2lNTLOUBljJ8gjVwUNH1yN/YZEHgaoiZiN+oCV/Ayo8wxXTN8DTbRUqn0H5jgH4NePadw46GMt/FKLfuMc1kgENDZnq+WMW4lqeR4/L6ZL1Mrs00Dh4+3FB6fEUzfctBfuR0OvTIcurSFIGb8tDTNqjllQEXz1VuWb6AfvzbOGDkvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM74GdLqU99kLVOC34cc1kiz5RHoJEoX0oT+8fTujWI=;
 b=lBgLi6/MYj9zhmhgD85Yvb4EECk7fnXLnXPtn+24tysI5GJvPpP9+FeOpeZbJxuAY+zZAMtkq5nmuUfWHpj8IEm6LZdv3Ky8DIiNSgtMR9BelkCcm6U7mVa4oFpfQFRWo2m41yETCCsCfE3rjzEoMXaV5qhmbaVOSb77Zplis0hfaedf0oj5tNRNavVvJmzn7Fr3RuRdlxkU0ZKeiVbOMVZqGh5ENy8VARw7wR2Cq8NsQx8k+YFBHn6XW8nzt35GU25M5QFY6c2vTtNUkEj76lb1QcnQqmnIlMW3UALLAfhhIDSetTN7BwPwNqSy5lhca9H20D+Gu1r1T7NbEVwmMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NM74GdLqU99kLVOC34cc1kiz5RHoJEoX0oT+8fTujWI=;
 b=asJPg4JhkE8f0jRnr7CfBIiJq3jcF2CUU0mlr9xFF8DKNGTFwJmf/349J6jqI3IENA2v1KFNMge8XV4Vqi3lbnCTFbLqoOhywvlk1KS0R5VWZVnoGXW9FK+4dne7coeWhTWnq88myHs6gvmqg7dHZLk9jHv+r+1cjW2VqhgMPOjFcN7LejOrYklq5RXjpIpZ3d/xEJjmfiZNCL9xb4GAX3CcT/p/3lz244tGv9wqANtuWuLXUD9lJlHRFvoNJtDKcfo5N6/0FrhPo6a+swWNAknKdYQ8HfTOZvk3pvGx8sxkmfxs+b2gyJcVVYwjSxnOJYx46NvreyPunHzjk3Vd0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB6523.eurprd08.prod.outlook.com (2603:10a6:10:256::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.23; Fri, 28 Apr
 2023 11:48:58 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%7]) with mapi id 15.20.6340.024; Fri, 28 Apr 2023
 11:48:58 +0000
Message-ID: <2b287cbf-c705-fd84-8c5b-cac6ff8d44e8@virtuozzo.com>
Date: Fri, 28 Apr 2023 13:48:55 +0200
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
 <CAL77WPBykju=hEwxkiKvVkNgbGeVxuJc2tuBssTkN0rTupjJiQ@mail.gmail.com>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <CAL77WPBykju=hEwxkiKvVkNgbGeVxuJc2tuBssTkN0rTupjJiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P193CA0008.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b338e5-c2f8-4a06-eace-08db47de8d35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wF53T6C4RoKxDTvLwWGbEq5LK7DJN4HIfgE6LPTP0ecNWKFdfOH02qIT3GL2LcjQxXwrKwWXaFEcp+rmCkOueojxSMA/6pF1xGmUPbF7SzDtJ3VppWJX/6ZIP4xyFVSt0TgrSnhMl9A1VrVju0he530NWlKuzLV2fBjQ2PMnXeXWRT/puRJtPtY7+E/0wAjR4TPVdRvje7NRD4I9n9xs8Qz5M300ugZYFI9TmoTwPVMNn+Pp5juI56N8nWf7jev0LExIV127dl6iVeTT+dhMQKL0xwExBwtmQoan7QVtosRHNSMG+GhcXspZo97E1n30PMW6/PsHtPPbEttssFSWm151g7tc6IgM8vahy9QDc2RPECSTRA888mURuXU6E69vvKm/ZFW2xl13LcTFNGi2F/ZOty5H7eSJK4wNdDLdD3QntYOr7gHXGNj7QAV4Vex4SzHUMxjAXDmPWVXiaLDkJkjRyFnYcNjguEvtpzDNkv/gBQgVUwl68uFaLVtyMgQZejCHkgSw/+kNSLqaJrVZHk2LtkwA/ysxy5QJ9SsnIu6KNO/5kjhBDwFIS6QSAKXoCk8vHwR4UlrNwkuSmdlPaE7BbLg48w/f9y4qQI/EhvACN/vXfITVKGzDQptdKfjFgKambANXqKae4RfuGblMRXTNw5Z0onAkTZ3fmR2SVBsTZZOiKm2QMi1QD7z6517l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(376002)(396003)(366004)(346002)(136003)(451199021)(478600001)(5660300002)(38350700002)(8936002)(8676002)(36756003)(2906002)(86362001)(31696002)(44832011)(38100700002)(66476007)(66556008)(66946007)(6916009)(4326008)(316002)(41300700001)(6512007)(186003)(26005)(53546011)(6506007)(31686004)(83380400001)(2616005)(52116002)(6666004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlQ1SldwQnhlc0gxTTRVZUhLQWlxV0didFZZRGl6RGhqRFl3czBsUkhVU0xI?=
 =?utf-8?B?TFhTSzhyc0ZWaFF1N2RyNzJtRy9DcDhLRC9EYVZ4L3NHdnptRW81emNuNE5F?=
 =?utf-8?B?WVU0dFEvQXh4bCtUSnhBclhPNnBxME9FdExibXdKdEQ4NXVSaUw4QjN4M1BT?=
 =?utf-8?B?d0ZvbEtwQ1VOY2pDUWo1ZjMvc1ppM04waytpSkM5OFJXZHZkOGx0Z0NJQkNy?=
 =?utf-8?B?d1R6cjNYWkV4bmtrR3ZTSnNEUmlxYzFYeDlabUEwTWpTL2JjdDcyOHl4NktQ?=
 =?utf-8?B?MU0rTjg5L0p1bzVBTUJWSHJUN25kSnl1cTJlMFhGaE5jSTIvUzM1dFNqZzJu?=
 =?utf-8?B?VldqUmh2NTJDY1QxZGxzdll1TmwrZGM3SFJOYUl5ZkJmMGJwOVVER1UvbHRy?=
 =?utf-8?B?MDdjeUFGcENMUTVwSjJDSlB5dTFtNGxBYWFYVWUrWkFlRmg5d1pwYWNQQllS?=
 =?utf-8?B?L3N3d0xIRkRleG9nSU5abTBJQjlaWmtUYmRKNkgvM3pEbWdiMGhWMzZTRlg5?=
 =?utf-8?B?VEJaTzc2Q2RGeUt4b2pRNWdwQjVndk9pcEhhNElMSHFhNS9BNURvdG04eFBH?=
 =?utf-8?B?MGxLTGlUbzRZQnRCc25xVytHRTl2Y0FCbEkzQk9JaUFpT3lQRjU0aU9tWW0v?=
 =?utf-8?B?MW44N1hRZE5GTXh5clJTcVVCVUJlYXBJSEoxZmtxVEFSU244V09GWXU5eUVn?=
 =?utf-8?B?QWJISUdBcm9PVnphTU1ZZnJ5b3YwN21leEZGRVZXNEhLakxSRGJuUjM0L1NJ?=
 =?utf-8?B?cE1rRk9Na002YTFFSHpFU25ZakhoZXhsbTZmTmpuTnRsUXdscmZzL2luVWd1?=
 =?utf-8?B?NmxMbW1FditHUXh1T1BCZXZacFJSTG92RWkzd3JhK004WHlLQnRzOFVwS0c4?=
 =?utf-8?B?RkVJUFN0bW1INWlQZkJDMjNER2k3WCtqYTFqVlErdmtFUHI3eExaODVuTTVq?=
 =?utf-8?B?MW9rYi9JY3NuYkNWMHU1ODNLS3lmaGIzelVhTGYrUVhKaDQ2ODFRVEVwYlhy?=
 =?utf-8?B?eXkzbENEVkc0UVlFS1hNQ3BwVFpWdzE1S2ZTOEVzaVkxVVRnSkZGQXV0MDZZ?=
 =?utf-8?B?cjQ4dVhJVWpNQ0JJWVgxQndac2pyTEhYRmk0Y1FqZlVrcCszZGszcFhvVjBU?=
 =?utf-8?B?enBZTzArUWJXWEdUc2hWNTBIWHpSUUFpUkxVR0l6STRhZExBM2M3aFJmRUwx?=
 =?utf-8?B?SW92Zk5iWkdZS05SVDlTVWpoTnAycGpsSndmYXZEWjQzVGhHVlNJNGhxQWJ2?=
 =?utf-8?B?RVVFVU9Pa3J5MUxoVjQ0S0RzWk1IOXRvRDdpb2ViMVBpc3RQS0RpSk5qcnVy?=
 =?utf-8?B?djI3K2JDbU9NNzdoL3BkWDVLeXR0VWwvbFlTRGM4MW95UEdVeDUyVUk0RXFN?=
 =?utf-8?B?dXozT2VYTFpRUnpwK2ZtczhPMUZmTE5wVkkwZTcvTXZlSVFOc2Y0ZXlRUS9I?=
 =?utf-8?B?eGVYSE93YWNCOEt3eTdVTTdqOGlxL3hVakFON2ZsKzVwbXRVallBaTBsRklv?=
 =?utf-8?B?RTcrU2NwaXBmMFFFcmpMSUN3alNkaUJTV2xIVUFJeXJLNWVoa2x6TU5wVnVy?=
 =?utf-8?B?am5mejJmL1hDdCtxVnAvUUQrb0pUUjZLdTVnb01tNEJQdmNyaEFiWDNGemcx?=
 =?utf-8?B?VTdFaHlEV3J6aUxYWlR1QitPVFdjcG9ZZ2EzSjZiZFBzZktZZ0M0bmM1eGlU?=
 =?utf-8?B?M083alFlZFZhR0tjNjdNMk81cUhXa2kxLyt5ZmxFTDBWK1BseWZZYWVUclpW?=
 =?utf-8?B?S3NvUXV5bnI4RFFMKzdOODA3UkRvcHV3ZUg1VVR6QnBQUTNhcVNPWWNlSisv?=
 =?utf-8?B?MERGdk9IdXpkcVNqblkrSDV5K2ZkY21XRFozTDUxMHFxeXhQTGt2eUZBQ3Nt?=
 =?utf-8?B?dCt0MFdhVnJwT2R1M0dkL3Q1ekRmTHdyNVd5amViTTN5NFllVDBvNTlrV2Qw?=
 =?utf-8?B?Q29WaGI5RmVBYWhTSitSY25wQU9kVTBwUEhGMnVBVVFTaWxIUWZGbmJIY2Rq?=
 =?utf-8?B?Q2dYck9RWEZDRnpkcUNBb3JObDJnbVEvRWZYQ1gzaUppOG9GTzM3bTBoTFlt?=
 =?utf-8?B?Y0Yxd1ZXZWFFL2NnWVZoQmtaYzBWQ0ltUXpmeFU5ZFlISmZpV1V0dW5zbEM0?=
 =?utf-8?B?SUc3VWdUS0Frd1hPSEpmZXY1ME9YTWlXWlFVNzZHcG1QOHZMQ1o3QTI3UkR5?=
 =?utf-8?Q?FP9zMBTHcI3cRZzxgH5oH9g=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b338e5-c2f8-4a06-eace-08db47de8d35
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 11:48:58.3094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQJ6PAkGG8nnLQGeJn+GmUoGt9rHUtqXeCtC3ffbsCSsrlOQdwCuBDoVELJZN3oixhlavOuPxjoQy73Ogu6ZmbA9akZYv9ZRzCxiiY3Js3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6523
Received-SPF: pass client-ip=2a01:111:f400:fe1a::70d;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 4/27/23 15:46, Mike Maslenkin wrote:
> Sorry for the noise again , but I have another note
No, you don't need to apologize. You help me make code better.
>
> On Mon, Apr 24, 2023 at 12:44 PM Alexander Ivanov
> <alexander.ivanov@virtuozzo.com> wrote:
>> Cluster offsets must be unique among all the BAT entries. Find duplicate
>> offsets in the BAT and fix it by copying the content of the relevant
>> cluster to a newly allocated cluster and set the new cluster offset to the
>> duplicated entry.
>>
>> Add host_cluster_index() helper to deduplicate the code.
>>
>> Move parallels_fix_leak() call to parallels_co_check() to fix both types
>> of leak: real corruption and a leak produced by allocate_clusters()
>> during deduplication.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> ---
>>   block/parallels.c | 134 ++++++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 129 insertions(+), 5 deletions(-)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index ec89ed894b..3b992e8173 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -136,6 +136,12 @@ static int cluster_remainder(BDRVParallelsState *s, int64_t sector_num,
>>       return MIN(nb_sectors, ret);
>>   }
>>
>> +static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t off)
>> +{
>> +    off -= s->header->data_off << BDRV_SECTOR_BITS;
>> +    return off / s->cluster_size;
>> +}
>> +
>>   static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
>>                               int nb_sectors, int *pnum)
>>   {
>> @@ -533,7 +539,6 @@ parallels_check_leak(BlockDriverState *bs, BdrvCheckResult *res,
>>   {
>>       BDRVParallelsState *s = bs->opaque;
>>       int64_t count, leak_size;
>> -    int ret;
>>
>>       leak_size = parallels_get_leak_size(bs, res);
>>       if (leak_size < 0) {
>> @@ -550,16 +555,123 @@ parallels_check_leak(BlockDriverState *bs, BdrvCheckResult *res,
>>               fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
>>
>>       if (fix & BDRV_FIX_LEAKS) {
>> -        ret = parallels_fix_leak(bs, res);
>> -        if (ret < 0) {
>> -            return ret;
>> -        }
>>           res->leaks_fixed += count;
>>       }
>>
>>       return 0;
>>   }
>>
>> +static int parallels_check_duplicate(BlockDriverState *bs,
>> +                                     BdrvCheckResult *res,
>> +                                     BdrvCheckMode *fix)
>> +{
>> +    BDRVParallelsState *s = bs->opaque;
>> +    QEMUIOVector qiov;
>> +    int64_t off, sector;
>> +    unsigned long *bitmap;
>> +    uint32_t i, bitmap_size, cluster_index;
>> +    int n, ret = 0;
>> +    uint64_t *buf = NULL;
>> +
>> +    /*
>> +     * Create a bitmap of used clusters.
>> +     * If a bit is set, there is a BAT entry pointing to this cluster.
>> +     * Loop through the BAT entries, check bits relevant to an entry offset.
>> +     * If bit is set, this entry is duplicated. Otherwise set the bit.
>> +     *
>> +     * We shouldn't worry about newly allocated clusters outside the image
>> +     * because they are created higher then any existing cluster pointed by
>> +     * a BAT entry.
>> +     */
>> +    bitmap_size = host_cluster_index(s, res->image_end_offset);
>> +    bitmap = bitmap_new(bitmap_size);
>> +
>> +    buf = qemu_memalign(4096, s->cluster_size);
>> +    qemu_iovec_init(&qiov, 0);
>> +    qemu_iovec_add(&qiov, buf, s->cluster_size);
>> +
>> +    for (i = 0; i < s->bat_size; i++) {
>> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>> +        if (off == 0) {
>> +            continue;
>> +        }
>> +
>> +        cluster_index = host_cluster_index(s, off);
>> +        if (test_bit(cluster_index, bitmap)) {
>> +            /* this cluster duplicates another one */
>> +            fprintf(stderr,
>> +                    "%s duplicate offset in BAT entry %u\n",
>> +                    *fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
>> +
>> +            res->corruptions++;
>> +
>> +            if (*fix & BDRV_FIX_ERRORS) {
>> +                /*
>> +                 * Reset the entry and allocate a new cluster
>> +                 * for the relevant guest offset. In this way we let
>> +                 * the lower layer to place the new cluster properly.
>> +                 * Copy the original cluster to the allocated one.
>> +                 */
>> +                parallels_set_bat_entry(s, i, 0);
>> +
>> +                ret = bdrv_co_pread(bs->file, off, s->cluster_size, buf, 0);
>> +                if (ret < 0) {
>> +                    res->check_errors++;
>> +                    goto out;
>> +                }
>> +
>> +                sector = (i * s->cluster_size) >> BDRV_SECTOR_BITS;
>> +                sector = allocate_clusters(bs, sector, s->tracks, &n);
>> +                if (sector < 0) {
>> +                    res->check_errors++;
>> +                    ret = sector;
>> +                    goto out;
>> +                }
> I can not understand how index in a BAT table related to s->cluster_size.
> Probably there should be "cluster_index" used?
> Anyway, looks like both cause uint32 truncation as result of
> ({i,cluster_index} * s->cluster_size)
>
> Regards,
> Mike.

s->cluster_size is the size of cluster in bytes. We shift this value to 
BDRV_SECTOR_BITS
and have the number of sectors. Pay attention that in 
allocate_clusters() we need not
an offset in the image file, but an offset inside image. As for 
truncation, you are right,
will add a cast to uint64_t.


