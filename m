Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C565E2E8EBB
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 23:56:06 +0100 (CET)
Received: from localhost ([::1]:46912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwCI9-00029c-Ed
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 17:56:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kwCGv-0001iX-Fv
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 17:54:49 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:56440 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kwCGs-0005np-NR
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 17:54:49 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3F98341273;
 Sun,  3 Jan 2021 22:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1609714482;
 x=1611528883; bh=8htcXrr49/aAXpWu8TJr9kpmfZeMGovJQSo/vpOWiZY=; b=
 g/5cm+vp4gt9okvVLz5n3txGk2MlGqeHypc9tJE0DFfMTB8te3DnoPa9c1tfjOSh
 3VsmGe7H4ZiTfAnN0u1tIShc8fE1aOev0yaa52uOboO7zcmYQqM+dAjVTBXr+pN5
 ZykdVx/dkyzhi0efwwsuxknokzIy91j79ecDJx8EhxM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DbLe1YYVXorU; Mon,  4 Jan 2021 01:54:42 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D909141253;
 Mon,  4 Jan 2021 01:54:41 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 4 Jan
 2021 01:54:41 +0300
Date: Mon, 4 Jan 2021 01:54:49 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Joelle van Dyne <j@getutm.app>
Subject: Re: [PATCH] tcg: Fix execution on Apple Silicon
Message-ID: <X/JLOe+LTWalY8h6@SPB-NB-133.local>
References: <20210102122101.39617-1-r.bolshakov@yadro.com>
 <X/Cbs4IX2Oisd0U8@SPB-NB-133.local>
 <CA+E+eSDtxomevXzFsB3h=w_3gjxshNKTRDzb9C7x7E1vMVHorA@mail.gmail.com>
 <X/HSr0q0ihc9uBUO@SPB-NB-133.local>
 <CA+E+eSBtxV996L+vNo5DBdrgafH=CX+TooRjj0KsfOtcvqYxWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CA+E+eSBtxV996L+vNo5DBdrgafH=CX+TooRjj0KsfOtcvqYxWQ@mail.gmail.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 03, 2021 at 08:46:27AM -0800, Joelle van Dyne wrote:
> Can you test with a low memory (-m 512) and also with single threaded
> SMP (-smp 4)? Wondering if you're hitting all the edge cases because
> there's oddities with cache flushing (can be done both in code gen and
> code exec) and interrupt handling that caused issues for me.
> 

I tested XP with default memory (128m) and -m 512. I did run Ubuntu with with
-smp 1/2/4 and multiple variants of memory (2048,4096). I've just
installed Windows 10 and it somehow works noticably faster than Ubuntu
20.04 (what makes me wonder why Ubuntu 20.04 peforms worse).

But you know, I've noticed that MTTCG is disabled by default on arm
hosts, so -smp 4 has no effect (it should print a warning IMO that smp
is noop, or even quit from qemu to disallow single-threaded TCG and -smp
flag with a value beyond 1).

If I try to enable MTTCG, I get a warning from QEMU and only one CPU
inside VM (according to Windows Task Manager).

$ build/qemu-system-x86_64 -cpu Nehalem -accel tcg,thread=multi -smp 4 -m 4096 -hda ~/vms/win10.qcow2

qemu-system-x86_64: -accel tcg,thread=multi: warning: Guest expects a stronger memory ordering than the host provides
This may cause strange/hard to debug errors

As far as I understand from the ticket below this is intentional:
https://bugs.launchpad.net/qemu/+bug/1824768

> There aren't many people overall who want to try to run emulation on
> anything other than x86 host.

Perhaps we could enable MTTCG by enabling TSO in M1 like it's done in
Rosetta to avoid performance overheads of implicit barriers?

BTW, I wonder if you tried my patch? Do you hit the mentioned issues?

With regards to do_tb_phys_invalidate(), the function doesn't care
about whether it was write or exec locked. It needs write permissions
at least for TB spin lock. And something after return from
tb_phys_invalidate() needs exec permssions. I can try to find "that
something" and move change of permissions to rx closer to the place that
needs exec permissions. And then, move change of permissions to rw
inside do_tb_phys_invalidate() just before TB spin lock is acquired.

Regards,
Roman

