Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671C36930A4
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 12:52:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQoOs-00017b-84; Sat, 11 Feb 2023 06:50:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQoOq-000169-DS
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 06:50:36 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQoOd-0002RF-I9
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 06:50:25 -0500
Received: by mail-oi1-x22c.google.com with SMTP id bh15so6611283oib.4
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 03:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qtGdEfk8WPql0LZtZNsxPzMi28Bb5PgTELpcE7OsZf4=;
 b=N17wnB9A0wKDEeeyeCKK4ELX/PXjprIDwv2ZAbDXlfTb+4ORYFIsIqmRrAmlDxS5HK
 1SA2kYWc/lzu/X0PnqAurK/MvChfYhgaHkb2gCez11BNx4XaT47DeEwzfOv8SX0Lnao/
 Fg7MdP6Yxx2VZB9J3/S+/MqdC+X7kYS4bSm+a22tgN5y5KL6fyB+oSw8tKMJv1zpCSdx
 Y+kib8DAZpRrXQZQBPYuxWG7NXb/CjF1LuCF5fPiIolASJet8RLpRHLdaeqDJCxun65P
 6gJMFMbH5yv38WlI8Qu2O3lrS2LAUn5I1oKhoQjjDhIUleuVsE2uPcnItydk5+wTZHS/
 EDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qtGdEfk8WPql0LZtZNsxPzMi28Bb5PgTELpcE7OsZf4=;
 b=xuJXPEsZjQvI3mnSOwCN1kfSqQy+QSEMvthK7hOo7AuX0oOFj6PMJAr0oK+OE8kPvP
 QaVl+3jNI0h4Dmy1VqyLJ7CCxKssSozSAOWJcU63SoPY3kCFaK8947m86dBxqE8FMarm
 DLCTHPJUTmCRumcE+6Yz3fnm4xMyfhrw32a5PFUWs+GV4iQ1ikl6mK1yD5esuh7NLxhZ
 mlEyvxmbr0mPKDq5bCP1w4A2Vh8eiIGLje9fhK+4zv5uSTihXnOF8AH401Hzq7Pbu9w/
 jMUVuzSJadCB4+p+3KYVDNPEu83QNeAvAx7Lfji5ZWzDbTeTVs4bRiWqx+T0EPgxCKYn
 xYPw==
X-Gm-Message-State: AO0yUKUfVvpag3PmNTbxcrvQ+tPRLFjagLccooltULHGRxzlMFQZ2Oxs
 5UpNLoFNWKfCoOuTytwEiSKC4Q==
X-Google-Smtp-Source: AK7set+16H3Bb1KpBe29Zy0soxEtCXcLXvNdSrMf2i0bPus7PVf8FJDiue2Mu64lwuUMzM5dL8mKdQ==
X-Received: by 2002:a54:4013:0:b0:36e:fe3f:a02 with SMTP id
 x19-20020a544013000000b0036efe3f0a02mr9609281oie.19.1676116222217; 
 Sat, 11 Feb 2023 03:50:22 -0800 (PST)
Received: from [192.168.68.107] ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 dj6-20020a0568303a8600b0068d542f630fsm3015703otb.76.2023.02.11.03.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 03:50:21 -0800 (PST)
Message-ID: <0d853c1b-7554-1813-693f-e31a62ef9298@ventanamicro.com>
Date: Sat, 11 Feb 2023 08:50:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 02/11] target/riscv: allow users to actually write the
 MISA CSR
Content-Language: en-US
To: weiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
 <20230210133635.589647-3-dbarboza@ventanamicro.com>
 <2a0d5e1e-f2ff-6502-0f88-f6b3005bcaf3@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <2a0d5e1e-f2ff-6502-0f88-f6b3005bcaf3@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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



On 2/10/23 23:43, weiwei wrote:
> 
> On 2023/2/10 21:36, Daniel Henrique Barboza wrote:
>> At this moment, and apparently since ever, we have no way of enabling
>> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
>> the nuts and bolts that handles how to properly write this CSR, has
>> always been a no-op as well because write_misa() will always exit
>> earlier.
>>
>> This seems to be benign in the majority of cases. Booting an Ubuntu
>> 'virt' guest and logging all the calls to 'write_misa' shows that no
>> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
>> RISC-V extensions after the machine is powered on, seems to be a niche
>> use.
>>
>> There is a good chance that the code in write_misa() hasn't been
>> properly tested. Allowing users to write MISA can open the floodgates of
>> new breeds of bugs. We could instead remove most (if not all) of
>> write_misa() since it's never used. Well, as a hardware emulator,
>> dealing with crashes because a register write went wrong is what we're
>> here for.
>>
>> Create a 'misa-w' CPU property to allow users to choose whether writes
>> to MISA should be allowed. The default is set to 'false' for all RISC-V
>> machines to keep compatibility with what we´ve been doing so far.
>>
>> Read cpu->cfg.misa_w directly in write_misa(), instead of executing
>> riscv_set_feature(RISCV_FEATURE_MISA) in riscv_cpu_realize(), that would
>> simply reflect the cpu->cfg.misa_w bool value in 'env->features' and
>> require a riscv_feature() call to read it back.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 1 +
>>   target/riscv/cpu.h | 1 +
>>   target/riscv/csr.c | 4 +++-
>>   3 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 93b52b826c..69fb9e123f 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1197,6 +1197,7 @@ static void register_cpu_props(DeviceState *dev)
>>   static Property riscv_cpu_properties[] = {
>>       DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>> +    DEFINE_PROP_BOOL("misa-w", RISCVCPU, cfg.misa_w, false),
>>       DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
>>       DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 7128438d8e..103963b386 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -498,6 +498,7 @@ struct RISCVCPUConfig {
>>       bool pmp;
>>       bool epmp;
>>       bool debug;
>> +    bool misa_w;
>>       bool short_isa_string;
>>   };
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index e149b453da..4f9cc501b2 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1329,7 +1329,9 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>>                                    target_ulong val)
>>   {
>> -    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
>> +    RISCVCPU *cpu = env_archcpu(env);
>> +
>> +    if (!cpu->cfg.misa_w) {
> 
> It's Ok to get it directly from cfg. However, personally, I prefer to keep the non-isa features in a separate list.

I don't mind a separated non-isa list. cpu->cfg has everything contained in it
though, ISA and non-ISA (e.g. vendor extensions that weren't ratified yet), and
the current RISCV_FEATURES_* list is just a duplicate of it that we need to
update it during riscv_cpu_realize().

In my opinion we can spare the extra effort of keeping a separated, up-to-date
non-ISA extension/features list, by just reading everything from cfg.


Thanks,


Daniel

> 
> Regards,
> 
> Weiwei Li
> 
>>           /* drop write to misa */
>>           return RISCV_EXCP_NONE;
>>       }
> 

