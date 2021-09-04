Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F77C400B73
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 15:18:01 +0200 (CEST)
Received: from localhost ([::1]:38444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMVYV-0007u4-DT
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 09:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMVV5-0005Yl-Gj
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 09:14:27 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMVV3-0007ux-Vk
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 09:14:27 -0400
Received: by mail-ej1-x62a.google.com with SMTP id h9so3689126ejs.4
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aClY7QydOjASw/JOuCW6S43P6F1m4bJiWnrS6XguIW4=;
 b=lVIS6V9mozv+9pUwWFU+dBPyK/S6Kpl5T5A5FKvJoPT8OhaNM62aZz0M8AUnsa/ktE
 bDgq76VdREUyiU5CSneNbA1wjo6cwJQbSu0W1C6M5UPfZx70S2yljW74iYynXIquiND6
 mBCkt7ekjkMGCXeX2H7Y9IaGB4TN2bW8hVAdPJa9cH/HnIx0l5T78jYNpaKe1m9X32tV
 lnBEP21DI2uuNxNi0DwGEybSQzFRnEj/iKJXrGzSNb3gKJP/G4TH+NJr955J3pz9vS9m
 OZk4d6qijZz2OTKHJ09n+K6quMnZc4hM2lZqAl6nR7lVkjL+6Q2PEpwT2ptFjQlu+zRQ
 9imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aClY7QydOjASw/JOuCW6S43P6F1m4bJiWnrS6XguIW4=;
 b=WmGKZU+fd4/tHL3l8aW+qJJy0VVoGgGUO9gcFSbOK0HDDojx0edkM35gFIsqeB+oCA
 QXK+ToqSceaR8X8f0QMOrZ5PT+YfKIaDlzlwAWUmwUkvpGHfK+SMNZ5WMA+imgnu+/6v
 KzHU837Rrp7KAaFXJ+Q4ue1nOSX97ysnDrK9+Oz72MHakjL06YgDq41rMr9XzXp6NnyQ
 IlLfdlYyKpyEt/xWtc+8prEnQhM5YuZMx183NNZIhHyGaHLocHtXgCIC3H1HojfXqMq7
 1Tal0Od8jTAWECbSl1V43wEtl3KAo3OMtGg/QQHIgxZKht2VnQtcwdb6IjpJjEu4luMM
 vzFw==
X-Gm-Message-State: AOAM5305jKfzR3urciCrWnjOtIgZAre5wDVQ+2ItUmMXOnwaFFW78zXX
 0Xmp0FgDDh9Op4ZLyKF7AVm7oA==
X-Google-Smtp-Source: ABdhPJy9Kcw1CBke8tT9AmXEL7vTL3t1miwNGgZ3pIzJUyDubK30E21ViUUOaI904X8+uGUwCezcRw==
X-Received: by 2002:a17:907:7601:: with SMTP id
 jx1mr4097981ejc.69.1630761263581; 
 Sat, 04 Sep 2021 06:14:23 -0700 (PDT)
Received: from [192.168.127.34] ([185.81.136.19])
 by smtp.gmail.com with ESMTPSA id b13sm1327699edu.27.2021.09.04.06.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 06:14:23 -0700 (PDT)
Subject: Re: [PATCH v4 08/21] target/loongarch: Add fixed point atomic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-9-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fe7ea217-5f4e-ec65-f23c-9a64bde90d47@linaro.org>
Date: Sat, 4 Sep 2021 15:14:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-9-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:40 PM, Song Gao wrote:
> +static bool gen_sc(DisasContext *ctx, arg_fmt_rdrjsi14 *a, MemOp mop)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv src2 = gpr_src(ctx, a->rd, EXT_NONE);
> +    TCGv t0 = tcg_temp_new();
> +
> +    TCGLabel *l1 = gen_new_label();
> +    TCGLabel *done = gen_new_label();
> +
> +    tcg_gen_addi_tl(t0, src1, a->si14 << 2);
> +    tcg_gen_brcond_tl(TCG_COND_EQ, t0, cpu_lladdr, l1);
> +    tcg_gen_movi_tl(dest, 0);
> +    tcg_gen_br(done);
> +
> +    gen_set_label(l1);
> +    /* generate cmpxchg */
> +    tcg_gen_atomic_cmpxchg_tl(t0, cpu_lladdr, cpu_llval,
> +                              src2, ctx->mem_idx, mop);

This is incorrect when dest and src2 overlap, as you've already clobbered dest.

> +static bool gen_am(DisasContext *ctx, arg_fmt_rdrjrk *a, DisasExtend ext,
> +                   void (*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
> +                   MemOp mop)
> +{
> +    ctx->dst_ext = ext;
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv val = gpr_src(ctx, a->rk, EXT_NONE);
> +
> +    if ((a->rd != 0) && ((a->rj == a->rd) || (a->rk == a->rd))) {
> +        qemu_log("%s: waring, register equal\n", __func__);
> +        return false;
> +    }
> +
> +    func(dest, addr, val, ctx->mem_idx, mop);
> +
> +    if (ctx->dst_ext) {
> +        gen_set_gpr(ctx, a->rd, dest);
> +    }
> +    return true;
> +}
> +
> +static bool gen_am_db(DisasContext *ctx, arg_fmt_rdrjrk *a, DisasExtend ext,
> +                      void (*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
> +                      MemOp mop)
> +{
> +    ctx->dst_ext = ext;
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv val = gpr_src(ctx, a->rk, EXT_NONE);
> +
> +    if ((a->rd != 0) && ((a->rj == a->rd) || (a->rk == a->rd))) {
> +        qemu_log("%s: waring, register equal\n", __func__);

qemu_log_mask(LOG_GUEST_ERROR,
               "Warning: source register overlaps destination register"
               "in atomic insn at pc=0x" TARGET_FMT_lx "\n",
               ctx->base.pc_next - 4);

> +    if (ctx->dst_ext) {
> +        gen_set_gpr(ctx, a->rd, dest);
> +    }

Again, extension should be taken care of by mop.


r~

