Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30892AD325
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:06:36 +0100 (CET)
Received: from localhost ([::1]:35410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcQXr-0007nB-CJ
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcQWX-0007Bn-Lp
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:05:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcQWS-0006Cd-N5
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605002706;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=neGUqwK37S/LipoFHuZSq7cEMep/9j2GnMJpXLVLlUg=;
 b=NtP+OdH7lN2nEswUaZaiVDIJeirwkAU7W1FJ/c/w0xUJOZCA4SBg9JtlO5B3BigNnVnQaD
 YhivKCP6z79HPhXYI4K4067wlDsyPBnieajB1f7iiEqOef5YJu8A6Ky31xnyUYTKKSa5rh
 74WY3vy4W4U2Zo7VJo4Wch8UzQZLImE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-kPl9ndvcPmOcfEQNVVIDdw-1; Tue, 10 Nov 2020 05:04:53 -0500
X-MC-Unique: kPl9ndvcPmOcfEQNVVIDdw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEE7D186DD23;
 Tue, 10 Nov 2020 10:04:50 +0000 (UTC)
Received: from redhat.com (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ED7550B44;
 Tue, 10 Nov 2020 10:04:42 +0000 (UTC)
Date: Tue, 10 Nov 2020 10:04:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v1 09/10] i386: split cpu.c and defer x86 models registration
Message-ID: <20201110100438.GF866671@redhat.com>
References: <20201109172755.16500-1-cfontana@suse.de>
 <20201109172755.16500-10-cfontana@suse.de>
 <20201109180302.GB814975@redhat.com>
 <971cfde9-d24e-a3dc-6389-8a7c9e477f63@suse.de>
MIME-Version: 1.0
In-Reply-To: <971cfde9-d24e-a3dc-6389-8a7c9e477f63@suse.de>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Wenchao Wang <wenchao.wang@intel.com>, haxm-team@intel.com,
 Cameron Esfahani <dirty@apple.com>, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bruce Rogers <brogers@suse.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 10, 2020 at 10:40:04AM +0100, Claudio Fontana wrote:
> On 11/9/20 7:03 PM, Daniel P. Berrangé wrote:
> > On Mon, Nov 09, 2020 at 06:27:54PM +0100, Claudio Fontana wrote:
> >> split cpu.c into:
> >>
> >> cpu.c            cpuid and common x86 cpu functionality
> >> host-cpu.c       host x86 cpu functions and "host" cpu type
> >> kvm-cpu-type.c   KVM x86 cpu type
> >> hvf-cpu-type.c   HVF x86 cpu type
> >> tcg-cpu-type.c   TCG x86 cpu type
> >>
> >> Defer the x86 models registration to MODULE_INIT_ACCEL_CPU,
> >> so that accel-specific types can be used as parent types for all
> >> cpu models. Use the generic TYPE_X86_CPU only if no
> >> accel-specific specialization is enabled.
> > 
> > Can you give more info on why this is needed and/or desirable ?
> 
> Hello Daniel, there is a pointer to the overall higher level motivation in the cover letter.
> 
> But I am not pushing for this specific mechanism to be used, as mentioned in the cover letter.
> 
> If we need another mechanism to achieve that (not delaying the x86 model registration and make them inherit from the specialized class), but something else,
> I would be happy to get additional ideas.
> 
> > 
> > Dynamically changing the class hierarchy of CPUs at runtime feels
> > like a rather suspicious approach to me
> 
> TYPE_X86_CPU is base type is registered as usual.
> New accel-specialized types are defined (TYPE_TCG_CPU, TYPE_KVM_CPU, TYPE_HVF_CPU), also using normal type registration.
> 
> The missing step is how to adapt all the cpu models to use the functionality.

If I understand the problem correctly, we have two distinct axis of
configurability

 - the CPU model definitions (Nehalem, Broadwell, Skylake, host, max)
 - the accelerator CPU implementations (tcg, kvm, hvf).

At runtime any pair of objects from these two axis can be combined.

We're trying to avoid defining classes for the combinatorial expansion
of these axis.

This patch series encodes these two axis in a single class hierarchy,
with the CPU implementations being a parent of the CPU model definitions.
It avoids the combinatorial expansion, by taking the approach of dynamically
defining the parent/child relation between CPU impl and CPU defintion at
runtime  baed on the choosen accelerator impl.

The fully static way to deal with this problem is to accept that distinct
axis should be represented as distinct class hierarchies.

ie, we should have one class hierarchy for CPU model definitions, and
one class hierarchy  for accelerator CPU implementations.

So at runtime we then get two object instances - a CPU implementation
and a CPU definition. The CPU implementation object should have a
property which is a link to the desired CPU definition.


> The accelerator that is finally chosen to be used is only known at a specific point in the qemu initialization.
> This point of time I defined as MODULE_INIT_ACCEL_CPU.
> 
> That is the time when we know how the CPU should actually really behave (how it should be realized, etc).
> 
> In this series I realized this by registering the cpu models only at MODULE_INIT_ACCEL_CPU time, and not earlier.
> But maybe there is a better idea on how to do it, and I am all ears.
> 
> .
> > 
> > It is contrary to work we've been doing recently to try to make all
> > classes be fully statically defined by getting rid of dynamic properties,
> > such that introspection of classes does not depend on other CLI flags
> > you might have passed.
> 
> Understood, this goes against other requirements.
> 
> The dynamism introduced here is to register the cpu models at MODULE_INIT_ACCEL_CPU time instead of MODULE_INIT_QOM time.
> As a result, for any chosen accelerator, the type tree and class tree is identical.

For introspection the goal is that the type tree and class tree is
identical for a *binary*, not an accelerator within a binary.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


