Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE33E3CD4A4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:22:17 +0200 (CEST)
Received: from localhost ([::1]:59028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5SHp-00077C-1m
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SFU-0005lb-Eh
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:19:52 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:37434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SFS-0007X1-Ob
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:19:52 -0400
Received: by mail-ed1-x532.google.com with SMTP id h8so23686575eds.4
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ws7N017r5k1OFHuZqdIPkI20onmfRh6JZcdkcLpMtR0=;
 b=bor3x/Mn1XN0DhK3qGYJ94bg78awr3ERt4TW5z8f2BXC6KhwMXAwlnS0SELwVh8/cC
 Lt/QXalLtToi1B2Lo45UjUzZQ0yophbSai+qL4tyILm6AfB1ynOuJO/3LICvfA6Dbx2g
 gRwZJ0Zin7FN99Uu7/TDBNTAzg7oVV4We1ChuitkLJy68T9q8bSW+oBuGKNEp5zvNzxe
 B018iTdYb8FADb/MsBI/opiWT9kl334Taxoust96XMsn22Vf7oR+HuWH6s/EhsAFAJl/
 m7TdTD0c527vw/lyDWjuTYsKa0YNsrpRqvMiOEc63cKE4hPi4mIlCooir+93WoUg4YZR
 YL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ws7N017r5k1OFHuZqdIPkI20onmfRh6JZcdkcLpMtR0=;
 b=PYQt6P7mHoJxUrZcxwPFFssOyykMPT/UMN8Q3Khh9h91QgjFYgoNpgSBUozsMoxPft
 ysglBePskuD7aJLpLD2mj72Zuh/sjGSMn2dayFyfJIOCPwWBghbSC9MmJMOdvx04zTjs
 xTDjrji4fgTGpr9odDqsRKFMkLIPbzCL3zJ59+QJvakMt6NKbgJxlWX6eyTqFPqgf77f
 CWkczKHwnPQ42tAJv47lQ7wiLDmiHCAXOSZwLQ2y7GBeB17PsP86iTu8qJ9GoLSafw8a
 qCRTeFglpxTPerER1KfhnPcqaDCEOFMyejxisuTb38MCjdKNSVtlD/XIBpG7gurqAL60
 5ApA==
X-Gm-Message-State: AOAM531CEeJqbOreOvYJnhHyjJzoAL9NQ2d2z029Wx6v1ZPSslfnEEDe
 EQzXIme+JZ1YLpr1ZU4SS8vo+Q141JB4vLJ5hCAiAw==
X-Google-Smtp-Source: ABdhPJzK8igm+smObnA6Edxh2mTC6c90NlnzzoIKDo4AT+13d1DWl/cjnWwLxqs4o+PdWI1Q61KjdFwzq8RaiHna1YM=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr33818610edt.100.1626697188255; 
 Mon, 19 Jul 2021 05:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
 <20210717192419.2066778-6-richard.henderson@linaro.org>
In-Reply-To: <20210717192419.2066778-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:19:07 +0100
Message-ID: <CAFEAcA9q_wHfrUZHd89yAiwsAbNhFEGtHm-mUe+caP7+MdfdWg@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] accel/tcg: Standardize atomic helpers on softmmu
 api
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 20:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reduce the amount of code duplication by always passing
> the TCGMemOpIdx argument to helper_atomic_*.  This is not
> currently used for user-only, but it's easy to ignore.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> @@ -3144,14 +3137,8 @@ void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
>          gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
>          tcg_debug_assert(gen != NULL);
>
> -#ifdef CONFIG_SOFTMMU
> -        {
> -            TCGMemOpIdx oi = make_memop_idx(memop & ~MO_SIGN, idx);
> -            gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
> -        }
> -#else
> -        gen(retv, cpu_env, addr, cmpv, newv);
> -#endif
> +        TCGMemOpIdx oi = make_memop_idx(memop & ~MO_SIGN, idx);
> +        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));

In all of these, our coding style says 'oi' should be declared at the top
of the function, not in the middle like this.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

