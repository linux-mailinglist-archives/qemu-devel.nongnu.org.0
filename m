Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445D76F4891
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:44:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptt4u-0006ch-5A; Tue, 02 May 2023 12:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptt4r-0006cE-Cw
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:42:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptt4n-0007CK-Ov
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683045723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w6GhcjysLSdvpeFcZtivAt8B6f/8MpT0dQxRn99fy4Y=;
 b=Bw3iTDc7fhxL8OOjZxGHPLOMRczrGkkSvptQEP1KPlAnpE+o3Q7Z+4YLtL62XwMlG6HnIt
 66LQqqym5Tpal0/MxLtnrBCqfV1wG6LrDrleKziTdlppW57WHzwkZR/jR1JOTvByGyc0i+
 g8m3JjjQOHjJkj0K+T1C4IEuvxtCIaU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-PBr-SyiBOTaWyBxVKuqo0g-1; Tue, 02 May 2023 12:42:01 -0400
X-MC-Unique: PBr-SyiBOTaWyBxVKuqo0g-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-61a3c7657aeso1899626d6.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683045720; x=1685637720;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w6GhcjysLSdvpeFcZtivAt8B6f/8MpT0dQxRn99fy4Y=;
 b=PivM05ZpQ3sqSqBPDCHhfHxK89eB4Raa0j6LZ+16tZAA8x0X7Q+9wOIRLSxV9Bk4nA
 rAwHnvdeCtlGOuuhjs8xMiZ69+51WM27YHzJb5zvCvyOj/TaVOM647JjQCXwBJ25Nzy8
 u49pkHAfzn2pmwfHb57IQQyJbT3IS2F3ay+x0nEPBtBkEY/Rml8sUByHoceRDbglmRcj
 jX93XFDIFejKFW0a+wQ6cOVj5+4I96CNOrr0ivhzYeuhh5WLZGljQZ7SGdbAtIyTig6J
 Nvwq/et8IaoFyNN0RIODGl0PuaXcNBE3lSv8gdfG450B1d7RuRcp/ZO/1a4WFDGLPx3w
 F+3Q==
X-Gm-Message-State: AC+VfDzcozVFRHDWu8JltNOfwAp57l1E1PJUb/lJBwgP080UWSTMaN2E
 sxDLFrLTUafAk8wwzWOFrMA9nVBGvsZ+0TrP4Pw2swR/WoAuI5lXGyvkDXCwqc1Uk9qA+bu0xie
 NJOTfO0aAG8fr2zc=
X-Received: by 2002:a05:6214:5087:b0:5f7:d2da:c69e with SMTP id
 kk7-20020a056214508700b005f7d2dac69emr22245931qvb.4.1683045720470; 
 Tue, 02 May 2023 09:42:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5mRWj6rv+BsSPUKPhRKSG32o1/wFsblw9ta8TKgyiNyT/fneiiYfEE9CIZjp7u296TvxLZzQ==
X-Received: by 2002:a05:6214:5087:b0:5f7:d2da:c69e with SMTP id
 kk7-20020a056214508700b005f7d2dac69emr22245894qvb.4.1683045720051; 
 Tue, 02 May 2023 09:42:00 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 a9-20020a0cca89000000b0061b59bcc3edsm388272qvk.44.2023.05.02.09.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:41:59 -0700 (PDT)
Date: Tue, 2 May 2023 12:41:57 -0400
From: Peter Xu <peterx@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, lukasstraub2@web.de, quintela@redhat.com,
 chen.zhang@intel.com, "Dr . David Alan Gilbert" <dave@treblig.org>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Leonardo Bras <leobras@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 03/10] build: move COLO under CONFIG_REPLICATION
