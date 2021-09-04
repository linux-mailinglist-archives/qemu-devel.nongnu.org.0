Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E832A400B6A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 14:59:28 +0200 (CEST)
Received: from localhost ([::1]:56210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMVGZ-0008JW-EE
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 08:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMVEt-0007ZT-Hf
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 08:57:43 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMVEr-0006jo-Pq
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 08:57:43 -0400
Received: by mail-ej1-x635.google.com with SMTP id i21so3634516ejd.2
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 05:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gxdAfNkxwoiZO72A/wOkreGsMbvEVv7P2iMiNdvdmqY=;
 b=BOm6DIS0Z7Oayl0FoEYB/XPsq2mMAcnv4flKY24PQ4ySa5BWXkGX27okTpyasxFtZc
 kU0DpZaIJDuweyFh4PdJSFNBhVfGzqvDq2gj1GqDLYfNVORqD4HfCjqnAXk+JsZKTl3L
 XHvwkCD8uugQgz64FJDcIjmn3O3peZgloCfZneXqDScJ5CqPJE2rvhRgs62p70NaFDZg
 +a/90dEfN9RhGZDBEBGZmdEkghhinzQTD28FeXJgjfkcou3q4kNAqWXb9p8nLXXz5TPb
 S4pnWE2RgIoHSHqDyHCMzRXuZnw1TfbnPMfiNugMsJq03Q6XGzXExJe+qNhNz0agUYx8
 p5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gxdAfNkxwoiZO72A/wOkreGsMbvEVv7P2iMiNdvdmqY=;
 b=dFxJRf9VfEwmfFI7GUpr7lU8JFNK9b90wZ0T70UFkg5ehBCWtCid+W7DGriH1B8mu8
 qQnPBQskFIlM8XipnFKFSanxGZmibcdRn5vf8gu7bGdTUdD4K+OsZRk6oiqlnAenvub8
 Iy2eqk3XUVf3ZIxe+Lp8hV3l+cGlBq7BlqnDAgJ6e8fQVEsyixPzCx7VozsOktQodVi2
 cNaspIfzdzazAHhC0ew0iz8vZMRRBFNyaU7wztVyfDEHZFcPC2f5oMLkCFGBjw9PFtEa
 oMSp1Yl2cCHR8yXQALA4+nJFOwuyshiOOP6otPWEcZhtc9oqLtWhXuYizlCiLUuTIi3E
 CMfw==
X-Gm-Message-State: AOAM533VIupC6MBeX5UXIdz2YnXkIwiimUoGcL7VZi7Kotuv2jJIheoq
 mL3oxtUxx+ltsjcTQVZvrN6eiw==
X-Google-Smtp-Source: ABdhPJxp+wr2Y6Q4LTM4CX6o9usIyc8eWq7v5mIPWw/7OS7Kd6zrarL3uFK67M2NrWwwya0QjMy8xg==
X-Received: by 2002:a17:906:a01:: with SMTP id
 w1mr4113426ejf.117.1630760260270; 
 Sat, 04 Sep 2021 05:57:40 -0700 (PDT)
Received: from [192.168.127.34] ([185.81.136.19])
 by smtp.gmail.com with ESMTPSA id di15sm1311385edb.20.2021.09.04.05.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 05:57:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 06/21] target/loongarch: Add fixed point bit
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-7-git-send-email-gaosong@loongson.cn>
Message-ID: <1635f37f-68ea-e4a3-ef29-9e1a002a3b7c@linaro.org>
Date: Sat, 4 Sep 2021 14:57:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-7-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x635.google.com
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
> +static void gen_clz_w(TCGv dest, TCGv src1)
> +{
> +    tcg_gen_clzi_tl(dest, src1, TARGET_LONG_BITS);
> +    tcg_gen_subi_tl(dest, dest, TARGET_LONG_BITS - 32);
> +}
> +
> +static void gen_clo_w(TCGv dest, TCGv src1)
> +{
> +    tcg_gen_not_tl(dest, src1);
> +    gen_clz_w(dest, dest);
> +}

This doesn't work, quite.  You need

     tcg_gen_not_tl(dest, src1);
     tcg_gen_ext32u_tl(dest, dest);
     gen_clz_w(dest, dest);

