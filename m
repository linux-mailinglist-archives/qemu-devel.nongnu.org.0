Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936F849087C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 13:14:59 +0100 (CET)
Received: from localhost ([::1]:37430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9QuY-00014N-En
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 07:14:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9QjI-0001KR-Ts; Mon, 17 Jan 2022 07:03:20 -0500
Received: from mail-eopbgr60096.outbound.protection.outlook.com
 ([40.107.6.96]:1797 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9QjF-0003HF-DK; Mon, 17 Jan 2022 07:03:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4olWKYKT2AgNKeqIc585rNgSE3NmZMWMXSPwtIVao+vdbz2aYb+A3jnp10rMUsqxf4OU1/KNsgi9m3FvrwE5kyyPmPMaH5v4Tecae5jhRLA2X0s0XZjqy5BLpJufgs7phJ3KfeJeD5orUstEB+2P9LzXjcZ18o1DST4vAhMhm/g0XNQM/IrZ9eO7TZ0oFI6de5dS1aPDPyrVVBgxMImqKmZhQlM543AfrKn5jKjA8duk1bYl7ScILfUSzOLIwO3O/SY1MUhLnWZLHMXbgbcmiEmU5XQa9yHwdfF4u31P920hLf6wroWowhrnjUl8xSBH3S1tap4Ej1RdQiJzGNbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pROgkOhu/Mti2v2Mbi+oE/bpumabNLtfRp7E9qXWhFU=;
 b=kzzD+5fJ+aenw4Vj3CVx4OzB6bw9mAKrru3kdqe24OocqpnZOTNy5DlR9SemWbGnPYlTpQww4e2VeqHdw3abNPkRjDoJcHqAXSpXH/zDUEJ/EcGVD142JhnEk9hw/s0WwLSMzSLK/3P/qku/pR7ZbeokUOFFAu3NN78txDC8bS/y2XQN2HHSJCjemsFwtOsFXOIYXzjAYXdqBkI+FIgLkYYgrb1i5TVecoAdDnfVfFHlFb4nJQLcnPJ55JIOyneg4Xt0UloKyey6H+e9HQhHM7Gh5tvXlxNatOcDMvYXyT01ymsWt6lTBLzN6oSlnGx1djRyyrEvQtVxywswqLDKgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pROgkOhu/Mti2v2Mbi+oE/bpumabNLtfRp7E9qXWhFU=;
 b=aM4Mg0sfHxI8vbtz5DbNitX97na2wi+sKUI9iQDOYpd+JNL/q9/PcEFUBQ3Lwq+QtwL8UrSaoojuGJPPKbiQUFouIJjadmGNrLIiQM+3nGIxGefbehPXbglUZtywLcdvHvw39DW7W4K30GaHT4E+CnUODyWUODMt+5+pFpkcfTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3419.eurprd08.prod.outlook.com (2603:10a6:10:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 12:02:35 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 12:02:35 +0000
Message-ID: <af1d2dc7-0e4f-cb52-5fee-fad8ee3269a4@virtuozzo.com>
Date: Mon, 17 Jan 2022 15:02:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 07/19] block/dirty-bitmap: introduce
 bdrv_dirty_bitmap_status()
Content-Language: en-US
To: Nikta Lapshin <nikita.lapshin@virtuozzo.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-8-vsementsov@virtuozzo.com>
 <baa29d60-902a-e2be-cfcf-c66b39b21d50@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <baa29d60-902a-e2be-cfcf-c66b39b21d50@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0060.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::37) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f76a5500-18cb-42b0-0055-08d9d9b13fde
X-MS-TrafficTypeDiagnostic: DB7PR08MB3419:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB3419790ADF90C62FD3782B08C1579@DB7PR08MB3419.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ENXotxKaizyyBHixrsDilUY16rR1emoA+Fsp8iyJZiH5KgXoXmZzdrZeJe8qjV6Dxjrkx9icE1mzh4xrTzaBs6r8D4WAfKMMhURDwhUhJNvJlxl2DwvkBUngvo0fyQC9UBPRRoeucvjUvpb4M2y9eSI0eKqghTr8PzYzzlpgQFF2RyHi5bHaa58+z9Lji2fsccPP4U/4HFqxHYXNkUkwmRrUpBUL8pY3EsJL3VhOwaMVm2i3Lm9N55ZtxXlIKwnLluHdWuZaCx88367soVS96LBCtmaWLTN3D0SamJ7lf4oTQkfvRtkgXLm3uMEUM3H2nABYnYgPVsnXWrVsdenjATEifLgJoMDEodlKju2weOGhCnPAzYDmbf/2c5F/jFGL8mEkilVhCLdI7xV5OjuKSylal+RPKlYNj41+Lcesr7+XZPJgzhtPldS8sDG/jCZ3Qkrll0T4KwmbwL1PkHzjM3Ud/eityZNbmDfV9qtYYsQmbGFv8eF5nyTFxDpBQ6hyokCKCqPMF3XjcmyFc2YuQxvMHuR2I7ySe29kj2yiD4lRBCRtj0Y5mhGc9CDDfbhcvU/36AiJ0ChVZWT91J/QWzKpfrucHHMvWMILPQBfJ2XpIs3nL84jRaxLrEtelH+ufVGM6fLBd+fzSzPGHVIRx2qLu6r5q2WW0NOGDc7B3G3GxBw2OoE0JSd92JJrU+M2fSEEUDeQZyVUxtR1H5KTCK0VdZ7zW2UQW60DBwFum/GdScqMlR8mPMAin1nPtT7sotD+5FHHO8w+2c7XL/qoLH8ufWkOVPn8thFthzy+AQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(53546011)(4326008)(6486002)(26005)(52116002)(31696002)(8676002)(83380400001)(6512007)(508600001)(186003)(31686004)(86362001)(8936002)(316002)(2616005)(66476007)(5660300002)(38100700002)(38350700002)(66556008)(2906002)(66946007)(36756003)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0R1U2xkUDBmb3NQMlhkVWNNOHI4Y0JTMEVSRWFVV0lNOFJkZFVQN0x1Zkk3?=
 =?utf-8?B?aVJNQThMZVlGaDlOb0RkV1pFU05pSkVKYXVlejMvSTVSSzRZOXVweGpDaGw2?=
 =?utf-8?B?UG5wUXd6SmlNVWJrS1RjdkQ2cXRzdU9lOWYvQW1YcjZiZWtuQ0NtbGY4MCtQ?=
 =?utf-8?B?WVFOWXg4RDNEd3pNVThpMWsvamYyV280ZDJpOExTNndHaHhqRmNuSHRVcFUx?=
 =?utf-8?B?VG5FZjQ2OEtQZExJa0puRDYyc2lZMGE2UG8vcElNUUUrMlhxOEdoM1lwZWtt?=
 =?utf-8?B?NUZySHpnWWwwZXA0UDh5T0JWOWZpclRRbElDNmorMlhzdGFtQnlyVGRxZytn?=
 =?utf-8?B?Ukd1TGd3ZnhnSzFzTjR3SGJ6VXc0T0htbUtzWXAvZ1hxK2d2SEg4cHdQU0Zl?=
 =?utf-8?B?ZTZwbEpCUWZnVkk5YzIva3ZJTUU3czdDdVFjdjFhSFhyUjhnNTI4ckJ0TE8z?=
 =?utf-8?B?YWxGWkVJT3hJOE02eUtiYk1rNGtsVTVoWEdEN2J3TEpnQVZ4UXk5dzBMdjVT?=
 =?utf-8?B?Q3JGc0Q4NFY3TTdGZGNHeEtPakZhcC9TRU1TcldlQXlCNUNrMFRjUUUvYWdV?=
 =?utf-8?B?Mk9YRXRTL0ZtSENBNVA3WWdtOVM5dFM4OGVwYkQrdTNIVFRRSmR3WTVuK3Na?=
 =?utf-8?B?RUN4MzE2MzdRYTU4cUVSb1hjcWxxNGpaNW1SZ1hkZWU1NVFuRVZ2cU16LzJV?=
 =?utf-8?B?L1EveUF1S0Y0Z1M2YVNNelRCekVTUWlaak5PMElReXlnSTdWTTNyVW9ldTJB?=
 =?utf-8?B?RFpUQ25NeFJMSzdpYU9DZ2FNc041VGN3WDhpa2FocEg5d1RsbGN0K1RFODNG?=
 =?utf-8?B?M1UzK3c1dXp3M2xnYkw2Tnl3NmVmWXJMTVpKcFlJZ2NZQm5nNlFtMVcyMGl3?=
 =?utf-8?B?S1lWenVoS0dCc1NhTzM4S09CanhWblNnRjlFRzNYQ2dmaDRwSmgrR3U5bGdu?=
 =?utf-8?B?SjB0SEN2cXh1YktOMHMyZGJ1WGhDU2tkT3ZhaVlIN0hGUVlLbDc1QTdmM1lP?=
 =?utf-8?B?L2xDRTBwN1hGdjFRUC9SY05XRHp1eGE1NU5KM0N3MTJ0c2ZleHVoaGNqNEhR?=
 =?utf-8?B?T3lEYVFHZlZPTU5qellEVWtuTS8zWTNnVjNhZHhyYmMxN0Z6NU9odG9Fa3h4?=
 =?utf-8?B?LzNzSEtLRVkxcG5URTNRVDFCL29mclFjVzNTZ3BuVm9hWEJib2RudFN4d2pI?=
 =?utf-8?B?WGxwRlo4MHVrZ3F0SVE0aENLYlU0L0pqeUd5aTZBNHJLOWs5MEcrTzNpNytm?=
 =?utf-8?B?b2FuS2w5RjJUZnQ5ekRLOGhvaVpiVlBSenNjQTRDUjhweVI0QU9HRkljcXg4?=
 =?utf-8?B?b3Uyc1pmOGdqQjNRT0U3bklUOERBZGNkU3dJUGJXU25raURjOWtCd2pXRVRy?=
 =?utf-8?B?UHl0b3Zsa0pNcWNLNkV2aDE3U0k1UTNDSGdBSzY0L0phemVhbVRvYVBhTHVK?=
 =?utf-8?B?M2dMazRlVUxkNWhLZjEyRzlzVDJ0bFFQZXlRbHE1M2dqa0JiSXVKZXEybVFo?=
 =?utf-8?B?L25iVFAwOHFCS0hoY3V2WkRxZy9kRjdIVmxyblBJOTN3eUJGQS9hQ09CVm1G?=
 =?utf-8?B?YU1VRDRlZkg0RjRqaW01VjhKSDcyeU1aRndJSWNKZmxZcnV0RjNUYUt2amdq?=
 =?utf-8?B?VlBSZEJxelNKV1hRKzNtakJzTjM1M0tjN0Z3YmdlVVZhaVBQZjRxakdHMUhE?=
 =?utf-8?B?T2thL3NuTm1Hb0NuQjdQclU2VVFGaXpsaGp4aTVwODVrVlhIMWZYU1d4MVUx?=
 =?utf-8?B?TTVIdXl2Z3kvcEgrTmUzaFU2SG5xaFNWSExZeU0wTW1aMlc2RWV1dkJyK2gy?=
 =?utf-8?B?WWQwZmFzSjF4V1AvdUpTNG1qRm9NNUpTbERIaTM2Q3BwaFhtZUlGRmsyQkJE?=
 =?utf-8?B?VXZLSmY5SWxhMWVVT3hDcmtrZEZ5dW5QZ2UvT3I1eHZWU2NFSDNQaDYxOEta?=
 =?utf-8?B?MlR2SXhDVmdHTmpab0I4Y092L0V3bG1RYnl4eWZaTng2b3ZlRTd3M0h5bGNT?=
 =?utf-8?B?NmM5QkJKZTdqVGVsUFYwODVZMHM2eUdyMlR6SFFpV3lEUWVLWkZKZng2MG5X?=
 =?utf-8?B?MFFFRkllQkNFYXdoZTJJTHBiTTR5d21uaWlyTjNjNFNGNWNSUkJOT1VVQ0hP?=
 =?utf-8?B?bGIwQnpDdDlWeFJ4dW9qcWc5NFZrWEwxOXlYRXk5OVd5aUxYOC9WaEJ3cHVq?=
 =?utf-8?B?UWlqR3YxOGk1YldsKytENlBRakZubmcxZ1JsTlFKbjJzblh2VW5TSThzM1R4?=
 =?utf-8?Q?S8yWbXQE0JxvmS1+fmG+W5tUr1yFGGL9kkexD5gOAU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76a5500-18cb-42b0-0055-08d9d9b13fde
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 12:02:35.6868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vS1QRBYGwZXuM3TS5N67tPRgCg9iUwM45i8a/Z+jcJt+gIvcFGdhTyqMQ6odsAH+FkHH1qXzxz1VgHOR9rfVkadUgKD/Qsf2b0O0qFAJJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3419
Received-SPF: pass client-ip=40.107.6.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

17.01.2022 13:06, Nikta Lapshin wrote:
> On 12/22/21 20:40, Vladimir Sementsov-Ogievskiy wrote:
> 
>> Add a convenient function similar with bdrv_block_status() to get
>> status of dirty bitmap.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
>> ---
>>   include/block/dirty-bitmap.h |  2 ++
>>   include/qemu/hbitmap.h       | 11 +++++++++++
>>   block/dirty-bitmap.c         |  6 ++++++
>>   util/hbitmap.c               | 36 ++++++++++++++++++++++++++++++++++++
>>   4 files changed, 55 insertions(+)
>>
>> diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
>> index f95d350b70..2ae7dc3d1d 100644
>> --- a/include/block/dirty-bitmap.h
>> +++ b/include/block/dirty-bitmap.h
>> @@ -115,6 +115,8 @@ int64_t bdrv_dirty_bitmap_next_zero(BdrvDirtyBitmap *bitmap, int64_t offset,
>>   bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
>>           int64_t start, int64_t end, int64_t max_dirty_count,
>>           int64_t *dirty_start, int64_t *dirty_count);
>> +void bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
>> +                              int64_t bytes, bool *is_dirty, int64_t *count);
>>   BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *bitmap,
>>                                                     Error **errp);
>>   
>> diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
>> index 5e71b6d6f7..845fda12db 100644
>> --- a/include/qemu/hbitmap.h
>> +++ b/include/qemu/hbitmap.h
>> @@ -340,6 +340,17 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
>>                                int64_t max_dirty_count,
>>                                int64_t *dirty_start, int64_t *dirty_count);
>>   
>> +/*
>> + * bdrv_dirty_bitmap_status:
>> + * @hb: The HBitmap to operate on
>> + * @start: the offset to start from
>> + * @end: end of requested area
>> + * @is_dirty: is bitmap dirty at @offset
>> + * @pnum: how many bits has same value starting from @offset
>> + */
>> +void hbitmap_status(const HBitmap *hb, int64_t offset, int64_t bytes,
>> +                    bool *is_dirty, int64_t *pnum);
>> +
> 
> I think description should be changed, there is no start and no end
> arguments in function.
> 
>>   /**
>>    * hbitmap_iter_next:
>>    * @hbi: HBitmapIter to operate on.
>> diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
>> index 94a0276833..e4a836749a 100644
>> --- a/block/dirty-bitmap.c
>> +++ b/block/dirty-bitmap.c
>> @@ -875,6 +875,12 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
>>                                      dirty_start, dirty_count);
>>   }
>>   
>> +void bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
>> +                              int64_t bytes, bool *is_dirty, int64_t *count)
>> +{
>> +    hbitmap_status(bitmap->bitmap, offset, bytes, is_dirty, count);
>> +}
>> +
>>   /**
>>    * bdrv_merge_dirty_bitmap: merge src into dest.
>>    * Ensures permissions on bitmaps are reasonable; use for public API.
>> diff --git a/util/hbitmap.c b/util/hbitmap.c
>> index 305b894a63..ae8d0eb4d2 100644
>> --- a/util/hbitmap.c
>> +++ b/util/hbitmap.c
>> @@ -301,6 +301,42 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
>>       return true;
>>   }
>>   
>> +void hbitmap_status(const HBitmap *hb, int64_t start, int64_t count,
>> +                    bool *is_dirty, int64_t *pnum)
>> +{
>> +    int64_t next_dirty, next_zero;
>> +
>> +    assert(start >= 0);
>> +    assert(count > 0);
>> +    assert(start + count <= hb->orig_size);
>> +
>> +    next_dirty = hbitmap_next_dirty(hb, start, count);
>> +    if (next_dirty == -1) {
>> +        *pnum = count;
>> +        *is_dirty = false;
>> +        return;
>> +    }
>> +
>> +    if (next_dirty > start) {
>> +        *pnum = next_dirty - start;
>> +        *is_dirty = false;
>> +        return;
>> +    }
>> +
>> +    assert(next_dirty == start);
>> +
>> +    next_zero = hbitmap_next_zero(hb, start, count);
>> +    if (next_zero == -1) {
>> +        *pnum = count;
>> +        *is_dirty = true;
>> +        return;
>> +    }
>> +
>> +    assert(next_zero > start);
>> +    *pnum = next_zero - start;
>> +    *is_dirty = false;
>> +}
>> +
> 
> This function finds if this bitmap is dirty and also counts first bits.

Not exactly.

The idea was to have one function, that works like block_status:
it return status of bit at offset and count how many bits are of the same status after it.

> I don't think that this is a problem, but may be it should be divided?

No, I need it as one function, for further commits.

> 
>>   bool hbitmap_empty(const HBitmap *hb)
>>   {
>>       return hb->count == 0;
> 
> With corrected description
> Reviewed-by: Nikita Lapshin<nikita.lapshin@virtuozzo.com>
> 

thanks!

-- 
Best regards,
Vladimir

