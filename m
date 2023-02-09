Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A27669082E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 13:06:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ5gV-0002Dn-03; Thu, 09 Feb 2023 07:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ5gT-0002DO-0L
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:05:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ5gQ-0000dZ-UM
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:05:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675944345;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gESxaQ3l9Z10JmcnabM/cx+31N6/ynDrpj2keyZskHo=;
 b=fA8wLHM25je3MPaslp+tfOZrzdReP4eFTULGV89OR0+bJYd0OFnVtcVIJqNgi1iqhMWn4b
 OaERqcm9Aanb/JGWNfRSy8hWc4VuQuzA5TGoJft//QQH//nJnglayk4JJfS7FNAXHpHNUc
 hHAxdCegbCfCUWhxH+79Dc9KZBH1glA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-sv87lzW2N6mqT8TdVtyBCA-1; Thu, 09 Feb 2023 07:05:42 -0500
X-MC-Unique: sv87lzW2N6mqT8TdVtyBCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A0FF185A7A4;
 Thu,  9 Feb 2023 12:05:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64A6CC16022;
 Thu,  9 Feb 2023 12:05:40 +0000 (UTC)
Date: Thu, 9 Feb 2023 12:05:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v2 3/6] migration: HMP side changes for modified
 'migrate' QAPI design
Message-ID: <Y+ThkshD8G3ca7Lx@redhat.com>
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-4-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230208093600.242665-4-het.gala@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

