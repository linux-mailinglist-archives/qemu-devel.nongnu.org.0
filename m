Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A4AD4039
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 15:01:44 +0200 (CEST)
Received: from localhost ([::1]:49902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIuYB-0003Fo-2H
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 09:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59039)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iIuUb-00013Z-PH
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 08:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iIuUZ-0006hO-GN
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 08:58:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35716)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iIuUX-0006gc-IC
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 08:57:57 -0400
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2056F85537
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 12:57:56 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id s28so8821679qkm.5
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 05:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sY+7n7v0PzzW5WxNKnKDDwdlZ+22HePsvTrlwIh3xDM=;
 b=BGYr/CyS5p0UllBY2Wfn18HF8ETa66XX+e1QTcHNBKCu5kAB+FXC98DnzX3u6TORdf
 +1ap8omc0m4Ah+U/ONSpAlkQc5fQKy/isJW0cYksl/VcfjsK8yqkOyXlZOPFLk8FDt2a
 cLbhZoy1UNrb5QP8lpaCiVYVCNcPNYRgrDtg0jPZz5SQwlI7PMoXSd4BaQy83FinHTRK
 ZSSlUNuKQdWQC7B97P/1jlQLzFxadASttnv4dkqrFoRLWxwPOgAaMd1eKsiPCNy7nbPN
 4coQ7BGbaFCK24kklkJ+QvRL7kmZmvz4sUgYX38EzoqSfbng5ioaUQQ0dFQuSAJ526/4
 kEKw==
X-Gm-Message-State: APjAAAW7G9MEPQrFvrLBTkwtISZgNZoJwlWmLRVD/7Q27b97bTFl/+VO
 Sl9HakK0wck3FN2q4g1uiHvWhX1n8UZj8+amgIWth6af26GqzeftAXc/TzGUGdc9TY/NM7Ittxa
 hMQvnlsHMwAFxAnI=
X-Received: by 2002:ae9:eb42:: with SMTP id b63mr15363545qkg.323.1570798675287; 
 Fri, 11 Oct 2019 05:57:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqza4/VQBFS8GjeK3kCfLsZaeKnqb6WbrU3aDyqi8TGMeBxwRXnx7LVm2mipVY8fnvGWTovI/A==
X-Received: by 2002:ae9:eb42:: with SMTP id b63mr15363525qkg.323.1570798674925; 
 Fri, 11 Oct 2019 05:57:54 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
 by smtp.gmail.com with ESMTPSA id
 u27sm6090001qta.90.2019.10.11.05.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 05:57:54 -0700 (PDT)
Date: Fri, 11 Oct 2019 08:57:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jens Freimann <jfreimann@redhat.com>
Subject: Re: [PATCH v3 07/10] migration: add new migration state wait-unplug
Message-ID: <20191011085334-mutt-send-email-mst@kernel.org>
References: <20191011112015.11785-1-jfreimann@redhat.com>
 <20191011112015.11785-8-jfreimann@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011112015.11785-8-jfreimann@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: parav@mellanox.com, aadam@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, alex.williamson@redhat.com, laine@redhat.com,
 ailan@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 11, 2019 at 01:20:12PM +0200, Jens Freimann wrote:
