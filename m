Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0EA4BECBE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 22:43:09 +0100 (CET)
Received: from localhost ([::1]:36590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMGSa-0003xC-Fm
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 16:43:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGRF-00023Q-RO; Mon, 21 Feb 2022 16:41:47 -0500
Received: from [2607:f8b0:4864:20::131] (port=42944
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGRD-0000Vf-Ue; Mon, 21 Feb 2022 16:41:45 -0500
Received: by mail-il1-x131.google.com with SMTP id v5so1040591ilm.9;
 Mon, 21 Feb 2022 13:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RVT/z5vUfeYxOiKTEThtHCYuLOhtBHmIt7g3HCu4ko4=;
 b=iTbcy/fIx0yLvnZ7BIXZ4gOu5YIktc+cRMSXv5esu7dIp1pSEOsFWfWefubdINSDS7
 RU9/tpIMINvbgX0a/b2nPTrSk4mSSOs5bc3mRvACCcrQC57T861nE2Wg+J3SKz00s4ps
 LgbQXNehbIy2oFLhZlqZIODZBccm6Ef8thDhdAt6QIezC2r3KJxQAqDjwIt4MdaIYdUg
 hKwUZ6TyFNxilj+/qnCdp06laTS0oyF7ZzqoXpl8upTR0VHRnj8OMyTr9k7VNNe+xZVF
 tKcTwvrniTvQej6D5aygaurD3GYD+rS2sJl4HcP6gtYFGmKl+3mF/r2gdzRl6JgAuG4u
 xU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RVT/z5vUfeYxOiKTEThtHCYuLOhtBHmIt7g3HCu4ko4=;
 b=PgL2KPP0WMLY/m3p01cK8ajpKC4vJRuEuDDR1BPBiOm6cbdDQ6GPKE+aMWtXVf/Hsc
 5REh8ELx+vTSnenRLF0ro6wPwLFkv0Yblf2DrFc2lOZdiRKIQTFh4juEMuyax9fhIEpT
 +zFchIX+cOOaxxJPSp412qQZP2WNCOnGEVr/olqC9vLNlnTqSr9MGHZYU+y39fORde/J
 mKx4pQAXOr1tUde+JBKxeAKGOiViiumKLqVypWn24nLzaEVrp7kBZoyuqjodBA5kvNj+
 SK2Zfuq6FIKXrzzm/xf+IW3Wt64Wtrdnyb7fUJnu/NmkSRplBGk4baw7ZAtzxiqeNXie
 akNA==
X-Gm-Message-State: AOAM533r3/Ki41bQSaB7Cr2eWJcmuoDsVIGmTkSyk0/BXSUO8vX0c6IX
 RJlBb3hHFVQjtf9krr/wifXdqyjKdtRfHBSfxPc=
X-Google-Smtp-Source: ABdhPJy8f7enC/kj9OefcMdkeBJKmxY9IUn8jipmIMws5/mq5EOqhB2wF3/G7Ldk5ys3Bgmt5SmZjUDphwdL9494uWw=
X-Received: by 2002:a92:ca4b:0:b0:2bf:20a9:d19c with SMTP id
 q11-20020a92ca4b000000b002bf20a9d19cmr17486742ilo.260.1645479702621; Mon, 21
 Feb 2022 13:41:42 -0800 (PST)
MIME-Version: 1.0
References: <20220206091835.1244296-1-atishp@rivosinc.com>
 <20220206091835.1244296-4-atishp@rivosinc.com>
In-Reply-To: <20220206091835.1244296-4-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Feb 2022 07:41:15 +1000
Message-ID: <CAKmqyKN2HazVtQE669aOtTi4vZFt=z2BO1Yip3a7nrLmK5Kr2Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] target/riscv: Introduce privilege version field in
 the CSR ops.
To: Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 6, 2022 at 7:19 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> To allow/disallow the CSR access based on the privilege spec, a new field
> in the csr_ops is introduced. It also adds the privileged specification
> version (v1.12) for the CSRs introduced in the v1.12. This includes the
> new ratified extensions such as Vector, Hypervisor and secconfig CSR.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

It might be worth mentioning that there is no enforcement in this commit

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h |   2 +
>  target/riscv/csr.c | 103 ++++++++++++++++++++++++++++++---------------
>  2 files changed, 70 insertions(+), 35 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 60b847141db2..0741f9822cf0 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -593,6 +593,8 @@ typedef struct {
>      riscv_csr_op_fn op;
>      riscv_csr_read128_fn read128;
>      riscv_csr_write128_fn write128;
> +    /* The default priv spec version should be PRIV_VERSION_1_10_0 (i.e 0) */
> +    uint32_t min_priv_ver;
>  } riscv_csr_operations;
>
>  /* CSR function table constants */
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8c63caa39245..25a0df498669 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2981,13 +2981,20 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_FRM]      = { "frm",      fs,     read_frm,     write_frm    },
>      [CSR_FCSR]     = { "fcsr",     fs,     read_fcsr,    write_fcsr   },
>      /* Vector CSRs */
> -    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart },
> -    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat  },
> -    [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm   },
> -    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
> -    [CSR_VL]       = { "vl",       vs,     read_vl                    },
> -    [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
> -    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb                 },
> +    [CSR_VSTART]   = { "vstart",   vs,    read_vstart,  write_vstart,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VXSAT]    = { "vxsat",    vs,    read_vxsat,   write_vxsat,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VXRM]     = { "vxrm",     vs,    read_vxrm,    write_vxrm,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VCSR]     = { "vcsr",     vs,    read_vcsr,    write_vcsr,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VL]       = { "vl",       vs,    read_vl,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VTYPE]    = { "vtype",    vs,    read_vtype,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VLENB]    = { "vlenb",    vs,    read_vlenb,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>      /* User Timers and Counters */
>      [CSR_CYCLE]    = { "cycle",    ctr,    read_instret  },
>      [CSR_INSTRET]  = { "instret",  ctr,    read_instret  },
> @@ -3096,33 +3103,58 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
>      [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
>
> -    [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus,     write_hstatus     },
> -    [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,     write_hedeleg     },
> -    [CSR_HIDELEG]     = { "hideleg",     hmode,   NULL,   NULL,     rmw_hideleg       },
> -    [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL,     rmw_hvip          },
> -    [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,     rmw_hip           },
> -    [CSR_HIE]         = { "hie",         hmode,   NULL,   NULL,     rmw_hie           },
> -    [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren,  write_hcounteren  },
> -    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie       },
> -    [CSR_HTVAL]       = { "htval",       hmode,   read_htval,       write_htval       },
> -    [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,      write_htinst      },
> -    [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,       NULL              },
> -    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,       write_hgatp       },
> -    [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,  write_htimedelta  },
> -    [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah },
> -
> -    [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,    write_vsstatus    },
> -    [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,    rmw_vsip          },
> -    [CSR_VSIE]        = { "vsie",        hmode,   NULL,    NULL,    rmw_vsie          },
> -    [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,      write_vstvec      },
> -    [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch,   write_vsscratch   },
> -    [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,       write_vsepc       },
> -    [CSR_VSCAUSE]     = { "vscause",     hmode,   read_vscause,     write_vscause     },
> -    [CSR_VSTVAL]      = { "vstval",      hmode,   read_vstval,      write_vstval      },
> -    [CSR_VSATP]       = { "vsatp",       hmode,   read_vsatp,       write_vsatp       },
> -
> -    [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,      write_mtval2      },
> -    [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
> +    [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus,   write_hstatus,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,   write_hedeleg,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HIDELEG]     = { "hideleg",     hmode,   NULL,   NULL, rmw_hideleg,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL,   rmw_hvip,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,   rmw_hip,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HIE]         = { "hie",         hmode,   NULL,   NULL,    rmw_hie,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren, write_hcounteren,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HTVAL]       = { "htval",       hmode,   read_htval,     write_htval,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,    write_htinst,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,     write_hgatp,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta, write_htimedelta,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +
> +    [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,  write_vsstatus,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,  rmw_vsip,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSIE]        = { "vsie",        hmode,   NULL,    NULL,    rmw_vsie ,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,    write_vstvec,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch, write_vsscratch,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,     write_vsepc,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSCAUSE]     = { "vscause",     hmode,   read_vscause,   write_vscause,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSTVAL]      = { "vstval",      hmode,   read_vstval,    write_vstval,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSATP]       = { "vsatp",       hmode,   read_vsatp,     write_vsatp,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +
> +    [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,    write_mtval2,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,    write_mtinst,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>
>      /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
>      [CSR_HVIEN]       = { "hvien",       aia_hmode, read_zero, write_ignore },
> @@ -3154,7 +3186,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
>
>      /* Physical Memory Protection */
> -    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg },
> +    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg,
> +                                     .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
>      [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
>      [CSR_PMPCFG2]    = { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg  },
> --
> 2.30.2
>
>

