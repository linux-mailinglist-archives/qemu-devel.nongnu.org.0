Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9706777B4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 10:49:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJtRK-0005KK-Jw; Mon, 23 Jan 2023 04:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pJtRI-0005Jw-CT
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 04:48:32 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pJtRF-0003KF-PX
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 04:48:31 -0500
Received: by mail-ed1-x532.google.com with SMTP id 18so13844764edw.7
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 01:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SBM/C96GofxGllCvWI14+I+kD6WGsHTa+H4lr4tmoDw=;
 b=UG4vLTwSCPcHB/cOw72FHVeFgRHyj1XQ3+kjqVzsNBOlFuWpDPLM205aN9KBnEf13d
 u3SM3L30Gl+Hy14BNmXeEM+DCTVHbwj9bHrslykNpWFYYeoVOtv+RrFhEgCMyNxJKiSN
 aBDUwErX1N0z/SFQMp6JQXhve/WT2c1Sd9+jbfbDcsHGYODHWpCxaq39zDsVOR5hDm7o
 tJvNMNLVTZfXYks/bHBNi4T7VWi71ezzoSAn1OWi00yP0aEqWlSpszR/OoqqFcFKq0IX
 xtIxwgD4fBneg7FMbdaQ/6JQNwKRU4sFfzXs3JjQrEH/4sHY15WGPwpJb30L8iqctMeC
 LvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SBM/C96GofxGllCvWI14+I+kD6WGsHTa+H4lr4tmoDw=;
 b=v/BgF4GDjBh/yADtLVjbhAeC/xODUDY956iAi24SW3dBKbJOSA8nA8icjYpjo3Mufa
 dx0Adb10lqqH0vQKFLMTey5cAuk87kjOF43I/JVBmU3EIUQyQ18LbPVXQE74/6GnIyEm
 W0stGLFy0+W1rMm1gWUGO1bTLJPLdijDLPdMIbAiCsQ8+RGXQw8J8RGyhBFezxtto9M5
 H7f39CGyV7kDVXnSKFxIznPFije5FF+Ok7dyUxxu9ftzaIRFvL/+hmu2Tls97bz8Ipav
 HM/rJnPB7ebi0vZzXm8wYGj6nUXLTBHvnWJvJCdeJFrGku55uKl//GcW4hkH9ptdh9jI
 iUrQ==
X-Gm-Message-State: AFqh2kpqVep2BcftUCy/VpfKnQkqnI7YjwUmV4Va9WwZz/2qVK+V3Bak
 40wSqOHfT+BPXOkE6hB6apk2qw==
X-Google-Smtp-Source: AMrXdXv1TPLvJaenhJn6oLD9uBeAbR0XmFvttWTso0dGT1n1s95PceQsuof0UDfo0LHR8E65oIZNRA==
X-Received: by 2002:a05:6402:5110:b0:49d:32d0:126 with SMTP id
 m16-20020a056402511000b0049d32d00126mr30578288edd.20.1674467307887; 
 Mon, 23 Jan 2023 01:48:27 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a05640251c800b0049df0f91b78sm12578154edd.78.2023.01.23.01.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 01:48:27 -0800 (PST)
Date: Mon, 23 Jan 2023 10:48:26 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 2/5] riscv: Change type of valid_vm_1_10_[32|64] to bool
Message-ID: <20230123094826.sszyj5lq3ol3zoqy@orel>
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123090324.732681-3-alexghiti@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Jan 23, 2023 at 10:03:21AM +0100, Alexandre Ghiti wrote:
> This array is actually used as a boolean so swap its current char type
> to a boolean and at the same time, change the type of validate_vm to
> bool since it returns valid_vm_1_10_[32|64].
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

> ---
>  target/riscv/csr.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0db2c233e5..6b157806a5 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1117,16 +1117,16 @@ static const target_ulong hip_writable_mask = MIP_VSSIP;
>  static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
>  static const target_ulong vsip_writable_mask = MIP_VSSIP;
>  
> -static const char valid_vm_1_10_32[16] = {
> -    [VM_1_10_MBARE] = 1,
> -    [VM_1_10_SV32] = 1
> +static const bool valid_vm_1_10_32[16] = {
> +    [VM_1_10_MBARE] = true,
> +    [VM_1_10_SV32] = true
>  };
>  
> -static const char valid_vm_1_10_64[16] = {
> -    [VM_1_10_MBARE] = 1,
> -    [VM_1_10_SV39] = 1,
> -    [VM_1_10_SV48] = 1,
> -    [VM_1_10_SV57] = 1
> +static const bool valid_vm_1_10_64[16] = {
> +    [VM_1_10_MBARE] = true,
> +    [VM_1_10_SV39] = true,
> +    [VM_1_10_SV48] = true,
> +    [VM_1_10_SV57] = true
>  };
>  
>  /* Machine Information Registers */
> @@ -1209,7 +1209,7 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>  
> -static int validate_vm(CPURISCVState *env, target_ulong vm)
> +static bool validate_vm(CPURISCVState *env, target_ulong vm)
>  {
>      if (riscv_cpu_mxl(env) == MXL_RV32) {
>          return valid_vm_1_10_32[vm & 0xf];
> @@ -2648,7 +2648,8 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
>  static RISCVException write_satp(CPURISCVState *env, int csrno,
>                                   target_ulong val)
>  {
> -    target_ulong vm, mask;
> +    target_ulong mask;
> +    bool vm;
>  
>      if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
>          return RISCV_EXCP_NONE;
> -- 
> 2.37.2
> 

