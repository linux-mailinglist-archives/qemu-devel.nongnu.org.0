Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C01F6DF898
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 16:34:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmbXh-00061q-SY; Wed, 12 Apr 2023 10:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmbXg-00061O-7A
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 10:33:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmbXd-0001jd-Bv
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 10:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681310023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d8zLqI3YpX23Ziz3TEIA7gY9mmIaVQus9hh3taG/zvI=;
 b=GMk0YPFuvx7jVyBQYBTrPETrnQAKbSMr9YqfbD8dHLkOfBer7lIMTkDUuWGE4gWIBnPeE+
 WDIiknQx/Re859BnSDGkz7r6/bipkEFBWrU7dGQeFQQIuyUji/GRYfXoTwTNYISZBhjyym
 ltSnnbhYVbuzSFztTdqAxNDvKVUDOIM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-LcOITYLZMLeVHEAmWDbbfA-1; Wed, 12 Apr 2023 10:33:42 -0400
X-MC-Unique: LcOITYLZMLeVHEAmWDbbfA-1
Received: by mail-ej1-f71.google.com with SMTP id
 hh16-20020a170906a95000b00948f41a40d3so6140930ejb.8
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 07:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681310021; x=1683902021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d8zLqI3YpX23Ziz3TEIA7gY9mmIaVQus9hh3taG/zvI=;
 b=x5yGeG0NmTfHqByY0lJrjd1E6bELy9EMXWtDi5vOGD1sDjuJZ7am5+beZw5GB3Ljzj
 QPbS0pP7vqAjSPlAGZJMJ3W7PNbioQO8MInlL2w/DvjjvtG9hZRMrugpGi7LiGCfHE7v
 t/suLOGQ+1BuaO4RXmUYRjjmPThiKXaikFFUZIEVyhhHm+19wkvxg7a1mPcg8ai9Sh4y
 2nZod85ukx6Rt6lz5xueNDvM/L6jpF813pJbgb6DaMf2WuktCGM53RdJe8ooMUj/472B
 1qy97QgKLOTW05SqGDzw2VSOR2RKddBlYeB5JdI06u/ehun0QrakY1zcirkNoVJ3Tbm9
 1Ikw==
X-Gm-Message-State: AAQBX9d2z7HklkkwyWWeO7e6c/GuEeYowjG3h3L15WY0w5NfxhR6zfkE
 +S9CiWtCPk+uofrSvfIRU9kR0MFAQArMsHELynXZCzBHlDhzUDPLRaGqsTs0RQhy7XguCRS2/fc
 rMlmIOk+qARl4HqP5oRDFeK0=
X-Received: by 2002:a17:906:11d9:b0:94e:43bb:9f5f with SMTP id
 o25-20020a17090611d900b0094e43bb9f5fmr3816443eja.39.1681310020852; 
 Wed, 12 Apr 2023 07:33:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350YfFyQAjTYvdek5uF0B+zo5CTprwvx5RyJHkvXrStW3vJvT8WU9Z47MPKE3fe8FSOqKvBOrJQ==
X-Received: by 2002:a17:906:11d9:b0:94e:43bb:9f5f with SMTP id
 o25-20020a17090611d900b0094e43bb9f5fmr3816428eja.39.1681310020570; 
 Wed, 12 Apr 2023 07:33:40 -0700 (PDT)
Received: from ?IPV6:2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e?
 (p200300cfd735c67f6ed98c907a1de97e.dip0.t-ipconnect.de.
 [2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e])
 by smtp.gmail.com with ESMTPSA id
 ta22-20020a1709078c1600b0094e7bb22860sm280923ejc.50.2023.04.12.07.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 07:33:39 -0700 (PDT)
