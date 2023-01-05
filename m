Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D85065E4FC
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 06:10:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDIVG-00065s-GC; Thu, 05 Jan 2023 00:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIVD-00065X-Sj
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:09:20 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIV8-0001em-H3
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:09:19 -0500
Received: by mail-pf1-x433.google.com with SMTP id a30so8916960pfr.6
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 21:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wKGKXRXdbc3YxjI2XIEaKQmnwEMkgFcfN0dTPlBj504=;
 b=Ng42fTsDW33H6jB5vbGoprjG4FJji8a0E3/ep9I33hqNIpz79gh8Tnm4o7Nww7lCWA
 wUs2Ly2XIrQbiA3yt6NO1tRYl8h5D/L9GWgg31vZ1ugvAlzSZA1TpCqhl6Hi4k0mltXR
 EuVcPOlZ0shkjOFAcHkWy0+y9fywfXgpcjRRAnRqI0ZagOcEtmPDNtV/MlMUwWKK013x
 qDxb1/08mEQAmb58V47wP0rGIlEw25G4d2/MsYqcoJluvAj+mUC9FQkHisNawiaFdIcK
 C+BwOeQRAjd0PP12QQhzT5WLbB8GGwEyjZVqfGEKqf+b5wO3j0xgnTAFyCZlYKLC6+sd
 Tp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wKGKXRXdbc3YxjI2XIEaKQmnwEMkgFcfN0dTPlBj504=;
 b=vnpH498YJPS4aFfrt4a8TiA7hECmgvSJCDB+RG8KAvMGE6Xm3TOhCYN7YBV/ozO8Pe
 OM3DkUCjV20EzgEDKP+3LEgmKQL3ci2cCyT/F/e4Mp8ndTgIGfnVGWikvuQyLqQK4PLa
 16DuYxEdaPz3O8xAm3g4jvtzqzFCuF35z3MmaR8HiCnirwpdMOOHbnXD8BIet/x6oTso
 Z8dm+wS2yXSaqcWKzkArmMWkV7eS/rzEmWZTIGf9tAJ3jAhVZVdaxkAJken7eBebw4t7
 TK7ADkFdpZNNCXym2Dq5a8U68MSocNsrRDotOFgVHrEFjEaCtj9YkAycUA9e8sNH1V6u
 O3Dw==
X-Gm-Message-State: AFqh2kpjbbLE/dbKvjHHL7eWC5HCeWF/WmZejzPAsfD7vsjbaaiMa5Y/
 6YyaCLBoR8KnRZTIzE5BrhhgcQ==
X-Google-Smtp-Source: AMrXdXuKfmVU/X200UICsEvwaj+nvARsnp25KvAHL/FFwR5PB7tHn8AY7CRU5+2gzb5XKRcKZXTiDQ==
X-Received: by 2002:aa7:9683:0:b0:581:a8dc:8f94 with SMTP id
 f3-20020aa79683000000b00581a8dc8f94mr26007941pfk.27.1672895352840; 
 Wed, 04 Jan 2023 21:09:12 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee?
 ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
 by smtp.gmail.com with ESMTPSA id
 a6-20020aa795a6000000b005819313269csm14567279pfk.124.2023.01.04.21.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 21:09:12 -0800 (PST)
Message-ID: <8db4f96d-810f-bde5-d33b-12019434db47@linaro.org>
Date: Wed, 4 Jan 2023 21:09:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 22/27] target/arm: Move hflags code into the tcg
 directory
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-23-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-23-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/4/23 13:58, Fabiano Rosas wrote:
> @@ -25,6 +25,7 @@
>   #include "qemu/config-file.h"
>   #include "qemu/option.h"
>   #include "qemu/units.h"
> +#include "sysemu/tcg.h"
>   
>   /* Kernel boot protocol is specified in the kernel docs
>    * Documentation/arm/Booting and Documentation/arm64/booting.txt
> @@ -827,7 +828,9 @@ static void do_cpu_reset(void *opaque)
>                   info->secondary_cpu_reset_hook(cpu, info);
>               }
>           }
> -        arm_rebuild_hflags(env);
> +        if (tcg_enabled()) {
> +            arm_rebuild_hflags(env);
> +        }

We certainly are adding lots of wrapping for this function.
Should we handle it just once in a header instead?

> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -241,7 +241,7 @@ int sme_exception_el(CPUARMState *env, int el)
>   }
>   
>   /* This corresponds to the ARM pseudocode function IsFullA64Enabled(). */
> -static bool sme_fa64(CPUARMState *env, int el)
> +bool sme_fa64(CPUARMState *env, int el)

This function should be moved as well, as it's only used by hflags.

> @@ -25,3 +26,12 @@ void arm_reset_sve_state(CPUARMState *env)
>   {
>       g_assert_not_reached();
>   }
> +
> +void arm_rebuild_hflags(CPUARMState *env)
> +{
> +    g_assert_not_reached();
> +}
> +
> +void assert_hflags_rebuild_correctly(CPUARMState *env)
> +{
> +}

Do we really need these?  I would expect the tcg_enabled() test to dead-code-eliminate the 
calls...



r~