Message-ID: <ZFE9Vb6iMcGCzkM3@x1n>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-4-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230428194928.1426370-4-vsementsov@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Apr 28, 2023 at 10:49:21PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We don't allow to use x-colo capability when replication is not
> configured. So, no reason to build COLO when replication is disabled,
> it's unusable in this case.
> 
> Note also that the check in migrate_caps_check() is not the only
> restriction: some functions in migration/colo.c will just abort if
> called with not defined CONFIG_REPLICATION, for example:
> 
>     migration_iteration_finish()
>        case MIGRATION_STATUS_COLO:
>            migrate_start_colo_process()
>                colo_process_checkpoint()
>                    abort()
> 
> It could probably make sense to have possibility to enable COLO without
> REPLICATION, but this requires deeper audit of colo & replication code,
> which may be done later if needed.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Acked-by: Dr. David Alan Gilbert <dave@treblig.org>
> ---
>  hmp-commands.hx                |  2 ++
>  migration/colo.c               | 28 ------------------------
>  migration/meson.build          |  6 ++++--
>  migration/migration-hmp-cmds.c |  2 ++
>  migration/migration.c          |  6 ++++++
>  qapi/migration.json            |  9 +++++---
>  stubs/colo.c                   | 39 ++++++++++++++++++++++++++++++++++
>  stubs/meson.build              |  1 +
>  8 files changed, 60 insertions(+), 33 deletions(-)
>  create mode 100644 stubs/colo.c
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index bb85ee1d26..fbd0932232 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1035,6 +1035,7 @@ SRST
>    migration (or once already in postcopy).
>  ERST
>  
> +#ifdef CONFIG_REPLICATION
>      {
>          .name       = "x_colo_lost_heartbeat",
>          .args_type  = "",
> @@ -1043,6 +1044,7 @@ ERST
>                        "a failover or takeover is needed.",
>          .cmd = hmp_x_colo_lost_heartbeat,
>      },
> +#endif
>  
>  SRST
>  ``x_colo_lost_heartbeat``
> diff --git a/migration/colo.c b/migration/colo.c
> index c9e0b909b9..6c7c313956 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -26,9 +26,7 @@
>  #include "qemu/rcu.h"
>  #include "migration/failover.h"
>  #include "migration/ram.h"
> -#ifdef CONFIG_REPLICATION
>  #include "block/replication.h"
> -#endif
>  #include "net/colo-compare.h"
>  #include "net/colo.h"
>  #include "block/block.h"
> @@ -86,7 +84,6 @@ void colo_checkpoint_delay_set(void)
>  static void secondary_vm_do_failover(void)
>  {
>  /* COLO needs enable block-replication */
> -#ifdef CONFIG_REPLICATION
>      int old_state;
>      MigrationIncomingState *mis = migration_incoming_get_current();
>      Error *local_err = NULL;
> @@ -151,14 +148,10 @@ static void secondary_vm_do_failover(void)
>      if (mis->migration_incoming_co) {
>          qemu_coroutine_enter(mis->migration_incoming_co);
>      }
> -#else
> -    abort();
> -#endif
>  }
>  
>  static void primary_vm_do_failover(void)
>  {
> -#ifdef CONFIG_REPLICATION
>      MigrationState *s = migrate_get_current();
>      int old_state;
>      Error *local_err = NULL;
> @@ -199,9 +192,6 @@ static void primary_vm_do_failover(void)
>  
>      /* Notify COLO thread that failover work is finished */
>      qemu_sem_post(&s->colo_exit_sem);
> -#else
> -    abort();
> -#endif
>  }
>  
>  COLOMode get_colo_mode(void)
> @@ -235,7 +225,6 @@ void colo_do_failover(void)
>      }
>  }
>  
> -#ifdef CONFIG_REPLICATION
>  void qmp_xen_set_replication(bool enable, bool primary,
>                               bool has_failover, bool failover,
>                               Error **errp)
> @@ -289,7 +278,6 @@ void qmp_xen_colo_do_checkpoint(Error **errp)
>      /* Notify all filters of all NIC to do checkpoint */
>      colo_notify_filters_event(COLO_EVENT_CHECKPOINT, errp);
>  }
> -#endif
>  
>  COLOStatus *qmp_query_colo_status(Error **errp)
>  {
> @@ -453,15 +441,11 @@ static int colo_do_checkpoint_transaction(MigrationState *s,
>      }
>      qemu_mutex_lock_iothread();
>  
> -#ifdef CONFIG_REPLICATION
>      replication_do_checkpoint_all(&local_err);
>      if (local_err) {
>          qemu_mutex_unlock_iothread();
>          goto out;
>      }
> -#else
> -        abort();
> -#endif
>  
>      colo_send_message(s->to_dst_file, COLO_MESSAGE_VMSTATE_SEND, &local_err);
>      if (local_err) {
> @@ -579,15 +563,11 @@ static void colo_process_checkpoint(MigrationState *s)
>      object_unref(OBJECT(bioc));
>  
>      qemu_mutex_lock_iothread();
> -#ifdef CONFIG_REPLICATION
>      replication_start_all(REPLICATION_MODE_PRIMARY, &local_err);
>      if (local_err) {
>          qemu_mutex_unlock_iothread();
>          goto out;
>      }
> -#else
> -        abort();
> -#endif
>  
>      vm_start();
>      qemu_mutex_unlock_iothread();
> @@ -755,7 +735,6 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
>          return;
>      }
>  
> -#ifdef CONFIG_REPLICATION
>      replication_get_error_all(&local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
> @@ -772,9 +751,6 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
>          qemu_mutex_unlock_iothread();
>          return;
>      }
> -#else
> -    abort();
> -#endif
>      /* Notify all filters of all NIC to do checkpoint */
>      colo_notify_filters_event(COLO_EVENT_CHECKPOINT, &local_err);
>  
> @@ -881,15 +857,11 @@ void *colo_process_incoming_thread(void *opaque)
>      object_unref(OBJECT(bioc));
>  
>      qemu_mutex_lock_iothread();
> -#ifdef CONFIG_REPLICATION
>      replication_start_all(REPLICATION_MODE_SECONDARY, &local_err);
>      if (local_err) {
>          qemu_mutex_unlock_iothread();
>          goto out;
>      }
> -#else
> -        abort();
> -#endif
>      vm_start();
>      qemu_mutex_unlock_iothread();
>      trace_colo_vm_state_change("stop", "run");
> diff --git a/migration/meson.build b/migration/meson.build
> index 480ff6854a..9c6a8e65d3 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -13,8 +13,6 @@ softmmu_ss.add(files(
>    'block-dirty-bitmap.c',
>    'channel.c',
>    'channel-block.c',
> -  'colo-failover.c',
> -  'colo.c',
>    'exec.c',
>    'fd.c',
>    'global_state.c',
> @@ -30,6 +28,10 @@ softmmu_ss.add(files(
>    'threadinfo.c',
>  ), gnutls)
>  
> +if get_option('replication').allowed()
> +  softmmu_ss.add(files('colo-failover.c', 'colo.c'))
> +endif
> +
>  softmmu_ss.add(when: rdma, if_true: files('rdma.c'))
>  if get_option('live_block_migration').allowed()
>    softmmu_ss.add(files('block.c'))
> diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
> index 4e9f00e7dc..9885d7c9f7 100644
> --- a/migration/migration-hmp-cmds.c
> +++ b/migration/migration-hmp-cmds.c
> @@ -643,6 +643,7 @@ void hmp_migrate_start_postcopy(Monitor *mon, const QDict *qdict)
>      hmp_handle_error(mon, err);
>  }
>  
> +#ifdef CONFIG_REPLICATION
>  void hmp_x_colo_lost_heartbeat(Monitor *mon, const QDict *qdict)
>  {
>      Error *err = NULL;
> @@ -650,6 +651,7 @@ void hmp_x_colo_lost_heartbeat(Monitor *mon, const QDict *qdict)
>      qmp_x_colo_lost_heartbeat(&err);
>      hmp_handle_error(mon, err);
>  }
> +#endif
>  
>  typedef struct HMPMigrationStatus {
>      QEMUTimer *timer;
> diff --git a/migration/migration.c b/migration/migration.c
> index abcadbb619..0c14837cd3 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -389,6 +389,12 @@ void migration_incoming_disable_colo(void)
>  
>  int migration_incoming_enable_colo(void)
>  {
> +#ifndef CONFIG_REPLICATION
> +    error_report("ENABLE_COLO command come in migration stream, but COLO "
> +                 "module is not built in");
> +    return -ENOTSUP;
> +#endif
> +
>      if (ram_block_discard_disable(true)) {
>          error_report("COLO: cannot disable RAM discard");
>          return -EBUSY;
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 2c35b7b9cf..422a6b2613 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1381,7 +1381,8 @@
>  #
>  ##
>  { 'command': 'x-colo-lost-heartbeat',
> -  'features': [ 'unstable' ] }
> +  'features': [ 'unstable' ],
> +  'if': 'CONFIG_REPLICATION' }
>  
>  ##
>  # @migrate_cancel:
> @@ -1657,7 +1658,8 @@
>  ##
>  { 'struct': 'COLOStatus',
>    'data': { 'mode': 'COLOMode', 'last-mode': 'COLOMode',
> -            'reason': 'COLOExitReason' } }
> +            'reason': 'COLOExitReason' },
> +  'if': 'CONFIG_REPLICATION' }
>  
>  ##
>  # @query-colo-status:
> @@ -1674,7 +1676,8 @@
>  # Since: 3.1
>  ##
>  { 'command': 'query-colo-status',
> -  'returns': 'COLOStatus' }
> +  'returns': 'COLOStatus',
> +  'if': 'CONFIG_REPLICATION' }

I still see a bunch of other colo related definitions around in the qapi
schema, e.g. COLOExitReason.  Is it intended to leave them as is?

>  
>  ##
>  # @migrate-recover:
> diff --git a/stubs/colo.c b/stubs/colo.c
> new file mode 100644
> index 0000000000..cf9816d368
> --- /dev/null
> +++ b/stubs/colo.c
> @@ -0,0 +1,39 @@
> +#include "qemu/osdep.h"
> +#include "qemu/notify.h"
> +#include "net/colo-compare.h"
> +#include "migration/colo.h"
> +#include "migration/migration.h"
> +#include "qemu/error-report.h"
> +#include "qapi/qapi-commands-migration.h"
> +
> +void colo_shutdown(void)
> +{
> +}
> +
> +void *colo_process_incoming_thread(void *opaque)
> +{
> +    error_report("Impossible happend: trying to start COLO thread when COLO "
> +                 "module is not built in");
> +    abort();
> +}
> +
> +void colo_checkpoint_delay_set(void)
> +{
> +}
> +
> +void migrate_start_colo_process(MigrationState *s)
> +{
> +    error_report("Impossible happend: trying to start COLO when COLO "
> +                 "module is not built in");
> +    abort();
> +}
> +
> +bool migration_in_colo_state(void)
> +{
> +    return false;
> +}
> +
> +bool migration_incoming_in_colo_state(void)
> +{
> +    return false;
> +}
> diff --git a/stubs/meson.build b/stubs/meson.build
> index b2b5956d97..8412cad15f 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -45,6 +45,7 @@ stub_ss.add(files('target-get-monitor-def.c'))
>  stub_ss.add(files('target-monitor-defs.c'))
>  stub_ss.add(files('trace-control.c'))
>  stub_ss.add(files('uuid.c'))
> +stub_ss.add(files('colo.c'))
>  stub_ss.add(files('vmstate.c'))
>  stub_ss.add(files('vm-stop.c'))
>  stub_ss.add(files('win32-kbd-hook.c'))
> -- 
> 2.34.1
> 

-- 
Peter Xu