Message-ID: <adf32d68-a2ed-6b43-629a-b6374e113459@redhat.com>
Date: Wed, 12 Apr 2023 16:33:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] block-backend: delay application of request queuing
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Fiona Ebner <f.ebner@proxmox.com>
References: <20230405161752.194727-1-pbonzini@redhat.com>
 <20230405163109.197876-1-pbonzini@redhat.com>
 <29c84ebf-62e6-e90a-b75e-137cb76195de@redhat.com>
 <CABgObfa22ZKG-MfrfpQqGpX07q4kUVmi9dk_=4jqHi69c4LQzQ@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CABgObfa22ZKG-MfrfpQqGpX07q4kUVmi9dk_=4jqHi69c4LQzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12.04.23 14:03, Paolo Bonzini wrote:
> On Wed, Apr 12, 2023 at 1:54 PM Hanna Czenczek <hreitz@redhat.com> wrote:
>> On 05.04.23 18:31, Paolo Bonzini wrote:
>>> +    if (busy || blk->in_flight) {
>>> +        return true;
>>> +    }
>>> +
>>> +    if (qatomic_read(&blk->request_queuing) == BLK_QUEUE_READY) {
>>> +        qatomic_set(&blk->request_queuing, BLK_QUEUE_QUIESCENT);
>>> +    }
>>> +    return false;
>>>    }
>> This implicitly relies on nobody increasing blk->in_flight (or
>> dev_ops->drained_poll() returning `true` again) while the BB is starting
>> to be drained, because if the function were to be called again after it
>> has returned `false` once per drained section (not sure if that’s
>> possible![1]), then we’d end up in the original situation, with
>> in_flight elevated and queuing enabled.
> Yes, it does.
>
>> Is that really strictly guaranteed somehow or is it rather a complex
>> conglomerate of many cases that in the end happen to work out
>> individually?  I mean, I could imagine that running
>> BlockDevOps.drained_begin() is supposed to guarantee that, but it can’t,
>> because only NBD seems to implement it.  The commit message talks about
>> IDE being fine (by accident?) because it needs BQL availability to
>> submit new requests.  But that’s very complex and I’d rather have a
>> strict requirement to guarantee correctness.
> It's a conglomerate of three cases each of which is sufficient (BQL,
> aio_disable_external, bdrv_drained_begin---plus just not using
> blk_inc_in_flight could be a fourth, of course). Of these,
> aio_disable_external() is going away in favor of the
> .bdrv_drained_begin callback; and blk_inc_in_flight() is used rarely
> in the first place so I thought it'd be not too hard to have this
> requirement.

Does IDE’s BQL requirement work for nested drains, though, i.e. when you 
have a drained_begin, followed by another?  The commit message doesn’t 
say whether it’s impossible for IDE to create a new request in between 
the two.

I’m a bit afraid that these cases are too complicated for me to fully 
comprehend.

>> [1] If the blk_root_drained_poll() isn’t called anymore after returning
>> `false`, all will be good, but I assume it will be, because we have a
>> quiesce_counter, not a quiesce_bool.  We could kind of emulate this by
>> continuing to return `false` after blk_root_drained_poll() has returned
>> `false` once, until the quiesce_counter becomes 0.
>> We could also have blk_root_drained_poll(), if it sees in_flight > 0 &&
>> request_queuing == BLK_QUEUE_QUIESCENT, revert request_queuing to
>> BLK_QUEUE_READY and resume all queued requests.
> The intended long term fix is to remove request queuing and, if a
> request is submitted while BLK_QUEUE_QUIESCENT, give an assertion
> failure.

Yep, that would be a nice obvious requirement.

> But since the hang requires blk_inc_in_flight() in the device, perhaps
> in the short term documenting it in blk_inc_in_flight() may be enough?

Technically it needs a blk_inc_in_flight() whose blk_dec_in_flight() 
depends on a different request that can be queued (which is only the 
case in IDE), so I suppose we could document exactly that in those 
functions’ interfaces, i.e. that users must take care not to use 
blk_inc_flight() while the BlockBackend is (being) drained, when the 
associated blk_dec_in_flight() may depend on an I/O request to the BB.

I think that should be enough, yes.  Well, as long as you can guarantee 
that IDE will indeed fulfill that requirement, because I find it 
difficult to see/prove...

Hanna


