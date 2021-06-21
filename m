Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CC63AEB9C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:42:42 +0200 (CEST)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvL8L-0008G9-P4
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvL7R-0007XN-Ap
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:41:45 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvL7P-0001ts-KC
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:41:45 -0400
Received: by mail-pj1-x1035.google.com with SMTP id g4so10140272pjk.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=05rFXXjmz2m3fl8GPoMA7TvdYkHpbHajeYGgJGrUFtA=;
 b=RfrZvH0S52nzEcHdDR10uq6/Kii86QgcZ5CLF+gInl2oPIytWZ3E8Wrv4IfIXoPoDa
 NqXh8OlepV8mBj0c0DlocAWQl9EbdjL9AUmw+hKsyppuOp27o43ddTfP2qf4bYh0p5bO
 DSMq+bA7g3cxOQfxhI86zqHZqmClh6zn3KU/4Z3t0+XnQauY1qCgo81vHdtfpHoupysQ
 ezIe5JM++5M0fjIAE1LXO2gXaHBgcNmsAoDqM1TwC77f9yIn7Sqy89yxSEcRfSFQ21SX
 9fIGEDAbH4yuXOP95jyi2imrDn6hQmrxp75Tl2Lbcy/PwEASaKsULRWn0Tm0fuEqZwBS
 v11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=05rFXXjmz2m3fl8GPoMA7TvdYkHpbHajeYGgJGrUFtA=;
 b=fDXtSo3gcC/YVy0i0qMmOjUlj8KXZ3pkCDs+RQLqqJEXbw6BIS7VfHUMGct80v64ma
 GNhsWHOnIjZ37jiDIZPWBSdLZz5uCB0ae8EEuLPPdBjCocaKo0BiWncKqzjkmV6YjYfz
 UAVHbhbU9gH/xm64qIiXRHnq5aFZv6XrpsnJISDefMxTmfJNfL4rvtWU+ek2URnn8Qj/
 UhZSMEqnI6m/GYrRfn9LDt9BdX8VDRZQO2Nosa7OGTM4CWvlU+vO712ADRovQs8WC599
 2xFvlN421CIYWNd4jxjc6fovOnZ+IeHiAtkzMiJNnsQwLlL7mBVXB/b3KxKF0HxvBk8n
 vnXw==
X-Gm-Message-State: AOAM530V+2EXWm8SAObGTgNbM8oM6DH4DWGVk1CxBpTqJC8UV31oUYcw
 17z6po9wFTS90E4I3CTEyeR8HJmqovfPvA==
X-Google-Smtp-Source: ABdhPJzaH+z28jEj6mXndpoWhGZuOT8Y5dJGd1apmHjCMkI08wSVXk4Q6y7rymYbIkCuY7guDJauNw==
X-Received: by 2002:a17:902:904a:b029:101:af84:4f55 with SMTP id
 w10-20020a170902904ab0290101af844f55mr18288979plz.80.1624286501786; 
 Mon, 21 Jun 2021 07:41:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id p10sm3510465pfn.147.2021.06.21.07.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 07:41:41 -0700 (PDT)
Subject: Re: [PATCH 07/28] tcg/ppc: Split out tcg_out_bswap16
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-8-richard.henderson@linaro.org>
 <CAFEAcA9zwAvHApV0LTfKwXO6qtV=FgbDAVT-AzVEP6tgYW_SDg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba3c7062-7a4a-646c-1cc9-22a529eb2291@linaro.org>
Date: Mon, 21 Jun 2021 07:41:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9zwAvHApV0LTfKwXO6qtV=FgbDAVT-AzVEP6tgYW_SDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 7:29 AM, Peter Maydell wrote:
>> +static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
>> +{
>> +    TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
>> +
>> +                                                   /* src = abcd */
>> +    tcg_out_rlw(s, RLWINM, tmp, src, 24, 24, 31);  /* tmp = 000c */
>> +    tcg_out_rlw(s, RLWIMI, tmp, src, 8, 16, 23);   /* tmp = 00dc */
>> +    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
>> +}
> 
> TCG_REG_R0 is implicitly available as a temp because it's not
> listed in tcg_target_reg_alloc_order[], right?

Slightly better than that:

     tcg_regset_set_reg(s->reserved_regs, TCG_REG_R0); /* tcg temp */


> (There's a comment
> in the definition of that array that says V0 and V1 are reserved
> as temporaries, but not a comment about R0.)

Yeah, tcg/ppc/ is due for a bit of cleanup.

> Would be nice to keep these comments about what operations we think
> the insns are doing, given that RLWINM and RLWIMI are pretty confusing.

Hmm, I guess.  I found them intrusive.


r~

