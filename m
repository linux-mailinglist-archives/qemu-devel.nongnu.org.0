Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82046904ED
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 11:32:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ4Dt-0006v8-9D; Thu, 09 Feb 2023 05:32:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ4DU-0006r3-LY
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:31:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ4DN-0000Q5-8A
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:31:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675938700;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8pPjcMadq58ZNmqj8HVWAfbTMglqzg+AHsdpm8cJzHo=;
 b=bAzDZ81GgjXsyJLcyfNNwK1yKUM1EKJjREvaknr4qQTtCW7J9hV856plMBxH6LHPaAQP97
 3lhYHvGFIFzUZpbHFrfB0u0bgNsS2iEUFbvRdCF6dTgiRdDkttBeK7v6xfKgt7AkGvZtjP
 OwOjUu95PY9sKhDJcJg9URPSxE7LvIg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-4D1JCAqaOa6H3DOOf6EjdQ-1; Thu, 09 Feb 2023 05:31:36 -0500
X-MC-Unique: 4D1JCAqaOa6H3DOOf6EjdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42F6329ABA0D;
 Thu,  9 Feb 2023 10:31:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A808B18EC1;
 Thu,  9 Feb 2023 10:31:32 +0000 (UTC)
Date: Thu, 9 Feb 2023 10:31:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v2 5/6] migration: Modified 'migrate-incoming' QAPI and
 HMP side changes on the destination interface.
Message-ID: <Y+TLgrcmC4tdOpU0@redhat.com>
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-6-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230208093600.242665-6-het.gala@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Wed, Feb 08, 2023 at 09:35:59AM +0000, Het Gala wrote:
> 'migrate-incoming' QAPI design have been modified into well-defined
> MigrateChannel struct to prevent multiple encoding of uri strings on
> the destination side.'uri' parameter is kept for backward compatibility.
> 
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/migration-hmp-cmds.c |  8 +++++++-
>  migration/migration.c          |  3 ++-
>  qapi/migration.json            | 22 ++++++++++++++++++++--
>  softmmu/vl.c                   |  2 +-
>  4 files changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
> index a9f65ded7a..ae3c5ea5b2 100644
> --- a/migration/migration-hmp-cmds.c
> +++ b/migration/migration-hmp-cmds.c
> @@ -500,8 +500,14 @@ void hmp_migrate_incoming(Monitor *mon, const QDict *qdict)
>      Error *err = NULL;
>      const char *uri = qdict_get_str(qdict, "uri");
>  
> -    qmp_migrate_incoming(uri, &err);
> +    MigrateChannel *channel = g_new0(MigrateChannel, 1);
> +    if (!migrate_channel_from_qdict(&channel, qdict, &err)) {
> +        error_setg(&err, "error in retrieving channel from qdict");
> +        return;
> +    }
>  
> +    qmp_migrate_incoming(uri, channel, &err);
> +    qapi_free_MigrateChannel(channel);
>      hmp_handle_error(mon, err);
>  }
>  
> diff --git a/migration/migration.c b/migration/migration.c
> index accbf72a18..e22ce2dd15 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2314,7 +2314,8 @@ void migrate_del_blocker(Error *reason)
>      migration_blockers = g_slist_remove(migration_blockers, reason);
>  }
>  
> -void qmp_migrate_incoming(const char *uri, Error **errp)
> +void qmp_migrate_incoming(const char *uri, MigrateChannel *channel,
> +                          Error **errp)
>  {
>      Error *local_err = NULL;
>      static bool once = true;
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 79acfcfe4e..3a88912f4d 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1623,7 +1623,11 @@
>  # with -incoming defer
>  #
>  # @uri: The Uniform Resource Identifier identifying the source or
> -#       address to listen on
> +#       the address to listen on
> +#
> +# @channel: Struct containing migration channel type, along with
> +#           all the details of the destination interface required
> +#           for the address to listen on for migration stream.
>  #
>  # Returns: nothing on success
>  #
> @@ -1640,14 +1644,28 @@
>  #
>  # 3. The uri format is the same as for -incoming
>  #
> +# 4. The 'uri' and 'channel' arguments are mutually exclusive but, atleast
> +#    one of the two arguments should be present.
> +#
>  # Example:
>  #
>  # -> { "execute": "migrate-incoming",
>  #      "arguments": { "uri": "tcp::4446" } }
>  # <- { "return": {} }
>  #
> +# -> { "execute": "migrate-incoming",
> +#      "arguments": {
> +#          "channel": { "channeltype": "main",
> +#                        "addr": { "transport": "socket",
> +#                                  "socket-type": { "type": "inet",
> +#                                                   "host": "10.12.34.9",
> +#                                                   "port": "1050" } } } } }
> +# <- { "return": {} }
> +#
>  ##
> -{ 'command': 'migrate-incoming', 'data': {'uri': 'str' } }
> +{ 'command': 'migrate-incoming',
> +             'data': {'*uri': 'str',
> +                      '*channel': 'MigrateChannel'} }

Same question of whether we need to future proof now by making this

  '*channels': ['MigrateChannel']

?

Otherwise we'll have to add this 'channels' field later, and
end up with 'channel' and 'channels' and 'uri'


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


