Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDEC441DD1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 17:17:32 +0100 (CET)
Received: from localhost ([::1]:55494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mha02-0001NJ-VO
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 12:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mhZyu-0000ii-KV
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:16:21 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:43632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mhZys-0003au-W4
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:16:20 -0400
Received: by mail-lj1-x236.google.com with SMTP id d23so28887465ljj.10
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=eWKO4e9e8DDU5yhBQ0jepZ/HJN3fh/bRWzsPfjsWg20=;
 b=dwjo5LT47EwoMMSfn/N5QnOcRAhV3gc8YAHBT6/65g1lA/duM9OfBdNbNy9UKTZCWN
 LNIadMp0u/f9Klw7uLj6ohH/yGyXrXr9DX8I4pY6whuWdfK3iWYoUOhZTXZ3m/cWcc0W
 dgZXuk5TvF9Jn9h3zQf/eYgCAtfTZnKIEG1fV954MaV+SvYUbmZnlRUrDf4lnEoaCpC9
 //HnG6t3tIDUS9ES48NNYCE+8qiN39kFaFsp14PQtvbBphFXVvCRDJGtm5Q+xZd6iuju
 GQs5iYuEaSkxTqTWInoFuCzYxFkNtpZum526tp8gRyZnP7CawvCs2SycmZhVTBppo4X+
 v5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=eWKO4e9e8DDU5yhBQ0jepZ/HJN3fh/bRWzsPfjsWg20=;
 b=RX0CcEXV0+amozNK97IKPwFCS0Inl3hIfB0pCSzQb5pZEADPDThtl+D5rOuKyWqdIu
 nJfsS3kNmmcyqTOt/HlcqKWki/Eqnsqdl3lQ9MadmTtkWTdRz978dVfzvHrq8YvQZoRZ
 pzbpcfpy/+7aersWJl/7oSfZS1eN1HhB9g0Z8i36bpqr77y/EhkmNJrFW4ma1HRwzsc3
 WA3yqI8+5KP2L5ph/O7GGuQu4JJUC2iD/wHVI9U5FwK9F2nt/1Q1OTv6bTwkpmDbFqcS
 NP0kM0g+io2QNaE8SvW8gMJN2iu1LOZ9UJysDeOMf2AGmGfOnUUmssV+ysNNNKpOL4Oi
 g1Kw==
X-Gm-Message-State: AOAM530jTnoSs29F1TfrzwXag222YYB8skFvrSNMjyGP8wOiN8Biy/2p
 1TjKbYI8NE2bpRosXD0bYPc=
X-Google-Smtp-Source: ABdhPJxOraUxfroWNEtDSKKJRJ5FLnarDFMY5fFYmXLwijxizZkL92wviNR7tWgMil0FZSOB6gugZQ==
X-Received: by 2002:a05:651c:14f:: with SMTP id
 c15mr31318949ljd.444.1635783376246; 
 Mon, 01 Nov 2021 09:16:16 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id a9sm757594ljm.103.2021.11.01.09.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 09:16:15 -0700 (PDT)
Date: Mon, 1 Nov 2021 17:16:14 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 29/66] target/microblaze: Make mb_cpu_tlb_fill sysemu
 only
Message-ID: <20211101161614.GN3586016@toto>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-30-richard.henderson@linaro.org>
 <33d46517-8b50-1bfb-08f6-221678579693@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33d46517-8b50-1bfb-08f6-221678579693@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: alex.bennee@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, imp@bsdimp.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 31, 2021 at 11:14:04AM +0100, Philippe Mathieu-Daudé wrote:
