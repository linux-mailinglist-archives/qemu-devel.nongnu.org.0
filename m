Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459D72C2F30
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:49:55 +0100 (CET)
Received: from localhost ([::1]:40862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khcRu-0006vg-9b
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:49:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khcQc-00067D-As
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:48:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khcQZ-0006lc-F7
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606240109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y0OJtGud3vTPxMPnctRlq6MWaHeCLhFAfnhncCSubyk=;
 b=TJcpniqIMgq2SRbuNou51AO/RUoUAzbXUY2ocNvKaCjU3YCSthDeS0+ZTnnT82DOZkgOrh
 7Y7SZdfgZWydwY7HIU1isD5xYEOgeY3GG/9iVbZZrGUK9O075IN/fWKfN5NCpAe4AiydZz
 +voFGgsvcDR3H73sR8TRZNLPix5VpuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-PupKkJKqPFqGzt-18SuUJQ-1; Tue, 24 Nov 2020 12:48:25 -0500
X-MC-Unique: PupKkJKqPFqGzt-18SuUJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55760195D56B;
 Tue, 24 Nov 2020 17:48:23 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FB7F60BE5;
 Tue, 24 Nov 2020 17:48:22 +0000 (UTC)
Date: Tue, 24 Nov 2020 12:48:21 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v5 12/12] accel: centralize initialization of CpusAccelOps
Message-ID: <20201124174821.GT2271382@habkost.net>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-13-cfontana@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201124162210.8796-13-cfontana@suse.de>
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

