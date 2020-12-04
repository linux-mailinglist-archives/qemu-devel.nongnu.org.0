Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB382CF582
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:21:55 +0100 (CET)
Received: from localhost ([::1]:33796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHaU-0000P3-Cu
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1klEyD-0001qp-Ay
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:34:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1klExw-0003FN-6o
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607103211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=feE/lBMJoi301bQBnjrvPUiRMi8D/35xLx9oyJKn6Lo=;
 b=EAkOVuq3dGeF6Ar1R50skBL+zzVCkkhOBvCnR82L+K6dzwsO+3BR5lSkpk0EFlE7rgEjGj
 gcZ1haGGnOdBm4z+KubGgtWwoeSjJNTYc30XwbHsfhE3ZF/2qd7MIucyb54aJhdYxPLJWk
 S0HnPEaCoky4ScyU2kR7Lm4v+r4+gHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-TDFcODhuPIehh_ga_3-fYQ-1; Fri, 04 Dec 2020 12:28:24 -0500
X-MC-Unique: TDFcODhuPIehh_ga_3-fYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E110107ACE3;
 Fri,  4 Dec 2020 17:28:22 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C4B15C22A;
 Fri,  4 Dec 2020 17:28:16 +0000 (UTC)
Date: Fri, 4 Dec 2020 12:28:14 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC v7 12/22] cpu: Introduce TCGCpuOperations struct
Message-ID: <20201204172814.GO3836@habkost.net>
References: <20201130023535.16689-1-cfontana@suse.de>
 <20201130023535.16689-13-cfontana@suse.de>
 <fb02985a-010f-5a68-7444-b214e97f9050@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fb02985a-010f-5a68-7444-b214e97f9050@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 04, 2020 at 06:10:49PM +0100, Philippe Mathieu-Daudé wrote:
> On 11/30/20 3:35 AM, Claudio Fontana wrote:
> > From: Eduardo Habkost <ehabkost@redhat.com>
> > 
> > The TCG-specific CPU methods will be moved to a separate struct,
> > to make it easier to move accel-specific code outside generic CPU
> > code in the future.  Start by moving tcg_initialize().
> 
> Good idea! One minor comment below.
> 
> > 
> > The new CPUClass.tcg_opts field may eventually become a pointer,
> > but keep it an embedded struct for now, to make code conversion
> > easier.
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> >  MAINTAINERS                     |  1 +
> >  cpu.c                           |  2 +-
> >  include/hw/core/cpu.h           |  9 ++++++++-
> >  include/hw/core/tcg-cpu-ops.h   | 25 +++++++++++++++++++++++++
> >  target/alpha/cpu.c              |  2 +-
> >  target/arm/cpu.c                |  2 +-
> >  target/avr/cpu.c                |  2 +-
> >  target/cris/cpu.c               | 12 ++++++------
> >  target/hppa/cpu.c               |  2 +-
> >  target/i386/tcg-cpu.c           |  2 +-
> >  target/lm32/cpu.c               |  2 +-
> >  target/m68k/cpu.c               |  2 +-
> >  target/microblaze/cpu.c         |  2 +-
> >  target/mips/cpu.c               |  2 +-
> >  target/moxie/cpu.c              |  2 +-
> >  target/nios2/cpu.c              |  2 +-
> >  target/openrisc/cpu.c           |  2 +-
> >  target/ppc/translate_init.c.inc |  2 +-
> >  target/riscv/cpu.c              |  2 +-
> >  target/rx/cpu.c                 |  2 +-
> >  target/s390x/cpu.c              |  2 +-
> >  target/sh4/cpu.c                |  2 +-
> >  target/sparc/cpu.c              |  2 +-
> >  target/tilegx/cpu.c             |  2 +-
> >  target/tricore/cpu.c            |  2 +-
> >  target/unicore32/cpu.c          |  2 +-
> >  target/xtensa/cpu.c             |  2 +-
> >  27 files changed, 63 insertions(+), 30 deletions(-)
> >  create mode 100644 include/hw/core/tcg-cpu-ops.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f53f2678d8..d876f504a6 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1535,6 +1535,7 @@ F: qapi/machine.json
> >  F: qapi/machine-target.json
> >  F: include/hw/boards.h
> >  F: include/hw/core/cpu.h
> > +F: include/hw/core/tcg-cpu-ops.h
> >  F: include/hw/cpu/cluster.h
> >  F: include/sysemu/numa.h
> >  T: git https://github.com/ehabkost/qemu.git machine-next
> > diff --git a/cpu.c b/cpu.c
> > index 0be5dcb6f3..d02c2a17f1 100644
> > --- a/cpu.c
> > +++ b/cpu.c
> > @@ -180,7 +180,7 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
> >  
> >      if (tcg_enabled() && !tcg_target_initialized) {
> >          tcg_target_initialized = true;
> > -        cc->tcg_initialize();
> > +        cc->tcg_ops.initialize();
> >      }
> >      tlb_init(cpu);
> >  
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index 3d92c967ff..c93b08a0fb 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -76,6 +76,10 @@ typedef struct CPUWatchpoint CPUWatchpoint;
> >  
> >  struct TranslationBlock;
> >  
> > +#ifdef CONFIG_TCG
> > +#include "tcg-cpu-ops.h"
> > +#endif /* CONFIG_TCG */
> > +
> >  /**
> >   * CPUClass:
> >   * @class_by_name: Callback to map -cpu command line model name to an
> > @@ -221,12 +225,15 @@ struct CPUClass {
> >  
> >      void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
> >      vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
> > -    void (*tcg_initialize)(void);
> >  
> >      const char *deprecation_note;
> >      /* Keep non-pointer data at the end to minimize holes.  */
> >      int gdb_num_core_regs;
> >      bool gdb_stop_before_watchpoint;
> > +
> > +#ifdef CONFIG_TCG
> > +    TcgCpuOperations tcg_ops;
> > +#endif /* CONFIG_TCG */
> >  };

