Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61705B2529
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 19:51:45 +0200 (CEST)
Received: from localhost ([::1]:55506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWLgm-0000nt-P7
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 13:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oWLaV-0004TU-2O; Thu, 08 Sep 2022 13:45:20 -0400
Received: from mail-eopbgr150092.outbound.protection.outlook.com
 ([40.107.15.92]:53542 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oWLaQ-0004jc-JX; Thu, 08 Sep 2022 13:45:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIVkYyF9Jpej3I/XrkSxEurjFo/XwXtRZVu43gTK75Zj88U+va4KfoK/wS9CTNbdU5fTOxdhSTqDRf+DpECEKcVoLY1HNmmAN6RsWU2F9GB3YnXmCS1LBinIV8WK3dIMCnnSajny6TAhb/2/9vi07YfZkEQotEH18WUMt1or8y41MBsxwXCYfB7zc9tlvWeCdSz+Qdd1v6icPw7qLtMJywvd8o5emVYYBusBsJZGGiK7x/cTddATsfaprPNCmsaN3v9QD0ALL0QfLeycOOOV6dJrBr4sm9e6maYtKoPtYoovi2GZiaSOTYKk6OWbrRFuxAYjO2GL8P0z92zVl9xVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0Z7LxvSvCfZKbuQgzx5Ar+NydGW7CRBpJomiFBUR6E=;
 b=hafwVaGzcKQHPZPsiyL3QtXKPqM7LvW8mbPNTq2y1FLLHx90hIYSBCBFy6EPmqge+wC1RycknsHhGNd7w6HxkLtTR6fintQomT6AmjUxw4hY56FEzHGxfbktocenHO/Clwt5xt6qLNfYPJO8EXZLoPxmgLp/n96ZvG4XUkQwrl9LinJm778hybtOkCULLjnQrhQL1czz0Zvc4xL7wWfYHhJ7wkAy8ycogLEfmKwwrV4Mc0vU8CqR5utFiGcBQ2FVADSpJPSG3jETVzSUwkRXSNPl2ZZeBcpCBDJ+37xvjo8XbkBJVRRvBwN94KZShpNNRM1Ry/o9oTnwxgrGMSWQkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0Z7LxvSvCfZKbuQgzx5Ar+NydGW7CRBpJomiFBUR6E=;
 b=hpzazaC2fYnln7nrWbzDU/sts0qix/9mjFPjFHhvMbSBAJV4bESUkrec2Ivnd7SN+loljPxtopIatPA2B2vxtG3smqIBhtXrBbeCPvYwy4t3sRynwWfoThW3Jrni2+pydX3EcNZNl0y9l6bcY3gU+8W6Hd/Ir+4UB4w31JKO4XTaAq/wtv9yZAhJ7KcIRU/Fs7nuqlTizvDiM+V3JvPfhn9aLFGhHDyKH36RLbeSCQrWLvJuCIdWMwphlzCtvJbV7qZb62Z5hQMCWVT7otS7RuHUshVxu7ljAtQLnoXq8A5kIBE3RGAp1fIaLgAQqzsKROFnQl9B+9EVvcJAJ/lcvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VE1PR08MB5694.eurprd08.prod.outlook.com (2603:10a6:800:1a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 17:45:05 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::8824:508c:fb16:ef6e]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::8824:508c:fb16:ef6e%5]) with mapi id 15.20.5612.016; Thu, 8 Sep 2022
 17:45:05 +0000
Message-ID: <0f882207-89ae-559a-e8f0-a57ab0276c9b@virtuozzo.com>
Date: Thu, 8 Sep 2022 19:45:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] parallels: Add checking and repairing duplicate
 offsets in BAT
Content-Language: en-US
From: "Denis V. Lunev" <den@virtuozzo.com>
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
 <20220902085300.508078-4-alexander.ivanov@virtuozzo.com>
 <5d046d0c-a618-a7ad-3657-ba46fcee50aa@virtuozzo.com>
