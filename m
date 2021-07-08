Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2304D3C1AB7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:53:47 +0200 (CEST)
Received: from localhost ([::1]:33582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1b1m-000123-7D
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1aNp-0003zx-ET
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:12:29 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1aNl-0007DU-NV
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:12:29 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso4699854pjp.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 13:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8D+/g/yPnr9wYMak81A+jZUjfaMwjXgAgfalDTqxAt8=;
 b=UDxEmC+JWRjNqyZg82dwQLLEx3T+9mpG25/sRv43/dWVtfACJmDHIGQVHWy7i0fEBV
 xH1iBGygtLq5cNSFOlZm4XzW+Lukz6/Z7DFTzLTshdXNfiKeEgpm+tV/zXiDlSOX37O2
 LWLc/xCd0SpaGBP3wOOdeKw9ko8RmCWU4xOBGZJCHaHm163vMbF+9aZqz6fGBTJUgecD
 teDltBqiIndDeOe455/07ma+eC3R/yBOe4m9hHRbgXEql0qZOF65Tb2s4f/9bOlLc7i2
 jxJ+MyEZbmSwVSGvE6+pvW2Oy6CzvNa/sdWMxAQlhRdgSWTwEuY6fWyFWrzEDOQIJDgM
 n3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8D+/g/yPnr9wYMak81A+jZUjfaMwjXgAgfalDTqxAt8=;
 b=PAv2pPXgpkf+D6jU+qAo7DiLYHs4z4NST3RePUKrHrhFrNtcEBCB2BwLKIRPGSI0EZ
 GKq/Qh3zgwN9kWHJQNNjg3sjZkx9Gqx1+bGpppE9ON3NdvlZV8Il25DGiByBtzDy62x3
 VkKQy3zpJcuuf4L4a7q7qj1O7zHtBHEWJwweP0qIhQZmchu/f+07xkbsohoLBmtuNH2x
 WNWJoEr++xileTWZ6H7tAEWLalhvkl+bFL4SIyGHqMnh5fteYoLlM9lslxV0XCjZJoim
 8O7rQXjHTUftfn8HymjcXGEE+B+NlqS9qw0gqHlkrnAAtZURE1WQzjsmnnaVq0Ias7KR
 K7vQ==
X-Gm-Message-State: AOAM530M1mx7GlmjLFZ/nytF1Znr4gFBLHEbc5WN4C+eOHr8k0hCJyTm
 dxjItUOYgkLgS/OUh5vIPD8ovA==
X-Google-Smtp-Source: ABdhPJyNzvLlNr+DA04Fu4zQ4GgReT76N3biC1Fj0RaqHcy4ONhV7LzrTn9Pg4cf9RyDhTAerLEReQ==
X-Received: by 2002:a17:90b:214:: with SMTP id
 fy20mr6585343pjb.62.1625775143684; 
 Thu, 08 Jul 2021 13:12:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m9sm3382218pfk.20.2021.07.08.13.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 13:12:23 -0700 (PDT)
Subject: Re: [PATCH v2 05/39] tests/tcg: also disable the signals test for
 plugins
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210708190941.16980-1-alex.bennee@linaro.org>
 <20210708190941.16980-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce2b3b29-5b1b-5dfa-64b8-b2d9a11a9487@linaro.org>
Date: Thu, 8 Jul 2021 13:12:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708190941.16980-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 12:09 PM, Alex Bennée wrote:
> This will be more important when plugins is enabled by default.
> 
> Fixes: eba61056e4 ("tests/tcg: generalise the disabling of the signals test")
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/multiarch/Makefile.target | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

