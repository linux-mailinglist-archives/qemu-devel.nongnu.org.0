Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FCB23493B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jul 2020 18:33:58 +0200 (CEST)
Received: from localhost ([::1]:48330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1Xyn-0004qH-74
	for lists+qemu-devel@lfdr.de; Fri, 31 Jul 2020 12:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1XxZ-0004Li-NE
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 12:32:41 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1XxX-0000kY-Po
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 12:32:41 -0400
Received: by mail-pg1-x534.google.com with SMTP id h12so4939279pgf.7
 for <qemu-devel@nongnu.org>; Fri, 31 Jul 2020 09:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=97ez9Msz6ZXBkfLdxCU+jHdYwoba18ouYVTbPFrEVCI=;
 b=IMkuhVt58jPK9MqMk69IEh87D9ASMBZvPDuHPfA41QaW791XsUaJhsxlzmprWG0IMA
 EI2kfWy6UA5NLuaoTgoOYLmsMwH0yZc5OM4h/3YpwdtAPr8oNVD3d0k12Cb3M/i8fNaN
 q2bmmPkk+K2BDDjGL9lVGCJ86jfM86Gh1E0g4B4TsOmF2ngnGsKxQfC0/uVJNbAirzDX
 1HiUTQbLNEX2fUT6KFVx2rCtL5IXhOZxW/vztRmV7EQ0l2po+TKE/ZeyX+3wA3XyULOf
 YPbalw1mD7i+HNyCYd6YhricI6iNWVOuJ8FiiXJ0ha5h5IFkygDIU1+SDN8wTa/3V998
 9vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=97ez9Msz6ZXBkfLdxCU+jHdYwoba18ouYVTbPFrEVCI=;
 b=IYdIfjmUnzHdzHgTIJ/MwAHWtWI9btoqWYP/Xn0OFSwKZsUe930hvLKFr+6MhLSiBI
 JGIux7vxqlDaIQmDwVZLMlhqZCkuCu7I+qUZTHhtxXXE6Jjq7pRO7+v+4YsysDHThNgf
 E8SH5wbDmTar4HN8SXaZfeFQlcubLCPG94HEjcc5edAF1JhqjEeI+dpejW3+jtSQCOOX
 HWvdQYAeivfxzLMWpEijbsQmzJGxrRfPR26anLqF2lgUsu1bCEZJGnKuWZtBo5SUEpnS
 g3tg8oQpVeMnlk3I2b9aZ2HGogTv3FSyJTPupIV7etZ5ruC/5mO8TUQ+5PTg00f32a5B
 vGCg==
X-Gm-Message-State: AOAM532lYtPk51IhS8N+0iSQVCSPVHRKMiEVaGVZNLMgwx0FSUaxSO3l
 3wNACoaQ/b2sQvlna0ntHYEwYQ==
X-Google-Smtp-Source: ABdhPJzGU3H1FHVmI6FBTSN4dL3AzHHpw2iGSU5fU3yq+EnsTxOpqdvTz2XoxQz0kUUNg+z0frvhvw==
X-Received: by 2002:a63:6dc2:: with SMTP id i185mr3108773pgc.104.1596213158170; 
 Fri, 31 Jul 2020 09:32:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id u2sm10610783pfl.21.2020.07.31.09.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 09:32:37 -0700 (PDT)
Subject: Re: [RFC v2 61/76] target/riscv: rvv-0.9: floating-point/integer
 type-convert instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-62-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <367acdf4-f90a-9b6e-b091-7c1a2d923ca5@linaro.org>
Date: Fri, 31 Jul 2020 09:32:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-62-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> @@ -994,6 +994,12 @@ DEF_HELPER_5(vfcvt_f_xu_v_d, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfcvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfcvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfcvt_f_x_v_d, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfcvt_rtz_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfcvt_rtz_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfcvt_rtz_xu_f_v_d, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfcvt_rtz_x_f_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfcvt_rtz_x_f_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfcvt_rtz_x_f_v_d, void, ptr, ptr, ptr, env, i32)

You do not need new rtz helpers.

What you need to do is adjust the translator to set the correct rounding mode.
 At present we've got

> #define GEN_OPFV_TRANS(NAME, CHECK)                                \
> static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
> {                                                                  \
>     if (CHECK(s, a)) {                                             \
>         uint32_t data = 0;                                         \
>         static gen_helper_gvec_3_ptr * const fns[3] = {            \
>             gen_helper_##NAME##_h,                                 \
>             gen_helper_##NAME##_w,                                 \
>             gen_helper_##NAME##_d,                                 \
>         };                                                         \
>         TCGLabel *over = gen_new_label();                          \
>         gen_set_rm(s, 7);                                          \

were we set the rounding mode to "dynamic", i.e. pull the mode out of FRM.  And
will in fact raise SIGILL if FRM has been set to an illegal value.  Which, I'm
sure, should not happen for this instruction.

For these insns, you want to use gen_set_rm(s, 1), which will set the rounding
mode to float_round_to_zero.

(As a separate patch, it would be nice to add an enumeration for the various
settings of FRM, replacing the integer constants that are currently scattered
about the code.)


r~

