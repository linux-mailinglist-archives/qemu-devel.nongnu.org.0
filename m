Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1385A6DB8C4
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 06:18:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pl01D-0004m4-0F; Sat, 08 Apr 2023 00:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl01B-0004lf-NK
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 00:17:37 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl01A-0003lz-47
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 00:17:37 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-63262355155so68218b3a.2
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 21:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680927454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lVJTv/KYcj5s5h2/xecWpW4NQ7yGRWj+kwesUyQ0/6E=;
 b=lh+bRpyRPfWIYK6yDR5IjTMiYWJGB77utURwDzV6Bl/oIYOf7nCGv3aFA7zNzSFcb1
 cxWz5jy6CNko3Mf/dD+aUe0971/72MjGLXYXh44U1rZzefX6QnQMepdkWdk/FmzBDMGs
 9wTAS4lj63gS/o4jRcv3qj0RL8W+7jh7G7/ae4RhiqTOXPDnXyIq09WKMoF5ayue2uUb
 fBXhFbdpfFaV7tdHY1xQcNFmHyKtWoSsa1XtUnQFHkGjhP0pFzOYrLtmhZIWnOE+ZQCb
 gIBKcGqnKr5vMXDcc+nUBTDL/NStbfFuqcZMBZTJmlwlyoTmUXNAEuMHnpxl/Q1gWfoU
 Hy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680927454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lVJTv/KYcj5s5h2/xecWpW4NQ7yGRWj+kwesUyQ0/6E=;
 b=UiBzsCha/hWnaS43d89F1tVMdBaVvrsfTFG79KoB1x2p/OlYUi1zKIy/UxmqI4v3qR
 jcGff485VxUqF+W+twIunND0xcJnpA0FfoFMvBLriA9RTiaaiYqt7Nj5WnyJfNtCY0Wm
 ugjBeK5C/bmW2+41bX13e4xNirrbb2CyTNmpS577v4wQL84gh5ssFZMe708W26PqyhqZ
 6MeyXK7gd9ssCIZQwB+bpd2EGYIm7NxkLjf731Z+tr0RthTDhONwpbnyAp9reMlquoWP
 0p/cmQPA2lW8B89j9DbChgrqWbse/VSJGTXtp6DUokOIu0/Ow04Duor28WV6hUg6Hf6H
 rHDw==
X-Gm-Message-State: AAQBX9dh168uehjp3+vvTwD+pk7htH45ERJcmLiIYqINMfJnqwhPz3P7
 y/P6LgB9cMtqNpY2o0bDZ+19qw==
X-Google-Smtp-Source: AKy350aHIKNyYYlBX6ZXpb40vFVJhyNbb03665wmaURB5Zdo7JNTR2xMbpGJ4FGDw2bv4w/s7FpYFQ==
X-Received: by 2002:a62:1c58:0:b0:626:2984:8a76 with SMTP id
 c85-20020a621c58000000b0062629848a76mr772678pfc.34.1680927454081; 
 Fri, 07 Apr 2023 21:17:34 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a62e509000000b00580e3917af7sm3758893pff.117.2023.04.07.21.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 21:17:33 -0700 (PDT)
Message-ID: <c56f4f56-6cba-ceaa-9f89-228fafcbc2ac@linaro.org>
Date: Fri, 7 Apr 2023 21:17:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/arm: Fix debugging of ARMv8M Secure code
Content-Language: en-US
To: pbartell@amazon.com, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230408000118.50854-1-pbartell@amazon.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230408000118.50854-1-pbartell@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/7/23 17:01, pbartell@amazon.com wrote:
> From: Paul Bartell <pbartell@amazon.com>
> 
> Revert changes to arm_cpu_get_phys_page_attrs_debug made in commit
> 4a35855682cebb89f9630b07aa9fd37c4e8c733b.
> 
> Commit 4a35855682 modifies the arm_cpu_get_phys_page_attrs_debug function
> so that it calls get_phys_addr_with_struct rather than get_phys_addr, which
> leads to a variety of memory access errors when debugging secure state
> code on qemu ARMv8M targets with gdb.
> 
> This commit fixes a variety of gdb memory access errors including:
> "error reading variable" and "Cannot access memory at address" when
> attempting to read any memory address via gdb.
> 
> Signed-off-by: Paul Bartell <pbartell@amazon.com>
> ---
>   target/arm/ptw.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index ec3f51782a..5a1339d38f 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2999,16 +2999,12 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
>       CPUARMState *env = &cpu->env;
> -    S1Translate ptw = {
> -        .in_mmu_idx = arm_mmu_idx(env),
> -        .in_secure = arm_is_secure(env),
> -        .in_debug = true,

Nack.  This will now affect vcpu state by changing the contents of the softmmu tlb, as 
well as changing the contents of memory (!) via PTE access/dirty bit updates.

A more complete description of "a variety of ... errors", and the conditions under which 
they are produced, would be appreciated.

r~

