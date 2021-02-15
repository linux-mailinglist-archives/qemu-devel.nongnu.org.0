Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EE831C188
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 19:32:26 +0100 (CET)
Received: from localhost ([::1]:54004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBifU-0007Ba-IQ
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 13:32:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBibx-0004PU-AM
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:28:41 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBibv-0005Kp-Ho
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:28:41 -0500
Received: by mail-pf1-x42b.google.com with SMTP id y25so1377786pfp.5
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 10:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C9fqxoJbc5tEPq70b4HHxNaF0FeDagmIlrNcvnmg3Rw=;
 b=O7RjHQsrAW8Wb7TtbofopmssWBTlXr2vGGoS9YtVcSqz571DRirmDsh7Hx/nuKb3nX
 hWdYVDqlTu54xS0YDMhrIEZMQjSToRTGKbF4lCa8KWmMmaScL7rPNUSjleUv0tLfeTof
 rr0zJvvU44PM4StWPwOrn/lAbjGxcyCtOmA5VuVhOIfscOYu3jD4xgfkghWNzcL5ACnK
 FoYa1ZmfY7tDFutPYl35ahm8D4Qpyuv9LRbYtUMRnCYB9mMnvR5YydMJMjh7Fl1nIiWb
 9GbSHY1ylyT/BuYtW1HZ0UruxRlJd8yxTVUcytVXzoo5XgBVg90iRoB1cW+tWDsOY2J0
 2Ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C9fqxoJbc5tEPq70b4HHxNaF0FeDagmIlrNcvnmg3Rw=;
 b=uY/kkobBl1Qp6ze1Y5rqd2xAzlZcdIYpnm96bBpgzqI1y5HZ5hefivK6xqk8UbbbTR
 k6nngyElteKwAPd+lebPTxaT0QqbyvhG1dv77QvHkosyk5z70+ig+WZJEGEUPQy6QS0j
 svJfkskgnHdhb3NnhL/sWVJa/5NMdOuODwopCKaetrp0iJUdpWjTklxcmi8Ar7yujRUT
 3S7HyO4+ZWhJNeaL5n6CvqK7rSp7gb7lzjYD7tZ/GcL9C1R6S4cpkcSPKiSd7AB01ox3
 u8jk5hGBz79Zsr635GTjSx2yCegMT27xgVkd8t0RG8wd/fWyAJ534gznezJnXsjSJoIQ
 riuA==
X-Gm-Message-State: AOAM532JpSd3GPoiSYBGlbbob2Rt48+IDJ4ncv94E5IsKni9BzWvgy+q
 Ba8fsHed+tllaeRxzZZfXWFSyg==
X-Google-Smtp-Source: ABdhPJxmkISnPHavwMzMzLWPtsUMbMpA7zvMRZ8v5nzw9vB4906FC3V68UbRnhG0HWikopP90LABHQ==
X-Received: by 2002:a62:d453:0:b029:1d6:587b:5d31 with SMTP id
 u19-20020a62d4530000b02901d6587b5d31mr16166050pfl.58.1613413714962; 
 Mon, 15 Feb 2021 10:28:34 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm76960pjl.50.2021.02.15.10.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 10:28:34 -0800 (PST)
Subject: Re: [RFC PATCH 18/42] target/mips/tx79: Introduce PEXTU[BHW] opcodes
 (Parallel Extend Lower)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-19-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8668c62a-89c9-0456-bc33-07527dd16d91@linaro.org>
Date: Mon, 15 Feb 2021 10:28:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> Introduce the 'Parallel Extend Lower' opcodes:

$SUBJECT s/PEXTU/PEXTL/.

> +    /* Lower halve */
> +    for (int i = 0; i < 64 / (2 * wlen); i++) {
> +        tcg_gen_deposit_i64(cpu_gpr[a->rd],
> +                            cpu_gpr[a->rd], bx, 2 * wlen * i, wlen);
> +        tcg_gen_deposit_i64(cpu_gpr[a->rd],
> +                            cpu_gpr[a->rd], ax, 2 * wlen * i + wlen, wlen);
> +        tcg_gen_shri_i64(bx, bx, wlen);
> +        tcg_gen_shri_i64(ax, ax, wlen);
> +    }
> +    /* Upper halve */
> +    for (int i = 0; i < 64 / (2 * wlen); i++) {
> +        tcg_gen_deposit_i64(cpu_gpr_hi[a->rd],
> +                            cpu_gpr_hi[a->rd], bx, 2 * wlen * i, wlen);
> +        tcg_gen_deposit_i64(cpu_gpr_hi[a->rd],
> +                            cpu_gpr_hi[a->rd], ax, 2 * wlen * i + wlen, wlen);
> +        tcg_gen_shri_i64(bx, bx, wlen);
> +        tcg_gen_shri_i64(ax, ax, wlen);
> +    }

Right, so, this expands to (4 * 4 * 2) = 32 operations for pextlb, if deposit
is supported, or ((4*2 + 2) * 4 * 2) = 80 operations if not (4 per deposit).

We can do a bit better, though, exploiting parallelism.

/* 5 or 8 operations, w/ or w/o deposit */
void gen_widen_b(TCGv_i64 d, TCGv_i64 s)
{
    TCGv_i64 x = tcg_temp_new_i64();
    TCGv_i64 y = tcg_temp_new_i64();
    TCGv_i64 m0 = tcg_constant_i64(0x0000ff000000ff00ull);

    /* s = abcdefgh */
    tcg_gen_deposit_i64(x, s, s, 16, 48);
    /* x = cdefghgh */
    tcg_gen_and_i64(y, x, m);
    /* y = 00e000g0 */
    tcg_gen_andc_i64(x, x, m0);
    /* x = 000f000h */
    tcg_gen_shli_i64(y, y, 8);
    /* y = 0e000g00 */
    tcg_gen_or_i64(d, x, y);
    /* d = 0e0f0g0h */

    tcg_temp_free_i64(x);
    tcg_temp_free_i64(y);
}

/* 12 or 18 operations w/ or w/o deposit */
void gen_pextb(TCGv_i64 d, TCGv_i64 s, TCGv_i64 t)
{
    TCGv_i64 x = tcg_temp_new_i64();

    gen_widen_b(x, s);
    gen_widen_b(d, s);
    tcg_gen_shli_i64(x, x, 8);
    tcg_gen_or_i64(d, d, x);

    tcg_temp_free_i64(x);
}

then

    gen_read_gpr(s, a->rs);
    gen_read_gpr(t, a->rt);
    gen_pextb(cpu_gpr[a->rd], s, t);

    tcg_gen_shri_i64(s, s, 32);
    tcg_gen_shri_i64(t, t, 32);
    gen_pextb(cpu_gpr_hi[a->rd], s, t);

gives you the result in 26 or 38 operations.

Similarly

void gen_widen_h(TCGv_i64 d, TCGv_i64 s)
{
    TCGv_i64 x = tcg_temp_new_i64();

    /* s = abcd */
    tcg_gen_andi_i64(x, s, 0xffff0000u);
    /* x = 00c0 */
    tcg_gen_deposit_i64(d, s, x, 16, 48);
    /* d = 0c0d */

    tcg_temp_free_i64(x);
}


r~

