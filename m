Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4733BEC5E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 18:36:14 +0200 (CEST)
Received: from localhost ([::1]:36874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1AWy-0003gC-QZ
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 12:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1AUr-0002TO-Ky; Wed, 07 Jul 2021 12:34:01 -0400
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:33319 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1AUo-0000qs-4H; Wed, 07 Jul 2021 12:34:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAiHkAZ85loArhz56lOpXFknYRH4XEq392FQPNAxTkT3xUCw4vHA59w8nRp7RQkIv8kyXx3bjkW01RY9z0lIKv0+t3BTshK4IgsP872h1snzyUfpaAch9SBzvKUD0nv9IZDel2deQHcGoTbCL1OxGkyn9/c2UibortM5GBuGqtQ70AoPgJUYsAkA0MDivjDxBEVL6nsrYIUSiYi7bYkQ9pbRmqNxDiyVKM0JYHUxRZ+NlPW7hT/gkZx1oOGGsL/h14IQuC5d0p8Jr0xjy/HYW0udkKe0iXXbavkIblAycWRDoW/BZuhpmHkXhigJpFrOoOAiPvTzv3KyX3U8Et25xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2KRUYAOb5ynFc8BBet6+TDwCQ1sUMX6qsxFDz81/Qo=;
 b=hd6225r0an6F+1yXO+OhIHy92GfjdriPb+MPuORPOQLmT/931rbVGQbTWhzStVgFLS2ewvxrXOBHcW+u1JHXs0P4Klw9tzm6WRwL0WM7EIiUthZPtGPi/deB3mZmo0EpYy0UKc02DjNUglQs6uCGYxCDBBZ5V5RQgtBUdJTX/rAgs+oqiO+sInzZYiZWgoCIhAUZTB7DWCpAzXzQhgvyi0lT7c32sWYdVvMbxGuJB4zMpNbwtTpO73+M5P/a9gHBhH+FXnUFXy2cD48Ln0p7CrCLLVloZNffd1xSuQSh/r5lQjFvBHFG9hvDkIhgA+Eh/4AKfmhsyAUIKbmbzfe7uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2KRUYAOb5ynFc8BBet6+TDwCQ1sUMX6qsxFDz81/Qo=;
 b=Zyg8FCeXg+USkPXGC8ARRdHbVneXX6t9URLXbe6fDvy8L+C4TNxE1OVApnIQocxDBcwZdmDtvno7+S5DaKkI2Qc3oJfgGD0KXkFyLsCTAlJZw+Bx7n3jFTGhRMprSxJZa5u5x0Z2p8HCZbmBGTlCwCt1+TrHlX63vemn2ejBSHE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3766.eurprd08.prod.outlook.com (2603:10a6:20b:83::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 16:33:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Wed, 7 Jul 2021
 16:33:54 +0000
Subject: Re: [PATCH] block/replication.c: Properly attach children
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <20210706181138.1c0bacd8@gecko.fritz.box>
 <3dee7e1a-00ff-5f98-fb22-ffb248e1094e@virtuozzo.com>
 <20210707165328.68e10535@gecko.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b2188109-af52-3241-0af3-03fd1c24717a@virtuozzo.com>
Date: Wed, 7 Jul 2021 19:33:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210707165328.68e10535@gecko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.10 via Frontend Transport; Wed, 7 Jul 2021 16:33:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10421169-dea9-4063-badb-08d94165027d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3766:
X-Microsoft-Antispam-PRVS: <AM6PR08MB37666D0B0E8B449D01A113ADC11A9@AM6PR08MB3766.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LDOYrsDFLXa0YCxAibMFY5cxi+eIq54PAVe39iEyJlO0vuCRasCLkAV606VkXFd076raF/z1pYdxK/Jeeduh7e7B92kYsmbG7uyHBp7i3XLMoyu1r9niVDbCIywyLakIvVuSNoEGtQmPzSyBRgjbPRblef2nut5hOZW5fRugZjLNQ4lYAP3zUzFFmi0XK7i1TxOL7oxFYuBi8UKoj9H0J0fds62NZViC1jQLCFARENlEHMc1X8gk2VhOGSFQxy6eflSX+HihJ/0nDeZazg9GrCQo+vWgUOymkibbxJ33EX7PgLxaxUrLTXKHacWgUTGFgt6lI3U99AVsVzC6N5J4FIR5MKNiwxWlthwtd0Ydzgf98M56Wo+0Z1YzIbMvfbTOd2ttQyOSIoTsX0Jsp1/aBrsxXOitkaBzRDiFtKOOZgsE2fxGLDy6Mc7YYTVUNjqbqJ0spV4badGI84YTl9ed5MWeEysqObrfbVvl09bx+DgirH7R6tBSACJurjK+kDf9I2KfNRbQTmGSZjedlEjEohZ/UfRzLDhctKXR37gJXfH8fDeOvH+1vIx84V5CEPuSJyPaPDRZKc8DtUZ2TE+DaI2z/xmf2bUi91nlzzbcJ5FAtDOGqSNr+tiq7yZXzevg/1//ifdRWcwRuDNg1NCIaZKFsrrGBZEI8Tlqy3/eXpbizoAKsyj7tS0YT8bQKzNV2ZwA8+a8+5zl+dkBppzoneN5wTbS4fv+jT/vO8AuOZv3ewgWzxSkWKGgYhiqmdKWNAM7/9wtoKlkB4lqese1g/H87lIKfWUuU+jS5e0cQHk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39840400004)(136003)(376002)(346002)(5660300002)(2616005)(26005)(316002)(83380400001)(36756003)(8676002)(6486002)(16576012)(186003)(956004)(478600001)(6916009)(31686004)(31696002)(8936002)(4326008)(66946007)(38100700002)(38350700002)(54906003)(66556008)(66476007)(30864003)(52116002)(2906002)(86362001)(522954003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?1HiDEhsiNQi9sAddb86146ZKlg246YkTHWaGJb0vsnX3jSjBM5gqYfM/?=
 =?Windows-1252?Q?GmDLzvEw9336bKhRh9l+8CboqIF3LUPqGm0QnpERlzAy/YehjvOuki+g?=
 =?Windows-1252?Q?rtfMT/FQ0ljJinUE1tkquQEmCE+acfSUf9xkqQ/NqQjkbGQnxyTwCpao?=
 =?Windows-1252?Q?ymcXrkpKNRNzqgpy0zWyGToeBuq25Jp2vemc6/eaq7pKR8f97zbgsSYm?=
 =?Windows-1252?Q?VP8Bh6c3tNzxYmVXZLVtYzpV8S8BleFLDewebNxDvonQMCfq82DT78Y9?=
 =?Windows-1252?Q?vZtJyk7iagUvl1Pe5rSZ4En1Hy+NGlNO/0FQhWImxIp+Y+0OyIwJoxj4?=
 =?Windows-1252?Q?aYNb523OcSoVeboXYI2sj7kAhxF3nrM++OPzU8nJ2Y2L70bzgKGllB/W?=
 =?Windows-1252?Q?WGsvUqkbZ/Ov2cRT3NWAUn4OkLHDDUITop39o03FOP3YlW6Yy8fEqjPb?=
 =?Windows-1252?Q?FS5NckB5OnmGAXhVKt+3EicCgutxArd5P8l9ooVT3UBwhDnZRZFsKdx1?=
 =?Windows-1252?Q?zbWdh5Vgwx9rpY56oPj9cjfT0DicY9doDDGoY+Y5ShqunkYNOJbKapEK?=
 =?Windows-1252?Q?6ScNz+8M1sZmygouFKkgjr5Xid5ZfcRtWdzuw+TL5KSsWJteciaBlvhO?=
 =?Windows-1252?Q?ruRdrUr/Ba65ZbX+TPLGjCtK9auyuhH7oiU8GLs7+NWTxLeqavKJ9zgU?=
 =?Windows-1252?Q?K89dFLvBUJfKt/gd3KTyLBGAtNvfKwUvS5V+w4b3skTGyIVSeZJw50E+?=
 =?Windows-1252?Q?Vdc3rqrB/KBeHorgBVBAPK9g3pYDy3B6PlLsAk1QT2cZx4VUWGmJffh6?=
 =?Windows-1252?Q?sVM43JW1bP4IkAlIg0u9I2XkJPhy8cFa8rFzVKkgB3+R8ZBDYxK1Vyo7?=
 =?Windows-1252?Q?gOQMEauUkfHLJ1U4KjuobLSH3cnLJtwaYiejSeib0FGJ8ri8XIbH0Bb7?=
 =?Windows-1252?Q?z03SwVfRTF70ori6uyJ96K8T8zRZ69HjefCAPuwwRa819gff+luETGp/?=
 =?Windows-1252?Q?MhRRd8p91cxdA/9VwQBObA71k3hvD8QBKtBksj0IkPAvfJT8cDqYnzwk?=
 =?Windows-1252?Q?IJ4LF4rkok3FgifzEm8dL6YmVFiYRzIxeFW9TyFPr/DoPZztIdOUxr9D?=
 =?Windows-1252?Q?H7Oi1YeqUMV+byToM8nBx68DKTN6CYmqLaTGW4WyMxrxobcc8c5AzHYz?=
 =?Windows-1252?Q?/4nVHTIlr9Tgh+iytto6BFCX2jB7Um+fDklOOn6x/XQcoTY+CCR71Fzm?=
 =?Windows-1252?Q?JeJNbRXZ36kK5JPHdc4YM+V6riqpHFZB/Fd57ZJKX/VZBBCysdorKSeX?=
 =?Windows-1252?Q?Joc69ITf/9wzAJSk/ZsgyrBJNpvmnC91W1iKkPoyv2ReODAoc74hcOsJ?=
 =?Windows-1252?Q?eN74IMgOR6ZG6pZ/DdQUx968keU0oeQFI6+160Gp15yPwkb3s6SM/LWg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10421169-dea9-4063-badb-08d94165027d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 16:33:54.0933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWtv/8baEr4uvgfQCYw79PHLeuZl7D4fk6IR12GbxHXkklbO6ZNMO2X8XMErUpicaYvp8qr2V5N1PFW0D0lHBzvdo8ZfItUqlgVJXIRjIoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3766
Received-SPF: pass client-ip=40.107.21.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

07.07.2021 17:53, Lukas Straub wrote:
> Hi,
> Thanks for your review. More below.
> 
> Btw: There is a overview of the replication design in
> docs/block-replication.txt
> 
> On Wed, 7 Jul 2021 16:01:31 +0300
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> 
>> 06.07.2021 19:11, Lukas Straub wrote:
>>> The replication driver needs access to the children block-nodes of
>>> it's child so it can issue bdrv_make_empty to manage the replication.
>>> However, it does this by directly copying the BdrvChilds, which is
>>> wrong.
>>>
>>> Fix this by properly attaching the block-nodes with
>>> bdrv_attach_child().
>>>
>>> Also, remove a workaround introduced in commit
>>> 6ecbc6c52672db5c13805735ca02784879ce8285
>>> "replication: Avoid blk_make_empty() on read-only child".
>>>
>>> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
>>> ---
>>>
>>> -v2: Test for BDRV_CHILD_PRIMARY in replication_child_perm, since
>>>        bs->file might not be set yet. (Vladimir)
>>>
>>>    block/replication.c | 94 +++++++++++++++++++++++++++++----------------
>>>    1 file changed, 61 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/block/replication.c b/block/replication.c
>>> index 52163f2d1f..fd8cb728a3 100644
>>> --- a/block/replication.c
>>> +++ b/block/replication.c
>>> @@ -166,7 +166,12 @@ static void replication_child_perm(BlockDriverState *bs, BdrvChild *c,
>>>                                       uint64_t perm, uint64_t shared,
>>>                                       uint64_t *nperm, uint64_t *nshared)
>>>    {
>>> -    *nperm = BLK_PERM_CONSISTENT_READ;
>>> +    if (role & BDRV_CHILD_PRIMARY) {
>>> +        *nperm = BLK_PERM_CONSISTENT_READ;
>>> +    } else {
>>> +        *nperm = 0;
>>> +    }
>>
>> Why you drop READ access for other children? You don't mention it in commit-msg..
>>
>> Upd: ok now I see that we are not going to read from hidden_disk child, and that's the only "other" child that worth to mention.
>> Still, we should be sure that hidden_disk child gets WRITE permission in case we are going to call bdrv_make_empty on it.
> 
> The code below that in replication_child_perm() should make sure of
> that or am i misunderstanding it?
> 
> Or do you mean that it should always request WRITE regardless of
> bs->open_flags & BDRV_O_INACTIVE?

Probably that.

I mean the following:

Do you know the circumstances when secondary_do_checkpoint() is called? With new code, could it be called when we don't have WRITE permission on hidden_disk? If it could, it's a bug.

And this patch should answer this question, because pre-patch we create blk with explicitly set BLK_PERM_WRITE. After-patch we rely on existing code in replication_child_perm().

> 
>>> +
>>>        if ((bs->open_flags & (BDRV_O_INACTIVE | BDRV_O_RDWR)) == BDRV_O_RDWR) {
>>>            *nperm |= BLK_PERM_WRITE;
>>>        }
>>> @@ -340,17 +345,7 @@ static void secondary_do_checkpoint(BDRVReplicationState *s, Error **errp)
>>>            return;
>>>        }
>>>    
>>> -    BlockBackend *blk = blk_new(qemu_get_current_aio_context(),
>>> -                                BLK_PERM_WRITE, BLK_PERM_ALL);
>>> -    blk_insert_bs(blk, s->hidden_disk->bs, &local_err);
>>> -    if (local_err) {
>>> -        error_propagate(errp, local_err);
>>> -        blk_unref(blk);
>>> -        return;
>>> -    }
>>> -
>>> -    ret = blk_make_empty(blk, errp);
>>> -    blk_unref(blk);
>>> +    ret = bdrv_make_empty(s->hidden_disk, errp);
>>
>> So, here you rely on BLK_PERM_WRITE being set in replication_child_perm().. Probably that's OK, however logic is changed. Shouldn't we always require write permission in replication_child_perm() for hidden_disk ?
>>
>>>        if (ret < 0) {
>>>            return;
>>>        }
>>> @@ -365,27 +360,35 @@ static void reopen_backing_file(BlockDriverState *bs, bool writable,
>>>                                    Error **errp)
>>>    {
>>>        BDRVReplicationState *s = bs->opaque;
>>> +    BdrvChild *hidden_disk, *secondary_disk;
>>>        BlockReopenQueue *reopen_queue = NULL;
>>>    
>>> +    /*
>>> +     * s->hidden_disk and s->secondary_disk may not be set yet, as they will
>>> +     * only be set after the children are writable.
>>> +     */
>>> +    hidden_disk = bs->file->bs->backing;
>>> +    secondary_disk = hidden_disk->bs->backing;
>>> +
>>>        if (writable) {
>>> -        s->orig_hidden_read_only = bdrv_is_read_only(s->hidden_disk->bs);
>>> -        s->orig_secondary_read_only = bdrv_is_read_only(s->secondary_disk->bs);
>>> +        s->orig_hidden_read_only = bdrv_is_read_only(hidden_disk->bs);
>>> +        s->orig_secondary_read_only = bdrv_is_read_only(secondary_disk->bs);
>>>        }
>>>    
>>> -    bdrv_subtree_drained_begin(s->hidden_disk->bs);
>>> -    bdrv_subtree_drained_begin(s->secondary_disk->bs);
>>> +    bdrv_subtree_drained_begin(hidden_disk->bs);
>>> +    bdrv_subtree_drained_begin(secondary_disk->bs);
>>
>> That kind of staff may be done as a separate preparation patch, with no-logic-change refactoring, this makes the main logic-change patch simpler.
> 
> Yes, makes sense. Will do in the next version.
> 
>>>    
>>>        if (s->orig_hidden_read_only) {
>>>            QDict *opts = qdict_new();
>>>            qdict_put_bool(opts, BDRV_OPT_READ_ONLY, !writable);
>>> -        reopen_queue = bdrv_reopen_queue(reopen_queue, s->hidden_disk->bs,
>>> +        reopen_queue = bdrv_reopen_queue(reopen_queue, hidden_disk->bs,
>>>                                             opts, true);
>>>        }
>>>    
>>>        if (s->orig_secondary_read_only) {
>>>            QDict *opts = qdict_new();
>>>            qdict_put_bool(opts, BDRV_OPT_READ_ONLY, !writable);
>>> -        reopen_queue = bdrv_reopen_queue(reopen_queue, s->secondary_disk->bs,
>>> +        reopen_queue = bdrv_reopen_queue(reopen_queue, secondary_disk->bs,
>>>                                             opts, true);
>>>        }, probably it could be a separate patch if it is needed.
>>>    
>>> @@ -393,8 +396,8 @@ static void reopen_backing_file(BlockDriverState *bs, bool writable,
>>>            bdrv_reopen_multiple(reopen_queue, errp);
>>>        }
>>>    
>>> -    bdrv_subtree_drained_end(s->hidden_disk->bs);
>>> -    bdrv_subtree_drained_end(s->secondary_disk->bs);
>>> +    bdrv_subtree_drained_end(hidden_disk->bs);
>>> +    bdrv_subtree_drained_end(secondary_disk->bs);
>>>    }
>>>    
>>>    static void backup_job_cleanup(BlockDriverState *bs)
>>> @@ -451,6 +454,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>>>        BlockDriverState *bs = rs->opaque;
>>>        BDRVReplicationState *s;
>>>        BlockDriverState *top_bs;
>>> +    BdrvChild *active_disk, *hidden_disk, *secondary_disk;
>>>        int64_t active_length, hidden_length, disk_length;
>>>        AioContext *aio_context;
>>>        Error *local_err = NULL;
>>> @@ -488,32 +492,32 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>>>        case REPLICATION_MODE_PRIMARY:
>>>            break;
>>>        case REPLICATION_MODE_SECONDARY:
>>> -        s->active_disk = bs->file;
>>> -        if (!s->active_disk || !s->active_disk->bs ||
>>> -                                    !s->active_disk->bs->backing) {
>>> +        active_disk = bs->file;
>>> +        if (!active_disk || !active_disk->bs ||
>>> +                                    !active_disk->bs->backing) {
>>>                error_setg(errp, "Active disk doesn't have backing file");
>>>                aio_context_release(aio_context);
>>>                return;
>>>            }
>>>    
>>> -        s->hidden_disk = s->active_disk->bs->backing;
>>> -        if (!s->hidden_disk->bs || !s->hidden_disk->bs->backing) {
>>> +        hidden_disk = active_disk->bs->backing;
>>> +        if (!hidden_disk->bs || !hidden_disk->bs->backing) {
>>>                error_setg(errp, "Hidden disk doesn't have backing file");
>>>                aio_context_release(aio_context);
>>>                return;
>>>            }
>>>    
>>> -        s->secondary_disk = s->hidden_disk->bs->backing;
>>> -        if (!s->secondary_disk->bs || !bdrv_has_blk(s->secondary_disk->bs)) {
>>> +        secondary_disk = hidden_disk->bs->backing;
>>> +        if (!secondary_disk->bs || !bdrv_has_blk(secondary_disk->bs)) {
>>>                error_setg(errp, "The secondary disk doesn't have block backend");
>>>                aio_context_release(aio_context);
>>>                return;
>>>            }
>>>    , probably it could be a separate patch if it is needed.
> 
> Ok.
> 
>>>            /* verify the length */
>>> -        active_length = bdrv_getlength(s->active_disk->bs);
>>> -        hidden_length = bdrv_getlength(s->hidden_disk->bs);
>>> -        disk_length = bdrv_getlength(s->secondary_disk->bs);
>>> +        active_length = bdrv_getlength(active_disk->bs);
>>> +        hidden_length = bdrv_getlength(hidden_disk->bs);
>>> +        disk_length = bdrv_getlength(secondary_disk->bs);
>>>            if (active_length < 0 || hidden_length < 0 || disk_length < 0 ||
>>>                active_length != hidden_length || hidden_length != disk_length) {
>>>                error_setg(errp, "Active disk, hidden disk, secondary disk's length"
>>> @@ -523,10 +527,10 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>>>            }
>>>    
>>>            /* Must be true, or the bdrv_getlength() calls would have failed */
>>> -        assert(s->active_disk->bs->drv && s->hidden_disk->bs->drv);
>>> +        assert(active_disk->bs->drv && hidden_disk->bs->drv);
>>>    
>>> -        if (!s->active_disk->bs->drv->bdrv_make_empty ||
>>> -            !s->hidden_disk->bs->drv->bdrv_make_empty) {
>>> +        if (!active_disk->bs->drv->bdrv_make_empty ||
>>> +            !hidden_disk->bs->drv->bdrv_make_empty) {
>>>                error_setg(errp,
>>>                           "Active disk or hidden disk doesn't support make_empty");
>>>                aio_context_release(aio_context);
>>> @@ -541,6 +545,28 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>>>                return;
>>>            }
>>>    
>>> +        s->active_disk = active_disk;
>>> +
>>> +        bdrv_ref(hidden_disk->bs);
>>> +        s->hidden_disk = bdrv_attach_child(bs, hidden_disk->bs, "hidden disk",
>>> +                                           &child_of_bds, BDRV_CHILD_DATA,
>>> +                                           &local_err);
>>> +        if (local_err) {
>>> +            error_propagate(errp, local_err);
>>> +            aio_context_release(aio_context);
>>> +            return;
>>> +        }
>>
>> Ok, the point of creating hidden_disk is to call bdrv_make_empty on it.
>>
>>> +
>>> +        bdrv_ref(secondary_disk->bs);
>>> +        s->secondary_disk = bdrv_attach_child(bs, secondary_disk->bs,
>>> +                                              "secondary disk", &child_of_bds,
>>> +                                              BDRV_CHILD_DATA, &local_err);
>>> +        if (local_err) {
>>> +            error_propagate(errp, local_err);
>>> +            aio_context_release(aio_context);
>>> +            return;
>>> +        }
>>
>> But s->secondary_disk child is actually unused.. No reason to create it.
> 
> It is used, look closely at replication_co_writev().

Ah right, sorry. "base = s->secondary_disk" and next works with base. I see that now.

> 
> If the commit job (run during failover in replication_stop()) fails,
> replication enters "failover failed" state. In that state it writes
> directly to the secondary disk if possible (i.e. if the sector to write
> is not already allocated on the active or hidden disk).
> 
> It does this so the active and hidden disks don't grow larger, since in
> the COLO use-case they usually are put on a ramdisk with limited size.
> 
>>> +
>>>            /* start backup job now */
>>>            error_setg(&s->blocker,
>>>                       "Block device is in use by internal backup job");
>>> @@ -646,7 +672,9 @@ static void replication_done(void *opaque, int ret)
>>>            s->stage = BLOCK_REPLICATION_DONE;
>>>    
>>>            s->active_disk = NULL;
>>> +        bdrv_unref_child(bs, s->secondary_disk);
>>>            s->secondary_disk = NULL;
>>> +        bdrv_unref_child(bs, s->hidden_disk);
>>>            s->hidden_disk = NULL;
>>>            s->error = 0;
>>>        } else {
>>>    
>>
>> For me it looks like the good way to update is:
>>
>> 1. drop s->active_disk. it seems to be just a copy of bs->file, better to use bs->file directly, like other drivers do.
>> 2. reduce usage of s->hidden_disk and s->secondary_disk, like you do in this patch, using local variables instead. Also probably just drop s->secondary_disk..
>> 3. introduce a child, to be used with bdrv_make_empty(s->hidden_disk)
>>
>> And these are 3 separate patches. 1 and 2 may be merged, or instead 2 may be divided into two (to refactor secondary_disk and hidden_disk separately)..
> 
> Sound good, will do.
> 
>> Still, I'm not a maintainer of replication, neither I have good understanding of how it works, so don't take my advises to heart :)
>>
> 
> 
> 


-- 
Best regards,
Vladimir

