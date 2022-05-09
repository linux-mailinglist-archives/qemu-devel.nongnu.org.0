Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62A551F67A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 10:21:18 +0200 (CEST)
Received: from localhost ([::1]:53288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnydp-0002tx-Qz
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 04:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nnyXN-0007XC-Lx
 for qemu-devel@nongnu.org; Mon, 09 May 2022 04:14:37 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:33528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nnyXM-0006uy-5d
 for qemu-devel@nongnu.org; Mon, 09 May 2022 04:14:37 -0400
Received: by mail-il1-x131.google.com with SMTP id b5so8794149ile.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WVAUcwl+Wo9Nb18h+to0mP0CVZonGigSEdpPM6WCztw=;
 b=Z6MFzHoKp2DR5qDZYW/U3OPcxbnVpVjBy/tNQBDaTOVwYtYv6MMEMystrLWQlKarOm
 PKti6QyPsJHkK+m8MKrEiNBJh5jWK2IOCP9LaroEb1rsjwXAQzs78cFxuBujtaL3s+Iq
 flE/XLoqFkjpT8+Ffefz0OVlKqDjGY83rNAYwyvLiWS9/iXK+QnRylYoqDQ4FqBjbYj8
 tk1NthRIW+LbLidiq9rUkCIwzEWFU7Vyn2npFygUAuzV9zPhYhqucd/sz2cSkT33YfC3
 nht+kXlBa4qIcHj83aLyc9IZqglBceqOob/vFQNBwbPsnyNM6fh6ctVxJAISLJ8LBujh
 4ZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WVAUcwl+Wo9Nb18h+to0mP0CVZonGigSEdpPM6WCztw=;
 b=bec1iR0YvRZD9xR8Vuyo8VkbTwc1NsACRas6ibM5tckxImiNJAmwZKX8+ap8NdZrp4
 mOw++drmKv3VegpmHMgNxsw/cymjUQP35N4VOHhKoffUSks/wClICl6P7vTKbUz2LaVr
 UGOWehGosbFEvgEW9P1hI+0gB6km0NohPIv/H+A+Ay890Kynsa53/XpNwmhTV32UUloD
 bg4LjiVBWC/vnpJhki4kkOyjgNmGJdqidNgp+sUPJQ2h8lMIFzFdao675/AzgwZK8MF+
 zF+bO5XG45w1sLcAy3p8PkdGPDZz2OGyz100J0nuVB93FCi3BHeOC/j1ZCR8dsGsywSh
 Ao+g==
X-Gm-Message-State: AOAM530+Y1Qsud8XY7bPvDK1lJbU7PHV+9XVLXzv8N9v98WtGlU7O3R7
 8W7vRY5jG9xZFSGLwts9R10wG5/tB7m2wG5I8mwl0u3u7XD1AGkXLLI=
X-Google-Smtp-Source: ABdhPJxr8okN04ayPKaVAc4SMM/sqtz9mk8+9xVrqwCN5fV7nDVaPryPpHBAsFkPaABbtTzloc6ifzZM20El05tvIm4=
X-Received: by 2002:a05:6e02:151:b0:2cf:8c5d:2ca0 with SMTP id
 j17-20020a056e02015100b002cf8c5d2ca0mr4506818ilr.86.1652084074723; Mon, 09
 May 2022 01:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220506165456.297058-1-dgreid@rivosinc.com>
In-Reply-To: <20220506165456.297058-1-dgreid@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 May 2022 10:14:08 +0200
Message-ID: <CAKmqyKPuqPPbAe1TdzLXt56QF1wxuahUQgVHjVi8nAXBGzrfmQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix VS mode hypervisor CSR access
To: Dylan Reid <dylan@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Dylan Reid <dgreid@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, May 6, 2022 at 11:16 PM Dylan Reid <dylan@rivosinc.com> wrote:
>
> VS mode access to hypervisor CSRs should generate virtual, not illegal,
> instruction exceptions.
>
> Don't return early and indicate an illegal instruction exception when
> accessing a hypervisor CSR from VS mode. Instead, fall through to the
> `hmode` predicate to return the correct virtual instruction exception.
>
> Signed-off-by: Dylan Reid <dgreid@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 3500e07f92..4ea7df02c9 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3141,13 +3141,13 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>  #if !defined(CONFIG_USER_ONLY)
>      int effective_priv = env->priv;
>
> -    if (riscv_has_ext(env, RVH) &&
> -        env->priv == PRV_S &&
> -        !riscv_cpu_virt_enabled(env)) {
> +    if (riscv_has_ext(env, RVH) && env->priv == PRV_S) {
>          /*
> -         * We are in S mode without virtualisation, therefore we are in HS Mode.
> +         * We are in either HS or VS mode.
>           * Add 1 to the effective privledge level to allow us to access the
> -         * Hypervisor CSRs.
> +         * Hypervisor CSRs. The `hmode` predicate will determine if access
> +         * should be allowed(HS) or if a virtual instruction exception should be
> +         * raised(VS).
>           */
>          effective_priv++;
>      }
> --
> 2.30.2
>
>

