Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C291EC0C5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 19:13:31 +0200 (CEST)
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgATi-0000bA-6N
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 13:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgASr-0008Vm-0l
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 13:12:37 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:35114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgASp-0000uG-Tr
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 13:12:36 -0400
Received: by mail-pl1-x643.google.com with SMTP id q16so1600353plr.2
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 10:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5A54PLF2iJC05EiEeoJfztH20cLXk7epHiPhOmo37QI=;
 b=WagqZt8xeCsTJZg3UkF6H7TQmS/jbdbwf5jWmfmG0unJEAhzpQck5mCieNQC0ppuLJ
 g9ZbKlkSaGYUHMqpi2OJ6oz5Jmn87+XpIwBzlfEwDT0a6mcHdcoXMd/GYn4RbLEO0DqU
 jbtdq2U5vlJYV92nJ4y079rk26VoWQbjVkGVra3meVewQHwskM0pqVfnX1JpT+heKlTN
 +R9fKfFAtiYdh8dsgJlLMv8LJ34IChiSRqz9JNq5ADFXFR5vY2JC8W3TK1OdglVKEFd6
 zW8591My08z7kacdEAQiBlQeL4eYPx6JgzvGry/t4scuA35tS3xnfyVUG66WJ2EYpm+K
 xCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5A54PLF2iJC05EiEeoJfztH20cLXk7epHiPhOmo37QI=;
 b=qdxnaV2t3aB/MTHzXWWfu4SGb+4Pb9t39xxp29UroHlTpU0q6Yk+tu9AHZCq3ANZfM
 h9E3ZaOjkPSUJJmbwEHgSTFtNn1TwesraS9bK4trQ4NA/U8sj6unQHRW3EhkQJwyJ9KA
 gbbKXOjjb9bNNcXnBybHbK5RH/fOWdT9ahWOgX8Teb5z8NCtkj2i7LWXtdITWAlg7I/h
 klHf/NJfP1qgw1JzuWqihGwT+xvRTGKFFHDzoMOXxVIz3T4oTgdDjGDMSKEVwOR8le/Y
 +P89ow9F6tNWgSaMYICm9hVDVjo06I62rrDs1YRHJedPhzmJsWPr+ONjFZVnph+U0Wuw
 WNSQ==
X-Gm-Message-State: AOAM532sKcYcgZt5RjT/QzT/XOWpaBADNcyU6JXuFSoEhDKZVX/GAOwD
 TkywRUYdkDcSwSW//qhoca+3Ew==
X-Google-Smtp-Source: ABdhPJwVYCLEvXMksjiyR6ULIEIspQYLxsBcAv8+6DwXkvlrrYWBUCRrb8OZ91MTqI6rmsYRxGNfsw==
X-Received: by 2002:a17:90a:ea05:: with SMTP id w5mr190772pjy.37.1591117954260; 
 Tue, 02 Jun 2020 10:12:34 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id t4sm2673011pgj.39.2020.06.02.10.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 10:12:33 -0700 (PDT)
Subject: Re: [RFC PATCH] exec: flush the whole TLB if a watchpoint crosses a
 page boundary
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200602164911.5706-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <77d39647-d6da-35d3-cdc5-6db39d727e4b@linaro.org>
Date: Tue, 2 Jun 2020 10:12:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602164911.5706-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/20 9:49 AM, Alex Bennée wrote:
> There is no particular reason why you can't have a watchpoint in TCG
> that covers a large chunk of the address space. We could be clever
> about it but these cases are pretty rare and we can assume the user
> will expect a little performance degradation.
> 
> NB: In my testing gdb will silently squash a watchpoint like:
> 
>   watch (char[0x7fffffffff]) *0x0
> 
> to a 4 byte watchpoint. Practically it will limit the maximum size
> based on max-value-size. However given enough of a tweak the sky is
> the limit.
> 
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  exec.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/exec.c b/exec.c
> index 5162f0d12f9..851ac180fe7 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -1056,7 +1056,11 @@ int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
>          QTAILQ_INSERT_TAIL(&cpu->watchpoints, wp, entry);
>      }
>  
> -    tlb_flush_page(cpu, addr);
> +    if (((addr + len) & TARGET_PAGE_MASK) != (addr & TARGET_PAGE_MASK)) {

This computation will be false when adding a watchpoint for the last len bytes
in the page, and no actual page crossing is required.  For this reason I prefer

    in_page = -(addr | TARGET_PAGE_MASK);
    if (len <= in_page)


r~

> +        tlb_flush(cpu);
> +    } else {
> +        tlb_flush_page(cpu, addr);
> +    }
>  
>      if (watchpoint)
>          *watchpoint = wp;
> 


