Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1432B9AA4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 19:31:01 +0100 (CET)
Received: from localhost ([::1]:48196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfohw-00036c-Qd
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 13:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfoeL-0000HH-7z
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:27:17 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfoeG-00048e-KC
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:27:16 -0500
Received: by mail-pg1-x544.google.com with SMTP id m9so4996642pgb.4
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7XkyJxD+vCPYAqI/HIyIHvi+MyCG8Ym29xbg4hkgHGY=;
 b=UMgPtGB0TjbN8Wyfin0zvx8VAQY1SHb3bnW3eVU15SM19ZV3cqEcxozLPnWAxOcqpM
 aMe3xqGInZvQsGlfZ0NenH4Uf/2RAC69bVhL4CfPlxAesUkUO9RUHH9+7wWCiC+Js4EO
 sS9h/QIOPPDR1MQ30ZSBMK92K7h7A4Bm4TaGJHWXgslfC5Wt4g2EZ96VvgRXpb60YknR
 qRpmVuzpdAcxrW8TJKRTfgyWA6fp/fzdrkr6OyYbTBbfmm8PCJG1Zz1XmgStK58TIdpO
 NkXTOjzXCOIeoA1QYd6vPRwUkG8KuNEXTYc+DY/m5YQ2kKs6X3q4D3SXJzrUA16NONwi
 yb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7XkyJxD+vCPYAqI/HIyIHvi+MyCG8Ym29xbg4hkgHGY=;
 b=geJkz7cUwM5tzDKRjhcj/kci2AIyo07MiY2/oo8H4XDSPx0g5lSFtjrmBpvNkzIk8d
 6t6YxBqzT3yqJdqK2pvozye9Nn1QtJdlzZJpLUknjOONF6jxje8OWPLEPGrgL59X8z2f
 v8EVRw2YRCX2OX0Sgm3IkH4VmL8uGRKJ7YYN+LLCcXC0zxvYsjAgLFapi7hmaiqRFaP5
 rd11bYDuNAzrTT1Is5gGvz7KatIiNuhGM8/OzN8XssqMakX+MmjHfAvjodBmiZSqMgrU
 SqKYv6ics0vhNWw9aGFXkK3Ptf5jGFpNeD0Pvy7LdxFk08/PuBRf8MtHFeSBIusid48H
 XdQQ==
X-Gm-Message-State: AOAM5330MFlZmEViDDyNaPT/YejX3gBTTRvpDc1FoV5oUO5bFbathNhi
 JxYmV8JjF2bYMu98Z44Q52s1Rw==
X-Google-Smtp-Source: ABdhPJw5TyXwlzpbOJUeeNqfTFWT4G8qMA/P/GmSYpGrC3aLupWHivoQcLQezVbTpxFtSR9Fj2OHwQ==
X-Received: by 2002:a63:3111:: with SMTP id x17mr13647373pgx.329.1605810430241; 
 Thu, 19 Nov 2020 10:27:10 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id l190sm489741pfl.205.2020.11.19.10.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 10:27:09 -0800 (PST)
Subject: Re: [PATCH] linux-user/arm: Deliver SIGTRAP for UDF patterns used as
 breakpoints
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201117155634.6924-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6fae2e37-525d-5dc9-c9eb-ed482813891b@linaro.org>
Date: Thu, 19 Nov 2020 10:27:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201117155634.6924-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/17/20 7:56 AM, Peter Maydell wrote:
> The Linux kernel doesn't use the official bkpt insn for breakpoints;
> instead it uses three instructions in the guaranteed-to-UNDEF space,
> and generates SIGTRAP for these rather than the SIGILL that most
> UNDEF insns generate:
> 
> https://elixir.bootlin.com/linux/v5.9.8/source/arch/arm/kernel/ptrace.c#L197
> 
> Make QEMU treat these insns specially too.  The main benefit of this
> is that if you're running a debugger on a guest program that runs
> into a GCC __builtin_trap() or LLVM "trap because execution should
> never reach here" then you'll get the expected signal rather than a
> SIGILL.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is not a "fix" for LP:1904210, but it does bring QEMU's
> behaviour into line with that of the real kernel on that binary.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

