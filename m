Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFFB702AB6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:39:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVbF-0002ov-25; Mon, 15 May 2023 06:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyVbD-0002ol-Ka
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:38:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyVbB-0000Nh-Kn
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:38:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684147117;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=H3y7ZyeoSbHXMoh+5YppzhdMjstSeWg9YLC+pbrhhrI=;
 b=SswMepLXlOUDsCNids3+81d0hk6DU1FhdKn6GQbliC2tPw9NZr8HmHSRGLZUIJLscbn+CM
 p+HtMMhuchkE3FWy3hoG3DE3jfJ2KRGQHIJf0Go3rrLF63aGooYvrgB8vs2VKc82h3OdP8
 Lhqk691LH9ntmQ9B1cOWIjSpGoe9nok=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-AMhmluzUPweyXvihBoD9EA-1; Mon, 15 May 2023 06:38:34 -0400
X-MC-Unique: AMhmluzUPweyXvihBoD9EA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 915B788D013;
 Mon, 15 May 2023 10:38:33 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC4F540C2063;
 Mon, 15 May 2023 10:38:31 +0000 (UTC)
Date: Mon, 15 May 2023 11:38:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v4 7/8] migration: modified 'migrate-incoming' QAPI to
 accept 'channels' argument for migration.
Message-ID: <ZGILotNY4HvlnAWg@redhat.com>
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-8-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230512143240.192504-8-het.gala@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, May 12, 2023 at 02:32:39PM +0000, Het Gala wrote:
> MigrateChannelList ideally allows to have multiple listener interfaces up for
> connection.
> 
> Added MigrateChannelList struct as argument to 'migrate-incoming' qapi. Introduced
> MigrateChannelList in hmp_migrate_incoming() and qmp_migrate_incoming() functions.
> 
> Future patchset series plans to include multiple MigrateChannels to have multiple
> listening interfaces up. That is the reason, 'MigrateChannelList' is the preferred
> choice of argument over 'MigrateChannel' and making 'migrate-incoming' QAPI future
> proof.
> 
> For current patch, have just limit size of MigrateChannelList to 1 element as
> a runtime check.
> 
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/migration-hmp-cmds.c | 14 +++++++++++++-
>  migration/migration.c          | 21 ++++++++++++++++----
>  qapi/migration.json            | 35 +++++++++++++++++++++++++++++++++-
>  softmmu/vl.c                   |  2 +-
>  4 files changed, 65 insertions(+), 7 deletions(-)
> 
> diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
> index f098d04542..8c11a8c83b 100644
> --- a/migration/migration-hmp-cmds.c
> +++ b/migration/migration-hmp-cmds.c
> @@ -518,10 +518,22 @@ void hmp_migrate_incoming(Monitor *mon, const QDict *qdict)
>  {
>      Error *err = NULL;
>      const char *uri = qdict_get_str(qdict, "uri");
> +    MigrateChannel *channel = g_new0(MigrateChannel, 1);
> +    MigrateChannelList *caps = NULL;
> +
> +    if (!migrate_channel_from_qdict(&channel, qdict, &err)) {
> +        error_setg(&err, "error in retrieving channel from qdict");
> +        goto end;
> +    }

Again adding a bunch more parameters to HMP but nothing is documented.

>  
> -    qmp_migrate_incoming(uri, &err);
> +    QAPI_LIST_PREPEND(caps, channel);
> +    qmp_migrate_incoming(uri, !!caps, caps, &err);
> +    qapi_free_MigrateChannelList(caps);
>  
> +end:
> +    qapi_free_MigrateChannel(channel);
>      hmp_handle_error(mon, err);
> +    return;
>  }
>  
>  void hmp_migrate_recover(Monitor *mon, const QDict *qdict)
> diff --git a/migration/migration.c b/migration/migration.c
> index 78f16e5041..de058643a6 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -452,12 +452,24 @@ static bool migrate_uri_parse(const char *uri,
>      return true;
>  }
>  
> -static void qemu_start_incoming_migration(const char *uri, Error **errp)
> +static void qemu_start_incoming_migration(const char *uri, bool has_channels,
> +                                          MigrateChannelList *channels,
> +                                          Error **errp)
>  {
>      Error *local_err = NULL;
>      MigrateAddress *channel = g_new0(MigrateAddress, 1);
>      SocketAddress *saddr;
>  
> +    /*
> +     * Having preliminary checks for uri and channel
> +     */
> +    if (uri && has_channels) {
> +        error_setg(errp, "'uri' and 'channels' arguments are mutually "
> +                   "exclusive; exactly one of the two should be present in "
> +                   "'migrate-incoming' qmp command ");
> +        return;
> +    }
> +
>      /* URI is not suitable for migration? */
>      if (!migration_channels_and_uri_compatible(uri, errp)) {
>          goto out;
> @@ -1507,7 +1519,8 @@ void migrate_del_blocker(Error *reason)
>      migration_blockers = g_slist_remove(migration_blockers, reason);
>  }
>  
> -void qmp_migrate_incoming(const char *uri, Error **errp)
> +void qmp_migrate_incoming(const char *uri, bool has_channels,
> +                          MigrateChannelList *channels, Error **errp)
>  {
>      Error *local_err = NULL;
>      static bool once = true;
> @@ -1525,7 +1538,7 @@ void qmp_migrate_incoming(const char *uri, Error **errp)
>          return;
>      }
>  
> -    qemu_start_incoming_migration(uri, &local_err);
> +    qemu_start_incoming_migration(uri, has_channels, channels, &local_err);
>  
>      if (local_err) {
>          yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> @@ -1561,7 +1574,7 @@ void qmp_migrate_recover(const char *uri, Error **errp)
>       * only re-setup the migration stream and poke existing migration
>       * to continue using that newly established channel.
>       */
> -    qemu_start_incoming_migration(uri, errp);
> +    qemu_start_incoming_migration(uri, false, NULL, errp);
>  }
>  
>  void qmp_migrate_pause(Error **errp)
> diff --git a/qapi/migration.json b/qapi/migration.json
> index a71af87ffe..9faecdd048 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1578,6 +1578,10 @@
>  # @uri: The Uniform Resource Identifier identifying the source or
>  #       address to listen on
>  #
> +# @channels: Struct containing list of migration channel types, with all
> +#            the information regarding destination interfaces required for
> +#            initiating a migration stream.
> +#
>  # Returns: nothing on success
>  #
>  # Since: 2.3
> @@ -1593,14 +1597,43 @@
>  #
>  # 3. The uri format is the same as for -incoming
>  #
> +# 4. The 'uri' and 'channel' arguments are mutually exclusive; exactly one
> +#    of the two should be present.
> +#
>  # Example:
>  #
>  # -> { "execute": "migrate-incoming",
>  #      "arguments": { "uri": "tcp::4446" } }
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
> -{ 'command': 'migrate-incoming', 'data': {'uri': 'str' } }
> +{ 'command': 'migrate-incoming',
> +             'data': {'*uri': 'str',
> +                      '*channels': [ 'MigrateChannel' ] } }
>  
>  ##
>  # @xen-save-devices-state:
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 6c2427262b..ade411eb4f 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2633,7 +2633,7 @@ void qmp_x_exit_preconfig(Error **errp)
>      if (incoming) {
>          Error *local_err = NULL;
>          if (strcmp(incoming, "defer") != 0) {
> -            qmp_migrate_incoming(incoming, &local_err);
> +            qmp_migrate_incoming(incoming, false, NULL, &local_err);
>              if (local_err) {
>                  error_reportf_err(local_err, "-incoming %s: ", incoming);
>                  exit(1);
> -- 
> 2.22.3
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


