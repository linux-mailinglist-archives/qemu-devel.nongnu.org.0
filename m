Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90D42DC479
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:42:32 +0100 (CET)
Received: from localhost ([::1]:41578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZsl-0001Vf-U4
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:42:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZq2-00088i-Io
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:39:42 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:45090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZq0-00010O-KI
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:39:42 -0500
Received: by mail-pf1-x435.google.com with SMTP id q22so16920407pfk.12
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pv4yxrkA0yZ30C+dZu/Q4tDSb+W74ioAdbdaVFGYZME=;
 b=wg8ueaLYAYXxtXdzB3QLZ31ymNZdnV3/eB9n5sEllPvNbPrW0tDmXB1Qxkpk+fZACM
 GtlfB01h4k5LLMtSZdbmhMye4Iz4uwyezF5LVzG6eZezb5zKJ3lEmdoIDwGNNBenEfox
 /PREfhv2Z9ojeuobJNvJtSXMAHT2yBxZz3fHJKjxBxiETY3JpDjtu51ao42XRn3/JVhm
 7aNmzrmzsDjMnoxXJh/Hsi+znaalkr+xhla9mf34W/KC3p5C9RO1uFDkZYOGuN+5gj2p
 T7G8fPqomh8kirD8vswGYPb7EFu6Oqe4Rc4B/LtmDWIvWCSxiDmNgUfEscHWer7TKRqo
 g/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pv4yxrkA0yZ30C+dZu/Q4tDSb+W74ioAdbdaVFGYZME=;
 b=qBo+ZS+E7q4M/sTruvXgSGWCAv8mP2b+bQHMkUg4xdKj+jPjdr3DflsN3KU+snnGrz
 A8wDkS+RF91LOpOns/jehdOXx+OxYIgPk1ClBWgmbRXIS8kOHTWZXtVrK3AUstpq7YiN
 2Dtvf3DJT/jstg5VfPEEbyDzsRt+2y1hg7ot7XQdTimaZ0u+tC89N5i/WEP2lnATdVMm
 Exqv9+UMSIP5hqSvSEoWCb+JulHZlkzz1htI/a39m0I/uriAfXO+Hb3ljNeNa5Qjy2Z1
 JZ/AYp9C8CAIGpvsE2xlQm9NqR/v956SoL2vG4QgUSLwugHlUevK8s6JADSDNlHUADO7
 Fzfg==
X-Gm-Message-State: AOAM530FInDHrqjxKmisCzwsw06spanF+NdenAHXF6m9uG04159G1oyN
 ummUfZ7sGEI1qzHHQRc8ArUQQw==
X-Google-Smtp-Source: ABdhPJx4ZxDMB7JvCC8+7DXoTxhugWx1WOOC6G6WWDfMwKtQ17Pf9gWXt3WoRXAlGkzzZKYjII6vHw==
X-Received: by 2002:a63:e94f:: with SMTP id q15mr33990636pgj.401.1608136778988; 
 Wed, 16 Dec 2020 08:39:38 -0800 (PST)
Received: from [192.168.71.34] ([172.58.27.195])
 by smtp.gmail.com with ESMTPSA id f126sm3040483pfa.58.2020.12.16.08.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:39:38 -0800 (PST)
Subject: Re: [RFC v2 10/15] target/riscv: rvb: rotate (left/right)
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-11-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b0332f99-243d-4c40-1001-1f74fa2f43a1@linaro.org>
Date: Wed, 16 Dec 2020 10:39:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-11-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> +static bool trans_ror(DisasContext *ctx, arg_ror *a)
>  {
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, &tcg_gen_rotr_tl);
> +}

Use gen_shift.

> +static bool trans_rori(DisasContext *ctx, arg_rori *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +
> +    if (a->shamt >= TARGET_LONG_BITS) {
> +        return false;
> +    }
> +
> +    TCGv source1 = tcg_temp_new();
> +
> +    gen_get_gpr(source1, a->rs1);
> +    tcg_gen_rotri_tl(source1, source1, a->shamt);
> +    gen_set_gpr(a->rd, source1);

Use gen_shifti.

> +static bool trans_rol(DisasContext *ctx, arg_rol *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, &tcg_gen_rotl_tl);
> +}

Use gen_shift.

> +static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shiftw(ctx, a, &gen_rorw);
> +}
> +
> +static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +
> +    if (a->shamt >= 32) {
> +        return false;
> +    }

Test is impossible due to @sh5.

> +    if (a->shamt == 0) {
> +        TCGv t = tcg_temp_new();
> +        gen_get_gpr(t, a->rs1);
> +        tcg_gen_ext32s_tl(t, t);
> +        gen_set_gpr(a->rd, t);
> +        tcg_temp_free(t);
> +        return true;
> +    }

Why do you need this special case?  The general expansion would appear to work
fine, and surely this needs no special optimization.


r~

