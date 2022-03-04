Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169304CD474
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 13:48:11 +0100 (CET)
Received: from localhost ([::1]:52508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ7Lt-0007Rz-14
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 07:48:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQ7IU-0006bN-01
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 07:44:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQ7IN-0002JF-4N
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 07:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646397868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ycYne/PBGKypxUZ4kwstAsTVqJaXvcZLGEckxTR29/0=;
 b=P6nxFHceRgrDhk3hbuGn5J1kjQZMDTak29pDNzj0RZrsWlD79lzuPAW/F7NF67hyboTtPq
 h0LvzwB4jX7k4/ViGBRODDFCJ1TJ2FZuIqhgWj5ZWOEmg8UjwxxDuP13vhBIGRAwNP5rr5
 Jr4NuDKouCO/3LV+LsJS/+ahdjhAEmM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-LdJzNP9jPLuJfRt11NsVcQ-1; Fri, 04 Mar 2022 07:44:27 -0500
X-MC-Unique: LdJzNP9jPLuJfRt11NsVcQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 i5-20020a056402054500b00415ce7443f4so3562174edx.12
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 04:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ycYne/PBGKypxUZ4kwstAsTVqJaXvcZLGEckxTR29/0=;
 b=66J6wR6cAEAWU2duWhXBRpiEfzGzrdK2dO54TP783MfjXpNTBmqnrhOU5pbPvwIfkk
 SmY5g1TmaR7EL5OlLFjbPzQMhW5sg+U3lbFQF1z2pqHWp9iHvcKPm0lzxAYQVcJqw44R
 rzmuLyQUV+sGI2/iM9WbPwGdEekFH4j11TPyRAUetxD36IVn9YpeXMXNNdngdQDmEMRb
 t+xGLd29Ie41HbzE8J82cxRjQjVK389c6hyI0zcmQKGRwUFn2DsR4BcdSzH9ULbHM4Y4
 wMZab6AY2q9/3i59yx5kYom2z+T0DJsbIebe/pKF92qVrh9uxayHbfWm+cItwPk9KsRA
 7AaA==
X-Gm-Message-State: AOAM5309CPkBmuvzX2o3kSKk8Ct87qR4NrQs9JahhIlKMrK8PYVHasrg
 NusGRtR/kIjG/Ch8AmY46cDpblV6nS8pzHGoy5e77vCoMFhd+QTCoVDymmY92byL7GxAbWySVC/
 UM/01QlHNRCFLKOA=
X-Received: by 2002:a17:906:b252:b0:6ce:41e2:5bb7 with SMTP id
 ce18-20020a170906b25200b006ce41e25bb7mr30334849ejb.179.1646397866093; 
 Fri, 04 Mar 2022 04:44:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBzbqavIhxa1J8ZTofzNCZ2ZWgFdiz9aNqxNPijg17Pw773gEGe0Sz8HUDYsDWhB9ISiSz4w==
X-Received: by 2002:a17:906:b252:b0:6ce:41e2:5bb7 with SMTP id
 ce18-20020a170906b25200b006ce41e25bb7mr30334823ejb.179.1646397865720; 
 Fri, 04 Mar 2022 04:44:25 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 rh13-20020a17090720ed00b006da69254082sm1709254ejb.135.2022.03.04.04.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 04:44:25 -0800 (PST)
Message-ID: <597e457f-2e41-8883-0bd0-97ccc49f17b4@redhat.com>
Date: Fri, 4 Mar 2022 13:44:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] block: Make bdrv_refresh_limits() non-recursive
To: Kevin Wolf <kwolf@redhat.com>
References: <20220216105355.30729-1-hreitz@redhat.com>
 <20220216105355.30729-2-hreitz@redhat.com> <YiDzOnUmNYy9sABR@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YiDzOnUmNYy9sABR@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.03.22 17:56, Kevin Wolf wrote:
