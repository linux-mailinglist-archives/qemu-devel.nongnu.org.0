Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4D8486855
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 18:22:08 +0100 (CET)
Received: from localhost ([::1]:51812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5WSk-0001Js-5d
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 12:22:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5WRM-00085F-Nf
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:20:40 -0500
Received: from [2607:f8b0:4864:20::62c] (port=45615
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5WRI-000802-T8
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:20:38 -0500
Received: by mail-pl1-x62c.google.com with SMTP id s15so2905376plg.12
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 09:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UboDS31gi+6ezClBOANA8GrTYVa4ZNE97bilfoocy74=;
 b=n8ND/Yh2Aeh4upIOJUX6ItnoxdWH4/Fia63ZyKT+f9mMggMYBq+9LfDPbDYY6p6hKX
 zHSrMN2J9ulhYOs6eohgALG0aYLSdzT0x4fN0iTgAuxPFmeiJSW05vwzDiLtmUyDsz9C
 yCWEvtTzuR1o22D1y7a+jpQdXW5LsIpvs3bgtkWYLR6wwLr+p9FDdUDr99Wm984tpH7x
 0ATdeQQYJq/2e/0/o3sYf2qNZtTpVyGUn3jV8kFjk/c7SUjbPtaqt3XosRDBGK9Hp0Hr
 8q3I2+rE3Et28u7+6BdinfGw7WG70PnKcoJy/odrOJJ73K/AeulTRHnqjLQ3PUvXTeHm
 Givw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UboDS31gi+6ezClBOANA8GrTYVa4ZNE97bilfoocy74=;
 b=qjZzX6BcujZmGtkFq86NI+3tl59hosflA1F+t/EXuYfD3QDbGqImc1Cjj0xbGFV093
 S+e7mPa4MZcv23Ku9m9qNT4JTSnrFWvb6ExsE6LRMMHeaxsXZbhkkABi7NlKTxECZE/6
 nxq8arAUmlLQO4XKmzsEoOSaKgKPbuumlr4CrLpV1ZV+DqT/DnVL6ztdO/YyUWMK+E3t
 nb7r58aew4hg0ELoYII/lzL+fvOK6Vq7Qv9VsXzKVyPtBQ/nwinQSacjFoDGcegjfhl8
 mpQV11leW0RetWGRQ1I1UlQ1pqY1xN6wMzt6WblQC3uEOLGYqQ5zxc4HmnK4WluhLO9Q
 f4DQ==
X-Gm-Message-State: AOAM533bTpLYRDpYP31PCq27aIXAt8C4Cly7BK5mIkQC7bpvNcgk49Yf
 c9sW5zLfEHTFrfsYL7nZdfDNvA==
X-Google-Smtp-Source: ABdhPJzlaKrZaIdz6LGH8kAr0gek22yp7m1zrUEHpl6K7zWOYBVHmwMbe6AvXQgA3sBeLh2fKPBozQ==
X-Received: by 2002:a17:90b:198d:: with SMTP id
 mv13mr11366930pjb.182.1641489635507; 
 Thu, 06 Jan 2022 09:20:35 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y3sm2890860pju.37.2022.01.06.09.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 09:20:35 -0800 (PST)
Subject: Re: [PATCH v2] hw/arm/virt: KVM: Enable PAuth when supported by the
 host
To: Marc Zyngier <maz@kernel.org>
References: <20220103180507.2190429-1-maz@kernel.org>
 <c5bedb8e-55e3-877f-31aa-92d59e5aba34@linaro.org>
 <87czl5usvb.wl-maz@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3db95713-2f05-3c70-82b1-7e12c579d3e2@linaro.org>
Date: Thu, 6 Jan 2022 09:20:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87czl5usvb.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 1:16 AM, Marc Zyngier wrote:
>>> +static bool kvm_arm_pauth_supported(void)
>>> +{
>>> +    return (kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_ADDRESS) &&
>>> +            kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
>>> +}
>>
>> Do we really need to have them both set to play the game?  Given that
>> the only thing that happens is that we disable whatever host support
>> exists, can we have "pauth enabled" mean whatever subset the host has?
> 
> The host will always expose either both features or none, and that's
> part of the ABI. From the bit of kernel documentation located in
> Documentation/virt/kvm/api.rst:
> 
> <quote>
> 4.82 KVM_ARM_VCPU_INIT
> ----------------------
> [...]
>          - KVM_ARM_VCPU_PTRAUTH_ADDRESS: Enables Address Pointer authentication
>            for arm64 only.
>            Depends on KVM_CAP_ARM_PTRAUTH_ADDRESS.
>            If KVM_CAP_ARM_PTRAUTH_ADDRESS and KVM_CAP_ARM_PTRAUTH_GENERIC are
>            both present, then both KVM_ARM_VCPU_PTRAUTH_ADDRESS and
>            KVM_ARM_VCPU_PTRAUTH_GENERIC must be requested or neither must be
>            requested.
> 
>          - KVM_ARM_VCPU_PTRAUTH_GENERIC: Enables Generic Pointer authentication
>            for arm64 only.
>            Depends on KVM_CAP_ARM_PTRAUTH_GENERIC.
>            If KVM_CAP_ARM_PTRAUTH_ADDRESS and KVM_CAP_ARM_PTRAUTH_GENERIC are
>            both present, then both KVM_ARM_VCPU_PTRAUTH_ADDRESS and
>            KVM_ARM_VCPU_PTRAUTH_GENERIC must be requested or neither must be
>            requested.
> </quote>
> 
> KVM will reject the initialisation if only one of the features is
> requested, so checking and enabling both makes sense to me.

Well, no, that's not what that says.  It says that *if* both host flags are set, then both 
guest flags must be set or both unset.

It's probably all academic anyway, because I can't actually imagine a vendor implementing 
ADDR and not GENERIC, but in theory we ought to be able to support a host with only ADDR.


r~

