Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11F339FE32
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:51:49 +0200 (CEST)
Received: from localhost ([::1]:38770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqftE-0007kV-MJ
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqfrq-0006sy-Cv
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:50:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqfrl-0003nF-3e
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623174614;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r3gPz7gaKiQQxKttqkZUJJb3UbLDnx4f8vtvAQKksAw=;
 b=dAXVKBfSjBnuu72dTJzztN8Xs+kBs0rLpfrh/V7RjQ5mfxOTPSotZo6ebuQLG3FRCtbLEV
 wg92osJmCWZihnLHvc785tt1LsH32BJfTDftoNPFNHPOcVHZRIkbjm5e9q11LLnuoQgRsf
 xNkKTG/LoEzaRShlOLc6yv+69paj5fs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-61vD-Yi1N2Kr6-5z2ttrOw-1; Tue, 08 Jun 2021 13:50:04 -0400
X-MC-Unique: 61vD-Yi1N2Kr6-5z2ttrOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50A461B18BC5;
 Tue,  8 Jun 2021 17:50:03 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D559D18A77;
 Tue,  8 Jun 2021 17:49:57 +0000 (UTC)
Date: Tue, 8 Jun 2021 18:49:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v3 0/4] target/i386/cpu: introduce new CPU models for
 x86-64 ABI levels
Message-ID: <YL+tw1w7pDPi1HEK@redhat.com>
References: <20210607135843.196595-1-berrange@redhat.com>
 <20210607213310.wj2223q64xqhgh4g@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210607213310.wj2223q64xqhgh4g@habkost.net>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 06:33:10PM -0300, Eduardo Habkost wrote:
> On Mon, Jun 07, 2021 at 02:58:39PM +0100, Daniel P. Berrangé wrote:
> > This series is motivated by this blog that describes how RHEL-9
> > will recommend use of the x86-64-v2 microarchitectural ABI level:
> > 
> >   https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level/
> > 
> > The implication of compiling code with -march=x86-64-v2 is that
> > this code will no longer be guaranteed to be runnable on a
> > number of the CPU models exposed by the x86_64 target emulator,
> > most notably qemu64 which is the default.
> > 
> > This series is not proposing to change the QEMU default CPU model
> > for x86_64 target. I show how this is can trivially be done in
> > patch 3, but not suggesting that we actually do that, as upstream
> > is quite conservative in dropping support for old host hardware.
> > 
> > New CPU models
> > ==============
> > 
> > It is instead exploring the possibilities of defining new CPU
> > models in QEMU to closely match the x86-64 uarch ABI levels in
> > a relatively vendor agnostic manner. This could be used by
> > downstream vendors who wish to target specific uarch ABI levels
> > in custom machine types.
> > 
> > One of the nice things about "qemu64" is that its naming presents
> > it as effectively being a vendor-neutral model (if we ignore that
> > vendor=AMD is in fact reported in CPUID).
> > 
> > If we look at the feature set fo x86-64-v2 ABI, we see that the
> > QEMU "Nehalem" model is the closest match. This is also happens
> > to be runnable on AMD Opteron G4/G5 and EPYC hosts. None the less,
> > the use of an Intel specific CPU model name on an AMD host feels
> > uncomfortable.
> > 
> > Vendor neutral naming
> > =====================
> > 
> > The idea behind this series is thus to introduce new CPU model
> > names with vendor neutral naming, to more directly correlate
> > with defined x86-64 uarch ABI levels. We don't want to just
> > invent CPUs with a completely arbitrary set of CPU features as
> > history has shown that brings its own problems. eg a guest
> > uses features A and B, but only does CPUID checks for existence
> > of feature B, assuming that B implies A.
> > 
> > The specification for x86-64 ABI levels uses x86-64-vNN naming
> > but this clashes with QEMU's use of "vNN" for versioning. I
> > felt it would be confusing to end up with CPU model names
> > like  "x86-64-v1-v1". Thus I've used an "-abiNNN" suffix
> > instead. Also note I have an "-abi1" suffix here for the
> > baseline. Arguably we could just drop the suffix entirely for
> > the baseline.
> > 
> > A further note is that we could have used "qemu64" as the
> > naming prefix, eg qemu64-abi2, qemu64-abi3, etc. Alot of
> > people hold negative opinions of the qemu64 model in general
> > though, so I felt a clean break with the past might be
> > desirable, even though the x86-64-abi1 CPU  model is effectively
> > identical to qemu64.
> > 
> > Runnability of new models
> > =========================
> > 
> > The goal of the x86-64-abiNNN CPU models is that they should be
> > runnable on any physical host which supports the CPUIDs features
> > for that uarch ABI level. It is hard to figure out what exact
> > set of CPUID features we should report. The uarch ABI document
> > only specifies the minimum expectation, but we can't define a
> > CPU in QEMU using only the minimum set as that would omit
> > countless important features.
> > 
> 
> Do you have a list of features that were not in the ABI document
> but were included in the CPU models you've added?  What exactly
> make them important enough for us, but not important enough for
> the ABI level specification writers?

