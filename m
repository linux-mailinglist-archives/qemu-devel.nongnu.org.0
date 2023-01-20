Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4807675275
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 11:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIofU-0006w6-Iw; Fri, 20 Jan 2023 05:30:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pIofR-0006vN-Bo; Fri, 20 Jan 2023 05:30:41 -0500
Received: from mail-ve1eur01on2134.outbound.protection.outlook.com
 ([40.107.14.134] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pIofO-00028r-Rx; Fri, 20 Jan 2023 05:30:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUBGQARmHZb2aK193HEtJboXGVPL/7WWsc55xBrDE0mMnziu/U72rL0yikWiXu9qQqVhLMfuPMUGOXnt+CvtTZtnhSJYuEzqBbPYTBc1zcHERKeTfuEFnBh6fgbr+E6VSo9Qf3t8N6u5b4nT6w/5IZz0RvZ2bP/EUMYIKqw23nMVTuqm7E/ZDNyPPzy80ebb1X7E1D5ZpoLPbHR9VuUBvHZ/JAYKZly8wmMU5juXaxL3mTNSde6HdiOpnCR1tevbKtnt822mDqwg9YFWf+KKpZxBm+Svo3Cd/xwUKqNxytEdwHpI3regaiC1iB9jMIx/aM3vYN5N73BC8rKGy6OeaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkF3yLuqfYm/CT0hRm5t7XTEZQXzbfHSSIGxhnMT/x8=;
 b=HWnmZ1c2Eoic9rByiCTLwO+GkaQBWqzYI4kApf2sfoy2LXmZb5T3G+r4ETeC8A1J6xzaCafo4SjkWtV5dAfQDygszeAJZCTY6pEwGTyq/Cc3bKEWHnxrrq7q0bX23WmYmoyQ0lFuasF8w1484qqEc2WuW57syddMr+QQuH35O0NDBBvPwVpVQtmZJFPhz9BF807mM9sRqrS4eHT2amRICdcDhZ5ijs5QdWsuuZ853Dpu8kzV0W+FH60way2Tr5vCWIksDYKlksoHo7r33PSnEkYwMhhEVDCsDh9tQWYnT2J4dTzFFjh3AVQbl6yxDFvJ+kHQWLdAGSWM+mV/54RhGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkF3yLuqfYm/CT0hRm5t7XTEZQXzbfHSSIGxhnMT/x8=;
 b=ktfXCXWV/YXRJhgW79QAbutTwtWMKFzx2xwTJU9tLKEr5CELc9tw/yQIJEkEGhaWKd+uB8KaqN5Tz12g1BIIZdBRdEyU25gTAm/fGh5m2YX00LO9SRZRJ3v/kwrhhGTb4+sSiIjRn9QtjSRuErlAkHR9tvoPFdOW7oMnm+t8ZnOyjvgQUXkfXpd5HLsPbDpXFEnGjPC7YWneVnF7bSYREA98KWq9xzN52uu+B1VssJI8gTvv4qWpuesEuxs1apYJ3JmNleVAkizJBQbe7M696ZRxM7FgX4aPsV4JgHWsTWtC7sHPyOdlneA/Lz/7zgNQnbRccotLLobjSrPBgqg0Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB7794.eurprd08.prod.outlook.com (2603:10a6:10:399::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 10:30:30 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%6]) with mapi id 15.20.6002.025; Fri, 20 Jan 2023
 10:30:30 +0000
Message-ID: <69c505db-0892-b128-1a27-ab9c14a8aef2@virtuozzo.com>
Date: Fri, 20 Jan 2023 11:30:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v8 07/11] parallels: Move check of cluster outside image
 to a separate function
To: Hanna Czenczek <hreitz@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com
References: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
 <20230115155821.1534598-8-alexander.ivanov@virtuozzo.com>
 <0f329372-e2e1-50c2-46a3-64ab6db4f5f4@redhat.com>
