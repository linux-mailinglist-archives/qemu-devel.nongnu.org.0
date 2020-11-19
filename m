Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF42A2B9DF1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 00:08:22 +0100 (CET)
Received: from localhost ([::1]:41162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kft2L-0003gs-CF
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 18:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kft1I-00039h-Po
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 18:07:16 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:44712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kft1G-0006yT-7h
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 18:07:16 -0500
Received: by mail-pf1-x442.google.com with SMTP id y7so5966688pfq.11
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 15:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TkYABk4h6t7BFRDHlJS6qb16d1ocH2/6b9QMWY4+YTw=;
 b=roAlXfhOpK7UBaqtOjqtqNynk5OO+yznMExqEZXP4sowirZ6B2UFL9hg29UtkAi3JY
 kRNgDkQPY4hfqZu5dEVsLC5wr+HY2SohFwVtEtyWTAfFSm/bh3OcvNkQKt1MtyvvxxPu
 YA0ETTGAV/1dOtw3A69au5ZQaFAN6bWXquOKUwxNy1n4zmCwGWF3YDb+Sr6Io1wtePZ4
 aT0d6GffIK+j9tRawf/Dfg5PFPUAzdVQeDpz5S0g5jmvSDh7RQ0jMj04KtoxtysNiNyJ
 Oda4CJvzHwlYnpMhXCA5LrlEEv9auQusIT7MpQMa1FEICNzz1Xgpbjy761YuEHaKA9Q7
 30mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TkYABk4h6t7BFRDHlJS6qb16d1ocH2/6b9QMWY4+YTw=;
 b=GXiPNQvqYqUxA90UheuqTyfHE9+WdfkLOoJE9RrBDgjMm/BwSAJfXotpWmQhvKZpGa
 oeXxV1KS/zUnqVm3vCqNCr8WG8hV08+ghJdTDHKwRqBPSnGdlTiupSajeZ97Qcu38xbe
 2QLX3kOlTQInkr+jBLE6V7JzRt1LaHMudi0qiaN0RJtKs92+nRF4T1vg/bqtjOMeRY6q
 /sd5uxDoYwqFKgy6swry2Dizc1aBwfPwxtAoOkwGCD3RDfKhZ+7cVPQEsH+AMjI3zMP7
 IyWVGoTW5PqFQ9+HhfUNG2ze1YPA4l07kLh+Gf8ctKoWdGGKCJGOIOjb9HZYOV3iTZVy
 tejA==
X-Gm-Message-State: AOAM530ilK2eYKaPmZNLDcb2BVnZzbGcbHxWnoEwzI3ZqYzkM0vFZaNY
 7jBNiVQYCg2GU59AgZ8i/65kyA==
X-Google-Smtp-Source: ABdhPJxmE0yqvNPjzhVXnhAMTGhIw3SGPmZ04WuqegWNEPNWytW88ttl5FKXSyWsnwa87h0xIFeZQg==
X-Received: by 2002:a63:9d01:: with SMTP id i1mr2290632pgd.50.1605827232537;
 Thu, 19 Nov 2020 15:07:12 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g1sm889243pju.23.2020.11.19.15.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 15:07:11 -0800 (PST)
Subject: Re: [PATCH 1/4] linux-user/mips64: Restore setup_frame() for o32 ABI
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <20201119161710.1985083-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ef2a11a1-525a-2400-0b9f-d02f2cafba86@linaro.org>
Date: Thu, 19 Nov 2020 15:07:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119161710.1985083-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 8:17 AM, Philippe Mathieu-Daudé wrote:
> 64-bit MIPS targets lost setup_frame() during the refactor in commit
> 8949bef18b9. Restore it declaring TARGET_ARCH_HAS_SETUP_FRAME, to be
> able to build the o32 ABI target.
> 
> Fixes: 8949bef18b9 ("linux-user: move mips/mips64 signal.c parts to mips directory")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/mips64/target_signal.h | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


