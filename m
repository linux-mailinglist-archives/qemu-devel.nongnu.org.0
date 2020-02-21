Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725BB167A9E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 11:21:03 +0100 (CET)
Received: from localhost ([::1]:54902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j55Qc-00080q-I6
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 05:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44555)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j55Ps-0007Vw-16
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 05:20:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j55Pp-0007nt-Tj
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 05:20:15 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34478
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j55Pp-0007mI-Hu
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 05:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582280412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=c8mSTU3faJNIAENF2ubZcoP8J0ePq6kL9kBy8MrDXTA=;
 b=PmTB3zyoDZsUh77lFpX3nyyGsigLIk+Py/yfR9M+ra61POIvgt68z0rI8gRnb+FDBWbKH/
 8AYZqQVp7Oj935e2OYlK1Ob2eTUCqRcxpEU1spwYv6zw13AMSrF1TfJrrR2otcPridquYt
 McKPMYGgIU/kUtI01mEL+MQD8tluBfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-qdCOfnz_MgqMaXpnf-J6Bw-1; Fri, 21 Feb 2020 05:20:10 -0500
X-MC-Unique: qdCOfnz_MgqMaXpnf-J6Bw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CBB9DB69;
 Fri, 21 Feb 2020 10:20:09 +0000 (UTC)
