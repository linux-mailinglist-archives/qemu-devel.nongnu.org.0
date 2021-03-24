Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563BB34787E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 13:28:20 +0100 (CET)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP2cU-00058t-Ql
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 08:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lP2ad-0004cl-JA; Wed, 24 Mar 2021 08:26:23 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:42412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lP2aa-0001Z3-7E; Wed, 24 Mar 2021 08:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=lIL+OKw/7C13NOI2FJOhiqbMZqhwZeakdoSHSOeq3pE=; 
 b=kL5/HavM0TmFIZYfGlpbcg4hMnOtrBRuYZ0mj30YH+xpd9a593DD0dWJQ/3d04h5ukRa194clBIIpu8lcZ4uGYfKEaAgZnm/yDRAAPuKd52h8BUTRyabgOXayUYUvjwPlMwrO1o1ENu2Lt5UJBgI6xNBs7DgPoB35o/2mWqwB40rIPeH8BWvxKw1mUrg/zyaWZmSZACwWuiAXvY71ECZHiJn2+WheCYdBatvkWRUW5wm1WT563wpZvUxdh5SJHkXTfULDGPKr1nUwcjd5RkYNF3VUv/q5R9wdtaVDCbNEZTNdfuS5VgDoDcKnU5Q1U5inyFg7Qe+4434MnWQ3JjDaA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lP2aA-000172-CI; Wed, 24 Mar 2021 13:25:54 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1lP2aA-0003gQ-2f; Wed, 24 Mar 2021 13:25:54 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 2/6] block: Allow changing bs->file on reopen
In-Reply-To: <1a4ca40e-5924-4bef-d8b7-6a6b3eac32f5@virtuozzo.com>
References: <cover.1616000692.git.berto@igalia.com>
 <31ccb1061199ee11bf9879f6c60608a19b83263d.1616000692.git.berto@igalia.com>
 <1a4ca40e-5924-4bef-d8b7-6a6b3eac32f5@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 24 Mar 2021 13:25:54 +0100
Message-ID: <w515z1gviul.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 18 Mar 2021 03:25:07 PM CET, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>>   static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
>>                                  BlockReopenQueue *queue,
>> -                               Transaction *set_backings_tran, Error **errp);
>> +                               Transaction *tran, Error **errp);
>
> I'd not call it just "tran" to not interfere with transaction
> actions. Of course, reopen should be finally refactored to work
> cleanly on Transaction API, but that is not done yet. And here we pass
> a transaction pointer only to keep children modification.. So, let's
> make it change_child_tran, or something like this.

The name change looks good to me.

>> +        } else if (bdrv_recurse_has_child(new_child_bs, bs)) {
>> +            error_setg(errp, "Making '%s' a %s of '%s' would create a cycle",
>> +                       str, parse_file ? "file" : "backing file",
>
> maybe s/"file"/"file child"/

Ok.

>>       default:
>> -        /* 'backing' does not allow any other data type */
>> +        /* The options QDict has been flattened, so 'backing' and 'file'
>> +         * do not allow any other data type here. */
>
> checkpatch should complain that you didn't fix style of the comment...

I actually don't like to use the proposed style for 2-line comments in
many cases. I think it makes sense for big comment blocks but adds noise
for shorter comments.

>> +    } else {
>> +        /*
>> +         * Ensure that @bs can really handle backing files, because we are
>> +         * about to give it one (or swap the existing one)
>> +         */
>> +        if (bs->drv->is_filter) {
>> +            /* Filters always have a file or a backing child */
>
> Probably we can assert bs->backing, as otherwise backing option should
> be unsupported [preexisting, not about this patch]

Yes, I see that this was added in commit 1d42f48c3a, maybe Max has good
reasons to keep it this way?

>>           if (bdrv_is_backing_chain_frozen(overlay_bs,
>> -                                         child_bs(overlay_bs->backing), errp))
>> +                                         bdrv_filter_or_cow_bs(overlay_bs),
>> +                                         errp))
>>           {
>>               return -EPERM;
>>           }

I just realized that this part is probably not ok if you want to change
bs->file on a node that is not a filter, because this would check
bs->backing->frozen and not bs->file->frozen.

>> +        if (parse_file) {
>> +            /* Store the old file bs, we'll need to refresh its permissions */
>> +            reopen_state->old_file_bs = bs->file->bs;
>> +
>> +            /* And finally replace the child */
>> +            bdrv_replace_child(bs->file, new_child_bs, tran);
>
> I think that actually, we need also to update inherits_from and do
> refresh_limits like in bdrv_set_backing_noperm().

Yes, I think you're right.

> Probably, bdrv_replace_child should do it. Probably not (there are
> still a lot of things to refactor in block.c :)..
>
> Hm. Also, using blockdev-reopen probably means that we are in a
>blockdev word, so we should not care about inherits_from here.

But with blockdev-reopen we do update inherits_from for backing files,
don't we?

> Also, you don't create reopen_state->replace_file_bs, like for
> backing.. On bdrv_reopen_comnmit replace_backing_bs is used to remove
> corresponding options.. Shouldn't we do the same with file options?

I think you're right.

>> -        self.reopen(opts, {'file': 'not-found'}, "Cannot change the option 'file'")
>> -        self.reopen(opts, {'file': ''}, "Cannot change the option 'file'")
>> +        self.reopen(opts, {'file': 'not-found'}, "Cannot find device='' nor node-name='not-found'")
>
> Interesting that error-message say about device='', not 'not-found'...

That's because 'file' refers to a node name.

Thanks for reviewing,

Berto