On Tue, Nov 24, 2020 at 05:22:10PM +0100, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  accel/kvm/kvm-all.c          |  9 -------
>  accel/kvm/kvm-cpus.c         | 26 +++++++++++++-----
>  accel/kvm/kvm-cpus.h         |  2 --
>  accel/qtest/qtest.c          | 31 ++++++++++++----------
>  accel/tcg/tcg-cpus-icount.c  | 11 +-------
>  accel/tcg/tcg-cpus-icount.h  |  2 ++
>  accel/tcg/tcg-cpus-mttcg.c   | 12 +++------
>  accel/tcg/tcg-cpus-mttcg.h   | 19 ++++++++++++++
>  accel/tcg/tcg-cpus-rr.c      |  7 -----
>  accel/tcg/tcg-cpus.c         | 48 ++++++++++++++++++++++++++-------
>  accel/tcg/tcg-cpus.h         |  4 ---
>  accel/xen/xen-all.c          | 29 ++++++++++----------
>  include/sysemu/cpus.h        | 39 ++++++++++++++++++++-------
>  softmmu/cpus.c               | 51 +++++++++++++++++++++++++++++-------
>  target/i386/hax/hax-all.c    |  9 -------
>  target/i386/hax/hax-cpus.c   | 29 +++++++++++++++-----
>  target/i386/hax/hax-cpus.h   |  2 --
>  target/i386/hvf/hvf-cpus.c   | 27 ++++++++++++++-----
>  target/i386/hvf/hvf-cpus.h   |  2 --
>  target/i386/hvf/hvf.c        |  9 -------
>  target/i386/whpx/whpx-all.c  |  9 -------
>  target/i386/whpx/whpx-cpus.c | 29 +++++++++++++++-----
>  target/i386/whpx/whpx-cpus.h |  2 --
>  23 files changed, 251 insertions(+), 157 deletions(-)
>  create mode 100644 accel/tcg/tcg-cpus-mttcg.h
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 509b249f52..33156cc4c7 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -3234,12 +3234,3 @@ static void kvm_type_init(void)
>  }
>  
>  type_init(kvm_type_init);
> -
> -static void kvm_accel_cpu_init(void)
> -{
> -    if (kvm_enabled()) {
> -        cpus_register_accel(&kvm_cpus);
> -    }
> -}
> -
> -accel_cpu_init(kvm_accel_cpu_init);
> diff --git a/accel/kvm/kvm-cpus.c b/accel/kvm/kvm-cpus.c
> index d809b1e74c..33dc8e737a 100644
> --- a/accel/kvm/kvm-cpus.c
> +++ b/accel/kvm/kvm-cpus.c
> @@ -74,11 +74,25 @@ static void kvm_start_vcpu_thread(CPUState *cpu)
>                         cpu, QEMU_THREAD_JOINABLE);
>  }
>  
> -const CpusAccel kvm_cpus = {
> -    .create_vcpu_thread = kvm_start_vcpu_thread,
> +static void kvm_cpus_class_init(ObjectClass *oc, void *data)
> +{
> +    CpusAccelOps *ops = CPUS_ACCEL_OPS_CLASS(oc);

Why do you need a separate QOM type hierarchy instead of just
doing this inside AccelClass methods and/or existing accel
class_init functions?

>  
> -    .synchronize_post_reset = kvm_cpu_synchronize_post_reset,
> -    .synchronize_post_init = kvm_cpu_synchronize_post_init,
> -    .synchronize_state = kvm_cpu_synchronize_state,
> -    .synchronize_pre_loadvm = kvm_cpu_synchronize_pre_loadvm,
> +    ops->create_vcpu_thread = kvm_start_vcpu_thread;
> +    ops->synchronize_post_reset = kvm_cpu_synchronize_post_reset;
> +    ops->synchronize_post_init = kvm_cpu_synchronize_post_init;
> +    ops->synchronize_state = kvm_cpu_synchronize_state;
> +    ops->synchronize_pre_loadvm = kvm_cpu_synchronize_pre_loadvm;

All of these could be AccelClass fields.

TCG makes it a bit more complicated because there's a different
set of methods chosen for TYPE_TCG_ACCEL depending on the
configuration.  This could be solved by patching AccelClass at
init time, or by moving the method pointers to AccelState.

Alternatively, if you still want to keep the
CpusAccel/CpusAccelOps struct, that's OK.  You can just add a
`CpusAccel *cpu_accel_ops` field to AccelClass or AccelState.  No
need for a separate QOM hierarchy, either.

If you _really_ want a separate TYPE_CPU_ACCEL_OPS QOM type, you
can still have it.  But it can be just an interface implemented
by each accel subclass, instead of requiring a separate
CPUS_ACCEL_TYPE_NAME(...) type to be registered for each
accelerator.  (I don't see why you would want it, though.)


>  };
> +static const TypeInfo kvm_cpus_type_info = {
> +    .name = CPUS_ACCEL_TYPE_NAME("kvm"),
> +
> +    .parent = TYPE_CPUS_ACCEL_OPS,
> +    .class_init = kvm_cpus_class_init,
> +    .abstract = true,
> +};
> +static void kvm_cpus_register_types(void)
> +{
> +    type_register_static(&kvm_cpus_type_info);
> +}
> +type_init(kvm_cpus_register_types);
[...]
> -typedef struct CpusAccel {
> -    void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY */
> +typedef struct CpusAccelOps CpusAccelOps;
> +DECLARE_CLASS_CHECKERS(CpusAccelOps, CPUS_ACCEL_OPS, TYPE_CPUS_ACCEL_OPS)
> +
> +struct CpusAccelOps {
> +    ObjectClass parent_class;
> +
> +    /* initialization function called when accel is chosen */
> +    void (*accel_chosen_init)(CpusAccelOps *ops);

This can be an AccelClass method too.  What about just naming it
AccelClass.init?

> +
> +    void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
>      void (*kick_vcpu_thread)(CPUState *cpu);
>  
>      void (*synchronize_post_reset)(CPUState *cpu);
> @@ -20,13 +45,7 @@ typedef struct CpusAccel {
>  
>      int64_t (*get_virtual_clock)(void);
>      int64_t (*get_elapsed_ticks)(void);
> -} CpusAccel;
> -
[...]
> +
> +static void cpus_accel_ops_init(void)
> +{

If we move the fields above part of AccelClass, this could be
called accel_init().

> +    const char *ac_name;
> +    ObjectClass *ac;
> +    char *ops_name;
> +    ObjectClass *ops;
> +
> +    ac = object_get_class(OBJECT(current_accel()));
> +    g_assert(ac != NULL);

If you call this function directly from accel_init_machine(),
bsd-user:main(), and linux-user:main(), you can get AccelState*
as argument, and the dependency on current_accel() becomes
explicit instead of implicit.

> +    ac_name = object_class_get_name(ac);
> +    g_assert(ac_name != NULL);
> +
> +    ops_name = g_strdup_printf("%s-ops", ac_name);
> +    ops = object_class_by_name(ops_name);
> +    g_free(ops_name);

If we make the fields above part of AccelClass, you don't need
this lookup trick.

> +
> +    /*
> +     * all accelerators need to define ops, providing at least a mandatory
> +     * non-NULL create_vcpu_thread operation.
> +     */
> +    g_assert(ops != NULL);
> +    cpus_accel = CPUS_ACCEL_OPS_CLASS(ops);
> +    if (cpus_accel->accel_chosen_init) {
> +        cpus_accel->accel_chosen_init(cpus_accel);

If we move CpusAccelOps.accel_chosen_init to AccelClass.init,
this would be just:

  AccelClass *acc = ACCEL_GET_CLASS(accel);
  if (acc->init) {
      acc->init(acc);
  }

> +    }

Additionally, if you call arch_cpu_accel_init() here, you won't
need MODULE_INIT_ACCEL_CPU anymore.  The

  module_call_init(MODULE_INIT_ACCEL_CPU)

call with implicit dependencies on runtime state inside vl.c and
*-user/main.c becomes a trivial:

  accel_init(accel)

call in accel_init_machine() and *-user:main().

> +}
> +
> +accel_cpu_init(cpus_accel_ops_init);
> diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
> index 77c365311c..ec3c426223 100644
> --- a/target/i386/hax/hax-all.c
> +++ b/target/i386/hax/hax-all.c
> @@ -1138,12 +1138,3 @@ static void hax_type_init(void)
>  }
>  
>  type_init(hax_type_init);
> -
> -static void hax_accel_cpu_init(void)
> -{
> -    if (hax_enabled()) {
> -        cpus_register_accel(&hax_cpus);
> -    }
> -}
> -
> -accel_cpu_init(hax_accel_cpu_init);
> diff --git a/target/i386/hax/hax-cpus.c b/target/i386/hax/hax-cpus.c
> index f72c85bd49..171b5ac1e6 100644
> --- a/target/i386/hax/hax-cpus.c
> +++ b/target/i386/hax/hax-cpus.c
> @@ -74,12 +74,27 @@ static void hax_start_vcpu_thread(CPUState *cpu)
>  #endif
>  }
>  
> -const CpusAccel hax_cpus = {
> -    .create_vcpu_thread = hax_start_vcpu_thread,
> -    .kick_vcpu_thread = hax_kick_vcpu_thread,
> +static void hax_cpus_class_init(ObjectClass *oc, void *data)
> +{
> +    CpusAccelOps *ops = CPUS_ACCEL_OPS_CLASS(oc);
>  
> -    .synchronize_post_reset = hax_cpu_synchronize_post_reset,
> -    .synchronize_post_init = hax_cpu_synchronize_post_init,
> -    .synchronize_state = hax_cpu_synchronize_state,
> -    .synchronize_pre_loadvm = hax_cpu_synchronize_pre_loadvm,
> +    ops->create_vcpu_thread = hax_start_vcpu_thread;
> +    ops->kick_vcpu_thread = hax_kick_vcpu_thread;
> +
> +    ops->synchronize_post_reset = hax_cpu_synchronize_post_reset;
> +    ops->synchronize_post_init = hax_cpu_synchronize_post_init;
> +    ops->synchronize_state = hax_cpu_synchronize_state;
> +    ops->synchronize_pre_loadvm = hax_cpu_synchronize_pre_loadvm;
> +};
> +static const TypeInfo hax_cpus_type_info = {
> +    .name = CPUS_ACCEL_TYPE_NAME("hax"),
> +
> +    .parent = TYPE_CPUS_ACCEL_OPS,
> +    .class_init = hax_cpus_class_init,
> +    .abstract = true,
>  };
> +static void hax_cpus_register_types(void)
> +{
> +    type_register_static(&hax_cpus_type_info);
> +}
> +type_init(hax_cpus_register_types);
> diff --git a/target/i386/hax/hax-cpus.h b/target/i386/hax/hax-cpus.h
> index ee8ab7a631..c7698519cd 100644
> --- a/target/i386/hax/hax-cpus.h
> +++ b/target/i386/hax/hax-cpus.h
> @@ -12,8 +12,6 @@
>  
>  #include "sysemu/cpus.h"
>  
> -extern const CpusAccel hax_cpus;
> -
>  #include "hax-interface.h"
>  #include "hax-i386.h"
>  
> diff --git a/target/i386/hvf/hvf-cpus.c b/target/i386/hvf/hvf-cpus.c
> index 817b3d7452..124662de58 100644
> --- a/target/i386/hvf/hvf-cpus.c
> +++ b/target/i386/hvf/hvf-cpus.c
> @@ -121,11 +121,26 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
>                         cpu, QEMU_THREAD_JOINABLE);
>  }
>  
> -const CpusAccel hvf_cpus = {
> -    .create_vcpu_thread = hvf_start_vcpu_thread,
> +static void hvf_cpus_class_init(ObjectClass *oc, void *data)
> +{
> +    CpusAccelOps *ops = CPUS_ACCEL_OPS_CLASS(oc);
>  
> -    .synchronize_post_reset = hvf_cpu_synchronize_post_reset,
> -    .synchronize_post_init = hvf_cpu_synchronize_post_init,
> -    .synchronize_state = hvf_cpu_synchronize_state,
> -    .synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm,
> +    ops->create_vcpu_thread = hvf_start_vcpu_thread;
> +
> +    ops->synchronize_post_reset = hvf_cpu_synchronize_post_reset;
> +    ops->synchronize_post_init = hvf_cpu_synchronize_post_init;
> +    ops->synchronize_state = hvf_cpu_synchronize_state;
> +    ops->synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm;
> +};
> +static const TypeInfo hvf_cpus_type_info = {
> +    .name = CPUS_ACCEL_TYPE_NAME("hvf"),
> +
> +    .parent = TYPE_CPUS_ACCEL_OPS,
> +    .class_init = hvf_cpus_class_init,
> +    .abstract = true,
>  };
> +static void hvf_cpus_register_types(void)
> +{
> +    type_register_static(&hvf_cpus_type_info);
> +}
> +type_init(hvf_cpus_register_types);
> diff --git a/target/i386/hvf/hvf-cpus.h b/target/i386/hvf/hvf-cpus.h
> index ced31b82c0..8f992da168 100644
> --- a/target/i386/hvf/hvf-cpus.h
> +++ b/target/i386/hvf/hvf-cpus.h
> @@ -12,8 +12,6 @@
>  
>  #include "sysemu/cpus.h"
>  
> -extern const CpusAccel hvf_cpus;
> -
>  int hvf_init_vcpu(CPUState *);
>  int hvf_vcpu_exec(CPUState *);
>  void hvf_cpu_synchronize_state(CPUState *);
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index 58794c35ae..bd94bb5243 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -910,12 +910,3 @@ static void hvf_type_init(void)
>  }
>  
>  type_init(hvf_type_init);
> -
> -static void hvf_accel_cpu_init(void)
> -{
> -    if (hvf_enabled()) {
> -        cpus_register_accel(&hvf_cpus);
> -    }
> -}
> -
> -accel_cpu_init(hvf_accel_cpu_init);
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index 097d6f5e60..90adae9af7 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -1711,12 +1711,3 @@ error:
>  }
>  
>  type_init(whpx_type_init);
> -
> -static void whpx_accel_cpu_init(void)
> -{
> -    if (whpx_enabled()) {
> -        cpus_register_accel(&whpx_cpus);
> -    }
> -}
> -
> -accel_cpu_init(whpx_accel_cpu_init);
> diff --git a/target/i386/whpx/whpx-cpus.c b/target/i386/whpx/whpx-cpus.c
> index d9bd5a2d36..1e736a50b0 100644
> --- a/target/i386/whpx/whpx-cpus.c
> +++ b/target/i386/whpx/whpx-cpus.c
> @@ -85,12 +85,27 @@ static void whpx_kick_vcpu_thread(CPUState *cpu)
>      }
>  }
>  
> -const CpusAccel whpx_cpus = {
> -    .create_vcpu_thread = whpx_start_vcpu_thread,
> -    .kick_vcpu_thread = whpx_kick_vcpu_thread,
> +static void whpx_cpus_class_init(ObjectClass *oc, void *data)
> +{
> +    CpusAccelOps *ops = CPUS_ACCEL_OPS_CLASS(oc);
>  
> -    .synchronize_post_reset = whpx_cpu_synchronize_post_reset,
> -    .synchronize_post_init = whpx_cpu_synchronize_post_init,
> -    .synchronize_state = whpx_cpu_synchronize_state,
> -    .synchronize_pre_loadvm = whpx_cpu_synchronize_pre_loadvm,
> +    ops->create_vcpu_thread = whpx_start_vcpu_thread;
> +    ops->kick_vcpu_thread = whpx_kick_vcpu_thread;
> +
> +    ops->synchronize_post_reset = whpx_cpu_synchronize_post_reset;
> +    ops->synchronize_post_init = whpx_cpu_synchronize_post_init;
> +    ops->synchronize_state = whpx_cpu_synchronize_state;
> +    ops->synchronize_pre_loadvm = whpx_cpu_synchronize_pre_loadvm;
> +};
> +static const TypeInfo whpx_cpus_type_info = {
> +    .name = CPUS_ACCEL_TYPE_NAME("whpx"),
> +
> +    .parent = TYPE_CPUS_ACCEL_OPS,
> +    .class_init = whpx_cpus_class_init,
> +    .abstract = true,
>  };
> +static void whpx_cpus_register_types(void)
> +{
> +    type_register_static(&whpx_cpus_type_info);
> +}
> +type_init(whpx_cpus_register_types);
> diff --git a/target/i386/whpx/whpx-cpus.h b/target/i386/whpx/whpx-cpus.h
> index bdb367d1d0..2dee6d61ea 100644
> --- a/target/i386/whpx/whpx-cpus.h
> +++ b/target/i386/whpx/whpx-cpus.h
> @@ -12,8 +12,6 @@
>  
>  #include "sysemu/cpus.h"
>  
> -extern const CpusAccel whpx_cpus;
> -
>  int whpx_init_vcpu(CPUState *cpu);
>  int whpx_vcpu_exec(CPUState *cpu);
>  void whpx_destroy_vcpu(CPUState *cpu);
> -- 
> 2.26.2
> 

-- 
Eduardo