> This patch adds a new migration state called wait-unplug.  It is entered
> after the SETUP state and will transition into ACTIVE once all devices
> were succesfully unplugged from the guest.
> 
> So if a guest doesn't respond or takes long to honor the unplug request
> the user will see the migration state 'wait-unplug'.
> 
> In the migration thread we query failover devices if they're are still
> pending the guest unplug. When all are unplugged the migration
> continues. We give it a defined number of iterations including small
> waiting periods before we proceed.
> 
> Signed-off-by: Jens Freimann <jfreimann@redhat.com>
> ---
>  include/migration/vmstate.h |  2 ++
>  migration/migration.c       | 34 ++++++++++++++++++++++++++++++++++
>  migration/migration.h       |  3 +++
>  migration/savevm.c          | 36 ++++++++++++++++++++++++++++++++++++
>  migration/savevm.h          |  1 +
>  qapi/migration.json         |  5 ++++-
>  6 files changed, 80 insertions(+), 1 deletion(-)
> 
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 1fbfd099dd..39ef125225 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -186,6 +186,8 @@ struct VMStateDescription {
>      int (*pre_save)(void *opaque);
>      int (*post_save)(void *opaque);
>      bool (*needed)(void *opaque);
> +    bool (*dev_unplug_pending)(void *opaque);
> +
>      const VMStateField *fields;
>      const VMStateDescription **subsections;
>  };
> diff --git a/migration/migration.c b/migration/migration.c
> index 5f7e4d15e9..a17d9fb990 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -52,9 +52,14 @@
>  #include "hw/qdev-properties.h"
>  #include "monitor/monitor.h"
>  #include "net/announce.h"
> +#include "qemu/queue.h"
>  
>  #define MAX_THROTTLE  (32 << 20)      /* Migration transfer speed throttling */
>  
> +/* Time in milliseconds to wait for guest OS to unplug PCI device */
> +#define FAILOVER_GUEST_UNPLUG_WAIT 10000

This value should be controllable from QMP.
And I think the default should be infinite wait.

> +#define FAILOVER_UNPLUG_RETRIES 5


This is a bit of a hack. We really should just
have unplug signal wakeup, or time expire.
E.g. a new kind of notifier?

