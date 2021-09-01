Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54143FD93C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:07:45 +0200 (CEST)
Received: from localhost ([::1]:40882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLP1s-0006nj-Vv
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLOyq-0003g1-Hd; Wed, 01 Sep 2021 08:04:38 -0400
Received: from mail-am6eur05on2120.outbound.protection.outlook.com
 ([40.107.22.120]:29856 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLOym-0001aR-4s; Wed, 01 Sep 2021 08:04:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHvW9pwXptt3XOY6KK7hYUmu2n4EBlzbpV18z8WiJRcml+T+K4TsWmTiwon6fKJM7SwOGYjwC+p0yG9kCLXuPBj4361xkd39MmxFS9119HXSQyc4h17NdUNRfiPceRZfR05lsOt8cFIUwdUnFi+PTq5/E0tivK1ZgfP8GxDL3MLElstCVgrWw35H/GSCNBM/91IQ0R7a7FirugG6soz2o2ASmOndJmhK5ue7cs/qoh50Z02PFo5Xr9A+fEyu7pEt2w5JBi2rTbxYvewz9GRKTnZOQtDJS7E02Oidv8fSAvuxytIqGTK91jR5Yc9E6ZnecUxVowXtMkcCSR3CVWsUfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ9JUuxx8EF2s5aPnBIUQmdaKEy5O5eidscTeeObDKM=;
 b=HeV8jwc75dpEbpSxGzFzBYLvAym0nehNuS4jdmkF4aRB2X0U+YL4cDaI++Y3Hm6sBeI1kmocC9wwFtWOYjZTqO6So7E1t6J1ZJyl9PoLMcdWmGo/91DTuTx726D+kfh0EZOPMf70TKcTuomrGg1wgH+LxKTzctl1jzoMe5ABphVESDb7mO9zbQs+dKHZBXJ0mLW9SlARuH2SNwS+E4BU2myKzz8Pq/N6SrqC9zPcQp7Fs2r2fM3JwNFFwTjAMB/jZwKcrX4bxYTUnEGdRpwbdI1MUMLQJXx3BVyN4oEZQdfr3/Y4OvMsBPqmF4OwJJybXpdH436IJi+VyS38NmT+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ9JUuxx8EF2s5aPnBIUQmdaKEy5O5eidscTeeObDKM=;
 b=i/W2zVIkpP9Pqg+VIxG2krKo3S4TZ4K2Ub/HF/PQUWd8yGLOTT9tsJ3rrWUR0caqeVBCmZ4BOnYWFq8TlIuAit/VOUHzQwo2D1ZNesIhxgM0KvGJ563zoY2kM9VCU41BiywHQ7YExIShPtUZRUx0O0Vf0/sfNsYWfU/HWhLfOMk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR0801MB1869.eurprd08.prod.outlook.com (2603:10a6:800:88::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Wed, 1 Sep
 2021 12:04:27 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 12:04:27 +0000
Subject: Re: [PATCH v8 09/34] block/backup: move cluster size calculation to
 block-copy
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com, kwolf@redhat.com,
 Max Reitz <mreitz@redhat.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
 <20210824083856.17408-10-vsementsov@virtuozzo.com>
 <8c8a44c3-0aa1-ca40-8b34-6a863cc7c2fa@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <eeefd99c-5dbd-2816-8955-77dd8be4b3e7@virtuozzo.com>
Date: Wed, 1 Sep 2021 15:04:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <8c8a44c3-0aa1-ca40-8b34-6a863cc7c2fa@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P193CA0057.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::32) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR3P193CA0057.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.20 via Frontend Transport; Wed, 1 Sep 2021 12:04:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69fca893-c74d-454a-3886-08d96d40a5c3
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1869:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1869D694E1786FC1EA507562C1CD9@VI1PR0801MB1869.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pi40sWoAtcFegd1L6oTGQJ1Mu7uAuk+bsqLZRKMON0y9ApANiFnnNnjxIKA321174L2mxXwzZzBHC/pUp85Qx9BMQLSzrLAQ68rx+ksbac5UeUzAwM+2M41RFSrqTpvDelSnvQ9+GM3TJ3JiB8DpSHM+YYYbvOP5T8y7OOU6yVVr1xsNWfPTQjQDs3+sDVgw7wZriZKex5eFId8ik8zAdUoi10eYUU19Yuh3rRByd7PQidj/lUaiDQsm7Yw/+4FZ4smAKq29XyHPHrNnQPqFP3gs75kPa02U3YC4Wf4grKNdxEqII+R2BaIIcKP3J0GuKiJgMY8NgLD2qnb38UQ8EqK0ydz+gyYnA+DCzYSdFMyBN6wCOsYMcMSmbw3zgWnyQqfCE0jo3d8GL0F3PtqvCBmsMkU9K2EE3F6NHXHgEEnr8EnOxqs2eZFYYIk2oaLX+giL4Q1IcJZIHrRoMK/+L14JfcqIhND7dfEs94sviCTf7NeRXdZJSF3p4+xf3nyotk4LCRkZsxThz4aY29ovVj60GecZMCJ0Pivrm4r1y4pBGMQs3npT3fQHYKtL+itFj4Tqamcezxzv51CMQxdOdVrQj3+KJ08taW0Sek/5BOdSjGK2eqDMxX5hl6JJkPO/Egx5SgDnW1H6ILl2DHfcepUFuSnG5+zXjE7qzkZ+ZK57eGhJSBbeYAp44g69B+IYwIFZrkbjHsRdZyWx9NNFvq0GIFGdYCiTQETYpUj+WdOQtEkrJ8n44pa3IiHbnLZy6ffmSfUnNd2ayyYFYTOdfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(346002)(39840400004)(376002)(4326008)(956004)(8936002)(52116002)(53546011)(36756003)(8676002)(316002)(2616005)(478600001)(16576012)(38100700002)(38350700002)(2906002)(86362001)(7416002)(5660300002)(66556008)(66476007)(66946007)(31696002)(6486002)(31686004)(83380400001)(6666004)(26005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDRNTjBxcm9NdWRmb0hRWm90MU9QRGNBdkJneW81MlZQMGtmb3dCa0hvMndP?=
 =?utf-8?B?QVVpT2E1QUlRZCtSVHlKWmQyVERYRVpiVHptMkg4REVpQVAzTzMrRTJDWEhO?=
 =?utf-8?B?Q3JuTGlrclhtWWNIV0cxcHAvZFA2L1h4U05uZHhPTTMyY0dIVDJmYjFYNjdT?=
 =?utf-8?B?ZkRDSkFpQUN1Si9uN0pOSG5nS3laYVVhYzBuanZFTW9nZ2d5aWhMbE94dWZR?=
 =?utf-8?B?cGQxQnJvQ0lkTDlXMVRUaEpzSWJhWE1aTEwvVHdZSndxZXlwbVFOMWdMUjRr?=
 =?utf-8?B?TkNCUm5GSVdqTnpldHp3M1N3K0tYUTMvblpQTVo3S0hwZ2xBejRZcHJpRkVs?=
 =?utf-8?B?Unp3R1VIRmlHK3JZSVJPTlZlc0IzcTZvaExhamF5NFJvU1YvUGE1UkJOcEdZ?=
 =?utf-8?B?cVRzRUxEa0Y4L1lLcWh4ZStscTcwM1dDVUJTQ0JCQWFLL00zUmRtTlhZTnVi?=
 =?utf-8?B?MHZ1WTdibFdBSEdmWWVXNzN0RzBqRGY2UnFRd2N2cnoxcWhVeXphemZhbDI1?=
 =?utf-8?B?MFFaRlgwQllFVExpTm9wdERPSklNSWFLRXl1cFVHMlZZRURvMUpZb0JBQ1RC?=
 =?utf-8?B?WEs4SjVVbzlheHFIZnE2VVIxNEdTckRKZUVwVkxkcE15eFUvSVpOaDVBOE8v?=
 =?utf-8?B?MnkvQXVBTXgxRmV2RDZWV3R6aXFvY2lzR1g5NVZqUmZzZWUreVE2b01LbDdE?=
 =?utf-8?B?VXAyVDVFVEZ0bnVUYlA1azU4SzNZUzBYT1dhMkJqcm1UOEYvdkdSdXMyUHpq?=
 =?utf-8?B?eVVhbDliSXZscnJ4N2V6NGdKVEl3WlprMjhaZzh2L0xma0hNZG1KdkdLUDUx?=
 =?utf-8?B?WDZvUWFzdUlKMkl3N2dKbUhiNTRmajNnYnozejVqQ0Fqa21yZzR3YnZxRnBw?=
 =?utf-8?B?czNjWGxORi83Wmcra0h4NlIxRFZZQ0JyZkdpRkhJNUdVNlFxVFBEYzhQKzdG?=
 =?utf-8?B?b01yRVVuYVoyWTRwVmc3VXlVT2c0TWdqWlhnd3AyNmRqU013aUM3RlU2Rm5R?=
 =?utf-8?B?TzhVaGlsVE1KWHFXYzBoUURqcHJWSG9aaXFrKzBpT0hlRnJ0dDZ3bDUzeUFM?=
 =?utf-8?B?M2NXckpzbENmMTlNWjFLdjI5UUZNbm42eVAzVEZYMnlTSWt1aE5TTlZ5cllo?=
 =?utf-8?B?YXltdWh6SnMrT2xiOFVBaVpSR0FCaHUvS2ZFdWlkTVdNRGp4REF0ZXhjWkVu?=
 =?utf-8?B?SUZRcmVwUldWWXdIWFBWSFVIZlB0TWw0R3VhL0VaZXNMbTBid2c0TFpMWm9v?=
 =?utf-8?B?M1JDS1pIUzdYempyT3k0MFhwNjVUSktCWXdvMHgvYy9lOWlYRjNFSlk1dnF6?=
 =?utf-8?B?M0NId0tuZ0FqeHFDeGNsWjRBQWxVU3pJeHFtR3o4NGVUZlRsN3lMSHJXK0JV?=
 =?utf-8?B?Ry84bnRDSFpxNXoySEhzVmUrK0tabmpLYkpPblEydjdqbkpFS21UUXpQdHdN?=
 =?utf-8?B?WmRNWFdaZUFpaXUxYVZCWFdTVzN1N2d4elByeFhmUTAvUWpkMVdIbnpoSFhz?=
 =?utf-8?B?d3pkakkzWmtsOHl6ejAwcTVhalYyYnRNMGdDcHQ0RHBOZGNaeElhL1c1ck83?=
 =?utf-8?B?U25DQkpBa01wSFRjaUV1N2ltV2R2UWpHbjNZbWZBdVJBMzRrOUtNaGo5eTk1?=
 =?utf-8?B?WG1ZOTlvT3ZMWGFDMUFlTGphRVg0MWhTcnlmRmN0RmdHZk5naiswM2JtZkJq?=
 =?utf-8?B?Q0pJd2dUVFM2V08vN0M3YUxOd2xKL1hxSUErYUlqY2pad093MXRibmVad3Fs?=
 =?utf-8?Q?tiwS1/eWFVa1+k52wMWFM58CZlj4nsfMBZpURFP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fca893-c74d-454a-3886-08d96d40a5c3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 12:04:27.7169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BNDMws2MXmzgltzL38sTzn8JfUri7lg8D+CqZ4PrAKFUDHnJxFDUlabZUhZQYwoE/bOjBc/wXI049xZwYLrm0LUQ0/LIh8035AFlPMHSQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1869
Received-SPF: pass client-ip=40.107.22.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_NONE=-0.0001,
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

01.09.2021 14:57, Hanna Reitz wrote:
> On 24.08.21 10:38, Vladimir Sementsov-Ogievskiy wrote:
>> The main consumer of cluster-size is block-copy. Let's calculate it
>> here instead of passing through backup-top.
>>
>> We are going to publish copy-before-write filter soon, so it will be
>> created through options. But we don't want for now to make explicit
>> option for cluster-size, let's continue to calculate it automatically.
>> So, now is the time to get rid of cluster_size argument for
>> bdrv_cbw_append().
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   block/copy-before-write.h  |  1 -
>>   include/block/block-copy.h |  5 +--
>>   block/backup.c             | 62 ++++++--------------------------------
>>   block/block-copy.c         | 51 ++++++++++++++++++++++++++++++-
>>   block/copy-before-write.c  | 10 +++---
>>   5 files changed, 66 insertions(+), 63 deletions(-)
> 
> [...]
> 
>> diff --git a/block/block-copy.c b/block/block-copy.c
>> index e83870ff81..b0e0a38330 100644
>> --- a/block/block-copy.c
>> +++ b/block/block-copy.c
> 
> [...]
> 
>> @@ -342,14 +343,57 @@ void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
>>       }
>>   }
>> +static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
>> +                                                 Error **errp)
>> +{
>> +    int ret;
>> +    BlockDriverInfo bdi;
>> +    bool target_does_cow = bdrv_backing_chain_next(target);
>> +
>> +    /*
>> +     * If there is no backing file on the target, we cannot rely on COW if our
>> +     * backup cluster size is smaller than the target cluster size. Even for
>> +     * targets with a backing file, try to avoid COW if possible.
>> +     */
>> +    ret = bdrv_get_info(target, &bdi);
>> +    if (ret == -ENOTSUP && !target_does_cow) {
>> +        /* Cluster size is not defined */
>> +        warn_report("The target block device doesn't provide "
>> +                    "information about the block size and it doesn't have a "
>> +                    "backing file. The default block size of %u bytes is "
>> +                    "used. If the actual block size of the target exceeds "
>> +                    "this default, the backup may be unusable",
>> +                    BLOCK_COPY_CLUSTER_SIZE_DEFAULT);
> 
> I get some build errors in the gitlab CI because of this – I think we need to add a qemu/error-report.h include in block/block-copy.c now.  (I don’t know why this works for some configurations, apparently, but not for others...)
> 
> Is it OK if I add it to this patch?

If it helps, than OK of course, thanks!

> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index b0e0a38330..5d0076ac93 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -21,6 +21,7 @@
>   #include "qemu/units.h"
>   #include "qemu/coroutine.h"
>   #include "block/aio_task.h"
> +#include "qemu/error-report.h"
> 
>   #define BLOCK_COPY_MAX_COPY_RANGE (16 * MiB)
>   #define BLOCK_COPY_MAX_BUFFER (1 * MiB)
> 
> Hanna
> 


-- 
Best regards,
Vladimir

