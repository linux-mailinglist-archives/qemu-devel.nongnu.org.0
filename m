Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC556A1C11
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 13:20:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVX2d-0002oC-F4; Fri, 24 Feb 2023 07:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pVX2b-0002m6-HX
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 07:19:09 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pVX2Z-0005i8-Sy
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 07:19:09 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c12so13719830wrw.1
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 04:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EmLIkt0pmvZLBb5MswRldm9Wu2tsPjcnQv05JqaQ4/M=;
 b=FOZtzqWvmb/ChQoTqtrAXd4Hz8F1zv7wKqr4iJYucMYBgVqZYnDHieKCF/8WyMfdOJ
 +TLuPrGQGVexU4kP+fVtral15o5qAoqpl6SxKvkGen+dQP+s1bE0bc1I+zpxzqMvTpRO
 1BgIBXAYShE27oh99UepNZT3JHtJkDzFy9nC0eOb8THNeG37P/2cQr/VhRMICxtllCg7
 oHUXpje+bLelk05k8hOALVDIb8R7eTUF8IfmJ3pnH+epty/3qRNS6dgkjTEstF7kbokR
 xK46/xfADfVyxO4XYE/QiEtmbXHbaKWytSuGr8hikUttuDnKR+/aD308Ny5mazDb5IGf
 1oXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EmLIkt0pmvZLBb5MswRldm9Wu2tsPjcnQv05JqaQ4/M=;
 b=MvQbZpR1NqiBM+rez/c+AZ/bNG33trEuw8CMKqQoqvBfNnkTDX8wiBzzb2tHhJypLd
 /IAsdQtaZbtFh8eyi8tsNZswzX8vuG2FoXEfVUyEP9RMyWJfEXEK8vfs5/zObxO8ByBB
 /GzuD1DZNprX0bcHhy0GX1nfaA4Oodd8uq77rGVFSsURJlX9zz76jw/acrIiWEwTQ+4r
 RpjKrKqK3K+tMo55NIVrXR2SCGCDFXV4Qn2xRQuEWr20s9E6FNc3fBUkccWS9zlkxhFq
 84FsVPzN34iVn3iRIdJi0txvwhlG+kQKWT+kIePF6n+V/QEeSaUN/SdIAvRdWd7I3bRU
 bIYA==
X-Gm-Message-State: AO0yUKXxeCMikC39PPS+dxsY7euxLKYPXayjGNHJhe6muBndOjUGgH+z
 yxHJyyay+iaOYPep/KTRBuqE1A==
X-Google-Smtp-Source: AK7set+yisxlwi0RsL75WgvEv2pWnSYetqjbW2G4BR9J3EKJq6limBJB9RhRxT15L8f4zIfJjwOpPA==
X-Received: by 2002:adf:ea83:0:b0:2c5:6180:516e with SMTP id
 s3-20020adfea83000000b002c56180516emr11695244wrm.39.1677241146369; 
 Fri, 24 Feb 2023 04:19:06 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 f18-20020adffcd2000000b002c59e001631sm12668772wrs.77.2023.02.24.04.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 04:19:05 -0800 (PST)
Date: Fri, 24 Feb 2023 13:19:05 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH 2/6] target/riscv: Fix the relationship of PBMTE/STCE
 fields between menvcfg and henvcfg
Message-ID: <20230224121905.mciqkge4qji6xczb@orel>
References: <20230224040852.37109-1-liweiwei@iscas.ac.cn>
 <20230224040852.37109-3-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224040852.37109-3-liweiwei@iscas.ac.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42c.google.com
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

On Fri, Feb 24, 2023 at 12:08:48PM +0800, Weiwei Li wrote:
> henvcfg.PBMTE/STCE are read-only zero if menvcfg.PBMTE/STCE are zero.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/csr.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index feae23cab0..02cb2c2bb7 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1956,7 +1956,11 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
>          return ret;
>      }
>  
> -    *val = env->henvcfg;
> +    /*
> +     * henvcfg.pbmte is read_only 0 when menvcfg.pbmte = 0
> +     * henvcfg.stce is read_only 0 when menvcfg.stce = 0
> +     */
> +    *val = env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) | env->menvcfg);
>      return RISCV_EXCP_NONE;
>  }
>  
> @@ -1972,7 +1976,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>      }
>  
>      if (riscv_cpu_mxl(env) == MXL_RV64) {
> -        mask |= HENVCFG_PBMTE | HENVCFG_STCE;
> +        mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);

nit:

  While HENVCFG_PBMTE == MENVCFG_PBMTE, I'd prefer we use
  MENVCFG_* with menvcfg and HENVCFG_* with henvcfg.

>      }
>  
>      env->henvcfg = (env->henvcfg & ~mask) | (val & mask);
> @@ -1990,14 +1994,15 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
>          return ret;
>      }
>  
> -    *val = env->henvcfg >> 32;
> +    *val = (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) |
> +                            env->menvcfg)) >> 32;
>      return RISCV_EXCP_NONE;
>  }
>  
>  static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>  {
> -    uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
> +    uint64_t mask = env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);
>      uint64_t valh = (uint64_t)val << 32;
>      RISCVException ret;
>  
> -- 
> 2.25.1
> 
> 

Thanks,
drew

