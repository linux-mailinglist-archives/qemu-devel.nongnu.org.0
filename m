Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE1F2C6B63
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 19:11:28 +0100 (CET)
Received: from localhost ([::1]:57158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiiDO-00045K-Tz
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 13:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiiC9-0003FI-0j
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:10:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiiC5-0001lu-M0
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606500604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wicuI7/oZnxyeId1rdGbzGeT2SYFcbLUHuJDNyXCnQk=;
 b=TY8QNC9nggyRn+tHaAzD94HsE2yR4wP4v15zcXe5Kz+pcC91F0HfhD/bUZN/fy5RU/RAmp
 i6loq9zX5aoRlyW90PUfX+97TgHrddnf8Teun6Rt8DqnUtOCVqJPEj44w5cVWugV1O1Nmb
 WdaWIkSKvZyG1156lIUEHZuZ323txO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-HiYuedfUPhWtPO85-CHBhw-1; Fri, 27 Nov 2020 13:10:02 -0500
X-MC-Unique: HiYuedfUPhWtPO85-CHBhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F090802B4B;
 Fri, 27 Nov 2020 18:09:59 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 595CA60BF1;
 Fri, 27 Nov 2020 18:09:55 +0000 (UTC)
Date: Fri, 27 Nov 2020 13:09:53 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v6 11/11] i386: split cpu accelerators from cpu.c, using
 AccelCPUClass
Message-ID: <20201127180953.GD2271382@habkost.net>
References: <20201126223218.31480-1-cfontana@suse.de>
 <20201126223218.31480-12-cfontana@suse.de>
 <20201127174121.GC2271382@habkost.net>
 <81e97089-9c8a-d9f3-58cf-c26fa78a9a70@suse.de>
