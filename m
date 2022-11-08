Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7890F6217B3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 16:11:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osQEp-0007gp-PA; Tue, 08 Nov 2022 10:10:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1osQEn-0007fn-7Y
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:10:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1osQEi-0000Yf-Ao
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667920199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iX8mlAmhn5310S/jAwu9TW8aoDgjKU6vqHLKB+ztTjQ=;
 b=XybKsMtOkcoew6jkpKBxkkPuQildIP7n/8bLxxZ1YwDotpDqcjtjTVB5w+bPRtGbwABN8d
 fQ9tVqFCy48GoCBgzU/tn1Yfc/VHqMylmHNFQSei58hQgZp+JZCpxTitnAgKMegii1GqNQ
 Fp2VzTHwos2xEzTCsL0DB8OI684KXN4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-660-1zJrmYiSMy2sE9bv0HjGhg-1; Tue, 08 Nov 2022 10:09:57 -0500
X-MC-Unique: 1zJrmYiSMy2sE9bv0HjGhg-1
Received: by mail-wm1-f70.google.com with SMTP id
 e8-20020a05600c218800b003cf634f5280so3953824wme.8
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 07:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iX8mlAmhn5310S/jAwu9TW8aoDgjKU6vqHLKB+ztTjQ=;
 b=jkVSShswoRyBDq2QsWeica6DDHU/jyOkRJGLKweJHK48ppW0sZom6Ilt6YbQFnDhCp
 zfZlFhirtCUEiotQbZ/mhUXd63JNzZSexUhrp3X0O4q+mRBSJDz3C4pnvPuE71xYT3mA
 MyLuXM+zDQ00x9QoxzZMyvBAoZerbdoP+6d03PCtVcLFvZsZ5/LOVi1A2ONoq1CsP2VS
 vcRNCPZwc4KUL5ZrlZMEPVFtxFYTAhIhV0yB3GqQ55dc01meT+0QLJKfnlSleX3IXfSi
 m8G+iXYzuTbIGSDLmHBGZ42nQMWZaf+I6ul0txyYOwPZ8ecfm23kQnp+mGVc3QAZpzR6
 BWPg==
X-Gm-Message-State: ACrzQf3qkXplUxeV8ygmx5Nu/8rMZDaUPZm5MIpnqOFR7ptcphLOXBsw
 jdhzp34f4fibKpgzcqcZ60mB/I+gf6nuAqyvHm6EJOHrRi2wuAUKGepbSBxlUYLjAURA9ZryENn
 i6QppvEgCBdi5JKg=
X-Received: by 2002:adf:d84b:0:b0:236:e0da:61b7 with SMTP id
 k11-20020adfd84b000000b00236e0da61b7mr27242906wrl.79.1667920196464; 
 Tue, 08 Nov 2022 07:09:56 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5egHxthKWDVUZ2RrQnB8qAEH7hnmj6xBtYrmLB3/7ZHeZUCbnKzM1fyqlqo2VZLbTL9VrMPA==
X-Received: by 2002:adf:d84b:0:b0:236:e0da:61b7 with SMTP id
 k11-20020adfd84b000000b00236e0da61b7mr27242874wrl.79.1667920196161; 
 Tue, 08 Nov 2022 07:09:56 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a05600c0a5100b003cfa81e2eb4sm7917883wmq.38.2022.11.08.07.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 07:09:55 -0800 (PST)
Message-ID: <88f02d19-84d8-d1a7-4250-416fd32f1435@redhat.com>
Date: Tue, 8 Nov 2022 16:09:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/9] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20221104095700.4117433-1-eesposit@redhat.com>
 <20221104095700.4117433-3-eesposit@redhat.com>
 <197f2a27-4c3f-a62b-535c-d1db9ba22a32@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <197f2a27-4c3f-a62b-535c-d1db9ba22a32@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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



