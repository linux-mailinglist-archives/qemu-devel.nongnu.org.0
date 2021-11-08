Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30BF447D32
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 11:01:28 +0100 (CET)
Received: from localhost ([::1]:39522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk1Sw-0006ym-1E
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 05:01:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mk1Pt-0005X9-QR
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:58:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mk1Pr-00061F-50
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636365491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n4LNuYKMe+i/F724lFZ6rN+VbgAELl+YSQiML9yKhYE=;
 b=dANzS8i7rLr0mg2B8eTQKUj1pPAu9Gz6hfpWeoD5SOInWxXIubgF5FUqAVQgUD/e0bgLWQ
 EQqH/zhanABzNNJMVg8RSQWnYu8TBF2x1JBdAcR6CI1ivZeMDKf2Khc5HJ0EuGBlslXV0p
 vnxaRP0WnLUips4DTE/iRiLhXq9TTNo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-df-I5SgFNrqdyxcTHTxeyg-1; Mon, 08 Nov 2021 04:58:09 -0500
X-MC-Unique: df-I5SgFNrqdyxcTHTxeyg-1
Received: by mail-wr1-f69.google.com with SMTP id
 j12-20020adf910c000000b0015e4260febdso3854987wrj.20
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 01:58:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n4LNuYKMe+i/F724lFZ6rN+VbgAELl+YSQiML9yKhYE=;
 b=wvhhKvzTcbQNmofMlQDr8zdCaQEFU6et9Jnq6z2JFlQqQcka6+W4ipFSLgADCXMS1H
 KV9ORDQWH68gkUBVWzEmlwVQcpB1XdgK9Ax9WF+cuT5/GarDbDEPNj3B04W3+/3vANJG
 19VwWG7hVoAfdhTywgy4V9c7+1vumjIIFWcxih/QSxeG1KIPPkJmixa9P2eAU40UFzvd
 C9sv3AG64axBf3/nsj23vJwL8ij5yAiclUFdm0Hn5UYmb7w8v5Jq8UFuVpW1/Aeam7Iv
 S2H4V98qLdN8xh33jnayqKHwbaXGIxo9nWlR4pkCXuO7jcJlQ5ICoFIuxTY6/W/kK7BY
 ZsLw==
X-Gm-Message-State: AOAM531GaGUhtC/p4SW32rCuwJQS7stQpXcc9qyMvXlJKnqWDohAm5XX
 S4L1OG3njP2GbLmUmyvePswulTPzP4Sp6nKmj/4NAqYC5Frmbi1Wd0pXstq9o3mP0uh/KnUPW2l
 q0qMQw/hU/nnbhBI=
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr51347959wml.6.1636365488566; 
 Mon, 08 Nov 2021 01:58:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWvN6ETfvabGcIa5r7nwRSC95gz+k8oFJGznF0vyluLGbV0YERREEWhFA6kepYwuEVscBgMw==
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr51347938wml.6.1636365488324; 
 Mon, 08 Nov 2021 01:58:08 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id q4sm16466877wrs.56.2021.11.08.01.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 01:58:07 -0800 (PST)
Message-ID: <f2b1abfc-707a-c9c7-e3cd-57fa1cac984b@redhat.com>
Date: Mon, 8 Nov 2021 10:58:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/7] block: Pass BdrvChild ** to replace_child_noperm
To: Kevin Wolf <kwolf@redhat.com>
References: <20211104103849.46855-1-hreitz@redhat.com>
 <20211104103849.46855-6-hreitz@redhat.com> <YYVKkd1giB7eZ0k2@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YYVKkd1giB7eZ0k2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.11.21 16:15, Kevin Wolf wrote:
