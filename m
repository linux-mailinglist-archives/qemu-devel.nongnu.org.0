Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50735308258
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 01:24:21 +0100 (CET)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5HaF-0007SY-Ql
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 19:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5HYw-0006wx-D9
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 19:22:58 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5HYu-0007pj-M8
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 19:22:58 -0500
Received: by mail-pj1-x1036.google.com with SMTP id a20so4849538pjs.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 16:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=liZURIvGWaeeRZcNNHiqFK7TxREt9N52GAvB7/hDVBU=;
 b=jW947Kut89PRVWROrDfTRrbw40k1Hq874+4ihmbrsq9He/K1O3e+j34JxtzRNzJISJ
 N2S+cus473/oFF/EUKIzIYyI8q6Y9TnE16WH50ETEomzTStK2MrOsi4s4GQW7BsILz2E
 Qvuvq0kaSGtGWMKYsqiSPpRfJngZeuIw7Ehz0J8/fDxLLZqNvPkk5bL8GF3P230CsG2A
 iPEd2yqQsD7DKnktd0DvnZW533iRZebTiWB3gY7ws+GQ1kSrrbZdvikW4xyDzcrARmj/
 op31gBlVrd/wBRzdJJibs3nW9Dex35++c7bXB8Z8Kxp1xzGKPCQTwf2eokHTY6O07Pvv
 WrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=liZURIvGWaeeRZcNNHiqFK7TxREt9N52GAvB7/hDVBU=;
 b=tKoOgYJ+xFv3pBoZkek+bbqVOSYxPZyIrxjAFHAWAeiFGgDhcLeVuwWpZdAu2wsw39
 NbZwzJ/z2U87UO58BhZuwW+IRLoxhYmPmUJ425y/AMdZdTaeXhhy5sQTUVYq08kt7/dz
 hELerx3ydul0F6Nhc8/zH+ersasVPDL2/DZzwy1b9jQdx/5U1ISp63UbcQDgGP7mi3W2
 k/DDPepEkv5HCGTSgihGI7A2TQ4OFcIWwZqcA0WoXVyxTn5wWcbPhL64V+jswIozFCiO
 oYYRykBoqzWwh6QP2L07BuD+3v6E0f+4wfVafJlGW9D4NBMCGGTp3lLgSSekguti05qU
 jDfg==
X-Gm-Message-State: AOAM532GoHFYT/2+Ms+38BV6P6OLjHJt8g+JIMUek7wVuN7R/7CSCuaP
 ODmQF0KkdUH96k5AJV2WTst83grPZlXQsd2X
X-Google-Smtp-Source: ABdhPJw/+ulJGHWbLdr+a+6j3rC9xcp9umwXNpVKL11V5nPrHyFkQYA/BBhmH6DPsYnJDyUwWq2ttQ==
X-Received: by 2002:a17:90a:df84:: with SMTP id
 p4mr1860521pjv.81.1611879774760; 
 Thu, 28 Jan 2021 16:22:54 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id 11sm6690601pgz.22.2021.01.28.16.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 16:22:54 -0800 (PST)
Subject: Re: [PATCH v14 00/22] i386 cleanup PART 2
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210128092814.8676-1-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <584ef645-833f-1f62-5991-d9ec2904ba46@linaro.org>
Date: Thu, 28 Jan 2021 14:22:50 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128092814.8676-1-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 11:27 PM, Claudio Fontana wrote:
> Claudio Fontana (17):
>   target/riscv: remove CONFIG_TCG, as it is always TCG
>   accel/tcg: split TCG-only code from cpu_exec_realizefn
>   target/arm: do not use cc->do_interrupt for KVM directly
>   cpu: move cc->do_interrupt to tcg_ops
>   cpu: move cc->transaction_failed to tcg_ops
>   cpu: move do_unaligned_access to tcg_ops
>   physmem: make watchpoint checking code TCG-only
>   cpu: move adjust_watchpoint_address to tcg_ops
>   cpu: move debug_check_watchpoint to tcg_ops
>   cpu: tcg_ops: move to tcg-cpu-ops.h, keep a pointer in CPUClass
>   accel: extend AccelState and AccelClass to user-mode
>   accel: replace struct CpusAccel with AccelOpsClass
>   accel: introduce AccelCPUClass extending CPUClass
>   i386: split cpu accelerators from cpu.c, using AccelCPUClass
>   cpu: call AccelCPUClass::cpu_realizefn in cpu_exec_realizefn
>   hw/core/cpu: call qemu_init_vcpu in cpu_common_realizefn
>   accel: introduce new accessor functions
> 
> Eduardo Habkost (5):
>   cpu: Introduce TCGCpuOperations struct
>   cpu: Move synchronize_from_tb() to tcg_ops
>   cpu: Move cpu_exec_* to tcg_ops
>   cpu: Move tlb_fill to tcg_ops
>   cpu: Move debug_excp_handler to tcg_ops

I'm going to queue the first 18 patches to tcg-next.

With the exception of the minor target/arm do_interrupt change, they clearly
fall into the tcg bucket.

Patch 19, split i386 accelerators, needs more i386 review, and on a host
accelerator I can't test.  If I drop that, then patch 20 doesn't apply, so I'll
let the rest of the series go.  But at least it'll reduce the size of your
patch load.


r~

