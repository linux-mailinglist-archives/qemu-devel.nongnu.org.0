Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DFE5AE1A1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 09:54:29 +0200 (CEST)
Received: from localhost ([::1]:34492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVTPg-0006WL-IN
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 03:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVTME-0003Re-7n
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:50:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:43949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVTMC-00063h-91
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:50:53 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso6932682wmb.2
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 00:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=BASvNY91o3bFWz0LKUhMGYFQ430+hrLLJ5Mbe/1hzg8=;
 b=Ardpkq9T2qlDbRqddrsQ7ovkv+j2kE8jvOjufQ8QU/AUg/styN77PMVHuTKq8TVeO3
 cUnsmCOVrtfg6DaCBZW5I22lNHgdiBAgiW7U8CgsYHdtJXV9vuvC8SAVe4KMj+Cc4Tvm
 a8OcYtKb1lwppmnw66Gj/JCv/d4hefcuId3ejS8/j7bJDNvXDa0mHNAaVBBG0+dkQ5tl
 y+OKlKM8yKkjhAaWoJSX5CVW02ZpTlLRv5SE8Nx7o/7Sbks2rkHgXjhCm668cLz9HDIX
 1FxUEXJNL96hYyUhjg3xkL0WYcTJpPpbb7Ce53rA3J9x4m74wzXqF3IimlxBypt/FcgQ
 gwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=BASvNY91o3bFWz0LKUhMGYFQ430+hrLLJ5Mbe/1hzg8=;
 b=RLcc9gJjlYCaIm5heRXCcgeoiWTBJ0hGD12HdO0gJ5AxRPvbGUQxE9eVqBjjMszygz
 RlwwY9ZHl6bM8FKb1ev7t+sKQN289NiKfyHo+GepYfMrKYGD8u4HT99kIW+sUPXrjRBJ
 m8rLzxlhMrwhEUeKM0tvfBaI5ue6Z+gVrvtb0BRTcQgcL7zFoyG/0/UW6y3dr5en0mJ3
 QlIK9hj1B3YmLF7NZoYGtBtG7doGqzTilcsGoOcVZFwz9Brq2Ga53bKkv6IAGvEI5+v8
 zz96rg29WXS+OeO+r8oJlH7D67z+go+dGOelS07nw5DDyf4AVuNPzRe3NIo5xGyGdpRR
 DaSw==
X-Gm-Message-State: ACgBeo1lZ9zHY1DbV/UXrq8tMVNwDlQ8WBIFS4AvN9I1FuxuU2o9Mp2U
 BQ5CvTu8xU0kOhGVH4MX730Eqw==
X-Google-Smtp-Source: AA6agR5iAqZBR8oNYCKEWB7Zh0LCk5UQLBJuGD/4pMjY17vGAXhqdJyLxTru0mMMd2E6lYiyl/rv9A==
X-Received: by 2002:a05:600c:2242:b0:3a8:4007:bc5e with SMTP id
 a2-20020a05600c224200b003a84007bc5emr12272157wmm.99.1662450649314; 
 Tue, 06 Sep 2022 00:50:49 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1?
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d560c000000b0021ef34124ebsm11510610wrv.11.2022.09.06.00.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 00:50:48 -0700 (PDT)
Message-ID: <ccb7bf6c-645f-62a0-2488-8f0aa6a0104a@linaro.org>
Date: Tue, 6 Sep 2022 08:50:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/7] Allow semihosting from user mode
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Furquan Shaikh <furquan@rivosinc.com>
References: <20220822141230.3658237-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220822141230.3658237-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 8/22/22 15:12, Peter Maydell wrote:
> Currently our semihosting implementations usually prohibit use of
> semihosting calls in system emulation from the guest userspace.  This
> is a very long standing behaviour justified originally "to provide
> some semblance of security" (since code with access to the semihosting
> ABI can do things like read and write arbitrary files on the host
> system).  However, it is sometimes useful to be able to run trusted
> guest code which performs semihosting calls from guest userspace,
> notably for test code.
> 
> This patchset adds a command line suboption to the existing
> semihosting-config option group so that you can explicitly opt in to
> semihosting from guest userspace with "-semihosting-config
> userspace=on".
> 
> It also brings all our target architectures into line about
> how they handle semihosting. Currently these fall into three
> different groups:
> 
>   * semihosting permitted only in privileged mode and only
>     if enabled on the command line:
>     - arm
>     - m68k
>   * semihosting permitted in any mode, if enabled on the command line:
>     - mips
>     - nios2
>     - xtensa
>   * semihosting permitted only in privileged mode, but fails
>     to honour the existing "enable semihosting" option, instead
>     enabling it all the time:
>     - riscv
> 
> The effect of the new option for group 1 is:
>   * user can now optionally also allow semihosting in usermode
> 
> For group 2 it is:
>   * usermode semihosting used to be permitted, but now changes
>     to default-disabled, needing explicit enablement
> 
> For group 3 it is:
>   * semihosting overall used to be default-enabled and is
>     now default-disabled, needing explicit enablement.
>     Semihosting in usermode can also be enabled.
> 
> That means this is a "things that used to work no longer do
> unless you change your commandline" change for groups 2 and 3
> (so, mips, nios2. xtensa, riscv). Consensus seems to be that
> it's OK to call this "fixing a bug" and note it in the
> changelog/releasenotes.
> 
> Changes v1->v2:
>   * make riscv check for semihosting being disabled at
>     translate time, not runtime
> 
> Only patch 7 needs review.

Thanks, queued to semihosting-next.


r~

