Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F392B7F7F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 15:38:38 +0100 (CET)
Received: from localhost ([::1]:44022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfObV-00038w-IL
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 09:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfOa2-00020m-5j
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:37:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfOZz-0003LX-Ow
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605710222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FPUadVH3Ab+j/2/4Q4Ca9fqsiccoVkzL/EE43qSZLm8=;
 b=UxK4Ox7al7kpNggkDwVM3M+hx8BktHO/mzu1OMnedN0c5fmmjPHAmTZDLdgVwnMEINcis7
 qrefTK0rtA2SGPtnqUJnj1VslK88Dh9mYpX/oOqHSY/kkGbNul/wehFYyzO0EixT+YnnDl
 5t1CXAV+HufayibUT7y5Q+N37oUBs+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-vMYsZw4IPnqa4xRkBhX8pQ-1; Wed, 18 Nov 2020 09:37:00 -0500
X-MC-Unique: vMYsZw4IPnqa4xRkBhX8pQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A22D59CC24;
 Wed, 18 Nov 2020 14:36:56 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E87675D9CA;
 Wed, 18 Nov 2020 14:36:45 +0000 (UTC)
Date: Wed, 18 Nov 2020 09:36:43 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v3 8/9] module: introduce MODULE_INIT_ACCEL_CPU
Message-ID: <20201118143643.GF1509407@habkost.net>
References: <20201118102936.25569-1-cfontana@suse.de>
 <20201118102936.25569-9-cfontana@suse.de>
 <20201118124845.GC1509407@habkost.net>
 <6093de34-807d-3840-5402-4769385dd894@suse.de>
 <8f829e99-c346-00bc-efdd-3e6d69cfba35@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8f829e99-c346-00bc-efdd-3e6d69cfba35@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

On Wed, Nov 18, 2020 at 03:05:42PM +0100, Paolo Bonzini wrote:
> On 18/11/20 14:48, Claudio Fontana wrote:
> > On 11/18/20 1:48 PM, Eduardo Habkost wrote:
> > > On Wed, Nov 18, 2020 at 11:29:35AM +0100, Claudio Fontana wrote:
> > > > apply this to the registration of the cpus accel interfaces,
> > > > 
> > > > but this will be also in preparation for later use of this
> > > > new module init step to also defer the registration of the cpu models,
> > > > in order to make them subclasses of a per-accel cpu type.
> > > > 
> > > > Signed-off-by: Claudio Fontana <cfontana@suse.de>
> > > > ---
> > > [...]
> > > > +    /*
> > > > +     * accelerator has been chosen and initialized, now it is time to
> > > > +     * register the cpu accel interface.
> > > > +     */
> > > > +    module_call_init(MODULE_INIT_ACCEL_CPU);
> > > 
> > > I don't get why we would use a new module initialization level
> > 
> > To have a clear point in time after which all accelerator interface initialization is done.
> > It avoids to have to hunt down the registration points spread around the code base.
> > I'd turn it around, why not?
> 
> I see two disadvantages:
> 
> 1) you have to hunt down accel_cpu_inits instead of looking at accelerator
> classes. :)
> 
> 2) all callbacks have an "if (*_enabled())" around the actual meat. Another
> related issue is that usually the module_call_init are unconditional.
> 
> I think the idea of using module_call_init is good however.  What about:
> 
> static void kvm_cpu_accel_init(void)
> {
>     x86_cpu_accel_init(&kvm_cpu_accel);

What do you expect x86_cpu_accel_init() to do?

> }
> 
> static void kvm_cpu_accel_register(void)
> {
>     accel_register_call(TYPE_KVM, kvm_cpu_accel_init);
> }
> accel_cpu_init(kvm_cpu_accel_register);
> 
> ...
> 
> void
> accel_register_call(const char *qom_type, void (*fn)(void))
> {
>     AccelClass *acc = ACCEL_CLASS(object_class_by_name(qom_type));
> 
>     acc->setup_calls = g_slist_append(acc->setup_calls, (void *)fn);
> }
> 
> void
> accel_do_call(void *data, void *unused)
> {
>     void (*fn)(void) = data;
> 
>     data();
> }
> 
> int accel_init_machine(AccelState *accel, MachineState *ms)
> {
> ...
>     if (ret < 0) {
>         ms->accelerator = NULL;
>         *(acc->allowed) = false;
>         object_unref(OBJECT(accel));
>     } else {
>         object_set_accelerator_compat_props(acc->compat_props);
>         g_slist_foreach(acc->setup_calls, accel_do_call, NULL);

Why all this extra complexity if you can simply do:

  ACCEL_GET_CLASS(acc)->finish_arch_specific_init();

?


>     }
>     return ret;
> }
> 
> where the module_call_init would be right after MODULE_INIT_QOM
> 
> Paolo
> 
> > > for this.  If the accelerator object was already created, we can
> > > just ask the existing accel object to do whatever initialization
> > > step is necessary.
> > > 
> > > e.g. we can add a AccelClass.cpu_accel_ops field, and call:
> > > 
> > >     cpus_register_accel(current_machine->accelerator->cpu_accel_ops);
> > > 
> > 
> > _When_ this is done is the question, in my view, where the call to the registration is placed.
> > 
> > After adding additonal operations that have to be done at
> > "accelerator-chosen" time, it becomes more and more difficult
> > to trace them around the codebase.

I don't understand why a separate module init level is necessary
here.

Making sure module_call_init() is called at the correct moment is
not easier or safer than just making sure accel_init_machine()
(or another init function you create) is called at the correct
moment.

-- 
Eduardo


