Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A1E18CDF0
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 13:35:46 +0100 (CET)
Received: from localhost ([::1]:52346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFGsL-0006Fj-3g
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 08:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60178)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jFGqn-0004j5-1c
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 08:34:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1jFGqk-0003Ae-Fx
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 08:34:08 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:41605)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1jFGqk-00038Q-7O
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 08:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584707644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nkz5v9xWogOtA5Weg3H1fy9+bl9r3AgPym+KDpoR0Ug=;
 b=VhN30V03TqAr2p0ME8ZMKrMee2H9eiqczsDLOw88UvvWKtnTxHFmriODX7PcFSNX6wnJAR
 LTYaBJTj+54wAmiizm+NZ4cyc/3ZRPLZKzBzCVLCG6Uw4x9HaAQk/5X1Z0Dk1vjikcB+lh
 p9MflgARmVayL9gM6kMRY7QRngvLMH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-_5VTBotGMfuitFPJkvw9eA-1; Fri, 20 Mar 2020 08:34:01 -0400
X-MC-Unique: _5VTBotGMfuitFPJkvw9eA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F5E918A5500;
 Fri, 20 Mar 2020 12:33:59 +0000 (UTC)
Received: from work-vm (ovpn-114-236.ams2.redhat.com [10.36.114.236])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F40A95DA75;
 Fri, 20 Mar 2020 12:33:50 +0000 (UTC)
Date: Fri, 20 Mar 2020 12:33:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: dnbrdsky@gmail.com
Subject: Re: [PATCH v3 2/2] lockable: replaced locks with lock guard macros
 where appropriate
Message-ID: <20200320123348.GA3464@work-vm>
References: <20200320120456.1931482-1-dnbrdsky@gmail.com>
 <20200320120456.1931482-3-dnbrdsky@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200320120456.1931482-3-dnbrdsky@gmail.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:iSCSI" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* dnbrdsky@gmail.com (dnbrdsky@gmail.com) wrote:
> From: Daniel Brodsky <dnbrdsky@gmail.com>
>=20
> - ran regexp "qemu_mutex_lock\(.*\).*\n.*if" to find targets
> - replaced result with QEMU_LOCK_GUARD if all unlocks at function end
> - replaced result with WITH_QEMU_LOCK_GUARD if unlock not at end
>=20
> Signed-off-by: Daniel Brodsky <dnbrdsky@gmail.com>
> ---
>  block/iscsi.c         | 11 +++-------
>  block/nfs.c           | 51 ++++++++++++++++++++-----------------------
>  cpus-common.c         | 13 +++++------
>  hw/display/qxl.c      | 43 +++++++++++++++++-------------------
>  hw/vfio/platform.c    |  5 ++---
>  migration/migration.c |  3 +--
>  migration/multifd.c   |  8 +++----
>  migration/ram.c       |  3 +--
>  monitor/misc.c        |  4 +---
>  ui/spice-display.c    | 14 ++++++------
>  util/log.c            |  4 ++--
>  util/qemu-timer.c     | 17 +++++++--------
>  util/rcu.c            |  8 +++----
>  util/thread-pool.c    |  3 +--
>  util/vfio-helpers.c   |  4 ++--
>  15 files changed, 84 insertions(+), 107 deletions(-)
>=20

<snip>

> diff --git a/migration/migration.c b/migration/migration.c
> index c1d88ace7f..2f0bd6d8b4 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1652,11 +1652,10 @@ static void migrate_fd_cleanup_bh(void *opaque)
> =20
>  void migrate_set_error(MigrationState *s, const Error *error)
>  {
> -    qemu_mutex_lock(&s->error_mutex);
> +    QEMU_LOCK_GUARD(&s->error_mutex);
>      if (!s->error) {
>          s->error =3D error_copy(error);
>      }
> -    qemu_mutex_unlock(&s->error_mutex);
>  }

There are some other places in migration.c that would really benefit;
for example, migrate_send_rp_message, if you use a LOCK_QUARD
there, then you can remove the 'int ret', and the goto error.
In postcopy_pause, the locks on qemu_file_lock would work well using the=20
WITH_QEMU_LOCK_GUARD.

