Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59D65779DA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 06:06:32 +0200 (CEST)
Received: from localhost ([::1]:35032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDI1f-0004k3-Ss
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 00:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1oDHyH-00031O-2V
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 00:03:02 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1oDHy9-00043W-O5
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 00:02:55 -0400
Received: by mail-wr1-x433.google.com with SMTP id a5so15222279wrx.12
 for <qemu-devel@nongnu.org>; Sun, 17 Jul 2022 21:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Js85nhj4DuwgFWI8N2vho/+H3AyyIj6qMJK9FKscV44=;
 b=j6a2Lf7cJAt9mIJgehCVfmK2Z1Io+3KojlZHeg2kmt+wmfiDxK+i5J3BHXCI5K+TCf
 vJGjcORS/67Rc9t5h1EfclX4q4nfGWOKyDYnsa8Rr/NHjiurDj9wpZTnar9sJIqNmojx
 lgiFg+Qfg+Lzu4dFkDnBODVlp0J4xrT4/WUf+51DP/rzK88HiBFMuXwI3xm4BXrDOsbv
 FIBkddkb3J92WkvdG+C4GQ3pIaW8CM/yN7wE0e7iq8bYjiv5swDAdVC05K5VIOcsuvUl
 Z+mESHt0rUYwhzG/kM1ZBdY2Cedf8OHcLvo0I47jBHtmUm1E+1yfBAAnLjaDrv6hvNjP
 eGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Js85nhj4DuwgFWI8N2vho/+H3AyyIj6qMJK9FKscV44=;
 b=CSlnLKwHvbal5/pkWr3oAsVXP5jrBmqwy8S9U43YQryS3AeHStAPQ8yfni7//iFZY1
 pa7CPj1nxvBYua3/pwFkUNRf9FJFqUd8T6Zg69wEQhWBABUmRlXRylZDWZVzzRdDcdEJ
 1u5WqKsbt6ipqvQAyYguU8nYmcHH2baDP0Vuxm0XCcTo5MSnOTv31Ho3QmVARlEuLENj
 L2HXMwqjPQG4V2wosYmAdxekPqRb9aSkPJg0BUB3/00Rkh/sQ7b0G4h7HcpXDzwIncYA
 Y9d0YxQUDz3uIHa7C3s2MqaA1sefnRtNFzz12OvXEj4KLpvj9npJb42EUIQ0qmcCwXW5
 /+iA==
X-Gm-Message-State: AJIora98CZjnFAsaBvv0KZkAYvqH7bVxlw90ZriH/UxzkvZ7bEtVHl/0
 9m0nadVXXC8MYroiYopa+TAPapYbDcuKVfAYb+HOrA==
X-Google-Smtp-Source: AGRyM1vakc0oB2ohDgqeax6RDWnFt5Nz2wUO1knKAsCY6NLfmRevU5jGNHcFuSW7cPIFkJ3mr/DtvBcIlrpthKyfui4=
X-Received: by 2002:a5d:64ac:0:b0:21d:7832:ecf9 with SMTP id
 m12-20020a5d64ac000000b0021d7832ecf9mr20968466wrp.86.1658116963992; Sun, 17
 Jul 2022 21:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220718035249.17440-1-jim.shu@sifive.com>
In-Reply-To: <20220718035249.17440-1-jim.shu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Jul 2022 09:32:32 +0530
Message-ID: <CAAhSdy0XUp1KGvmiPhG0eaTk1bnzwVGrW83jDXSLsrzK_NtXDw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Support SW update of PTE A/D bits and
 Ssptwad extension
To: Jim Shu <jim.shu@sifive.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::433;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

+Atish

On Mon, Jul 18, 2022 at 9:23 AM Jim Shu <jim.shu@sifive.com> wrote:
>
> RISC-V priv spec v1.12 permits 2 PTE-update schemes of A/D-bit
> (Access/Dirty bit): HW update or SW update. RISC-V profile defines the
> extension name 'Ssptwad' for HW update to PTE A/D bits.
> https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc

The Ssptwad (even though used by profiles) is not a well defined RISC-V
ISA extension. Rather, Ssptwad is just a name used in profiles to represent
an optional feature.

In fact, since it is not a well-defined ISA extension, QEMU cannot include
Ssptwad in the ISA string as well.

I think for such optionalities which are not well-defined ISA extensions,
QEMU should treat it differently.

Regards,
Anup

>
> Current QEMU RISC-V implements HW update scheme, so this commit
> introduces SW update scheme to QEMU and uses the 'Ssptwad' extension
> as the CPU option to select 2 PTE-update schemes. QEMU RISC-V CPU still
> uses HW update scheme (ext_ssptwad=true) by default to keep the backward
> compatibility.
>
> SW update scheme implemention is based on priv spec v1.12:
> "When a virtual page is accessed and the A bit is clear, or is written
> and the D bit is clear, a page-fault exception (corresponding to the
> original access type) is raised."
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu.c        | 2 ++
>  target/riscv/cpu.h        | 1 +
>  target/riscv/cpu_helper.c | 9 +++++++++
>  3 files changed, 12 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1bb3973806..1d38c1c1d2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -857,6 +857,7 @@ static void riscv_cpu_init(Object *obj)
>
>      cpu->cfg.ext_ifencei = true;
>      cpu->cfg.ext_icsr = true;
> +    cpu->cfg.ext_ssptwad = true;
>      cpu->cfg.mmu = true;
>      cpu->cfg.pmp = true;
>
> @@ -900,6 +901,7 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> +    DEFINE_PROP_BOOL("ssptwad", RISCVCPU, cfg.ext_ssptwad, true),
>
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5c7acc055a..2eee59af98 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -433,6 +433,7 @@ struct RISCVCPUConfig {
>      bool ext_zve32f;
>      bool ext_zve64f;
>      bool ext_zmmul;
> +    bool ext_ssptwad;
>      bool rvv_ta_all_1s;
>
>      uint32_t mvendorid;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 59b3680b1b..a8607c0d7b 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -981,6 +981,15 @@ restart:
>
>              /* Page table updates need to be atomic with MTTCG enabled */
>              if (updated_pte != pte) {
> +                if (!cpu->cfg.ext_ssptwad) {
> +                    /*
> +                     * If A/D bits are managed by SW, HW just raises the
> +                     * page fault exception corresponding to the original
> +                     * access type when A/D bits need to be updated.
> +                     */
> +                    return TRANSLATE_FAIL;
> +                }
> +
>                  /*
>                   * - if accessed or dirty bits need updating, and the PTE is
>                   *   in RAM, then we do so atomically with a compare and swap.
> --
> 2.17.1
>
>

