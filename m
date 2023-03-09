Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440656B2AA4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 17:24:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paJ3k-00018M-4R; Thu, 09 Mar 2023 11:24:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paJ3c-00016e-Cd
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:23:58 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paJ3a-0001e3-5Y
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:23:56 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 f19-20020a9d5f13000000b00693ce5a2f3eso1350183oti.8
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 08:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678379033;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9h9DR1v51Nb7tJWsz/dX1jNk8B2PMmkVZ2mWEbG4gaw=;
 b=CwJhLbU1iy9PS4Qz4Y4rpHY8wg2gWPCF2TLGxFGyZzBAhr2DH6xc53In38JCt2IO8R
 ErvvRiiwgTJ1aIMdAN2XJCvBvxpOEgOUIoOl2jHD2g45z1Trfe5apaY3T8HGx654Z7U3
 ITteUdt3d/k65PkV5digkE1Vb7P1G8QLsZs2tVS+5rDx8t2vqF0LgY6WIsfO6RnUkGF5
 rWhuhi8QcZLgaW2PGIaxKzFtKEQRItJZTly/UL+V7xcTtkNjncmp5bFdSl6ypKU45k6Z
 ARhMeEoJZX9PisuaXOK1KOLhP3AqrMWeFJWsVA+c+4lTZhmn6mAOz1IUtThwTytAn4QA
 artg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678379033;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9h9DR1v51Nb7tJWsz/dX1jNk8B2PMmkVZ2mWEbG4gaw=;
 b=dlZ+Fr6RsBrjG6ULqIkXquc23tszlcK4lqzr8FpJdzcundJyjM2q9v2lMXwDwMBIN9
 zKhoC9xggQvzcjrqeMv+yCfTRuBFqwfvKRGEBf2ztyLCPp8Vt75BVKYGkNamzWnUdq9U
 cCWbaZWAYTXFAu2nxVlmyJpLIG5/g7V2idrWmOj488phrYQiZe/twsZ7KEJRFKwAxIQ1
 bWM4AKoJEWrph7rOdapabJkJC/fF8hMXmAhZ4sDKCIpH3HPKyOw03tktbiVEXrAuEG8+
 MfJyUcqSrAmHEi62032GqzX5gwlOpCZPiX2RsV26C1tuef3xJ18B5lzTzOwBVHncZ4H0
 nwFg==
X-Gm-Message-State: AO0yUKWIkhQo/C5C3SYy2VOwzcqVVa+ZVPbMLa1eFDzAbZcnJcBZxS6G
 2/EkQSE/t0R4qneo/yAlwlQNaQ==
X-Google-Smtp-Source: AK7set/rgnpR8kR4ruyiT0UsaA+NTXJoYAHlq9+QtdY6Xaok9Np/pJh6zsi7RQStcVnlmG5UePKy6g==
X-Received: by 2002:a9d:5f9d:0:b0:694:2f51:129b with SMTP id
 g29-20020a9d5f9d000000b006942f51129bmr9596613oti.24.1678379032787; 
 Thu, 09 Mar 2023 08:23:52 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a056830144600b00693c9f984b4sm7652736otp.70.2023.03.09.08.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 08:23:52 -0800 (PST)
Message-ID: <b3d03412-b76f-ce70-86d4-cbf1ffbf4d48@ventanamicro.com>
Date: Thu, 9 Mar 2023 13:23:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 14/17] target/riscv/cpu.c: do not allow RVE to be
 set
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
 <20230308201925.258223-15-dbarboza@ventanamicro.com>
 <677e5ab2-4fc5-1670-725e-16faeff11734@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <677e5ab2-4fc5-1670-725e-16faeff11734@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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



On 3/9/23 04:10, LIU Zhiwei wrote:
> 
> On 2023/3/9 4:19, Daniel Henrique Barboza wrote:
>> This restriction is found at the current implementation of write_misa()
>> in csr.c. Add it in riscv_cpu_validate_set_extensions() as well, while
>> also removing the checks we're doing considering that I or E can be
>> enabled.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 49f0fd2c11..7a5d202069 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1045,15 +1045,15 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>           cpu->cfg.ext_ifencei = true;
>>       }
>> -    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
>> -        error_setg(errp,
>> -                   "I and E extensions are incompatible");
>> +    /* We do not have RV32E support  */
>> +    if (cpu->cfg.ext_e) {
>> +        error_setg(errp, "E extension (RV32E) is not supported");
>>           return;
>>       }
>> -    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
>> -        error_setg(errp,
>> -                   "Either I or E extension must be set");
>> +    /* When RV32E is supported we'll need to check for either I or E */
>> +    if (!cpu->cfg.ext_i) {
>> +        error_setg(errp, "I extension must be set");
> 
> We currently have supported the RV64E and RV32E in fact. Although we miss some checking when decoding, the current QEMU can run programs written for RVE.  So we should not prohibit the RVE here.

Right, so I got fooled by write_misa() logic. I'll remove this patch.


Thanks,

Daniel

> 
> Zhiwei
> 
>>           return;
>>       }

