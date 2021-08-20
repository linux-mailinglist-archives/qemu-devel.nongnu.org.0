Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C423F29FE
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 12:17:39 +0200 (CEST)
Received: from localhost ([::1]:44360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH1ak-0001Cz-Ej
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 06:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH1Yj-0008TH-Of
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:15:34 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH1Yh-0001Ea-QW
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:15:33 -0400
Received: by mail-ej1-x62b.google.com with SMTP id mf2so624830ejb.9
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 03:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/nyo/aWGwl7DWqHeC9E3XqUbQkEKAXVje3t2gZumcB4=;
 b=Bk3BvKqY2h2/Rda9kqiwDHhw+Zd38K/PZKc5gLUvv6Go6eND/IQhBDkP6hPxdlshYq
 EXDA/QflleRpu178bJNQ2iUJbluvAMn2Pfn79zDhSRf8i8nvVxcJQJsclE45EV/qiqTr
 hordbSoprjO3Ya1F9jPIfZKLcC2UH7DCSfitsTKWai1R/jV9nz/EP/YgJ4r6oBeTUV9Y
 n5zxplEKgZvJHokf9RnrEEgaNP+do2nwAvjdy09gbGqHLoHp3dTYebovhp0S5gAQA067
 Rz2fGuDb7lYOLIbgJ2Aoy4ROmGqp84toUTe+yP+RhfQqfnxJeRbyTjD4ERLpnO9I057C
 3WVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/nyo/aWGwl7DWqHeC9E3XqUbQkEKAXVje3t2gZumcB4=;
 b=hP6fnXQu/Y+Fp0BCgvnm5InbwGyQ6s/30WVj0pH90gtcoNVxTcXwaDQ0sq5JTtdPU6
 e1ltyW4pXyIDYaMxzniKNpZ6B1wgBYzgonxRnmEdf4d63H1xlBEoXn7XGCPid96bSjFu
 JjlNVc5NpT/F/ivegxgjX09sB/9OMMQPRbL4WRxapeS3d6qxW2W0Qp1aq0txvoYNKttX
 u26h3zrBySU19FAfgYPWBbaSLq4V2vciX9qhj6IVbZIGnyNoZeMm5SDP/QYVN+yELRiA
 z9DVzMUYR/ZxuC/cNDXM4L7Vx0OhMOE8Otrh9MgqcujMfEycPLxZ9S2fcrXdJW8xsPd5
 qG1g==
X-Gm-Message-State: AOAM533X1urC5bHPKhsJUDQo7w6LCUc953woZCsCmVFTyXlo2T3TD121
 kldIFHeXtLvYY7ZhxctzJoOOdhALGA/O3YfZLhv3uoLdTyU=
X-Google-Smtp-Source: ABdhPJxAxTQd0lu6x145vQVDdZeCAbxkeqtT3olNwG5yW0ksIZtlMTOadNhfLSEhAP1RF/AR5A4j4DtgoQYoVoXaHCc=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr20743707ejy.407.1629454529217; 
 Fri, 20 Aug 2021 03:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-64-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-64-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 11:14:43 +0100
Message-ID: <CAFEAcA9Ze3zzQ_O1rRJKaP-681RDJf288uQJx83GEduHetAegQ@mail.gmail.com>
Subject: Re: [PATCH v3 63/66] tcg/tci: Support raising sigbus for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 21:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/tcg/tci.c b/tcg/tci.c
> index e76087ccac..985c8a91cb 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -296,7 +296,7 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
>      uintptr_t ra = (uintptr_t)tb_ptr;
>
>  #ifdef CONFIG_SOFTMMU
> -    switch (mop) {
> +    switch (mop & (MO_BSWAP | MO_SSIZE)) {
>      case MO_UB:
>          return helper_ret_ldub_mmu(env, taddr, oi, ra);
>      case MO_SB:
> @@ -326,10 +326,14 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
>      }
>  #else
>      void *haddr = g2h(env_cpu(env), taddr);
> +    unsigned a_mask = (1u << get_alignment_bits(mop)) - 1;
>      uint64_t ret;
>
>      set_helper_retaddr(ra);
> -    switch (mop) {
> +    if (taddr & a_mask) {
> +        helper_unaligned_ld(env, taddr);
> +    }
> +    switch (mop & (MO_BSWAP | MO_SSIZE)) {
>      case MO_UB:
>          ret = ldub_p(haddr);
>          break;
> @@ -377,11 +381,11 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
>  static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
>                          MemOpIdx oi, const void *tb_ptr)
>  {
> -    MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
> +    MemOp mop = get_memop(oi);
>      uintptr_t ra = (uintptr_t)tb_ptr;

Don't you need this bit in tci_qemu_st() as well ?


-- PMM