>  void migrate_fd_error(MigrationState *s, const Error *error)
> diff --git a/migration/multifd.c b/migration/multifd.c
> index cb6a4a3ab8..9123c111a3 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -894,11 +894,11 @@ void multifd_recv_sync_main(void)
>      for (i =3D 0; i < migrate_multifd_channels(); i++) {
>          MultiFDRecvParams *p =3D &multifd_recv_state->params[i];
> =20
> -        qemu_mutex_lock(&p->mutex);
> -        if (multifd_recv_state->packet_num < p->packet_num) {
> -            multifd_recv_state->packet_num =3D p->packet_num;
> +        WITH_QEMU_LOCK_GUARD(&p->mutex) {
> +            if (multifd_recv_state->packet_num < p->packet_num) {
> +                multifd_recv_state->packet_num =3D p->packet_num;
> +            }
>          }
> -        qemu_mutex_unlock(&p->mutex);
>          trace_multifd_recv_sync_main_signal(p->id);
>          qemu_sem_post(&p->sem_sync);
>      }

> diff --git a/migration/ram.c b/migration/ram.c
> index c12cfdbe26..87a670cfbf 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1368,7 +1368,7 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_add=
r_t *offset)
>          return NULL;
>      }
> =20
> -    qemu_mutex_lock(&rs->src_page_req_mutex);
> +    QEMU_LOCK_GUARD(&rs->src_page_req_mutex);
>      if (!QSIMPLEQ_EMPTY(&rs->src_page_requests)) {
>          struct RAMSrcPageRequest *entry =3D
>                                  QSIMPLEQ_FIRST(&rs->src_page_requests);
> @@ -1385,7 +1385,6 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_add=
r_t *offset)
>              migration_consume_urgent_request();
>          }
>      }
> -    qemu_mutex_unlock(&rs->src_page_req_mutex);
> =20
>      return block;
>  }

Is there a reason you didn't do the matching pair at the bottom of
ram_save_queue_pages ?

Dave

