Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD9959D4C6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:08:04 +0200 (CEST)
Received: from localhost ([::1]:44248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQPtB-00017z-Nj
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQPm7-00059c-Qb; Tue, 23 Aug 2022 05:00:45 -0400
Received: from mail-am6eur05on2133.outbound.protection.outlook.com
 ([40.107.22.133]:62760 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQPly-0001Wp-C1; Tue, 23 Aug 2022 05:00:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyEtj35n5IsE13kYwR9XdgDqXR65MCU/exuFe8DN7LLOS3nyb253k22JA0U0VtYzpjP+Ow9nnx5EedvY6jqmxRdzTZmO85TjXUniHUMHFcL5CLJ3Bqg4wUtVK7dq0HtUoVnTQN8LdpKSCzfS2ONEf1oeaQ3gvw47o9w/08R+pFTIpGjvHubUuCXfVhvjBDaiCIqdl28gf4QkEBOmif4XTDAIYkCEQVy+9mi4UMPvIIZ7gU/Vtwq7Y6KNW5AdMet+Ni5ySRMYuAWkTUaO2I0BSiyxzSug/iPwt3XQW/ZJ+3C+T2bIwDz1QATUUH1fxOdyenabOenxQe9BGIUncrO8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aoK2AD9p+rGH353oMQMtShF+IqsxpqVaUu6USoPfgI=;
 b=jXS3aekG4orWLM0juS34a3CEWkhGaMJGqH0GAnuFd7mnQfQL/UjxlBooRe7b9PRS/8oKC4/r0wMuzx4NdBfZKqxCBAQMFgAMiPds2J8WezsaTXTbR+rYmMAZ/I7X1XeVUBaUrP5fCKF2BumiASM52C3KGoeBagIsEWu2TEbFlWM93W4HtaJKDl85x6kzocJT9Z1fKbvCUrAMOTZiGEFrd7Iy2ulMLOEW3kXFqW2l2njy/CV/2RIt91VazP4Fe3C3mgEHzsL+8jr4TQQHJejwo8Ti0FIno1y3KmI2OhS+uGKdmhU99bxBnmcmfn5h11ypOAWqIaOk+dFxBQd3jBSbvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aoK2AD9p+rGH353oMQMtShF+IqsxpqVaUu6USoPfgI=;
 b=r73mkF4zuDo6ITllgViQ4I9FVyMNaia7ErQcNoc0+emkmcHOvwieah9Zjdk+jTIfrLTAqNEm6m/56tKFZ3SgpMHpvIQ5Jv2L/vgdAE0eG/sbgyBWOp1loH4Kod0CRYF3AK/CHS/FFt87J1ZrIFp2UiKQlsCDjsYL1V55F9oq5Jvo5v2o0HCmwNawPUaP0z08XVzemZeSJXEClcHWrO/Xj4PIoLsiI+hV0xBuiUOS86RW+Qa+B4Gl3DlbcfAdBPnIOVVWw4ARyOxUWZiILQAbWm3JTRYZG+xTIqdm5U40UmzXrDEDsAHb9t0sva/N+8fFG0+dsM64nBpjbhUKNFQHlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB8208.eurprd08.prod.outlook.com (2603:10a6:10:3b1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 09:00:30 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 09:00:30 +0000
Message-ID: <ee893728-1d9e-aa8d-5267-d31d91a69650@virtuozzo.com>
Date: Tue, 23 Aug 2022 11:00:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 2/9] parallels: Fix data_end field value in
 parallels_co_check()
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-3-alexander.ivanov@virtuozzo.com>
 <63c13487-4987-7842-5c42-b0ae22955798@yandex-team.ru>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <63c13487-4987-7842-5c42-b0ae22955798@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0041.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::16) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a055860f-b36e-4cec-d688-08da84e5ee26
X-MS-TrafficTypeDiagnostic: DU0PR08MB8208:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S3BUmgOx7s6RyjjJ9sM4bvhKXodPUdHp7QFtOAwfnmGmHjwbaiJUx65QKcGOotqVDt2I9J5wmgPCYRQwooReSEcnD6i/tOSNM3WWwo2hXYRjXw9pFwu+SEJq+RLPCksuK+MFnf4DXzIZWjxARs/Wfb77ehe/BTTQ5stO5gaCFZ5bE0FTBu0Jl2cA5tEMkYrD9NtBY+TVX4QBC+TLRCgXy+i5RpBCQEdh5XHCx31XOZMj6O6uvjGs5jBpa2aGL297Ww7gZ2ye3UCQMWFuLK0uKZyWbLp0NViCPGOXsNT2t851O+FykeAQw+xRyysWSfIbp8/93xeBLaCJaBtEsEtfTWbJCSbgp+gLadbY0zR+BuI8MX/9OJeCs/CaPmUmfFBidqI9I0q+8Cob3qxOwcc/JxanvesyUIG1qH8r7tHU5UKRnbLiqOOLZT4j0iz6jUZF3itGmv3P2QNWt2Xm91WzMmHRpd80LMGqrB8ImbeqtlANNYWqZTP0QEc9zWj4VS38vJPaXq22L3zlzYamlAh4oZd7Vy7LsBatQ8zbj0lREw8fMRi06wMKiiHpoayK5wR2cIlY078X5WcPgo59HMLxxQNiaTxpy/tF/z6U3Ptt3MOxr7QwxS9rLyxU9gTGhtFx6GeBqK7H1YXjZlfKrsTbZmJU1hJZogqclx/gIU/MzfEjitJZ0ZAyIOcPvcUSNaQe335NiXyupoEghYpJVIF9yxtTq5w/8emqvoHwzWox7fkOHu6uNNZhISUFKPhSDFeVuWVp2s6f3/XSXnrEw8ZTCy4MgZ0H482JPAJtm0B+AGdLwwFzfVOgfMhw1UQZuauD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(136003)(39850400004)(346002)(376002)(83380400001)(38350700002)(38100700002)(36756003)(8676002)(4326008)(66476007)(66946007)(66556008)(6506007)(26005)(8936002)(5660300002)(44832011)(6512007)(6486002)(31686004)(478600001)(316002)(41300700001)(31696002)(2616005)(186003)(86362001)(2906002)(53546011)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmovWWxJZGFQYktYcVZTellHWDFQK0lVTmt6MXJYTGsyVjdYbXVBZThua3RY?=
 =?utf-8?B?ZEFON2lmMjcxdmpMaVgyakZ0blVseVFkMXJXeVpKNzdZQ3JkcjJFNzdxcURw?=
 =?utf-8?B?ekhyYjM3K012NnR1L05nZ0FXZmV1ZXpyT1FOSWxIdjZNNUtQZVYrVGFRZ3VG?=
 =?utf-8?B?SWR5dmJzUkJsL0o5L0NyM2RacGdxL05Rb3dBbkJGQXJzVS83MUtqN0xidVhY?=
 =?utf-8?B?ZU1Rc3BxTjBraXNpNEpDN3R1N1lPVjVNRDUwTDRoZUY4bGFSSjlnakZxTzFk?=
 =?utf-8?B?ejlsMFl0dmd6aWdxdGFNRSszVGVnYm15eEE3V3lEQVhtT01rdVkxWUZVV3la?=
 =?utf-8?B?UTRUYjU1SjB2MlcwdHMwTW01Q1NwOUxoMjV3bHlabEFlTExxRzE3MW9HdEU3?=
 =?utf-8?B?d0EyZVNPY3M1dEwwZWxBLzFlRlQwd0JRNWNhb1UyQ0FCeVZzTEhXSXl2U1Mv?=
 =?utf-8?B?UG8rRk1YbzlLcHhGUXN5K25jcEZISVlQR1VpNkcxQ0Ztb3RCdm1qeUtZbWxm?=
 =?utf-8?B?SEE2bGxaZmp0dnpPUHJZUmJmQWY4UlYzb2h2SFFOSWtTZTNJTDhvUExQYzl2?=
 =?utf-8?B?TWRqVy9DOURNOUhLaDFMNXZFMEh5VytOcUxXcFFMbmJZOVZMbUtRc0twdWgy?=
 =?utf-8?B?VXFDZm92VmI2UHVEZjh5N0JBWi92ckt6NWlGbGVwcmYxcDNHRkpQa3I4YUYz?=
 =?utf-8?B?cFl3QUlVcU9JNnJDN1FFN0VDcHhDZGRqUy83eTBIWmdHRVkrT3d5dFA2Ykky?=
 =?utf-8?B?K2VrN3RCQVR5MWZoZ285Q25STU1ta0FvdWJHVVVvaTdDZjRJOFRZZ3N0cW43?=
 =?utf-8?B?UWlKRkVaZVZPNW5QOXBLeXM5MGtldEsvc2F0bVozQklVKzRqdlNpK1VxUExu?=
 =?utf-8?B?Z3BXenFVL3J3ZTBEeWYrbmlFeTdHSzQ5VjRpczU3T3pEcHFoZ0NYUTRxcnBY?=
 =?utf-8?B?YW5mSW4wOEgwSFdjMmxoa3ZBUmc1VFo0cnRHSVlQN1hEQVNpa3RFTWlLZHVx?=
 =?utf-8?B?dStaRWo1N0haUlRiWTNFOHZuTXlzdlJSNzFXVVVSQ25FMVNEWXRJL1BmbkdT?=
 =?utf-8?B?ZU93QmpiYUtZU2ZtN0kweGIxMjRzZVVSUEZlaUhkejBkVEF5amQ3UHQxNUdN?=
 =?utf-8?B?djlKWHZIcVRFSm05SUQ4ZEM3d0dHT0ZsWlVOZVd4YzhKL28wcHR6dWswOU85?=
 =?utf-8?B?VTg0b0p3dHVGOGFiQURUTnVObnNITW1PRVZjRmVLVkVYaGNDR0I3YkRSWWU0?=
 =?utf-8?B?dk55ZFN3TGhacTA4WWpkRml3RFdtellsclZIZkpYUXdlV2Z0OU8wc0RvS3NZ?=
 =?utf-8?B?QTdWRUZzQ3hyWUVQbUlkZmo1eklvcU0zeGs1YURQRG52U0p5RFQ0TEhVMHA4?=
 =?utf-8?B?MmlGVm0xcTJsZjZwQ0s0K2ZPaFZFaTcrTjM0ditFZ0x6bUpJOTU5cE5XWnpM?=
 =?utf-8?B?TDE4Q2NaTDRXZWtrSFQ0alYxdkRHZ3dSbXNKUzVrSVhFTXdqenJieDFtZElI?=
 =?utf-8?B?Z0dmVXVxa2cwanZJY3UwQmdvVk05bm1OOWFhWURPZThtaWowQzRyZ3dDalhP?=
 =?utf-8?B?UEdaQWw1MUd0Tm9BZzlnTGNvdzIyc1k0OFF3cVNqNmp5Q0poeVpkS0FQV2pB?=
 =?utf-8?B?ZFBWMFZHQjR2aURQMEpQSHZxb284MkVyTjR6U05iYnZJeXZucFZEQlVROUJq?=
 =?utf-8?B?S0lUaEQ3OHJmYTJ6NGM1UFg2N2VMTURKVEgzcWUvN2l5emZzUER0M1BzWWJV?=
 =?utf-8?B?NHU2VnJPV2NLdE9kYWhsaEs2UDZKU0kzVmNhQzBuUmtoR2kwSlVZZDl6WnJ1?=
 =?utf-8?B?NmFkUVUxMVdQTVJ6ejg2L0QweFhYWDNrQ0ZjWUJmSk9Nb2NIQWR5WjFFMHF6?=
 =?utf-8?B?Q0dJYWIwQ2d5alk4TUZNcDN6M283azIvSTNtMXNMQ1FUQXlKSEJQYVI5UVFt?=
 =?utf-8?B?T0JVbHFiTFA3Z2J3TTNTVngza1ZQRTJmUVF6eXU3NmNBOXNIWGZxOEh5V20z?=
 =?utf-8?B?SnltOWZnQTUxUWx2b3NqaGFVV1MyRnJ0L014eVFxTTB2TjJ5Vkw4VUZoTlA3?=
 =?utf-8?B?Ym9mZkhQY1FicGw2M1hVYTNzd05RaHZhS2h5ZU0xQzVETCtBMU1YazlvMWRy?=
 =?utf-8?B?VzVBdDE3aVpmam5BWmNYaW5mN3lldklxQzQ5QkVTOGRZUmRlYVIwWlFlOG5S?=
 =?utf-8?Q?HJ5Q9PDYb2QrNJmr8EUT5gY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a055860f-b36e-4cec-d688-08da84e5ee26
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:00:30.5027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFpwdSKxqx7a/vwryj0hvnxPW/RQ+cI4xURT/2PiqnrurMHbJ5gDDgZZAbum+gIT1XG5eOpEHa81Gp99qDpcKzLnuffzG+BZSZ2MVVxIo0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8208
Received-SPF: pass client-ip=40.107.22.133;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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


On 23.08.2022 09:38, Vladimir Sementsov-Ogievskiy wrote:
> On 8/22/22 12:05, Alexander Ivanov wrote:
>> Make data_end pointing to the end of the last cluster if a leak was 
>> fixed.
>> Otherwise set the file size to data_end.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> ---
>>   block/parallels.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index c245ca35cd..2be56871bc 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -513,7 +513,15 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>               res->leaks_fixed += count;
>>           }
>>       }
>> -
>> +    /*
>> +     * If res->image_end_offset less than the file size,
>> +     * a leak was fixed and we should set the new offset to 
>> s->data_end.
>> +     * Otherwise set the file size to s->data_end.
>
> I'm not sure about English :) For me "set A to B" means A := B, but 
> you use it visa versa..
I hesitated about this. I saw both variants and used the incorrect one 
probably. =)
>
>> +     */
>> +    if (res->image_end_offset < size && fix & BDRV_FIX_LEAKS) {
>> +        size = res->image_end_offset;
>> +    }
>> +    s->data_end = size >> BDRV_SECTOR_BITS;
>
> Hmm, actually, when size < data_end, you can shrink data_end only if 
> (fix & BDRV_FIX_ERRORS), otherwise BAT is still not fixed.
We shrink an image if there is a leak and (fix & BDRV_FIX_LEAKS). 
Otherwise we set data_end to the file size. In such a way we don't 
change the file size in parallels_close() even if we have out-of-image 
offsets in BAT.
>
>>   out:
>>       qemu_co_mutex_unlock(&s->lock);
>>       return ret;
>
>
> Actually I think we only need to modify s->data_end after successful 
> BAT fixing above. Then, bdrv_truncate is formally unrelated to 
> s->data_end and shouldn't touch it.
>
> So, I think, more correct is something like
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 2be56871bc..b268788974 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -479,20 +479,24 @@ static int coroutine_fn 
> parallels_co_check(BlockDriverState *bs,
>          prev_off = off;
>      }
>
>      ret = 0;
>      if (flush_bat) {
>          ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, 
> s->header, 0);
>          if (ret < 0) {
>              res->check_errors++;
>              goto out;
>          }
> +
> +        /* We have dropped some wrong clusters, update data_end */
> +        assert(s->data_end * BDRV_SECTOR_SIZE >= high_off + 
> s->cluster_size);
> +        s->data_end = (high_off + s->cluster_size) / BDRV_SECTOR_SIZE;
>      }
>
>      res->image_end_offset = high_off + s->cluster_size;
>      if (size > res->image_end_offset) {
>
If an image was opened in RW mode for checking without fixing (I don't 
know if it's possible), data_end can be set outside the image and the 
image will be expanded in parallels_close().

OK, I would propose to fix data_end in two places:

1) after out-of-image check set data_end to the highest offset with (off 
+ cluster_size <= file_size) condition, independent on fix flags;

2) after leak check, only if (size > res->image_end_offset).

In such a way we can have only one inconsistence after any check: 
out-of-image offsets isn't fixed and we have offsets after data_end. But 
it is much better than if we set data_end to petabytes, for example.


