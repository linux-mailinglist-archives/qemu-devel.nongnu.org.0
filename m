Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8953F497B0F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 10:08:41 +0100 (CET)
Received: from localhost ([::1]:45992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBvL6-000810-MF
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 04:08:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nBvJ8-0006d1-E3
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 04:06:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nBvJ4-0003cS-UD
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 04:06:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643015193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DKY4ly6b371MYuDmN3D/4MTBXVMie8YAfEPUdZxhbos=;
 b=O1K+XmMNEosHQyNh8mapVNvO6AaqlKoQWI6xRtrXYEtLfhjBTBWwq3Y5IOFO53ntXMAmMi
 3k1YbRUhi9PzG4IELg2oWhkbXKs0uZ0jCdiAhTM+1N4Bi/qbNXmNVrYV21TpzQNszMShNJ
 PZxNjaui9bFpk1CjTTjaABuoceZ3TV4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-bBAuQjdpNXSYO83DnGy7hg-1; Mon, 24 Jan 2022 04:06:31 -0500
X-MC-Unique: bBAuQjdpNXSYO83DnGy7hg-1
Received: by mail-wm1-f72.google.com with SMTP id
 b4-20020a7bc244000000b0034f4c46217cso2922975wmj.0
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 01:06:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DKY4ly6b371MYuDmN3D/4MTBXVMie8YAfEPUdZxhbos=;
 b=AglDJXhznUvAXft1CinXU+gqN7VLI3pQIwDDBW6hlcrmnWWEqBopZuT+LFrzxuTVsq
 aBPG3ocbdaU1a/8xXc/A4sy/lwEwgUJ3YG1xSrmTtc3cXA+7xM0Jj8DTXSNfuSx669Jt
 VFuKa8BDgry1a158zz+Wew7M2gr2yXKRnJnYp/cv8/uSx7EIjLbMtnaaNK6URd9MsbW4
 Usd6fAcruEkR1UXCenQHUKofUjU/Sgaw4tFgbJPvEopeXwsUhSuJx3LGYKVzg4ntCWm6
 f3JmKfKE4eJiJ0BiOmqEIeXVfBZ73cdJFeAEr2csY8s/ssJveoKQsVO/eY/HcrWO4yVe
 wP7w==
X-Gm-Message-State: AOAM530qkRjez95JfDKCQgpTOYBy68ombkkJDMBFjiHyNs+BYp+/57GZ
 wkI4Kl//q3E3Us6lkL8UzTKIaPkZHeRgo6UZvYe3tlS4EpBX9wVM5o2fFrlBaVvqRD5riUKnTXR
 fscBeOQZxyDKj6YA=
X-Received: by 2002:a05:600c:601f:: with SMTP id
 az31mr914182wmb.35.1643015189883; 
 Mon, 24 Jan 2022 01:06:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSrBHOHkt/1HNpP+RtYpmIjbUXs3A0b83crF2aEk4VKDDXmlynYb7eg7bkbGS3+RQATskasw==
X-Received: by 2002:a05:600c:601f:: with SMTP id
 az31mr914148wmb.35.1643015189490; 
 Mon, 24 Jan 2022 01:06:29 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id x6sm16058101wrn.18.2022.01.24.01.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 01:06:29 -0800 (PST)
Message-ID: <3a718aaf-44c7-e780-fa1c-1cbe3d769e79@redhat.com>
Date: Mon, 24 Jan 2022 10:06:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] ide: Increment BB in-flight counter for TRIM BH
To: John Snow <jsnow@redhat.com>
References: <20220120142259.120189-1-hreitz@redhat.com>
 <CAFn=p-YKMREeM4PxhiTQFfiovt=WN7cW-CdiVSVfbRbkvH+aog@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-YKMREeM4PxhiTQFfiovt=WN7cW-CdiVSVfbRbkvH+aog@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.01.22 19:47, John Snow wrote:
