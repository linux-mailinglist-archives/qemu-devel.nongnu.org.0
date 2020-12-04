Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC202CF5BC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:40:06 +0100 (CET)
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHs5-00071s-1G
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:40:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klGsG-0003h3-DE
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 14:36:12 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:42053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klGs7-00010x-Oe
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 14:36:11 -0500
Received: by mail-ot1-x32f.google.com with SMTP id 11so6315435oty.9
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 11:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T2AXV+c3DJvdHbkmMgpLzzk3Tx44/QJnuXZanx9F/B0=;
 b=cE6xx7yJOMS6WePm8OZeU41rFkqPNEugDxdA6gNDgCG++BvK9lz+Tx2QBW1I/Mw7Il
 ShQxvwLJCGBC5MZi8nhyJHBPz04IStZgoJ6Yt6ylcZXBRkVCzaCMGhovGMcc/WB66qNc
 IDnm5ir2H0pzInfWOkH2HLAMkxNoX8Vv75WqsgVb+o+7Yqj46+GWXD4EVRMpEfZt5+sC
 Upd1t450Uaer4xXDHF+3QV9WKR+W74HIwGVytgDqb3CSa427KXjwIQPuIcsUfBk1VP9Y
 dDRbltLhRZ2WyZ4jPmL+AXYXm9dHl7eLvHiFNxpKWVFyvStrRQXpeN4TD2IjCEZ2jqZs
 sZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T2AXV+c3DJvdHbkmMgpLzzk3Tx44/QJnuXZanx9F/B0=;
 b=o7uRYoFN85a378IU7U7RAmcyUaOki7kk3FRLeFKtYVeSqq1vx8qQz11IrRwSr9xVdW
 C2/7bh6lI0ueW55jAAzYlvdvJQ75rSOK83O8bVnM7Mb1h/Zhb1m0vo95vFcgHYoK9Ass
 tiV92OIkJ7kkUtfZWTFKvtAFT4C8hteR9VZY3MEU4SVm5EU/pM4Hdpijtc4o1B6hvd1x
 fSiM2UJPYSUsFmftiXV4Ba/Zuh/xVJ+AfCHwRfT9sZb8ZNf3gtI8L2lWoP9QUjmcBgUl
 Sooc0hf/LkwlqjyqnryB8gwQCLWI0NkyqzCdsQZturgP9mslYS1ecTzab9s0U8FYA0JH
 S8Kw==
X-Gm-Message-State: AOAM530Kw5GNUZ8LIRObf/RUh488BBrkHEZ5daPNieS4Jxu0ivYyUuJB
 H3X2SvYkftj+j3VMgrkdVqELww==
X-Google-Smtp-Source: ABdhPJxLF3RO7TZUvXdhrSVhbxArjEplXzie9mDB4GoQsaLJ4BBMzqOLn2AHWPiD5lVU6tJh4dXRXA==
X-Received: by 2002:a05:6830:1518:: with SMTP id
 k24mr5054251otp.366.1607110558890; 
 Fri, 04 Dec 2020 11:35:58 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id h3sm825738otq.33.2020.12.04.11.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 11:35:58 -0800 (PST)
Subject: Re: x86 TCG helpers clobbered registers
To: Stephane Duverger <stephane.duverger@free.fr>, qemu-devel@nongnu.org
References: <20201204153446.GA66154@wise>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d246e29-b364-099f-440c-5b644087b55f@linaro.org>
Date: Fri, 4 Dec 2020 13:35:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201204153446.GA66154@wise>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 9:36 AM, Stephane Duverger wrote:
> Hello,
> 
> While looking at tcg/i386/tcg-target.c.inc:tcg_out_qemu_st(), I
> discovered that the TCG generates a call to a store helper at the end
> of the TB which is executed on TLB miss and get back to the remaining
> translated ops. I tried to mimick this behavior around the fast path
> (right between tcg_out_tlb_load() and tcg_out_qemu_st_direct()) to
> filter on memory store accesses.

There's your bug -- don't do that.

> I know there is now TCG plugins for that purpose at TCG IR level,
> which every tcg-target might benefit. FWIW, my design choice was more
> led by the fact that I always work on an x86 host and plugins did not
> exist by the time. Anyway, the point is more related to generating a
> call to a helper at the TCG IR level (classic scenario), or later
> during tcg-target code generation (slow path for instance).

You can't just inject a call anywhere you like.  If you add it at the IR level,
then the rest of the compiler will see it and work properly.  If you add the
call in the middle of another operation, the compiler doesn't get to see it and
Bad Things Happen.

> The TCG when calling a helper knows that some registers will be call
> clobbered and as such must free them. This is what I observed in
> tcg_reg_alloc_call():
> 
> /* clobber call registers */
> for (i = 0; i < TCG_TARGET_NB_REGS; i++) {
>     if (tcg_regset_test_reg(tcg_target_call_clobber_regs, i)) {
>         tcg_reg_free(s, i, allocated_regs);
>     }
> }
> 
> But in our case (ie. INDEX_op_qemu_st_i32), the TCG code path comes
> from:
> 
> tcg_reg_alloc_op()
>   tcg_out_op()
>     tcg_out_qemu_st()
> 
> Then tcg_out_tlb_load() will inject a 'jmp' to the slow path, whose
> generated code does not seem to take care of every call clobbered
> registers, if we look at tcg_out_qemu_st_slow_path().

You missed

>         if (def->flags & TCG_OPF_CALL_CLOBBER) {
>             /* XXX: permit generic clobber register list ? */ 
>             for (i = 0; i < TCG_TARGET_NB_REGS; i++) {
>                 if (tcg_regset_test_reg(tcg_target_call_clobber_regs, i)) {
>                     tcg_reg_free(s, i, i_allocated_regs);
>                 }
>             }
>         }

which handles this in tcg_reg_alloc_op.


> First for an i386 (32bits) tcg-target, as expected, the helper
> arguments are injected into the stack. I noticed that 'esp' is not
> shifted down before stacking up the args, which might corrupt last
> stacked words.

No, we generate code for a constant esp, as if by gcc's -mno-push-args option.
 We have reserved TCG_STATIC_CALL_ARGS_SIZE bytes of stack for the arguments
(which is actually larger than necessary for any of the tcg targets).


r~

