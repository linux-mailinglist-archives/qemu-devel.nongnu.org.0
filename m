Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F5C39E925
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 23:34:55 +0200 (CEST)
Received: from localhost ([::1]:49386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqMtW-0008Ac-EG
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 17:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lqMsB-0007TI-3d
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 17:33:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lqMs5-0005KU-7F
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 17:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623101600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gi9SN5q44cdspsTp+WFa91RlV0C2Qj0xzlHFISV0l8s=;
 b=NgjgAuHWK2jSajoqetNOd5bw/sDNVRr2SRorMdiajYKFIo8GvX5rUhvdPHN6IAf3x7jnVD
 TlFK6kfUEHpgQB7e1go2bad70ZxZdrir+zmj4ikarrLJvU0b/Wt5djyDZVwWjRt+lZZatr
 5kuukS7NsrsT044DZ/0l9WpFnOWwNfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-x-PtNmaxPiWwfVw8Sfcz7g-1; Mon, 07 Jun 2021 17:33:17 -0400
X-MC-Unique: x-PtNmaxPiWwfVw8Sfcz7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6585A107ACC7;
 Mon,  7 Jun 2021 21:33:16 +0000 (UTC)
Received: from localhost (ovpn-116-176.gru2.redhat.com [10.97.116.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3D855D9C0;
 Mon,  7 Jun 2021 21:33:12 +0000 (UTC)
Date: Mon, 7 Jun 2021 18:33:10 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 0/4] target/i386/cpu: introduce new CPU models for
 x86-64 ABI levels
Message-ID: <20210607213310.wj2223q64xqhgh4g@habkost.net>
References: <20210607135843.196595-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210607135843.196595-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 02:58:39PM +0100, Daniel P. Berrangé wrote:
> This series is motivated by this blog that describes how RHEL-9
> will recommend use of the x86-64-v2 microarchitectural ABI level:
> 
>   https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level/
> 
> The implication of compiling code with -march=x86-64-v2 is that
> this code will no longer be guaranteed to be runnable on a
> number of the CPU models exposed by the x86_64 target emulator,
> most notably qemu64 which is the default.
> 
> This series is not proposing to change the QEMU default CPU model
> for x86_64 target. I show how this is can trivially be done in
> patch 3, but not suggesting that we actually do that, as upstream
> is quite conservative in dropping support for old host hardware.
> 
> New CPU models
> ==============
> 
> It is instead exploring the possibilities of defining new CPU
> models in QEMU to closely match the x86-64 uarch ABI levels in
> a relatively vendor agnostic manner. This could be used by
> downstream vendors who wish to target specific uarch ABI levels
> in custom machine types.
> 
> One of the nice things about "qemu64" is that its naming presents
> it as effectively being a vendor-neutral model (if we ignore that
> vendor=AMD is in fact reported in CPUID).
> 
> If we look at the feature set fo x86-64-v2 ABI, we see that the
> QEMU "Nehalem" model is the closest match. This is also happens
> to be runnable on AMD Opteron G4/G5 and EPYC hosts. None the less,
> the use of an Intel specific CPU model name on an AMD host feels
> uncomfortable.
> 
> Vendor neutral naming
> =====================
> 
> The idea behind this series is thus to introduce new CPU model
> names with vendor neutral naming, to more directly correlate
> with defined x86-64 uarch ABI levels. We don't want to just
> invent CPUs with a completely arbitrary set of CPU features as
> history has shown that brings its own problems. eg a guest
> uses features A and B, but only does CPUID checks for existence
> of feature B, assuming that B implies A.
> 
> The specification for x86-64 ABI levels uses x86-64-vNN naming
> but this clashes with QEMU's use of "vNN" for versioning. I
> felt it would be confusing to end up with CPU model names
> like  "x86-64-v1-v1". Thus I've used an "-abiNNN" suffix
> instead. Also note I have an "-abi1" suffix here for the
> baseline. Arguably we could just drop the suffix entirely for
> the baseline.
> 
> A further note is that we could have used "qemu64" as the
> naming prefix, eg qemu64-abi2, qemu64-abi3, etc. Alot of
> people hold negative opinions of the qemu64 model in general
> though, so I felt a clean break with the past might be
> desirable, even though the x86-64-abi1 CPU  model is effectively
> identical to qemu64.
> 
> Runnability of new models
> =========================
> 
> The goal of the x86-64-abiNNN CPU models is that they should be
> runnable on any physical host which supports the CPUIDs features
> for that uarch ABI level. It is hard to figure out what exact
> set of CPUID features we should report. The uarch ABI document
> only specifies the minimum expectation, but we can't define a
> CPU in QEMU using only the minimum set as that would omit
> countless important features.
> 

Do you have a list of features that were not in the ABI document
but were included in the CPU models you've added?  What exactly
make them important enough for us, but not important enough for
the ABI level specification writers?


In patch 2/3 you wrote:

| Historically we've found that defining CPU models with an arbitrary
| combination of CPU features can be problematic, as some guest OS
| will not check all features they use, and instead assume that if
| they see feature "XX", then "YY" will always exist. This is reasonable
| in bare metal, but subject to breakage in virtualization.

Do we know how likely that is?  Any examples where this has
happened?

What if we simply used the raw list of features from the
specification, add those as CPU models experimentally, and let
people report issues if they find them?  Too risky?  Not useful
in practice?

Maybe we could provide both a "x86-64-abiNN" and a
"x86-64-abiNN-minimal" CPU model.  We could even use the -minimal
CPU model definition to write a test case that ensure the
algorithm you describe below is always being followed.  The name
should make it clear that the CPU model is more conservative but
less likely to be useful.


> Thus to determine the feature set to use in x86-64-abiNNN CPU
> models, this series used a script (see patch 4) which did the
> following:
> 
>   * Find list of current CPU models that satisfy ABI NN
>   * From this list, calculate the lowest common denominator (LCD)
>     of CPUID features
>   * From the LCD, find the existing CPU model that has the fewest
>     extra features over the LCD.
>   * Use that closest match, minus the extra features
>     to define x86-64-abiNN
> 
> This approach works well for the baseline ABI, and level 2 ABI
> 
> For ABI level 3 there is a bit of a larger divergance in feature
> sets, because the LCD between Intel and EPYC models is relatively
> large. We omit aes pcid erms invpcid tsc-deadline x2apic pclmulqdq
> 
> For ABI level 4 the divergance is small. I believe this is a
> deceptive situation that arises because currently only Intel
> CPUs in QEMU are able to satisfy ABI level 4 currently. None
> of the EPYC CPUs defined in QEMU are able to satisfy it.
> 
> I'm concerned that if future EPYC CPU generations are added to
> QEMU which *do* indeed satisfy x86-64 v4, then QEMU's x86-64-abi4
> CPUID may prove to be too greedy and thus be unable to run on
> the future CPUs. In theory we can address this through use of
> CPU versioning, but ideally we would not have to deal with that.

If no AMD CPU model satisfy v4 yet, maybe we should avoid adding
any feature that is not present in any known AMD CPUs, unless
they are already required by the ABI level specification.
Otherwise, the list is likely to contain Intel features that AMD
has no plans to implement at all.

Or maybe we should just refrain from adding a x86-64-abi4 CPU
model until we have a CPU model from AMD that satisfies v4.

> 
> Nested virt caveats
> ===================
> 
> A further caveat is that none of these generic models define
> any VMX feature set. At the very least I believe this means
> that nested virt can't live migrate, but maybe this breaks
> ability to use nested virt entirely. I'm unclear what the
> best approach is to deal with this, that would let the user
> do both "-cpu x86-64-abi2,svm=on" and "-cpu x86-64-abi2,vmx=on"

I don't get this part.  Why can't the CPU model include a VMX
feature set that is the LCD of the VMX-capable CPUs that satisfy
abiNN?  The VMX feature set is supposed to be just a default when
using vmx=on.

> 
> Side channel mitigation caveats
> ===============================
> 
> Finally none of the x86-64-abiNN models include any of the
> features related to CPU side channel mitigations. We can't
> add them without sacrificing the ability to run on some
> physical hardware that would otherwise satisfy the uarch
> ABI level.
> 
> This makes me a little uneasy. One of the main downsides
> of using "qemu64" is that it leaves guests vulnerable to the
> side channel attacks. Introducing new general purpose CPUs
> that still have this flaw feels undesirable. I don't know
> whethe to prioritize safety, while sacrificing runability.

That's the biggest caveat for me.

I believe the default should prioritize safety.  I believe you
implicitly established that runnability is not an absolute
requirement when you added features that are required by the ABI
level specification.


> 
> Crypto accelerator caveats
> ==========================
> 
> Similarly I'm not a huge fan of leaving out the "aes"
> instruction for accelerated crypto, as missing "aes" is
> also one of the key factors in making qemu64 a bad choice.
> 
> If we include 'aes' in x86-64-abi2, then we loose support
> for Nehalem hosts.
> 
> If we include 'aes' in x86-64-abi3 then we further loose
> support for Dhyana hosts (an EPYC derived CPU).
> 
> Wrap up
> =======
> 
> Overall this series shows some CPU models for QEMU that
> can map to each x86-64 ABI level, but I'm unsure whether
> it is wise to actually go forward with this idea given
> the various caveats.
> 
> I think they'll mostly only be useful as a built-in default
> for machine types. If anyone is going to explicitly specify
> a CPU model they'll almost always be better off picking a
> vendor specific model or host passthrough. There can be
> cases where people have a mix of AMD and Intel bare metal
> machines they need portability across but this feel rare.

I would prefer to address the problem of poor defaults the
following way:

- We should start requiring management software to pass a explicit
  live-migration-policy argument if live migration needs to work
  (after documenting that and waiting for the deprecation period,
  of course).
- If live migration is not required, we can default to host
  passthrough.
- If live migration is required, we should stop providing a
  default CPU model, and requiring it to be configured
  explicitly.

QEMU doesn't have enough information to choose a good CPU model
default when live migration is required.  Even if we add the
x86-64-abiNN CPU models in this series, we have no way to decide
if abi1, abi2, abi3, or abi4 is a better default, do we?

That doesn't mean the CPU models you are adding aren't useful.
They may still be useful for management software or for
downstream vendors to choose their own defaults.

> 
> Whatever else comes of this series, at least patch 1 should
> be useful, giving people an idea of what ABI levels each
> QEMU CPU can satisfy in the documentation.
> 
> Changed in v3:
> 
>  - Rebased to resolve conflicts with git master
> 
> Changed in v2:
> 
>  - Don't document any of the CPU aliases, since they vary per
>    machine type, only the concrete types.
>  - Formally add the script for re-generating the docs
> 
> Daniel P. Berrangé (4):
>   docs: add a table showing x86-64 ABI compatibility levels
>   target/i386: define CPU models to model x86-64 ABI levels
>   scripts: helper to generate x86_64 CPU ABI compat info
>   NOT FOR MERGE target/i386: use x86-64-abi1 CPU model as default on
>     x86_64
> 
>  MAINTAINERS                        |   2 +-
>  docs/system/cpu-models-x86-abi.csv |  75 +++++++++++
>  docs/system/cpu-models-x86.rst.inc |  22 ++++
>  hw/i386/pc_piix.c                  |   3 +
>  hw/i386/pc_q35.c                   |   3 +
>  scripts/cpu-x86-uarch-abi.py       | 194 +++++++++++++++++++++++++++++
>  target/i386/cpu.c                  | 156 +++++++++++++++++++++++
>  target/i386/cpu.h                  |   2 +-
>  8 files changed, 455 insertions(+), 2 deletions(-)
>  create mode 100644 docs/system/cpu-models-x86-abi.csv
>  create mode 100644 scripts/cpu-x86-uarch-abi.py
> 
> -- 
> 2.31.1
> 
> 

-- 
Eduardo


