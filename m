Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF386439D6F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 19:22:11 +0200 (CEST)
Received: from localhost ([::1]:52358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf3fm-0004q5-HD
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 13:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf3cr-0002ls-1K
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:19:09 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf3cp-0006lT-BT
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:19:08 -0400
Received: by mail-pl1-x635.google.com with SMTP id y1so109761plg.3
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 10:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pHBteeCZEDvaCA2TEDc6GjPDS6mTQogcaz5tvFy6DHE=;
 b=aTZaMlVTxhX6OKTzI9jTfhJe+XttuwaETvfhJOkx7ArA+pdlhU2asSnddME9anHAzy
 NN+dVU7MVNUSALmbdSXW7sTGGezLfFQwwf7Kf2VFHEPUHbDFxuUbWj3BzAhQZlfzlT0x
 NVHsjkCv4I4ryqb/r71GdD8CwVsY5W7XK8+n4XVnlg6Di1Yj4QplkhBiAXJpgehQGbos
 L8ugogQyrBaCMWJicN+33qy9QObZyYRvWu/qZP9MG+q4zmp3pNn2rdoqsDzpW8GA8kjZ
 oA2V5taDOjWzFhNRf2WoZ4O9R3Zk5UsJSJmQv/0Idra/Ch9Ug4jwzjdtDQPj4otJuXNT
 6C7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pHBteeCZEDvaCA2TEDc6GjPDS6mTQogcaz5tvFy6DHE=;
 b=GMyov0lC9moA/jeRDSEp7RVW/vY2EcIC7vIAd6ZgvqJ/2EIu4/ggj2YbOLVmdJ/QDC
 MSdyKufaz7AfbdHLZUO1TCvVX19tjIERp6RUB5d+W+9ud4IT2BQenxpY/M/6nkKbWYu1
 zwPb3tTiBAiv8f/ETi7ZvMYulrdoV/NhfHtNWPExG2Q0SBrjFQOsyg1JHezKD+/xcey6
 a+t2+42H9T6mrxIvZ4L57l6AX5+nZCVb/KYuSrOgZxC/2xHeEwF8oxa0Hr3orGaQ4T/x
 AVSchB4MDXziRKFEt/E8Mmo/nyak6LZ+Ri6c4Q5EVnGAcDxN4X1dSizvyaXu6zWNAwC7
 QSYw==
X-Gm-Message-State: AOAM532RgUgSM3seHKRd+Yivzx36y4wkOy8alBa9gxnmChT9SZCH91GL
 VXkTJkhLlppBKbuHkX516rMeUw==
X-Google-Smtp-Source: ABdhPJy7dh1AqNzqzgtEyLUP26W7r7QVrI+3+EjkyaSR/LGidhpMS9HU54eM7J2GWN4dIU4YGxHYDQ==
X-Received: by 2002:a17:902:6bc5:b0:13f:f585:4087 with SMTP id
 m5-20020a1709026bc500b0013ff5854087mr17801847plt.32.1635182345926; 
 Mon, 25 Oct 2021 10:19:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t40sm4227065pfg.142.2021.10.25.10.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 10:19:05 -0700 (PDT)
Subject: Re: [RFC 1/2] tls: add macros for coroutine-safe TLS variables
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20211025140716.166971-1-stefanha@redhat.com>
 <20211025140716.166971-2-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fea06711-f4dd-9932-5b2d-06a408c7adf6@linaro.org>
Date: Mon, 25 Oct 2021 10:19:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025140716.166971-2-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>, thuth@redhat.com,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 7:07 AM, Stefan Hajnoczi wrote:
> Compiler optimizations can cache TLS values across coroutine yield
> points, resulting in stale values from the previous thread when a
> coroutine is re-entered by a new thread.
...
>   include/qemu/tls.h | 142 +++++++++++++++++++++++++++++++++++++++++++++

Better as qemu/coroutine-tls.h, since it is needed for no other purpose.

> +#define QEMU_DEFINE_TLS(type, var) \
> +    __thread type qemu_tls_##var; \
> +    type get_##var(void) { return qemu_tls_##var; } \
> +    void set_##var(type v) { qemu_tls_##var = v; }

You might as well make the variable static, since it may only be referenced by these two 
functions.

> +#define QEMU_DEFINE_STATIC_TLS(type, var) \
> +    static __thread type qemu_tls_##var; \
> +    static __attribute__((noinline)) type get_##var(void); \
> +    static type get_##var(void) { return qemu_tls_##var; } \
> +    static __attribute__((noinline)) void set_##var(type v); \
> +    static void set_##var(type v) { qemu_tls_##var = v; }

You don't need separate function declarations; you can fold them together.

If would be nice to inline this when possible,

#if defined(__aarch64__)
#define QEMU_COROUTINE_TLS_ADDR(RET, VAR)                       \
     asm volatile("mrs %0, tpidr_el0\n\t"                        \
                  "add %0, %0, #:tprel_hi12:"#VAR", lsl #12\n\t" \
                  "add %0, %0, #:tprel_lo12_nc:"#VAR             \
                  : "=r"(RET))
#elif defined(__powerpc64__)
#define QEMU_COROUTINE_TLS_ADDR(RET, VAR)                       \
     asm volatile("addis %0,13,"#VAR"@tprel@ha\n\t"              \
                  "add   %0,%0,"#VAR"@tprel@l"                   \
                  : "=r"(RET))
#elif defined(__riscv)
#define QEMU_COROUTINE_TLS_ADDR(RET, VAR)                       \
     asm volatile("lui  %0,%%tprel_hi("#VAR")\n\t"               \
                  "add  %0,%0,%%tprel_add("#VAR")\n\t"           \
                  "addi %0,%0,%%tprel_lo("#VAR")"                \
                  : "=r"(RET))
#elif defined(__x86_64__)
#define QEMU_COROUTINE_TLS_ADDR(RET, VAR)                       \
     asm volatile("mov %%fs:"#VAR"@tpoff, %0" : "=r"(RET))
#endif

#ifdef QEMU_COROUTINE_TLS_ADDR
#define QEMU_COROUTINE_TLS_DECLARE(TYPE, VAR)                   \
     extern __thread TYPE co_tls_##VAR;                          \
     static inline TYPE get_##VAR(void)                          \
     { TYPE *p; QEMU_COROUTINE_TLS_ADDR(p, co_tls_##VAR); return *p; } \
     static inline void set_##VAR(TYPE v)                        \
     { TYPE *p; QEMU_COROUTINE_TLS_ADDR(p, co_tls_##VAR); *p = v; }
#else
     etc
#endif


r~

