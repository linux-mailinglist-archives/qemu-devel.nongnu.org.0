Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93786A1397
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:14:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKn4-0005Xw-9b; Thu, 23 Feb 2023 18:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVKn1-0005XT-La
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:14:15 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVKn0-0007t3-3s
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:14:15 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so921563pjz.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LFCLNvct9XtZxZg9aAQmIHkdV9yBhNjVvzHzNSYHkAc=;
 b=H1tt0CF4KeoqNbGXmRXScGa/wvXn/9c9Cg/0e/S6JRekzGZfQ0SICLz0INhGXt3FDQ
 KdLwEs60FKEj+aP6R3r+8QSMPY6UcJyCDSI1ZAP6KRI7szfP9RbuCz1CO9nEJ9Lrr3PJ
 SUzwdkl3ITaBXUIgoAj4zVGArnz14iBSQHLiO57v+M7dEBtoUyOfWs9TzVpeVtlExeCD
 0G5hy0j8w0pALEekUM2R+L1qZBOH3lcAbkN0T1/YxYL5qraaT94tia5zScpww9Jr0hCX
 IUpE+EiWPgnn1NL6/D7CdVYGZE/kaC+GYzPn7j3TP4uuzW84Nq9+nAZth6etVT/fdRbJ
 L3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LFCLNvct9XtZxZg9aAQmIHkdV9yBhNjVvzHzNSYHkAc=;
 b=KTat+h56DIsJiV7+syDBdiuWUyN7EmhtgLom9K6rm3v5zSFJCbL1r4+/o9pD0sfIsI
 l2lRw8RwrgCgM0Mx0iRYMQC7jA7gSNy93HHqb4tk+x4MMzJIgfRNVW3/UVFxt3wxehP+
 v54SfAmvF44nZ5JUPn+LF7PBDXRUbnZ5N/lcPieVABZJgJYIIOREHNWtRXLyGPxtzeW9
 rfu2QVzR5iSDmXy4IJXVRPj6ALo57Oj5g188TdtFLPsfrFgsF66Bi5SgQnJ3wNhChZhS
 VW9A4YiXOumyhwb4qrrjAK9b9mocXjrEjA75Vs4qIGgsoyYpMvuOdO68G1aqS1K6JHoj
 d6Ag==
X-Gm-Message-State: AO0yUKUCfGLwS5F8ba9fAN7dRSk6Bp6K0DKl+BgZ/SgKkgAD07ZGprTQ
 GdtLX8GQWDxwgvrr9FmybUVV+Q==
X-Google-Smtp-Source: AK7set8CRNrJiEfpjh+Msy0TebJHQPm+l6dM6oe8/0jbnGxuQgrhZLTh0SKBMeUO2Nd8VV3VvvVn/Q==
X-Received: by 2002:a05:6a20:144f:b0:cb:ef77:3f1d with SMTP id
 a15-20020a056a20144f00b000cbef773f1dmr6876207pzi.21.1677194052365; 
 Thu, 23 Feb 2023 15:14:12 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 b21-20020a637155000000b00502e7115cbdsm3569769pgn.51.2023.02.23.15.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 15:14:11 -0800 (PST)
Message-ID: <f6e2725d-ab04-ef77-f959-67c2e69dd17f@linaro.org>
Date: Thu, 23 Feb 2023 13:14:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] linux-user: Fix unaligned memory access in
 prlimit64 syscall
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20230223231137.186344-1-iii@linux.ibm.com>
 <20230223231137.186344-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230223231137.186344-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/23/23 13:11, Ilya Leoshkevich wrote:
> target_rlimit64 contains uint64_t fields, so it's 8-byte aligned on
> some hosts, while some guests may align their respective type on a
> 4-byte boundary. This may lead to an unaligned access, which is an UB.
> 
> Fix by defining the fields as abi_ullong. This makes the host alignment
> match that of the guest, and lets the compiler know that it should emit
> code that can deal with the guest alignment.
> 
> While at it, also use __get_user() and __put_user() instead of
> tswap64().
> 
> Fixes: 163a05a8398b ("linux-user: Implement prlimit64 syscall")
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   linux-user/generic/target_resource.h | 4 ++--
>   linux-user/syscall.c                 | 8 ++++----
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

