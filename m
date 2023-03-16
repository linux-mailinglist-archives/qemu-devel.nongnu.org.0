Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B14A6BCC25
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 11:11:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pckYt-0003dD-4K; Thu, 16 Mar 2023 06:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pckYp-0003cT-58
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:10:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pckYi-0007X6-Ud
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678961407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DS7OP5lfx23L0dUswiQQAVDAQmlZ/BnQn7fVbKt+Gns=;
 b=LRT67DxICyHdQV6SyMWR58tC4DRGs35tw/mRMXoX4oWoBJ2bBeadEhJZDUuh1/Njk7DPEP
 ibjQzk02ZFX2FotHGcQZ8Vsm7tLdPFwSRtJFyA2e3eh//1yq/rPCcXjaCLRpmkN3qqXU6l
 vRSoJzuZCkCvKTKlcyfH9o6o+OTqYck=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-RBeX06ixNX-es4_9MdC2sg-1; Thu, 16 Mar 2023 06:10:05 -0400
X-MC-Unique: RBeX06ixNX-es4_9MdC2sg-1
Received: by mail-ed1-f72.google.com with SMTP id
 e18-20020a056402191200b004fa702d64b3so2310391edz.23
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 03:10:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678961404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DS7OP5lfx23L0dUswiQQAVDAQmlZ/BnQn7fVbKt+Gns=;
 b=Nk++lUpqJjEI/HwI+JjezqxDS9SHYJx/9FS0P8bAz3zfcOliOW9BTwQIAV3sZjJp8X
 rmHKdn4MVt/bFI7Q1s0zEy/souhHXZDOkYCvvscf+YkF+VaUS/rfJDouIiAVDeZe3wAI
 nT6KFulDBpzalHS/LdDWzZCgaoyqZ6EfJDC8MT3OX5OZD1F2Zwxj69ju5mOVuZFC5v0T
 kX/PIK3gHPpqfjobe7yUbGw0JAcjHrT07jpGk9ul5MSUyG+92lxB86ZMSHZA7PXFiy2H
 TCgglqlmP2tR/F5H1xPZB6Bjo75sDmoZH0c6qa+bRb6sbefjGA71vYbItfE2C3THBhbZ
 5AgA==
X-Gm-Message-State: AO0yUKXio/VNcy99vDrNHPCplxSNUNdQwtyCLwygpaUr/BS9g4eMGjUx
 RikCLYRFnMw7UJYuPysPJq4ymLrujG/yrJX2B2gVW1h4HGMkSf6CH+vBJezVc7s2UchEl8uacLp
 uesxx1JNNxt5Y1JU=
X-Received: by 2002:aa7:cc94:0:b0:4fc:eee9:417 with SMTP id
 p20-20020aa7cc94000000b004fceee90417mr5151870edt.18.1678961404408; 
 Thu, 16 Mar 2023 03:10:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set9KzlDITZVXCbDo4svsJQiOHZL3mdcfVy20rCxkgk2Lr7MOwdk2t2ApL6aYFbR15AVN6UPljQ==
X-Received: by 2002:aa7:cc94:0:b0:4fc:eee9:417 with SMTP id
 p20-20020aa7cc94000000b004fceee90417mr5151850edt.18.1678961403964; 
 Thu, 16 Mar 2023 03:10:03 -0700 (PDT)
Received: from ?IPV6:2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93?
 (p200300cfd72bb3c384eccc633ddf7d93.dip0.t-ipconnect.de.
 [2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93])
 by smtp.gmail.com with ESMTPSA id
 jj18-20020a170907985200b00930de1da701sm249815ejc.10.2023.03.16.03.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 03:10:03 -0700 (PDT)
Message-ID: <6fd3d201-9c61-7cd0-678a-d5fd9fb42700@redhat.com>
Date: Thu, 16 Mar 2023 11:10:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC 1/2] block: Split padded I/O vectors exceeding IOV_MAX
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20230315121330.29679-1-hreitz@redhat.com>
 <20230315121330.29679-2-hreitz@redhat.com> <20230315184822.GE16636@fedora>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230315184822.GE16636@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 15.03.23 19:48, Stefan Hajnoczi wrote:
