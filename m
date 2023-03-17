Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDA56BE296
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 09:06:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd55l-0002oC-1A; Fri, 17 Mar 2023 04:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pd55a-0002hm-Ic
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pd55Y-0002I0-D6
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679040323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HShLU0c555WLKi5fKaw2hMJnTq/rEwfFTzFaMgPQbLk=;
 b=O2bpP2GaFCZcCKMn/27jUQtITN8jTat989tFRyp0/LPfSB2smU+eOf16oJcO2U5NOUJlLZ
 gE8B47cbCEeyaD28KpiAnF5bY0Kem2x+knLxfbxblIDdUuEcydqQVgqzKaN66NFSr626Wp
 WCA6nTJaIzBh6kzeTnKR2Z522wz59hQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-fpz6XVtvNWORYwOtJS4tZA-1; Fri, 17 Mar 2023 04:05:21 -0400
X-MC-Unique: fpz6XVtvNWORYwOtJS4tZA-1
Received: by mail-ed1-f71.google.com with SMTP id
 t14-20020a056402240e00b004fb36e6d670so6666055eda.5
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 01:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679040320;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HShLU0c555WLKi5fKaw2hMJnTq/rEwfFTzFaMgPQbLk=;
 b=ChsCzqTpFBeAk6y8cDEdSVv568+3FTW/xRpBig+R+b1P4/t6ifkSRrh0nZvM67zT57
 kX4MZwad/UHUSPympjj5Sj6lXty7xMBo7IN1un5XkkJQFAg1zABQC6HpRuf3spsev0yU
 uzQwLhEtsgA9f+z73CqosGAOV4nzcVtGdx6HHKO0OEZBY8fsb9WKEyWRJrbtkQkmPZMk
 EspXbh7Ft+JTi7tX4/XwoNeRkfWt1OBuZrtlo3dxKtsXSZ3kH731kzWmIdQ3X5VIlOH8
 KWd+DhPbmRKo/MLY1TTKbKDiydSNhTStHT+yzNaN0wEBfQPBruwRHXhHDaaCfI9J82MY
 K12A==
X-Gm-Message-State: AO0yUKV4Vof55zSnETdgUioOM5KDCq7che9OK8DdIjRqon+LQObmA7ne
 f8mii4Z5WJCyXs7R791Mx/kmm3y3aWaqMCK8tnfTVhFO7JIJ7qLQQVI+PspdvkmgzBUn13jIY/0
 k+5ymCpPuIWoWAD8=
X-Received: by 2002:a17:906:a843:b0:928:3d04:c7e6 with SMTP id
 dx3-20020a170906a84300b009283d04c7e6mr12351061ejb.26.1679040320259; 
 Fri, 17 Mar 2023 01:05:20 -0700 (PDT)
X-Google-Smtp-Source: AK7set/NXxSUNDr6KV8kxnETthgnUQz755TXYN/XWTU7gFDMB+H7xcZEVZJcNCo87MksnfPhplc8NQ==
X-Received: by 2002:a17:906:a843:b0:928:3d04:c7e6 with SMTP id
 dx3-20020a170906a84300b009283d04c7e6mr12351040ejb.26.1679040319934; 
 Fri, 17 Mar 2023 01:05:19 -0700 (PDT)