Received: from [10.36.117.197] (ovpn-117-197.ams2.redhat.com [10.36.117.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 975BD19756;
 Fri, 21 Feb 2020 10:19:59 +0000 (UTC)
Subject: Re: [PATCH v1 05/13] migrate/ram: Handle RAM block resizes during
 precopy
From: David Hildenbrand <david@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <20200219161725.115218-1-david@redhat.com>
 <20200219161725.115218-6-david@redhat.com>
 <3c3d4d50-a30d-b4e9-6256-4656f4e78cf6@redhat.com>
 <20200220201719.GC15253@xz-x1>
 <f72b81f6-1972-12b5-8113-95dc4094205b@redhat.com>
 <eacd48d3-4bce-bdd4-941d-3c098cb29034@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <81ca5783-97d5-555c-c361-9b5b0ec144b3@redhat.com>
Date: Fri, 21 Feb 2020 11:19:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <eacd48d3-4bce-bdd4-941d-3c098cb29034@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Shannon Zhao <shannon.zhao@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.02.20 11:10, David Hildenbrand wrote:
> On 21.02.20 10:18, David Hildenbrand wrote:
>> On 20.02.20 21:17, Peter Xu wrote:
>>> On Thu, Feb 20, 2020 at 04:16:02PM +0100, David Hildenbrand wrote:
>>>> On 19.02.20 17:17, David Hildenbrand wrote:
>>>>> Resizing while migrating is dangerous and does not work as expected.
>>>>> The whole migration code works on the usable_length of ram blocks and=
 does
>>>>> not expect this to change at random points in time.
>>>>>
>>>>> In the case of precopy, the ram block size must not change on the sou=
rce,
>>>>> after syncing the RAM block list in ram_save_setup(), so as long as t=
he
>>>>> guest is still running on the source.
>>>>>
>>>>> Resizing can be trigger *after* (but not during) a reset in
>>>>> ACPI code by the guest
>>>>> - hw/arm/virt-acpi-build.c:acpi_ram_update()
>>>>> - hw/i386/acpi-build.c:acpi_ram_update()
>>>>>
>>>>> Use the ram block notifier to get notified about resizes. Let's simpl=
y
>>>>> cancel migration and indicate the reason. We'll continue running on t=
he
>>>>> source. No harm done.
>>>>>
>>>>> Update the documentation. Postcopy will be handled separately.
>>>>>
>>>>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>>>> Cc: Juan Quintela <quintela@redhat.com>
>>>>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>>>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>>>> Cc: Shannon Zhao <shannon.zhao@linaro.org>
>>>>> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>> Cc: Peter Xu <peterx@redhat.com>
>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>> ---
>>>>>  exec.c                |  5 +++--
>>>>>  include/exec/memory.h | 10 ++++++----
>>>>>  migration/migration.c |  9 +++++++--
>>>>>  migration/migration.h |  1 +
>>>>>  migration/ram.c       | 41 +++++++++++++++++++++++++++++++++++++++++
>>>>>  5 files changed, 58 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/exec.c b/exec.c
>>>>> index b75250e773..8b015821d6 100644
>>>>> --- a/exec.c
>>>>> +++ b/exec.c
>>>>> @@ -2120,8 +2120,9 @@ static int memory_try_enable_merging(void *addr=
, size_t len)
>>>>>      return qemu_madvise(addr, len, QEMU_MADV_MERGEABLE);
>>>>>  }
>>>>> =20
>>>>> -/* Only legal before guest might have detected the memory size: e.g.=
 on
>>>>> - * incoming migration, or right after reset.
>>>>> +/*
>>>>> + * Resizing RAM while migrating can result in the migration being ca=
nceled.
>>>>> + * Care has to be taken if the guest might have already detected the=
 memory.
>>>>>   *
>>>>>   * As memory core doesn't know how is memory accessed, it is up to
>>>>>   * resize callback to update device state and/or add assertions to d=
etect
>>>>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>>>>> index e85b7de99a..de111347e8 100644
>>>>> --- a/include/exec/memory.h
>>>>> +++ b/include/exec/memory.h
>>>>> @@ -113,7 +113,7 @@ typedef struct IOMMUNotifier IOMMUNotifier;
>>>>>  #define RAM_SHARED     (1 << 1)
>>>>> =20
>>>>>  /* Only a portion of RAM (used_length) is actually used, and migrate=
d.
>>>>> - * This used_length size can change across reboots.
>>>>> + * Resizing RAM while migrating can result in the migration being ca=
nceled.
>>>>>   */
>>>>>  #define RAM_RESIZEABLE (1 << 2)
>>>>> =20
>>>>> @@ -843,7 +843,9 @@ void memory_region_init_ram_shared_nomigrate(Memo=
ryRegion *mr,
>>>>>   *                                     RAM.  Accesses into the regio=
n will
>>>>>   *                                     modify memory directly.  Only=
 an initial
>>>>>   *                                     portion of this RAM is actual=
ly used.
>>>>> - *                                     The used size can change acro=
ss reboots.
>>>>> + *                                     Changing the size while migra=
ting
>>>>> + *                                     can result in the migration b=
eing
>>>>> + *                                     canceled.
>>>>>   *
>>>>>   * @mr: the #MemoryRegion to be initialized.
>>>>>   * @owner: the object that tracks the region's reference count
>>>>> @@ -1464,8 +1466,8 @@ void *memory_region_get_ram_ptr(MemoryRegion *m=
r);
>>>>> =20
>>>>>  /* memory_region_ram_resize: Resize a RAM region.
>>>>>   *
>>>>> - * Only legal before guest might have detected the memory size: e.g.=
 on
>>>>> - * incoming migration, or right after reset.
>>>>> + * Resizing RAM while migrating can result in the migration being ca=
nceled.
>>>>> + * Care has to be taken if the guest might have already detected the=
 memory.
>>>>>   *
>>>>>   * @mr: a memory region created with @memory_region_init_resizeable_=
ram.
>>>>>   * @newsize: the new size the region
>>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>>> index 8fb68795dc..ac9751dbe5 100644
>>>>> --- a/migration/migration.c
>>>>> +++ b/migration/migration.c
>>>>> @@ -175,13 +175,18 @@ void migration_object_init(void)
>>>>>      }
>>>>>  }
>>>>> =20
>>>>> +void migration_cancel(void)
>>>>> +{
>>>>> +    migrate_fd_cancel(current_migration);
>>>>> +}
>>>>> +
>>>>>  void migration_shutdown(void)
>>>>>  {
>>>>>      /*
>>>>>       * Cancel the current migration - that will (eventually)
>>>>>       * stop the migration using this structure
>>>>>       */
>>>>> -    migrate_fd_cancel(current_migration);
>>>>> +    migration_cancel();
>>>>>      object_unref(OBJECT(current_migration));
>>>>>  }
>>>>> =20
>>>>> @@ -2019,7 +2024,7 @@ void qmp_migrate(const char *uri, bool has_blk,=
 bool blk,
>>>>> =20
>>>>>  void qmp_migrate_cancel(Error **errp)
>>>>>  {
>>>>> -    migrate_fd_cancel(migrate_get_current());
>>>>> +    migration_cancel();
>>>>>  }
>>>>> =20
>>>>>  void qmp_migrate_continue(MigrationStatus state, Error **errp)
>>>>> diff --git a/migration/migration.h b/migration/migration.h
>>>>> index 8473ddfc88..79fd74afa5 100644
>>>>> --- a/migration/migration.h
>>>>> +++ b/migration/migration.h
>>>>> @@ -343,5 +343,6 @@ int foreach_not_ignored_block(RAMBlockIterFunc fu=
nc, void *opaque);
>>>>>  void migration_make_urgent_request(void);
>>>>>  void migration_consume_urgent_request(void);
>>>>>  bool migration_rate_limit(void);
>>>>> +void migration_cancel(void);
>>>>> =20
>>>>>  #endif
>>>>> diff --git a/migration/ram.c b/migration/ram.c
>>>>> index ed23ed1c7c..57f32011a3 100644
>>>>> --- a/migration/ram.c
>>>>> +++ b/migration/ram.c
>>>>> @@ -52,6 +52,7 @@
>>>>>  #include "migration/colo.h"
>>>>>  #include "block.h"
>>>>>  #include "sysemu/sysemu.h"
>>>>> +#include "sysemu/runstate.h"
>>>>>  #include "savevm.h"
>>>>>  #include "qemu/iov.h"
>>>>>  #include "multifd.h"
>>>>> @@ -3710,8 +3711,48 @@ static SaveVMHandlers savevm_ram_handlers =3D =
{
>>>>>      .resume_prepare =3D ram_resume_prepare,
>>>>>  };
>>>>> =20
>>>>> +static void ram_mig_ram_block_resized(RAMBlockNotifier *n, void *hos=
t,
>>>>> +                                      size_t old_size, size_t new_si=
ze)
>>>>> +{
>>>>> +    ram_addr_t offset;
>>>>> +    Error *err =3D NULL;
>>>>> +    RAMBlock *rb =3D qemu_ram_block_from_host(host, false, &offset);
>>>>> +
>>>>> +    if (ramblock_is_ignored(rb)) {
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    /*
>>>>> +     * Some resizes are triggered on the migration target by precopy=
 code,
>>>>> +     * when synchronizing RAM block sizes. In these cases, the VM is=
 not
>>>>> +     * running and migration is not idle. We have to ignore these re=
sizes,
>>>>> +     * as we only care about resizes during precopy on the migration=
 source.
>>>>> +     * This handler is always registered, so ignore when migration i=
s idle.
>>>>> +     */
>>>>> +    if (migration_is_idle() || !runstate_is_running() ||
>>>
>>> So I noticed that I mis-misread the code after chat with Dave...
>>>
>>> migration_is_idle() should only return false if on the source and only
>>> if during migration.  Destination should still return true for that
>>> (destination VM reads state from MigrationIncomingState.state
>>> instead).
>>>
>>> With that, I think we can drop the confusing !runstate_is_running()
>>> check because migration_is_idle() will cover that (and touch up the
>>> comment too)?
>>
>> So, we want to cancel migration whenever we are on the source and we are
>> migrating (postcopy). Resizing will only happen while the VM is running
>> on the source once we're migrating.
>>
>> So you're saying that
>>
>> if (migration_is_idle() || postcopy_is_running()) {
>> =09return:
>> }
>>
>> is enough. Will migration_is_idle() always return true on the
>> destination (I remember something different, but might be *I* misread
>> the code)?
>>
>> Then this would distill down to
>>
>> if (migration_is_idle()) {
>> =09return:
>> }
>>
>> Which would be nice.
>=20
> ... but looking at process_incoming_migration_co(), we'll set the state
> to MIGRATION_STATUS_ACTIVE right at the start.
>=20
>=20
> So dropping postcopy_is_running() would be wrong and dropping
> !runstate_is_running() would be wrong as well right now.
>=20
> What we actually want is
>=20
> if (!migration_outgoing()) {
> =09return;
> }
>=20
> Any experts?
>=20

Lol, man this code is confusing.

So, migration_is_idle() really only checks current_migration, not
current_incoming.

I didn't expect to be knees deep in migration code at this point ...

if (migration_is_idle()) {
=09return:
}

works. Thanks!

--=20
Thanks,

David / dhildenb


