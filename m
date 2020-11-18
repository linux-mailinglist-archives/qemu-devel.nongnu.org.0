Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B022B834F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:46:49 +0100 (CET)
Received: from localhost ([::1]:36968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfRXb-0001M3-RR
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:46:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfRIf-0007Qy-LW
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:31:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfRId-0003n0-CG
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:31:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605720678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C8Vxkg+6vQaGa7lfAuPfV7XQUI4F9rGMAdbbpHxygNg=;
 b=hQujpQb97rWyl6mLQ+qs5qJ0UcI2+JcvWliDnTbxWi5YTzYQqYM2nbXEE1dDaDD4Ui+InA
 0W66kQ+sltJ111wefr7t01lxJUuTATH2b4k6+j2FPeRZrgiAXiPMBIjhkX/M4H90Edd05L
 8/+ujF/7119dvz1TcrrCMSmDBnc5lp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-T0pEV2Y5Mn-sXUDMno-85Q-1; Wed, 18 Nov 2020 12:31:14 -0500
X-MC-Unique: T0pEV2Y5Mn-sXUDMno-85Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D80118B9EA3;
 Wed, 18 Nov 2020 17:30:57 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07ECA60875;
 Wed, 18 Nov 2020 17:30:56 +0000 (UTC)
Date: Wed, 18 Nov 2020 12:30:55 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v3 8/9] module: introduce MODULE_INIT_ACCEL_CPU
Message-ID: <20201118173055.GM1509407@habkost.net>
References: <20201118102936.25569-9-cfontana@suse.de>
 <20201118124845.GC1509407@habkost.net>
 <6093de34-807d-3840-5402-4769385dd894@suse.de>
 <8f829e99-c346-00bc-efdd-3e6d69cfba35@redhat.com>
 <20201118143643.GF1509407@habkost.net>
 <a6071cd4-0787-01c8-775a-ede72e740376@redhat.com>
 <20201118152552.GG1509407@habkost.net>
 <CABgObfYL-TNAMmqkUh6cjcytaAFEtXPfw8toO6gXEuyokdyLhA@mail.gmail.com>
 <20201118161119.GJ1509407@habkost.net>
 <CABgObfb2Fim=7j3z7ApTuW=R0dWam2F_JRuOoxhP=XZXdsWe7g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgObfb2Fim=7j3z7ApTuW=R0dWam2F_JRuOoxhP=XZXdsWe7g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
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

On Wed, Nov 18, 2020 at 05:22:46PM +0100, Paolo Bonzini wrote:
> Il mer 18 nov 2020, 17:11 Eduardo Habkost <ehabkost@redhat.com> ha scritto:
> 
> > On Wed, Nov 18, 2020 at 04:43:19PM +0100, Paolo Bonzini wrote:
> > > Il mer 18 nov 2020, 16:26 Eduardo Habkost <ehabkost@redhat.com> ha
> > scritto:
> > >
> > > >
> > > > > The alternative is to store the (type, function) tuple directly,
> > with the
> > > > > type as a string.  Then you can just use type_init.
> > > >
> > > > Right.  Let's build on top of that:
> > > >
> > > > Another alternative would be to store a (type, X86CPUAccel) tuple
> > > > directly, with the type as string.  This would save the extra
> > > > indirection of the x86_cpu_accel_init() call.
> > > >
> > > > It turns out we already have a mechanism to register and store
> > > > (type, StructContainingFunctionPointers) tuples at initialization
> > > > time: QOM.
> > > >
> > > > X86CPUAccel can become X86CPUAccelClass, and be registered as a
> > > > QOM type.  It could be a subtype of TYPE_ACCEL or not, it
> > > > shouldn't matter.
> > > >
> > >
> > > It would be a weird type that isn't instantiated, and/or that does
> > nothing
> > > but monkey patching other classes. I don't think it's a good fit.
> >
> > The whole point of this would be to avoid monkey patching other
> > classes.
> >
> 
> Adding a layer of indirect calls is not very different from monkey patching
> though.

I'm a little bothered by monkey patching, but I'm more
bothered by having to:

(1) register (module_init()) a function (kvm_cpu_accel_register()) that
  (2) register (accel_register_call()) a function (kvm_cpu_accel_init()) that
    (3) register (x86_cpu_accel_init()) a data structure (X86CPUAccel kvm_cpu_accel) that
      (4) will be saved in multiple QOM classes, so that
        (5) we will call the right X86CPUClass.accel method at the right moment
            (common_class_init(), instance_init(), realizefn()),
where:
  step 4 must be done before any CPU object is created
    (otherwise X86CPUAccel.instance_init & X86CPUAccel.realizefn
     will be silently ignored), and
  step 3 must be done after all QOM types were registered.



> 
> You also have to consider that accel currently does not exist in usermode
> emulators, so that's an issue too. I would rather get a simple change in
> quickly, instead of designing the perfect class hierarchy.

It doesn't have to be perfect.  I agree that simple is better.

To me, registering a QOM type and looking it up when necessary is
simpler than the above.  Even if it's a weird class having no
object instances.  It probably could be an interface type.

> 
> Perhaps another idea would be to allow adding interfaces to classes
> *separately from the registration of the types*. Then we can use it to add
> SOFTMMU_ACCEL and I386_ACCEL interfaces to a bare bones accel class, and
> add the accel object to usermode emulators.

I'm not sure I follow.  What do you mean by bare bones accel
class, and when exactly would you add the new interfaces to the
classes?

> 
> Why wouldn't we instantiate it?  There's a huge number of static
> > variables in target/i386/kvm.c that could be moved to that
> > object.  Sounds like a perfect fit for me.
> >
> 
> Most of those are properties of the running kernel so there's no need to
> move them inside an object.

There's no need, correct.  Some consistency would be nice,
though.  All kernel capabilities in kvm-all.c are saved in
KVMState.

> 
> Paolo
> 
> I won't try to stop you if you really want to invent a brand new
> > (name => CollectionOfFunctionPointers) registry, but it seems
> > unnecessary.
> >
> > >
> > > Yet another possibility is to use GHashTable. It is limited to one value
> > > per key, but it's enough if everything is kept local to {hw,target}/i386.
> > > If needed a new function pointer can be added to MachineClass,
> > implemented
> > > in X86MachineState (where the GHashTable would also be) and called in
> > > accel.c.
> > >
> > > Paolo
> > >
> > > Paolo
> > >
> > >
> > > > I remember this was suggested in a previous thread, but I don't
> > > > remember if there were any objections.
> > > >
> > > > >
> > > > > > Making sure module_call_init() is called at the correct moment is
> > > > > > not easier or safer than just making sure accel_init_machine()
> > > > > > (or another init function you create) is called at the correct
> > > > > > moment.
> > > > >
> > > > > Since there is a way to do it without a new level, that would of
> > course
> > > > be
> > > > > fine for me too.  Let me explain however why I think Claudio's
> > design had
> > > > > module_call_init() misplaced and what the fundamental difference
> > is.  The
> > > > > basic phases in qemu_init() are:
> > > > >
> > > > > - initialize stuff
> > > > > - parse command line
> > > > > - create machine
> > > > > - create accelerator
> > > > > - initialize machine
> > > > > - create devices
> > > > > - start
> > > > >
> > > > > with a mess of other object creation sprinkled between the various
> > phases
> > > > > (but we don't care about those).
> > > > >
> > > > > What I object to, is calling module_call_init() after the "initialize
> > > > stuff"
> > > > > phase.  Claudio was using it to call the function directly, so it
> > had to
> > > > be
> > > > > exactly at "create accelerator".  This is different from all other
> > > > > module_call_init() calls, which are done very early.
> > > >
> > > > I agree.
> > > >
> > > > >
> > > > > With the implementation I sketched, accel_register_call must still be
> > > > done
> > > > > after type_init, so there's still an ordering constraint, but all
> > it's
> > > > doing
> > > > > is registering a callback in the "initialize stuff" phase.
> > > >
> > > > Makes sense, if we really want to introduce a new accel_register_call()
> > > > abstraction.  I don't think we need it, though.
> > > >
> > > > --
> > > > Eduardo
> > > >
> > > >
> >
> > --
> > Eduardo
> >
> >

-- 
Eduardo