> -j
> 
> On Sun, Jan 3, 2021 at 6:20 AM Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> >
> > On Sat, Jan 02, 2021 at 11:55:29AM -0800, Joelle van Dyne wrote:
> > > I see you didn't touch cpu_loop_exit() and I'm curious how async
> > > interrupts are handled. Have you tested this and it works i.e. booting
> > > Windows 7 or Ubuntu 20.04? Also I've seen do_tb_phys_invalidate()
> > > called both from code generation context (write unlocked) and
> > > execution context (write locked), how does this patch differentiate
> > > the two?
> > >
> >
> > Hi Joelle,
> >
> > I used the following rule of thumb when finding places where exec/write
> > protection has to be lifted. If it returns EXC_BAD_ACCESS under lldb and
> > stack backtrace is meaningful, then a write-protected region is
> > accessed. If the stack couldn't be unwinded and EXC_BAD_ACCESS is
> > returned then the region has exec restrictions.
> >
> > With the patch I wasn't able to see any EXC_BAD_ACCESS.
> >
> > I've tested x86_64 Ubuntu 20.04 Desktop. It boots but it's very slow
> > (but faster than TCG on x86). Windows XP is much faster and quite
> > responsive. I also tested Windows 95. I'll test Win 7/Win 10 a bit
> > later.
> >
> > I'm going to update v2 shortly and going to introduce assymetric changes of
> > permissions akin to Apple's JavaScriptCore. In v2, I'm not changing
> > permission back and force unless it's needed to avoid EXC_BAD_ACCESS.
> >
> > Regards,
> > Roman
> >
> > > -j
> > >
> > > On Sat, Jan 2, 2021 at 8:13 AM Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> > > >
> > > > On Sat, Jan 02, 2021 at 03:21:02PM +0300, Roman Bolshakov wrote:
> > > > > Pages can't be both write and executable at the same time on Apple
> > > > > Silicon. macOS provides public API to switch write protection [1] for
> > > > > JIT applications, like TCG.
> > > > >
> > > > > 1. https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon
> > > > >
> > > > > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > > > > ---
> > > > >
> > > > > Happy holidays, everyone.
> > > > >
> > > > > This is somewhat similar to https://patchwork.kernel.org/project/qemu-devel/patch/20201108232425.1705-7-j@getutm.app/
> > > > > but I couldn't apply the series so I started from scratch.
> > > > >
> > > > > The primary difference from the patch above is that public API is used.
> > > > > Other differences:
> > > > >   * TB pages are mostly kept write-locked except around tcg_qemu_tb_exec()
> > > > >   * x86_64 macOS doesn't use MAP_JIT and W^X switches
> > > > >
> > > > > Regards,
> > > > > Roman
> > > > >
> > > > >  accel/tcg/cpu-exec.c      | 10 ++++++++++
> > > > >  accel/tcg/translate-all.c | 26 ++++++++++++++++++++++++++
> > > > >  include/exec/exec-all.h   |  2 ++
> > > > >  tcg/tcg.c                 |  1 +
> > > > >  4 files changed, 39 insertions(+)
> > > > >
> > > > > diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> > > > > index 8689c54499..0042fc9f2b 100644
> > > > > --- a/accel/tcg/cpu-exec.c
> > > > > +++ b/accel/tcg/cpu-exec.c
> > > > > @@ -175,7 +175,9 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
> > > > >      }
> > > > >  #endif /* DEBUG_DISAS */
> > > > >
> > > > > +    tb_write_lock();
> > > > >      ret = tcg_qemu_tb_exec(env, tb_ptr);
> > > > > +    tb_write_unlock();
> > > > >      cpu->can_do_io = 1;
> > > > >      last_tb = (TranslationBlock *)(ret & ~TB_EXIT_MASK);
> > > > >      tb_exit = ret & TB_EXIT_MASK;
> > > > > @@ -220,9 +222,11 @@ static void cpu_exec_nocache(CPUState *cpu, int max_cycles,
> > > > >      cflags |= MIN(max_cycles, CF_COUNT_MASK);
> > > > >
> > > > >      mmap_lock();
> > > > > +    tb_write_unlock();
> > > > >      tb = tb_gen_code(cpu, orig_tb->pc, orig_tb->cs_base,
> > > > >                       orig_tb->flags, cflags);
> > > > >      tb->orig_tb = orig_tb;
> > > > > +    tb_write_lock();
> > > > >      mmap_unlock();
> > > > >
> > > > >      /* execute the generated code */
> > > > > @@ -268,7 +272,9 @@ void cpu_exec_step_atomic(CPUState *cpu)
> > > > >          tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, cf_mask);
> > > > >          if (tb == NULL) {
> > > > >              mmap_lock();
> > > > > +            tb_write_unlock();
> > > > >              tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
> > > > > +            tb_write_lock();
> > > > >              mmap_unlock();
> > > > >          }
> > > > >
> > > > > @@ -428,7 +434,9 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
> > > > >      tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, cf_mask);
> > > > >      if (tb == NULL) {
> > > > >          mmap_lock();
> > > > > +        tb_write_unlock();
> > > > >          tb = tb_gen_code(cpu, pc, cs_base, flags, cf_mask);
> > > > > +        tb_write_lock();
> > > > >          mmap_unlock();
> > > > >          /* We add the TB in the virtual pc hash table for the fast lookup */
> > > > >          qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
> > > > > @@ -444,7 +452,9 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
> > > > >  #endif
> > > > >      /* See if we can patch the calling TB. */
> > > > >      if (last_tb) {
> > > > > +        tb_write_unlock();
> > > > >          tb_add_jump(last_tb, tb_exit, tb);
> > > > > +        tb_write_lock();
> > > > >      }
> > > > >      return tb;
> > > > >  }
> > > > > diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> > > > > index b7d50a73d4..1562076ffb 100644
> > > > > --- a/accel/tcg/translate-all.c
> > > > > +++ b/accel/tcg/translate-all.c
> > > > > @@ -1072,6 +1072,9 @@ static inline void *alloc_code_gen_buffer(void)
> > > > >      size_t size = tcg_ctx->code_gen_buffer_size;
> > > > >      void *buf;
> > > > >
> > > > > +#if defined(__APPLE__) && defined(__aarch64__)
> > > > > +    flags |= MAP_JIT;
> > > > > +#endif
> > > > >      buf = mmap(NULL, size, prot, flags, -1, 0);
> > > > >      if (buf == MAP_FAILED) {
> > > > >          return NULL;
> > > > > @@ -1485,7 +1488,9 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
> > > > >
> > > > >  static void tb_phys_invalidate__locked(TranslationBlock *tb)
> > > > >  {
> > > > > +    tb_write_unlock();
> > > > >      do_tb_phys_invalidate(tb, true);
> > > > > +    tb_write_lock();
> > > > >  }
> > > > >
> > > > >  /* invalidate one TB
> > > > > @@ -2722,3 +2727,24 @@ void tcg_flush_softmmu_tlb(CPUState *cs)
> > > > >      tlb_flush(cs);
> > > > >  #endif
> > > > >  }
> > > > > +
> > > > > +#if defined(__APPLE__) && defined(__aarch64__)
> > > > > +static void tb_write_protect(bool locked)
> > > > > +{
> > > > > +    if (pthread_jit_write_protect_supported_np()){
> > > > > +        pthread_jit_write_protect_np(locked);
> > > > > +    }
> > > > > +}
> > > > > +#else
> > > > > +static void tb_write_protect(bool locked) {}
> > > > > +#endif
> > > > > +
> > > > > +void tb_write_lock(void)
> > > > > +{
> > > > > +    tb_write_protect(true);
> > > > > +}
> > > > > +
> > > > > +void tb_write_unlock(void)
> > > > > +{
> > > > > +    tb_write_protect(false);
> > > > > +}
> > > > > diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> > > > > index fab573da06..962dca0975 100644
> > > > > --- a/include/exec/exec-all.h
> > > > > +++ b/include/exec/exec-all.h
> > > > > @@ -549,6 +549,8 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
> > > > >                                     target_ulong cs_base, uint32_t flags,
> > > > >                                     uint32_t cf_mask);
> > > > >  void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
> > > > > +void tb_write_lock(void);
> > > > > +void tb_write_unlock(void);
> > > > >
> > > > >  /* GETPC is the true target of the return instruction that we'll execute.  */
> > > > >  #if defined(CONFIG_TCG_INTERPRETER)
> > > > > diff --git a/tcg/tcg.c b/tcg/tcg.c
> > > > > index 43c6cf8f52..303bb436bd 100644
> > > > > --- a/tcg/tcg.c
> > > > > +++ b/tcg/tcg.c
> > > > > @@ -1065,6 +1065,7 @@ void tcg_prologue_init(TCGContext *s)
> > > > >      s->pool_labels = NULL;
> > > > >  #endif
> > > > >
> > > > > +    tb_write_unlock();
> > > > >      /* Generate the prologue.  */
> > > > >      tcg_target_qemu_prologue(s);
> > > > >
> > > > > --
> > > > > 2.29.2
> > > > >
> > > >
> > > > I've also noticed that Apple doesn't worry about sticking to particular
> > > > W^X mode:
> > > >
> > > > https://bugs.webkit.org/attachment.cgi?id=402515&action=prettypatch
> > > >
> > > > We might also drop lock/unlock symmetry from here. E.g. we can have two
> > > > functions that switch the mode (they might be moved to util/osdep.c):
> > > >
> > > >   qemu_jit_write();
> > > >   qemu_jit_execute();
> > > >
> > > > Then we use them just before writing or before executing like advised on
> > > > their documentation page.
> > > >
> > > > -Roman