I'm not a fan of #ifdefs in struct definitions (especially in
generic code like hw/cpu), because there's risk the same header
generate different struct layout when used by different .c files.
I would prefer to gradually refactor the code so that tcg_ops is
eventually removed from CPUClass.

This is not a dealbreaker, because both approaches are steps in
the same direction.  But the #ifdef here makes review harder and
has more risks of unwanted side effects.

> >  
> >  /*
> > diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> > new file mode 100644
> > index 0000000000..4475ef0996
> > --- /dev/null
> > +++ b/include/hw/core/tcg-cpu-ops.h
> > @@ -0,0 +1,25 @@
> > +/*
> > + * TCG-Specific operations that are not meaningful for hardware accelerators
> > + *
> > + * Copyright 2020 SUSE LLC
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#ifndef TCG_CPU_OPS_H
> > +#define TCG_CPU_OPS_H
> > +
> > +/**
> > + * struct TcgCpuOperations: TCG operations specific to a CPU class
> > + */
> > +typedef struct TcgCpuOperations {
> > +    /**
> > +     * @initialize: Initalize TCG state
> > +     *
> > +     * Called when the first CPU is realized.
> > +     */
> > +    void (*initialize)(void);
> > +} TcgCpuOperations;
> > +
> > +#endif /* TCG_CPU_OPS_H */
> ...
> 
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 07492e9f9a..1fa9382a7c 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -2261,7 +2261,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
> >      cc->gdb_stop_before_watchpoint = true;
> >      cc->disas_set_info = arm_disas_set_info;
> >  #ifdef CONFIG_TCG
> > -    cc->tcg_initialize = arm_translate_init;
> > +    cc->tcg_ops.initialize = arm_translate_init;
> 
> This one is correctly guarded by '#ifdef CONFIG_TCG'.
> 
> For the other targets, can you either place it within
> the '#ifdef CONFIG_TCG' block or if there is none, add
> one please?

As a new #ifdef risks having additional unwanted side effects, I
would prefer to do it in separate patch, just in case.

This also applies to the #ifdef Claudio added to hw/core/cpu.h
above.  In case we really want to do it, I would do it in a
separate patch.

> 
> With that change:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks!

-- 
Eduardo


