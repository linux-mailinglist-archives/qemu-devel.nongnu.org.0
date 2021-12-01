Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8F1465855
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 22:25:00 +0100 (CET)
Received: from localhost ([::1]:34076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msX63-00032O-A7
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 16:24:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1msX3n-0001TX-7y
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 16:22:39 -0500
Received: from [2607:f8b0:4864:20::f32] (port=46807
 helo=mail-qv1-xf32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1msX3l-000498-Hk
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 16:22:38 -0500
Received: by mail-qv1-xf32.google.com with SMTP id jo22so23001945qvb.13
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 13:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=edVIgieuBAjoStL17JiSVArn2QeRMkRRn9jr6qWevng=;
 b=VR29z1HwJa49LUGOwSAJIpZ6BXy9R630lz5X5zpB1wUsfvH5CZyQXnKFf5jm7XJjka
 K8OVT+CF4DFsMufx9gjRF4j2QY3j/Ldx7gP2wQ4cGNeQyM2xxxj9CAiGrQLtulgklZlB
 8tzr8leHEXjimzNGqDQNrWIQ603iGLDF3cwiXghVcNctsGSs7sle6ouhre6wLgfSGT0m
 LSKuLNyOVWsPvlTYWm2KqqdJ/F/PaNpiQWWwps4s1tsaPQ0dE7GGlIrKsT8Qub69CcVS
 PdgcwYuGnjLAlw3vtTdER4maR87LTedFZwkfL7kCenH12qIbFnPJJPXpBipx2W0NFzsg
 FtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=edVIgieuBAjoStL17JiSVArn2QeRMkRRn9jr6qWevng=;
 b=L2lfyK6C1AUg8eJwnjyoNv+Ht3klk+3qYhq95dtE65JNgfg9sRSxFFGgBUayho7OLb
 Q/L3V3UtsJd7kkb2z3v4mbeFsXJ6cZ2PAOSe8/UBbJd9S5EeVsfFIec+mM05OUCi2FGM
 7tLUQHnCEhasmdWKGeR94yWKF5iGoM1zRzh9yD8w9yQ6ybXIiBsN2SV7CgARn/ovJ2aq
 bnXZ4FKUtMbmFAibuDulPJNeRa0tfCgIZ5xFe4hgDJYStl8N0lbzru+GzeZBOLTFEBXt
 tmNbfUCTXr3UYmF+/GcsSwFq851Qb1GEy4jnayyp/Y0wOPlNXpprlA9EwiVIgk4lHZFe
 GzUw==
X-Gm-Message-State: AOAM531S7ZXwSZfSKmYXC64x2IIJs6IPt9oCjpTcSlCmovpA0qOQ/+bh
 3C8h9+P3QByalpOQEbrvkBAu5l4oxoR5NU5sOH4=
X-Google-Smtp-Source: ABdhPJzP0GxSnBDZDgbwzhbGtSDFGZtqCLGqnXCk8MdqQ7vIUkeuwnz84HfuiuYlCmmdfjUcCNuBLA==
X-Received: by 2002:a05:6214:d0e:: with SMTP id
 14mr9013197qvh.26.1638393755489; 
 Wed, 01 Dec 2021 13:22:35 -0800 (PST)
Received: from [172.20.1.209] ([12.86.33.50])
 by smtp.gmail.com with ESMTPSA id o1sm507405qtw.1.2021.12.01.13.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 13:22:35 -0800 (PST)
Subject: Re: [PATCH v12 08/26] target/loongarch: Add fixed point atomic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1638346585-3436-1-git-send-email-gaosong@loongson.cn>
 <1638346585-3436-9-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dc94d613-984c-4559-b1bf-4fe32fac513d@linaro.org>
Date: Wed, 1 Dec 2021 16:22:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1638346585-3436-9-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.211,
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

On 12/1/21 3:16 AM, Song Gao wrote:
> +static bool gen_am(DisasContext *ctx, arg_rrr *a,
> +                   void (*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
> +                   MemOp mop)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv val = gpr_src(ctx, a->rk, EXT_NONE);
> +
> +    if (a->rd != 0 && (a->rj == a->rd || a->rk == a->rd)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Warning: source register overlaps destination register"
> +                      "in atomic insn at pc=0x" TARGET_FMT_lx "\n",
> +                      ctx->base.pc_next - 4);
> +        return false;
> +    }
> +
> +    func(dest, addr, val, ctx->mem_idx, mop);
> +    gen_set_gpr(a->rd, dest, EXT_NONE);
> +
> +    return true;
> +}
> +
> +static bool gen_am_db(DisasContext *ctx, arg_rrr *a,
> +                      void (*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
> +                      MemOp mop)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv val = gpr_src(ctx, a->rk, EXT_NONE);
> +
> +    if (a->rd != 0 && (a->rj == a->rd || a->rk == a->rd)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Warning: source register overlaps destination register"
> +                      "in atomic insn at pc=0x" TARGET_FMT_lx "\n",
> +                      ctx->base.pc_next - 4);
> +        return false;
> +    }
> +
> +    func(dest, addr, val, ctx->mem_idx, mop);
> +    gen_set_gpr(a->rd, dest, EXT_NONE);
> +
> +    return true;
> +}

As I said before, gen_am_db may be removed, as it is identical to gen_am.


r~

