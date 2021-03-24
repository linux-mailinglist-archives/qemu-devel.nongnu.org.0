Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCEB3479D5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 14:45:58 +0100 (CET)
Received: from localhost ([::1]:54048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP3pd-0001m8-6Y
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 09:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP3o7-0001Lr-Vf
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:44:23 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34]:38576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP3o6-0004g8-8t
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:44:23 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 n12-20020a4ad12c0000b02901b63e7bc1b4so5823737oor.5
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 06:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oJKtGhoxrn9ZlgPv9SAlh2Z6RjYrz0QiZAr6FcjbdIA=;
 b=NVoUsBuJDugofpSzx0jodJsJYiSsSCzx4Sb68VSXWR7pj2DgVOg96y5DzhnuBjDXp0
 W+qz2EDg8B5k9CRWOiv1mXIqs/DRzWyupwrcYQ02SmWhU0qRHlwvLu1Uc1r4xOERI67Z
 ggm0ApMjjMqfsqHDJNDrpN8mZJ7Cmr9PSd/6SMcwnewTQGTI+hoYskmgjwyJNg6fyfC8
 hozhbVDyeHBXnwG6n6N5cttvq5vVn/sEh25yoLXxb/LNmIdgVGncJOdIDUIVM6W5zdKF
 GktUqfJM5qlUTn0IyumhzocTHCcEIsVzkTzrthRCsbJ1YSyH1h5Fq72afqv09TejG6NT
 6qcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oJKtGhoxrn9ZlgPv9SAlh2Z6RjYrz0QiZAr6FcjbdIA=;
 b=INVqCAJRGlEuMW1rAxP1HI6NP1egjF0+A4LX7gh4YMGvCu9chMAPqbXaQFbBCNg4w2
 MKGEFfV93elXUNdsv4nVenE9hW75/bFwumoZ6CN+Wg+wFCpdibX3wIFduhGN0ZVS8KNc
 /hugymvFb9/VXxNmdlAzHFELcj8tTW3yTFMrIv91ZcZAfainUIZ5dQmIaIXofrb6hwRQ
 8kGQw5bvnHmRX09DX99YTeA34y0/UtyepH3AS/57nioiRN/ZnqCYofCoIUr+IptzOVHh
 n4TYxVFZK0StBv6X4QLcGxA0XR7ts2YO6PsuBU7eUxtadhuFtyg9pLzVnd0N5Zvra1Zv
 YreQ==
X-Gm-Message-State: AOAM5316xAR6TDfubrh2jPpT/LgqPXdAw+sLJKaZnYpGkeVHQaNfmniI
 UrEd+rwux5EbTKbAOiZ6iifzaF5NZUf6pjP8
X-Google-Smtp-Source: ABdhPJy3+QCY7OB7WyRUtZmrfKwqpzWm1rNkGuGIgoNUwmEWq+x9RsVTF5/XoITbRYNfHUCzwhQxSA==
X-Received: by 2002:a4a:d48b:: with SMTP id o11mr2966084oos.2.1616593460806;
 Wed, 24 Mar 2021 06:44:20 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id k11sm551383otp.28.2021.03.24.06.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 06:44:20 -0700 (PDT)
Subject: Re: [PATCH v3] i386/cpu_dump: support AVX512 ZMM regs dump
To: Robert Hoo <robert.hu@linux.intel.com>, pbonzini@redhat.com,
 ehabkost@redhat.com
References: <1616572804-7898-1-git-send-email-robert.hu@linux.intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc15756c-755d-fc96-80f4-ac9d6f6b461b@linaro.org>
Date: Wed, 24 Mar 2021 07:44:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616572804-7898-1-git-send-email-robert.hu@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc34.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 2:00 AM, Robert Hoo wrote:
> +        if ((env->xcr0 & XFEATURE_AVX512) == XFEATURE_AVX512) {
> +            /* XSAVE enabled AVX512 */
> +            nb = (env->hflags & HF_CS64_MASK) ? 32 : 8;
> +            for (i = 0; i < nb; i++) {
> +                qemu_fprintf(f, "ZMM%02d=0x%016lx %016lx %016lx %016lx %016lx "
> +                                "%016lx %016lx %016lx\n",
> +                             i,
> +                             env->xmm_regs[i].ZMM_Q(7),
> +                             env->xmm_regs[i].ZMM_Q(6),
> +                             env->xmm_regs[i].ZMM_Q(5),
> +                             env->xmm_regs[i].ZMM_Q(4),
> +                             env->xmm_regs[i].ZMM_Q(3),
> +                             env->xmm_regs[i].ZMM_Q(2),
> +                             env->xmm_regs[i].ZMM_Q(1),
> +                             env->xmm_regs[i].ZMM_Q(0));
> +            }

Dump opmask regs?

> +        } else if (env->xcr0 & XFEATURE_AVX) {

This is normally a 2-bit test.

> +            /* XSAVE enabled AVX */
> +            nb = env->hflags & HF_CS64_MASK ? 16 : 8;
> +            for (i = 0; i < nb; i++) {
> +                qemu_fprintf(f, "YMM%02d=0x%016lx %016lx %016lx %016lx\n",
> +                             i,
> +                             env->xmm_regs[i].ZMM_Q(3),
> +                             env->xmm_regs[i].ZMM_Q(2),
> +                             env->xmm_regs[i].ZMM_Q(1),
> +                             env->xmm_regs[i].ZMM_Q(0));
> +            }
> +        } else { /* SSE and below cases */
> +            nb = env->hflags & HF_CS64_MASK ? 16 : 8;
> +            for (i = 0; i < nb; i++) {
> +                qemu_fprintf(f, "XMM%02d=0x%016lx %016lx",
> +                             i,
> +                             env->xmm_regs[i].ZMM_Q(1),
> +                             env->xmm_regs[i].ZMM_Q(0));
> +                if ((i & 1) == 1)
> +                    qemu_fprintf(f, "\n");
> +                else
> +                    qemu_fprintf(f, " ");

I'd be tempted to merge that second printf into the first, with "%s" and (i & 1 
? "\n" : " ").  Otherwise you'll need to add braces to that IF to satisfy 
checkpatch.

> +#define XFEATURE_X87        (1UL << 0)
> +#define XFEATURE_SSE        (1UL << 1)
> +#define XFEATURE_AVX        (1UL << 2)
> +#define XFEATURE_AVX512_OPMASK          (1UL << 5)
> +#define XFEATURE_AVX512_ZMM_Hi256       (1UL << 6)
> +#define XFEATURE_AVX512_Hi16_ZMM        (1UL << 7)
> +#define XFEATURE_AVX512     (XFEATURE_AVX512_OPMASK | \
> +                             XFEATURE_AVX512_ZMM_Hi256 | \
> +                             XFEATURE_AVX512_Hi16_ZMM)

Except for the last, these already exist under the name XSTATE_*_MASK.

I think you can just as well declare local variables to hold the 3 bits for the 
avx512 test and the 2 bits for the avx test.


r~

