Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383666E3EB1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 06:59:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poGwN-0006Vn-KF; Mon, 17 Apr 2023 00:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poGwM-0006VU-01; Mon, 17 Apr 2023 00:58:10 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poGwJ-0005Tk-SC; Mon, 17 Apr 2023 00:58:09 -0400
Received: by mail-ua1-x92c.google.com with SMTP id a19so1496556uan.1;
 Sun, 16 Apr 2023 21:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681707485; x=1684299485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nocuQIRErf94ds4Mqhcua/1p7y14D26G+6yse4hhRic=;
 b=p51iD1R1jJdC39CDw1WxO19SfzVa3uwuCSWBTuFsJjFq7AXoxxL9WTS/cwFBV0//Dp
 3aLgHakHuGo/qk20Ed7NzHHfJoZ/zOGxzRmTe6c7OBXKmcyQlxwvKSxmUt1Wptg2aKp7
 Lh+w6LOlP45tMC/4znJ1q+dkYpd+4tnGXuuZcwPZxgkn1y3S91pK+HgH9/0BUQa/scA+
 MGLus664P0+9uipCefKfTdCCITiBAPQsSTtw564LjhfAhIidOEgJ6J3pv00GlFcuA+8m
 7PiIspJogVXXfNM7SpjCugkZDU28WKsqGn+jE/OVJn4ADc5PTrxr3cSACmH2tWYG+5PR
 L4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681707486; x=1684299486;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nocuQIRErf94ds4Mqhcua/1p7y14D26G+6yse4hhRic=;
 b=HbOznxNuwdtQ4DZvaFkO9bQJ1cxtnkkdGxEo38lN4wtkohtB62Bf0XJQ/sTnem7eAt
 GkwzepyK71hg/oM8bogz4EPadQLQgYp4NRljykaDk4e7Gylw98E3cUjeg9P5DTebBKWX
 +pQ2cevbIfr1DxVJGfru7sgfxKx0KX7KMSklfbDgfJq8bTCD4QqjbNqFbjVl05uttHiN
 r059UvR/kfzYPd3cqcK/oy2/qEN9M9bm4Qmq2V0/8i1n7BkOADFTlJfLjin0+d8gtNbH
 3ZgFEI8ZPjl4D6sLlx6Ek6RT/wfKUVKUVo5pqW2PgK+rDlL5z6ez7sw3HLM2gbVeNtpC
 jO8Q==
X-Gm-Message-State: AAQBX9eBOMswlxP8CiwVW+tbaMgvHflkml1R23F+2e9hBzMnaCkwM+7n
 MeFTsOnjckkZB5BkANB5LWliM4U3gD+us63s2Ug=
X-Google-Smtp-Source: AKy350YQZQRjT4ChVFQWNppSL4JlolCJL+qCV6wITe0/I18RC4iHMX5Mgj1rhhMtz3aOX0hBkC1s4d4W4BKutWUPz8Y=
X-Received: by 2002:a1f:1f83:0:b0:433:7ae0:6045 with SMTP id
 f125-20020a1f1f83000000b004337ae06045mr6262280vkf.0.1681707485665; Sun, 16
 Apr 2023 21:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230407153225.156395-1-irina.ryapolova@syntacore.com>
In-Reply-To: <20230407153225.156395-1-irina.ryapolova@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Apr 2023 14:57:39 +1000
Message-ID: <CAKmqyKNXK74kDOkO0BE-k9xew34GQJOd+7+HpzuLGhCNvrymnA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Fix Guest Physical Address Translation
To: Irina Ryapolova <irina.ryapolova@syntacore.com>
Cc: qemu-devel@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Apr 8, 2023 at 1:34=E2=80=AFAM Irina Ryapolova
<irina.ryapolova@syntacore.com> wrote:
>
> Before changing the flow check for sv39/48/57.
>
> According to specification (for Supervisor mode):
> Sv39 implementations support a 39-bit virtual address space, divided into=
 4 KiB pages.
> Instruction fetch addresses and load and store effective addresses, which=
 are 64 bits,
> must have bits 63=E2=80=9339 all equal to bit 38, or else a page-fault ex=
ception will occur.
> Likewise for Sv48 and Sv57.
>
> So the high bits are equal to bit 38 for sv39.
>
> According to specification (for Hypervisor mode):
> For Sv39x4, address bits of the guest physical address 63:41 must all be =
zeros, or else a
> guest-page-fault exception occurs.
>
> Likewise for Sv48x4 and Sv57x4.
> For Sv48x4 address bits 63:50 must all be zeros, or else a guest-page-fau=
lt exception occurs.
> For Sv57x4 address bits 63:59 must all be zeros, or else a guest-page-fau=
lt exception occurs.
>
> For example we are trying to access address 0xffff_ffff_ff01_0000 with on=
ly G-translation enabled.
> So expected behavior is to generate exception. But qemu doesn't generate =
such exception.
>
> For the old check, we get
> va_bits =3D=3D 41, mask =3D=3D (1 << 24) - 1, masked_msbs =3D=3D (0xffff_=
ffff_ff01_0000 >> 40) & mask =3D=3D mask.
> Accordingly, the condition masked_msbs !=3D 0 && masked_msbs !=3D mask is=
 not fulfilled
> and the check passes.
>
> Signed-off-by: Irina Ryapolova <irina.ryapolova@syntacore.com>

Do you mind rebasing this patch on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next and
sending a v3?

Alistair

> ---
> Changes for v2:
>   -Add more detailed commit message
> ---
>  target/riscv/cpu_helper.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..27289f2305 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -863,17 +863,24 @@ static int get_physical_address(CPURISCVState *env,=
 hwaddr *physical,
>
>      CPUState *cs =3D env_cpu(env);
>      int va_bits =3D PGSHIFT + levels * ptidxbits + widened;
> -    target_ulong mask, masked_msbs;
>
> -    if (TARGET_LONG_BITS > (va_bits - 1)) {
> -        mask =3D (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> -    } else {
> -        mask =3D 0;
> -    }
> -    masked_msbs =3D (addr >> (va_bits - 1)) & mask;
> +    if (first_stage =3D=3D true) {
> +        target_ulong mask, masked_msbs;
> +
> +        if (TARGET_LONG_BITS > (va_bits - 1)) {
> +            mask =3D (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> +        } else {
> +            mask =3D 0;
> +        }
> +        masked_msbs =3D (addr >> (va_bits - 1)) & mask;
>
> -    if (masked_msbs !=3D 0 && masked_msbs !=3D mask) {
> -        return TRANSLATE_FAIL;
> +        if (masked_msbs !=3D 0 && masked_msbs !=3D mask) {
> +            return TRANSLATE_FAIL;
> +        }
> +    } else {
> +        if (vm !=3D VM_1_10_SV32 && addr >> va_bits !=3D 0) {
> +            return TRANSLATE_FAIL;
> +        }
>      }
>
>      int ptshift =3D (levels - 1) * ptidxbits;
> --
> 2.25.1
>
>

