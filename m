Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603536F23DB
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 11:28:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psgsG-0008SH-FH; Sat, 29 Apr 2023 05:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psgsC-0008Pw-Uj
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 05:28:08 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psgsB-0004bg-7O
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 05:28:08 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f315735514so84775975e9.1
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 02:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682760485; x=1685352485;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8lkDjhuk7LvGDXUe5u4PzvpeseonAcfKb7P8xYFl5Aw=;
 b=EZGwE7a+IAVYdT2E7wc0gqMsI0u9VOl00i6pchYMPuYqmfSyail+3eKMWkUyRHCvHB
 5LW69SxpSYiXRI0trF/EZbZslbKnfYi5Y3SJryXYv6wTjlynMH1BFJ89qjpCRvhdq7Xq
 /lwcnXk66xLV026C0v7noddH6ARn16Q1mHzqSE1OedvUadHt5EeSrtD3iGsuMF71Svw/
 WydyZ/XWIt9etm5QG22yt6AY29cPlOIaEGkbajmNcDEldKSNON5q1qX7Xtb3wHCYYWRa
 GtD8KmueE5tNxcXm89TUTC4LYI7VD15OUT7RsrJo0I/bYSUGED6tD3nuzI56aFKOcJGj
 qjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682760485; x=1685352485;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8lkDjhuk7LvGDXUe5u4PzvpeseonAcfKb7P8xYFl5Aw=;
 b=Ct2luJj5G6WZgnCvgz6WuKfqS5RDDjtFEYrN6C6iQwCn0wuAuGDsP5HIdzYhR9Q/a7
 cKbGYRknWXBfDf9DgcH+50DreQXognS1Ug6gG6UF6cSYSquy1VNHjRL+a7CbBRv6Se11
 cTzSMr+q2lu/Xna9SbkHuQbnsL4B68l3egWFhwoJRQHxyHEHSUsaYrPORh4H8K3B6kNX
 eXk14HOuJkPGvic2SizGqElpcsuL/h/ohIMmGOFoSeEuEcHLEM6G7m1KrN8Q6X3uu4CV
 PEJgilFUQKUVhJnKZRr4NaQznAQxSx0przhqo6lj1SES/adhLZlXcT2noxOh3GHE2SNU
 A2Og==
X-Gm-Message-State: AC+VfDxmdj3CUl9JckBCtuJjyY2gyMb5/W3PsGPKwshThkAXEWK44KRq
 H0qDP1wKsX7q0Dcu2NK+3eSn8Q==
X-Google-Smtp-Source: ACHHUZ4OkVarNauSXS1OpsU5egNAa6EaZQvbLeJP5olpQ3hHwz0p6LAJ7296oT4zaN4zSRHU49usaQ==
X-Received: by 2002:a1c:f20b:0:b0:3f2:5004:be6f with SMTP id
 s11-20020a1cf20b000000b003f25004be6fmr5508590wmc.4.1682760485470; 
 Sat, 29 Apr 2023 02:28:05 -0700 (PDT)
Received: from [192.168.1.17] (78-141-23-110.xdsl.murphx.net. [78.141.23.110])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c114900b003f1745c7df3sm3407592wmz.23.2023.04.29.02.28.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 02:28:05 -0700 (PDT)
Message-ID: <7277aa1e-413d-2f7a-37ce-23ea1f54c09a@linaro.org>
Date: Sat, 29 Apr 2023 10:28:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/2] accel/tcg/tcg-accel-ops-rr: ensure fairness with
 icount
Content-Language: en-US
To: Jamie Iles <quic_jiles@quicinc.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, peter.maydell@linaro.org
References: <20230427020925.51003-1-quic_jiles@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427020925.51003-1-quic_jiles@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/27/23 03:09, Jamie Iles wrote:
> From: Jamie Iles <jiles@qti.qualcomm.com>
> 
> The round-robin scheduler will iterate over the CPU list with an
> assigned budget until the next timer expiry and may exit early because
> of a TB exit.  This is fine under normal operation but with icount
> enabled and SMP it is possible for a CPU to be starved of run time and
> the system live-locks.
> 
> For example, booting a riscv64 platform with '-icount
> shift=0,align=off,sleep=on -smp 2' we observe a livelock once the kernel
> has timers enabled and starts performing TLB shootdowns.  In this case
> we have CPU 0 in M-mode with interrupts disabled sending an IPI to CPU
> 1.  As we enter the TCG loop, we assign the icount budget to next timer
> interrupt to CPU 0 and begin executing where the guest is sat in a busy
> loop exhausting all of the budget before we try to execute CPU 1 which
> is the target of the IPI but CPU 1 is left with no budget with which to
> execute and the process repeats.
> 
> We try here to add some fairness by splitting the budget across all of
> the CPUs on the thread fairly before entering each one.  The CPU count
> is cached on CPU list generation ID to avoid iterating the list on each
> loop iteration.  With this change it is possible to boot an SMP rv64
> guest with icount enabled and no hangs.
> 
> New in v3 (address feedback from Richard Henderson):
>   - Additional patch to use QEMU_LOCK_GUARD with qemu_cpu_list_lock where
>     appropriate
>   - Move rr_cpu_count() call to be conditional on icount_enabled()
>   - Initialize cpu_budget to 0
> 
> Jamie Iles (2):
>    cpu: expose qemu_cpu_list_lock for lock-guard use
>    accel/tcg/tcg-accel-ops-rr: ensure fairness with icount

It appears as if one of these two patches causes a failure in replay, e.g.

   https://gitlab.com/rth7680/qemu/-/jobs/4200609234#L4162

Would you have a look, please?


r~

