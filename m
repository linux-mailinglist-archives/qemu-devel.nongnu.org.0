Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7340F33A010
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 19:49:53 +0100 (CET)
Received: from localhost ([::1]:52744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL9Ki-0004a1-GC
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 13:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL9Ju-00048L-IA
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 13:49:02 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:44009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL9Js-0008RU-Jl
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 13:49:02 -0500
Received: by mail-qt1-x835.google.com with SMTP id s2so6422911qtx.10
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 10:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=IvkVsMo2gbJExeNvnEK+vEbUFg1yA7+he1VfrPjYzKU=;
 b=F5aNLc5qzeVv/bnvXccR1DmvZkjJxdrFd+PXTJFVWlBlrSR0b4OFt4lvsju4dn07Zg
 0iZFbOR5SgH0yLLX7K8BCIW12seZkFaJlvBw9FBJgjLPx8Y9QR+26H6c2bOXiLkyw2SL
 WTI1hKZTiLHGbAzV0HUirDGpwOQPtpkynG/GUI7N6uelwh4WOyZm56btOX86kPjTqKy0
 XpxN7ZaL5OBpr+mJsfwvCRNVzx3kmX4ZQP8g+KBFGHFybjRIiqLu246gos3H4saM/3kq
 yjmSN8HLN1I4MCSh3t8qcj1sgccIOkB6XO5Y4uM0tHp5rzVumeAGBIcQEI9iMFGmrsqt
 yVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IvkVsMo2gbJExeNvnEK+vEbUFg1yA7+he1VfrPjYzKU=;
 b=qLymoFDHHUTP20g5xLuSguqKQlFxVSgMBg5zatmGAnmmmeJQ9dR8N1Yuk+6eqJJEF3
 BMByVGFG7lEOWVeqZIeZzGkmD9mEUQVT+qdj1zuAX5h8xfR8CUHk5oohHdtFEYPeVpj7
 I5r1Xp18FYPtFRxfHz2ysZ7eFx7GkTxa9Ynb8w0mar/M46f1bygx9CCnhEiG9D3wT1U4
 NiwxYe6jBbdIWKRp1rw/1cLp9UeflDy78IsgUSPBx5racTSKPHVbPAsxG+zLT4+aglrG
 MSX+qh4IELaqa8Boi8NSCFDg0ofNqiWts0koVphfsH4WEXclwYf84o1co4blaLHSrybF
 rBMw==
X-Gm-Message-State: AOAM531S7h/zAcSWwt6gDjrwuqTQAc28+PmBE2v5fi/60gfP0Uuwj6Xr
 QipSJUPI4K/iD81/h+bkMBpoums16W8XSS8g
X-Google-Smtp-Source: ABdhPJx7m1wo5kajvLBtdANXMPL+uk7oPVlrKBmfLG9/685gE8WRLx26pnTuKkUXldtuC5GUb4W08g==
X-Received: by 2002:ac8:4558:: with SMTP id z24mr5949472qtn.66.1615661339693; 
 Sat, 13 Mar 2021 10:48:59 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id y19sm7258148qky.111.2021.03.13.10.48.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 10:48:59 -0800 (PST)
Subject: Re: [PATCH 10/26] accel/tcg: Move alloc_code_gen_buffer to
 tcg/region.c
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210311002156.253711-1-richard.henderson@linaro.org>
 <20210311002156.253711-11-richard.henderson@linaro.org>
Message-ID: <2bf1aaa5-fa97-6837-cc15-364f0e16480a@linaro.org>
Date: Sat, 13 Mar 2021 12:48:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311002156.253711-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 6:21 PM, Richard Henderson wrote:
> Buffer management is integral to tcg.  Do not leave the allocation
> to code outside of tcg/.  This is code movement, with further
> cleanups to follow.
> 
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h         |   2 +-
>   accel/tcg/translate-all.c | 414 +------------------------------------
>   tcg/region.c              | 421 +++++++++++++++++++++++++++++++++++++-
>   3 files changed, 418 insertions(+), 419 deletions(-)

This broke in_code_gen_buffer, which wasn't updated to match.  Will be fixed in v2.


r~

