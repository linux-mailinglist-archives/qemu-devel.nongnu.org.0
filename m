Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EBA702AD4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:43:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVf5-0004XI-U6; Mon, 15 May 2023 06:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyVf3-0004W5-OU
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:42:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyVf1-0001A5-OO
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684147355;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mAT7D0I0lvuYpsYPRLf1/3PJlSxeb0tEDMjf3gh4Bj8=;
 b=WH4IBlJ4g8oMHxc/Z/HEOgWNqITRsK17WhI7SM4jhNXufNGTPn+WQoH+DHyvr+BjTGI9Dh
 5hKsftRcuf/haMJTWSywqsDu0dBcKkMXYlY+AOMFFnjA/R1GZHELxPn0U9f7aDehd5jaal
 ZtsG9diARp1UKvIqo9btGLkq9G7n8VQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-Wj1LFWJBNXKUCX1F_MaYuw-1; Mon, 15 May 2023 06:42:31 -0400
X-MC-Unique: Wj1LFWJBNXKUCX1F_MaYuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68CC03C0F422;
 Mon, 15 May 2023 10:42:31 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12CD040C6EC4;
 Mon, 15 May 2023 10:42:29 +0000 (UTC)
Date: Mon, 15 May 2023 11:42:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v4 8/8] migration: Introduced MigrateChannelList struct
 to migration code flow.
Message-ID: <ZGIMk9wKg9h6pndM@redhat.com>
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-9-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230512143240.192504-9-het.gala@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

