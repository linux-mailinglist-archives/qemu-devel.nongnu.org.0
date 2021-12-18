Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6464047981F
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 03:10:37 +0100 (CET)
Received: from localhost ([::1]:56320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myPBE-0002dR-7y
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 21:10:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myP9t-0001xW-5t
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 21:09:13 -0500
Received: from [2607:f8b0:4864:20::1033] (port=35577
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myP9r-0006ny-Pl
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 21:09:12 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso7324595pji.0
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 18:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yuWngpuhpAfpHw84TuHDgHuS2aQh9LCsMxc7ryGAm4M=;
 b=xKJa9gJHdMODhb5uSMvKQ5+SD/Kfj3PxdH0PMfUvVbeCGZktbIIAFq66x0FL9ZUg60
 1ajzbhTKy5B04qFfHdxJYkKLYuIAdBEY1MtSz6dnXJZcP9zdTikLAKY3FOpa08TA49Hi
 ar1mzj1fhEgIRXX254lSpAvSm0YozKsiX98gp2dDRJni1UmYvheKt3eBENXw6gy5GRrU
 p+0EIOWqo42k5t0yGPqBHLAhuDZxM7Y8xYik4kSyU/3x4sWuTrig/o+5O0ZwIG4+9s5l
 8b55xXo3vzRBRybXukEvVjKC1KFvgM++KTuZDW4GteeMMqwKY0c+++GAnIRFl0OzNZQa
 mIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yuWngpuhpAfpHw84TuHDgHuS2aQh9LCsMxc7ryGAm4M=;
 b=pRR62f8hURNUrka6OXMnTOgPKkzVWXxJtSgmcpiiniL3WvzjkUhfWO6YwJ7tRoATBd
 sLwzeEU2OC7GJ1cwblGmttDGLp3UiNxbi3LmOMoxwu1Trsn6t9FkZCy5MIddVCdANwO5
 R+XSv+pVN+46gQ1EzKWXhf8+Ta3u8o0nOYoNtZ4Q7APjeSBXntTs+VbhZKX5jxefV93D
 u6daO/ua0/MvH2AZjNzQ+zncIC+A/ZvCoD24Hfv589+7xoqRo096dDWbYrgqpAVBz55z
 +B/qiCeZyIuxS7RfIO/NrNRur4WMJz3H9glNl/zhh4z/HvNa1gMj0M+Fq7pcwSKm1yb8
 1ggA==
X-Gm-Message-State: AOAM533NW3Fs1fKCs7rSaKKuOIPkXr1p5v1WxSXR9mp0y5yspwnxbI74
 PkwZBsnLGMTDi4D3qDZFERNsxRqM+zUGrw==
X-Google-Smtp-Source: ABdhPJwyrxEdFKeI/3T9eK7H7whFF4zTEw2sjZekEHwtpMdMAWQceVIkIr9T65levZCM9mFQHAs8yw==
X-Received: by 2002:a17:902:e282:b0:148:ef58:10d8 with SMTP id
 o2-20020a170902e28200b00148ef5810d8mr1793172plc.116.1639793350492; 
 Fri, 17 Dec 2021 18:09:10 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id h22sm483314pfv.184.2021.12.17.18.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 18:09:10 -0800 (PST)
Subject: Re: [PATCH] target/mips: Align vector registers to 16 bytes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211217233456.1475527-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1e736337-f1f3-29bb-67af-ddf31dc90538@linaro.org>
Date: Fri, 17 Dec 2021 18:09:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217233456.1475527-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 3:34 PM, Philippe Mathieu-Daudé wrote:
> Align fpr_t to 16 bytes to be able to use the TCG "Generic"
> vector operation expansion API from "tcg/tcg-op-gvec.h",
> otherwise we trigger assertions in check_size_align().
> 
> See commits ec8e23e37f8 (s390x) and 11e2bfef799 (i386)
> for similar justifications.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/cpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

