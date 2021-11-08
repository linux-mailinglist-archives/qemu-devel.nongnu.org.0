Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02104497DE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:10:26 +0100 (CET)
Received: from localhost ([::1]:49706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6Hx-0004NT-Ci
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:10:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk6Ew-0001TI-Fr
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:07:18 -0500
Received: from [2a00:1450:4864:20::433] (port=41967
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk6Eu-0001EI-6K
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:07:18 -0500
Received: by mail-wr1-x433.google.com with SMTP id d3so27420768wrh.8
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 07:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jz+2xJi1SBXmkJbAJt9XRm16jDFnN6NEdC8o6Rv/1LY=;
 b=wFqbcCg0picKN9P95VHyKuB+iXuBhjGa3KsfKCrpMD4pocGOYdMfZgvqndhq3XCip4
 0n8gOmkxIyIgX42OWC/4oRap4zNv4sOgc9SC2ev+meFHmoBrn7pb168zKEkoXyO+udU0
 DWRNwvltTl097CenPMQfvigxuCiUi6BpDHLROrmGWiItQhkKK28jRKJCi4pl9+RhjvtY
 jYebJLhJYRBZdiYhlBE7cFhL+Ebp8+xxX+5bBBvg6pfQYl7WjERAhx/wWSm4EIdZI7os
 xUqUzDai7hMlyVuyI1bKimK84qANK/l3+VPHHW62FERJ0raoXZYWKZTLv5bYpuy0C83C
 ZFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jz+2xJi1SBXmkJbAJt9XRm16jDFnN6NEdC8o6Rv/1LY=;
 b=qN03TM4PgZBhI0TOnyEXvDcjmlgJbdF2FMc3tmrAt4zTM1XVeTjHRaZXzohaNbHFPQ
 jcs23UaNwnIAetZ7jfgv0Lk3espW9dryPwowM8TK+JMvpswJZnaIzNtEZoGr4FHFrDYS
 j//Ilmp1lhWVnOgti0N11BzmRd78GcMu7igkMpm8DPLcxfnYVgqeLJ+yw41yWGDfcvqv
 MVicOenVpMLGQ3wzFmOuNJgQKJ8ags41FD1JczYif9XhtWde2sTgLOQNR3/VygV6SVNu
 KRjzrGhTduB7ZFOjHwXgn2URqoeiC+O8JeNu24wY/ZIZl8nQx7tJJrP7Sg6KeLaXZgvN
 B0tA==
X-Gm-Message-State: AOAM531OAc+yWd9EA0GzaaJEeGiPZk0xyWuwO4svc6yxKJIhVM7tu8Qh
 //UmRFOP42UMzqtBxmFTwx0/oA==
X-Google-Smtp-Source: ABdhPJyLdZtUt9YCz2FLcxAR5Mz+3Z+j3OpQRaiJ1Zn1DP/8DDHV74+OagSrVnFGWKpN2+cFEsOj7A==
X-Received: by 2002:adf:dec9:: with SMTP id i9mr547639wrn.18.1636384034899;
 Mon, 08 Nov 2021 07:07:14 -0800 (PST)
Received: from [192.168.8.106] (173.red-95-126-185.staticip.rima-tde.net.
 [95.126.185.173])
 by smtp.gmail.com with ESMTPSA id l2sm86267wmi.1.2021.11.08.07.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 07:07:14 -0800 (PST)
Subject: Re: [RFC 2/4] linux-user/signal.c: Create a common
 rewind_if_in_safe_syscall
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211108023738.42125-1-imp@bsdimp.com>
 <20211108023738.42125-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fa216460-3fa2-a5bc-f974-ea2c8cf6430e@linaro.org>
Date: Mon, 8 Nov 2021 16:07:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108023738.42125-3-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.06,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 3:37 AM, Warner Losh wrote:
> All instances of rewind_if_in_safe_syscall are the same, differing only
> in how the instruction point is fetched from the ucontext and the size
> of the registers. Use host_signal_pc and new host_signal_set_pc
> interfaces to fetch the pointer to the PC and adjust if needed. Delete
> all the old copies of rewind_if_in_safe_syscall.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   linux-user/host/aarch64/hostdep.h | 20 --------------------
>   linux-user/host/arm/hostdep.h     | 20 --------------------
>   linux-user/host/i386/hostdep.h    | 20 --------------------
>   linux-user/host/ppc64/hostdep.h   | 20 --------------------
>   linux-user/host/riscv/hostdep.h   | 20 --------------------
>   linux-user/host/s390x/hostdep.h   | 20 --------------------
>   linux-user/host/x86_64/hostdep.h  | 20 --------------------
>   linux-user/signal.c               | 18 +++++++++++++++++-
>   8 files changed, 17 insertions(+), 141 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Although I think we can fairly safely drop HAVE_SAFE_SYSCALL.  It is required for proper 
operation.  As with host-signal.h, really.


r~

