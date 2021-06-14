Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CCD3A6EB6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:17:33 +0200 (CEST)
Received: from localhost ([::1]:42842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lss5U-0001C4-HR
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lss3V-0007R9-Au
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:15:29 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lss3T-0002al-4e
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:15:28 -0400
Received: by mail-pg1-x533.google.com with SMTP id m2so2736272pgk.7
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 12:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=IDEQ3CQ7DSnATLxeRFmOx8WuykiK69J0la5swz5Ihf0=;
 b=SLE+OMkUjT1X4A9f6WYv87h2uRyt2TpO9yMNkk/CM79+QQRmbsmLT2J+17Sg8uGg40
 TL/Wrr/8OqAKroWWA8I76quQv5/pi7g8wcO3BqZ9KDfZrhCFd3dp7qeM4Q6mTHd6vv/0
 tagVHW6pcrbdC5lfvOFvI8JpNzL4tn5WpJtuIRHLKGBar95OfeJNUWCmgOdDMzNVX5C5
 vVcOQOLfoTBsuL8i8dWSxPvK99Xy4te5wnl6tLkXPHVzyEfE0TNMUypQTBExcDVI21GB
 5K6wSIb91eG+fl59K85D3ltx0hPLMf9RmbfRdQNRZuuoiS5IfDbwHVwDmZgNNus93RNw
 if6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IDEQ3CQ7DSnATLxeRFmOx8WuykiK69J0la5swz5Ihf0=;
 b=oCzlXF3GDhw8nV5n815XWNTDCJUZExxP6oximVPcGXpzN2apOnffdGSrdGNhJx0P0J
 U+/fjuKPLylVRg35RD8AqUcTXSLjgvVXedK3ksBwwI/ImlktWoh65eRyYdwMiJkQRb4S
 gXm25tnHS5FDih/IhpgdTHay83i9OjcVPQ5XaPBiM/iJAVQGhMx/wDRlImWEf4MtqFv9
 HSc/EeI15bgYWUh3eAXeGaMaegqVXb5nAe9JkUuzyNSZePyjPqD3USsg/BIyHWA+a73H
 m8z2egcwtsJpKMA4mjlZm1mL45xnFa4VHVS2WxnDe1DiCBo/w1gjeXnEN2XP4/4l5lrw
 Sg3g==
X-Gm-Message-State: AOAM530oJYwo3Wq6oL00GAU39dkwKsvMdaTodagq2ktYksWQHNYIuip/
 nohkGBdGf7hBH4tmSEbrabPjOzASBFJcaA==
X-Google-Smtp-Source: ABdhPJyhfNImAV1HxzbKJTgQxvOEki9Od2V2XU6HDwwpqSFAI1V2Apuqd18onswdXE2sIuMSsGg0yg==
X-Received: by 2002:a63:4c09:: with SMTP id z9mr8394596pga.283.1623698125392; 
 Mon, 14 Jun 2021 12:15:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 z9sm13399399pfc.101.2021.06.14.12.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 12:15:25 -0700 (PDT)
Subject: Re: [PATCH v2 04/57] target/arm: Add handling for PSR.ECI/ICI
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ea4f1b0c-4e7a-c900-3bdf-d24bda0b5b29@linaro.org>
Date: Mon, 14 Jun 2021 12:15:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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

On 6/14/21 8:09 AM, Peter Maydell wrote:
> On A-profile, PSR bits [15:10][26:25] are always the IT state bits.
> On M-profile, some of the reserved encodings of the IT state are used
> to instead indicate partial progress through instructions that were
> interrupted partway through by an exception and can be resumed.
> 
> These resumable instructions fall into two categories:
> 
> (1) load/store multiple instructions, where these bits are called
> "ICI" and specify the register in the ldm/stm list where execution
> should resume.  (Specifically: LDM, STM, VLDM, VSTM, VLLDM, VLSTM,
> CLRM, VSCCLRM.)
> 
> (2) MVE instructions subject to beatwise execution, where these bits
> are called "ECI" and specify which beats in this and possibly also
> the following MVE insn have been executed.
> 
> There are also a few insns (LE, LETP, and BKPT) which do not use the
> ICI/ECI bits but must leave them alone.
> 
> Otherwise, we should raise an INVSTATE UsageFault for any attempt to
> execute an insn with non-zero ICI/ECI bits.
> 
> So far we have been able to ignore ECI/ICI, because the architecture
> allows the IMPDEF choice of "always restart load/store multiple from
> the beginning regardless of ICI state", so the only thing we have
> been missing is that we don't raise the INVSTATE fault for bad guest
> code.  However, MVE requires that we honour ECI bits and do not
> rexecute beats of an insn that have already been executed.
> 
> Add the support in the decoder for handling ECI/ICI:
>   * identify the ECI/ICI case in the CONDEXEC TB flags
>   * when a load/store multiple insn succeeds, it updates the ECI/ICI
>     state (both in DisasContext and in the CPU state), and sets a flag
>     to say that the ECI/ICI state was handled
>   * if we find that the insn we just decoded did not handle the
>     ECI/ICI state, we delete all the code that we just generated for
>     it and instead emit the code to raise the INVFAULT.  This allows
>     us to avoid having to update every non-MVE non-LDM/STM insn to
>     make it check for "is ECI/ICI set?".
> 
> We continue with our existing IMPDEF choice of not caring about the
> ICI state for the load/store multiples and simply restarting them
> from the beginning.  Because we don't allow interrupts in the middle
> of an insn, the only way we would see this state is if the guest set
> ICI manually on return from an exception handler, so it's a corner
> case which doesn't merit optimisation.
> 
> ICI update for LDM/STM is simple -- it always zeroes the state.  ECI
> update for MVE beatwise insns will be a little more complex, since
> the ECI state may include information for the following insn.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: minor changes as suggested by rth

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

