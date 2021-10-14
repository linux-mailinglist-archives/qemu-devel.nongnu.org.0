Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A96A42E4D7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 01:44:59 +0200 (CEST)
Received: from localhost ([::1]:39974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbAPB-0008Ld-Tn
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 19:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbANh-0006l1-24
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 19:43:25 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:55116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbANf-0004tk-13
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 19:43:24 -0400
Received: by mail-pj1-x102c.google.com with SMTP id np13so5924220pjb.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 16:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W1VZ/HOupylVXXCvFvA/K0fVPPXsX+kwngx8kLlpsqc=;
 b=RYqLlHgih9ag8Gl7nvUH7A9PJK7RZz6mwcagIIKjWAaExEjsOfBsGeWXYDoosShVrD
 g42TsV2/Hkatf8fhggRE+bNAktLmy+fDCFgv7HsHS4iTyIEDL9QqDMGTr79RmUhrkK/y
 88zKSRP0U0FmVGCQLu0Dt82/apfEUr32kY1kljaG4fKLLaGcHP1R3c+8tPWgGIb6AHRi
 vwqHk3aGH79ldhhwEQ3wL7+7EtmcOAxZ1S3ztwPiOGmlNUjxmAdHd9Fjc15gOm8qmFTY
 UsWpHamFq6tljBGi6tXxvz44EGGKZqOfekL8uTQN+jR729EQJ6EasnEGMpj5cQY2mgYA
 20rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W1VZ/HOupylVXXCvFvA/K0fVPPXsX+kwngx8kLlpsqc=;
 b=T9vF9e8c9y+bvC5T9D9W/zqQL7m1j9hi4902S5BBEYqbb6rkJjzgciV5djQQQdms6I
 pJgPD5RpTGV4jRbrp61u4pFs1lpnTG6RgHPefJDJfagnPL56nkEiy7kU3GfcXrRFJA30
 CvpOdVM47lQLoCDZaGOosBDKm5rlC5XvMAZdG2Hw5v+1eEZuRXz4SP4GeDpPUbqIca4t
 CfpUPWxDeqWgYkkyyfoY/aJ/erHBcw61uwX1gfy2zVG02XCjW51zr5PV1Kg9l9sQtAZ9
 d49EFhzyB1UZE/xRhqakZmnf9AIcNuZOYwu3LBIa3cid9LcFa7OxFnhOwWXJNUFoTJdV
 ckuA==
X-Gm-Message-State: AOAM5322r19olGzaRKOlPlcHdArceawRLzm/1KiO57KtzBOAH6rsz9gM
 7SsyZnHOdJ9fFHnR7OsU9Dh9qw==
X-Google-Smtp-Source: ABdhPJzhH84/ykgDLLGioO3sOsuJOkgMbny/0DLYgdw5kw7S8YRtF9lazsNi07YqfzADCFATDPs45A==
X-Received: by 2002:a17:90a:4207:: with SMTP id
 o7mr23550307pjg.61.1634255001420; 
 Thu, 14 Oct 2021 16:43:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v12sm3394831pjd.9.2021.10.14.16.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 16:43:20 -0700 (PDT)
Subject: Re: [PATCH 1/4] linux-user/ppc: Fix XER access in
 save/restore_user_regs
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
 <20211014223234.127012-2-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08fb20b9-4784-4dfe-2bdd-7abeae8d6a4c@linaro.org>
Date: Thu, 14 Oct 2021 16:43:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014223234.127012-2-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: laurent@vivier.eu, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 3:32 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> We should use cpu_read_xer/cpu_write_xer to save/restore the complete
> register since some of its bits are in other fields of CPUPPCState. A
> test is added to prevent future regressions.
> 
> Fixes: da91a00f191f ("target-ppc: Split out SO, OV, CA fields from XER")
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   linux-user/ppc/signal.c                     |  9 +++--
>   tests/tcg/ppc64/Makefile.target             |  2 +
>   tests/tcg/ppc64le/Makefile.target           |  2 +
>   tests/tcg/ppc64le/signal_save_restore_xer.c | 42 +++++++++++++++++++++
>   4 files changed, 52 insertions(+), 3 deletions(-)
>   create mode 100644 tests/tcg/ppc64le/signal_save_restore_xer.c

The code is good so,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    sigaction(SIGILL, &sa, NULL);
> +
> +    asm("mtspr 1, %1\n\t"
> +        ".long 0x0\n\t"

While Appendix B does guarantee that "0" is and always will be an invalid instruction, I 
wonder if the test itself would be clearer (i.e. self-documenting the intent) using 
SIGTRAP and "trap".


r~

