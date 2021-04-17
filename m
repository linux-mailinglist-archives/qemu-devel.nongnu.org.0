Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EE7362EE8
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 11:37:05 +0200 (CEST)
Received: from localhost ([::1]:33100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXhNw-0000KD-9p
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 05:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXhMT-00086Y-OY
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 05:35:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXhMS-0000b7-1l
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 05:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618652131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bY+3G1pkHD587bo3QDeVhOODQCmtXNocrhpPp4dV1oM=;
 b=dA56uWcQZV3HEmuMFlhkOPc/KyXMrkr6HIRbykcG/escFF6JYV+t5ByBQFdai0/PSTdeKz
 3HbEHD2XWMOGc+125NkcBXTiV3ixTpoArYOO3P+rk50KEiNkoWwma/QyoFnCWkqIvzxRBL
 yhH855lC6WhAkl0tLDof7btMOTyWJFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-VoJmaxfCNuGdWRG_RGPP7g-1; Sat, 17 Apr 2021 05:35:29 -0400
X-MC-Unique: VoJmaxfCNuGdWRG_RGPP7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71BCA10054F6
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 09:35:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F7BC2CD34;
 Sat, 17 Apr 2021 09:35:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BBF4F113525D; Sat, 17 Apr 2021 11:35:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
References: <20210415154402.28424-1-vkuznets@redhat.com>
Date: Sat, 17 Apr 2021 11:35:26 +0200
In-Reply-To: <20210415154402.28424-1-vkuznets@redhat.com> (Vitaly Kuznetsov's
 message of "Thu, 15 Apr 2021 17:44:02 +0200")
Message-ID: <87sg3p1cf5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vitaly Kuznetsov <vkuznets@redhat.com> writes:

> When a migration blocker is added nothing is reported to the user,
> inability to migrate such guest may come as a late surprise. As a bare
> minimum, we can print a warning. To not pollute the output for those, who
> have no intention to migrate their guests, introduce '--no-migration'
> option which both block the migration and eliminates warning from

Sure this justifies its own command line option?  Can we make it a
parameter of an existing option?  We have too many options, and options
starting "no-" are often awkward.

> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  include/qapi/qmp/qerror.h |  3 +++
>  include/sysemu/sysemu.h   |  1 +
>  migration/migration.c     | 18 +++++++++++++++++-
>  qemu-options.hx           |  7 +++++++
>  softmmu/globals.c         |  1 +
>  softmmu/vl.c              |  3 +++
>  6 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
> index 596fce0c54e7..2e1563c72f83 100644
> --- a/include/qapi/qmp/qerror.h
> +++ b/include/qapi/qmp/qerror.h
> @@ -50,6 +50,9 @@
   /*
    * These macros will go away, please don't use in new code, and do not
    * add new ones!
    */
   ...
>  #define QERR_MISSING_PARAMETER \
>      "Parameter '%s' is missing"
>  
> +#define QERR_NO_MIGRATION \
> +    "Guest is not migratable ('--no-migration' used)"
> +
>  #define QERR_PERMISSION_DENIED \
>      "Insufficient permission to perform this operation"
>  

Please don't add new macros here.

Looks like you use QERR_NO_MIGRATION only in migration/migration.c.  You
can add a macro there.  Or simply duplicate the error string, which I'd
find easier to read.  Up to you.

> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 8fae667172ac..c65cd5d5a336 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -9,6 +9,7 @@
>  /* vl.c */
>  
>  extern int only_migratable;
> +extern int no_migration;
>  extern const char *qemu_name;
>  extern QemuUUID qemu_uuid;
>  extern bool qemu_uuid_set;
> diff --git a/migration/migration.c b/migration/migration.c
> index ca8b97baa5ac..29a8480ced54 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1077,7 +1077,9 @@ static void fill_source_migration_info(MigrationInfo *info)
>      info->blocked = migration_is_blocked(NULL);
>      info->has_blocked_reasons = info->blocked;
>      info->blocked_reasons = NULL;
> -    if (info->blocked) {
> +    if (no_migration) {
> +        QAPI_LIST_PREPEND(info->blocked_reasons, g_strdup(QERR_NO_MIGRATION));
> +    } else if (info->blocked) {
>          GSList *cur_blocker = migration_blockers;
>  
>          /*

Apropos blocked-reasons.  migration.json has:

    # @blocked: True if outgoing migration is blocked (since 6.0)
    #
    # @blocked-reasons: A list of reasons an outgoing migration is blocked (since 6.0)
    [...]
              'blocked': 'bool',
              '*blocked-reasons': ['str'],

Can "blocked-reasons" be absent or empty when "blocked" is true?

If not, then "blocked" is redundant, and should be dropped before we
release 6.0.

Else, the documentation should spell it out.  No need to rush that.

The patch was not cc'ed to me.  I might have caught it earlier...

[...]


