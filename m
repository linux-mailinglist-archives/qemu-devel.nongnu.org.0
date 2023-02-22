Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E254369FCFA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 21:27:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUvhz-0001Lw-Ls; Wed, 22 Feb 2023 15:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUvhv-0001Lf-6d
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:27:19 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUvht-0003Xu-EQ
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:27:18 -0500
Received: by mail-pl1-x641.google.com with SMTP id e9so5234754plh.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 12:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u3suQTQejdVMmbjkJadON+zQIkamwSCOXsDJZNZWV70=;
 b=STVbDD+TtKJtIVNtovsHNKlAfOVLilM10IHNfsDlafaoxN0FxJlYOT8suwchN27Efo
 pGmFIK8p8J1zDVMTO6LusJPPxu/bpjhYP9TRXKNoQuTefJW5cPJsftgUjnlJaqCNwrMZ
 ntzD6EM4thXmsXjZIMp8+v/lXlFIK/L6egQjdlLQk5+RXw61b8tD4SLy1QeiNLYVyz1H
 ddQwcV+Kmf4Ote23iJOViFkO0dq+Y9n/nJ8u5KSZCKYwgXGTeKkR8QrtR76wErpPi5Yp
 yAjEjJwd2zBXo7twgyCKSG7Y9tMQmumZjiXO6ZTkSXNjIXAkfuIIReqWloXvYiar/P9Z
 iv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u3suQTQejdVMmbjkJadON+zQIkamwSCOXsDJZNZWV70=;
 b=i0RsROHa6b1giA8+uFAk38akaRtib/t2mkE/kJHjMHuFzvwtLWfhgwP/RgZ415O/1A
 +67MQ1L1T5k9Om3vS5Kbu6UobQasJqlBwQbD17RA1omLTa3/TOH39BK7vajkhhxIhRe6
 BM+EeTV8Gsc3Nf/jQYECgXYpaAGVwV4entuwTQ/loBfvqSXDvUbSwoMqcSItcaThYai+
 jYn3DvyybfFR1QF2phuHz32jKzaCZEHDatXsgeCvYWQhLNjS1ZP59IsXhYu7+xcVfq9c
 PIKVnNu4hYBeOPeOZuUAXlUeKAo8NEPyRUkVWxWWqQ59ju1K1GrPssZqv7p0HVGgXN1j
 aHeA==
X-Gm-Message-State: AO0yUKW0J54Jv0hY9eH4E1yZApeeMwclWDoEdrXxjGwneWpNAqvPv9mC
 KkXzGkPyY5fgFmQCc5pYeq9gfw==
X-Google-Smtp-Source: AK7set995nRzSUSDIF2Yk2pB4seoqtKCtNwDT5lRtuOoglk7lZ0GpEtHI6PwpZfL3OFbcZpb5yx+mQ==
X-Received: by 2002:a05:6a20:442a:b0:c7:6475:4882 with SMTP id
 ce42-20020a056a20442a00b000c764754882mr10489091pzb.2.1677097635775; 
 Wed, 22 Feb 2023 12:27:15 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 e21-20020a656795000000b00502f017657dsm560501pgr.83.2023.02.22.12.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 12:27:15 -0800 (PST)
Message-ID: <82e90bc7-8883-62f2-a6a1-9b90e032c667@linaro.org>
Date: Wed, 22 Feb 2023 10:27:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/7] target/arm: v8.3 PAC ID_AA64ISAR[12]
 feature-detection
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-2-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-2-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/22/23 09:35, Aaron Lindsay wrote:
> +static inline bool isar_feature_aa64_pauth_arch_qarma3(const ARMISARegisters *id)
> +{
> +    /*
> +     * Return true if pauth is enabled with the architected QARMA3 algorithm.
> +     * QEMU will always set APA3+GPA3 to the same value.
> +     */

This language isn't quite right, since GPA3 only defines values 0 and 1.
Perhaps "to the same result"?

> +static inline uint8_t isar_feature_pauth_get_features(const ARMISARegisters *id)

'int' is a better generic result, as 'uint8_t' is 'unsigned char' to the debugger and 
generally printed as such.

> +    if (isar_feature_aa64_pauth_arch_qarma5(id))
> +        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA);
> +    else if (isar_feature_aa64_pauth_arch_qarma3(id))
> +        return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3);
> +    else
> +        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, API);

Braces with if+else, always.

That said, exactly one of these fields is allowed to be non-zero, so we can just 
unconditionally OR them all together.

> +static inline bool isar_feature_aa64_pauth_epac(const ARMISARegisters *id)
> +{
> +    /*
> +     * Note that unlike most AArch64 features, EPAC is treated (in the ARM
> +     * psedocode, at least) as not being implemented by larger values of this
> +     * field. Our usage of '>=' rather than '==' here causes our implementation
> +     * of PAC logic to diverge slightly from ARM pseudocode.
> +     */

I find this comment scary -- "diverge slightly"?

All I need is once sentence to indicate how this is mitigated (by testing pauth2 first 
where required?), or "See function_foo" (where there is more commentary), or something.

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 72b37b7cf1..448ebf8301 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8028,11 +8028,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                 .access = PL1_R, .type = ARM_CP_CONST,
>                 .accessfn = access_aa64_tid3,
>                 .resetvalue = cpu->isar.id_aa64isar1 },
> -            { .name = "ID_AA64ISAR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +            { .name = "ID_AA64ISAR2_EL1", .state = ARM_CP_STATE_AA64,
>                 .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
>                 .access = PL1_R, .type = ARM_CP_CONST,
>                 .accessfn = access_aa64_tid3,
> -              .resetvalue = 0 },
> +              .resetvalue = cpu->isar.id_aa64isar2 },

All the code adding aa64isar2 should be a separate patch.

You've missed initializing it in kvm_arm_get_host_cpu_features and 
hvf_arm_get_host_cpu_features.


r~

