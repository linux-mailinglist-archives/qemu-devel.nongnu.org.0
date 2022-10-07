Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E25F7BD2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:52:21 +0200 (CEST)
Received: from localhost ([::1]:33696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqaC-000348-39
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogqU9-00063Y-4m
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:46:05 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogqTv-0003Cu-5b
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:46:03 -0400
Received: by mail-pf1-x433.google.com with SMTP id h13so3943417pfr.7
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 09:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YjKcAW1hxwlU3hdHTNn8AUZZ4Ce3sTTG7K+u9186FJ0=;
 b=TDNr64k6m8IZSrIs2bzG5HP0v+p4H6TQUM52dStrQy2jemr7VnHrecG3wqUcUGwdrX
 vC0FV6vhC5478K2EyzB5byoVxEr/7A2YEGi0n7wODpRvEAruVRudDJP0VLeIiOKq3eI0
 o7Oq4Wybo5fWzbT22DxMeu79rEfkiofR7ShmhID0o5AHfz2QM/a5OZr5IVxqWPZOpJqN
 8RMhvbZSnid7imu5/LQbCQcApoYhD+WN2F/++7ayGzZ/QHVaoZxLyWQQuseccqcv//U7
 WDOwqZe1MBMULFBoLVhdQ8F8vdJUAKfEvQZED5Er6rlp+RAgIQCPnomxfpE5tLYfBn4e
 Kivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YjKcAW1hxwlU3hdHTNn8AUZZ4Ce3sTTG7K+u9186FJ0=;
 b=pi+/W3MCVQPliKBEX+KUu2s3keVjfw76DJsdpJJpktPYJg2gSFcWzcXu32l5MX+q0f
 RgNl3O7JM1GjAQsPhmFZS+REsAKRprhVOX1D+1U6hgPU1AvsDXsqZ/RKUoD6g6LQ4JPa
 1ETfsVmKerhTcTA6NvFdJ1q/4YePh4xyErpRRb/KYFuQwAtvYmeOaUN21KUDpSx+RE7R
 9Z88KJyCN+40H+iJmMjCJ7WuyIbZ1fvHHG3ejTRDvqUHgPRMNm36m3Wtzrrz6Zg6XSIe
 OkIIPcSUB29BgZqo7bMSDbWAtzqZE24V//BRJXHuz5EdgARGtNittljf9+q6IuKhtjIT
 dEhg==
X-Gm-Message-State: ACrzQf3a8uvqZgfvmCtiBMAudZiGIEYCkMGW6k2WCeWwNGaFXeeqiv4/
 pugHLPfsRgUkIKDvAUbqvxWfI57luIyRTQ==
X-Google-Smtp-Source: AMsMyM7n3rJhRtaqyJZwPUbNSq5cmHUChx56fdc3KRfoYIRSW2ne5ceFt9h+m3W6f/WebLbkg67KEg==
X-Received: by 2002:a63:1349:0:b0:44b:2240:b311 with SMTP id
 9-20020a631349000000b0044b2240b311mr5310292pgt.405.1665161149564; 
 Fri, 07 Oct 2022 09:45:49 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:3b6c:3864:9643:140a?
 ([2602:47:d49d:ec01:3b6c:3864:9643:140a])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a170902db0500b001745662d568sm1742796plx.278.2022.10.07.09.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 09:45:48 -0700 (PDT)
Message-ID: <52ec3b12-b9bb-b2a9-52c8-54a7016182c6@linaro.org>
Date: Fri, 7 Oct 2022 09:45:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 41/42] target/arm: Implement FEAT_HAFDBS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-42-richard.henderson@linaro.org>
 <CAFEAcA-LhvMYbTTcsC+eAcAeA61e9Kq=zf6fKr5j_4dusuRDiw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-LhvMYbTTcsC+eAcAeA61e9Kq=zf6fKr5j_4dusuRDiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.699,
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

On 10/7/22 06:47, Peter Maydell wrote:
> On Sat, 1 Oct 2022 at 18:04, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Perform the atomic update for hardware management of the access flag
>> and the dirty bit.
>>
>> A limitation of the implementation so far is that the page table
>> itself must already be writable, i.e. the dirty bit for the stage2
>> page table must already be set, i.e. we cannot set both dirty bits
>> at the same time.
>>
>> This is allowed because it is CONSTRAINED UNPREDICTABLE whether any
>> atomic update happens at all.  The implementation is allowed to simply
>> fall back on software update at any time.
> 
> I can't see where in the Arm ARM this is stated.
> 
> In any case, if HA is set you can't simply return ARMFault_AccessFlag
> without breaking the bit in D5.4.12 which says
> "When hardware updates of the Access flag are enabled for a stage of
>   translation an address translation instruction that uses that stage
>   of translation will not report that the address will give rise to
>   an Access flag fault in the PAR"

I think this may have been loose (or incorrect) reading of what has become R_QSPMS in I_a, 
via "access generates ... a Permission fault", due to the pte page being read-only, due to 
the dirty bit being clear.

However, having performed the same atomic update conversion for x86, I can see now that I 
merely need to perform the lookup for s1 ptw with MMU_DATA_STORE rather than MMU_DATA_LOAD 
in order for the s1 pte page to have its own dirty bit processed and become writable.

>> +    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
> 
> I think we should split the access flag update and the
> dirty-bit update into separate commits. It might be useful
> for bisection purposes later, and it looks like they're pretty
> cleanly separable. (Though if you look at my last comment in this
> email, maybe not quite so clean as in the code as you have it here.)

Shouldn't be too hard to split.  I'll try, at least.

>> +static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
>> +                             uint64_t new_val, const S1TranslateResult *s1,
>> +                             ARMMMUFaultInfo *fi)
>> +{
>> +    uint64_t cur_val;
>> +
>> +    if (unlikely(!s1->hphys)) {
>> +        fi->type = ARMFault_UnsuppAtomicUpdate;
>> +        fi->s1ptw = true;
>> +        return 0;
>> +    }
>> +
>> +#ifndef CONFIG_ATOMIC64
>> +    /*
>> +     * We can't support the atomic operation on the host.  We should be
>> +     * running in round-robin mode though, which means that we would only
>> +     * race with dma i/o.
>> +     */
>> +    qemu_mutex_lock_iothread();
> 
> Are there definitely no code paths where we might try to do
> a page table walk with the iothread already locked ?

I'll double-check, but another possibility is to simply perform the atomic operation on 
the low 32-bits, where both AF and DB are located.  Another trick I learned from x86...

>> +        old_des = descriptor;
>> +        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
>> +            new_des = descriptor | (1ull << 7);   /* S2AP[1] */
>> +        } else {
>> +            new_des = descriptor & ~(1ull << 7);  /* AP[2] */
>> +        }
> 
> If we update the prot bits, we need to also re-calculate the exec bit,
> I think, because the execute-never stuff depends on whether the page is
> writeable. Alternatively you can do it the way the pseudocode does and
> pre-figure-out the final permission bits value (see AArch64.S1ApplyOutputPerms()
> and AArch64.S2ApplyOutputPerms()) so you only need to calculate the
> exec bit once.

Good catch.


r~

