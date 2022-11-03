Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D6F6189E8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 21:49:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqh84-0005Xq-OV; Thu, 03 Nov 2022 16:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqh7v-0005X8-4g
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 16:47:51 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqh7t-0000TW-Kp
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 16:47:50 -0400
Received: by mail-pf1-x430.google.com with SMTP id k15so2744132pfg.2
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 13:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/aGx0ytp20nSiOUXLDXVjtjJUGmuVLNqcYsFB3FfZaQ=;
 b=twPaO43Z3EMlq8Rvf2sj2CLfqaei0qfAfyjVpjZz3U22mnqVarSED2JW6VhS1UPO6p
 hOnaeXKeo/nQ8t1wK9jJOsWLoMWSaM1sZD3a01Q9gva37N+yRBqBcG0mFI4EMc8Qgzf/
 i9oHv+a3zjy7+HY+Hcydtu4OwteUTM6fn8g7WtvcnBFpp9lVCcP46+Cu4fq9xRFuPAVG
 Rnh80Jgf7MbfU41phlxy+KCAW05N9tcXFUqfXpD5dADxGze8A0kpGc+K47KImRwEIk2C
 rMqiFwOecoCIlQofxzFryL8vmMROB53ENeqEdDtrik7Dp6AE/83bKKDbFsUA1ZT094/m
 etLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/aGx0ytp20nSiOUXLDXVjtjJUGmuVLNqcYsFB3FfZaQ=;
 b=JBa+IiijWG5QKVhidKBehwjEfjuh91Z5DyD0IxJ2S+IhZ4LyLdAM+faQS+MmAFUobr
 Xjd1gkRA9hebCWPmER/HgzyuaO9NUIyijPn3dTnw6Sqwb1jqpV1EeQ9ZJOlSQGVzdkg6
 K+3B3dcLmWR7o0OiR/YndXw1idKVprOKMEXqLBi+SPzMcNGcLq2sIYHF/QLnwFSuUgNz
 4CF0dBfd9xmxk232YBtZr/wEWLVkFyC6Um0dfDz1o4VmEdnA7ltNLI5uOkO4gOcILLVT
 z/ImzULDYv841taH4Rrab2Rmh5oPzw/6V4JNgk1CgsFTOKbS+6Wmam3K75QeIEx4PerT
 vY4w==
X-Gm-Message-State: ACrzQf1bMTEPVBNyBJ2IHyDuP5GChDNLcOZgxynPOUnWDFvsRdF8ClUt
 k4zNY4N4PRJOhiq3mUtqYRhfnw==
X-Google-Smtp-Source: AMsMyM4DB/D9ctQtoQyEP38Q3z80bHocm3ZANKPV/geAr0GFL+aecZxM8qaGPjzxtFAC6tG27ZTVLA==
X-Received: by 2002:a05:6a00:15c8:b0:565:bc96:1c5b with SMTP id
 o8-20020a056a0015c800b00565bc961c5bmr32352825pfu.52.1667508467922; 
 Thu, 03 Nov 2022 13:47:47 -0700 (PDT)
Received: from [192.168.229.227] ([206.83.113.103])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a63e014000000b0045ff216a0casm1208798pgh.3.2022.11.03.13.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 13:47:47 -0700 (PDT)
Message-ID: <90980f4b-aeea-5c0d-11d4-e2609b455435@linaro.org>
Date: Fri, 4 Nov 2022 07:47:40 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH RFC] target/loongarch: Fix emulation of float-point
 disable exception
Content-Language: en-US
To: Rui Wang <wangrui@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: qemu-devel@nongnu.org, hev <qemu@hev.cc>
References: <20221103080232.55953-1-wangrui@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221103080232.55953-1-wangrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/22 19:02, Rui Wang wrote:
> +static void check_fpe(DisasContext *ctx)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    TCGLabel *skip = gen_new_label();
> +    TCGv tmp = tcg_temp_new();
> +
> +    tcg_gen_andi_tl(tmp, cpu_euen, R_CSR_EUEN_FPE_MASK);
> +    tcg_gen_brcond_tl(TCG_COND_NE, tmp, ctx->zero, skip);
> +    tcg_temp_free(tmp);
> +
> +    generate_exception(ctx, EXCCODE_FPD);
> +    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
> +
> +    gen_set_label(skip);
> +#endif
> +}

While this works, it is very inefficient.

You should cache the state of this bit in tb->flags, as set by cpu_get_tb_cpu_state.
Compare, for instance, target/riscv/,

FIELD(TB_FLAGS, MSTATUS_HS_FS, 16, 2)

for which ctx->mstatus_hs_fs controls whether the fpu is clean, dirty, or disabled.

At present, loongarch is using 3 bits of tb->flags for the mmu_idx, re-using that for 
privilege level in check_plv.  Which is nearly correct, except for the case of paging 
disabled in user mode.  This probably never happens in practice, but unless the cpu 
disallows such a state, this should be corrected.


r~

