Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE65578455
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:52:20 +0200 (CEST)
Received: from localhost ([::1]:37378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRAZ-0004fS-Bz
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oDN1Q-00034w-HP
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:26:36 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oDN1O-0007wn-QS
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:26:36 -0400
Received: by mail-ej1-x62c.google.com with SMTP id bp15so20112957ejb.6
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 02:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u6TJH/WnifNVRQGE4Ljs8UTAmovN2IAX7KKhnHk93lk=;
 b=Z5PwMH3CSQVYhwrvFhQHlhEbSTmxf2pbJALbzIdKchICs2uRC/PBmTZxJQFG8r8dy5
 SHNJ3AyJttADdSYXViPxn4zQmMbBCccEdy95IolClLLsS3ksyuh/XMgXptXC3u8eaqPt
 UvruMn11VPyU2howRpj3l4sbJzo4QNEPnyJBef6PlSSShn3v9vK29H4mxKqpk/gyFvDY
 PLRRGBIHuAD8CZEG3zL8TuZMNnnrCZYRqC3gYzVU2+rYJ9zGB2Cs/UwCm19mPv0p6gnN
 sGjMebCCllix0tHfudkbAc1GOBeCsfOUJ5EBXuHvKJiNW3XxG4GwH4m1Q0IREvYf0qWj
 VD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u6TJH/WnifNVRQGE4Ljs8UTAmovN2IAX7KKhnHk93lk=;
 b=5bXv6Xx5l2aUlYzdIP95bs673ZjB1drk/CR7tv01AXCO5NA/M8zZo5EzZNrLRECfzZ
 NKS5Ud1Z1ZzxGFvB4xjAMJ+wiSrbLJyTeuPsTZaRKH2N2CPDS11xW/MCI1Puqqsn+U1z
 FXc66yXag0XPS0XJuAHN4ejo4EbGUz0cBVy/s62QqLSkLfg11enp6yIXE1cFN7fnKPb3
 wUgEb63sTS/L3+QUDHJRXRgk6LqYU3arRG8A8qjAVclYroP4ZhLfjCSvt6trgEmI3NRF
 VyloUL+dPs5VOIi6H8G9NPk2sV3XXbSC3S09N5rbCZiVFlQViNsl+xEtiZRQXJJMwn57
 1JVw==
X-Gm-Message-State: AJIora/dpJ0U2Wof6C1IrLjYKNsLLUFJSaFuR+mY/241baoSJYsSr1Pu
 LT9okSlz224L7LhWAYz2R2kzGA==
X-Google-Smtp-Source: AGRyM1sABLdz/Aa6PR537MWxcAfw0M+KuUOjX3BbRd95XVtc30zEGp2aPcml7ttwmzKHaU0WJqLKMA==
X-Received: by 2002:a17:907:9710:b0:72b:3271:c9f with SMTP id
 jg16-20020a170907971000b0072b32710c9fmr24211775ejc.91.1658136391458; 
 Mon, 18 Jul 2022 02:26:31 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 ew11-20020a056402538b00b0043b4d43ebaasm5378234edb.58.2022.07.18.02.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 02:26:31 -0700 (PDT)
Date: Mon, 18 Jul 2022 11:26:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v2 5/6] target/riscv: fix checks in hmode/hmode32
Message-ID: <20220718092630.3gabgfcg74k5yvk7@kamzik>
References: <20220712063236.23834-1-liweiwei@iscas.ac.cn>
 <20220712063236.23834-6-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712063236.23834-6-liweiwei@iscas.ac.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Jul 2022 09:49:04 -0400
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


Same other $SUBJECT and comment suggestions as the previous patches.

On Tue, Jul 12, 2022 at 02:32:35PM +0800, Weiwei Li wrote:
> - add check for the implicit dependence between H and S
> - Csrs only existed in RV32 will not trigger virtual instruction fault
> when not in RV32

I think I found the justification for this in 8.6.1 of the privileged
spec, a pointer in the commit message would be good.

> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu.c | 5 +++++
>  target/riscv/csr.c | 9 ++-------
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b8ce0959cb..455787a940 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -738,6 +738,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>  
> +        if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
> +            error_setg(errp, "H extension implicitly requires S-mode");
> +            return;
> +        }
> +
>          if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
>              error_setg(errp, "F extension requires Zicsr");
>              return;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 1edeb69366..deddeb100e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -311,8 +311,7 @@ static int aia_smode32(CPURISCVState *env, int csrno)
>  
>  static RISCVException hmode(CPURISCVState *env, int csrno)
>  {
> -    if (riscv_has_ext(env, RVS) &&
> -        riscv_has_ext(env, RVH)) {
> +    if (riscv_has_ext(env, RVH)) {
>          /* Hypervisor extension is supported */
>          if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
>              env->priv == PRV_M) {
> @@ -328,11 +327,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
>  static RISCVException hmode32(CPURISCVState *env, int csrno)
>  {
>      if (riscv_cpu_mxl(env) != MXL_RV32) {
> -        if (!riscv_cpu_virt_enabled(env)) {
> -            return RISCV_EXCP_ILLEGAL_INST;
> -        } else {
> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -        }
> +        return RISCV_EXCP_ILLEGAL_INST;
>      }
>  
>      return hmode(env, csrno);
> -- 
> 2.17.1
> 
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