> Am 16.02.2022 um 11:53 hat Hanna Reitz geschrieben:
>> bdrv_refresh_limits() recurses down to the node's children.  That does
>> not seem necessary: When we refresh limits on some node, and then
>> recurse down and were to change one of its children's BlockLimits, then
>> that would mean we noticed the changed limits by pure chance.  The fact
>> that we refresh the parent's limits has nothing to do with it, so the
>> reason for the change probably happened before this point in time, and
>> we should have refreshed the limits then.
>>
>> On the other hand, we do not have infrastructure for noticing that block
>> limits change after they have been initialized for the first time (this
>> would require propagating the change upwards to the respective node's
>> parents), and so evidently we consider this case impossible.
> I like your optimistic approach, but my interpretation would have been
> that this is simply a bug. ;-)
>
> blockdev-reopen allows changing options that affect the block limits
> (most importantly probably request_alignment), so this should be
> propagated to the parents. I think we'll actually not see failures if we
> forget to do this, but parents can either advertise excessive alignment
> requirements or they may run into RMW when accessing the child, so this
> would only affect performance. This is probably why nobody reported it
> yet.

Ah, right, I forgot this for parents of parents...  I thought the block 
limits of a node might change if its children list changes, and so we 
should bdrv_refresh_limits() when that children list changes, but forgot 
that we really do need to propagate this up, right.

>> If this case is impossible, then we will not need to recurse down in
>> bdrv_refresh_limits().  Every node's limits are initialized in
>> bdrv_open_driver(), and are refreshed whenever its children change.
>> We want to use the childrens' limits to get some initial default, but
>> we can just take them, we do not need to refresh them.
> I think even if we need to propagate to the parents, we still don't need
> to propagate to the children because the children have already been
> refreshed by whatever changed their options (like bdrv_reopen_commit()).
> And parent limits don't influence the child limits at all.
>
> So this patch looks good to me, just not the reasoning.

OK, so, uh, can we just drop these two paragraphs?  (“On the other 
hand...” and “If this case is impossible…”)

Or we could replace them with a note hinting at the potential bug that 
would need to be fixed, e.g.

“
Consequently, we should actually propagate block limits changes upwards,
not downwards.  That is a separate and pre-existing issue, though, and
so will not be addressed in this patch.
”

Question is, if we at some point do propagate this upwards, won’t this 
cause exactly the same problem that this patch is trying to get around, 
i.e. that we might call bdrv_refresh_limits() on non-drained parent nodes?

Hanna

> Kevin
>
>> The problem with recursing is that bdrv_refresh_limits() is not atomic.
>> It begins with zeroing BDS.bl, and only then sets proper, valid limits.
>> If we do not drain all nodes whose limits are refreshed, then concurrent
>> I/O requests can encounter invalid request_alignment values and crash
>> qemu.  Therefore, a recursing bdrv_refresh_limits() requires the whole
>> subtree to be drained, which is currently not ensured by most callers.
>>
>> A non-recursive bdrv_refresh_limits() only requires the node in question
>> to not receive I/O requests, and this is done by most callers in some
>> way or another:
>> - bdrv_open_driver() deals with a new node with no parents yet
>> - bdrv_set_file_or_backing_noperm() acts on a drained node
>> - bdrv_reopen_commit() acts only on drained nodes
>> - bdrv_append() should in theory require the node to be drained; in
>>    practice most callers just lock the AioContext, which should at least
>>    be enough to prevent concurrent I/O requests from accessing invalid
>>    limits
>>
>> So we can resolve the bug by making bdrv_refresh_limits() non-recursive.
>>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1879437
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> ---
>>   block/io.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/block/io.c b/block/io.c
>> index 4e4cb556c5..c3e7301613 100644
>> --- a/block/io.c
>> +++ b/block/io.c
>> @@ -189,10 +189,6 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
>>       QLIST_FOREACH(c, &bs->children, next) {
>>           if (c->role & (BDRV_CHILD_DATA | BDRV_CHILD_FILTERED | BDRV_CHILD_COW))
>>           {
>> -            bdrv_refresh_limits(c->bs, tran, errp);
>> -            if (*errp) {
>> -                return;
>> -            }
>>               bdrv_merge_limits(&bs->bl, &c->bs->bl);
>>               have_limits = true;
>>           }
>> -- 
>> 2.34.1
>>


