Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6C32C6AC7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 18:43:35 +0100 (CET)
Received: from localhost ([::1]:56502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kihmQ-0006sG-QT
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 12:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kihkV-0005hO-8j
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:41:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kihkT-0005pC-H9
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606498892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6/eqUHZl1pgGWnvsB4CujR5gKL3lkkQkplrTJAN7AWQ=;
 b=RuDniWsdJyHbpFrojkjS7+zeF/0qdNA9B75WpOUF7sgIyB5p2obownOwFYEmMwIezVNhGv
 BHPw3ZX8ALRjFPTEgJIvZDCeM/IU2zE172jDV+sogMuGMa8KetiehHQaZQtLcTOWmnoSQ/
 w8sqCpTEM8slP2KbnHD9+gWSLHV8mz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-GbX8xEsoOzya-LFsOWutdQ-1; Fri, 27 Nov 2020 12:41:29 -0500
X-MC-Unique: GbX8xEsoOzya-LFsOWutdQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3EA62ED6;
 Fri, 27 Nov 2020 17:41:26 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D734B5D9CC;
 Fri, 27 Nov 2020 17:41:22 +0000 (UTC)
Date: Fri, 27 Nov 2020 12:41:21 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v6 11/11] i386: split cpu accelerators from cpu.c, using
 AccelCPUClass
Message-ID: <20201127174121.GC2271382@habkost.net>
References: <20201126223218.31480-1-cfontana@suse.de>
 <20201126223218.31480-12-cfontana@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201126223218.31480-12-cfontana@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Thu, Nov 26, 2020 at 11:32:18PM +0100, Claudio Fontana wrote:
> i386 is the first user of AccelCPUClass, allowing to split
> cpu.c into:
> 
> cpu.c            cpuid and common x86 cpu functionality
> host-cpu.c       host x86 cpu functions and "host" cpu type
> kvm/cpu.c        KVM x86 AccelCPUClass
> hvf/cpu.c        HVF x86 AccelCPUClass
> tcg/cpu.c        TCG x86 AccelCPUClass
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
[...]
> +static void tcg_cpu_class_init(CPUClass *cc)

Is this the only case where we need to provide an
AccelCPUClass.cpu_class_init method?


> +{
> +    cc->do_interrupt = x86_cpu_do_interrupt;
> +    cc->cpu_exec_interrupt = x86_cpu_exec_interrupt;
> +    cc->synchronize_from_tb = x86_cpu_synchronize_from_tb;
> +    cc->cpu_exec_enter = x86_cpu_exec_enter;
> +    cc->cpu_exec_exit = x86_cpu_exec_exit;
> +    cc->tcg_initialize = tcg_x86_init;
> +    cc->tlb_fill = x86_cpu_tlb_fill;
> +#ifndef CONFIG_USER_ONLY
> +    cc->debug_excp_handler = breakpoint_handler;
> +#endif /* !CONFIG_USER_ONLY */

I find the need for these method overrides suspicious.

Comparing this with the code on qemu.git master:

static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
{
    [...]
#ifdef CONFIG_TCG
    cc->do_interrupt = x86_cpu_do_interrupt;
    cc->cpu_exec_interrupt = x86_cpu_exec_interrupt;
#endif
    [...]
    cc->synchronize_from_tb = x86_cpu_synchronize_from_tb;
    [...]
#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
    cc->debug_excp_handler = breakpoint_handler;
#endif
    cc->cpu_exec_enter = x86_cpu_exec_enter;
    cc->cpu_exec_exit = x86_cpu_exec_exit;
#ifdef CONFIG_TCG
    cc->tcg_initialize = tcg_x86_init;
    cc->tlb_fill = x86_cpu_tlb_fill;
#endif
    [...]
}

So, we have two kinds of CPUClass fields above:
* Code that was never conditional on CONFIG_TCG, and now is
  conditional (synchronize_from_tb, cpu_exec_enter,
  cpu_exec_exit).
* Code that was conditional on CONFIG_TCG at compile time, and is
  now conditional on TCG being enabled at runtime.

On both cases, we are replacing static initialization of CPUClass
fields with dynamically initialization of CPUClass depending on
the chosen accelerator.  What makes this necessary?


> +}
> +
> +/*
> + * TCG-specific defaults that override all CPU models when using TCG
> + */
> +static PropValue tcg_default_props[] = {
> +    { "vme", "off" },
> +    { NULL, NULL },
> +};
> +
> +static void tcg_cpu_instance_init(CPUState *cs)
> +{
> +    X86CPU *cpu = X86_CPU(cs);
> +    /* Special cases not set in the X86CPUDefinition structs: */
> +    x86_cpu_apply_props(cpu, tcg_default_props);
> +}
> +
> +static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
> +{
> +    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
> +
> +    acc->cpu_realizefn = tcg_cpu_realizefn;
> +    acc->cpu_class_init = tcg_cpu_class_init;
> +    acc->cpu_instance_init = tcg_cpu_instance_init;
> +}
> +static const TypeInfo tcg_cpu_accel_type_info = {
> +    .name = ACCEL_CPU_NAME("tcg"),
> +
> +    .parent = TYPE_ACCEL_CPU,
> +    .class_init = tcg_cpu_accel_class_init,
> +    .abstract = true,
> +};
> +static void tcg_cpu_accel_register_types(void)
> +{
> +    type_register_static(&tcg_cpu_accel_type_info);
> +}
> +type_init(tcg_cpu_accel_register_types);
> diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
> index 02794226c2..9e439df9c7 100644
> --- a/target/i386/tcg/meson.build
> +++ b/target/i386/tcg/meson.build
> @@ -10,4 +10,5 @@ i386_ss.add(when: 'CONFIG_TCG', if_true: files(
>    'seg_helper.c',
>    'smm_helper.c',
>    'svm_helper.c',
> -  'translate.c'), if_false: files('tcg-stub.c'))
> +  'translate.c',
> +  'cpu.c'), if_false: files('tcg-stub.c'))
> -- 
> 2.26.2
> 
> 

-- 
Eduardo


