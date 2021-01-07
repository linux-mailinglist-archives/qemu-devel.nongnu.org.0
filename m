Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4522ED748
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:11:45 +0100 (CET)
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxahE-0003eJ-9B
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxafv-0003BL-II
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:10:25 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxafr-0003gw-Ep
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:10:23 -0500
Received: by mail-pf1-x429.google.com with SMTP id t22so4451852pfl.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 11:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Yns8ENy+GeJhJJhws9okVlv2aZN0KsOHr7/N3SZqaU=;
 b=ffFi5kO1FxZ1dr1QcWFo9ZYNcfJqz4PwrKCb71c9DvxVBPGkzfsF9EEkXiUZ28IZGr
 jSh5cy9CDm/FR21SPcAS6q9R0ELuzvyXXi+pS9oilfr2Qvd9bv0XRUHlDKDhMscCrit6
 HT/KGSJsqwQhaYeS3XesthvYmSaCxpwn3Jz/v5vr0mFq7WVl90sMF3xjrXFoG/h5j5E+
 N88LpYUziGlejEJOuHSByjVU8LfRJ1sv1QEw0e0bOawTn8hmyd9icuwjXeYHJc+fvUAc
 yJGO8JLGkLBmHcgITdL5weZodKX5jpfT4fHQNiAcH7IAInnpw+IxqREqv64ZJicNyQl6
 QErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Yns8ENy+GeJhJJhws9okVlv2aZN0KsOHr7/N3SZqaU=;
 b=l06J6RoLy4hilxy4LBQa8nzO3Ur+AjUQkbMcDedqYgkdzgyTQYJHvPjj25T7oscGOB
 t7qtCK9HDhTevCU1aknrXrv8vfJ4g+FobtTJMee2C6u6Idl8cjwIAg48t9bU/DEpO0K0
 URC2WC8BqsX0D3fyu2tAN4OQ2eXaTnMBnOEbnVA8sI9JcJQLWqD0RkZEk9NLRBEVUr/G
 3kthmSt03Qe7neKETpqt5Z48lmRIG05iJoINTAYNeeYGgxxlbRzhxRZTCIyFWf0mOTi4
 dydYtCLjWZnH4JETbUSz9nnPyK3Nhy/ieFghugsoJ1vVKovhQLRZoFkZ44lEguaKC9Lz
 JNCw==
X-Gm-Message-State: AOAM533NBbNH9TzknmkAO7yH/sEwvP4ZJ76ZuTVaF+MjPz2vIAyIVcue
 1uIwzYlInS8vF9y69F+V8P7ipw==
X-Google-Smtp-Source: ABdhPJy7L1/daZei9DJcdZmlh+3QF+zNMB+O1we7cu8LOqbN0/MECvxoMbCiaN8PDHfFCb/AQJLQ+w==
X-Received: by 2002:aa7:82c1:0:b029:19e:3672:50ca with SMTP id
 f1-20020aa782c10000b029019e367250camr74549pfn.12.1610046617095; 
 Thu, 07 Jan 2021 11:10:17 -0800 (PST)
Received: from [10.25.18.38] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id x6sm6519730pfq.57.2021.01.07.11.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 11:10:16 -0800 (PST)
Subject: Re: [PATCH] target/arm: Fix MTE0_ACTIVE
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201221204426.88514-1-richard.henderson@linaro.org>
 <CAFEAcA8FrSwpG6GkhxnPQa0h=Lq4Yjv7YWHFDu3DejKOjdJR3A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f26d4c02-10d6-7e15-8339-3f9fa45d573c@linaro.org>
Date: Thu, 7 Jan 2021 09:10:13 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8FrSwpG6GkhxnPQa0h=Lq4Yjv7YWHFDu3DejKOjdJR3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.267,
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
Cc: Peter Collingbourne <pcc@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 7:54 AM, Peter Maydell wrote:
>> -            && (sctlr & SCTLR_TCF0)
>> +            && (sctlr & SCTLR_TCF)
>>              && allocation_tag_access_enabled(env, 0, sctlr)) {
>>              flags = FIELD_DP32(flags, TBFLAG_A64, MTE0_ACTIVE, 1);
>>          }
> 
> 
> I don't understand this change, could you explain a bit more?
> In commit 50244cc76abcac we change to looking at the TCF
> field corresponding to the actual current EL instead of the
> EL for the memory-access.

Correct.

> But if we're doing that then why
> should we be looking at exclusively SCTLR_TCF0 in this
> for-unpriv-access code rather than doing the same thing we do
> for normal accesses and checking
>   (sctlr & (el == 0 ? SCTLR_TCF0 : SCTLR_TCF))

Because this is for the UNPRIV instructions which are UNDEF at el == 0.


r~

