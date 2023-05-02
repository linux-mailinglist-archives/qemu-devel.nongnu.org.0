Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0639F6F4D48
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 00:56:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptyus-0000Et-NM; Tue, 02 May 2023 18:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptyur-0000El-2i
 for qemu-devel@nongnu.org; Tue, 02 May 2023 18:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptyup-0002gk-2C
 for qemu-devel@nongnu.org; Tue, 02 May 2023 18:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683068169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ESwGMzEkRaKH1nXkAdA+Oix/1rkVCecq7qGzPiigOlI=;
 b=HazFWr/7HE90aODnNAjun/AcizEiTWDz5bvV2l297aWE1P5Uyq5X64gN+SwL+VK8edcDAb
 5czo0jGo0/oPKIsahrckwCzbAITd5eDWcaDskJlp7r3O7SnGYJg20q7IRP2F1qGBYIzqFh
 W3pfboGU2c1TZFd1SwGy2czEs6ooZWY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-zQX_EdIgNxaD8S-G9_pzng-1; Tue, 02 May 2023 18:56:08 -0400
X-MC-Unique: zQX_EdIgNxaD8S-G9_pzng-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-61acaa32164so8940286d6.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 15:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683068168; x=1685660168;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ESwGMzEkRaKH1nXkAdA+Oix/1rkVCecq7qGzPiigOlI=;
 b=caqhGLZcgM9KvByJTCyXKqarCpGgKS0VrO4ndgiBQPLeoQ7Ke1NVWwBSZqK42UWU30
 XhszjzZs1GSYni3kkLjyDVAoXFgcCR1g4shSqMeutaB57BrCTNAr3Xu8z86D7IZ8Ocp4
 x1Q06r95goM9jJOuY6o76kd4HGQKuMTxu9e1Kbb+B0oekswaUHCv5I19UUBmVO4yqXvu
 q7Rjjs7TneKpNGWxM8JXbdOaudPstr3e9Zawm8WsfcoAKHZLSXvLzKmb6HBQl8s24xpg
 rRTvo0/3GJm1SZBboxWnuhws0edKM5+e19r2cZvd+eTgZA8rSRNvpORxjz+3/M6D2sZR
 RP1g==
X-Gm-Message-State: AC+VfDygmWuCsJbwzW9P91Caw8xDex8PQA/HUxLsCeziXTGTc3Ej1z4D
 erJVLgnYJwRD9MQESXMuYDe9OHhGCBpZdgPRZC1xCS97Fr0zDUs325m5/2poixmfxvnoa9l7Ulh
 l5IRUKo7owC2Dkcg=
X-Received: by 2002:a05:6214:622:b0:532:141d:3750 with SMTP id
 a2-20020a056214062200b00532141d3750mr5799191qvx.2.1683068168023; 
 Tue, 02 May 2023 15:56:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6oq1JiXeJxRWxLMjJL0gWxFR4zFFG9Gq2YPXOecu6+8zaGh87Ysk+4Em/+CTr2y5G6Viyeuw==
X-Received: by 2002:a05:6214:622:b0:532:141d:3750 with SMTP id
 a2-20020a056214062200b00532141d3750mr5799167qvx.2.1683068167707; 
 Tue, 02 May 2023 15:56:07 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 r1-20020a0ccc01000000b0061b608dc4c1sm1218001qvk.94.2023.05.02.15.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 15:56:07 -0700 (PDT)
Date: Tue, 2 May 2023 18:56:05 -0400
From: Peter Xu <peterx@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 3/8] migration: Add precopy initial data loaded ACK
 functionality
Message-ID: <ZFGVBSYfFRZqorH1@x1n>
References: <20230501140141.11743-1-avihaih@nvidia.com>
 <20230501140141.11743-4-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230501140141.11743-4-avihaih@nvidia.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Mon, May 01, 2023 at 05:01:36PM +0300, Avihai Horon wrote:
> Add the core functionality of precopy initial data, which allows the
> destination to ACK that initial data has been loaded and the source to
> wait for this ACK before completing the migration.
> 
> A new return path command MIG_RP_MSG_INITIAL_DATA_LOADED_ACK is added.
> It is sent by the destination after precopy initial data is loaded to
> ACK to the source that precopy initial data has been loaded.
> 
> In addition, two new SaveVMHandlers handlers are added:
> 1. is_initial_data_active which indicates whether precopy initial data
>    is used for this migration user (i.e., SaveStateEntry).
> 2. initial_data_loaded which indicates whether precopy initial data has
>    been loaded by this migration user.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  include/migration/register.h |  7 ++++++
>  migration/migration.h        | 12 +++++++++++
>  migration/migration.c        | 41 ++++++++++++++++++++++++++++++++++--
>  migration/savevm.c           | 39 ++++++++++++++++++++++++++++++++++
>  migration/trace-events       |  2 ++
>  5 files changed, 99 insertions(+), 2 deletions(-)
> 
> diff --git a/include/migration/register.h b/include/migration/register.h
> index 0a73f3883e..297bbe9f73 100644
> --- a/include/migration/register.h
> +++ b/include/migration/register.h
> @@ -77,6 +77,13 @@ typedef struct SaveVMHandlers {
>       * true if it's supported or false otherwise. Called both in src and dest.
>       */
>      bool (*initial_data_advise)(void *opaque);
> +    /*
> +     * Checks if precopy initial data is active. If it's inactive,
> +     * initial_data_loaded check is skipped.
> +     */
> +    bool (*is_initial_data_active)(void *opaque);
> +    /* Checks if precopy initial data has been loaded in dest */
> +    bool (*initial_data_loaded)(void *opaque);
>  } SaveVMHandlers;
>  
>  int register_savevm_live(const char *idstr,
> diff --git a/migration/migration.h b/migration/migration.h
> index 4f615e9dbc..d865c23d87 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -207,6 +207,11 @@ struct MigrationIncomingState {
>  
>      /* Indicates whether precopy initial data was enabled and should be used */
>      bool initial_data_enabled;
> +    /*
> +     * Indicates whether an ACK that precopy initial data was loaded has been
> +     * sent to source.
> +     */
> +    bool initial_data_loaded_ack_sent;
>  };
>  
>  MigrationIncomingState *migration_incoming_get_current(void);
> @@ -435,6 +440,12 @@ struct MigrationState {
>  
>      /* QEMU_VM_VMDESCRIPTION content filled for all non-iterable devices. */
>      JSONWriter *vmdesc;
> +
> +    /*
> +     * Indicates whether an ACK that precopy initial data was loaded in
> +     * destination has been received.
> +     */
> +    bool initial_data_loaded_acked;
>  };
>  
>  void migrate_set_state(int *state, int old_state, int new_state);
> @@ -475,6 +486,7 @@ int migrate_send_rp_message_req_pages(MigrationIncomingState *mis,
>  void migrate_send_rp_recv_bitmap(MigrationIncomingState *mis,
>                                   char *block_name);
>  void migrate_send_rp_resume_ack(MigrationIncomingState *mis, uint32_t value);
> +int migrate_send_rp_initial_data_loaded_ack(MigrationIncomingState *mis);
>  
>  void dirty_bitmap_mig_before_vm_start(void);
>  void dirty_bitmap_mig_cancel_outgoing(void);
> diff --git a/migration/migration.c b/migration/migration.c
> index 68cdf5b184..304cab2fa1 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -77,6 +77,11 @@ enum mig_rp_message_type {
>      MIG_RP_MSG_RECV_BITMAP,  /* send recved_bitmap back to source */
>      MIG_RP_MSG_RESUME_ACK,   /* tell source that we are ready to resume */
>  
> +    MIG_RP_MSG_INITIAL_DATA_LOADED_ACK, /*
> +                                         * Tell source precopy initial data is
> +                                         * loaded.
> +                                         */
> +
>      MIG_RP_MSG_MAX
>  };
>  
> @@ -756,6 +761,12 @@ bool migration_has_all_channels(void)
>      return true;
>  }
>  
> +int migrate_send_rp_initial_data_loaded_ack(MigrationIncomingState *mis)
> +{
> +    return migrate_send_rp_message(mis, MIG_RP_MSG_INITIAL_DATA_LOADED_ACK, 0,
> +                                   NULL);
> +}
> +
>  /*
>   * Send a 'SHUT' message on the return channel with the given value
>   * to indicate that we've finished with the RP.  Non-0 value indicates
> @@ -1401,6 +1412,8 @@ void migrate_init(MigrationState *s)
>      s->vm_was_running = false;
>      s->iteration_initial_bytes = 0;
>      s->threshold_size = 0;
> +
> +    s->initial_data_loaded_acked = false;
>  }
>  
>  int migrate_add_blocker_internal(Error *reason, Error **errp)
> @@ -1717,6 +1730,9 @@ static struct rp_cmd_args {
>      [MIG_RP_MSG_REQ_PAGES_ID]   = { .len = -1, .name = "REQ_PAGES_ID" },
>      [MIG_RP_MSG_RECV_BITMAP]    = { .len = -1, .name = "RECV_BITMAP" },
>      [MIG_RP_MSG_RESUME_ACK]     = { .len =  4, .name = "RESUME_ACK" },
> +    [MIG_RP_MSG_INITIAL_DATA_LOADED_ACK] = { .len = 0,
> +                                             .name =
> +                                                 "INITIAL_DATA_LOADED_ACK" },
>      [MIG_RP_MSG_MAX]            = { .len = -1, .name = "MAX" },
>  };
>  
> @@ -1955,6 +1971,11 @@ retry:
>              }
>              break;
>  
> +        case MIG_RP_MSG_INITIAL_DATA_LOADED_ACK:
> +            ms->initial_data_loaded_acked = true;
> +            trace_source_return_path_thread_initial_data_loaded_ack();
> +            break;
> +
>          default:
>              break;
>          }
> @@ -2704,6 +2725,20 @@ static void migration_update_counters(MigrationState *s,
>                                bandwidth, s->threshold_size);
>  }
>  
> +static bool initial_data_loaded_acked(MigrationState *s)
> +{
> +    if (!migrate_precopy_initial_data()) {
> +        return true;
> +    }
> +
> +    /* No reason to wait for precopy initial data loaded ACK if VM is stopped */
> +    if (!runstate_is_running()) {
> +        return true;
> +    }
> +
> +    return s->initial_data_loaded_acked;
> +}
> +
>  /* Migration thread iteration status */
>  typedef enum {
>      MIG_ITERATE_RESUME,         /* Resume current iteration */
> @@ -2719,6 +2754,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>  {
>      uint64_t must_precopy, can_postcopy;
>      bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
> +    bool initial_data_loaded = initial_data_loaded_acked(s);
>  
>      qemu_savevm_state_pending_estimate(&must_precopy, &can_postcopy);
>      uint64_t pending_size = must_precopy + can_postcopy;
> @@ -2731,7 +2767,8 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>          trace_migrate_pending_exact(pending_size, must_precopy, can_postcopy);
>      }
>  
> -    if (!pending_size || pending_size < s->threshold_size) {
> +    if ((!pending_size || pending_size < s->threshold_size) &&
> +        initial_data_loaded) {
>          trace_migration_thread_low_pending(pending_size);
>          migration_completion(s);
>          return MIG_ITERATE_BREAK;
> @@ -2739,7 +2776,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>  
>      /* Still a significant amount to transfer */
>      if (!in_postcopy && must_precopy <= s->threshold_size &&
> -        qatomic_read(&s->start_postcopy)) {
> +        initial_data_loaded && qatomic_read(&s->start_postcopy)) {
>          if (postcopy_start(s)) {
>              error_report("%s: postcopy failed to start", __func__);
>          }
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 2740defdf0..7a94deda3b 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2504,6 +2504,39 @@ static int loadvm_process_command(QEMUFile *f)
>      return 0;
>  }
>  
> +static int qemu_loadvm_initial_data_loaded_ack(MigrationIncomingState *mis)
> +{
> +    SaveStateEntry *se;
> +    int ret;
> +
> +    if (!mis->initial_data_enabled || mis->initial_data_loaded_ack_sent) {
> +        return 0;
> +    }
> +
> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +        if (!se->ops || !se->ops->initial_data_loaded) {
> +            continue;
> +        }
> +
> +        if (!se->ops->is_initial_data_active ||
> +            !se->ops->is_initial_data_active(se->opaque)) {
> +            continue;
> +        }
> +
> +        if (!se->ops->initial_data_loaded(se->opaque)) {
> +            return 0;
> +        }
> +    }
> +
> +    ret = migrate_send_rp_initial_data_loaded_ack(mis);
> +    if (!ret) {
> +        mis->initial_data_loaded_ack_sent = true;
> +        trace_loadvm_initial_data_loaded_acked();
> +    }
> +
> +    return ret;
> +}
> +
>  /*
>   * Read a footer off the wire and check that it matches the expected section
>   *
> @@ -2826,6 +2859,12 @@ retry:
>              if (ret < 0) {
>                  goto out;
>              }
> +
> +            ret = qemu_loadvm_initial_data_loaded_ack(mis);
> +            if (ret < 0) {
> +                goto out;
> +            }

This is slightly hacky - it gets called for every END section.

Please consider something cleaner, e.g., feel free to consider a
notification mechanism I mentioned in my reply to the cover letter, so it's
called only if the device is ready for switchover (no matter what interface
it'll use).

Thanks,

> +
>              break;
>          case QEMU_VM_COMMAND:
>              ret = loadvm_process_command(f);
> diff --git a/migration/trace-events b/migration/trace-events
> index 21ae471126..a0e1d3b2fd 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -24,6 +24,7 @@ loadvm_postcopy_ram_handle_discard_header(const char *ramid, uint16_t len) "%s:
>  loadvm_process_command(const char *s, uint16_t len) "com=%s len=%d"
>  loadvm_process_command_ping(uint32_t val) "0x%x"
>  loadvm_handle_initial_data_enable(uint8_t general_enable, const char *idstr, int instance_id) "general_enable=%u, idstr=%s, instance_id=%u"
> +loadvm_initial_data_loaded_acked(void) ""
>  postcopy_ram_listen_thread_exit(void) ""
>  postcopy_ram_listen_thread_start(void) ""
>  qemu_savevm_send_postcopy_advise(void) ""
> @@ -182,6 +183,7 @@ source_return_path_thread_loop_top(void) ""
>  source_return_path_thread_pong(uint32_t val) "0x%x"
>  source_return_path_thread_shut(uint32_t val) "0x%x"
>  source_return_path_thread_resume_ack(uint32_t v) "%"PRIu32
> +source_return_path_thread_initial_data_loaded_ack(void) ""
>  migration_thread_low_pending(uint64_t pending) "%" PRIu64
>  migrate_transferred(uint64_t tranferred, uint64_t time_spent, uint64_t bandwidth, uint64_t size) "transferred %" PRIu64 " time_spent %" PRIu64 " bandwidth %" PRIu64 " max_size %" PRId64
>  process_incoming_migration_co_end(int ret, int ps) "ret=%d postcopy-state=%d"
> -- 
> 2.26.3
> 
> 

-- 
Peter Xu


