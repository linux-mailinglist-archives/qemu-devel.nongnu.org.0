Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D4B339739
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:13:10 +0100 (CET)
Received: from localhost ([::1]:37702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKnDh-0007yC-3k
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKmks-0006wF-90; Fri, 12 Mar 2021 13:43:27 -0500
Received: from mail-eopbgr60126.outbound.protection.outlook.com
 ([40.107.6.126]:64806 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKmkh-0004Re-16; Fri, 12 Mar 2021 13:43:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUAgC0RM+gZFz6RNBM9jCi7JaCfhh+xLs/fzRDUIhqepBf8Mozwzn8E8MfyMGHbZlQYZO4oPMQxAb0Efvas/uYT6y+IE62JDbaJcwj1zjGKAgslUQ5Mu9Fw0XPZljfanYl/Gw/w5rcCq687LFib7UQlFSZO/yFG5pIF5rD6aOq6WRms0/Woa4Oy0iXEStGSxeSYLb/O8NoEoi5dN8FHh1F3g9SZUyDm7FCBZlYf5WVhdg3QJnG+CeQvw9s/kYlZCxbBY8xNlr/ZEW1RVpDyC95L9WuGm7vrSf9VMHgcLPZTFSD6J+vMQYuhFIkuoYPl288q2a5rqf5zrEYnNpuPYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHdReXhMrFgP6uEfmmXzgpYQa814liGJelU3/FmT734=;
 b=CWTQ/9R1SvaoTtan/3Cs4qhOyOiaeXeL8O//048R0ek80XVdYQcXR8DCK4GjLQVk7/kTI4O5Hm1jzjarbgTzGiNUrYnWQRaoQNeCJFC2JuB1Q8J5GeXr+P7VBd/REUccccjaRukOyOFfAXt/4iU5nq+pSI5LMnUP3hSrkUGeJ5b6DsQKhORugWoForGclMcJFEJvSrplCEKLiOtg81sOZ3VfsA2qSjhYgGuiRhLw+BOihlr4migCwjKoRwO1Rpehqmef500KWWa62lpUf1tuctkxNMgWqtoR3my+y3EB5v7GgxLYsJyFIVTKNSjwPfwkso1qFFXSJnkMDLKyiNG2ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHdReXhMrFgP6uEfmmXzgpYQa814liGJelU3/FmT734=;
 b=hg35+Yp/A8IJWdzdCU/MiGC+rrPzcWk43DL4j8fmD5fqejgAZCKS+WFXUgbU8HVpW+hb4s1LpqTs0XgurzMStA6J+ziQDLVr89q8Ovo/7fPkgxJQsScBTajjIYEOxrhKI5TCIMkQzJU/N+TUsoCsA31zc0H4k8LK9n1rYZnUETM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 12 Mar
 2021 18:43:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 18:43:04 +0000
Subject: Re: [PATCH v3 6/6] block/qcow2: use seqcache for compressed writes
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-7-vsementsov@virtuozzo.com>
 <e85d05f3-5500-9a55-0bd5-ceb581c27ef7@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d5acfe9d-2095-a601-20b7-bd0b677df68a@virtuozzo.com>
Date: Fri, 12 Mar 2021 21:43:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <e85d05f3-5500-9a55-0bd5-ceb581c27ef7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR06CA0105.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::46) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR06CA0105.eurprd06.prod.outlook.com (2603:10a6:208:fa::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 18:43:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 770e1c5c-014d-4e1f-099c-08d8e586abaf
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-Microsoft-Antispam-PRVS: <AS8PR08MB5944FF8481CA98C2916D9D19C16F9@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tB2f7xa+pxhtEpjIKucvu1Fjdd/mbkTgemglPr7VQLnuEQsOifrxX5cbxypVPz13W96bZkWSrN8rVDRTigVfoC1iMUNlE6M+/t2+u27S0wIJVXCfAMdsjfjm81MpxC10ugmZ8Up++SAoRzZOt3TFuFDQk6zuhXK/lHBTX2BE8bn2oV344hnX8t0kEYFDYm+5rH4VzAjSrwCCSS4Krl79B+J9QhVuznfNmdwO2pGzC94MbsBIr0yKm8BxtSlgKK/AZ/720W64UvaqUMU+M3gE57jnKRUQPgHZxHUJbFFi6bTt/IM54MJo51FEdRpOGY9OrrtMwPbABy6aVwGs6T89xLmdRpycJUraTyQv5L85VNSLdeA+xeRhYKtDFLVsARYe9amd5YFqiczNCMBlLGHxpRQdqnyVM6wMx2R8x3I1O4z6xiKCA+WgKgfxxGTRVckfUBX31bdrFLCORbnwtyMq2rd4vcZ6KIykpAovWW3evhbJ6tYI6rVuH0iaGVhvOuDnXeRBq+2E5oSHfDQs7BZ+Zgyk55tWvHNNNnDw8yu/TLmGUpZcqNVrIJlsVF8KS+vjbMwtgpgwsbeJcaTh2UkPaDTrmUm24+V6q99y8tlk4OavtM3Ls189dZNA0BsIET65H7wc7481CZYEl2GM5+ZH5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39830400003)(366004)(136003)(956004)(2616005)(26005)(186003)(16526019)(4326008)(19627235002)(478600001)(316002)(16576012)(30864003)(8676002)(6486002)(66946007)(66476007)(66556008)(86362001)(31696002)(5660300002)(52116002)(36756003)(53546011)(31686004)(83380400001)(2906002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MXhPbFROZGhtSFlmeGswb0hTQUdKb1lMTTF4Ynl5cDBqSkpWOVIzajF6T09s?=
 =?utf-8?B?ZlNreklJY3lrcDQrYmg5dFNRbmxFVlhpWjF1SWdZbTBSdXNLWnlUeXNNOURV?=
 =?utf-8?B?R2JGckhWUlhHLy9wZEJNaHdrL3hFRklKWXRqRVhhT3Rta20rMTFXb2o5dDlP?=
 =?utf-8?B?TXluK0lTT2s2TW8vOXhMelFZaVMycnBnRjJYZStkZnRkREtYUkNMV20rTk9K?=
 =?utf-8?B?eFY2bEk3cWUzM2VTeXVRQTNmNFhDNzBYcUZWTnZqZWs0TExQMG8vLzE1TGQw?=
 =?utf-8?B?QnBaM2I4OU5qTWNwTUsyd0VPQjdFQVBraGtnR3h5Um44ZjF2MHR1ZXNuM0xX?=
 =?utf-8?B?YVJyWHZhY00zb1A3RC84a2RzeHRhWTNXQ09VWnp6RXpoeGg1N1hQdVNHQmpW?=
 =?utf-8?B?Nk83ZHJTaWwrem04WHJzWkJ5SHgzUmhkTE10MlMzQmZGeHRCS0hTQ3F6dnR5?=
 =?utf-8?B?TDFqODVLOCs0VkpuVjJDM1ZwekVlUGJJaUNYeXdwVlE3RGZUTVhKblFVYjJE?=
 =?utf-8?B?TkcxNTd2dDR3TzJ4QTJVamIrMWVNeHZkMUVqYlY1OGZPUzdmQUdrejFTd3BN?=
 =?utf-8?B?c3dKR3ZlT0JOYWFwSUNzdEpCL2hVaVgySDEvM3JINHJCYlIrYXo1VHZhZFNu?=
 =?utf-8?B?dTlnd1krRDA4K1Z2RlpoSGVwbkJ0eUNTcHNzRjJVeXVPQ3Nrc00xQm9CbW5T?=
 =?utf-8?B?eEo3Tk53STRjVTlKM24rbVVyb2JqbVFKVEJMK29YZ3JnY3FuZzVQNnhGRzRS?=
 =?utf-8?B?UWRBVndpazY5V0JSNUx1aFRWMWJDY281RHA2bmxwWUxpVTlYalhiUjk5MzM4?=
 =?utf-8?B?UGZwYTVRTEMxSytrNjBzeWdBMExlR3k0WCtSZGVDZHZ1RXBoUEp0MTNlNTJq?=
 =?utf-8?B?Z2RiYmhONGRiNzNjMXNUOEg5MStsckpHV0JtSkhmMDk1NE40K3pkdC9mRWVn?=
 =?utf-8?B?ZUZSWEFjdlBMUW5KVXgzOEhpbVYvK1ZMNlBQU1ZEeFNlaHFaY3kwVmNEZElS?=
 =?utf-8?B?R1NESGY4cWtlR3JNbko4bDk2bWw4Q1hqRjVEd3NHa0tPdlczclJwTENSNG9E?=
 =?utf-8?B?ODdyTXlSWG1Qc3JrV0xMQnVKTHEwSTBEVVoyQmtCSExSOEgrZVJPL2dVZXpM?=
 =?utf-8?B?WEpicW9MRC9UNXVnRlhONTJjWGhuNUxQZUxlN1ZUczIwdjNxcjJDY1FPT0RM?=
 =?utf-8?B?YXkvK1dEaWVyRllxNGZMRUMzUm1zdjJIVkR2YVpBb2JjWkloNFFVcU1QVjdk?=
 =?utf-8?B?SnpQak04SUlINTc0Q05KSGFGVzhtRUZHN2Z1UEo1SXRBN2ZkcUVVTjlEbjZQ?=
 =?utf-8?B?SnZWbGcwSk01SXk4RU9TY0ZDZUtSUlhxWEtnR01sSlhPLzV0Y01aZDFEeVVT?=
 =?utf-8?B?NHFWMFJ0UDcraUlxa2d5TXV0WEYrUG9aNDI0eFd4SVRYTmp1RlJ5bzgwc1FZ?=
 =?utf-8?B?MTRBRHR1UmlxaUU2WWpJa0J6bjYvRDNDRXJkQXBkTE9JQXZheE05TktBa2Ft?=
 =?utf-8?B?V3dvRWRIc2FzMENZaVd1MEgzTXVSOEFqVXZGeDNHaDY4Q08yTlhMRzN6RG5V?=
 =?utf-8?B?SHJ5eUE0OEdWVUNoZVZwcmxqWVMwNC90RGxhTjFhbDAzZXdhcmtWU2RYUHBW?=
 =?utf-8?B?Z3RNcU9OVWdRRDE5cEdybTB0eUlnY052RjR5NW52NEhtVzV0Ti9MSDVYYUZL?=
 =?utf-8?B?NTdSMjFJM3lMdHVKMzNYd3lJRERUQ3VIcVQ2SkZhTUJQY2ZJM1FjRlVCZFZp?=
 =?utf-8?Q?ogfZFH3d4mD+SHsvGp1/+ITjThpSv2O3Fp/tTp2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770e1c5c-014d-4e1f-099c-08d8e586abaf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:43:04.3331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LP9yWvKKeDTPd2VF8Wf2q71yNbtB4EZfayfkUU8ZJ9vLQvvaIxFAGH5Pf/9zfRZ6cuEs7WR/3CWvcJQQFOnQ/0AVIHeO0iuj1iY5UOC9jM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
Received-SPF: pass client-ip=40.107.6.126;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

12.03.2021 21:15, Max Reitz wrote:
> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>> Compressed writes are unaligned to 512, which works very slow in
>> O_DIRECT mode. Let's use the cache.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/coroutines.h     |   3 +
>>   block/qcow2.h          |   4 ++
>>   block/qcow2-refcount.c |  10 +++
>>   block/qcow2.c          | 158 ++++++++++++++++++++++++++++++++++++++---
>>   4 files changed, 164 insertions(+), 11 deletions(-)
>>
>> diff --git a/block/coroutines.h b/block/coroutines.h
>> index 4cfb4946e6..cb8e05830e 100644
>> --- a/block/coroutines.h
>> +++ b/block/coroutines.h
>> @@ -66,4 +66,7 @@ int coroutine_fn bdrv_co_readv_vmstate(BlockDriverState *bs,
>>   int coroutine_fn bdrv_co_writev_vmstate(BlockDriverState *bs,
>>                                           QEMUIOVector *qiov, int64_t pos);
>> +int coroutine_fn qcow2_co_flush_compressed_cache(BlockDriverState *bs);
>> +int generated_co_wrapper qcow2_flush_compressed_cache(BlockDriverState *bs);
>> +
>>   #endif /* BLOCK_COROUTINES_INT_H */
>> diff --git a/block/qcow2.h b/block/qcow2.h
>> index e18d8dfbae..8b8fed0950 100644
>> --- a/block/qcow2.h
>> +++ b/block/qcow2.h
>> @@ -28,6 +28,7 @@
>>   #include "crypto/block.h"
>>   #include "qemu/coroutine.h"
>>   #include "qemu/units.h"
>> +#include "qemu/seqcache.h"
>>   #include "block/block_int.h"
>>   //#define DEBUG_ALLOC
>> @@ -422,6 +423,9 @@ typedef struct BDRVQcow2State {
>>       Qcow2CompressionType compression_type;
>>       GHashTable *inflight_writes_counters;
>> +
>> +    SeqCache *compressed_cache;
>> +    int compressed_flush_ret;
>>   } BDRVQcow2State;
>>   typedef struct Qcow2COWRegion {
>> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
>> index 464d133368..218917308e 100644
>> --- a/block/qcow2-refcount.c
>> +++ b/block/qcow2-refcount.c
>> @@ -29,6 +29,7 @@
>>   #include "qemu/bswap.h"
>>   #include "qemu/cutils.h"
>>   #include "trace.h"
>> +#include "block/coroutines.h"
>>   static int64_t alloc_clusters_noref(BlockDriverState *bs, uint64_t size,
>>                                       uint64_t max);
>> @@ -1040,6 +1041,10 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
>>                   qcow2_cache_discard(s->l2_table_cache, table);
>>               }
>> +            if (s->compressed_cache) {
>> +                seqcache_discard_cluster(s->compressed_cache, cluster_offset);
>> +            }
>> +
>>               if (s->discard_passthrough[type]) {
>>                   update_refcount_discard(bs, cluster_offset, s->cluster_size);
>>               }
>> @@ -1349,6 +1354,11 @@ int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
>>       BDRVQcow2State *s = bs->opaque;
>>       int ret;
>> +    ret = qcow2_flush_compressed_cache(bs);
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
>> +
> 
> I wonder a bit why this function doesn’t work on a best-effort basis, but that isn’t your problem.
> 
>>       ret = qcow2_cache_write(bs, s->l2_table_cache);
>>       if (ret < 0) {
>>           return ret;
>> diff --git a/block/qcow2.c b/block/qcow2.c
>> index 6ee94421e0..5f3713cd6f 100644
>> --- a/block/qcow2.c
>> +++ b/block/qcow2.c
>> @@ -42,6 +42,7 @@
>>   #include "qapi/qapi-visit-block-core.h"
>>   #include "crypto.h"
>>   #include "block/aio_task.h"
>> +#include "block/coroutines.h"
>>   /*
>>     Differences with QCOW:
>> @@ -1834,6 +1835,10 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
>>       s->inflight_writes_counters =
>>           g_hash_table_new_full(g_int64_hash, g_int64_equal, g_free, g_free);
>> +    if (!has_data_file(bs) && (bs->file->bs->open_flags & BDRV_O_NOCACHE)) {
> 
> Looks a bit like a layering violation, but I have no better proposal and you gave your reasoning, so, OK.
> 
> I wonder whether this should be re-checked during reopen, though.

Hmm yes. Somehow I thought qcow2_do_open() will be called again, but it's about inactivation/invalidation, not about reopen.

> 
>> +        s->compressed_cache = seqcache_new(s->cluster_size);
>> +    }
>> +
>>       return ret;
>>    fail:
>> @@ -2653,6 +2658,91 @@ fail_nometa:
>>       return ret;
>>   }
>> +/*
>> + * Flush one cluster of compressed cache if exists. If @unfinished is true and
>> + * there is no finished cluster to flush, flush the unfinished one. Otherwise
>> + * flush only finished clusters.
>> + *
>> + * Return 0 if nothing to flush, 1 if one cluster successfully flushed and <0 on
>> + * error.
>> + */
>> +static int coroutine_fn
>> +qcow2_co_compressed_flush_one(BlockDriverState *bs, bool unfinished)
>> +{
>> +    BDRVQcow2State *s = bs->opaque;
>> +    int ret;
>> +    int64_t align = 1;
>> +    int64_t offset, bytes;
>> +    uint8_t *buf;
>> +
>> +    if (!s->compressed_cache) {
>> +        return 0;
>> +    }
>> +
>> +    if (!seqcache_get_next_flush(s->compressed_cache, &offset, &bytes, &buf,
>> +                                 &unfinished))
>> +    {
>> +        return 0;
>> +    }
>> +
>> +    qcow2_inflight_writes_inc(bs, offset, bytes);
>> +
>> +    /*
>> +     * Don't try to align-up unfinished cached cluster, parallel write to it is
>> +     * possible! For finished host clusters data in the tail of the cluster will
>> +     * be never used. So, take some good alignment for speed.
>> +     *
>> +     * Note also, that seqcache guarantees that allocated size of @buf is enough
>> +     * to fill the cluster up to the end, so we are safe to align up with
>> +     * align <= cluster_size.
>> +     */
>> +    if (!unfinished) {
>> +        align = MIN(s->cluster_size,
>> +                    MAX(s->data_file->bs->bl.request_alignment,
>> +                        bdrv_opt_mem_align(bs)));
>> +    }
>> +
> 
> I’d move the pre-write overlap check here, because its purpose is to prevent writes to metadata structures as they are happening, not as they are queued into a cache.  (I’d say.)

Agree

> 
>> +    BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
>> +    ret = bdrv_co_pwrite(s->data_file, offset,
>> +                         QEMU_ALIGN_UP(offset + bytes, align) - offset,
> 
> I remember you said you wanted to describe more of the properties of the buffer returned by seqcache_get_next_flush().  That would be nice here, because intuitively one would assume that the buffer is @bytes bytes long, which aligning here will exceed.  (It’s fine, but it would be nicer if there was a comment that assured that it’s fine.)
> 
>> +                         buf, 0);
>> +    if (ret < 0 && s->compressed_flush_ret == 0) {
>> +        /*
>> +         * The data that was "written" earlier is lost. We don't want to
>> +         * care with storing it somehow to retry flushing later.
> 
> Yeah, there is little point in trying something like writing it again and again in the hope that maybe at some point it’ll work.
> 
> It is a shame that the error isn’t returned by the original compressed write, but what can you do.
> 
>>                                                                   Also, how much
>> +         * data will we have to store, if not drop it after failed flush?
>> +         * After this point qcow2_co_flush_compressed_cache() (and
>> +         * qcow2_flush_compressed_cache()) never return success.
>> +         */
>> +        s->compressed_flush_ret = ret;
>> +    }
>> +
>> +    seqcache_discard_cluster(s->compressed_cache, offset);
>> +
>> +    qcow2_inflight_writes_dec(bs, offset, bytes);
>> +
>> +    return ret < 0 ? ret : 1;
>> +}
>> +
>> +int coroutine_fn qcow2_co_flush_compressed_cache(BlockDriverState *bs)
>> +{
>> +    BDRVQcow2State *s = bs->opaque;
>> +
>> +    if (s->compressed_cache) {
>> +        uint64_t nb_clusters = seqcache_nb_clusters(s->compressed_cache);
>> +
>> +        /*
>> +         * If parallel writes are possible we don't want to loop forever. So
>> +         * flush only clusters available at start of flush operation.
>> +         */
>> +        while (nb_clusters--) {
>> +            qcow2_co_compressed_flush_one(bs, true);
>> +        }
>> +    }
>> +
>> +    return s->compressed_flush_ret;
>> +}
>> +
>>   static int qcow2_inactivate(BlockDriverState *bs)
>>   {
>>       BDRVQcow2State *s = bs->opaque;
>> @@ -2667,6 +2757,13 @@ static int qcow2_inactivate(BlockDriverState *bs)
>>                             bdrv_get_device_or_node_name(bs));
>>       }
>> +    ret = qcow2_flush_compressed_cache(bs);
>> +    if (ret) {
>> +        result = ret;
>> +        error_report("Failed to flush the compressed write cache: %s",
>> +                     strerror(-ret));
>> +    }
>> +
>>       ret = qcow2_cache_flush(bs, s->l2_table_cache);
>>       if (ret) {
>>           result = ret;
>> @@ -2699,6 +2796,12 @@ static void qcow2_close(BlockDriverState *bs)
>>           qcow2_inactivate(bs);
>>       }
>> +    /*
>> +     * Cache should be flushed in qcow2_inactivate() and should be empty in
>> +     * inactive mode. So we are safe to free it.
>> +     */
>> +    seqcache_free(s->compressed_cache);
>> +
>>       cache_clean_timer_del(bs);
>>       qcow2_cache_destroy(s->l2_table_cache);
>>       qcow2_cache_destroy(s->refcount_block_cache);
>> @@ -4558,18 +4661,42 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
>>           goto fail;
>>       }
>> -    qcow2_inflight_writes_inc(bs, cluster_offset, out_len);
>> +    if (s->compressed_cache) {
> 
> Why is this conditional?

We don't have compressed_cache for non o_direct.

> 
>> +        /*
>> +         * It's important to do seqcache_write() in the same critical section
>> +         * (by s->lock) as qcow2_alloc_compressed_cluster_offset(), so that the
>> +         * cache is filled sequentially.
>> +         */
> 
> Yes.
> 
>> +        seqcache_write(s->compressed_cache, cluster_offset, out_len, out_buf);
>> -    qemu_co_mutex_unlock(&s->lock);
>> +        qemu_co_mutex_unlock(&s->lock);
>> -    BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
>> -    ret = bdrv_co_pwrite(s->data_file, cluster_offset, out_len, out_buf, 0);
>> +        ret = qcow2_co_compressed_flush_one(bs, false);
> 
> The qcow2 doc says a compressed cluster can span multiple host clusters.  I don’t know whether that can happen with this driver, but if it does, wouldn’t that mean we’d need to flush two clusters here?  Oh, no, never mind.  Only the first one would be finished and thus flushed, not the second one.
> 
> I could have now removed the above paragraph, but it made me think, so I kept it:
> 
> Hm.  Actually, if we unconditionally flush here, doesn’t that mean that we’ll never have a finished cluster in the cache for longer than the span between the seqcache_write() and this qcow2_co_compressed_flush_one()?  I.e., the qcow2_co_flush_compressed_cache() is supposed to never flush any finished cluster, but only the currently active unfinished cluster (if there is one), right?

Hmm. Maybe if we have parallel write and flush requests, it's a kind of race condition: may be flush will flush both finished and unfinished cluster, maybe write will flush the finished cluster and flush will flush only unfinished one.. Moreover we may have several parallel requests, so they make several finished clusters, and sudden flush will flush them all.

> 
>> +        if (ret < 0) {
>> +            /*
>> +             * if ret < 0 it probably not this request which failed, but some
>> +             * previous one that was cached. Moreover, when we write to the
>> +             * cache we probably may always report success, because
>> +             * seqcache_write() never fails. Still, it's better to inform
>> +             * compressed backup now then wait until final flush.
>> +             */
> 
> Yup.
> 
>> +            goto fail;
>> +        }
>> +    } else {
>> +        qcow2_inflight_writes_inc(bs, cluster_offset, out_len);
>> -    qcow2_inflight_writes_dec(bs, cluster_offset, out_len);
>> +        qemu_co_mutex_unlock(&s->lock);
>> -    if (ret < 0) {
>> -        goto fail;
>> +        BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
>> +        ret = bdrv_co_pwrite(s->data_file, cluster_offset, out_len, out_buf, 0);
>> +
>> +        qcow2_inflight_writes_dec(bs, cluster_offset, out_len);
>> +
>> +        if (ret < 0) {
>> +            goto fail;
>> +        }
>>       }
>> +
>>   success:
>>       ret = 0;
>>   fail:
>> @@ -4681,10 +4808,19 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
>>       out_buf = qemu_blockalign(bs, s->cluster_size);
>> -    BLKDBG_EVENT(bs->file, BLKDBG_READ_COMPRESSED);
>> -    ret = bdrv_co_pread(bs->file, coffset, csize, buf, 0);
>> -    if (ret < 0) {
>> -        goto fail;
>> +    /*
>> +     * seqcache_read may return less bytes than csize, as csize may exceed
>> +     * actual compressed data size. So we are OK if seqcache_read returns
>> +     * something > 0.
> 
> I was about to ask what happens when a compressed cluster spans two host clusters (I could have imagined that in theory the second one could have been discarded, but not the first one, so reading from the cache would really be short -- we would have needed to check that we only fell short in the range of 512 bytes, not more).
> 
> But then I realized that in this version of the series, all finished clusters are immediately discarded and only the current unfinished one is kept.  Does it even make sense to try seqcache_read() here, then?

Hmm. Not immediately, but after flush. An flush is not under mutex. So in theory at some moment we may have several finished clusters "in-flight". And your question make sense. The cache supports reading from consequitive clusters. But we also should support here reading one part of data from disk and another from the cache to be safe.

> 
>> +     */
>> +    if (!s->compressed_cache ||
> 
> (As for writing, I don’t think this can ever occur.)
> 
> Max
> 
>> +        seqcache_read(s->compressed_cache, coffset, csize, buf) <= 0)
>> +    {
>> +        BLKDBG_EVENT(bs->file, BLKDBG_READ_COMPRESSED);
>> +        ret = bdrv_co_pread(bs->file, coffset, csize, buf, 0);
>> +        if (ret < 0) {
>> +            goto fail;
>> +        }
>>       }
>>       if (qcow2_co_decompress(bs, out_buf, s->cluster_size, buf, csize) < 0) {
>>
> 


-- 
Best regards,
Vladimir

