Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D91F2D53
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 12:21:02 +0100 (CET)
Received: from localhost ([::1]:41042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSfqX-0000Tv-Kf
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 06:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47861)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lersek@redhat.com>) id 1iSfpe-0008RR-Ch
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 06:20:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lersek@redhat.com>) id 1iSfpc-00032Q-Ib
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 06:20:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34678
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lersek@redhat.com>) id 1iSfpc-000325-Et
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 06:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573125603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k509fMDcKO1D5GC8l9qmBwU3dAZOoqkFCpjtaVd72b0=;
 b=UXdwjwSc20IBm8FWdR1cEQjKcL7E1ISsTPRBg5B2vliids1PQT9TDpwrDT7Ze5IL8gmL7O
 nru7ktz0nCumdXq4FyR5DaXK5d9SljEeimgA5/tdA0FM1CZt9rIKDTzaTq+hKeL+L0Gm/V
 wGFye+qm690Ea9632mRKlw2EeGFzzTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-qgRn6Nz-N9untrX6qXcuYg-1; Thu, 07 Nov 2019 06:20:00 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D8281800D7A;
 Thu,  7 Nov 2019 11:19:59 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.36.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A6CF5D6B7;
 Thu,  7 Nov 2019 11:19:53 +0000 (UTC)
Subject: Re: privileged entropy sources in QEMU/KVM guests
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <03e769cf-a5ad-99ce-cd28-690e0a72a310@redhat.com>
 <20191107101832.GA2817@work-vm>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <37168ef5-2ae1-4e95-1709-6eddf8f6cc12@redhat.com>
Date: Thu, 7 Nov 2019 12:19:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191107101832.GA2817@work-vm>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: qgRn6Nz-N9untrX6qXcuYg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jian J Wang <jian.j.wang@intel.com>,
 edk2-devel-groups-io <devel@edk2.groups.io>,
 Bret Barkelew <Bret.Barkelew@microsoft.com>,
 qemu devel list <qemu-devel@nongnu.org>, Erik Bjorge <erik.c.bjorge@intel.com>,
 Sean Brogan <sean.brogan@microsoft.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/07/19 11:18, Dr. David Alan Gilbert wrote:
> * Laszlo Ersek (lersek@redhat.com) wrote:
>> Hi,
>>
>> related TianoCore BZ:
>>
>>   https://bugzilla.tianocore.org/show_bug.cgi?id=3D1871
>>
>> (I'm starting this thread separately because at least some of the topics
>> are specific to QEMU, and I didn't want to litter the BZ with a
>> discussion that may not be interesting to all participants CC'd on the
>> BZ. I am keeping people CC'd on this initial posting; please speak up if
>> you'd like to be dropped from the email thread.)
>>
>> QEMU provides guests with the virtio-rng device, and the OVMF and
>> ArmVirtQemu* edk2 platforms build EFI_RNG_PROTOCOL on top of that
>> device. But, that doesn't seem enough for all edk2 use cases.
>>
>> Also, virtio-rng (hence EFI_RNG_PROTOCOL too) is optional, and its
>> absence may affect some other use cases.
>>
>>
>> (1) For UEFI HTTPS boot, TLS would likely benefit from good quality
>> entropy. If the VM config includes virtio-rng (hence the guest firmware
>> has EFI_RNG_PROTOCOL), then it should be used as a part of HTTPS boot.
>>
>> However, what if virtio-rng (hence EFI_RNG_PROTOCOL) are absent? Should
>> UEFI HTTPS boot be disabled completely (or prevented / rejected
>> somehow), blaming lack of good entropy? Or should TLS silently fall back
>> to "mixing some counters [such as TSC] together and applying a
>> deterministic cryptographic transformation"?
>>
>> IOW, knowing that the TLS setup may not be based on good quality
>> entropy, should we allow related firmware services to "degrade silently"
>> (not functionally, but potentially in security), or should we deny the
>> services altogether?
>=20
> I don't see a downside to insisting that if you want to use https then
> you must provide an entropy source; they're easy enough to add using
> virtio-rng if the CPU doesn't provide it.

Possibly true; however it could be considered a usability regression by
end-users. ("UEFI HTTPS boot used to work, now it breaks with the same
VM config". Unless we can respond, "UEFI HTTPS boot's TLS init has never
been secure enough", they'll have a point. See also Ard's followup.)

>=20
>>
>> (2) It looks like the SMM driver implementing the privileged part of the
>> UEFI variable runtime service could need access to good quality entropy,
>> while running in SMM; in the future.
>>
>> This looks problematic on QEMU. Entropy is a valuable resource, and
>> whatever resource SMM drivers depend on, should not be possible for e.g.
>> a 3rd party UEFI driver (or even for the runtime OS) to exhaust.
>> Therefore, it's not *only* the case that SMM drivers must not consume
>> EFI_RNG_PROTOCOL (which exists at a less critical privilege level, i.e.
>> outside of SMM/SMRAM), but also that SMM drivers must not depend on the
>> same piece of *hardware* that feeds EFI_RNG_PROTOCOL.
>>
>> Furthermore, assuming we dedicate a hardware entropy device specifically
>> to SMM drivers, such a device cannot be PCI(e). It would have to be a
>> platform device at a fixed location (IO port or MMIO) that is only
>> accessible to such guest code that executes in SMM. IOW, device access
>> would have to be restricted similarly to pflash. (In fact the variable
>> SMM driver will need, AIUI, the entropy for encrypting various variable
>> contents, which are then written into pflash.)
>=20
> Ewww.  I guess a virtio-rng instance wired to virtio-mmio could do that.
> It's a bit grim though.

*shudder* please let's keep virtio-mmio (or any remotely enumerable /
complex "bus" thingy) out of this :( I'm all for extensible hardware
interfaces, but cramming more and more infrastructure code into SMM
looks very questionable to me.

My main concern here is that most physical platform vendors will just
solder some physical entropy-gen chip onto their boards, and then
hard-code the MMIO base address of that as a build-time constant in
their firmware blobs. This obviously won't work for QEMU, where the hw
can change from boot to boot; so the generic edk2 solution (regardless
of the actual chip) need to allow for that kind of dynamism. This is a
recurrent problem between QEMU and edk2, alas. The answer is of course
dynamic detection, but I *still* like to keep the enumeration logic to
the absolute minimum in SMM.

Thanks!
Laszlo

>=20
> Dave
>=20
>> Alternatively, CPU instructions could exist that return entropy, and are
>> executable only inside SMM. It seems that e.g. RDRAND can be trapped in
>> guests ("A VMEXIT due to RDRAND will have exit reason 57 (decimal)").
>> Then KVM / QEMU could provide any particular implementation we wanted --
>> for example an exception could be injected unless RDRAND had been
>> executed from within SMM. Unfortunately, such an arbitrary restriction
>> (of RDRAND to SMM) would diverge from the Intel SDM, and would likely
>> break other (non-SMM) guest code.
>>
>> Does a platform device that is dynamically detectable and usable in SMM
>> only seem like an acceptable design for QEMU?
>>
>> Thanks,
>> Laszlo
>>
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>=20


