Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645112CFB4E
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 13:41:25 +0100 (CET)
Received: from localhost ([::1]:38830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klWsK-0006Ny-7o
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 07:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klWpd-0005Xg-Ux
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:38:34 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:43453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klWpa-0002p6-4L
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:38:33 -0500
Received: by mail-oi1-x230.google.com with SMTP id q25so1489024oij.10
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 04:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z9s7p4/QgNiy7t0zvIQh1kQy+9HSDZM8/hCrec0rN/w=;
 b=hbBlMr+L50cTIFTzj7w/kgCGNIZ90OqZMQDdjuJFZ0iGA1UTJp2RL4S96ZToVgMLhd
 6geJvDUuFBCTsX0+/NmGA6ABlD6/cqWyXxkXRNe9IhBGxasB3Z1ET4bVaItOz2AQcVOX
 Xq9mSaY+ftpcN9hzkptvsc0NWJ5B+LfaaI98fLwLw/9ApaT3Chqf3eykosX8yNc3OqSw
 O209pZRdP1iuY0dAk0LgLKPkjBMsa4LHt3mNt6UMwU60CUHxkvPp22+nrh7v9N3rUCKv
 uDQtDvnIr3BqthX1z61n15ZTOthVNgmu125pyRqZo53JAFixxiCR66xszMYwenAV87jC
 +DXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z9s7p4/QgNiy7t0zvIQh1kQy+9HSDZM8/hCrec0rN/w=;
 b=igz7T3KbtSZ6sHUiSkbc2EsUgVx8SqjpUyA8Dwj4HUuSyDQ7IMDClES0bDPAC5iz0K
 ga++HYz8n1YevfdbFQu8DB2kpqQMMRbVnvI5DdE8RP05jauoU18ghTToYbmPzHJyOy0y
 sQnraPD/US2g+p9BY5M8cZNuZRC+TGDbFk/ABQABxI4I9i4K8CMeh3lBsSPM+rtbVFrB
 DR5mPeaMlktBtQY03Q74Ab1sJnLw78djTTA6bQZF8F9Z5hmHcI7M5lbrqLWHJV39iTi6
 3O2YXUcsbawWCqDp59+tuqsK7QkAP414+7UWr1Xw/fEhhrGd9LjAMWTESMlUKLUC4Ro3
 MhDg==
X-Gm-Message-State: AOAM530P8bXb73Rprm5TMQ05qbgFSnqOx93biuvesJx+6LL/lPzWqsqt
 HJf6qltGprRJd+piiMAZU0lMAw==
X-Google-Smtp-Source: ABdhPJyRYY5W5GNJ25fJ9dkwZtNUaCjrkj/wF7RvwmVKl292GUikjqu1NRJQJGLNXThTNx7yCpw4BQ==
X-Received: by 2002:aca:5fc2:: with SMTP id t185mr6610554oib.113.1607171908714; 
 Sat, 05 Dec 2020 04:38:28 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id k3sm77696oor.19.2020.12.05.04.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 04:38:27 -0800 (PST)
Subject: Re: x86 TCG helpers clobbered registers
To: Stephane Duverger <stephane.duverger@free.fr>, qemu-devel@nongnu.org
References: <20201204153446.GA66154@wise>
 <1d246e29-b364-099f-440c-5b644087b55f@linaro.org>
 <20201205013402.GA69224@wise>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5718f49e-8e17-17ae-45ec-94347f0a009d@linaro.org>
Date: Sat, 5 Dec 2020 06:38:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201205013402.GA69224@wise>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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

On 12/4/20 7:34 PM, Stephane Duverger wrote:
>> You can't just inject a call anywhere you like.  If you add it at
>> the IR level, then the rest of the compiler will see it and work
>> properly.  If you add the call in the middle of another operation,
>> the compiler doesn't get to see it and Bad Things Happen.
> 
> I do understand that, and surprisingly isn't it what is done in the
> qemu slow path ? I mean, the call to the helper is not generated at IR
> level but rather injected through a 'jmp' right in the middle of
> currently generated instructions, plus code added at the end of the
> TB.
> 
> What's the difference between the way it is currently done for the
> slow path and something like:
> 
> static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
> { [...]
>     tcg_out_tlb_load(s, addrlo, addrhi, mem_index, opc,
>                      label_ptr, offsetof(CPUTLBEntry, addr_write));
> 
>     /* TLB Hit.  */
>     tcg_out_qemu_st_filter(s, opc, addrlo, addrhi, datalo, datahi);
>     tcg_out_qemu_st_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, opc);

The difference is that the slow path is aware that there are input registers
that are live, containing data (addrlo, addrhi, datalo, datahi), which must be
stored into the arguments for the slow path call.  Those input registers (and
all other call-clobbered registers) are dead *after* the slow path call.

You are injecting your filter call while those input registers are still live.
 They will be next used by the fast-path store.

That is a very significant difference.

>> No, we generate code for a constant esp, as if by gcc's
>> -mno-push-args option. We have reserved TCG_STATIC_CALL_ARGS_SIZE
>> bytes of stack for the arguments (which is actually larger than
>> necessary for any of the tcg targets).
> 
> As this is done only at the TB prologue, do you mean that the TCG will
> never generate an equivalent to a push *followed* by a memory
> store/load ? Our host esp will never point to a last stacked word,
> issued by the translation of a TCG op ?

TCG will never generate a push for an argument register.  The only push outside
of the prologue is to store the return address for a jmp, a "call" returning to
a different address.


r~

