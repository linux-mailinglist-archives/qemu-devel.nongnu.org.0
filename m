Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F284446718
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:35:16 +0100 (CET)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2BP-0006F7-FM
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj21k-0006rD-Iw
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:25:16 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:35705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj21i-00016t-MA
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:25:16 -0400
Received: by mail-qt1-x832.google.com with SMTP id w4so6556725qtn.2
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PwxPVDwLasEVYvIIVi8x7t2g5zHsYae5RI7X34KkdDc=;
 b=lZWF3vSb3rOF2p4biWERppNMyKjrtPYZbcmnL/7sRqXVJMMjByPJwn/XoclPASUs86
 4y4Uz9B2KX9yTTqU1oF+Z+A3PtgCOgXcQ91I5gZW/l1rEA2fvvHDsoxAVpgtLnpTKiZD
 JsXAJSEswWRaafXELZmCFrXLle01UKPusJcv4h96AbcMBtW0fRwoCuW9M08vhml4rVvD
 FaoU93P6n9WtoDyw9mzL/krbWzTbCTzgLD9HNf6z7u6t5wc3U+tExKfvijE7MY16XVL9
 rYtgoazsVWncYvhsNGPmZIDN+zOYuIInAMuWE+zCfgRBrxmipTi87/y9RGxMnkKjZlx+
 pwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PwxPVDwLasEVYvIIVi8x7t2g5zHsYae5RI7X34KkdDc=;
 b=yDVWXrHQZllRLTxo3rU1q5zESU1LC0qgEXXwFqb53ylB56cp+KPi1iEi0Nbi/rwFsL
 PDtoTw/P1sn1i3ofavXGJ1BRylQ9rlU0UyskDK1shO4EEb0BvjhaL17JnJzAoVpI6HHO
 AOtmrQ1cR2L/w2NraskUkEJ7aP0bizaFbjM9/foG+2XctXixHA2jO8Z5a4Nj4RuC5dd3
 e2ZQ6FRbgvL6MGV3e/02ExnAur7ubMgOUV7wGuJHUN61OdM+NFo7PUGlTsz8BewJnvFk
 YzEzuPGSs65/hxV6Ckqj0zSbKvE+TEsItPOb8tr4EcVMXUl68UjXS5jKng4/45HJ3TTH
 /kCw==
X-Gm-Message-State: AOAM531l1NxldZOP9IoIzVdL4R+ynBDaVX/qkBGC2f8puXoRZhNqKTIQ
 WdJE/9f6XCtBDybrfUyux7R4Jg==
X-Google-Smtp-Source: ABdhPJwkV/R/6yfMpvgHGlILBopjsRtpYiC5Do5YZYyyrywNw45lgCWQBK69QEXma4q+DWbC4ksFTw==
X-Received: by 2002:ac8:4111:: with SMTP id q17mr62910883qtl.407.1636129513860; 
 Fri, 05 Nov 2021 09:25:13 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id u8sm6111088qkp.21.2021.11.05.09.25.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:25:13 -0700 (PDT)
Subject: Re: [PATCH v4 11/36] bsd-user/x86_64: Move functions into signal.c
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-12-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd711f1c-380a-80f2-2382-ef5aaf3b697e@linaro.org>
Date: Fri, 5 Nov 2021 12:25:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-12-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 11:18 PM, Warner Losh wrote:
> Move the current inline functions into sigal.c. This will increate the
> flexibility of implementation in the future.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/x86_64/signal.c             | 56 +++++++++++++++++++++++++++-
>   bsd-user/x86_64/target_arch_signal.h | 43 ++++-----------------
>   2 files changed, 63 insertions(+), 36 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +abi_long set_sigtramp_args(CPUX86State *env, int sig,
> +                           struct target_sigframe *frame,
> +                           abi_ulong frame_addr,
> +                           struct target_sigaction *ka);
> +abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int flags);
> +abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int srflag);
> +abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_sf,
> +                                abi_ulong *target_uc);

with of course the same comment as for i386.


r~

