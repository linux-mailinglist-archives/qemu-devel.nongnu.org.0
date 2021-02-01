Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F8730AB99
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:39:29 +0100 (CET)
Received: from localhost ([::1]:52934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bIW-0000L5-Hm
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6bFc-0005gf-9P
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:36:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6bFa-0001pI-1V
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612193785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CMK9vNXgskJMwfEi4RBBSfJMTax7y4zWAatQrNsxpsY=;
 b=RQGbdMFtl8Ue4/P8ycJWZTLRlq8mbKcJLoeL7RfYRzwlj8WsQLEoMCN7XAYPXmNfAX++OB
 hyTri8eju0XD3JFTRX9aV/nAgY3oH6GmK9TZR4SzKZgPPMQmInEqAoZP2MZN9PX1YYmvrR
 +6tjqUC8UMlC5sqgDZsW1xbRPm+9qGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-8RgU96rLMRaer_2jH3_0AA-1; Mon, 01 Feb 2021 10:36:21 -0500
X-MC-Unique: 8RgU96rLMRaer_2jH3_0AA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E448800D53;
 Mon,  1 Feb 2021 15:36:20 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-195.ams2.redhat.com
 [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E47C5D6BA;
 Mon,  1 Feb 2021 15:36:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 0/4] target/i386/cpu: introduce new CPU models for x86-64
 ABI levels
Date: Mon,  1 Feb 2021 15:36:02 +0000
Message-Id: <20210201153606.4158076-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Florian Weimer <fweimer@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series is motivated by this blog that describes how RHEL-9=0D
will recommend use of the x86-64-v2 microarchitectural ABI level:=0D
=0D
  https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise=
-l=3D=0D
inux-9-for-the-x86-64-v2-microarchitecture-level/=0D
=0D
The implication of compiling code with -march=3D3Dx86-64-v2 is that=0D
this code will no longer be guaranteed to be runnable on a=0D
number of the CPU models exposed by the x86_64 target emulator,=0D
most notably qemu64 which is the default.=0D
=0D
This series is not proposing to change the QEMU default CPU model=0D
for x86_64 target. I show how this is can trivially be done in=0D
patch 3, but not suggesting that we actually do that, as upstream=0D
is quite conservative in dropping support for old host hardware.=0D
=0D
New CPU models=0D
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=0D
=0D
It is instead exploring the possibilities of defining new CPU=0D
models in QEMU to closely match the x86-64 uarch ABI levels in=0D
a relatively vendor agnostic manner. This could be used by=0D
downstream vendors who wish to target specific uarch ABI levels=0D
in custom machine types.=0D
=0D
One of the nice things about "qemu64" is that its naming presents=0D
it as effectively being a vendor-neutral model (if we ignore that=0D
vendor=3D3DAMD is in fact reported in CPUID).=0D
=0D
If we look at the feature set fo x86-64-v2 ABI, we see that the=0D
QEMU "Nehalem" model is the closest match. This is also happens=0D
to be runnable on AMD Opteron G4/G5 and EPYC hosts. None the less,=0D
the use of an Intel specific CPU model name on an AMD host feels=0D
uncomfortable.=0D
=0D
Vendor neutral naming=0D
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=0D
=0D
The idea behind this series is thus to introduce new CPU model=0D
names with vendor neutral naming, to more directly correlate=0D
with defined x86-64 uarch ABI levels. We don't want to just=0D
invent CPUs with a completely arbitrary set of CPU features as=0D
history has shown that brings its own problems. eg a guest=0D
uses features A and B, but only does CPUID checks for existence=0D
of feature B, assuming that B implies A.=0D
=0D
The specification for x86-64 ABI levels uses x86-64-vNN naming=0D
but this clashes with QEMU's use of "vNN" for versioning. I=0D
felt it would be confusing to end up with CPU model names=0D
like  "x86-64-v1-v1". Thus I've used an "-abiNNN" suffix=0D
instead. Also note I have an "-abi1" suffix here for the=0D
baseline. Arguably we could just drop the suffix entirely for=0D
the baseline.=0D
=0D
A further note is that we could have used "qemu64" as the=0D
naming prefix, eg qemu64-abi2, qemu64-abi3, etc. Alot of=0D
people hold negative opinions of the qemu64 model in general=0D
though, so I felt a clean break with the past might be=0D
desirable, even though the x86-64-abi1 CPU  model is effectively=0D
identical to qemu64.=0D
=0D
Runnability of new models=0D
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=0D
=0D
The goal of the x86-64-abiNNN CPU models is that they should be=0D
runnable on any physical host which supports the CPUIDs features=0D
for that uarch ABI level. It is hard to figure out what exact=0D
set of CPUID features we should report. The uarch ABI document=0D
only specifies the minimum expectation, but we can't define a=0D
CPU in QEMU using only the minimum set as that would omit=0D
countless important features.=0D
=0D
Thus to determine the feature set to use in x86-64-abiNNN CPU=0D
models, this series used a script (see patch 4) which did the=0D
following:=0D
=0D
  * Find list of current CPU models that satisfy ABI NN=0D
  * From this list, calculate the lowest common denominator (LCD)=0D
    of CPUID features=0D
  * From the LCD, find the existing CPU model that has the fewest=0D
    extra features over the LCD.=0D
  * Use that closest match, minus the extra features=0D
    to define x86-64-abiNN=0D
=0D
This approach works well for the baseline ABI, and level 2 ABI=0D
=0D
For ABI level 3 there is a bit of a larger divergance in feature=0D
sets, because the LCD between Intel and EPYC models is relatively=0D
large. We omit aes pcid erms invpcid tsc-deadline x2apic pclmulqdq=0D
=0D
For ABI level 4 the divergance is small. I believe this is a=0D
deceptive situation that arises because currently only Intel=0D
CPUs in QEMU are able to satisfy ABI level 4 currently. None=0D
of the EPYC CPUs defined in QEMU are able to satisfy it.=0D
=0D
I'm concerned that if future EPYC CPU generations are added to=0D
QEMU which *do* indeed satisfy x86-64 v4, then QEMU's x86-64-abi4=0D
CPUID may prove to be too greedy and thus be unable to run on=0D
the future CPUs. In theory we can address this through use of=0D
CPU versioning, but ideally we would not have to deal with that.=0D
=0D
Nested virt caveats=0D
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=
=3D3D=3D3D=3D3D=3D3D=0D
=0D
A further caveat is that none of these generic models define=0D
any VMX feature set. At the very least I believe this means=0D
that nested virt can't live migrate, but maybe this breaks=0D
ability to use nested virt entirely. I'm unclear what the=0D
best approach is to deal with this, that would let the user=0D
do both "-cpu x86-64-abi2,svm=3D3Don" and "-cpu x86-64-abi2,vmx=3D3Don"=0D
=0D
Side channel mitigation caveats=0D
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D=0D
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=0D
=0D
Finally none of the x86-64-abiNN models include any of the=0D
features related to CPU side channel mitigations. We can't=0D
add them without sacrificing the ability to run on some=0D
physical hardware that would otherwise satisfy the uarch=0D
ABI level.=0D
=0D
This makes me a little uneasy. One of the main downsides=0D
of using "qemu64" is that it leaves guests vulnerable to the=0D
side channel attacks. Introducing new general purpose CPUs=0D
that still have this flaw feels undesirable. I don't know=0D
whethe to prioritize safety, while sacrificing runability.=0D
=0D
Crypto accelerator caveats=0D
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=0D
=0D
Similarly I'm not a huge fan of leaving out the "aes"=0D
instruction for accelerated crypto, as missing "aes" is=0D
also one of the key factors in making qemu64 a bad choice.=0D
=0D
If we include 'aes' in x86-64-abi2, then we loose support=0D
for Nehalem hosts.=0D
=0D
If we include 'aes' in x86-64-abi3 then we further loose=0D
support for Dhyana hosts (an EPYC derived CPU).=0D
=0D
Wrap up=0D
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=0D
=0D
Overall this series shows some CPU models for QEMU that=0D
can map to each x86-64 ABI level, but I'm unsure whether=0D
it is wise to actually go forward with this idea given=0D
the various caveats above.=0D
=0D
I think they'll mostly only be useful as a built-in default=0D
for machine types. If anyone is going to explicitly specify=0D
a CPU model they'll almost always be better off picking a=0D
vendor specific model or host passthrough. There can be=0D
cases where people have a mix of AMD and Intel bare metal=0D
machines they need portability across but this feel rare.=0D
=0D
Whatever else comes of this series, at least patch 1 should=0D
be useful, giving people an idea of what ABI levels each=0D
QEMU CPU can satisfy in the documentation.=0D
=0D
Daniel P. Berrang=3DC3=3DA9 (4):=0D
  docs: add a table showing x86-64 ABI compatibility levels=0D
  target/i386: define CPU models to model x86-64 ABI levels=0D
  NOT FOR MERGE target/i386: use x86-64-abi1 CPU model as default on=0D
    x86_64=0D
  NOT FOR MERGE: script for CPU model stuff related to x86-64 ABI levels=0D
=0D
 MAINTAINERS                        |   2 +-=0D
 docs/system/cpu-models-x86-abi.csv | 129 +++++++++++++++++++=0D
 docs/system/cpu-models-x86.rst.inc |  18 +++=0D
 hw/i386/pc_piix.c                  |   3 +=0D
 hw/i386/pc_q35.c                   |   3 +=0D
 scripts/cpu-x86-uarch-abi.py       | 194 +++++++++++++++++++++++++++++=0D
 target/i386/cpu.c                  | 156 +++++++++++++++++++++++=0D
 target/i386/cpu.h                  |   2 +-=0D
 8 files changed, 505 insertions(+), 2 deletions(-)=0D
 create mode 100644 docs/system/cpu-models-x86-abi.csv=0D
 create mode 100644 scripts/cpu-x86-uarch-abi.py=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


