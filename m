Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FB852AB5E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:59:05 +0200 (CEST)
Received: from localhost ([::1]:47502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2PG-0002np-Ok
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nr2Dh-0003Lr-NB
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:47:01 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nr2De-0007Xj-CJ
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:46:56 -0400
Received: by mail-ej1-x62b.google.com with SMTP id i19so36365520eja.11
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NLJuuuSVxBk/7CpbugXf674TuT418NtbCTlb9gQmG5E=;
 b=Pvcra+vAJfnHP1I+8XuqHtw9EWfOtK5yRxnWnB98+4XEEb0nQ+1Bx0ZgEje35Tm5F2
 Nht846cqXj6V/cUjX0qi6vZaSknenxQW00ymD6p7x5BWhB6GccQ9oUBnPf4IXe7tvLFQ
 /Rlu7gJ3ZjLmaq7pILZOrVk5VEgBfte6FdK8l3mq6oh0Lxpdgos5+GIcwufVJ97eGfEh
 dT2zwIyzD36c7zdMvmGIa0v6DBPFJQXbjlz15NXDCGvMRYH3iLxRatipD2TY1bJLXFS0
 RRV4Yhrm/57yudcR8LrAo2DOTYt84o1f8ACXyt7JzNfkG1IftjFWe0a0jhY6RKXbgIPp
 nBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NLJuuuSVxBk/7CpbugXf674TuT418NtbCTlb9gQmG5E=;
 b=cvk6crB+Q13F1GzNWtYa/OTBd40rlAKvu9umj9CIx1Yo3ST+HeoSh+Y6Q8YeR1zgiq
 NzOgzhy0Fs2N0yygz32vN+5R29NjdJytwHYYRmzGmOxm9e5LpJoLoBD3sg8w5v6aIIpL
 gURJFBsW1ajT9reVGwVC1T/VRq4obTFvT76IfS/7qfJNyVWSH3ZujgWS6Z/3ab/ckiN5
 qw5DoYTLIp+WRynieG4UZjANEznf+bUCMAI0ei2Qtz7v2YjGVFWGqTiRDmTbfPYXJFH0
 gtnT5iOhs8maHwxT90cQgBki0dwglEV3ATT5Y2Nx6GHS6VPxl8ToE9L//FVDPLd+gSAK
 EHBA==
X-Gm-Message-State: AOAM5336iBUkcsnjCIS5NHsKAzw7bKLu+fsnyzY0CM0osmU+yEtkXvVN
 mgTVLUWuae5WPndbHmbEjks=
X-Google-Smtp-Source: ABdhPJw0KWCboqwsfzQ0bvMuup3YWz7IEuojQ7FTVGttQhkGUqdi++/3A/e9jIvXduCrzZl9GSWeVw==
X-Received: by 2002:a17:907:3f29:b0:6f4:cb04:a6f5 with SMTP id
 hq41-20020a1709073f2900b006f4cb04a6f5mr21036155ejc.115.1652813211687; 
 Tue, 17 May 2022 11:46:51 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 cq3-20020a056402220300b0042617ba63c2sm8798edb.76.2022.05.17.11.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:46:51 -0700 (PDT)
Message-ID: <3994597b-c559-f62f-504d-3cde3493b713@redhat.com>
Date: Tue, 17 May 2022 20:46:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] hostmem: default the amount of prealloc-threads to
 smp-cpus
Content-Language: en-US
To: dzejrou@gmail.com, qemu-devel@nongnu.org
Cc: david@redhat.com, imammedo@redhat.com
References: <20220517123858.7933-1-dzejrou@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517123858.7933-1-dzejrou@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/22 14:38, dzejrou@gmail.com wrote:
> From: Jaroslav Jindrak <dzejrou@gmail.com>
> 
> Prior to the introduction of the prealloc-threads property, the amount
> of threads used to preallocate memory was derived from the value of
> smp-cpus passed to qemu, the amount of physical cpus of the host
> and a hardcoded maximum value. When the prealloc-threads property
> was introduced, it included a default of 1 in backends/hostmem.c and
> a default of smp-cpus using the sugar API for the property itself. The
> latter default is not used when the property is not specified on qemu's
> command line, so guests that were not adjusted for this change suddenly
> started to use the default of 1 thread to preallocate memory, which
> resulted in observable slowdowns in guest boots for guests with large
> memory (e.g. when using libvirt <8.2.0 or managing guests manually).
> 
> This commit restores the original behavior for these cases while not
> impacting guests started with the prealloc-threads property in any way.
> 
> Fixes: 220c1fd864e9d ("hostmem: introduce "prealloc-threads" property")
> Signed-off-by: Jaroslav Jindrak <dzejrou@gmail.com>
> ---
>   backends/hostmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index a7bae3d713..624bb7ecd3 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -274,7 +274,7 @@ static void host_memory_backend_init(Object *obj)
>       backend->merge = machine_mem_merge(machine);
>       backend->dump = machine_dump_guest_core(machine);
>       backend->reserve = true;
> -    backend->prealloc_threads = 1;
> +    backend->prealloc_threads = machine->smp.cpus;
>   }
>   
>   static void host_memory_backend_post_init(Object *obj)

Queued, thanks.

Paolo

