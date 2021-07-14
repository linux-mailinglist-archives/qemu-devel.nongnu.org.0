Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44B33C847F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 14:35:25 +0200 (CEST)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3e6m-0001t3-06
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 08:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3e4r-0000Sf-3q
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 08:33:26 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:33746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3e4m-0006WQ-PV
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 08:33:24 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id h9so917662qvs.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 05:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uwrA1p6MpCdNsSDFFYikmK9T98mDu4QjTA4VOsqq1+0=;
 b=Y+m7LznoWxZa0Kc96sYdHLR0vG3CZYAzcF7qV5Al7BfNUWhAE4vK4JP0gQkcIc+nXb
 Tfc9aoDJZOsNQIOBgcEWTEDvnLH7Rb4Kxb3kSYujHN0h6owDgqK5zW58qGN7UP8QpbV0
 jVrmdLYXrqljBMRa5DigwsLavCNLH236XDxxLbqvfKmKkEL+i1A3Y5X88KkQSXcaXmVt
 9HZD/FnzexB7XF2vPwNX6EVEA77BYW+Gj+dT2JR/Eui34Jl02MZIqOCV2CrFEfflqS9h
 Y3iXmiyyYN42nkQ3c3qViNK+qN81orFPFR6zPnGVUAsddzsJYoPT9iKMLK6QXJCtzUlm
 LOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uwrA1p6MpCdNsSDFFYikmK9T98mDu4QjTA4VOsqq1+0=;
 b=AijrkwqcpyKrLUT0xVh1hBRvG1RI1gsIi441Y1zquJrTmS1eE34oopiFKYTHxnoj+0
 tL4YA90SXF9iH06HN4r0qnAIE7REhSnyGugeR9zjtvfJMBqVK/S+v4JBE1oi163RZOKL
 2Xv2OBFfq6yDy+NbO3QWWqgD5BF9fBqjxUgHPeFGRrDWUjZWrY1lT5L0fm91AlNkYGd6
 eeJIO4byGnVJFrOb3xrMU0AZBXWC43PGUO0xrzn03nQZqdvXvOa90idQ5xrqwgDnoWpF
 TXsa4cfTQ6zIMMbj3KKANBFYYpFrceIRXMPBwbU6fOwJ+Q+tFnJssPr9WM4yMR7KK90v
 DOgw==
X-Gm-Message-State: AOAM531y4UuJQXXExRJgaGO1DW9snSATwkyLQ1cBRbfcpm1dNTYCUFVS
 TvXTGuQ9nEH7FupBiddcx38caQ==
X-Google-Smtp-Source: ABdhPJzBRtEbN7zFQYlJnBjiSqLnZIGhvoSJTKQjFmRTwIMDmEn5+I4KKQnaMsEFvDqLVrF0NpIp8w==
X-Received: by 2002:a0c:eece:: with SMTP id h14mr10496627qvs.12.1626265999745; 
 Wed, 14 Jul 2021 05:33:19 -0700 (PDT)
Received: from ?IPv6:2607:fb90:8063:11a8:387a:5ad2:76d5:4536?
 ([2607:fb90:8063:11a8:387a:5ad2:76d5:4536])
 by smtp.gmail.com with ESMTPSA id z22sm970098qki.54.2021.07.14.05.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 05:33:19 -0700 (PDT)
Subject: Re: [PATCH 1/2] Hexagon (target/hexagon) do probe_write in
 HELPER(commit_store)
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1626205589-19208-1-git-send-email-tsimpson@quicinc.com>
 <1626205589-19208-2-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ab3bb7dc-2a19-f5dd-22f0-49c1946f779b@linaro.org>
Date: Wed, 14 Jul 2021 05:33:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626205589-19208-2-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 12:46 PM, Taylor Simpson wrote:
>   void HELPER(commit_store)(CPUHexagonState *env, int slot_num)
>   {
> -    switch (env->mem_log_stores[slot_num].width) {
> +    uint8_t width = env->mem_log_stores[slot_num].width;
> +    target_ulong va = env->mem_log_stores[slot_num].va;
> +
> +#ifdef CONFIG_USER_ONLY
> +    g_assert(width == 1 || width == 2 || width == 4 || width == 8);
> +    /* We perform this check elsewhere in system mode */
> +    probe_write(env, va, width, MMU_USER_IDX, 0);
> +#endif
> +
> +    switch (width) {
>       case 1:
> -        put_user_u8(env->mem_log_stores[slot_num].data32,
> -                    env->mem_log_stores[slot_num].va);
> +        put_user_u8(env->mem_log_stores[slot_num].data32, va);

The primary problem here is that put_user_* is the wrong set of functions to use.  You 
should have been using exec/cpu_ldst.h, in particular cpu_ld*_data_ra and cpu_st*_data_ra.


r~

