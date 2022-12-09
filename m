Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6EB6485A8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 16:35:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3fNR-00089Z-Lg; Fri, 09 Dec 2022 10:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3fNP-00089A-5x
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:33:27 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3fNM-0002cq-DW
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:33:26 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so127601wmh.0
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 07:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RxKodNOli6Cc7xCegLnHnAT0Mcfuwmf7TnfwMCWsUZc=;
 b=kTe6w+r0Yr7Z+R6C4mgG+jBBrf/Cz6LxKHKWTarDMDDOFhSMoIenTmBf/sTm2BH18L
 2yUILBA2rFPD6oJRkPR9EzXrnEYkpof4JXOiF/sGGNYv5CeCq9FzBGbw/X+C773dKhsI
 243TdvehcFYHUaAWr7ay56negyBK5SPL32CIhE+VHxx4BBIh0GcNT2CMKh09ifr1uNPn
 qdHLs9ZEAuDSQtlMUUh41Vb+fbt+az8AakX2qBqvt4ZWxMoeP8ISYHEjJJq+YQAGOhJM
 3BqCmZk8X0Y10aux1rLud0ElzwthhGxLV0XUYlUGAoTXqtzeIzR1KoXWPkydB0UBL05d
 7e8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RxKodNOli6Cc7xCegLnHnAT0Mcfuwmf7TnfwMCWsUZc=;
 b=4BehLkL8PVSSz+UMUmnbckF/M4L6H3hx1cUXGmHI4wwN1EiVuWk3VHaKQGsVHxHTes
 lWGgmUnfB06bT0w4VghuAvgAd90wL61jqMsHvPw1j5tEd1bH85KQ3Px9gJeM+PGFM4mO
 BdKlkuevbrwtCW0ggoz5Vr1yEtTnudhPI9/8BmoEBUl2B4u8zfyAVXfCYcu4BDyETzSZ
 gttCK5k822RX3U3ad3IApVzxplawtEpFKqG9zWRJI0QbX3XlzMWCMLsSra/JIrtDIN0E
 dSYOeaNYQoG/3JMgqRMAHEZPoYIEBTvj6E/WyVypdfAdcTI6sDej4AxRSH51MMKKlUbn
 NYTw==
X-Gm-Message-State: ANoB5pnUhnJQ5Hr7gCIi2T7szdL1KvTs+36n566PM7ud6OWQOpoQ2uOc
 4zjTtEbZUts7f9glfPHqu1guaPanSUaqP4+bGAY=
X-Google-Smtp-Source: AA0mqf4dUQUzpN4mLpIkmrCg1v7OEnwwlJXnv5qwsmzbGNiXhCUON/zciqnWDw6Ew4rdjQZs0T5GPg==
X-Received: by 2002:a05:600c:5386:b0:3cf:8155:2adc with SMTP id
 hg6-20020a05600c538600b003cf81552adcmr5119002wmb.33.1670600002309; 
 Fri, 09 Dec 2022 07:33:22 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e21-20020a05600c219500b003b435c41103sm186820wme.0.2022.12.09.07.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 07:33:21 -0800 (PST)
Message-ID: <d2b92239-f05a-ed4e-028a-768f02190761@linaro.org>
Date: Fri, 9 Dec 2022 16:33:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0] softmmu: Extract watchpoint API from physmem.c
Content-Language: en-US
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221209141254.68662-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209141254.68662-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

+Peter/Laurent

On 9/12/22 15:12, Philippe Mathieu-Daudé wrote:
> The watchpoint API is specific to TCG system emulation.
> 
> Move it to a new compile unit. The inlined stubs are used
> for user-mode and non-TCG accelerators.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS           |   1 +
>   include/hw/core/cpu.h |   2 +-
>   softmmu/meson.build   |   3 +-
>   softmmu/physmem.c     | 191 ------------------------------------
>   softmmu/watchpoint.c  | 220 ++++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 224 insertions(+), 193 deletions(-)
>   create mode 100644 softmmu/watchpoint.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6966490c94..979c3e2c3f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -120,6 +120,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
>   R: Paolo Bonzini <pbonzini@redhat.com>
>   S: Maintained
>   F: softmmu/cpus.c
> +F: softmmu/watchpoint.c
>   F: cpus-common.c
>   F: page-vary.c
>   F: page-vary-common.c
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 8830546121..b490cc80d8 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -943,7 +943,7 @@ static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
>       return false;
>   }
>   
> -#ifdef CONFIG_USER_ONLY
> +#if !defined(CONFIG_TCG) || defined(CONFIG_USER_ONLY)
>   static inline int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
>                                           int flags, CPUWatchpoint **watchpoint)

I guess remember Peter saying watchpoints could be supported in 
user-mode but I'm not sure... Anyhow if so this can still be done on top of
this patch, which removes 200 LoC from physmem.c which is the 2000 LoC.

