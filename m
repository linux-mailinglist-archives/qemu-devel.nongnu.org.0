Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1602FC4BD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 00:31:12 +0100 (CET)
Received: from localhost ([::1]:52656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l20St-0001d9-Ql
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 18:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l20RB-0000Tq-RJ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:29:25 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l20R9-0005ia-GL
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:29:25 -0500
Received: by mail-pj1-x1032.google.com with SMTP id l23so947553pjg.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 15:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AQHcDvRxCbW33yGqQj5VpMGpFg+y62nbk+/3m6vV/Qc=;
 b=UokSyP2/w+K0qmnwK0QbDmvnY0ka+7ccUCUS+GnWo7JXUn8Av1/dP5RoXCclF3Lmrt
 43iuftZjCKJpMNlDQcbznqT2aoyYOkxzcWuCQRAAYd6Q23oIp2Hm41WQYD1BmaDoF9DH
 BJwD0gdJZIxq0o2ExgcueTZgqbgYSaLf4noPLiU7gN5yFrh3GH28LtZrLpfEsrceju+m
 jgK116S206dcvzjwb1V8iWQ/o+4VBDwtCFpxgGISykBTTFtxbuQcUpp29DBAeZ0mdDxi
 cVz9i7i5DQcLRrYSnY47JgrBOERpHmGkWcEHqCtcGuggSMcGPYdrH06I9urKLUhxY5cf
 hq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AQHcDvRxCbW33yGqQj5VpMGpFg+y62nbk+/3m6vV/Qc=;
 b=oC+ucYvxEhoZCeKpg/n8R/SaZsTuu5w1uKpB0a2b4S+FPPvrafG7yAD1mvpvThXy+6
 X4H38Xh51FjT96OBycC0PYcX+RPv64KdH9V96POWslMsaIZbYC8ldipZzo/xbUMZRa/Q
 JX9QjkN79ti/oPZrS9KEaOk/wy2Jn+1PfrESjTTwk9f+xmZzuqx4cBiEb9QmoFmrUDi5
 1GfJT0ZTucLFuM88pUt3wduq4c/5Zquts9WU1TTeHS+jcTB1oNtbAO4kRlSSgbgcoTwy
 v6qEHXNfyhlUIwdYg5o9Sz66k+dZEXsn9lzK0rR1Rp7c/KXj1Z2qs7lq+TeS2D+NwcL4
 6lKw==
X-Gm-Message-State: AOAM532QWmZfeYiDzubc6NfQeM+YRdbQooxUoStp1e5kSN7/+F+h+1C0
 wSLmqleWPjLqGKs+02QoxHz8sbSuXWB3Yw==
X-Google-Smtp-Source: ABdhPJzpVLpGzya1c31wP6gEgjENkwOb6xi5PH3y4M6jA2X+pvvsVgr6qm8QejPRW/8jE8eTAvw2Yw==
X-Received: by 2002:a17:90b:50e:: with SMTP id
 r14mr2242897pjz.90.1611098961825; 
 Tue, 19 Jan 2021 15:29:21 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id a18sm182610pfg.107.2021.01.19.15.29.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 15:29:21 -0800 (PST)
Subject: Re: [PATCH v2 11/22] tcg/sparc: Split out target constraints to
 tcg-target-con-str.h
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-12-richard.henderson@linaro.org>
 <CAFEAcA_kpxVK+7eZC+d=63m1Na9O+vwGWhaMc11EZBf2UD2XWw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce54f450-5081-0205-64cb-6f4f64dcdf38@linaro.org>
Date: Tue, 19 Jan 2021 13:29:18 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_kpxVK+7eZC+d=63m1Na9O+vwGWhaMc11EZBf2UD2XWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 1/19/21 4:58 AM, Peter Maydell wrote:
> On Fri, 15 Jan 2021 at 21:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  tcg/sparc/tcg-target-con-str.h | 22 +++++++++++++++++
>>  tcg/sparc/tcg-target.h         |  5 +---
>>  tcg/sparc/tcg-target.c.inc     | 45 +++++-----------------------------
>>  3 files changed, 29 insertions(+), 43 deletions(-)
>>  create mode 100644 tcg/sparc/tcg-target-con-str.h
>>
>> diff --git a/tcg/sparc/tcg-target-con-str.h b/tcg/sparc/tcg-target-con-str.h
>> new file mode 100644
>> index 0000000000..6dc5b95f33
>> --- /dev/null
>> +++ b/tcg/sparc/tcg-target-con-str.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Define Sparc target-specific operand constraints.
>> + * Copyright (c) 2021 Linaro
>> + */
>> +
>> +/*
>> + * Define constraint letters for register sets:
>> + * REGS(letter, register_mask)
>> + */
>> +REGS('r', 0xffffffff)
>> +REGS('R', ALL_64)
>> +REGS('s', 0xffffffff & ~RESERVE_QLDST)
>> +REGS('S', ALL_64 & ~RESERVE_QLDST)
> 
> As with s390, I think an ALL_GENERAL_REGS constant would help here.
> 
> 
>> +
>> +/*
>> + * Define constraint letters for constants:
>> + * CONST(letter, TCG_CT_CONST_* bit set)
>> + */
>> +CONST('I', TCG_CT_CONST_S11)
>> +CONST('J', TCG_CT_CONST_S13)
>> +CONST('Z', TCG_CT_CONST_ZERO)
> 
> 
>> -static const char *target_parse_constraint(TCGArgConstraint *ct,
>> -                                           const char *ct_str, TCGType type)
>> -{
>> -    switch (*ct_str++) {
>> -    case 'r':
>> -        ct->regs = 0xffffffff;
>> -        break;
>> -    case 'R':
>> -        ct->regs = ALL_64;
>> -        break;
>> -    case 'A': /* qemu_ld/st address constraint */
>> -        ct->regs = TARGET_LONG_BITS == 64 ? ALL_64 : 0xffffffff;
>> -    reserve_helpers:
>> -        tcg_regset_reset_reg(ct->regs, TCG_REG_O0);
>> -        tcg_regset_reset_reg(ct->regs, TCG_REG_O1);
>> -        tcg_regset_reset_reg(ct->regs, TCG_REG_O2);
>> -        break;
> 
> The "A" constraint seems to have vanished in the conversion...

Argh.  Something that would have been found eventually, but I really want to
turn into a build-time error.


r~

