Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA26429688
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 20:09:48 +0200 (CEST)
Received: from localhost ([::1]:54370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZzkC-0007SJ-1t
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 14:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzht-0005u8-7W
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:07:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzhq-00058i-3e
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633975639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XeUbWLzyubxEyBOkBagXYHpRmrDGGsS/8TjXRFwTGOM=;
 b=WQ2O2A9kVwSWeq2Vhe/BD0OcV/Nz8LfstBJYFNghKmbA+cY30HK0Uz7xsqzJ9qgFeN/z52
 DNeBl6D2zpABNopnb/41tui2nRTopxWqXuWzD9r9Gt/BW+fLTE1qxb32l96WUFP+ikiO8/
 B9dfIoKuTjScNjrQ9Y/U1z2xU1m2CH0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-5GzD8ibjORCcgU7pcO-4OA-1; Mon, 11 Oct 2021 14:07:18 -0400
X-MC-Unique: 5GzD8ibjORCcgU7pcO-4OA-1
Received: by mail-wr1-f70.google.com with SMTP id
 l8-20020a5d6d88000000b001611b5de796so544360wrs.10
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 11:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=XeUbWLzyubxEyBOkBagXYHpRmrDGGsS/8TjXRFwTGOM=;
 b=UfjdkG4BIj0W/ZG93UOdE7gK21Lbs68qnCrOzuncyEeMlM0t5DuIvFl/oHlNIOZZql
 ezAJdBKDS9fcLT0JodHbzAHLeRdwYk+281PRvdNAzbQvxgSx0/Kp03EEmcCCgZ8DLtN8
 CF5zdjc+H2XhifsKmJD371mFUsQjlvGcabGqSkuxolMfsjkINuStTBruvteAmd4ZFqEI
 D0AhTBbjnqptwp06rQI3WkO1cmxcew17vwYXIIwwgnziIhHi2kB/0/iBaKhi9QG7G/eN
 /49/YtBA5p0EbUh4itDlR5pArpYXj91s0z1RueB4WOkqY1c8mmrN4E8LY9bjwstibuPP
 PcEg==
X-Gm-Message-State: AOAM533xk+IYxXWGVzviezDz73cmII3m+e9UKnCnbUuUINeSzREVMDjy
 LwLipOWCLJbsYWwvEGhKnIIFSwPRFWU2hcRK5Fgey5zBhK3bJzzK1Cew+/BTPhM6oT7I9qPM64J
 yu+T/Tftl+lEToTY=
X-Received: by 2002:adf:8bcf:: with SMTP id w15mr27483452wra.144.1633975637779; 
 Mon, 11 Oct 2021 11:07:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr+sNnQH+RZ18e3ySM8Qepe/O1YW2wAkrPobfNGkFTc7Ze01lHRMTWCW18XQ/88VDkEga2Tg==
X-Received: by 2002:adf:8bcf:: with SMTP id w15mr27483395wra.144.1633975637376; 
 Mon, 11 Oct 2021 11:07:17 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ba.dip0.t-ipconnect.de. [91.12.100.186])
 by smtp.gmail.com with ESMTPSA id t11sm8316208wrz.65.2021.10.11.11.07.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 11:07:16 -0700 (PDT)
To: Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20211008203811.1980478-1-farman@linux.ibm.com>
 <20211008203811.1980478-3-farman@linux.ibm.com>
 <0addcdbc-50cb-420d-5864-af3a8a894321@redhat.com>
 <28832611-02f0-7e52-6f15-39427c96d8bf@de.ibm.com>
 <fd2325a4-7c3a-b677-d259-b3731da507a2@redhat.com>
 <5f68f12b09b6ec0b4fa23a89ba8c944c22714990.camel@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH v1 2/2] s390x/kvm: Pass SIGP Stop flags