The ABI specification isn't trying to define a real CPU, so it
doesn't define a full set of features. It is merely setting a
minimum bar, against which vendor specific CPUs are evaluated
for compliance. IOW, there are multiple AMD and Intel CPUs that
satisfy x86-64-abi1. They will all have have a distinct set of
features, but share a common core. The ABI spec is fairly
focused on the various SIMD matrix instructions in particular.

In this QEMU patch meanwhile, we are attempting to define a
real CPU, so need to spec more than just the core featureset.

> In patch 2/3 you wrote:
> 
> | Historically we've found that defining CPU models with an arbitrary
> | combination of CPU features can be problematic, as some guest OS
> | will not check all features they use, and instead assume that if
> | they see feature "XX", then "YY" will always exist. This is reasonable
> | in bare metal, but subject to breakage in virtualization.
> 
> Do we know how likely that is?  Any examples where this has
> happened?

I don't have specific bugs off hand. I just know that the traditional
way libvirt implemented host-model by taking a base model and turning
on/off arbitrary features has been a source of bugs.

> What if we simply used the raw list of features from the
> specification, add those as CPU models experimentally, and let
> people report issues if they find them?  Too risky?  Not useful
> in practice?

Taking ABI level 1.

The combination of level 0 and level 1 ABI specifies
these features:

{'popcnt', 'sse4.1', 'sse', 'mmx', 'ssse3', 'pni', 'cx16', 'fpu', 'sse2', 'sse4.2', 'cx8', 'syscall', 'fxsr', 'cmov', 'lahf-lm'}

The Nehalem CPU which I used as a basis for this level provides 

{'hypervisor', 'pge', 'mmx', 'ssse3', 'kvm-nopiodelay', 'pse', 'de', 'sep', 'tsc', 'nx', 'popcnt', 'mtrr', 'kvm-steal-time', 'apic', 'sse2', 'clflush', 'fxsr', 'sse4.1', 'sse', 'cx16', 'syscall', 'x2apic', 'kvmclock-stable-bit', 'pni', 'kvm-pv-eoi', 'kvmclock', 'kvm-asyncpf', 'vme', 'mce', 'msr', 'mca', 'sse4.2', 'fpu', 'cx8', 'lm', 'pse36', 'pat', 'cmov', 'lahf-lm', 'pae'}

So if we removed all features except those explicitly documented
by the ABI spec we loose:

{'hypervisor', 'pge', 'pse', 'kvm-nopiodelay', 'de', 'sep', 'tsc', 'nx', 'mtrr', 'kvm-steal-time', 'apic', 'clflush', 'x2apic', 'kvmclock-stable-bit', 'kvm-pv-eoi', 'kvmclock', 'kvm-asyncpf', 'vme', 'mce', 'msr', 'mca', 'pse36', 'lm', 'pat', 'pae'}

Many (most) of these are pretty important features IMHO. I don't
think you can define a useful CPU without them.


> Maybe we could provide both a "x86-64-abiNN" and a
> "x86-64-abiNN-minimal" CPU model.  We could even use the -minimal
> CPU model definition to write a test case that ensure the
> algorithm you describe below is always being followed.  The name
> should make it clear that the CPU model is more conservative but
> less likely to be useful.

I don't think the minimal is usable in practice.

> > Thus to determine the feature set to use in x86-64-abiNNN CPU
> > models, this series used a script (see patch 4) which did the
> > following:
> > 
> >   * Find list of current CPU models that satisfy ABI NN
> >   * From this list, calculate the lowest common denominator (LCD)
> >     of CPUID features
> >   * From the LCD, find the existing CPU model that has the fewest
> >     extra features over the LCD.
> >   * Use that closest match, minus the extra features
> >     to define x86-64-abiNN
> > 
> > This approach works well for the baseline ABI, and level 2 ABI
> > 
> > For ABI level 3 there is a bit of a larger divergance in feature
> > sets, because the LCD between Intel and EPYC models is relatively
> > large. We omit aes pcid erms invpcid tsc-deadline x2apic pclmulqdq
> > 
> > For ABI level 4 the divergance is small. I believe this is a
> > deceptive situation that arises because currently only Intel
> > CPUs in QEMU are able to satisfy ABI level 4 currently. None
> > of the EPYC CPUs defined in QEMU are able to satisfy it.
> > 
> > I'm concerned that if future EPYC CPU generations are added to
> > QEMU which *do* indeed satisfy x86-64 v4, then QEMU's x86-64-abi4
> > CPUID may prove to be too greedy and thus be unable to run on
> > the future CPUs. In theory we can address this through use of
> > CPU versioning, but ideally we would not have to deal with that.
> 
> If no AMD CPU model satisfy v4 yet, maybe we should avoid adding
> any feature that is not present in any known AMD CPUs, unless
> they are already required by the ABI level specification.
> Otherwise, the list is likely to contain Intel features that AMD
> has no plans to implement at all.
> 
> Or maybe we should just refrain from adding a x86-64-abi4 CPU
> model until we have a CPU model from AMD that satisfies v4.

