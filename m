Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EE857F764
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 00:41:43 +0200 (CEST)
Received: from localhost ([::1]:57446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFkIA-0006JG-IY
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 18:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFkGg-0004Cf-0i
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 18:40:10 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFkGa-0006bQ-H1
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 18:40:06 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 p6-20020a17090a680600b001f2267a1c84so11057063pjj.5
 for <qemu-devel@nongnu.org>; Sun, 24 Jul 2022 15:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=10wV70C6UjDwY2F/ciGjBEm1wFyhLll7d+KEWbG4Ofw=;
 b=tIMmyxn1zraKG8iATsISYUwhhhgqrwj3SXJ2vs2EcBvXTwhD8X7MbRpzHqhEqGJZrP
 YVnO35a1H662X8kZioL77GpRAjkPywomoaKAQo+G6YW/1zojUsDKb0WqXUikUVhJDUQL
 I/hG68VK4FmI064AD3IHoVR/1tMI1Ng8F+5zbbrM25UmBBBxMYob/b5Ha6/Ecib2ZLMP
 OyCwU2AMd2dC3gG74ffuDJ30ce2qi2mrM6tg2HraQkHFMJI7cODakkt/QrpfcdZYs5Gg
 C5eXTQjU9DD/VJDoezOHAsPFn/G5CaBzPyP1U3Z3qtCTJoYxgzNbUOvnmR2oa36m5dIv
 SYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=10wV70C6UjDwY2F/ciGjBEm1wFyhLll7d+KEWbG4Ofw=;
 b=MjSc48FwfdHZGLvBM/az7ZlHkn+J9nTh6xnVZWVupodgkxX9PQ6zqGz1uQp0DFgdL7
 aW0yTV8UZym1mFX8NEIWC9Lm+f7Uv38hxBWvvAGI8WizERmYvzlTypDnFVAZXWLHo727
 7q+mAsLdMFGwq69KSTcYkTpwAFxyEVO6NM+Gwcu5tGaKgQW7eltk1QOTk6n8Je58v/7a
 ss7mcOPga5JkugH17HM+eUmAkM7t6kxIMyABdj7svdeAGnUEGjCfy9519awxXMpjHiqC
 4wui6rHpfNN0gWSgTWuXVRY5WecU3eqpQoAuaLuHSOHnXRUUkcTDiFd5ydotrWXoSLsM
 X1ow==
X-Gm-Message-State: AJIora8boRDv9qSQVReJ2AjNGGXNbOSStWFb24gh4iK/WB3LEMk2YAjj
 dkko5ZKqFwMvJL+RT64MPSqELw==
X-Google-Smtp-Source: AGRyM1vb7LosdbV4PsD+XvrIMaDn564NxGxOqUcxrNS9F881AXUIvvtckK/W7Xy3JyQE0VmXwguGRw==
X-Received: by 2002:a17:90a:5e0f:b0:1f2:2a36:d593 with SMTP id
 w15-20020a17090a5e0f00b001f22a36d593mr11598054pjf.232.1658702402825; 
 Sun, 24 Jul 2022 15:40:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:ef1e:c8e:be06:74d0?
 ([2602:ae:1549:801:ef1e:c8e:be06:74d0])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a626003000000b005289eafbd08sm8255732pfb.18.2022.07.24.15.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 15:40:02 -0700 (PDT)
Message-ID: <ed94c5dc-98fd-cb71-c1aa-d0e5cd5f6421@linaro.org>
Date: Sun, 24 Jul 2022 15:39:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] tests/tcg/s390x: Test unaligned accesses to lowcore
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220722233614.7254-1-iii@linux.ibm.com>
 <20220722233614.7254-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220722233614.7254-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 7/23/22 05:06, Ilya Leoshkevich wrote:
> Add a small test to avoid regressions.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~


> ---
>   tests/tcg/s390x/Makefile.softmmu-target |  9 +++++++++
>   tests/tcg/s390x/unaligned-lowcore.S     | 19 +++++++++++++++++++
>   2 files changed, 28 insertions(+)
>   create mode 100644 tests/tcg/s390x/Makefile.softmmu-target
>   create mode 100644 tests/tcg/s390x/unaligned-lowcore.S
> 
> diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
> new file mode 100644
> index 0000000000..a34fa68473
> --- /dev/null
> +++ b/tests/tcg/s390x/Makefile.softmmu-target
> @@ -0,0 +1,9 @@
> +S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
> +VPATH+=$(S390X_SRC)
> +QEMU_OPTS=-action panic=exit-failure -kernel
> +
> +%: %.S
> +	$(CC) -march=z13 -m64 -nostartfiles -static -Wl,-Ttext=0 \
> +		-Wl,--build-id=none $< -o $@
> +
> +TESTS += unaligned-lowcore
> diff --git a/tests/tcg/s390x/unaligned-lowcore.S b/tests/tcg/s390x/unaligned-lowcore.S
> new file mode 100644
> index 0000000000..246b517f11
> --- /dev/null
> +++ b/tests/tcg/s390x/unaligned-lowcore.S
> @@ -0,0 +1,19 @@
> +    .org 0x1D0                         /* program new PSW */
> +    .quad 0x2000000000000, 0           /* disabled wait */
> +    .org 0x200                         /* lowcore padding */
> +
> +    .globl _start
> +_start:
> +    lctlg %c0,%c0,_c0
> +    vst %v0,_unaligned
> +    lpswe quiesce_psw
> +
> +    .align 8
> +quiesce_psw:
> +    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
> +_c0:
> +    .quad 0x10060000                   /* lowcore protection, AFP, VX */
> +
> +    .byte 0
> +_unaligned:
> +    .octa 0


