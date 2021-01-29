Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BFB30852F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 06:28:17 +0100 (CET)
Received: from localhost ([::1]:44250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5MKO-0004TK-EQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 00:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5MJE-0003yO-Vr; Fri, 29 Jan 2021 00:27:05 -0500
Received: from mail-db8eur05on2122.outbound.protection.outlook.com
 ([40.107.20.122]:22945 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5MJA-0004Mu-7B; Fri, 29 Jan 2021 00:27:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0DMojxuBn2oZaMFCCNJ11s5YioPI/9hdfg+4bKLKiFYRvWkr4CFPk8YVDTrPY4bs2PlMCVxpXuS/6LKZVFdIiSrhXZcy3OgPem7kZyFA5BjmgH9h5CN2Br+i9fO3JJfeq6WcDmyTnGNer0AsZuECszxEtHqP/1bqHViOL6D84tZeyBB1hmytvcR/Xm4FgG15PgDYWdb5qDluUhfAoqyq4NMDNQoGFquPWEAwfAwpY1Q/dS0+RL/Vauy99tsS9wdmk9MVW+H41rf96u7J+ylL5X0Krs3lvpjeLhbGEo9+1J9pUAU5nIrDFu/KE8mnV6xgSdjXPMAcLVzkPeKQCtRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amWVJVIsy1JIOLlZOvCN9A8bzGY2WOPqn0l4u5ZUBWI=;
 b=GUdgWy0ye3dmBsabDOzaBzEe2kL1jb5YKbvRpSdfcZXHOuDpg94tPoKVrsgjxWJ/aDl36eUfOEbuRZvCfVhBU32VkhyRgVRgD8z8l1QiaiiJSSRbROulC68Cow//MaSXyhTFqL7nYVwRDc/1FC8KKhMz+ndbM2sS8NGB45+8Fpa4AW9GGuPtTwtbjczjRGnaR3WfrbPtY7/poi+KJ7jEAiNPc+Kp1zGwivjveYLRs4WwjnO0Cc8jUhlI7A50YIh+xFCKODzp7UaNfbMLyxDwVU8FE08aiTO61eH3d5PCkG65a1Q5spUwAr389jnKAVwXs3IzqO5q4ooA/lwJA2txDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amWVJVIsy1JIOLlZOvCN9A8bzGY2WOPqn0l4u5ZUBWI=;
 b=wSLPcPxzLrPSR/gFTeuceHK3uCLcruji1dRKIr9YuoBGDalCMToHtmn9bBkSJD3/ZkZvmEwGV5QmSMDjiuf0H/7WlvEn8PFcQMdsj9Zmu8E0BHf2gh5lBdvuHj764+DCb6WBcZM10HT25GhZ/sKDjwHJESsaVI0rxsIpruYRY5s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3159.eurprd08.prod.outlook.com (2603:10a6:209:46::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 05:26:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 05:26:56 +0000
Subject: Re: [PULL 14/53] block: apply COR-filter to block-stream jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
 <20210126142016.806073-15-mreitz@redhat.com>
 <9772b42b-8175-9433-7a56-405403d64dd9@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3aea506b-eba0-3068-be5e-d6fbb43e6cba@virtuozzo.com>
Date: Fri, 29 Jan 2021 08:26:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <9772b42b-8175-9433-7a56-405403d64dd9@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [178.176.77.43]
X-ClientProxiedBy: AM0PR03CA0083.eurprd03.prod.outlook.com
 (2603:10a6:208:69::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.42.193] (178.176.77.43) by
 AM0PR03CA0083.eurprd03.prod.outlook.com (2603:10a6:208:69::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 05:26:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 974fc143-71f3-4e0f-088f-08d8c4167e37
X-MS-TrafficTypeDiagnostic: AM6PR08MB3159:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB31590951F97157E752C8C7C4C1B99@AM6PR08MB3159.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0QhIIx9BCWyMmfRSFlxF7tw/kcPq4mVFUHa0hwD9pPqTrD+DhwefYB1GcyBgEJuZ4EXwdRoTH/f64PO+YvtvX87o22itdopXN198WLzV67NVexzz6JASvtY+41tMRgPb1r3F70FRrDES5DnhZu6ljHxS9v7tHdu13+vSs2z+y9t8gvtuGkGYi/ZKh+7+NMedelEO0zFzTuvQjCF584sCQsrFjZU/GBHqDXSH19mvzqHNonTGXWxzoD8093zTE13/bIldAcL+f+cLGxRr4v2eP4mWrIALwnn8GQq4a/yt19uPa80dJV95h55S2CmE/oWG4CRS6kcx6FsxnOjlkpF49rldDc8zdu0lRuscm0zYwdxibNbTaJGq9EkopvpY7DCJ7E+VhJDrzTZ5qB12lXwlh8ahH+aLu70czvcI+JhLMZ/m+cEdHfyaGWINO1r1Zv7LWYKTglPNu9eoEWj3siaIUGYvdWjIQMYH4khZz/Xmm55aj0mR2Y2wTZ4O3TjkteE/Yzn1lNYGHv2nmbft5wfw1md9x+tHpzNkwt8jE8JjI/asr8IeM8eTKgInkEjcpY/ha1b2PlSCTs3kpAbq3o/RXsL7kAKw+pGc5xM0M0WMQtQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(39840400004)(136003)(66946007)(31686004)(66556008)(26005)(316002)(66476007)(6486002)(478600001)(16576012)(8676002)(86362001)(186003)(6666004)(53546011)(5660300002)(31696002)(2616005)(16526019)(8936002)(956004)(54906003)(52116002)(110136005)(2906002)(4326008)(6636002)(83380400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WnpCNWE0UEIyMEN6VndGV1cxcDR2RjFWMmR4Y3pRa09GRmN1NS9UT3gyS1ZY?=
 =?utf-8?B?QnRpZ1l5NVRuSkRBYkxqUFZQc0dVbVFoZmc5MFhuRWVPcnNLaExheVZPOHE3?=
 =?utf-8?B?dE1XekdRUWJveGVxL0lmWkdRZ3ArL1p1Mkk1MEtOb2xOMG1JWUQ0ai94Tkw1?=
 =?utf-8?B?eHVXU0JhVGg1emxpQVJsbFkxYWdpSEkrdlMzYWIxd2ZFdTB3b3QzcGNpSFl1?=
 =?utf-8?B?UjViOWZmMmpJT2YzT3JZdW8zb0lUbjg1QnkvdVVpVDlxQ0Zwd3ZqdGRLMzhq?=
 =?utf-8?B?SUc3cW5USUI1OGNOWG5kbkVZOVBpeVhYRHA3c004Y2NGZ1A3OGdGQWdoUWZW?=
 =?utf-8?B?WFZXRmd3MVcrUDlDYU8rTWg3Nnl2bjErdi9vbVdTR2x3QVlUTGRRelkzYU5a?=
 =?utf-8?B?aE93RXFjNitOQlRHT2tKUFBTZWw0T3FzR1ZCYy9wSGluaGpSWGZWZVY3Y3Fm?=
 =?utf-8?B?WEZKZ0YxKzlFSm93YmdKZmMzOFZ1V250WHlYV0xBa1ZZOGw2RjQ4L2hvMTRl?=
 =?utf-8?B?RHYwTE1yNTVnZk5VQ1dCeGlwZ1lKNnZvbVBlejJPTUd4OXYzRVdqUFczTGZp?=
 =?utf-8?B?c3kwTW5iRDBWUDhuMEhKQS9aa3dOTWtCK2MyNmp4SWoydTdzQW9oL2JRd3dv?=
 =?utf-8?B?Nkl0QnJXNGNNM1Rhd2dBSWxTeE52Z05JV3A0Y3Nla1VCdzRzd25tK2xtK3JS?=
 =?utf-8?B?OG16aDBuOTZQdGJvYnIxRXVpaE1qTDk2dW9iRFZiQU9DWE1DL3hCeis3Mk1x?=
 =?utf-8?B?dzBRWHJaOVJ4d2RwY3BnMDBEdmU0MENTRjBzbVc4WExpNDZvVFJMbmFJbDE2?=
 =?utf-8?B?RUVxNWVjZGViVVEvRDV0eUFueGp3UlQ5eVd5RVNHMzZmZmkrQjB1K1FNZTMv?=
 =?utf-8?B?a29SL2U0RGlUTzZ6anhsWjlLRVdrak9ISnloL3krMlZaQVlMcUNtU1V6Vit1?=
 =?utf-8?B?dkNVTi9pVkxyZklITEU1ZmUxK3ZoRW5sTFIzS2V1OVY3TDBKRGRxN1FqWUNR?=
 =?utf-8?B?akd1YmFZenA4QzJjNjJlWmo0UWpldlpVbit6OThqZ3g1SWNDUDlud2JJYnVC?=
 =?utf-8?B?YjVzcFlpS0lBRlQxb2FCNDluRXhmQXpySXhIZFBrbWp4cFhVRmRBTys0RTBW?=
 =?utf-8?B?M0hYSWlIRitRcWE0NjBpSy93b0hHRndPbmdTMXdVOWhNSVRDbFV0bmVMZFVw?=
 =?utf-8?B?WXdQQVY5aE1OZWRJblNmTjZKeW50WlBBQW1zMjlGWDhDMTQ4K3A3S3Qrb3Z3?=
 =?utf-8?B?ekZIamttWXFHdzlmZzBVUERiZllVaS9SNmh5YkVML1dNZFdNVjVBaGY2Y1Bv?=
 =?utf-8?B?ZjlVK2xJWkdRUkxsczRTK3VDdExIdDYzdDJKM1lLMzRSeVp4eVJ5d081R1h1?=
 =?utf-8?B?ZWhMVTJGWnJZdGIvUThqUzg3eDIzTGwraXFPMXdScE10NWZMbmQxN0JSSUxj?=
 =?utf-8?Q?5h5sqgiJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 974fc143-71f3-4e0f-088f-08d8c4167e37
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 05:26:56.0239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7F8lyJ10VYQoAP4vovcQgFaOMYm08sHKDFmkbXEMc9z218PuNM56Gf5MsE74j7iIsrX1i2dyaOJEY4BGfMXdePD73i9ATaoVJiOGTd8HqNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3159
Received-SPF: pass client-ip=40.107.20.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

28.01.2021 21:38, Philippe Mathieu-Daudé wrote:
> Hi Andrey,
> 
> On 1/26/21 3:19 PM, Max Reitz wrote:
>> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>
>> This patch completes the series with the COR-filter applied to
>> block-stream operations.
>>
>> Adding the filter makes it possible in future implement discarding
>> copied regions in backing files during the block-stream job, to reduce
>> the disk overuse (we need control on permissions).
>>
>> Also, the filter now is smart enough to do copy-on-read with specified
>> base, so we have benefit on guest reads even when doing block-stream of
>> the part of the backing chain.
>>
>> Several iotests are slightly modified due to filter insertion.
>>
>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Message-Id: <20201216061703.70908-14-vsementsov@virtuozzo.com>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   block/stream.c             | 105 ++++++++++++++++++++++---------------
>>   tests/qemu-iotests/030     |   8 +--
>>   tests/qemu-iotests/141.out |   2 +-
>>   tests/qemu-iotests/245     |  20 ++++---
>>   4 files changed, 80 insertions(+), 55 deletions(-)
>>
>> diff --git a/block/stream.c b/block/stream.c
> ...
>> @@ -228,7 +211,9 @@ void stream_start(const char *job_id, BlockDriverState *bs,
>>       bool bs_read_only;
>>       int basic_flags = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
>>       BlockDriverState *base_overlay;
>> +    BlockDriverState *cor_filter_bs = NULL;
>>       BlockDriverState *above_base;
>> +    QDict *opts;
>>   
>>       assert(!(base && bottom));
>>       assert(!(backing_file_str && bottom));
>> @@ -266,30 +251,62 @@ void stream_start(const char *job_id, BlockDriverState *bs,
>>           }
>>       }
>>   
>> -    if (bdrv_freeze_backing_chain(bs, above_base, errp) < 0) {
>> -        return;
>> -    }
>> -
>>       /* Make sure that the image is opened in read-write mode */
>>       bs_read_only = bdrv_is_read_only(bs);
>>       if (bs_read_only) {
>> -        if (bdrv_reopen_set_read_only(bs, false, errp) != 0) {
>> -            bs_read_only = false;
>> -            goto fail;
>> +        int ret;
>> +        /* Hold the chain during reopen */
>> +        if (bdrv_freeze_backing_chain(bs, above_base, errp) < 0) {
>> +            return;
>> +        }
>> +
>> +        ret = bdrv_reopen_set_read_only(bs, false, errp);
>> +
>> +        /* failure, or cor-filter will hold the chain */
>> +        bdrv_unfreeze_backing_chain(bs, above_base);
>> +
>> +        if (ret < 0) {
>> +            return;
>>           }
>>       }
>>   
>> -    /* Prevent concurrent jobs trying to modify the graph structure here, we
>> -     * already have our own plans. Also don't allow resize as the image size is
>> -     * queried only at the job start and then cached. */
>> -    s = block_job_create(job_id, &stream_job_driver, NULL, bs,
>> -                         basic_flags | BLK_PERM_GRAPH_MOD,
>> +    opts = qdict_new();
> 
> Coverity reported (CID 1445793) that this resource could be leaked...
> 
>> +
>> +    qdict_put_str(opts, "driver", "copy-on-read");
>> +    qdict_put_str(opts, "file", bdrv_get_node_name(bs));
>> +    /* Pass the base_overlay node name as 'bottom' to COR driver */
>> +    qdict_put_str(opts, "bottom", base_overlay->node_name);
>> +    if (filter_node_name) {
>> +        qdict_put_str(opts, "node-name", filter_node_name);
>> +    }
>> +
>> +    cor_filter_bs = bdrv_insert_node(bs, opts, BDRV_O_RDWR, errp);
>> +    if (!cor_filter_bs) {
> 
> ... probably here.
> 
> Should we call g_free(opts) here?


Actually, not..

bdrv_insert_node() calls bdrv_open() which eats options even on failure.

I see, CID already marked false-positive?

> 
>> +        goto fail;
>> +    }
>> +
>> +    if (!filter_node_name) {
>> +        cor_filter_bs->implicit = true;
>> +    }
>> +
>> +    s = block_job_create(job_id, &stream_job_driver, NULL, cor_filter_bs,
>> +                         BLK_PERM_CONSISTENT_READ,
>>                            basic_flags | BLK_PERM_WRITE,
>>                            speed, creation_flags, NULL, NULL, errp);
>>       if (!s) {
>>           goto fail;
>>       }
>>   
>> +    /*
>> +     * Prevent concurrent jobs trying to modify the graph structure here, we
>> +     * already have our own plans. Also don't allow resize as the image size is
>> +     * queried only at the job start and then cached.
>> +     */
>> +    if (block_job_add_bdrv(&s->common, "active node", bs, 0,
>> +                           basic_flags | BLK_PERM_WRITE, &error_abort)) {
>> +        goto fail;
>> +    }
>> +
>>       /* Block all intermediate nodes between bs and base, because they will
>>        * disappear from the chain after this operation. The streaming job reads
>>        * every block only once, assuming that it doesn't change, so forbid writes
>> @@ -310,9 +327,9 @@ void stream_start(const char *job_id, BlockDriverState *bs,
>>       s->base_overlay = base_overlay;
>>       s->above_base = above_base;
>>       s->backing_file_str = g_strdup(backing_file_str);
>> +    s->cor_filter_bs = cor_filter_bs;
>>       s->target_bs = bs;
>>       s->bs_read_only = bs_read_only;
>> -    s->chain_frozen = true;
>>   
>>       s->on_error = on_error;
>>       trace_stream_start(bs, base, s);
>> @@ -320,8 +337,10 @@ void stream_start(const char *job_id, BlockDriverState *bs,
>>       return;
>>   
>>   fail:
>> +    if (cor_filter_bs) {
>> +        bdrv_cor_filter_drop(cor_filter_bs);
>> +    }
>>       if (bs_read_only) {
>>           bdrv_reopen_set_read_only(bs, true, NULL);
>>       }
>> -    bdrv_unfreeze_backing_chain(bs, above_base);
>>   }
> ...
> 
> 


-- 
Best regards,
Vladimir