> diff --git a/monitor/misc.c b/monitor/misc.c
> index 6c45fa490f..9723b466cd 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -1473,7 +1473,7 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fd=
set_id, int64_t fdset_id,
>      MonFdsetFd *mon_fdset_fd;
>      AddfdInfo *fdinfo;
> =20
> -    qemu_mutex_lock(&mon_fdsets_lock);
> +    QEMU_LOCK_GUARD(&mon_fdsets_lock);
>      if (has_fdset_id) {
>          QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
>              /* Break if match found or match impossible due to ordering =
by ID */
> @@ -1494,7 +1494,6 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fd=
set_id, int64_t fdset_id,
>              if (fdset_id < 0) {
>                  error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "fdset-id=
",
>                             "a non-negative value");
> -                qemu_mutex_unlock(&mon_fdsets_lock);
>                  return NULL;
>              }
>              /* Use specified fdset ID */
> @@ -1545,7 +1544,6 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fd=
set_id, int64_t fdset_id,
>      fdinfo->fdset_id =3D mon_fdset->id;
>      fdinfo->fd =3D mon_fdset_fd->fd;
> =20
> -    qemu_mutex_unlock(&mon_fdsets_lock);
>      return fdinfo;
>  }
> =20
> diff --git a/ui/spice-display.c b/ui/spice-display.c
> index 6babe24909..19632fdf6c 100644
> --- a/ui/spice-display.c
> +++ b/ui/spice-display.c
> @@ -18,6 +18,7 @@
>  #include "qemu/osdep.h"
>  #include "ui/qemu-spice.h"
>  #include "qemu/timer.h"
> +#include "qemu/lockable.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/option.h"
>  #include "qemu/queue.h"
> @@ -483,12 +484,12 @@ void qemu_spice_display_refresh(SimpleSpiceDisplay =
*ssd)
>  {
>      graphic_hw_update(ssd->dcl.con);
> =20
> -    qemu_mutex_lock(&ssd->lock);
> -    if (QTAILQ_EMPTY(&ssd->updates) && ssd->ds) {
> -        qemu_spice_create_update(ssd);
> -        ssd->notify++;
> +    WITH_QEMU_LOCK_GUARD(&ssd->lock) {
> +        if (QTAILQ_EMPTY(&ssd->updates) && ssd->ds) {
> +            qemu_spice_create_update(ssd);
> +            ssd->notify++;
> +        }
>      }
> -    qemu_mutex_unlock(&ssd->lock);
> =20
>      trace_qemu_spice_display_refresh(ssd->qxl.id, ssd->notify);
>      if (ssd->notify) {
> @@ -580,7 +581,7 @@ static int interface_get_cursor_command(QXLInstance *=
sin, QXLCommandExt *ext)
>      SimpleSpiceDisplay *ssd =3D container_of(sin, SimpleSpiceDisplay, qx=
l);
>      int ret;
> =20
> -    qemu_mutex_lock(&ssd->lock);
> +    QEMU_LOCK_GUARD(&ssd->lock);
>      if (ssd->ptr_define) {
>          *ext =3D ssd->ptr_define->ext;
>          ssd->ptr_define =3D NULL;
> @@ -592,7 +593,6 @@ static int interface_get_cursor_command(QXLInstance *=
sin, QXLCommandExt *ext)
>      } else {
>          ret =3D false;
>      }
> -    qemu_mutex_unlock(&ssd->lock);
>      return ret;
>  }
> =20
> diff --git a/util/log.c b/util/log.c
> index 2da6cb31dc..bdb3d712e8 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -25,6 +25,7 @@
>  #include "qemu/cutils.h"
>  #include "trace/control.h"
>  #include "qemu/thread.h"
> +#include "qemu/lockable.h"
> =20
>  static char *logfilename;
>  static QemuMutex qemu_logfile_mutex;
> @@ -94,7 +95,7 @@ void qemu_set_log(int log_flags)
>      if (qemu_loglevel && (!is_daemonized() || logfilename)) {
>          need_to_open_file =3D true;
>      }
> -    qemu_mutex_lock(&qemu_logfile_mutex);
> +    QEMU_LOCK_GUARD(&qemu_logfile_mutex);
>      if (qemu_logfile && !need_to_open_file) {
>          logfile =3D qemu_logfile;
>          atomic_rcu_set(&qemu_logfile, NULL);
> @@ -136,7 +137,6 @@ void qemu_set_log(int log_flags)
>          }
>          atomic_rcu_set(&qemu_logfile, logfile);
>      }
> -    qemu_mutex_unlock(&qemu_logfile_mutex);
>  }
> =20
>  void qemu_log_needs_buffers(void)
> diff --git a/util/qemu-timer.c b/util/qemu-timer.c
> index d548d3c1ad..b6575a2cd5 100644
> --- a/util/qemu-timer.c
> +++ b/util/qemu-timer.c
> @@ -459,17 +459,16 @@ void timer_mod_anticipate_ns(QEMUTimer *ts, int64_t=
 expire_time)
