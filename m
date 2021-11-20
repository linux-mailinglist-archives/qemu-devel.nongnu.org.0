Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2DC457EAF
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 14:52:01 +0100 (CET)
Received: from localhost ([::1]:41144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moQme-0002bI-3B
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 08:52:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moQl5-0001jN-Py
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 08:50:24 -0500
Received: from [2a00:1450:4864:20::430] (port=41854
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moQl3-0004jy-8H
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 08:50:22 -0500
Received: by mail-wr1-x430.google.com with SMTP id a9so23336419wrr.8
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 05:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1jRQELO5Gx/DZzpBSGIJlmrDTkZdO9OjFGHir1a5NQc=;
 b=PFFSeIRjMPD6IqzchW6uVYI493IUNYNtTfzQeQP9aJtXK5G9S/uSFuxWYATI8qfBs2
 GWddhHRpewL+4dyUXmK91LGlonMVmarK0yawMf8Vg0NXKG7ugW3gs5/WL0mIUI2JVtnH
 YvF8MM2PafkZoECm2k/q5WfKRp+VxBfBtD2NL+7O4MvGJJNCtcMHpmLQHKAZd+0RIidG
 vO0RefIwhJ8F1eekqvDk2dZmF+IXdubSiUdrv/EpZRMHX8OzFMSd5wB2bNk6Gtm1Jazi
 sWrRH1k/jqx4fIXknS5RqliaTWi7Dxd7DIuKw0cQ57Ehnsa2QgxAjTcSjxenqo7vvLFP
 MoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1jRQELO5Gx/DZzpBSGIJlmrDTkZdO9OjFGHir1a5NQc=;
 b=Mqyas7MclOYZ8CcH0xFbnCCgvmJtpRyMPAUhBht9tFZiwoeAdy29+d1aTioZfZ6r3y
 XbL8yqA64eZlxEIr/SP4rFIny4oOVgS4/RehV23mkxQAE0jFxnI7LaqaAfWLksx6pGas
 PjulklEoB9k6PLUxb0wXlpwHR8mWp5H2B8SvUy7jdx7hFWreLFAu31QnAu0o41E81IO7
 eZ+ktkUcBXsqUzEedG4nTzYjKc0coE0eZtlgzNMD/75mXa8CU1jB9SjBkxdbR6rwU+PX
 wouNBI9i8YeJJF+SnK6zUtPBf7+3VyttLcmzAtMpGUDHlOtjFygoKG+VP5RJI2BLs82s
 WBiQ==
X-Gm-Message-State: AOAM531/TEUQl5BOv3EhEhg4ec/e+Ax4JnUowK4ecjQFOREtjOjUy9Lg
 hsMy0vIbMy+/E3v0KVh8+sF5AQ==
X-Google-Smtp-Source: ABdhPJwY2yS7qZZN9UvabN5F+c53mAI52EDGaNVNm1Ftml59tsB/DoYpMWKYL3NK2yvcsQIrHRRcNg==
X-Received: by 2002:a5d:6781:: with SMTP id v1mr17566944wru.239.1637416219696; 
 Sat, 20 Nov 2021 05:50:19 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id l5sm3402091wrs.59.2021.11.20.05.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 05:50:19 -0800 (PST)
Subject: Re: [RFC PATCH] gdbstub: handle a potentially racing TaskState
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211119145124.942390-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f15d60fd-0717-9357-dad5-72938d4f70f2@linaro.org>
Date: Sat, 20 Nov 2021 14:50:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211119145124.942390-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 3:51 PM, Alex Bennée wrote:
> When dealing with multi-threaded userspace programs there is a race
> condition with the addition of cpu->opaque (aka TaskState). This is
> due to cpu_copy calling cpu_create which updates the global vCPU list.
> However the task state isn't set until later. This shouldn't be a
> problem because the new thread can't have executed anything yet but
> the gdbstub code does liberally iterate through the CPU list in
> various places.
> 
> This sticking plaster ensure the not yet fully realized vCPU is given
> an pid of -1 which should be enough to ensure it doesn't show up
> anywhere else.
> 
> In the longer term I think the code that manages the association
> between vCPUs and attached GDB processes could do with a clean-up and
> re-factor.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/730
> ---
>   gdbstub.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 23baaef40e..141d7bc4ec 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -94,7 +94,7 @@ static inline int cpu_gdb_index(CPUState *cpu)
>   {
>   #if defined(CONFIG_USER_ONLY)
>       TaskState *ts = (TaskState *) cpu->opaque;
> -    return ts->ts_tid;
> +    return ts ? ts->ts_tid : -1;
>   #else
>       return cpu->cpu_index + 1;
>   #endif

Tested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

