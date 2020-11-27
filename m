Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE32C63EE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 12:34:58 +0100 (CET)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kic1g-0000ek-NY
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 06:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kic0t-0000Em-UR
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:34:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kic0q-0000hc-FB
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606476843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zg4mZ8Qd8AwBzqjNHt9suZW7yhfvGO+/4zGDD0vVYGg=;
 b=BA5b6drx5m/5oBZlQyywtKCCGa7I/6xdyV1oE1Ih6qG2nTNAq9aMDDtJs4EgrdgkNbKcuj
 GSgFep5LvU8zwpBYKKs77a96lZXiv6qWNyBDOPJFSJtEske1UtAYmXG9a6d2IlykrpDKwk
 sZPWQunrNdvcZGYQN6SeIN9F8iL7e3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-QQWGPgRyN-SKLaA2glWwaw-1; Fri, 27 Nov 2020 06:34:01 -0500
X-MC-Unique: QQWGPgRyN-SKLaA2glWwaw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16B6B184215C;
 Fri, 27 Nov 2020 11:34:00 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D38C96085D;
 Fri, 27 Nov 2020 11:33:58 +0000 (UTC)
Date: Fri, 27 Nov 2020 12:33:56 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [RFC] ich9:cpuhp: add support for cpu hot-unplug with SMI
 broadcast enabled
Message-ID: <20201127123356.7b1349d8@redhat.com>
In-Reply-To: <c7f04e3a-e83a-cd23-aa9d-566ee3ca9f03@oracle.com>
References: <20201124122507.1014839-1-imammedo@redhat.com>
 <20640581-e37d-8783-451c-22627aabb77f@oracle.com>
 <a5bb1550-6253-87eb-87a0-0532725d5d42@redhat.com>
 <c7f04e3a-e83a-cd23-aa9d-566ee3ca9f03@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
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
Cc: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 19:35:30 -0800
Ankur Arora <ankur.a.arora@oracle.com> wrote:

