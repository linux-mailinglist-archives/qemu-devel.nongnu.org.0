Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D7D702A1F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:13:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVCG-0006P6-SM; Mon, 15 May 2023 06:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyVCE-0006Oj-HJ
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:12:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyVCC-0002ov-KT
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:12:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684145568;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VxtF3xTjVK8e3vvn7Ub7A+xfst7JYpqJu8ja3pID6qM=;
 b=hx+oZVppPllzc8xj+xmauzJAF3xjOJyKKOpx7uu//VEM3CArrt1PunkMTGD97SxLBz90wA
 /GNzo+cDP7X+FpSxraGCYlRXT79GTGNPHeOOevX9bQmz/I32yP/S5di6PWoBu33bKi9BdB
 VfUCzHHjE1Lub6KnKzOg/8Z8cJXqZDs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-t_X4pHOZOwifcBgAEsX-Fw-1; Mon, 15 May 2023 06:12:46 -0400
X-MC-Unique: t_X4pHOZOwifcBgAEsX-Fw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C9203815EE0;
 Mon, 15 May 2023 10:12:46 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17A944078906;
 Mon, 15 May 2023 10:12:44 +0000 (UTC)
Date: Mon, 15 May 2023 11:12:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v4 2/8] migration: Converts uri parameter into
 'MigrateAddress' struct
Message-ID: <ZGIFmofD8CPJVM/g@redhat.com>
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-3-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230512143240.192504-3-het.gala@nutanix.com>
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

On Fri, May 12, 2023 at 02:32:34PM +0000, Het Gala wrote:
> This patch introduces code that can parse 'uri' string parameter and
> spit out 'MigrateAddress' struct. All the required migration parameters
> are stored in the struct.
> 
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/migration.c | 63 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 0ee07802a5..a7e4e286aa 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -64,6 +64,7 @@
>  #include "yank_functions.h"
>  #include "sysemu/qtest.h"
>  #include "options.h"
> +#include "qemu/sockets.h"
>  
>  static NotifierList migration_state_notifiers =
>      NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
> @@ -408,13 +409,58 @@ void migrate_add_address(SocketAddress *address)
>                        QAPI_CLONE(SocketAddress, address));
>  }
>  
> +static bool migrate_uri_parse(const char *uri,
> +                              MigrateAddress **channel,
> +                              Error **errp)
> +{
> +    Error *local_err = NULL;
> +    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
> +    SocketAddress *saddr;
> +    InetSocketAddress *isock = &addrs->u.rdma;
> +    strList **tail = &addrs->u.exec.args;
> +
> +    if (strstart(uri, "exec:", NULL)) {
> +        addrs->transport = MIGRATE_TRANSPORT_EXEC;
> +        QAPI_LIST_APPEND(tail, g_strdup("/bin/sh"));
> +        QAPI_LIST_APPEND(tail, g_strdup("-c"));
> +        QAPI_LIST_APPEND(tail, g_strdup(uri + strlen("exec:")));
> +    } else if (strstart(uri, "rdma:", NULL) &&
> +               !inet_parse(isock, uri + strlen("rdma:"), errp)) {
> +        addrs->transport = MIGRATE_TRANSPORT_RDMA;

I would have this as 

    } else if (strstart(uri, "rdma:", NULL)) {
        if (inet_parse(isock, uri + strlen("rdma:"), errp)) {
            addrs->transport = MIGRATE_TRANSPORT_RDMA;
	}

as IMHO it is bad practice to have control pass to the next
else if clause when inet_parse() fails, as we know this is
only an RDMA addr

Also you need to use '&local_err' not 'errp' in the inet_parse
call, otherwise the later code block for cleanup won't run.


> +    } else if (strstart(uri, "tcp:", NULL) ||
> +                strstart(uri, "unix:", NULL) ||
> +                strstart(uri, "vsock:", NULL) ||
> +                strstart(uri, "fd:", NULL)) {
> +        addrs->transport = MIGRATE_TRANSPORT_SOCKET;
> +        saddr = socket_parse(uri, &local_err);
> +        addrs->u.socket = *saddr;

Protect with

   if (saddr != NULL) {
       addrs->u.socket = *saddr;
   }

> +    }
> +
> +    if (local_err) {
> +        qapi_free_MigrateAddress(addrs);
> +        qapi_free_SocketAddress(saddr);
> +        qapi_free_InetSocketAddress(isock);
> +        error_propagate(errp, local_err);
> +        return false;
> +    }
> +
> +    *channel = addrs;
> +    return true;
> +}
> +
>  static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
>      const char *p = NULL;
> +    MigrateAddress *channel = g_new0(MigrateAddress, 1);

Avoid the later 'out:' cleanup block by using:

  g_autoptr(MigrateAddress) channel = g_new0(MigrateAddress, 1);

>  
>      /* URI is not suitable for migration? */
>      if (!migration_channels_and_uri_compatible(uri, errp)) {
> -        return;
> +        goto out;
> +    }
> +
> +    if (uri && !migrate_uri_parse(uri, &channel, errp)) {
> +        error_setg(errp, "Error parsing uri");

This error_setg() is overwriting the error migrate_uri_parse already
set, so just drop it.

> +        goto out;
>      }
>  
>      qapi_event_send_migration(MIGRATION_STATUS_SETUP);
> @@ -433,6 +479,9 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>      } else {
>          error_setg(errp, "unknown migration protocol: %s", uri);
>      }
> +
> +out:
> +    qapi_free_MigrateAddress(channel);
>  }
>  
>  static void process_incoming_migration_bh(void *opaque)
> @@ -1638,10 +1687,16 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>      Error *local_err = NULL;
>      MigrationState *s = migrate_get_current();
>      const char *p = NULL;
> +    MigrateAddress *channel = g_new0(MigrateAddress, 1);

Here too, use g_autoptr(MigrateAddress) and drop the  'out:' block

>  
>      /* URI is not suitable for migration? */
>      if (!migration_channels_and_uri_compatible(uri, errp)) {
> -        return;
> +        goto out;
> +    }
> +
> +    if (!migrate_uri_parse(uri, &channel, &local_err)) {
> +        error_setg(errp, "Error parsing uri");
> +        goto out;
>      }
>  
>      if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
> @@ -1688,6 +1743,10 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>          error_propagate(errp, local_err);
>          return;
>      }
> +
> +out:
> +    qapi_free_MigrateAddress(channel);
> +    return;
>  }
>  
>  void qmp_migrate_cancel(Error **errp)
> -- 
> 2.22.3
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


