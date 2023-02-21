Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554B369E27C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 15:38:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUTkR-0006aQ-Il; Tue, 21 Feb 2023 09:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUTkO-0006Zd-Ag
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:36:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUTkL-0004Bu-NX
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676990156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZdbNLXP2TbLSLEQdtTiloMDj6q3mHbBAOhgmGhqVp5Q=;
 b=i7D3niZxa0olmshangg1h+QWZGYWQb/kv5VBAMIxpix0h+BPRu4hDjLnDU9xwTZKZqNNKK
 3OTndp0ml+pWiA4jkaM9m6NwdoDK2723GMWbzvaqK4EX8s8H+jAhRquGUoB/nN0owRn1Kd
 3bbYRMtOY6w2C7zBfmK/DuNFr5GEjeA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-404-WyM6CaVaOVm1tYjEgtv3qQ-1; Tue, 21 Feb 2023 09:35:55 -0500
X-MC-Unique: WyM6CaVaOVm1tYjEgtv3qQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l20-20020a05600c1d1400b003e10d3e1c23so2046397wms.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 06:35:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZdbNLXP2TbLSLEQdtTiloMDj6q3mHbBAOhgmGhqVp5Q=;
 b=aq0Rj1zcZEmc3hgioIHqdzMT027KM759jvSGjSHXbYT+d7MDbDr4Bzsyba1XwtPL83
 gfGeO3MOQBhoOn1kODbxqGQ6K5CBECNaY8mDcjBTsnCEK09K+tSi/8lrOV9Zc45tDlPe
 TnGboYVVXVEWBs99w7afom7ffQO481ExKUiw4OKsAUKq2om5647tGMzM0gwXYkG7/29r
 31ejyon+V/9QkxEo84Dymq+mTaQY4s66lR7WdFW83GPFFnIWw7ZgE0qVBGGfRdeYLYJ5
 0kNHdJ4fS+y+/YLQNzbZGe46AxmFle4K2ZfvHU602gTQaypcqZHOHqVYeP72l68WDBaz
 7oJQ==
X-Gm-Message-State: AO0yUKXtq7cU447RvlQc0EyoHnDfMHW/OrfuTi6iKAOMCjO8YNfl2+wO
 SMzibNZM+ct1vpFfMXrRljkYpwOMBzaeLrj8yw+l+0SPGYnQIGb/12f77wrUPecWNA66ojzco1b
 nwmjFXY6bDcoLw6E=
X-Received: by 2002:adf:f8cc:0:b0:2c5:a605:80c0 with SMTP id
 f12-20020adff8cc000000b002c5a60580c0mr3479457wrq.11.1676990154277; 
 Tue, 21 Feb 2023 06:35:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8pZZD65EZPgYpYmOGS4o0dFMrJNkXdMuPajeZWU+vu7XUCvKyk4432VnZ52q8mmg2H1bYO4g==
X-Received: by 2002:adf:f8cc:0:b0:2c5:a605:80c0 with SMTP id
 f12-20020adff8cc000000b002c5a60580c0mr3479442wrq.11.1676990153951; 
 Tue, 21 Feb 2023 06:35:53 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a056000055100b002c592535838sm5653896wrf.2.2023.02.21.06.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 06:35:53 -0800 (PST)
Message-ID: <0a437546-3b18-3a3a-6ffb-afa93a93c170@redhat.com>
Date: Tue, 21 Feb 2023 15:35:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 27/27] target/s390x: Enable TARGET_TB_PCREL
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
 <20230220184052.163465-28-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230220184052.163465-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 20/02/2023 19.40, Richard Henderson wrote:
> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/cpu-param.h     |  4 ++
>   target/s390x/cpu.c           | 12 +++++
>   target/s390x/tcg/translate.c | 86 +++++++++++++++++++++++-------------
>   3 files changed, 71 insertions(+), 31 deletions(-)
> 
> diff --git a/target/s390x/cpu-param.h b/target/s390x/cpu-param.h
> index bf951a002e..52bb95de57 100644
> --- a/target/s390x/cpu-param.h
> +++ b/target/s390x/cpu-param.h
> @@ -14,4 +14,8 @@
>   #define TARGET_VIRT_ADDR_SPACE_BITS 64
>   #define NB_MMU_MODES 4
>   
> +#ifndef CONFIG_USER_ONLY
> +# define TARGET_TB_PCREL 1
> +#endif
> +
>   #endif
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index b10a8541ff..933ff06395 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -37,6 +37,7 @@
>   #ifndef CONFIG_USER_ONLY
>   #include "sysemu/reset.h"
>   #endif
> +#include "exec/exec-all.h"
>   
>   #define CR0_RESET       0xE0UL
>   #define CR14_RESET      0xC2000000UL;
> @@ -83,6 +84,16 @@ uint64_t s390_cpu_get_psw_mask(CPUS390XState *env)
>       return r;
>   }
>   
> +static void s390_cpu_synchronize_from_tb(CPUState *cs,
> +                                         const TranslationBlock *tb)
> +{
> +    /* The program counter is always up to date with TARGET_TB_PCREL. */
> +    if (!TARGET_TB_PCREL) {
> +        S390CPU *cpu = S390_CPU(cs);
> +        cpu->env.psw.addr = tb_pc(tb);
> +    }
> +}

FYI, this causes a build failure with --disable-tcg:

  https://gitlab.com/thuth/qemu/-/jobs/3806828645#L1885

I'll add this to fix it, no need to respin:

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -84,6 +84,7 @@ uint64_t s390_cpu_get_psw_mask(CPUS390XState *env)
      return r;
  }
  
+#ifdef CONFIG_TCG
  static void s390_cpu_synchronize_from_tb(CPUState *cs,
                                           const TranslationBlock *tb)
  {
@@ -93,6 +94,7 @@ static void s390_cpu_synchronize_from_tb(CPUState *cs,
          cpu->env.psw.addr = tb_pc(tb);
      }
  }
+#endif
  
  static void s390_cpu_set_pc(CPUState *cs, vaddr value)
  {

  Thomas


