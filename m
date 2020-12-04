Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EBB2CF269
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 17:55:11 +0100 (CET)
Received: from localhost ([::1]:52222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klEMQ-0004XI-23
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 11:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1klDcd-0001BB-1n
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 11:07:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1klDcX-0006mH-SO
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 11:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607098063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Q5LWIWjuSipBsuzx2i5lLvNCsEtnGZIRa0VCpunAVk=;
 b=BZ9Ftg5ih5Mm9dVWfZUfDOVADptgwzu3Ak/iJhRwFReY5PBtjOWzDNgi3m5ZckyYrA50yX
 /YoK3ARy03xbrFtyb9V6CLe37EFErnXBNGl8OJZb2yq1kIJJYnLS+bU5fewRiH+K2pEnzl
 CA5hJfzk27di+0pw8eh6rgocWQ/zV+8=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-liCoe8aWMYqTu0LfkzC4Pg-1; Fri, 04 Dec 2020 11:07:37 -0500
X-MC-Unique: liCoe8aWMYqTu0LfkzC4Pg-1
Received: by mail-pl1-f199.google.com with SMTP id a17so3477620pls.2
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 08:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Q5LWIWjuSipBsuzx2i5lLvNCsEtnGZIRa0VCpunAVk=;
 b=iJZEu0Htbkh36Zl3s88a4eVKV38Ej0SVmpwBqYsIQ5orgPH/3sBnicf+Q8mZ/gFLL4
 LXhEG2CDOAoPAoTqfv28dPQUjcUrHoh21N1AVFBxzaMDS/iVTsFVQenFDyPwWqevrac6
 HU9EBRqU76CYV1Iv1pAtwUtppep8R0m+0Ju651INM6X7Xpl0RaIsfq8AVBt63Bg7/3F+
 HOBAaL4Plc6/TCUSNbLd8Px4NCPxcxUH1Yr6OrbypVxQD3DHi+6wLHKymzfXFmQnxV5C
 a78TN5oS+4BYxLgoPze/0SvPZrusc9YQIheSJSS0Qoi37evqzLw0OTVjsD6XmmwMPy2X
 aLSA==
X-Gm-Message-State: AOAM530MbrJeGxWZDWIvaAOzkHDCtG+FuTLVPHMOR41jh0h6T29+bPQX
 Z5CA8HazQ37kvD5m0wY4e6JC2riT+lksufdvF+A7P9htQ4PZ6W9PTzoO4hTUe2Nn7D+pd5K5S2E
 OUVSjB9Zrzojr1YeHz7wk2O5RQ2I2K70=
X-Received: by 2002:a63:3247:: with SMTP id y68mr8150188pgy.10.1607098056705; 
 Fri, 04 Dec 2020 08:07:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytSHKjad5qpcZiQGxvrmQUgLt0lDSlZifrmAs46Ys1MtEsIQlOxkZD9tDSPcDhkuNDNFmyTrt7dgO2fX9mlVw=
X-Received: by 2002:a63:3247:: with SMTP id y68mr8150162pgy.10.1607098056345; 
 Fri, 04 Dec 2020 08:07:36 -0800 (PST)
MIME-Version: 1.0
References: <20201130023535.16689-1-cfontana@suse.de>
 <07bc7bc1-a6d0-a470-b717-15cb23c06563@suse.de>
In-Reply-To: <07bc7bc1-a6d0-a470-b717-15cb23c06563@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 4 Dec 2020 17:07:21 +0100
Message-ID: <CABgObfYK-65Z3j1SA3zzj4WEFtjxj0QNYbvtV_LipjYAONeAeA@mail.gmail.com>
Subject: Re: [RFC v7 00/22] i386 cleanup [hw/core/cpu.c common]
To: Claudio Fontana <cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c4a2bc05b5a5acd0"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c4a2bc05b5a5acd0
Content-Type: text/plain; charset="UTF-8"

Il ven 4 dic 2020, 14:54 Claudio Fontana <cfontana@suse.de> ha scritto:

> On 11/30/20 3:35 AM, Claudio Fontana wrote:
> > Hi all, this is v7 of the i386 cleanup,
>
> This is fairly broken still and I am fixing it up,
>
> but a question arises while hunting bugs here.
>
> Silent bugs are introduced when trying to use code like
>
> #ifndef CONFIG_USER_ONLY
>
> in files that are built in "common" objects, since they are target
> independent.
>

That should be avoided by poison.h

I wonder also about the rationale why the cpu code is split between
>
> hw/core/cpu.c and $(top_srcdir)/cpu.c
>
> with one part in common and one part in "target specific".
>

Mostly historical, cpu.c used to have much more than CPU code (it was
exec.c until a month ago, one of the "historical" core files in QEMU and it
had all the dispatch side of the memory API). I wouldn't mind merging these
two files into one.

Paolo


> What do we gain by having part of the cpu in common?
>
> In some cases we end up going through all sort of hoops because we cannot
> just code everything in hw/core/cpu.c due to the fact
> that we do not see CONFIG_ there.
>
>
> > with the most interesting patches at the end.
> >
> > v6 -> v7: integrate TCGCpuOperations, refactored cpu_exec_realizefn
> >
> > * integrate TCGCpuOperations (Eduardo)
> >
> > Taken some refactoring from Eduardo for Tcg-only operations on
> > CPUClass.
> >
> > * refactored cpu_exec_realizefn
> >
> > The other main change is a refactoring of cpu_exec_realizefn,
> > directly linked to the effort of making many cpu_exec operations
> > TCG-only (Eduardo series above):
> >
> > cpu_exec_realizefn is actually a TCG-only thing, with the
> > exception of a couple things that can be done in base cpu code.
> >
> > This changes all targets realizefn, so I guess I have to Cc:
> > the Multiverse? (Universe was already CCed for all accelerators).
> >
> >
> > v5 -> v6: remove MODULE_INIT_ACCEL_CPU
> >
> >
> > instead, use a call to accel_init_interfaces().
> >
> > * The class lookups are now general and performed in accel/
> >
> >   new AccelCPUClass for new archs are supported as new
> >   ones appear in the class hierarchy, no need for stubs.
> >
> > * Split the code a bit better
> >
> >
> > v4 -> v5: centralized and simplified initializations
> >
> > I put in Cc: Emilio G. Cota, specifically because in patch 8
> > I (re)moved for user-mode the call to tcg_regions_init().
> >
> > The call happens now inside the tcg AccelClass machine_init,
> > (so earlier). This seems to work fine, but thought to get the
> > author opinion on this.
> >
> > Rebased on "tcg-cpus: split into 3 tcg variants" series
> > (queued by Richard), to avoid some code churn:
> >
> >
> > https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg04356.html
> >
> >
> > * Extended AccelClass to user-mode.
> >
> > user-mode now does not call tcg_exec_init directly,
> > instead it uses the tcg accel class, and its init_machine method.
> >
> > Since user-mode does not define or use a machine state,
> > the machine is just passed as NULL.
> >
> > The immediate advantage is that now we can call current_accel()
> > from both user mode and softmmu, so we can work out the correct
> > class to use for accelerator initializations.
> >
> > * QOMification of CpusAccelOps
> >
> > simple QOMification of CpusAccelOps abstract class.
> >
> > * Centralized all accel_cpu_init, so only one per cpu-arch,
> >   plus one for all accels will remain.
> >
> >   So we can expect accel_cpu_init() to be limited to:
> >
> >   softmmu/cpus.c - initializes the chosen softmmu accel ops for the cpus
> module.
> >   target/ARCH/cpu.c - initializes the chosen arch-specific cpu
> accelerator.
> >
> > These changes are meant to address concerns/issues (Paolo):
> >
> > 1) the use of if (tcg_enabled()) and similar in the module_init call path
> >
> > 2) the excessive number of accel_cpu_init() to hunt down in the codebase.
> >
> >
> > * Fixed wrong use of host_cpu_class_init (Eduardo)
> >
> >
> > v3 -> v4: QOMification of X86CPUAccelClass
> >
> >
> > In this version I basically QOMified X86CPUAccel, taking the
> > suggestions from Eduardo as the starting point,
> > but stopping just short of making it an actual QOM interface,
> > using a plain abstract class, and then subclasses for the
> > actual objects.
> >
> > Initialization is still using the existing qemu initialization
> > framework (module_call_init), which is I still think is better
> > than the alternatives proposed, in the current state.
> >
> > Possibly some improvements could be developed in the future here.
> > In this case, effort should be put in keeping things extendible,
> > in order not to be blocked once accelerators also become modules.
> >
> > Motivation and higher level steps:
> >
> > https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg04628.html
> >
> > Looking forward to your comments on this proposal,
> >
> > Ciao,
> >
> > Claudio
> >
> > Claudio Fontana (13):
> >   i386: move kvm accel files into kvm/
> >   i386: move whpx accel files into whpx/
> >   i386: move hax accel files into hax/
> >   i386: hvf: remove stale MAINTAINERS entry for old hvf stubs
> >   i386: move TCG accel files into tcg/
> >   i386: move cpu dump out of helper.c into cpu-dump.c
> >   i386: move TCG cpu class initialization out of helper.c
> >   accel: extend AccelState and AccelClass to user-mode
> >   accel: replace struct CpusAccel with AccelOpsClass
> >   accel: introduce AccelCPUClass extending CPUClass
> >   i386: split cpu accelerators from cpu.c, using AccelCPUClass
> >   cpu-exec: refactor realizefn for all targets
> >   cpu: introduce cpu_accel_instance_init
> >
> > Eduardo Habkost (9):
> >   tcg: cpu_exec_{enter,exit} helpers
> >   tcg: make CPUClass.cpu_exec_* optional
> >   tcg: Make CPUClass.debug_excp_handler optional
> >   cpu: Remove unnecessary noop methods
> >   cpu: Introduce TCGCpuOperations struct
> >   cpu: Move synchronize_from_tb() to tcg_ops
> >   cpu: Move cpu_exec_* to tcg_ops
> >   cpu: Move tlb_fill to tcg_ops
> >   cpu: Move debug_excp_handler to tcg_ops
> >
> >  MAINTAINERS                           |  19 +-
> >  accel/accel-common.c                  | 105 +++++
> >  accel/{accel.c => accel-softmmu.c}    |  60 +--
> >  accel/accel-softmmu.h                 |  15 +
> >  accel/accel-user.c                    |  24 ++
> >  accel/kvm/kvm-all.c                   |   2 -
> >  accel/kvm/kvm-cpus.c                  |  26 +-
> >  accel/kvm/kvm-cpus.h                  |   2 -
> >  accel/meson.build                     |   4 +-
> >  accel/qtest/qtest.c                   |  25 +-
> >  accel/tcg/cpu-exec.c                  |  86 +++-
> >  accel/tcg/cputlb.c                    |   6 +-
> >  accel/tcg/meson.build                 |   2 +-
> >  accel/tcg/tcg-all.c                   |  11 +-
> >  accel/tcg/tcg-cpus-icount.c           |  11 +-
> >  accel/tcg/tcg-cpus-icount.h           |   2 +
> >  accel/tcg/tcg-cpus-mttcg.c            |  12 +-
> >  accel/tcg/tcg-cpus-mttcg.h            |  19 +
> >  accel/tcg/tcg-cpus-rr.c               |   7 -
> >  accel/tcg/tcg-cpus.c                  |  43 ++
> >  accel/tcg/tcg-cpus.h                  |   4 -
> >  accel/tcg/user-exec.c                 |   6 +-
> >  accel/xen/xen-all.c                   |  24 +-
> >  bsd-user/main.c                       |  12 +-
> >  cpu.c                                 |  53 +--
> >  hw/core/cpu.c                         |  44 ++-
> >  hw/i386/fw_cfg.c                      |   2 +-
> >  hw/i386/intel_iommu.c                 |   2 +-
> >  hw/i386/kvm/apic.c                    |   2 +-
> >  hw/i386/kvm/clock.c                   |   2 +-
> >  hw/i386/microvm.c                     |   2 +-
> >  hw/i386/pc.c                          |   2 +-
> >  hw/i386/pc_piix.c                     |   1 +
> >  hw/i386/x86.c                         |   2 +-
> >  include/exec/cpu-all.h                |   4 +
> >  include/hw/boards.h                   |   2 +-
> >  include/hw/core/accel-cpu.h           |  25 ++
> >  include/hw/core/cpu.h                 |  65 ++--
> >  include/hw/core/tcg-cpu-ops.h         |  56 +++
> >  include/{sysemu => qemu}/accel.h      |  16 +-
> >  include/sysemu/accel-ops.h            |  45 +++
> >  include/sysemu/cpus.h                 |  26 +-
> >  include/sysemu/hvf.h                  |   2 +-
> >  include/sysemu/kvm.h                  |   2 +-
> >  include/sysemu/kvm_int.h              |   2 +-
> >  linux-user/main.c                     |   8 +-
> >  meson.build                           |   1 +
> >  softmmu/cpus.c                        |  12 +-
> >  softmmu/memory.c                      |   2 +-
> >  softmmu/qtest.c                       |   2 +-
> >  softmmu/vl.c                          |  12 +-
> >  target/alpha/cpu.c                    |  12 +-
> >  target/arm/cpu.c                      |  16 +-
> >  target/arm/cpu64.c                    |   2 +-
> >  target/arm/cpu_tcg.c                  |   2 +-
> >  target/avr/cpu.c                      |  13 +-
> >  target/cris/cpu.c                     |  20 +-
> >  target/hppa/cpu.c                     |  11 +-
> >  target/i386/cpu-dump.c                | 538 +++++++++++++++++++++++++
> >  target/i386/cpu.c                     | 418 ++------------------
> >  target/i386/cpu.h                     | 120 +-----
> >  target/i386/{ => hax}/hax-all.c       |   5 +-
> >  target/i386/{ => hax}/hax-cpus.c      |  29 +-
> >  target/i386/{ => hax}/hax-cpus.h      |   2 -
> >  target/i386/{ => hax}/hax-i386.h      |   6 +-
> >  target/i386/{ => hax}/hax-interface.h |   0
> >  target/i386/{ => hax}/hax-mem.c       |   0
> >  target/i386/{ => hax}/hax-posix.c     |   0
> >  target/i386/{ => hax}/hax-posix.h     |   0
> >  target/i386/{ => hax}/hax-windows.c   |   0
> >  target/i386/{ => hax}/hax-windows.h   |   0
> >  target/i386/hax/meson.build           |   7 +
> >  target/i386/helper-tcg.h              | 112 ++++++
> >  target/i386/helper.c                  | 539 +-------------------------
> >  target/i386/host-cpu.c                | 198 ++++++++++
> >  target/i386/host-cpu.h                |  19 +
> >  target/i386/hvf/cpu.c                 |  65 ++++
> >  target/i386/hvf/hvf-cpus.c            |  27 +-
> >  target/i386/hvf/hvf-cpus.h            |   2 -
> >  target/i386/hvf/hvf-i386.h            |   2 +-
> >  target/i386/hvf/hvf.c                 |   3 +-
> >  target/i386/hvf/meson.build           |   1 +
> >  target/i386/hvf/x86_task.c            |   2 +-
> >  target/i386/kvm/cpu.c                 | 148 +++++++
> >  target/i386/{ => kvm}/hyperv-proto.h  |   0
> >  target/i386/{ => kvm}/hyperv-stub.c   |   0
> >  target/i386/{ => kvm}/hyperv.c        |   0
> >  target/i386/{ => kvm}/hyperv.h        |   0
> >  target/i386/kvm/kvm-cpu.h             |  41 ++
> >  target/i386/{ => kvm}/kvm-stub.c      |   0
> >  target/i386/{ => kvm}/kvm.c           |   3 +-
> >  target/i386/{ => kvm}/kvm_i386.h      |   0
> >  target/i386/kvm/meson.build           |   8 +
> >  target/i386/kvm/trace-events          |   7 +
> >  target/i386/kvm/trace.h               |   1 +
> >  target/i386/machine.c                 |   4 +-
> >  target/i386/meson.build               |  39 +-
> >  target/i386/{ => tcg}/bpt_helper.c    |   1 +
> >  target/i386/{ => tcg}/cc_helper.c     |   1 +
> >  target/i386/tcg/cpu.c                 | 173 +++++++++
> >  target/i386/{ => tcg}/excp_helper.c   |   1 +
> >  target/i386/{ => tcg}/fpu_helper.c    |  33 +-
> >  target/i386/{ => tcg}/int_helper.c    |   1 +
> >  target/i386/{ => tcg}/mem_helper.c    |   1 +
> >  target/i386/tcg/meson.build           |  14 +
> >  target/i386/{ => tcg}/misc_helper.c   |   1 +
> >  target/i386/{ => tcg}/mpx_helper.c    |   1 +
> >  target/i386/{ => tcg}/seg_helper.c    |   1 +
> >  target/i386/{ => tcg}/smm_helper.c    |   2 +
> >  target/i386/{ => tcg}/svm_helper.c    |   1 +
> >  target/i386/{ => tcg}/tcg-stub.c      |   0
> >  target/i386/{ => tcg}/translate.c     |   1 +
> >  target/i386/trace-events              |   6 -
> >  target/i386/whpx/meson.build          |   4 +
> >  target/i386/{ => whpx}/whp-dispatch.h |   0
> >  target/i386/{ => whpx}/whpx-all.c     |   4 +-
> >  target/i386/{ => whpx}/whpx-cpus.c    |  29 +-
> >  target/i386/{ => whpx}/whpx-cpus.h    |   2 -
> >  target/lm32/cpu.c                     |  13 +-
> >  target/m68k/cpu.c                     |  10 +-
> >  target/microblaze/cpu.c               |  17 +-
> >  target/mips/cpu.c                     |  12 +-
> >  target/moxie/cpu.c                    |  10 +-
> >  target/nios2/cpu.c                    |  12 +-
> >  target/openrisc/cpu.c                 |  12 +-
> >  target/ppc/translate_init.c.inc       |  17 +-
> >  target/riscv/cpu.c                    |  18 +-
> >  target/rx/cpu.c                       |  18 +-
> >  target/s390x/cpu.c                    |  13 +-
> >  target/sh4/cpu.c                      |  12 +-
> >  target/sparc/cpu.c                    |  14 +-
> >  target/tilegx/cpu.c                   |  10 +-
> >  target/tricore/cpu.c                  |  10 +-
> >  target/unicore32/cpu.c                |  12 +-
> >  target/xtensa/cpu.c                   |  12 +-
> >  135 files changed, 2302 insertions(+), 1540 deletions(-)
> >  create mode 100644 accel/accel-common.c
> >  rename accel/{accel.c => accel-softmmu.c} (64%)
> >  create mode 100644 accel/accel-softmmu.h
> >  create mode 100644 accel/accel-user.c
> >  create mode 100644 accel/tcg/tcg-cpus-mttcg.h
> >  create mode 100644 include/hw/core/accel-cpu.h
> >  create mode 100644 include/hw/core/tcg-cpu-ops.h
> >  rename include/{sysemu => qemu}/accel.h (94%)
> >  create mode 100644 include/sysemu/accel-ops.h
> >  create mode 100644 target/i386/cpu-dump.c
> >  rename target/i386/{ => hax}/hax-all.c (99%)
> >  rename target/i386/{ => hax}/hax-cpus.c (71%)
> >  rename target/i386/{ => hax}/hax-cpus.h (95%)
> >  rename target/i386/{ => hax}/hax-i386.h (95%)
> >  rename target/i386/{ => hax}/hax-interface.h (100%)
> >  rename target/i386/{ => hax}/hax-mem.c (100%)
> >  rename target/i386/{ => hax}/hax-posix.c (100%)
> >  rename target/i386/{ => hax}/hax-posix.h (100%)
> >  rename target/i386/{ => hax}/hax-windows.c (100%)
> >  rename target/i386/{ => hax}/hax-windows.h (100%)
> >  create mode 100644 target/i386/hax/meson.build
> >  create mode 100644 target/i386/helper-tcg.h
> >  create mode 100644 target/i386/host-cpu.c
> >  create mode 100644 target/i386/host-cpu.h
> >  create mode 100644 target/i386/hvf/cpu.c
> >  create mode 100644 target/i386/kvm/cpu.c
> >  rename target/i386/{ => kvm}/hyperv-proto.h (100%)
> >  rename target/i386/{ => kvm}/hyperv-stub.c (100%)
> >  rename target/i386/{ => kvm}/hyperv.c (100%)
> >  rename target/i386/{ => kvm}/hyperv.h (100%)
> >  create mode 100644 target/i386/kvm/kvm-cpu.h
> >  rename target/i386/{ => kvm}/kvm-stub.c (100%)
> >  rename target/i386/{ => kvm}/kvm.c (99%)
> >  rename target/i386/{ => kvm}/kvm_i386.h (100%)
> >  create mode 100644 target/i386/kvm/meson.build
> >  create mode 100644 target/i386/kvm/trace-events
> >  create mode 100644 target/i386/kvm/trace.h
> >  rename target/i386/{ => tcg}/bpt_helper.c (99%)
> >  rename target/i386/{ => tcg}/cc_helper.c (99%)
> >  create mode 100644 target/i386/tcg/cpu.c
> >  rename target/i386/{ => tcg}/excp_helper.c (99%)
> >  rename target/i386/{ => tcg}/fpu_helper.c (99%)
> >  rename target/i386/{ => tcg}/int_helper.c (99%)
> >  rename target/i386/{ => tcg}/mem_helper.c (99%)
> >  create mode 100644 target/i386/tcg/meson.build
> >  rename target/i386/{ => tcg}/misc_helper.c (99%)
> >  rename target/i386/{ => tcg}/mpx_helper.c (99%)
> >  rename target/i386/{ => tcg}/seg_helper.c (99%)
> >  rename target/i386/{ => tcg}/smm_helper.c (99%)
> >  rename target/i386/{ => tcg}/svm_helper.c (99%)
> >  rename target/i386/{ => tcg}/tcg-stub.c (100%)
> >  rename target/i386/{ => tcg}/translate.c (99%)
> >  create mode 100644 target/i386/whpx/meson.build
> >  rename target/i386/{ => whpx}/whp-dispatch.h (100%)
> >  rename target/i386/{ => whpx}/whpx-all.c (99%)
> >  rename target/i386/{ => whpx}/whpx-cpus.c (73%)
> >  rename target/i386/{ => whpx}/whpx-cpus.h (96%)
> >
>
>

