Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F8E363741
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 21:09:38 +0200 (CEST)
Received: from localhost ([::1]:43522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYCnZ-0002fE-T0
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 15:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCmT-0002Bc-BN
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:08:29 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:42570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCmR-00087j-M1
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:08:29 -0400
Received: by mail-qk1-x72d.google.com with SMTP id d15so20920289qkc.9
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 12:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=luXj+QqBCr4mSorxQXO4qeWQdLwvcQUDJ3E65of9NNo=;
 b=n1lR0NGOvIRdtszE+1R5o1k7ZFF0oeEEBUcOaYeR2vDdMVvG0Metrv+ad/t7GqYlaA
 WhDXuCAItUq+gSMF0pRj8tvr6DaMKWG8IQltKtESkmxhpiZGCDXGHzTVXyiZYcUV6lYh
 IM5mjel/xeEHlRfyBUpeyIWnoyFswgbiztEAfpOZBNN3scM3wJJ5xo19slHB5N/SkmR6
 sQxu4+aXijU6v0O1aWkzVCKrE76S8E99/4JsukpBXzF0vi3Aq/Bg3RtkdsyeO5h7J+ds
 GbK+JRLQfDm9dgZFG0B+m3y9jz7uBy34GbFTbgYysPqagdNRH+zkFBVq+LkAq6eZU8EI
 HuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=luXj+QqBCr4mSorxQXO4qeWQdLwvcQUDJ3E65of9NNo=;
 b=U3RameYoqO6qERiv/nH4TUFW/JgxOPVjpcIp8/RnlriW5l1Es3v4YC1PCsHyrXUjFp
 UPFhV86oGKn+Ff93q1TIPRja/+JEwi+zYXKzMMzaUtz/uykP1YZNrtjOofnh8ybPCgmj
 1/dMhh0Kp8hEea139mP8WNn7wuhugJnDyxMr9lSojIWii3VZMqj4PmLZkeVdHubE37vc
 ZPacFA88Cz6CTjCiCIJv7DRtnXNxvvRviqEqqL0P91Go/1l7GjlTpbhRKWDdolGQmxjC
 wssdbbkF5PKQ/UPuVg6m8Fdk+SzoNcFB8011aFcJr9NOm4ZHlKcxfv+E7TWAH86pSV9/
 tMFw==
X-Gm-Message-State: AOAM530Nh9NcL5DLYIHDPqGZBIOGIeQ5xprioA3ACUzutDgaEm23qsN+
 QHzWj61JJGD/c/uB98bsDOAGmw==
X-Google-Smtp-Source: ABdhPJxHDBZip05EzviN8eRY68yw1QbIO8ZOh18mDujT46xLDcpZINbcJfj2IVrYYZn6YxaBFYf4OA==
X-Received: by 2002:ae9:ed14:: with SMTP id c20mr2156299qkg.312.1618772906221; 
 Sun, 18 Apr 2021 12:08:26 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id f12sm7888468qti.63.2021.04.18.12.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 12:08:26 -0700 (PDT)
Subject: Re: [PATCH 06/26] target/mips: Extract load/store helpers to
 ldst_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ddf7817e-3476-099c-345d-a094e97c1af3@linaro.org>
Date: Sun, 18 Apr 2021 12:08:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> +static inline hwaddr do_translate_address(CPUMIPSState *env,
> +                                          target_ulong address,
> +                                          MMUAccessType access_type,
> +                                          uintptr_t retaddr)
> +{
> +    hwaddr paddr;
> +    CPUState *cs = env_cpu(env);
> +
> +    paddr = cpu_mips_translate_address(env, address, access_type);
> +
> +    if (paddr == -1LL) {
> +        cpu_loop_exit_restore(cs, retaddr);
> +    } else {
> +        return paddr;
> +    }
> +}

Code motion, so,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

but I think that it's a mistake for cpu_mips_translate_address to split the 
raise_mmu_exception from the cpu_loop_exit_restore.  If you make the changes to 
env to indicate the exception, you *must* then go back to the main loop.

There seems to be exactly one caller, this one, so it should be trivial to 
change, which the lets do_translate_address vanish entirely.


r~

