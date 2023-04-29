Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C973E6F24A4
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:24:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjcK-000196-Sy; Sat, 29 Apr 2023 08:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjcI-00018h-RL
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:23:54 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjcG-0006D9-Tm
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:23:54 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f315735514so87629915e9.1
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682771031; x=1685363031;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QH2ERRaPfA3Ku5C45dBcrKTZsRsUmdfJT4LgcJmy8B0=;
 b=QOUXrXTUYp7Y3ht9sSPzIOYfdNL4VWfbHDj86vC9M+fJp44LdfxOWEltfqy8npCL43
 BsZGfrYizDIOP3rJ8pj/JtqLSwTmlVlAo2C7XsNQvkGANZ744wt97I/hQM2eKAUE1uJk
 WCX9gYQqEUHE+S3e2VHuXAnswylkMaVIYqyO9/GIdLNkBTSN6Tsjnw776fkNYVtdXtML
 0YUnAdWrO2CqCNUrfv45ZfleSwUyD9NQm32AdR7D3GOAWCwjRM4tB2fJtU3xMRO+TtBe
 5mZurqkiIX7dOEk+r2vrQrNzWwb0NGtdZ7MEmjg3PwFsuFyyswBH5ZyxssLHFUvh1V5n
 2J9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682771031; x=1685363031;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QH2ERRaPfA3Ku5C45dBcrKTZsRsUmdfJT4LgcJmy8B0=;
 b=FcO9TaVcxapmzQyW6sR/F5BGBguaMR+ndEKMHGIHxOCXN22QwyKrHnZ27kUd2S0JHK
 5BEggmECkT5WO5URts0inX5B23hufPKhidfkazgRd8g6DkJv/Pd7qqBhIrJ5BYLnj/j9
 OLrbfn4xt825n9/LMXt+pFmflYNyT0qTbAiedhI1cc8EO2wZqLR9ZDHzETkHGut9RGZu
 3nW6Npun7SJz9FvFN0V5O1GZ9qRbgOCgEorrgdB1sMzIngVmcoTIfMoMXAtsDgwEqhHi
 FGjCam4Zh6QvTmZuaD2JSYfLAE09mCp8d5+ZxMEKnUpJfBJMfwNDm6c27CqlD7FCJG1H
 dWoQ==
X-Gm-Message-State: AC+VfDw2t6w+i+X1uniRq3WD6uvMiUZvl9G0SM4A4S3JaNYQBixSt3o6
 9LU9dWME6izBd3ptKDFlf0TRvQ==
X-Google-Smtp-Source: ACHHUZ70QqdCmUamHG47RHlhfyF8XHVl9sfkfF5vels2lr6jvknGXrOTfpFAPEDFdU022VVOhsgNww==
X-Received: by 2002:a5d:58c1:0:b0:306:2713:f7f with SMTP id
 o1-20020a5d58c1000000b0030627130f7fmr399302wrf.11.1682771031319; 
 Sat, 29 Apr 2023 05:23:51 -0700 (PDT)
Received: from [192.168.212.175] (7.red-88-29-166.dynamicip.rima-tde.net.
 [88.29.166.7]) by smtp.gmail.com with ESMTPSA id
 i6-20020a5d6306000000b002fed865c55esm23466712wru.56.2023.04.29.05.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 05:23:50 -0700 (PDT)
Message-ID: <2fe893f6-034a-ab80-67b0-e1bc88018a61@linaro.org>
Date: Sat, 29 Apr 2023 13:23:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/2] accel/tcg/tcg-accel-ops-rr: ensure fairness with
 icount
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Jamie Iles <quic_jiles@quicinc.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, peter.maydell@linaro.org
References: <20230427020925.51003-1-quic_jiles@quicinc.com>
 <7277aa1e-413d-2f7a-37ce-23ea1f54c09a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <7277aa1e-413d-2f7a-37ce-23ea1f54c09a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 29/4/23 11:28, Richard Henderson wrote:
> On 4/27/23 03:09, Jamie Iles wrote:
>> From: Jamie Iles <jiles@qti.qualcomm.com>
>>
>> The round-robin scheduler will iterate over the CPU list with an
>> assigned budget until the next timer expiry and may exit early because
>> of a TB exit.  This is fine under normal operation but with icount
>> enabled and SMP it is possible for a CPU to be starved of run time and
>> the system live-locks.
>>
>> For example, booting a riscv64 platform with '-icount
>> shift=0,align=off,sleep=on -smp 2' we observe a livelock once the kernel
>> has timers enabled and starts performing TLB shootdowns.  In this case
>> we have CPU 0 in M-mode with interrupts disabled sending an IPI to CPU
>> 1.  As we enter the TCG loop, we assign the icount budget to next timer
>> interrupt to CPU 0 and begin executing where the guest is sat in a busy
>> loop exhausting all of the budget before we try to execute CPU 1 which
>> is the target of the IPI but CPU 1 is left with no budget with which to
>> execute and the process repeats.
>>
>> We try here to add some fairness by splitting the budget across all of
>> the CPUs on the thread fairly before entering each one.  The CPU count
>> is cached on CPU list generation ID to avoid iterating the list on each
>> loop iteration.  With this change it is possible to boot an SMP rv64
>> guest with icount enabled and no hangs.
>>
>> New in v3 (address feedback from Richard Henderson):
>>   - Additional patch to use QEMU_LOCK_GUARD with qemu_cpu_list_lock where
>>     appropriate
>>   - Move rr_cpu_count() call to be conditional on icount_enabled()
>>   - Initialize cpu_budget to 0
>>
>> Jamie Iles (2):
>>    cpu: expose qemu_cpu_list_lock for lock-guard use
>>    accel/tcg/tcg-accel-ops-rr: ensure fairness with icount
> 
> It appears as if one of these two patches causes a failure in replay, e.g.
> 
>    https://gitlab.com/rth7680/qemu/-/jobs/4200609234#L4162
> 
> Would you have a look, please?

cpu count only going forward in rr_cpu_count()?

