Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2372B702AB0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:37:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVZc-0001nF-Dh; Mon, 15 May 2023 06:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyVZQ-0001jx-4K
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:36:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyVZN-0008Ui-Kw
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684147004;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TX+RFSgJQjfAPvi2yHDvZwhzgm8wkpP1USNRc3w18A4=;
 b=OFHZ+pShIhQLRGSF5M/qve3+vtN4DpSZPPaJMy/ZFI2BKA7v7dweIPS2zYF2+QsU005S3v
 ry/Rrc43rm6Lv6cy+6Yr6yDX12zMus2Eg3ghr914M0YI+/RNq0457afXVNCmD7qKobDEZI
 C2RN7JXtOmChiyDfxqZ2v3IWU59MWBo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-x_XlTggVOQiP6AfTrvEfTA-1; Mon, 15 May 2023 06:36:41 -0400
X-MC-Unique: x_XlTggVOQiP6AfTrvEfTA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BFF3381D4C0;
 Mon, 15 May 2023 10:36:41 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7817B140E917;
 Mon, 15 May 2023 10:36:39 +0000 (UTC)
Date: Mon, 15 May 2023 11:36:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v4 6/8] migration: modified 'migrate' QAPI to accept
 'channels' argument for migration
Message-ID: <ZGILNQxb6VD0CwSR@redhat.com>
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-7-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230512143240.192504-7-het.gala@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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

On Fri, May 12, 2023 at 02:32:38PM +0000, Het Gala wrote:
> MigrateChannelList ideally allows to connect accross multiple interfaces.
> 
> Added MigrateChannelList struct as argument to 'migrate' qapi. Introduced
> MigrateChannelList in hmp_migrate() and qmp_migrate() functions.
> 
> Future patchset series plans to include multiple MigrateChannels
> for multiple interfaces to be connected. That is the reason, 'MigrateChannelList'
> is the preferred choice of argument over 'MigrateChannel' and making 'migrate'
> QAPI future proof.
> 
> For current patch, have just limit size of MigrateChannelList to 1 element as
> a runtime check.
> 
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/migration-hmp-cmds.c | 113 ++++++++++++++++++++++++++++++++-
>  migration/migration.c          |  17 ++++-
>  qapi/migration.json            |  69 +++++++++++++++++++-
>  3 files changed, 192 insertions(+), 7 deletions(-)
> 
> diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
> index 4e9f00e7dc..f098d04542 100644
> --- a/migration/migration-hmp-cmds.c
> +++ b/migration/migration-hmp-cmds.c
> @@ -51,6 +51,101 @@ static void migration_global_dump(Monitor *mon)
>                     ms->clear_bitmap_shift);
>  }
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

THis seems to be implicitly defining a huge set of extra parameters
for the migrate 'HMP' command, but none of it is actually defined
at the hmp-commands.hx

Do we even need todo this ?  For HMP it is not unreasonable to just
keep using the URI syntax forever?

