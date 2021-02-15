Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F0831C30B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 21:34:11 +0100 (CET)
Received: from localhost ([::1]:43936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBkZO-0007p1-Sk
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 15:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkXU-0006Xb-LB
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:32:12 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:45332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkXS-00010b-TC
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:32:12 -0500
Received: by mail-pf1-x430.google.com with SMTP id j12so4811668pfj.12
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 12:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K2BTS8CDgjYEK2Z1nuhRE0Yd/qTKMk8rlS5cns85vAo=;
 b=mRcwT98vW/c7kZdfFQSzFAmMlbeKtX0edrafeTY8Ryb5QMFGlWsK8GhQ7Yt7etLC0z
 mpxQBOn+hGX0DOZ54N7snfD4B9SYOv5j5dTfOa10uBitrhnPq8Kr6fItlT+sL2urYJZd
 Wy7Wi5LF3FUw+Wv9zDfoKJ+YcIu9bXbMp40cXv8UF2RazIu4oNvE7cc0KdqBCw6a1mXS
 Qa2r0SE4BigOrAEjzFTIK4HIq5MGkzKWGXC0lAHKuNMBxnGvQuJh5jvPN8wjvBgg8hs4
 zLqXQdD2SqN4IM9lnr1FZKWarzqFBFqYNJOccQ6lvoCPUVbX7LHnQXNi5z21stfqVL/d
 9XVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K2BTS8CDgjYEK2Z1nuhRE0Yd/qTKMk8rlS5cns85vAo=;
 b=PSY8eFR/rkQmWXYpXB/luTDV70bySOoJ8eguxgbnnmBr6W+LlVc0yJ1X0JImb6vhxn
 7r9LcVXrYMNfpCVjE0ZK/Z9c+h/JXrrYMkUepkVNj2N6iGLrUwBS/FrU7kG5HTlP/QGx
 5Jb2Qtzadwc61J4ykkBBOhrwiw+ygPImEJMBGrMAGHQOTSOQVrmJ4vmazcY4Io83vKjd
 ZUVXqJg47NC7MNKt9mUM9oxKDMEcm5iGOfszisqXh1GP/Cz8a69i2fyZMcNOyIuciPz6
 oAPoaxsqwQCchOdBlif7J8+HIYkJrgqfO97m37BMIVXkOduvEFa9er1cNlKP7Yg0Heah
 iNCQ==
X-Gm-Message-State: AOAM532gyBetfYyM+yq/uQZoYh6pqO3+NG9kWzRSFZDE/9AlIRYdvcYm
 e+LCcqUq915zoYlvjLn1ozCuFA==
X-Google-Smtp-Source: ABdhPJxOKNHc68v37XXkvRvNXUxmd6pG1r7eYBB62b7zW4/T+gHqgpMe4hK43nIUnkJbj4KJoBbHSw==
X-Received: by 2002:a63:515b:: with SMTP id r27mr16286826pgl.38.1613421126494; 
 Mon, 15 Feb 2021 12:32:06 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id i2sm271953pjj.35.2021.02.15.12.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 12:32:05 -0800 (PST)
Subject: Re: [RFC PATCH 19/42] target/mips/tx79: Introduce PCEQ* opcodes
 (Parallel Compare for Equal)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-20-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <54613346-89ec-724e-9a7a-71295063c581@linaro.org>
Date: Mon, 15 Feb 2021 12:32:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> +static bool trans_parallel_compare(DisasContext *ctx, arg_rtype *a,
> +                                   TCGCond cond, unsigned wlen)
> +{
> +    TCGv_i64 c0, c1, ax, bx, t0, t1, t2;
> +
> +    if (a->rd == 0) {
> +        /* nop */
> +        return true;
> +    }
> +
> +    c0 = tcg_const_tl(0);
> +    c1 = tcg_const_tl(0xffffffff);

Cheaper for most hosts to load -1 than a 32-bit value zero-extended to 64 bits.
 That said, you could also use

  setcond(t0, t0, t1, cond);
  neg(t0, t0);

> +    for (int i = 0; i < (64 / wlen); i++) {
> +        tcg_gen_sextract_i64(t0, ax, wlen * i, wlen);
> +        tcg_gen_sextract_i64(t1, bx, wlen * i, wlen);
> +        tcg_gen_movcond_i64(cond, t2, t1, t0, c1, c0);
> +        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t2, wlen * i, wlen);
> +    }

For an accumulate loop like this, we'll get better results if the length of the
insert is the remaining length of the register.  That way, the first insert is
width 64, which turns into a move, so that the old value of rd is not used.
Further, we can use extract2 to replace the remaining length when deposit is
not available.

Also, while you will need this compare loop for GT, there's a cheaper way to
compute EQ, which we use in several places in QEMU.

void gen_pceq(TCGv_i64 d, TCGv_i64 s, TCGv_i64 t, MemOp esz)
{
  TCGv_i64 one = tcg_constant_i64(dup_const(esz, 1));
  TCGv_i64 x = tcg_temp_new_i64();

  /* Turn s == t into x == 0. */
  tcg_gen_xor_i64(x, s, t);

  /*
   * See hasless(v,1) from
   * https://graphics.stanford.edu/~seander/bithacks.html#ZeroInWord
   * Shift the msb down, then use muli to replicate
   * the one bit across the vector element.
   */
  tcg_gen_sub_i64(d, x, one);
  tcg_gen_andc_i64(d, d, x);
  tcg_gen_shri_i64(d, d, (8 << esz) - 1);
  tcg_gen_and_i64(d, d, one);
  tcg_gen_muli_i64(d, d, MAKE_64BIT_MASK(0, 8 << esz));

  tcg_temp_free_i64(x);
}

In both cases, I think you should pull out helper functions and then use
trans_parallel_logic.


r~

