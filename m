Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6483D179432
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 17:00:35 +0100 (CET)
Received: from localhost ([::1]:36140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9WRm-0001Ky-81
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 11:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51747)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j9WQe-0000pU-1a
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 10:59:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j9WQb-0007MX-9v
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 10:59:23 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39739
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j9WQb-0007LZ-4u
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 10:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583337560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZUmQ2wSoJ34PGAY7WYeiNYpx6Sg56aEuciwBiHO/mPI=;
 b=elXssHI5snxNBtAj4uoOpiWkttwo/HLRKE5C2TB90H2l9EkZJk4VpjBMXtw99H6hQpihvX
 cEDda2QTPKoiYNnSrXUrg4mqPvwtq/ZpoIXImAZxEeIBOD1d9/xxYsxa6eXzQaxSx5r5Ea
 E2VVpg+M2X+LBQcXrk4me1CnDVe8q34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-7nnT0VyaOnmDPkEEo1PNDg-1; Wed, 04 Mar 2020 10:59:16 -0500
X-MC-Unique: 7nnT0VyaOnmDPkEEo1PNDg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9753A1005514;
 Wed,  4 Mar 2020 15:59:14 +0000 (UTC)
Received: from work-vm (ovpn-116-225.ams2.redhat.com [10.36.116.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FFE673886;
 Wed,  4 Mar 2020 15:59:01 +0000 (UTC)
Date: Wed, 4 Mar 2020 15:58:59 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 40/50] multi-process/mig: build migration module in
 the remote process
Message-ID: <20200304155859.GG4104@work-vm>
References: <cover.1582576372.git.jag.raman@oracle.com>
 <96a495711764282ff90504cec6734eff563ceb4d.1582576372.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <96a495711764282ff90504cec6734eff563ceb4d.1582576372.git.jag.raman@oracle.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, liran.alon@oracle.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, rth@twiddle.net,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jagannathan Raman (jag.raman@oracle.com) wrote:
> Add Makefile support to enable migration in remote process
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  Makefile.objs           |  4 +++-
>  Makefile.target         |  1 +
>  migration/Makefile.objs | 13 ++++++++++++-
>  net/Makefile.objs       |  2 ++
>  softmmu/vl.c            |  2 --
>  stubs/migration.c       | 49 +++++++++++++++++++++++++++++++++++++++++++=
++++++
>  stubs/net-stub.c        | 21 +++++++++++++++++++++
>  stubs/qapi-misc.c       |  2 ++
>  stubs/replay.c          |  8 ++++++++
>  stubs/vl-stub.c         | 24 ++++++++++++++++++++++++
>  vl-parse.c              |  3 +++
>  11 files changed, 125 insertions(+), 4 deletions(-)
>=20
> diff --git a/Makefile.objs b/Makefile.objs
> index 4b5db09..65009da 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -74,6 +74,8 @@ common-obj-y +=3D qdev-monitor.o device-hotplug.o
>  common-obj-$(CONFIG_WIN32) +=3D os-win32.o
>  common-obj-$(CONFIG_POSIX) +=3D os-posix.o
> =20
> +remote-pci-obj-$(CONFIG_POSIX) +=3D os-posix.o
> +
>  common-obj-$(CONFIG_LINUX) +=3D fsdev/
> =20
>  common-obj-y +=3D accel/
> @@ -104,11 +106,11 @@ common-obj-y +=3D vl-parse.o
> =20
>  #######################################################################
>  # qapi
> -
>  common-obj-y +=3D qapi/
> =20
>  endif # CONFIG_SOFTMMU
> =20
> +remote-pci-obj-$(CONFIG_MPQEMU) +=3D net/
>  remote-pci-obj-$(CONFIG_MPQEMU) +=3D qapi/
>  remote-pci-obj-$(CONFIG_MPQEMU) +=3D blockdev-nbd.o
>  remote-pci-obj-$(CONFIG_MPQEMU) +=3D job-qmp.o
> diff --git a/Makefile.target b/Makefile.target
> index 4ead5c3..4012ae5 100644
> --- a/Makefile.target
> +++ b/Makefile.target
> @@ -240,6 +240,7 @@ all-remote-pci-obj-y +=3D exec.o
>  all-remote-pci-obj-y +=3D exec-vary.o
>  all-remote-pci-obj-y +=3D ioport.o
>  all-remote-pci-obj-y +=3D cpus.o
> +all-remote-pci-obj-y +=3D migration/ram.o
>  endif
> =20
>  remote-pci-obj-y :=3D
> diff --git a/migration/Makefile.objs b/migration/Makefile.objs
> index e7cdc76..21f9d8d 100644
> --- a/migration/Makefile.objs
> +++ b/migration/Makefile.objs
> @@ -15,4 +15,15 @@ common-obj-$(CONFIG_LIVE_BLOCK_MIGRATION) +=3D block.o
> =20
>  rdma.o-libs :=3D $(RDMA_LIBS)
> =20
> -remote-pci-obj-$(CONFIG_MPQEMU) +=3D qemu-file.o vmstate.o qjson.o vmsta=
te-types.o
> +remote-pci-obj-$(CONFIG_MPQEMU) +=3D migration.o socket.o fd.o exec.o
> +remote-pci-obj-$(CONFIG_MPQEMU) +=3D tls.o channel.o savevm.o
> +remote-pci-obj-$(CONFIG_MPQEMU) +=3D colo.o colo-failover.o
> +remote-pci-obj-$(CONFIG_MPQEMU) +=3D vmstate.o vmstate-types.o page_cach=
e.o
> +remote-pci-obj-$(CONFIG_MPQEMU) +=3D qemu-file.o global_state.o
> +remote-pci-obj-$(CONFIG_MPQEMU) +=3D qemu-file-channel.o
> +remote-pci-obj-$(CONFIG_MPQEMU) +=3D xbzrle.o postcopy-ram.o
> +remote-pci-obj-$(CONFIG_MPQEMU) +=3D qjson.o
> +remote-pci-obj-$(CONFIG_MPQEMU) +=3D block-dirty-bitmap.o
> +remote-pci-obj-$(CONFIG_RDMA) +=3D rdma.o
> +remote-pci-obj-$(CONFIG_MPQEMU) +=3D block.o
> +remote-pci-obj-$(CONFIG_MPQEMU) +=3D multifd.o

Hmm, are you really going to want all this lot in your remote process?
Assuming it's just devices, I can understand the first line or two, but
it seems odd to have all of this.

Dave

> diff --git a/net/Makefile.objs b/net/Makefile.objs
> index c5d076d..a8ad986 100644
> --- a/net/Makefile.objs
> +++ b/net/Makefile.objs
> @@ -30,3 +30,5 @@ common-obj-$(CONFIG_WIN32) +=3D tap-win32.o
>  vde.o-libs =3D $(VDE_LIBS)
> =20
>  common-obj-$(CONFIG_CAN_BUS) +=3D can/
> +
> +remote-pci-obj-$(CONFIG_MPQEMU) +=3D announce.o
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 4a4f52c..42d5682 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -128,7 +128,6 @@ const char* keyboard_layout =3D NULL;
>  ram_addr_t ram_size;
>  const char *mem_path =3D NULL;
>  int mem_prealloc =3D 0; /* force preallocation of physical target memory=
 */
> -bool enable_mlock =3D false;
>  bool enable_cpu_pm =3D false;
>  int nb_nics;
>  NICInfo nd_table[MAX_NICS];
> @@ -168,7 +167,6 @@ const char *prom_envs[MAX_PROM_ENVS];
>  int boot_menu;
>  bool boot_strict;
>  uint8_t *boot_splash_filedata;
> -int only_migratable; /* turn it off unless user states otherwise */
>  bool wakeup_suspend_enabled;
> =20
>  int icount_align_option;
> diff --git a/stubs/migration.c b/stubs/migration.c
> index 28ccf80..dbd12db 100644
> --- a/stubs/migration.c
> +++ b/stubs/migration.c
> @@ -6,6 +6,35 @@
>  #include "qapi/qapi-types-migration.h"
>  #include "qapi/qapi-commands-migration.h"
>  #include "qapi/qapi-types-net.h"
> +#include "net/filter.h"
> +#include "net/colo-compare.h"
> +
> +#pragma weak qmp_query_migrate_capabilities
> +#pragma weak qmp_query_migrate_parameters
> +#pragma weak migrate_announce_params
> +#pragma weak qmp_query_migrate
> +#pragma weak qmp_migrate_set_capabilities
> +#pragma weak qmp_migrate_set_parameters
> +#pragma weak qmp_migrate_incoming
> +#pragma weak qmp_migrate_recover
> +#pragma weak qmp_migrate_pause
> +#pragma weak qmp_migrate
> +#pragma weak qmp_migrate_cancel
> +#pragma weak qmp_migrate_continue
> +#pragma weak qmp_migrate_set_cache_size
> +#pragma weak qmp_query_migrate_cache_size
> +#pragma weak qmp_migrate_set_speed
> +#pragma weak qmp_migrate_set_downtime
> +#pragma weak qmp_migrate_start_postcopy
> +#pragma weak migration_global_dump
> +#pragma weak save_snapshot
> +#pragma weak qmp_xen_save_devices_state
> +#pragma weak load_snapshot
> +#pragma weak qmp_xen_set_replication
> +#pragma weak qmp_query_xen_replication_status
> +#pragma weak qmp_xen_colo_do_checkpoint
> +#pragma weak qmp_query_colo_status
> +#pragma weak qmp_x_colo_lost_heartbeat
> =20
>  MigrationInfo *qmp_query_migrate(Error **errp)
>  {
> @@ -160,3 +189,23 @@ AnnounceParameters *migrate_announce_params(void)
> =20
>      return NULL;
>  }
> +
> +void colo_notify_filters_event(int event, Error **errp)
> +{
> +    qemu_debug_assert(0);
> +}
> +
> +void colo_notify_compares_event(void *opaque, int event, Error **errp)
> +{
> +    qemu_debug_assert(0);
> +}
> +
> +void colo_compare_register_notifier(Notifier *notify)
> +{
> +    qemu_debug_assert(0);
> +}
> +
> +void colo_compare_unregister_notifier(Notifier *notify)
> +{
> +    qemu_debug_assert(0);
> +}
> diff --git a/stubs/net-stub.c b/stubs/net-stub.c
> index 962827e..ddfd1e4 100644
> --- a/stubs/net-stub.c
> +++ b/stubs/net-stub.c
> @@ -5,6 +5,8 @@
>  #include "qapi/qapi-commands-net.h"
>  #include "qapi/qapi-commands-rocker.h"
> =20
> +#pragma weak qmp_announce_self
> +
>  int qemu_find_net_clients_except(const char *id, NetClientState **ncs,
>                                   NetClientDriver type, int max)
>  {
> @@ -98,3 +100,22 @@ void netdev_add(QemuOpts *opts, Error **errp)
>  {
>      qemu_debug_assert(0);
>  }
> +
> +NetClientState *qemu_get_queue(NICState *nic)
> +{
> +    qemu_debug_assert(0);
> +
> +    return NULL;
> +}
> +
> +ssize_t qemu_send_packet_raw(NetClientState *nc, const uint8_t *buf, int=
 size)
> +{
> +    qemu_debug_assert(0);
> +
> +    return 0;
> +}
> +
> +void qemu_foreach_nic(qemu_nic_foreach func, void *opaque)
> +{
> +    qemu_debug_assert(0);
> +}
> diff --git a/stubs/qapi-misc.c b/stubs/qapi-misc.c
> index 3eeedd9..824eac1 100644
> --- a/stubs/qapi-misc.c
> +++ b/stubs/qapi-misc.c
> @@ -5,6 +5,8 @@
>  #include "./qapi/qapi-types-dump.h"
>  #include "qapi/qapi-commands-dump.h"
> =20
> +#pragma weak qmp_xen_load_devices_state
> +
>  void qmp_dump_guest_memory(bool paging, const char *file,
>                             bool has_detach, bool detach,
>                             bool has_begin, int64_t begin, bool has_lengt=
h,
> diff --git a/stubs/replay.c b/stubs/replay.c
> index 9b53c0c..6fc7850 100644
> --- a/stubs/replay.c
> +++ b/stubs/replay.c
> @@ -1,4 +1,5 @@
>  #include "qemu/osdep.h"
> +#include "qemu-common.h"
>  #include "sysemu/replay.h"
> =20
>  ReplayMode replay_mode;
> @@ -106,3 +107,10 @@ void replay_account_executed_instructions(void)
>  void replay_add_blocker(Error *reason)
>  {
>  }
> +
> +bool replay_can_snapshot(void)
> +{
> +    qemu_debug_assert(0);
> +
> +    return false;
> +}
> diff --git a/stubs/vl-stub.c b/stubs/vl-stub.c
> index 606f078..5f308c1 100644
> --- a/stubs/vl-stub.c
> +++ b/stubs/vl-stub.c
> @@ -14,6 +14,8 @@
>  #include "disas/disas.h"
>  #include "audio/audio.h"
> =20
> +#pragma weak qemu_add_exit_notifier
> +
>  bool tcg_allowed;
>  bool xen_allowed;
>  bool boot_strict;
> @@ -169,3 +171,25 @@ int wav_start_capture(AudioState *state, CaptureStat=
e *s, const char *path,
> =20
>      return -1;
>  }
> +
> +void qemu_system_killed(int signal, pid_t pid)
> +{
> +    qemu_debug_assert(0);
> +}
> +
> +void qemu_system_reset(ShutdownCause reason)
> +{
> +    qemu_debug_assert(0);
> +}
> +
> +bool runstate_store(char *str, size_t size)
> +{
> +    qemu_debug_assert(0);
> +
> +    return false;
> +}
> +
> +void qemu_add_exit_notifier(Notifier *notify)
> +{
> +    qemu_debug_assert(0);
> +}
> diff --git a/vl-parse.c b/vl-parse.c
> index 1f6a3f0..423f4a0 100644
> --- a/vl-parse.c
> +++ b/vl-parse.c
> @@ -27,6 +27,9 @@
> =20
>  #include "vl.h"
> =20
> +int only_migratable; /* turn it off unless user states otherwise */
> +bool enable_mlock;
> +
>  /***********************************************************/
>  /* QEMU Block devices */
> =20
> --=20
> 1.8.3.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


