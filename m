Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397C33CCA4D
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 20:52:20 +0200 (CEST)
Received: from localhost ([::1]:32994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Bti-0007yo-OS
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 14:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5BsG-0006oz-10
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 14:50:48 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5BsD-0007lQ-HO
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 14:50:47 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y3so3931053plp.4
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z7uKUK4Cv1XRqPuGFcM56cuKUic8QxQDaP2fXU35ojY=;
 b=Yji5Yf4gMS78wToNpA7BvKN9St80G+ad/dz3onm8DFDfySmUL8VKCB8Y7Tnm47hpeS
 lC8BzFpnpOdLHc79Jgg16albfUbbJxDJh6OP3u4Xld/p2gClKirlAtqIzx0MCVY8yDcn
 ELvjpTZZK33zuft/xdDfixiQwchd/w84LQPfnJNpsDAcxP6WNe8qaWYnpPvs/bOcuIHR
 d6DH4kYvgBKU0OKqtDxlsPbr69aTHNOLDTy2kNxDjN0p3odZbrEUmu1f+09K6FBCIrA1
 p0/JtrOun4Hi5DkFqY+dh5QIsC7imsjp+orSdG8/gfEuHiQKsBoTJ2BENDme+g5/ivNv
 jsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z7uKUK4Cv1XRqPuGFcM56cuKUic8QxQDaP2fXU35ojY=;
 b=n5TbF88IXEm+jsi5zAhAjWYtQZ5bOA44DAffEfFigxt9jMQSOFalV0R1dWil50Fawd
 GcDvEwrBIlNrCO2KjyJiTRf7DkB2E2cV82BjudqqjkZbMTJP6h3PGdj/YpDEVNRJIyQm
 MxN0SBXTUbMiDtApcsxhl6FiiA/Z8vKWJdPYNKAttqc29IAuDjAZHgzcPIfNgNNIY814
 J7WCa1YkZtT/AD7hwmLfGGmGfN7CfW06yufSmfhNRpzs4umppCJEkc/VgwQ4qMju7aUx
 OC7NwEi/dw2nfUeEIsnjDt0gCpboXR+0NTr5gVJk3/rHNLOCzhZUn79DtQS3YkJqKTC9
 kQVA==
X-Gm-Message-State: AOAM532CTu2UgwmDIQxh+/Q77uGcaKp6AeAbAM0QKV8Zau1tXtBx4Cr2
 DTr9wyXYycC9BBT/7UThMvA//A==
X-Google-Smtp-Source: ABdhPJyMM0sYWsp20ksds5zgo/3+4uie7tDYcQlJxMBKZd4pcN01tdVkOvP2CENvL5K+qPbQs4iVuw==
X-Received: by 2002:a17:90a:3807:: with SMTP id
 w7mr20308601pjb.115.1626634243773; 
 Sun, 18 Jul 2021 11:50:43 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w5sm17302142pfq.130.2021.07.18.11.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jul 2021 11:50:43 -0700 (PDT)
Subject: Re: [PATCH v3 10/13] target/riscv: Reduce riscv_tr_breakpoint_check
 pc advance to 2
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
 <20210717221851.2124573-11-richard.henderson@linaro.org>
 <CAFEAcA8C=8kAdsYeKqVwH=qeaWy3yoh+YgKm2Qi+SGcV7XWMtA@mail.gmail.com>
 <4d959bff-8c6b-e01b-a23b-6e17c062f85a@linaro.org>
 <CAFEAcA_EUx8T0bCLb4a-N7QSUqR00WZrtt=nrdMNQMnKRUin1Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38d31fa4-e2ae-8af2-54bd-74d12a7b9470@linaro.org>
Date: Sun, 18 Jul 2021 08:50:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_EUx8T0bCLb4a-N7QSUqR00WZrtt=nrdMNQMnKRUin1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.07,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/21 8:16 AM, Peter Maydell wrote:
> On Sun, 18 Jul 2021 at 19:02, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 7/17/21 1:35 PM, Peter Maydell wrote:
>>> (What goes wrong if we just say "always use a TB size of 1 regardless
>>> of target arch" rather than having the arch return the worst case
>>> minimum insn length?)
>>
>> Hmm, possibly nothing.  Perhaps I should try that and see what happens...
> 
> Some of the comments in these patches suggest it might trigger
> the warning in the disassembler about length mismatches; possibly
> also you might get duff (truncated) disassembly output? I suspect
> that's probably the extent of the problem.

We should be able to work around this by looking at tb->icount.

After patch 13, when breakpoints are always at the beginning of the TB, we'll always have 
tb->icount == 0.

Thinking about this further, with the breakpoint at the head of the TB, there's really no 
point in emitting code for breakpoints at all.  Once we've recognized that there is a 
breakpoint at the current PC, we should just raise the exception.

IIRC only i386 and arm have arch-specific conditional breakpoints.  And, given that all 
cpu state is in sync when looking for bp's, we could probably make do with a callback 
instead of any code generation.

Let me see what I can do...


r~

