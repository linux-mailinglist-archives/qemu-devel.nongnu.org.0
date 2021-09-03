Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AA0400097
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:35:51 +0200 (CEST)
Received: from localhost ([::1]:42862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9ME-00078W-OE
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM8y2-0003qe-Si
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:10:50 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM8y0-0002DO-MJ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:10:50 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso3747436wmc.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=we07AMMbg5ACUVzM4jVQbOTZnPxGIg1gyG+my47VX74=;
 b=EwkFDOgDaj28k3GQ3TpkDWUu1oyM/Lf4W/l8kH2I2cjvvRM62oeOdYrl3nwTgjZRTT
 Jq2LedRv94mjEXiva1fe0WcgCMos/tXDRAhTPF836eu9sYlEtC0WhR9VouUIhyVrEd84
 /luOPd9TJhcm36/wyR0jC+etrTyjqivUw4NI4G6M1hvaR8qtncNRdA7/bvWebIN1SjJY
 +hj2V1aCcaEm7cMmE3CO/6JLDOVAe7xx2Vbeg7Czun1HxMTg56cJ0u9GvgtD91xHPHLK
 Ace3tEgujfpbiwXPbvMiP108v9L7HlYjYxvR41a4R/zjNYYweujLNWvhdD5dGFnkcZq0
 csHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=we07AMMbg5ACUVzM4jVQbOTZnPxGIg1gyG+my47VX74=;
 b=Y/HNpFCpJ/Pnmiw1+lxCSdaIPK83wMUzP3Vj4ZJ3Y8rI8zgq1Djy46k4cwb1loNtja
 +VdMuxCh7OZqEIjnCMRP9g3cVGTX52GUTfTtBNv4LTW/f0t4rnj6TlHGjkVF5Ff8hXXJ
 BazNAUu0lAO90qDxLQsdkgjEF5HSwlqfqmOWZWMQviuuiViQyHDUeosJiaiy3BfCrcqL
 q9pUaYtWYlOmkF9iGl/9v3h7H5jaDf8u12c6s4+dwrYkp7+z6F/9oJKpPXtFxZ48xcwC
 cqVYM980ovPkzafEyOevztclRo5mS3aCwOeNUfwwwN1P5MZEnVytSAqTl6IuMwZRmNl2
 FYWw==
X-Gm-Message-State: AOAM531o5IrbsxfMIUzFy2MnDUdvsO0QsnL/EyIa2BLYCdycyK9zZbFY
 3bQDhqwLwMO2uIQBTdNItZs3Hg==
X-Google-Smtp-Source: ABdhPJy9Sr+YTkMypLvczJOfyCmtzWKL6p7olriYaatuRU+1lqSOYe+wncRPLz4AMXdhD3+bnTYipQ==
X-Received: by 2002:a05:600c:4152:: with SMTP id
 h18mr8117824wmm.55.1630674645737; 
 Fri, 03 Sep 2021 06:10:45 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id s15sm4604711wrb.22.2021.09.03.06.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 06:10:45 -0700 (PDT)
Subject: Re: [PATCH v2] target/i386: Use assert() to sanity-check b1 in SSE
 decode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210901141008.17203-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <70abf140-1074-f11b-d723-0649e1690fd3@linaro.org>
Date: Fri, 3 Sep 2021 15:10:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901141008.17203-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 4:10 PM, Peter Maydell wrote:
> In the SSE decode function gen_sse(), we combine a byte
> 'b' and a value 'b1' which can be [0..3], and switch on them:
>     b |= (b1 << 8);
>     switch (b) {
>     ...
>     default:
>     unknown_op:
>         gen_unknown_opcode(env, s);
>         return;
>     }
> 
> In three cases inside this switch, we were then also checking for
>   "if (b1 >= 2) { goto unknown_op; }".
> However, this can never happen, because the 'case' values in each place
> are 0x0nn or 0x1nn and the switch will have directed the b1 == (2, 3)
> cases to the default already.
> 
> This check was added in commit c045af25a52e9 in 2010; the added code
> was unnecessary then as well, and was apparently intended only to
> ensure that we never accidentally ended up indexing off the end
> of an sse_op_table with only 2 entries as a result of future bugs
> in the decode logic.
> 
> Change the checks to assert() instead, and make sure they're always
> immediately before the array access they are protecting.
> 
> Fixes: Coverity CID 1460207
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> v1->v2: use assert() rather than just deleting the if()s

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

