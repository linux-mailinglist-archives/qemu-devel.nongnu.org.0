Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F023339382
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 17:36:05 +0100 (CET)
Received: from localhost ([::1]:47190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKklg-00080Y-8k
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 11:36:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKkGm-0002KK-LU; Fri, 12 Mar 2021 11:04:08 -0500
Received: from mail-eopbgr150091.outbound.protection.outlook.com
 ([40.107.15.91]:58086 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKkGf-00041W-I4; Fri, 12 Mar 2021 11:04:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMQT35VD2nrxw6CggNu3dbD0jqzsTyAEKjhA7065swltv4B8Y58pU5pSlsLUemAF31y1+Dzn/MaCyykZRVpLnQIg/db0Irit/yIe2nqQpk+BfeNDiLoryY1cgD5PGALQiazMNMajjWuhx/0OuL8E0YZZXoqntBzAuW7N+UCo8Kt4a+6EXE39wUuBtyF77xHpSpeU3ATqgEwszjqWfEB7O+RP4nqY91Yw4g+x90OAQh+OTqeEYDQfVBPt4J3c/sDBC6YYHO+iwsiSqK2Y9BD97pkLFHlpDKqq/aV2Y3c5WzY1eqGHYDrifAxFL89R2CYhHVEfXsnFg6z+LlbCX9OH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oezd7QT0X82lPfXn6Ac9u3ocyMwzYzlgzNT5OlDQ56Y=;
 b=BiN7zhqmZgCVA2ze2Qzp1PIllm26+BxnmEzFsaHk8nKjMZP7VJEWsx5GyWKf+BxuM4FcdcKKyHgjfZq5qG91vD/5iGF9J7fto8Fke2CcRJjb4pCH45cAxISuNFvKyKxLmqI3sxqG4Wj3kB6ofkag854/bup/cp2iTKTUw5+BPq4AWl26rQbLiKC7CfSL696C6e4ZA5v9dxIvyIpuQxhzFjwk1dflIwT0tyHd/pPWP9Mpp4onEkcwpuYdDrPcUylKdIC25oHTx2wAMPzjzKxu7UO122ahRC5PrPpPYhMzV6klWA/fWB2HsQOGo63jV6W7W9YqvKT02XxuaJVJSmz9Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oezd7QT0X82lPfXn6Ac9u3ocyMwzYzlgzNT5OlDQ56Y=;
 b=VVKlkXx6pnUr29VuLGurFELaJMunXBr1w1Ysf6K/AYLC9mq611cUh/qyz4o8RyOy/Yq49fbY1qr55NjZDxG3DK5jVsWTGvlg14+aH7sKyodmbmXD0SBcskzyxpVZSAHvAuYSVB7PK8xgEFqcl3m1+Wpekn68k78bThNqmvbvXIQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Fri, 12 Mar
 2021 16:03:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 16:03:55 +0000
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
 <5fdf28fa-5a67-e3ff-a592-dc6c9285d75a@virtuozzo.com>
 <59e304ba-b6a1-8214-a243-01dd69d56732@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <649ac157-4c68-4f71-155d-2148e2c62dc6@virtuozzo.com>
Date: Fri, 12 Mar 2021 19:03:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <59e304ba-b6a1-8214-a243-01dd69d56732@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR08CA0026.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR08CA0026.eurprd08.prod.outlook.com (2603:10a6:208:d2::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 16:03:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11c1fbe7-442a-4ebf-c9c9-08d8e5707059
X-MS-TrafficTypeDiagnostic: AM7PR08MB5336:
X-Microsoft-Antispam-PRVS: <AM7PR08MB533654B55EFA3D7EB3D782C0C16F9@AM7PR08MB5336.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kczMkq/uxyZnSL321f6XWOJaaBI/yQ6dM8aeQ1PCf+jl5BfbiyQG+tJnUvqdWc2z/xLkc5plg8rV4dsRmHsK656qZ3reOkYmfU5pfu0CzI1Cju2lY1MigLuJmkhNbDF8e15YWHjxByyAq8YG+7tAJT4s//HfmhettYYCkWitXHSpoZOX7U7f95nsFszVc/7bj/AVnujd0zgc3cJXgsrGAhrH1EmKpX0AoCLrNOIZ5LJ2OIF7zIx/whtgXVVAGn3PGsnh98toJK9K3sOocAP7rdF4OGW5WPscNHeb/nTRmatZqNQnJ7zKye3oD/IwtmT/84SbO9XQBRtimquj4UWfqNSYkSKNOecnlwzOqjVOd7xOstFn6m3SEOJbrMQ8C/sIkHWZqo/R9faFwD2b7MMudDC+K09sA6wSaUkB0qWm2SDuVbSU4vxWpEzwIHG9Ieh4jEp/7JgePJgXFrCXqoFN8SV8nMvGJxgFPjh+NbwwdnDh8vKTS77T7OpT3JOQwH8yTmq/SfH7QNzhCdCVlSnbx5bMqgSfznhv5BM6uOzbTc4+MGXOMqY3E1KwJcFyDRaX4K42LH7A9tV+d56B4HaDqWFPseYnfV+imaohfPPQbTg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(376002)(396003)(136003)(366004)(956004)(31686004)(2616005)(66476007)(66556008)(316002)(2906002)(52116002)(5660300002)(6486002)(19627235002)(16576012)(66946007)(4326008)(8936002)(31696002)(83380400001)(53546011)(8676002)(26005)(186003)(478600001)(16526019)(36756003)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z2E1N3k5UGx0SFk3L1NaU3NGZEUwV2xPcXYvRXhoWENlQW0wS0wyNncvQUhi?=
 =?utf-8?B?N3pVYlFPUGtrZGw0T0x6TTY5VmFWV1N1TkNpVk1aelF1dFRDZU5CMS9hSFVG?=
 =?utf-8?B?ellzaCtXdDNGSFZiM3hSVFVCeVo5aDRKTDhGZmYzSzFacUxIeEt3NnJ4SG9o?=
 =?utf-8?B?UzlYQ2RtRlUvZU90allaeDFWbGFmZ2VEQlVZZFlQS0tsbzNOYlV6S21ONi9i?=
 =?utf-8?B?cndkSHh1dmo3QTZnKzcxTDhPM3NGeGsybUpNVGhPelVKRlFjS29xak1zZW44?=
 =?utf-8?B?MVFORVJGSmk4UVZ6V0RXc0hzTmJwTU8yUFE5Yk9aSFNLRnNEOXNFYUc4bzVV?=
 =?utf-8?B?TWQxclJYYkt0KzhhZ3NtWUw3WlgxR3ZVSE14YnpUeHp5b2RxMWlmRFpzQmJM?=
 =?utf-8?B?NVk1Vjg1enBYbG5OeHlzTlZUeEVQY0luMHlMSjZPeTlNN2NYZE9pNjhpc3VH?=
 =?utf-8?B?a2RrUG5kdHNlZG9nZHFLZHVJQVBQRVoyejlWTWZuUE4rVEF5YXNWUTFCaHlJ?=
 =?utf-8?B?bURvL0ZXc0o4MERDQUhoY1RFV2hhQ0JsZWFGNnJhSHZjN2s0MnBuZFR0a0h6?=
 =?utf-8?B?SWxrbDFBR0FNN01JSzRuS0d1K3pkMVZrUCtFNVlCNGwwYlYvQ05sNU9ST1RB?=
 =?utf-8?B?Y1ZNWmZoZGswOTZaaGpHa2p4NUtPenlpMEU3NjhGd1NCMSsxdkpVQ0dEQVgv?=
 =?utf-8?B?TnBuUklKaFZ4Q2dlbFJlS0xJWUl0VlQ3MDlwL2pNSExzRFUwcnBoMFNYa3R0?=
 =?utf-8?B?VVVIemJPK1pwV2RkTWtmUUFLREwwOElVZE80MWtINVpFWXVTdis3QUVVUXFX?=
 =?utf-8?B?bjRUZDkwSXZMMGxMSER4NWVEaWZOaklSMkdKK0k5Y0ViLzZWenEzVDd5dlpW?=
 =?utf-8?B?bERoeG16NGJGb1lpbnJ3YUxsYUtlWEx5SSs3UzRCWW1aanB0YjlIaGhjQmhN?=
 =?utf-8?B?VFFMTG9rQ1N4M0xEc3pBRzMzcGZHRG1PN2gxVXNydlgrNFp5YUZDdDhRRmwy?=
 =?utf-8?B?Umc1WXJ6YmVIRUFQZ2VFQkVNblY5Q2RCbTdXMVJIUWNYZFJEcGFqbEhRSXlw?=
 =?utf-8?B?ckNxUmRmak5RdXAvYXFlem9rQ1huS1JRVTVXTkt1S3hKS0M5S25QaU9BTEFE?=
 =?utf-8?B?SlBwd1M4amg5VWJ2RHBVME53RmExbURhYmYzRzNGMlAzQWJPZTcvMjVwWGQ3?=
 =?utf-8?B?dDBGU3EvbjQxVjQ0aXdyZ2RRYTZMY3FGZUVIK3JETFFwT3o5TTVuT0NhRXN0?=
 =?utf-8?B?SWE0V2xqTDVGTlVPWllmUHBYOCt1Q3luaU1teW1PSWRpTkJkNkV3MHdWWVQ2?=
 =?utf-8?B?NWYxckcrU0plTEVmdUkyVk5QQ0hxYVNXeUtWNU02N010amhJSzRydFRDNCtE?=
 =?utf-8?B?M0plcDNIWVg0OWwrQldxZ294ZG10VG1OOEVLQitFa04xUDN6RUJKK2pqclRG?=
 =?utf-8?B?NnhCRkFwajJmY3JVc0ZOVi8wazRROXBTOWdRY0FQT0JaakFmdmZFdnNtRkoz?=
 =?utf-8?B?ajE4STgrVHQ1R2RtNjdqUmhIaS8zK2VGTytkcitma2htMENOcjZ4Uzh3VlFj?=
 =?utf-8?B?ays0ZnNDeUIyQUxSWFhkbnBPdGRiVFM5RmV5WTZVTUYyUkFIdmw2TjU5ZmF3?=
 =?utf-8?B?R1pVbnlYY1gzcG1MdERtRmNLUG5zSmxQVlVlWlZhcWN1NG9rSEM2M3lhZG9T?=
 =?utf-8?B?UWV0TjUyc203WnVuZmhJeWZlc3owK2pCWUxyMkJIVkRnRDJ6dDAvTlpzRFlG?=
 =?utf-8?Q?47Z3OGyLDhDtcS+LzaxCAOQ+w2D8gYTvBY77w4E?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c1fbe7-442a-4ebf-c9c9-08d8e5707059
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 16:03:55.8697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cN0GR1xaZ9hAHsWD7U3LftYVM0PgsPMDAH4zStn0V//xYc4oT/IaMKeNl/Ea2gMU3l0PlHW42GEpEyejv7hMMpudbQb/xT++MVchF6cEUzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Received-SPF: pass client-ip=40.107.15.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

12.03.2021 18:52, Max Reitz wrote:
> On 12.03.21 16:24, Vladimir Sementsov-Ogievskiy wrote:
>> 12.03.2021 18:10, Max Reitz wrote:
>>> On 12.03.21 13:46, Vladimir Sementsov-Ogievskiy wrote:
>>>> 12.03.2021 15:32, Vladimir Sementsov-Ogievskiy wrote:
>>>>> 12.03.2021 14:17, Max Reitz wrote:
>>>>>> On 12.03.21 10:09, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>> 11.03.2021 22:58, Max Reitz wrote:
>>>>>>>> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>>>> There is a bug in qcow2: host cluster can be discarded (refcount
>>>>>>>>> becomes 0) and reused during data write. In this case data write may
>>>>>
>>>>> [..]
>>>>>
>>>>>>>>> @@ -885,6 +1019,13 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
>>>>>>>>>           if (refcount == 0) {
>>>>>>>>>               void *table;
>>>>>>>>> +            Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
>>>>>>>>> +
>>>>>>>>> +            if (infl) {
>>>>>>>>> +                infl->refcount_zero = true;
>>>>>>>>> +                infl->type = type;
>>>>>>>>> +                continue;
>>>>>>>>> +            }
>>>>>>>>
>>>>>>>> I don’t understand what this is supposed to do exactly.  It seems like it wants to keep metadata structures in the cache that are still in use (because dropping them from the caches is what happens next), but users of metadata structures won’t set in-flight counters for those metadata structures, will they?
>>>>>>>
>>>>>>> Don't follow.
>>>>>>>
>>>>>>> We want the code in "if (refcount == 0)" to be triggered only when full reference count of the host cluster becomes 0, including inflight-write-cnt. So, if at this point inflight-write-cnt is not 0, we postpone freeing the host cluster, it will be done later from "slow path" in update_inflight_write_cnt().
>>>>>>
>>>>>> But the code under “if (refcount == 0)” doesn’t free anything, does it?  All I can see is code to remove metadata structures from the metadata caches (if the discarded cluster was an L2 table or a refblock), and finally the discard on the underlying file.  I don’t see how that protocol-level discard has anything to do with our problem, though.
>>>>>
>>>>> Hmm. Still, if we do this discard, and then our in-flight write, we'll have data instead of a hole. Not a big deal, but seems better to postpone discard.
>>>>>
>>>>> On the other hand, clearing caches is OK, as its related only to qcow2-refcount, not to inflight-write-cnt
>>>>>
>>>>>>
>>>>>> As far as I understand, the freeing happens immediately above the “if (refcount == 0)” block by s->set_refcount() setting the refcount to 0. (including updating s->free_cluster_index if the refcount is 0).
>>>>>
>>>>> Hmm.. And that (setting s->free_cluster_index) what I should actually prevent until total reference count becomes zero.
>>>>>
>>>>> And about s->set_refcount(): it only update a refcount itself, and don't free anything.
>>>>>
>>>>>
>>>>
>>>> So, it is more correct like this:
>>>>
>>>> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
>>>> index 464d133368..1da282446d 100644
>>>> --- a/block/qcow2-refcount.c
>>>> +++ b/block/qcow2-refcount.c
>>>> @@ -1012,21 +1012,12 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
>>>>           } else {
>>>>               refcount += addend;
>>>>           }
>>>> -        if (refcount == 0 && cluster_index < s->free_cluster_index) {
>>>> -            s->free_cluster_index = cluster_index;
>>>> -        }
>>>>           s->set_refcount(refcount_block, block_index, refcount);
>>>>
>>>>           if (refcount == 0) {
>>>>               void *table;
>>>>               Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
>>>>
>>>> -            if (infl) {
>>>> -                infl->refcount_zero = true;
>>>> -                infl->type = type;
>>>> -                continue;
>>>> -            }
>>>> -
>>>>               table = qcow2_cache_is_table_offset(s->refcount_block_cache,
>>>>                                                   offset);
>>>>               if (table != NULL) {
>>>> @@ -1040,6 +1031,16 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
>>>>                   qcow2_cache_discard(s->l2_table_cache, table);
>>>>               }
>>>>
>>>> +            if (infl) {
>>>> +                infl->refcount_zero = true;
>>>> +                infl->type = type;
>>>> +                continue;
>>>> +            }
>>>> +
>>>> +            if (cluster_index < s->free_cluster_index) {
>>>> +                s->free_cluster_index = cluster_index;
>>>> +            }
>>>> +
>>>>               if (s->discard_passthrough[type]) {
>>>>                   update_refcount_discard(bs, cluster_offset, s->cluster_size);
>>>>               }
>>>
>>> I don’t think I like using s->free_cluster_index as a protection against allocating something before it.
>>
>> Hmm, I just propose not to update it, if refcount reached 0 but we still have inflight writes.
>>
>>
>>>
>>> First, it comes back the problem I just described in my mail from 15:58 GMT+1, which is that you’re changing the definition of what a free cluster is.  With this proposal, you’re proposing yet a new definition: A free cluster is anything with refcount == 0 after free_cluster_index.
>>
>> I think that free cluster is anything with refcount = 0 and inflight-write-cnt = 0.
> 
> Then, as I said in my other mail, update_refcount() just cannot free any cluster.  So changes to that function can’t be justified by preventing it from freeing clusters.
> 
> You need to clearly define what it is that update_refcount() should or shouldn’t do, and then we have to think about whether when all writes have settled, we really have to invoke qcow2_update_cluster_refcount() or whether we should do the small outstanding changes just directly in update_inflight_write_cnt().
> 
> I think this needs to be more formalized, or it doesn’t make sense.
> 
> For example, say we do define a free cluster to be refcount (RC) = 0 and inflight-write-cnt (IFWC) = 0.  Then everything that is done to a cluster because it is considered being freed right now because its RC drops to 0 must probably be changed to only be done if also its IFWC is 0.  For example, we should only discard host clusters on the protocol layer if a cluster becomes free.  update_refcount() will no longer be able to free clusters with IFWC > 0, so it must never issue a protocol-level discard for them.  And, yes, it also shouldn’t adjust first_free_cluster_index, as you propose here.  (But you didn’t explain why, and it seems like it was just intuition to you instead of looking at it more formally.)
> 
> Instead, for clusters with RC = 0 and IFWC > 0, update_inflight_write_cnt() will take on the role of freeing them.  So now that function must adjust first_free_cluster_index and issue the protocol-level discard for such clusters.

Yes, agree.

> 
> I suppose in practice we could invoke qcow2_update_cluster_refcount() with -0, as you do, because now the cluster has RC = 0 and IFWC = 0, so now that function will be capable of freeing it.  But to me, that just looks like a bit of abuse.

agree

> 
> 
> I suppose we could create a new function qcow2_cluster_freed() where we collect everything that needs to be done once a cluster is considered freed (which so far was whenever its RC dropped to 0, which only happens in update_refcount(); and then will be whenever its RC and its IFWC drop to 0, which can happen in either update_refcount() or update_inflight_write_cnt()).  What would belong in there is discarding the cluster on the protocol level, and adjusting first_free_cluster_index.  (Perhaps more, I don’t know.)  With such a function, it would seem clear to me that there is no need to invoke qcow2_update_cluster_refcount() just to get precisely that effect.

yes

> 
> 
> (The alternative would be to keep RC == 0 the definition of a freed cluster.  Then we’d have to postpone the s->set_refcount() in update_refcount(), and update the refcount again in update_inflight_write_cnt(), but invoking qcow2_update_cluster_refcount().  We wouldn’t need to change the allocation functions.
> 
> I’m not saying that alternative is better – I don’t think it is, I think you’re right that the definition of a freed cluster should be changed. I’m just presenting it in contrast, to show when it would make sense to call qcow2_update_cluster_refcount().)

OK

In the meanwhile Kevin dispelled my "big problems" in "[PATCH v2(RFC) 0/3] qcow2: fix parallel rewrite and discard", so probably next step would be to retry CoRwLock-based approach.

> 
>> And free_cluster_index is a hint where start to search for such cluster.
>>
>>>
>>> Now looking only at the allocation functions, it may look like that kind of is the definition already.  But I don’t think that was the intention when free_cluster_index was introduced, so we’d have to check every place that sets free_cluster_index, to see whether it adheres to this definition.
>>>
>>> And I think it’s clear that there is a place that won’t adhere to this definition, and that is this very place here, in update_refcount(). Say free_cluster_index is 42.  Then you free cluster 39, but there is a write to it, so free_cluster_index isn’t update.  Then you free cluster 38, and there are writes to that cluster, so free_cluster_index is updated to 38.  Suddenly, 39 is free to be allocated, too.
>>
>> Why? 39 is protected by inflight-cnt, and we do has_infl_wr() check together with refcount==0 check when allocate clusters.
> 
> I was (wrongly) assuming that with this change you’d drop the check in the allocation functions.
> 
> Max
> 
>>> (The precise problem is that with this new definition decreasing free_cluster_index suddenly has the power to free any cluster between its new and all value.  With the old definition, changing free_cluster_index would never free any cluster.  So when you decrease free_cluster_index, you suddenly have to be sure that all clusters between the new and old value that have refcount 0 are indeed to be considered free.)
>>>
>>> Max
>>>
>>
>>
> 


-- 
Best regards,
Vladimir

