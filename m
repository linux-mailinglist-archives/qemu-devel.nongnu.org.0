Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C6A66E71D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 20:38:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHrmL-0006Vc-0C; Tue, 17 Jan 2023 14:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHrmJ-0006VE-58
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 14:37:51 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHrmH-0000Tx-GB
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 14:37:50 -0500
Received: by mail-pf1-x42d.google.com with SMTP id 20so18960139pfu.13
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 11:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eh5fgoocbdbY9QY3UdCKSmuuIr/thlgxwnXp5dQZBHA=;
 b=dPyGE1COVGOI2KxD4ZLRpUmZW5v859qkiMT9GvN9GjTLLr2HXvcvIzdCz+65WF/+hc
 GwKOx2pfkRRPRPFbo1NhDhnPtvwv8c57ySRFvlbSLtCmAcGyV8cK2uIv1akauf2ioUQb
 B5dC6Gwlk8iBjl3QS7sP3NdrFnJTR/ZvyBuXEf0vQN4TGZME4HMFDh5W05eFPRL5gya7
 JNZUzS2z8spJybYAQhNsqiqcSfhEl/3LGQ7XGkHbGxBFS5LY46e9W5IyZifzJ+Ipx5Dc
 7Kke/y2GOvvihori32lT7k7XBMlVabnhfOz42NjRhB7YB0LGgLN+KN4La6AHIDYgrF91
 OA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eh5fgoocbdbY9QY3UdCKSmuuIr/thlgxwnXp5dQZBHA=;
 b=ItEBMM810qw6m8cRKgz950jMefqDpbhhmD4nvcSsknI3baVnx5iK/uMM1JCx8IHbwT
 vEDiSFJZa9RKzBs19jW26nI11j97CCygJX+CBgKCrmVo5PivGlGcYe9K2oqj8nEoepiG
 LMxkcQqr11NmtngG8eN0vjUCcrVjhfzRWktHVzgPNMlAfx76yXC585sfWnMSmcmzCG7W
 QjA7GOSBdU5am/jYYnQC7mUR2LEvo/hdAcam8MPZj4oCMKcoPzL2oGhIllPzN9MNKoKn
 7er+cNk7bkNoQM6ycsgxEljgnx/CYCcKA+vfBpKfRaL6dtJLnjRGoEXbBtGtK74t7VHY
 bC3w==
X-Gm-Message-State: AFqh2kr4CrSsWkEZI65/D3hLbHqe0NKRyq0CuQuYrjjvcqerhPyaHPTJ
 ITwNercMxSOHlN+HpGbw9lFSxQ==
X-Google-Smtp-Source: AMrXdXurGCNa2kIZ/S8QBvJlh8tXJdzBhwqU28rWYvwv+xXz++U+mQeB6H6I0y/IAho5jjXl+xswoA==
X-Received: by 2002:a05:6a00:705:b0:58b:ca40:cd03 with SMTP id
 5-20020a056a00070500b0058bca40cd03mr4808468pfl.15.1673984267715; 
 Tue, 17 Jan 2023 11:37:47 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 o189-20020a62cdc6000000b0058baa6586f3sm9512207pfg.135.2023.01.17.11.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 11:37:47 -0800 (PST)
Message-ID: <b92e6786-acc6-50ef-8804-e4e3ef4eb2d6@linaro.org>
Date: Tue, 17 Jan 2023 09:37:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 1/2] arm/kvm: add support for MTE
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Gavin Shan <gshan@redhat.com>
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-2-cohuck@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230111161317.52250-2-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 1/11/23 06:13, Cornelia Huck wrote:
> @@ -2136,7 +2136,7 @@ static void machvirt_init(MachineState *machine)
>   
>       if (vms->mte && (kvm_enabled() || hvf_enabled())) {
>           error_report("mach-virt: %s does not support providing "
> -                     "MTE to the guest CPU",
> +                     "emulated MTE to the guest CPU",
>                        kvm_enabled() ? "KVM" : "HVF");

Not your bug, but noticing this should use current_accel_name().

> +static inline bool arm_machine_has_tag_memory(void)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    Object *obj = object_dynamic_cast(qdev_get_machine(), TYPE_VIRT_MACHINE);
> +
> +    /* so far, only the virt machine has support for tag memory */
> +    if (obj) {
> +        VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +        return vms->mte;
> +    }
> +#endif
> +    return false;
> +}

True for CONFIG_USER_ONLY, via page_get_target_data().
You should have seen check-tcg test failures...

> +void arm_cpu_mte_finalize(ARMCPU *cpu, Error **errp)
> +{
> +    bool enable_mte;
> +
> +    switch (cpu->prop_mte) {
> +    case ON_OFF_AUTO_OFF:
> +        enable_mte = false;
> +        break;
> +    case ON_OFF_AUTO_ON:
> +        if (!kvm_enabled()) {

tcg_enabled(), here and everywhere else you test for !kvm.

> +#ifdef CONFIG_KVM
> +        if (kvm_enabled() && !kvm_arm_mte_supported()) {

kvm_arm.h should get a stub inline returning false, so that the ifdef is removed.
See e.g. kvm_arm_sve_supported().

> +    default: /* AUTO */
> +        if (!kvm_enabled()) {

tcg_enabled.

> +    /* accelerator-specific enablement */
> +    if (kvm_enabled()) {
> +#ifdef CONFIG_KVM
> +        if (kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0)) {
> +            error_setg(errp, "Failed to enable KVM_CAP_ARM_MTE");

Ideally this ifdef could go away as well.

> +        } else {
> +            /* TODO: add proper migration support with MTE enabled */
> +            if (!mte_migration_blocker) {

Move the global variable here, as a local static?

I guess this check is to avoid adding one blocker per cpu?
I would guess the cap doesn't need enabling more than once either?


> +                error_setg(&mte_migration_blocker,
> +                           "Live migration disabled due to MTE enabled");
> +                if (migrate_add_blocker(mte_migration_blocker, NULL)) {

You pass NULL to the migrate_add_blocker errp argument...

> +                    error_setg(errp, "Failed to add MTE migration blocker");

... then make up your own generic reason for why it failed.
In this case it seems only related to another command-line option: --only-migratable.


Anyway, I wonder about hiding all of this in target/arm/kvm.c:

bool kvm_arm_enable_mte(Error *errp)
{
     static bool once = false;
     Error *blocker;

     if (once) {
         return;
     }
     once = true;

     if (kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0)) {
         error_setg_errno(errp, "Failed to enable KVM_CAP_ARM_MTE");
         return false;
     }

     blocker = g_new0(Error);
     error_setg(blocker, "Live migration disabled....");
     return !migrate_add_blocker(blocker, errp);
}

with

static inline bool kvm_arm_enable_mte(Error *errp)
{
     g_assert_not_reached();
}

in the !CONFIG_KVM block in kvm_arm.h.



