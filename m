Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84998168146
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 16:17:27 +0100 (CET)
Received: from localhost ([::1]:59562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5A3S-0006F7-K4
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 10:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60872)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j5A1I-00052f-E9
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 10:15:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j5A1F-0000UV-OA
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 10:15:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47927
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j5A1F-0000Te-J0
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 10:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582298108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uTG4/15rK4FE9jhreYjIh+knHd/iEu3xJyJAukuG+Q4=;
 b=N7w9eJSajUgWaoe0wW8p4H+z7AhedTj7WhosDTALNcCTtzbi1xaB6W+Bq+yDcuMgR97bUN
 JqPun0YBQzTAu4AwdG2kUc42pu1aCT9Y167YNaa3gnJZU8SF28FYkZrPM5wJKsL6cH3OH0
 X452HjzPEEgebkop/imiIqoTwcmAo9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-zYzEfPX9NjG5jDXE6TyJ4A-1; Fri, 21 Feb 2020 10:15:05 -0500
X-MC-Unique: zYzEfPX9NjG5jDXE6TyJ4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2784094DF3;
 Fri, 21 Feb 2020 15:15:00 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CA996E3EE;
 Fri, 21 Feb 2020 15:14:49 +0000 (UTC)
Date: Fri, 21 Feb 2020 15:14:47 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 05/13] migrate/ram: Handle RAM block resizes during
 precopy
Message-ID: <20200221151447.GF2931@work-vm>
References: <20200219161725.115218-1-david@redhat.com>
 <20200219161725.115218-6-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200219161725.115218-6-david@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> Resizing while migrating is dangerous and does not work as expected.