Received: from ?IPV6:2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93?
 (p200300cfd72bb3c384eccc633ddf7d93.dip0.t-ipconnect.de.
 [2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a170906504300b00930c6c01c9esm677286ejk.143.2023.03.17.01.05.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 01:05:19 -0700 (PDT)
Message-ID: <a4cdbeaf-2ea4-dd2e-a9d5-6d43cb41963d@redhat.com>
Date: Fri, 17 Mar 2023 09:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC 1/2] block: Split padded I/O vectors exceeding IOV_MAX
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20230315121330.29679-1-hreitz@redhat.com>
 <20230315121330.29679-2-hreitz@redhat.com>
 <0aef4058-53ea-3a12-673a-d48109a276c3@yandex-team.ru>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <0aef4058-53ea-3a12-673a-d48109a276c3@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 16.03.23 18:44, Vladimir Sementsov-Ogievskiy wrote:
> On 15.03.23 15:13, Hanna Czenczek wrote:
>> When processing vectored guest requests that are not aligned to the
>> storage request alignment, we pad them by adding head and/or tail
>> buffers for a read-modify-write cycle.
>>
>> The guest can submit I/O vectors up to IOV_MAX (1024) in length, but
>> with this padding, the vector can exceed that limit.  As of
>> 4c002cef0e9abe7135d7916c51abce47f7fc1ee2 ("util/iov: make
>> qemu_iovec_init_extended() honest"), we refuse to pad vectors beyond the
>> limit, instead returning an error to the guest.
>>
>> To the guest, this appears as a random I/O error.  We should not return
>> an I/O error to the guest when it issued a perfectly valid request.
>>
>> Before 4c002cef0e9abe7135d7916c51abce47f7fc1ee2, we just made the vector
>> longer than IOV_MAX, which generally seems to work (because the guest
>> assumes a smaller alignment than we really have, file-posix's
>> raw_co_prw() will generally see bdrv_qiov_is_aligned() return false, and
>> so emulate the request, so that the IOV_MAX does not matter). However,
>> that does not seem exactly great.
>>
>> I see two ways to fix this problem:
>> 1. We split such long requests into two requests.
>> 2. We join some elements of the vector into new buffers to make it
>>     shorter.
>>
>> I am wary of (1), because it seems like it may have unintended side
>> effects.
>>
>> (2) on the other hand seems relatively simple to implement, with
>> hopefully few side effects, so this patch does that.
>>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2141964
>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
>> ---
>>   block/io.c | 139 ++++++++++++++++++++++++++++++++++++++++++++++++++---
>>   util/iov.c |   4 --
>>   2 files changed, 133 insertions(+), 10 deletions(-)
>>
>> diff --git a/block/io.c b/block/io.c
>> index 8974d46941..ee226d23d6 100644
>> --- a/block/io.c
>> +++ b/block/io.c
>> @@ -1435,6 +1435,12 @@ out:
>>    * @merge_reads is true for small requests,
>>    * if @buf_len == @head + bytes + @tail. In this case it is 
>> possible that both
>>    * head and tail exist but @buf_len == align and @tail_buf == @buf.
>> + *
>> + * @write is true for write requests, false for read requests.
>> + *
>> + * If padding makes the vector too long (exceeding IOV_MAX), then we 
>> need to
>> + * merge existing vector elements into a single one. @collapse_buf 
>> acts as the
>> + * bounce buffer in such cases.
>>    */
>>   typedef struct BdrvRequestPadding {
>>       uint8_t *buf;
>> @@ -1443,11 +1449,17 @@ typedef struct BdrvRequestPadding {
>>       size_t head;
>>       size_t tail;
>>       bool merge_reads;
>> +    bool write;
>>       QEMUIOVector local_qiov;
>> +
>> +    uint8_t *collapse_buf;
>> +    size_t collapse_len;
>> +    QEMUIOVector collapsed_qiov;
>>   } BdrvRequestPadding;
>>     static bool bdrv_init_padding(BlockDriverState *bs,
>>                                 int64_t offset, int64_t bytes,
>> +                              bool write,
>>                                 BdrvRequestPadding *pad)
>>   {
>>       int64_t align = bs->bl.request_alignment;
>> @@ -1479,9 +1491,101 @@ static bool 
>> bdrv_init_padding(BlockDriverState *bs,
>>           pad->tail_buf = pad->buf + pad->buf_len - align;
>>       }
>>   +    pad->write = write;
>> +
>>       return true;
>>   }
>>   +/*
>> + * If padding has made the IOV (`pad->local_qiov`) too long (more 
>> than IOV_MAX
>> + * elements), collapse some elements into a single one so that it 
>> adheres to the
>> + * IOV_MAX limit again.
>> + *
>> + * If collapsing, `pad->collapse_buf` will be used as a bounce 
>> buffer of length
>> + * `pad->collapse_len`.  `pad->collapsed_qiov` will contain the 
>> previous entries
>> + * (before collapsing), so that bdrv_padding_destroy() can copy the 
>> bounce
>> + * buffer content back for read requests.
>> + *
>> + * Note that we will not touch the padding head or tail entries 
>> here.  We cannot
>> + * move them to a bounce buffer, because for RMWs, both head and 
>> tail expect to
>> + * be in an aligned buffer with scratch space after (head) or before 
>> (tail) to
>> + * perform the read into (because the whole buffer must be aligned, 
>> but head's
>> + * and tail's lengths naturally cannot be aligned, because they 
>> provide padding
>> + * for unaligned requests).  A collapsed bounce buffer for multiple 
>> IOV elements
>> + * cannot provide such scratch space.
>> + *
>> + * Therefore, this function collapses the first IOV elements after the
>> + * (potential) head element.
>> + */
>> +static void bdrv_padding_collapse(BdrvRequestPadding *pad, 
>> BlockDriverState *bs)
>> +{
>> +    int surplus_count, collapse_count;
>> +    struct iovec *collapse_iovs;
>> +    QEMUIOVector collapse_qiov;
>> +    size_t move_count;
>> +
>> +    surplus_count = pad->local_qiov.niov - IOV_MAX;
>> +    /* Not exceeding the limit?  Nothing to collapse. */
>> +    if (surplus_count <= 0) {
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Only head and tail can have lead to the number of entries 
>> exceeding
>> +     * IOV_MAX, so we can exceed it by the head and tail at most
>> +     */
>> +    assert(surplus_count <= !!pad->head + !!pad->tail);
>> +
>> +    /*
>> +     * We merge (collapse) `surplus_count` entries into the first 
>> entry that is
>> +     * not padding, i.e. we merge `surplus_count + 1` entries into 
>> entry 0 if
>> +     * there is no head, or entry 1 if there is one.
>> +     */
>> +    collapse_count = surplus_count + 1;
>> +    collapse_iovs = &pad->local_qiov.iov[pad->head ? 1 : 0];
>> +
>> +    /* There must be no previously collapsed buffers in `pad` */
>> +    assert(pad->collapse_len == 0);
>> +    for (int i = 0; i < collapse_count; i++) {
>> +        pad->collapse_len += collapse_iovs[i].iov_len;
>> +    }
>> +    pad->collapse_buf = qemu_blockalign(bs, pad->collapse_len);
>> +
>> +    /* Save the to-be-collapsed IOV elements in collapsed_qiov */
>> +    qemu_iovec_init_external(&collapse_qiov, collapse_iovs, 
>> collapse_count);
>> +    qemu_iovec_init_slice(&pad->collapsed_qiov,
>> +                          &collapse_qiov, 0, pad->collapse_len);
>> +    if (pad->write) {
>> +        /* For writes: Copy all to-be-collapsed data into 
>> collapse_buf */
>> +        qemu_iovec_to_buf(&pad->collapsed_qiov, 0,
>> +                          pad->collapse_buf, pad->collapse_len);
>> +    }
>> +
>> +    /* Create the collapsed entry in pad->local_qiov */
>> +    collapse_iovs[0] = (struct iovec){
>> +        .iov_base = pad->collapse_buf,
>> +        .iov_len = pad->collapse_len,
>> +    };
>> +
>> +    /*
>> +     * To finalize collapsing, we must shift the rest of 
>> pad->local_qiov left by
>> +     * `surplus_count`, i.e. we must move all elements after 
>> `collapse_iovs` to
>> +     * immediately after the collapse target.
>> +     *
>> +     * Therefore, the memmove() target is `collapse_iovs[1]` and the 
>> source is
>> +     * `collapse_iovs[collapse_count]`.  The number of elements to 
>> move is the
>> +     * number of elements remaining in `pad->local_qiov` after and 
>> including
>> +     * `collapse_iovs[collapse_count]`.
>> +     */
>> +    move_count = &pad->local_qiov.iov[pad->local_qiov.niov] -
>> +        &collapse_iovs[collapse_count];
>> +    memmove(&collapse_iovs[1],
>> +            &collapse_iovs[collapse_count],
>> +            move_count * sizeof(pad->local_qiov.iov[0]));
>> +
>> +    pad->local_qiov.niov -= surplus_count;
>> +}
>
>
> What I don't like is that qemu_iovec_init_extended() is really 
> complex, and it is used only here [I mean bdrv_pad_request()] 
> (qemu_iovec_init_slice() uses only small subset of 
> qemu_iovec_init_extended() possibilities). And finally, we use this 
> qemu_iovec_init_extended() only to rewrite the resulting qiov by hand 
> using direct access to iov[] array and memmove. I think, such direct 
> manipulations better be done in util/iov.c.. And anyway, this all show 
> that qemu_iovec_init_extended() being complex doesn't meet our needs.
>
> Hmm. *improving* qemu_iovec_init_external() by allowing it to allocate 
> additional bounce-buffer, and do collapsing doesn't look good.
>
> Maybe instead, do the logic of qemu_iovec_init_extended() together 
> with bdrv_padding_collapse() in bdrv_pad_request() directly, using 
> simpler qemu_iovec_* API?
>
> Something like:
>
> 1. prepare bounce_buffer if want to collaps
> 2. allocate local_qiov of calculated size
> 3. compile the local_qiov:
>
>   - if head: qemu_iovec_add(local_qiov, head)
>   - if collpase_buf: qemu_iovec_add(local_qiov, collapse_buf)
>   - qemu_iovec_concat(local_qiov, remaining part of qiov)
>   - if tail: qemu_iovec_add(local_qiov, tail)

Sure, I’ll give it a try!

Hanna