> On 2020-11-26 4:46 a.m., Laszlo Ersek wrote:
> > On 11/26/20 11:24, Ankur Arora wrote: =20
> >> On 2020-11-24 4:25 a.m., Igor Mammedov wrote: =20
> >>> If firmware negotiates ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT feature,
> >>> OSPM on CPU eject will set bit #4 in CPU hotplug block for to be
> >>> ejected CPU to mark it for removal by firmware and trigger SMI
> >>> upcall to let firmware do actual eject.
> >>>
> >>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >>> ---
> >>> PS:
> >>>  =C2=A0=C2=A0 - abuse 5.1 machine type for now to turn off unplug fea=
ture
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0 (it will be moved to 5.2 machine type once =
new merge window is open)
> >>> ---
> >>>  =C2=A0 include/hw/acpi/cpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> >>>  =C2=A0 docs/specs/acpi_cpu_hotplug.txt | 11 +++++++++--
> >>>  =C2=A0 hw/acpi/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++++++=
+++++++--
> >>>  =C2=A0 hw/i386/acpi-build.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++++
> >>>  =C2=A0 hw/i386/pc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 +
> >>>  =C2=A0 hw/isa/lpc_ich9.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> >>>  =C2=A0 6 files changed, 34 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> >>> index 0eeedaa491..999caaf510 100644
> >>> --- a/include/hw/acpi/cpu.h
> >>> +++ b/include/hw/acpi/cpu.h
> >>> @@ -22,6 +22,7 @@ typedef struct AcpiCpuStatus {
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t arch_id;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool is_inserting;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool is_removing;
> >>> +=C2=A0=C2=A0=C2=A0 bool fw_remove;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t ost_event;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t ost_status;
> >>>  =C2=A0 } AcpiCpuStatus;
> >>> @@ -50,6 +51,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object
> >>> *owner,
> >>>  =C2=A0 typedef struct CPUHotplugFeatures {
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool acpi_1_compatible;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_legacy_cphp;
> >>> +=C2=A0=C2=A0=C2=A0 bool fw_unplugs_cpu;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *smi_path;
> >>>  =C2=A0 } CPUHotplugFeatures;
> >>>  =C2=A0 diff --git a/docs/specs/acpi_cpu_hotplug.txt
> >>> b/docs/specs/acpi_cpu_hotplug.txt
> >>> index 9bb22d1270..f68ef6e06c 100644
> >>> --- a/docs/specs/acpi_cpu_hotplug.txt
> >>> +++ b/docs/specs/acpi_cpu_hotplug.txt
> >>> @@ -57,7 +57,11 @@ read access:
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 It's valid only when bit 0 is set.
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 2: Device remove event, used to distinguish device for which
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 no device eject request to OSPM was issued.
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3-7: re=
served and should be ignored by OSPM
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3: rese=
rved and should be ignored by OSPM
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4: if s=
et to 1, OSPM requests firmware to perform device
> >>> eject,
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 firmware shall clear this event by writing 1 into it
> >>> before
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 performing device eject> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 5-7: reserved and
> >>> should be ignored by OSPM
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [0x5-0x7] reserved
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [0x8] Command data: (DWORD access)
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
ontains 0 unless value last stored in 'Command field' is
> >>> one of:
> >>> @@ -82,7 +86,10 @@ write access:
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 selected CPU device
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 3: if set to 1 initiates device eject, set by OSPM when it
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 triggers CPU device removal and calls _EJ0 m=
ethod
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4=
-7: reserved, OSPM must clear them before writing to
> >>> register
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4=
: if set to 1 OSPM hands over device eject to firmware,
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Firmware shall issue device eject request as described
> >>> above
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (bit #3) and OSPM should not touch device eject bit (#3)=
,
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5=
-7: reserved, OSPM must clear them before writing to
> >>> register
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [0x5] Command field: (1 byte access)
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v=
alue:
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0: selects a CPU device with inserting/removing events and
> >>> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> >>> index f099b50927..09d2f20dae 100644
> >>> --- a/hw/acpi/cpu.c
> >>> +++ b/hw/acpi/cpu.c
> >>> @@ -71,6 +71,7 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr
> >>> addr, unsigned size)
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D cdev=
->cpu ? 1 : 0;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D cdev=
->is_inserting ? 2 : 0;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D cdev=
->is_removing=C2=A0 ? 4 : 0;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D cdev->fw_remove=
=C2=A0 ? 16 : 0; =20
> >>
> >> I might be missing something but I don't see where cdev->fw_remove is =
being
> >> set. =20
> >=20
> > See just below, in the cpu_hotplug_wr() hunk. When bit#4 is written --
> > which happens through the ACPI code change --, fw_remove is inverted. =
=20
> Thanks that makes sense. I was reading the AML building code all wrong.
>=20
> >=20
> >  =20
> >> We do set cdev->is_removing in acpi_cpu_unplug_request_cb() so AFAICS
> >> we would always end up setting this bit: =20
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D cdev=
->is_removing=C2=A0 ? 4 : 0; =20
> >>
> >> Also, if cdev->fw_remove and cdev->is_removing are both true, val woul=
d be
> >> (4 | 16). I'm guessing that in that case the AML determines which case=
 gets
> >> handled but it might make sense to set just one of these? =20
> >=20
> > "is_removing" is set directly in response to the device_del QMP command=
.
> > That QMP command is asynchronous to the execution of the guest OS.
> > j
> > "fw_remove" is set (by virtue of inverting) by ACPI CEJ0, which is
> > executed by the guest OS's ACPI interpreter, after the guest OS has
> > de-scheduled all processes from the CPU being removed (=3D basically af=
ter
> > the OS has willfully forgotten about the CPU).
> >=20
> > Therefore, considering the bitmask (is_removing, fw_remove), three
> > variations make sense: =20
>=20
> Just annotating these with the corresponding ACPI code to make sure
> I have it straight. Please correct if my interpretation is wrong. Also,
> a few questions inline:
>=20
> >=20
> > #1 (is_removing=3D0, fw_remove=3D0) -- normal status; no unplug request=
ed
> >=20
> > #2 (is_removing=3D1, fw_remove=3D0) -- unplug requested via QMP, guest =
OS
> >                                     is processing the request =20
>=20
> Guest executes the CSCN method and reads rm_evt (bit 2) (thus noticing
> the is_removing=3D1), and then notifies the CPU to be removed via the
> CTFY method.
>=20
>     ifctx =3D aml_if(aml_equal(rm_evt, one));
>     {
>             aml_append(ifctx,
>                        aml_call2(CPU_NOTIFY_METHOD, uid, eject_req));
>             aml_append(ifctx, aml_store(one, rm_evt));
>             aml_append(ifctx, aml_store(one, has_event));
>     }
>=20
> Then it does a store to rm_evt (bit 2). That would result in clearing
> of is_removing. (Igor mentions that in a separate mail.)
>=20
> 1. Do we need to clear is_removing at all? AFAICS, it's only useful as
> an ack to QEMU and I can't think of why that's useful. OTOH it
> doesn't serve any useful purpose once the guest OS has seen the request.
no firmware doesn't need to care about it, it's consumed by OSPM only
=20
> 2. Would it make sense to clear it first and then call CPU_NOTIFY_METHOD?
> CPU_NOTIFY_METHOD (or _EJ0, COST) don't depend on is_removing but
> that might change in the future.

