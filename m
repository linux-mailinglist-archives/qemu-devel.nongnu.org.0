Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA05698C9B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:08:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSXQv-00042t-K2; Thu, 16 Feb 2023 01:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSXQr-00042F-OG
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:07:50 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSXQq-0004eZ-4N
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:07:49 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 bt4-20020a17090af00400b002341621377cso4790193pjb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 22:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JRK57IwDtaXnhP/HHgFl0aRlF0KJrwsHSpBcHfjxF+E=;
 b=D/h8cPQUkvDvsoKGUhQXauWnMhMckSDQJ/ybZ92ED67T6GiMynXaepm1+SOV2PwBRg
 MVcLxjV7ACporRDNeAALo0fh1NYGZjHk644WQlkqbY41hNeuXnOeoF2VSM02r6cORQZc
 dZCUhYCKik5gamiTgtUjdRd1BfEOvw407+RteY7zMdtub1V5Pdn8Zf/KZyKR4e5q+S5Q
 1CA0iOfPzSZAFv6n8aRenGHwgLqHxVkgHyxOfiOb+ne4WnxcUYI2xFfAn2DZDb0+H+Sn
 DDhRnSy1upjHh4lHxzbEvsMbvBxfrBmAovGTBKAStzQVNER0+N3uLI5JWz+7YEKOpWYv
 +fTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JRK57IwDtaXnhP/HHgFl0aRlF0KJrwsHSpBcHfjxF+E=;
 b=UelkLYKMY7SEDDuCBtwM1abjK8/EI0Wk0z/qW6rWxXPDOHUIV/IF8kHVBipA37cIhv
 qG1LiUoVmxb3y+sUh0OH4+MCGDB2Ls1CZWp9tig3coHM57E0dEBWCG7tAKWk3wguhyCy
 ykD4AQHB/hrcoYp1AqVBZc+YGUBZoqQB9hKfhmLLD/kcT10uV8oCq3RZr2EN3oL5tyub
 xab2Y0xRPddyCQvrfMrk+6sZzhO1YGYX2zb/AOZfBMxj0BnPc6bLdm5aGQ54KyYHr/E1
 NJt6PiJCRb5n3lNx+TUHO891DuDpwzz8RqdjeXkavonIaabS0MD4wuYfGdRZ4mLcu0Yg
 8Czw==
X-Gm-Message-State: AO0yUKU3vQ8OV7z50XPrUd74hTw0A5K+pxQUjIYR08VZZ+PjWwhh9CAV
 qF1FvcDWHe4i3L9sur0yyv5rH+Vql7ozSX3o5sw=
X-Google-Smtp-Source: AK7set8iq8Muf+y0eSzVoupG7ls2Itq3dw6RR88mFWUPhwNP4BVwvIJ9rgydu9JD0NKCKcPN0pFgJg==
X-Received: by 2002:a17:90b:1c90:b0:234:2485:6743 with SMTP id
 oo16-20020a17090b1c9000b0023424856743mr5772448pjb.3.1676527666188; 
 Wed, 15 Feb 2023 22:07:46 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 p1-20020a17090adf8100b0020b21019086sm4951838pjv.3.2023.02.15.22.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 22:07:45 -0800 (PST)
Message-ID: <f6ee0cef-da17-7330-f0d5-4665cdc13a23@linaro.org>
Date: Wed, 15 Feb 2023 20:07:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 01/15] linux-user/sparc: Raise SIGILL for all unhandled
 software traps
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
 <20230216054516.1267305-2-richard.henderson@linaro.org>
In-Reply-To: <20230216054516.1267305-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 19:45, Richard Henderson wrote:
> The linux kernel's trap tables vector all unassigned trap
> numbers to BAD_TRAP, which then raises SIGILL.
> 
> Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Reported-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/sparc/cpu_loop.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

I'll queue this to tcg-next, along with Ilya's other start_exclusive patches.


r~


