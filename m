Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC4D62415A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 12:27:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot5hj-0003xw-09; Thu, 10 Nov 2022 06:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ot5gX-0003r3-MR; Thu, 10 Nov 2022 06:25:33 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ot5gS-0008WT-HC; Thu, 10 Nov 2022 06:25:26 -0500
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id E76526088E;
 Thu, 10 Nov 2022 14:25:10 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b536::1:14] (unknown
 [2a02:6b8:b081:b536::1:14])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 R2teZNVAxr-P9OGbgRx; Thu, 10 Nov 2022 14:25:10 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668079510; bh=qod0imQkL8+TvcA/UoZbc/+uU1BAOwxqQ2XPtIfWEzY=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=lW2CNoT1fks5i05Rtzj6e47dwZZBtQDD3PBlu8HU/R33Truzz2vQgIl1lmdtIEf2G
 NExOfYCebeqJ6kqtA1eq/m4U2s+q17TndU/5NqYXZSceLTFDiBcLpGkpSpU5GT78ca
 0wVMKN2d1BEfABzvW17uuTuuySLilQzR4qkCzp08=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <ad3b4250-a0e3-10fa-aea4-4e98a6e10ac5@yandex-team.ru>
Date: Thu, 10 Nov 2022 14:25:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 08/13] stream: Replace subtree drain with a single node
 drain
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-9-kwolf@redhat.com>
 <f44e394a-e447-dae1-5ee8-c5b1a34f6db8@yandex-team.ru>
 <Y2zPYbwEAqbg68KJ@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <Y2zPYbwEAqbg68KJ@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/10/22 13:16, Kevin Wolf wrote:
> Am 09.11.2022 um 17:52 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> On 11/8/22 15:37, Kevin Wolf wrote:
>>> The subtree drain was introduced in commit b1e1af394d9 as a way to avoid
>>> graph changes between finding the base node and changing the block graph
>>> as necessary on completion of the image streaming job.
>>>
>>> The block graph could change between these two points because
>>> bdrv_set_backing_hd() first drains the parent node, which involved
>>> polling and can do anything.
>>>
>>> Subtree draining was an imperfect way to make this less likely (because
>>> with it, fewer callbacks are called during this window). Everyone agreed
>>> that it's not really the right solution, and it was only committed as a
>>> stopgap solution.
>>>
>>> This replaces the subtree drain with a solution that simply drains the
>>> parent node before we try to find the base node, and then call a version
>>> of bdrv_set_backing_hd() that doesn't drain, but just asserts that the
>>> parent node is already drained.
>>>
>>> This way, any graph changes caused by draining happen before we start
>>> looking at the graph and things stay consistent between finding the base
>>> node and changing the graph.
>>>
>>> Signed-off-by: Kevin Wolf<kwolf@redhat.com>
>> [..]
>>
>>>        base = bdrv_filter_or_cow_bs(s->above_base);
>>> -    if (base) {
>>> -        bdrv_ref(base);
>>> -    }
>>> -
>>>        unfiltered_base = bdrv_skip_filters(base);
>>>        if (bdrv_cow_child(unfiltered_bs)) {
>>> @@ -82,7 +85,7 @@ static int stream_prepare(Job *job)
>>>                }
>>>            }
>>> -        bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
>>> +        bdrv_set_backing_hd_drained(unfiltered_bs, base, &local_err);
>>>            ret = bdrv_change_backing_file(unfiltered_bs, base_id, base_fmt, false);
>> If we have yield points / polls during bdrv_set_backing_hd_drained()
>> and bdrv_change_backing_file(), it's still bad and another
>> graph-modifying operation may interleave. But b1e1af394d9 reports only
>> polling in bdrv_set_backing_hd(), so I think it's OK to not care about
>> other cases.
> At this point in the series, bdrv_replace_child_noperm() can indeed
> still poll. I'm not sure how bad it is, but at this point we're already
> reconfiguring the graph with two specific nodes and somehow this poll
> hasn't caused problems in the past. Anyway, at the end of the series,
> there isn't be any polling left in bdrv_set_backing_hd_drained(), as far
> as I can tell.
> 
> bdrv_change_backing_file() will certainly poll because it does I/O to
> the image file. However, the change to the graph is completed at that
> point, so I don't think it's a problem. Do you think it would be worth
> putting a comment before bdrv_change_backing_file() that mentions that
> the graph may change again from here on, but we've completed the graph
> change?
> 

Comment won't hurt. I think theoretically that's possible that we

1. change the graph
2. yield in bdrv_change_backing_file
3. switch to another graph-modifying operation, change backing file and do another bdrv_change_backing_file()
4. return to bdrv_change_backing_file() of [2] and write wrong backing file to metadata

And the only solution for such things that I can imagine is a kind of global graph-modifying lock, which should be held around the whole graph modifying operation, including writing metadata. Probably, we shouldn't care until we have real bug reports of it. Actually I hope that the only user who start stream and commit jobs in parallel on same backing-chain is our iotests :)


-- 
Best regards,
Vladimir


