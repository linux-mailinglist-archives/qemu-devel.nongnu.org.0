Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFF63E7D7C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 18:28:46 +0200 (CEST)
Received: from localhost ([::1]:46092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDUcP-0006Bn-N0
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 12:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDUbb-0005TM-6b
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:27:55 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDUbZ-0001r6-G0
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:27:54 -0400
Received: by mail-pl1-x636.google.com with SMTP id a20so21903326plm.0
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qui5deWcfm1NcoBRjMLDw2lVufSxnw4RGyqVvK3YYXo=;
 b=BJiJOtUWO/UXAXHq2NyqC0F8txNhGt8o5IpoHOSZxRWLc2bULI4VmGkvis4j3a56SD
 jYuVRsizvxd8S7RgPWLQxKmML1GbMH+yYj3OBgGTHT4K55olnVhc6fu+av1ww1wWsGYH
 1fmkU4d3trGyQ94mjt8BzzGLszD+fT0M8WN9OuBQt2Hpnkt0wDeFBlvGShEf/OkeFL0U
 vAehBEBoKmkg9/Z56/E/E/NpDnzuMlqk6B22etzioPvl2d9Z+OPykVeluep1GcmYhaY7
 R0t68WxME9bd40+fChzHyQOigHU7igWsmT1QGLv5d4+tGI0nfAByu5WqKtMlERzmL+8K
 QqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qui5deWcfm1NcoBRjMLDw2lVufSxnw4RGyqVvK3YYXo=;
 b=HSEdkCbaQs84oIaXrSOYhPRAo9kXoafKru8xH0MONFdNCtj2JZlKdPrrhne6rBv5JE
 ONzNtWxEFU0RflKIHwZ55LMMkteeeyxPD6EjHebxLegp9pIWqOh0fBv/igBI2UKCxihG
 csfl93XaVfWmFr81Ln+7PM65rNe/W2SJCAnyUiQS5JZZQEDKfPfMuR1qM1as+3qzJ1tw
 LlbZlBfJTLe3i+dVDQvcf2QlpPhtFLTeYHyp1PBxXNuLl70L/wlxs7L8C8mvdwl44kqd
 Lage7P9acybEjLe8gOlsOqTq5GRKWeCYmLr9imvI3nd4ZBotwAPZLJo0WeaSfJUM1dO9
 yEgQ==
X-Gm-Message-State: AOAM530lUlFfCBfyKZnDVpYcJQqwdUDimB4Zfo2PfkAVcGHaWvzLeqg8
 TiEeHnS3p9gnqBH+8EJx0AuX6g==
X-Google-Smtp-Source: ABdhPJw30Q7cc2sJUNWHTozaolsij3iWCqwaNFGw5dsHNOCMsxNl7uP4Nm2BqQpMNy5p3goIwQMtrg==
X-Received: by 2002:a17:902:8f90:b029:12d:1b48:efd8 with SMTP id
 z16-20020a1709028f90b029012d1b48efd8mr12219654plo.23.1628612871998; 
 Tue, 10 Aug 2021 09:27:51 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id d20sm4752238pfu.36.2021.08.10.09.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 09:27:42 -0700 (PDT)
Subject: Re: [PATCH for 6.2 38/49] bsd-user: Update mapping to handle reserved
 and starting conditions
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-39-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e313acb9-b70f-c3f4-495c-db0c2b779ffb@linaro.org>
Date: Tue, 10 Aug 2021 06:27:31 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-39-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 =?UTF-8?Q?Mika=c3=abl_Urankar?= <mikael.urankar@gmail.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh <imp@FreeBSD.org>
> 
> Update the reserved base based on what platform we're on, as well as the
> start of the mmap range. Update routines that find va ranges to interact
> with the reserved ranges as well as properly align the mapping (this is
> especially important for targets whose page size does not match the
> host's). Loop where appropriate when the initial address space offered
> by mmap does not meet the contraints.
> 
> Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/main.c |  23 ++-
>   bsd-user/mmap.c | 372 ++++++++++++++++++++++++++++++++++++++++--------
>   bsd-user/qemu.h |   5 +-
>   3 files changed, 335 insertions(+), 65 deletions(-)
> 
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 93ef9298b8..36852604f8 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -49,12 +49,29 @@
>   #include "target_arch_cpu.h"
>   
>   int singlestep;
> -unsigned long mmap_min_addr;
>   uintptr_t guest_base;
>   static const char *cpu_model;
>   static const char *cpu_type;
>   bool have_guest_base;
> +#if (TARGET_LONG_BITS == 32) && (HOST_LONG_BITS == 64)
> +/*
> + * When running 32-on-64 we should make sure we can fit all of the possible
> + * guest address space into a contiguous chunk of virtual host memory.
> + *
> + * This way we will never overlap with our own libraries or binaries or stack
> + * or anything else that QEMU maps.
> + */
> +# ifdef TARGET_MIPS
> +/* MIPS only supports 31 bits of virtual address space for user space */
> +unsigned long reserved_va = 0x77000000;
> +# elif defined(TARGET_PPC64)
> +unsigned long reserved_va = 0xfffff000;
> +# else
> +unsigned long reserved_va = 0xf7000000;
> +# endif
> +#else
>   unsigned long reserved_va;
> +#endif

All of these 7's look to be copying an old linux-user bug.
I cleaned this up in 18e80c55bb6.

Otherwise,
Acked-by: Richard Henderson <richard.henderson@linaro.org>

I would hope one day this memory management could be shared between the user-only 
implementations.  It's complicated enough...


r~

