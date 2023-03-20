Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7786C23BF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 22:33:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peN74-0007iq-OB; Mon, 20 Mar 2023 17:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peN6z-0007iW-9a
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:32:14 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peN6x-000899-J5
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:32:13 -0400
Received: by mail-ed1-x529.google.com with SMTP id h8so52298823ede.8
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 14:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679347929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L4hbmrbRIQcNDo8VsnI++SsmbG2sSNNCiVgnxLl+ZgM=;
 b=fCSd2Q3wcWHu33agHX0oy9KDh1rtotVyMzkzkeQkdEmenom94epip+XGmC+q84URqW
 +fJ/0kiWB0o0I9ydyAsQYaAHa2pTdvyHo+0ROOGB9PBIH67O9uCEfcuo1PLt8pYc1NLI
 0LLAWRaWf7M0SNn/wQNFlrV3/m+Jktie4aJJ8E0X1n9KnPM7VWBSh42E9KFe4h/hCDlY
 vrP8DHYrjOGT3zKYABNFac4uBOIaC3b2DA0P1kWaI8NvdIJnhgd9O+EKJgtOQVFf8dDo
 i/EaI4abVtlszSvdu7+AIVxyqSaXAoC/ll+5aXZwVGLX5QtoRBIAFiuHDXzVnhE3iHJT
 Uu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679347929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L4hbmrbRIQcNDo8VsnI++SsmbG2sSNNCiVgnxLl+ZgM=;
 b=rpABs8dzXHaVf9O2XA8xeM+0fccovp14ytjdrC4wRVG7rh3jLoKXDBWBIHqUBW0Fqa
 G3g7lhKgA0UsbNwoppVhhY04irucTMrJmDy6wgxcsnhbXYBWJWfGrPCNIqgGM548gWU2
 2oxKqxsbDG1o2CErvldt4Hvv9AC7tN/wT1LRPT/2fDm46VNDx7c9Hjg5QIOPpi4/2eLN
 xauPyptQ2lxdhAitPas7HwdPfdq3Ej3j7dgY87acQi8jhQ7Qvvxn73YgvTV26IX2FjpD
 rVNN5szeDzSlL/2QyOnZQP0Az5W78zhVLvouZNbOdoq1QnQy8Km0oWc89ojzQ1MShvUR
 yJBw==
X-Gm-Message-State: AO0yUKXw0CJBUCE07p1pe8+nXhuBwx48wa1w3M4qZZ+GD0p2b6PF8feo
 P3k2AtIMrdK9CxbHQDuvMn1Hew==
X-Google-Smtp-Source: AK7set8/AEaWOCpSapjNPj51P7x0v+u6yKMZj4Rxw3jETv6ohEVYPCisVN6vDiJI58Un6ZQ9ER7/fA==
X-Received: by 2002:a17:906:ce5c:b0:933:4184:f0d7 with SMTP id
 se28-20020a170906ce5c00b009334184f0d7mr560845ejb.69.1679347929014; 
 Mon, 20 Mar 2023 14:32:09 -0700 (PDT)
Received: from [192.168.69.115] (did75-h03-176-184-22-219.dsl.sta.abo.bbox.fr.
 [176.184.22.219]) by smtp.gmail.com with ESMTPSA id
 gy24-20020a170906f25800b00930445428acsm4981804ejb.14.2023.03.20.14.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 14:32:08 -0700 (PDT)
Message-ID: <780daa3b-e096-844e-9661-a2444080afd6@linaro.org>
Date: Mon, 20 Mar 2023 22:32:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/9] include/exec: Replace reserved_va with
 max_reserved_va
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20230317155455.341843-1-richard.henderson@linaro.org>
 <20230317155455.341843-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230317155455.341843-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 17/3/23 16:54, Richard Henderson wrote:
> In addition to the rename, change the semantics to be the
> last byte of the guest va, rather than the following byte.
> This avoids some overflow conditions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-all.h      | 11 ++++++++++-
>   linux-user/arm/target_cpu.h |  2 +-
>   bsd-user/main.c             | 10 +++-------
>   bsd-user/mmap.c             |  4 ++--
>   linux-user/elfload.c        | 21 +++++++++++----------
>   linux-user/main.c           | 27 +++++++++++++--------------
>   linux-user/mmap.c           |  4 ++--
>   7 files changed, 42 insertions(+), 37 deletions(-)


> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 28135c9e6a..cf14930c30 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -283,7 +283,7 @@ static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size,
>       end_addr = start + size;
>       if (start > reserved_va - size) {
>           /* Start at the top of the address space.  */
> -        end_addr = ((reserved_va - size) & -align) + size;
> +        end_addr = ((reserved_va + 1 - size) & -align) + size;
>           looped = true;
>       }
>   
> @@ -297,7 +297,7 @@ static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size,
>                   return (abi_ulong)-1;
>               }
>               /* Re-start at the top of the address space.  */
> -            addr = end_addr = ((reserved_va - size) & -align) + size;
> +            addr = end_addr = ((reserved_va + 1 - size) & -align) + size;

Possible follow-up cleanup:

   addr = end_addr = ROUND_DOWN(reserved_va + 1 - size, align) + size;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Better with another R-b on top ;)

