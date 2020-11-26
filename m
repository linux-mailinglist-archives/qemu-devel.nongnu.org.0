Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0482C57ED
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 16:16:46 +0100 (CET)
Received: from localhost ([::1]:51336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiJ0m-0001bP-JW
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 10:16:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiIyt-0000ea-Iz
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:14:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiIyp-0006oy-SD
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:14:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606403681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W9P2KpcR5gCE7nStTCIM5jY33AzY3vPrBHyXJ89MAec=;
 b=LF9B+BF5IxdLAHGb5eFtgQR34yeqogJK++NFzsoBBzli68zAvkz40SJZAONvl5G9YtV/t/
 aivQCBqbKpTQGLe2Igd9WciedG+qioUlNAPrORRWR4g/9HHQeRkTmwMkByeAUA/iNeVPCR
 27Vml8x6LWsVJk2RunhT5D96jIVO+fg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-YKA265TWNfOlj6260UbMNg-1; Thu, 26 Nov 2020 10:14:40 -0500
X-MC-Unique: YKA265TWNfOlj6260UbMNg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9FC99A221;
 Thu, 26 Nov 2020 15:14:37 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B13C18996;
 Thu, 26 Nov 2020 15:14:33 +0000 (UTC)
Date: Thu, 26 Nov 2020 10:14:32 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v5 11/12] i386: centralize initialization of cpu accel
 interfaces
Message-ID: <20201126151432.GL2271382@habkost.net>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-12-cfontana@suse.de>
 <7dc27df6-1c81-f8fb-3e56-aa6ffe9e8475@redhat.com>
 <20201124213159.GA2271382@habkost.net>
 <1205be9d-d2f0-4533-68aa-608b16ad2181@suse.de>
 <20201126134425.GH2271382@habkost.net>
 <86ba92db-7b01-5644-7452-2fde753ddba6@suse.de>
 <20201126144959.GJ2271382@habkost.net>
 <16445790-3371-9775-3d03-f8c8f0d66b18@suse.de>
