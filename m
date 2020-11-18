Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983D82B878C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 23:10:01 +0100 (CET)
Received: from localhost ([::1]:53270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfVeK-00088Q-3v
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 17:10:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfVcX-0007eH-Pr
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 17:08:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfVcS-0006kg-Of
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 17:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605737281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NOaJzFuyk3e55QbxytgYkk+WjfDf+Xzc5q/MKPd/6a8=;
 b=iYTG1D2YxYNj/N5446EZ0aoTd0/gwn0uQCDcFMhutxcjJXD3HB7UBbybHAryTfmq9okPi/
 YbcRzDWCcdnv99SrWkSpzYRWsajpJpgYlf6vcsvD48wsmzUs3s/96m5i3N0cEyW0x9ZRrf
 tW8mt9Q/vWr1wE1hQUqKegWAuhnpUcA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-X1obNAiVPLumisaEM8XP9Q-1; Wed, 18 Nov 2020 17:07:57 -0500
X-MC-Unique: X1obNAiVPLumisaEM8XP9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC170800D55;
 Wed, 18 Nov 2020 22:07:54 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B18C60BE2;
 Wed, 18 Nov 2020 22:07:50 +0000 (UTC)
Date: Wed, 18 Nov 2020 17:07:50 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v3 8/9] module: introduce MODULE_INIT_ACCEL_CPU
Message-ID: <20201118220750.GP1509407@habkost.net>
References: <6093de34-807d-3840-5402-4769385dd894@suse.de>
 <8f829e99-c346-00bc-efdd-3e6d69cfba35@redhat.com>
 <20201118143643.GF1509407@habkost.net>
 <a6071cd4-0787-01c8-775a-ede72e740376@redhat.com>
 <20201118152552.GG1509407@habkost.net>
 <CABgObfYL-TNAMmqkUh6cjcytaAFEtXPfw8toO6gXEuyokdyLhA@mail.gmail.com>
 <20201118161119.GJ1509407@habkost.net>
 <CABgObfb2Fim=7j3z7ApTuW=R0dWam2F_JRuOoxhP=XZXdsWe7g@mail.gmail.com>
 <20201118173055.GM1509407@habkost.net>
 <e7b70933-acd1-668c-62cd-89f480945f0f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e7b70933-acd1-668c-62cd-89f480945f0f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 16:44:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Bruce Rogers <brogers@suse.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Olaf Hering <ohering@suse.de>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Cameron Esfahani <dirty@apple.com>, Colin Xu <colin.xu@intel.com>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, haxm-team@intel.com,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Richard Henderson <rth@twiddle.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 08:13:18PM +0100, Paolo Bonzini wrote:
> On 18/11/20 18:30, Eduardo Habkost wrote:
> > > Adding a layer of indirect calls is not very different from monkey patching
> > > though.
> > 
> > I'm a little bothered by monkey patching, but I'm more
> > bothered by having to:
> > 
> > (1) register (module_init()) a function (kvm_cpu_accel_register()) that
> >    (2) register (accel_register_call()) a function (kvm_cpu_accel_init()) that
> >      (3) register (x86_cpu_accel_init()) a data structure (X86CPUAccel kvm_cpu_accel) that
> >        (4) will be saved in multiple QOM classes, so that
> >          (5) we will call the right X86CPUClass.accel method at the right moment
> >              (common_class_init(), instance_init(), realizefn()),
> > where:
> >    step 4 must be done before any CPU object is created
> >      (otherwise X86CPUAccel.instance_init & X86CPUAccel.realizefn
> >       will be silently ignored), and
> >    step 3 must be done after all QOM types were registered.
> > 
> > > You also have to consider that accel currently does not exist in usermode
> > > emulators, so that's an issue too. I would rather get a simple change in
> > > quickly, instead of designing the perfect class hierarchy.
> > 
> > It doesn't have to be perfect.  I agree that simple is better.
> > 
> > To me, registering a QOM type and looking it up when necessary is
> > simpler than the above.  Even if it's a weird class having no
> > object instances.  It probably could be an interface type.
> 
> Registering a QOM type still has quite some boilerplate.  [...]

We're working on that.  :)

>                                                    [...]  Also registering a
> QOM type has a public side effect (shows up in qom-list-types).  In general
> I don't look at QOM unless I want its property mechanism, but maybe that's
> just me.

We have lots of internal-use-only types returned by
qom-list-types, I don't think it's a big deal.

> 
> > > Perhaps another idea would be to allow adding interfaces to classes
> > > *separately from the registration of the types*. Then we can use it to add
> > > SOFTMMU_ACCEL and I386_ACCEL interfaces to a bare bones accel class, and
> > > add the accel object to usermode emulators.
> > 
> > I'm not sure I follow.  What do you mean by bare bones accel
> > class, and when exactly would you add the new interfaces to the
> > classes?
> 
> A bare bones accel class would not have init_machine and setup_post methods;
> those would be in a TYPE_SOFTMMU_ACCEL interface.  It would still have
> properties (such as tb-size for TCG) and would be able to register compat
> properties.

