Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA1851F7D7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 11:23:44 +0200 (CEST)
Received: from localhost ([::1]:58200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnzcF-0003OL-3y
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 05:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nnzaZ-00020w-H1
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:21:59 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:33459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nnzaW-0000MW-UC
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:21:58 -0400
Received: by mail-io1-xd31.google.com with SMTP id i20so14653595ion.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 02:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+rG0c6JBJXbeBcaY1akoPrtQlMeKoPsc4v6lR/YzXPo=;
 b=GzhGRaCqvxn5EYuex/s0yrzeJ23BJydBcweqV2ubWXAGV/g4uZK3qLporTJQM3CLEp
 WST45alesvnyu8D0O2XGuD8MDXJRi/yYY7fBKu7TG4gGPuAo7mkn3q/mUCXIxiBtEK83
 PKpc97gJRWrPBOPaXlVN+AABIqTBWLGQIPIOnJTmht1FjCaJ8qBUDgfo8frpqy1F+0dW
 C9DcSKL61xb/CSoE94gc+ibXZsv36lQnroMFhhicGD3EN4OM2N7Z9ezYRJ6L0HWcRqRZ
 rl5TCdVr35E8iNnVeAxHT3hF2GGnIvwMNgdqwiFB/Iu8MkUiHut7Wuj8dY1pZoUmBoSg
 sxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+rG0c6JBJXbeBcaY1akoPrtQlMeKoPsc4v6lR/YzXPo=;
 b=O084ZNJ7J2raljYMEch4uBsnpSc6GY0okXvuB4H+/bffcmlTI8rVYLN0xm+LDxTH/j
 Bgjksi0YlrH4p5JZXevKTHDq9l5jGAfZ3rW6OPxrTsxj7kEx3rUphii2Q+5I9Yln6a+J
 EkJm9CYc7pPGFUqc5SuD0cj/cdn0cENjtfJ8xZ5OcDvYfFoNGCiw2U702RGgyheBSzdU
 nlTVoyYk2XnKwXvWUnbxRhpHzmOTeiGepXWQkfEf6Wn/8YgUQGGKhAHWmZJqLeBbP0DL
 FT8MEd/VPXInHZObkKNKNvsrxqBieKCfWYsbaL7/P4NM3LbyUQJNFGyk1aaGRoEV18he
 cpVA==
X-Gm-Message-State: AOAM532RLmR1RRzyLF7NZV41qWbny3Y9Z0fn1vLNVPzU+o4t0tLjV0Ta
 S48X1c+mvPziopQ3VtuaIGcUMSrLbHyoeMssG0w=
X-Google-Smtp-Source: ABdhPJyPdM951DMKeS7NLX4c4PqHeUtQdEgOWBtGt/O+ARDQNAw7IUDDEjxC/UExRjWG+PYbQrzI5fFRMhfsjFEsPnQ=
X-Received: by 2002:a05:6638:190a:b0:32b:95b7:4e64 with SMTP id
 p10-20020a056638190a00b0032b95b74e64mr6532807jal.212.1652088114729; Mon, 09
 May 2022 02:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220506165456.297058-1-dgreid@rivosinc.com>
In-Reply-To: <20220506165456.297058-1-dgreid@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 May 2022 11:21:28 +0200
Message-ID: <CAKmqyKO7M7TfVuOezUdnT3fJkAyqabEq1_acheLK4U47q2=RAg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix VS mode hypervisor CSR access
To: Dylan Reid <dylan@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Dylan Reid <dgreid@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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

Thanks!

Applied to riscv-to-apply.next

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

