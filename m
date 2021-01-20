Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD002FCD95
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 10:57:44 +0100 (CET)
Received: from localhost ([::1]:35266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2AFD-0004nU-O9
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 04:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2AE1-0003qR-K5; Wed, 20 Jan 2021 04:56:30 -0500
Received: from mail-eopbgr60091.outbound.protection.outlook.com
 ([40.107.6.91]:50691 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2ADy-0006NS-AG; Wed, 20 Jan 2021 04:56:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJlgHeBGU1M4Mi2y7nnQ4OfxrC/ukKuSVjJiXcL/+Fc1/AG5LhWGxBR6/XG24drYUJtlDbJcdVwD40JDbjvk1M6sqFSc3Ba6TiGGFu7zqMbsmJgrUI++mSjNKW7uWuvdpN9aJSvnnuAU81o4WE8zYXhIz/o686wLwMMHjXISoQJ3Q54b2jsppj0uNXhar33EB1YyYxLmOFcbRY/9CGZhZw46K6X6Tt8pcxTj+y5NqFlc12aJ69QwjE8prf6H8D3ZsMBrd59Ap4u2igz4ALwupgUBym+FqeKLrME5EVXxNRm27COBq2roH7wnIuFndE7Rj8jihwgPOnQm59lZ4+qw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIN1+JxQ65+oazt8+B12vONlzfswBcxAY4h/swX2+Do=;
 b=Sbs6Fd/KZTQ4vQ0KACfSH7AG63Ko30ZJN44450Pia5yYyY1w/X5VWTksDBPUMgRPOLwXRT093OqhyGouVqDulHzl8a8MDZim7P1SwVEUevFDHlxXawJOCDn8ADNy0R1KICMDJ5sXQpjVcs7lyt0paMjLQMiWrR3O1RqZSaBNR2fzS/5MZFLhGjTMRhNQoOYgKMpd2s2KN7qpCWQl3FIsywvjtA5k+uNvV+tP1/KC42oaPbXoavQOs6O1mkMdZzMk9m/0Ce82BMQA5oVgXXGnRFo/t0ypFw7uinAC7ftj2zC9vtTf28fIA670PnrkvTlg1AXhI8BcL4XSoG9x6fxjhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIN1+JxQ65+oazt8+B12vONlzfswBcxAY4h/swX2+Do=;
 b=kTViD56B95k9+7oFphrM+uRfod6EFUcRhfnJJldJxslgrtnpjhabOjhmbjaLj26Zkuzx0/OaYHWn0rAr6aAhZD037nXWRqiiid2MhdgWLzSfEt44SjfeNYPLULiSX23Rp0zeaFtMSKGS5AImUgwE250NLZDRTKFX2lygLl0uk5E=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 20 Jan
 2021 09:56:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 09:56:22 +0000
Subject: Re: [PATCH v2 12/36] block: refactor bdrv_child* permission functions
To: Kevin Wolf <kwolf@redhat.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-13-vsementsov@virtuozzo.com>
 <20210119180909.GK5012@merkur.fritz.box>
 <0b634f73-b997-d72d-e7ab-3a1dcdfeb509@virtuozzo.com>
 <20210120090954.GB5521@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ab87d174-0202-140d-31e9-60f6cb6dc2d5@virtuozzo.com>
Date: Wed, 20 Jan 2021 12:56:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210120090954.GB5521@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.70]
X-ClientProxiedBy: AM4P190CA0008.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.70) by
 AM4P190CA0008.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Wed, 20 Jan 2021 09:56:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3caa73e-1ad9-434c-7eea-08d8bd29a415
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5334AC41B1CC256DC91E584AC1A20@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gMTKocj0K7Ck1bXDxodZUbr3HgnDF43R8GdNWZisXeOOXNemWguW01gPIZdRCwwVwYScP1Y4SdD09bEnY7+lxYIznvmf82VEU/R+i2T/KhkoMgNN4n3P+wD40zaV2qITFZHUp9/oEIUlFriV7D5xSSnxHp2mNH59OISZdLd9ibZOQGN4EzCVo5KRCM7gyDP78Jf3UbqqqJiifi8W5hMVZQT3OxXEllA2NBklODqNzHa4TVHLWDqw1krOvYptV6vistcLoNSkm0D6Iy1fDtfJEwpBBt9+d4H73aKKVjRjBX7DqMXWRdWLnQ4gSB2X3xZ08F3yRJUjvCu5M5FUTchnEJTU7f98Mc+hQWVd0Fj6c06K6auQsfI8E4qQeJzO+cDFuvukmVKTzLB9N8SHj8Kgq3khJaHyMwynmhAt8kpSFkVGN0Fb0JMhK7iQwjDJIWUWI2sYVhw3ef3wEWIQl+Dqp9pkBfPdprJbMEGL53sfCN8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(346002)(136003)(376002)(396003)(366004)(52116002)(8936002)(956004)(5660300002)(86362001)(6486002)(2906002)(36756003)(6916009)(2616005)(26005)(66556008)(66946007)(478600001)(107886003)(4326008)(8676002)(186003)(16576012)(31696002)(66476007)(83380400001)(16526019)(31686004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aDRsWkdMQ1NmRlJqNlNvbVdpelZVdCszcFVQYnk0bkIvY2pnazkvSkR3TVZw?=
 =?utf-8?B?Tk5NczZSMmpwRW9kd3lEazhqYjliOUpoVkE1S0V3ZFg2SWxtcjhxQnBmUXk2?=
 =?utf-8?B?MHU3elJOMXNpaXRzcUFLazRaNWk4NzFmdXNWY2llY1FTTlY0RmFieVU0bytN?=
 =?utf-8?B?Z28veW4vaWp5ZXpDZVgxa0k2VTFudHBVcHRQWHhqWGtNcnJCeXRRRGRYZERr?=
 =?utf-8?B?VEdNM29INnZNRk1OblVSSnZIVmtLelFVMGVSRDBwNXdjZldTdzRJbnF3S05a?=
 =?utf-8?B?SjNrbytwM0FCdFpFYzYwd2RPaXU5VkNGWlF1UUpKd20xT0hhUkJqanNkRmh1?=
 =?utf-8?B?aWVxaUlWTDRhU2Z2MjFmNCttV29BQW5NR1NmRmRHMkQ4VlNtZnF1VFhBVmtp?=
 =?utf-8?B?QnJkOG9sVVAyMTh5d0RiZUsvVDlNbFpsYjVzdmZVUE12TXorUlRJTUR3TmtE?=
 =?utf-8?B?TW8vdGtqc1pLTTZSQ1dCVVNDMFlCdkxLT0dpeDNlS1F1K3RNd1Nzd3VCYWE5?=
 =?utf-8?B?OGYyamIwdnc0TFVnajlXRm9FM2dFOTFLc0ZRVzJYa3NGbkQ5bDYzRG02ZGlY?=
 =?utf-8?B?N0ROUVZ1b3V3bjNaaS92aTBUcHlUc2hEUFBOend5THA3cTlkMGNrakYxRFB1?=
 =?utf-8?B?U1JESDZCRmdlblpDWCtqVUxYczZGNVpqMDFBRXY1bFMzNDVGOU9yVmZZYW5Z?=
 =?utf-8?B?ZVVXUkp2YVJLZnd3bE5lK2JYTEhSWFI3YlB1YWQ3aDIxbENhZ0x0eEtqT1hy?=
 =?utf-8?B?Q1lLVDhjSVU3S2ZzUkxHazBQbm5pdzNlOW1BRUxSeEorN24vRTZycjVVUXZP?=
 =?utf-8?B?eGREY0FKZUJleWZKNXMyY3pJRjhCSXE5aURUMVlyakZoYk1OekNFU3BsazFX?=
 =?utf-8?B?TmFkV3pvRG5ZVy9MUWZyZ3NEeEJDa3hjU1JSU2h4Z1VjK05Ea1V2ZVhyRTJt?=
 =?utf-8?B?OGJ5eTJTbGhyUmlTaUZXQUNKdHhCQ0p6aHdiSDZuYnRuTFQ3NEMwNXYxckh5?=
 =?utf-8?B?Zm00NENnRFAzVjQxa0EvZG44V0lxK3RHMXlCWEdMcks0UE9WRi90dE1hSmJM?=
 =?utf-8?B?NmgzbHZVWHRLUlVRaTlTNTNJb2V5YVlXbjlCUUxzQi9WTkpRZExIOTRNeVZw?=
 =?utf-8?B?NTMrUVNWWjdaeGlMY2JEbmRLYStTRisxT2cybng5ODJ1NFhZYUlleDVFUFp1?=
 =?utf-8?B?ZHJZdThTdW5pVktKbml2bldKWDJFOURtMlZFMk5EMkhFVDJsWlVWMi9sbGV1?=
 =?utf-8?B?MDhocjd2SWNOVTBiRUNMdTFmQUdsZ2FVZFN0QkhSWXptWkxUNG5RS0RRWFZN?=
 =?utf-8?Q?ScUKOUUtpEOMZMfkFXz3CmT4PXzouqLu5x?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3caa73e-1ad9-434c-7eea-08d8bd29a415
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 09:56:21.9042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0e/ryxDLFtoV6XSey/+gfpVQhZEKq3nItdW2mamHCnBWRsdDOowwvRvWGZVXMHjW7HxiEbuac+kEDwWkujds1SMz479O6LYpThYYKxhQvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Received-SPF: pass client-ip=40.107.6.91;
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

20.01.2021 12:09, Kevin Wolf wrote:
> Am 19.01.2021 um 19:30 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 19.01.2021 21:09, Kevin Wolf wrote:
>>> Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> Split out non-recursive parts, and refactor as block graph transaction
>>>> action.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>    block.c | 79 ++++++++++++++++++++++++++++++++++++++++++---------------
>>>>    1 file changed, 59 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/block.c b/block.c
>>>> index a756f3e8ad..7267b4a3e9 100644
>>>> --- a/block.c
>>>> +++ b/block.c
>>>> @@ -48,6 +48,7 @@
>>>>    #include "qemu/timer.h"
>>>>    #include "qemu/cutils.h"
>>>>    #include "qemu/id.h"
>>>> +#include "qemu/transactions.h"
>>>>    #include "block/coroutines.h"
>>>>    #ifdef CONFIG_BSD
>>>> @@ -2033,6 +2034,61 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
>>>>        }
>>>>    }
>>>> +static void bdrv_child_set_perm_commit(void *opaque)
>>>> +{
>>>> +    BdrvChild *c = opaque;
>>>> +
>>>> +    c->has_backup_perm = false;
>>>> +}
>>>> +
>>>> +static void bdrv_child_set_perm_abort(void *opaque)
>>>> +{
>>>> +    BdrvChild *c = opaque;
>>>> +    /*
>>>> +     * We may have child->has_backup_perm unset at this point, as in case of
>>>> +     * _check_ stage of permission update failure we may _check_ not the whole
>>>> +     * subtree.  Still, _abort_ is called on the whole subtree anyway.
>>>> +     */
>>>> +    if (c->has_backup_perm) {
>>>> +        c->perm = c->backup_perm;
>>>> +        c->shared_perm = c->backup_shared_perm;
>>>> +        c->has_backup_perm = false;
>>>> +    }
>>>> +}
>>>> +
>>>> +static TransactionActionDrv bdrv_child_set_pem_drv = {
>>>> +    .abort = bdrv_child_set_perm_abort,
>>>> +    .commit = bdrv_child_set_perm_commit,
>>>> +};
>>>> +
>>>> +/*
>>>> + * With tran=NULL needs to be followed by direct call to either
>>>> + * bdrv_child_set_perm_commit() or bdrv_child_set_perm_abort().
>>>> + *
>>>> + * With non-NUll tran needs to be followed by tran_abort() or tran_commit()
>>>
>>> s/NUll/NULL/
>>>
>>>> + * instead.
>>>> + */
>>>> +static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
>>>> +                                     uint64_t shared, GSList **tran)
>>>> +{
>>>> +    if (!c->has_backup_perm) {
>>>> +        c->has_backup_perm = true;
>>>> +        c->backup_perm = c->perm;
>>>> +        c->backup_shared_perm = c->shared_perm;
>>>> +    }
>>>
>>> This is the obvious refactoring at this point, and it's fine as such.
>>>
>>> However, when you start to actually use tran (and in new places), it
>>> means that I have to check that we can never end up here recursively
>>> with a different tran.
>>
>> I don't follow.. Which different tran do you mean?
> 
> Any really. At this point in the series, nothing passes a non-NULL tran
> yet. When you add the first user, it is only a local transaction for a
> single node. If something else called bdrv_child_set_perm_safe() on the
> same node before the transaction has completed, the result would be
> broken.

But this problem is preexisting: if someone call bdrv_child_set_perm twice on the same node during one update operation, c->backup* will be rewritten.

> 
> So reviewing/understanding this change (and actually developing it in
> the first place) means going through all the code that ends up inside
> the transaction and making sure that we never try to change permissions
> for the same node a second time in any context.

I think we do it, when find same node several times during update. And that is fixed in "[PATCH v2 15/36] block: use topological sort for permission update", when we move to topological sorted list.

> 
>>>
>>> It would probably be much cleaner if the next patch moved the backup
>>> state into the opaque struct for BdrvAction.
>>
>> But old code which calls the function with tran=NULL can't use it..
>> Hmm, we can probably support both ways: c->backup_perm for callers
>> with tran=NULL and opaque struct for new style callers.
> 
> Hm, you're right about that... Maybe that's too much complication then.
> 
> What happens in the next patch is still understandable enough with the
> way you currently have it. Let's see what it looks like with the rest.
> 


-- 
Best regards,
Vladimir

