Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66613419D04
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:36:01 +0200 (CEST)
Received: from localhost ([::1]:35712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuXo-0000CS-Ef
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangnan.light@bytedance.com>)
 id 1mUtmd-0007Xs-H0
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:47:16 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangnan.light@bytedance.com>)
 id 1mUtmX-0006hl-5S
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:47:12 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 rm6-20020a17090b3ec600b0019ece2bdd20so503993pjb.1
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 09:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=LFR40itf3uS7UIDL+DtvpvvfndY66QPCeJjJuG54ypI=;
 b=B7ZwCAuL4JrzsjFcVomBNrC6fYlLTerGLqMt8UgBBjWFxbLApKkSk4l2ouC2VInv+3
 SfzfGftR5HPh4a4ebBMSHYde4an42hMWSvjPb0k1rrS15UfbU+47j8LkNphM5epuSWrg
 Xe8PrvEeOeXr3uPrkge+zyzj1zxTy8IpjKKFvEKX/7dpPsx/jbUiQYAq2mSDoXsm9Uym
 MfGqgKfRy/suwO0duNci7eKbsbE8f70UaS+GR0MtcCvju+9AJUyfYcU7s8CGfhOfKC8P
 8yKAIpJqepbBJjvGRcL3TUL+9rMmVDoyOE1bfI+N3uB0Gefce+KYt1SzHWzA54gQXR5J
 mx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LFR40itf3uS7UIDL+DtvpvvfndY66QPCeJjJuG54ypI=;
 b=iZB7t7AswPa0SrTL6iQx5WIea95FKXKZFcQ2DX4l3Zeqt7qPXW5ID5CHdOLsvDWzU1
 /2J7jR0lJ3eV7SlMeFK1HEWPYET5/ogk+e/BOzjTm5L8g9t1nEMI4WT2KEBhAm/5eoJ/
 QmzDOOkJmmWVJxiyNVgzfEKW8XhvkxyKNXmmMnjTV9FagIshp0RfbJ9vqFOWFixzqgrb
 9FojcbXdEtnjM5GTUg0TrNc+2Ldu7QrOT+y/FA4pou5vGcN4NL7vtA0pzBW31N9+trU7
 NfYSm159VmbOck/TmFy4M/gNElOrvIC078gLVErRh5cRPOnyJVV4ARYKmL1MWdoEq1mO
 SLfw==
X-Gm-Message-State: AOAM5325j9kElt7r3b8e+2sbWE514jqK+TaUJhf76vcKRZv7uniPNCP0
 VNmrGcmmeptUT18dexSCXAVW2g==
X-Google-Smtp-Source: ABdhPJxCdMtkwWtK+zqcd1vywysGgUjJLW3W49reSqmSMPdhFrNQNi1VNbASMJVeVnHBl2r0jmxGrQ==
X-Received: by 2002:a17:90b:1d8e:: with SMTP id
 pf14mr42292pjb.31.1632761226593; 
 Mon, 27 Sep 2021 09:47:06 -0700 (PDT)
Received: from [10.200.188.243] ([139.177.225.242])
 by smtp.gmail.com with ESMTPSA id n22sm2670376pfa.220.2021.09.27.09.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 09:47:06 -0700 (PDT)
Message-ID: <e1a98460-ad0a-9b9c-5958-bb39635886ec@bytedance.com>
Date: Tue, 28 Sep 2021 00:47:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [External] Re: [PATCH] hostmem: change default prealloc threads
 number
To: David Hildenbrand <david@redhat.com>, imammedo@redhat.com
References: <20210927131951.1810823-1-user@n248-145-203>
 <b14aebb1-489b-b15b-f9eb-047073920175@redhat.com>
