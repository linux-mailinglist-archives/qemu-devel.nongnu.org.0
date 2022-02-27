Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A7A4C5E4C
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 19:53:12 +0100 (CET)
Received: from localhost ([::1]:54028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOfP-000859-KZ
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 13:53:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOZZ-0005NI-Bb
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:47:09 -0500
Received: from [2607:f8b0:4864:20::1029] (port=51186
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOZX-00084V-I3
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:47:08 -0500
Received: by mail-pj1-x1029.google.com with SMTP id m22so9276293pja.0
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 10:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3OzMR6GGv8dxv8BQ1qJzQJO/Pek8EQYtC24Q7zBAutk=;
 b=jXYnEyJsmblRHER/DylA7A0JPiqJ0Js2ah8a7OXjezV+lOXTW+Z38qLxeRR2Rqzk+F
 FAsRBCJr0iBayWNkMiOj2FffRCqmnKhkRZF7iEaJbUJ2ejb0Oy9B40KmPB1l+cj6nlEx
 mNZU+pa8xttFXHEzqVdGA3IN1zzg2A5kaowOIdS5W10eyKNTsab0ZVLmSiOHcc151GfM
 mOWRfJoa7H4vGoflF0WTT66monUK0ti6klL4405GCcv4bany26P3+5HaKmZ8IagW0bJT
 Nk+YXNNFyQL8fD6TC2ImMv2g1EVVPKmBZFnelojGxvxLTdMzZihvfpZhgH9Q0xuzSQU1
 Lygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3OzMR6GGv8dxv8BQ1qJzQJO/Pek8EQYtC24Q7zBAutk=;
 b=2WIzuNjh1E+0Y/hdJizlVjCPcVKYSD9ssONPCtMwIZw3wdin1mEjNDdkwA5dST8aAo
 h9BO+0OEMXHd5FVFi1L8lr1L8DPTxcPTtEcbuTDYJu800/xvoFzhAdPu0uGLPX+NP6zr
 j1bsV/02Pszi02PrNvtcUVthkj/nvLoA1i8e0fhNsiFOe5Mk6hhxgGBitbcsRBKumEOH
 ZVOb0Ngo8rMX75KfzNdu0Sy04rZPtnhhBzHccaDUPZnSWIqVoAjPEtFVjh6VY47WVFwB
 zVpQNsmW+X1zOpNrmv3AQtXtfm6ZjFEQ/OhGOs13w1jpmzX7exfngXvGlNqwf2SGsPOM
 8RRg==
X-Gm-Message-State: AOAM530IGk5CjoJc0WVAVUaCwf3bwPOXcGodlp1ou587EaBKlbACQ+tD
 hMarBnVuPrM52a4wJEGw5f9P/A==
X-Google-Smtp-Source: ABdhPJzKepUDdOYtFePU2+dDvfJ8zzryR9oFMmX4AyOTIh/6JIJ2pMFLH6I2zfNaIAf0GSmEs1zJUg==
X-Received: by 2002:a17:90b:2513:b0:1bc:545d:8dbe with SMTP id
 ns19-20020a17090b251300b001bc545d8dbemr13032311pjb.182.1645987626162; 
 Sun, 27 Feb 2022 10:47:06 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:23be:43d9:7006:705a?
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a056a001d0b00b004f4057fafe2sm1632186pfx.94.2022.02.27.10.47.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 10:47:05 -0800 (PST)
Message-ID: <e6a2401d-5ce2-c2cb-7ee2-fefe99818533@linaro.org>
Date: Sun, 27 Feb 2022 08:47:01 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 02/14] target/riscv: rvk: add support for zbkb extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220227142553.25815-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, luruibo2000@163.com,
 lustrew@foxmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/27/22 04:25, Weiwei Li wrote:
> +static void gen_packh(TCGv ret, TCGv src1, TCGv src2)
> +{
> +    TCGv t = tcg_temp_new();
> +
> +    tcg_gen_ext8u_tl(t, src2);
> +    tcg_gen_deposit_tl(ret, src1, t, 8, TARGET_LONG_BITS - 8);
> +    tcg_temp_free(t);
> +}
> +
> +static void gen_packw(TCGv ret, TCGv src1, TCGv src2)
> +{
> +    TCGv t = tcg_temp_new();
> +
> +    tcg_gen_ext16s_tl(t, src2);
> +    tcg_gen_deposit_tl(ret, src1, t, 16, 48);
> +    tcg_temp_free(t);
> +}

Missing TARGET_LONG_BITS here; would break on RV32.

> 
> +static bool trans_brev8(DisasContext *ctx, arg_brev8 *a)
> +{
> +    REQUIRE_ZBKB(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +    gen_helper_brev8(dest, src1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}
...
> 
> +static bool trans_unzip(DisasContext *ctx, arg_unzip *a)
> +{
> +    REQUIRE_ZBKB(ctx);
> +    REQUIRE_32BIT(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +    gen_helper_unzip(dest, src1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}
> +
> +static bool trans_zip(DisasContext *ctx, arg_zip *a)
> +{
> +    REQUIRE_ZBKB(ctx);
> +    REQUIRE_32BIT(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +    gen_helper_zip(dest, src1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}

Use gen_unary.

r~

