Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBDA6ACD63
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:59:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZG2t-0006TB-A3; Mon, 06 Mar 2023 13:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZG2q-0006Su-RM
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:58:49 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZG2p-0003Ki-35
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:58:48 -0500
Received: by mail-pf1-x444.google.com with SMTP id ce7so6490037pfb.9
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678129125;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dOBklgWpUuts538aazj8/78PMWnYU5BAudgPF75R3Yo=;
 b=G5VV4r4l0DQzR55bdtDpc4fTVXB+ySzllr0/Q79YPblNAKw11sBz/r43ONDDE7KIhr
 I1FcT/KPHWmcr4StGnNKqy/c3xazWqVueF5y8mIuSPCE+pu6sDSAwJBtV5+YwWpefiwu
 eyOkUNXmJOhEhuVelZO9MTPaFgTQgbOpHecnslZs9F/2b9bdq1omxdyhau9e/be2A2EU
 kCvloqwOs+R28cHzTLQqOeEv5V5UXXyVpQ+c/YFMJTtbGMgSJNFP2O4VECqw9LPy+c8W
 X6wqMU+GTJPZ+NGG7V7Ds/2VCyWrGa4HtHgfH8BjbfhN8cm8T4TS8EJDG+hkZd6fIyRx
 2PPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678129125;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dOBklgWpUuts538aazj8/78PMWnYU5BAudgPF75R3Yo=;
 b=GcSNLsFQKHF1JCViXrDsHY+F2xfLUxIm0ZQsp87jxzoUAmgEbq58T64zeSCZrDQR04
 BCkg3qOna1+Xcss61Gjab4RfVTKR+B1q79yrqRkqubUR+EtALNWx+GopI8ykLVaiZ5TY
 qTF3et92aWdQKJgqeIKtQauHbBINTBxKo9Wwon2w0sBsChDYp0hokm1gkIlL4+mksrUT
 6DLyZR5TMTFnhE1dVoES//E4Eexb3+1Lh/Eycz5x71tKksdxjvw2pqaTcSpk7tPMnD77
 lG0Sq0YL4m9At7TSAgILTnfwJyzRU2SNyAuoYPnhwcGZW4Ah9UTFUza9r230CBHOy4bk
 MY8g==
X-Gm-Message-State: AO0yUKV9X0rO/Tn9uk5K4fxjHNyUqUHcM8Ded0TAqHVGQ64i379vlFxz
 BmIigr+zU7rpzm4OQAqeH4eIoA==
X-Google-Smtp-Source: AK7set/mk5skWrkCPTF+29P2bVyKf/uwKPzh2qX7G3le8YLu3fnC8wF0pGeJ/W6BsncX4+sk6I2xgQ==
X-Received: by 2002:aa7:9552:0:b0:5a8:b2c1:97c7 with SMTP id
 w18-20020aa79552000000b005a8b2c197c7mr11163291pfq.34.1678129125535; 
 Mon, 06 Mar 2023 10:58:45 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:7632:29c7:3cce:bec3?
 ([2602:ae:154a:9f01:7632:29c7:3cce:bec3])
 by smtp.gmail.com with ESMTPSA id
 3-20020aa79143000000b005810c4286d6sm6629992pfi.0.2023.03.06.10.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 10:58:45 -0800 (PST)
Message-ID: <648ce3f9-8816-77c1-cd44-198a75127d6b@linaro.org>
Date: Mon, 6 Mar 2023 10:58:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/23] Fix NB_MMU_MODES to 16
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net,
 peter.maydell@linaro.org, mrolnik@gmail.com, tsimpson@quicinc.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, edgar.iglesias@gmail.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
References: <20230306175230.7110-1-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230306175230.7110-1-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/6/23 09:52, Anton Johansson wrote:
> This patchset fixes NB_MMU_MODES to 16 for all targets, meaning the
> macro is no longer target-specific.  16 mmu modes is large enough to
> cover all currently supported targets (12 arm, 10 ppc, ...), and is the
> maxiumum supported by the softmmu tlb api.
> 
> As mentioned by Richard in response to our RFC, softmmu tlbs are
> dynamically resized and so the overhead of an unused mmu index is fairly
> low.
> 
> The grand goal is to allow for heterogeneous QEMU binaries
> consisting of multiple frontends.
> 
> RFC: https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg04518.html
> 
> Anton Johansson (23):
>    include/exec: Set default `NB_MMU_MODES` to 16
>    target/alpha: Remove `NB_MMU_MODES` define
>    target/arm: Remove `NB_MMU_MODES` define
>    target/avr: Remove `NB_MMU_MODES` define
>    target/cris: Remove `NB_MMU_MODES` define
>    target/hexagon: Remove `NB_MMU_MODES` define
>    target/hppa: Remove `NB_MMU_MODES` define
>    target/i386: Remove `NB_MMU_MODES` define
>    target/loongarch: Remove `NB_MMU_MODES` define
>    target/m68k: Remove `NB_MMU_MODES` define
>    target/microblaze: Remove `NB_MMU_MODES` define
>    target/mips: Remove `NB_MMU_MODES` define
>    target/nios2: Remove `NB_MMU_MODES` define
>    target/openrisc: Remove `NB_MMU_MODES` define
>    target/ppc: Remove `NB_MMU_MODES` define
>    target/riscv: Remove `NB_MMU_MODES` define
>    target/rx: Remove `NB_MMU_MODES` define
>    target/s390x: Remove `NB_MMU_MODES` define
>    target/sh4: Remove `NB_MMU_MODES` define
>    target/sparc: Remove `NB_MMU_MODES` define
>    target/tricore: Remove `NB_MMU_MODES` define
>    target/xtensa: Remove `NB_MMU_MODES` define
>    include/exec: Remove guards around `NB_MMU_MODES`

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