From: Nan Wang <wangnan.light@bytedance.com>
In-Reply-To: <b14aebb1-489b-b15b-f9eb-047073920175@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=wangnan.light@bytedance.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 27 Sep 2021 13:32:33 -0400
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
Cc: mikughoull@gmail.com, ehabkost@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/9/27 11:16, David Hildenbrand wrote:
> On 27.09.21 15:19, Nan Wang wrote:
>> From: "wangnan.light" <wangnan.light@bytedance.com>
>>
>> the default number of prealloc threads is 1, for huge memory backend
>> file, single thread touch page is really slow.
>> We can adjust thread number by prealloc-threads property, but if the
>> default value updated to MachineState::smp::cpus may be better.
>> For example, old version of qemu(prealloc-threads have not been
>> introduced yet), the value of threads num is MachineState::smp::cpus,
>> so if someone use the same commandline to start current verion of qemu
>> and old version of qemu which will lead to different behaviors.
> 
> The introducing patch mentions:
> 
> commit ffac16fab33bb42f17e47624985220c1fd864e9d
> Author: Igor Mammedov <imammedo@redhat.com>
> Date:   Wed Feb 19 11:09:50 2020 -0500
> 
>      hostmem: introduce "prealloc-threads" property
> 
>      the property will allow user to specify number of threads to use
>      in pre-allocation stage. It also will allow to reduce implicit
>      hostmem dependency on current_machine.
>      On object creation it will default to 1, but via machine
>      compat property it will be updated to MachineState::smp::cpus
>      to keep current behavior for hostmem and main RAM (which is
>      now also hostmem based).
> 
> So it looks like we want to do the latter via compat properties eventually.
> 
> However, I'd like to note that more prealloc threads might be good for 
> large backends, and might be bad for small backends. To me, it feels 
> like a workload that relies on this should really do this manually. So I 
> am still not sure if this is the right thing to do.
Yes, I agree with you "more prealloc threas are good for large backends, 
and bad for small backends". But I think most situation large backends 
always with large vcpu numbers and small backens always with small vcpu 
numbers, because most users will not create a vm with large vcpu numbers 
with small memory.


> 
> Note that qapi/qom.json:
> 
> "@prealloc-threads: number of CPU threads to use for prealloc (default: 
> 1", so that doc would be wrong now.
> 
> Why exactly can't workload that cares not simply set this manually? 
> Performance tuning smells like something to be done manually for a 
> specific workload.
>
It is a simply way that let workload set the prealloc threads manually. 
For example, for large backends it set many prealloc threads, and set 1 
prealloc threads manually for small backends. Yes, workload can 
`maunally` set prealloc thread to 1, rather than use `default` value 1.
So when workload want to(or maybe just forget specify the 
prealloc-threads property) use the default value, I think the 
MachineState::smp::cpus maybe better than 1.


>>
>> Signed-off-by: wangnan.light <wangnan.light@bytedance.com>
>> ---
>>   backends/hostmem.c | 2 +-
>>   hw/core/machine.c  | 5 +++++
>>   2 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/backends/hostmem.c b/backends/hostmem.c
>> index 4c05862ed5..c4a249b7e6 100644
>> --- a/backends/hostmem.c
>> +++ b/backends/hostmem.c
>> @@ -273,7 +273,7 @@ static void host_memory_backend_init(Object *obj)
>>       backend->merge = machine_mem_merge(machine);
>>       backend->dump = machine_dump_guest_core(machine);
>>       backend->reserve = true;
>> -    backend->prealloc_threads = 1;
>> +    backend->prealloc_threads = machine_smp_cpus(machine);
>>   }
>>   static void host_memory_backend_post_init(Object *obj)
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 067f42b528..95ba5b1477 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -1065,6 +1065,11 @@ bool machine_dump_guest_core(MachineState 
>> *machine)
>>       return machine->dump_guest_core;
>>   }
>> +bool machine_smp_cpus(MachineState *machine)
>> +{
>> +    return machine->smp.cpus;
>> +}
>> +
>>   bool machine_mem_merge(MachineState *machine)
>>   {
>>       return machine->mem_merge;
>>
> 
> 