> On 10/30/21 19:15, Richard Henderson wrote:
> > The fallback code in cpu_loop_exit_sigsegv is sufficient
> > for microblaze linux-user.
> > 
> > Remove the code from cpu_loop that handled the unnamed 0xaa exception.
> > 
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/microblaze/cpu.h          |  8 ++++----
> >  linux-user/microblaze/cpu_loop.c | 10 ----------
> >  target/microblaze/cpu.c          |  2 +-
> >  target/microblaze/helper.c       | 13 +------------
> >  4 files changed, 6 insertions(+), 27 deletions(-)
> > 
> > diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> > index b7a848bbae..e9cd0b88de 100644
> > --- a/target/microblaze/cpu.h
> > +++ b/target/microblaze/cpu.h
> > @@ -394,10 +394,6 @@ void mb_tcg_init(void);
> >  #define MMU_USER_IDX    2
> >  /* See NB_MMU_MODES further up the file.  */
> >  
> > -bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> > -                     MMUAccessType access_type, int mmu_idx,
> > -                     bool probe, uintptr_t retaddr);
> > -
> >  typedef CPUMBState CPUArchState;
> >  typedef MicroBlazeCPU ArchCPU;
> >  
> > @@ -415,6 +411,10 @@ static inline void cpu_get_tb_cpu_state(CPUMBState *env, target_ulong *pc,
> >  }
> >  
> >  #if !defined(CONFIG_USER_ONLY)
> > +bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> > +                     MMUAccessType access_type, int mmu_idx,
> > +                     bool probe, uintptr_t retaddr);
> > +
> >  void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
> >                                 unsigned size, MMUAccessType access_type,
> >                                 int mmu_idx, MemTxAttrs attrs,
> > diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
> > index 52222eb93f..a94467dd2d 100644
> > --- a/linux-user/microblaze/cpu_loop.c
> > +++ b/linux-user/microblaze/cpu_loop.c
> > @@ -37,16 +37,6 @@ void cpu_loop(CPUMBState *env)
> >          process_queued_cpu_work(cs);
> >  
> >          switch (trapnr) {
> > -        case 0xaa:
> > -            {
> > -                info.si_signo = TARGET_SIGSEGV;
> > -                info.si_errno = 0;
> > -                /* XXX: check env->error_code */
> > -                info.si_code = TARGET_SEGV_MAPERR;
> > -                info._sifields._sigfault._addr = 0;
> > -                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> > -            }
> > -            break;
> >          case EXCP_INTERRUPT:
> >            /* just indicate that signals should be handled asap */
> >            break;
> > diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> > index 15db277925..b9c888b87e 100644
> > --- a/target/microblaze/cpu.c
> > +++ b/target/microblaze/cpu.c
> > @@ -365,9 +365,9 @@ static const struct SysemuCPUOps mb_sysemu_ops = {
> >  static const struct TCGCPUOps mb_tcg_ops = {
> >      .initialize = mb_tcg_init,
> >      .synchronize_from_tb = mb_cpu_synchronize_from_tb,
> > -    .tlb_fill = mb_cpu_tlb_fill,
> >  
> >  #ifndef CONFIG_USER_ONLY
> > +    .tlb_fill = mb_cpu_tlb_fill,
> >      .cpu_exec_interrupt = mb_cpu_exec_interrupt,
> >      .do_interrupt = mb_cpu_do_interrupt,
> >      .do_transaction_failed = mb_cpu_transaction_failed,
> > diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
> > index dd2aecd1d5..a607fe68e5 100644
> > --- a/target/microblaze/helper.c
> > +++ b/target/microblaze/helper.c
> > @@ -24,18 +24,7 @@
> >  #include "qemu/host-utils.h"
> >  #include "exec/log.h"
> >  
> > -#if defined(CONFIG_USER_ONLY)
> > -
> > -bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> > -                     MMUAccessType access_type, int mmu_idx,
> > -                     bool probe, uintptr_t retaddr)
> > -{
> > -    cs->exception_index = 0xaa;
> > -    cpu_loop_exit_restore(cs, retaddr);
> > -}
> > -
> > -#else /* !CONFIG_USER_ONLY */
> > -
> > +#ifndef CONFIG_USER_ONLY
> >  static bool mb_cpu_access_is_secure(MicroBlazeCPU *cpu,
> >                                      MMUAccessType access_type)
> >  {
> > 
> 
> To the best of my knowledge:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> But I'd feel safer with an Ack-by from Edgar :)


Sorry for the delays!

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


