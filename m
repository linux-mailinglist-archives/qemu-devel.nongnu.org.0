Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D976545049
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:10:57 +0200 (CEST)
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJoG-0003vc-II
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nzIOg-000135-9T; Thu, 09 Jun 2022 09:40:27 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:53226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nzIOb-0003vQ-1r; Thu, 09 Jun 2022 09:40:24 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 09F462E1349;
 Thu,  9 Jun 2022 16:40:06 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 dDVLdICiwW-e5KuYid9; Thu, 09 Jun 2022 16:40:05 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654782005; bh=GOOlB9v75UV5QTzDCoefehBMfr/S+5mer6FSvrEaPvs=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=uwwp48uvNIhdMKdlIpHIbBHCZmhngYfOh519p7NhXx+OvJ9LBMIkBvYfE/oiFmcGL
 WJKGVEbYows6faqXypyIGLCs9TvoiF6vZ4BTB+WFYAAD12UzQcTBxnL/EyukN6poYi
 agw1YBgyRuR9teok3Nd2HeZ2Zu2xtN3w5dKjIzAk=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [172.31.114.224] (172.31.114.224-vpn.dhcp.yndx.net
 [172.31.114.224])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 yebY6pEVqt-e5NW9P49; Thu, 09 Jun 2022 16:40:05 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <b67d8787-4a0c-3760-e9b4-18f8b51ac036@yandex-team.ru>
Date: Thu, 9 Jun 2022 16:40:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 13/45] block: Manipulate bs->file / bs->backing
 pointers in .attach/.detach
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-14-vsementsov@openvz.org>
 <7a406052-6b47-982e-3480-6aac9a8393bc@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <7a406052-6b47-982e-3480-6aac9a8393bc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/7/22 18:55, Hanna Reitz wrote:
