Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0B868BD8B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 14:11:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP1GW-0003j6-0X; Mon, 06 Feb 2023 08:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pP1GO-0003TE-Ga
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:10:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pP1GL-0008C5-T0
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:10:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675689025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ueZ4lJNVVaAm6E2RadB+Higp5mUiTZD8EnTQrCVDZNw=;
 b=YyckfplmtrFTlg5Tqnw0TQ0GsozfHxMRwyzHMWxzAjX32nKJ6B9JdTHbCpbMcMQZ8mhFRy
 J21CVX6jmxlKViTHJ/jQY4NsQMSMez9DvUopCtitvMWG5bTBuSttGZ731FR9G9n8xao4wx
 hVBqIIcaRoiQKOrn4i7c9Kl8mx4JBrY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-Hd0YBDNiMha1xQiVO_WBBg-1; Mon, 06 Feb 2023 08:10:23 -0500
X-MC-Unique: Hd0YBDNiMha1xQiVO_WBBg-1
Received: by mail-qt1-f198.google.com with SMTP id
 z12-20020ac8710c000000b003b829a0eda2so6484590qto.21
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 05:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ueZ4lJNVVaAm6E2RadB+Higp5mUiTZD8EnTQrCVDZNw=;
 b=mLILZnOC+rE0SUnthg5Xo9mflt75EOsoL+ZUvmjmrjo8NnbwoBaHTPg0pKsSrV17m1
 EwsW9c+WxLvwEzdJB7F9zw4P6hupEySiqRwHmGcOPOLgUjpWKppQWXl5yuesG5PhBROh
 T46TTdRdJgLBquwskXW++CNukd1PmHNeHXayKhvIXmLtXcOYcrd0cloLvTBIsgg8tOPJ
 lYji8MZ7KxMA/8GwbNDLRPxRPUhF0EEeYUGLKgTLOvKvNp0MqMiblsX95s4oFti/emdM
 h7aRK7RMXAopWD8H2MJ69STVHXZYMFi2QKJCR5hzaTwnqBpF18BaugfAmesY5NcGd9kA
 2Bhg==
X-Gm-Message-State: AO0yUKVNGYWkMwGMIvBaX15SxPlilsm4NAF+Wp39Q+kfRe7gs9cQ+tSU
 PNDgI8/+H3do26pUNs4Gci6yN9WTld/d8eiaLDs9qcL6lA1639azS10NM5C1UHL5GYWD29tVrZ+
 CitSABVJpEZ2Zg9s=
X-Received: by 2002:a05:622a:1006:b0:3ba:1360:ec0a with SMTP id
 d6-20020a05622a100600b003ba1360ec0amr12700690qte.41.1675689023203; 
 Mon, 06 Feb 2023 05:10:23 -0800 (PST)
X-Google-Smtp-Source: AK7set/UnmAPcrXR3j+0mFEcIiQLc90TbCFnoszKGV4JDMYWVgMMAHz+UX7Yp11ERyM1ZwSnQhgE5w==
X-Received: by 2002:a05:622a:1006:b0:3ba:1360:ec0a with SMTP id
 d6-20020a05622a100600b003ba1360ec0amr12700662qte.41.1675689022948; 
 Mon, 06 Feb 2023 05:10:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 b1-20020ac87fc1000000b003b9ba2cf068sm7267520qtk.56.2023.02.06.05.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 05:10:22 -0800 (PST)
Message-ID: <071ec3a6-cb4b-0dac-87fd-f3c3d00b5e83@redhat.com>
Date: Mon, 6 Feb 2023 14:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 2/3] arm/kvm: add support for MTE
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-3-cohuck@redhat.com>
 <da118de5-adcd-ec0c-9870-454c3741a4ab@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <da118de5-adcd-ec0c-9870-454c3741a4ab@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi,

On 2/3/23 21:40, Richard Henderson wrote:
> On 2/3/23 03:44, Cornelia Huck wrote:
>> +static void aarch64_cpu_get_mte(Object *obj, Visitor *v, const char
>> *name,
>> +                                void *opaque, Error **errp)
>> +{
>> +    ARMCPU *cpu = ARM_CPU(obj);
>> +    OnOffAuto mte = cpu->prop_mte;
>> +
>> +    visit_type_OnOffAuto(v, name, &mte, errp);
>> +}
> 
> You don't need to copy to a local variable here.
> 
>> +
>> +static void aarch64_cpu_set_mte(Object *obj, Visitor *v, const char
>> *name,
>> +                                void *opaque, Error **errp)
>> +{
>> +    ARMCPU *cpu = ARM_CPU(obj);
>> +
>> +    visit_type_OnOffAuto(v, name, &cpu->prop_mte, errp);
>> +}
> 
> ... which makes get and set functions identical.
> No need for both.
This looks like a common pattern though. virt_get_acpi/set_acpi in
virt.c or pc_machine_get_vmport/set_vmport in i386/pc.c and many other
places (microvm ...). Do those other callers also need some simplifications?

Eric
> 
>> +static inline bool arm_machine_has_tag_memory(void)
>> +{
>> +#ifndef CONFIG_USER_ONLY
>> +    Object *obj = object_dynamic_cast(qdev_get_machine(),
>> TYPE_VIRT_MACHINE);
>> +
>> +    /* so far, only the virt machine has support for tag memory */
>> +    if (obj) {
>> +        VirtMachineState *vms = VIRT_MACHINE(obj);
> 
> VIRT_MACHINE() does object_dynamic_cast_assert, and we've just done that.
> 
> As this is startup, it's not the speed that matters.  But it does look
> unfortunate.  Not for this patch set, but perhaps we ought to add
> TRY_OBJ_NAME to DECLARE_INSTANCE_CHECKER?
> 
>> +void arm_cpu_mte_finalize(ARMCPU *cpu, Error **errp)
>> +{
>> +    bool enable_mte;
>> +
>> +    switch (cpu->prop_mte) {
>> +    case ON_OFF_AUTO_OFF:
>> +        enable_mte = false;
>> +        break;
>> +    case ON_OFF_AUTO_ON:
>> +        if (tcg_enabled()) {
>> +            if (cpu_isar_feature(aa64_mte, cpu)) {
>> +                if (!arm_machine_has_tag_memory()) {
>> +                    error_setg(errp, "mte=on requires tag memory");
>> +                    return;
>> +                }
>> +            } else {
>> +                error_setg(errp, "mte not supported by this CPU type");
>> +                return;
>> +            }
>> +        }
>> +        if (kvm_enabled() && !kvm_arm_mte_supported()) {
>> +            error_setg(errp, "mte not supported by kvm");
>> +            return;
>> +        }
>> +        enable_mte = true;
>> +        break;
> 
> What's here is not wrong, but maybe better structured as
> 
>     enable_mte = true;
>         if (qtest_enabled()) {
>             break;
>         }
>         if (tcg_enabled()) {
>             if (arm_machine_tag_mem) {
>                 break;
>             }
>             error;
>             return;
>         }
>         if (kvm_enabled() && kvm_arm_mte_supported) {
>             break;
>         }
>         error("mte not supported by %s", current_accel_type());
>         return;
> 
> We only add the property for tcg via -cpu max, so the isar check is
> redundant.
> 
> 
> r~
> 


