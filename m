Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCC26990B5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 11:09:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSbBO-0006MB-De; Thu, 16 Feb 2023 05:08:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSbBL-0006KN-QQ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:08:03 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSbBJ-00023k-7A
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:08:02 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so1179971wmb.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 02:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NDc+3L7XuKPyvLg53FPrAgYVrgap29C23/moOTYHRPQ=;
 b=XMKdGCZ2BON1jJbTknaB9bSDGU4JCdrBd7kYr/Q6RTW+AbLs+4Fjgb5O+tig3ieigl
 86cbiN21LQFk/coewMvJ0pWJiC3CQFb1GLn/aV+oA7k34lekIp8Ddv27T5NwYF7q4vCR
 xjp60giextvU+rka0aaIaHG/YN5dC4eW8ElUkggm86LRaJ4Hvdth/FgJz8t8+42xwC/U
 4hMYyAr6NhCgEOAHT1zRwEOHpCDGYqXzykklWeXnWkwtEDNxPHULlL617AoZrifN35WZ
 bESEf9qiN0vg2F9ObpR+M2TBZRJqdBE33vHaNKunYTj+w+zQFzZukJBu8VmjT1rNeefe
 jspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDc+3L7XuKPyvLg53FPrAgYVrgap29C23/moOTYHRPQ=;
 b=rF225s4akPXNeHjIk+FnS7tP5+FBtYzZsNuHC1JxReLI20a1g7/nSEN/zZWkI6SZEI
 roEeixsj+wxgsb/+fffV6oGjZDr9Bf7Nn+HSeiL4xRG2zx3TZhUkuqMpWilRAzfky77H
 +cFBWKzwEPKsesjObclROnXfOQPh8kHcuYUtpa+9rjIC0B5rJ1CHGACy4LphaGAOsMuF
 WbSdyPqMnq1ezdlFHSDWTLAu/46MFY5eCh4WsaeEeiNtXHeVR6fcXgJhJbvmRdywwUig
 l77+CXnlyZTDvz5UV9Jh/Fw+xX3hLvfiuk0RnrJSCGc4IPEagoJCs/+lw5dgZSsf9nXH
 7NEA==
X-Gm-Message-State: AO0yUKWa8py5VZWmuCDpcz4sMAnZ7iz9KmkdqfrdGkzec4AF6qgH4hRW
 0x1+oOjVgv7ZawNvJW595IDo8Q==
X-Google-Smtp-Source: AK7set+NeSc3CYG/SmyRIKkmbrBHEVhLZRPLzPg4DtnqiTyNAhjrRtbrxMwsQnBx8PkVaHKFtaTtiQ==
X-Received: by 2002:a05:600c:3d8a:b0:3e1:12d1:fde0 with SMTP id
 bi10-20020a05600c3d8a00b003e112d1fde0mr5237750wmb.6.1676542079614; 
 Thu, 16 Feb 2023 02:07:59 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 21-20020a05600c021500b003e209186c07sm2467478wmi.19.2023.02.16.02.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 02:07:59 -0800 (PST)
Date: Thu, 16 Feb 2023 11:07:58 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v3 02/10] target/riscv: always allow write_misa() to
 write MISA
Message-ID: <20230216100758.b7ginht55nzqbehw@orel>
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
 <20230215185726.691759-3-dbarboza@ventanamicro.com>
 <20230216092922.sxxwuizbpj65zt4z@orel>
 <CAEUhbmUcbwCmTtBnXHcXsVY-WaO9RHG-FkYieppFeS6_NmCauA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmUcbwCmTtBnXHcXsVY-WaO9RHG-FkYieppFeS6_NmCauA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x333.google.com
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

On Thu, Feb 16, 2023 at 05:33:55PM +0800, Bin Meng wrote:
> On Thu, Feb 16, 2023 at 5:29 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Wed, Feb 15, 2023 at 03:57:18PM -0300, Daniel Henrique Barboza wrote:
> > > At this moment, and apparently since ever, we have no way of enabling
> > > RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
> > > the nuts and bolts that handles how to properly write this CSR, has
> > > always been a no-op as well because write_misa() will always exit
> > > earlier.
> > >
> > > This seems to be benign in the majority of cases. Booting an Ubuntu
> > > 'virt' guest and logging all the calls to 'write_misa' shows that no
> > > writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
> > > RISC-V extensions after the machine is powered on, seems to be a niche
> > > use.
> > >
> > > Regardless, the spec says that MISA is a WARL read-write CSR, and gating
> > > the writes in the register doesn't make sense. OS and applications
> > > should be wary of the consequences when writing it, but the write itself
> > > must always be allowed.
> >
> > The write is already allowed, i.e. no exception is raised when writing it.
> > The spec only says that the fields may/can be writable. So we can
> > correctly implement the spec with just
> >
> >  write_misa()
> >  {
> >    return RISCV_EXCP_NONE;
> >  }
> 
> Agree. Such change is still spec compliant without worrying about the bugs.
> 
> >
> > as it has effectively been implemented to this point.
> >
> > Based on Weiwei Li's pointing out of known bugs, and the fact that
> > this function has likely never been tested, then maybe we should just
> > implement it as above for now. Once a better solution to extension
> > sanity checking exists and a use (or at least test) case arises, then
> > the function could be expanded with some actually writable bits. (Also,
> > I think that when/if we do the expansion, then something like the misa_w
> > config proposed in the previous version of this series may still be
> > needed in order to allow opting-in/out of the behavior change.)
> 
> In QEMU RISC-V we have some examples of implementing optional spec
> features without exposing a config parameter. Do we need to add config
> parameters for those cases too? If yes, I am afraid the parameters
> will grow a lot.
>

I agree, particularly for RISC-V, the options grow quickly. How about this
for a policy?

1) When adding an optional, on-by-default CPU feature, which applies to
   all currently existing CPU types, then just add the feature without a
   config.

2) When, later, a CPU type or use case needs to disable an optional
   CPU feature, which doesn't have a config, then the config is added
   at that time.

While that policy seems reasonable (to me), I have a feeling the "applies
to all currently existing CPU types" requirement won't be easily
satisfied, so we'll end up mostly always adding configs anyway.

We can always change RISCVCPUConfig.ext_* to a bitmap if we feel like the
CPU is getting too bloated.

Thanks,
drew

