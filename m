Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B732B8061
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:27:14 +0100 (CET)
Received: from localhost ([::1]:55416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPMY-0008Hv-0g
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfPLU-0007RC-OU
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:26:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfPLS-0002tt-TB
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:26:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605713165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xYdF7JrulN9intzTE9WSfFAdoMTEIZwiza15QaFs58E=;
 b=gg7562zYnZb4LWx8DETJL3Rk4ehSdcSy3pkeaypL60topY06XY558TQpLX/7q6/YLrnc/P
 /V0xFr+ZDZ+GYuGiD3cgMgiFPtkxYo8i0UITRwKo9uLxYpgM1Q11ymIX7n9cWIfu4XW//H
 2PyRiEUhHj+pbGhBJMpU1lcOWXZM760=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-jiua8dD4OEexTE_pHrb6YA-1; Wed, 18 Nov 2020 10:26:00 -0500
X-MC-Unique: jiua8dD4OEexTE_pHrb6YA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D08F80EF9D;
 Wed, 18 Nov 2020 15:25:58 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B16760FC2;
 Wed, 18 Nov 2020 15:25:53 +0000 (UTC)
Date: Wed, 18 Nov 2020 10:25:52 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v3 8/9] module: introduce MODULE_INIT_ACCEL_CPU
Message-ID: <20201118152552.GG1509407@habkost.net>
References: <20201118102936.25569-1-cfontana@suse.de>
 <20201118102936.25569-9-cfontana@suse.de>
 <20201118124845.GC1509407@habkost.net>
 <6093de34-807d-3840-5402-4769385dd894@suse.de>
 <8f829e99-c346-00bc-efdd-3e6d69cfba35@redhat.com>
 <20201118143643.GF1509407@habkost.net>
 <a6071cd4-0787-01c8-775a-ede72e740376@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a6071cd4-0787-01c8-775a-ede72e740376@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Wed, Nov 18, 2020 at 03:51:44PM +0100, Paolo Bonzini wrote:
> On 18/11/20 15:36, Eduardo Habkost wrote:
> > On Wed, Nov 18, 2020 at 03:05:42PM +0100, Paolo Bonzini wrote:
> > > On 18/11/20 14:48, Claudio Fontana wrote:
> > > > On 11/18/20 1:48 PM, Eduardo Habkost wrote:
> > > > > I don't get why we would use a new module initialization level
> > > > 
> > > > To have a clear point in time after which all accelerator interface initialization is done.
> > > > It avoids to have to hunt down the registration points spread around the code base.
> > > > I'd turn it around, why not?
> > > 
> > > I see two disadvantages:
> > > 
> > > 1) you have to hunt down accel_cpu_inits instead of looking at accelerator
> > > classes. :)
> > > 
> > > 2) all callbacks have an "if (*_enabled())" around the actual meat. Another
> > > related issue is that usually the module_call_init are unconditional.
> > > 
> > > I think the idea of using module_call_init is good however.  What about:
> > > 
> > > static void kvm_cpu_accel_init(void)
> > > {
> > >      x86_cpu_accel_init(&kvm_cpu_accel);
> > 
> > What do you expect x86_cpu_accel_init() to do?
> 
> I don't know, the same that it was doing in Claudio's patches. :)
> 
> He had
> 
> 	if (kvm_enabled()) {
> 	    x86_cpu_accel_init(&kvm_cpu_accel);
> 	}
> 
> and I'm calling only the function that is registered on the enabled
> accelerator.
> 
> > I don't understand why a separate module init level is necessary
> > here.
> 
> Because you must call accel_register_call after the TYPE_KVM type has been
> registered, or object_class_by_name fails:
> 
> void
> accel_register_call(const char *qom_type, void (*fn)(void))
> {
>     AccelClass *acc = ACCEL_CLASS(object_class_by_name(qom_type));
> 
>     acc->setup_calls = g_slist_append(acc->setup_calls, (void *)fn);
> }
> 
> The alternative is to store the (type, function) tuple directly, with the
> type as a string.  Then you can just use type_init.

Right.  Let's build on top of that:

Another alternative would be to store a (type, X86CPUAccel) tuple
directly, with the type as string.  This would save the extra
indirection of the x86_cpu_accel_init() call.

It turns out we already have a mechanism to register and store
(type, StructContainingFunctionPointers) tuples at initialization
time: QOM.

X86CPUAccel can become X86CPUAccelClass, and be registered as a
QOM type.  It could be a subtype of TYPE_ACCEL or not, it
shouldn't matter.

I remember this was suggested in a previous thread, but I don't
remember if there were any objections.

> 
> > Making sure module_call_init() is called at the correct moment is
> > not easier or safer than just making sure accel_init_machine()
> > (or another init function you create) is called at the correct
> > moment.
> 
> Since there is a way to do it without a new level, that would of course be
> fine for me too.  Let me explain however why I think Claudio's design had
> module_call_init() misplaced and what the fundamental difference is.  The
> basic phases in qemu_init() are:
> 
> - initialize stuff
> - parse command line
> - create machine
> - create accelerator
> - initialize machine
> - create devices
> - start
> 
> with a mess of other object creation sprinkled between the various phases
> (but we don't care about those).
> 
> What I object to, is calling module_call_init() after the "initialize stuff"
> phase.  Claudio was using it to call the function directly, so it had to be
> exactly at "create accelerator".  This is different from all other
> module_call_init() calls, which are done very early.

I agree.

> 
> With the implementation I sketched, accel_register_call must still be done
> after type_init, so there's still an ordering constraint, but all it's doing
> is registering a callback in the "initialize stuff" phase.

Makes sense, if we really want to introduce a new accel_register_call()
abstraction.  I don't think we need it, though.

-- 
Eduardo