Message-ID: <3e3b38d1-b338-0211-04ab-91f913c1f557@redhat.com>
Date: Mon, 11 Oct 2021 20:07:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5f68f12b09b6ec0b4fa23a89ba8c944c22714990.camel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.10.21 19:58, Eric Farman wrote:
> On Mon, 2021-10-11 at 11:21 +0200, David Hildenbrand wrote:
>> On 11.10.21 10:40, Christian Borntraeger wrote:
>>>
>>> Am 11.10.21 um 09:09 schrieb David Hildenbrand:
>>>> On 08.10.21 22:38, Eric Farman wrote:
>>>>> When building a Stop IRQ to pass to KVM, we should incorporate
>>>>> the flags if handling the SIGP Stop and Store Status order.
>>>>> With that, KVM can reject other orders that are submitted for
>>>>> the same CPU while the operation is fully processed.
>>>>>
>>>>> Signed-off-by: Eric Farman <farman@linux.ibm.com>
>>>>> Acked-by: Janosch Frank <frankja@linux.ibm.com>
>>>>> ---
>>>>>     target/s390x/kvm/kvm.c | 4 ++++
>>>>>     1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>>>>> index 5b1fdb55c4..701b9ddc88 100644
>>>>> --- a/target/s390x/kvm/kvm.c
>>>>> +++ b/target/s390x/kvm/kvm.c
>>>>> @@ -2555,6 +2555,10 @@ void kvm_s390_stop_interrupt(S390CPU
>>>>> *cpu)
>>>>>             .type = KVM_S390_SIGP_STOP,
>>>>>         };
>>>>> +    if (cpu->env.sigp_order == SIGP_STOP_STORE_STATUS) {
>>>>> +        irq.u.stop.flags = KVM_S390_STOP_FLAG_STORE_STATUS;
>>>>> +    }
>>>>> +
>>>>
>>>> KVM_S390_STOP_FLAG_STORE_STATUS tells KVM to perform the store
>>>> status as well ... is that really what we want?
>>> At least it should not hurt I guess. QEMU then does it again?
>>
>> The thing is, that before we officially completed the action in user
>> space (and let other SIGP actions actually succeed in user space on
>> the
>> CPU), the target CPU will be reported as !busy in the kernel
>> already.
>> And before we even inject the stop interrupt, the CPU will be
>> detected
>> as !busy in the kernel. I guess it will fix some cases where we poll
>> via
>> SENSE if the stop and store happened, because the store *did* happen
>> in
>> the kernel and we'll simply store again in user space.
>>
>> However, I wonder if we want to handle it more generically: Properly
>> flag a CPU as busy for SIGP when we start processing the order until
>> we
>> completed processing the order. That would allow to handle other
>> SIGP
>> operations in user space cleanly, without any chance for races with
>> SENSE code running in the kernel.
>>
> 
> I think a generic solution would be ideal, but I'm wrestling with the
> race with the kernel's SENSE code. Today, handle_sigp_single_dst
> already checks to see if a CPU is currently processing an order and
> returns a CC2 when it does, but of course the kernel's SENSE code
> doesn't know that. We could flag the CPU as busy in the kernel when
> sending a SIGP to userspace, so that the SENSE code indicates BUSY, but
> then how do we know when userspace is finished and the CPU is no longer
> BUSY?

I'd just add a new IOCTL for marking a CPU busy/!busy for SIGP from user 
space. You can then either let user space perform both actions 
(set+unset), or let the kernel automatically set "busy" and user space 
only clear "busy". You can define a new capability to enable the 
"automatically set busy when going to user space on sigp" -- might 
require some thoughts on some corner cases.

Maybe there might be other scenarios in the future where we might want 
to set a CPU busy for sigp without that CPU triggering a sigp action 
itself (e.g., externally triggered reset of a CPU? Simulation of 
check-stop? store status?), so at least having a way to set/reset a CPU 
busy for SIGP might be valuable.

Once we go to user space to process a SIGP, we usually don't care too 
much about some additional overhead due to 1 or 2 ioctls IMHO.

-- 
Thanks,

David / dhildenb