> +static void gen_ctz_w(TCGv dest, TCGv src1)
> +{
> +    tcg_gen_ori_tl(dest, src1, (target_ulong)MAKE_64BIT_MASK(32, 32));
> +    tcg_gen_ctzi_tl(dest, dest, 64);
> +}
> +
> +static void gen_cto_w(TCGv dest, TCGv src1)
> +{
> +    tcg_gen_not_tl(dest, src1);
> +    gen_ctz_w(dest, dest);
> +}

Likewise, this needs the OR after the NOT.
Alternately, zero-extend and use

   tcg_gen_ctzi_tl(dest, dest, 32);

> +static void gen_revb_2w(TCGv dest, TCGv src1)
> +{
> +    tcg_gen_bswap64_i64(dest, src1);
> +    tcg_gen_rotri_i64(dest, dest, 32);
> +}
> +
> +static bool trans_revb_2h(DisasContext *ctx, arg_revb_2h *a)
> +{
> +    ctx->dst_ext = EXT_SIGN;
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv mask = tcg_constant_tl(0x00FF00FF);
> +    TCGv t0 = tcg_temp_new();
> +    TCGv t1 = tcg_temp_new();
> +
> +    tcg_gen_shri_tl(t0, src1, 8);
> +    tcg_gen_and_tl(t0, t0, mask);
> +    tcg_gen_and_tl(t1, src1, mask);
> +    tcg_gen_shli_tl(t1, t1, 8);
> +    tcg_gen_or_tl(dest, t0, t1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    return true;
> +}

Split out the center of this so you can use gen_r2.

> +static bool trans_revb_4h(DisasContext *ctx, arg_revb_4h *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv mask = tcg_constant_tl(0x00FF00FF00FF00FFULL);
> +    TCGv t0 = tcg_temp_new();
> +    TCGv t1 = tcg_temp_new();
> +
> +    tcg_gen_shri_tl(t0, src1, 8);
> +    tcg_gen_and_tl(t0, t0, mask);
> +    tcg_gen_and_tl(t1, src1, mask);
> +    tcg_gen_shli_tl(t1, t1, 8);
> +    tcg_gen_or_tl(dest, t0, t1);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    return true;
> +}

Likewise.

> +static bool trans_revh_2w(DisasContext *ctx, arg_revh_2w *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv_i64 t0 = tcg_temp_new_i64();
> +    TCGv_i64 t1 = tcg_temp_new_i64();
> +    TCGv_i64 mask = tcg_constant_i64(0x0000ffff0000ffffull);
> +
> +    tcg_gen_shri_i64(t0, src1, 16);
> +    tcg_gen_and_i64(t1, src1, mask);
> +    tcg_gen_and_i64(t0, t0, mask);
> +    tcg_gen_shli_i64(t1, t1, 16);
> +    tcg_gen_or_i64(dest, t1, t0);
> +
> +    tcg_temp_free_i64(t0);
> +    tcg_temp_free_i64(t1);
> +
> +    return true;
> +}

Likewise.

> +
> +static bool trans_revh_d(DisasContext *ctx, arg_revh_d *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv t0 = tcg_temp_new();
> +    TCGv t1 = tcg_temp_new();
> +    TCGv mask = tcg_constant_tl(0x0000FFFF0000FFFFULL);
> +
> +    tcg_gen_shri_tl(t1, src1, 16);
> +    tcg_gen_and_tl(t1, t1, mask);
> +    tcg_gen_and_tl(t0, src1, mask);
> +    tcg_gen_shli_tl(t0, t0, 16);
> +    tcg_gen_or_tl(t0, t0, t1);

> +    tcg_gen_shri_tl(t1, t0, 32);
> +    tcg_gen_shli_tl(t0, t0, 32);
> +    tcg_gen_or_tl(dest, t0, t1);

This last is rotate by 32.

> +static void gen_maskeqz(TCGv dest, TCGv src1, TCGv src2)
> +{
> +    TCGv cond1 = tcg_constant_tl(0);
> +
> +    tcg_gen_movcond_tl(TCG_COND_EQ, dest, src2, cond1, cond1, src1);
> +}
> +
> +static void gen_masknez(TCGv dest, TCGv src1, TCGv src2)
> +{
> +    TCGv cond1 = tcg_constant_tl(0);
> +
> +    tcg_gen_movcond_tl(TCG_COND_NE, dest, src2, cond1, cond1, src1);
> +}

s/cond1/zero/g


r~

