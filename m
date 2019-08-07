Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E692784A57
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 13:07:01 +0200 (CEST)
Received: from localhost ([::1]:39768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvJmX-0001Nu-6Z
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 07:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50289)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hvJm2-0000zH-RG
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 07:06:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hvJm1-0008Cd-8t
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 07:06:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55704)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hvJm1-0008CO-0o
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 07:06:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 44FD9309DEFC;
 Wed,  7 Aug 2019 11:06:28 +0000 (UTC)
Received: from work-vm (ovpn-117-204.ams2.redhat.com [10.36.117.204])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEF3D60BE0;
 Wed,  7 Aug 2019 11:06:26 +0000 (UTC)
Date: Wed, 7 Aug 2019 12:06:24 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Singh, Brijesh" <brijesh.singh@amd.com>
Message-ID: <20190807110624.GB2867@work-vm>
References: <20190806165429.19327-1-brijesh.singh@amd.com>
 <20190806165429.19327-4-brijesh.singh@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806165429.19327-4-brijesh.singh@amd.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 07 Aug 2019 11:06:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 03/14] migration.json: add AMD SEV
 specific migration parameters
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Singh, Brijesh (brijesh.singh@amd.com) wrote:
> AMD SEV migration flow requires that target machine's public Diffie-Hellman
> key (PDH) and certificate chain must be passed before initiating the guest
> migration. User can use QMP 'migrate-set-parameters' to pass the certificate
> chain. The certificate chain will be used while creating the outgoing
> encryption context.
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
> 
> I was able to pass the certificate chain through the HMP but somehow
> QMP socket interface is not working for me. If anyone has any tips on
> what I am missing in the patch then please let me know. In meantime,
> I will also continue my investigation on why its not working for me.

It looks OK to me; what's the qmp you're trying and what's the failure
error?

Dave

