Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87DC6C4151
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 04:55:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pepYb-0003sh-G3; Tue, 21 Mar 2023 23:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pepYZ-0003sP-Ba
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 23:54:35 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pepYX-00035b-PS
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 23:54:35 -0400
Received: by mail-pj1-x1031.google.com with SMTP id d13so17429445pjh.0
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 20:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679457272;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qq7u0SeE6Y66PQYWW2uMfr0EVZKzLfAGddbGipY36RQ=;
 b=zrpHQcoiFz9HqDrFtj1+4z4DduUjSvDJjmP30K07LjHQT3G+KJYfhfO+e36Cr6+cqu
 qhQm8/u6zyExgAQ9iQo4DP2PzsiZSq6tgc7FCgmgUgIxplbG7xJpSJHvHWP9crE9A1k9
 0QGGEtwPByfTZcwLSBZXPcujPoRGiemA2Xc2poB7JA7pvccNo8PPFuR6VjRRt+lDH1sY
 anDzyYwSPzCMhbSDHQLEs0zT84IRQUfrfrRRY+NBOnalmB1kCEN5L16DkyXJQiWVXBlG
 YMuGeVf3Gf4exHc+Am6LAK0gaUFhab2Q76klPX7DE5Wa6EN28EJV37CB3yylASX8+DV/
 c8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679457272;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qq7u0SeE6Y66PQYWW2uMfr0EVZKzLfAGddbGipY36RQ=;
 b=G9VuwfDBfdN/iokmSzUeVNaN4KCmT6aG848R2Way4EUK8rqR/VvM5cuUNIsa5XUH6a
 t1iZrrXujtv2zogwxrrpuKTFd7Io0aJlthYTNRjCUGQyjo98WNzdNbtr/FtkSVwSSI1q
 D6Xyr2OH5ecZkviYWSEwtk6LSpdviO4trnrhzhEzd8SeiX6rh09pGYLlztW8ip+M9eYW
 hGgYnZ60jDNsIHl8EQd8q93dAz2HqxlNM5SnLwAQd0hz4fmbcXQBhwanXT5chdDcpgzI
 xFcFRRwa2al14h8Z3QeRLhjQW9d+qtm6Fji0KVI6zuK9mNTcaaxcCyX7CnXE+0BzF4JF
 ns6g==
X-Gm-Message-State: AO0yUKU0u1Vo0tSZCFB/LzqMIu4VVt0FQPm5Py//ZTQvz9o9kN2h2bZL
 QDQS9jIZm0xVyKyfp5/Gn4HZeQ==
X-Google-Smtp-Source: AK7set/g4OIg4ocetvpcznMiyHIxclaJUQxqkq06PdPE8ZGuMn2kva6LcuMFeJGdS6Te8w9X+y7HPA==
X-Received: by 2002:a17:902:c408:b0:1a1:b9e0:fa1c with SMTP id
 k8-20020a170902c40800b001a1b9e0fa1cmr1975244plk.0.1679457272502; 
 Tue, 21 Mar 2023 20:54:32 -0700 (PDT)
Received: from [192.168.165.227] (24-113-166-229.wavecable.com.
 [24.113.166.229]) by smtp.gmail.com with ESMTPSA id
 m16-20020a170902bb9000b0019e88d9bed3sm9439317pls.210.2023.03.21.20.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 20:54:32 -0700 (PDT)
Message-ID: <0ed88be4-f823-769b-2cc9-58344b4cda0b@linaro.org>
Date: Tue, 21 Mar 2023 20:54:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0 v2 3/3] target/ppc: Fix helper_pminsn() prototype
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20230321161609.716474-1-clg@kaod.org>
 <20230321161609.716474-4-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230321161609.716474-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 3/21/23 09:16, Cédric Le Goater wrote:
> From: Cédric Le Goater<clg@redhat.com>
> 
> GCC13 reports an error:
> 
> ../target/ppc/excp_helper.c:2625:6: error: conflicting types for ‘helper_pminsn’ due to enum/integer mismatch; have ‘void(CPUPPCState *, powerpc_pm_insn_t)’ {aka ‘void(struct CPUArchState *, powerpc_pm_insn_t)’} [-Werror=enum-int-mismatch]
>   2625 | void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
>        |      ^~~~~~~~~~~~~
> In file included from /home/legoater/work/qemu/qemu.git/include/qemu/osdep.h:49,
>                   from ../target/ppc/excp_helper.c:19:
> /home/legoater/work/qemu/qemu.git/include/exec/helper-head.h:23:27: note: previous declaration of ‘helper_pminsn’ with type ‘void(CPUArchState *, uint32_t)’ {aka ‘void(CPUArchState *, unsigned int)’}
>     23 | #define HELPER(name) glue(helper_, name)
>        |                           ^~~~~~~
> 
> Cc: Daniel Henrique Barboza<danielhb413@gmail.com>
> Fixes: 7778a575c7 ("ppc: Add P7/P8 Power Management instructions")
> Signed-off-by: Cédric Le Goater<clg@redhat.com>
> Reviewed-by: Daniel Henrique Barboza<danielhb413@gmail.com>
> ---
>   target/ppc/excp_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

