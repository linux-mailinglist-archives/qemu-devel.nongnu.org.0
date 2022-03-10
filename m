Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362844D4CAF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:17:57 +0100 (CET)
Received: from localhost ([::1]:59780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSKY8-0003O4-3U
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:17:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSKX9-0002fJ-Nt
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:16:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSKX7-0000vB-Ni
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646925412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AHWcolpUKMQ6wo6/RlZBjNidl+CyZv/eYLiqzH4ZFF0=;
 b=SuqsU5guI0F9K2hDL24PMT/vJprPdx/L6EZBT2DfLRmrja+O1qvWe36hFxL2uJUzHZm+Mm
 why/rai+u38ZdgEwNhwE2sEVOLmTulIXmgo0KSGuo7QtbvYOPB2D/e4BT3U/Rm84FsJ8zU
 wORIF3isbVwwqT8BWYOxlt9SQFJ+0GE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-h-8TwVVUOVmCQok3yUl2Fw-1; Thu, 10 Mar 2022 10:16:50 -0500
X-MC-Unique: h-8TwVVUOVmCQok3yUl2Fw-1
Received: by mail-ej1-f71.google.com with SMTP id
 jy20-20020a170907763400b006db62b6f4e0so3281195ejc.11
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 07:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AHWcolpUKMQ6wo6/RlZBjNidl+CyZv/eYLiqzH4ZFF0=;
 b=8QGp4psfy+aig9XiLC7fCbyoxIa/pSfwE8uOax2xCk+6eEHFDG/cUe+30j87kC3UmF
 vK3QxT+NMaN44ZfKvlcWArfir+Ks4M2uUNS8HaRbTA8/bSJeMF2ADHWqscTR6lJ8z1d/
 K6Cg4tvrqUvag4JBYkxPVDSxuOjoCJtRIPD6NSF+nd095mjV4FiYyMtqnWMN+pZgW9XN
 FZA7qTdm/aFzhyYSG56KUECk3P6ZchWl5WpvifmyYizJu5ytviw9kGJn4oklKzyxQHR5
 cFJyFyIn70VMauUB2PvoNixeC7akZ2LyQNBiWkEYJLmMUXhTIQSJAXJ2kTHVFBrci1WZ
 Cvyg==
X-Gm-Message-State: AOAM530+wHlziSnYoGjsOySAcIdg2JFxeZWI1WGDnmg7B52kFvZoxnar
 mGldR08B2qhdaoL561L6GtD0TJ3Br2/Ii03br5kkjjQZHUMuFO6n+ZEacz5Y55brZkUI1pM1azp
 sXBydH4EF46f8zHY=
X-Received: by 2002:a05:6402:386:b0:415:ead8:ced with SMTP id
 o6-20020a056402038600b00415ead80cedmr4870276edv.407.1646925409676; 
 Thu, 10 Mar 2022 07:16:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzghpTPx063l8aUwvs3kuQOF4o99b2Jt/P0Rv1qJkOI1ZrlBZusp6503kEp/X2rvY+HIj3r0A==
X-Received: by 2002:a05:6402:386:b0:415:ead8:ced with SMTP id
 o6-20020a056402038600b00415ead80cedmr4870248edv.407.1646925409450; 
 Thu, 10 Mar 2022 07:16:49 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 qt22-20020a170906ecf600b006da6ef9b820sm1908348ejb.112.2022.03.10.07.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 07:16:48 -0800 (PST)
Message-ID: <4df842b7-5fee-e38a-82e4-638b4f95920f@redhat.com>
Date: Thu, 10 Mar 2022 16:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH-for-7.0 v2] softmmu: List CPU types again
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220310140728.6506-1-philippe.mathieu.daude@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220310140728.6506-1-philippe.mathieu.daude@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2022 15.07, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Commit e0220bb5b2 made cpus.c target-agnostic but didn't notice
> the cpu_list() function is only defined in target-specific code
> in "cpu.h". Move list_cpus() declaration to "exec/cpu-common.h"
> because this function is not softmmu-specific and can also be
> used by user-mode, along with moving its implementation to cpu.c,
> which is compiled per target.
> 
> Fixes: e0220bb5b2 ("softmmu: Build target-agnostic objects once")
> Reported-by: Max Filippov <jcmvbkbc@gmail.com>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   cpu.c                     | 9 +++++++++
>   include/exec/cpu-common.h | 2 ++
>   include/sysemu/cpus.h     | 2 --
>   softmmu/cpus.c            | 8 --------
>   4 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/cpu.c b/cpu.c
> index d564886149..d50845f713 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -35,6 +35,7 @@
>   #include "sysemu/tcg.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/replay.h"
> +#include "exec/cpu-all.h"

Why not cpu-common.h?

>   #include "exec/exec-all.h"
>   #include "exec/translate-all.h"
>   #include "exec/log.h"
> @@ -266,6 +267,14 @@ const char *parse_cpu_option(const char *cpu_option)
>       return cpu_type;
>   }
>   
> +void list_cpus(const char *optarg)
> +{
> +    /* XXX: implement xxx_cpu_list for targets that still miss it */
> +#if defined(cpu_list)
> +    cpu_list();
> +#endif
> +}
> +
>   #if defined(CONFIG_USER_ONLY)
>   void tb_invalidate_phys_addr(target_ulong addr)
>   {
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 7f7b5943c7..50a7d2912e 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -158,4 +158,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
>   /* vl.c */
>   extern int singlestep;
>   
> +void list_cpus(const char *optarg);
> +
>   #endif /* CPU_COMMON_H */
> diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
> index 868f1192de..b5c87d48b3 100644
> --- a/include/sysemu/cpus.h
> +++ b/include/sysemu/cpus.h
> @@ -55,6 +55,4 @@ extern int smp_cores;
>   extern int smp_threads;
>   #endif
>   
> -void list_cpus(const char *optarg);
> -
>   #endif
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index e1d84c8ccb..7b75bb66d5 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -728,14 +728,6 @@ int vm_stop_force_state(RunState state)
>       }
>   }
>   
> -void list_cpus(const char *optarg)
> -{
> -    /* XXX: implement xxx_cpu_list for targets that still miss it */
> -#if defined(cpu_list)
> -    cpu_list();
> -#endif
> -}
> -
>   void qmp_memsave(int64_t addr, int64_t size, const char *filename,
>                    bool has_cpu, int64_t cpu_index, Error **errp)
>   {

Reviewed-by: Thomas Huth <thuth@redhat.com>


