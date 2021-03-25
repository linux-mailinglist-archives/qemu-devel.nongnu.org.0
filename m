Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F306F3499A2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 19:43:16 +0100 (CET)
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPUwt-0006ZR-Dr
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 14:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPUuV-0005az-10
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:40:47 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:39789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPUuP-0006MN-FP
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:40:43 -0400
Received: by mail-oi1-x22f.google.com with SMTP id i81so3130871oif.6
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 11:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N2xAfilXUHBxG3Xwg5PfAIGeH4b53rPpRHpda1PIp/w=;
 b=dbrkjjsJO4Ndea0Wf7GScNDy5EoHRmLRxmDV7L12lsaYm8b73QsB+ntHfpMs8SvH+f
 UPvGJpoIbiTYZw2M4uK32qpDZn8sSCaW/mxvdfvZWeHbeHePwJza2I0ti6uEZ2xis21D
 8RvOSAknqPj73+TfFIb7W7t9vJre3Qr5LmA7k6EhkoLb5fdIaXy1pRofqZY0wTClFsLY
 UhNqRM/tmGcBZyo6IvbkmUftnGtivSMNQsV8rBN04H+iNreh89lj8xhII1h121yKe0Bi
 MaP2kOMdJI7nX+yIdsfz3rD2a27rzfN9eBAu0hhSrvk4QeYvK5G0FR3Z7jSEtkUpqs03
 dhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N2xAfilXUHBxG3Xwg5PfAIGeH4b53rPpRHpda1PIp/w=;
 b=YoySlGmNr2oorIaE9OwBL5Fj8jSPphQjKPctTC3PyqHRszOJO4b71vmPokqt3agfyK
 dfjxz25yvoqyO/Mkyo41niRTfRn9zy+IgNX/xkj6GpNJoNzQ+6OpDz4WdOfW53GkFkMN
 kUBdg1e5rkBgBL0133P2mdkuFePZtLlYgDnuZYKkTfx0B5NGKOXB1igy5SEUpXMUwsSp
 oXulCx9PjO4yEIcROYHE+5mHAgNuxsGhd2xPZo4r87cHmbIQR/qTiVwaqUrZ9E/sl/zL
 6ElAlYel/9qEBYQWYELUJyFOmVdRCuIIGQwwIwElm/AtMtP6jUlfMiBvJMuP9igb3RPC
 hJfA==
X-Gm-Message-State: AOAM533+pEQFwUW4EQ2KfwVrKtdWGsPsFUWTJ/eG7H9xzkMql+8wLLDf
 cXPxAPcJjFnmz5zYck3Y7NXVkQ==
X-Google-Smtp-Source: ABdhPJyVeW4O3A8OJOUR7wQ7KkA1jm7HI+nvs+yoxUut0LMlrwd1szPXvuG5WAaSce6ayDSiE9GvcQ==
X-Received: by 2002:aca:1c18:: with SMTP id c24mr6883464oic.7.1616697640137;
 Thu, 25 Mar 2021 11:40:40 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id j10sm1453456oos.27.2021.03.25.11.40.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 11:40:39 -0700 (PDT)
Subject: Re: [RFC v11 45/55] target/arm: cpu-sve: new module
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-38-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <724c86f8-2275-833b-d4e1-4729c0ca2e80@linaro.org>
Date: Thu, 25 Mar 2021 12:40:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-38-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> extract the SVE-related cpu object properties and functions,
> and move them to a separate module.
> 
> Disentangle SVE from pauth that is a separate, TCG-only feature.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   target/arm/cpu-sve.h     |  40 +++++
>   target/arm/cpu.h         |  22 +--
>   target/arm/cpu-sve.c     | 360 +++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.c         |   5 +-
>   target/arm/cpu64.c       | 333 +-----------------------------------
>   target/arm/kvm/kvm-cpu.c |   2 +-
>   target/arm/meson.build   |   1 +
>   7 files changed, 417 insertions(+), 346 deletions(-)
>   create mode 100644 target/arm/cpu-sve.h
>   create mode 100644 target/arm/cpu-sve.c
> 
> diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
> new file mode 100644
> index 0000000000..b1be575265
> --- /dev/null
> +++ b/target/arm/cpu-sve.h
> @@ -0,0 +1,40 @@
> +/*
> + * QEMU AArch64 CPU SVE Extensions for TARGET_AARCH64
> + *
> + * Copyright (c) 2013 Linaro Ltd
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see
> + * <http://www.gnu.org/licenses/gpl-2.0.html>
> + */
> +
> +#ifndef CPU_SVE_H
> +#define CPU_SVE_H
> +
> +/* note: SVE is an AARCH64-only option, only include this for TARGET_AARCH64 */
> +
> +/* called by arm_cpu_finalize_features in realizefn */
> +void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);
> +
> +/* add the CPU SVE properties */
> +void cpu_sve_add_props(Object *obj);
> +
> +/* add the CPU SVE properties specific to the "MAX" CPU */
> +void cpu_sve_add_props_max(Object *obj);
> +
> +/* In AArch32 mode, predicate registers do not exist at all.  */
> +typedef struct ARMPredicateReg {
> +    uint64_t p[DIV_ROUND_UP(2 * ARM_MAX_VQ, 8)] QEMU_ALIGNED(16);
> +} ARMPredicateReg;

I don't agree with moving this out of cpu.h, next to the rest of the vector 
definitions.

I agree that we should be using more files, but if we're going to have an 
cpu-sve.c, why did some of the sve functions go into cpu-common.c?

I don't agree with moving functions and renaming them simultaneously.  I'm not 
even sure why you're renaming them, or why you've suddenly chosen "cpu_sve_*" 
as the prefix to use.


r~