> On Thu, Jan 20, 2022 at 9:23 AM Hanna Reitz <hreitz@redhat.com> wrote:
>> When we still have an AIOCB registered for DMA operations, we try to
>> settle the respective operation by draining the BlockBackend associated
>> with the IDE device.
>>
>> However, this assumes that every DMA operation is associated with an
>> increment of the BlockBackend’s in-flight counter (e.g. through some
>> ongoing I/O operation), so that draining the BB until its in-flight
>> counter reaches 0 will settle all DMA operations.  That is not the case:
>> For TRIM, the guest can issue a zero-length operation that will not
>> result in any I/O operation forwarded to the BlockBackend, and also not
>> increment the in-flight counter in any other way.  In such a case,
>> blk_drain() will be a no-op if no other operations are in flight.
>>
>> It is clear that if blk_drain() is a no-op, the value of
>> s->bus->dma->aiocb will not change between checking it in the `if`
>> condition and asserting that it is NULL after blk_drain().
>>
>> The particular problem is that ide_issue_trim() creates a BH
>> (ide_trim_bh_cb()) to settle the TRIM request: iocb->common.cb() is
>> ide_dma_cb(), which will either create a new request, or find the
>> transfer to be done and call ide_set_inactive(), which clears
>> s->bus->dma->aiocb.  Therefore, the blk_drain() must wait for
>> ide_trim_bh_cb() to run, which currently it will not always do.
>>
>> To fix this issue, we increment the BlockBackend's in-flight counter
>> when the TRIM operation begins (in ide_issue_trim(), when the
>> ide_trim_bh_cb() BH is created) and decrement it when ide_trim_bh_cb()
>> is done.
>>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2029980
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>> v1:
>> https://lists.nongnu.org/archive/html/qemu-block/2022-01/msg00024.html
>>
>> v2:
>> - Increment BB’s in-flight counter while the BH is active so that
>>    blk_drain() will poll until the BH is done, as suggested by Paolo
>>
>> (No git-backport-diff, because this patch was basically completely
>> rewritten, so it wouldn’t be worth it.)
>> ---
>>   hw/ide/core.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/hw/ide/core.c b/hw/ide/core.c
>> index e28f8aad61..15138225be 100644
>> --- a/hw/ide/core.c
>> +++ b/hw/ide/core.c
>> @@ -433,12 +433,16 @@ static const AIOCBInfo trim_aiocb_info = {
>>   static void ide_trim_bh_cb(void *opaque)
>>   {
>>       TrimAIOCB *iocb = opaque;
>> +    BlockBackend *blk = iocb->s->blk;
>>
>>       iocb->common.cb(iocb->common.opaque, iocb->ret);
>>
>>       qemu_bh_delete(iocb->bh);
>>       iocb->bh = NULL;
>>       qemu_aio_unref(iocb);
>> +
>> +    /* Paired with an increment in ide_issue_trim() */
>> +    blk_dec_in_flight(blk);
>>   }
>>
>>   static void ide_issue_trim_cb(void *opaque, int ret)
>> @@ -508,6 +512,9 @@ BlockAIOCB *ide_issue_trim(
>>       IDEState *s = opaque;
>>       TrimAIOCB *iocb;
>>
>> +    /* Paired with a decrement in ide_trim_bh_cb() */
>> +    blk_inc_in_flight(s->blk);
>> +
>>       iocb = blk_aio_get(&trim_aiocb_info, s->blk, cb, cb_opaque);
>>       iocb->s = s;
>>       iocb->bh = qemu_bh_new(ide_trim_bh_cb, iocb);
>> --
>> 2.34.1
>>
> Oh, this *wasn't* the same bug I thought it was.
>
> There's no regression test, but I will trust you (and Paolo) that this
> solves the bug you were seeing. It makes sense.

There is one in the BZ linked, but I don’t know where we’d put it into 
the qemu tree...  I’ve explained in v1 
(https://lists.nongnu.org/archive/html/qemu-block/2022-01/msg00024.html) 
how I didn’t find a way to write a qtest for this, and so resorted to 
writing boot sector code to reproduce the assertion failure. Now, we 
could put that as a sample image into the iotests, but that’d just be... 
wrong.  (Is there a place where something like this would belong?)

> Reviewed-by: John Snow <jsnow@redhat.com>
> Tested-by: John Snow <jsnow@redhat.com>

Thanks!

Hanna