> The whole migration code works on the usable_length of ram blocks and doe=
s
> not expect this to change at random points in time.
>=20
> In the case of precopy, the ram block size must not change on the source,
> after syncing the RAM block list in ram_save_setup(), so as long as the
> guest is still running on the source.
>=20
> Resizing can be trigger *after* (but not during) a reset in
> ACPI code by the guest
> - hw/arm/virt-acpi-build.c:acpi_ram_update()
> - hw/i386/acpi-build.c:acpi_ram_update()
>=20
> Use the ram block notifier to get notified about resizes. Let's simply
> cancel migration and indicate the reason. We'll continue running on the
> source. No harm done.
>=20
> Update the documentation. Postcopy will be handled separately.
>=20
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Shannon Zhao <shannon.zhao@linaro.org>
> Cc: Alex Benn=E9e <alex.bennee@linaro.org>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  exec.c                |  5 +++--
>  include/exec/memory.h | 10 ++++++----
>  migration/migration.c |  9 +++++++--
>  migration/migration.h |  1 +
>  migration/ram.c       | 41 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 58 insertions(+), 8 deletions(-)
>=20
> diff --git a/exec.c b/exec.c
> index b75250e773..8b015821d6 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2120,8 +2120,9 @@ static int memory_try_enable_merging(void *addr, si=
ze_t len)
>      return qemu_madvise(addr, len, QEMU_MADV_MERGEABLE);
>  }
> =20
> -/* Only legal before guest might have detected the memory size: e.g. on
> - * incoming migration, or right after reset.
> +/*
> + * Resizing RAM while migrating can result in the migration being cancel=
ed.
> + * Care has to be taken if the guest might have already detected the mem=
ory.
>   *
>   * As memory core doesn't know how is memory accessed, it is up to
>   * resize callback to update device state and/or add assertions to detec=
t
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index e85b7de99a..de111347e8 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -113,7 +113,7 @@ typedef struct IOMMUNotifier IOMMUNotifier;
>  #define RAM_SHARED     (1 << 1)
> =20
>  /* Only a portion of RAM (used_length) is actually used, and migrated.
> - * This used_length size can change across reboots.
> + * Resizing RAM while migrating can result in the migration being cancel=
ed.
>   */
>  #define RAM_RESIZEABLE (1 << 2)
> =20
> @@ -843,7 +843,9 @@ void memory_region_init_ram_shared_nomigrate(MemoryRe=
gion *mr,
>   *                                     RAM.  Accesses into the region wi=
ll
>   *                                     modify memory directly.  Only an =
initial
>   *                                     portion of this RAM is actually u=
sed.
> - *                                     The used size can change across r=
eboots.
> + *                                     Changing the size while migrating
> + *                                     can result in the migration being
> + *                                     canceled.
>   *
>   * @mr: the #MemoryRegion to be initialized.
>   * @owner: the object that tracks the region's reference count
> @@ -1464,8 +1466,8 @@ void *memory_region_get_ram_ptr(MemoryRegion *mr);
> =20
>  /* memory_region_ram_resize: Resize a RAM region.
>   *
> - * Only legal before guest might have detected the memory size: e.g. on
> - * incoming migration, or right after reset.
> + * Resizing RAM while migrating can result in the migration being cancel=
ed.
> + * Care has to be taken if the guest might have already detected the mem=
ory.
>   *
>   * @mr: a memory region created with @memory_region_init_resizeable_ram.
>   * @newsize: the new size the region
> diff --git a/migration/migration.c b/migration/migration.c
> index 8fb68795dc..ac9751dbe5 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -175,13 +175,18 @@ void migration_object_init(void)
>      }
>  }
> =20
> +void migration_cancel(void)
> +{
> +    migrate_fd_cancel(current_migration);
> +}
> +
>  void migration_shutdown(void)
>  {
>      /*
>       * Cancel the current migration - that will (eventually)
>       * stop the migration using this structure
>       */
> -    migrate_fd_cancel(current_migration);
> +    migration_cancel();
>      object_unref(OBJECT(current_migration));
>  }
> =20
> @@ -2019,7 +2024,7 @@ void qmp_migrate(const char *uri, bool has_blk, boo=
l blk,
> =20
>  void qmp_migrate_cancel(Error **errp)
>  {
> -    migrate_fd_cancel(migrate_get_current());
> +    migration_cancel();
>  }
> =20
>  void qmp_migrate_continue(MigrationStatus state, Error **errp)
> diff --git a/migration/migration.h b/migration/migration.h
> index 8473ddfc88..79fd74afa5 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -343,5 +343,6 @@ int foreach_not_ignored_block(RAMBlockIterFunc func, =
void *opaque);
>  void migration_make_urgent_request(void);
>  void migration_consume_urgent_request(void);
>  bool migration_rate_limit(void);
> +void migration_cancel(void);
> =20
>  #endif
> diff --git a/migration/ram.c b/migration/ram.c
> index ed23ed1c7c..57f32011a3 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -52,6 +52,7 @@
>  #include "migration/colo.h"
>  #include "block.h"
>  #include "sysemu/sysemu.h"
> +#include "sysemu/runstate.h"
>  #include "savevm.h"
>  #include "qemu/iov.h"
>  #include "multifd.h"
> @@ -3710,8 +3711,48 @@ static SaveVMHandlers savevm_ram_handlers =3D {
>      .resume_prepare =3D ram_resume_prepare,
>  };
> =20
> +static void ram_mig_ram_block_resized(RAMBlockNotifier *n, void *host,
> +                                      size_t old_size, size_t new_size)
> +{
> +    ram_addr_t offset;
> +    Error *err =3D NULL;
> +    RAMBlock *rb =3D qemu_ram_block_from_host(host, false, &offset);
> +
> +    if (ramblock_is_ignored(rb)) {
> +        return;
> +    }
> +
> +    /*
> +     * Some resizes are triggered on the migration target by precopy cod=
e,
> +     * when synchronizing RAM block sizes. In these cases, the VM is not
> +     * running and migration is not idle. We have to ignore these resize=
s,
> +     * as we only care about resizes during precopy on the migration sou=
rce.
> +     * This handler is always registered, so ignore when migration is id=
le.
> +     */
> +    if (migration_is_idle() || !runstate_is_running() ||
> +        postcopy_is_running()) {
> +        return;
> +    }
> +
> +    /*
> +     * Precopy code cannot deal with the size of ram blocks changing at
> +     * random points in time. We're still running on the source, abort
> +     * the migration and continue running here. Make sure to wait until
> +     * migration was canceled.
> +     */
> +    error_setg(&err, "RAM block '%s' resized during precopy.", rb->idstr=
);
> +    migrate_set_error(migrate_get_current(), err);
> +    error_free(err);
> +    migration_cancel();
> +}
> +
> +static RAMBlockNotifier ram_mig_ram_notifier =3D {
> +    .ram_block_resized =3D ram_mig_ram_block_resized,
> +};
> +
>  void ram_mig_init(void)
>  {
>      qemu_mutex_init(&XBZRLE.lock);
>      register_savevm_live("ram", 0, 4, &savevm_ram_handlers, &ram_state);
> +    ram_block_notifier_add(&ram_mig_ram_notifier);

Can we avoid the question of the 'is_idle' checks by doing this
registration in save_setup/load_setup and unregistering in
save_cleanup/load_cleanup?

That means if we land in the handler we know we're in either an incoming
or outgoing migration and then you just have to check which?

Dave

>  }
> --=20
> 2.24.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


