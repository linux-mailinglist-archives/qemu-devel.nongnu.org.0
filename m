Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11951AE642
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Apr 2020 21:51:41 +0200 (CEST)
Received: from localhost ([::1]:51336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPX1Z-0002B1-18
	for lists+qemu-devel@lfdr.de; Fri, 17 Apr 2020 15:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jPX0Z-0001lN-0a
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 15:50:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jPX0W-0005bf-S5
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 15:50:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:52814)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jPX0W-0005Yj-KX
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 15:50:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jPX0U-0005VN-QU
 for <qemu-devel@nongnu.org>; Fri, 17 Apr 2020 19:50:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A25D52E804A
 for <qemu-devel@nongnu.org>; Fri, 17 Apr 2020 19:50:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Apr 2020 19:44:05 -0000
From: Babu Moger <1871842@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: babumoger e-philipp ehabkost imammedo
X-Launchpad-Bug-Reporter: Philipp Eppelt (e-philipp)
X-Launchpad-Bug-Modifier: Babu Moger (babumoger)
References: <158643709116.17430.15995069125716778943.malonedeb@wampee.canonical.com>
 <20200417151432.46867.72601.stgit@localhost.localdomain>
 <20200417191513.GD4952@habkost.net>
Message-Id: <114b32f5-6557-4d94-a212-f44137ccf003@amd.com>
Subject: [Bug 1871842] Re: [PATCH] target/i386: Fix the CPUID leaf
 CPUID_Fn80000008
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 26a7cab97f5b3f9962959c3f561e79b718ec5671
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1871842 <1871842@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/17/20 2:15 PM, Eduardo Habkost wrote:
> Good catch, thanks for the patch.  Comments below:
> =

