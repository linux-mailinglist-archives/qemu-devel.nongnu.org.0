Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B008F37A3EC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:42:04 +0200 (CEST)
Received: from localhost ([::1]:46046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOtv-0002Eg-Ox
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgOdr-0008Jc-DG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:25:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgOdm-0006kc-2Q
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620725121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMlnrs5C/54m15NLABZSOl7JcMZac5EoJQvyY4Ho6R0=;
 b=NnWHxxY6EqQG+I1MJniqacmayJtoxPE46iyXYOkaR+jtvEKTz5N1Ir5mFKF0zHyTLLoU50
 H3yjzq7t7c4pseEAhQgLBoCxOVOK/WlVxiVsqDUSwAemW4hC8XOO7QOGx6f0K+HUNoJHBB
 Fx1yL7pN8rK83QG7x6Wm91GG/uBhryQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-Qanz5ci7MZCI_h3fAtNh3A-1; Tue, 11 May 2021 05:25:19 -0400
X-MC-Unique: Qanz5ci7MZCI_h3fAtNh3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8594F801107;
 Tue, 11 May 2021 09:25:18 +0000 (UTC)
Received: from work-vm (ovpn-113-51.ams2.redhat.com [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 413B97059B;
 Tue, 11 May 2021 09:25:04 +0000 (UTC)
Date: Tue, 11 May 2021 10:25:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3] migration: Drop redundant query-migrate result @blocked
Message-ID: <YJpNbmtBISyrhmYS@work-vm>
References: <20210429140424.2802929-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210429140424.2802929-1-armbru@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> Result @blocked is redundant.  Unfortunately, we realized this too
> close to the release to risk dropping it, so we deprecated it
> instead, in commit e11ce6c06.
> 
> Since it was deprecated from the start, we can delete it without
> the customary grace period.  Do so.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Queued

> ---
> v3: We picked the alternative "[PATCH] migration: Deprecate redundant
>     query-migrate result @blocked" for 6.0 (commit e11ce6c065).  v3 is
>     v2 squashed into a clean revert that commit.  I kept the R-bys for
>     v1 and v2.
> 
> v2: Commit message improved.
> 
>  qapi/migration.json   |  6 ------
>  migration/migration.c | 29 +++++++++++++----------------
>  monitor/hmp-cmds.c    |  2 +-
>  3 files changed, 14 insertions(+), 23 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 0b17cce46b..7a5bdf9a0d 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -228,11 +228,6 @@
>  #                   Present and non-empty when migration is blocked.
>  #                   (since 6.0)
>  #
> -# @blocked: True if outgoing migration is blocked (since 6.0)
> -#
> -# Features:
> -# @deprecated: Member @blocked is deprecated.  Use @blocked-reasons instead.
> -#
>  # Since: 0.14
>  ##
>  { 'struct': 'MigrationInfo',
> @@ -246,7 +241,6 @@
>             '*setup-time': 'int',
>             '*cpu-throttle-percentage': 'int',
>             '*error-desc': 'str',
> -           'blocked': { 'type': 'bool', 'features': [ 'deprecated' ] },
>             '*blocked-reasons': ['str'],
>             '*postcopy-blocktime' : 'uint32',
>             '*postcopy-vcpu-blocktime': ['uint32'],
> diff --git a/migration/migration.c b/migration/migration.c
> index 8ca034136b..fdadee290e 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1073,27 +1073,24 @@ static void populate_vfio_info(MigrationInfo *info)
>  static void fill_source_migration_info(MigrationInfo *info)
>  {
>      MigrationState *s = migrate_get_current();
> +    GSList *cur_blocker = migration_blockers;
>  
> -    info->blocked = migration_is_blocked(NULL);
> -    info->has_blocked_reasons = info->blocked;
>      info->blocked_reasons = NULL;
> -    if (info->blocked) {
> -        GSList *cur_blocker = migration_blockers;
>  
> -        /*
> -         * There are two types of reasons a migration might be blocked;
> -         * a) devices marked in VMState as non-migratable, and
> -         * b) Explicit migration blockers
> -         * We need to add both of them here.
> -         */
> -        qemu_savevm_non_migratable_list(&info->blocked_reasons);
> +    /*
> +     * There are two types of reasons a migration might be blocked;
> +     * a) devices marked in VMState as non-migratable, and
> +     * b) Explicit migration blockers
> +     * We need to add both of them here.
> +     */
> +    qemu_savevm_non_migratable_list(&info->blocked_reasons);
>  
> -        while (cur_blocker) {
> -            QAPI_LIST_PREPEND(info->blocked_reasons,
> -                              g_strdup(error_get_pretty(cur_blocker->data)));
> -            cur_blocker = g_slist_next(cur_blocker);
> -        }
> +    while (cur_blocker) {
> +        QAPI_LIST_PREPEND(info->blocked_reasons,
> +                          g_strdup(error_get_pretty(cur_blocker->data)));
> +        cur_blocker = g_slist_next(cur_blocker);
>      }
> +    info->has_blocked_reasons = info->blocked_reasons != NULL;
>  
>      switch (s->state) {
>      case MIGRATION_STATUS_NONE:
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 0ad5b77477..d9bef63373 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -224,7 +224,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>  
>      migration_global_dump(mon);
>  
> -    if (info->blocked) {
> +    if (info->blocked_reasons) {
>          strList *reasons = info->blocked_reasons;
>          monitor_printf(mon, "Outgoing migration blocked:\n");
>          while (reasons) {
> -- 
> 2.26.3
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


