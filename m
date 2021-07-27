Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051E13D7AB0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 18:14:04 +0200 (CEST)
Received: from localhost ([::1]:49052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8PiV-0005Ek-3g
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 12:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8PhS-0004Wd-SV
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:12:58 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:45647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8PhR-0003zZ-8S
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:12:58 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso5539109pjf.4
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 09:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oILhkNlBuyd5Kcghq0LheeBJif+xl+Do1B7FYkuwrFI=;
 b=PMgFaRb+DFCsDuHugiBIRscnUzbEe5f2xp/yE2sRAwtj6FI3zsl7ED5CgfRLbEAMfR
 5i2YHr0MTfl/p9FBYAQP3mgAmvRk+6I2WPnl8jnK1QKa+Jqv/IRqT4PNrtKmDSKdVDUC
 xosKv9zRKdEOMvxCVpYwfa99j6x+cGJuCZqUae9rfHwPrx5rEIQXdFBbfkkSp0+dxrWn
 GtP+mIo/+YWEDaiU9oOrRpxJBnc3sIyebWwpKCaFc8AV/W+algrCe8v9aNpcVnSRlBMl
 LDSbmFqXr2AlFWUW9ODnfkjmCFLEs5n2OAoqkmw/eE5HFHIzw0OG6bN3JtmVIe0ZVZG4
 f9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oILhkNlBuyd5Kcghq0LheeBJif+xl+Do1B7FYkuwrFI=;
 b=iVAiveCAYhFyZJRWchLq68QbLtl6436rH+FCmlmSXWi1mtHZkKHdkJhaoihtWgLiEB
 QzvAEUneC8sqEn/MwRgo1LM5DeQaX3izIirMhpm/EwsL91xaVuhttyXBBu8pIskhVwTR
 T0VBQc8pj4aAu5R90Mvakjdoo3u6+mpca0YMNNc+nc6n3kx67ztsa1Rz+dWawKh6RGDt
 Gubkujn3VKn518tbzrXFQz7kyleLC6iFM/7qjXjdM36Jk/hu6XAxMjxHTebcpxmHG9bZ
 DE508Pk7J9SQ96mgelxPkfRXUCb+VUmkTw1+OUZ9IPfY61UKqQiW2AQzgQxj7ExPMN27
 lUXw==
X-Gm-Message-State: AOAM532nB4szxocZHPuQ6jY9k1aFOTHn/D1bCWVtW1bTaSEbWsiYSwwX
 8dM6QW9Pq0+RbMllyYEaCaNzig==
X-Google-Smtp-Source: ABdhPJzakS9cj4Pk6w0oamYi4VVRTr1WbkNUQL+WBGsfHWrkJdfUdn0DUlwx6aYVpfWzEJ7a1GWgNQ==
X-Received: by 2002:a17:902:8348:b029:12b:b2a0:941b with SMTP id
 z8-20020a1709028348b029012bb2a0941bmr19406410pln.62.1627402374073; 
 Tue, 27 Jul 2021 09:12:54 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id n56sm4088523pfv.65.2021.07.27.09.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 09:12:53 -0700 (PDT)
Subject: Re: [PATCH v2 13/22] target/loongarch: Add floating point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-14-git-send-email-gaosong@loongson.cn>
 <1729aea1-a773-ad78-59d3-294eb968a7ba@linaro.org>
 <8e5f166a-ed88-af3c-9aae-63c9977446ec@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <179b2d4e-7b0d-43ba-9f35-84ac728029f1@linaro.org>
Date: Tue, 27 Jul 2021 06:12:49 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8e5f166a-ed88-af3c-9aae-63c9977446ec@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, qemu-devel@nongnu.org,
 maobibo@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 9:17 PM, Song Gao wrote:
>> I think this should be as simple as
>>
>>    gen_helper_fp_add_s(cpu_fpu[a->fd], cpu_env,
>>                        cpu_fpu[a->fj], cpu_fpu[a->fk]);
>>
>> I also think that loongarch should learn from risc-v and change the architecture to "nan-box" single-precision results -- fill the high 32-bits with 1s.  This is an SNaN representation for double-precision and will immediately fail when incorrectly using a single-precision value as a double-precision input.
>>
>> Thankfully the current architecture is backward compatible with nan-boxing.
>>
> 
> by this method,  the trans_fadd_s is
> 
> static bool trans_fadd_s(DisasContext *ctx, arg_fadd_s * a)
> {
>      TCGv_i64 fp0, fp1;
> 
>      fp0 = tcg_temp_new_i64();
>      fp1 = tcg_temp_new_i64();
> 
>      check_fpu_enabled(ctx);
>      gen_load_fpr64(fp0, a->fj);
>      gen_load_fpr64(fp1, a->fk);
>      gen_helper_fp_add_s(fp0, cpu_env, fp0, fp1);
> 
>      gen_check_nanbox_s(fp0, fp0); /* from riscv */
> 
>      gen_store_fpr64(fp0, a->fd);
> 
>      tcg_temp_free_i64(fp0);
>      tcg_temp_free_i64(fp1);
> 
>      return true;
> }

A few points here:

(1) You do not need gen_load_fpr64 and gen_store_fpr64 at all.
     These were from mips to deal with the varying fpu sizes.

(2) If we need to call a helper, then the helper as much of
     the work a possible.  Therefore the nanboxing should be
     done there.  See riscv/fpu_helper.c, and the use of
     nanbox_s within that file.

(3) Again, use a helper function:

static bool gen_binary_fp(DisasContext *ctx, arg_fmt_fdfjfk *a,
                           void (*func)(TCGv_i64, TCGv_env,
                                        TCGv_i64, TCGv_i64))
{
     if (check_fpu_enabled(ctx)) {
         func(cpu_fpr[a->fd], cpu_env,
              cpu_fpr[a->fj], cpu_fpr[a->fk]);
     }
     return true;
}

TRANS(fadd_s, gen_binary_fp, gen_helper_fp_add_s)
TRANS(fadd_d, gen_binary_fp, gen_helper_fp_add_d)

> uint64_t helper_fp_add_s(CPULoongArchState *env, uint64_t fp, uint64_t fp1)
> {
>      uint32_t fp2;
> 
>      fp2 = float32_add((uint32_t)fp, (uint32_t)fp1, &env->active_fpu.fp_status);
>      update_fcsr0(env, GETPC());
>      return (uint64_t)fp2;
> }

with return nanbox_s(fp2);


r~

