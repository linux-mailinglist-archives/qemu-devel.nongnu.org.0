Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81F849D4B7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:49:57 +0100 (CET)
Received: from localhost ([::1]:34518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCqAu-0007jQ-N8
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:49:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCqA1-00070m-NL
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:49:01 -0500
Received: from [2607:f8b0:4864:20::102b] (port=43930
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCqA0-0002XN-66
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:49:01 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 d15-20020a17090a110f00b001b4e7d27474so902804pja.2
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GVCmUSEZp4v3pTW6UdpMRMJxS1vjN+Ltpq1PqRrXVVs=;
 b=gvnE1drObwRlFoaafeasLMDEYVA/kwBHbJsbVSP4h2bVqAzySMPhxm6NFIoWnZJstH
 UxdroAan9t30U7DH1LjUf6WSeu/hY4d+slZZ/ImKgzxKg+ERat+TROGmRZ8ZyyVEk/rr
 w6rFFez4vX+83FxPZUaxRZ0hJ5kwQlG7iQ4WzGW4H6OwdVHxTx0WBsBf2T4Mjfiv3/Vx
 1daIr6s9LaFZ3R0sfiXzbNAwDdLMcytwk/8OvC7jDlZTDI8Z+7egqmp3zpl1qWlsJrnE
 myFYCaiMV885dO0vqxTugmAUY7AiLwPasqFFNc/m9HOjhd0uPYWNF6/YQ3xccsDxBYBS
 k9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GVCmUSEZp4v3pTW6UdpMRMJxS1vjN+Ltpq1PqRrXVVs=;
 b=3FVR0Ft1QSHY9MAtAWZC/jgE5lOdJWMA13qltfEeV08DMy1E0vZQtmLFZjPy1Bb685
 /2FKxNrFVmDaiYv944W8hu/KUFTYp0CWjAMeJMmGlAzbc5tWMP3m1SzWxQdUB+YIsLiH
 aZYy1fHRshIMelCnJhD5YTtqGnDRsD+GBNrDz7Rw1RRqdgz/ta6B54EgTh4TmgmciPlY
 emr72YCpO854L7Mm4lcMfNwi8Sk/JLDOVh7EXgXuxxar0khQ4Pr0DOWBxXxoUKxhw0Mb
 9z616P3K26aQa0EenKdOa+HZlQrjL86qpzQcNEc7DQhyLt/ipw7Flk1CWP6V+8L6sr3y
 Cwxg==
X-Gm-Message-State: AOAM533yyLn8go652Lu9k8GiA6xtlrJHrZBt2/JSwxF/wnqd+enrXLpb
 ui1LOEhCkDKmmVf9l4+R7D7MVg==
X-Google-Smtp-Source: ABdhPJz70rfqTl4HxwxI3NF/iLSJO3uRPX0zKr+rD0MUx8pOf3+mCx5sXgzh1q5gwCG/DPaCvpBltA==
X-Received: by 2002:a17:902:edc5:: with SMTP id q5mr729749plk.28.1643233738747; 
 Wed, 26 Jan 2022 13:48:58 -0800 (PST)
Received: from ?IPv6:2001:8003:1d71:4f01:4dac:f487:9ea0:53e8?
 ([2001:8003:1d71:4f01:4dac:f487:9ea0:53e8])
 by smtp.gmail.com with ESMTPSA id a6sm17482535pgq.62.2022.01.26.13.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 13:48:58 -0800 (PST)
Subject: Re: [RFC PATCH] linux-user: expand reserved brk space for 64bit guests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220113165550.4184455-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <da48153c-ebcd-1297-dcf0-d0b62c7b5573@linaro.org>
Date: Thu, 27 Jan 2022 08:46:14 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113165550.4184455-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-s390x@nongnu.org, cohuck@redhat.com,
 thuth@redhat.com, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/22 3:55 AM, Alex Bennée wrote:
> A recent change to fix commpage allocation issues on 32bit hosts
> revealed another intermittent issue on s390x. The root cause was the
> headroom we give for the brk space wasn't enough causing the guest to
> attempt to map something on top of QEMUs own pages. We do not
> currently do anything to protect from this (see #555).
> 
> By inspection the brk mmap moves around and top of the address range
> has been measured as far as 19Mb away from the top of the binary. As
> we chose a smallish number to keep 32bit on 32 bit feasible we only
> increase the gap for 64 bit guests. This does mean that 64-on-32
> static binaries are more likely to fail to find a hole in the address
> space but that is hopefully a fairly rare situation.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   linux-user/elfload.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 64b87d37e8..9628a38361 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2800,11 +2800,17 @@ static void load_elf_image(const char *image_name, int image_fd,
>            * and the stack, lest they be placed immediately after
>            * the data segment and block allocation from the brk.
>            *
> -         * 16MB is chosen as "large enough" without being so large
> -         * as to allow the result to not fit with a 32-bit guest on
> -         * a 32-bit host.
> +         * 16MB is chosen as "large enough" without being so large as
> +         * to allow the result to not fit with a 32-bit guest on a
> +         * 32-bit host. However some 64 bit guests (e.g. s390x)
> +         * attempt to place their heap further ahead and currently
> +         * nothing stops them smashing into QEMUs address space.
>            */
> +#if TARGET_LONG_BITS == 64
> +        info->reserve_brk = 32 * MiB;
> +#else
>           info->reserve_brk = 16 * MiB;
> +#endif

I'd prefer to use 32M unconditionally, but...
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