In-Reply-To: <5d046d0c-a618-a7ad-3657-ba46fcee50aa@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0134.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::32) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|VE1PR08MB5694:EE_
X-MS-Office365-Filtering-Correlation-Id: f14fe0d6-eaba-4109-82db-08da91c1dcff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vjCO+lYFHYDC2aXg5DyxXgN9fiVe39lkdkcFv91Jq7DXeanA2YUtIk2Wc5c8QK+eQes9kL+Un2lB0HxYmC3VFGv7kOJF8iMn0zRyaHEFQuxWAZ8chHmL8im5pbA1ncC+3n34yapf885MzNjt2K+Fy7eUAVmOLN2mYnTpUrFojmj10ehkUB5hrO8pEDYD4SS5wkCPldOFYE5rv3WjVBy7jkwsM5u6hLr1EGhl1V4EzBqgYlJQY1Rx8/NHMh6FwR8yKOSLOJgsED7mawVpXQC69IKQnLzG7E8VcRZJGaUW5qI7dSZMe9/Ag3PDwdfCOvIUhW/T5Z32jC5rQt2HLT/STVZ0yp/rOBr4hZ748sLfc6q/Xy/BS/wzrPQjRCFuoPv74IkNicbEtcp5Z3Qy9l4wKWdfXXnYgn4LPTIr+bQGEKFK2UPCjC7SbTL7BcSzaf7utscj0SJJCNjAXr8+L/7Xb6oqs2msaGPqHe8IsI5d03azyGiF0uQOv1bu5zL1+E8Ezk3bbn3lhashvIWFWJb/YTeITkyRFHIdKAIyeDeUuewloDdq2lTlqPlOutQDjX8gaIytCFIGJqLcd9hAAvqH+BvOM/ewkimiQDfGaNA7z+0YHtJphLpQdGTYuLoRQe674BDHIhM9VpOY4JDqJu8nY9mNXFz/Jq+gyJaJXKujZogOXouIxBnZCaPPTsqNUipy2QUel+RxIZ2aWQej7GgVj3VOQ+8LJLDtYdba8DCMKDHeSlFVqolhkhEwqtA1Vw7yQrOVIho7+foHIq6PImYN6DSZBz1LayQdI1xU3ZhVil+k8Z7Skn7x/L6FaQ6eWz9jiP+Kxy0aVV6TJChAZhne5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(136003)(366004)(396003)(39840400004)(186003)(6512007)(2616005)(478600001)(41300700001)(86362001)(26005)(6486002)(31696002)(53546011)(52116002)(6506007)(38350700002)(38100700002)(83380400001)(2906002)(31686004)(36756003)(8936002)(316002)(8676002)(4326008)(66946007)(66556008)(66476007)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm9wakRxWG9rUk5aMzBtV2pmUzZ1MmsvQ3dBbEpRWUFxSEYxZG1mN0ZDS0Nr?=
 =?utf-8?B?ckhJWVBuUS9zY0FDUzdkMGhCYnFSckVrMlZzSE5xelNaelRKWGh5NUM0UFk3?=
 =?utf-8?B?YStPVXNaK0h3QlJEeUZvR2tjYU5mb3pIUzNqczVmWE5zTUR1UlM1dTBZRjEx?=
 =?utf-8?B?eXNseU5LSnNBSWM5TGRCN1YwMkNhcWxkeUJvamU2eGl1OXRJYXUxcXllOWRF?=
 =?utf-8?B?dHVzZzBUSWVFOUN0QlNqenFqaXZmYkFOd1dCRVovdjlMMVQ3cWJuK2J1RDZ2?=
 =?utf-8?B?VFB6S0l6RVc2dW8yc1ZFSE5lNFdJQUNIRXFyU0UweXVxdXdYWjlSbnl6aVBJ?=
 =?utf-8?B?SmpYUkdNbXFrMSs1TUpYMkJqZlViMFlsQXNiZWdKSUh0U1R1blphRnBESDZu?=
 =?utf-8?B?SzcyN1lsOFN5NitYdy9UZHJJRUJDZ2U0NHJRR3c0d0V3azByV1JjUWJ5eTRn?=
 =?utf-8?B?TVlCa2dPZUl3d0xDMlUvbWkxZ0dIcExuVUR3WTJJbnVSRkcrWC9yeEoxMWJt?=
 =?utf-8?B?SitGTzBIYmIzQjBVVXltQ09GdWpiMXQrSVA5ZENkNnlWWGFBd3JyL2QzZVZr?=
 =?utf-8?B?cUpZdkxQNkluMy83N2ZCRzZXQ09KVnZPUGNpZ1NpY1JBbmwrdlNqeURIS1JE?=
 =?utf-8?B?U3JDVmh5ZzNvdEVWM1d4QTVqSUNOUlltZ01Qd3BLQ3hKMVBTQStDdHpuaGdx?=
 =?utf-8?B?a1JQQTdNYnZuZlRNRUpMNk9KbTBzbFFZdlNiTUFKTmlPOVZYblN4WW1ZMVNh?=
 =?utf-8?B?eDdsd0U1MEQzZnlMRUFYQTRIZWtHK2QwTUgwd3hlZHBrVWF3RDZJN09kUHhG?=
 =?utf-8?B?SCsxUlFzOG1LTThMeXNERzJOTXhuTFVUUVNoN0x0eVFvVmtVMkpRTHFtMjZh?=
 =?utf-8?B?M1hNNFl1ell5NHJCcEc3TnZ0b0FNSnRWKy9RQ2xJNC9GTW80b0F3K1VGNXZ1?=
 =?utf-8?B?dU9IT1VIUDkrTkZxZ0NzM3c2cDc5ZE1PZStodzdNVkpkQS9NZWh2ODZ5MmlU?=
 =?utf-8?B?aE00NUtCVG1lMmlPWElZT1g4Wk00akRnMTBYbm9xVEFtU0ZUZmVzK3RzcEJH?=
 =?utf-8?B?SVBvSmhJRk40S1FMUVcrVHY0R3ZtRGUvOVllM05GMWxmVElBYjBEYnA5YWdB?=
 =?utf-8?B?b3pweW5qU2JvUThYNmE5Y1doeWMya3FkT0xRWE9teUp0di91R1N6bTF3Z1Fk?=
 =?utf-8?B?dXVVVk9KYUFyOXVONnRwN3B0eTNiWHR0SERYS2o5VEIzOWtyM0tDWHRqMC91?=
 =?utf-8?B?azZGOWZhMmdHYkNFaGFxYUk4R0RSVGo0SUwyVmpLYk5SalVMdzNFY1BaK1U1?=
 =?utf-8?B?RDgwZkg5SVBsWE5tVm40Z3hUUXR1bjRGeTVXZlZkUHF6NGtheUlwV01aREY1?=
 =?utf-8?B?TE5LbVpVYzNHdWNtMk5MYk5HbmowRjJkWWEwZ05scHlDMktxUVpINXRWNkhr?=
 =?utf-8?B?L3B2SVJxNkNIb1ZLNlpVR3cxSlB0UnhQUnNrVVlHMERuZHVZZ3ltYTQraWRu?=
 =?utf-8?B?azFBZFFyc0ZRNStYVjJnRlp2QXE0RW0rQlZhdzdBSWp5TmR0M0crSkZpZlJN?=
 =?utf-8?B?Mko1bVUvOVR5alpkUlArSlpvZFVlNkhaeVhmcmVnZE1kYXBSTzNPY1BZK0tI?=
 =?utf-8?B?N1hiWDczVDc0cU8rc2pPaWxkYWtpMFBiajA5RGJxZWFXcnVCNWNiMUd0M2NX?=
 =?utf-8?B?N3F4UkN3WGYzUFh0NFpBbXNISlVKMXY5V3FFTm1aWG15Tkc2cEVEbHQ1eWtS?=
 =?utf-8?B?dGZBekZPRTJoNVl4Sm5PR0t4VnBDckxXMWtCUmhyam5OSUVFbGtQZFN2SGl0?=
 =?utf-8?B?VEthZjY5R2kvUnk3WDRhYnhMMW5YV3d4Sm1tYWlCaE9ybGk4N3p5ekhINVlt?=
 =?utf-8?B?SDdrQlhObWZRQmQrR1J6ckZmMkZnd25tcWFmRDhRUFEyWDZuYmFzLy9HRkQy?=
 =?utf-8?B?MUxLMmlhcWZuUFE5WXFlMUNic0xPckpqcjdiSFJjeElqcWRNL3FxcDk3Qytj?=
 =?utf-8?B?VXRqRHA2S0YwME1zRWJYMXhweVd2Q2FHQUtlTVFXSHhTQXV2M1ptbmE0Q2Y3?=
 =?utf-8?B?RjRpdE9qSWR2T2tuaysxRE1SQjBrcHd0cDNabHdyZW1kMXdtTytNY2lVZFZT?=
 =?utf-8?Q?D3Xi8y+NPNIhqCd77VHPFmYgy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14fe0d6-eaba-4109-82db-08da91c1dcff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 17:45:05.0501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rb/nlI0d4k0m90+LJn8U4czLbho3QS2qL8xXLuYB6Xfof80AU9Pzk8wQgYHH3c3UQz+nhVmAQQWCdkFr0xlCAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5694