> Am 04.11.2021 um 11:38 hat Hanna Reitz geschrieben:
>> bdrv_replace_child_noperm() modifies BdrvChild.bs, and can potentially
>> set it to NULL.  That is dangerous, because BDS parents generally assume
>> that their children's .bs pointer is never NULL.  We therefore want to
>> let bdrv_replace_child_noperm() set the corresponding BdrvChild pointer
>> to NULL, too.
>>
>> This patch lays the foundation for it by passing a BdrvChild ** pointer
>> to bdrv_replace_child_noperm() so that it can later use it to NULL the
>> BdrvChild pointer immediately after setting BdrvChild.bs to NULL.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   block.c | 59 ++++++++++++++++++++++++++++++++-------------------------
>>   1 file changed, 33 insertions(+), 26 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 6d230ad3d1..ff45447686 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -87,7 +87,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
>>   static bool bdrv_recurse_has_child(BlockDriverState *bs,
>>                                      BlockDriverState *child);
>>   
>> -static void bdrv_replace_child_noperm(BdrvChild *child,
>> +static void bdrv_replace_child_noperm(BdrvChild **child,
>>                                         BlockDriverState *new_bs);
>>   static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
>>                                                 BdrvChild *child,
>> @@ -2254,6 +2254,7 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
>>   
>>   typedef struct BdrvReplaceChildState {
>>       BdrvChild *child;
>> +    BdrvChild **childp;
> Would it be clearer to rename child to old_child now that it can be
> changed?
>
> I would also consider having childp first because this is really the
> object that we're modifying and potentially rolling back now.
>
>>       BlockDriverState *old_bs;
>>   } BdrvReplaceChildState;
>>   
>> @@ -2269,8 +2270,8 @@ static void bdrv_replace_child_abort(void *opaque)
>>       BdrvReplaceChildState *s = opaque;
>>       BlockDriverState *new_bs = s->child->bs;
>>   
>> -    /* old_bs reference is transparently moved from @s to @s->child */
>> -    bdrv_replace_child_noperm(s->child, s->old_bs);
>> +    /* old_bs reference is transparently moved from @s to *s->childp */
>> +    bdrv_replace_child_noperm(s->childp, s->old_bs);
>>       bdrv_unref(new_bs);
>>   }
>>   
>> @@ -2287,21 +2288,23 @@ static TransactionActionDrv bdrv_replace_child_drv = {
>>    *
>>    * The function doesn't update permissions, caller is responsible for this.
>>    */
>> -static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
>> +static void bdrv_replace_child_tran(BdrvChild **childp,
>> +                                    BlockDriverState *new_bs,
>>                                       Transaction *tran)
>>   {
>>       BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
>>       *s = (BdrvReplaceChildState) {
>> -        .child = child,
>> -        .old_bs = child->bs,
>> +        .child = *childp,
>> +        .childp = childp,
>> +        .old_bs = (*childp)->bs,
>>       };
>>       tran_add(tran, &bdrv_replace_child_drv, s);
>>   
>>       if (new_bs) {
>>           bdrv_ref(new_bs);
>>       }
>> -    bdrv_replace_child_noperm(child, new_bs);
>> -    /* old_bs reference is transparently moved from @child to @s */
>> +    bdrv_replace_child_noperm(childp, new_bs);
>> +    /* old_bs reference is transparently moved from *childp to @s */
>>   }
>>   
>>   /*
>> @@ -2672,9 +2675,10 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
>>       return permissions[qapi_perm];
>>   }
>>   
>> -static void bdrv_replace_child_noperm(BdrvChild *child,
>> +static void bdrv_replace_child_noperm(BdrvChild **childp,
>>                                         BlockDriverState *new_bs)
>>   {
>> +    BdrvChild *child = *childp;
>>       BlockDriverState *old_bs = child->bs;
>>       int new_bs_quiesce_counter;
>>       int drain_saldo;
>> @@ -2767,7 +2771,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
>>       BdrvChild *child = *s->child;
>>       BlockDriverState *bs = child->bs;
>>   
>> -    bdrv_replace_child_noperm(child, NULL);
>> +    bdrv_replace_child_noperm(s->child, NULL);
>>   
>>       if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
>>           bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
>> @@ -2867,7 +2871,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
>>       }
>>   
>>       bdrv_ref(child_bs);
>> -    bdrv_replace_child_noperm(new_child, child_bs);
>> +    bdrv_replace_child_noperm(&new_child, child_bs);
>>   
>>       *child = new_child;
>>   
>> @@ -2927,12 +2931,12 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
>>       return 0;
>>   }
>>   
>> -static void bdrv_detach_child(BdrvChild *child)
>> +static void bdrv_detach_child(BdrvChild **childp)
>>   {
>> -    BlockDriverState *old_bs = child->bs;
>> +    BlockDriverState *old_bs = (*childp)->bs;
>>   
>> -    bdrv_replace_child_noperm(child, NULL);
>> -    bdrv_child_free(child);
>> +    bdrv_replace_child_noperm(childp, NULL);
>> +    bdrv_child_free(*childp);
>>   
>>       if (old_bs) {
>>           /*
>> @@ -3038,7 +3042,7 @@ void bdrv_root_unref_child(BdrvChild *child)
>>       BlockDriverState *child_bs;
>>   
>>       child_bs = child->bs;
>> -    bdrv_detach_child(child);
>> +    bdrv_detach_child(&child);
>>       bdrv_unref(child_bs);
>>   }
>>   
>> @@ -4891,30 +4895,33 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
>>                                                 BdrvChild *child,
>>                                                 Transaction *tran)
>>   {
>> +    BdrvChild **childp;
>>       BdrvRemoveFilterOrCowChild *s;
>>   
>> -    assert(child == bs->backing || child == bs->file);
>> +    if (child == bs->backing) {
>> +        childp = &bs->backing;
>> +    } else if (child == bs->file) {
>> +        childp = &bs->file;
>> +    } else {
>> +        g_assert_not_reached();
>> +    }
>>   
>>       if (!child) {
>>           return;
>>       }
>>   
>>       if (child->bs) {
>> -        bdrv_replace_child_tran(child, NULL, tran);
>> +        bdrv_replace_child_tran(childp, NULL, tran);
>>       }
>>   
>>       s = g_new(BdrvRemoveFilterOrCowChild, 1);
>>       *s = (BdrvRemoveFilterOrCowChild) {
>>           .child = child,
>> -        .is_backing = (child == bs->backing),
>> +        .is_backing = (childp == &bs->backing),
>>       };
>>       tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
>>   
>> -    if (s->is_backing) {
>> -        bs->backing = NULL;
>> -    } else {
>> -        bs->file = NULL;
>> -    }
>> +    *childp = NULL;
>>   }
> Hmm... This looks a bit dangerous. Is it guaranteed that bs lives until
> the end of the transaction? I guess it has to because we want to be able
> to roll back, so probably this is okay, though I'm not sure if I would
> bet money on it.

Well, if it should live long enough, a bdrv_ref()+unref() definitely 
shouldn’t hurt.

> But...
>
>> @@ -4950,7 +4957,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
>>                          c->name, from->node_name);
>>               return -EPERM;
>>           }
>> -        bdrv_replace_child_tran(c, to, tran);
>> +        bdrv_replace_child_tran(&c, to, tran);
>>       }
> ...here, c is a local stack variable that is even reused in a loop.
> bdrv_replace_child_tran() now keeps a pointer to the same variable in
> the transaction state for each BdrvChild in the whole parent list, and
> by the time the transaction is finalised, I think they are all dangling
> pointers anyway because they pointed to stack variables in a function
> that has already returned.

Oh no.  Yes, that’s a bit of a problem...

> bdrv_replace_child_tran() should probably have a comment like we already
> have in bdrv_attach_child_common():
>
>   * @child is saved to a new entry of @tran, so that *@child could be reverted to
>   * NULL on abort(). So referenced variable must live at least until transaction
>   * end.

Right.  Now just to figure out how to solve the concrete problem... :/

(Yes, a borrow checker would’ve helped :))

Hanna


