Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F332944FFFF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 09:32:04 +0100 (CET)
Received: from localhost ([::1]:48730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmXPH-0001XQ-JL
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 03:32:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmXNB-0000Za-D2
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 03:29:53 -0500
Received: from [2a00:1450:4864:20::42a] (port=40903
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmXN9-0002dg-Fe
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 03:29:52 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r8so28895420wra.7
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 00:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6CvrUbwSk0+PNWc4am1FCO1GwHppsO6l+E19tPCcZQI=;
 b=Hh+yRkO5aoazr/y0hqcPF/pQ2HnRwFAkKnMeghuOJ8KOwN8n8LqTpR2xDMncoyd3pt
 BsqVe/cS7u0eUgXNocIUh08xdKSqK7M7xFu/psHTgUa2BukpqUFou6m44VuikAILh/d8
 SeHhxBHBxgeJqZ8I1O2CrCvlOaN+6wAbgbZCSHynu4ExNdUarBU77f5kYo1eoEwwyYYW
 KNXTz6DawFBkXJHy9PnxaIXj9OzS2fAxgyueAZvR3ywCxtavm4dZIgTlOUZrD01rZUdF
 iJvz7HwTfDf4abC/WsjS3Mzij9Ck/jEmYlK8FmTLNNcgTY/De4QjYbPBbDTJQbfiClXq
 tc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6CvrUbwSk0+PNWc4am1FCO1GwHppsO6l+E19tPCcZQI=;
 b=nM+b3tq5ea538Jf6OULOgkRwl2xsNr9BkMIPWkBGSLP79VEfUeEfS1Z2s36SZwNS1D
 hwHcDxrgpaCicgi6CAdhcnJxgzu1y04lqvXoG3SdTOQuU9ethYJGAwyE57rxlyNhgFeV
 pO8Tu7qB60X7TJ/GCPcMzvFeuni+j0KlEKTrpaCXFyeA2/x1oWFRZq571W+at7VIemmV
 tnPnBkehB7TXpZ9zyxUo6I8iGsu0HX14NqNmiFL9NIqfqmjBbdL42bQZ/9MCQm3bOCIv
 A1dt9OwBmzFPptIVDs/5EGWCKhUoWPOBIJfvNMWv7w4DqRpZAU6UKtEonyYFjmb3cOYb
 Rg2w==
X-Gm-Message-State: AOAM530wm0rQ3o8J6EYkdlKPXmMmSyttoQ080uO0+DTCwwgiFMCtAlSt
 WhMO+1YI1G/hMMQp47bLMmhyfQ==
X-Google-Smtp-Source: ABdhPJz30Ona9NDT0z6oF1Dup0ii9F2Eap7huBn+vF8UvlCH5EvXwjH2Y3tmuLaxSB3lHEKY/8bQeg==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr43390615wrs.437.1636964989682; 
 Mon, 15 Nov 2021 00:29:49 -0800 (PST)
Received: from [192.168.8.105] (137.red-176-80-46.dynamicip.rima-tde.net.
 [176.80.46.137])
 by smtp.gmail.com with ESMTPSA id x4sm18245630wmi.3.2021.11.15.00.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 00:29:49 -0800 (PST)
Subject: Re: [PATCH v5 09/18] target/riscv: accessors to registers upper part
 and 128-bit load/store
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-10-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e3ab42c2-3c29-76bd-65e6-5c5b748b743b@linaro.org>
Date: Mon, 15 Nov 2021 09:29:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211112145902.205131-10-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.278,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/21 3:58 PM, Frédéric Pétrot wrote:
> +/* Compute only 64-bit addresses to use the address translation mechanism */
> +static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop)
> +{
> +    TCGv src1l = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv destl = dest_gpr(ctx, a->rd);
> +    TCGv desth = dest_gprh(ctx, a->rd);
> +    TCGv addrl = tcg_temp_new();
> +
> +    tcg_gen_addi_tl(addrl, src1l, a->imm);
> +
> +    if (memop != MO_TEUO) {

It is perhaps clearer as (memop & MO_SIZE) <= MO_64.

> +        tcg_gen_qemu_ld_tl(memop & MO_BSWAP ? desth : destl, addrl,
> +                           ctx->mem_idx, MO_TEUQ);

This isn't correct.  MO_BSWAP is related to the host, not the guest.

You want

	(memop & MO_BSWAP) == MO_LE ? destl : desth

Are there any big-endian RISC-V though?


> +static bool gen_store_i128(DisasContext *ctx, arg_sb *a, MemOp memop)
> +{
> +    TCGv src1l = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2l = get_gpr(ctx, a->rs2, EXT_NONE);
> +    TCGv src2h = get_gprh(ctx, a->rs2);
> +    TCGv addrl = tcg_temp_new();
> +
> +    tcg_gen_addi_tl(addrl, src1l, a->imm);
> +
> +    if (memop != MO_TEUO) {
> +        tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, memop);
> +    } else {
> +        tcg_gen_qemu_st_tl(memop & MO_BSWAP ? src2h : src2l, addrl,
> +            ctx->mem_idx, MO_TEUQ);

Likewise.


r~