Received-SPF: pass client-ip=40.107.15.92; envelope-from=den@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
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

On 9/8/22 19:15, Denis V. Lunev wrote:
> On 9/2/22 10:52, Alexander Ivanov wrote:
>> Cluster offsets must be unique among all BAT entries.
>> Find duplicate offsets in the BAT.
>>
>> If a duplicated offset is found fix it by copying the content
>> of the relevant cluster to a new allocated cluster and
>> set the new cluster offset to the duplicated entry.
>>
>> Add host_cluster_index() helper to deduplicate the code.
>> Add highest_offset() helper. It will be used for code deduplication
>> in the next patch.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> ---
>>   block/parallels.c | 136 ++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 136 insertions(+)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index dbcaf5d310..339ce45634 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -136,6 +136,26 @@ static int cluster_remainder(BDRVParallelsState 
>> *s, int64_t sector_num,
>>       return MIN(nb_sectors, ret);
>>   }
>>   +static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t 
>> off)
>> +{
>> +    off -= s->header->data_off << BDRV_SECTOR_BITS;
>> +    return off / s->cluster_size;
>> +}
>> +
>> +static int64_t highest_offset(BDRVParallelsState *s)
>> +{
>> +    int64_t off, high_off = 0;
>> +    int i;
>> +
>> +    for (i = 0; i < s->bat_size; i++) {
>> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>> +        if (off > high_off) {
>> +            high_off = off;
>> +        }
>> +    }
>> +    return high_off;
>> +}
>> +
>>   static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
>>                               int nb_sectors, int *pnum)
>>   {
>> @@ -547,6 +567,114 @@ static int 
>> parallels_check_leak(BlockDriverState *bs,
>>       return 0;
>>   }
>>   +static int parallels_check_duplicate(BlockDriverState *bs,
>> +                                     BdrvCheckResult *res,
>> +                                     BdrvCheckMode fix)
>> +{
>> +    BDRVParallelsState *s = bs->opaque;
>> +    QEMUIOVector qiov;
>> +    int64_t off, high_off, sector;
>> +    unsigned long *bitmap;
>> +    uint32_t i, bitmap_size, cluster_index;
>> +    int n, ret = 0;
>> +    uint64_t *buf = NULL;
>> +    bool new_allocations = false;
>> +
>> +    high_off = highest_offset(s);
>> +    if (high_off == 0) {
>> +        return 0;
>> +    }
>> +
>> +    /*
>> +     * Create a bitmap of used clusters.
>> +     * If a bit is set, there is a BAT entry pointing to this cluster.
>> +     * Loop through the BAT entrues, check bits relevant to an entry 
>> offset.
>> +     * If bit is set, this entry is duplicated. Otherwise set the bit.
>> +     */
>> +    bitmap_size = host_cluster_index(s, high_off) + 1;
>> +    bitmap = bitmap_new(bitmap_size);
>> +
>> +    buf = g_malloc(s->cluster_size);
>> +    qemu_iovec_init(&qiov, 0);
>> +    qemu_iovec_add(&qiov, buf, s->cluster_size);
>> +
>> +    for (i = 0; i < s->bat_size; i++) {
>> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>> +        if (off == 0) {
>> +            continue;
>> +        }
>> +
>> +        cluster_index = host_cluster_index(s, off);
>> +        if (test_bit(cluster_index, bitmap)) {
>> +            /* this cluster duplicates another one */
>> +            fprintf(stderr,
>> +                    "%s duplicate offset in BAT entry %u\n",
>> +                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
>> +
>> +            res->corruptions++;
>> +
>> +            if (fix & BDRV_FIX_ERRORS) {
>> +                /*
>> +                 * Reset the entry and allocate a new cluster
>> +                 * for the relevant guest offset. In this way we let
>> +                 * the lower layer to place the new cluster properly.
>> +                 * Copy the original cluster to the allocated one.
>> +                 */
>> +                parallels_set_bat_entry(s, i, 0);
>> +
>> +                ret = bdrv_pread(bs->file, off, s->cluster_size, 
>> buf, 0);
>> +                if (ret < 0) {
>> +                    res->check_errors++;
>> +                    goto out;
>> +                }
>> +
>> +                sector = (i * s->cluster_size) >> BDRV_SECTOR_BITS;
>> +                off = allocate_clusters(bs, sector, s->tracks, &n);
>> +                if (off < 0) {
>> +                    res->check_errors++;
>> +                    ret = off;
>> +                    goto out;
>> +                }
>> +                off <<= BDRV_SECTOR_BITS;
>> +                if (off > high_off) {
>> +                    high_off = off;
>> +                }
>> +
>> +                ret = bdrv_co_pwritev(bs->file, off, 
>> s->cluster_size, &qiov, 0);
>> +                if (ret < 0) {
>> +                    res->check_errors++;
>> +                    goto out;
>> +                }
>> +
>> +                new_allocations = true;
>> +                res->corruptions_fixed++;
>> +            }
>> +
>> +        } else {
>> +            bitmap_set(bitmap, cluster_index, 1);
>> +        }
>> +    }
>> +
>> +    if (new_allocations) {
>> +        /*
>> +         * When new clusters are allocated, file size increases
>> +         * by 128 Mb blocks. We need to truncate the file to the
>> +         * right size.
>> +         */
>> +        ret = parallels_handle_leak(bs, res, high_off, true);
>> +        if (ret < 0) {
>> +            res->check_errors++;
>> +            goto out;
>> +        }
>> +    }
> OK. I have re-read the code with test case handy and now
> understand the situation completely.
>
> The problem is that img_check() routine calls bdrv_check()
> actually TWICE without image reopening and thus we
> comes to some trouble on the second check as we have
> had preallocated some space inside the image. This
> is root of the problem.
>
> Though this kind of the fix seems like overkill, I still do not
> like the resulted code. It at least do not scale with the checks
> which we will add further.
>
> I think that we could do that in two ways:
> * temporary set prealloc_mode to none at start of parallels_co_check
>   and return it back at the end
> * parallels_leak_check should just set data_end and do nothing
>    more + we should have truncate at the end of the
>    parallels_co_check() if we have had performed ANY fix

better way found. We should check not file length in handle_leak!
We should compare highest_off with the data_end and that is
146% correct.

File length COULD be more than highest possible data cluster
offset, but data_end should point to the correct location.
That is it!

Den

