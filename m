Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA2869A72C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 09:41:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSwHW-0000WS-Bp; Fri, 17 Feb 2023 03:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSwHM-0000OJ-5e
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 03:39:41 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSwHG-00027J-BY
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 03:39:35 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-17068acb0c2so679457fac.6
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 00:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tqe5bvOLUO3nnKulW7H58rW5hVogZBFNXWSoc4fiB2o=;
 b=C3u6y4wa7v4FzwqZIeKzWjfaliTBXNrbzcU5KBgCvSoAbhT1WI+bB6VDZttunTnVHB
 3SeRcROtJ9lQ1Qn++6p/S9IEAnbLOrwBcCFps/Bq8yWuTYWzV6h+/iC8gRYzuZRmrXww
 3efSWVWo8PXyxgzY7wUJ+OhYlUvchVjCP8aGiICIUtMaC7Dl+NY2CQeeezoD6PAtC2Cc
 gLLHppuAKVEqwEujPNKJ32Exxc4lCmuS7tdIfjdtuCry7lj15fmwnAA9kV4cVbU8Wgl3
 6zqdqGefso5AfkDb11p/0lgvKU289lTJ1h3vQapQJBKgSxwsI3WPsAElVST9MSwVWhJD
 7upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tqe5bvOLUO3nnKulW7H58rW5hVogZBFNXWSoc4fiB2o=;
 b=f1nHTiGZQM6E1/v70fxNAAKWn1UK7eIQZmoKVrSO1AqSifwyaALrs1htGeoLIp/beT
 JMN4WU7xRJEr2lKdC5Ttv0fdvanspGjTvPrrZA5dkpBq2ltJ0aWMp+t4FBf2siPXE0bD
 MKbxEgQP8YCJeHLVcT7jO0qLvfIlMy8k67eiIo4ynWqOQ9Ou4a0Fv6FxPd7PoVnZQ853
 dGEMrSw0JrgmGbrfAiP+aQIQj9YxMaAplcPRR7ictZkiUN7kn9CDrpzYC2T8nCJyqrY0
 xHVboIHt2P4axLCPPs1/OEUdLgLo9uHhhdmtfvcI3frU3qbY4Fsmy+rNpWY1QFYHF3Hy
 5N5Q==
X-Gm-Message-State: AO0yUKWTD6YeWs9+1fAqSZbw3qP4ut5T/hV5g5Iod0rgYLTWpFGodeos
 u23fSqfHL1LpV9UzHVX0IM3lhg==
X-Google-Smtp-Source: AK7set/UAt17S9oPvobYN0Ez0PIVyartH+THqPvTwTVz8OobGcxCmiKYgObPZbSxf94UTM8Fui9Fiw==
X-Received: by 2002:a05:6870:e890:b0:16a:b526:59a6 with SMTP id
 q16-20020a056870e89000b0016ab52659a6mr5148352oan.43.1676623172802; 
 Fri, 17 Feb 2023 00:39:32 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a056871050700b0015f83e16a10sm1422753oal.44.2023.02.17.00.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 00:39:32 -0800 (PST)
Message-ID: <3b27a67d-a08d-e1ba-a185-508c6c43f47b@ventanamicro.com>
Date: Fri, 17 Feb 2023 05:39:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 2/9] target/riscv: introduce riscv_cpu_cfg()
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, richard.henderson@linaro.org
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-3-dbarboza@ventanamicro.com>
 <9c48a83d-7cdf-4691-d7c5-da022737f1bc@linux.alibaba.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <9c48a83d-7cdf-4691-d7c5-da022737f1bc@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/16/23 23:55, LIU Zhiwei wrote:
> 
> On 2023/2/17 5:55, Daniel Henrique Barboza wrote:
>> We're going to do changes that requires accessing the RISCVCPUConfig
>> struct from the RISCVCPU, having access only to a CPURISCVState 'env'
>> pointer. Add a helper to make the code easier to read.
>>
>> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.h | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 01803a020d..5e9626837b 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -653,6 +653,11 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
>>   #endif
>>   #define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
>>   
>> +static inline const RISCVCPUConfig *riscv_cpu_cfg(CPURISCVState *env)
>> +{
>> +    return &env_archcpu(env)->cfg;
>> +}
>> +
> 
> There many places in branch should use this interface, not just in this patch set.
> 
> For example,
> 
> static RISCVException seed(CPURISCVState *env, int csrno)
> {
>      RISCVCPU *cpu = env_archcpu(env);
> 
>      if (!cpu->cfg.ext_zkr) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> 
> The cpu here will not be used, except referring to the cfg.
> 
> Do you mind to unify the use?

Sure, I can look into that to make the cfg access more uniform across the code.

I believe this would be too much to do in this series though. Let's do it as a
follow-up.


Thanks.


Daniel

> 
> Zhiwei
> 
>>   #if defined(TARGET_RISCV32)
>>   #define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
>>   #else

