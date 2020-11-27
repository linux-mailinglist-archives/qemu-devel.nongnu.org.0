Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2702C6BD1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:09:04 +0100 (CET)
Received: from localhost ([::1]:36648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kij79-00015U-2Z
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kij2x-00058q-1D
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:04:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kij2r-00022y-W5
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606503876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HvH9I7UuseWlqYOfmZvr4nNNJaXwbdfvzo6xobnJ3Gs=;
 b=esI5VHlmKWC8lLXvszSD1iqH0avEtfvQjKfXrENfkJ49xJMKRSbi/orle0GK5pJ1fKDET3
 0rZned3t8xT06Ft3xDI6DFaE+789qabOVJVUNZBxwV5Np5NyzBWi6U4oCnFgI0X9Z0wwkP
 g0YioD0CJzVhK5T2ODKZy/DY0M678ek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-cMFLK_GpOgiczbLdhN_IAA-1; Fri, 27 Nov 2020 14:04:34 -0500
X-MC-Unique: cMFLK_GpOgiczbLdhN_IAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5875C8049C7;
 Fri, 27 Nov 2020 19:04:31 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69EF160BF1;
 Fri, 27 Nov 2020 19:04:27 +0000 (UTC)
Date: Fri, 27 Nov 2020 14:04:24 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v6 07/11] i386: move TCG cpu class initialization out of
 helper.c
Message-ID: <20201127190424.GH2271382@habkost.net>
References: <20201126223218.31480-1-cfontana@suse.de>
 <20201126223218.31480-8-cfontana@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201126223218.31480-8-cfontana@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Now that I understand what you are doing here, I have specific
questions about the functions you are moving, below:

On Thu, Nov 26, 2020 at 11:32:14PM +0100, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
[...]
> @@ -1495,7 +1497,8 @@ static inline uint64_t x86_cpu_xsave_components(X86CPU *cpu)
>             cpu->env.features[FEAT_XSAVE_COMP_LO];
>  }
>  
> -const char *get_register_name_32(unsigned int reg)
> +/* Return name of 32-bit register, from a R_* constant */
> +static const char *get_register_name_32(unsigned int reg)
>  {
>      if (reg >= CPU_NB_REGS32) {
>          return NULL;
> @@ -7012,13 +7015,6 @@ static void x86_cpu_set_pc(CPUState *cs, vaddr value)
>      cpu->env.eip = value;
>  }
>  
> -static void x86_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
> -{
> -    X86CPU *cpu = X86_CPU(cs);
> -
> -    cpu->env.eip = tb->pc - tb->cs_base;
> -}

Question to be answered in the commit message: how can somebody
be sure this code is not necessary for any other accelerators?
The TranslationBlock* argument is a hint, but not a guarantee.

Maybe we should rename CPUClass.synchronize_from_tb to
CPUClass.tcg_synchronize_from_tb?  Maybe we should have a
separate TCGCpuOperations struct to carry TCG-specific methods?

(The same questions above apply to the other methods below)


> -
>  int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
>  {
>      X86CPU *cpu = X86_CPU(cs);
> @@ -7252,17 +7248,18 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>      cc->class_by_name = x86_cpu_class_by_name;
>      cc->parse_features = x86_cpu_parse_featurestr;
>      cc->has_work = x86_cpu_has_work;
> +
>  #ifdef CONFIG_TCG
> -    cc->do_interrupt = x86_cpu_do_interrupt;
> -    cc->cpu_exec_interrupt = x86_cpu_exec_interrupt;

These two are in seg_helper.c, so I agree it makes sense to keep
it in tcg_cpu_common_class_init().

I'd like to understand why they are TCG-specific, though.  Are
CPUClass.do_interrupt and CPUClass.cpu_exec_enter TCG-specific on
all architectures, or only in x86?

> -#endif
> +    tcg_cpu_common_class_init(cc);
> +#endif /* CONFIG_TCG */
> +
>      cc->dump_state = x86_cpu_dump_state;
>      cc->set_pc = x86_cpu_set_pc;
> -    cc->synchronize_from_tb = x86_cpu_synchronize_from_tb;
>      cc->gdb_read_register = x86_cpu_gdb_read_register;
>      cc->gdb_write_register = x86_cpu_gdb_write_register;
>      cc->get_arch_id = x86_cpu_get_arch_id;
>      cc->get_paging_enabled = x86_cpu_get_paging_enabled;
> +
>  #ifndef CONFIG_USER_ONLY
>      cc->asidx_from_attrs = x86_asidx_from_attrs;
>      cc->get_memory_mapping = x86_cpu_get_memory_mapping;
> @@ -7273,7 +7270,8 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>      cc->write_elf32_note = x86_cpu_write_elf32_note;
>      cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
>      cc->vmsd = &vmstate_x86_cpu;
> -#endif
> +#endif /* !CONFIG_USER_ONLY */
> +
>      cc->gdb_arch_name = x86_gdb_arch_name;
>  #ifdef TARGET_X86_64
>      cc->gdb_core_xml_file = "i386-64bit.xml";
> @@ -7281,15 +7279,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>  #else
>      cc->gdb_core_xml_file = "i386-32bit.xml";
>      cc->gdb_num_core_regs = 50;
> -#endif
> -#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
> -    cc->debug_excp_handler = breakpoint_handler;

That's in bpt_helper.c, also TCG-specific.  Makes sense to move
it to tcg_cpu_common_class_init().

Is CPUClass.debug_excp_handler() TCG-specific in all
architectures, or only in x86?

> -#endif
> -    cc->cpu_exec_enter = x86_cpu_exec_enter;
> -    cc->cpu_exec_exit = x86_cpu_exec_exit;

I have a question about those two functions below[1].

> -#ifdef CONFIG_TCG
> -    cc->tcg_initialize = tcg_x86_init;

The name makes this is obviously TCG-specific, so it makes sense
to move it to tcg_cpu_common_class_init().

> -    cc->tlb_fill = x86_cpu_tlb_fill;

This is in excp_helper.c (TCG-specific), so it makes sense to
move it to tcg_cpu_common_class_init().

Is CPUClass.tlb_fill TCG-specific in all architectures, or only
in x86?

>  #endif
>      cc->disas_set_info = x86_disas_set_info;
>  
[...]
> -/* Frob eflags into and out of the CPU temporary format.  */
> -
> -void x86_cpu_exec_enter(CPUState *cs)
> -{
> -    X86CPU *cpu = X86_CPU(cs);
> -    CPUX86State *env = &cpu->env;
> -
> -    CC_SRC = env->eflags & (CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
> -    env->df = 1 - (2 * ((env->eflags >> 10) & 1));
> -    CC_OP = CC_OP_EFLAGS;
> -    env->eflags &= ~(DF_MASK | CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
> -}
> -
> -void x86_cpu_exec_exit(CPUState *cs)
> -{
> -    X86CPU *cpu = X86_CPU(cs);
> -    CPUX86State *env = &cpu->env;
> -
> -    env->eflags = cpu_compute_eflags(env);
> -}

[1]

How exactly can we be 100% sure this is not used by other
accelerators?

> -
>  #ifndef CONFIG_USER_ONLY
>  uint8_t x86_ldub_phys(CPUState *cs, hwaddr addr)
>  {
[...]

-- 
Eduardo