Content-Language: en-US
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <0f329372-e2e1-50c2-46a3-64ab6db4f5f4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR02CA0062.eurprd02.prod.outlook.com
 (2603:10a6:802:14::33) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ba6fc0-faf8-4c90-b455-08dafad15a8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JT0uJmc4+LFzEfvJ0Gss/fwGS7sL7mNB30s9oBjrOc+HuBqFvFxYFf6OgQOXLIcRpZ2JLlnZ4I/ryCsysVX8y7n0KQ/x15NXnUJRQANGtm79lYhxQMjKsc7mbRbPalne+J7839dJnm/YfH8qbfzXdmYNiXn7/bty80Tdi1IPQGgmtcsodOwnsuR5fi//eDZSZFJWmqa7Dm+F3+UmPYolpVxvWZHF0kkcyGZfYXmGh9dDPdQGlNf7v4ZCUJNMTdrvV/1RKYaI4vmBFYggrvVfe4iNHtfsLYAmYk7OGVQIFJ2Y6pLr8j7Tv7I3lHGBy06OZ4TGvPjShMRGyU5EUnyrouKhoOrt4nlAnxUV/ZHIYTtXbKG3mJXqUyDTKeLO7nRWVGIgP3CWCuX7nLc0i4CTrmp4mVVYqdLzr6QMI18PqwlbHEX05NA4Bf/xkDyrSnpy7jXTzv1fbYcYo0iVkg7ljvpR+BMTJE4fsKz3zNc9nOhRDQxymukU/NWFnPCyJKL8jnUwSRwsvs8Okigf/3cOjR+oZgsqpZPoGK2lK9TudvF5Ks4fPD1414KrIrPVBVEHzM/sIPTmhzXFqTObckxmLUN6tZqJ3MbwRU2QVJTKyywS3YiIdsxbnTHjJYvJaOoBzT1e+lZ5wdRUZLuDWZm2YBVctvN793FzNDjOul+MDYSmNjf9bP7WibH4O8pV8qND/i6olfpehXC8m6tfbPhfHTdyU8F9zrD/O3ESJhAEkUJPoZfiLnsagyJI4gChrLiJdLNtPfJr4ZeRX3xz+8gjLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(136003)(39850400004)(396003)(376002)(451199015)(31686004)(6666004)(6512007)(186003)(26005)(38100700002)(478600001)(38350700002)(6486002)(53546011)(86362001)(6506007)(52116002)(31696002)(41300700001)(2906002)(8936002)(2616005)(8676002)(316002)(5660300002)(66556008)(66946007)(4326008)(83380400001)(66476007)(36756003)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVZiZHNkK2ZNaE8xTVA0RC8ySG91Tk5BQ0xRU0lBNFNReHdWZCt6Vlc0RGRP?=
 =?utf-8?B?L1VHWlJwWjE0ZXpXUHBiUTdrNzhJMnYzWWJvS0pNbWVZQ05BUFhxTVdWU2NS?=
 =?utf-8?B?TnE4VUVSTjBnTlozeVZNNExvRWRjM0E0aUVWY3kycU8raldYSEtqelVUM1Js?=
 =?utf-8?B?TDhhbGVTRnp0MHRtWGRMaXZaWGxlWk9EdTh0bWlpUHlqUklzTm9CV1RJbXJZ?=
 =?utf-8?B?MkVWdGhmZlBDQ3ZuMG95dDM2MXRoczdkNkFqVUJDZmMraERkMWt1R2lwVnZl?=
 =?utf-8?B?WDFXdU1vRERSZk04N2ZwUGF1dCtCbzZ5MTBCWVRJQXFsMDU3SVdkdCtGNkt0?=
 =?utf-8?B?R2F1K0pQcUR1OHVRNklKamQ0MHp5RTcxNHBrcmV1cG1EMjlFeEZxRTJ2L3JQ?=
 =?utf-8?B?eUZoRHVoVit5UzYvN2w3eElpMVNYSHBOZ0pnYUxCNXErTmNGUFppdlBOZ2Nu?=
 =?utf-8?B?ZUlZaTlXaU5qMjRKS1FwZUx3QUY2QldUQUd5VlB5VjJLd3MxdGl4S1o2em5t?=
 =?utf-8?B?RVg3QmpQcWYrenZ0Qkt1bjJ5d25WcUZKRlhzdUFmcVJzcjNPendmdHVIQURp?=
 =?utf-8?B?UWZvOVp0UmV5dFJDVjEvSXdNUFBjS2dHcUMya1FHd09BZXhCRUk2VXhIRTJ1?=
 =?utf-8?B?SVZ6bnFVWEtYQzVETWNIQXVYdGMxWGlLNW1rM3c5UnFYUnhVaVV1MTgyajJl?=
 =?utf-8?B?eEU3aXh1ZmdvYTRwc0VJRHIxSHd1a25iQ29ZT1QwZklmYThJaTBwOUJYNW1u?=
 =?utf-8?B?WE1HZGVBaHBTYUZaT0tqK2dkemlmQnhBZ2dJZS9IUHlWYXlwa0NPbU80Vmlx?=
 =?utf-8?B?cHdoSlh0RzZBUmtSTmpEaUdNZGhBSVlxQ2RwMkE0SnNBcFQ1dGYwcFhXUk9p?=
 =?utf-8?B?VG9uSUZ2R0ZyeTloMEZ6KzM2d2htZ2d6eDYvbjd4N3FTb3RBcjA1WjVBWU9p?=
 =?utf-8?B?TG9RYUxXM0FObHM3cVY0dGtEcm5DVFA0bFJJNE16SjZpQjcvWGpZYnNxVFJm?=
 =?utf-8?B?WXNyajg0cFNsUVozTjJWK1dOSk1GOHlqeExJWjZaMDdWTE1nVVFkUUlyRU15?=
 =?utf-8?B?MTEzWmR0MjhCYVdWWUIxd3dsRDVTL0NxeDh1N294QzY1ejViK3dmek1GUVNr?=
 =?utf-8?B?MzJ0ZUNNbHp5czFtMXhUSWZTaU9sMy9oNWtLUXJpVTZGeUNYUDBOWmJYeVE2?=
 =?utf-8?B?N29IRUZ2QTNSRHU2Q0lDeWtLVTVjRlZORmltb0xDQ25NVWZhSnMvNVVPWDJz?=
 =?utf-8?B?enlmSC9WQjQxcEdDUTdkUVZISzVFZTNkRTZ0SXhwaHFqck5EQ2J4dlY2M0RU?=
 =?utf-8?B?N29UUjIva3kyVkxWejFOQkoycmRXblc0a2ZKdE5TSXg5dHNkYUw4dXIzOG4z?=
 =?utf-8?B?cXdIZE9pZlVUQWdPTithTTMvamFGaXhDaTF2RFljUFZVTzM0VlpwWmx4OUpT?=
 =?utf-8?B?bE00blA4a1BiMURlZWpuVHJVVTczSTJDWTRvWW02Ry9vVVl2SEs5MWZTeU5Y?=
 =?utf-8?B?TXUxNHh6ZGJGcURKU0VaeVl0QjdlWVE4Q0JLaWFTVVFBUjIxcGNyUTU1ZlVF?=
 =?utf-8?B?YW5VOFJENTN2cDl4RHlaYUNYVC9vd2k5NUErK1pSRVFzcndic0UrMkUzSFc4?=
 =?utf-8?B?QVpOMDc5eVhHSnprZXJYcjI2VFE5QmlJUlNta1FaMjhDWjZYcU81NDZsZVRn?=
 =?utf-8?B?ZDRqSG9uWjA5L3hCR0xleXB1REVMNlZYRW9aNTFQTVYxRDB2S0hqYjRoenY0?=
 =?utf-8?B?TWt3VDVxdjhEbGdQZzAzYXJaeFU5OXhaNGNqZHJ0bFU2VWZJVVlPdWZTN2hU?=
 =?utf-8?B?MEtmNGxIQjVyVzJtQ0ZNT1BOL2l0eUI4bjRYR0tocktqMmlVb2ZseGlzV3hV?=
 =?utf-8?B?VlZQeVdCemt5cnFTNTZzVjFNYU9TeEpBc2F1a3ArN0dpV2VETnhWbTJzRUcw?=
 =?utf-8?B?Zi9pYnl4WDUzMU9OME5PK1VMRk9jUUozcmJCWjFCSE5Mc2ErMjNzYWdnVE5t?=
 =?utf-8?B?dmZ2a2VBcVBXV2gzWndUZlZwNkdsRHNybFk2VE5IcVF3UTlkaGd3Vk1OZm1h?=
 =?utf-8?B?TVp1UnhYWEVLUVBPbnoyYzFKMUJDZm91Y1UwcU1vMGQ5MjVuWW5iTThCYmVH?=
 =?utf-8?B?cmowOGQ0UTNyZ1NNSWJFMW1GdWtIckFOb3J4SFVQL0gxbUEyR2lUREVYMHI1?=
 =?utf-8?Q?fLMKkAQqwO1XP+/730Ap4NA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ba6fc0-faf8-4c90-b455-08dafad15a8c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 10:30:30.2481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npowWh/kZCcsQgGcUXLff6M7imLWobfyexQcp1isXgcHilXgkATAe+81feJFuT00lJ0rfERLks4j7dLeQuuN7aujCPGT6GB4t9TIMmbX4tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7794
