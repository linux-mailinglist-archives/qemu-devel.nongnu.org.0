Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A18B4197BD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 17:22:30 +0200 (CEST)
Received: from localhost ([::1]:35638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUsSZ-0003eU-0F
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 11:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mUsN6-0000ll-9V
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 11:16:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mUsN2-0007qy-Kf
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 11:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632755803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OZs7PBNNeYbLGiiqjgG/tmMpy/zM7/W7jzP5P0yZjhk=;
 b=jPmkiZbPdRLA9BSxP2OvP8Zn63nuRLZ2Y19MMKJSIeH793cn3qHWI1MZRC7aVS+f4gAJWr
 rz+oy4ruu37HciutaBQHAN4Mlu3VwA9CDOKHlFY7zToHfonZUaTqZaaUgpovhN6ul3NMil
 r02V2LdzPUmMFBcQD53M0FniBvX69jo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-quEgiGFIO76r1XN8JeYtfw-1; Mon, 27 Sep 2021 11:16:41 -0400
X-MC-Unique: quEgiGFIO76r1XN8JeYtfw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so376444wmj.8
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 08:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OZs7PBNNeYbLGiiqjgG/tmMpy/zM7/W7jzP5P0yZjhk=;
 b=YLs1AdzN7p8VK+FzCUH/BMHr82idp7w/w6+yYsqhOuVM/+UDFcP29yj3zOtV2SI3GO
 N/bA7aLoPCUTAC2myvhwJufu+xtWHvhZkxKoGjoLZ5+Lw+SWmm07xE54vlU6PaeNynG3
 0FgU876hjwMt8gsmAlzWBM+tsYApFXgVhkB38KuF8YPv0JJ4/k/5AXTkCO+vcC+lZSsd
 n/1j9dZ1F6skr1ubiVu1XGxlfG+H9WiuPEQhuIdDoM/YcZjL6akX/Gx8edvcV+16Wr/T
 Kxic/CtTAtCT0J2ieygLiltR8aVfiyLehCQtUINqMHFOGNbxRpeEf9S0XxuNhx6LpDcV
 Lvhw==
X-Gm-Message-State: AOAM532VJ+8Pkei/4sss0LqK+RsiKBRJb4qGzlbAi2qFEiHhJDVH7tsw
 NDleNdMvQHz5anTQ2xhgZzc6jkfJE12aSlCC5fXOpnTO24qiQXN1i9hTlY6HH0D9EjCJBnfy9rK
 sGyvI0YKRrWv0E9fbJQ3uXmxqZ3ZKreXtb3qv0WIkXnHfy5sHrn0dvLth9GG8l4g=
X-Received: by 2002:a1c:7e87:: with SMTP id z129mr440091wmc.75.1632755799963; 
 Mon, 27 Sep 2021 08:16:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNwVefyDjzxY2u/2kwqFfrNJL/bbQAEccMdm+PerV9UM8nTFGlFqc/C+9Ehdd/tViVzBD8eg==
X-Received: by 2002:a1c:7e87:: with SMTP id z129mr440067wmc.75.1632755799691; 
 Mon, 27 Sep 2021 08:16:39 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c654d.dip0.t-ipconnect.de. [91.12.101.77])
 by smtp.gmail.com with ESMTPSA id
 d11sm10096772wrx.22.2021.09.27.08.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 08:16:39 -0700 (PDT)
To: Nan Wang <wangnan.light@bytedance.com>, imammedo@redhat.com
References: <20210927131951.1810823-1-user@n248-145-203>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] hostmem: change default prealloc threads number
Message-ID: <b14aebb1-489b-b15b-f9eb-047073920175@redhat.com>
Date: Mon, 27 Sep 2021 17:16:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210927131951.1810823-1-user@n248-145-203>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: mikughoull@gmail.com, ehabkost@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.09.21 15:19, Nan Wang wrote:
> From: "wangnan.light" <wangnan.light@bytedance.com>
> 
> the default number of prealloc threads is 1, for huge memory backend
> file, single thread touch page is really slow.
> We can adjust thread number by prealloc-threads property, but if the
> default value updated to MachineState::smp::cpus may be better.
> For example, old version of qemu(prealloc-threads have not been
> introduced yet), the value of threads num is MachineState::smp::cpus,
> so if someone use the same commandline to start current verion of qemu
> and old version of qemu which will lead to different behaviors.

The introducing patch mentions:

commit ffac16fab33bb42f17e47624985220c1fd864e9d
Author: Igor Mammedov <imammedo@redhat.com>
Date:   Wed Feb 19 11:09:50 2020 -0500

     hostmem: introduce "prealloc-threads" property

     the property will allow user to specify number of threads to use
     in pre-allocation stage. It also will allow to reduce implicit
     hostmem dependency on current_machine.
     On object creation it will default to 1, but via machine
     compat property it will be updated to MachineState::smp::cpus
     to keep current behavior for hostmem and main RAM (which is
     now also hostmem based).

So it looks like we want to do the latter via compat properties eventually.

However, I'd like to note that more prealloc threads might be good for 
large backends, and might be bad for small backends. To me, it feels 
like a workload that relies on this should really do this manually. So I 
am still not sure if this is the right thing to do.

Note that qapi/qom.json:

"@prealloc-threads: number of CPU threads to use for prealloc (default: 
1", so that doc would be wrong now.

Why exactly can't workload that cares not simply set this manually? 
Performance tuning smells like something to be done manually for a 
specific workload.

> 
> Signed-off-by: wangnan.light <wangnan.light@bytedance.com>
> ---
>   backends/hostmem.c | 2 +-
>   hw/core/machine.c  | 5 +++++
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index 4c05862ed5..c4a249b7e6 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -273,7 +273,7 @@ static void host_memory_backend_init(Object *obj)
>       backend->merge = machine_mem_merge(machine);
>       backend->dump = machine_dump_guest_core(machine);
>       backend->reserve = true;
> -    backend->prealloc_threads = 1;
> +    backend->prealloc_threads = machine_smp_cpus(machine);
>   }
>   
>   static void host_memory_backend_post_init(Object *obj)
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 067f42b528..95ba5b1477 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1065,6 +1065,11 @@ bool machine_dump_guest_core(MachineState *machine)
>       return machine->dump_guest_core;
>   }
>   
> +bool machine_smp_cpus(MachineState *machine)
> +{
> +    return machine->smp.cpus;
> +}
> +
>   bool machine_mem_merge(MachineState *machine)
>   {
>       return machine->mem_merge;
> 


-- 
Thanks,

David / dhildenb


