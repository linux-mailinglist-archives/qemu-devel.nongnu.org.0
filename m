Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C325F23A8
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 16:41:56 +0200 (CEST)
Received: from localhost ([::1]:41768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of0AE-0008LY-Nh
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 10:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of09A-0006vh-Lk
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 10:40:48 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of099-0008Gd-0M
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 10:40:48 -0400
Received: by mail-pj1-x1030.google.com with SMTP id l12so7770550pjh.2
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 07:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=jjBwZSTb+h339RRe2L2hbqTuxufAHAKum+3LEfxQn1k=;
 b=uuSpJCs3RMsko/DOO6wyzQMApOYROMUqdfesEaOdyjY62RFHAjVxcWAAIEQzgO7qR2
 kNIfllQa0tkbHF6WR0e/qq/CSzslXl+lZ9gChvu92sBDqBQq5eHNYRcUtinTFVfB0aW0
 kAN4R40mhA972e+mAh2S5Cpw5n5ThQcQpRs1vPNcuG/73CI8e0C/id/ui8kTXa0tEe10
 wyVywXrEFBcgSdOuwDixiqZvLJKBpctryLay6TpQ0fD635B/tPEw2SKmTn0WdZ6eBuHR
 /EtC6bT/DHWCS5EcWZQEbLv3hOBKG9KEitNA96kbL8JZxIS3jaaSqzuAX0sBM0C0txdL
 D4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=jjBwZSTb+h339RRe2L2hbqTuxufAHAKum+3LEfxQn1k=;
 b=rowyZFlRqAmDyFHtnP+Lem35Dna4OoWSD5oNEQ2t55kd/LUtYAJ3lH91Kn6uKjRt52
 Sj6F7qlWsgL/Na7i3HKgskttze7o+IgYebCvu3H1mpHThCnPcsygLFwEkOguJ9PCI2sz
 Ep54fMSE3yTcZClfkQO+Amm2Sbuxsa+DqfMJyZJ4/egvwUhY7FDTJEYvxlWZJfd1i04g
 03UZjPAzGcN/6C0zYjsgQpX8ubSv/cx8SSgpxxptSWYzZsv+Kgf2YAokxjey8cGSjs0g
 CN7Dn2JiwaBdnTmIPp+ix6ACxkce489r32ElAKRn8FsrlFrDwcNeRLsRQ43D0V2aq/7+
 SwUQ==
X-Gm-Message-State: ACrzQf3sIjDQtCi6VyGTJwfYXd3kQx7uoB4bPTJ3coEDsFVlIuAoC1c+
 YuFG4KUXamdZRwmEo/LwClkLyg==
X-Google-Smtp-Source: AMsMyM55QUkuwfd0AhYcfpZuaSxHVAT478KYPJOyb8oQyU5kA4uMdM2sc7mpJ+g0c10rhmwG6zSa9w==
X-Received: by 2002:a17:90a:8c8e:b0:202:883b:2644 with SMTP id
 b14-20020a17090a8c8e00b00202883b2644mr7806298pjo.89.1664721645439; 
 Sun, 02 Oct 2022 07:40:45 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8002:3cad:d8f7:9399:9b96:97af?
 ([2605:ef80:8002:3cad:d8f7:9399:9b96:97af])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a170902c40f00b0017eb2d62bbesm1291516plk.99.2022.10.02.07.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Oct 2022 07:40:43 -0700 (PDT)
Message-ID: <e1538b70-8e32-a6b7-4132-77a7ea6a60fa@linaro.org>
Date: Sun, 2 Oct 2022 07:40:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: access guest address from within instruction
Content-Language: en-US
To: BitFriends <commandspider12@gmail.com>, qemu-devel@nongnu.org
References: <CABVhSWP7XjNvCXUvawXLcOkP4vXQ8wbMObKbxc+jN6gv0wzawQ@mail.gmail.com>
 <3ca717d7-fbc9-b2f9-71cc-01ef459da257@linaro.org>
 <CABVhSWNkCn-V=ZzUTEi7+hO_a4KJgfpv7N_MW_t+jKRtmTh08A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABVhSWNkCn-V=ZzUTEi7+hO_a4KJgfpv7N_MW_t+jKRtmTh08A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.086,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/2/22 02:20, BitFriends wrote:
> I now came up with this code:
> 
> TCGv_i64 res = 0;
> TCGv_i64 addr = (TCGv_i64)(env->regs[R_EDI]);
> 
> tcg_gen_qemu_ld_i64(res, addr, 0, MO_LEUQ);
> 
> env->regs[R_EAX] = (target_ulong)res;
> 
> However this crashes afterwards in test_bit. Maybe this is caused by an invalid access? 
> Anything wrong about the code? This still gives some warnings, like TCGv_i32 expected (and 
> when you use TCGv_i32, it says TCGv_i64 expected) plus some casting warnings.

It is as if you did not read the second paragraph of my response at all.
tcg_gen_qemu_ld_i64 is for generating code, not performing a direct action.
Can you see how your code differs from *all* of the code around it?

r~

> 
> Am Sa., 1. Okt. 2022 um 22:23 Uhr schrieb Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>>:
> 
>     On 10/1/22 13:10, BitFriends wrote:
>      > Hello,
>      >
>      > I am trying to create a custom instruction that accesses guest memory specified by an
>      > address in a register. I specifically want to read from that address. So I tried to do
>      > that using "tcg_gen_qemu_ld_i64(&res, env->regs[R_EDI], 0, MO_LEUQ);", but that
>     doesn't
>      > save any result in res.
> 
>     This statement should have given you compilation errors, so I don't know what you mean by
>     "doesn't save any result".  There's clearly a disconnect between what you describe and
>     what you actually attempted.
> 
>     Anyway, by the name you can see that function "gen"erates a "tcg" operation, which is
>     then
>     later compiled by the jit, the output of which is later executed to produce a result.
>     Which is, in general, what you want for implementing a custom instruction.
> 
> 
>     r~
> 


