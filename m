Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A6D5A1620
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 17:50:50 +0200 (CEST)
Received: from localhost ([::1]:51634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRF85-000076-6N
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 11:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRF3X-00055p-Os
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:46:08 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRF3U-0000SZ-RB
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:46:06 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g19so1882551pfb.0
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 08:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=e3urDSQc2xhcG15YzYUr4OdjO7qw64kdYZcUgKc9/5Y=;
 b=MtBzK15Isd/+gLUezRC1sC+T+A5uf8M3KtkfUvnkACWmrRfMB+W2/paHISed6z3QrA
 RmGuyV3vabqHVOJapJznB8oTmtHYJQ4/3YG6gveMKkxVmhoHc5TQrcNnerCm+bOuEKob
 yBfTJJDsy65+PWoi+Pf256FDMNz1ujiKqsk+TBMPJrPQjUXWsVROBKUsrVR2YjwHDMCN
 jSjrAX92nEL5p3eyJCuyvek+Mxl7HqojutTPwcXTL4qvBZqRQF5Xe6u7a4acfNAR/abA
 91AbSWx80qTp5RSTgYtlm7cQjZRXPL7xVRMMtadkqUit7GRoL0aJFJPpAcmT9pgNi11b
 m5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=e3urDSQc2xhcG15YzYUr4OdjO7qw64kdYZcUgKc9/5Y=;
 b=LWy95rPBUSaACCmVhApd1kL01KxxEPPep5kpwC4iMZ8tDwfTMb5R0LhLqLrubLkzQI
 ZWnvsiO/cQiJ4RKsqtYFrVEGi7CCh9MZD+RYu+H0YaWCCGlKcClSrBU6ijzSrUSrsIYm
 gkq22+iLLoSrSlA1h72yHqMwDnTLs5bRsn12NTTpqH+wtCd4eF/akyCoFgKMqjufHWBY
 Z0uq2oSkV+foisPPmhEt43yrMEi3k0yKLmjiNX0bUwoAEILkBRAeW8uBfCqamXHbNV0A
 Zxens19sXMuDHWOaMUchWTHCPGYWwfNQIQ1rCSi9L1RSmaRBDZNdV7vptUiWxN9d2EkX
 z8Qw==
X-Gm-Message-State: ACgBeo0rnCi18+cyzqnH6YgJrHJ3+ssqvQ0KfEH/X40amxaxXV4OQCkg
 mw/mGKGgwU17rnlELk20UdDKyQ==
X-Google-Smtp-Source: AA6agR4Xs+B0emS25d3K/FtMImhBh1VZ8+WwqqYsXAPhqDBsqMlWF739gm1Kz+c69GdauMxginz0Gw==
X-Received: by 2002:a63:2048:0:b0:41c:daad:450d with SMTP id
 r8-20020a632048000000b0041cdaad450dmr3729911pgm.240.1661442360715; 
 Thu, 25 Aug 2022 08:46:00 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:64be:e7c:2851:ce4b?
 ([2602:47:d49d:ec01:64be:e7c:2851:ce4b])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a17090aa61600b001f7a76d6f28sm3737736pjq.18.2022.08.25.08.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 08:46:00 -0700 (PDT)
Message-ID: <0bfedd51-308e-e982-1b85-4d7eb83a12af@linaro.org>
Date: Thu, 25 Aug 2022 08:45:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] tests/tcg: x86_64: improve consistency with i386
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220825123406.319029-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825123406.319029-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/22 05:34, Paolo Bonzini wrote:
> Include test-i386-bmi2, and specify manually the tests (only one for now)
> that need -cpu max.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/tcg/i386/Makefile.target   | 2 +-
>   tests/tcg/x86_64/Makefile.target | 4 +++-
>   2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Although I also think max should be the default for user-only.
Something we can think about for 7.2...


r~

