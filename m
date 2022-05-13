Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922F6526942
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:29:05 +0200 (CEST)
Received: from localhost ([::1]:49614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npa2C-0007zi-Id
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1npZyL-0004Kg-G9
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:25:06 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:45880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1npZyJ-0001Bh-Sk
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:25:05 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id v59so16667608ybi.12
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NotHyQW0B3gwafSdZw9JSk9OLQQ4uceNqMck/C78Ypc=;
 b=Eqc5PNYsiwbR5o2Gv11r8gDsT7PXgmPqQObKoBfzL1FGVmCIZTV8ybjNm9+fFpZsw+
 pFEP/b7fFUSJ1AV3reuhhdAidJ6QRtcBGNQPbVoNADzxP9BxbAq6iOOsCl8MeOh1ioBe
 5sdkRf6FM9oj336gt8KGVwBWmo+wzzSm73mCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NotHyQW0B3gwafSdZw9JSk9OLQQ4uceNqMck/C78Ypc=;
 b=qTEgq9aVonQJAWEeYmQ9jh8vFMnuV3wXTYkyiG83cfiLspnHhyobCu9cmpFK9gjUAr
 Q+Vb9aEcopy7W/AqK6vLliOzkQZy8VTf7VMoIneATqkvbYoxogwxc/NqiW33HafFy3ts
 tt0uJmkkXQgqVTwkmbuqFMLlNu5+ushaOIDIY89ZdU2+ALqdz6vLbxMGna+2JEGb609L
 g4KBqoUCpDIXdPhsNkXgKf72TV+q0bf1MvkDp7B3yMvJ3dx0LcXjLJneJmdP0ROODBqL
 dnha3NSfjm+w164n46338NIFQvLmh2f7NCyObu00n8icD5h1M/y1cW+6efUAycTWeQ/d
 iTJA==
X-Gm-Message-State: AOAM530Ed0eyWIwcty727HsyR6MCFWD65DJCrMrpgekRUAHpcb0byUkl
 gSUIyDkxduGT3rMbaxp+LRtcXmaKaQW2NkdtD3Jp
X-Google-Smtp-Source: ABdhPJy9AYA8xTscbxsAkh6b9xbQ/yLNXdPL7oQDKdgW2fKeHNS6yFSa/9bDUKGA0YZ6z2pLcUisbskWYoAY54ms04g=
X-Received: by 2002:a25:c145:0:b0:64b:4c11:a6e9 with SMTP id
 r66-20020a25c145000000b0064b4c11a6e9mr6305905ybf.236.1652466302616; Fri, 13
 May 2022 11:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220511144528.393530-1-apatel@ventanamicro.com>
 <20220511144528.393530-7-apatel@ventanamicro.com>
In-Reply-To: <20220511144528.393530-7-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 13 May 2022 11:24:52 -0700
Message-ID: <CAOnJCUKSB0j8aA_0SgvtHg_OiwmQnz88rbsh6OtXgPReTMyZsA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] target/riscv: Add dummy mcountinhibit CSR for priv
 spec v1.11 or higher
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, May 11, 2022 at 7:46 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The mcountinhibit CSR is mandatory for priv spec v1.11 or higher. For
> implementation that don't want to implement can simply have a dummy
> mcountinhibit which always zero.
>
> Fixes: a4b2fa433125 ("target/riscv: Introduce privilege version field in
> the CSR ops.")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h | 3 +++
>  target/riscv/csr.c      | 2 ++
>  2 files changed, 5 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 4d04b20d06..4a55c6a709 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -159,6 +159,9 @@
>  #define CSR_MTVEC           0x305
>  #define CSR_MCOUNTEREN      0x306
>
> +/* Machine Counter Setup */
> +#define CSR_MCOUNTINHIBIT   0x320
> +
>  /* 32-bit only */
>  #define CSR_MSTATUSH        0x310
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 2bf0a97196..e144ce7135 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3391,6 +3391,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie           },
>      [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
>      [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
> +    [CSR_MCOUNTINHIBIT] = { "mcountinhibit", any, read_zero, write_ignore,
> +                                             .min_priv_ver = PRIV_VERSION_1_11_0 },
>
>      [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
>
> --
> 2.34.1
>

Just to clarify, this is only required if this series is merged before
the PMU series.
FWIW,

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

