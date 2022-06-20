Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A3B55222D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:25:27 +0200 (CEST)
Received: from localhost ([::1]:59488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3KDO-000364-6q
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3KBe-0002LR-Ao
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:23:38 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3KBc-0004Yu-Hm
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:23:37 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so10786141pjz.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 09:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ogdwi5sW9PHnhD+rVwrNsiQ3o9tYmxMv13o9sdfR0vk=;
 b=p1M5N/4NJKBKd1sayVfjvSDKpePHB/EYejcByiXLCq0FD8V7SXg6v8O01BpJt5Sod/
 W9jx+A1WenEXJjaBQaq1kpVATTFem/1q1s+2sVzq2JldzpVHUJyiCviM6ezxsL9GYEod
 V1FbksP6KT2ViL6UTCJrp3ZFTS1cJlcSrm9cl18I9Iui3acxEOcUmIgHpTCHtiPNnPq2
 GdxwZIY0pc8BEhwoFn17XnrzVAC3iK1fhcYJx44PUPSS3lL3/F/qObOtpNHu6XBpb9vV
 fJoiTNT8FxZery3qT/G9QcG7ZSRH18iYuwkTAnKQ7t6v4p6Nety5mk36aPThvXzaot/l
 1foA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ogdwi5sW9PHnhD+rVwrNsiQ3o9tYmxMv13o9sdfR0vk=;
 b=pK+DcJsbDSgfbClnMz1OEBQHZDAE5QxEVluak09QJS1C7HeklrqDCUjVHcYWwwbFgr
 psHDmNCaan1LndDZguURd66qx0CzGUxtVbxV1jAyaI2VVIat+VfZFmsBbUFsioOnshfH
 y0UOh1DnuDlZLwJMPCX4OW3a+xzFCk1wjLeuQByfJAF3YsVmJlWv6zoG7HGxY+LE6aX1
 EWUZBoyYKVJcgYTDMQqD9d6c3b91I/fe2sZgPmVra3U9wHTRjFMug20+6m+aDkTo+GhI
 aytiVlJGdCvwM7g7cRLwupw3ZVvMvrZSzxxvOBs9ujXUo7XIF9NAic++Rm9YTY0V/mCk
 ZOAA==
X-Gm-Message-State: AJIora+M/Uy4sP3us4aDrhV0PYPdECbHLzJtr/xNQFBINsXeVlQQSAmT
 pAUWQUvHre8Pe+Jgdz5/+IyI1A==
X-Google-Smtp-Source: AGRyM1uPrVw467B0CyHxcRX1mb7X96+pPfTV+3I0PU6VajqHTj9a7IHOEuCbmc++dlxrQxg61gL9mg==
X-Received: by 2002:a17:903:1108:b0:168:d2ba:70fd with SMTP id
 n8-20020a170903110800b00168d2ba70fdmr24341750plh.136.1655742214854; 
 Mon, 20 Jun 2022 09:23:34 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 ji18-20020a170903325200b0015ea8b4b8f3sm4875177plb.263.2022.06.20.09.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 09:23:34 -0700 (PDT)
Message-ID: <60e4b2f3-8e62-bd81-7ef3-298863afe16c@linaro.org>
Date: Mon, 20 Jun 2022 09:23:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v18 02/13] linux-user: Add LoongArch signal support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220620093401.3727352-1-gaosong@loongson.cn>
 <20220620093401.3727352-3-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220620093401.3727352-3-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/22 02:33, Song Gao wrote:
> +static int restore_sigcontext(CPULoongArchState *env,
> +                               struct target_sigcontext *sc)
> +{
> +    int i;
> +    int ret = 0;
> +    struct extctx_layout extctx;
> +
> +    memset(&extctx, 0, sizeof(struct extctx_layout));
> +
> +    __get_user(extctx.flags, &sc->sc_flags);
> +
> +    ret = parse_extcontext(sc, &extctx);
> +    if (ret < 0) {
> +        goto bad;
> +    }
> +
> +    __get_user(env->pc, &sc->sc_pc);
> +    for (i = 1; i < 32; ++i) {
> +        __get_user(env->gpr[i], &sc->sc_regs[i]);
> +    }
> +
> +    if (extctx.fpu.addr) {
> +        copy_fpu_from_sigcontext(env, &extctx);
> +        restore_fp_status(env);
> +    }
> +bad:
> +    return ret;
> +}

This is missing lock_user/unlock_user somewhere.
You can't use the double-underscore __get/__put_user without having done that.

You can use the non-underscore get_user in parse_extcontext, and separately lock the 
target_fpu_context.  Failures must goto invalid.


> +void setup_rt_frame(int sig, struct target_sigaction *ka,
> +                    target_siginfo_t *info,
> +                    target_sigset_t *set, CPULoongArchState *env)
> +{
> +    struct target_rt_sigframe *frame;
> +    struct extctx_layout extctx;
> +    abi_ulong frame_addr;
> +    int i;
> +
> +    frame_addr = get_sigframe(ka, env, sizeof(*frame), &extctx);
> +    trace_user_setup_rt_frame(env, frame_addr);
> +    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
> +        goto give_sigsegv;
> +    }

Similarly, this lock...

> +
> +    tswap_siginfo(&frame->rs_info, info);
> +
> +    __put_user(0, &frame->rs_uc.tuc_flags);
> +    __put_user(0, &frame->rs_uc.tuc_link);
> +    target_save_altstack(&frame->rs_uc.tuc_stack, env);
> +
> +    setup_sigcontext(env, &frame->rs_uc.tuc_mcontext, &extctx);

... fails to cover the extra memory allocated for extctx.

This is why I suggested statically allocating the extra
pieces of the signal frame *on write*.  You obviously
cannot rely on the signal frame being identical on
signal return -- the guest is allowed to create any valid
context to give to rt_sigreturn.


r~

