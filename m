Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7424D385D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 19:03:05 +0100 (CET)
Received: from localhost ([::1]:38560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS0eM-0001I8-7s
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 13:03:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nS0ct-0000Yr-Rc
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:01:31 -0500
Received: from [2607:f8b0:4864:20::62c] (port=33673
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nS0cs-0002KO-4r
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:01:31 -0500
Received: by mail-pl1-x62c.google.com with SMTP id m2so2690143pll.0
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 10:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XxLwNSZlLVE8sLryOyCgkdRntL7Y+/KsN4myOLfSFLQ=;
 b=e31v0lOmYnniy1f1NboN/gfAgb7ZUW7wmhBME1gUIDK2eCZFEyURmywDO4voV/bGF9
 YYABpmbTFlfv99kLeQX5ZbTIJPAnyWoEbK2Gh4PKAC052dZeFYnFfPF1oW6SkFjUtsCm
 YjSi97COO2HqlN+luh2Q5HpR2dEH6uTxsB9nN90g1kwy/RLplgfwhTa1/mabcSKGcqfP
 17p7GDHo453GvIrVlUs8/sPAn5X7pEP7YEqqs89oqhoSnbkBS25SbOwQCi8xo6rbdTsX
 GbUvw7ZvLttU91uFePwLWcvQB9mZJbmHZ8F0IH6f5+8miMKGaVZMioQCkTsC+13DYNJl
 UMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XxLwNSZlLVE8sLryOyCgkdRntL7Y+/KsN4myOLfSFLQ=;
 b=hG1J6vIcjZmTTgBDVb5G9YHW5pIWfjMtgnzxZjOhgLZl4giDaLe040ADHZyoKk4d1f
 Zw9DRN57PfPsksdWP5PkDVwQ30nNRcTATfiWMd6h4OLpuIVoxpEAN6JLcfiOJU85NGDS
 wK6YUJfxnq9Dsrw7t21T8sONGRbko3UgNutDCpL6a6eEdQJHkbgR7youlK1NLecVM/sb
 +M08gWcyncyxhGrZD76zMBz3H6mex0MnIgoaaydJNJOTpQz6A+nAQoAcEsnZ9fmyjunu
 hDLudYNyMSNMvoIJbmRLVVXv/Qzgm0hTxQbqjeff3N9KpH/Lh1q4x5bVQ/PoqLJwuyIB
 L0hg==
X-Gm-Message-State: AOAM533HvQBySubPwhtsTpL+QUk8YB52rPsHB/gF+uym+vtpLw31pMxK
 23npV3x9yCy9BmVQ2SdH1MQbew==
X-Google-Smtp-Source: ABdhPJxd0L2KiwDoafUz1BPq0ibVqOpi9WAllglA4EUJi2wTY7s5BBoIerZ16ZtfsNiDFqDzKhm3rQ==
X-Received: by 2002:a17:902:7407:b0:151:f6d0:f54e with SMTP id
 g7-20020a170902740700b00151f6d0f54emr642408pll.129.1646848886377; 
 Wed, 09 Mar 2022 10:01:26 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i128-20020a626d86000000b004f3f2929d7asm3558858pfc.217.2022.03.09.10.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 10:01:25 -0800 (PST)
Message-ID: <87da3bea-cb41-e2a2-2141-02b7b18688b6@linaro.org>
Date: Wed, 9 Mar 2022 08:01:23 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 24/33] target/nios2: Introduce shadow register sets
Content-Language: en-US
To: Amir Gonnen <amir.gonnen@neuroblade.ai>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-25-richard.henderson@linaro.org>
 <PA4PR09MB4880283917696C2597102A4FEB0A9@PA4PR09MB4880.eurprd09.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <PA4PR09MB4880283917696C2597102A4FEB0A9@PA4PR09MB4880.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: "marex@denx.de" <marex@denx.de>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/22 04:02, Amir Gonnen wrote:
> How does "cpu_crs_R" work?
...> Otherwise, each gpr access would be indirect. I'm probably missing something here.

They are indirect, but with some optimization.

> +    TCGv_ptr crs = tcg_global_mem_new_ptr(cpu_env,
> +                                          offsetof(CPUNios2State, crs), "crs");
> +
> +    for (int i = 0; i < NUM_GP_REGS; i++) {
> +        cpu_crs_R[i] = tcg_global_mem_new(crs, 4 * i, gr_regnames[i]);
> +    }

Note that the crs variable is relative to env, and then the cpu_crs_R registers are 
relative to crs.

Without an EIC-enabled kernel for testing, it's hard for me to show the nios2 code at 
work, but it is identical to what we do over in target/sparc:

>     for (i = 8; i < 32; ++i) {
>         cpu_regs[i] = tcg_global_mem_new(cpu_regwptr,
>                                          (i - 8) * sizeof(target_ulong),
>                                          gregnames[i]);
>     }

A small example of what this looks like is -d in_asm,op_ind,op_opt :

IN: __libc_start_main
0x00000000001032e8:  save  %sp, -720, %sp
0x00000000001032ec:  stx  %i0, [ %fp + 0x87f ]
0x00000000001032f0:  stx  %i1, [ %fp + 0x887 ]
0x00000000001032f4:  stx  %i2, [ %fp + 0x88f ]

OP before indirect lowering:
  ld_i32 tmp0,env,$0xfffffffffffffff8
  brcond_i32 tmp0,$0x0,lt,$L0              dead: 0 1

  ---- 00000000001032e8 00000000001032ec
  add_i64 tmp3,o6,$0xfffffffffffffd30      dead: 1 2
  call save,$0x0,$0,env                    dead: 0
  mov_i64 o6,tmp3                          sync: 0  dead: 0 1

  ---- 00000000001032ec 00000000001032f0
  add_i64 tmp2,i6,$0x87f                   dead: 2
  qemu_st_i64 i0,tmp2,beq,0                dead: 0 1

  ---- 00000000001032f0 00000000001032f4
  add_i64 tmp2,i6,$0x887                   dead: 2
  qemu_st_i64 i1,tmp2,beq,0                dead: 0 1

  ---- 00000000001032f4 00000000001032f8
  add_i64 tmp2,i6,$0x88f                   dead: 1 2
  qemu_st_i64 i2,tmp2,beq,0                dead: 0 1


You can see that early on, we optimize with the windowed registers themselves (o[0-7] and 
i[0-7] here).  But then we lower that to explicit load/store operations:


OP after optimization and liveness analysis:
  ld_i32 tmp0,env,$0xfffffffffffffff8      pref=0xffff
  brcond_i32 tmp0,$0x0,lt,$L0              dead: 0 1

  ---- 00000000001032e8 00000000001032ec
  ld_i64 tmp20,regwptr,$0x30               dead: 1  pref=0xffff
  add_i64 tmp3,tmp20,$0xfffffffffffffd30   dead: 1 2  pref=0xf038
  call save,$0x0,$0,env                    dead: 0
  st_i64 tmp3,regwptr,$0x30                dead: 0

  ---- 00000000001032ec 00000000001032f0
  ld_i64 tmp36,regwptr,$0xb0               pref=0xf038
  add_i64 tmp2,tmp36,$0x87f                dead: 2  pref=0xffff
  ld_i64 tmp30,regwptr,$0x80               pref=0xffff
  qemu_st_i64 tmp30,tmp2,beq,0             dead: 0 1

  ---- 00000000001032f0 00000000001032f4
  add_i64 tmp2,tmp36,$0x887                dead: 2  pref=0xffff
  ld_i64 tmp31,regwptr,$0x88               pref=0xffff
  qemu_st_i64 tmp31,tmp2,beq,0             dead: 0 1

  ---- 00000000001032f4 00000000001032f8
  add_i64 tmp2,tmp36,$0x88f                dead: 1 2  pref=0xffff
  ld_i64 tmp32,regwptr,$0x90               dead: 1  pref=0xffff
  qemu_st_i64 tmp32,tmp2,beq,0             dead: 0 1


You can now see the new tmpN variables, and the uses of regwptr in the loads and stores.


r~

