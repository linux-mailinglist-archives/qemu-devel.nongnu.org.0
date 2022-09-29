Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C388E5EECCE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 06:34:50 +0200 (CEST)
Received: from localhost ([::1]:37576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odlG5-0007QB-Cs
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 00:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odlBl-0005da-NI
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 00:30:21 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:46667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odlBj-0003mi-Vm
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 00:30:21 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 8-20020a17090a0b8800b00205d8564b11so227903pjr.5
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 21:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=teCrwAi0598F/ilUCIdS1ud+xCVdgBRvQ/gZZpIuHdc=;
 b=umEzM8VMQwDhBhmY7/Rp3/LE1/4cEeYquLDIlerWGuWnXSohzoDdZ3LhOBiBGEiWUb
 3zTDRusUz9M+TqucX4JA3y+B0/yQoMijMuSOaG4fx1FUY4a4DXcQPB13eal9CewoKKtT
 P4H3ZlOOtIYNvePlJ5BdzgaD/ZdEuruLJ7DUQbAL5bBQji382xC6HFQfqagX3CXSfHrv
 8DzVvqnAbpOiAklzi2XLK6Zmf5WtFtAjN73bP4VXJ9C7H5q7wZi1txZLZbEUqn73jY+S
 x/yyjIhMa5PtglY0hUhltOrXv+ZDOZx0yYmnf6X/Bbo7D/KgwIQ8UBHdUsRqAAqzU1lj
 OUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=teCrwAi0598F/ilUCIdS1ud+xCVdgBRvQ/gZZpIuHdc=;
 b=fZPxCqRHGfR2sruLXodALGu3afxE4GBvUvcvn0qQzJ9rL8gmbbqMcEyg8kwEjSruAl
 TO09Ta1MFFulDOKd6k9QwkLmEHmgRDlqIlJJY6F/YM+tPcwSgVpd1nbcy2BqAeAKI+5K
 QjNQ7qqKA6H3JwT3tMwnNpaEFmpKr/Z3yaOE40B/G61fe+Mf2g52Ded7+mXNh8qUSoBv
 R/PftXuszPmLIDnrP56EzeiridRktfCGAmxAI7kaBnENl6ZEvW1r5NW5U+PTZ5/Cll60
 fODb46+ii7AmzFLlBkvBHJg1L0+vrttFHLJ5PwQyH3hnq6DC3w4AD0WhNglJEjjWPHrU
 ZZkA==
X-Gm-Message-State: ACrzQf17V7ssaOrij+YPZJVwSlS/jzsg6Q6Kk0ryTMEUhiyGE6nm8AeT
 HqYl0Tons/DHWJlTxj6Bgbp22Q==
X-Google-Smtp-Source: AMsMyM6xlQKSMG+0sHQ/8nMZm1tQrw2VraPlfbQRe3+bg+MHE4lDWjSFte+TIBtXy2ilT0JjkPxNKQ==
X-Received: by 2002:a17:902:6b8b:b0:178:7cf5:ad62 with SMTP id
 p11-20020a1709026b8b00b001787cf5ad62mr1527916plk.13.1664425818038; 
 Wed, 28 Sep 2022 21:30:18 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 mh17-20020a17090b4ad100b0020322204672sm2441730pjb.38.2022.09.28.21.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 21:30:17 -0700 (PDT)
Message-ID: <db58b288-2200-fe0b-acde-501510c2e5b3@linaro.org>
Date: Wed, 28 Sep 2022 21:30:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 9/9] target/arm: Enable TARGET_TB_PCREL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220906100528.343244-1-richard.henderson@linaro.org>
 <20220906100528.343244-10-richard.henderson@linaro.org>
 <CAFEAcA-jUebgHHpShKWaR48ctfYBfpFgAkGPbxbp=13gNR=U8g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-jUebgHHpShKWaR48ctfYBfpFgAkGPbxbp=13gNR=U8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/22/22 07:07, Peter Maydell wrote:
>> +    /*
>> +     * For TARGET_TB_PCREL, the value relative to pc_curr against which
>> +     * offsets must be computed for cpu_pc.  -1 if unknown due to jump.
>> +     */
> 
> I'm not really sure what this comment is trying to tell me. Could
> you expand it a bit ?

After the effect of an indirect jump is applied, pc_save is set to -1, so that we can 
assert that we don't attempt to use cpu_pc again.

>>   void arm_cpu_synchronize_from_tb(CPUState *cs,
>>                                    const TranslationBlock *tb)
>>   {
>> -    ARMCPU *cpu = ARM_CPU(cs);
>> -    CPUARMState *env = &cpu->env;
>> -
>> -    /*
>> -     * It's OK to look at env for the current mode here, because it's
>> -     * never possible for an AArch64 TB to chain to an AArch32 TB.
>> -     */
>> -    if (is_a64(env)) {
>> -        env->pc = tb_pc(tb);
>> -    } else {
>> -        env->regs[15] = tb_pc(tb);
>> +    /* The program counter is always up to date with TARGET_TB_PCREL. */
> 
> Is it?

At TranslationBlock boundaries, yes.

> Is there some documentation in one of the other patchsets about
> how TARGET_TB_PCREL works in general and what targets need to do to
> support it?

I tried to do so in the generic TARGET_TB_PCREL support patch.

(1) PC must be up-to-date on all TB boundaries,
(2) translation is given a full virtual address, for the benefit
     of the (nested) call to cpu_ld*_code, but should otherwise
     only consider the page offset portion of that address.
     (a) unwind info is a page offset,
         (1) restore_state_to_opc must use a deposit, and
         (2) arch_tr_insn_start must mask the translation pc.
     (b) pass a complete virtual address to translator_use_goto_tb,
         which will compare that to the translation pc to decide if
         we've crossed a page boundary.
(3) Relative updates to PC should use runtime rather than
     translation time arithmetic.


r~