> On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
>> bs->file and bs->backing are a kind of duplication of part of
>> bs->children. But very useful diplication, so let's not drop them at
>> all:)
>>
>> We should manage bs->file and bs->backing in same place, where we
>> manage bs->children, to keep them in sync.
>>
>> Moreover, generic io paths are unprepared to BdrvChild without a bs, so
>> it's double good to clear bs->file / bs->backing when we detach the
>> child.
> 
> I think this was reproducible (rarely) with 030, but I can’t reproduce it now.  Oh well.
> 
>> Detach is simple: if we detach bs->file or bs->backing child, just
>> set corresponding field to NULL.
>>
>> Attach is a bit more complicated. But we still can precisely detect
>> should we set one of bs->file / bs->backing or not:
>>
>> - if role is BDRV_CHILD_COW, we definitely deal with bs->backing
>> - else, if role is BDRV_CHILD_FILTERED (it must be also
>>    BDRV_CHILD_PRIMARY), it's a filtered child. Use
>>    bs->drv->filtered_child_is_backing to chose the pointer field to
>>    modify.
>> - else, if role is BDRV_CHILD_PRIMARY, we deal with bs->file
>> - in all other cases, it's neither bs->backing nor bs->file. It's some
>>    other child and we shouldn't care
> 
> Sounds correct.
> 
>> OK. This change brings one more good thing: we can (and should) get rid
>> of all indirect pointers in the block-graph-change transactions:
>>
>> bdrv_attach_child_common() stores BdrvChild** into transaction to clear
>> it on abort.
>>
>> bdrv_attach_child_common() has two callers: bdrv_attach_child_noperm()
>> just pass-through this feature, bdrv_root_attach_child() doesn't need
>> the feature.
>>
>> Look at bdrv_attach_child_noperm() callers:
>>    - bdrv_attach_child() doesn't need the feature
>>    - bdrv_set_file_or_backing_noperm() uses the feature to manage
>>      bs->file and bs->backing, we don't want it anymore
>>    - bdrv_append() uses the feature to manage bs->backing, again we
>>      don't want it anymore
>>
>> So, we should drop this stuff! Great!
>>
>> We still keep BdrvChild** argument to return the child and int return
>> value, and not move to simply returning BdrvChild*, as we don't want to
>> lose int return values.
>>
>> However we don't require *@child to be NULL anymore, and even allow
>> @child to be NULL, if caller don't need the new child pointer.
>>
>> Finally, we now set .file / .backing automatically in generic code and
>> want to restring setting them by hand outside of .attach/.detach.
>> So, this patch cleanups all remaining places where they were set.
>> To find such places I use:
>>
>>    git grep '\->file ='
>>    git grep '\->backing ='
>>    git grep '&.*\<backing\>'
>>    git grep '&.*\<file\>'
> 
> Awesome.
> 
> block/snapshot-access.c needs a touchup, but other than that, this still seems to hold.
> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> ---
>>   block.c                          | 156 ++++++++++++++-----------------
>>   block/raw-format.c               |   4 +-
>>   block/snapshot.c                 |   1 -
>>   include/block/block_int-common.h |  15 ++-
>>   tests/unit/test-bdrv-drain.c     |  10 +-
>>   5 files changed, 89 insertions(+), 97 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 8e8ed639fe..6b43e101a1 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -1438,9 +1438,33 @@ static void bdrv_child_cb_attach(BdrvChild *child)
>>       assert_bdrv_graph_writable(bs);
>>       QLIST_INSERT_HEAD(&bs->children, child, next);
>> -
>> -    if (child->role & BDRV_CHILD_COW) {
>> +    if (bs->drv->is_filter | (child->role & BDRV_CHILD_FILTERED)) {
> 
> Should be `||`.
> 
>> +        /*
>> +         * Here we handle filters and block/raw-format.c when it behave like
>> +         * filter.
> 
> I’d like this comment to expand on how they are handled.
> 
> For example, that they generally have a single PRIMARY child, which is also the FILTERED child, and that they may have multiple more children, but none of them will be a COW child.  So bs->file will be the PRIMARY child, unless the PRIMARY child goes into bs->backing on exceptional cases; and bs->backing will be nothing else.  (Which is why we ignore all other children.)
> 
>> +         */
>> +        assert(!(child->role & BDRV_CHILD_COW));
>> +        if (child->role & (BDRV_CHILD_PRIMARY | BDRV_CHILD_FILTERED)) {
> 
> Why do we check for FILTERED here?  It appears to me that PRIMARY is the flag that tells us to put this child into bs->file (but for filters, sometimes we have to make an exception and put it into bs->backing).
> 
> Is the check for FILTERED just a safeguard, so that filter drivers always set the two in tandem?  If so, I’d make the condition just `role & PRIMARY` and then in an `else` path assert that `!(role & FILTERED)`.

Agree

> 
>> +            assert(child->role & BDRV_CHILD_PRIMARY);
>> +            assert(child->role & BDRV_CHILD_FILTERED);
>> +            assert(!bs->backing);
>> +            assert(!bs->file);
>> +
>> +            if (bs->drv->filtered_child_is_backing) {
>> +                bs->backing = child;
>> +            } else {
>> +                bs->file = child;
>> +            }
>> +        }
> 
> [...]
> 
>> @@ -2897,11 +2925,11 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
>>   /*
>>    * Common part of attaching bdrv child to bs or to blk or to job
>>    *
>> - * Resulting new child is returned through @child.
>> - * At start *@child must be NULL.
>> - * @child is saved to a new entry of @tran, so that *@child could be reverted to
>> - * NULL on abort(). So referenced variable must live at least until transaction
>> - * end.
>> + * If @child is not NULL, it's set to new created child. Note, that @child
>> + * pointer is stored in the transaction and therefore not cleared on abort.
> 
> I can’t quite parse this comment.  It doesn’t look like `child` is stored in the transaction.  I mean, `new_child` is, which is what `*child` is, but there’s a difference between `@child` and `*child` (or `*@child`) after all.
> 
> Or is there a “not” missing, i.e. “that the @child pointer is not stored in the transaction”?  That would also make more sense, why it isn’t cleared on abort.

Yes, "not" is missing, sorry)

> 
> I’d also like to ask for this to be even more clear, e.g. by adding a sentence “When this transaction is aborted, the pointer stored in *@child becomes invalid.”

OK

> 
>> + * Consider @child as part of return value: we may change the return value of
>> + * the function to BdrvChild* and return child directly, but this way we lose
>> + * different return codes.
> 
> I mean, do we even care about return codes?  I hope not, but maybe we do?  We do have `errp` for a description, and I think the only distinction we make in the block layer based on error codes is ENOSPC vs. anything else.  I hope this function never returns ENOSPC, so I think the return value shouldn’t matter.
> 
> (I can understand that it seems like a loss if we can no longer decide between e.g. EINVAL and EPERM, but I don’t think it really is.  We could just make it EINVAL always and it shouldn’t matter.)
> 

Hmm. Seems reasonable. I'll check if we can move to simply return the child.


-- 
Best regards,
Vladimir

