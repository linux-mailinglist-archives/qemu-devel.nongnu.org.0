Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C376A12D7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 23:32:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVK7u-0000sr-UG; Thu, 23 Feb 2023 17:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVK7j-0000pl-M4
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:31:42 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVK7i-000221-2K
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:31:35 -0500
Received: by mail-pj1-x102e.google.com with SMTP id pt11so15223480pjb.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 14:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aW/USVJ9xOjJM7rhPp+OfMvACF2Y+Y/CYxe2D7uHVcA=;
 b=Vz6kxcxQqA4OrHJM5x98iuy1ywnbXp0mAWDaWTKU4UMEX4Xr1KhzjQMoKL7qF1Vasu
 ExDYdPLatIfAG2cZ74uiKYGb1Kd1IK1FNq3kK+01VNTzwp5PQOxw4hGecyOaDd1ZGo6r
 KJMDqHeHEc7zCvZwRbfAFxnz5SyM6/zVWOipJSwbKQeoQFnPP/ZRcA3fHDm/uGi4+ZFY
 IRpqS2u8rf8QttA6N74A4+GaGkssGZPgpQWLY/Y+ZNnbLTYWQU00KqNGwZqi6b9cMGH5
 xhsaikxmEjfKa0gIhWIns5obEWxYSQg6Y6zXNApKle6zdZPantFYYHMqhPrf7QZic/rG
 H0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aW/USVJ9xOjJM7rhPp+OfMvACF2Y+Y/CYxe2D7uHVcA=;
 b=TeKorpugTSDiymaFjMOhX8Lt50/RVyiY1IdChITtj4MyuVgb7hIqf4Su7JW2MHgRCm
 OfZ0C+VzuXV7Vjz7S5OhjgeyaOYRvUM8tiornHjdQHopfQz5awmT/HudatLHxw+RIb26
 Aub20CuyslbLr2epUpbbNwtYGtMZjOryU1vEl9YEt2wJTNwww8WvpTlX6wmDo0UY6Lyz
 Vhpyt614/MTIzWedyGjmPlGytNG3N/b6f8jVDGt3i90QMAc7Crt7J5XNwGNrok47PR0M
 vIFvbGSap+eWUWX/Vjd6AjKYDKCkWgp1fLaU69Xk7CeKawASe1xJQhTyAXvY7giFXSli
 A2Vg==
X-Gm-Message-State: AO0yUKUSri/zsj7W5olacVtsIh63430uX+0qB3GLcei0O1fjamyXSq0Y
 sjo2jQtPVYHI0E12/iw+YOyeNA==
X-Google-Smtp-Source: AK7set8md6tCwUbCf/dekq0Bdtzkp34MWlffG8dV38eKp8aOPwBUmfP1eHgyicIPr8SeVOD6lr4v4g==
X-Received: by 2002:a17:90b:38c7:b0:234:a88e:d67e with SMTP id
 nn7-20020a17090b38c700b00234a88ed67emr15055706pjb.34.1677191492417; 
 Thu, 23 Feb 2023 14:31:32 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 gc17-20020a17090b311100b00235419fc2d1sm184238pjb.40.2023.02.23.14.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 14:31:31 -0800 (PST)
Message-ID: <f4d837ce-1a2a-9e7d-4499-76820d6fdc36@linaro.org>
Date: Thu, 23 Feb 2023 12:31:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] linux-user: Fix unaligned memory access in prlimit64
 syscall
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20230223215834.166055-1-iii@linux.ibm.com>
 <20230223215834.166055-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230223215834.166055-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 2/23/23 11:58, Ilya Leoshkevich wrote:
> 32-bit guests may enforce only 4-byte alignment for target_rlimit64,
> whereas 64-bit hosts normally require the 8-byte one. Therefore
> accessing this struct directly is UB.
> 
> Fix by adding a local copy.
> 
> Fixes: 163a05a8398b ("linux-user: Implement prlimit64 syscall")
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/syscall.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index a6c426d73cf..8ae7696d8f1 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -12876,7 +12876,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>       case TARGET_NR_prlimit64:
>       {
>           /* args: pid, resource number, ptr to new rlimit, ptr to old rlimit */
> -        struct target_rlimit64 *target_rnew, *target_rold;
> +        struct target_rlimit64 *target_rnew, *target_rold, tmp;

The bug is that target_rlimit64 uses uint64_t (64-bit host alignment), when it should be 
using abi_ullong (64-bit target alignment).  There are quite a number of these sorts of 
bugs in linux-user.


r~

