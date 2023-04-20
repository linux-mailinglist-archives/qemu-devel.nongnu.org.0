Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8416E8DBA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:13:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQLG-0002PX-K1; Thu, 20 Apr 2023 05:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQLE-0002Or-9G
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:12:36 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQL7-0004j6-0M
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:12:34 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6a5f765d595so544384a34.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681981946; x=1684573946;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XRKqaseZ4z8KyP01EJdIqjScDmpJOeyIVE1Yi7HH/zw=;
 b=M9cvvNTX7uuTJ4+TGggbzTfqTGiSx5wW6eLpxgRx83/d+GZh9Fl69UsqzqtNmYxv6L
 Dj8qW9LvMHez9CF1yWuP4qY+pqNtUsi3sV4SDfqp+eOPOpD9owpWA7NaGGJSSvX6go2r
 nreqQMdxHDXUQBP68URx9JMuPfWQ2K22fo7BvCEwi+ZuIaDXeK+kL01eQYAzT55G6uMV
 r0wHutKRAU80ZPsxP8WF6BnvyOUYHxAftJ/4QPu34jObRxir0cnefnSTmfSjv4fFn5Di
 +m0Pab3/mQGG3rHFeYPbmQ5oqqWGXYTJ0MbF1dgJYaIVHq6sb3EuJmWBtcUFKK9DUPTz
 DMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681981946; x=1684573946;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XRKqaseZ4z8KyP01EJdIqjScDmpJOeyIVE1Yi7HH/zw=;
 b=Q6UGM6eyPL9T1XRnfRUwnsOrGZfNJuZKQD/GgiFj/NIxjihK+Z/c1UbXTxwMLZP3zu
 BIiatc/sfKYlGq+ud/ihZ9HNgQ8j8PfY4xoVN2dMR1esgr5oF8BYds39fGhw2jvDOebH
 9qqOgjwfHOUFYtQDYMu08+Az0KkGsx0yqVauSvdvjZ3mcYpfSIWQXx0z1OfXdQJahyqV
 e8MxD5TtLw5ozxsZ1C3EL/bYYFReOd6tk8KcOuMgxW/GetZmOHXXmefQ2YKKb3JSlJqJ
 IAAvKL2Lh8/S355vtirMISCZ5twEesCoHvwW7DCtSRQWTc35qhEEUWgmOHOLAbDNzwrC
 dZcQ==
X-Gm-Message-State: AAQBX9eej5eJI0Uwe4iJYz5xm4iDdLxtcCtsnMpPQiI7wZmoyn+rTCBM
 bWLgpLqzR1NI70bM/MZHuQzr8Q==
X-Google-Smtp-Source: AKy350YgCMO2i4kRcpj6peIIe7YLCLweNarSpWlXr+4NubgKqFNmAILP1mpswLLTF4cLtvmMofiQ+Q==
X-Received: by 2002:a05:6830:1bc5:b0:6a5:de68:4529 with SMTP id
 v5-20020a0568301bc500b006a5de684529mr259072ota.21.1681981946019; 
 Thu, 20 Apr 2023 02:12:26 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a05683010d200b006a5dd4ba6f2sm523406oto.21.2023.04.20.02.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:12:25 -0700 (PDT)
Message-ID: <18d8a9f1-8f2d-2240-112b-defa44e6dd70@ventanamicro.com>
Date: Thu, 20 Apr 2023 06:12:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 02/12] target/riscv/cpu.c: remove set_vext_version()
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230417140013.58893-1-dbarboza@ventanamicro.com>
 <20230417140013.58893-3-dbarboza@ventanamicro.com>
 <CAKmqyKOq+SWD6fVZsiRBLBqhkcuGD9Z4cbtksrsQBLc5RsZ5EA@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKOq+SWD6fVZsiRBLBqhkcuGD9Z4cbtksrsQBLc5RsZ5EA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 4/19/23 20:37, Alistair Francis wrote:
> On Tue, Apr 18, 2023 at 12:08 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> This setter is doing nothing else but setting env->vext_ver. Assign the
>> value directly.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> 
> I think you dropped my previous reviews

Ops! My bad!


I'll re-send with your acks.


Daniel

> 
> Alistair
> 
>> ---
>>   target/riscv/cpu.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index feca13aefb..fed7b467e4 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -252,11 +252,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
>>       env->priv_ver = priv_ver;
>>   }
>>
>> -static void set_vext_version(CPURISCVState *env, int vext_ver)
>> -{
>> -    env->vext_ver = vext_ver;
>> -}
>> -
>>   #ifndef CONFIG_USER_ONLY
>>   static uint8_t satp_mode_from_str(const char *satp_mode_str)
>>   {
>> @@ -834,7 +829,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
>>           qemu_log("vector version is not specified, "
>>                    "use the default value v1.0\n");
>>       }
>> -    set_vext_version(env, vext_version);
>> +    env->vext_ver = vext_version;
>>   }
>>
>>   /*
>> --
>> 2.39.2
>>
>>

