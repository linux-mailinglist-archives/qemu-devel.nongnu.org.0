Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B162266286C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:25:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEsv5-0005Se-Vm; Mon, 09 Jan 2023 09:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEsv3-0005S8-QZ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:14:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEsv2-0001aR-1W
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:14:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673273671;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ovTw3XpHkMiHfxttlwYF/6CqCblNJMzG9tffHHdbOXs=;
 b=FMnrAR1EJwG0uRuLZT3QhZXdQAlL8qjIV4SKQxPenzBpLtJZVXtMVYk0EcUwO9Mqb+EfVp
 S4KRMBhQ5uemkhPCq8SAmVSKpUbJgMkXr1aw2q8yp/v1o9CkmfNPpdV6LTzhLDN4o6WU5p
 BMxinY5Yzv7eCBAcXa+7/Uu0+7nrBsM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-o0e7_bI7PFW9upihGpdmlA-1; Mon, 09 Jan 2023 09:14:26 -0500
X-MC-Unique: o0e7_bI7PFW9upihGpdmlA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E35387A9E1;
 Mon,  9 Jan 2023 14:14:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A9B540C2004;
 Mon,  9 Jan 2023 14:14:24 +0000 (UTC)
Date: Mon, 9 Jan 2023 14:14:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Subject: Re: [PATCH 3/5] migration: Avoid multiple parsing of uri in
 migration code flow
Message-ID: <Y7whO59PHwUCSaRx@redhat.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
 <20221226053329.157905-4-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221226053329.157905-4-het.gala@nutanix.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

On Mon, Dec 26, 2022 at 05:33:27AM +0000, Het Gala wrote:
> From: Author Het Gala <het.gala@nutanix.com>
> 
> Existing uri is encoded at multiple levels to extract the relevant
> migration information.
> 
> The modified QAPI design maps migration parameters into MigrateChannel
> struct before, thus avoiding double-level uri encoding.
> 
> socket_outgoing_migration() has been depricated as It's only purpose was
> uri parsing.
> Renamed socket_outgoing_migration_internal() as socket_outgoing_migration().
> qemu_uri_parsing() has been introduced to parse uri string (backward
> compatibility) and populate the MigrateChannel struct parameters. Note that
> the function will no longer be needed once the 'uri' parameter is depricated.
> 
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/migration.c | 78 +++++++++++++++++++++++++++++++++++--------
>  migration/socket.c    | 15 +--------
>  migration/socket.h    |  3 +-
>  3 files changed, 67 insertions(+), 29 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 1b6e62612a..36de9f6a6b 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -61,6 +61,7 @@
>  #include "sysemu/cpus.h"
>  #include "yank_functions.h"
>  #include "sysemu/qtest.h"
> +#include "qemu/sockets.h"
>  
>  #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
>  
> @@ -486,6 +487,39 @@ void migrate_add_address(SocketAddress *address)
>                        QAPI_CLONE(SocketAddress, address));
>  }
>  
> +static void qemu_uri_parsing(const char *uri,
> +                             MigrateChannel **channel,
> +                             Error **errp)

Coding style would prefer 'bool' instad of 'void'...

Also lets call this 'migrate_uri_parse'

> +{
> +    Error *local_err = NULL;
> +    const char *p = NULL;
> +    MigrateChannel *val = g_new0(MigrateChannel, 1);
> +    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
> +    SocketAddress *saddr = g_new0(SocketAddress, 1);
> +
> +    if (strstart(uri, "exec:", &p)) {
> +        addrs->transport = MIGRATE_TRANSPORT_EXEC;
> +        addrs->u.exec.exec_str = g_strdup(p + strlen("exec:"));
> +    } else if (strstart(uri, "rdma:", NULL)) {
> +        addrs->transport = MIGRATE_TRANSPORT_RDMA;
> +        addrs->u.rdma.rdma_str = g_strdup(p + strlen("rdma:"));
> +    } else if (strstart(uri, "tcp:", NULL) ||
> +                strstart(uri, "unix:", NULL) ||
> +                strstart(uri, "vsock:", NULL) ||
> +                strstart(uri, "fd:", NULL)) {
> +        addrs->transport = MIGRATE_TRANSPORT_SOCKET;
> +        saddr = socket_parse(uri, &local_err);
> +        addrs->u.socket.socket_type = saddr;
> +    }
> +    val->channeltype = MIGRATE_CHANNEL_TYPE_MAIN;
> +    val->addr = addrs;
> +    *channel = val;
> +
> +    if (local_err) {
> +        error_propagate(errp, local_err);

     ...   'return false';
> +    }
  ...  'return true;'

> +}
> +
>  static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
>      const char *p = NULL;
> @@ -2397,7 +2431,8 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
>  {
>      Error *local_err = NULL;
>      MigrationState *s = migrate_get_current();
> -    const char *p = NULL;
> +    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
> +    SocketAddress *saddr = g_new0(SocketAddress, 1);
>  
>      if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
>                           has_resume && resume, errp)) {
> @@ -2411,20 +2446,35 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
>          }
>      }
>  
> +    /*
> +     * motive here is just to have checks and convert uri into
> +     * socketaddress struct
> +     */
> +    if (uri && channel) {
> +        error_setg(errp, "uri and channels options should be"
> +                          "mutually exclusive");

Needs a 'return' statement after reporting the error. ALso, this
check should be moved to the earlier patch that introduced the
'channel' field.

> +    } else if (uri) {
> +        qemu_uri_parsing(uri, &channel, &local_err);

Needs to 'return' on error, eg

  } else if (uri && !qemu_uri_parsing(...))
      return;

> +    }
> +

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


