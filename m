Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1EE574AAD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 12:33:54 +0200 (CEST)
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBwAK-0007Z4-Hs
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 06:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1oBw6R-0005ix-8v; Thu, 14 Jul 2022 06:29:51 -0400
Received: from gloria.sntech.de ([185.11.138.130]:42878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1oBw6N-0001qb-E7; Thu, 14 Jul 2022 06:29:50 -0400
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oBw6F-00038S-SX; Thu, 14 Jul 2022 12:29:39 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 frank.chang@sifive.com, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v10 12/12] target/riscv: Update the privilege field for
 sscofpmf CSRs
Date: Thu, 14 Jul 2022 12:29:39 +0200
Message-ID: <2659535.atdPhlSkOF@diego>
In-Reply-To: <20220620231603.2547260-13-atishp@rivosinc.com>
References: <20220620231603.2547260-1-atishp@rivosinc.com>
 <20220620231603.2547260-13-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=185.11.138.130; envelope-from=heiko@sntech.de;
 helo=gloria.sntech.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Am Dienstag, 21. Juni 2022, 01:16:02 CEST schrieb Atish Patra:
> The sscofpmf extension was ratified as a part of priv spec v1.12.
> Mark the csr_ops accordingly.
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  target/riscv/csr.c | 90 ++++++++++++++++++++++++++++++----------------
>  1 file changed, 60 insertions(+), 30 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9367e2af9b90..dabd531e0355 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -4002,63 +4002,92 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                                                         write_mhpmevent },
>  
>      [CSR_MHPMEVENT3H]    = { "mhpmevent3h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT4H]    = { "mhpmevent4h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT5H]    = { "mhpmevent5h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT6H]    = { "mhpmevent6h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT7H]    = { "mhpmevent7h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT8H]    = { "mhpmevent8h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT9H]    = { "mhpmevent9h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT10H]   = { "mhpmevent10h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT11H]   = { "mhpmevent11h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT12H]   = { "mhpmevent12h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT13H]   = { "mhpmevent13h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT14H]   = { "mhpmevent14h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT15H]   = { "mhpmevent15h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT16H]   = { "mhpmevent16h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT17H]   = { "mhpmevent17h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT18H]   = { "mhpmevent18h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT19H]   = { "mhpmevent19h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT20H]   = { "mhpmevent20h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT21H]   = { "mhpmevent21h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT22H]   = { "mhpmevent22h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT23H]   = { "mhpmevent23h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT24H]   = { "mhpmevent24h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT25H]   = { "mhpmevent25h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT26H]   = { "mhpmevent26h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT27H]   = { "mhpmevent27h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT28H]   = { "mhpmevent28h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT29H]   = { "mhpmevent29h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT30H]   = { "mhpmevent30h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT31H]   = { "mhpmevent31h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>  
>      [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_hpmcounterh },
>      [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_hpmcounterh },
> @@ -4148,7 +4177,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                                                         write_mhpmcounterh },
>      [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf },
> +    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>  
>  #endif /* !CONFIG_USER_ONLY */
>  };
> 