> +    MigrateChannel *val = g_new0(MigrateChannel, 1);
> +    MigrateChannelType channel_type;
> +    MigrateTransport transport;
> +    MigrateAddress *addr = g_new0(MigrateAddress, 1);
> +    SocketAddress *saddr = g_new(SocketAddress, 1);
> +    SocketAddressType type;
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
> +            goto end;
> +        }
> +
> +        addr->u.socket = *saddr;
> +        break;
> +    case MIGRATE_TRANSPORT_EXEC:
> +        addr->u.exec.args = (strList *)exec;
> +         break;
> +    case MIGRATE_TRANSPORT_RDMA:
> +        addr->u.rdma.host = (char *)inet_host;
> +        addr->u.rdma.port = (char *)inet_port;
> +        break;
> +    default:
> +        error_setg(errp, "%s: Unknown migrate transport type %d",
> +                   __func__, addr->transport);
> +        goto end;
> +    }
> +
> +    val->channeltype = channel_type;
> +    val->addr = addr;
> +    *channel = val;
> +    return true;
> +
> +end:
> +    error_propagate(errp, err);
> +    qapi_free_MigrateChannel(val);
> +    qapi_free_MigrateAddress(addr);
> +    qapi_free_SocketAddress(saddr);
> +    return false;
> +}
> +
>  void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>  {
>      MigrationInfo *info;
> @@ -702,9 +797,18 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
>      bool resume = qdict_get_try_bool(qdict, "resume", false);
>      const char *uri = qdict_get_str(qdict, "uri");
>      Error *err = NULL;
> +    MigrateChannel *channel = g_new0(MigrateChannel, 1);
> +    MigrateChannelList *caps = NULL;
> +
> +    if (!migrate_channel_from_qdict(&channel, qdict, &err)) {
> +        error_setg(&err, "error in retrieving channel from qdict");
> +        goto end;
> +    }
>  
> -    qmp_migrate(uri, !!blk, blk, !!inc, inc,
> -                false, false, true, resume, &err);
> +    QAPI_LIST_PREPEND(caps, channel);
> +    qmp_migrate(uri, !!caps, caps, !!blk, blk, !!inc, inc,
> +                 false, false, true, resume, &err);
> +    qapi_free_MigrateChannelList(caps);
>      if (hmp_handle_error(mon, err)) {
>          return;
>      }
> @@ -725,6 +829,11 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
>                                            status);
>          timer_mod(status->timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
>      }
> +
> +end:
> +    qapi_free_MigrateChannel(channel);
> +    hmp_handle_error(mon, err);
> +    return;
>  }
>  
>  void migrate_set_capability_completion(ReadLineState *rs, int nb_args,
> diff --git a/migration/migration.c b/migration/migration.c
> index 6abd69df8d..78f16e5041 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1694,15 +1694,26 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
>      return true;
>  }
>  
> -void qmp_migrate(const char *uri, bool has_blk, bool blk,
> -                 bool has_inc, bool inc, bool has_detach, bool detach,
> -                 bool has_resume, bool resume, Error **errp)
> +void qmp_migrate(const char *uri, bool has_channels,
> +                 MigrateChannelList *channels, bool has_blk, bool blk,
> +                 bool has_inc, bool inc, bool has_detach,
> +                 bool detach, bool has_resume, bool resume, Error **errp)
>  {
>      Error *local_err = NULL;
>      MigrationState *s = migrate_get_current();
>      MigrateAddress *channel = g_new0(MigrateAddress, 1);
>      SocketAddress *saddr;
>  
> +    /*
> +     * Having preliminary checks for uri and channel
> +     */
> +    if (uri && has_channels) {
> +        error_setg(errp, "'uri' and 'channels' arguments are mutually "
> +                   "exclusive; exactly one of the two should be present in "
> +                   "'migrate' qmp command ");
> +        return;
> +    }
> +



>      /* URI is not suitable for migration? */
>      if (!migration_channels_and_uri_compatible(uri, errp)) {
>          goto out;
> diff --git a/qapi/migration.json b/qapi/migration.json
> index bf90bd8fe2..a71af87ffe 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1464,12 +1464,47 @@
>      'exec': 'MigrateExecCommand',
>      'rdma': 'InetSocketAddress' } }
>  
> +##
> +# @MigrateChannelType:
> +#
> +# The supported options for migration channel type requests
> +#
> +# @main: Support request for main outbound migration control channel
> +#
> +# Since 8.0
> +##
> +{ 'enum': 'MigrateChannelType',
> +  'data': [ 'main' ] }
> +
> +##
> +# @MigrateChannel:
> +#
> +# Information regarding migration Channel-type for transferring packets,
> +# source and corresponding destination interface for socket connection
> +# and number of multifd channels over the interface.
> +#
> +# @channeltype: Name of Channel type for transfering packet information
> +#
> +# @addr: Information regarding migration parameters of destination interface
> +#
> +# Since 8.0
> +##
> +{ 'struct': 'MigrateChannel',
> +  'data': {
> +       'channeltype': 'MigrateChannelType',
> +       'addr': 'MigrateAddress' } }
> +
>  ##
>  # @migrate:
>  #
>  # Migrates the current running guest to another Virtual Machine.
>  #
>  # @uri: the Uniform Resource Identifier of the destination VM
> +#       for migration thread
> +#
> +# @channels: Struct containing list of migration channel types, with all
> +#            the information regarding destination interfaces required for
> +#            initiating a migration stream.
>  #
>  # @blk: do block migration (full disk copy)
>  #
> @@ -1494,15 +1529,45 @@
>  # 3. The user Monitor's "detach" argument is invalid in QMP and should not
>  #    be used
>  #
> +# 4. The uri argument should have the Uniform Resource Identifier of default
> +#    destination VM. This connection will be bound to default network
> +#
> +# 5. The 'uri' and 'channel' arguments are mutually exclusive; exactly one
> +#    of the two should be present.
> +#
>  # Example:
>  #
>  # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>  # <- { "return": {} }
>  #
> +# -> { "execute": "migrate",
> +#      "arguments": {
> +#          "channels": [ { "channeltype": "main",
> +#                          "addr": { "transport": "socket", "type": "inet",
> +#                                    "host": "10.12.34.9",
> +#                                    "port": "1050" } } ] } }
> +# <- { "return": {} }
> +#
> +# -> { "execute": "migrate",
> +#      "arguments": {
> +#          "channels": [ { "channeltype": "main",
> +#                          "addr": { "transport": "exec",
> +#                                    "args": [ "/bin/nc", "-p", "6000",
> +#                                              "/some/sock" ] } } ] } }
> +# <- { "return": {} }
> +#
> +# -> { "execute": "migrate",
> +#      "arguments": {
> +#          "channels": [ { "channeltype": "main",
> +#                          "addr": { "transport": "rdma",
> +#                                    "host": "10.12.34.9",
> +#                                    "port": "1050" } } ] } }
> +# <- { "return": {} }
> +#
>  ##
>  { 'command': 'migrate',
> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
> -           '*detach': 'bool', '*resume': 'bool' } }
> +  'data': {'*uri': 'str', '*channels': [ 'MigrateChannel' ], '*blk': 'bool',
> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>  
>  ##
>  # @migrate-incoming:
> -- 
> 2.22.3
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


