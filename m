Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC6B2BB220
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 19:11:26 +0100 (CET)
Received: from localhost ([::1]:41100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAsU-000845-Gg
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 13:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kgAr4-0007VF-79
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kgAqx-0000dt-CK
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605895785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YSjnshA1DGcl+BPZbeCCdKbiPXJ7BMkcMgEq/Xw+yx8=;
 b=FY133xzo2IZFFpR+T0KlcfRblfta38fsJ+fs4ffZFzX4kYZQDabPOh0g49QTX+2vvtw92N
 w56Z9tKbr195DgrDA8EOzW0+/tM9ttNi4+xMkZsXY0Q8j/aX13nXKiJRCVLfkIUAEg9ywC
 6oX+SL9MF5c6/GXfdT7DiBYj/9sHV+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-eR7JDeLuPGWJ-Bvtb8Pgkw-1; Fri, 20 Nov 2020 13:09:43 -0500
X-MC-Unique: eR7JDeLuPGWJ-Bvtb8Pgkw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 456CE1876527;
 Fri, 20 Nov 2020 18:09:41 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFE7910013C0;
 Fri, 20 Nov 2020 18:09:37 +0000 (UTC)
Date: Fri, 20 Nov 2020 13:09:36 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v3 8/9] module: introduce MODULE_INIT_ACCEL_CPU
Message-ID: <20201120180936.GD2271382@habkost.net>
References: <20201118152552.GG1509407@habkost.net>
 <CABgObfYL-TNAMmqkUh6cjcytaAFEtXPfw8toO6gXEuyokdyLhA@mail.gmail.com>
 <20201118161119.GJ1509407@habkost.net>
 <CABgObfb2Fim=7j3z7ApTuW=R0dWam2F_JRuOoxhP=XZXdsWe7g@mail.gmail.com>
 <20201118173055.GM1509407@habkost.net>
 <e7b70933-acd1-668c-62cd-89f480945f0f@redhat.com>
 <20201118220750.GP1509407@habkost.net>
 <2984625a-15ee-f638-b1bb-050a4514bade@suse.de>
 <20201120171942.GA2271382@habkost.net>
 <f780a9e5-2142-3bf4-b3fb-1bdeeed61945@suse.de>
MIME-Version: 1.0
In-Reply-To: <f780a9e5-2142-3bf4-b3fb-1bdeeed61945@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Bruce Rogers <brogers@suse.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Wenchao Wang <wenchao.wang@intel.com>, haxm-team@intel.com,
 Cameron Esfahani <dirty@apple.com>, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Dario Faggioli <dfaggioli@suse.com>, Olaf Hering <ohering@suse.de>,
 Richard Henderson <rth@twiddle.net>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 06:41:35PM +0100, Claudio Fontana wrote:
> On 11/20/20 6:19 PM, Eduardo Habkost wrote:
> > On Fri, Nov 20, 2020 at 01:13:33PM +0100, Claudio Fontana wrote:
> >> On 11/18/20 11:07 PM, Eduardo Habkost wrote:
> >>> On Wed, Nov 18, 2020 at 08:13:18PM +0100, Paolo Bonzini wrote:
> >>>> On 18/11/20 18:30, Eduardo Habkost wrote:
> >>>>>> Adding a layer of indirect calls is not very different from monkey patching
> >>>>>> though.
> >>>>>
> >>>>> I'm a little bothered by monkey patching, but I'm more
> >>>>> bothered by having to:
> >>>>>
> >>>>> (1) register (module_init()) a function (kvm_cpu_accel_register()) that
> >>>>>    (2) register (accel_register_call()) a function (kvm_cpu_accel_init()) that
> >>>>>      (3) register (x86_cpu_accel_init()) a data structure (X86CPUAccel kvm_cpu_accel) that
> >>>>>        (4) will be saved in multiple QOM classes, so that
> >>>>>          (5) we will call the right X86CPUClass.accel method at the right moment
> >>>>>              (common_class_init(), instance_init(), realizefn()),
> >>>>> where:
> >>>>>    step 4 must be done before any CPU object is created
> >>>>>      (otherwise X86CPUAccel.instance_init & X86CPUAccel.realizefn
> >>>>>       will be silently ignored), and
> >>>>>    step 3 must be done after all QOM types were registered.
> >>>>>
> >>>>>> You also have to consider that accel currently does not exist in usermode
> >>>>>> emulators, so that's an issue too. I would rather get a simple change in
> >>>>>> quickly, instead of designing the perfect class hierarchy.
> >>>>>
> >>>>> It doesn't have to be perfect.  I agree that simple is better.
> >>>>>
> >>>>> To me, registering a QOM type and looking it up when necessary is
> >>>>> simpler than the above.  Even if it's a weird class having no
> >>>>> object instances.  It probably could be an interface type.
> >>>>
> >>>> Registering a QOM type still has quite some boilerplate.  [...]
> >>>
> >>> We're working on that.  :)
> >>>
> >>>>                                                    [...]  Also registering a
> >>>> QOM type has a public side effect (shows up in qom-list-types).  In general
> >>>> I don't look at QOM unless I want its property mechanism, but maybe that's
> >>>> just me.
> >>>
> >>> We have lots of internal-use-only types returned by
> >>> qom-list-types, I don't think it's a big deal.
> >>>
> >>>>
> >>>>>> Perhaps another idea would be to allow adding interfaces to classes
> >>>>>> *separately from the registration of the types*. Then we can use it to add
> >>>>>> SOFTMMU_ACCEL and I386_ACCEL interfaces to a bare bones accel class, and
> >>>>>> add the accel object to usermode emulators.
> >>>>>
> >>>>> I'm not sure I follow.  What do you mean by bare bones accel
> >>>>> class, and when exactly would you add the new interfaces to the
> >>>>> classes?
> >>>>
> >>>> A bare bones accel class would not have init_machine and setup_post methods;
> >>>> those would be in a TYPE_SOFTMMU_ACCEL interface.  It would still have
> >>>> properties (such as tb-size for TCG) and would be able to register compat
> >>>> properties.
> > 
> > [1]
> > 
> >>>
> >>> Oh, I think I see.  This could save us having a lot of parallel type
> >>> hierarchies.
> >>>
> >>>>
> >>>> Where would I add it, I don't know.  It could be a simple public wrapper
> >>>> around type_initialize_interface() if we add a new MODULE_INIT_* phase after
> >>>> QOM.
> >>>>
> >>>> Or without adding a new phase, it could be a class_type->array of
> >>>> (interface_type, init_fn) hash table.  type_initialize would look up the
> >>>> class_type by name, add the interfaces would to the class with
> >>>> type_initialize_interface, and then call the init_fn to fill in the vtable.
> >>>
> >>> That sounds nice.  I don't think Claudio's cleanup should be
> >>> blocked until this new mechanism is ready, though.
> >>>
> >>> We don't really need the type representing X86CPUAccel to be a
> >>> subtype of TYPE_ACCEL or an interface implemented by
> >>> current_machine->accelerator, in the first version.  We just need
> >>> a simple way for the CPU initialization code to find the correct
> >>> X86CPUAccel struct.
> >>>
> >>> While we don't have the new mechanism, it can be just a:
> >>>   object_class_by_name("%s-x86-cpu-accel" % (accel->name))
> >>> call.
> >>>
> >>> Below is a rough draft of what I mean.  There's still lots of
> >>> room for cleaning it up (especially getting rid of the
> >>> X86CPUClass.common_class_init and X86CPUClass.accel fields).
> >>>
> >>> git tree at https://gitlab.com/ehabkost/qemu/-/commits/work/qom-based-x86-cpu-accel
> >>>
> >>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > [...]
> >>>  /**
> >>> - * X86CPUAccel:
> >>> - * @name: string name of the X86 CPU Accelerator
> >>> - *
> >>> + * X86CPUAccelInterface:
> >>>   * @common_class_init: initializer for the common cpu
> >>>   * @instance_init: cpu instance initialization
> >>>   * @realizefn: realize function, called first in x86 cpu realize
> >>> @@ -85,14 +83,16 @@ struct X86CPUClass {
> >>>   * X86 CPU accelerator-specific CPU initializations
> >>>   */
> >>>  
> >>> -struct X86CPUAccel {
> >>> -    const char *name;
> >>> -
> >>> +struct X86CPUAccelInterface {
> >>> +    ObjectClass parent_class;
> >>>      void (*common_class_init)(X86CPUClass *xcc);
> >>>      void (*instance_init)(X86CPU *cpu);
> >>>      void (*realizefn)(X86CPU *cpu, Error **errp);
> >>>  };
> >>>  
> >>> -void x86_cpu_accel_init(const X86CPUAccel *accel);
> >>> +#define TYPE_X86_CPU_ACCEL "x86-cpu-accel"
> >>> +OBJECT_DECLARE_INTERFACE(X86CPUAccel, X86CPUAccelInterface, X86_CPU_ACCEL);
> >>
> >>
> >> I am not exactly sure what precisely you are doing here,
> >>
> >> I get the general intention to use the existing interface-related "stuff" in QOM,
> >> but I do not see any OBJECT_DECLARE_INTERFACE around, and does not seem like the other boilerplate used for interfaces.
> > 
> > See the git URL I sent above, for other related changes:
> > 
> >   https://gitlab.com/ehabkost/qemu/-/commits/work/qom-based-x86-cpu-accel
> 
> 
> Aaah I missed this, there are quite a few more changes there;
> 
> for me it's great if you take it from there, I see you are
> developing a solution on top of the previous series.

I'm a bit busy with other stuff, so I'm probably not going to be
able to make sure the patches are in a good shape to be submitted
soon.

I don't want to impose any obstacles for the work you are doing,
either.  Please consider the patch I sent (and the git tree
above) as just an example of a possible solution to the two issues
Paolo raised at https://lore.kernel.org/qemu-devel/8f829e99-c346-00bc-efdd-3e6d69cfba35@redhat.com

> 
> 
> > 
> >>
> >> Could you clarify what happens here? Should we just use a normal object, call it "Interface" and call it a day?
> > 
> > An interface is declared in a very similar way, but instance_size
> > and the instance type cast macro is a bit different (because
> > instances of interface types are never created directly).
> > 
> > For the draft we have here, it shouldn't make any difference if
> > you use OBJECT_DECLARE_TYPE, because the instance type cast
> > macros are left unused.
> > 
> > Normally the use case for interfaces is not like what I did here.
> > Interfaces are usually attached to other classes (to declare that
> > object instances of that class implement the methods of that
> > interface).  Using interfaces would be just an intermediate step
> > to the solution Paolo was mentioning (dynamically adding
> > interface to classes, see [1] above).
> > 
> 
> Makes sense to me,
> let me know how you guys would like to proceed from here.
> 

To me, the main issue (also raised by Paolo above) is the fact
that you are doing *_enabled() checks in the module init
functions.  Every single use case we have for module init
functions today is for unconditionally registering code or data
structures provided by a code module (config group names, QOM
types, block backends, multifd methods, etc.), and none of them
depend on runtime options (like machine or accelerator options).

The x86_cpu_accel_init() calls, on the other hand, are not module
initialization, but just one additional step of
machine/accelerator/cpu initialization.


> The thing I am still uncertain about, looking at your tree at:
> 
> https://gitlab.com/ehabkost/qemu/-/commits/work/qom-based-x86-cpu-accel
> 
> is the removal of MODULE_INIT_ACCEL_CPU, it would be way simpler to understand I think,
> both for CpuAccelOps and X86CPUAccel, and is actualy in my view a perfect fit for
> the problem that module_call_init is supposed to solve.

That was one of my goals.  My first goal was the removal of the
(hvm|kvm|tcg)_enabled() checks in the accel init functions.  My
secondary goal (and a side effect of the first goal) was making
MODULE_INIT_ACCEL_CPU unnecessary.

If we are not trying to remove the *_enabled() checks in the
accel init functions (nor trying to make MODULE_INIT_ACCEL_CPU
unnecessary), my suggestion of using QOM doesn't make things
simpler.

Let's hear what Paolo thinks.

If you want to proceed with the accel_register_call() solution
suggested by Paolo, that's OK to me.  I just don't think we
really need it, because QOM already solves the problem for us.

-- 
Eduardo


