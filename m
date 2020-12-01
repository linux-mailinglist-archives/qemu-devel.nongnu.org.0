Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C532CAA1F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:50:50 +0100 (CET)
Received: from localhost ([::1]:60682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9nc-0003y2-UC
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk9aD-0006Oh-Ve
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:36:59 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk9a8-0004xZ-61
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:36:55 -0500
Received: by mail-ot1-x342.google.com with SMTP id f16so2416654otl.11
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 09:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zU3Lz1wyXX/NOPU+tNpdFJLhym/MFv+BFZKEJxii0/Q=;
 b=jroYG7fhspn4rfzrQ+EI5vm/DTPwSi0BnwfMdGV89bIfr6ClrToP6Z7QBTgfN4+Kt5
 AWdIaTI652C69lDhnxTiA2GFHWPQFFhFPHGWgaTbnmwy9Ep3wn1xoLCXVH9Uv61xPy8F
 CbfZbquZBXKDbrCWLyXUvRy8ByAYBJBQiFGcdWgMclm3kQjDCe5r/PdfZlDG2AQxg9G/
 HqhVEpFwp/sPStS7sn7fTV96cQECvjyfJ0jDcrfCCheNj1aUVsTZdRw9b0WH6zqDnPlV
 NkjoGw6lJq645cQgWThFbCJqEhueZbtMwvdHkHYS42k7Rb1Tb0vmoUxLEEXCLJT3yd4d
 VUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zU3Lz1wyXX/NOPU+tNpdFJLhym/MFv+BFZKEJxii0/Q=;
 b=LXYhbr86pfRz7oGycE40walPOMvz/LroDDk7RmQZ3chWT4JNC3WiUqgaxwzRONoRrT
 /q4BG0mTADjzQx/USXSwAjtA+PG+dmE8ooZZpVu38iQqY5fkHJHrWGETtdSnYS+D0gUT
 p4GbNW42SKgNxLHgCTVj/ghc6zjZyMwgW7ilPKRVoLiuYP8bIAAXLuSk2IK8fy5KY7Hz
 ElpaUzIwx+gGwYp3eSvwO9urKbOocw1dCDutuc0KFpDoeo/7Oow3IaZQcElzeQMvqKOm
 IwKDXPFqhKQukhztXeKV/TDlode8gStytOw9s2XHDUvKKrHVfDMVCSyAIrSP9aeCpzrd
 /lpQ==
X-Gm-Message-State: AOAM5336T7d0ZYzO+53MvzpAvuXkTD00hqAU3Bu3pjL37XpXrMZgilPZ
 Q7vFmP9qU6uFiCHI+bYX52oWkQ==
X-Google-Smtp-Source: ABdhPJzZFss7MWM13Y6Wz/pceqXdmXVbkeHh+hQoeuaVIEhID+U0JHRVjvK0V2x3VM9aXqq12DTE6w==
X-Received: by 2002:a9d:4542:: with SMTP id p2mr2649009oti.148.1606844210548; 
 Tue, 01 Dec 2020 09:36:50 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id x9sm100082otk.9.2020.12.01.09.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 09:36:48 -0800 (PST)
Subject: Re: [PATCH v2 4/6] linux-user/elfload: Introduce MIPS
 GET_FEATURE_REG_EQU() macro
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-devel@nongnu.org
References: <20201201133525.2866838-1-f4bug@amsat.org>
 <20201201133525.2866838-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cfef71ab-5ada-9a29-b111-44e2e07fc3bd@linaro.org>
Date: Tue, 1 Dec 2020 11:36:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201133525.2866838-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Meng Zhuo <mengzhuo1203@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 7:35 AM, Philippe Mathieu-Daudé wrote:
> +#define GET_FEATURE_REG_EQU(_reg, _mask, _val, _hwcap) \
> +    do { \
> +        if ((cpu->env._reg & (_mask)) == _val) { \
> +            hwcaps |= _hwcap; \
> +        } \
> +    } while (0)
> +
>  static uint32_t get_elf_hwcap(void)
>  {
>      MIPSCPU *cpu = MIPS_CPU(thread_cpu);
>      uint32_t hwcaps = 0;
>  
> -    GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
> +    GET_FEATURE_REG_EQU(CP0_Config0, 7 << CP0C0_AR, 2, HWCAP_MIPS_R6);

You'd need 2 << CP0C0_AR for the equality to match.
Would it be better to have the shift as a separate argument?


r~