MIME-Version: 1.0
In-Reply-To: <16445790-3371-9775-3d03-f8c8f0d66b18@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On Thu, Nov 26, 2020 at 03:55:37PM +0100, Claudio Fontana wrote:
> On 11/26/20 3:49 PM, Eduardo Habkost wrote:
> > On Thu, Nov 26, 2020 at 03:33:17PM +0100, Claudio Fontana wrote:
> >> On 11/26/20 2:44 PM, Eduardo Habkost wrote:
> >>> On Thu, Nov 26, 2020 at 11:57:28AM +0100, Claudio Fontana wrote:
> >>>> On 11/24/20 10:31 PM, Eduardo Habkost wrote:
> >>>>> On Tue, Nov 24, 2020 at 09:13:13PM +0100, Paolo Bonzini wrote:
> >>>>>> On 24/11/20 17:22, Claudio Fontana wrote:
> >>>>>>> +static void x86_cpu_accel_init(void)
> >>>>>>>  {
> >>>>>>> -    X86CPUAccelClass *acc;
> >>>>>>> +    const char *ac_name;
> >>>>>>> +    ObjectClass *ac;
> >>>>>>> +    char *xac_name;
> >>>>>>> +    ObjectClass *xac;
> >>>>>>> -    acc = X86_CPU_ACCEL_CLASS(object_class_by_name(accel_name));
> >>>>>>> -    g_assert(acc != NULL);
> >>>>>>> +    ac = object_get_class(OBJECT(current_accel()));
> >>>>>>> +    g_assert(ac != NULL);
> >>>>>>> +    ac_name = object_class_get_name(ac);
> >>>>>>> +    g_assert(ac_name != NULL);
> >>>>>>> -    object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, &acc);
> >>>>>>> +    xac_name = g_strdup_printf("%s-%s", ac_name, TYPE_X86_CPU);
> >>>>>>> +    xac = object_class_by_name(xac_name);
> >>>>>>> +    g_free(xac_name);
> >>>>>>> +
> >>>>>>> +    if (xac) {
> >>>>>>> +        object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, xac);
> >>>>>>> +    }
> >>>>>>>  }
> >>>>>>> +
> >>>>>>> +accel_cpu_init(x86_cpu_accel_init);
> >>>>>>
> >>>>>> If this and cpus_accel_ops_init are the only call to accel_cpu_init, I'd
> >>>>>> rather make them functions in CPUClass (which you find and call via
> >>>>>> CPU_RESOLVING_TYPE) and AccelClass respectively.
> >>>>>
> >>>>> Making x86_cpu_accel_init() be a CPUClass method sounds like a
> >>>>> good idea.  This way we won't need a arch_cpu_accel_init() stub
> >>>>> for non-x86.
> >>>>>
> >>>>> accel.c can't use cpu.h, correct?  We can add a:
> >>>>>
> >>>>>   CPUClass *arch_base_cpu_type(void)
> >>>>>   {
> >>>>>       return object_class_by_name(CPU_RESOLVING_TYPE);
> >>>>>   }
> >>>>>
> >>>>> function to arch_init.c, to allow target-independent code call
> >>>>> target-specific code.
> >>>>>
> >>>>
> >>>> Hi Eduardo,
> >>>>
> >>>> we can't use arch-init because it is softmmu only, but we could put this in $(top_srcdir)/cpu.c
> >>>
> >>> That would work, too.
> >>>
> >>>>
> >>>> however, it would be very useful to put a:
> >>>>
> >>>> #define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
> >>>> #define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
> >>>>
> >>>> in an H file somewhere, for convenience for the programmer that
> >>>> has to implement subclasses in target/xxx/
> >>>
> >>> Absolutely.
> >>>
> >>>>
> >>>> But it is tough to find a header where CPU_RESOLVING_TYPE can be used.
> >>>
> >>> cpu-all.h?
> >>>
> >>>>
> >>>> We could I guess just use plain "cpu" instead of CPU_RESOLVING_TYPE,
> >>>> maybe that would be acceptable too? The interface ends up in CPUClass, so maybe ok?
> >>>>
> >>>> So we'd end up having
> >>>>
> >>>> accel-cpu
> >>>>
> >>>> instead of the previous
> >>>>
> >>>> accel-x86_64-cpu
> >>>>
> >>>> on top of the hierarchy.
> >>>
> >>> It seems OK to have a accel-cpu type at the top, but I don't see
> >>> why it solves the problem above.  What exactly would be the value
> >>> of `kvm_cpu_accel.name`?
> >>>
> >>
> >> It does solve the problem, because we can put then all AccelOpsClass and AccelCPUClass stuff in accel.h,
> >> resolve everything in accel/accel-*.c, and make a generic solution fairly self-contained (already tested, will post soonish).
> >>
> >> But I'll try cpu-all.h if it's preferred to have accel-x86_64-cpu, accel-XXX-cpu on top, I wonder what the preference would be?
> > 
> > I don't have a specific preference, but I still wonder how
> > exactly you would name the X86CPUAccel implemented at
> > target/i386/kvm, and how exactly you would look for it when
> > initializing the accelerator.
> > 
> 
> If we agree to use "accel-cpu" I would lookup "kvm-accel-cpu"

The structure in target/i386/kvm is x86-specific and
kvm-specific.  If we name it "kvm-accel-cpu", how would you name
the equivalent structures at target/s390x/kvm, target/arm/kvm,
target/ppc/kvm?

The same question would apply to target/*/tcg*, and to other
accelerators.

> if we agree to use "accel-x86_64" aka "accel-" CPU_RESOLVING_TYPE, I would lookup "kvm-accel-" CPU_RESOLVING_TYPE
> 
> * initialize the arch-specific accel CpuClass interfaces */
> static void accel_init_cpu_interfaces(AccelClass *ac, const char *cpu_type)
> {
>     const char *ac_name; /* AccelClass name */
>     char *acc_name;      /* AccelCPUClass name */
>     ObjectClass *acc;    /* AccelCPUClass */
> 
>     ac_name = object_class_get_name(OBJECT_CLASS(ac));
>     g_assert(ac_name != NULL);
> 
>     acc_name = g_strdup_printf("%s-cpu", ac_name);
>     acc = object_class_by_name(acc_name);
>     g_free(acc_name);
> 
>     if (acc) {
>         object_class_foreach(accel_init_cpu_interfaces_aux, cpu_type, false, acc);
>     }
> }
> 
> Ciao,
> 
> CLaudio
> 

-- 
Eduardo


