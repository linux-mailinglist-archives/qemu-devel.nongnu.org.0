Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880E86F4D45
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 00:55:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptytV-0007h2-2n; Tue, 02 May 2023 18:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptytS-0007gp-TY
 for qemu-devel@nongnu.org; Tue, 02 May 2023 18:54:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptytQ-0002Am-G9
 for qemu-devel@nongnu.org; Tue, 02 May 2023 18:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683068083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QQ35PV49n9YC6twCMTvQC3XIaEYQPbWy1XFW5viQX44=;
 b=iACIPFu6OwTnqSyQZ24mdM5f9tDgZ1jNTQ+mErhf4Tsu/CedLxCWbEsoijH4s3xnxBXwvH
 cePEf33Dm6z/+hsRDGs3WgMV2/LbfHXLNB6gZrmctjt9QxBGzrxDSsqpix11fWB/9Duj9o
 7z6RrD9nFpccBF3mQcRqhcWv8FuxUms=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-uHm3AqlNP1CLuKIabk8Bsg-1; Tue, 02 May 2023 18:54:42 -0400
X-MC-Unique: uHm3AqlNP1CLuKIabk8Bsg-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-3ef2cb3bfbfso12942741cf.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 15:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683068081; x=1685660081;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQ35PV49n9YC6twCMTvQC3XIaEYQPbWy1XFW5viQX44=;
 b=DMAHBoTQomwyRFdWgBgvEzfSpwnoVbWKTqGcBs4ifcmsPsZRDJXdsVd+edNmNrMaFj
 iW9KThc2AyzjTB3yOefK9Ud6XM+PvYtDWvkY+3CWFFZwD0u6ztWDxWzsNCreNEjibAW+
 /YmtB3n8k1Nth8Zq23yDF7CguAEAhee/Xpqkg1YeG152r4zbjtT5KKte1tckg8UhssnT
 mrUKysA4YGb9FtfQ6UyhXuzlk4YGVWR14pEljVLcs5+FViYVielVsvRRmKV928/i4j0Y
 WLbEj1rE/irVLthR/wk1f6FFMtf8JyiWWRheI/MEwK0ilOHQCG6uGnVrtrLbetRGqRFf
 VfYw==
X-Gm-Message-State: AC+VfDxsnUO+M5aJboMOcZ0FHaPCrHeM6OVUy9OV5U0lEZQlUOi/Ke84
 3xIq5A4JKCw2JMtVzJk53u/x5I2a4Lt5NcD35echdxwaMOQK6BYTbKwYJgpZm0x7Lig0rNzLw5o
 sGYl5yGZRO21vVi8=
X-Received: by 2002:a05:622a:30d:b0:3ef:4a8e:cb84 with SMTP id
 q13-20020a05622a030d00b003ef4a8ecb84mr24262927qtw.2.1683068081497; 
 Tue, 02 May 2023 15:54:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7CavXkezLLyadjbgGLwa6Ekm3ds2sZfsvIkhM0rVlwn5y6POyAmdwvtDGjo6Cm5vDOjQ/XjA==
X-Received: by 2002:a05:622a:30d:b0:3ef:4a8e:cb84 with SMTP id
 q13-20020a05622a030d00b003ef4a8ecb84mr24262902qtw.2.1683068081107; 
 Tue, 02 May 2023 15:54:41 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 t35-20020a05622a182300b003e3895903bfsm10777241qtc.8.2023.05.02.15.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 15:54:40 -0700 (PDT)
Date: Tue, 2 May 2023 18:54:38 -0400
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
Subject: Re: [PATCH 2/8] migration: Add precopy initial data handshake
Message-ID: <ZFGUriGbwleLEIcm@x1n>
References: <20230501140141.11743-1-avihaih@nvidia.com>
 <20230501140141.11743-3-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230501140141.11743-3-avihaih@nvidia.com>
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

(I've left high level comment in cover letter, but still some quick
comments I noticed when reading)

