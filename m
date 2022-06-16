Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE30054E9AC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 20:51:56 +0200 (CEST)
Received: from localhost ([::1]:58854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1uay-0001mV-09
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 14:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o1uWo-0008C4-FY
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 14:47:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o1uWk-0002pr-RS
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 14:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655405253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ApNGxrQQlNTzl9zGVrubUZHR06HHQXnJrjxsIoy9hIw=;
 b=Lp/9zk/EuZSja8fdLAY0cukm+8I3Q6SlJjWOiKQLujMS6//3RdKUZxKK5ilJjQFBmmcSAD
 Sg1R0GU8T+igWs+f8fUiKWzP66L4jXbt+XRDw3CF61/7/UpvXhkF70XIrNtVTIT7TWmdhB
 dGRUca2E3AJRTKT0kxfRU08WJh3+nEI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-YmJpg5_EMeSkYdmn6hyPpg-1; Thu, 16 Jun 2022 14:47:32 -0400
X-MC-Unique: YmJpg5_EMeSkYdmn6hyPpg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m23-20020a05600c3b1700b0039c6e3c169aso1264904wms.2
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 11:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ApNGxrQQlNTzl9zGVrubUZHR06HHQXnJrjxsIoy9hIw=;
 b=tV4MGV6O1V4eDerlMtrpaHyv1wATObOa5vUCMhJ7IsxohUlmZNoWaBNswIWr9FH4Ss
 Kbzb9pjvLeReLCOMwTGk5X9dc98GGfFH9PG6WxAQdZUbRgwRI35mfzKOXYPvzlRttQlR
 r1UxyBpOzxP8lCPEU9sM/YUT3d2IPcjuDSTNfNmklAHjS2yghcRvnPtES0DHazdRJgtm
 H564ehV5Ai6f9MiKFwCKzBeva1a7Vt6HCIw9J1OIM7xeSkynbi+JCGb2Vh24Vz2QMue3
 uh6TV9oAW/qcNIEPrTZJKHD/OlWIJoZkZuofufddg2pIz3gQvGlgUYHhB4oCWVmJi6cp
 r8eA==
X-Gm-Message-State: AJIora8D5IBPJImsLtPvE1aUrOVDRxIoBo+w4U1FwfZK6Oadj1wcxUiB
 56BivJntf5pVNNz/M42oPSlCsQNOzZJ6C7Af/Xsa/lsOyXEg7+D+pGqqjtR/B3xKbEnUeJCEXTT
 rFg52L2IIbJI1YBU=
X-Received: by 2002:a5d:4dc9:0:b0:215:c611:db73 with SMTP id
 f9-20020a5d4dc9000000b00215c611db73mr6159945wru.551.1655405251108; 
 Thu, 16 Jun 2022 11:47:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sYYfT9/SDEgOSmsTD39XNpL0F5jNpC7HGEzVx1lHB1NuY2ApWlkMsabQ4c9gpUse4fKKqTfA==
X-Received: by 2002:a5d:4dc9:0:b0:215:c611:db73 with SMTP id
 f9-20020a5d4dc9000000b00215c611db73mr6159928wru.551.1655405250811; 
 Thu, 16 Jun 2022 11:47:30 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 p10-20020adff20a000000b0020fe4c5e94csm2541678wro.19.2022.06.16.11.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 11:47:30 -0700 (PDT)
Date: Thu, 16 Jun 2022 19:47:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH 4/4] Adding support for multi-FD connections dynamically
Message-ID: <Yqt6wH8+i+pDBHNU@work-vm>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-5-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609073305.142515-5-het.gala@nutanix.com>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Het Gala (het.gala@nutanix.com) wrote:
> i) Dynamically decide appropriate source and destination ip pairs for the
>    corresponding multi-FD channel to be connected.
> 
> ii) Removed the support for setting the number of multi-fd channels from qmp
>     commands. As now all multiFD parameters will be passed via qmp: migrate
>     command or incoming flag itself.

We can't do that, because it's part of the API already; what you'll need
to do is check that the number of entries in your list corresponds to
the value set there and error if it's different.

Dave

> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/migration.c | 15 ---------------
>  migration/migration.h |  1 -
>  migration/multifd.c   | 42 +++++++++++++++++++++---------------------
>  migration/socket.c    | 42 +++++++++++++++++++++++++++++++++---------
>  migration/socket.h    |  4 +++-
>  monitor/hmp-cmds.c    |  4 ----
>  qapi/migration.json   |  6 ------
>  7 files changed, 57 insertions(+), 57 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 9b0ad732e7..57dd4494b4 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1585,9 +1585,6 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
>      if (params->has_block_incremental) {
>          dest->block_incremental = params->block_incremental;
>      }
> -    if (params->has_multifd_channels) {
> -        dest->multifd_channels = params->multifd_channels;
> -    }
>      if (params->has_multifd_compression) {
>          dest->multifd_compression = params->multifd_compression;
>      }
> @@ -1702,9 +1699,6 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
>      if (params->has_block_incremental) {
>          s->parameters.block_incremental = params->block_incremental;
>      }
> -    if (params->has_multifd_channels) {
> -        s->parameters.multifd_channels = params->multifd_channels;
> -    }
>      if (params->has_multifd_compression) {
>          s->parameters.multifd_compression = params->multifd_compression;
>      }
> @@ -2686,15 +2680,6 @@ bool migrate_pause_before_switchover(void)
>          MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER];
>  }
>  
> -int migrate_multifd_channels(void)
> -{
> -    MigrationState *s;
> -
> -    s = migrate_get_current();
> -
> -    return s->parameters.multifd_channels;
> -}
> -
>  MultiFDCompression migrate_multifd_compression(void)
>  {
>      MigrationState *s;
> diff --git a/migration/migration.h b/migration/migration.h
> index fa8717ec9e..9464de8ef7 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -372,7 +372,6 @@ bool migrate_validate_uuid(void);
>  bool migrate_auto_converge(void);
>  bool migrate_use_multifd(void);
>  bool migrate_pause_before_switchover(void);
> -int migrate_multifd_channels(void);
>  MultiFDCompression migrate_multifd_compression(void);
>  int migrate_multifd_zlib_level(void);
>  int migrate_multifd_zstd_level(void);
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 9282ab6aa4..ce017436fb 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -225,7 +225,7 @@ static int multifd_recv_initial_packet(QIOChannel *c, Error **errp)
>          return -1;
>      }
>  
> -    if (msg.id > migrate_multifd_channels()) {
> +    if (msg.id > total_multifd_channels()) {
>          error_setg(errp, "multifd: received channel version %u "
>                     "expected %u", msg.version, MULTIFD_VERSION);
>          return -1;
> @@ -410,8 +410,8 @@ static int multifd_send_pages(QEMUFile *f)
>       * using more channels, so ensure it doesn't overflow if the
>       * limit is lower now.
>       */
> -    next_channel %= migrate_multifd_channels();
> -    for (i = next_channel;; i = (i + 1) % migrate_multifd_channels()) {
> +    next_channel %= total_multifd_channels();
> +    for (i = next_channel;; i = (i + 1) % total_multifd_channels()) {
>          p = &multifd_send_state->params[i];
>  
>          qemu_mutex_lock(&p->mutex);
> @@ -422,7 +422,7 @@ static int multifd_send_pages(QEMUFile *f)
>          }
>          if (!p->pending_job) {
>              p->pending_job++;
> -            next_channel = (i + 1) % migrate_multifd_channels();
> +            next_channel = (i + 1) % total_multifd_channels();
>              break;
>          }
>          qemu_mutex_unlock(&p->mutex);
> @@ -500,7 +500,7 @@ static void multifd_send_terminate_threads(Error *err)
>          return;
>      }
>  
> -    for (i = 0; i < migrate_multifd_channels(); i++) {
> +    for (i = 0; i < total_multifd_channels(); i++) {
>          MultiFDSendParams *p = &multifd_send_state->params[i];
>  
>          qemu_mutex_lock(&p->mutex);
> @@ -521,14 +521,14 @@ void multifd_save_cleanup(void)
>          return;
>      }
>      multifd_send_terminate_threads(NULL);
> -    for (i = 0; i < migrate_multifd_channels(); i++) {
> +    for (i = 0; i < total_multifd_channels(); i++) {
>          MultiFDSendParams *p = &multifd_send_state->params[i];
>  
>          if (p->running) {
>              qemu_thread_join(&p->thread);
>          }
>      }
> -    for (i = 0; i < migrate_multifd_channels(); i++) {
> +    for (i = 0; i < total_multifd_channels(); i++) {
>          MultiFDSendParams *p = &multifd_send_state->params[i];
>          Error *local_err = NULL;
>  
> @@ -594,7 +594,7 @@ int multifd_send_sync_main(QEMUFile *f)
>  
>      flush_zero_copy = migrate_use_zero_copy_send();
>  
> -    for (i = 0; i < migrate_multifd_channels(); i++) {
> +    for (i = 0; i < total_multifd_channels(); i++) {
>          MultiFDSendParams *p = &multifd_send_state->params[i];
>  
>          trace_multifd_send_sync_main_signal(p->id);
> @@ -627,7 +627,7 @@ int multifd_send_sync_main(QEMUFile *f)
>              }
>          }
>      }
> -    for (i = 0; i < migrate_multifd_channels(); i++) {
> +    for (i = 0; i < total_multifd_channels(); i++) {
>          MultiFDSendParams *p = &multifd_send_state->params[i];
>  
>          trace_multifd_send_sync_main_wait(p->id);
> @@ -903,7 +903,7 @@ int multifd_save_setup(Error **errp)
>      int thread_count;
>      uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
>      uint8_t i;
> -
> +    int idx;
>      if (!migrate_use_multifd()) {
>          return 0;
>      }
> @@ -912,7 +912,7 @@ int multifd_save_setup(Error **errp)
>          return -1;
>      }
>  
> -    thread_count = migrate_multifd_channels();
> +    thread_count = total_multifd_channels();
>      multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
>      multifd_send_state->params = g_new0(MultiFDSendParams, thread_count);
>      multifd_send_state->pages = multifd_pages_init(page_count);
> @@ -945,8 +945,8 @@ int multifd_save_setup(Error **errp)
>          } else {
>              p->write_flags = 0;
>          }
> -
> -        socket_send_channel_create(multifd_new_send_channel_async, p);
> +        idx = multifd_index(i);
> +        socket_send_channel_create(multifd_new_send_channel_async, p, idx);
>      }
>  
>      for (i = 0; i < thread_count; i++) {
> @@ -991,7 +991,7 @@ static void multifd_recv_terminate_threads(Error *err)
>          }
>      }
>  
> -    for (i = 0; i < migrate_multifd_channels(); i++) {
> +    for (i = 0; i < total_multifd_channels(); i++) {
>          MultiFDRecvParams *p = &multifd_recv_state->params[i];
>  
>          qemu_mutex_lock(&p->mutex);
> @@ -1017,7 +1017,7 @@ int multifd_load_cleanup(Error **errp)
>          return 0;
>      }
>      multifd_recv_terminate_threads(NULL);
> -    for (i = 0; i < migrate_multifd_channels(); i++) {
> +    for (i = 0; i < total_multifd_channels(); i++) {
>          MultiFDRecvParams *p = &multifd_recv_state->params[i];
>  
>          if (p->running) {
> @@ -1030,7 +1030,7 @@ int multifd_load_cleanup(Error **errp)
>              qemu_thread_join(&p->thread);
>          }
>      }
> -    for (i = 0; i < migrate_multifd_channels(); i++) {
> +    for (i = 0; i < total_multifd_channels(); i++) {
>          MultiFDRecvParams *p = &multifd_recv_state->params[i];
>  
>          migration_ioc_unregister_yank(p->c);
> @@ -1065,13 +1065,13 @@ void multifd_recv_sync_main(void)
>      if (!migrate_use_multifd()) {
>          return;
>      }
> -    for (i = 0; i < migrate_multifd_channels(); i++) {
> +    for (i = 0; i < total_multifd_channels(); i++) {
>          MultiFDRecvParams *p = &multifd_recv_state->params[i];
>  
>          trace_multifd_recv_sync_main_wait(p->id);
>          qemu_sem_wait(&multifd_recv_state->sem_sync);
>      }
> -    for (i = 0; i < migrate_multifd_channels(); i++) {
> +    for (i = 0; i < total_multifd_channels(); i++) {
>          MultiFDRecvParams *p = &multifd_recv_state->params[i];
>  
>          WITH_QEMU_LOCK_GUARD(&p->mutex) {
> @@ -1166,7 +1166,7 @@ int multifd_load_setup(Error **errp)
>          error_setg(errp, "multifd is not supported by current protocol");
>          return -1;
>      }
> -    thread_count = migrate_multifd_channels();
> +    thread_count = total_multifd_channels();
>      multifd_recv_state = g_malloc0(sizeof(*multifd_recv_state));
>      multifd_recv_state->params = g_new0(MultiFDRecvParams, thread_count);
>      qatomic_set(&multifd_recv_state->count, 0);
> @@ -1204,7 +1204,7 @@ int multifd_load_setup(Error **errp)
>  
>  bool multifd_recv_all_channels_created(void)
>  {
> -    int thread_count = migrate_multifd_channels();
> +    int thread_count = total_multifd_channels();
>  
>      if (!migrate_use_multifd()) {
>          return true;
> @@ -1259,5 +1259,5 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>                         QEMU_THREAD_JOINABLE);
>      qatomic_inc(&multifd_recv_state->count);
>      return qatomic_read(&multifd_recv_state->count) ==
> -           migrate_multifd_channels();
> +           total_multifd_channels();
>  }
> diff --git a/migration/socket.c b/migration/socket.c
> index d0cb7cc6a6..c0ac6dbbe2 100644
> --- a/migration/socket.c
> +++ b/migration/socket.c
> @@ -28,9 +28,6 @@
>  #include "trace.h"
>  
>  
> -struct SocketOutgoingArgs {
> -    SocketAddress *saddr;
> -} outgoing_args;
>  
>  struct SocketArgs {
>      struct SrcDestAddr data;
> @@ -43,20 +40,47 @@ struct OutgoingMigrateParams {
>      uint64_t total_multifd_channel;
>  } outgoing_migrate_params;
>  
> -void socket_send_channel_create(QIOTaskFunc f, void *data)
> +
> +int total_multifd_channels(void)
> +{
> +    return outgoing_migrate_params.total_multifd_channel;
> +}
> +
> +int multifd_index(int i)
> +{
> +    int length = outgoing_migrate_params.length;
> +    int j = 0;
> +    int runn_sum = 0;
> +    while (j < length) {
> +        runn_sum += outgoing_migrate_params.socket_args[j].multifd_channels;
> +        if (i >= runn_sum) {
> +            j++;
> +        } else {
> +            break;
> +        }
> +    }
> +    return j;
> +}
> +
> +void socket_send_channel_create(QIOTaskFunc f, void *data, int idx)
>  {
>      QIOChannelSocket *sioc = qio_channel_socket_new();
> -    qio_channel_socket_connect_async(sioc, outgoing_args.saddr,
> -                                     f, data, NULL, NULL, NULL);
> +    qio_channel_socket_connect_async(sioc,
> +                       outgoing_migrate_params.socket_args[idx].data.dst_addr,
> +                       f, data, NULL, NULL,
> +                       outgoing_migrate_params.socket_args[idx].data.src_addr);
>  }
>  
>  int socket_send_channel_destroy(QIOChannel *send)
>  {
>      /* Remove channel */
>      object_unref(OBJECT(send));
> -    if (outgoing_args.saddr) {
> -        qapi_free_SocketAddress(outgoing_args.saddr);
> -        outgoing_args.saddr = NULL;
> +    if (outgoing_migrate_params.socket_args != NULL) {
> +        g_free(outgoing_migrate_params.socket_args);
> +        outgoing_migrate_params.socket_args = NULL;
> +    }
> +    if (outgoing_migrate_params.length) {
> +        outgoing_migrate_params.length = 0;
>      }
>  
>      if (outgoing_migrate_params.socket_args != NULL) {
> diff --git a/migration/socket.h b/migration/socket.h
> index b9e3699167..c8b9252384 100644
> --- a/migration/socket.h
> +++ b/migration/socket.h
> @@ -27,7 +27,9 @@ struct SrcDestAddr {
>      SocketAddress *src_addr;
>  };
>  
> -void socket_send_channel_create(QIOTaskFunc f, void *data);
> +int total_multifd_channels(void);
> +int multifd_index(int i);
> +void socket_send_channel_create(QIOTaskFunc f, void *data, int idx);
>  int socket_send_channel_destroy(QIOChannel *send);
>  
>  void socket_start_incoming_migration(const char *str, uint8_t number,
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 32a6b67d5f..9a3d76d6ba 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1281,10 +1281,6 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>          p->has_block_incremental = true;
>          visit_type_bool(v, param, &p->block_incremental, &err);
>          break;
> -    case MIGRATION_PARAMETER_MULTIFD_CHANNELS:
> -        p->has_multifd_channels = true;
> -        visit_type_uint8(v, param, &p->multifd_channels, &err);
> -        break;
>      case MIGRATION_PARAMETER_MULTIFD_COMPRESSION:
>          p->has_multifd_compression = true;
>          visit_type_MultiFDCompression(v, param, &p->multifd_compression,
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 62a7b22d19..1b1c6d01d3 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -877,11 +877,6 @@
>  #                     migrated and the destination must already have access to the
>  #                     same backing chain as was used on the source.  (since 2.10)
>  #
> -# @multifd-channels: Number of channels used to migrate data in
> -#                    parallel. This is the same number that the
> -#                    number of sockets used for migration.  The
> -#                    default value is 2 (since 4.0)
> -#
>  # @xbzrle-cache-size: cache size to be used by XBZRLE migration.  It
>  #                     needs to be a multiple of the target page size
>  #                     and a power of 2
> @@ -965,7 +960,6 @@
>              '*x-checkpoint-delay': { 'type': 'uint32',
>                                       'features': [ 'unstable' ] },
>              '*block-incremental': 'bool',
> -            '*multifd-channels': 'uint8',
>              '*xbzrle-cache-size': 'size',
>              '*max-postcopy-bandwidth': 'size',
>              '*max-cpu-throttle': 'uint8',
> -- 
> 2.22.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


