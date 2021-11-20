Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA80457C92
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 09:32:32 +0100 (CET)
Received: from localhost ([::1]:38640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moLnT-00080a-FU
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 03:32:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moLm3-0006va-Me
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 03:31:03 -0500
Received: from [2a00:1450:4864:20::32d] (port=39643
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moLm1-0006Nx-Di
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 03:31:03 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso12277476wmr.4
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 00:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=umU8FDl5srRnLPjrsFiw9HlfUlx1JFkbh7bknmM9ICw=;
 b=tUxRkLedLmn7q7lS4rG37ollm0sxYh1HmFmvXcSxLf7MaWQyPFGd+BEpVEDZxi+Te2
 ikqWPS8VBR830JBEnp1VMziomV+7RaM6w7C1prS0Pkh/aWlsI4+n/mqGVVJnbUz5Pr7d
 FUeDlr3gpK6qz0wiDlYReq2XPmMXWsnmkb8yZyjEFmxy0qygFzqM0nR5aAwDGxotZq4y
 RduVG+0iLrRq1l7nHoCPeNr6qiNyb0L9lqHzrdXSHHrf2v/7R+iXQuB1g1jJKY07DrG1
 0/U4Iv4umtvTgXelZEccQt/aoWuHIwWXmY5Y874LnB0wN31L1Epeocu1gBONgAE2aCRb
 tgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=umU8FDl5srRnLPjrsFiw9HlfUlx1JFkbh7bknmM9ICw=;
 b=F+WCYNYgbtVVeQNncmF3DCtk0YAKT76PgDIUXxch+u44YCIoy7PXk/W7PC+XDhJjyl
 ugU0PnfOBDsD9dggFsJBuHyFG8OJu57iUNI6PEssLVPnkuvwQoL8M0H6J+jzb7fXogu5
 +/6wPgIPhXckFQMURBAcpceUkQh9yy6NfYzCjZVaSq7b8zwYLlJckojRvBaCqu72Bgv5
 Sb6QY9YUcVgwMCelx/Ht8S7cBXQDlGIjz3IryrcWzMVkiv/NqNLGIOZrX/zpOf+D1XJo
 9At+BxgTaFRGx20Ohibp/Fn8580Mj0r3O43A0xAE1Eo8DxRJOTLx2HD0nPo84X/Rgptg
 eN/A==
X-Gm-Message-State: AOAM5325CDLAvobSGXPN4jQqIepKPJ4zQINEKcyprek0x3VVOL4dAY1m
 esT1SgIbAv7t7YvrDOD4+rOrnA==
X-Google-Smtp-Source: ABdhPJwr5SPFET+bNkaMlCJSjPJvIS2/jEyz6g0JzbDb1c8AEf+H8hbcVolDLv9yDv08uAN99kXSoQ==
X-Received: by 2002:a05:600c:1d9b:: with SMTP id
 p27mr8141396wms.123.1637397059769; 
 Sat, 20 Nov 2021 00:30:59 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id h3sm1898507wrv.69.2021.11.20.00.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 00:30:59 -0800 (PST)
Subject: Re: [PATCH v11 08/26] target/loongarch: Add fixed point atomic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-9-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <06ade806-c0e7-afbf-dd02-87cd5c1862a5@linaro.org>
Date: Sat, 20 Nov 2021 09:30:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-9-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
> This includes:
> - LL.{W/D}, SC.{W/D}
> - AM{SWAP/ADD/AND/OR/XOR/MAX/MIN}[_DB].{W/D}
> - AM{MAX/MIN}[_DB].{WU/DU}
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/loongarch/insn_trans/trans_atomic.c.inc | 130 +++++++++++++++++++++++++
>   target/loongarch/insns.decode                  |  44 +++++++++
>   target/loongarch/translate.c                   |   1 +
>   3 files changed, 175 insertions(+)
>   create mode 100644 target/loongarch/insn_trans/trans_atomic.c.inc
> 
> diff --git a/target/loongarch/insn_trans/trans_atomic.c.inc b/target/loongarch/insn_trans/trans_atomic.c.inc
> new file mode 100644
> index 0000000..96957bb
> --- /dev/null
> +++ b/target/loongarch/insn_trans/trans_atomic.c.inc
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +static bool gen_ll(DisasContext *ctx, arg_rr_i *a,
> +                   void (*func)(TCGv, TCGv, int))
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv t0 = tcg_temp_new();
> +
> +    tcg_gen_addi_tl(t0, src1, a->imm << 2);

The ll/sc instructions would of course use the same pre-shifted immediate as for 
ldptr/stptr, as discussed wrt the previous patch.

> +static bool gen_am(DisasContext *ctx, arg_rrr *a,
> +                   void (*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
> +                   MemOp mop)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv val = gpr_src(ctx, a->rk, EXT_NONE);
> +
> +    if ((a->rd != 0) && ((a->rj == a->rd) || (a->rk == a->rd))) {

BTW, you don't need to overdo it with the parenthesis.

    if (a != b && (c == d || e == f)) {

is fine.

> +static bool gen_am_db(DisasContext *ctx, arg_rrr *a,
> +                      void (*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
> +                      MemOp mop)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv val = gpr_src(ctx, a->rk, EXT_NONE);
> +
> +    if ((a->rd != 0) && ((a->rj == a->rd) || (a->rk == a->rd))) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Warning: source register overlaps destination register"
> +                      "in atomic insn at pc=0x" TARGET_FMT_lx "\n",
> +                      ctx->base.pc_next - 4);
> +        return false;
> +    }
> +
> +    gen_loongarch_sync(0x10);
> +    func(dest, addr, val, ctx->mem_idx, mop);

All tcg atomic ops are sequentially consistent, so you don't need the extra sync, and thus 
this entire function.



r~