> On Wed, Mar 15, 2023 at 01:13:29PM +0100, Hanna Czenczek wrote:
>> When processing vectored guest requests that are not aligned to the
>> storage request alignment, we pad them by adding head and/or tail
>> buffers for a read-modify-write cycle.
>>
>> The guest can submit I/O vectors up to IOV_MAX (1024) in length, but
>> with this padding, the vector can exceed that limit.  As of
>> 4c002cef0e9abe7135d7916c51abce47f7fc1ee2 ("util/iov: make
>> qemu_iovec_init_extended() honest"), we refuse to pad vectors beyond the
>> limit, instead returning an error to the guest.
>>
>> To the guest, this appears as a random I/O error.  We should not return
>> an I/O error to the guest when it issued a perfectly valid request.
>>
>> Before 4c002cef0e9abe7135d7916c51abce47f7fc1ee2, we just made the vector
>> longer than IOV_MAX, which generally seems to work (because the guest
>> assumes a smaller alignment than we really have, file-posix's
>> raw_co_prw() will generally see bdrv_qiov_is_aligned() return false, and
>> so emulate the request, so that the IOV_MAX does not matter).  However,
>> that does not seem exactly great.
>>
>> I see two ways to fix this problem:
>> 1. We split such long requests into two requests.
>> 2. We join some elements of the vector into new buffers to make it
>>     shorter.
>>
>> I am wary of (1), because it seems like it may have unintended side
>> effects.
>>
>> (2) on the other hand seems relatively simple to implement, with
>> hopefully few side effects, so this patch does that.
> Looks like a reasonable solution. I think the code is correct and I
> posted ideas for making it easier to understand.
>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2141964
>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
>> ---
>>   block/io.c | 139 ++++++++++++++++++++++++++++++++++++++++++++++++++---
>>   util/iov.c |   4 --
>>   2 files changed, 133 insertions(+), 10 deletions(-)
>>
>> diff --git a/block/io.c b/block/io.c
>> index 8974d46941..ee226d23d6 100644
>> --- a/block/io.c
>> +++ b/block/io.c
>> @@ -1435,6 +1435,12 @@ out:
>>    * @merge_reads is true for small requests,
>>    * if @buf_len == @head + bytes + @tail. In this case it is possible that both
>>    * head and tail exist but @buf_len == align and @tail_buf == @buf.
>> + *
>> + * @write is true for write requests, false for read requests.
>> + *
>> + * If padding makes the vector too long (exceeding IOV_MAX), then we need to
>> + * merge existing vector elements into a single one.  @collapse_buf acts as the
>> + * bounce buffer in such cases.
>>    */
>>   typedef struct BdrvRequestPadding {
>>       uint8_t *buf;
>> @@ -1443,11 +1449,17 @@ typedef struct BdrvRequestPadding {
>>       size_t head;
>>       size_t tail;
>>       bool merge_reads;
>> +    bool write;
>>       QEMUIOVector local_qiov;
>> +
>> +    uint8_t *collapse_buf;
>> +    size_t collapse_len;
>> +    QEMUIOVector collapsed_qiov;
>>   } BdrvRequestPadding;
>>   
>>   static bool bdrv_init_padding(BlockDriverState *bs,
>>                                 int64_t offset, int64_t bytes,
>> +                              bool write,
>>                                 BdrvRequestPadding *pad)
>>   {
>>       int64_t align = bs->bl.request_alignment;
>> @@ -1479,9 +1491,101 @@ static bool bdrv_init_padding(BlockDriverState *bs,
>>           pad->tail_buf = pad->buf + pad->buf_len - align;
>>       }
>>   
>> +    pad->write = write;
>> +
>>       return true;
>>   }
>>   
>> +/*
>> + * If padding has made the IOV (`pad->local_qiov`) too long (more than IOV_MAX
>> + * elements), collapse some elements into a single one so that it adheres to the
>> + * IOV_MAX limit again.
>> + *
>> + * If collapsing, `pad->collapse_buf` will be used as a bounce buffer of length
>> + * `pad->collapse_len`.  `pad->collapsed_qiov` will contain the previous entries
>> + * (before collapsing), so that bdrv_padding_destroy() can copy the bounce
>> + * buffer content back for read requests.
> The distinction between "collapse" and "collapsed" is subtle. I didn't
> guess it right, I thought collapsed_qiov is a QEMUIOVector for
> collapse_buf/collapse_len.
>
> Please choose a name for collapsed_qiov that makes this clearer. Maybe
> pre_collapse_qiov (i.e. the local_qiov iovecs that were replaced by
> bdrv_padding_collapse)?

Yes, sounds good!

>> + *
>> + * Note that we will not touch the padding head or tail entries here.  We cannot
>> + * move them to a bounce buffer, because for RMWs, both head and tail expect to
>> + * be in an aligned buffer with scratch space after (head) or before (tail) to
>> + * perform the read into (because the whole buffer must be aligned, but head's
>> + * and tail's lengths naturally cannot be aligned, because they provide padding
>> + * for unaligned requests).  A collapsed bounce buffer for multiple IOV elements
>> + * cannot provide such scratch space.
> As someone who hasn't looked at this code for a while, I don't
> understand this paragraph. Can you expand on why RMW is problematic
> here? If not, don't worry, it's hard to explain iov juggling.

The read in the RMW cycle is done using bdrv_aligned_preadv(), so head 
and tail must be fully aligned; their buffers’ addresses and lengths 
both must be aligned.  However, head and tail themselves can’t have an 
aligned length, because they’re filling up something that’s unaligned to 
be aligned.

Therefore, there must be some scratch space in those buffers that 
overlaps with adjacent elements in the I/O vector.  The 
bdrv_aligned_preadv() calls directly read into the padding buffer, so 
they will not overwrite anything in the I/O vector.  Instead, in the I/O 
vector, the references to the padding buffer are shortened to match the 
pure lengths of head and tail, so that when we finally do the actual 
write, the scratch space is hidden.

So merging head or tail requires special consideration of this scratch 
space.  It probably isn’t impossible (I should fix the comment on that), 
but it’s just more complicated than to merge internal elements.  Also, 
if you merge head or tail, you need to adjust some existing fields in 
BdrvRequestPadding (free `buf`, adjust `buf_len`, adjust `tail_buf`).  
And qemu_iovec_{to,from}_buf() would need to skip the head/tail.

I’ve begun by trying to merge into head/tail, but faced problem after 
problem and finally just decided to give up on that, finding that just 
merging internal buffers is simpler.

>> + *
>> + * Therefore, this function collapses the first IOV elements after the
>> + * (potential) head element.
>> + */
>> +static void bdrv_padding_collapse(BdrvRequestPadding *pad, BlockDriverState *bs)
>> +{
>> +    int surplus_count, collapse_count;
>> +    struct iovec *collapse_iovs;
>> +    QEMUIOVector collapse_qiov;
>> +    size_t move_count;
>> +
>> +    surplus_count = pad->local_qiov.niov - IOV_MAX;
>> +    /* Not exceeding the limit?  Nothing to collapse. */
>> +    if (surplus_count <= 0) {
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Only head and tail can have lead to the number of entries exceeding
>> +     * IOV_MAX, so we can exceed it by the head and tail at most
>> +     */
>> +    assert(surplus_count <= !!pad->head + !!pad->tail);
>> +
>> +    /*
>> +     * We merge (collapse) `surplus_count` entries into the first entry that is
>> +     * not padding, i.e. we merge `surplus_count + 1` entries into entry 0 if
>> +     * there is no head, or entry 1 if there is one.
>> +     */
>> +    collapse_count = surplus_count + 1;
>> +    collapse_iovs = &pad->local_qiov.iov[pad->head ? 1 : 0];
>> +
>> +    /* There must be no previously collapsed buffers in `pad` */
>> +    assert(pad->collapse_len == 0);
>> +    for (int i = 0; i < collapse_count; i++) {
>> +        pad->collapse_len += collapse_iovs[i].iov_len;
>> +    }
>> +    pad->collapse_buf = qemu_blockalign(bs, pad->collapse_len);
>> +
>> +    /* Save the to-be-collapsed IOV elements in collapsed_qiov */
>> +    qemu_iovec_init_external(&collapse_qiov, collapse_iovs, collapse_count);
>> +    qemu_iovec_init_slice(&pad->collapsed_qiov,
> Having collapse_qiov and collapsed_qiov in the same function is
> confusing. IIUC collapse_qiov and collapsed_qiov have the same buffers
> the same, except that the last iovec in collapse_qiov has its original
> length from local_qiov, whereas collapsed_qiov may shrink the last
> iovec.
>
> Maybe just naming collapse_qiov "qiov" or "tmp_qiov" would be less
> confusing because it avoids making collapse_buf/collapse_len vs
> collapsed_qiov more confusing.

Sure!

>> +                          &collapse_qiov, 0, pad->collapse_len);
>> +    if (pad->write) {
>> +        /* For writes: Copy all to-be-collapsed data into collapse_buf */
>> +        qemu_iovec_to_buf(&pad->collapsed_qiov, 0,
>> +                          pad->collapse_buf, pad->collapse_len);
>> +    }
>> +
>> +    /* Create the collapsed entry in pad->local_qiov */
>> +    collapse_iovs[0] = (struct iovec){
>> +        .iov_base = pad->collapse_buf,
>> +        .iov_len = pad->collapse_len,
>> +    };
>> +
>> +    /*
>> +     * To finalize collapsing, we must shift the rest of pad->local_qiov left by
>> +     * `surplus_count`, i.e. we must move all elements after `collapse_iovs` to
>> +     * immediately after the collapse target.
>> +     *
>> +     * Therefore, the memmove() target is `collapse_iovs[1]` and the source is
>> +     * `collapse_iovs[collapse_count]`.  The number of elements to move is the
>> +     * number of elements remaining in `pad->local_qiov` after and including
>> +     * `collapse_iovs[collapse_count]`.
>> +     */
>> +    move_count = &pad->local_qiov.iov[pad->local_qiov.niov] -
>> +        &collapse_iovs[collapse_count];
>> +    memmove(&collapse_iovs[1],
>> +            &collapse_iovs[collapse_count],
>> +            move_count * sizeof(pad->local_qiov.iov[0]));
>> +
>> +    pad->local_qiov.niov -= surplus_count;
>> +}
>> +
>>   static int coroutine_fn GRAPH_RDLOCK
>>   bdrv_padding_rmw_read(BdrvChild *child, BdrvTrackedRequest *req,
>>                         BdrvRequestPadding *pad, bool zero_middle)
>> @@ -1549,6 +1653,18 @@ static void bdrv_padding_destroy(BdrvRequestPadding *pad)
>>           qemu_vfree(pad->buf);
>>           qemu_iovec_destroy(&pad->local_qiov);
>>       }
>> +    if (pad->collapse_buf) {
>> +        if (!pad->write) {
>> +            /*
>> +             * If padding required elements in the vector to be collapsed into a
>> +             * bounce buffer, copy the bounce buffer content back
>> +             */
>> +            qemu_iovec_from_buf(&pad->collapsed_qiov, 0,
>> +                                pad->collapse_buf, pad->collapse_len);
>> +        }
>> +        qemu_vfree(pad->collapse_buf);
>> +        qemu_iovec_destroy(&pad->collapsed_qiov);
>> +    }
> This is safe because qemu_iovec_init_slice() took copies of local_qiov
> iovecs instead of references, but the code requires less thinking if
> collapsed_qiov is destroyed before local_qiov. This change would be nice
> if you respin.

Sure.

>>       memset(pad, 0, sizeof(*pad));
>>   }
>>   
>> @@ -1559,6 +1675,8 @@ static void bdrv_padding_destroy(BdrvRequestPadding *pad)
>>    * read of padding, bdrv_padding_rmw_read() should be called separately if
>>    * needed.
>>    *
>> + * @write is true for write requests, false for read requests.
>> + *
>>    * Request parameters (@qiov, &qiov_offset, &offset, &bytes) are in-out:
>>    *  - on function start they represent original request
>>    *  - on failure or when padding is not needed they are unchanged
>> @@ -1567,6 +1685,7 @@ static void bdrv_padding_destroy(BdrvRequestPadding *pad)
>>   static int bdrv_pad_request(BlockDriverState *bs,
>>                               QEMUIOVector **qiov, size_t *qiov_offset,
>>                               int64_t *offset, int64_t *bytes,
>> +                            bool write,
>>                               BdrvRequestPadding *pad, bool *padded,
>>                               BdrvRequestFlags *flags)
>>   {
>> @@ -1574,7 +1693,7 @@ static int bdrv_pad_request(BlockDriverState *bs,
>>   
>>       bdrv_check_qiov_request(*offset, *bytes, *qiov, *qiov_offset, &error_abort);
>>   
>> -    if (!bdrv_init_padding(bs, *offset, *bytes, pad)) {
>> +    if (!bdrv_init_padding(bs, *offset, *bytes, write, pad)) {
>>           if (padded) {
>>               *padded = false;
>>           }
>> @@ -1589,6 +1708,14 @@ static int bdrv_pad_request(BlockDriverState *bs,
>>           bdrv_padding_destroy(pad);
>>           return ret;
>>       }
>> +
>> +    /*
>> +     * If the IOV is too long after padding, merge (collapse) some entries to
>> +     * make it not exceed IOV_MAX
>> +     */
>> +    bdrv_padding_collapse(pad, bs);
>> +    assert(pad->local_qiov.niov <= IOV_MAX);
>> +
>>       *bytes += pad->head + pad->tail;
>>       *offset -= pad->head;
>>       *qiov = &pad->local_qiov;
>> @@ -1653,8 +1780,8 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
>>           flags |= BDRV_REQ_COPY_ON_READ;
>>       }
>>   
>> -    ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad,
>> -                           NULL, &flags);
>> +    ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, false,
>> +                           &pad, NULL, &flags);
>>       if (ret < 0) {
>>           goto fail;
>>       }
>> @@ -1996,7 +2123,7 @@ bdrv_co_do_zero_pwritev(BdrvChild *child, int64_t offset, int64_t bytes,
>>       /* This flag doesn't make sense for padding or zero writes */
>>       flags &= ~BDRV_REQ_REGISTERED_BUF;
>>   
>> -    padding = bdrv_init_padding(bs, offset, bytes, &pad);
>> +    padding = bdrv_init_padding(bs, offset, bytes, true, &pad);
>>       if (padding) {
>>           assert(!(flags & BDRV_REQ_NO_WAIT));
>>           bdrv_make_request_serialising(req, align);
>> @@ -2112,8 +2239,8 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
>>            * bdrv_co_do_zero_pwritev() does aligning by itself, so, we do
>>            * alignment only if there is no ZERO flag.
>>            */
>> -        ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad,
>> -                               &padded, &flags);
>> +        ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, true,
>> +                               &pad, &padded, &flags);
>>           if (ret < 0) {
>>               return ret;
>>           }
>> diff --git a/util/iov.c b/util/iov.c
>> index b4be580022..4d0d381949 100644
>> --- a/util/iov.c
>> +++ b/util/iov.c
>> @@ -444,10 +444,6 @@ int qemu_iovec_init_extended(
>>       }
>>   
>>       total_niov = !!head_len + mid_niov + !!tail_len;
>> -    if (total_niov > IOV_MAX) {
>> -        return -EINVAL;
>> -    }
> Perhaps an assertion is good here, just to make sure it's detected if a
> new caller is added some day. qemu_iovec_init_extended() is a public
> API, so something unrelated to block layer padding might use it.

The problem is that I’m not removing this because it’s become 
unnecessary, but because I need this function to happily create I/O 
vectors exceeding IOV_MAX.  After this patch, it will create I/O vectors 
with up to 1026 elements, which are only shrunk afterwards.

What I can do is add a comment that this function can create I/O vectors 
exceeding 1024 elements, and callers must ensure to somehow deal with 
this, either by knowing that it can’t happen in their case (and 
asserting that), or by shrinking/splitting the resulting vector somehow.

Hanna