all methods are protected by be same mutex, so if _EJ0 is called while CSCN
in progress it will wait till CSCN is finished.
But clearing bit #2 before Notify should work too.

=20
> The notify would end up in calling acpi_hotplug_schedule() which would be
> responsible for queuing work (on CPU0) to detach+unplug the CPU.
>=20
> Once the OS level detach succeeds, the worker evaluates the "_EJ0" method
> which would do the actual CPU_EJECT_METHOD work.
>=20
> If the detach fails then it evaluates the CPU_OST_METHOD which updates
> the status for the event and the status.
>=20
> At this point the state is back to:
>=20
> (is_removing=3D0, fw_remove=3D0)
if OSPM fails to release CPU for whatever reasons, it's valid
state, we just notify user using OST event that requested unplug wasn't suc=
cessful.

>=20
> > #3 (is_removing=3D1, fw_remove=3D1) -- guest OS removed all references =
from
> >                                     the CPU, firmware is permitted /
> >                                     required to forget about the CPU as
> >                                     well, and then unplug the CPU =20
>=20
> CPU_EJECT_METHOD will do a store to bit 4, which would invert (and
> thus set) fw_remove and then do the SMI.
>=20
> So, this would be
> > #3 (is_removing=3D0, fw_remove=3D1) =20
>=20
> At this point the firmware calls QemuCPUhpCollectApicIds() which
> (after changes) notices CPU(s) with fw_remove set.
>=20
> Collects them and does a store to bit 4, which would clear fw_remove.

I'd skip this step on firmware side and make QEMU clear it
when CPU is ejected.

>=20
> >=20
> > #4 (is_removing=3D1, fw_remove=3D0) -- fimware is about to unplug the C=
PU
> >=20
> > #5 (is_removing=3D0, fw_remove=3D0) -- firmware performing unplug =20
> Firmware does an unplug and writes to bit 3, thus clearing is_removing.
>=20
> On return from the firmware the guest evaluates the COST again.
it's optional and depends on OSPM implementation (some do not call it on su=
ccess)


> And, eventually goes back to the CSCN where it processes more
> hotplug or unplug events.
CSCN in case of unplug finishes first, and only after that EJ0 calls
are processed