On Mon, May 01, 2023 at 05:01:35PM +0300, Avihai Horon wrote:
> Add precopy initial data handshake between source and destination upon
> migration setup. The purpose of the handshake is to notify the
> destination that precopy initial data is used and which migration users
> (i.e., SaveStateEntry) are going to use it.
> 
> The handshake is done in two levels. First, a general enable command is
> sent to notify the destination migration code that precopy initial data
> is used.
> Then, for each migration user in the source that supports precopy
> initial data, an enable command is sent to its counterpart in the
> destination:
> If both support it, precopy initial data will be used for them.
> If source doesn't support it, precopy initial data will not be used for
> them.
> If source supports it and destination doesn't, migration will be failed.
> 
> To implement it, a new migration command MIG_CMD_INITIAL_DATA_ENABLE is
> added, as well as a new SaveVMHandlers handler initial_data_advise.
> Calling the handler advises the migration user that precopy initial data
> is used and its return value indicates whether precopy initial data is
> supported by it.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  include/migration/register.h |   6 +++
>  migration/migration.h        |   3 ++
>  migration/savevm.h           |   1 +
>  migration/migration.c        |   4 ++
>  migration/savevm.c           | 102 +++++++++++++++++++++++++++++++++++
>  migration/trace-events       |   2 +
>  6 files changed, 118 insertions(+)
> 
> diff --git a/include/migration/register.h b/include/migration/register.h
> index a8dfd8fefd..0a73f3883e 100644
> --- a/include/migration/register.h
> +++ b/include/migration/register.h
> @@ -71,6 +71,12 @@ typedef struct SaveVMHandlers {
>      int (*load_cleanup)(void *opaque);
>      /* Called when postcopy migration wants to resume from failure */
>      int (*resume_prepare)(MigrationState *s, void *opaque);
> +
> +    /*
> +     * Advises that precopy initial data was requested to be enabled. Returns
> +     * true if it's supported or false otherwise. Called both in src and dest.
> +     */
> +    bool (*initial_data_advise)(void *opaque);
>  } SaveVMHandlers;
>  
>  int register_savevm_live(const char *idstr,
> diff --git a/migration/migration.h b/migration/migration.h
> index 3a918514e7..4f615e9dbc 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -204,6 +204,9 @@ struct MigrationIncomingState {
>       * contains valid information.
>       */
>      QemuMutex page_request_mutex;
> +
> +    /* Indicates whether precopy initial data was enabled and should be used */
> +    bool initial_data_enabled;
>  };
>  
>  MigrationIncomingState *migration_incoming_get_current(void);
> diff --git a/migration/savevm.h b/migration/savevm.h
> index fb636735f0..d47ab4ad18 100644
> --- a/migration/savevm.h
> +++ b/migration/savevm.h
> @@ -58,6 +58,7 @@ void qemu_savevm_send_postcopy_ram_discard(QEMUFile *f, const char *name,
>                                             uint64_t *start_list,
>                                             uint64_t *length_list);
>  void qemu_savevm_send_colo_enable(QEMUFile *f);
> +void qemu_savevm_send_initial_data_enable(MigrationState *ms, QEMUFile *f);
>  void qemu_savevm_live_state(QEMUFile *f);
>  int qemu_save_device_state(QEMUFile *f);
>  
> diff --git a/migration/migration.c b/migration/migration.c
> index abcadbb619..68cdf5b184 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2964,6 +2964,10 @@ static void *migration_thread(void *opaque)
>          qemu_savevm_send_colo_enable(s->to_dst_file);
>      }
>  
> +    if (migrate_precopy_initial_data()) {
> +        qemu_savevm_send_initial_data_enable(s, s->to_dst_file);
> +    }
> +
>      qemu_savevm_state_setup(s->to_dst_file);
>  
>      qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,
> diff --git a/migration/savevm.c b/migration/savevm.c
> index a9181b444b..2740defdf0 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -71,6 +71,13 @@
>  
>  const unsigned int postcopy_ram_discard_version;
>  
> +typedef struct {
> +    uint8_t general_enable;
> +    uint8_t reserved[7];
> +    uint8_t idstr[256];
> +    uint32_t instance_id;
> +} InitialDataInfo;
> +
>  /* Subcommands for QEMU_VM_COMMAND */
>  enum qemu_vm_cmd {
>      MIG_CMD_INVALID = 0,   /* Must be 0 */
> @@ -90,6 +97,8 @@ enum qemu_vm_cmd {
>      MIG_CMD_ENABLE_COLO,       /* Enable COLO */
>      MIG_CMD_POSTCOPY_RESUME,   /* resume postcopy on dest */
>      MIG_CMD_RECV_BITMAP,       /* Request for recved bitmap on dst */
> +
> +    MIG_CMD_INITIAL_DATA_ENABLE, /* Enable precopy initial data in dest */
>      MIG_CMD_MAX
>  };
>  
> @@ -109,6 +118,8 @@ static struct mig_cmd_args {
>      [MIG_CMD_POSTCOPY_RESUME]  = { .len =  0, .name = "POSTCOPY_RESUME" },
>      [MIG_CMD_PACKAGED]         = { .len =  4, .name = "PACKAGED" },
>      [MIG_CMD_RECV_BITMAP]      = { .len = -1, .name = "RECV_BITMAP" },
> +    [MIG_CMD_INITIAL_DATA_ENABLE] = { .len = sizeof(InitialDataInfo),
> +                                      .name = "INITIAL_DATA_ENABLE" },
>      [MIG_CMD_MAX]              = { .len = -1, .name = "MAX" },
>  };
>  
> @@ -1036,6 +1047,40 @@ static void qemu_savevm_command_send(QEMUFile *f,
>      qemu_fflush(f);
>  }
>  
> +void qemu_savevm_send_initial_data_enable(MigrationState *ms, QEMUFile *f)
> +{
> +    SaveStateEntry *se;
> +    InitialDataInfo buf;
> +
> +    /* Enable precopy initial data generally in the migration */
> +    memset(&buf, 0, sizeof(buf));
> +    buf.general_enable = 1;
> +    qemu_savevm_command_send(f, MIG_CMD_INITIAL_DATA_ENABLE, sizeof(buf),
> +                             (uint8_t *)&buf);
> +    trace_savevm_send_initial_data_enable(buf.general_enable, (char *)buf.idstr,
> +                                          buf.instance_id);

Maybe a generalized helper would be nice here to send one
MIG_CMD_INITIAL_DATA_ENABLE packet, then it can be used below too.

Here instance_id is multi-bytes, we may want to consider endianess.  it
seems the common way is use big endian over the wire for qemu migration
msgs.

> +
> +    /* Enable precopy initial data for each migration user that supports it */
> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +        if (!se->ops || !se->ops->initial_data_advise) {
> +            continue;
> +        }
> +
> +        if (!se->ops->initial_data_advise(se->opaque)) {
> +            continue;
> +        }
> +
> +        memset(&buf, 0, sizeof(buf));
> +        memcpy(buf.idstr, se->idstr, sizeof(buf.idstr));
> +        buf.instance_id = se->instance_id;
> +
> +        qemu_savevm_command_send(f, MIG_CMD_INITIAL_DATA_ENABLE, sizeof(buf),
> +                                 (uint8_t *)&buf);
> +        trace_savevm_send_initial_data_enable(
> +            buf.general_enable, (char *)buf.idstr, buf.instance_id);
> +    }
> +}
> +
>  void qemu_savevm_send_colo_enable(QEMUFile *f)
>  {
>      trace_savevm_send_colo_enable();
> @@ -2314,6 +2359,60 @@ static int loadvm_process_enable_colo(MigrationIncomingState *mis)
>      return ret;
>  }
>  
> +static int loadvm_handle_initial_data_enable(MigrationIncomingState *mis)
> +{
> +    InitialDataInfo buf;
> +    SaveStateEntry *se;
> +    ssize_t read_size;
> +
> +    read_size = qemu_get_buffer(mis->from_src_file, (void *)&buf, sizeof(buf));
> +    if (read_size != sizeof(buf)) {
> +        error_report("%s: Could not get data buffer, read_size %ld, len %lu",
> +                     __func__, read_size, sizeof(buf));
> +
> +        return -EIO;
> +    }
> +
> +    /* Enable precopy initial data generally in the migration */
> +    if (buf.general_enable) {
> +        mis->initial_data_enabled = true;
> +        trace_loadvm_handle_initial_data_enable(
> +            buf.general_enable, (char *)buf.idstr, buf.instance_id);
> +
> +        return 0;
> +    }
> +
> +    /* Enable precopy initial data for a specific migration user */
> +    se = find_se((char *)buf.idstr, buf.instance_id);
> +    if (!se) {
> +        error_report("%s: Could not find SaveStateEntry, idstr '%s', "
> +                     "instance_id %" PRIu32,
> +                     __func__, buf.idstr, buf.instance_id);
> +
> +        return -ENOENT;
> +    }
> +
> +    if (!se->ops || !se->ops->initial_data_advise) {
> +        error_report("%s: '%s' doesn't have required "
> +                     "initial_data_advise op",
> +                     __func__, buf.idstr);
> +
> +        return -EOPNOTSUPP;
> +    }
> +
> +    if (!se->ops->initial_data_advise(se->opaque)) {
> +        error_report("%s: '%s' doesn't support precopy initial data", __func__,
> +                     buf.idstr);
> +
> +        return -EOPNOTSUPP;
> +    }
> +
> +    trace_loadvm_handle_initial_data_enable(buf.general_enable,
> +                                            (char *)buf.idstr, buf.instance_id);
> +
> +    return 0;
> +}
> +
>  /*
>   * Process an incoming 'QEMU_VM_COMMAND'
>   * 0           just a normal return
> @@ -2397,6 +2496,9 @@ static int loadvm_process_command(QEMUFile *f)
>  
>      case MIG_CMD_ENABLE_COLO:
>          return loadvm_process_enable_colo(mis);
> +
> +    case MIG_CMD_INITIAL_DATA_ENABLE:
> +        return loadvm_handle_initial_data_enable(mis);
>      }
>  
>      return 0;
> diff --git a/migration/trace-events b/migration/trace-events
> index 92161eeac5..21ae471126 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -23,6 +23,7 @@ loadvm_postcopy_ram_handle_discard_end(void) ""
>  loadvm_postcopy_ram_handle_discard_header(const char *ramid, uint16_t len) "%s: %ud"
>  loadvm_process_command(const char *s, uint16_t len) "com=%s len=%d"
>  loadvm_process_command_ping(uint32_t val) "0x%x"
> +loadvm_handle_initial_data_enable(uint8_t general_enable, const char *idstr, int instance_id) "general_enable=%u, idstr=%s, instance_id=%u"
>  postcopy_ram_listen_thread_exit(void) ""
>  postcopy_ram_listen_thread_start(void) ""
>  qemu_savevm_send_postcopy_advise(void) ""
> @@ -38,6 +39,7 @@ savevm_send_postcopy_run(void) ""
>  savevm_send_postcopy_resume(void) ""
>  savevm_send_colo_enable(void) ""
>  savevm_send_recv_bitmap(char *name) "%s"
> +savevm_send_initial_data_enable(uint8_t general_enable, const char *idstr, int instance_id) "general_enable=%u, idstr=%s, instance_id=%u"
>  savevm_state_setup(void) ""
>  savevm_state_resume_prepare(void) ""
>  savevm_state_header(void) ""
> -- 
> 2.26.3
> 

-- 
Peter Xu


