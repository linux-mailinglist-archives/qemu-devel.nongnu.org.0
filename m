Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30904428996
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 11:23:12 +0200 (CEST)
Received: from localhost ([::1]:49000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZrWY-0006rs-Ov
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 05:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZrV5-0005LI-2S
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 05:21:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZrV1-0005nI-K4
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 05:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633944093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iLKIufOxtKfQSkgkc33P7og6BLrOB7EJ26uvbVMvqeo=;
 b=TOk7Pa4vHdT5ffuXFQIR/oyyOuui99ZLczz4UPptKeSO45Mq9p8Kau1nhwI+2nN8MXlr3Y
 uM2yhDiiSWMkjX6IIf0RLCKVWNSAoVkkp0VleIBNcBTvg/pcTLwmPm5K8wyznACVFM6rmL
 Pw4fBTYddBzciKMaKvox72Ni7QwKJrA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-ctC8h-BGM2aiZsMgXF_0CA-1; Mon, 11 Oct 2021 05:21:31 -0400
X-MC-Unique: ctC8h-BGM2aiZsMgXF_0CA-1
Received: by mail-wr1-f70.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso12744742wrr.15
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 02:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iLKIufOxtKfQSkgkc33P7og6BLrOB7EJ26uvbVMvqeo=;
 b=x8y6186BbokoLSSAs68QuX4U1SEm481hoKHWcSsZyDbOR1zBAsAomC16UMJfubLUIG
 uvyDXTuzpmu0CNCkLhAhL09e4U6CjNZAf2TYAjKSM9jbTNWaDvx9k+qmlOGo0qrXIYbn
 YOLq1P7Vcii86f8NMAkWtcAU5KfodTqHE4Dfjs7bM6KgzZGCQm8lfvnFZM7+8OiJgcVv
 HVKBqyZnLmj3CSV9kU1C8Ac63qFbCs7lnKq7+Qk6Hjtp0GUeAjIAM80EPZvc1T+BpEoL
 cHueDZ4a0gpkLvgI/+DpMxd3rrMRen0jcAqTLhzsOUKd/7FmVdkZOgSNIWr+NaqKwPNG
 hDXg==
X-Gm-Message-State: AOAM531mjDKe1lhlVOcyYibj6amGcTV0w6qmZWiENFlwib7DrVUWkLKy
 rRtVVVci5Q3iBf/5HxFcBvnZON+4VhLzSws5J45X8V/WDtpPCNWyOqnYWXQhoHCcJJNO05giAWl
 +ZlVARqq3WHdceSQ=
X-Received: by 2002:a1c:7d91:: with SMTP id y139mr20123802wmc.57.1633944090720; 
 Mon, 11 Oct 2021 02:21:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDq3J5tK8c/yTjEOLJRLytW6XTaz39nH81LkTj2R6vHH5BuRG2OhKe8S2trkIXjOoNdZ8eFw==
X-Received: by 2002:a1c:7d91:: with SMTP id y139mr20123775wmc.57.1633944090431; 
 Mon, 11 Oct 2021 02:21:30 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ba.dip0.t-ipconnect.de. [91.12.100.186])
 by smtp.gmail.com with ESMTPSA id b10sm2664770wrf.68.2021.10.11.02.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 02:21:29 -0700 (PDT)
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20211008203811.1980478-1-farman@linux.ibm.com>
 <20211008203811.1980478-3-farman@linux.ibm.com>
 <0addcdbc-50cb-420d-5864-af3a8a894321@redhat.com>
 <28832611-02f0-7e52-6f15-39427c96d8bf@de.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH v1 2/2] s390x/kvm: Pass SIGP Stop flags
Message-ID: <fd2325a4-7c3a-b677-d259-b3731da507a2@redhat.com>
Date: Mon, 11 Oct 2021 11:21:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <28832611-02f0-7e52-6f15-39427c96d8bf@de.ibm.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11.10.21 10:40, Christian Borntraeger wrote:
> 
> 
> Am 11.10.21 um 09:09 schrieb David Hildenbrand:
>> On 08.10.21 22:38, Eric Farman wrote:
>>> When building a Stop IRQ to pass to KVM, we should incorporate
>>> the flags if handling the SIGP Stop and Store Status order.
>>> With that, KVM can reject other orders that are submitted for
>>> the same CPU while the operation is fully processed.
>>>
>>> Signed-off-by: Eric Farman <farman@linux.ibm.com>
>>> Acked-by: Janosch Frank <frankja@linux.ibm.com>
>>> ---
>>>    target/s390x/kvm/kvm.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>>> index 5b1fdb55c4..701b9ddc88 100644
>>> --- a/target/s390x/kvm/kvm.c
>>> +++ b/target/s390x/kvm/kvm.c
>>> @@ -2555,6 +2555,10 @@ void kvm_s390_stop_interrupt(S390CPU *cpu)
>>>            .type = KVM_S390_SIGP_STOP,
>>>        };
>>> +    if (cpu->env.sigp_order == SIGP_STOP_STORE_STATUS) {
>>> +        irq.u.stop.flags = KVM_S390_STOP_FLAG_STORE_STATUS;
>>> +    }
>>> +
>>
>> KVM_S390_STOP_FLAG_STORE_STATUS tells KVM to perform the store status as well ... is that really what we want?
> At least it should not hurt I guess. QEMU then does it again?

The thing is, that before we officially completed the action in user 
space (and let other SIGP actions actually succeed in user space on the 
CPU), the target CPU will be reported as !busy in the kernel already. 
And before we even inject the stop interrupt, the CPU will be detected 
as !busy in the kernel. I guess it will fix some cases where we poll via 
SENSE if the stop and store happened, because the store *did* happen in 
the kernel and we'll simply store again in user space.

However, I wonder if we want to handle it more generically: Properly 
flag a CPU as busy for SIGP when we start processing the order until we 
completed processing the order. That would allow to handle other SIGP 
operations in user space cleanly, without any chance for races with 
SENSE code running in the kernel.

-- 
Thanks,

David / dhildenb


