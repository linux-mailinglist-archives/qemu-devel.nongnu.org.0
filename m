Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3309702A5E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:18:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVHK-0002Cy-0F; Mon, 15 May 2023 06:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyVHH-0002Cl-98
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:18:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyVHE-00042Y-V3
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684145879;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ubL6mq70krN1JHz83jifx9/KYiAz7fD/adwmFgklkhQ=;
 b=AJw/gv41M8Dh0ds0yQ47QQBUu1/Sd97aA5Wk5lzR31vXMeQjiRcHdGxI3KXqnvzbH0Q5ds
 NvaJ2mibgfr/7jXy641B9/5WAs/6Q9vGiGMx0jAqJYpzbuC93ZbDsjkavkOkMedO4s0nAA
 1/+rzOwu8DYNvHwlITlwXPOttp7Kg5g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-mfetkGMDPA219s3oENEktQ-1; Mon, 15 May 2023 06:17:56 -0400
X-MC-Unique: mfetkGMDPA219s3oENEktQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFA4D3C1CF28;
 Mon, 15 May 2023 10:17:55 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FC40492B00;
 Mon, 15 May 2023 10:17:44 +0000 (UTC)
Date: Mon, 15 May 2023 11:17:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v4 3/8] migration: converts socket backend to accept
 MigrateAddress struct