>      QEMUTimerList *timer_list =3D ts->timer_list;
>      bool rearm;
> =20
> -    qemu_mutex_lock(&timer_list->active_timers_lock);
> -    if (ts->expire_time =3D=3D -1 || ts->expire_time > expire_time) {
> -        if (ts->expire_time !=3D -1) {
> -            timer_del_locked(timer_list, ts);
> +    WITH_QEMU_LOCK_GUARD(&timer_list->active_timers_lock) {
> +        if (ts->expire_time =3D=3D -1 || ts->expire_time > expire_time) =
{
> +            if (ts->expire_time !=3D -1) {
> +                timer_del_locked(timer_list, ts);
> +            }
> +            rearm =3D timer_mod_ns_locked(timer_list, ts, expire_time);
> +        } else {
> +            rearm =3D false;
>          }
> -        rearm =3D timer_mod_ns_locked(timer_list, ts, expire_time);
> -    } else {
> -        rearm =3D false;
>      }
> -    qemu_mutex_unlock(&timer_list->active_timers_lock);
> -
>      if (rearm) {
>          timerlist_rearm(timer_list);
>      }
> diff --git a/util/rcu.c b/util/rcu.c
> index 177a675619..60a37f72c3 100644
> --- a/util/rcu.c
> +++ b/util/rcu.c
> @@ -31,6 +31,7 @@
>  #include "qemu/atomic.h"
>  #include "qemu/thread.h"
>  #include "qemu/main-loop.h"
> +#include "qemu/lockable.h"
>  #if defined(CONFIG_MALLOC_TRIM)
>  #include <malloc.h>
>  #endif
> @@ -141,14 +142,14 @@ static void wait_for_readers(void)
> =20
>  void synchronize_rcu(void)
>  {
> -    qemu_mutex_lock(&rcu_sync_lock);
> +    QEMU_LOCK_GUARD(&rcu_sync_lock);
> =20
>      /* Write RCU-protected pointers before reading p_rcu_reader->ctr.
>       * Pairs with smp_mb_placeholder() in rcu_read_lock().
>       */
>      smp_mb_global();
> =20
> -    qemu_mutex_lock(&rcu_registry_lock);
> +    QEMU_LOCK_GUARD(&rcu_registry_lock);
>      if (!QLIST_EMPTY(&registry)) {
>          /* In either case, the atomic_mb_set below blocks stores that fr=
ee
>           * old RCU-protected pointers.
> @@ -169,9 +170,6 @@ void synchronize_rcu(void)
> =20
>          wait_for_readers();
>      }
> -
> -    qemu_mutex_unlock(&rcu_registry_lock);
> -    qemu_mutex_unlock(&rcu_sync_lock);
>  }
> =20
> =20
> diff --git a/util/thread-pool.c b/util/thread-pool.c
> index 4ed9b89ab2..d763cea505 100644
> --- a/util/thread-pool.c
> +++ b/util/thread-pool.c
> @@ -210,7 +210,7 @@ static void thread_pool_cancel(BlockAIOCB *acb)
> =20
>      trace_thread_pool_cancel(elem, elem->common.opaque);
> =20
> -    qemu_mutex_lock(&pool->lock);
> +    QEMU_LOCK_GUARD(&pool->lock);
>      if (elem->state =3D=3D THREAD_QUEUED &&
>          /* No thread has yet started working on elem. we can try to "ste=
al"
>           * the item from the worker if we can get a signal from the
> @@ -225,7 +225,6 @@ static void thread_pool_cancel(BlockAIOCB *acb)
>          elem->ret =3D -ECANCELED;
>      }
> =20
> -    qemu_mutex_unlock(&pool->lock);
>  }
> =20
>  static AioContext *thread_pool_get_aio_context(BlockAIOCB *acb)
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index ddd9a96e76..b310b23003 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -21,6 +21,7 @@
>  #include "standard-headers/linux/pci_regs.h"
>  #include "qemu/event_notifier.h"
>  #include "qemu/vfio-helpers.h"
> +#include "qemu/lockable.h"
>  #include "trace.h"
> =20
>  #define QEMU_VFIO_DEBUG 0
> @@ -667,14 +668,13 @@ int qemu_vfio_dma_reset_temporary(QEMUVFIOState *s)
>          .size =3D QEMU_VFIO_IOVA_MAX - s->high_water_mark,
>      };
>      trace_qemu_vfio_dma_reset_temporary(s);
> -    qemu_mutex_lock(&s->lock);
> +    QEMU_LOCK_GUARD(&s->lock);
>      if (ioctl(s->container, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
>          error_report("VFIO_UNMAP_DMA failed: %s", strerror(errno));
>          qemu_mutex_unlock(&s->lock);
>          return -errno;
>      }
>      s->high_water_mark =3D QEMU_VFIO_IOVA_MAX;
> -    qemu_mutex_unlock(&s->lock);
>      return 0;
>  }
> =20
> --=20
> 2.25.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