>  migration/migration.c | 61 +++++++++++++++++++++++++++++++++++++++++++
>  monitor/hmp-cmds.c    | 18 +++++++++++++
>  qapi/migration.json   | 41 ++++++++++++++++++++++++++---
>  3 files changed, 116 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 8a607fe1e2..de66a0eb7e 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -783,6 +783,12 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
>      params->announce_rounds = s->parameters.announce_rounds;
>      params->has_announce_step = true;
>      params->announce_step = s->parameters.announce_step;
> +    params->has_sev_pdh = true;
> +    params->sev_pdh = g_strdup(s->parameters.sev_pdh);
> +    params->has_sev_plat_cert = true;
> +    params->sev_plat_cert = g_strdup(s->parameters.sev_plat_cert);
> +    params->has_sev_amd_cert = true;
> +    params->sev_amd_cert = g_strdup(s->parameters.sev_amd_cert);
>  
>      return params;
>  }
> @@ -1289,6 +1295,18 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
>      if (params->has_announce_step) {
>          dest->announce_step = params->announce_step;
>      }
> +    if (params->has_sev_pdh) {
> +        assert(params->sev_pdh->type == QTYPE_QSTRING);
> +        dest->sev_pdh = g_strdup(params->sev_pdh->u.s);
> +    }
> +    if (params->has_sev_plat_cert) {
> +        assert(params->sev_plat_cert->type == QTYPE_QSTRING);
> +        dest->sev_plat_cert = g_strdup(params->sev_plat_cert->u.s);
> +    }
> +    if (params->has_sev_amd_cert) {
> +        assert(params->sev_amd_cert->type == QTYPE_QSTRING);
> +        dest->sev_amd_cert = g_strdup(params->sev_amd_cert->u.s);
> +    }
>  }
>  
>  static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
> @@ -1390,6 +1408,21 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
>      if (params->has_announce_step) {
>          s->parameters.announce_step = params->announce_step;
>      }
> +    if (params->has_sev_pdh) {
> +        g_free(s->parameters.sev_pdh);
> +        assert(params->sev_pdh->type == QTYPE_QSTRING);
> +        s->parameters.sev_pdh = g_strdup(params->sev_pdh->u.s);
> +    }
> +    if (params->has_sev_plat_cert) {
> +        g_free(s->parameters.sev_plat_cert);
> +        assert(params->sev_plat_cert->type == QTYPE_QSTRING);
> +        s->parameters.sev_plat_cert = g_strdup(params->sev_plat_cert->u.s);
> +    }
> +    if (params->has_sev_amd_cert) {
> +        g_free(s->parameters.sev_amd_cert);
> +        assert(params->sev_amd_cert->type == QTYPE_QSTRING);
> +        s->parameters.sev_amd_cert = g_strdup(params->sev_amd_cert->u.s);
> +    }
>  }
>  
>  void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
> @@ -1410,6 +1443,27 @@ void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
>          params->tls_hostname->type = QTYPE_QSTRING;
>          params->tls_hostname->u.s = strdup("");
>      }
> +    /* TODO Rewrite "" to null instead */
> +    if (params->has_sev_pdh
> +        && params->sev_pdh->type == QTYPE_QNULL) {
> +        qobject_unref(params->sev_pdh->u.n);
> +        params->sev_pdh->type = QTYPE_QSTRING;
> +        params->sev_pdh->u.s = strdup("");
> +    }
> +    /* TODO Rewrite "" to null instead */
> +    if (params->has_sev_plat_cert
> +        && params->sev_plat_cert->type == QTYPE_QNULL) {
> +        qobject_unref(params->sev_plat_cert->u.n);
> +        params->sev_plat_cert->type = QTYPE_QSTRING;
> +        params->sev_plat_cert->u.s = strdup("");
> +    }
> +    /* TODO Rewrite "" to null instead */
> +    if (params->has_sev_amd_cert
> +        && params->sev_amd_cert->type == QTYPE_QNULL) {
> +        qobject_unref(params->sev_amd_cert->u.n);
> +        params->sev_amd_cert->type = QTYPE_QSTRING;
> +        params->sev_amd_cert->u.s = strdup("");
> +    }
>  
>      migrate_params_test_apply(params, &tmp);
>  
> @@ -3466,6 +3520,9 @@ static void migration_instance_finalize(Object *obj)
>      qemu_mutex_destroy(&ms->qemu_file_lock);
>      g_free(params->tls_hostname);
>      g_free(params->tls_creds);
> +    g_free(params->sev_pdh);
> +    g_free(params->sev_plat_cert);
> +    g_free(params->sev_amd_cert);
>      qemu_sem_destroy(&ms->rate_limit_sem);
>      qemu_sem_destroy(&ms->pause_sem);
>      qemu_sem_destroy(&ms->postcopy_pause_sem);
> @@ -3507,6 +3564,10 @@ static void migration_instance_init(Object *obj)
>      params->has_announce_rounds = true;
>      params->has_announce_step = true;
>  
> +    params->sev_pdh = g_strdup("");
> +    params->sev_plat_cert = g_strdup("");
> +    params->sev_amd_cert = g_strdup("");
> +
>      qemu_sem_init(&ms->postcopy_pause_sem, 0);
>      qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
>      qemu_sem_init(&ms->rp_state.rp_sem, 0);
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 5ca3ebe942..354219f27a 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1872,6 +1872,24 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>          p->has_announce_step = true;
>          visit_type_size(v, param, &p->announce_step, &err);
>          break;
> +    case MIGRATION_PARAMETER_SEV_PDH:
> +        p->has_sev_pdh = true;
> +        p->sev_pdh = g_new0(StrOrNull, 1);
> +        p->sev_pdh->type = QTYPE_QSTRING;
> +        visit_type_str(v, param, &p->sev_pdh->u.s, &err);
> +        break;
> +    case MIGRATION_PARAMETER_SEV_PLAT_CERT:
> +        p->has_sev_plat_cert = true;
> +        p->sev_plat_cert = g_new0(StrOrNull, 1);
> +        p->sev_plat_cert->type = QTYPE_QSTRING;
> +        visit_type_str(v, param, &p->sev_plat_cert->u.s, &err);
> +        break;
> +    case MIGRATION_PARAMETER_SEV_AMD_CERT:
> +        p->has_sev_amd_cert = true;
> +        p->sev_amd_cert = g_new0(StrOrNull, 1);
> +        p->sev_amd_cert->type = QTYPE_QSTRING;
> +        visit_type_str(v, param, &p->sev_amd_cert->u.s, &err);
> +        break;
>      default:
>          assert(0);
>      }
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 9cfbaf8c6c..bb07995d2c 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -580,6 +580,15 @@
>  # @max-cpu-throttle: maximum cpu throttle percentage.
>  #                    Defaults to 99. (Since 3.1)
>  #
> +# @sev-pdh: The target host platform diffie-hellman key encoded in base64
> +#           (Since 4.2)
> +#
> +# @sev-plat-cert: The target host platform certificate chain encoded in base64
> +#                 (Since 4.2)
> +#
> +# @sev-amd-cert: AMD certificate chain which include ASK and OCA encoded in
> +#                base64 (Since 4.2)
> +#
>  # Since: 2.4
>  ##
>  { 'enum': 'MigrationParameter',
> @@ -592,7 +601,7 @@
>             'downtime-limit', 'x-checkpoint-delay', 'block-incremental',
>             'multifd-channels',
>             'xbzrle-cache-size', 'max-postcopy-bandwidth',
> -           'max-cpu-throttle' ] }
> +           'max-cpu-throttle', 'sev-pdh', 'sev-plat-cert', 'sev-amd-cert' ] }
>  
>  ##
>  # @MigrateSetParameters:
> @@ -682,6 +691,15 @@
>  # @max-cpu-throttle: maximum cpu throttle percentage.
>  #                    The default value is 99. (Since 3.1)
>  #
> +# @sev-pdh: The target host platform diffie-hellman key encoded in base64
> +#           (Since 4.2)
> +#
> +# @sev-plat-cert: The target host platform certificate chain encoded in base64
> +#                 (Since 4.2)
> +#
> +# @sev-amd-cert: AMD certificate chain which include ASK and OCA encoded in
> +#                base64 (Since 4.2)
> +#
>  # Since: 2.4
>  ##
>  # TODO either fuse back into MigrationParameters, or make
> @@ -707,7 +725,10 @@
>              '*multifd-channels': 'int',
>              '*xbzrle-cache-size': 'size',
>              '*max-postcopy-bandwidth': 'size',
> -	    '*max-cpu-throttle': 'int' } }
> +            '*max-cpu-throttle': 'int',
> +            '*sev-pdh':'StrOrNull',
> +            '*sev-plat-cert': 'StrOrNull',
> +            '*sev-amd-cert' : 'StrOrNull' } }
>  
>  ##
>  # @migrate-set-parameters:
> @@ -817,6 +838,15 @@
>  #                    Defaults to 99.
>  #                     (Since 3.1)
>  #
> +# @sev-pdh: The target host platform diffie-hellman key encoded in base64
> +#           (Since 4.2)
> +#
> +# @sev-plat-cert: The target host platform certificate chain encoded in base64
> +#                 (Since 4.2)
> +#
> +# @sev-amd-cert: AMD certificate chain which include ASK and OCA encoded in
> +#                base64 (Since 4.2)
> +#
>  # Since: 2.4
>  ##
>  { 'struct': 'MigrationParameters',
> @@ -839,8 +869,11 @@
>              '*block-incremental': 'bool' ,
>              '*multifd-channels': 'uint8',
>              '*xbzrle-cache-size': 'size',
> -	    '*max-postcopy-bandwidth': 'size',
> -            '*max-cpu-throttle':'uint8'} }
> +            '*max-postcopy-bandwidth': 'size',
> +            '*max-cpu-throttle':'uint8',
> +            '*sev-pdh':'str',
> +            '*sev-plat-cert': 'str',
> +            '*sev-amd-cert' : 'str'} }
>  
>  ##
>  # @query-migrate-parameters:
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