> > The variation (is_removing=3D0, fw_remove=3D1) is invalid / unused. =20
>=20
> /nods
> >=20
> >=20
> > The firmware may be investigating the CPU register block between steps
> > #2 and #3 -- in other words, the firmware may see a CPU for which
> > is_remove is set (unplug requested via QMP), but the OS has not vacated
> > yet (fw_remove=3D0). In that case, the firmware must just skip the CPU =
--
> > once the OS is done, it will set fw_remove too, and raise another SMI. =
=20
> Yeah, it makes sense for the firmware to only care about a CPU once it
> sees fw_remove=3D1. (And as currently situated, the firmware would never
> see is_removing=3D1 at all.)
>=20
>=20
> Thanks
> Ankur
>=20
> >=20
> >  =20
> >>
> >> =20
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace_cpuhp_a=
cpi_read_flags(cpu_st->selector, val);
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case ACPI_CPU_CMD_DATA_OFFSET_RW:
> >>> @@ -148,6 +149,8 @@ static void cpu_hotplug_wr(void *opaque, hwaddr
> >>> addr, uint64_t data,
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 hotplug_ctrl =3D qdev_get_hotplug_handler(dev);
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 hotplug_handler_unplug(hotplug_ctrl, dev, NULL);
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 object_unparent(OBJECT(dev));
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (data & 16) {
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
dev->fw_remove =3D !cdev->fw_remove;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case ACPI_CPU_CMD_OFFSET_WR:
> >>> @@ -332,6 +335,7 @@ const VMStateDescription vmstate_cpu_hotplug =3D =
{
> >>>  =C2=A0 #define CPU_INSERT_EVENT=C2=A0 "CINS"
> >>>  =C2=A0 #define CPU_REMOVE_EVENT=C2=A0 "CRMV"
> >>>  =C2=A0 #define CPU_EJECT_EVENT=C2=A0=C2=A0 "CEJ0"
> >>> +#define CPU_FW_EJECT_EVENT "CEJF"
> >>>  =C2=A0 =C2=A0 void build_cpus_aml(Aml *table, MachineState *machine,
> >>> CPUHotplugFeatures opts,
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwaddr io_base=
,
> >>> @@ -384,7 +388,10 @@ void build_cpus_aml(Aml *table, MachineState
> >>> *machine, CPUHotplugFeatures opts,
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(fi=
eld, aml_named_field(CPU_REMOVE_EVENT, 1));
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* initiates =
device eject, write only */
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(fi=
eld, aml_named_field(CPU_EJECT_EVENT, 1));
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(field, aml_res=
erved_field(4));
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(field, aml_res=
erved_field(1));
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* tell firmware to do de=
vice eject, write only */
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(field, aml_nam=
ed_field(CPU_FW_EJECT_EVENT, 1));
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(field, aml_res=
erved_field(2));
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(fi=
eld, aml_named_field(CPU_COMMAND, 8));
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(cp=
u_ctrl_dev, field);
> >>>  =C2=A0 @@ -419,6 +426,7 @@ void build_cpus_aml(Aml *table, MachineSt=
ate
> >>> *machine, CPUHotplugFeatures opts,
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Aml *ins_evt =
=3D aml_name("%s.%s", cphp_res_path,
> >>> CPU_INSERT_EVENT);
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Aml *rm_evt =
=3D aml_name("%s.%s", cphp_res_path,
> >>> CPU_REMOVE_EVENT);
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Aml *ej_evt =
=3D aml_name("%s.%s", cphp_res_path,
> >>> CPU_EJECT_EVENT);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Aml *fw_ej_evt =3D aml_na=
me("%s.%s", cphp_res_path,
> >>> CPU_FW_EJECT_EVENT);
> >>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_ap=
pend(cpus_dev, aml_name_decl("_HID",
> >>> aml_string("ACPI0010")));
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(cp=
us_dev, aml_name_decl("_CID",
> >>> aml_eisaid("PNP0A05")));
> >>> @@ -461,7 +469,13 @@ void build_cpus_aml(Aml *table, MachineState
> >>> *machine, CPUHotplugFeatures opts,
> >>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 aml_append(method, aml_store(idx, cpu_selector));
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a=
ml_append(method, aml_store(one, ej_evt));
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (opts.fw_unplugs_cpu) {
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(method, aml_store(one, fw_ej_evt));
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(method,
> >>> aml_store(aml_int(OVMF_CPUHP_SMI_CMD),
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 aml_name("%s", opts.smi_path)));
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }=
 else {
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(method, aml_store(one, ej_evt));
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }=
 =20
> >> My knowledge of AML is rather rudimentary but this looks mostly
> >> reasonable to me.
> >>
> >> One question: the corresponding code for CPU hotplug does not send an
> >> SMI_CMD.
> >> Why the difference? =20
> >=20
> > This code (on eject) is executing *after* the OS kernel has processed
> > the event. But on hotplug, the ordering is different (it must be): in
> > that case, the CSCN (scan) method first notifies the firmware, and then
> > the OS.
> >=20
> > Thanks
> > Laszlo
> >  =20
> >>
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(while_ctx,
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_s=
tore(aml_derefof(aml_index(new_cpus,
> >> cpu_idx)),
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uid));
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(while_ctx,
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_c=
all2(CPU_NOTIFY_METHOD, uid, dev_chk));
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(while_ctx, aml_sto=
re(uid, cpu_selector));
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(while_ctx, aml_sto=
re(one, ins_evt));
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(while_ctx, aml_inc=
rement(cpu_idx));
> >>
> >> =20
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 aml_append(method, aml_release(ctrl_lock));
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_append(cp=
us_dev, method);
> >>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >>> index 1f5c211245..475e76f514 100644
> >>> --- a/hw/i386/acpi-build.c
> >>> +++ b/hw/i386/acpi-build.c
> >>> @@ -96,6 +96,7 @@ typedef struct AcpiPmInfo {
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool s4_disabled;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool pcihp_bridge_en;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool smi_on_cpuhp;
> >>> +=C2=A0=C2=A0=C2=A0 bool smi_on_cpu_unplug;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool pcihp_root_en;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t s4_val;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AcpiFadtData fadt;
> >>> @@ -197,6 +198,7 @@ static void acpi_get_pm_info(MachineState
> >>> *machine, AcpiPmInfo *pm)
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm->pcihp_io_base =3D 0;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm->pcihp_io_len =3D 0;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm->smi_on_cpuhp =3D false;
> >>> +=C2=A0=C2=A0=C2=A0 pm->smi_on_cpu_unplug =3D false;
> >>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert(obj);
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 init_common_fadt_data(machine, obj, &=
pm->fadt);
> >>> @@ -220,6 +222,8 @@ static void acpi_get_pm_info(MachineState
> >>> *machine, AcpiPmInfo *pm)
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm->cpu_hp_io=
_base =3D ICH9_CPU_HOTPLUG_IO_BASE;
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm->smi_on_cp=
uhp =3D
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 !!(smi_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT));
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm->smi_on_cpu_unplug =3D
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !=
!(smi_features &
> >>> BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT));
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* The above need not be condi=
tional on machine type because
> >>> the reset port
> >>> @@ -1582,6 +1586,7 @@ build_dsdt(GArray *table_data, BIOSLinker *link=
er,
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPUHotplugFea=
tures opts =3D {
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 .acpi_1_compatible =3D true, .has_legacy_cphp =3D true,
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 .smi_path =3D pm->smi_on_cpuhp ? "\\_SB.PCI0.SMI0.SMIC" :
> >>> NULL,
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .=
fw_unplugs_cpu =3D pm->smi_on_cpu_unplug,
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_cpus_am=
l(dsdt, machine, opts, pm->cpu_hp_io_base,
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "\\_SB.PCI0", "\\_GPE._E02");
> >>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >>> index 17b514d1da..2952a00fe6 100644
> >>> --- a/hw/i386/pc.c
> >>> +++ b/hw/i386/pc.c
> >>> @@ -99,6 +99,7 @@
> >>>  =C2=A0 =C2=A0 GlobalProperty pc_compat_5_1[] =3D {
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { "ICH9-LPC", "x-smi-cpu-hotplug", "o=
ff" },
> >>> +=C2=A0=C2=A0=C2=A0 { "ICH9-LPC", "x-smi-cpu-hotunplug", "off" },
> >>>  =C2=A0 };
> >>>  =C2=A0 const size_t pc_compat_5_1_len =3D G_N_ELEMENTS(pc_compat_5_1=
);
> >>>  =C2=A0 diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> >>> index 087a18d04d..8c667b7166 100644
> >>> --- a/hw/isa/lpc_ich9.c
> >>> +++ b/hw/isa/lpc_ich9.c
> >>> @@ -770,7 +770,7 @@ static Property ich9_lpc_properties[] =3D {
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BIT64("x-smi-cpu-hotplug"=
, ICH9LPCState,
> >>> smi_host_features,
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IC=
H9_LPC_SMI_F_CPU_HOTPLUG_BIT, true),
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BIT64("x-smi-cpu-hotunplu=
g", ICH9LPCState,
> >>> smi_host_features,
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ICH9_LPC_SMI_F=
_CPU_HOT_UNPLUG_BIT, false),
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ICH9_LPC_SMI_F=
_CPU_HOT_UNPLUG_BIT, true),
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_END_OF_LIST(),
> >>>  =C2=A0 };
> >>>    =20
> >>
> >> Thanks for sending out the patch btw. This helped me crystallize some =
of
> >> the
> >> corresponding OVMF code.
> >>
> >> Ankur
> >> =20
> >  =20


