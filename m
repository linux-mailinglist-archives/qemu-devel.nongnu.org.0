Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A268D690406
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 10:43:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ3SA-0001Ba-IO; Thu, 09 Feb 2023 04:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pQ3S8-0001Ac-8k
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:42:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pQ3S6-0000C0-Qi
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675935770;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MQd/44X3VGG6y6SMVsesBJgs6TgG4y1epuhn14+9mJ8=;
 b=QFOfITTxFIiKbErX1biJBo5eQV3i9ZIwoebixmlGzHFJ9flMgWcNNbehqKYR9uKwyUCXB5
 aqMB+N+UxWUZtJsdycfs+6/ggyaU+dNHpoWVooxoSsGBGCaMVYb6KqJVwV8rAFuPsUxggw
 0u3bpDznBSj7RyfiKi8CB3QigB0rZkg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-URbSndgDOf23QQo1y8u-nA-1; Thu, 09 Feb 2023 04:42:44 -0500
X-MC-Unique: URbSndgDOf23QQo1y8u-nA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D9E5857A93;
 Thu,  9 Feb 2023 09:42:43 +0000 (UTC)
Received: from [10.64.54.63] (vpn2-54-63.bne.redhat.com [10.64.54.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08A3D1121314;
 Thu,  9 Feb 2023 09:42:38 +0000 (UTC)
Subject: Re: [PATCH RFCv1 4/8] kvm: Introduce secondary dirty bitmap
To: quintela@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, mst@redhat.com, cohuck@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20230206112010.99871-1-gshan@redhat.com>
 <20230206112010.99871-5-gshan@redhat.com> <87k00r95g1.fsf@secure.mitica>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <68f8b361-cd8b-7cab-fd81-b2b8e1a49da3@redhat.com>
Date: Thu, 9 Feb 2023 20:42:36 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <87k00r95g1.fsf@secure.mitica>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/9/23 9:07 AM, Juan Quintela wrote:
> Gavin Shan <gshan@redhat.com> wrote:
>> When dirty ring is enabled on ARM64, the backup bitmap may be used
>> to track the dirty pages in no-running-vcpu situations. The original
>> bitmap is the primary one, used for the dirty ring buffer. We need
>> the secondary bitmap to collect the backup bitmap for ARM64.
>>
>> No functional change intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   accel/kvm/kvm-all.c      | 50 ++++++++++++++++++++++++++++++----------
>>   include/sysemu/kvm_int.h |  1 +
>>   2 files changed, 39 insertions(+), 12 deletions(-)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 01a6a026af..1a93985574 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -553,13 +553,29 @@ static void kvm_log_stop(MemoryListener *listener,
>>       }
>>   }
>>   
>> +static unsigned long *kvm_slot_dirty_bitmap(KVMSlot *slot, bool primary)
>> +{
>> +    if (primary) {
>> +        return slot->dirty_bmap;
>> +    }
>> +
>> +    return slot->dirty_bmap +
>> +           slot->dirty_bmap_size / sizeof(slot->dirty_bmap[0]);
>> +}
> 
> 
> Why?
> Just use two bitmaps and call it a day.
> 

Thanks for your review, Juan. Right, I had wrong assumption that the original
(primary) bitmap can't be reused. It's why the secondary bitmap is introduced.
The intention is to use the original (primary) bitmap to cover the dirty-ring
buffers while the secondary bitmap is to cover the backup bitmap, resident in
host kernel.

I think the original (primary) bitmap can be reused in this case. After the
dirty-ring buffer is synchronized to the original bitmap, which is updated
to the dirty bits. It can be reused to cover the backup bitmap. I will remove
the secondary bitmap in next revision.

Thanks,
Gavin


