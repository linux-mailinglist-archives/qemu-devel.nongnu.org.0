Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5D25455CF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:41:02 +0200 (CEST)
Received: from localhost ([::1]:50930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzOxh-00079e-9w
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOAC-0003PI-TA
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 15:49:52 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOAB-0001pz-Bl
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 15:49:52 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so264754pjb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 12:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vRVKsC8rEIiqRV5BAUvZTtGnuZ4DvOD84WuMPrP+5UQ=;
 b=l7No791IQ4tQwhHMzw48xsX0VlEBh0EQD49k5ojObRUs0zxXPlO/IaDJOnGcquC9HY
 kurPXm7x2muxe7vyE/dj83dPFOBt8hLluULw21CILyzpeimSjRJFUP6QzQa1ieXOj4Cw
 m09CN3l5lUv34dmcrHuhqWTAiBkZogWf2aAwtUL+PkfCGrvSHnvAitEA2rkdiXCaeGlQ
 uWKCEtxyVOhiN5t66LrBpQ/rfl9yPVZvAnNM/eCIf2J3yHXSfdSMqqmKpFbOnrljaD2E
 yoOfrkgXNUbrB9MOj0mcDv+jSwbNGRalyMMoN+V7MR2VSHPrEdOGmJHNMtNTeyjHMGZW
 7ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vRVKsC8rEIiqRV5BAUvZTtGnuZ4DvOD84WuMPrP+5UQ=;
 b=bP/9HJgIw9b0ZERmsRugKHP4KMdrEiz3UfGTb4s+PcgRy2bLVowBTgJZBqzLQlsU0f
 Dy4aPdhgPQlp+5aipl8IKIKoV+bG3F5ZKxSa7bhs/9LhZvn8vTEH2Un03lSm7u758vmf
 Q1X+xtgIlWuFKCzQ2riVkDlwEPhAGPdatv+G3ivttqX2T/BhilDmuA9xwPDLJC10vs2Z
 kAqAdpxCQ01Rhvz4+hZdXvEukZhRvWrROO+58Woml4CjiwVF+jY0I9KZkCDqNIss8bCA
 LAzuTaK4GQOgGd6lK8i3ZbKh+e6IJ5Sha4Ca46kY8W8fuzGQrWxY5/EYm6r6laePYxI0
 4GDA==
X-Gm-Message-State: AOAM530/E0YGqnojShVfBzO8sf+j9MKuB4egBVlplnpivygfmVDQnYAI
 1P+r40twVn0d7yqT11O3sTASRQ==
X-Google-Smtp-Source: ABdhPJxNfOOEJQZVcmD8jOTXZcCSnvvI4UB1LlSf1buffcbcicu/KAbVZdXLBTxojx7kG+FD8KfOIQ==
X-Received: by 2002:a17:90b:1b10:b0:1e8:2966:3232 with SMTP id
 nu16-20020a17090b1b1000b001e829663232mr4915470pjb.103.1654804189678; 
 Thu, 09 Jun 2022 12:49:49 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a17090331c900b0016796cdd802sm6207444ple.19.2022.06.09.12.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 12:49:49 -0700 (PDT)
Message-ID: <a3289600-31db-bc1e-4a64-47565965774e@linaro.org>
Date: Thu, 9 Jun 2022 12:49:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 24/25] target/arm: Rearrange Secure PL1 test in
 arm_debug_target_el
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-25-richard.henderson@linaro.org>
 <CAFEAcA9KR9_YicVwE0Ryp8BWzUe_-xOV78h=v9b5Hhpm+LZpCA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9KR9_YicVwE0Ryp8BWzUe_-xOV78h=v9b5Hhpm+LZpCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/9/22 09:53, Peter Maydell wrote:
> On Tue, 7 Jun 2022 at 04:06, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Not a bug, because arm_is_el2_enabled tests for secure,
>> and SCR_EL3.EEL2 cannot be set for AArch32, however the
>> ordering of the tests looks odd.  Mirror the structure
>> over in exception_target_el().
> 
> I think the code is following the ordering in the
> DebugTarget() and DebugTargetFrom() pseudocode (or else some other
> equivalent function in an older version of the Arm ARM...)

Fair enough.

> I think you're also relying on there being no secure EL2
> if EL3 is AArch32 (otherwise an exception from secure EL0
> might need to be routed to secure EL2, not EL3).

Correct, though I don't imagine SEL2 will ever apply to A32.

I'll drop the patch though.


r~

