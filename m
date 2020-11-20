Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05242B9F1D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 01:15:13 +0100 (CET)
Received: from localhost ([::1]:43528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfu53-0004MN-1f
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 19:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfu2U-0002lA-Tz
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 19:12:35 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:46707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfu2T-0008QP-CA
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 19:12:34 -0500
Received: by mail-pf1-x442.google.com with SMTP id v12so6101465pfm.13
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nfOaeKs+51bdwCfwu8Jsw+stvASV4ztmOTGBg3g6FQY=;
 b=oE01VEEhNVXd9xgTMybbu9u33QDl2Wt0XHrBvQ5MYBjSFRpCy2MPlDa3jfppZ1sUHW
 ipyS+BEHxsaPyGGxqUA4O19LtjY7ZLBAAtQx3iOreBpHaEovm+LDMkM+37NMIr0CPFYb
 jScj+stYrnMPbT/I9Z3C1qmQBND8b8/g75EPWWhaP9xWcQKN43GJWeGYgmTj6QwxrwaI
 x9IXDMpreVxkmL/+2+VNTHr1c6W4fDTWes/tw5uzSn8I6usAY9oMMxgfPA/zbLLK4Fvp
 pSccPtQbkMHSmTS6Os/h5H8ChyPpDfhTg4v+1dq7uqMJ7leX2rS355ulaBe7OJmt7NM1
 lDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nfOaeKs+51bdwCfwu8Jsw+stvASV4ztmOTGBg3g6FQY=;
 b=pfC27uGBHt+KJzzxx3CJ/i/UPWKfFHHP80S4PgbB4gO0QVC5lzSF1Dnz4XBcAXvpgH
 XlCQ0UsBIIoHRi8moc/5xJ6dEmYrmGJgswtmf27tt/jRfi+2/quiaOPo+bNo5rESfYKH
 8XG4BstJTxQUaGco8KeEyrwnRlaHA8V08vO1fh9l5i7fJaApHAI57pwSliFXbVLtLehJ
 LoLYYoHXl6BO/rPbGeMvRHzLrRmGkqepSd3SWyyr08761NrnXocSBw653lPTGqw2cICq
 5E/Qod9dIXmbGzuvjosVGprDkJQ/GHiEQfsKHsXSqAWsh4RAPS1fgxEYyAaPHMVPMUop
 UB8w==
X-Gm-Message-State: AOAM532ANoiluICmIrqUAFhzZFgmeDBHj3nqqX4n/3fGorgy/Tb+AFkC
 eQLuF8BEkaeOiLloXV56q2NLzg==
X-Google-Smtp-Source: ABdhPJww4/kt0MQqe6uUOqn+Q0TlsmGKRFVimbJQY5Z9EQYuk5YFrdT1RkuR+IqdoTV68n2MOU83XA==
X-Received: by 2002:a62:1887:0:b029:18c:234a:4640 with SMTP id
 129-20020a6218870000b029018c234a4640mr11729693pfy.1.1605831152074; 
 Thu, 19 Nov 2020 16:12:32 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m11sm1007266pfk.204.2020.11.19.16.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 16:12:31 -0800 (PST)
Subject: Re: [PATCH 6/6] configure / meson: Move check for linux/btrfs.h to
 meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-7-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a07e2c4a-2ee1-fba4-65cf-104f04546dfd@linaro.org>
Date: Thu, 19 Nov 2020 16:12:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-7-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 9:10 AM, Thomas Huth wrote:
> This check can be done in a much shorter way in meson.build. And while
> we're at it, rename the #define to HAVE_BTRFS_H to match the other
> HAVE_someheader_H symbols that we already have.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure                 | 9 ---------
>  linux-user/syscall.c      | 2 +-
>  linux-user/syscall_defs.h | 2 +-
>  meson.build               | 1 +
>  4 files changed, 3 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

