Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334DD6BCB4A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 10:45:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pck9H-0007qz-TI; Thu, 16 Mar 2023 05:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pck9E-0007qZ-9r
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 05:43:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pck9B-0001Cs-Jm
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 05:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678959824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eC9XI8M+k9bd5lhpqajl9Raebvebj9II4fy43vT+Kvg=;
 b=V2Am6MNqt7JAIY7KwmSu3d1uw0alZXQuBX20KbrHa+ltmP/BUF1unSvPAu/LNkV4eij4lQ
 raFUAeH6O6Hfoei627AdWZvpNgRzOSkbyMefoxcqcBtJlEIU6PmFE5tiR1j9iNTeBXPE/D
 KVNZb1vGx1GgSKgf7GD3b9fC25XORaw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-JUPr6PP3NOiyh4lvrYFXzA-1; Thu, 16 Mar 2023 05:43:42 -0400
X-MC-Unique: JUPr6PP3NOiyh4lvrYFXzA-1
Received: by mail-ed1-f69.google.com with SMTP id
 b1-20020aa7dc01000000b004ad062fee5eso2175814edu.17
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 02:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678959821;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eC9XI8M+k9bd5lhpqajl9Raebvebj9II4fy43vT+Kvg=;
 b=eXvXXB0HvCH9sjNmD8cmaw+dirFjkQXl5lKl9q8zG58DJ091ODgP5doUCHTUBO+Hoa
 42W+p0yNv/j8KiSerrL3EoYwNEAlsIWdHEzd4F/+0eKJrxQG3X8u1mqdZlY2jc8MsB8C
 KfwI8Gc79faGS7UXDPDeO6naGF6kjkld36Qkco+nJq21sCD5ihoLK7Gh6Z+6bFfZ7XTB
 c/GUo13ZTAdl5XUajp4hQBmV9fkNo53l9sg6byPMJWgptb3UYr+lA+A+yjVJX4D7uBAO
 YIIO0mKzN07W4X8u2fF+ve6YLCIQfraEw9+BubwORDvbpmffpgwEPoLiYjQTe1g7p8Gu
 6cGg==
X-Gm-Message-State: AO0yUKVpYn2TI795IsDM/vfJ7bsV05ouFNyhxE95PnQ8L23VOTIjgtbg
 Oc385SY2WZzC4/VvfUvkzZdmu4etxLIEB54KUGyvge4czTREYftGHy01e9DeM1BIZ+CGT4N5yFN
 8BWJUb46/ZD67Umw=
X-Received: by 2002:a17:907:3e12:b0:92f:ccf3:f0ce with SMTP id
 hp18-20020a1709073e1200b0092fccf3f0cemr4707594ejc.45.1678959821400; 
 Thu, 16 Mar 2023 02:43:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set/CTjnUpQ4Zgi3k54LedwWsUoFAoWerXBXITQI74bh+VZMnHPSRKO9QEavTP+WYJzhMjl/+3g==
X-Received: by 2002:a17:907:3e12:b0:92f:ccf3:f0ce with SMTP id
 hp18-20020a1709073e1200b0092fccf3f0cemr4707572ejc.45.1678959821050; 
 Thu, 16 Mar 2023 02:43:41 -0700 (PDT)
Received: from ?IPV6:2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93?
 (p200300cfd72bb3c384eccc633ddf7d93.dip0.t-ipconnect.de.
 [2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a170906175700b0092669fb4ba1sm3612881eje.130.2023.03.16.02.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 02:43:40 -0700 (PDT)
Message-ID: <007b6adc-0c79-3d5c-92d4-108e14a36424@redhat.com>
Date: Thu, 16 Mar 2023 10:43:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC 1/2] block: Split padded I/O vectors exceeding IOV_MAX
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20230315121330.29679-1-hreitz@redhat.com>
 <20230315121330.29679-2-hreitz@redhat.com>
 <20230315182501.w5zed6yktlfeytlf@redhat.com>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230315182501.w5zed6yktlfeytlf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 15.03.23 19:25, Eric Blake wrote:
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
> Agreed that approach 2 is more conservative.
>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2141964
>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
>> ---
>>   block/io.c | 139 ++++++++++++++++++++++++++++++++++++++++++++++++++---
>>   util/iov.c |   4 --
>>   2 files changed, 133 insertions(+), 10 deletions(-)
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
>> + *
>> + * Note that we will not touch the padding head or tail entries here.  We cannot
>> + * move them to a bounce buffer, because for RMWs, both head and tail expect to
>> + * be in an aligned buffer with scratch space after (head) or before (tail) to
>> + * perform the read into (because the whole buffer must be aligned, but head's
>> + * and tail's lengths naturally cannot be aligned, because they provide padding
>> + * for unaligned requests).  A collapsed bounce buffer for multiple IOV elements
>> + * cannot provide such scratch space.
>> + *
>> + * Therefore, this function collapses the first IOV elements after the
>> + * (potential) head element.
> It looks like you blindly pick the first one or two non-padding iovs
> at the front of the array.  Would it be any wiser (in terms of less
> memmove() action or even a smaller bounce buffer) to pick iovs at the
> end of the array, and/or a sequential search for the smallest
> neighboring iovs?  Or is that a micro-optimization that costs more
> than it saves?

Right, I didn’t think of picking near the end.  That makes sense 
indeed!  If not for performance, at least it allows dropping the 
non-trivial comment for the memmove().

Searching for the smallest buffers, I’m not sure.  I think it can make 
sense performance-wise – iterating over 1024 elements will probably pay 
off quickly when you indeed have differences in buffer size there.  My 
main concern is that it would be more complicated, and I just don’t 
think that’s worth it for such a rare case.

> Would it be any easier to swap the order of padding vs. collapsing?
> That is, we already know the user is giving us a long list of iovs; if
> it is 1024 elements long, and we can detect that padding will be
> needed, should we collapse before padding instead of padding, finding
> that we now have 1026, and memmove'ing back into 1024?

I’d prefer that, but it’s difficult.  We need the temporary QIOV 
(pad->local_qiov) so we can merge entries, but this is only created by 
qemu_iovec_init_extended().

We can try to move the collapsing into qemu_iovec_init_extended(), but 
it would be a bit awkward still, and probably blow up that function’s 
interface (it’s in util/iov.c, so we can’t really immediately use the 
BdrvRequestPadding object).  I think, in the end, functionally not much 
would change, so I’d rather keep the order as it is (unless someone has 
a good idea here).

> But logic-wise, your patch looks correct to me.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!

Hanna


