Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5964C2D7B3E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:47:01 +0100 (CET)
Received: from localhost ([::1]:47718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knlZL-0003Es-Rj
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knlXE-0002cj-4W
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:44:48 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knlXC-00016v-8D
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:44:47 -0500
Received: by mail-ot1-x341.google.com with SMTP id 11so8752853oty.9
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f8GgEo9x3xoPvCS2HC9JQoSF1pQkb4dmaWeJpdlpEWo=;
 b=mZA7uyktTwr/cvtpB/c4xVibWexpi5zr2CFBJZ7fQ5VebJZpt65+HX2NGABq6ZYZRZ
 BHgAVrpOUuEpme4+AtkwUZtb2NozFYzMBsNdtwF0Df5IXtcybmjGMuP/9I7xWJE1Z/u5
 bWphaimIImKw9EcAhIRs6APElNcXszkHF3U2SQg4tWgResRnh2YClBNJx7HO+tYdOiE9
 k1Yd2fwJA5tEtA1MAnHABpvt/T4pvATNfNMwz/X2g12oXCOAoB+iUWppVk/SF1HWgDCe
 8xBEyQz2qbGoTjFdQPq8Kx1Ern5gwNwzQWjVo4QoTLYY79saZNArzWIZni65Ah7HEcke
 vSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f8GgEo9x3xoPvCS2HC9JQoSF1pQkb4dmaWeJpdlpEWo=;
 b=o8v9OgA1OTDzokE3DmJYhv9Bavyt4vUK05ReLx492R8JWNIA5deQFbRONs9R/7RMrQ
 bultAfB6bq6xrp2UxenWMG7NiKdXkvQ0nEc4MmMYjwbXsEMMLNvsjwl60pT037s54j5T
 1/730a6uBBw6iIbD7AW57XXTfuI9P8XmzPCoc+W54Lp29riw7ASujmcD7n1yo7CntHdO
 xZuoGgijOcrxp+QpH8SoGIyAZ4ozFbI9ksP+ff73z+3ddhEH7qlc7Nzx33E1TDjD66rh
 3ZYkosCxlbLbLP9xgRNWe95gDqxO9dV9+6glpdtZXfC6WShGDxbL+oikbAcqjY9RoC9p
 YGcg==
X-Gm-Message-State: AOAM5321v+aEhiNjS11mHJHXmP2TNs4Ro5cblnb1bRaD455A+lLS5g6V
 xQnqc052WO+V49E4zRzPpBjkjQ==
X-Google-Smtp-Source: ABdhPJz9bKP/fu/4YeK+xqj3HCzxzbIsWNZu6ghoY6PpCHvpkU0y+/FAW9vFqVBaDPqsNcH2JLYVHg==
X-Received: by 2002:a9d:6d08:: with SMTP id o8mr1667576otp.334.1607705084818; 
 Fri, 11 Dec 2020 08:44:44 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v8sm1942498otp.10.2020.12.11.08.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 08:44:43 -0800 (PST)
Subject: Re: [PATCH v11 10/25] i386: move TCG cpu class initialization out of
 helper.c
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-11-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0599b878-22d0-c26c-8621-4426786ddfe9@linaro.org>
Date: Fri, 11 Dec 2020 10:44:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-11-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:31 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/i386/cpu.h             |  97 ++---------------------------
>  target/i386/tcg/helper-tcg.h  | 112 ++++++++++++++++++++++++++++++++++
>  target/i386/tcg/tcg-cpu.h     |  15 +++++
>  target/i386/cpu.c             |  33 ++++------
>  target/i386/helper.c          |  23 -------
>  target/i386/tcg/bpt_helper.c  |   1 +
>  target/i386/tcg/cc_helper.c   |   1 +
>  target/i386/tcg/excp_helper.c |   1 +
>  target/i386/tcg/fpu_helper.c  |  33 +++++-----
>  target/i386/tcg/int_helper.c  |   1 +
>  target/i386/tcg/mem_helper.c  |   1 +
>  target/i386/tcg/misc_helper.c |   1 +
>  target/i386/tcg/mpx_helper.c  |   1 +
>  target/i386/tcg/seg_helper.c  |   1 +
>  target/i386/tcg/smm_helper.c  |   2 +
>  target/i386/tcg/svm_helper.c  |   1 +
>  target/i386/tcg/tcg-cpu.c     |  71 +++++++++++++++++++++
>  target/i386/tcg/translate.c   |   1 +
>  target/i386/tcg/meson.build   |   1 +
>  19 files changed, 244 insertions(+), 153 deletions(-)
>  create mode 100644 target/i386/tcg/helper-tcg.h
>  create mode 100644 target/i386/tcg/tcg-cpu.h
>  create mode 100644 target/i386/tcg/tcg-cpu.c

This is doing a lot more than $SUBJECT, which afaict would just be the creation
of target/i386/tcg/tcg-cpu.c.

> +#define CC_DST  (env->cc_dst)
> +#define CC_SRC  (env->cc_src)
> +#define CC_SRC2 (env->cc_src2)
> +#define CC_OP   (env->cc_op)

Why are these moving within cpu.h?  If they move at all, they should be moved
out of here.  Better if they're simply removed -- this is a silly wrapping of
"env->foo" from ancient days.

> +/* float macros */
> +#define FT0    (env->ft0)
> +#define ST0    (env->fpregs[env->fpstt].d)
> +#define ST(n)  (env->fpregs[(env->fpstt + (n)) & 7].d)
> +#define ST1    ST(1)

Any chance these can move to fpu_helper.c?  Or, in the case of FT0, be eliminated?

> +/* cc_helper.c */
> +extern const uint8_t parity_table[256];

We should probably remove this and just use ctpop(x) & 1.

> +/*
> + * NOTE: the translator must set DisasContext.cc_op to CC_OP_EFLAGS
> + * after generating a call to a helper that uses this.
> + */
> +static inline void cpu_load_eflags(CPUX86State *env, int eflags,
> +                                   int update_mask)
> +{
> +    CC_SRC = eflags & (CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
> +    CC_OP = CC_OP_EFLAGS;
> +    env->df = 1 - (2 * ((eflags >> 10) & 1));
> +    env->eflags = (env->eflags & ~update_mask) |
> +        (eflags & update_mask) | 0x2;
> +}

This is complex enough I would be in favor of moving it out-of-line somewhere
convenient.

> +++ b/target/i386/tcg/tcg-cpu.h
> @@ -0,0 +1,15 @@
> +/*
> + * i386 TCG CPU class initialization
> + *
> + * Copyright 2020 SUSE LLC
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef TCG_CPU_H
> +#define TCG_CPU_H
> +
> +void tcg_cpu_common_class_init(CPUClass *cc);
> +

Why does the new file need it's own header, with one declaration?


r~

