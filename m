Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0A73EB57A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 14:27:55 +0200 (CEST)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEWHy-0001Zy-I0
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 08:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mEWGi-0000fw-IQ
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 08:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mEWGf-0007kF-Uy
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 08:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628857592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rTvdErtPi/9FgrlRw5+Hu+vgaXHq/lVFZHFPvoKMePg=;
 b=In+SRlgWzeY0SwJ7XYP/wkcRv9bDEX/GT7l8E/5k85pzK1kS+rMDF4BjuqdW4IG9bbVr68
 olOS/+esJ4ARp1Jx9BVlOtNuUNqmlrygjjY74vK3Xaiq3jy+lNPt8UQ6AvgZIkPxH9LI0u
 1riX5blane94v0jl3Hmh/lRi9jOLJPc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-T6VbhPH-PCuxok-adJnBVw-1; Fri, 13 Aug 2021 08:26:31 -0400
X-MC-Unique: T6VbhPH-PCuxok-adJnBVw-1
Received: by mail-wr1-f72.google.com with SMTP id
 n10-20020a5d660a0000b02901551ef5616eso2369148wru.20
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 05:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rTvdErtPi/9FgrlRw5+Hu+vgaXHq/lVFZHFPvoKMePg=;
 b=Xw0JqFGxmFi9J1RLsRHIz2amTqhG9fVER0vT7x9lJxdlZl2jaE59Ov5SJYChgbggaY
 596UnceGCAJll5mIK2etUm8AT0Eb1LE81Ly0rs+owe8ZKAGXTfPHV2Qz5dskZLQOcuIw
 PsxS0k6BHoaszbne0pRAXvog1GvmB3xXyH53l0g3N0SRtbCUQ3OPuEQqjZyydP15tI/n
 kTlFMuL/b7Cn4+XH2n/Qftx88h6k5m5rtJUcoANdtcuEUN76t4tCc9k5EXJZdIBJALpj
 JcCKg1JtaNuQ5UW2k8cvXhzWudFZGHs+Rmeh/upDi5VK1L3N0XzyfTODP3VNxJj8CnmU
 x2lA==
X-Gm-Message-State: AOAM531uGYtx5ng4JEf39GVBWYHR6B20VOoKLkHMDAN65qXRl8gmlFK2
 dIn0Glw3frVMmaLDU+8bgyPEa8sJ3j5QDoP2YAGqd9hIJvtjcPUSq2Phgju3rnsuY7hnPHsmKB5
 agMaL/cFpxrZFEqM=
X-Received: by 2002:a05:600c:245:: with SMTP id 5mr2409765wmj.71.1628857589949; 
 Fri, 13 Aug 2021 05:26:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEmx1ibsSBI+u+5BriXGdNakfXsSdQEl5Htc6MhuDJsHN1RHO8fnD5vgPk1rgyYC93STwwYw==
X-Received: by 2002:a05:600c:245:: with SMTP id 5mr2409737wmj.71.1628857589712; 
 Fri, 13 Aug 2021 05:26:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d18sm1484762wrb.16.2021.08.13.05.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 05:26:28 -0700 (PDT)
Subject: Re: [PATCH-for-6.1? v2 2/3] hw/core: Have MachineClass::smp_parse()
 return boolean on error
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210813112608.1452541-1-philmd@redhat.com>
 <20210813112608.1452541-3-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7a8c8e25-d88b-b1f7-7ecd-b44731d20792@redhat.com>
Date: Fri, 13 Aug 2021 14:26:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813112608.1452541-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/08/21 13:26, Philippe Mathieu-Daudé wrote:
> Just for consistency, following the example documented since
> commit e3fe3988d7 ("error: Document Error API usage rules"),
> return a boolean value indicating an error is set or not.
> Directly pass errp as the local_err is not requested in our
> case.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

This was intentional; no one should invoke mc->smp_parse directly except 
for machine_set_smp, therefore if mc->smp_parse returns bool there are 
more places where things can go wrong (instead of just the one that is 
fixed by patch 3).

Paolo

> ---
>   include/hw/boards.h |  2 +-
>   hw/core/machine.c   | 12 +++++++-----
>   hw/i386/pc.c        | 10 ++++++----
>   3 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index accd6eff35a..d5b7058c2e2 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -209,7 +209,7 @@ struct MachineClass {
>       void (*reset)(MachineState *state);
>       void (*wakeup)(MachineState *state);
>       int (*kvm_type)(MachineState *machine, const char *arg);
> -    void (*smp_parse)(MachineState *ms, SMPConfiguration *config, Error **errp);
> +    bool (*smp_parse)(MachineState *ms, SMPConfiguration *config, Error **errp);
>   
>       BlockInterfaceType block_default_type;
>       int units_per_default_bus;
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index abaeda589b7..159c6b098e2 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -743,7 +743,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
>       }
>   }
>   
> -static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> +static bool smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>   {
>       unsigned cpus    = config->has_cpus ? config->cpus : 0;
>       unsigned sockets = config->has_sockets ? config->sockets : 0;
> @@ -752,7 +752,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>   
>       if (config->has_dies && config->dies != 0 && config->dies != 1) {
>           error_setg(errp, "dies not supported by this machine's CPU topology");
> -        return;
> +        return true;
>       }
>   
>       /* compute missing values, prefer sockets over cores over threads */
> @@ -778,14 +778,14 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>                      "sockets (%u) * cores (%u) * threads (%u) < "
>                      "smp_cpus (%u)",
>                      sockets, cores, threads, cpus);
> -        return;
> +        return true;
>       }
>   
>       ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
>   
>       if (ms->smp.max_cpus < cpus) {
>           error_setg(errp, "maxcpus must be equal to or greater than smp");
> -        return;
> +        return true;
>       }
>   
>       if (sockets * cores * threads != ms->smp.max_cpus) {
> @@ -794,13 +794,15 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>                      "!= maxcpus (%u)",
>                      sockets, cores, threads,
>                      ms->smp.max_cpus);
> -        return;
> +        return true;
>       }
>   
>       ms->smp.cpus = cpus;
>       ms->smp.cores = cores;
>       ms->smp.threads = threads;
>       ms->smp.sockets = sockets;
> +
> +    return false;
>   }
>   
>   static void machine_get_smp(Object *obj, Visitor *v, const char *name,
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c2b9d62a358..84138a8bfd2 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -712,7 +712,7 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
>    * This function is very similar to smp_parse()
>    * in hw/core/machine.c but includes CPU die support.
>    */
> -static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> +static bool pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>   {
>       unsigned cpus    = config->has_cpus ? config->cpus : 0;
>       unsigned sockets = config->has_sockets ? config->sockets : 0;
> @@ -743,14 +743,14 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>                      "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
>                      "smp_cpus (%u)",
>                      sockets, dies, cores, threads, cpus);
> -        return;
> +        return true;
>       }
>   
>       ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
>   
>       if (ms->smp.max_cpus < cpus) {
>           error_setg(errp, "maxcpus must be equal to or greater than smp");
> -        return;
> +        return true;
>       }
>   
>       if (sockets * dies * cores * threads != ms->smp.max_cpus) {
> @@ -759,7 +759,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>                      "!= maxcpus (%u)",
>                      sockets, dies, cores, threads,
>                      ms->smp.max_cpus);
> -        return;
> +        return true;
>       }
>   
>       ms->smp.cpus = cpus;
> @@ -767,6 +767,8 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>       ms->smp.threads = threads;
>       ms->smp.sockets = sockets;
>       ms->smp.dies = dies;
> +
> +    return false;
>   }
>   
>   static
> 