On Wed, Feb 08, 2023 at 09:35:57AM +0000, Het Gala wrote:
> hmp_migrate() stores modified QAPI 'migrate' arguments from qdict
> into well defined MigrateChannel struct with help of
> migrate_channel_from_qdict().
> hmp_migrate() also accepts uri string as modified QAPI a 'migrate'
> argument (for backward compatibility).
> 
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/migration-hmp-cmds.c | 105 ++++++++++++++++++++++++++++++++-
>  migration/migration.c          |  15 ++++-
>  2 files changed, 116 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
> index ef25bc8929..a9f65ded7a 100644
> --- a/migration/migration-hmp-cmds.c
> +++ b/migration/migration-hmp-cmds.c
> @@ -32,6 +32,101 @@
>  #include "sysemu/runstate.h"
>  #include "ui/qemu-spice.h"
>  
> +static bool
> +migrate_channel_from_qdict(MigrateChannel **channel,
> +                           const QDict *qdict, Error **errp)
> +{
> +    Error *err = NULL;
> +    const char *channeltype  = qdict_get_try_str(qdict, "channeltype");
> +    const char *transport_str = qdict_get_try_str(qdict, "transport");
> +    const char *socketaddr_type = qdict_get_try_str(qdict, "type");
> +    const char *inet_host = qdict_get_try_str(qdict, "host");
> +    const char *inet_port = qdict_get_try_str(qdict, "port");
> +    const char *unix_path = qdict_get_try_str(qdict, "path");
> +    const char *vsock_cid = qdict_get_try_str(qdict, "cid");
> +    const char *vsock_port = qdict_get_try_str(qdict, "port");
> +    const char *fd = qdict_get_try_str(qdict, "str");
> +    QList *exec = qdict_get_qlist(qdict, "exec");
> +    MigrateChannel *val = g_new0(MigrateChannel, 1);
> +    MigrateChannelType channel_type;
> +    MigrateTransport transport;
> +    MigrateAddress *addr = g_new0(MigrateAddress, 1);
> +    SocketAddress *saddr = g_new(SocketAddress, 1);
> +    SocketAddressType type;
> +    InetSocketAddress *isock = g_new0(InetSocketAddress, 1);
> +
> +    channel_type = qapi_enum_parse(&MigrateChannelType_lookup,
> +                                   channeltype, -1, &err);
> +    if (channel_type < 0) {
> +        goto end;
> +    }
> +
> +    transport = qapi_enum_parse(&MigrateTransport_lookup,
> +                                transport_str, -1, &err);
> +    if (transport < 0) {
> +        goto end;
> +    }
> +
> +    type = qapi_enum_parse(&SocketAddressType_lookup,
> +                           socketaddr_type, -1, &err);
> +    if (type < 0) {
> +        goto end;
> +    }
> +
> +    addr->transport = transport;
> +
> +    switch (transport) {
> +    case MIGRATE_TRANSPORT_SOCKET:
> +        saddr->type = type;
> +
> +        switch (type) {
> +        case SOCKET_ADDRESS_TYPE_INET:
> +            saddr->u.inet.host = (char *)inet_host;
> +            saddr->u.inet.port = (char *)inet_port;
> +            break;
> +        case SOCKET_ADDRESS_TYPE_UNIX:
> +            saddr->u.q_unix.path = (char *)unix_path;
> +            break;
> +        case SOCKET_ADDRESS_TYPE_VSOCK:
> +            saddr->u.vsock.cid = (char *)vsock_cid;
> +            saddr->u.vsock.port = (char *)vsock_port;
> +            break;
> +        case SOCKET_ADDRESS_TYPE_FD:
> +            saddr->u.fd.str = (char *)fd;
> +            break;
> +        default:
> +            error_setg(errp, "%s: Unknown socket type %d",
> +                       __func__, saddr->type);
> +            break;
> +        }
> +
> +        addr->u.socket.socket_type = saddr;
> +        break;
> +    case MIGRATE_TRANSPORT_EXEC:
> +        addr->u.exec.data = (strList *)exec;
> +         break;
> +    case MIGRATE_TRANSPORT_RDMA:
> +        isock->host = (char *)inet_host;
> +        isock->port = (char *)inet_port;
> +        addr->u.rdma.data = isock;
> +        break;
> +    default:
> +        error_setg(errp, "%s: Unknown migrate transport type %d",
> +                   __func__, addr->transport);
> +        break;
> +    }
> +
> +    val->channeltype = channel_type;
> +    val->addr = addr;
> +    *channel = val;
> +    return true;
> +
> +end:
> +    error_propagate(errp, err);
> +    return false;
> +}
> +
> +
>  void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>  {
>      MigrationInfo *info;
> @@ -701,8 +796,16 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
>      const char *uri = qdict_get_str(qdict, "uri");
>      Error *err = NULL;
>  
> -    qmp_migrate(uri, !!blk, blk, !!inc, inc,
> +    MigrateChannel *channel = g_new0(MigrateChannel, 1);
> +
> +    if (!migrate_channel_from_qdict(&channel, qdict, &err)) {
> +        error_setg(&err, "error in retrieving channel from qdict");
> +        return;
> +    }
> +
> +    qmp_migrate(uri, channel, !!blk, blk, !!inc, inc,
>                  false, false, true, resume, &err);
> +    qapi_free_MigrateChannel(channel);
>      if (hmp_handle_error(mon, err)) {
>          return;
>      }
> diff --git a/migration/migration.c b/migration/migration.c
> index 7a14aa98d8..f6dd8dbb03 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2463,9 +2463,9 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
>      return true;
>  }
>  
> -void qmp_migrate(const char *uri, bool has_blk, bool blk,
> -                 bool has_inc, bool inc, bool has_detach, bool detach,
> -                 bool has_resume, bool resume, Error **errp)
> +void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
> +                 bool blk, bool has_inc, bool inc, bool has_detach,
> +                 bool detach, bool has_resume, bool resume, Error **errp)
>  {
>      Error *local_err = NULL;
>      MigrationState *s = migrate_get_current();
> @@ -2483,6 +2483,15 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>          }
>      }
>  
> +    /*
> +     * Having preliminary checks for uri and channel
> +     */
> +    if (uri && channel) {
> +        error_setg(errp, "uri and channels options should be"

s/should be/are/, also best to quote parameter names, eg

    error_setg(errp, 
               "'uri' and 'channels' options are mutually exclusive");

> +                          "mutually exclusive");
> +        return;
> +    }
> +

This change for qmp_migrate will need to be in patch 2.

QEMU needs to compile & pass tests successfully after each individual
patch. Currently it'll fail on patch 2, because the code generator
wil emit the new qmp_migrate API declaration signature, but the change
to the implementation signature is here in patch 3.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


