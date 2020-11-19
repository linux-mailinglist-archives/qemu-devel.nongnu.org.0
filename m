Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BFA2B9B6F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 20:26:37 +0100 (CET)
Received: from localhost ([::1]:42434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfpZk-0001dm-40
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 14:26:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpXy-0000rF-S9
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:24:46 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpXw-00073N-6u
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:24:46 -0500
Received: by mail-pg1-x529.google.com with SMTP id r18so5122478pgu.6
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 11:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3N1gmkuj4T2+5TXc5qtPIYIoE9z+RF7RlX+KbQreMcE=;
 b=OsgqhqTXHb0y2FVzcTKE1y3Mj14qkbhe9AHicoHdnfJP4K77GTEyUeMaCEB47ucC9a
 86N3+3xvETx9qtaHl1Q7nQ/Rx/jAopsyCzTgVK4TFw6TB3MsvdJGQdp+jxHUXAMUasp0
 rjbCQ1ckqbTxOB6nraI6yU9GjKPSI7nsPXOT+O7BC/M8WeYl92ibzNZhIBM9Uc9GApF8
 zOHG5XljzFYxUumaiItAr8hzVgUSaash5hKKicj+VcY+ezSe56NDvuOvjt38/CrLFA3o
 7W78uuX2SQgE3Tm6hxt87sPxjOWnPjc28a8YBScLA8SsMp4k1sPL1bmyq8l8Y72SXHIc
 2WCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3N1gmkuj4T2+5TXc5qtPIYIoE9z+RF7RlX+KbQreMcE=;
 b=jCbF8FD5RnK52U6onJHpKx2uXHmwwRM/UmqnhM9mSyQzDnWafogmhVnQMQWuOq2tZK
 vAogvPNUKAN6mQfu0iCROcZwTF3QBku8V85h2IT/EbL7bCRop4x++9cCmpprQhLSerWK
 8P8Y84CdzaBWhlup+ljL49KUMdKhUcSx/uo6PoEbY9FKITMfvvEXzR3NMcNRYfVNQqkP
 BbwqAVwwAEibL41Cs0xIy2yh7i3QeAio/vFLz2FvQrQU6uXvIJMnOTx1vdRtSCSqrSYd
 p0KbXGze5XG3REixjJYncEkVQba5slA+uLcrX7gRWYbzH0fLlvR3KZxVnTgJr00RrBka
 hJQA==
X-Gm-Message-State: AOAM533aG5ZEJ6p9c2RZ6WB31Uc5pyHfUGGLhjNnHeq5XQGEEMkzf0gy
 1RftmDn5hzZhScB+HzfuEOP5Mw==
X-Google-Smtp-Source: ABdhPJzcxJ2+6E+kPvzKOaUjePf8FxI6rSWBUANa5U64aiHnFeLnWSm5h67gWSSr/gt2CdHRrFi6MQ==
X-Received: by 2002:aa7:868a:0:b029:197:60b6:ae1c with SMTP id
 d10-20020aa7868a0000b029019760b6ae1cmr10721763pfo.42.1605813881704; 
 Thu, 19 Nov 2020 11:24:41 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id go8sm448460pjb.56.2020.11.19.11.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 11:24:40 -0800 (PST)
Subject: Re: [RFC 02/15] target/riscv: rvb: count leading/trailing zeros
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-3-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <966e5e0c-273a-87f2-3f2e-f933e2b4f9b1@linaro.org>
Date: Thu, 19 Nov 2020 11:24:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-3-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +static bool gen_cxzw(DisasContext *ctx, arg_r2 *a,
> +                     void(*func)(TCGv_i32, TCGv_i32, uint32_t))
...
> +static bool gen_cxz(DisasContext *ctx, arg_r2 *a,
> +                    void(*func)(TCGv, TCGv, target_ulong))

I think both of these are unnecessary and you should use the gen_unary that you
introduce in the next patch.  ctz/clz cannot produce a negative number and do
not need extension.

You should simply add wrappers like you do for gen_pcntw to truncate and operate:

static void gen_ctz(TCGv ret, TCGv arg1)
{
    tcg_gen_ctz_tl(ret, arg1, TARGET_LONG_BITS);
}

static void gen_clz(TCGv ret, TCGv arg1)
{
    tcg_gen_clz_tl(ret, arg1, TARGET_LONG_BITS);
}

static void gen_ctzw(TCGv ret, TCGv arg1)
{
    tcg_gen_ori_i64(ret, arg1, MAKE_64BIT_MASK(32, 32));
    tcg_gen_ctz_i64(ret, ret, 32);
}

static void gen_clzw(TCGv ret, TCGv arg1)
{
    tcg_gen_ext32u_i64(ret, arg1);
    tcg_gen_ctz_i64(ret, ret, 64);
    tcg_gen_subi_i64(ret, ret, 32);
}


r~

