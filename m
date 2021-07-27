Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE713D7596
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 15:07:11 +0200 (CEST)
Received: from localhost ([::1]:50662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Mne-0005KB-GX
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 09:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8MlX-0003Ni-Pn
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8MlR-0008Od-Q8
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627391093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5OI+DhbLpaBXaGopumNpe9D6xMlOfVMneCg1LFqviCA=;
 b=OjX3QW2c/WhUoHNldXHKzbHdH2icAbnHf1lEHZI/UX7fgZLXuvzJSSxPxKEYI6oP0CmAkO
 fRz5YbhOjDHsWrMGOGrV0tzlcmqpmYwHAQzOC/Ry/6Zp8HHzwVPFRdxy1bjiufVEE8UiEG
 gqVGKKlyuFHSvEDyR5pwSwIk4N1D3Z8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-w2gOpV_0MGWMY_iWRzjZWg-1; Tue, 27 Jul 2021 09:04:51 -0400
X-MC-Unique: w2gOpV_0MGWMY_iWRzjZWg-1
Received: by mail-wm1-f70.google.com with SMTP id
 o4-20020a05600c5104b029024b7cd56259so479459wms.1
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 06:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5OI+DhbLpaBXaGopumNpe9D6xMlOfVMneCg1LFqviCA=;
 b=AOhUf8zGB9qjKqVW/bq44+yHRZ+2O96rHvi74HEfizyo8hwZd3Iybv7AYkCdhz19gh
 apq6Q/RIVk5hFDcIJHHNxEjzlzRBICnvwkodGd304viD28jV7gxJWaJ7AWs/tE2NmZ1l
 67GO7BjzFzJn9tDjAxyZmGvVGrIL20aBqBb+CxC21v8POOUDwWmNO47Ho97vLe2GiGz6
 gpJ8i/liLZAWt/LH07Q14h0GOr9ug2txAlswilzKbJ8HQSFXgqaxxAhhE5fjTVUMHugX
 WN0fDQv2uZMOTyTmWOgVq8lTV1rzcn4O95BMIxd0JRyWjv6QbmaeYWhaheZk07vOdxbE
 l11A==
X-Gm-Message-State: AOAM5318gx1Bc/2yl6VqczF3MGcCjSghX0lJ+Glj425E5EgkQ+4HQFhm
 pMYReAo2sMfLwl1Qgij8oWd097vCoafqSLT1yovj5ulvFjlcfSxOSPXuqgyNtMr0yNcrDKTgAB2
 Rb3LKqk7CljEUatE=
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr19357831wmr.168.1627391090201; 
 Tue, 27 Jul 2021 06:04:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIFjbdqkdIe0ofoKFQRjV3es0TfphyBceKl55MH7oL2qvu5eZWisqX0p6g6eUf205Cq5T1sQ==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr19357807wmr.168.1627391090000; 
 Tue, 27 Jul 2021 06:04:50 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c36.dip0.t-ipconnect.de. [79.242.60.54])
 by smtp.gmail.com with ESMTPSA id
 d67sm3013491wmd.9.2021.07.27.06.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 06:04:49 -0700 (PDT)
Subject: Re: [PATCH v2 2/9] cpus: Move do_run_on_cpu into softmmu/cpus.c
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210723193444.133412-1-peterx@redhat.com>
 <20210723193444.133412-3-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <6c15cf4f-6991-567f-2fea-a04596184ce7@redhat.com>
Date: Tue, 27 Jul 2021 15:04:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723193444.133412-3-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.07.21 21:34, Peter Xu wrote:
> It's only used by softmmu binaries not linux-user ones.  Make it static and
> drop the definition in the header too.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   cpus-common.c         | 25 -------------------------
>   include/hw/core/cpu.h | 12 ------------
>   softmmu/cpus.c        | 26 ++++++++++++++++++++++++++
>   3 files changed, 26 insertions(+), 37 deletions(-)
> 
> diff --git a/cpus-common.c b/cpus-common.c
> index d814b2439a..670826363f 100644
> --- a/cpus-common.c
> +++ b/cpus-common.c
> @@ -124,31 +124,6 @@ void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi)
>       qemu_cpu_kick(cpu);
>   }
>   
> -void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
> -                   QemuMutex *mutex)
> -{
> -    struct qemu_work_item wi;
> -
> -    if (qemu_cpu_is_self(cpu)) {
> -        func(cpu, data);
> -        return;
> -    }
> -
> -    wi.func = func;
> -    wi.data = data;
> -    wi.done = false;
> -    wi.free = false;
> -    wi.exclusive = false;
> -
> -    queue_work_on_cpu(cpu, &wi);
> -    while (!qatomic_mb_read(&wi.done)) {
> -        CPUState *self_cpu = current_cpu;
> -
> -        qemu_cond_wait(&qemu_work_cond, mutex);
> -        current_cpu = self_cpu;
> -    }
> -}
> -
>   void async_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
>   {
>       struct qemu_work_item *wi;
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index f62ae88524..711ecad62f 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -689,18 +689,6 @@ void qemu_cpu_kick(CPUState *cpu);
>    */
>   bool cpu_is_stopped(CPUState *cpu);
>   
> -/**
> - * do_run_on_cpu:
> - * @cpu: The vCPU to run on.
> - * @func: The function to be executed.
> - * @data: Data to pass to the function.
> - * @mutex: Mutex to release while waiting for @func to run.
> - *
> - * Used internally in the implementation of run_on_cpu.
> - */
> -void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
> -                   QemuMutex *mutex);
> -
>   /**
>    * run_on_cpu:
>    * @cpu: The vCPU to run on.
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 071085f840..52adc98d39 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -382,6 +382,32 @@ void qemu_init_cpu_loop(void)
>       qemu_thread_get_self(&io_thread);
>   }
>   
> +static void
> +do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
> +              QemuMutex *mutex)
> +{
> +    struct qemu_work_item wi;

You could do

struct qemu_work_item wi = {
     .func = func,
     .data = data,
};

instead of the separate initialization below.



> +
> +    if (qemu_cpu_is_self(cpu)) {
> +        func(cpu, data);
> +        return;
> +    }
> +
> +    wi.func = func;
> +    wi.data = data;
> +    wi.done = false;
> +    wi.free = false;
> +    wi.exclusive = false;
> +
> +    queue_work_on_cpu(cpu, &wi);
> +    while (!qatomic_mb_read(&wi.done)) {
> +        CPUState *self_cpu = current_cpu;
> +
> +        qemu_cond_wait(&qemu_work_cond, mutex);
> +        current_cpu = self_cpu;
> +    }
> +}

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


