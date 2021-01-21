Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBBD2FF56B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:08:40 +0100 (CET)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gFz-0003sU-IG
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:08:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l2gCR-0000fq-0d
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:04:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l2gCM-0005Gv-OU
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:04:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611259492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6xM5uol3Zsb65TL5K4tCf60WTy1tIKa4uZElGjxvEc=;
 b=EH+84JjgQSUDHVTq1mOOLKBx/rRcZojWmINzDj7l3+C6lov1M3qLBkU05CM8xlDb8rAoVe
 iWf6PS0xlAlZqFV9xlNPbPkf/IjE/2E4ugMva6sBwouaogVlRlY0axHaG9VVeiG2XSIcZI
 NYhoc7QOT1IcHmeo4cm4/MYu8OoUM14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-PFDN7tCbNhiQm7P-XYXZrA-1; Thu, 21 Jan 2021 15:04:50 -0500
X-MC-Unique: PFDN7tCbNhiQm7P-XYXZrA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7684F801817
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 20:04:49 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 461965D765;
 Thu, 21 Jan 2021 20:04:43 +0000 (UTC)
Date: Thu, 21 Jan 2021 13:04:42 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] migration: Provide a test for migratability
Message-ID: <20210121130442.370b9569@omen.home.shazbot.org>
In-Reply-To: <20210121185113.66277-1-dgilbert@redhat.com>
References: <20210121185113.66277-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peterx@redhat.com, qemu-devel@nongnu.org, laine@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Jan 2021 18:51:13 +0000
"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Provide a simple way to see if there's currently a migration blocker in
> operation:
> 
> $ ./x86_64-softmmu/qemu-system-x86_64 -nographic -M pc,usb=on -chardev null,id=n -device usb-serial,chardev=n
> 
> (qemu) info migratable
> Error: State blocked by non-migratable device '0000:00:01.2/1/usb-serial'

FWIW, a vfio device gets:

(qemu) info migratable
Error: VFIO device doesn't support migration

I think your example is getting the device string because you're
testing something with unmigratable = 1 in the vmsd and the iterator
prints a generic string plus the device, we'd need to make our error
message include the device info.  But even without that it seems more
useful than we have currently.  Thanks

Tested-by: Alex Williamson <alex.williamson@redhat.com>

> $ ./x86_64-softmmu/qemu-system-x86_64 -nographic
> 
> (qemu) info migratable
> Migratable
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hmp-commands-info.hx  | 14 ++++++++++++++
>  include/monitor/hmp.h |  1 +
>  migration/migration.c |  5 +++++
>  monitor/hmp-cmds.c    | 13 +++++++++++++
>  qapi/migration.json   | 14 ++++++++++++++
>  5 files changed, 47 insertions(+)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 117ba25f91..c2d7ac2f11 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -541,6 +541,20 @@ SRST
>      Show migration status.
>  ERST
>  
> +    {
> +        .name       = "migratable",
> +        .args_type  = "",
> +        .params     = "",
> +        .help       = "tests if VM is migratable",
> +        .cmd        = hmp_info_migratable,
> +    },
> +
> +SRST
> +  ''info migratable''
> +    Tests whether the VM is currently migratable.
> +ERST
> +
> +
>      {
>          .name       = "migrate_capabilities",
>          .args_type  = "",
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index ed2913fd18..0dd7941daf 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -25,6 +25,7 @@ void hmp_info_status(Monitor *mon, const QDict *qdict);
>  void hmp_info_uuid(Monitor *mon, const QDict *qdict);
>  void hmp_info_chardev(Monitor *mon, const QDict *qdict);
>  void hmp_info_mice(Monitor *mon, const QDict *qdict);
> +void hmp_info_migratable(Monitor *mon, const QDict *qdict);
>  void hmp_info_migrate(Monitor *mon, const QDict *qdict);
>  void hmp_info_migrate_capabilities(Monitor *mon, const QDict *qdict);
>  void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict);
> diff --git a/migration/migration.c b/migration/migration.c
> index 5e330cc6eb..8745a5b9f9 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2234,6 +2234,11 @@ int64_t qmp_query_migrate_cache_size(Error **errp)
>      return migrate_xbzrle_cache_size();
>  }
>  
> +void qmp_query_migratable(Error **errp)
> +{
> +    migration_is_blocked(errp);
> +}
> +
>  void qmp_migrate_set_speed(int64_t value, Error **errp)
>  {
>      MigrateSetParameters p = {
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index ef569035f8..a7f48b3512 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -216,6 +216,19 @@ static char *SocketAddress_to_str(SocketAddress *addr)
>      }
>  }
>  
> +void hmp_info_migratable(Monitor *mon, const QDict *qdict)
> +{
> +    Error *err = NULL;
> +    /* It's migratable if this succeeds */
> +    qmp_query_migratable(&err);
> +    if (err) {
> +        hmp_handle_error(mon, err);
> +        return;
> +    }
> +
> +    monitor_printf(mon, "Migratable\n");
> +}
> +
>  void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>  {
>      MigrationInfo *info;
> diff --git a/qapi/migration.json b/qapi/migration.json
> index d1d9632c2a..07aee9907c 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -366,6 +366,20 @@
>  ##
>  { 'command': 'query-migrate', 'returns': 'MigrationInfo' }
>  
> +##
> +# @query-migratable:
> +# Tests whether it will be possible to migrate the VM in the current state.
> +#
> +# Returns: nothing on success (i.e. if the VM is migratable)
> +#
> +# Since: 6.0
> +# Example:
> +#
> +# -> { "execute": "query-migratable" }
> +# <- { "return": {} }
> +##
> +{ 'command': 'query-migratable' }
> +
>  ##
>  # @MigrationCapability:
>  #


