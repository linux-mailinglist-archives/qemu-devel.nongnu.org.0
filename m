Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0650B6FDEB4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:39:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwk0i-0001Lt-Bo; Wed, 10 May 2023 09:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pwk0e-0001Ku-Lg; Wed, 10 May 2023 09:37:36 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pwk0Z-0007OY-8u; Wed, 10 May 2023 09:37:36 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 0EC485FE0D;
 Wed, 10 May 2023 16:37:20 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:2::1:11] (unknown [2a02:6b8:b081:2::1:11])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (smtpcorp/Yandex) with ESMTPSA id IbVI0S1Ml0U0-yg8XpQYq; 
 Wed, 10 May 2023 16:37:19 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683725839; bh=iYnZCdNnbAcZ/F9gFnVXPQxcqplLyTzR1NZhYoiqc8s=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=WCHShLk5sH5j2TdMtDBArslhdlE+JDROs86r2gZU+/EkYWD8Jt3Y5z191uNidShO0
 d+1tXKVV2buw5Jh6/lQeypcqjNsT1XlF+TycyY+TWM2iN8VzHf94bbMJlysZPgYS+A
 QiNGZ0pDTb6lgTdbpWq98O59dtwhFxNvGdWIir0o=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <ac9d5962-b67e-4607-d0b6-f057a6b77d53@yandex-team.ru>
Date: Wed, 10 May 2023 16:37:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 5/5] blockdev: qmp_transaction: drop extra generic layer
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 den@openvz.org, alexander.ivanov@virtuozzo.com
References: <20230421115327.907104-1-vsementsov@yandex-team.ru>
 <20230421115327.907104-6-vsementsov@yandex-team.ru>
 <ZFuESuz8bRcElXaF@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <ZFuESuz8bRcElXaF@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10.05.23 14:47, Kevin Wolf wrote:
> Am 21.04.2023 um 13:53 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Let's simplify things:
>>
>> First, actions generally don't need access to common BlkActionState
>> structure. The only exclusion are backup actions that need
>> block_job_txn.
>>
>> Next, for transaction actions of Transaction API is more native to
>> allocated state structure in the action itself.
>>
>> So, do the following transformation:
>>
>> 1. Let all actions be represented by a function with corresponding
>>     structure as arguments.
>>
>> 2. Instead of array-map marshaller, let's make a function, that calls
>>     corresponding action directly.
>>
>> 3. BlkActionOps and BlkActionState structures become unused
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
>> @@ -1973,11 +1910,9 @@ static void blockdev_backup_clean(void *opaque)
>>   }
>>   
>>   typedef struct BlockDirtyBitmapState {
>> -    BlkActionState common;
>>       BdrvDirtyBitmap *bitmap;
>>       BlockDriverState *bs;
>>       HBitmap *backup;
>> -    bool prepared;
>>       bool was_enabled;
>>   } BlockDirtyBitmapState;
>>   
>> @@ -1987,17 +1922,14 @@ TransactionActionDrv block_dirty_bitmap_add_drv = {
>>       .clean = g_free,
>>   };
>>   
>> -static void block_dirty_bitmap_add_action(BlkActionState *common,
>> +static void block_dirty_bitmap_add_action(BlockDirtyBitmapAdd *action,
>>                                             Transaction *tran, Error **errp)
>>   {
>>       Error *local_err = NULL;
>> -    BlockDirtyBitmapAdd *action;
>> -    BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
>> -                                             common, common);
>> +    BlockDirtyBitmapState *state = g_new0(BlockDirtyBitmapState, 1);
>>   
>>       tran_add(tran, &block_dirty_bitmap_add_drv, state);
>>   
>> -    action = common->action->u.block_dirty_bitmap_add.data;
>>       /* AIO context taken and released within qmp_block_dirty_bitmap_add */
>>       qmp_block_dirty_bitmap_add(action->node, action->name,
>>                                  action->has_granularity, action->granularity,
>> @@ -2006,7 +1938,8 @@ static void block_dirty_bitmap_add_action(BlkActionState *common,
>>                                  &local_err);
>>   
>>       if (!local_err) {
>> -        state->prepared = true;
>> +        state->bitmap = block_dirty_bitmap_lookup(action->node, action->name,
>> +                                                  NULL, &error_abort);
>>       } else {
>>           error_propagate(errp, local_err);
>>       }
>> @@ -2014,15 +1947,10 @@ static void block_dirty_bitmap_add_action(BlkActionState *common,
>>   
>>   static void block_dirty_bitmap_add_abort(void *opaque)
>>   {
>> -    BlockDirtyBitmapAdd *action;
>>       BlockDirtyBitmapState *state = opaque;
>>   
>> -    action = state->common.action->u.block_dirty_bitmap_add.data;
>> -    /* Should not be able to fail: IF the bitmap was added via .prepare(),
>> -     * then the node reference and bitmap name must have been valid.
>> -     */
>> -    if (state->prepared) {
>> -        qmp_block_dirty_bitmap_remove(action->node, action->name, &error_abort);
>> +    if (state->bitmap) {
>> +        bdrv_release_dirty_bitmap(state->bitmap);
>>       }
>>   }
> 
> So you're moving the lookup of the bitmap from .abort to .prepare (or
> *_action now). I'm not entirely sure how this is related to the goal of
> this specific patch. So the first question is, should it be separate?
> 
> The second question is if it is right. Moving it like this means we must
> be sure that the bitmap can't be deleted between the lookup and the
> .abort call. How can we guarantee this?
> 
> On the other hand, we already used &error_abort before, so the
> assumption isn't actually new. Just the failure mode changes from
> abort() to accessing a dangling pointer, which could be a bit worse.

Agree, that's a tricky place and better be handled separately.

> 
> The rest of the patch looks good.
> 
> Kevin
> 

Thanks for reviewing, I'll resend soon.

-- 
Best regards,
Vladimir


