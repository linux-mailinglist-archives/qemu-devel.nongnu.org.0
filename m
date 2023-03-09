Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E606B1E15
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:29:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBdi-0005Me-Bz; Thu, 09 Mar 2023 03:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBdf-0005MO-Vl
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:28:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBde-0003Ij-5D
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678350515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=35Z6VP3bo6N7tEUyjjQe1FfNnrBcCUznYoDzc08FP80=;
 b=IqrEuyEtzHA1edf6o1xm17HSTG5Y/oF7iFtwDdluRs+qAlRKOSem90GFX0RXEIG7Ac/zIZ
 FXdS5wNNmCTgXsGO5KeK38CCYRdriOq6FL37YQhBIxfQ9L9eqJ2POKo4E/J7t1nFihVLuv
 apfYud1pgiQAS20CWesQYUTOIbnbdF4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-BVcR87cwPdiqBKFfltOwXg-1; Thu, 09 Mar 2023 03:28:33 -0500
X-MC-Unique: BVcR87cwPdiqBKFfltOwXg-1
Received: by mail-ed1-f71.google.com with SMTP id
 ec11-20020a0564020d4b00b004e2cb85c8bcso1805937edb.16
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:28:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678350512;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=35Z6VP3bo6N7tEUyjjQe1FfNnrBcCUznYoDzc08FP80=;
 b=py0NrQrPLkpsjVQRfKSLR+ukrO7zzKz9RFlg6BlOm1ixmCU137xdRJPdVy4jVsbSHz
 5QDK5/k1HL01+jD5QMJfxj9DvMKXuR+PBi7XthCWJu38EicsuJWvQ1i6I9Lt2wjxD10Q
 a1R/dl1e55PnNb/RL01YLKIOAiWJhPs7Ww7Ev6foU0ba7tNd1+DQkFh2cjhE/URU/K9l
 H4MCirazbi3jYyocSRHKOLHlnse45cGjZMTe6KARaTUTHObHhJpX159hAXpRAc9tNQ+2
 TB4eYwm149U/SlR6gg9aZ/hXoWNUHRmYgiQ1g7YalfraxmYO4izsVAAeqfERCdoxif41
 nXiQ==
X-Gm-Message-State: AO0yUKW/9z+KY19ZX3bNbud21D8DyIysIDkZR/wUw2XaiSiB0BSEQdXC
 O9I+q12kZJobZjpFKHE7JroQ57Yu0f6wOoEgsKk1N8GXpyoDUv98mPYG/Qck9uedwW+p4FKwjVC
 7u1ai1YfWv1uC0gE=
X-Received: by 2002:aa7:cfc8:0:b0:4b6:821e:1859 with SMTP id
 r8-20020aa7cfc8000000b004b6821e1859mr24786247edy.7.1678350512717; 
 Thu, 09 Mar 2023 00:28:32 -0800 (PST)
X-Google-Smtp-Source: AK7set/XqAFIvbA9Bj9ZQ2VymGIr6NgbLZdSJKSxCjzDTOTx7N1smgH6gJwHhqzynG/nby3lzcGy7A==
X-Received: by 2002:aa7:cfc8:0:b0:4b6:821e:1859 with SMTP id
 r8-20020aa7cfc8000000b004b6821e1859mr24786237edy.7.1678350512449; 
 Thu, 09 Mar 2023 00:28:32 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 z30-20020a509e21000000b004bef1187754sm9265317ede.95.2023.03.09.00.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 00:28:31 -0800 (PST)
Message-ID: <af19bcb4-e21b-6b4c-0103-8bcedf7b7b7b@redhat.com>
Date: Thu, 9 Mar 2023 09:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Fix build without CONFIG_XEN_EMU
Content-Language: en-US
To: mrezanin@redhat.com, qemu-devel@nongnu.org
Cc: dwmw@amazon.co.uk, paul@xen.org, peter.maydell@linaro.org
References: <20230308130557.2420-1-mrezanin@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230308130557.2420-1-mrezanin@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/8/23 14:05, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> Upstream commit ddf0fd9ae1 "hw/xen: Support HVM_PARAM_CALLBACK_TYPE_GSI callback"
> added kvm_xen_maybe_deassert_callback usage to target/i386/kvm/kvm.c file without
> conditional preprocessing check. This breaks any build not using CONFIG_XEN_EMU.
> 
> Protect call by conditional preprocessing to allow build without CONFIG_XEN_EMU.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>   target/i386/kvm/kvm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 1aef54f87e..de531842f6 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -4991,6 +4991,7 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>           kvm_rate_limit_on_bus_lock();
>       }
>   
> +#ifdef CONFIG_XEN_EMU
>       /*
>        * If the callback is asserted as a GSI (or PCI INTx) then check if
>        * vcpu_info->evtchn_upcall_pending has been cleared, and deassert
> @@ -5001,6 +5002,7 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>       if (x86_cpu->env.xen_callback_asserted) {
>           kvm_xen_maybe_deassert_callback(cpu);
>       }
> +#endif
>   
>       /* We need to protect the apic state against concurrent accesses from
>        * different threads in case the userspace irqchip is used. */

Queued, thanks.

Pao


