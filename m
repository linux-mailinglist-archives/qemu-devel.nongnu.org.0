Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EF84403DE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:10:58 +0200 (CEST)
Received: from localhost ([::1]:46986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYDJ-0007tC-1x
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXg8-0000Y6-Em
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:36:40 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXg7-00037K-0p
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:36:40 -0400
Received: by mail-pg1-x536.google.com with SMTP id a9so289414pgg.7
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 12:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=uJPyfnW8ESn6xR+GGqwtsH5j4Yizwd/GRqzBPe64xrM=;
 b=HX6zxgonqcJBLtrcaYBbTuHXNCKju9HsoZ6noFQZ28wE15uDMBHImVERR7v6ujFFTz
 YsCABFBJEXuNtKg4UKsKFkirURHPaMef26ovEqwmmPYpxCJAkBWpM9I6ltrrGzgd7w2U
 35j2NW5TJyJPdQqXNGMZTG5JRzJHY5IhBmzSp8A0HTUmvpEBkrUb6kpkhDwL6WmfXi7N
 H+m76E4Izk/FPJG7J6qWla6zYLbJzWcY5OGUNaSNQlUshr52HTwnNGp0BcBAs7uwOxaA
 nuFoKG92DLo64zK793IGrSqSUWoxw7IWfyqknyrgjnDiC32gqc6GVJtqnmNryGPWEPXG
 9Ebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uJPyfnW8ESn6xR+GGqwtsH5j4Yizwd/GRqzBPe64xrM=;
 b=fxZrKFjLagrMDDK1hHpaPpYMJbfESYFG1Tl6EFltYkCytz+ZF9Ltg6EYHugrxpS/Wk
 ZvdzsiyDIoKhugkczIT9fWWbN+VLtdZp/RUfwKLRZYgbzLqlvp2H3miyel97dSTqL9H+
 VP7R9fkbt3YTYTw6GjeXON2ROpuTtQ92zO7gePEsdcH86tcAKZsJbAMmUSCCpRl2uy/f
 34Yz6xPCk3AMDJgJLTTV4IAVGXzevnYD0h9Ui0zUrEVpm9HwUOpNXCVypWADlpwuoSEP
 2Lyz/LvZ1OJKqvh6MCJrOXX0eQeUhq2ARqDPij3q2rT/YlkvJ+gjlqlP8RwM6ugRvEfI
 eIZw==
X-Gm-Message-State: AOAM532NMYgHtXrX4j4Rild4dt70yH7p5fnwl7k4++xel4kuCrfHnwZc
 6EvDlH3q0yhzKcYRRk6v6+5otg==
X-Google-Smtp-Source: ABdhPJxp7WChR94NpjCVFMYiOnSEsjIo8/re2ITDWpw9hFJkZnAVFNbm2oCzOUGlzuzTzpSK+TN8Rg==
X-Received: by 2002:a63:bf4a:: with SMTP id i10mr9809752pgo.196.1635536197520; 
 Fri, 29 Oct 2021 12:36:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id a135sm7805860pfd.96.2021.10.29.12.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:36:37 -0700 (PDT)
Subject: Re: [PATCH 2/5] target/riscv: debug: Implement debug related TCGCPUOps
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211029152535.2055096-1-bin.meng@windriver.com>
 <20211029152535.2055096-3-bin.meng@windriver.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <59907aa4-4b40-9f02-e87c-18e7fc2dc460@linaro.org>
Date: Fri, 29 Oct 2021 12:36:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029152535.2055096-3-bin.meng@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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

On 10/29/21 8:25 AM, Bin Meng wrote:
> +void riscv_cpu_debug_excp_handler(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (cs->watchpoint_hit) {
> +        if (cs->watchpoint_hit->flags & BP_CPU) {
> +            cs->watchpoint_hit = NULL;
> +            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, GETPC());
> +        }
> +    } else {
> +        if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
> +            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, GETPC());
> +        }
> +    }
> +}

GETPC is only to be used by handlers called from TCG generated code.
You want 0 to indicate that unwinding is not needed, as it has been done for you already 
by generic code.


r~