MIME-Version: 1.0
In-Reply-To: <81e97089-9c8a-d9f3-58cf-c26fa78a9a70@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 06:53:23PM +0100, Claudio Fontana wrote:
> On 11/27/20 6:41 PM, Eduardo Habkost wrote:
> > On Thu, Nov 26, 2020 at 11:32:18PM +0100, Claudio Fontana wrote:
> >> i386 is the first user of AccelCPUClass, allowing to split
> >> cpu.c into:
> >>
> >> cpu.c            cpuid and common x86 cpu functionality
> >> host-cpu.c       host x86 cpu functions and "host" cpu type
> >> kvm/cpu.c        KVM x86 AccelCPUClass
> >> hvf/cpu.c        HVF x86 AccelCPUClass
> >> tcg/cpu.c        TCG x86 AccelCPUClass
> >>
> >> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> >> ---
> > [...]
> >> +static void tcg_cpu_class_init(CPUClass *cc)
> > 
> > Is this the only case where we need to provide an
> > AccelCPUClass.cpu_class_init method?
> > 
> > 
> >> +{
> >> +    cc->do_interrupt = x86_cpu_do_interrupt;
> >> +    cc->cpu_exec_interrupt = x86_cpu_exec_interrupt;
> >> +    cc->synchronize_from_tb = x86_cpu_synchronize_from_tb;
> >> +    cc->cpu_exec_enter = x86_cpu_exec_enter;
> >> +    cc->cpu_exec_exit = x86_cpu_exec_exit;
> >> +    cc->tcg_initialize = tcg_x86_init;
> >> +    cc->tlb_fill = x86_cpu_tlb_fill;
> >> +#ifndef CONFIG_USER_ONLY
> >> +    cc->debug_excp_handler = breakpoint_handler;
> >> +#endif /* !CONFIG_USER_ONLY */
> > 
> > I find the need for these method overrides suspicious.
> 
> These mechanisms are preexistent. My refactoring only makes them more visible.
> 
> > 
> > Comparing this with the code on qemu.git master:
> > 
> > static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
> > {
> >     [...]
> > #ifdef CONFIG_TCG
> >     cc->do_interrupt = x86_cpu_do_interrupt;
> >     cc->cpu_exec_interrupt = x86_cpu_exec_interrupt;
> > #endif
> >     [...]
> >     cc->synchronize_from_tb = x86_cpu_synchronize_from_tb;
> >     [...]
> > #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
> >     cc->debug_excp_handler = breakpoint_handler;
> > #endif
> >     cc->cpu_exec_enter = x86_cpu_exec_enter;
> >     cc->cpu_exec_exit = x86_cpu_exec_exit;
> > #ifdef CONFIG_TCG
> >     cc->tcg_initialize = tcg_x86_init;
> >     cc->tlb_fill = x86_cpu_tlb_fill;
> > #endif
> >     [...]
> > }
> > 
> > So, we have two kinds of CPUClass fields above:
> > * Code that was never conditional on CONFIG_TCG, and now is
> >   conditional (synchronize_from_tb, cpu_exec_enter,
> >   cpu_exec_exit).
> 
> 
> 
> synchronize_from_tb, cpu_exec_enter and cpu_exec_exit only makes sense for TCG,
> and their code should not be compiled in for non-TCG.
> 
> This is part of the effort to separate away non-pertinent code into accelerator-specific builds (and in the future modules).
> 
> The fact that they were unconditionally compiled in before was a mistake, or at least this is the assumption I am making when changing this.

Can you clarify why that was a mistake?  Patch 07/11 makes
existing functions TCG-specific, but doesn't explain why.

> 
> 
> > * Code that was conditional on CONFIG_TCG at compile time, and is
> >   now conditional on TCG being enabled at runtime.
> > 
> > On both cases, we are replacing static initialization of CPUClass
> > fields with dynamically initialization of CPUClass depending on
> > the chosen accelerator.  What makes this necessary?
> 
> 
> I am not sure about the definitions of "static" and "dynamic"
> you are using here, as all the above looks "dynamic" to me,
> before and after.

The existing code initializes all CPUClass fields as soon as
possible (at class_init), and we can be 100% sure the CPUClass
methods above are always pointing to the right function and will
never change.

This patch makes those CPUClass fields change at runtime, after
accelerator initialization.

This might be a reasonable approach if we have a good reason for
it, but what can we do to simplify this?  If those methods really
depend on the accelerator (and not the CPU class), why aren't
they part of the CpusAccel struct instead of CPUClass?


> 
> The overrides and additional fields in the CPUClass are only
> necessary for TCG, and all that code should not be compiled in
> if TCG is not built-in.
> 
> Ciao,
> 
> Claudio
> 
> > 
> > 
> >> +}
> >> +
> >> +/*
> >> + * TCG-specific defaults that override all CPU models when using TCG
> >> + */
> >> +static PropValue tcg_default_props[] = {
> >> +    { "vme", "off" },
> >> +    { NULL, NULL },
> >> +};
> >> +
> >> +static void tcg_cpu_instance_init(CPUState *cs)
> >> +{
> >> +    X86CPU *cpu = X86_CPU(cs);
> >> +    /* Special cases not set in the X86CPUDefinition structs: */
> >> +    x86_cpu_apply_props(cpu, tcg_default_props);
> >> +}
> >> +
> >> +static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
> >> +{
> >> +    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
> >> +
> >> +    acc->cpu_realizefn = tcg_cpu_realizefn;
> >> +    acc->cpu_class_init = tcg_cpu_class_init;
> >> +    acc->cpu_instance_init = tcg_cpu_instance_init;
> >> +}
> >> +static const TypeInfo tcg_cpu_accel_type_info = {
> >> +    .name = ACCEL_CPU_NAME("tcg"),
> >> +
> >> +    .parent = TYPE_ACCEL_CPU,
> >> +    .class_init = tcg_cpu_accel_class_init,
> >> +    .abstract = true,
> >> +};
> >> +static void tcg_cpu_accel_register_types(void)
> >> +{
> >> +    type_register_static(&tcg_cpu_accel_type_info);
> >> +}
> >> +type_init(tcg_cpu_accel_register_types);
> >> diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
> >> index 02794226c2..9e439df9c7 100644
> >> --- a/target/i386/tcg/meson.build
> >> +++ b/target/i386/tcg/meson.build
> >> @@ -10,4 +10,5 @@ i386_ss.add(when: 'CONFIG_TCG', if_true: files(
> >>    'seg_helper.c',
> >>    'smm_helper.c',
> >>    'svm_helper.c',
> >> -  'translate.c'), if_false: files('tcg-stub.c'))
> >> +  'translate.c',
> >> +  'cpu.c'), if_false: files('tcg-stub.c'))
> >> -- 
> >> 2.26.2
> >>
> >>
> > 
> 

-- 
Eduardo