I'd probably go for the latter option and just ignore v4.


> > Nested virt caveats
> > ===================
> > 
> > A further caveat is that none of these generic models define
> > any VMX feature set. At the very least I believe this means
> > that nested virt can't live migrate, but maybe this breaks
> > ability to use nested virt entirely. I'm unclear what the
> > best approach is to deal with this, that would let the user
> > do both "-cpu x86-64-abi2,svm=on" and "-cpu x86-64-abi2,vmx=on"
> 
> I don't get this part.  Why can't the CPU model include a VMX
> feature set that is the LCD of the VMX-capable CPUs that satisfy
> abiNN?  The VMX feature set is supposed to be just a default when
> using vmx=on.

Maybe I'm mis-interpreting things. I didn't think it made sense
to define all the VMX capabilities, if the CPU was later intended
to be used with svm=on, but it sounds like you're saying this is
harmless.

> > 
> > Side channel mitigation caveats
> > ===============================
> > 
> > Finally none of the x86-64-abiNN models include any of the
> > features related to CPU side channel mitigations. We can't
> > add them without sacrificing the ability to run on some
> > physical hardware that would otherwise satisfy the uarch
> > ABI level.
> > 
> > This makes me a little uneasy. One of the main downsides
> > of using "qemu64" is that it leaves guests vulnerable to the
> > side channel attacks. Introducing new general purpose CPUs
> > that still have this flaw feels undesirable. I don't know
> > whethe to prioritize safety, while sacrificing runability.
> 
> That's the biggest caveat for me.
> 
> I believe the default should prioritize safety.  I believe you
> implicitly established that runnability is not an absolute
> requirement when you added features that are required by the ABI
> level specification.


The challenge with the side channel mitigations is that the flags
to be exposed are rather vendor specific, so I don't see a way
to define a single CPU that works for both Intel and AMD hosts
and includes the side channel mods.

> > Crypto accelerator caveats
> > ==========================
> > 
> > Similarly I'm not a huge fan of leaving out the "aes"
> > instruction for accelerated crypto, as missing "aes" is
> > also one of the key factors in making qemu64 a bad choice.
> > 
> > If we include 'aes' in x86-64-abi2, then we loose support
> > for Nehalem hosts.
> > 
> > If we include 'aes' in x86-64-abi3 then we further loose
> > support for Dhyana hosts (an EPYC derived CPU).
> > 
> > Wrap up
> > =======
> > 
> > Overall this series shows some CPU models for QEMU that
> > can map to each x86-64 ABI level, but I'm unsure whether
> > it is wise to actually go forward with this idea given
> > the various caveats.
> > 
> > I think they'll mostly only be useful as a built-in default
> > for machine types. If anyone is going to explicitly specify
> > a CPU model they'll almost always be better off picking a
> > vendor specific model or host passthrough. There can be
> > cases where people have a mix of AMD and Intel bare metal
> > machines they need portability across but this feel rare.
> 
> I would prefer to address the problem of poor defaults the
> following way:
> 
> - We should start requiring management software to pass a explicit
>   live-migration-policy argument if live migration needs to work
>   (after documenting that and waiting for the deprecation period,
>   of course).
> - If live migration is not required, we can default to host
>   passthrough.
> - If live migration is required, we should stop providing a
>   default CPU model, and requiring it to be configured
>   explicitly.

I don't think this will make a significant difference, because
libvirt will end up saying live migration is required for
everything it starts, unless libvirt has in turn been told by
a mgmt app that it doesn't need live migration. The biggest
mgmt apps I know (oVirt, OpenStack, KubeVirt) all want live
migration in general. There may be some cases where live
mig is not desired, but I expect it would be 10% or less
of deployments.

> QEMU doesn't have enough information to choose a good CPU model
> default when live migration is required.  Even if we add the
> x86-64-abiNN CPU models in this series, we have no way to decide
> if abi1, abi2, abi3, or abi4 is a better default, do we?

Nope, QEMU doesn't have enough info to choose. The only way I
can see is if the OS vendor decides what their baseline is
going to be. eg Fedora explicitly supports all CPUs right back
to first generation x86_64 chips, so to provide runnability on
all possible Fedora hosts, we need qemu64.  In RHEL-9, it was
decided to compile everything with march=x86_64-abi1, so we
can guarantee that x86_64-abi1 is always runnable on any RHEL9
host, and thus can use that instead of qemu64. 


FWIW, I'm totally fine with saying that this concept of defining
CPUs for x86_64 ABI levels is a failed experiment.

To me the real killers are the lack of side channel mitigations
and lack of AES accelerator instructions. Without those, it just
doesn't feel like we're offering a big enough step up over the
qemu64 CPU. We can't add the side channels as it feels too
vendor specific, and we can't add the AES accel, because there
are physical CPUs satisfying abi1, which don't have AES.

At least the documentation of ABI compatibiltiy levels is useful
though.

Given that my x86_64-abi1 CPU is a copy of Nehalem, if RHEL9
did want a newer CPU default, it could just pick Nehalem as
that.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