Received-SPF: pass client-ip=40.107.14.134;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 18.01.2023 15:45, Hanna Czenczek wrote:
> On 15.01.23 16:58, Alexander Ivanov wrote:
>> We will add more and more checks so we need a better code structure
>> in parallels_co_check. Let each check performs in a separate loop
>> in a separate helper.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> Reviewed-by: Denis V. Lunev <den@openvz.org>
>> ---
>>   block/parallels.c | 59 ++++++++++++++++++++++++++++++++++-------------
>>   1 file changed, 43 insertions(+), 16 deletions(-)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index d48b447cca..3d06623355 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>
> [...]
>
>> @@ -469,19 +511,6 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>               continue;
>>           }
>>   -        /* cluster outside the image */
>> -        if (off > size) {
>> -            fprintf(stderr, "%s cluster %u is outside image\n",
>> -                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
>> -            res->corruptions++;
>> -            if (fix & BDRV_FIX_ERRORS) {
>> -                parallels_set_bat_entry(s, i, 0);
>> -                res->corruptions_fixed++;
>> -            }
>> -            prev_off = 0;
>> -            continue;
>> -        }
>> -
>>           res->bfi.allocated_clusters++;
>>           if (off > high_off) {
>>               high_off = off;
>
> parallels_co_check() keeps the `high_off` variable, and now it is also 
> bumped for clusters that are outside the image.  This seems to go 
> against patch 2’s intentions.
>
> Consider an image whose file length is larger than all of its clusters 
> need (i.e. there’s leaked space), except for one cluster, which is 
> beyond the EOF.  This one cluster is considered an error (because it’s 
> outside the image).  Before this patch, we would have truncated the 
> image’s file length to match all the other non-error clusters (and 
> drop the leaked space).  With this patch, the error cluster, if it 
> wasn’t fixed by parallels_check_outside_image(), the image’s file 
> length is no longer truncated.  Basically, this seems to restore the 
> behavior from before patch 2.
>
> Was this intentional?
>
> Hanna
>
Good point!
I have missed the case with !BDRV_FIX_ERRORS.
Thank you!

