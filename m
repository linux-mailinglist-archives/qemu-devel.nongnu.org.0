Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5444C6872E4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 02:17:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNOCn-00041u-AM; Wed, 01 Feb 2023 20:16:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNOCa-00040L-PP
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 20:15:58 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNOCZ-0007My-1C
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 20:15:48 -0500
Received: by mail-pj1-x1036.google.com with SMTP id mi9so458729pjb.4
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 17:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OWVvPj5to7J6UIaBeBiaYs/1do/+D3NGriAplXfgCXc=;
 b=b8g4JAh9kym+rwDAxBgv4x4Kf9CoyoZuDNyRH0Afk95cSK+p/S57cke8SRI5h9tPvj
 uKbSuUAWUuYaFlNEFbmPDOy8Ay+4YmK4cQMv72Rb6JR3YJ/lA2M0DLga7hb2e4vJ63UL
 FlQltfnbdl6X8f6b+5VN9pwOvnTrb3N47QX9ChU/v233s68QNpV6bEg4rf7gRSrP6HVl
 4Sld9XAgn6iVddI5AJ1gJivSzwsLwx9Cy+XGURyCxjezfP0+maT/MGApzzbEL/fui1wX
 6lxONs05KjEIUP1aIyqyuNN8/ZZA0OAE1Hqayd8QrdI6leD7rX4P95zTLblcfnZ1E41A
 5cBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OWVvPj5to7J6UIaBeBiaYs/1do/+D3NGriAplXfgCXc=;
 b=G6eis6tqPC4XJnDznGlR2dFAZKmG65xn+Wu6zuG0HgG7b/q3tPtLzGQCTebeby/RY7
 muMFk3XgUQu3SDPUw2dLBGzGqJFbpp19ad1e+506ffNFzERwUH45U04mlm5zMNuG+4S8
 6E3Pm+WUm0D9PA6odBvqJw6AnbcmUvIetVihaJZUY6CGUiB+g5i3zQH4Vam293RuYQGL
 83GWMoeprr3sTDmZ0foATT7pVjbd4EcMRas0g/qugr+s9BxnAu2LSPCYYCHTFrI6Xyko
 T3scTlFmm8nxbufzMUe8+0YlvNnvVrDPmigOo/OVAK68liS0K7l1Kk3VdglhufxedHUy
 Ti/w==
X-Gm-Message-State: AO0yUKWBSjHybrQ0G9JInRqqSQJeDPjUPWLSxt2anyKvuWZK3LS73ERP
 Z08oV24UkHxn9OLw/hJz3S8FmJrZmO/gWDdr
X-Google-Smtp-Source: AK7set/bumu7eXn9EAFT2l1LOGpPYNoav6NBW4kfzYQjUB+iUUsHPf7APU1Fr/vVFKmO4ogCvkqXeA==
X-Received: by 2002:a17:902:f30d:b0:196:1d89:7002 with SMTP id
 c13-20020a170902f30d00b001961d897002mr483129ple.31.1675300545148; 
 Wed, 01 Feb 2023 17:15:45 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 o9-20020a170902778900b00186b69157ecsm12316546pll.202.2023.02.01.17.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 17:15:44 -0800 (PST)
Message-ID: <2da3d006-e3d4-69a1-0335-bfb951780d9c@linaro.org>
Date: Wed, 1 Feb 2023 15:15:41 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/14] linux-user/sparc: Tidy syscall trap
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk, laurent@vivier.eu, iii@linux.ibm.com
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
 <20230202005204.2055899-3-richard.henderson@linaro.org>
In-Reply-To: <20230202005204.2055899-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 2/1/23 14:51, Richard Henderson wrote:
> Use TT_TRAP.
> 
> For sparc32, 0x88 is the "Slowaris" system call, currently
> BAD_TRAP in the kernel's ttable_32.S.
> 
> For sparc64, 0x110 is tl0_linux32, the sparc32 trap, as also
> seen in the adjacent code.  We do not implement multiple abis,
> so treat this as !defined(CONFIG_COMPAT), which vectors this
> case to BTRAP.  This was presumably a typo for 0x111, which is
> the "old" linux64 syscall number.  Both old and new linux64
> syscalls traps vector to LINUX_64BIT_SYSCALL_TRAP.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/sparc/cpu_loop.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
> index c120c42278..18d5c24af1 100644
> --- a/linux-user/sparc/cpu_loop.c
> +++ b/linux-user/sparc/cpu_loop.c
> @@ -167,12 +167,11 @@ void cpu_loop (CPUSPARCState *env)
>           }
>   
>           switch (trapnr) {
> -#ifndef TARGET_SPARC64
> -        case 0x88:
> -        case 0x90:
> +#ifdef TARGET_SPARC64
> +        case TT_TRAP + 0x11: /* tl0_oldlinux64 */
> +        case TT_TRAP + 0x6d: /* tl0_linux64 */
>   #else
> -        case 0x110:
> -        case 0x16d:
> +        case TT_TRAP + 0x10: /* t_linux */


Bah.  I just realized this is wrong.  This breaks v8plus.
What's needed is


#ifdef TARGET_ABI32
#define TARGET_TT_SYSCALL  TT_TRAP + 0x10
#else
#define TARGET_TT_SYSCALL  TT_TRAP + 0x6d
#endif

and ignore tl0_oldlinux64 (0x111), which must be so old
that we've never missed it.


r~