Message-ID: <ZGIGxf5WaHwasY1p@redhat.com>
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-4-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230512143240.192504-4-het.gala@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, May 12, 2023 at 02:32:35PM +0000, Het Gala wrote:
> Socket transport backend for 'migrate'/'migrate-incoming' QAPIs accept
> new wire protocol of MigrateAddress struct.
> 
> It is achived by parsing 'uri' string and storing migration parameters
> required for socket connection into well defined SocketAddress struct.
> 
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/exec.c      |  4 ++--
>  migration/exec.h      |  4 ++++
>  migration/migration.c | 44 +++++++++++++++++++++++++++++++------------
>  migration/socket.c    | 34 +++++----------------------------
>  migration/socket.h    |  7 ++++---
>  5 files changed, 47 insertions(+), 46 deletions(-)
> 
> diff --git a/migration/exec.c b/migration/exec.c
> index 2bf882bbe1..c4a3293246 100644
> --- a/migration/exec.c
> +++ b/migration/exec.c
> @@ -27,7 +27,6 @@
>  #include "qemu/cutils.h"
>  
>  #ifdef WIN32
> -const char *exec_get_cmd_path(void);
>  const char *exec_get_cmd_path(void)
>  {
>      g_autofree char *detected_path = g_new(char, MAX_PATH);
> @@ -40,7 +39,8 @@ const char *exec_get_cmd_path(void)
>  }
>  #endif
>  
> -void exec_start_outgoing_migration(MigrationState *s, const char *command, Error **errp)
> +void exec_start_outgoing_migration(MigrationState *s, const char *command,
> +                                   Error **errp)
>  {
>      QIOChannel *ioc;
>  
> diff --git a/migration/exec.h b/migration/exec.h
> index b210ffde7a..736cd71028 100644
> --- a/migration/exec.h
> +++ b/migration/exec.h
> @@ -19,6 +19,10 @@
>  
>  #ifndef QEMU_MIGRATION_EXEC_H
>  #define QEMU_MIGRATION_EXEC_H
> +
> +#ifdef WIN32
> +const char *exec_get_cmd_path(void);
> +#endif
>  void exec_start_incoming_migration(const char *host_port, Error **errp);
>  
>  void exec_start_outgoing_migration(MigrationState *s, const char *host_port,
> diff --git a/migration/migration.c b/migration/migration.c
> index a7e4e286aa..61f52d2f90 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -421,7 +421,11 @@ static bool migrate_uri_parse(const char *uri,
>  
>      if (strstart(uri, "exec:", NULL)) {
>          addrs->transport = MIGRATE_TRANSPORT_EXEC;
> +#ifdef WIN32
> +        QAPI_LIST_APPEND(tail, g_strdup(exec_get_cmd_path()));
> +#else
>          QAPI_LIST_APPEND(tail, g_strdup("/bin/sh"));
> +#endif

This windows portability code should have been in the previous patch
I think.

>          QAPI_LIST_APPEND(tail, g_strdup("-c"));
>          QAPI_LIST_APPEND(tail, g_strdup(uri + strlen("exec:")));
>      } else if (strstart(uri, "rdma:", NULL) &&
> @@ -450,8 +454,10 @@ static bool migrate_uri_parse(const char *uri,
>  
>  static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
> +    Error *local_err = NULL;
>      const char *p = NULL;
>      MigrateAddress *channel = g_new0(MigrateAddress, 1);
> +    SocketAddress *saddr;
>  
>      /* URI is not suitable for migration? */
>      if (!migration_channels_and_uri_compatible(uri, errp)) {
> @@ -463,23 +469,32 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>          goto out;
>      }
>  
> +    saddr = &channel->u.socket;

Accessing u.socket before checkout transport == SOCKET is bad
practice, even though this is technically safe.

>      qapi_event_send_migration(MIGRATION_STATUS_SETUP);
> -    if (strstart(uri, "tcp:", &p) ||
> -        strstart(uri, "unix:", NULL) ||
> -        strstart(uri, "vsock:", NULL)) {
> -        socket_start_incoming_migration(p ? p : uri, errp);
> +    if (channel->transport == MIGRATE_TRANSPORT_SOCKET) {

THis should have

    SocketAddress *saddr = &channe->u.socket

so that 'saddr' is limited in scope to where we've validated
transport == SOCKET

> +        if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
> +            saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
> +            saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
> +            socket_start_incoming_migration(saddr, &local_err);
> +        } else if (saddr->type == SOCKET_ADDRESS_TYPE_FD) {
> +            fd_start_incoming_migration(saddr->u.fd.str, &local_err);
> +        }
>  #ifdef CONFIG_RDMA
>      } else if (strstart(uri, "rdma:", &p)) {
>          rdma_start_incoming_migration(p, errp);
>  #endif
>      } else if (strstart(uri, "exec:", &p)) {
>          exec_start_incoming_migration(p, errp);
> -    } else if (strstart(uri, "fd:", &p)) {
> -        fd_start_incoming_migration(p, errp);
>      } else {
>          error_setg(errp, "unknown migration protocol: %s", uri);
>      }
>  
> +    if (local_err) {
> +        qapi_free_SocketAddress(saddr);
> +        error_propagate(errp, local_err);
> +        return;

THis leaks 'channel', and free's 'saddr' which actually  belongs
to channel.

With my comments on the previous patch suggesting g_autoptr for
'channel', we don't need any free calls for 'saddr' or 'channel'.

> +    }
> +
>  out:
>      qapi_free_MigrateAddress(channel);
>  }
> @@ -1688,6 +1703,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>      MigrationState *s = migrate_get_current();
>      const char *p = NULL;
>      MigrateAddress *channel = g_new0(MigrateAddress, 1);
> +    SocketAddress *saddr;
>  
>      /* URI is not suitable for migration? */
>      if (!migration_channels_and_uri_compatible(uri, errp)) {
> @@ -1711,18 +1727,21 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>          }
>      }
>  
> -    if (strstart(uri, "tcp:", &p) ||
> -        strstart(uri, "unix:", NULL) ||
> -        strstart(uri, "vsock:", NULL)) {
> -        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
> +    saddr = &channel->u.socket;

Again, put this *after*  checking transport == SOCKET

> +    if (channel->transport == MIGRATE_TRANSPORT_SOCKET) {
> +        if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
> +            saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
> +            saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
> +            socket_start_outgoing_migration(s, saddr, &local_err);
> +        } else if (saddr->type == SOCKET_ADDRESS_TYPE_FD) {
> +            fd_start_outgoing_migration(s, saddr->u.fd.str, &local_err);
> +        }
>  #ifdef CONFIG_RDMA
>      } else if (strstart(uri, "rdma:", &p)) {
>          rdma_start_outgoing_migration(s, p, &local_err);
>  #endif
>      } else if (strstart(uri, "exec:", &p)) {
>          exec_start_outgoing_migration(s, p, &local_err);
> -    } else if (strstart(uri, "fd:", &p)) {
> -        fd_start_outgoing_migration(s, p, &local_err);
>      } else {
>          if (!(has_resume && resume)) {
>              yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> @@ -1739,6 +1758,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>          if (!(has_resume && resume)) {
>              yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>          }
> +        qapi_free_SocketAddress(saddr);

This saddr pointer belongs to 'channel' which must be freed.

>          migrate_fd_error(s, local_err);
>          error_propagate(errp, local_err);
>          return;
> diff --git a/migration/socket.c b/migration/socket.c
> index 1b6f5baefb..8e7430b266 100644
> --- a/migration/socket.c
> +++ b/migration/socket.c
> @@ -108,10 +108,9 @@ out:
>      object_unref(OBJECT(sioc));
>  }
>  
> -static void
> -socket_start_outgoing_migration_internal(MigrationState *s,
> -                                         SocketAddress *saddr,
> -                                         Error **errp)
> +void socket_start_outgoing_migration(MigrationState *s,
> +                                     SocketAddress *saddr,
> +                                     Error **errp)
>  {
>      QIOChannelSocket *sioc = qio_channel_socket_new();
>      struct SocketConnectData *data = g_new0(struct SocketConnectData, 1);
> @@ -135,18 +134,6 @@ socket_start_outgoing_migration_internal(MigrationState *s,
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
> @@ -172,9 +159,8 @@ socket_incoming_migration_end(void *opaque)
>      object_unref(OBJECT(listener));
>  }
>  
> -static void
> -socket_start_incoming_migration_internal(SocketAddress *saddr,
> -                                         Error **errp)
> +void socket_start_incoming_migration(SocketAddress *saddr,
> +                                     Error **errp)
>  {
>      QIONetListener *listener = qio_net_listener_new();
>      MigrationIncomingState *mis = migration_incoming_get_current();
> @@ -213,13 +199,3 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
>      }
>  }
>  
> -void socket_start_incoming_migration(const char *str, Error **errp)
> -{
> -    Error *err = NULL;
> -    SocketAddress *saddr = socket_parse(str, &err);
> -    if (!err) {
> -        socket_start_incoming_migration_internal(saddr, &err);
> -    }
> -    qapi_free_SocketAddress(saddr);
> -    error_propagate(errp, err);
> -}
> diff --git a/migration/socket.h b/migration/socket.h
> index dc54df4e6c..5e4c33b8ea 100644
> --- a/migration/socket.h
> +++ b/migration/socket.h
> @@ -19,13 +19,14 @@
>  
>  #include "io/channel.h"
>  #include "io/task.h"
> +#include "qemu/sockets.h"
>  
>  void socket_send_channel_create(QIOTaskFunc f, void *data);
>  QIOChannel *socket_send_channel_create_sync(Error **errp);
>  int socket_send_channel_destroy(QIOChannel *send);
>  
> -void socket_start_incoming_migration(const char *str, Error **errp);
> +void socket_start_incoming_migration(SocketAddress *saddr, Error **errp);
>  
> -void socket_start_outgoing_migration(MigrationState *s, const char *str,
> -                                     Error **errp);
> +void socket_start_outgoing_migration(MigrationState *s,
> +                                     SocketAddress *saddr, Error **errp);
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


