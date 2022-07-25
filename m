Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012B4580104
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:52:33 +0200 (CEST)
Received: from localhost ([::1]:46522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFzRe-0005Qz-QT
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFzLU-0007Qf-JZ
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:46:08 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:44698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFzLR-0006jl-Gx
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:46:08 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 n10-20020a17090a670a00b001f22ebae50aso10483191pjj.3
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 07:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TR8fQnvf2UdaZzfh1X4YhDMo/Yee0UcQMWrsCMSUBFg=;
 b=Yj3O2XlLpED6TcDrDRe3UWR8e5QVNHMUCsyaisZIV7BTxotmmL7vvwBqZNmqYoJlv2
 BZkEb/XBbJsbxqArR140b+y0gzC4rLhFXzoFn/eTRGZkunIxzhP8OPvZtkywoglpVBJs
 FiD1fZzO+u6qZGnTU3W42jefNIyiDygRo4vyWGgYCodKAMapDChlWFXb+619bRm8+luC
 xp6j+znqQYOcC1ggkaGmlo43kOYRZaJjgyiM0jhHzN5z17Fx9zIohgQE+7wNTRQdTS4T
 HWRykSsl1+Q3Mj2mu5Owj7C3HtAWrZBvsE4qMYEDCeXi6WGQXh4k7Ly9k0s4p6bFAC2u
 y74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TR8fQnvf2UdaZzfh1X4YhDMo/Yee0UcQMWrsCMSUBFg=;
 b=abiV15vn1QpNxITfwuwzMQ1QZF6puxI/8uHDpk28EZNLlIGhoaFL+5aOxrJ9NRP/gg
 7ZOrrShpqxH8+Di7mO+h2rrqMDhh7xGbnMpAuqhfCpUJuz5aKqZK3vqvEfiilugit0V3
 WM3Tl0UeixkXhTgQbrsGCQXxAdyCGgtdIva8W4FfJJjQNI+OXaAoLmW+eJ8fM1UAXLmC
 7mTT3Z1AC2qKMHLPcr/qY0fdVnOBVf4wXh2oo+5F/iDzpeRcQOf2iskIMhG1F0o/ilVE
 HQ/FRB0qyPVR/qjBwpACN2IPFLQn+GwvGShFk/Pu5/S58gGt7FptLeFWs8l1j3gQher6
 VrwA==
X-Gm-Message-State: AJIora9vqROZroQFsYe3MEOBCBXcW12KXIOCusXvonHKo16c8/cFNxFd
 Bf6X8tXBo2MLT8XysJUV6k28yA==
X-Google-Smtp-Source: AGRyM1swAbiFDWJsqcMzidfoRz7fN9yCQECC1dIYq2ioTPtok6nlTUXyiKgSgAFxsSpzr0s56jDG2A==
X-Received: by 2002:a17:90a:4402:b0:1f2:3507:5f96 with SMTP id
 s2-20020a17090a440200b001f235075f96mr14508130pjg.22.1658760363892; 
 Mon, 25 Jul 2022 07:46:03 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:30c1:2484:a853:233d?
 ([2602:ae:1549:801:30c1:2484:a853:233d])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a170902ce0c00b0016c46ff9741sm9309332plg.67.2022.07.25.07.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 07:46:03 -0700 (PDT)
Message-ID: <2d957926-ef9c-eae5-d78f-3acc04d047cb@linaro.org>
Date: Mon, 25 Jul 2022 07:46:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 01/92] target/arm: Add ID_AA64ZFR0 fields and
 isar_feature_aa64_sve2
Content-Language: en-US
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, andrew.jones@linux.dev
References: <20210525010358.152808-1-richard.henderson@linaro.org>
 <20210525010358.152808-2-richard.henderson@linaro.org>
 <8e2ac59a-af4d-0f2c-455b-b9ed07b1e56a@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8e2ac59a-af4d-0f2c-455b-b9ed07b1e56a@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/25/22 00:05, Zenghui Yu wrote:
>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>> index dff85f6db9..37ceadd9a9 100644
>> --- a/target/arm/kvm64.c
>> +++ b/target/arm/kvm64.c
>> @@ -647,17 +647,26 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>
>>      sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
>>
>> -    kvm_arm_destroy_scratch_host_vcpu(fdarray);
>> -
>> -    if (err < 0) {
>> -        return false;
>> -    }
>> -
>>      /* Add feature bits that can't appear until after VCPU init. */
>>      if (sve_supported) {
>>          t = ahcf->isar.id_aa64pfr0;
>>          t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
>>          ahcf->isar.id_aa64pfr0 = t;
>> +
>> +        /*
>> +         * Before v5.1, KVM did not support SVE and did not expose
>> +         * ID_AA64ZFR0_EL1 even as RAZ.  After v5.1, KVM still does
>> +         * not expose the register to "user" requests like this
>> +         * unless the host supports SVE.
>> +         */
>> +        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
>> +                              ARM64_SYS_REG(3, 0, 0, 4, 4));
> 
> If I read it correctly, we haven't yet enabled SVE for the scratch vcpu
> (using the KVM_ARM_VCPU_INIT ioctl with KVM_ARM_VCPU_SVE). KVM will
> therefore expose ID_AA64ZFR0_EL1 to userspace as RAZ at this point and
> isar.id_aa64zfr0 is reset to 0. I wonder if it was intentional?

You are correct, this is a bug.  It appears this is hidden because nothing else actually 
depends on the value within the context of --accel=kvm, e.g. migration.


r~

