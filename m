Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D01D69B1C3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:29:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT4XL-00067I-Ss; Fri, 17 Feb 2023 12:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pT4XH-00066O-Iz
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:28:39 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pT4XE-00010g-UI
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:28:39 -0500
Received: by mail-pl1-x634.google.com with SMTP id jw12so145905plb.1
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 09:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=DdcJx4wDNl/1y2B/L5izpMKhcCM9J/D1mPCqoDIxm6M=;
 b=iA4DUX2rqo/PJr6D+/6gvInVVhoE+Z3alHy8oKxYoGxGujsAwyzjBT22VDG42en2Cb
 rikId8AgDdUqHNKQ8vKPwcSWr6GHTpC8nHPyW3fpNIDWUynuJgvkvdia62JgIiOHoDhW
 UjczyarEWj7N/uGDBpgvQA+vJlCCBnsuQGeCJEF5Y8QtOPx2Rfny3ZN4YGALYg0f477X
 +fOHRYh7jLfQsoyAIla6r2/HYc2SPbUg9MYJmjD1xkoGSsDXU1Di/kk9yqfONMu/sJN9
 fFct49qzduI47dmy7hsG1DAadh3GC85i98Sxo72cPQlxAYzuVQAAlfpIX76rfsrvU2IH
 zVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DdcJx4wDNl/1y2B/L5izpMKhcCM9J/D1mPCqoDIxm6M=;
 b=YsMjrRVxInBh1C5N8y/1W+AGCahA/iTHEZcDl1/Ol8iXeZhR56SXZHBgW+QEkweAf6
 J840McsD7FmwgOvbYU3HjK15RrDkI5p3RG+/8723esoJN+Uw5zQJSB9jZyDcpyqMctGv
 VB9EN03P9wPB9wPlkvDG3p9Vlwe+132vJjwaJbFmVjjiISEg3FSblMah0Li+8mgmD3kl
 ADgoJcppWoQ9vcCwEIZ4IPtHwVnesXyZxVXp1HNNDjR2opVE8zxIvrhdcSA0UHbGVwy0
 W1GStWf6nNn9m1y4hKikTbxnKWVeJXA5c5XuAVFaQcVOnQ97EOWsljWEofNDAKn+25rv
 2LIA==
X-Gm-Message-State: AO0yUKXQU65u+N5bAq3ffAQQpeYzTsXXrJhPk67Jzh2EA9proqDXRLkm
 rEEs/df5+8s+7tFFXuU3Ly4lRA==
X-Google-Smtp-Source: AK7set//EmCQX7R2peBSehl7Im16+XaqQbx95hbCknuHPaAuxjxHuz8TIW/RHNKf9MvENji4ZoRi9Q==
X-Received: by 2002:a17:90a:19d0:b0:234:d1c:f112 with SMTP id
 16-20020a17090a19d000b002340d1cf112mr501392pjj.0.1676654911581; 
 Fri, 17 Feb 2023 09:28:31 -0800 (PST)
Received: from localhost ([135.180.226.51]) by smtp.gmail.com with ESMTPSA id
 6-20020a17090a08c600b00234115a2221sm3134329pjn.39.2023.02.17.09.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 09:28:30 -0800 (PST)
Date: Fri, 17 Feb 2023 09:28:30 -0800 (PST)
X-Google-Original-Date: Fri, 17 Feb 2023 09:28:17 PST (-0800)
Subject: Re: [PATCH 18/18] target/riscv: Move configuration check to envcfg
 CSRs predicate()
