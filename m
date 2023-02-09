Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B4369083E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 13:11:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ5kE-0004rk-S0; Thu, 09 Feb 2023 07:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ5k7-0004qx-2Z
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:09:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ5k3-0001oK-BD
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675944570;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qsCO7pLBPWTth3Fa6WTEG62BShIK7vJxWOxO+NKbylo=;
 b=ISNg2sJb/S5cU5tsk5pfiWS5KxziKQFnjdDT/nyNGrUYG+dmPO02Wa6EqhLfH3lLTY8Z3O
 yiiKPTQkAFRidha6p7HhcTiJdL7QO9Fue5q79RtkKA5K51BwIv1gYpvAmgQfMOf9R1pKpl
 uiiQ2SbziwOhPRulFBwvT/wEtwpIG5Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-bx-jyND1MZiJzpMZJDkymQ-1; Thu, 09 Feb 2023 07:09:27 -0500
X-MC-Unique: bx-jyND1MZiJzpMZJDkymQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9AF61C04192;
 Thu,  9 Feb 2023 12:09:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DE93492B01;
 Thu,  9 Feb 2023 12:09:24 +0000 (UTC)
Date: Thu, 9 Feb 2023 12:09:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v2 4/6] migration: Avoid multiple parsing of uri in
 migration code flow
Message-ID: <Y+TicReIdgA9P6q3@redhat.com>
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-5-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230208093600.242665-5-het.gala@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 08, 2023 at 09:35:58AM +0000, Het Gala wrote:
> In existing senario, 'migrate' QAPI argument - string uri, is encoded
> twice to extract migration parameters for stream connection. This is
> not a good representation of migration wire protocol as it is a data
> encoding scheme within a data encoding scheme. Qemu should be able to
> directly work with results from QAPI without having to do a second
> level parsing.
> Modified 'migrate' QAPI design supports well defined MigrateChannel
> struct which plays important role in avoiding double encoding
> of uri strings.
> 
> qemu_uri_parsing() parses uri string (kept for backward
> compatibility) and populate the MigrateChannel struct parameters.
> Migration code flow for all required migration transport types -
> socket, exec and rdma is modified.
> 
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/exec.c      | 31 ++++++++++++++++--
>  migration/exec.h      |  4 ++-
>  migration/migration.c | 75 +++++++++++++++++++++++++++++++++++--------
>  migration/rdma.c      | 30 +++++------------
>  migration/rdma.h      |  3 +-
>  migration/socket.c    | 21 ++++--------
>  migration/socket.h    |  3 +-
>  7 files changed, 110 insertions(+), 57 deletions(-)
> 
> diff --git a/migration/exec.c b/migration/exec.c
> index 375d2e1b54..4fa9819792 100644
> --- a/migration/exec.c
> +++ b/migration/exec.c
> @@ -23,14 +23,39 @@
>  #include "migration.h"
>  #include "io/channel-command.h"
>  #include "trace.h"
> +#include "qapi/error.h"
>  
>  
> -void exec_start_outgoing_migration(MigrationState *s, const char *command, Error **errp)
> +void init_exec_array(strList *command, const char *argv[], Error **errp)
> +{
> +    int i = 0;
> +    strList *lst;
> +
> +    for (lst = command; lst ; lst = lst->next) {
> +        argv[i++] = lst->value;
> +    }
> +
> +    /*
> +     * Considering exec command always has 3 arguments to execute
> +     * a command directly from the bash itself.
> +     */
> +    if (i > 3) {
> +        error_setg(errp, "exec accepts maximum of 3 arguments in the list");
> +        return;
> +    }

By the time this check fires, the for() loop above has already
done out of bounds writes on argv[].

> +
> +    argv[i] = NULL;
> +    return;
> +}
> +
> +void exec_start_outgoing_migration(MigrationState *s, strList *command,
> +                                   Error **errp)
>  {
>      QIOChannel *ioc;
> -    const char *argv[] = { "/bin/sh", "-c", command, NULL };
> +    const char *argv[4];
> +    init_exec_array(command, argv, errp);

If someone invokes 'migrate' with the old URI style, the
strList will be 3 elements, and thus argv[4] is safe.

If someone invokes 'migrate' with thue new MigrateChannel style,
the strList can be arbitrarily long and thus argv[4] will be
risk of overflow. 

>  
> -    trace_migration_exec_outgoing(command);
> +    trace_migration_exec_outgoing(argv[2]);
>      ioc = QIO_CHANNEL(qio_channel_command_new_spawn(argv,
>                                                      O_RDWR,
>                                                      errp));
> diff --git a/migration/exec.h b/migration/exec.h
> index b210ffde7a..5b39ba6cbb 100644
> --- a/migration/exec.h
> +++ b/migration/exec.h
> @@ -19,8 +19,10 @@
>  
>  #ifndef QEMU_MIGRATION_EXEC_H
>  #define QEMU_MIGRATION_EXEC_H
> +void init_exec_array(strList *command, const char *argv[], Error **errp);
> +
>  void exec_start_incoming_migration(const char *host_port, Error **errp);
>  
> -void exec_start_outgoing_migration(MigrationState *s, const char *host_port,
> +void exec_start_outgoing_migration(MigrationState *s, strList *host_port,
>                                     Error **errp);
>  #endif
> diff --git a/migration/migration.c b/migration/migration.c
> index f6dd8dbb03..accbf72a18 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -63,6 +63,7 @@
>  #include "sysemu/cpus.h"
>  #include "yank_functions.h"
>  #include "sysemu/qtest.h"
> +#include "qemu/sockets.h"
>  #include "ui/qemu-spice.h"
>  
>  #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
> @@ -489,6 +490,44 @@ void migrate_add_address(SocketAddress *address)
>                        QAPI_CLONE(SocketAddress, address));
>  }
>  
> +static bool migrate_uri_parse(const char *uri,
> +                              MigrateChannel **channel,
> +                              Error **errp)
> +{
> +    Error *local_err = NULL;
> +    MigrateChannel *val = g_new0(MigrateChannel, 1);
> +    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
> +    SocketAddress *saddr = g_new0(SocketAddress, 1);
> +    InetSocketAddress *isock = g_new0(InetSocketAddress, 1);
> +
> +    if (strstart(uri, "exec:", NULL)) {
> +        addrs->transport = MIGRATE_TRANSPORT_EXEC;
> +        addrs->u.exec.data = str_split_at_comma(uri + strlen("exec:"));
> +    } else if (strstart(uri, "rdma:", NULL) &&
> +               !inet_parse(isock, uri + strlen("rdma:"), errp)) {
> +        addrs->transport = MIGRATE_TRANSPORT_RDMA;
> +        addrs->u.rdma.data = isock;
> +    } else if (strstart(uri, "tcp:", NULL) ||
> +                strstart(uri, "unix:", NULL) ||
> +                strstart(uri, "vsock:", NULL) ||
> +                strstart(uri, "fd:", NULL)) {
> +        addrs->transport = MIGRATE_TRANSPORT_SOCKET;
> +        saddr = socket_parse(uri, &local_err);
> +        addrs->u.socket.socket_type = saddr;
> +    }
> +
> +    val->channeltype = MIGRATE_CHANNEL_TYPE_MAIN;
> +    val->addr = addrs;
> +    *channel = val;
> +
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>  static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
>      const char *p = NULL;
> @@ -2469,7 +2508,8 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
>  {
>      Error *local_err = NULL;
>      MigrationState *s = migrate_get_current();
> -    const char *p = NULL;
> +    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
> +    SocketAddress *saddr = g_new0(SocketAddress, 1);
>  
>      if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
>                           has_resume && resume, errp)) {
> @@ -2490,22 +2530,29 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
>          error_setg(errp, "uri and channels options should be"
>                            "mutually exclusive");
>          return;
> +    } else if (uri && !migrate_uri_parse(uri, &channel, &local_err)) {
> +        error_setg(errp, "Error parsing uri");
> +        return;
>      }
>  
>      migrate_protocol_allow_multi_channels(false);
> -    if (strstart(uri, "tcp:", &p) ||
> -        strstart(uri, "unix:", NULL) ||
> -        strstart(uri, "vsock:", NULL)) {
> -        migrate_protocol_allow_multi_channels(true);
> -        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
> -#ifdef CONFIG_RDMA
> -    } else if (strstart(uri, "rdma:", &p)) {
> -        rdma_start_outgoing_migration(s, p, &local_err);
> -#endif
> -    } else if (strstart(uri, "exec:", &p)) {
> -        exec_start_outgoing_migration(s, p, &local_err);
> -    } else if (strstart(uri, "fd:", &p)) {
> -        fd_start_outgoing_migration(s, p, &local_err);
> +    addrs = channel->addr;
> +    saddr = channel->addr->u.socket.socket_type;
> +    if (addrs->transport == MIGRATE_TRANSPORT_SOCKET) {
> +        if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
> +            saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
> +            saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
> +            migrate_protocol_allow_multi_channels(true);
> +            socket_start_outgoing_migration(s, saddr, &local_err);
> +        } else if (saddr->type == SOCKET_ADDRESS_TYPE_FD) {
> +            fd_start_outgoing_migration(s, saddr->u.fd.str, &local_err);
> +        }
> +    #ifdef CONFIG_RDMA
> +    } else if (addrs->transport == MIGRATE_TRANSPORT_RDMA) {
> +        rdma_start_outgoing_migration(s, addrs->u.rdma.data, &local_err);
> +    #endif
> +    } else if (addrs->transport == MIGRATE_TRANSPORT_EXEC) {
> +        exec_start_outgoing_migration(s, addrs->u.exec.data, &local_err);
>      } else {
>          if (!(has_resume && resume)) {
>              yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 288eadc2d2..48f49add6f 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -316,7 +316,6 @@ typedef struct RDMALocalBlocks {
>  typedef struct RDMAContext {
>      char *host;
>      int port;
> -    char *host_port;
>  
>      RDMAWorkRequestData wr_data[RDMA_WRID_MAX];
>  
> @@ -2449,9 +2448,7 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
>          rdma->channel = NULL;
>      }
>      g_free(rdma->host);
> -    g_free(rdma->host_port);
>      rdma->host = NULL;
> -    rdma->host_port = NULL;
>  }
>  
>  
> @@ -2733,28 +2730,17 @@ static void qemu_rdma_return_path_dest_init(RDMAContext *rdma_return_path,
>      rdma_return_path->is_return_path = true;
>  }
>  
> -static void *qemu_rdma_data_init(const char *host_port, Error **errp)
> +static void *qemu_rdma_data_init(InetSocketAddress *saddr, Error **errp)
>  {
>      RDMAContext *rdma = NULL;
> -    InetSocketAddress *addr;
>  
> -    if (host_port) {
> +    if (saddr) {
>          rdma = g_new0(RDMAContext, 1);
>          rdma->current_index = -1;
>          rdma->current_chunk = -1;
>  
> -        addr = g_new(InetSocketAddress, 1);
> -        if (!inet_parse(addr, host_port, NULL)) {
> -            rdma->port = atoi(addr->port);
> -            rdma->host = g_strdup(addr->host);
> -            rdma->host_port = g_strdup(host_port);
> -        } else {
> -            ERROR(errp, "bad RDMA migration address '%s'", host_port);
> -            g_free(rdma);
> -            rdma = NULL;
> -        }
> -
> -        qapi_free_InetSocketAddress(addr);
> +        rdma->host = g_strdup(saddr->host);
> +        rdma->port = atoi(saddr->port);
>      }
>  
>      return rdma;
> @@ -3354,6 +3340,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
>                                              .private_data_len = sizeof(cap),
>                                           };
>      RDMAContext *rdma_return_path = NULL;
> +    InetSocketAddress *isock = g_new0(InetSocketAddress, 1);
>      struct rdma_cm_event *cm_event;
>      struct ibv_context *verbs;
>      int ret = -EINVAL;
> @@ -4152,14 +4139,13 @@ err:
>      error_propagate(errp, local_err);
>      if (rdma) {
>          g_free(rdma->host);
> -        g_free(rdma->host_port);
>      }
>      g_free(rdma);
>      g_free(rdma_return_path);
>  }
>  
>  void rdma_start_outgoing_migration(void *opaque,
> -                            const char *host_port, Error **errp)
> +                            InetSocketAddress *addr, Error **errp)
>  {
>      MigrationState *s = opaque;
>      RDMAContext *rdma_return_path = NULL;
> @@ -4172,7 +4158,7 @@ void rdma_start_outgoing_migration(void *opaque,
>          return;
>      }
>  
> -    rdma = qemu_rdma_data_init(host_port, errp);
> +    rdma = qemu_rdma_data_init(addr, errp);
>      if (rdma == NULL) {
>          goto err;
>      }
> @@ -4193,7 +4179,7 @@ void rdma_start_outgoing_migration(void *opaque,
>  
>      /* RDMA postcopy need a separate queue pair for return path */
>      if (migrate_postcopy()) {
> -        rdma_return_path = qemu_rdma_data_init(host_port, errp);
> +        rdma_return_path = qemu_rdma_data_init(addr, errp);
>  
>          if (rdma_return_path == NULL) {
>              goto return_path_err;
> diff --git a/migration/rdma.h b/migration/rdma.h
> index de2ba09dc5..8d9978e1a9 100644
> --- a/migration/rdma.h
> +++ b/migration/rdma.h
> @@ -13,11 +13,12 @@
>   * later.  See the COPYING file in the top-level directory.
>   *
>   */
> +#include "io/channel-socket.h"
>  
>  #ifndef QEMU_MIGRATION_RDMA_H
>  #define QEMU_MIGRATION_RDMA_H
>  
> -void rdma_start_outgoing_migration(void *opaque, const char *host_port,
> +void rdma_start_outgoing_migration(void *opaque, InetSocketAddress *addr,
>                                     Error **errp);
>  
>  void rdma_start_incoming_migration(const char *host_port, Error **errp);
> diff --git a/migration/socket.c b/migration/socket.c
> index e6fdf3c5e1..c751e0bfc1 100644
> --- a/migration/socket.c
> +++ b/migration/socket.c
> @@ -27,6 +27,8 @@
>  #include "io/net-listener.h"
>  #include "trace.h"
>  #include "postcopy-ram.h"
> +#include "qapi/clone-visitor.h"
> +#include "qapi/qapi-visit-sockets.h"
>  
>  struct SocketOutgoingArgs {
>      SocketAddress *saddr;
> @@ -107,19 +109,20 @@ out:
>      object_unref(OBJECT(sioc));
>  }
>  
> -static void
> -socket_start_outgoing_migration_internal(MigrationState *s,
> +void socket_start_outgoing_migration(MigrationState *s,
>                                           SocketAddress *saddr,
>                                           Error **errp)
>  {
>      QIOChannelSocket *sioc = qio_channel_socket_new();
>      struct SocketConnectData *data = g_new0(struct SocketConnectData, 1);
> +    SocketAddress *addr = g_new0(SocketAddress, 1);
> +    addr = QAPI_CLONE(SocketAddress, saddr);
>  
>      data->s = s;
>  
>      /* in case previous migration leaked it */
>      qapi_free_SocketAddress(outgoing_args.saddr);
> -    outgoing_args.saddr = saddr;
> +    outgoing_args.saddr = addr;
>  
>      if (saddr->type == SOCKET_ADDRESS_TYPE_INET) {
>          data->hostname = g_strdup(saddr->u.inet.host);
> @@ -134,18 +137,6 @@ socket_start_outgoing_migration_internal(MigrationState *s,
>                                       NULL);
>  }
>  
> -void socket_start_outgoing_migration(MigrationState *s,
> -                                     const char *str,
> -                                     Error **errp)
> -{
> -    Error *err = NULL;
> -    SocketAddress *saddr = socket_parse(str, &err);
> -    if (!err) {
> -        socket_start_outgoing_migration_internal(s, saddr, &err);
> -    }
> -    error_propagate(errp, err);
> -}
> -
>  static void socket_accept_incoming_migration(QIONetListener *listener,
>                                               QIOChannelSocket *cioc,
>                                               gpointer opaque)
> diff --git a/migration/socket.h b/migration/socket.h
> index dc54df4e6c..95c9c166ec 100644
> --- a/migration/socket.h
> +++ b/migration/socket.h
> @@ -19,6 +19,7 @@
>  
>  #include "io/channel.h"
>  #include "io/task.h"
> +#include "io/channel-socket.h"
>  
>  void socket_send_channel_create(QIOTaskFunc f, void *data);
>  QIOChannel *socket_send_channel_create_sync(Error **errp);
> @@ -26,6 +27,6 @@ int socket_send_channel_destroy(QIOChannel *send);
>  
>  void socket_start_incoming_migration(const char *str, Error **errp);
>  
> -void socket_start_outgoing_migration(MigrationState *s, const char *str,
> +void socket_start_outgoing_migration(MigrationState *s, SocketAddress *saddr,
>                                       Error **errp);
>  #endif
> -- 
> 2.22.3
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


