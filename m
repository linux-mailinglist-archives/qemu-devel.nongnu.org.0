Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A046A1214
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:32:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJCP-0002GI-Q5; Thu, 23 Feb 2023 16:32:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJCD-00029t-PP
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:32:12 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJCB-0002oN-SZ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:32:09 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so573546wmb.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 13:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oo/G3OAvGL5czVH/dZx/1p1bi09xf4OSuuCzt2q+1+E=;
 b=kq5eHJJvIDHejzm5jZOp7zUFgbLNsvBWGpawqo8BTY27aa6c3FxXSJnjvcUKQmU0fk
 TN+Sht48HUr+Q4DDT8ZhATqsWgjeFqDdbbdPD9iHQXZeVboC69v194iUNpsSiGC87MRp
 /SnZjxxfVhyTX1fQkB1Er91WsbZ0f3aFoOgRVc0rgWg5M7r3jc3IJHB4f2QzhkoxINJ4
 8fMiSp3OGj5QAzaMse8n5EXyzM1RZ+KY5NhxwWzJK07Tegsan0Bj9nroc4xHup6EiZTa
 MBdTWPyHneiefLYisnnIo/qX2jMCALA2ssSR0VHkSxdRqTx5kzvSJe3HOeSwcuvhvEGF
 BmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oo/G3OAvGL5czVH/dZx/1p1bi09xf4OSuuCzt2q+1+E=;
 b=jwn8Rm2hl9IOjXcC+r19PdoLseuhkChzGHIjLJlMzOqCLMkx5GQbByvRsk018llI/E
 0/vVUpHY+8CWbrQ/USNs4nCXX3BrLwHAtonG+24SsfqbWOCs6f7JOyvVgjiZ4ksoaiAz
 YpmL5WR4N7sU3HE+FCal/6c8fkDDI8+MXforJVYstROyCLyRKJrhWvZ52DbqvOd2LhLh
 8pEJv95AFm63B7v0dDQb1qquvzTNNWks1SWclZSh5XsHylSLdaMHBwRCnqBG/Avd6d4p
 lg9He7aLKXmBrkPJN6Yf4WnPot+Q7xLvUoIiuTnI7CpVvKvt9/CTcFuRohXUO2zGUotO
 Virw==
X-Gm-Message-State: AO0yUKVpt1rBLPWUa6a5AoWqrIEMKqlu4LjnpcHImdh8LzdqLW2UtWVa
 TJaOnGiebn3imHM/JaH1vaBe/ZAwiphQOL5d
X-Google-Smtp-Source: AK7set98OEZeHCBuOl/DaqBL+TwqbTGQolnb47g+0o2GH9YqSL/7SXq06qItgwa4ZA2D+c/klHztXw==
X-Received: by 2002:a7b:c384:0:b0:3ea:d620:570a with SMTP id
 s4-20020a7bc384000000b003ead620570amr1447636wmj.38.1677187925963; 
 Thu, 23 Feb 2023 13:32:05 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a7bc00b000000b003e91b9a92c9sm526394wmb.24.2023.02.23.13.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 13:32:05 -0800 (PST)
Message-ID: <672b980b-e86d-df20-6589-6dc626a9e5b6@linaro.org>
Date: Thu, 23 Feb 2023 22:32:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 10/13] accel/tcg: Add tlb_fill_flags to CPUTLBEntryFull
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223204342.1093632-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/2/23 21:43, Richard Henderson wrote:
> Allow the target to set tlb flags to apply to all of the
> comparators.  Remove MemTxAttrs.byte_swap, as the bit is
> not relevant to memory transactions, only the page mapping.
> Adjust target/sparc to set TLB_BSWAP directly.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-defs.h   | 3 +++
>   include/exec/memattrs.h   | 2 --
>   accel/tcg/cputlb.c        | 5 +----
>   target/sparc/mmu_helper.c | 2 +-
>   4 files changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