--000000000000c4a2bc05b5a5acd0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 4 dic 2020, 14:54 Claudio Fontana &lt;<a href=
=3D"mailto:cfontana@suse.de">cfontana@suse.de</a>&gt; ha scritto:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 11/30/20 3:35 AM, Claudio Fontana wrote:<=
br>
&gt; Hi all, this is v7 of the i386 cleanup,<br>
<br>
This is fairly broken still and I am fixing it up,<br>
<br>
but a question arises while hunting bugs here.<br>
<br>
Silent bugs are introduced when trying to use code like<br>
<br>
#ifndef CONFIG_USER_ONLY<br>
<br>
in files that are built in &quot;common&quot; objects, since they are targe=
t independent.<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">That should be avoided by poison.h</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">I wonder also about the rationale why the cpu code is split between=
<br>
<br>
hw/core/cpu.c and $(top_srcdir)/cpu.c<br>
<br>
with one part in common and one part in &quot;target specific&quot;.<br></b=
lockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Mostly =
historical, cpu.c used to have much more than CPU code (it was exec.c until=
 a month ago, one of the &quot;historical&quot; core files in QEMU and it h=
ad all the dispatch side of the memory API). I wouldn&#39;t mind merging th=
ese two files into one.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
What do we gain by having part of the cpu in common?<br>
<br>
In some cases we end up going through all sort of hoops because we cannot j=
ust code everything in hw/core/cpu.c due to the fact<br>
that we do not see CONFIG_ there.<br>
<br>
<br>
&gt; with the most interesting patches at the end.<br>
&gt; <br>
&gt; v6 -&gt; v7: integrate TCGCpuOperations, refactored cpu_exec_realizefn=
<br>
&gt; <br>
&gt; * integrate TCGCpuOperations (Eduardo)<br>
&gt; <br>
&gt; Taken some refactoring from Eduardo for Tcg-only operations on<br>
&gt; CPUClass.<br>
&gt; <br>
&gt; * refactored cpu_exec_realizefn<br>
&gt; <br>
&gt; The other main change is a refactoring of cpu_exec_realizefn,<br>
&gt; directly linked to the effort of making many cpu_exec operations<br>
&gt; TCG-only (Eduardo series above):<br>
&gt; <br>
&gt; cpu_exec_realizefn is actually a TCG-only thing, with the<br>
&gt; exception of a couple things that can be done in base cpu code.<br>
&gt; <br>
&gt; This changes all targets realizefn, so I guess I have to Cc:<br>
&gt; the Multiverse? (Universe was already CCed for all accelerators).<br>
&gt; <br>
&gt; <br>
&gt; v5 -&gt; v6: remove MODULE_INIT_ACCEL_CPU<br>
&gt; <br>
&gt; <br>
&gt; instead, use a call to accel_init_interfaces().<br>
&gt; <br>
&gt; * The class lookups are now general and performed in accel/<br>
&gt; <br>
&gt;=C2=A0 =C2=A0new AccelCPUClass for new archs are supported as new<br>
&gt;=C2=A0 =C2=A0ones appear in the class hierarchy, no need for stubs.<br>
&gt; <br>
&gt; * Split the code a bit better<br>
&gt; <br>
&gt; <br>
&gt; v4 -&gt; v5: centralized and simplified initializations<br>
&gt; <br>
&gt; I put in Cc: Emilio G. Cota, specifically because in patch 8<br>
&gt; I (re)moved for user-mode the call to tcg_regions_init().<br>
&gt; <br>
&gt; The call happens now inside the tcg AccelClass machine_init,<br>
&gt; (so earlier). This seems to work fine, but thought to get the<br>
&gt; author opinion on this.<br>
&gt; <br>
&gt; Rebased on &quot;tcg-cpus: split into 3 tcg variants&quot; series<br>
&gt; (queued by Richard), to avoid some code churn:<br>
&gt; <br>
&gt; <br>
&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg04=
356.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.gnu=
.org/archive/html/qemu-devel/2020-10/msg04356.html</a><br>
&gt; <br>
&gt; <br>
&gt; * Extended AccelClass to user-mode.<br>
&gt; <br>
&gt; user-mode now does not call tcg_exec_init directly,<br>
&gt; instead it uses the tcg accel class, and its init_machine method.<br>
&gt; <br>
&gt; Since user-mode does not define or use a machine state,<br>
&gt; the machine is just passed as NULL.<br>
&gt; <br>
&gt; The immediate advantage is that now we can call current_accel()<br>
&gt; from both user mode and softmmu, so we can work out the correct<br>
&gt; class to use for accelerator initializations.<br>
&gt; <br>
&gt; * QOMification of CpusAccelOps<br>
&gt; <br>
&gt; simple QOMification of CpusAccelOps abstract class.<br>
&gt; <br>
&gt; * Centralized all accel_cpu_init, so only one per cpu-arch,<br>
&gt;=C2=A0 =C2=A0plus one for all accels will remain.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0So we can expect accel_cpu_init() to be limited to:<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0softmmu/cpus.c - initializes the chosen softmmu accel ops =
for the cpus module.<br>
&gt;=C2=A0 =C2=A0target/ARCH/cpu.c - initializes the chosen arch-specific c=
pu accelerator.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; These changes are meant to address concerns/issues (Paolo):<br>
&gt; <br>
&gt; 1) the use of if (tcg_enabled()) and similar in the module_init call p=
ath<br>
&gt; <br>
&gt; 2) the excessive number of accel_cpu_init() to hunt down in the codeba=
se.<br>
&gt; <br>
&gt; <br>
&gt; * Fixed wrong use of host_cpu_class_init (Eduardo)<br>
&gt; <br>
&gt; <br>
&gt; v3 -&gt; v4: QOMification of X86CPUAccelClass<br>
&gt; <br>
&gt; <br>
&gt; In this version I basically QOMified X86CPUAccel, taking the<br>
&gt; suggestions from Eduardo as the starting point,<br>
&gt; but stopping just short of making it an actual QOM interface,<br>
&gt; using a plain abstract class, and then subclasses for the<br>
&gt; actual objects.<br>
&gt; <br>
&gt; Initialization is still using the existing qemu initialization<br>
&gt; framework (module_call_init), which is I still think is better<br>
&gt; than the alternatives proposed, in the current state.<br>
&gt; <br>
&gt; Possibly some improvements could be developed in the future here.<br>
&gt; In this case, effort should be put in keeping things extendible,<br>
&gt; in order not to be blocked once accelerators also become modules.<br>
&gt; <br>
&gt; Motivation and higher level steps:<br>
&gt; <br>
&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg04=
628.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.gnu=
.org/archive/html/qemu-devel/2020-05/msg04628.html</a><br>
&gt; <br>
&gt; Looking forward to your comments on this proposal,<br>
&gt; <br>
&gt; Ciao,<br>
&gt; <br>
&gt; Claudio<br>
&gt; <br>
&gt; Claudio Fontana (13):<br>
&gt;=C2=A0 =C2=A0i386: move kvm accel files into kvm/<br>
&gt;=C2=A0 =C2=A0i386: move whpx accel files into whpx/<br>
&gt;=C2=A0 =C2=A0i386: move hax accel files into hax/<br>
&gt;=C2=A0 =C2=A0i386: hvf: remove stale MAINTAINERS entry for old hvf stub=
s<br>
&gt;=C2=A0 =C2=A0i386: move TCG accel files into tcg/<br>
&gt;=C2=A0 =C2=A0i386: move cpu dump out of helper.c into cpu-dump.c<br>
&gt;=C2=A0 =C2=A0i386: move TCG cpu class initialization out of helper.c<br=
>
&gt;=C2=A0 =C2=A0accel: extend AccelState and AccelClass to user-mode<br>
&gt;=C2=A0 =C2=A0accel: replace struct CpusAccel with AccelOpsClass<br>
&gt;=C2=A0 =C2=A0accel: introduce AccelCPUClass extending CPUClass<br>
&gt;=C2=A0 =C2=A0i386: split cpu accelerators from cpu.c, using AccelCPUCla=
ss<br>
&gt;=C2=A0 =C2=A0cpu-exec: refactor realizefn for all targets<br>
&gt;=C2=A0 =C2=A0cpu: introduce cpu_accel_instance_init<br>
&gt; <br>
&gt; Eduardo Habkost (9):<br>
&gt;=C2=A0 =C2=A0tcg: cpu_exec_{enter,exit} helpers<br>
&gt;=C2=A0 =C2=A0tcg: make CPUClass.cpu_exec_* optional<br>
&gt;=C2=A0 =C2=A0tcg: Make CPUClass.debug_excp_handler optional<br>
&gt;=C2=A0 =C2=A0cpu: Remove unnecessary noop methods<br>
&gt;=C2=A0 =C2=A0cpu: Introduce TCGCpuOperations struct<br>
&gt;=C2=A0 =C2=A0cpu: Move synchronize_from_tb() to tcg_ops<br>
&gt;=C2=A0 =C2=A0cpu: Move cpu_exec_* to tcg_ops<br>
&gt;=C2=A0 =C2=A0cpu: Move tlb_fill to tcg_ops<br>
&gt;=C2=A0 =C2=A0cpu: Move debug_excp_handler to tcg_ops<br>
&gt; <br>
&gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 19 +-<br>
&gt;=C2=A0 accel/accel-common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 105 +++++<br>
&gt;=C2=A0 accel/{accel.c =3D&gt; accel-softmmu.c}=C2=A0 =C2=A0 |=C2=A0 60 =
+--<br>
&gt;=C2=A0 accel/accel-softmmu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 15 +<br>
&gt;=C2=A0 accel/accel-user.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 24 ++<br>
&gt;=C2=A0 accel/kvm/kvm-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 -<br>
&gt;=C2=A0 accel/kvm/kvm-cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 26 +-<br>
&gt;=C2=A0 accel/kvm/kvm-cpus.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 -<br>
&gt;=C2=A0 accel/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 accel/qtest/qtest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 25 +-<br>
&gt;=C2=A0 accel/tcg/cpu-exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 86 +++-<br>
&gt;=C2=A0 accel/tcg/cputlb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 accel/tcg/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 accel/tcg/tcg-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
&gt;=C2=A0 accel/tcg/tcg-cpus-icount.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 11 +-<br>
&gt;=C2=A0 accel/tcg/tcg-cpus-icount.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 accel/tcg/tcg-cpus-mttcg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 12 +-<br>
&gt;=C2=A0 accel/tcg/tcg-cpus-mttcg.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 19 +<br>
&gt;=C2=A0 accel/tcg/tcg-cpus-rr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A07 -<br>
&gt;=C2=A0 accel/tcg/tcg-cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 43 ++<br>
&gt;=C2=A0 accel/tcg/tcg-cpus.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 -<br>
&gt;=C2=A0 accel/tcg/user-exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 accel/xen/xen-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 24 +-<br>
&gt;=C2=A0 bsd-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
&gt;=C2=A0 cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 53 +--<b=
r>
&gt;=C2=A0 hw/core/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 44 ++-<br>
&gt;=C2=A0 hw/i386/fw_cfg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 hw/i386/intel_iommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 hw/i386/kvm/apic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 hw/i386/kvm/clock.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 hw/i386/microvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 hw/i386/pc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 hw/i386/pc_piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/i386/x86.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 include/exec/cpu-all.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
&gt;=C2=A0 include/hw/boards.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 include/hw/core/accel-cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 25 ++<br>
&gt;=C2=A0 include/hw/core/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 65 ++--<br>
&gt;=C2=A0 include/hw/core/tcg-cpu-ops.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 56 +++<br>
&gt;=C2=A0 include/{sysemu =3D&gt; qemu}/accel.h=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 16 +-<br>
&gt;=C2=A0 include/sysemu/accel-ops.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 45 +++<br>
&gt;=C2=A0 include/sysemu/cpus.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 26 +-<br>
&gt;=C2=A0 include/sysemu/hvf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 include/sysemu/kvm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 include/sysemu/kvm_int.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 linux-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 softmmu/cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
&gt;=C2=A0 softmmu/memory.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 softmmu/qtest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 softmmu/vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
&gt;=C2=A0 target/alpha/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
&gt;=C2=A0 target/arm/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 +-<br>
&gt;=C2=A0 target/arm/cpu64.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 target/arm/cpu_tcg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 target/avr/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +-<br>
&gt;=C2=A0 target/cris/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +-<br>
&gt;=C2=A0 target/hppa/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
&gt;=C2=A0 target/i386/cpu-dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 538 +++++++++++++++++++++++++<br>
&gt;=C2=A0 target/i386/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 418 ++------------------<br>
&gt;=C2=A0 target/i386/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 120 +-----<br>
&gt;=C2=A0 target/i386/{ =3D&gt; hax}/hax-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 +-<br>
&gt;=C2=A0 target/i386/{ =3D&gt; hax}/hax-cpus.c=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 29 +-<br>
&gt;=C2=A0 target/i386/{ =3D&gt; hax}/hax-cpus.h=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 -<br>
&gt;=C2=A0 target/i386/{ =3D&gt; hax}/hax-i386.h=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A06 +-<br>
&gt;=C2=A0 target/i386/{ =3D&gt; hax}/hax-interface.h |=C2=A0 =C2=A00<br>
&gt;=C2=A0 target/i386/{ =3D&gt; hax}/hax-mem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 target/i386/{ =3D&gt; hax}/hax-posix.c=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 target/i386/{ =3D&gt; hax}/hax-posix.h=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 target/i386/{ =3D&gt; hax}/hax-windows.c=C2=A0 =C2=A0|=C2=A0 =C2=
=A00<br>
&gt;=C2=A0 target/i386/{ =3D&gt; hax}/hax-windows.h=C2=A0 =C2=A0|=C2=A0 =C2=
=A00<br>
&gt;=C2=A0 target/i386/hax/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A07 +<br>
&gt;=C2=A0 target/i386/helper-tcg.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 112 ++++++<br>
&gt;=C2=A0 target/i386/helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 539 +-------------------------<br>
&gt;=C2=A0 target/i386/host-cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 198 ++++++++++<br>
&gt;=C2=A0 target/i386/host-cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 19 +<br>
&gt;=C2=A0 target/i386/hvf/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 65 ++++<br>
&gt;=C2=A0 target/i386/hvf/hvf-cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 27 +-<br>
&gt;=C2=A0 target/i386/hvf/hvf-cpus.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 -<br>
&gt;=C2=A0 target/i386/hvf/hvf-i386.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 target/i386/hvf/hvf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 target/i386/hvf/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 target/i386/hvf/x86_task.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 target/i386/kvm/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 148 +++++++<br>
&gt;=C2=A0 target/i386/{ =3D&gt; kvm}/hyperv-proto.h=C2=A0 |=C2=A0 =C2=A00<=
br>
&gt;=C2=A0 target/i386/{ =3D&gt; kvm}/hyperv-stub.c=C2=A0 =C2=A0|=C2=A0 =C2=
=A00<br>
&gt;=C2=A0 target/i386/{ =3D&gt; kvm}/hyperv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 target/i386/{ =3D&gt; kvm}/hyperv.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 target/i386/kvm/kvm-cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 41 ++<br>
&gt;=C2=A0 target/i386/{ =3D&gt; kvm}/kvm-stub.c=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 target/i386/{ =3D&gt; kvm}/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 target/i386/{ =3D&gt; kvm}/kvm_i386.h=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 target/i386/kvm/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A08 +<br>
&gt;=C2=A0 target/i386/kvm/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A07 +<br>
&gt;=C2=A0 target/i386/kvm/trace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 target/i386/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 target/i386/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 39 +-<br>
&gt;=C2=A0 target/i386/{ =3D&gt; tcg}/bpt_helper.c=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 target/i386/{ =3D&gt; tcg}/cc_helper.c=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
&gt;=C2=A0 target/i386/tcg/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 173 +++++++++<br>
&gt;=C2=A0 target/i386/{ =3D&gt; tcg}/excp_helper.c=C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 target/i386/{ =3D&gt; tcg}/fpu_helper.c=C2=A0 =C2=A0 |=C2=A0 33 =
+-<br>
&gt;=C2=A0 target/i386/{ =3D&gt; tcg}/int_helper.c=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 target/i386/{ =3D&gt; tcg}/mem_helper.c=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 target/i386/tcg/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 14 +<br>
&gt;=C2=A0 target/i386/{ =3D&gt; tcg}/misc_helper.c=C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 target/i386/{ =3D&gt; tcg}/mpx_helper.c=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 target/i386/{ =3D&gt; tcg}/seg_helper.c=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 target/i386/{ =3D&gt; tcg}/smm_helper.c=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
&gt;=C2=A0 target/i386/{ =3D&gt; tcg}/svm_helper.c=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 target/i386/{ =3D&gt; tcg}/tcg-stub.c=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 target/i386/{ =3D&gt; tcg}/translate.c=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
&gt;=C2=A0 target/i386/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A06 -<br>
&gt;=C2=A0 target/i386/whpx/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +<br>
&gt;=C2=A0 target/i386/{ =3D&gt; whpx}/whp-dispatch.h |=C2=A0 =C2=A00<br>
&gt;=C2=A0 target/i386/{ =3D&gt; whpx}/whpx-all.c=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A04 +-<br>
&gt;=C2=A0 target/i386/{ =3D&gt; whpx}/whpx-cpus.c=C2=A0 =C2=A0 |=C2=A0 29 =
+-<br>
&gt;=C2=A0 target/i386/{ =3D&gt; whpx}/whpx-cpus.h=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 -<br>
&gt;=C2=A0 target/lm32/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 +-<br>
&gt;=C2=A0 target/m68k/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
&gt;=C2=A0 target/microblaze/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 17 +-<br>
&gt;=C2=A0 target/mips/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
&gt;=C2=A0 target/moxie/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
&gt;=C2=A0 target/nios2/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
&gt;=C2=A0 target/openrisc/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
&gt;=C2=A0 target/ppc/translate_init.c.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 17 +-<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 18 +-<br>
&gt;=C2=A0 target/rx/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 18 +-<br>
&gt;=C2=A0 target/s390x/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +-<br>
&gt;=C2=A0 target/sh4/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
&gt;=C2=A0 target/sparc/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +-<br>
&gt;=C2=A0 target/tilegx/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
&gt;=C2=A0 target/tricore/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
&gt;=C2=A0 target/unicore32/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 12 +-<br>
&gt;=C2=A0 target/xtensa/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
&gt;=C2=A0 135 files changed, 2302 insertions(+), 1540 deletions(-)<br>
&gt;=C2=A0 create mode 100644 accel/accel-common.c<br>
&gt;=C2=A0 rename accel/{accel.c =3D&gt; accel-softmmu.c} (64%)<br>
&gt;=C2=A0 create mode 100644 accel/accel-softmmu.h<br>
&gt;=C2=A0 create mode 100644 accel/accel-user.c<br>
&gt;=C2=A0 create mode 100644 accel/tcg/tcg-cpus-mttcg.h<br>
&gt;=C2=A0 create mode 100644 include/hw/core/accel-cpu.h<br>
&gt;=C2=A0 create mode 100644 include/hw/core/tcg-cpu-ops.h<br>
&gt;=C2=A0 rename include/{sysemu =3D&gt; qemu}/accel.h (94%)<br>
&gt;=C2=A0 create mode 100644 include/sysemu/accel-ops.h<br>
&gt;=C2=A0 create mode 100644 target/i386/cpu-dump.c<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; hax}/hax-all.c (99%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; hax}/hax-cpus.c (71%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; hax}/hax-cpus.h (95%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; hax}/hax-i386.h (95%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; hax}/hax-interface.h (100%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; hax}/hax-mem.c (100%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; hax}/hax-posix.c (100%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; hax}/hax-posix.h (100%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; hax}/hax-windows.c (100%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; hax}/hax-windows.h (100%)<br>
&gt;=C2=A0 create mode 100644 target/i386/hax/meson.build<br>
&gt;=C2=A0 create mode 100644 target/i386/helper-tcg.h<br>
&gt;=C2=A0 create mode 100644 target/i386/host-cpu.c<br>
&gt;=C2=A0 create mode 100644 target/i386/host-cpu.h<br>
&gt;=C2=A0 create mode 100644 target/i386/hvf/cpu.c<br>
&gt;=C2=A0 create mode 100644 target/i386/kvm/cpu.c<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; kvm}/hyperv-proto.h (100%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; kvm}/hyperv-stub.c (100%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; kvm}/hyperv.c (100%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; kvm}/hyperv.h (100%)<br>
&gt;=C2=A0 create mode 100644 target/i386/kvm/kvm-cpu.h<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; kvm}/kvm-stub.c (100%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; kvm}/kvm.c (99%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; kvm}/kvm_i386.h (100%)<br>
&gt;=C2=A0 create mode 100644 target/i386/kvm/meson.build<br>
&gt;=C2=A0 create mode 100644 target/i386/kvm/trace-events<br>
&gt;=C2=A0 create mode 100644 target/i386/kvm/trace.h<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; tcg}/bpt_helper.c (99%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; tcg}/cc_helper.c (99%)<br>
&gt;=C2=A0 create mode 100644 target/i386/tcg/cpu.c<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; tcg}/excp_helper.c (99%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; tcg}/fpu_helper.c (99%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; tcg}/int_helper.c (99%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; tcg}/mem_helper.c (99%)<br>
&gt;=C2=A0 create mode 100644 target/i386/tcg/meson.build<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; tcg}/misc_helper.c (99%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; tcg}/mpx_helper.c (99%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; tcg}/seg_helper.c (99%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; tcg}/smm_helper.c (99%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; tcg}/svm_helper.c (99%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; tcg}/tcg-stub.c (100%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; tcg}/translate.c (99%)<br>
&gt;=C2=A0 create mode 100644 target/i386/whpx/meson.build<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; whpx}/whp-dispatch.h (100%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; whpx}/whpx-all.c (99%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; whpx}/whpx-cpus.c (73%)<br>
&gt;=C2=A0 rename target/i386/{ =3D&gt; whpx}/whpx-cpus.h (96%)<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000c4a2bc05b5a5acd0--


