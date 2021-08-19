Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B753F1E81
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:58:55 +0200 (CEST)
Received: from localhost ([::1]:34590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGlNW-0006c5-Eb
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGlMN-0005ht-Ah
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:57:43 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:44668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGlML-0004yb-QF
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:57:42 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 hv22-20020a17090ae416b0290178c579e424so5205686pjb.3
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WGRzv8w5a/gL+meYkzee2RyQixWl65LF4xY/7I0brUc=;
 b=uVWltxLDhJpX/GNlJTR3Qcl4iEttMnuFMt6nH3zLW4z8MTbUdCTbtwdYPK5Ea11AWc
 iJg73sKZHzqqIBQw+owvfX1RnMoJLY94a16s/MWy8o923OTxisbaH8D9CBRitihIYOCc
 MLZr0T4eJRfjQVaNtYVYkCQG06B2M+x6sYp8jkkxd4wbFf1k0YBEBJwY/AERUON3pQC3
 jHIhRzhwNlS5Wtv7BQamzjcWO9sFjuT2apuCKaZqtuk56AyROn6N42BTnRMxXNfURp61
 nYD5TNvAeiWPYhXAeK9+1qNMj43UpWIgEo4lxBPkoGnQcz3Hh3xLyFK4seHCF7HUEfjQ
 3+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WGRzv8w5a/gL+meYkzee2RyQixWl65LF4xY/7I0brUc=;
 b=TAemvQtUDYg33YlViyZ6fTgMtQeV8YH1FwO6sLywhdVmU5Zzda+OvcoE7QhLTT+IeO
 3nJU/1cr2GaRc9J6OrQAXV9VW8BrAnsqV6ZHXSGRiw4r+hItoir0whFoFamwbkREeYqI
 00Hze9EFXxADZOo5hmwUszRSslt7UAQsWoNfd1d/KQFn2xFTAxo4ewQ69vDGxQA9aGcN
 txLpQ8rMkicMMcOTBZJcJ130SyTP9qoHhKacU5ozM3k84xlFX7dkZKQ54LwuYxTvCr6P
 e+1MGoZMtAhc19mfSDMVFnA/xFel8Eq0ni67/RZbbA4NLgKfs2IpgHgH84MX9hfcyoqd
 EMTA==
X-Gm-Message-State: AOAM531YKNz9J/UKPKhgpupC/ZDo01egDts8EsbGbo3yYfZx9Wi4vXXv
 fUzlvfnLbK+mGQLeBFjNp3oHhA==
X-Google-Smtp-Source: ABdhPJxMIgVCjFcBwA0Etco6aa5U52O4J4KEexR2iSeirEvv59qWO5HMfQuYClbrORAS1tSAsTfFog==
X-Received: by 2002:a17:902:9a47:b0:12f:6a05:caaf with SMTP id
 x7-20020a1709029a4700b0012f6a05caafmr5741521plv.55.1629392260077; 
 Thu, 19 Aug 2021 09:57:40 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id t15sm4785164pgi.80.2021.08.19.09.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 09:57:39 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/arm: Take an exception if PC is misaligned
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-4-richard.henderson@linaro.org>
 <CAFEAcA-v6z9UTbmdHqMugbtqv1n92SJ7EFGM8Gnk+_90FMyoBg@mail.gmail.com>
 <bb739396-f8d1-a5a8-ab1a-61892d9c84e6@linaro.org>
Message-ID: <b6754a17-7b6a-201d-6c33-7759ea8ea270@linaro.org>
Date: Thu, 19 Aug 2021 06:57:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bb739396-f8d1-a5a8-ab1a-61892d9c84e6@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.591,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 6:50 AM, Richard Henderson wrote:
> On 8/19/21 3:40 AM, Peter Maydell wrote:
>>>       uint32_t insn;
>>>       bool is_16bit;
>>>
>>> -    if (arm_pre_translate_insn(dc)) {
>>> +    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
>>
>>
>> Is it not possible to get a misaligned PC in the Thumb case ?
> 
> No.  The thumb bit is always removed, leaving all pc aligned mod 2.
> Both BXWritePC and BranchWritePC do this, as do we in gen_bx and store_reg.

Do you think it's worth an assert here to make sure we never miss a case?  I did an audit 
of the exception code and it looks like we mask everything correctly there, but...


r~


