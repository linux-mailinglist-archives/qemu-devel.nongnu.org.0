Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7912C11D6BD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 20:03:27 +0100 (CET)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifTkE-0002RU-7X
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 14:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1ifTeo-0005VD-Pr
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 13:57:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1ifTem-0004HW-V9
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 13:57:50 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:13131)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1ifTem-000433-ON
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 13:57:48 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8B42D745706;
 Thu, 12 Dec 2019 19:57:38 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 68ACC7456FE; Thu, 12 Dec 2019 19:57:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 645457456F8;
 Thu, 12 Dec 2019 19:57:38 +0100 (CET)
Date: Thu, 12 Dec 2019 19:57:38 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Wayne Li <waynli329@gmail.com>
Subject: Re: QEMU VM crashes when enabling KVM
In-Reply-To: <CAM2K0no9-M9WRm-QKFBMRofUaNkfmMtDvop3KxrOQrU80YWSTA@mail.gmail.com>
Message-ID: <alpine.BSF.2.21.99999.352.1912121932340.42658@zero.eik.bme.hu>
References: <CAM2K0nrhkOhiJDxnANGmAu2140-TP0a9pY58i_PN1k9xAWGz9A@mail.gmail.com>
 <76b207cd-09ce-b3df-e288-a515df40677e@redhat.com>
 <CAM2K0nph2GZQkAv3tCgoP+ciPMWSzVJp0rHDXJJ2Gtqeq2Bgug@mail.gmail.com>
 <c4e14191-efe5-7713-1eac-55a6bafb027a@redhat.com>
 <CAM2K0no9-M9WRm-QKFBMRofUaNkfmMtDvop3KxrOQrU80YWSTA@mail.gmail.com>
User-Agent: Alpine 2.21.99999 (BSF 352 2019-06-22)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 David Gibson <dgibson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I'm no expert on PPC KVM and don't have much experience with it myself so 
what I say may or may not be correct, it's just my understanding. 
Nevertheless I share it in the hope that it may help and maybe those who 
know will correct me.

> On Thu, Dec 12, 2019 at 1:17 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>> On 12/12/19 02:59, Wayne Li wrote:
>>> We wrote a project that is created on top of the QEMU source code; it
>>> calls functions from the QEMU code.  I run the executable created by
>>> compiling that project/QEMU code.  Anyway, looking at the following
>>> documentation:
>>>
>>> https://www.kernel.org/doc/Documentation/powerpc/cpu_families.txt
>>>
>>> It looks like the PowerPC 7457 is Book3S and the PowerPC e6500 is
>>> BookE.  Is that why you think I require a Book3S KVM?  Exactly why do
>>> you feel this way?  Also would that mean my team would need to go and
>>> buy a board with a Book3S processor?
>>
>> CCing the PPC maintainer.  There are aspects of BookE and Book3S that
>> are different and not really interchangeable in the privileged interface.

It's best to look at the kvm sources in Linux under linux/arch/powerpc/kvm 
or also ask on the appropriate Linux list for KVM specific questions. 
AFAIK KVM between BookE and BookS CPUs doesn't work, at least running 
BookE guest on a BookS host doesn't work which is what we've tried. You 
seem to want the opposite direction: running BookS code on BookE host but 
I think PPC KVM works best on BookS host running BookS code and apart from 
that there's some support for running BookE code on BookE host for e500 
but that's not much supported any more and that's it, other combinations 
are likely untested and don't work. So it's best to have host CPU match 
target (running e500 code on e6500 host or run 7457 code on same or newer 
host CPU, but the more different the host from the guest the most problems 
are to be expected). There are also HV and PR KVM where HV needs new 
enough CPU that supports it (e6500 probably does) but guest CPU cannot be 
different than host with HV KVM. With PR KVM there's some more freedom 
about host and guest as only user space runs on host CPU with privileged 
instructions are software emulated but mixing BookE and BookS is not 
supported even with PR KVM if I'm not mistaken. So you may have better 
luck with some BookS host but I can't tell for sure.

Regrads,
BALATON Zoltan

