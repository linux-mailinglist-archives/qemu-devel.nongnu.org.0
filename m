Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B8742DF13
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:24:06 +0200 (CEST)
Received: from localhost ([::1]:40822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3WX-00065L-Fa
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb3AS-0001q4-Bu
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:01:16 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb3AN-0007ZR-L4
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:01:16 -0400
Received: by mail-pf1-x429.google.com with SMTP id y7so5839712pfg.8
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PWTffnLimTOQMbGYWfQUNstE176YL1dnvKO/TatQ8A8=;
 b=bEh3SB8idaEh6tWQ0SZxLXCDL/ZT439bj4HqUZnCeebhUA5y4HOOazsVa+tVAE1Nnm
 BNic/gE2ZtUKgouXQohwAG+Q9bAAKxJmAeXKHCmWJUX7/+Y6G851UAwu44NB7vif+KTW
 Q9uYAc7N0dKO7X0ZOT/J8uWul3m5Ph7NJGuKp/xmRMw4jAyaZQTTzP0GMF6tR1d7tb4v
 tJ5XH/qymhf177xp4JfkX77kFVjlU39+NIaRJQIl3fonsyeFMKlLO8zmc19FZ7bJ8Yva
 RAdqZ57aaM5E28JXmHYOK/L6ZI7hGY3KwcjTpy4FlMasO4P4XplcMkmfjNLKN+nhQJbq
 8q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PWTffnLimTOQMbGYWfQUNstE176YL1dnvKO/TatQ8A8=;
 b=n2bOTn6FQ4+2+5qloy12FLFUmA2roevwzk37PLv2+JMOIcgxZz4Baqa5YF0uYn5neC
 VK74KHXAeTuUmOShrG02O0WHEbhXeoPzrJ2AfIXH/yTxSNen2vaH5mIko7QpKOhGuS9m
 +eKQUBKWykcWB52Nt+wagTcfkKBbmGceJoIFxCJ67Z0Yo4+QpB/74gsgSruVdtg/hAfV
 wZgB4NFpyNfmaSQ46GD4YG5aQyCA56MFkMzXeyCH4pDIcpuw9WSe+USGRd9WdrweCAWb
 so5O7WzG9U+pmMThO4HcsG/XSMv4FUutk7hvOKfYlZsSrSuXMn9R/vtTnhnGWpjYIzTC
 H7WA==
X-Gm-Message-State: AOAM532K0xmWsmUqc45Zd0zx7Me2268XdtEhnOOmrvpQhSd8beQxNagQ
 C7xOQayhVgSofjpAF0ABTdcRQQ==
X-Google-Smtp-Source: ABdhPJxB6M5DH6fbBEOWQMq6l+tA8TqLyVrtXwzgOd3M5yAPxFXQnF8lBqeDzLgxcrVXw+02AGXp7w==
X-Received: by 2002:a05:6a00:168c:b0:44c:dc5a:7ee0 with SMTP id
 k12-20020a056a00168c00b0044cdc5a7ee0mr5944091pfc.40.1634227269786; 
 Thu, 14 Oct 2021 09:01:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s17sm2812862pge.50.2021.10.14.09.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 09:01:09 -0700 (PDT)
Subject: Re: [PATCH v2 04/13] target/riscv: Replace riscv_cpu_is_32bit with
 riscv_cpu_mxl
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-5-richard.henderson@linaro.org>
 <fe624f35-b12a-ad57-fabd-9eb47a0e3c6f@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a64a991f-8692-8dd5-c69e-6541a2e60e06@linaro.org>
Date: Thu, 14 Oct 2021 09:01:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fe624f35-b12a-ad57-fabd-9eb47a0e3c6f@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 12:08 AM, LIU Zhiwei wrote:
> 
> On 2021/10/14 上午4:50, Richard Henderson wrote:
>> Shortly, the set of supported XL will not be just 32 and 64,
>> and representing that properly using the enumeration will be
>> imperative.
>>
>> Two places, booting and gdb, intentionally use misa_mxl_max
>> to emphasize the use of the reset value of misa.mxl, and not
>> the current cpu state.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/riscv/cpu.h            |  9 ++++++++-
>>   hw/riscv/boot.c               |  2 +-
>>   semihosting/arm-compat-semi.c |  2 +-
>>   target/riscv/cpu.c            | 24 ++++++++++++++----------
>>   target/riscv/cpu_helper.c     | 12 ++++++------
>>   target/riscv/csr.c            | 24 ++++++++++++------------
>>   target/riscv/gdbstub.c        |  2 +-
>>   target/riscv/monitor.c        |  4 ++--
>>   8 files changed, 45 insertions(+), 34 deletions(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index e708fcc168..87248b562a 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -396,7 +396,14 @@ FIELD(TB_FLAGS, VILL, 8, 1)
>>   FIELD(TB_FLAGS, HLSX, 9, 1)
>>   FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
>> -bool riscv_cpu_is_32bit(CPURISCVState *env);
>> +#ifdef CONFIG_RISCV32
>> +#define riscv_cpu_mxl(env)      MXL_RV32
>> +#else
>> +static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
>> +{
>> +    return env->misa_mxl;
>> +}
>> +#endif
> 
> Hi Richard,
> 
> I don't know why we use CONFIG_RISCV32 here. I looked through the target source code. It 
> doesn't use this macro before.

Typo, should be TARGET_RISCV32.

But the reason to have the ifdef is so that riscv_cpu_mxl becomes a constant and the 
compiler can fold away more code.

>>   bool riscv_is_32bit(RISCVHartArrayState *harts)
>>   {
>> -    return riscv_cpu_is_32bit(&harts->harts[0].env);
>> +    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
> 
> Why not use  misa_mxl  here?  As this is just a replacement of riscv_cpu_is_32bit like 
> many other places.

It isn't clear to me that all uses of this are at boot time.  Once MXL may be changed at 
runtime, that (potentially) changes this test, and it seems unlikely that the board would 
really change based on the current status of the cpu.


r~

