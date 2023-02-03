Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5161C68A3AD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 21:41:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO2rI-00074b-UE; Fri, 03 Feb 2023 15:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO2rG-00072a-FE
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 15:40:30 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO2rE-00058K-PI
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 15:40:30 -0500
Received: by mail-pg1-x52a.google.com with SMTP id s13so2802982pgc.10
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 12:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iFvsZqbjjVzhb8kzRNmM+lxgUxdxU/8TitpFjwGLNtE=;
 b=KYuj2w8CKAesNyc7VyMnGHaBm+iR+aSX+oHeoOaBBbXpN9qKlOMAsAbvCzi9t8mD92
 G4hwpk4PLuIOlxL6FL2/JcEiAYVxbYj5Cj8wqyifcW2S1S1lLS3PNbiuL0NpFS1gNw34
 4NmjfwNRymhgc9beWyeXQooQp62xEkzv3xrFfSGjtQNPrb2zSZ+o0f01qAn71vw/QE9D
 auN3BzEdrN5pkYVCdILnH7wTueURHZsvbCZLLVXESHJQiM50r9JT8Tty5Eik+pQbcXOD
 tXMlC98ou7N9EhDfqSH5RQMA9DCDfaQQJ29+KiixsHWHhQ84CYKZQPlfUTYiP5HsvVh8
 3ykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iFvsZqbjjVzhb8kzRNmM+lxgUxdxU/8TitpFjwGLNtE=;
 b=Zd4KUEEk2thvKQq7UCUJg1TiwZB/BRrWwpWkJJbV13DIMGMiUrrNwLyJTmG7ecGyuv
 qannFhJRbs63jXZSLKL8IoT+utBxN+zhmO3t7+1/2oGqQiHgYA5E3TO0P5Hhav9BpeBC
 3fh1S0bYOsidoEnIGdrzANV8uBB8Q70801TFsH4rjRaw5ckTIBQUnjelqEHSraC147yg
 nNWfQ5rK1qUfqoFn1mA6kpMa0qE6hJ/ppMiVfE0hCT16d9vtyKam2rRSRSOveNRMD6GR
 4h6TL5Ht/z66u83YbRhZpwBuwy/r885yVQu6+8m2CqSiPNhM7ctxdE9pzq5JBwg41ta7
 +7QA==
X-Gm-Message-State: AO0yUKVTI3MnVNHh9L3UU1PF2DtkfloJyRbeLs3AMKpj8RxlpMMCS1cG
 IgzjnhGvIXfQ1286iPXccKkDtg==
X-Google-Smtp-Source: AK7set+oKr3PH7PpRoEB8NGtNLgBY3W0/iicckGJhN07iFZ23T6jCoOVn2siLGd+mB7058mDkCU+4Q==
X-Received: by 2002:a62:e509:0:b0:583:2971:df8b with SMTP id
 n9-20020a62e509000000b005832971df8bmr10291206pff.20.1675456827094; 
 Fri, 03 Feb 2023 12:40:27 -0800 (PST)
Received: from [192.168.50.177] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 s25-20020aa78bd9000000b00581d62be96dsm2227683pfd.197.2023.02.03.12.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 12:40:26 -0800 (PST)
Message-ID: <da118de5-adcd-ec0c-9870-454c3741a4ab@linaro.org>
Date: Fri, 3 Feb 2023 10:40:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 2/3] arm/kvm: add support for MTE
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Gavin Shan <gshan@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-3-cohuck@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230203134433.31513-3-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/3/23 03:44, Cornelia Huck wrote:
> +static void aarch64_cpu_get_mte(Object *obj, Visitor *v, const char *name,
> +                                void *opaque, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    OnOffAuto mte = cpu->prop_mte;
> +
> +    visit_type_OnOffAuto(v, name, &mte, errp);
> +}

You don't need to copy to a local variable here.

> +
> +static void aarch64_cpu_set_mte(Object *obj, Visitor *v, const char *name,
> +                                void *opaque, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    visit_type_OnOffAuto(v, name, &cpu->prop_mte, errp);
> +}

... which makes get and set functions identical.
No need for both.

> +static inline bool arm_machine_has_tag_memory(void)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    Object *obj = object_dynamic_cast(qdev_get_machine(), TYPE_VIRT_MACHINE);
> +
> +    /* so far, only the virt machine has support for tag memory */
> +    if (obj) {
> +        VirtMachineState *vms = VIRT_MACHINE(obj);

VIRT_MACHINE() does object_dynamic_cast_assert, and we've just done that.

As this is startup, it's not the speed that matters.  But it does look unfortunate.  Not 
for this patch set, but perhaps we ought to add TRY_OBJ_NAME to DECLARE_INSTANCE_CHECKER?

> +void arm_cpu_mte_finalize(ARMCPU *cpu, Error **errp)
> +{
> +    bool enable_mte;
> +
> +    switch (cpu->prop_mte) {
> +    case ON_OFF_AUTO_OFF:
> +        enable_mte = false;
> +        break;
> +    case ON_OFF_AUTO_ON:
> +        if (tcg_enabled()) {
> +            if (cpu_isar_feature(aa64_mte, cpu)) {
> +                if (!arm_machine_has_tag_memory()) {
> +                    error_setg(errp, "mte=on requires tag memory");
> +                    return;
> +                }
> +            } else {
> +                error_setg(errp, "mte not supported by this CPU type");
> +                return;
> +            }
> +        }
> +        if (kvm_enabled() && !kvm_arm_mte_supported()) {
> +            error_setg(errp, "mte not supported by kvm");
> +            return;
> +        }
> +        enable_mte = true;
> +        break;

What's here is not wrong, but maybe better structured as

	enable_mte = true;
         if (qtest_enabled()) {
             break;
         }
         if (tcg_enabled()) {
             if (arm_machine_tag_mem) {
                 break;
             }
             error;
             return;
         }
         if (kvm_enabled() && kvm_arm_mte_supported) {
             break;
         }
         error("mte not supported by %s", current_accel_type());
         return;

We only add the property for tcg via -cpu max, so the isar check is redundant.


r~