In-Reply-To: <CAEUhbmWQtabLO-whpqO8WDCgjXTfb7wQoqdWezzAUY-JSg9T2w@mail.gmail.com>
CC: liweiwei@iscas.ac.cn, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <mhng-bb66054f-f2ac-44dd-b8dc-a8e80afa1983@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 16 Feb 2023 17:59:42 PST (-0800), Bin Meng wrote:
> Hi Palmer,
>
> On Fri, Feb 17, 2023 at 12:40 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Tue, 14 Feb 2023 18:22:21 PST (-0800), Bin Meng wrote:
>> > On Tue, Feb 14, 2023 at 10:59 PM weiwei <liweiwei@iscas.ac.cn> wrote:
>> >>
>> >>
>> >> On 2023/2/14 22:27, Bin Meng wrote:
>> >> > At present the envcfg CSRs predicate() routines are generic one like
>> >> > smode(), hmode. The configuration check is done in the read / write
>> >> > routine. Create a new predicate routine to cover such check, so that
>> >> > gdbstub can correctly report its existence.
>> >> >
>> >> > Signed-off-by: Bin Meng <bmeng@tinylab.org>
>> >> >
>> >> > ---
>> >> >
>> >> >   target/riscv/csr.c | 98 +++++++++++++++++++++++++++++-----------------
>> >> >   1 file changed, 61 insertions(+), 37 deletions(-)
>> >> >
>> >> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> >> > index 37350b8a6d..284ccc09dd 100644
>> >> > --- a/target/riscv/csr.c
>> >> > +++ b/target/riscv/csr.c
>> >> > @@ -41,40 +41,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
>> >> >   }
>> >> >
>> >> >   /* Predicates */
>> >> > -#if !defined(CONFIG_USER_ONLY)
>> >> > -static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
>> >> > -                                       uint64_t bit)
>> >> > -{
>> >> > -    bool virt = riscv_cpu_virt_enabled(env);
>> >> > -    RISCVCPU *cpu = env_archcpu(env);
>> >> > -
>> >> > -    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
>> >> > -        return RISCV_EXCP_NONE;
>> >> > -    }
>> >> > -
>> >> > -    if (!(env->mstateen[index] & bit)) {
>> >> > -        return RISCV_EXCP_ILLEGAL_INST;
>> >> > -    }
>> >> > -
>> >> > -    if (virt) {
>> >> > -        if (!(env->hstateen[index] & bit)) {
>> >> > -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> >> > -        }
>> >> > -
>> >> > -        if (env->priv == PRV_U && !(env->sstateen[index] & bit)) {
>> >> > -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> >> > -        }
>> >> > -    }
>> >> > -
>> >> > -    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
>> >> > -        if (!(env->sstateen[index] & bit)) {
>> >> > -            return RISCV_EXCP_ILLEGAL_INST;
>> >> > -        }
>> >> > -    }
>> >> > -
>> >> > -    return RISCV_EXCP_NONE;
>> >> > -}
>> >> > -#endif
>> >> >
>> >> >   static RISCVException fs(CPURISCVState *env, int csrno)
>> >> >   {
>> >> > @@ -318,6 +284,32 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
>> >> >       return umode(env, csrno);
>> >> >   }
>> >> >
>> >> > +static RISCVException envcfg(CPURISCVState *env, int csrno)
>> >> > +{
>> >> > +    RISCVCPU *cpu = env_archcpu(env);
>> >> > +    riscv_csr_predicate_fn predicate;
>> >> > +
>> >> > +    if (cpu->cfg.ext_smstateen) {
>> >> > +        return RISCV_EXCP_ILLEGAL_INST;
>> >> > +    }
>> >>
>> >> This check seems not right here.  Why  ILLEGAL_INST is directly
>> >> triggered if smstateen is enabled?
>> >
>> > This logic was there in the original codes. I was confused when I
>> > looked at this as well.
>> >
>> > Anyway, if it is an issue, it should be a separate patch.
>>
>> Seems reasonable to me, it's always nice to split up the refactoring types.  So
>> I queued this up as 4ac6c32224 ("Merge patch series "target/riscv: Various
>> fixes to gdbstub and CSR access"").
>>
>> I had to fix up the From address on the patch you re-sent and there was a minor
>> merge conflict, but otherwise things look sane to me.  I'll hold off on sending
>> anything for a bit just in case, though.
>>
>
> There are some open comments in this series I need to address. Please
> drop this v1. I will send v2 soon.

Sorry aobut that, I'd thought they were all reviewed.  I've dropped it 
from the queue.

Thanks!

>
> Regards,
> Bin

