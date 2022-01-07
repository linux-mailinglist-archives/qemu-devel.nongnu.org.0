Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1F2487DC2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:31:37 +0100 (CET)
Received: from localhost ([::1]:43030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5vtg-0000h6-5V
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 15:31:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5vre-0007Wp-RW
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 15:29:30 -0500
Received: from [2607:f8b0:4864:20::432] (port=38514
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5vrd-0006bQ-6E
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 15:29:30 -0500
Received: by mail-pf1-x432.google.com with SMTP id u192so106349pfc.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 12:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pqzFHF17NqTJ1RO+IP8GmJaa+kOZt7zsY5kZcze0vfE=;
 b=ZUosrT+pF7jZwpkz3oXtHFKEDOxmHVKXTBbe2/LYWDMpgEAUS/pF7RZmbXRLiIZntj
 rZMJbV27cyvjXob5c16r2gZXXlLGY6eOk8wOBpipK9n4j9Fdxz4nfJdyhTRfpP++2iIt
 MIq9gAdGqe7uJ7jOQ/Ee5joAri5kTmNANTlvNjxxRShZUsFQv8Hp+vtdcK57RwhazaGY
 KVbzC1yiSiWPOTC1FQb6a7Oqpa5RL8JaA1KG8G4+H7cpEGkv/FfjEHSBJRjcDN412Wp3
 bceuNyzJZ417dv5lhFAimdu2huU8ttKW/mR/j5fTf1jXop7HDEiJShu+eLAJ1yl7QSk7
 SIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pqzFHF17NqTJ1RO+IP8GmJaa+kOZt7zsY5kZcze0vfE=;
 b=llekuDZkR74tRJhEgfuYvXSmLHaszViuwDbpxklPCOugmZ7ViLE2Jgm6UC8Qa0Ewiv
 Wkrl/upydyOd8bXKJ/CK9qg0mPDoK3jaIs7vJVOz6BflvJEe5/xLJdnsGfzmxWIzN9rl
 vuxfhc6+pQNHLzeaHxFCOuPBmA0W/+9TveIbe/o45b0iPq7HBO5X7C4GKYnn7TyrbUY5
 TEIO8tcccItr8C7t0X9FhwmoOQNIXKg7B0XB+Ee1769cZeoxnJiVJFISE2YN5g/qdpna
 gXRbOUgJTKDTuQVEcCr2YjPT5O0AsinWKX+BO6cS0guTQJXhf7TJ9Va/tXzc4zJdEeNp
 NcZg==
X-Gm-Message-State: AOAM530OUMiDVQfK4JXZ/SDJ4ZYuGIv56yxxaZRay+i+F+1nDX0C7HPp
 L91BwOQRNRRZJGVZt1N4QKvduQ==
X-Google-Smtp-Source: ABdhPJwHfQv/Z9xLyjvhVG6aPgz1bqpbuR+xy+EksppGwwaHeh0/nn2H8hZYAGPL1ArLp2lE/5gXLA==
X-Received: by 2002:a63:7983:: with SMTP id
 u125mr49259195pgc.569.1641587367625; 
 Fri, 07 Jan 2022 12:29:27 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id ot6sm7240115pjb.32.2022.01.07.12.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 12:29:27 -0800 (PST)
Subject: Re: [PATCH] target/arm/cpu64: Use 32-bit GDBstub when running in
 32-bit KVM mode
To: Ard Biesheuvel <ardb@kernel.org>, qemu-arm@nongnu.org
References: <20220107155406.344273-1-ardb@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6a8576f3-2e45-a58d-7a56-692a8bba54f7@linaro.org>
Date: Fri, 7 Jan 2022 12:29:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107155406.344273-1-ardb@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex Bennee <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 7:54 AM, Ard Biesheuvel wrote:
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 15245a60a8c7..3dede9e2ec31 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -903,9 +903,15 @@ static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
>       return arm_feature(&cpu->env, ARM_FEATURE_AARCH64);
>   }
>   
> +static gchar *arm_gdb_arch_name(CPUState *cs)
> +{
> +    return g_strdup("arm");
> +}
> +
>   static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
>   {
>       ARMCPU *cpu = ARM_CPU(obj);
> +    CPUClass *cc = CPU_GET_CLASS(obj);
>   
>       /* At this time, this property is only allowed if KVM is enabled.  This
>        * restriction allows us to avoid fixing up functionality that assumes a
> @@ -919,6 +925,12 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
>               return;
>           }
>           unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +
> +        cc->gdb_read_register = arm_cpu_gdb_read_register;
> +        cc->gdb_write_register = arm_cpu_gdb_write_register;
> +        cc->gdb_num_core_regs = 26;
> +        cc->gdb_core_xml_file = "arm-core.xml";
> +        cc->gdb_arch_name = arm_gdb_arch_name;

It would be nice to split out a function in cpu.c for this,
perhaps arm_cpu_class_gdb_init().

Otherwise this looks like the correct approach.


r~

