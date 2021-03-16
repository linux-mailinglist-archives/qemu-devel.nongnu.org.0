Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380B333D645
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:59:00 +0100 (CET)
Received: from localhost ([::1]:40078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMB9v-0004we-9e
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMB8O-0004IY-IT
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:57:24 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:46467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMB8M-0005Oi-Nt
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:57:24 -0400
Received: by mail-qk1-x732.google.com with SMTP id a9so35436534qkn.13
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 07:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mobli1tHVBYwFNZIwFtcNl07stJYmyz/3j+OIeJj9Fg=;
 b=OBpEkZOnm9JKZ1+45YUh1/Qrr0D5S8kkDh5ULVIUeRiufKzYPC5W/cUYPEqdJ4imE1
 YJATluqZrSNHmXu0YHtLo2YiCM2WFYTdFxIOe1R7DXrUBTRuQ2ueKddvbm+Y+67+6omv
 X3IKUZDlIPA59OZwhZd3L2eR/KXM4Q5qLjh5HL0uBnnSslj9Y/KOxUagycR6AQj5CDAc
 s7TLwCOM5UHLsth/8hGHekJmsnc64sIxPLMVLUmUQyFJTFLALE2gCt1OqxWs8zRSCYx/
 s1HfERapEy7r4Y+KFTMWIh3TXB6MB2FDbFPXGxPlgddobGFx7IjDJKr7b8DJV91chn3q
 wfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mobli1tHVBYwFNZIwFtcNl07stJYmyz/3j+OIeJj9Fg=;
 b=t0IagGWZFYydfvXnLgKWe88vCQibvj45J0naizibQwHBj+307+E4zyGSrmliaoioAv
 RJ0j4w8h4XprI5f5l4hhPO0dJyqPDKwu8mOPFxfD/Zs2be+FoObYeTFEK4kGHMHurU17
 wHC0Idv/QjuIafHOushIxVdK9gEUxvPo84AB9gRjoBBPoX21Wo0VmGrenH9c1XtkwvQR
 MLr78llNYypwA/3mAkFwDffobRmpfyoZlAGcDQ7LCJml8vx+bthWGXbmnGx/+Di1AiWQ
 solWZZ6Dky7Bkov24zsVh2Pz+hEtSMTrHZ9jnXiZfevzRsqwIB65wlNMWQDu16yTUWcF
 tpvA==
X-Gm-Message-State: AOAM530xUgWIW5lNFt+xT/QL2cn0Fp5rQbGGDW3FL7a8ApyTBagGKrrj
 8LtIR1/APbyMaEDBykMzUFSMtCOWvRS8A5+A
X-Google-Smtp-Source: ABdhPJxxplvR0LmQtmpDXZHyBPSzAoEqSKT0GuuQinvw1FctFv9CxLf29/3QG9FNT8MIVhF4ihCdCA==
X-Received: by 2002:a37:9d84:: with SMTP id
 g126mr31014023qke.183.1615906641007; 
 Tue, 16 Mar 2021 07:57:21 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id q143sm15345729qke.110.2021.03.16.07.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 07:57:20 -0700 (PDT)
Subject: Re: [PATCH v2 03/29] tcg: Re-order tcg_region_init vs
 tcg_prologue_init
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
 <20210314212724.1917075-4-richard.henderson@linaro.org>
 <YE/vwNCE7EEukXll@SPB-NB-133.local>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a23627f0-75b8-770b-b202-0dfc0725885f@linaro.org>
Date: Tue, 16 Mar 2021 08:57:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YE/vwNCE7EEukXll@SPB-NB-133.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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
Cc: qemu-devel@nongnu.org, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 5:37 PM, Roman Bolshakov wrote:
>>       tcg_exec_init(s->tb_size * 1024 * 1024, s->splitwx_enabled);
>>       mttcg_enabled = s->mttcg_enabled;
>> -
>> -    /*
>> -     * Initialize TCG regions only for softmmu.
>> -     *
>> -     * This needs to be done later for user mode, because the prologue
>> -     * generation needs to be delayed so that GUEST_BASE is already set.
>> -     */
>> -#ifndef CONFIG_USER_ONLY
>> -    tcg_region_init();
> 
> Note that tcg_region_init() invokes tcg_n_regions() that depends on
> qemu_tcg_mttcg_enabled() that evaluates mttcg_enabled. Likely you need
> to move "mttcg_enabled = s->mttcg_enabled;" before tcg_exec_init() to
> keep existing behaviour.

Yes indeed.  This gets fixed in patch 12, which is why I didn't notice 
breakage.  Will adjust.

>> -    total_size = s->code_gen_buffer_size;
>> -    s->code_ptr = buf0;
>> -    s->code_buf = buf0;
>> +    tcg_region_assign(s, 0);
>> +    s->code_ptr = s->code_gen_ptr;
>> +    s->code_buf = s->code_gen_ptr;
> 
> Pardon me for asking a naive question, what's the difference between
> s->code_buf and s->code_gen_buf and, respectively, s->code_ptr and
> s->code_gen_ptr?

I don't remember.  I actually had it in my mind to rename all of these, remove 
one or two that feel redundant, and document them all.  But the patch set was 
large enough already.


r~

