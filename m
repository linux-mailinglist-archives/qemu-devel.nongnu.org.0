Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC80554DFC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 16:54:14 +0200 (CEST)
Received: from localhost ([::1]:39120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o41kD-00019m-Sy
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 10:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o41ie-0008EG-RH
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 10:52:36 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o41id-0001Md-CS
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 10:52:36 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 k12-20020a17090a404c00b001eaabc1fe5dso16962657pjg.1
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 07:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cLK4BKqG1Exvh6FBcrI4Cik8EojWfPzGM/GHcgf6d6Y=;
 b=B1AgqVWy3rncerR1NqGSVmsu1oAam0NatFbYigIImifBZTE6MJdo3l9YSLQoBQQiWB
 0KCs8pa/8EsFdqSQsbhXSm3Qsc1osfwqnLcH4tZjCv506Uec/NKExgLyMGW00UDR7GPt
 19JJJYsuOx9nAltmK0Vw9Vo8I39RAfzhaShq7bflXpuR30hvK97EuaOmQq0SVVIFluve
 i2acnMsWZNfB5YBH9R3Wf7CCKmrIaJeqnziCyszQEjbWekfv6QX2Do3nswC5URKos3/S
 GA3sqvrkL4RdGZhyP6Uw7JGyQIdTZFCJHvVkrnjE7ZpLLBcER/fgi+1Tn7sxyrjL07lA
 Klhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cLK4BKqG1Exvh6FBcrI4Cik8EojWfPzGM/GHcgf6d6Y=;
 b=RBmNQuj7cG0WQBTABxKN4E0Uf/P/oIrfveTXEKlV/+OBBWRpQP3FGlqHKDDaSUDVHm
 RTDTfGR/Wexvfz+GOmaTsQetskcqh/zjBkxWixpd21bjmhzmfsixS6oJ8QKPD6pehZ9Q
 0QP79x2J4bXFD0ZsW7YKrz9XR4ZgYZFxDfZeLxYZQi2utzlm9oOXd0AtvozTjR/hXq3S
 0xZmBujRU+1CAu78arUlPuyjqRUlfzjYA8UuCT+Yix1i6sNaJOtg1Ne1iGhp6D7UugfJ
 x4NYhQQOZSLA/S3yYNQ91UrV8+wszgg8UPg37bzUAdPcyCYDwRWbdFxmceCP2zWiHUIn
 iVag==
X-Gm-Message-State: AJIora+ts4DLyxcBE+U/VYPm+uqXHZbm3lYguiwJQUijMRsI+3ZD1FIU
 WulPnurf6xcwAfoVGAhZ7FNdVA==
X-Google-Smtp-Source: AGRyM1vIT3q5kUMcjWLSLKrezRttxryhsmlhU8UY5w85J+vtLuZPTCmLhwDey0SyEwgl+TWZ2eEyMw==
X-Received: by 2002:a17:90b:1b07:b0:1ec:c617:a314 with SMTP id
 nu7-20020a17090b1b0700b001ecc617a314mr4080299pjb.214.1655909553746; 
 Wed, 22 Jun 2022 07:52:33 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:4bf9:2153:b33e:91d?
 ([2602:ae:1543:f001:4bf9:2153:b33e:91d])
 by smtp.gmail.com with ESMTPSA id
 b21-20020aa78115000000b00518764d09cdsm13500077pfi.164.2022.06.22.07.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 07:52:33 -0700 (PDT)
Message-ID: <f45abaf3-e70b-85de-e4ce-92a353f9ef78@linaro.org>
Date: Wed, 22 Jun 2022 07:52:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] tests/tcg: compile system emulation tests as
 freestanding
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: matheus.ferst@eldorado.org.br, alex.bennee@linaro.org
References: <20220622134742.139306-1-pbonzini@redhat.com>
 <20220622134742.139306-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220622134742.139306-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 6/22/22 06:47, Paolo Bonzini wrote:
> System emulation tests do not run in a hosted environment, since they
> do not link with libc.  They should only use freestanding headers
> (float.h, limits.h, stdarg.h, stddef.h, stdbool.h, stdint.h,
> stdalign.h, stdnoreturn.h) and should be compiled with -ffreestanding
> in order to use the compiler implementation of those headers
> rather than the one in libc.
> 
> Some tests are using inttypes.h instead of stdint.h, so fix that.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   tests/tcg/Makefile.target              | 1 +
>   tests/tcg/aarch64/system/pauth-3.c     | 2 +-
>   tests/tcg/aarch64/system/semiconsole.c | 2 +-
>   tests/tcg/aarch64/system/semiheap.c    | 2 +-
>   tests/tcg/multiarch/system/memory.c    | 2 +-
>   5 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

