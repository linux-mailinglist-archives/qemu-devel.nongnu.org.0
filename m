Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E22416BB5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 08:44:08 +0200 (CEST)
Received: from localhost ([::1]:49752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTewJ-0004iK-EZ
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 02:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mTeuf-00037R-QD
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 02:42:25 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:36749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mTeue-0005Mm-5O
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 02:42:25 -0400
Received: by mail-il1-x12b.google.com with SMTP id v16so9262186ilg.3
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 23:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o/XJrMQb1jUMmAmsjSyN0Y1MHeU2CGo+YJ5GAOILK7A=;
 b=fhLpsfXlCAaz/7tjt4f6hmTqBkb3PyqtmRdO4/o8Sn7CLU2cqyRB/UXpdgxH+AW0Fg
 izomOw6FnBBk3F8wLOoBcy93hTNQGKikGZh9PI7Cki/u8YOamdzWLfia8AELUBIVIYCF
 9rhZGCHGQjFLdkDlIbE/JQ3v6o3e1seMFDJOStv2WGsh+yMV8NWwKpGR0Ez8KrX14Xei
 o+Uryfq255XVKjK0kMCeNOSNXapZslQS571uRX+algLSvrI9sC1Kt8nnpl0xzTml1E6g
 HeHcqXWCoGAzbBbsHp8UDgAh0NT5Dzg8qXFzHeg68Eh9GNaADCKqHt+xIgNNi2Xnm27d
 fXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o/XJrMQb1jUMmAmsjSyN0Y1MHeU2CGo+YJ5GAOILK7A=;
 b=v7C3FAyWFHef6fJWUVWN7CHUM8yx2kjQF7uSbU/5OQXXNHhZ+VOUQzZATwMnUM0yQo
 v1CSbLTHJDWQMbVmoIh4yIf3IazfEllT685Pu7k0j0EiaeXwOnJat0Qv9yYpO3jKeElA
 ELE533qCpriVIcNtrjn57qxU+niEkg57bnnxx7MKZZFgh6pjLxheaJ3JY+k/q9jCOosj
 TZxi2RsYeXIdwhPq62BinHcWCPGV6ZTkGM4yxQjpUvq294Sa3m1gbzoz5a/leor/QHFF
 sa+67qA69/Ux5zme70xWFmiCr/+c4TWba53HfZEVECpP5c7kaxXJnF5PmHfmfCrXsDzK
 QHOA==
X-Gm-Message-State: AOAM530KX3nnVLINUYx+VFrHx+cDaAlRNaMqwifl1Ck891F2dcLErFca
 g16wyBiAuZEPuh5Z03W9DILSBtDbkKsnNd8c0k3wFF6Iqms=
X-Google-Smtp-Source: ABdhPJyx7/J644RgEf1PDnqw0dJsc4Ww7c/C8X8Hg2mgL+6+wtMEPaZYmE/9IMYtDfRwsdfkCXdLMDcWwA4mSXthkHg=
X-Received: by 2002:a92:280f:: with SMTP id l15mr6551199ilf.74.1632465743049; 
 Thu, 23 Sep 2021 23:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210920214447.2998623-1-f4bug@amsat.org>
 <20210920214447.2998623-24-f4bug@amsat.org>
In-Reply-To: <20210920214447.2998623-24-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 24 Sep 2021 16:41:56 +1000
Message-ID: <CAKmqyKMr8ZP_E2AijmfhhnkD_P5dy1Df0bfEqaCvDUivMvG8JA@mail.gmail.com>
Subject: Re: [PATCH v5 23/31] target/riscv: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 21, 2021 at 8:09 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Restrict has_work() to TCG sysemu.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 13575c14085..abb555a8bdb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -335,9 +335,9 @@ static void riscv_cpu_synchronize_from_tb(CPUState *c=
s,
>      env->pc =3D tb->pc;
>  }
>
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>  static bool riscv_cpu_has_work(CPUState *cs)
>  {
> -#ifndef CONFIG_USER_ONLY
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      CPURISCVState *env =3D &cpu->env;
>      /*
> @@ -345,10 +345,8 @@ static bool riscv_cpu_has_work(CPUState *cs)
>       * mode and delegation registers, but respect individual enables
>       */
>      return (env->mip & env->mie) !=3D 0;
> -#else
> -    return true;
> -#endif
>  }
> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
>
>  void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
>                            target_ulong *data)
> @@ -647,6 +645,7 @@ static const struct TCGCPUOps riscv_tcg_ops =3D {
>      .tlb_fill =3D riscv_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .has_work =3D riscv_cpu_has_work,
>      .cpu_exec_interrupt =3D riscv_cpu_exec_interrupt,
>      .do_interrupt =3D riscv_cpu_do_interrupt,
>      .do_transaction_failed =3D riscv_cpu_do_transaction_failed,
> @@ -666,7 +665,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void=
 *data)
>      device_class_set_parent_reset(dc, riscv_cpu_reset, &mcc->parent_rese=
t);
>
>      cc->class_by_name =3D riscv_cpu_class_by_name;
> -    cc->has_work =3D riscv_cpu_has_work;
>      cc->dump_state =3D riscv_cpu_dump_state;
>      cc->set_pc =3D riscv_cpu_set_pc;
>      cc->gdb_read_register =3D riscv_cpu_gdb_read_register;
> --
> 2.31.1
>
>

