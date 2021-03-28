Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D7E34BDCB
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 19:51:46 +0200 (CEST)
Received: from localhost ([::1]:48520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQZZh-0002p3-Hd
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 13:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZUX-0000gy-Nu
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:46:27 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:37427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZUU-0000tB-QY
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:46:25 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so10138267otr.4
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 10:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ch9dls9xMFeb53gaBxGprDtOp9/CEiq5nyEj5O4uhHk=;
 b=WDoiQs35Ter9WS915/lNH//TvSPRLYy2HJXPVwQ7vGK808btvpYY/68ktEC1GICXHF
 TTqUa3sTr/jntY7qcRo9JzwIHVTj7NIwF8h2Mr+K350r+zIEbB1V13shwKhc16S9/0Ys
 R7Clszp81awbno+FYvuZYr1AnGVoBq3EZ/JHeDDUH2ZAlkwKTDqg5B484yb3vhuynNPI
 9DOHDkYM8/d0HwBGgtNgYM6n/Kg7rlej5G9hw2ejEYtDTHSXQ/kMigi2bG7NAZZ2XMfq
 lyMDRxgLxTqy+0bf/TEnOzxQyDnmkJYGfSKXcH2GgrdNpvTC+Ch5zUCgdH7IM2W1sQ1o
 FRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ch9dls9xMFeb53gaBxGprDtOp9/CEiq5nyEj5O4uhHk=;
 b=ilWHXi0yJZccddD3OUM3q6YYnvKs0118EXeYAIa3GBIyt9dHwv+fQzC9QFltXyAcpB
 gmK6zhDskI7zXCnCt7Cu4gYVChuzmUNOI2C/D5JppnCezULLMs97HR8XJX3aDRasSW90
 hQE2Ea/hECFUZuswsqDcnqnstfEMv5JE9OazFrISiNKymi3TsWX104LXHwvfNr2CYgnz
 YFb4G82kfvU/azwz3MUXcuJBiY/U/GieJwKuuNYdD8MegpKXDn1UTHiQXO1DqKes/IN+
 bygZRY3YYBXrIPAs5D+Mp+JaWJdsB7luanBNsZ39z1mDR3bHIfHk+A/i7lmbgbamqsGg
 OAng==
X-Gm-Message-State: AOAM531Fm3+y101YMDL280SX7lfUkDpOUFn+lxm5noMZyn4VXXwp+otr
 H1Lh+1ghq9JhapmYviBLFt/NDg==
X-Google-Smtp-Source: ABdhPJyF2k7i49f1nyTj1DXvcEYnnmzx/bNpZGe3a/BYn4qDFcimBobgwmCJFRpfU0bPh69bjKGsjQ==
X-Received: by 2002:a05:6830:204e:: with SMTP id
 f14mr9012880otp.38.1616953581483; 
 Sun, 28 Mar 2021 10:46:21 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id r2sm3739845otk.55.2021.03.28.10.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 10:46:21 -0700 (PDT)
Subject: Re: [RFC v12 46/65] target/arm: create kvm cpu accel class
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-47-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f1b69909-286d-6afa-4b39-e49bf921cd01@linaro.org>
Date: Sun, 28 Mar 2021 11:46:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-47-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> move init, realizefn and reset code into it.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   target/arm/internals.h     |   1 -
>   target/arm/cpu-sysemu.c    |  32 ----------
>   target/arm/cpu.c           |  48 ++------------
>   target/arm/kvm/kvm-cpu.c   | 128 +++++++++++++++++++++++++++++++++++++
>   target/arm/kvm/meson.build |   1 +
>   5 files changed, 136 insertions(+), 74 deletions(-)
>   create mode 100644 target/arm/kvm/kvm-cpu.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +static void host_cpu_instance_init(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    kvm_arm_set_cpu_features_from_host(cpu);
> +    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> +        aarch64_add_sve_properties(obj);
> +    }
> +    arm_cpu_post_init(obj);
> +}

Note for another patch: ARM_FEATURE_AARCH64 is always true for kvm, because 
we've already deprecated and removed 32-bit kvm.  This is a fossil check.


r~

