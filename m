Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE421690409
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 10:44:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ3T4-0001rH-Fx; Thu, 09 Feb 2023 04:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pQ3T2-0001pL-II
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:43:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pQ3Sz-0000IE-Qh
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:43:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675935825;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MWtLfqresRJkSR+Kcb+oiHNBguaF8+Ha78+fV2jhMGU=;
 b=dN84PUvgfFDRFFLENocl8VFwy1lwuIQS+PDftizyGuj4cLTUgqtgnwHsLJKzguaZHHZtiR
 /KRI8K3021IcCNSjUqNscRfRIDEiQCgdqvML/nTReT5OrcwStLbPiSka2tw4P/DMEyuf2l
 XgP9xg/zqpVPtPYYdvYvkHAQcIaqlOM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-zkef0L5cMZWw_D7J0fYyoQ-1; Thu, 09 Feb 2023 04:43:42 -0500
X-MC-Unique: zkef0L5cMZWw_D7J0fYyoQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FCF085CCE0;
 Thu,  9 Feb 2023 09:43:41 +0000 (UTC)
Received: from [10.64.54.63] (vpn2-54-63.bne.redhat.com [10.64.54.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC10518EC5;
 Thu,  9 Feb 2023 09:43:36 +0000 (UTC)
Subject: Re: [PATCH RFCv1 6/8] kvm: Add helper kvm_dirty_ring_init()
To: quintela@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, mst@redhat.com, cohuck@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20230206112010.99871-1-gshan@redhat.com>
 <20230206112010.99871-7-gshan@redhat.com> <87bkm39592.fsf@secure.mitica>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <2c41f643-3a49-962f-db5e-bb325fcb00fb@redhat.com>
Date: Thu, 9 Feb 2023 20:43:34 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <87bkm39592.fsf@secure.mitica>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/9/23 9:11 AM, Juan Quintela wrote:
> Gavin Shan <gshan@redhat.com> wrote:
>> Due to multiple capabilities associated with the dirty ring for different
>> architectures: KVM_CAP_DIRTY_{LOG_RING, LOG_RING_ACQ_REL} for x86 and
>> arm64 separately. There will be more to be done in order to support the
>> dirty ring for arm64.
>>
>> Lets add helper kvm_dirty_ring_init() to enable the dirty ring. With this,
>> the code looks a bit clean.
>>
>> No functional change intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   accel/kvm/kvm-all.c | 73 ++++++++++++++++++++++++++++-----------------
>>   1 file changed, 46 insertions(+), 27 deletions(-)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 9ec117c441..399ef0f7e6 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -1476,6 +1476,49 @@ static int kvm_dirty_ring_reaper_init(KVMState *s)
>>       return 0;
>>   }
>>   
>> +static int kvm_dirty_ring_init(KVMState *s)
>> +{
>> +    uint64_t ring_bytes;
>> +    int ret;
>> +
>> +    /*
>> +     * Read the max supported pages. Fall back to dirty logging mode
>> +     * if the dirty ring isn't supported.
>> +     */
>> +    ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
>> +    if (ret <= 0) {
>> +        warn_report("KVM dirty ring not available, using bitmap method");
>> +        s->kvm_dirty_ring_size = 0;
>> +        return 0;
>> +    }
>> +
>> +    ring_bytes = s->kvm_dirty_ring_size * sizeof(struct kvm_dirty_gfn);
>> +    if (ring_bytes > ret) {
>> +        error_report("KVM dirty ring size %" PRIu32 " too big "
>> +                     "(maximum is %ld).  Please use a smaller value.",
>> +                     s->kvm_dirty_ring_size,
>> +                     (long)ret / sizeof(struct kvm_dirty_gfn));
>> +        ret = -EINVAL;
>> +        goto out;
>> +    }
>> +
>> +    ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
>> +    if (ret) {
>> +        error_report("Enabling of KVM dirty ring failed: %s. "
>> +                     "Suggested minimum value is 1024.", strerror(-ret));
>> +        ret = -EIO;
>> +    }
>> +
>> +out:
>> +    if (ret) {
>> +        s->kvm_dirty_ring_size = 0;
>> +    } else {
>> +        s->kvm_dirty_ring_bytes = ring_bytes;
>> +    }
>> +
>> +    return ret;
>> +}
> 
> If you split it, you don't need the goto.
> 
> static int kvm_dirty_ring_init(KVMState *s)
> {
>      s->kvm_dirty_ring_size = 0;
>      /*
>       * Read the max supported pages. Fall back to dirty logging mode
>       * if the dirty ring isn't supported.
>       */
>      int ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
>      if (ret <= 0) {
>          warn_report("KVM dirty ring not available, using bitmap method");
>          return 0;
>      }
> 
>      uint64_t ring_bytes = s->kvm_dirty_ring_size * sizeof(struct kvm_dirty_gfn);
>      if (ring_bytes > ret) {
>          error_report("KVM dirty ring size %" PRIu32 " too big "
>                       "(maximum is %ld).  Please use a smaller value.",
>                       s->kvm_dirty_ring_size,
>                       (long)ret / sizeof(struct kvm_dirty_gfn));
>          return -EINVAL;
>      }
> 
>      ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
>      if (ret) {
>          error_report("Enabling of KVM dirty ring failed: %s. "
>                       "Suggested minimum value is 1024.", strerror(-ret));
>          return -EIO;
>      }
> 
>      s->kvm_dirty_ring_bytes = ring_bytes;
>      return ret;
> }
> 

Ok, thanks for your review. The goto will be removed in next revision.

> 
> 
>> +
>>   static void kvm_region_add(MemoryListener *listener,
>>                              MemoryRegionSection *section)
>>   {
>> @@ -2545,33 +2588,9 @@ static int kvm_init(MachineState *ms)
>>        * dirty logging mode
>>        */
>>       if (s->kvm_dirty_ring_size > 0) {
>> -        uint64_t ring_bytes;
>> -
>> -        ring_bytes = s->kvm_dirty_ring_size * sizeof(struct kvm_dirty_gfn);
>> -
>> -        /* Read the max supported pages */
>> -        ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
>> -        if (ret > 0) {
>> -            if (ring_bytes > ret) {
>> -                error_report("KVM dirty ring size %" PRIu32 " too big "
>> -                             "(maximum is %ld).  Please use a smaller value.",
>> -                             s->kvm_dirty_ring_size,
>> -                             (long)ret / sizeof(struct kvm_dirty_gfn));
>> -                ret = -EINVAL;
>> -                goto err;
>> -            }
>> -
>> -            ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
>> -            if (ret) {
>> -                error_report("Enabling of KVM dirty ring failed: %s. "
>> -                             "Suggested minimum value is 1024.", strerror(-ret));
>> -                goto err;
>> -            }
>> -
>> -            s->kvm_dirty_ring_bytes = ring_bytes;
>> -         } else {
>> -             warn_report("KVM dirty ring not available, using bitmap method");
>> -             s->kvm_dirty_ring_size = 0;
>> +        ret = kvm_dirty_ring_init(s);
>> +        if (ret < 0) {
>> +            goto err;
>>           }
>>       }
> 
Thanks,
Gavin