> +
>  /* Amount of time to allocate to each "chunk" of bandwidth-throttled
>   * data. */
>  #define BUFFER_DELAY     100
> @@ -954,6 +959,9 @@ static void fill_source_migration_info(MigrationInfo *info)
>      case MIGRATION_STATUS_CANCELLED:
>          info->has_status = true;
>          break;
> +    case MIGRATION_STATUS_WAIT_UNPLUG:
> +        info->has_status = true;
> +        break;
>      }
>      info->status = s->state;
>  }
> @@ -1695,6 +1703,7 @@ bool migration_is_idle(void)
>      case MIGRATION_STATUS_COLO:
>      case MIGRATION_STATUS_PRE_SWITCHOVER:
>      case MIGRATION_STATUS_DEVICE:
> +    case MIGRATION_STATUS_WAIT_UNPLUG:
>          return false;
>      case MIGRATION_STATUS__MAX:
>          g_assert_not_reached();
> @@ -3224,6 +3233,8 @@ static void *migration_thread(void *opaque)
>      int64_t setup_start = qemu_clock_get_ms(QEMU_CLOCK_HOST);
>      MigThrError thr_error;
>      bool urgent = false;
> +    bool all_unplugged = true;
> +    int i = 0;
>  
>      rcu_register_thread();
>  
> @@ -3260,6 +3271,27 @@ static void *migration_thread(void *opaque)
>  
>      qemu_savevm_state_setup(s->to_dst_file);
>  
> +    migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> +                      MIGRATION_STATUS_WAIT_UNPLUG);
> +
> +    while (i < FAILOVER_UNPLUG_RETRIES &&
> +           s->state == MIGRATION_STATUS_WAIT_UNPLUG) {
> +        i++;
> +        qemu_sem_timedwait(&s->wait_unplug_sem, FAILOVER_GUEST_UNPLUG_WAIT);

Should be FAILOVER_GUEST_UNPLUG_WAIT / FAILOVER_UNPLUG_RETRIES

such that time set is the total.

> +        all_unplugged = qemu_savevm_state_guest_unplug_pending();
> +        if (all_unplugged) {
> +            break;
> +        }
> +    }
> +
> +    if (all_unplugged) {
> +        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG,
> +                MIGRATION_STATUS_ACTIVE);
> +    } else {
> +        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG,
> +                          MIGRATION_STATUS_CANCELLING);
> +    }
> +
>      s->setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
>      migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
>                        MIGRATION_STATUS_ACTIVE);
> @@ -3508,6 +3540,7 @@ static void migration_instance_finalize(Object *obj)
>      qemu_mutex_destroy(&ms->qemu_file_lock);
>      g_free(params->tls_hostname);
>      g_free(params->tls_creds);
> +    qemu_sem_destroy(&ms->wait_unplug_sem);
>      qemu_sem_destroy(&ms->rate_limit_sem);
>      qemu_sem_destroy(&ms->pause_sem);
>      qemu_sem_destroy(&ms->postcopy_pause_sem);
> @@ -3553,6 +3586,7 @@ static void migration_instance_init(Object *obj)
>      qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
>      qemu_sem_init(&ms->rp_state.rp_sem, 0);
>      qemu_sem_init(&ms->rate_limit_sem, 0);
> +    qemu_sem_init(&ms->wait_unplug_sem, 0);
>      qemu_mutex_init(&ms->qemu_file_lock);
>  }
>  
> diff --git a/migration/migration.h b/migration/migration.h
> index 4f2fe193dc..79b3dda146 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -206,6 +206,9 @@ struct MigrationState
>      /* Flag set once the migration thread called bdrv_inactivate_all */
>      bool block_inactive;
>  
> +    /* Migration is waiting for guest to unplug device */
> +    QemuSemaphore wait_unplug_sem;
> +
>      /* Migration is paused due to pause-before-switchover */
>      QemuSemaphore pause_sem;
>  
> diff --git a/migration/savevm.c b/migration/savevm.c
> index bb9462a54d..26e5bde687 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -942,6 +942,20 @@ static void qemu_savevm_command_send(QEMUFile *f,
>      qemu_fflush(f);
>  }
>  
> +static int qemu_savevm_nr_failover_devices(void)
> +{
> +    SaveStateEntry *se;
> +    int n = 0;
> +
> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +        if (se->vmsd && se->vmsd->dev_unplug_pending) {
> +            n++;
> +        }
> +    }
> +
> +    return n;
> +}
> +
>  void qemu_savevm_send_colo_enable(QEMUFile *f)
>  {
>      trace_savevm_send_colo_enable();
> @@ -1113,6 +1127,28 @@ void qemu_savevm_state_header(QEMUFile *f)
>      }
>  }
>  
> +bool qemu_savevm_state_guest_unplug_pending(void)
> +{
> +    int nr_failover_devs;
> +    SaveStateEntry *se;
> +    bool ret = false;
> +    int n = 0;
> +
> +    nr_failover_devs = qemu_savevm_nr_failover_devices();
> +
> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +        if (!se->vmsd || !se->vmsd->dev_unplug_pending) {
> +            continue;
> +        }
> +        ret = se->vmsd->dev_unplug_pending(se->opaque);
> +        if (!ret) {
> +            n++;
> +        }
> +    }
> +
> +    return n == nr_failover_devs;
> +}
> +
>  void qemu_savevm_state_setup(QEMUFile *f)
>  {
>      SaveStateEntry *se;
> diff --git a/migration/savevm.h b/migration/savevm.h
> index 51a4b9caa8..ba64a7e271 100644
> --- a/migration/savevm.h
> +++ b/migration/savevm.h
> @@ -31,6 +31,7 @@
>  
>  bool qemu_savevm_state_blocked(Error **errp);
>  void qemu_savevm_state_setup(QEMUFile *f);
> +bool qemu_savevm_state_guest_unplug_pending(void);
>  int qemu_savevm_state_resume_prepare(MigrationState *s);
>  void qemu_savevm_state_header(QEMUFile *f);
>  int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy);
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 52e69e2868..5a06cd489f 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -133,6 +133,9 @@
>  # @device: During device serialisation when pause-before-switchover is enabled
>  #        (since 2.11)
>  #
> +# @wait-unplug: wait for device unplug request by guest OS to be completed.
> +#               (since 4.2)
> +#
>  # Since: 2.3
>  #
>  ##
> @@ -140,7 +143,7 @@
>    'data': [ 'none', 'setup', 'cancelling', 'cancelled',
>              'active', 'postcopy-active', 'postcopy-paused',
>              'postcopy-recover', 'completed', 'failed', 'colo',
> -            'pre-switchover', 'device' ] }
> +            'pre-switchover', 'device', 'wait-unplug' ] }
>  
>  ##
>  # @MigrationInfo:
> -- 
> 2.21.0

