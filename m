Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C792B9B6E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 20:25:02 +0100 (CET)
Received: from localhost ([::1]:40180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfpYD-0000c3-DV
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 14:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfpWa-00009T-96
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:23:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfpWW-0006cS-Lt
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:23:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605813796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0FHUMwNM733jQUF90YZqPIwhTLg6uPofibIARi5fQRI=;
 b=AKykclLdH/sxoBZOLzdnUB9fYEwSzCLRP+HRSGjIAtWNJESLgnq/SSQSRSwHovCi1kUAMJ
 dUhdY+C2LBzYDIN8bpBUiUrLS+Dy0ceSfkJyrUQq7OWBZX63EriG6+dW1+i112zQ+dw9+L
 XNB310XNXkbpJ2Da55vGgvvdyazSuVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-gU9SN-3bM9i_ZG2jRoJJhg-1; Thu, 19 Nov 2020 14:23:13 -0500
X-MC-Unique: gU9SN-3bM9i_ZG2jRoJJhg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 599ED107ACE3;
 Thu, 19 Nov 2020 19:23:11 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C372960843;
 Thu, 19 Nov 2020 19:23:05 +0000 (UTC)
Date: Thu, 19 Nov 2020 14:23:05 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v3 9/9] i386: split cpu accelerators from cpu.c
Message-ID: <20201119192305.GB1509407@habkost.net>
References: <20201118102936.25569-1-cfontana@suse.de>
 <20201118102936.25569-10-cfontana@suse.de>
 <20201118182845.GN1509407@habkost.net>
 <5f6c7b5c-a48a-019d-2646-d0670aeb46e1@suse.de>
MIME-Version: 1.0
In-Reply-To: <5f6c7b5c-a48a-019d-2646-d0670aeb46e1@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Cameron Esfahani <dirty@apple.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 09:53:09AM +0100, Claudio Fontana wrote:
> Hi,
> 
> On 11/18/20 7:28 PM, Eduardo Habkost wrote:
> > On Wed, Nov 18, 2020 at 11:29:36AM +0100, Claudio Fontana wrote:
> >> split cpu.c into:
> >>
> >> cpu.c            cpuid and common x86 cpu functionality
> >> host-cpu.c       host x86 cpu functions and "host" cpu type
> >> kvm/cpu.c        KVM x86 cpu type
> >> hvf/cpu.c        HVF x86 cpu type
> >> tcg/cpu.c        TCG x86 cpu type
> >>
> >> The accel interface of the X86CPUClass is set at MODULE_INIT_ACCEL_CPU
> >> time, when the accelerator is known.
> >>
> >> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> >> ---
> > [...]
> >> +/**
> >> + * X86CPUAccel:
> >> + * @name: string name of the X86 CPU Accelerator
> >> + *
> >> + * @common_class_init: initializer for the common cpu
> > 
> > So this will be called for every single CPU class.
> 
> Not really, it's called for every TYPE_X86_CPU cpu class (if an accel interface is registered).

This means every single non-abstract CPU class in
qemu-system-x86_64, correct?

> 
> This function extends the existing x86_cpu_common_class_init (target/i386/cpu.c),
> where some methods of the base class CPUClass are set.
> 
> > 
> >> + * @instance_init: cpu instance initialization
> >> + * @realizefn: realize function, called first in x86 cpu realize
> >> + *
> >> + * X86 CPU accelerator-specific CPU initializations
> >> + */
> >> +
> >> +struct X86CPUAccel {
> >> +    const char *name;
> >> +
> >> +    void (*common_class_init)(X86CPUClass *xcc);
> >> +    void (*instance_init)(X86CPU *cpu);
> >> +    void (*realizefn)(X86CPU *cpu, Error **errp);
> >>  };
> >>  
> >> +void x86_cpu_accel_init(const X86CPUAccel *accel);
> > [...]
> >> +static void x86_cpu_accel_init_aux(ObjectClass *klass, void *opaque)
> >> +{
> >> +    X86CPUClass *xcc = X86_CPU_CLASS(klass);
> >> +    const X86CPUAccel **accel = opaque;
> >> +
> >> +    xcc->accel = *accel;
> >> +    xcc->accel->common_class_init(xcc);
> >> +}
> >> +
> >> +void x86_cpu_accel_init(const X86CPUAccel *accel)
> >> +{
> >> +    object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, &accel);
> >> +}
> > 
> > This matches the documented behavior.
> > 
> > [...]
> >> +void host_cpu_class_init(X86CPUClass *xcc)
> >> +{
> >> +    xcc->host_cpuid_required = true;
> >> +    xcc->ordering = 8;
> >> +    xcc->model_description =
> >> +        g_strdup_printf("%s processor with all supported host features ",
> >> +                        xcc->accel->name);
> >> +}
> > [...]
> >> +static void hvf_cpu_common_class_init(X86CPUClass *xcc)
> >> +{
> >> +    host_cpu_class_init(xcc);
> > 
> > Why are you calling host_cpu_class_init() for all CPU types?
> 
> I am not..

I don't get it.  You are calling host_cpu_class_init() for every
single non-abstract TYPE_X86_CPU subclass (which includes all CPU
models in qemu-system-x86_64), and I don't understand why, or if
this is really intentional.

> 
> > 
> >> +}
> > [...]
> >> +static void kvm_cpu_common_class_init(X86CPUClass *xcc)
> >> +{
> >> +    host_cpu_class_init(xcc);
> >> +}
> > 
> > Same question as above.
> > 
> 
> Ciao,
> 
> Claudio
> 

-- 
Eduardo