Oh, I think I see.  This could save us having a lot of parallel type
hierarchies.

> 
> Where would I add it, I don't know.  It could be a simple public wrapper
> around type_initialize_interface() if we add a new MODULE_INIT_* phase after
> QOM.
> 
> Or without adding a new phase, it could be a class_type->array of
> (interface_type, init_fn) hash table.  type_initialize would look up the
> class_type by name, add the interfaces would to the class with
> type_initialize_interface, and then call the init_fn to fill in the vtable.

That sounds nice.  I don't think Claudio's cleanup should be
blocked until this new mechanism is ready, though.

We don't really need the type representing X86CPUAccel to be a
subtype of TYPE_ACCEL or an interface implemented by
current_machine->accelerator, in the first version.  We just need
a simple way for the CPU initialization code to find the correct
X86CPUAccel struct.

While we don't have the new mechanism, it can be just a:
  object_class_by_name("%s-x86-cpu-accel" % (accel->name))
call.

Below is a rough draft of what I mean.  There's still lots of
room for cleaning it up (especially getting rid of the
X86CPUClass.common_class_init and X86CPUClass.accel fields).

git tree at https://gitlab.com/ehabkost/qemu/-/commits/work/qom-based-x86-cpu-accel

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
diff --git a/include/qemu/module.h b/include/qemu/module.h
index 485eda986a..944d403cbd 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -44,7 +44,6 @@ typedef enum {
     MODULE_INIT_BLOCK,
     MODULE_INIT_OPTS,
     MODULE_INIT_QOM,
-    MODULE_INIT_ACCEL_CPU,
     MODULE_INIT_TRACE,
     MODULE_INIT_XEN_BACKEND,
     MODULE_INIT_LIBQOS,
@@ -55,7 +54,6 @@ typedef enum {
 #define block_init(function) module_init(function, MODULE_INIT_BLOCK)
 #define opts_init(function) module_init(function, MODULE_INIT_OPTS)
 #define type_init(function) module_init(function, MODULE_INIT_QOM)
-#define accel_cpu_init(function) module_init(function, MODULE_INIT_ACCEL_CPU)
 #define trace_init(function) module_init(function, MODULE_INIT_TRACE)
 #define xen_backend_init(function) module_init(function, \
                                                MODULE_INIT_XEN_BACKEND)
diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
index 032169ccd3..14491297bb 100644
--- a/include/sysemu/cpus.h
+++ b/include/sysemu/cpus.h
@@ -25,6 +25,9 @@ typedef struct CpuAccelOps {
 /* register accel-specific cpus interface implementation */
 void cpus_register_accel(const CpuAccelOps *i);
 
+/* Call arch-specific accel initialization */
+void cpu_accel_arch_init(const char *accel_name);
+
 /* Create a dummy vcpu for CpuAccelOps->create_vcpu_thread */
 void dummy_start_vcpu_thread(CPUState *);
 
diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index 79fcbd3b9b..eafd86dc22 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -34,7 +34,7 @@ OBJECT_DECLARE_TYPE(X86CPU, X86CPUClass,
                     X86_CPU)
 
 typedef struct X86CPUModel X86CPUModel;
-typedef struct X86CPUAccel X86CPUAccel;
+typedef struct X86CPUAccelInterface X86CPUAccelInterface;
 
 /**
  * X86CPUClass:
@@ -71,13 +71,11 @@ struct X86CPUClass {
     DeviceUnrealize parent_unrealize;
     DeviceReset parent_reset;
 
-    const X86CPUAccel *accel;
+    const X86CPUAccelInterface *accel;
 };
 
 /**
- * X86CPUAccel:
- * @name: string name of the X86 CPU Accelerator
- *
+ * X86CPUAccelInterface:
  * @common_class_init: initializer for the common cpu
  * @instance_init: cpu instance initialization
  * @realizefn: realize function, called first in x86 cpu realize
@@ -85,14 +83,16 @@ struct X86CPUClass {
  * X86 CPU accelerator-specific CPU initializations
  */
 
-struct X86CPUAccel {
-    const char *name;
-
+struct X86CPUAccelInterface {
+    ObjectClass parent_class;
     void (*common_class_init)(X86CPUClass *xcc);
     void (*instance_init)(X86CPU *cpu);
     void (*realizefn)(X86CPU *cpu, Error **errp);
 };
 
-void x86_cpu_accel_init(const X86CPUAccel *accel);
+#define TYPE_X86_CPU_ACCEL "x86-cpu-accel"
+OBJECT_DECLARE_INTERFACE(X86CPUAccel, X86CPUAccelInterface, X86_CPU_ACCEL);
+
+#define X86_CPU_ACCEL_NAME(acc) (acc "-x86-cpu-accel")
 
 #endif
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 9f88ae952a..6107c8ca24 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -909,7 +909,8 @@ int main(int argc, char **argv)
 
     /* init tcg before creating CPUs and to get qemu_host_page_size */
     tcg_exec_init(0);
-    module_call_init(MODULE_INIT_ACCEL_CPU);
+    cpu_accel_arch_init("tcg");
+
 
     cpu_type = parse_cpu_option(cpu_model);
     cpu = cpu_create(cpu_type);
diff --git a/linux-user/main.c b/linux-user/main.c
index a745901d86..c36564fd61 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -704,7 +704,7 @@ int main(int argc, char **argv, char **envp)
 
     /* init tcg before creating CPUs and to get qemu_host_page_size */
     tcg_exec_init(0);
-    module_call_init(MODULE_INIT_ACCEL_CPU);
+    cpu_accel_arch_init("tcg");
 
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index df4bed056a..b90d107475 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2744,6 +2744,7 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
         return 0;
     }
 
+    cpu_accel_arch_init(acc);
     return 1;
 }
 
@@ -4173,12 +4174,6 @@ void qemu_init(int argc, char **argv, char **envp)
      */
     configure_accelerators(argv[0]);
 
-    /*
-     * accelerator has been chosen and initialized, now it is time to
-     * register the cpu accel interface.
-     */
-    module_call_init(MODULE_INIT_ACCEL_CPU);
-
     /*
      * Beware, QOM objects created before this point miss global and
      * compat properties.
diff --git a/stubs/cpu_accel_arch_init.c b/stubs/cpu_accel_arch_init.c
new file mode 100644
index 0000000000..b80cbdd847
--- /dev/null
+++ b/stubs/cpu_accel_arch_init.c
@@ -0,0 +1,6 @@
+#include "qemu/osdep.h"
+#include "sysemu/cpus.h"
+
+void cpu_accel_arch_init(const char *accel_name)
+{
+}
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b53e958926..b91e0b44ca 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7041,6 +7041,12 @@ static const TypeInfo x86_base_cpu_type_info = {
         .class_init = x86_cpu_base_class_init,
 };
 
+static const TypeInfo x86_cpu_accel_type_info = {
+    .name = TYPE_X86_CPU_ACCEL,
+    .parent = TYPE_INTERFACE,
+    .class_size = sizeof(X86CPUAccelInterface),
+};
+
 static void x86_cpu_register_types(void)
 {
     int i;
@@ -7051,6 +7057,7 @@ static void x86_cpu_register_types(void)
     }
     type_register_static(&max_x86_cpu_type_info);
     type_register_static(&x86_base_cpu_type_info);
+    type_register_static(&x86_cpu_accel_type_info);
 }
 
 type_init(x86_cpu_register_types)
@@ -7058,13 +7065,22 @@ type_init(x86_cpu_register_types)
 static void x86_cpu_accel_init_aux(ObjectClass *klass, void *opaque)
 {
     X86CPUClass *xcc = X86_CPU_CLASS(klass);
-    const X86CPUAccel **accel = opaque;
+    const X86CPUAccelInterface **accel = opaque;
 
     xcc->accel = *accel;
     xcc->accel->common_class_init(xcc);
 }
 
-void x86_cpu_accel_init(const X86CPUAccel *accel)
+static void x86_cpu_accel_init(const X86CPUAccelInterface *accel)
 {
     object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, &accel);
 }
+
+void cpu_accel_arch_init(const char *accel_name)
+{
+    g_autofree char *cpu_accel_name =
+        g_strdup_printf(X86_CPU_ACCEL_NAME("%s"), accel_name);
+    X86CPUAccelInterface *acc = X86_CPU_ACCEL_CLASS(object_class_by_name(cpu_accel_name));
+    assert(acc);
+    x86_cpu_accel_init(acc);
+}
diff --git a/target/i386/hvf/cpu.c b/target/i386/hvf/cpu.c
index 29e672191f..358351018f 100644
--- a/target/i386/hvf/cpu.c
+++ b/target/i386/hvf/cpu.c
@@ -46,19 +46,23 @@ static void hvf_cpu_instance_init(X86CPU *cpu)
     }
 }
 
-static const X86CPUAccel hvf_cpu_accel = {
-    .name = TYPE_X86_CPU "-hvf",
+static void hvf_cpu_accel_interface_init(ObjectClass *oc, void *data)
+{
+    X86CPUAccelInterface *acc = X86_CPU_ACCEL_CLASS(oc);
+    acc->realizefn = host_cpu_realizefn;
+    acc->common_class_init = hvf_cpu_common_class_init;
+    acc->instance_init = hvf_cpu_instance_init;
+};
 
-    .realizefn = host_cpu_realizefn,
-    .common_class_init = hvf_cpu_common_class_init,
-    .instance_init = hvf_cpu_instance_init,
+static const TypeInfo hvf_cpu_accel_type_info = {
+    .name = X86_CPU_ACCEL_NAME("hvf"),
+    .parent = TYPE_X86_CPU_ACCEL,
+    .class_init = hvf_cpu_accel_interface_init,
 };
 
 static void hvf_cpu_accel_init(void)
 {
-    if (hvf_enabled()) {
-        x86_cpu_accel_init(&hvf_cpu_accel);
-    }
+    type_register_static(&hvf_cpu_accel_type_info);
 }
 
-accel_cpu_init(hvf_cpu_accel_init);
+type_init(hvf_cpu_accel_init);
diff --git a/target/i386/kvm/cpu.c b/target/i386/kvm/cpu.c
index 76982865eb..b6a1a4d200 100644
--- a/target/i386/kvm/cpu.c
+++ b/target/i386/kvm/cpu.c
@@ -128,18 +128,23 @@ static void kvm_cpu_instance_init(X86CPU *cpu)
     }
 }
 
-static const X86CPUAccel kvm_cpu_accel = {
-    .name = TYPE_X86_CPU "-kvm",
+static void kvm_cpu_accel_interface_init(ObjectClass *oc, void *data)
+{
+    X86CPUAccelInterface *acc = X86_CPU_ACCEL_CLASS(oc);
+    acc->realizefn = kvm_cpu_realizefn;
+    acc->common_class_init = kvm_cpu_common_class_init;
+    acc->instance_init = kvm_cpu_instance_init;
+};
 
-    .realizefn = kvm_cpu_realizefn,
-    .common_class_init = kvm_cpu_common_class_init,
-    .instance_init = kvm_cpu_instance_init,
+static const TypeInfo kvm_cpu_accel_type_info = {
+    .name = X86_CPU_ACCEL_NAME("kvm"),
+    .parent = TYPE_X86_CPU_ACCEL,
+    .class_init = kvm_cpu_accel_interface_init,
 };
 
 static void kvm_cpu_accel_init(void)
 {
-    if (kvm_enabled()) {
-        x86_cpu_accel_init(&kvm_cpu_accel);
-    }
+    type_register_static(&kvm_cpu_accel_type_info);
 }
-accel_cpu_init(kvm_cpu_accel_init);
+
+type_init(kvm_cpu_accel_init);
diff --git a/target/i386/tcg/cpu.c b/target/i386/tcg/cpu.c
index 25cf4cfb46..0321688cd3 100644
--- a/target/i386/tcg/cpu.c
+++ b/target/i386/tcg/cpu.c
@@ -150,19 +150,23 @@ static void tcg_cpu_instance_init(X86CPU *cpu)
     x86_cpu_apply_props(cpu, tcg_default_props);
 }
 
-static const X86CPUAccel tcg_cpu_accel = {
-    .name = TYPE_X86_CPU "-tcg",
+static void tcg_cpu_accel_interface_init(ObjectClass *oc, void *data)
+{
+    X86CPUAccelInterface *acc = X86_CPU_ACCEL_CLASS(oc);
+    acc->realizefn = tcg_cpu_realizefn;
+    acc->common_class_init = tcg_cpu_common_class_init;
+    acc->instance_init = tcg_cpu_instance_init;
+};
 
-    .realizefn = tcg_cpu_realizefn,
-    .common_class_init = tcg_cpu_common_class_init,
-    .instance_init = tcg_cpu_instance_init,
+static const TypeInfo tcg_cpu_accel_type_info = {
+    .name = X86_CPU_ACCEL_NAME("tcg"),
+    .parent = TYPE_X86_CPU_ACCEL,
+    .class_init = tcg_cpu_accel_interface_init,
 };
 
 static void tcg_cpu_accel_init(void)
 {
-    if (tcg_enabled()) {
-        x86_cpu_accel_init(&tcg_cpu_accel);
-    }
+    type_register_static(&tcg_cpu_accel_type_info);
 }
 
-accel_cpu_init(tcg_cpu_accel_init);
+type_init(tcg_cpu_accel_init);
diff --git a/stubs/meson.build b/stubs/meson.build
index 82b7ba60ab..1d66de1fae 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -1,4 +1,5 @@
 stub_ss.add(files('arch_type.c'))
+stub_ss.add(files('cpu_accel_arch_init.c'))
 stub_ss.add(files('bdrv-next-monitor-owned.c'))
 stub_ss.add(files('blk-commit-all.c'))
 stub_ss.add(files('blk-exp-close-all.c'))



-- 
Eduardo


