Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD54F307DFB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 19:31:25 +0100 (CET)
Received: from localhost ([::1]:44300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5C4g-0008G9-CP
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 13:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l5C2j-0007lS-IP
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:29:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l5C2f-0000Po-P9
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611858555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x3gjWsQK1tvzO043Oz4r4NUvhm0kykFG22pXFjksP9s=;
 b=L1Xg3ejfXZNcPYIV7V274JNfNHWNg2hDGmTTCz+ZKX8mExwAh/KpsiK5lldTQMwvHC/V7q
 lLtMKK9uvZOQfnSFNumN5h28EFDJMR/lmakvhZT6xEYcA1Kd8zJl1qXRR7SXaiyChvFXmJ
 dLeZ1nQq574AoS2QKItb6zFgxdp1B7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-MPbQ8RwDP7ei_M-Usfw4nQ-1; Thu, 28 Jan 2021 13:29:13 -0500
X-MC-Unique: MPbQ8RwDP7ei_M-Usfw4nQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8412B107ACE4;
 Thu, 28 Jan 2021 18:29:12 +0000 (UTC)
Received: from work-vm (ovpn-115-60.ams2.redhat.com [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B19910021AA;
 Thu, 28 Jan 2021 18:29:07 +0000 (UTC)
Date: Thu, 28 Jan 2021 18:29:04 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v13 4/5] migration: implementation of background snapshot
 thread
Message-ID: <20210128182904.GH2951@work-vm>
References: <20210121152458.193248-1-andrey.gruzdev@virtuozzo.com>
 <20210121152458.193248-5-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210121152458.193248-5-andrey.gruzdev@virtuozzo.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
> Introducing implementation of 'background' snapshot thread
> which in overall follows the logic of precopy migration
> while internally utilizes completely different mechanism
> to 'freeze' vmstate at the start of snapshot creation.
> 
> This mechanism is based on userfault_fd with wr-protection
> support and is Linux-specific.
> 
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> Acked-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks for fixing the thread name; I've just noticed something though:

> ---
>  migration/migration.c | 263 ++++++++++++++++++++++++++++++++++++++++--
>  migration/migration.h |   3 +
>  migration/savevm.c    |   1 -
>  migration/savevm.h    |   2 +
>  4 files changed, 258 insertions(+), 11 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index f018337fbc..869afa7a86 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1130,7 +1130,6 @@ static void fill_source_migration_info(MigrationInfo *info)
>      info->status = s->state;
>  }
>  
> -#ifdef CONFIG_LINUX
>  typedef enum WriteTrackingSupport {
>      WT_SUPPORT_UNKNOWN = 0,
>      WT_SUPPORT_ABSENT,
> @@ -1155,7 +1154,6 @@ WriteTrackingSupport migrate_query_write_tracking(void)
>  
>      return WT_SUPPORT_COMPATIBLE;
>  }
> -#endif /* CONFIG_LINUX */

Why is this 4/5 patch removing these ifdef's (including the one below);
since it's the ram_write_tracking_available that lets you know if you
can do it, and htat's got ifdef's, why do these lines go in at all?

Dave

>  /**
>   * @migration_caps_check - check capability validity
> @@ -1219,7 +1217,6 @@ static bool migrate_caps_check(bool *cap_list,
>      }
>  
>      if (cap_list[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
> -#ifdef CONFIG_LINUX
>          WriteTrackingSupport wt_support;
>          int idx;
>          /*
> @@ -1250,11 +1247,6 @@ static bool migrate_caps_check(bool *cap_list,
>                  return false;
>              }
>          }
> -#else
> -        error_setg(errp,
> -                "Background-snapshot is not supported on non-Linux hosts");
> -        return false;
> -#endif
>      }
>  
>      return true;
> @@ -2016,6 +2008,7 @@ void migrate_init(MigrationState *s)
>       * locks.
>       */
>      s->cleanup_bh = 0;
> +    s->vm_start_bh = 0;
>      s->to_dst_file = NULL;
>      s->state = MIGRATION_STATUS_NONE;
>      s->rp_state.from_dst_file = NULL;
> @@ -3233,6 +3226,50 @@ fail:
>                        MIGRATION_STATUS_FAILED);
>  }
>  
> +/**
> + * bg_migration_completion: Used by bg_migration_thread when after all the
> + *   RAM has been saved. The caller 'breaks' the loop when this returns.
> + *
> + * @s: Current migration state
> + */
> +static void bg_migration_completion(MigrationState *s)
> +{
> +    int current_active_state = s->state;
> +
> +    /*
> +     * Stop tracking RAM writes - un-protect memory, un-register UFFD
> +     * memory ranges, flush kernel wait queues and wake up threads
> +     * waiting for write fault to be resolved.
> +     */
> +    ram_write_tracking_stop();
> +
> +    if (s->state == MIGRATION_STATUS_ACTIVE) {
> +        /*
> +         * By this moment we have RAM content saved into the migration stream.
> +         * The next step is to flush the non-RAM content (device state)
> +         * right after the ram content. The device state has been stored into
> +         * the temporary buffer before RAM saving started.
> +         */
> +        qemu_put_buffer(s->to_dst_file, s->bioc->data, s->bioc->usage);
> +        qemu_fflush(s->to_dst_file);
> +    } else if (s->state == MIGRATION_STATUS_CANCELLING) {
> +        goto fail;
> +    }
> +
> +    if (qemu_file_get_error(s->to_dst_file)) {
> +        trace_migration_completion_file_err();
> +        goto fail;
> +    }
> +
> +    migrate_set_state(&s->state, current_active_state,
> +                      MIGRATION_STATUS_COMPLETED);
> +    return;
> +
> +fail:
> +    migrate_set_state(&s->state, current_active_state,
> +                      MIGRATION_STATUS_FAILED);
> +}
> +
>  bool migrate_colo_enabled(void)
>  {
>      MigrationState *s = migrate_get_current();
> @@ -3573,6 +3610,47 @@ static void migration_iteration_finish(MigrationState *s)
>      qemu_mutex_unlock_iothread();
>  }
>  
> +static void bg_migration_iteration_finish(MigrationState *s)
> +{
> +    qemu_mutex_lock_iothread();
> +    switch (s->state) {
> +    case MIGRATION_STATUS_COMPLETED:
> +        migration_calculate_complete(s);
> +        break;
> +
> +    case MIGRATION_STATUS_ACTIVE:
> +    case MIGRATION_STATUS_FAILED:
> +    case MIGRATION_STATUS_CANCELLED:
> +    case MIGRATION_STATUS_CANCELLING:
> +        break;
> +
> +    default:
> +        /* Should not reach here, but if so, forgive the VM. */
> +        error_report("%s: Unknown ending state %d", __func__, s->state);
> +        break;
> +    }
> +
> +    migrate_fd_cleanup_schedule(s);
> +    qemu_mutex_unlock_iothread();
> +}
> +
> +/*
> + * Return true if continue to the next iteration directly, false
> + * otherwise.
> + */
> +static MigIterateState bg_migration_iteration_run(MigrationState *s)
> +{
> +    int res;
> +
> +    res = qemu_savevm_state_iterate(s->to_dst_file, false);
> +    if (res > 0) {
> +        bg_migration_completion(s);
> +        return MIG_ITERATE_BREAK;
> +    }
> +
> +    return MIG_ITERATE_RESUME;
> +}
> +
>  void migration_make_urgent_request(void)
>  {
>      qemu_sem_post(&migrate_get_current()->rate_limit_sem);
> @@ -3720,6 +3798,165 @@ static void *migration_thread(void *opaque)
>      return NULL;
>  }
>  
> +static void bg_migration_vm_start_bh(void *opaque)
> +{
> +    MigrationState *s = opaque;
> +
> +    qemu_bh_delete(s->vm_start_bh);
> +    s->vm_start_bh = NULL;
> +
> +    vm_start();
> +    s->downtime = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) - s->downtime_start;
> +}
> +
> +/**
> + * Background snapshot thread, based on live migration code.
> + * This is an alternative implementation of live migration mechanism
> + * introduced specifically to support background snapshots.
> + *
> + * It takes advantage of userfault_fd write protection mechanism introduced
> + * in v5.7 kernel. Compared to existing dirty page logging migration much
> + * lesser stream traffic is produced resulting in smaller snapshot images,
> + * simply cause of no page duplicates can get into the stream.
> + *
> + * Another key point is that generated vmstate stream reflects machine state
> + * 'frozen' at the beginning of snapshot creation compared to dirty page logging
> + * mechanism, which effectively results in that saved snapshot is the state of VM
> + * at the end of the process.
> + */
> +static void *bg_migration_thread(void *opaque)
> +{
> +    MigrationState *s = opaque;
> +    int64_t setup_start;
> +    MigThrError thr_error;
> +    QEMUFile *fb;
> +    bool early_fail = true;
> +
> +    rcu_register_thread();
> +    object_ref(OBJECT(s));
> +
> +    qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
> +
> +    setup_start = qemu_clock_get_ms(QEMU_CLOCK_HOST);
> +    /*
> +     * We want to save vmstate for the moment when migration has been
> +     * initiated but also we want to save RAM content while VM is running.
> +     * The RAM content should appear first in the vmstate. So, we first
> +     * stash the non-RAM part of the vmstate to the temporary buffer,
> +     * then write RAM part of the vmstate to the migration stream
> +     * with vCPUs running and, finally, write stashed non-RAM part of
> +     * the vmstate from the buffer to the migration stream.
> +     */
> +    s->bioc = qio_channel_buffer_new(128 * 1024);
> +    qio_channel_set_name(QIO_CHANNEL(s->bioc), "vmstate-buffer");
> +    fb = qemu_fopen_channel_output(QIO_CHANNEL(s->bioc));
> +    object_unref(OBJECT(s->bioc));
> +
> +    update_iteration_initial_status(s);
> +
> +    qemu_savevm_state_header(s->to_dst_file);
> +    qemu_savevm_state_setup(s->to_dst_file);
> +
> +    if (qemu_savevm_state_guest_unplug_pending()) {
> +        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> +                          MIGRATION_STATUS_WAIT_UNPLUG);
> +
> +        while (s->state == MIGRATION_STATUS_WAIT_UNPLUG &&
> +               qemu_savevm_state_guest_unplug_pending()) {
> +            qemu_sem_timedwait(&s->wait_unplug_sem, 250);
> +        }
> +
> +        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG,
> +                          MIGRATION_STATUS_ACTIVE);
> +    } else {
> +        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> +                MIGRATION_STATUS_ACTIVE);
> +    }
> +    s->setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
> +
> +    trace_migration_thread_setup_complete();
> +    s->downtime_start = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +
> +    qemu_mutex_lock_iothread();
> +
> +    /*
> +     * If VM is currently in suspended state, then, to make a valid runstate
> +     * transition in vm_stop_force_state() we need to wakeup it up.
> +     */
> +    qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
> +    s->vm_was_running = runstate_is_running();
> +
> +    if (global_state_store()) {
> +        goto fail;
> +    }
> +    /* Forcibly stop VM before saving state of vCPUs and devices */
> +    if (vm_stop_force_state(RUN_STATE_PAUSED)) {
> +        goto fail;
> +    }
> +    /*
> +     * Put vCPUs in sync with shadow context structures, then
> +     * save their state to channel-buffer along with devices.
> +     */
> +    cpu_synchronize_all_states();
> +    if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
> +        goto fail;
> +    }
> +    /* Now initialize UFFD context and start tracking RAM writes */
> +    if (ram_write_tracking_start()) {
> +        goto fail;
> +    }
> +    early_fail = false;
> +
> +    /*
> +     * Start VM from BH handler to avoid write-fault lock here.
> +     * UFFD-WP protection for the whole RAM is already enabled so
> +     * calling VM state change notifiers from vm_start() would initiate
> +     * writes to virtio VQs memory which is in write-protected region.
> +     */
> +    s->vm_start_bh = qemu_bh_new(bg_migration_vm_start_bh, s);
> +    qemu_bh_schedule(s->vm_start_bh);
> +
> +    qemu_mutex_unlock_iothread();
> +
> +    while (migration_is_active(s)) {
> +        MigIterateState iter_state = bg_migration_iteration_run(s);
> +        if (iter_state == MIG_ITERATE_SKIP) {
> +            continue;
> +        } else if (iter_state == MIG_ITERATE_BREAK) {
> +            break;
> +        }
> +
> +        /*
> +         * Try to detect any kind of failures, and see whether we
> +         * should stop the migration now.
> +         */
> +        thr_error = migration_detect_error(s);
> +        if (thr_error == MIG_THR_ERR_FATAL) {
> +            /* Stop migration */
> +            break;
> +        }
> +
> +        migration_update_counters(s, qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
> +    }
> +
> +    trace_migration_thread_after_loop();
> +
> +fail:
> +    if (early_fail) {
> +        migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
> +                MIGRATION_STATUS_FAILED);
> +        qemu_mutex_unlock_iothread();
> +    }
> +
> +    bg_migration_iteration_finish(s);
> +
> +    qemu_fclose(fb);
> +    object_unref(OBJECT(s));
> +    rcu_unregister_thread();
> +
> +    return NULL;
> +}
> +
>  void migrate_fd_connect(MigrationState *s, Error *error_in)
>  {
>      Error *local_err = NULL;
> @@ -3783,8 +4020,14 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>          migrate_fd_cleanup(s);
>          return;
>      }
> -    qemu_thread_create(&s->thread, "live_migration", migration_thread, s,
> -                       QEMU_THREAD_JOINABLE);
> +
> +    if (migrate_background_snapshot()) {
> +        qemu_thread_create(&s->thread, "bg_snapshot",
> +                bg_migration_thread, s, QEMU_THREAD_JOINABLE);
> +    } else {
> +        qemu_thread_create(&s->thread, "live_migration",
> +                migration_thread, s, QEMU_THREAD_JOINABLE);
> +    }
>      s->migration_thread_running = true;
>  }
>  
> diff --git a/migration/migration.h b/migration/migration.h
> index f40338cfbf..0723955cd7 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -20,6 +20,7 @@
>  #include "qemu/thread.h"
>  #include "qemu/coroutine_int.h"
>  #include "io/channel.h"
> +#include "io/channel-buffer.h"
>  #include "net/announce.h"
>  #include "qom/object.h"
>  
> @@ -147,8 +148,10 @@ struct MigrationState {
>  
>      /*< public >*/
>      QemuThread thread;
> +    QEMUBH *vm_start_bh;
>      QEMUBH *cleanup_bh;
>      QEMUFile *to_dst_file;
> +    QIOChannelBuffer *bioc;
>      /*
>       * Protects to_dst_file pointer.  We need to make sure we won't
>       * yield or hang during the critical section, since this lock will
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 4f3b69ecfc..9f8ad5e0f5 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1355,7 +1355,6 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
>      return 0;
>  }
>  
> -static
>  int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>                                                      bool in_postcopy,
>                                                      bool inactivate_disks)
> diff --git a/migration/savevm.h b/migration/savevm.h
> index ba64a7e271..aaee2528ed 100644
> --- a/migration/savevm.h
> +++ b/migration/savevm.h
> @@ -64,5 +64,7 @@ int qemu_loadvm_state(QEMUFile *f);
>  void qemu_loadvm_state_cleanup(void);
>  int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
>  int qemu_load_device_state(QEMUFile *f);
> +int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
> +        bool in_postcopy, bool inactivate_disks);
>  
>  #endif
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