Am 08/11/2022 um 15:48 schrieb Vladimir Sementsov-Ogievskiy:
> On 11/4/22 12:56, Emanuele Giuseppe Esposito wrote:
>> These functions end up calling bdrv_common_block_status_above(), a
>> generated_co_wrapper function.
> 
> generated_co_wrapper is not a coroutine_fn. Сonversely it's a function
> that do a class coroutine wrapping - start a coroutine and do POLL to
> wait for the coroutine to finish.
> 
>> In addition, they also happen to be always called in coroutine context,
>> meaning all callers are coroutine_fn.
> 
> That's also not a reason for marking them coroutine_fn. "coroutine_fn"
> means that the function can be called only from coroutine context.
> 
>> This means that the g_c_w function will enter the qemu_in_coroutine()
>> case and eventually suspend (or in other words call
>> qemu_coroutine_yield()).
>> Therefore we need to mark such functions coroutine_fn too.
> 
> I don't think so. Moreover, this breaks the concept, as your new
> coroutine_fn functions will call generated_co_wrapper functions which
> are not marked coroutine_fn and never was.

Theoretically not, because marking it coroutine_fn we know that we are
going in the if(qemu_in_coroutine()) branch of the g_c_w, so we could
directly replace it with the actual function. Because it's a pain to do
it with hand, and at some point I/someone should use Alberto static
analyzer to get rid of that, I decided to leave g_c_w there.

As I understand it, it seems that you and Paolo have a different
understanding on what coroutine_fn means and where it should be used.
Honestly I don't understand your point, as you said

> "coroutine_fn"
> means that the function can be called only from coroutine context.

which is the case for these functions. So could you please clarify?

What I do know is that it's extremely confusing to understand if a
function that is *not* marked as coroutine_fn is actually being called
also from coroutines or not.

Which complicates A LOT whatever change or operation I want to perform
on the BlockDriver callbacks or any other function in the block layer,
because in the current approach for the AioContext lock removal (which
you are not aware of, I understand) we need to distinguish between
functions running in coroutine context and not, and throwing g_c_w
functions everywhere makes my work much harder that it already is.

Thank you,
Emanuele

> 
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/block-copy.c | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/block/block-copy.c b/block/block-copy.c
>> index bb947afdda..f33ab1d0b6 100644
>> --- a/block/block-copy.c
>> +++ b/block/block-copy.c
>> @@ -577,8 +577,9 @@ static coroutine_fn int
>> block_copy_task_entry(AioTask *task)
>>       return ret;
>>   }
>>   -static int block_copy_block_status(BlockCopyState *s, int64_t offset,
>> -                                   int64_t bytes, int64_t *pnum)
>> +static coroutine_fn int block_copy_block_status(BlockCopyState *s,
>> +                                                int64_t offset,
>> +                                                int64_t bytes,
>> int64_t *pnum)
>>   {
>>       int64_t num;
>>       BlockDriverState *base;
>> @@ -613,8 +614,9 @@ static int block_copy_block_status(BlockCopyState
>> *s, int64_t offset,
>>    * Check if the cluster starting at offset is allocated or not.
>>    * return via pnum the number of contiguous clusters sharing this
>> allocation.
>>    */
>> -static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t
>> offset,
>> -                                           int64_t *pnum)
>> +static int coroutine_fn
>> block_copy_is_cluster_allocated(BlockCopyState *s,
>> +                                                        int64_t offset,
>> +                                                        int64_t *pnum)
>>   {
>>       BlockDriverState *bs = s->source->bs;
>>       int64_t count, total_count = 0;
>> @@ -669,8 +671,9 @@ void block_copy_reset(BlockCopyState *s, int64_t
>> offset, int64_t bytes)
>>    * @return 0 when the cluster at @offset was unallocated,
>>    *         1 otherwise, and -ret on error.
>>    */
>> -int64_t block_copy_reset_unallocated(BlockCopyState *s,
>> -                                     int64_t offset, int64_t *count)
>> +int64_t coroutine_fn block_copy_reset_unallocated(BlockCopyState *s,
>> +                                                  int64_t offset,
>> +                                                  int64_t *count)
>>   {
>>       int ret;
>>       int64_t clusters, bytes;
> 


