Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508723D7552
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 14:51:37 +0200 (CEST)
Received: from localhost ([::1]:57754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8MYa-0005Wt-1W
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 08:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8MWR-00040z-CU
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:49:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8MWP-0003Z4-4A
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627390160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CA7XmkvVtq37BQkPrPzk1hRXIkH0sm8rwjLVD+EE8Q=;
 b=NracOZPdWngT8GEfqAIq43j98Aj2NojY/zHeNA4zJOyKv/ZiogKymoC/Cx+ZesPHxl2APH
 QyHlCq3fzSwxVr3ywpNn6qlr6pbC/Gf/Jw7zE7rCVAcbFcqcpwL2sl06WGamKCAXgLMRiO
 WYbQzEBPADVbowIjf8cxsxNJaN4xjns=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-Y9bfh1KdO26hHjMlkAaidw-1; Tue, 27 Jul 2021 08:49:19 -0400
X-MC-Unique: Y9bfh1KdO26hHjMlkAaidw-1
Received: by mail-wr1-f72.google.com with SMTP id
 p12-20020a5d68cc0000b02901426384855aso5950090wrw.11
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 05:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+CA7XmkvVtq37BQkPrPzk1hRXIkH0sm8rwjLVD+EE8Q=;
 b=dOF/vn1PtYfS/gO5PZfIuUr2wRk/ZJsR8tezBNajiklFA1TvGMA7OpQ+mh8ynh9h7K
 cDvOEMcWcekWoaeJMHiMv+7NH2/esRWhACdOUWUTzoqY5Pg/uYyjfJPC0Kecs3NW0Khf
 7sC+zkJYNI2nhQYeslyy5OXnYR8Q75A0mG/n3SISVy/PB8IP9rdQsSM8tshUuTEnCMn5
 fjmS8Znn3Vth0xmKxQk4B8ddXvMjrdoEq6icGXS0wfNdpG8f9QPMNLQfyLa2O1zdfDVs
 k3Lr0K78TuQdY4BrJ5cZtq51SjHlF45KJmhjeTpZcq4XpyoAV0FrnOTsfIX/cc88rudB
 v2Dw==
X-Gm-Message-State: AOAM533ojJVGnyui+F1gXdw3o/r7IfSSDBK7h2f5FP14rgWhlz2HTDcs
 IZlpkUF/RA0XrX2wK2NC0Cf5vBl3mTc/ePk6whIPRYyiong0oRo8EafNDTG8ok5kZHgdZQo+w3T
 10osQp1Xv8z9k+l8=
X-Received: by 2002:adf:f384:: with SMTP id m4mr9747053wro.129.1627390157779; 
 Tue, 27 Jul 2021 05:49:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyye/EbTN7KwAYclv5KE2uWWaZSClyaE8nmxq/YCuL1qhLtLTM6j18DmrUrt29Mxkz/Io9cEQ==
X-Received: by 2002:adf:f384:: with SMTP id m4mr9747035wro.129.1627390157523; 
 Tue, 27 Jul 2021 05:49:17 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c36.dip0.t-ipconnect.de. [79.242.60.54])
 by smtp.gmail.com with ESMTPSA id
 j1sm2600587wmo.4.2021.07.27.05.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 05:49:16 -0700 (PDT)
Subject: Re: [PATCH v2 5/9] cpus: Use qemu_cond_wait_iothread() where proper
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210723193444.133412-1-peterx@redhat.com>
 <20210723193444.133412-6-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <87955d0b-193a-029b-ae73-86b3df506f5a@redhat.com>
Date: Tue, 27 Jul 2021 14:49:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723193444.133412-6-peterx@redhat.com>
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
> The helper is introduced but we've still got plenty of places that are directly
> referencing the qemu_global_mutex itself.  Spread the usage.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   softmmu/cpus.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 52adc98d39..94c2804192 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -442,7 +442,7 @@ void qemu_wait_io_event(CPUState *cpu)
>               slept = true;
>               qemu_plugin_vcpu_idle_cb(cpu);
>           }
> -        qemu_cond_wait(cpu->halt_cond, &qemu_global_mutex);
> +        qemu_cond_wait_iothread(cpu->halt_cond);
>       }
>       if (slept) {
>           qemu_plugin_vcpu_resume_cb(cpu);
> @@ -585,7 +585,7 @@ void pause_all_vcpus(void)
>       replay_mutex_unlock();
>   
>       while (!all_vcpus_paused()) {
> -        qemu_cond_wait(&qemu_pause_cond, &qemu_global_mutex);
> +        qemu_cond_wait_iothread(&qemu_pause_cond);
>           CPU_FOREACH(cpu) {
>               qemu_cpu_kick(cpu);
>           }
> @@ -656,7 +656,7 @@ void qemu_init_vcpu(CPUState *cpu)
>       cpus_accel->create_vcpu_thread(cpu);
>   
>       while (!cpu->created) {
> -        qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
> +        qemu_cond_wait_iothread(&qemu_cpu_cond);
>       }
>   }
>   
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


