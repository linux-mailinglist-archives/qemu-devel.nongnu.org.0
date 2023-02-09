Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0270369052D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 11:42:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ4Ma-0004jE-D8; Thu, 09 Feb 2023 05:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ4MY-0004iz-Ck
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:41:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ4MV-00022q-RT
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675939266;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nakx4X7pvi8S290W3kAVthSbYpqUvut6vkOvNILFq3I=;
 b=SXBJVIFyNGJNY5h9VJODHNfiBakk633rY0Vs1lPUmrpwtFM1R9hzi7J2kkhS/TdKImFnE/
 nP5O3R9PAsUMzrljFFF1qOzBQv86lmOC62mIXzZ3SuDb8Z8hCj0o964NQlXYcAfPkwzM+z
 3GO/ck5Rn9j2XweojK3bqZA6IN2ou2U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-Xi7iKZGqMYKMjMmrsue5sw-1; Thu, 09 Feb 2023 05:41:03 -0500
X-MC-Unique: Xi7iKZGqMYKMjMmrsue5sw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8EC11C04194;
 Thu,  9 Feb 2023 10:41:01 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F3E41121314;
 Thu,  9 Feb 2023 10:40:59 +0000 (UTC)
Date: Thu, 9 Feb 2023 10:40:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v2 4/6] migration: Avoid multiple parsing of uri in
 migration code flow
Message-ID: <Y+TNuesEEUeYqF/u@redhat.com>
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-5-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230208093600.242665-5-het.gala@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

Huh, what is the purpose of using 'str_split_at_comma' ? The format
of this is  "exec:<shell command>", because it is run as:

     const char *argv[] = { "/bin/sh", "-c", command, NULL };

we should not be trying to parse the bit after 'exec:' at all,
and certainly not splitting it on commas which makes no sense
for a shell command.

I would have expected something more like this:

    strList **tail = &addrs->u.exec.data;
    QAPI_LIST_APPEND(tail, g_strdup("/bin/sh"));
    QAPI_LIST_APPEND(tail, g_strdup("-c"));
    QAPI_LIST_APPEND(tail, g_strdup(uri + strlen("exec:")));


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

This is probably a sign that  fd_start_outgoing_migration() should
be folded into the socket_start_outgoing_migration() method, but
that's a separate cleanup from this patch.

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

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