On Fri, May 12, 2023 at 02:32:40PM +0000, Het Gala wrote:
> Integrated MigrateChannelList with all transport backends (socket, exec
> and rdma) for both source and destination migration code flow.
> 
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/migration.c | 95 +++++++++++++++++++++++++++----------------
>  migration/socket.c    |  5 ++-
>  2 files changed, 64 insertions(+), 36 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index de058643a6..a37eba29e3 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -410,10 +410,11 @@ void migrate_add_address(SocketAddress *address)
>  }
>  
>  static bool migrate_uri_parse(const char *uri,
> -                              MigrateAddress **channel,
> +                              MigrateChannel **channel,
>                                Error **errp)
>  {
>      Error *local_err = NULL;
> +    MigrateChannel *val = g_new0(MigrateChannel, 1);
>      MigrateAddress *addrs = g_new0(MigrateAddress, 1);
>      SocketAddress *saddr;
>      InetSocketAddress *isock = &addrs->u.rdma;
> @@ -441,6 +442,7 @@ static bool migrate_uri_parse(const char *uri,
>      }
>  
>      if (local_err) {
> +        qapi_free_MigrateChannel(val);
>          qapi_free_MigrateAddress(addrs);
>          qapi_free_SocketAddress(saddr);
>          qapi_free_InetSocketAddress(isock);
> @@ -448,7 +450,9 @@ static bool migrate_uri_parse(const char *uri,
>          return false;
>      }
>  
> -    *channel = addrs;
> +    val->channeltype = MIGRATE_CHANNEL_TYPE_MAIN;
> +    val->addr = addrs;
> +    *channel = val;
>      return true;
>  }
>  
> @@ -457,8 +461,9 @@ static void qemu_start_incoming_migration(const char *uri, bool has_channels,
>                                            Error **errp)
>  {
>      Error *local_err = NULL;
> -    MigrateAddress *channel = g_new0(MigrateAddress, 1);
> +    MigrateAddress *addrs;
>      SocketAddress *saddr;
> +    MigrateChannel *channel = NULL;
>  
>      /*
>       * Having preliminary checks for uri and channel
> @@ -467,22 +472,30 @@ static void qemu_start_incoming_migration(const char *uri, bool has_channels,
>          error_setg(errp, "'uri' and 'channels' arguments are mutually "
>                     "exclusive; exactly one of the two should be present in "
>                     "'migrate-incoming' qmp command ");
> -        return;
> -    }
> -
> -    /* URI is not suitable for migration? */
> -    if (!migration_channels_and_uri_compatible(uri, errp)) {
>          goto out;
> -    }
> +    } else if (channels) {
> +        /* To verify that Migrate channel list has only item */
> +        if (channels->next) {
> +            error_setg(errp, "Channel list has more than one entries");
> +            goto out;
> +        }
> +        channel = channels->value;
> +    } else {
> +        /* URI is not suitable for migration? */
> +        if (!migration_channels_and_uri_compatible(uri, errp)) {
> +            goto out;
> +        }

THis check only gets executed when the caller uses the old
URI syntax. We need to it be run when using the modern
MigrateChannel QAPI syntax too.

IOW, migration_channels_and_uri_compatible() needs converting
to take a 'MigrateChannel' object instead of URI, and then
the check can be run after the URI -> MigrateCHannel conversion

>  
> -    if (uri && !migrate_uri_parse(uri, &channel, errp)) {
> -        error_setg(errp, "Error parsing uri");
> -        goto out;
> +        if (uri && !migrate_uri_parse(uri, &channel, errp)) {
> +            error_setg(errp, "Error parsing uri");
> +            goto out;
> +        }
>      }
>  
> -    saddr = &channel->u.socket;
> +    addrs = channel->addr;
> +    saddr = &channel->addr->u.socket;
>      qapi_event_send_migration(MIGRATION_STATUS_SETUP);
> -    if (channel->transport == MIGRATE_TRANSPORT_SOCKET) {
> +    if (addrs->transport == MIGRATE_TRANSPORT_SOCKET) {
>          if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
>              saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
>              saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
> @@ -491,23 +504,25 @@ static void qemu_start_incoming_migration(const char *uri, bool has_channels,
>              fd_start_incoming_migration(saddr->u.fd.str, &local_err);
>          }
>  #ifdef CONFIG_RDMA
> -    } else if (channel->transport == MIGRATE_TRANSPORT_RDMA) {
> -        rdma_start_incoming_migration(&channel->u.rdma, &local_err);
> +    } else if (addrs->transport == MIGRATE_TRANSPORT_RDMA) {
> +        rdma_start_incoming_migration(&addrs->u.rdma, &local_err);
>  #endif
> -    } else if (channel->transport == MIGRATE_TRANSPORT_EXEC) {
> -        exec_start_incoming_migration(channel->u.exec.args, &local_err);
> +    } else if (addrs->transport == MIGRATE_TRANSPORT_EXEC) {
> +        exec_start_incoming_migration(addrs->u.exec.args, &local_err);
>      } else {
>          error_setg(errp, "unknown migration protocol: %s", uri);
>      }
>  
>      if (local_err) {
> +        qapi_free_MigrateAddress(addrs);
>          qapi_free_SocketAddress(saddr);
>          error_propagate(errp, local_err);
>          return;
>      }
>  
>  out:
> -    qapi_free_MigrateAddress(channel);
> +    qapi_free_MigrateChannel(channel);
> +    return;
>  }
>  
>  static void process_incoming_migration_bh(void *opaque)
> @@ -1714,8 +1729,9 @@ void qmp_migrate(const char *uri, bool has_channels,
>  {
>      Error *local_err = NULL;
>      MigrationState *s = migrate_get_current();
> -    MigrateAddress *channel = g_new0(MigrateAddress, 1);
> +    MigrateAddress *addrs;
>      SocketAddress *saddr;
> +    MigrateChannel *channel = NULL;
>  
>      /*
>       * Having preliminary checks for uri and channel
> @@ -1724,17 +1740,24 @@ void qmp_migrate(const char *uri, bool has_channels,
>          error_setg(errp, "'uri' and 'channels' arguments are mutually "
>                     "exclusive; exactly one of the two should be present in "
>                     "'migrate' qmp command ");
> -        return;
> -    }
> -
> -    /* URI is not suitable for migration? */
> -    if (!migration_channels_and_uri_compatible(uri, errp)) {
>          goto out;
> -    }
> +    } else if (channels) {
> +        /* To verify that Migrate channel list has only item */
> +        if (channels->next) {
> +            error_setg(errp, "Channel list has more than one entries");
> +            goto out;
> +        }
> +        channel = channels->value;
> +    } else {
> +        /* URI is not suitable for migration? */
> +        if (!migration_channels_and_uri_compatible(uri, errp)) {
> +            goto out;
> +        }
>  
> -    if (!migrate_uri_parse(uri, &channel, &local_err)) {
> -        error_setg(errp, "Error parsing uri");
> -        goto out;
> +        if (!migrate_uri_parse(uri, &channel, &local_err)) {
> +            error_setg(errp, "Error parsing uri");
> +            goto out;
> +        }
>      }
>  
>      if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
> @@ -1749,8 +1772,9 @@ void qmp_migrate(const char *uri, bool has_channels,
>          }
>      }
>  
> -    saddr = &channel->u.socket;
> -    if (channel->transport == MIGRATE_TRANSPORT_SOCKET) {
> +    addrs = channel->addr;
> +    saddr = &channel->addr->u.socket;
> +    if (addrs->transport == MIGRATE_TRANSPORT_SOCKET) {
>          if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
>              saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
>              saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
> @@ -1759,11 +1783,11 @@ void qmp_migrate(const char *uri, bool has_channels,
>              fd_start_outgoing_migration(s, saddr->u.fd.str, &local_err);
>          }
>  #ifdef CONFIG_RDMA
> -    } else if (channel->transport == MIGRATE_TRANSPORT_RDMA) {
> -        rdma_start_outgoing_migration(s, &channel->u.rdma, &local_err);
> +    } else if (addrs->transport == MIGRATE_TRANSPORT_RDMA) {
> +        rdma_start_outgoing_migration(s, &addrs->u.rdma, &local_err);
>  #endif
> -    } else if (channel->transport == MIGRATE_TRANSPORT_EXEC) {
> -        exec_start_outgoing_migration(s, channel->u.exec.args, &local_err);
> +    } else if (addrs->transport == MIGRATE_TRANSPORT_EXEC) {
> +        exec_start_outgoing_migration(s, addrs->u.exec.args, &local_err);
>      } else {
>          if (!(has_resume && resume)) {
>              yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> @@ -1780,6 +1804,7 @@ void qmp_migrate(const char *uri, bool has_channels,
>          if (!(has_resume && resume)) {
>              yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>          }
> +        qapi_free_MigrateAddress(addrs);
>          qapi_free_SocketAddress(saddr);
>          migrate_fd_error(s, local_err);
>          error_propagate(errp, local_err);
> diff --git a/migration/socket.c b/migration/socket.c
> index 8e7430b266..98e3ea1514 100644
> --- a/migration/socket.c
> +++ b/migration/socket.c
> @@ -28,6 +28,8 @@
>  #include "trace.h"
>  #include "postcopy-ram.h"
>  #include "options.h"
> +#include "qapi/clone-visitor.h"
> +#include "qapi/qapi-visit-sockets.h"
>  
>  struct SocketOutgoingArgs {
>      SocketAddress *saddr;
> @@ -114,12 +116,13 @@ void socket_start_outgoing_migration(MigrationState *s,
>  {
>      QIOChannelSocket *sioc = qio_channel_socket_new();
>      struct SocketConnectData *data = g_new0(struct SocketConnectData, 1);
> +    SocketAddress *addr = QAPI_CLONE(SocketAddress, saddr);
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
> -- 
> 2.22.3
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


