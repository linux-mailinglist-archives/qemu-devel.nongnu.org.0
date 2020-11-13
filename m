Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D432B1A61
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 12:57:35 +0100 (CET)
Received: from localhost ([::1]:34540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdXhu-00057e-4r
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 06:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdXgi-0004eY-LH
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:56:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdXgc-00071M-HR
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605268572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V0VBj26HvdY5yxyRxqVjpqYPBi5Oe3yOBv+WdaF75wk=;
 b=WIzI1KePOuEZfWATJ1grlyAXWkirr67mxF5FhpQkKsdTfaQi9ZeuTHJldO565PE0yWW2VS
 9yJwoAUUJMh74ssV58ao6tF43B2pndaoakjQKmM1n0CqmLj6xvhfWyUVQIGmNEcN4QPXXR
 AzHPlCEByCPAkvetGHBMy1hg8bS4DD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-ERbTkOFhMjWWiVaYa-9KqA-1; Fri, 13 Nov 2020 06:56:10 -0500
X-MC-Unique: ERbTkOFhMjWWiVaYa-9KqA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDEEC1018F72
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 11:56:09 +0000 (UTC)
Received: from work-vm (ovpn-114-160.ams2.redhat.com [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EE7360BE2;
 Fri, 13 Nov 2020 11:56:08 +0000 (UTC)
Date: Fri, 13 Nov 2020 11:56:05 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/6] migration: Fix and clean up around @tls-authz
Message-ID: <20201113115605.GG3251@work-vm>
References: <20201113065236.2644169-1-armbru@redhat.com>
 <20201113065236.2644169-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201113065236.2644169-2-armbru@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> Commit d2f1d29b95 "migration: add support for a "tls-authz" migration
> parameter" added MigrationParameters member @tls-authz.  Whereas the
> other members aren't really optional (see commit 1bda8b3c695), this
> one is genuinely optional: migration_instance_init() leaves it absent,
> and migration_tls_channel_process_incoming() passes it to
> qcrypto_tls_session_new(), which checks for null.
> 
> Commit d2f1d29b95 has a number of issues, though:
> 
> * When qmp_query_migrate_parameters() copies migration parameters into
>   its reply, it ignores has_tls_authz, and assumes true instead.  When
>   it is false,
> 
>   - HMP info migrate_parameters prints the null pointer (crash bug on
>     some systems), and
> 
>   - QMP query-migrate-parameters replies "tls-authz": "" (because the
>     QObject output visitor silently maps null pointer to "", which it
>     really shouldn't).
> 
>   The HMP defect was noticed and fixed in commit 7cd75cbdb8
>   'migration: use "" instead of (null) for tls-authz'.  Unfortunately,
>   the fix papered over the real bug: it made
>   qmp_query_migrate_parameters() map null tls_authz to "".  It also
>   dropped the check for has_tls_authz from
>   hmp_info_migrate_parameters().
> 
>   Revert, and fix qmp_query_migrate_parameters() not to screw up
>   has_tls_authz.  No change to HMP.  QMP now has "tls-authz" in the
>   reply only when it's actually present in
>   migrate_get_current()->parameters.  If we prefer to remain
>   bug-compatible, we should make tls_authz non-optional there.
> 
> * migrate_params_test_apply() neglects to apply tls_authz.  Currently
>   harmless, because migrate_params_check() doesn't care.  Fix it
>   anyway.
> 
> * qmp_migrate_set_parameters() crashes:
> 
>     {"execute": "migrate-set-parameters", "arguments": {"tls-authz": null}}
> 
>   Add the necessary rewrite of null to "".  For background
>   information, see commit 01fa559826 "migration: Use JSON null instead
>   of "" to reset parameter to default".
> 
> Fixes: d2f1d29b95aa45d13262b39153ff501ed6b1ac95
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Yes, but I'd like an Ack from Dan as well for this one

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  qapi/migration.json   |  2 +-
>  migration/migration.c | 17 ++++++++++++++---
>  monitor/hmp-cmds.c    |  2 +-
>  3 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 3c75820527..688e8da749 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -928,7 +928,7 @@
>  ##
>  # @MigrationParameters:
>  #
> -# The optional members aren't actually optional.
> +# The optional members aren't actually optional, except for @tls-authz.
>  #
>  # @announce-initial: Initial delay (in milliseconds) before sending the
>  #                    first announce (Since 4.0)
> diff --git a/migration/migration.c b/migration/migration.c
> index 3263aa55a9..cad56fbf8c 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -855,9 +855,8 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
>      params->tls_creds = g_strdup(s->parameters.tls_creds);
>      params->has_tls_hostname = true;
>      params->tls_hostname = g_strdup(s->parameters.tls_hostname);
> -    params->has_tls_authz = true;
> -    params->tls_authz = g_strdup(s->parameters.tls_authz ?
> -                                 s->parameters.tls_authz : "");
> +    params->has_tls_authz = s->parameters.has_tls_authz;
> +    params->tls_authz = g_strdup(s->parameters.tls_authz);
>      params->has_max_bandwidth = true;
>      params->max_bandwidth = s->parameters.max_bandwidth;
>      params->has_downtime_limit = true;
> @@ -1433,6 +1432,11 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
>          dest->tls_hostname = params->tls_hostname->u.s;
>      }
>  
> +    if (params->has_tls_authz) {
> +        assert(params->tls_authz->type == QTYPE_QSTRING);
> +        dest->tls_authz = params->tls_authz->u.s;
> +    }
> +
>      if (params->has_max_bandwidth) {
>          dest->max_bandwidth = params->max_bandwidth;
>      }
> @@ -1622,6 +1626,13 @@ void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
>          params->tls_hostname->type = QTYPE_QSTRING;
>          params->tls_hostname->u.s = strdup("");
>      }
> +    /* TODO Rewrite "" to null instead */
> +    if (params->has_tls_authz
> +        && params->tls_authz->type == QTYPE_QNULL) {
> +        qobject_unref(params->tls_authz->u.n);
> +        params->tls_authz->type = QTYPE_QSTRING;
> +        params->tls_authz->u.s = strdup("");
> +    }
>  
>      migrate_params_test_apply(params, &tmp);
>  
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index a6a6684df1..492789248f 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -476,7 +476,7 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
>              params->max_postcopy_bandwidth);
>          monitor_printf(mon, "%s: '%s'\n",
>              MigrationParameter_str(MIGRATION_PARAMETER_TLS_AUTHZ),
> -            params->tls_authz);
> +            params->has_tls_authz ? params->tls_authz : "");
>  
>          if (params->has_block_bitmap_mapping) {
>              const BitmapMigrationNodeAliasList *bmnal;
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


