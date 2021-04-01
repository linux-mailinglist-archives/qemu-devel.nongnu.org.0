Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD5C3510F6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:38:47 +0200 (CEST)
Received: from localhost ([::1]:34108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsqk-0004qi-H6
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRso5-0003wp-JV
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:36:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRsns-0004Fx-SZ
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617266145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hj/kyDSZ5TdnjWlbqTEiMA6FGqVVHUHAZEBqp33vsJc=;
 b=LwgT1Y/3EB6vMROkNxHB1SNIl3CrTIYgTTMSq0DzYeBerUPnWmccSdaezK0kEI294BA7Co
 htQw15NDPCJPuaQwam/sqkQmIE101stIScBCCSynZ7pZ36mluLhzs3l35737ZcRTtNKstR
 /6lYbiBoBT2UgYfuh6Vc7z8+XyC+8fY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-c9hoxIhcMV62efn1MpM6_g-1; Thu, 01 Apr 2021 04:35:43 -0400
X-MC-Unique: c9hoxIhcMV62efn1MpM6_g-1
Received: by mail-ed1-f69.google.com with SMTP id bm8so2489670edb.4
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 01:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hj/kyDSZ5TdnjWlbqTEiMA6FGqVVHUHAZEBqp33vsJc=;
 b=pGZZBj/9ZaEJkXulnELkBLNTYrsFLj4uNXG+tMOovfPSqtrOB03aIq2xEEDcOhbHgG
 0vuck93lSQ1Sbb2PFdGU68v6hHOJYnwTSPeg4yYJc7bH/houWvAUcBuMFWjvyglaT4r3
 S08jr34xVovfyNdtIw68AQYvDvUD3aDVTN+wo8gLmAFW7HqopA58V5l62e95oRA8CGYG
 +M7IBfo3rG8NVxyPzroe6apDkf6oPpbHjXKe8N0tY5KSaWhU62XNQi2me+J3xk0L9pRt
 9s9WVtewxVosI7u4nHWWzG2vE1zCMkkNaY0ACk44V3qQ05bVT8fdMK/neQvqpomIFIgi
 wW/Q==
X-Gm-Message-State: AOAM530oGBpTeYJ2fmWGJJeay+k1BHogDIcuPppqtc1AZMhL6YrDxq39
 3Png+9onQ04FEsG32xTsJVpozF9rUnuP9RmxcPmZ4QiY+pQgVkIsZ9qJGEUj9QHnMjbQ7biew+I
 x+PBRTI31e5ItB5k=
X-Received: by 2002:a17:907:75c7:: with SMTP id
 jl7mr8254602ejc.191.1617266142645; 
 Thu, 01 Apr 2021 01:35:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIZ5WuHpPy1IcRpS57OEZ6FyRtmqQKVsXUZgxxgIOKC45Qdek7fpOch7/Za77czjHrSR7Q6w==
X-Received: by 2002:a17:907:75c7:: with SMTP id
 jl7mr8254590ejc.191.1617266142489; 
 Thu, 01 Apr 2021 01:35:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c19sm3142005edu.20.2021.04.01.01.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 01:35:41 -0700 (PDT)
To: Reinoud Zandijk <reinoud@NetBSD.org>, qemu-devel@nongnu.org
References: <20210331200800.24168-1-reinoud@NetBSD.org>
 <20210331200800.24168-3-reinoud@NetBSD.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 2/4] Add NVMM accelerator: x86 CPU support
Message-ID: <5afd10b1-bd32-2f06-b311-246815428bfc@redhat.com>
Date: Thu, 1 Apr 2021 10:35:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210331200800.24168-3-reinoud@NetBSD.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kamil Rytarowski <kamil@NetBSD.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/03/21 22:07, Reinoud Zandijk wrote:
> +void nvmm_vcpu_kick(CPUState *cpu);

Not defined anywhere.

> +{
> +#if NVMM_USER_VERSION == 1
> +    struct sigaction sigact;
> +    sigset_t set;
> +
> +    /* Install the IPI handler. */
> +    memset(&sigact, 0, sizeof(sigact));
> +    sigact.sa_handler = nvmm_ipi_signal;
> +    sigaction(SIG_IPI, &sigact, NULL);
> +
> +    /* Allow IPIs on the current thread. */
> +    sigprocmask(SIG_BLOCK, NULL, &set);
> +    sigdelset(&set, SIG_IPI);
> +    pthread_sigmask(SIG_SETMASK, &set, NULL);
> +#else
> +    /*
> +     * We use the nvmm_vcpu_stop() mechanism, and don't use signals.
> +     * Nothing to do.
> +     */
> +#endif

Since nvmm_vcpu_stop is very similar to KVM's immediate_exit mechanism, 
I think you still need to have a dummy signal handler to kick the VM out 
of the run loop *if it is in the kernel*.  The signal handler however 
can just do nothing.

Also, can you just drop support for NVMM_USER_VERSION == 1?

> diff --git a/target/i386/nvmm/meson.build b/target/i386/nvmm/meson.build
> new file mode 100644
> index 0000000000..c154e78014
> --- /dev/null
> +++ b/target/i386/nvmm/meson.build
> @@ -0,0 +1,4 @@
> +i386_softmmu_ss.add(when: 'CONFIG_NVMM', if_true: files(
> +  'nvmm-all.c',
> +  'nvmm-accel-ops.c',
> +))

The nvmm library should be added here.

Paolo


