Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8B86CC21C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 16:34:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phANt-0006W3-Qm; Tue, 28 Mar 2023 10:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phANp-0006Uw-49
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 10:33:09 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phANn-0007p8-I0
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 10:33:08 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-17683b570b8so12852475fac.13
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 07:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680013985;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fHF1c/UDdbpOvV6LUDspronbAWty4XowDEY4u0/G/GI=;
 b=UOsUTwlcMtWX+MLZGl06cXkDsxEei6/fEIoeOziaMzE32112Dv4QnBwgsdzhR1bplr
 DIS2OsjSY1WoKPQrD8PT9NeApbrGwlYtFQKa/CAtpGzKT8HUZFiFMyEVVUuBvZw1EJOP
 OJrm6qRJzYE5sQTWu/U0cowE9Ztbt/7QSd1s94nn4gT76FrIGvTFHTdSyC5sAF23u37g
 xJPnVz5fXS89qf4S+Dle0x5Vlh5W89N4s+IIOwxKladAlUalwutJ+zQoZwrefnqmUk0o
 b3Zg2e5HZuroDs1nSzpUSOmBJNV1ZXCMO9uhS8l6EsdVDOjRnEMtpYYSj+hcz50ePqoY
 cRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680013985;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fHF1c/UDdbpOvV6LUDspronbAWty4XowDEY4u0/G/GI=;
 b=WmARJ3ieHf7UlXmocvDXsUWOO/5nWaVUJOxto4QbLOayllDO5gX36gXpTtxOxnC+AP
 kVZZDdNphI+mUNvBV8/AYqIDDthkUXpYx79Ef5Uz8A8T/428LJq7DIlJWHurvmHZosHF
 NQo6jcnCGQwHTrMfldxrUuUm5cArtMntXYBMpgkT3NhQrWdlIVxxWmAoQd5XK2JbLk4b
 MXyCGyBpW9I/OvJjc/na36WsEtwWALkIwhqEiHd60sgw+a3h+hFY6jqbM6M09WwJ1pz4
 K+Y7uJHFipX/akVctVnYwTVDQQDWwyLTWGQZ0DyFM5JAiyCoPd+zPjhxDQZzWMWwoKV6
 /gMA==
X-Gm-Message-State: AAQBX9ftOpMN+mwbGpo1DXPKWVlFk8vfYWqGiFW2388p3U/Ar9u6WTtp
 dCEc2h9SY6Rm4ceniV8smztuYQ==
X-Google-Smtp-Source: AKy350bmjqe++jVa9ik1tPChWIb1+uCMKdSN3dJ23kQHSERE97m4SQ6267EO1z0Ty9vfh/3Q/jAwXw==
X-Received: by 2002:a05:6870:4591:b0:17a:6788:e8b8 with SMTP id
 y17-20020a056870459100b0017a6788e8b8mr9448744oao.51.1680013985308; 
 Tue, 28 Mar 2023 07:33:05 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 xg8-20020a056870cf8800b00177ba198612sm10833551oab.53.2023.03.28.07.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 07:33:04 -0700 (PDT)
Message-ID: <a4b2c90a-e27e-eae5-394b-77a5f2b84ac7@ventanamicro.com>
Date: Tue, 28 Mar 2023 11:33:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.1 v4 18/25] target/riscv: error out on priv failure
 for RVH
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
 <20230322222004.357013-19-dbarboza@ventanamicro.com>
 <420592cf-cd82-0b24-9176-9887392d0a3a@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <420592cf-cd82-0b24-9176-9887392d0a3a@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
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



On 3/24/23 11:56, liweiwei wrote:
> 
> On 2023/3/23 06:19, Daniel Henrique Barboza wrote:
>> riscv_cpu_disable_priv_spec_isa_exts(), at the end of
>> riscv_cpu_validate_set_extensions(), will disable cpu->cfg.ext_h and
>> cpu->cfg.ext_v if priv_ver check fails.
>>
>> This check can be done in riscv_cpu_validate_misa_ext(). The difference
>> here is that we're not silently disable it: we'll error out. Silently
>> disabling a MISA extension after all the validation is completed can can
>> cause inconsistencies that we don't have to deal with. Verify ealier and
>> fail faster.
>>
>> Note that we're ignoring RVV priv_ver validation since its minimal priv
>> is also the minimal value we support. RVH will error out if enabled
>> under priv_ver under 1_12_0.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 399f63b42f..d2eb2b3ba1 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1055,6 +1055,20 @@ static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
>>           return;
>>       }
>> +    /*
>> +     * Check for priv spec version. RVH is 1_12_0, RVV is 1_10_0.
>> +     * We don't support anything under 1_10_0 so skip checking
>> +     * priv for RVV.
>> +     *
>> +     * We're hardcoding it here to avoid looping into the
>> +     * 50+ entries of isa_edata_arr[] just to check the RVH
>> +     * entry.
>> +     */
>> +    if (cpu->cfg.ext_h && env->priv_ver < PRIV_VERSION_1_12_0) {
>> +        error_setg(errp, "H extension requires priv spec 1.12.0");
>> +        return;
>> +    }
> The other multi-letter extensions are directly disabled for lower priv version with warning message.
> 
> Whether we should do the similar action here?

I'd rather error out in all cases, to be honest. cpu_init() functions should be
responsible for choosing an adequate priv spec level for the extensions it wants
to use.


Thanks,


Daniel

> 
> Regards,
> 
> Weiwei Li
> 
>> +
>>       if (cpu->cfg.ext_v) {
>>           riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
>>           if (local_err != NULL) {
> 