> On Fri, Apr 17, 2020 at 10:14:32AM -0500, Babu Moger wrote:
>> CPUID leaf CPUID_Fn80000008_ECX provides information about the
>> number of threads supported by the processor. It was found that
>> the field ApicIdSize(bits 15-12) was not set correctly.
>>
>> ApicIdSize is defined as the number of bits required to represent
>> all the ApicId values within a package.
>>
>> Valid Values: Value Description
>> 3h-0h		Reserved.
>> 4h		up to 16 threads.
>> 5h		up to 32 threads.
>> 6h		up to 64 threads.
>> 7h		up to 128 threads.
>> Fh-8h		Reserved.
>>
>> Fix the bit appropriately.
>>
>> This came up during following thread.
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore=
.kernel.org%2Fqemu-devel%2F158643709116.17430.15995069125716778943.malonede=
b%40wampee.canonical.com%2F%23t&amp;data=3D02%7C01%7Cbabu.moger%40amd.com%7=
C1b8d59370cdb403dd54308d7e303adb7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C=
0%7C637227477274521298&amp;sdata=3DNZHLwOkQrbjkGeqYSI0wgRNUd3QHRCf7lBtdqoR5=
XfI%3D&amp;reserved=3D0
>>
>> Refer the Processor Programming Reference (PPR) for AMD Family 17h
>> Model 01h, Revision B1 Processors. The documentation is available
>> from the bugzilla Link below.
>> Link: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D206537&amp;data=3D02%7C01%7Cbab=
u.moger%40amd.com%7C1b8d59370cdb403dd54308d7e303adb7%7C3dd8961fe4884e608e11=
a82d994e183d%7C0%7C0%7C637227477274521298&amp;sdata=3DoNLqu0J49eTrJ8pQ6GKg6=
4ZUDfV3egZN2VVkU0DwMaU%3D&amp;reserved=3D0
>>
>> Reported-by: Philipp Eppelt <1871842@bugs.launchpad.net>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>>  target/i386/cpu.c |   12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 90ffc5f..68210f6 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -5830,11 +5830,17 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t in=
dex, uint32_t count,
>>              *eax =3D cpu->phys_bits;
>>          }
>>          *ebx =3D env->features[FEAT_8000_0008_EBX];
>> -        *ecx =3D 0;
>> -        *edx =3D 0;
>>          if (cs->nr_cores * cs->nr_threads > 1) {
>> -            *ecx |=3D (cs->nr_cores * cs->nr_threads) - 1;
> =

> I'm not sure we want a compatibility flag to keep ABI on older
> machine types, here.  Strictly speaking, CPUID must never change
> on older machine types, but sometimes trying hard to emulate bugs
> of old QEMU versions is a pointless exercise.

Not sure about this. But it seemed like nobody cared about this field befor=
e.
> =

> =

>> +            unsigned int max_apicids, bits_required;
>> +
>> +            max_apicids =3D (cs->nr_cores * cs->nr_threads) - 1;
>> +            /* Find out the number of bits to represent all the apicids=
 */
>> +            bits_required =3D 32 - clz32(max_apicids);
> =

> This won't work if nr_cores > 1 and nr_threads is not a power of
> 2, will it?

It seem to work. Tested with threads=3D5,cores=3D3.

> =

> For reference, the field is documented[1] as:
> =

> "The number of bits in the initial Core::X86::Apic::ApicId[ApicId]
> value that indicate thread ID within a package"
> =

> This sounds like the value already stored at
> CPUX86State::pkg_offset.

Yes, it is already in pkg_offset. We can use it.

> =

> =

>> +            *ecx =3D bits_required << 12 | max_apicids;
> =

> Bits 7:0 are documented as "The number of threads in the package
> is NC+1", with no reference to APIC IDs at all.
> =

> Using ((nr_cores * nr_threads) - 1) for bits 7:0 sounds correct,
> but the variable name seems misleading.

I can change the variable name to num_threads.
> =

> =

>> +        } else {
>> +            *ecx =3D 0;
>>          }
>> +        *edx =3D 0;
>>          break;
>>      case 0x8000000A:
>>          if (env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_SVM) {
>>
>>
> =

> References:
> =

> [1] Processor Programming Reference (PPR) for
>     AMD Family 17h Model 18h, Revision B1 Processors
>     55570-B1 Rev 3.14 - Sep 26, 2019
>     https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fb=
ugzilla.kernel.org%2Fattachment.cgi%3Fid%3D287395%26action%3Dedit&amp;data=
=3D02%7C01%7Cbabu.moger%40amd.com%7C1b8d59370cdb403dd54308d7e303adb7%7C3dd8=
961fe4884e608e11a82d994e183d%7C0%7C0%7C637227477274521298&amp;sdata=3DUsM3h=
4vp3dTgigqOvt7GrGiIUHvH8Kn1g%2BO%2FfGMav%2Bc%3D&amp;reserved=3D0
> =

>

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1871842

Title:
  AMD CPUID leaf 0x8000'0008 reported number of cores  inconsistent with
  ACPI.MADT

Status in QEMU:
  New

Bug description:
  Setup:
  CPU: AMD EPYC-v2 or host's EPYC cpu
  Linux 64-bit fedora host; Kernel version 5.5.15-200.fc31
  qemu version: self build
  git-head: f3bac27cc1e303e1860cc55b9b6889ba39dee587
  config: Configured with: '../configure' '--target-list=3Dx86_64-softmmu,m=
ips64el-softmmu,mips64-softmmu,mipsel-softmmu,mips-softmmu,i386-softmmu,aar=
ch64-softmmu,arm-softmmu' '--prefix=3D/opt/qemu-master'

  Cmdline: =

  qemu-system-x86_64 -kernel /home/peppelt/code/l4/internal/.build-x86_64/b=
in/amd64_gen/bootstrap -append "" -initrd "./fiasco/.build-x86_64/fiasco , =
... " -serial stdio -nographic -monitor none -nographic -monitor none -cpu =
EPYC-v2 -m 4G -smp 4 =


  Issue:
  We are developing an microkernel operating system called L4Re. We recentl=
y got an AMD EPYC server for testing and we couldn't execute SMP tests of o=
ur system when running Linux + qemu + VM w/ L4Re.
  In fact, the kernel did not recognize any APs at all. On AMD CPUs the ker=
nel checks for the number of cores reported in CPUID leaf 0x8000_0008.ECX[N=
C] or [ApicIdSize].  [0][1]

  The physical machine reports for leaf 0x8000_0008:  EAX: 0x3030 EBX: 0x18=
cf757 ECX: 0x703f EDX: 0x1000
  The lower four bits of ECX are the [NC] field and all set.

  When querying inside qemu with -enable-kvm -cpu host -smp 4 (basically as=
 replacement and addition to the above cmdline) the CPUID leaf shows: EAX: =
0x3024, EBX: 0x1001000, ECX: 0x0, EDX: 0x0
  Note, ECX is zero. Indicating that this is no SMP capabale CPU.

  I'm debugging it using my local machine and the QEMU provided EPYC-v2
  CPU model and it is reproducible there as well and reports:  EAX:
  0x3028, EBX: 0x0, ECX: 0x0, EDX: 0x0

  I checked other AMD based CPU models (phenom, opteron_g3/g5) and they beh=
ave the same. [2] shows the CPUID 0x8000'0008 handling in the QEMU source.
  I believe that behavior here is wrong as ECX[NC] should report the number=
 of cores per processor, as stated in the AMD manual [2] p.584. In my under=
standing -smp 4 should then lead to ECX[NC] =3D 0x3.

  The following table shows my findings with the -smp option:
  Option | Qemu guest observed ECX value
  -smp 4 | 0x0
  -smp 4,cores=3D4  | 0x3
  -smp 4,cores=3D2,thread=3D2 | 0x3
  -smp 4,cores=3D4,threads=3D2 | QEMU boot error: topology false.

  Now, I'm asking myself how the terminology of the AMD manual maps to QEMU=
's -smp option.
  Obviously, nr_cores and nr_threads correspond to the cores and threads op=
tions on the cmdline and cores * threads <=3D 4 (in this example), but what=
 corresponds the X in -smp X to?

  Querying 0x8000'0008 on the physical processor results in different
  reports than quering QEMU's model as does it with -enable-kvm -cpu
  host.

  Furthermore, the ACPI.MADT shows 4 local APICs to be present while the
  CPU leave reports a single core processor.

  This leads me to the conclusion that CPUID 0x8000'0008.ECX reports the
  wrong number.

  =

  Please let me know, if you need more information from my side.

  =

  [0] https://github.com/kernkonzept/fiasco/blob/522ccc5f29ab120213cf02d713=
28e2b879cbbd19/src/kern/ia32/kernel_thread-ia32.cpp#L109
  [1] https://github.com/kernkonzept/fiasco/blob/522ccc5f29ab120213cf02d713=
28e2b879cbbd19/src/kern/ia32/cpu-ia32.cpp#L1120
  [2] https://github.com/qemu/qemu/blob/f2a8261110c32c4dccd84e774d8dd7a0524=
e00fb/target/i386/cpu.c#L5835
  [3] https://www.amd.com/system/files/TechDocs/24594.pdf

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1871842/+subscriptions

