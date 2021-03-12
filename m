Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0579333917C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:37:07 +0100 (CET)
Received: from localhost ([::1]:42344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjqb-0004uf-Uw
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKjeW-0002kS-RI; Fri, 12 Mar 2021 10:24:36 -0500
Received: from mail-eopbgr50137.outbound.protection.outlook.com
 ([40.107.5.137]:54855 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKjeS-0006lI-PL; Fri, 12 Mar 2021 10:24:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rj+SJl754NO/xDd7ynfbbW6eccd9xBGMN1cGRIUGPuJMdcpGVVP6q23MczIQ27pN32y4pYioMhHdMMH4wI9r6+X18Ve28MvntSZR6TqHzDi4HvDCbajOU+yiAHYE3TfiRnUMFf3C6VmrGV9GfDKiVP1V1yGKrXLQfbQVZfhoV1jVWq3vUsJ5B5Jz1xsZzEb3QDuMtADTtsIysdj1LIQTahQ7HM94Onmly6sWEi6BqqB/9UXUjdGQRCpLtHItIss3XzFvuaxVnEhXIbmK7RmIcRekddKSO+TSfdhQdRITwcpI5q/xW/giIuFLNqP6+DQbDsaPzote9sdC5ScQEgWFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=122K57CEMxiOmZu9TbUMtGOuCwcT0qzA27kiTj2spGg=;
 b=g/acLWnki/GuHVsqVaSEnYHw+Y6QUMgANVFAY6rS6yuuiAPhvzmBH1We/vfhMmyBNier4M9Arl90wfAsOqlW5neQKM7p8585AQ5NKtWMpHahphaf8mPR0WkWc/P0teizWzApNmb5GtRK7P5i8CqHRVIpuyBgkTbFTmtLpWWO+PgNEz9ARndYcIShWvot6kZhtvJ14HGOdno3eOEHtXl+s5gf1MKjQOytMaOhwgU6CNJJi+eDyNSUOp0D9OtnT95Qeg5hgo5kreLtPGdDCJqhys6rZ7itIldAdMPVpIjkBlq50W+38lHHE1dPCev0wqJP7wGSwFVSt3kNcEq0jVyXmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=122K57CEMxiOmZu9TbUMtGOuCwcT0qzA27kiTj2spGg=;
 b=nKwlEm/nEbXW/NDnijPzhczEbQIMDYwScAgnqZmrdF3WXE7U/bxirywauPIIBKqIH9riWeClxoQk3nctKQg2KkAHdFVfGaauahCBFaYJJB+KTt88H0boAM6pFeqNFpSn7rUEmIBy4OzkzCLZFMCyv81ALyras2zENgqx18MzRtM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6165.eurprd08.prod.outlook.com (2603:10a6:20b:29a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 12 Mar
 2021 15:24:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 15:24:27 +0000
Subject: Re: [PATCH v3 3/6] block/qcow2: introduce inflight writes counters:
 fix discard
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-4-vsementsov@virtuozzo.com>
 <72a42f79-a608-6605-c0e1-8f35303b9c81@redhat.com>
 <3f4e3e81-8750-cbe2-0d54-d7c9e0055d38@virtuozzo.com>
 <a1656b5e-8333-885f-f0c6-0a4e6dec8bd2@redhat.com>
 <89d3bfd8-3a22-a9da-dbb8-370aa6ac2653@virtuozzo.com>
 <dcc0caaa-f8b6-6139-a02c-643397f0a787@virtuozzo.com>
 <4ff8a576-9713-7c06-8ab5-a5232314507d@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5fdf28fa-5a67-e3ff-a592-dc6c9285d75a@virtuozzo.com>
Date: Fri, 12 Mar 2021 18:24:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <4ff8a576-9713-7c06-8ab5-a5232314507d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR02CA0087.eurprd02.prod.outlook.com
 (2603:10a6:208:154::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR02CA0087.eurprd02.prod.outlook.com (2603:10a6:208:154::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 15:24:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18b42e91-0813-40b1-d1dd-08d8e56aec90
X-MS-TrafficTypeDiagnostic: AS8PR08MB6165:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6165335AABB85E3D39BF93E9C16F9@AS8PR08MB6165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iA8GZ574Ya1rsUARYy/FAA4fUXDBgZqz1UxIxYVN4q49m34FqfqkmsThW+wFD8NuXHAp6JyYlaQPMoYkHbS9RN5JFGs0gO67Jkn6jvkrTDH6nVjTqw3LMjqiqrtnoTZk5suNGWljvIM06busRmnIPKJEItdJ+/ndzdRs+lyxjGU+NTptVX4lkufZSc5ATXSlGW91acr/Aj55zdS60/RElat4Uqay2QumOUQ3+ybdSEojKQk8LaxzQo0ZA6jo63hEGA9EIQeJG6kP4WR/la2m6SZt9IP1RoAsCbl/StFEcSXkxrvgL6beeVkX3EqzO5MpBQciTnlPrZ8zSmXWbditv+drlBuQbTkVfoDBK/TrzObQV30gq+AI3dEl4kg7mEfPUCwhvFXimOd8KImxsguIga73dGLPPiMW9McFRuSGqbhcs0CFvYP7QmAXgV5+4pW5S8IuurogQcnDnwMNNGdWTq2PxZpSkgNcYnDK0P2zEckT/G81a0u9zzg07WMeVsqF82w92HhWSMr2InTOsAd9sJE/W3qtDPFDqVf8yAdlfRfT0hBRBgqzdMKpCckTNWbPp4h50BR9PgPXGav4X/kp+nj+uIOoip4Qj3xj7XQv+apt+qMSJ5ruBcKK2wnJOaGIZpxXpHEFliBrV4PJ7GLT9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(376002)(396003)(346002)(136003)(83380400001)(53546011)(19627235002)(31696002)(52116002)(6486002)(31686004)(86362001)(316002)(26005)(2906002)(478600001)(8676002)(66946007)(186003)(956004)(2616005)(16576012)(36756003)(66476007)(16526019)(4326008)(5660300002)(8936002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZXpMRWhrSXRxNHIyUmpweDR5dXFkK1ZWeXI3OWw2S2gxeFk5Y1V1cEliUkRw?=
 =?utf-8?B?N1JjQ2xEeFlLNHhhZmErUU9UY1lMNXc1eWFsZG9IOFpsY3p3bGZIR3NkT3lz?=
 =?utf-8?B?bjlhUXFsZE1FK20vSFNQZ3IwVUNEbTE4T3BLbm1mKzBHZlpOYkNXTnR0SGR3?=
 =?utf-8?B?dkM3cWpLUDI2RklDK0tRR253SkVjb2djQVRhZDRQNEdEbU9WMVJ4U01nY2NM?=
 =?utf-8?B?c0VFKzZ2ZnpYN2s2T2NZRlpTdUhVUzBZZU1kRlRhM2dkWXQxcmF5ZGR0R1BC?=
 =?utf-8?B?V0lMSC9hQndYNDREVGJOd3Y2OERBQ2czQlYzMGl2ZnhQaW9JdnhEbCtPeUtT?=
 =?utf-8?B?SS83VDVOamFRWUphSzJuWTBJV1ZZYmRoTTNvdXlIeWFqQk1uTndJcmtRZmVS?=
 =?utf-8?B?U2U3b0Jwa3o5TlpNVEJ0UVhST1R4TTlEc1NHVlVrWWdWaDRKMHhOaEp6VVpa?=
 =?utf-8?B?eDgreURRTzZnMDZRYVZrQmorTGR4cmp5SkFOdjF3UmxFSmRwemIvUllxbGoy?=
 =?utf-8?B?bDVmZDU4VmhZTm5aZXBLYUJraXJMaW9YS3RBYkZwbWU4TUZwTHdST3AzemE3?=
 =?utf-8?B?QldjUU4rdm1LVEVPTHljbStGZlpmdDRpNTcxTDMweHM2SGwyWVRvdXkzRUpG?=
 =?utf-8?B?NTVzeFRrbzZRdWpSQ1RLdUVXMjdxY09mYkpDRGkyOWpML3c4eUF5RHMrQ0Z3?=
 =?utf-8?B?dXdNbXpCOFUvdGRQb2hmWGpEYnBUZm95aUhPVjR6YzJId1FYTXl2aW1ONHVz?=
 =?utf-8?B?T0g0ZkwxaHpZVGZVd0ZPTVA5c083VGFmckV4dmEzM2FvWlpBbHNZVjFHejRC?=
 =?utf-8?B?V3hWMms4dzVuL1pkNGVNMEtBSmtnS1J6Z2dIQkNOckpLRGZ0eWdIQjNVdS9B?=
 =?utf-8?B?bEh5cDcxZkJHMzJYclc5MkI3UDFZQWhCQ25ETm1EM3FqYXNYZVNPUlY2R040?=
 =?utf-8?B?L1o1NTh3WVNJMm1XU3VycGtncjhtT0pTZHRVSVZ2Rm9SSDdmdDgrZ0VtRDFI?=
 =?utf-8?B?aHNHUjVWdTlCUXZGcW85TSt0V2JRdGlWa09QR1pJM2FiajNXSjRyS3h1dVl4?=
 =?utf-8?B?eE9oUHZob0lKNkwwQ0JhWmNyTzBTNm1Yb3YwMU1tT3JtQ1FhZXNEMkh4bmRa?=
 =?utf-8?B?c1I4Nm93STlkMTRDaU51VzhlSU5mbUh6cWVVV25tUVpETjQ5UFJOWmRnY2lL?=
 =?utf-8?B?QXV6UHpubGdYLzZaV3U3Y0M3WHFLYkJOT2VJL1V5SkQ2VW8xNHoyaEROT0pp?=
 =?utf-8?B?bjV2T25YZkpabHU2QWRDZGJSZ1doSEJYblAwQ3R0dkRVOURiYUluL21LM04z?=
 =?utf-8?B?NGgxWGtodFdsMVZLRWszSnRpM1g1QTVSZks4QUZ5Y1dLWk1ST2JwREY1aWFW?=
 =?utf-8?B?aXVWNzVEbkdUaXpVQWgzVlh5eCtuZEdBdlRGTG5PQ3V3d1NsL2NJRkIwYWhN?=
 =?utf-8?B?VVNZUUhrclBwK0luN2xtNEJvN1haTVVXa3VaSnUzVGRBNTUyWE96dzJoRHBF?=
 =?utf-8?B?VkdzTEh1bCsxM1dDRWVqanNKSFRCWjFPYnZrY2h4bUs5M04yK29FZ3RIMTRk?=
 =?utf-8?B?cU1pVzV6dmR1SzUvMGJKMFIvdEhIVVZzYkdtTkxJYW5TVlk5STFYRlpnS2J6?=
 =?utf-8?B?NVVuSERrbjcyb3pYZmdxMThPdGEwK1puK2FNVE01UjI3TExTYTBYcytvVlYw?=
 =?utf-8?B?Ym9RdzBjd01qZUhaWmJPUGwyOHFCY1kySWQzaGNEaDRORTVvRVcrU2ZuS3FM?=
 =?utf-8?Q?ebWAWczFlGfi/jwD2BSxUygav1FLdQELM5rsQVh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b42e91-0813-40b1-d1dd-08d8e56aec90
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 15:24:27.4005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: giTWDFoCMrSvdw9W0gtlSUZ/XO3d7CuzQsHkcAkw3LEOaiy5jS8sS9diOW4KGD6tBxLyK1ykroBphnW9TN6IrJSSC/lfPZmYZqhu5QLc8JA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6165
Received-SPF: pass client-ip=40.107.5.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

12.03.2021 18:10, Max Reitz wrote:
> On 12.03.21 13:46, Vladimir Sementsov-Ogievskiy wrote:
>> 12.03.2021 15:32, Vladimir Sementsov-Ogievskiy wrote:
>>> 12.03.2021 14:17, Max Reitz wrote:
>>>> On 12.03.21 10:09, Vladimir Sementsov-Ogievskiy wrote:
>>>>> 11.03.2021 22:58, Max Reitz wrote:
>>>>>> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>> There is a bug in qcow2: host cluster can be discarded (refcount
>>>>>>> becomes 0) and reused during data write. In this case data write may
>>>
>>> [..]
>>>
>>>>>>> @@ -885,6 +1019,13 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
>>>>>>>           if (refcount == 0) {
>>>>>>>               void *table;
>>>>>>> +            Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
>>>>>>> +
>>>>>>> +            if (infl) {
>>>>>>> +                infl->refcount_zero = true;
>>>>>>> +                infl->type = type;
>>>>>>> +                continue;
>>>>>>> +            }
>>>>>>
>>>>>> I don’t understand what this is supposed to do exactly.  It seems like it wants to keep metadata structures in the cache that are still in use (because dropping them from the caches is what happens next), but users of metadata structures won’t set in-flight counters for those metadata structures, will they?
>>>>>
>>>>> Don't follow.
>>>>>
>>>>> We want the code in "if (refcount == 0)" to be triggered only when full reference count of the host cluster becomes 0, including inflight-write-cnt. So, if at this point inflight-write-cnt is not 0, we postpone freeing the host cluster, it will be done later from "slow path" in update_inflight_write_cnt().
>>>>
>>>> But the code under “if (refcount == 0)” doesn’t free anything, does it?  All I can see is code to remove metadata structures from the metadata caches (if the discarded cluster was an L2 table or a refblock), and finally the discard on the underlying file.  I don’t see how that protocol-level discard has anything to do with our problem, though.
>>>
>>> Hmm. Still, if we do this discard, and then our in-flight write, we'll have data instead of a hole. Not a big deal, but seems better to postpone discard.
>>>
>>> On the other hand, clearing caches is OK, as its related only to qcow2-refcount, not to inflight-write-cnt
>>>
>>>>
>>>> As far as I understand, the freeing happens immediately above the “if (refcount == 0)” block by s->set_refcount() setting the refcount to 0. (including updating s->free_cluster_index if the refcount is 0).
>>>
>>> Hmm.. And that (setting s->free_cluster_index) what I should actually prevent until total reference count becomes zero.
>>>
>>> And about s->set_refcount(): it only update a refcount itself, and don't free anything.
>>>
>>>
>>
>> So, it is more correct like this:
>>
>> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
>> index 464d133368..1da282446d 100644
>> --- a/block/qcow2-refcount.c
>> +++ b/block/qcow2-refcount.c
>> @@ -1012,21 +1012,12 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
>>           } else {
>>               refcount += addend;
>>           }
>> -        if (refcount == 0 && cluster_index < s->free_cluster_index) {
>> -            s->free_cluster_index = cluster_index;
>> -        }
>>           s->set_refcount(refcount_block, block_index, refcount);
>>
>>           if (refcount == 0) {
>>               void *table;
>>               Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
>>
>> -            if (infl) {
>> -                infl->refcount_zero = true;
>> -                infl->type = type;
>> -                continue;
>> -            }
>> -
>>               table = qcow2_cache_is_table_offset(s->refcount_block_cache,
>>                                                   offset);
>>               if (table != NULL) {
>> @@ -1040,6 +1031,16 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
>>                   qcow2_cache_discard(s->l2_table_cache, table);
>>               }
>>
>> +            if (infl) {
>> +                infl->refcount_zero = true;
>> +                infl->type = type;
>> +                continue;
>> +            }
>> +
>> +            if (cluster_index < s->free_cluster_index) {
>> +                s->free_cluster_index = cluster_index;
>> +            }
>> +
>>               if (s->discard_passthrough[type]) {
>>                   update_refcount_discard(bs, cluster_offset, s->cluster_size);
>>               }
> 
> I don’t think I like using s->free_cluster_index as a protection against allocating something before it.

Hmm, I just propose not to update it, if refcount reached 0 but we still have inflight writes.


> 
> First, it comes back the problem I just described in my mail from 15:58 GMT+1, which is that you’re changing the definition of what a free cluster is.  With this proposal, you’re proposing yet a new definition: A free cluster is anything with refcount == 0 after free_cluster_index.

I think that free cluster is anything with refcount = 0 and inflight-write-cnt = 0. And free_cluster_index is a hint where start to search for such cluster.

> 
> Now looking only at the allocation functions, it may look like that kind of is the definition already.  But I don’t think that was the intention when free_cluster_index was introduced, so we’d have to check every place that sets free_cluster_index, to see whether it adheres to this definition.
> 
> And I think it’s clear that there is a place that won’t adhere to this definition, and that is this very place here, in update_refcount().  Say free_cluster_index is 42.  Then you free cluster 39, but there is a write to it, so free_cluster_index isn’t update.  Then you free cluster 38, and there are writes to that cluster, so free_cluster_index is updated to 38.  Suddenly, 39 is free to be allocated, too.

Why? 39 is protected by inflight-cnt, and we do has_infl_wr() check together with refcount==0 check when allocate clusters.

> 
> (The precise problem is that with this new definition decreasing free_cluster_index suddenly has the power to free any cluster between its new and all value.  With the old definition, changing free_cluster_index would never free any cluster.  So when you decrease free_cluster_index, you suddenly have to be sure that all clusters between the new and old value that have refcount 0 are indeed to be considered free.)
> 
> Max
> 


-- 
Best regards,
Vladimir

