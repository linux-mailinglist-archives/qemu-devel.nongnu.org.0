Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230DF528464
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:45:38 +0200 (CEST)
Received: from localhost ([::1]:33022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqa6Q-0004tw-DX
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqZSU-0005Rz-LJ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 08:04:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqZSR-0003C2-1c
 for qemu-devel@nongnu.org; Mon, 16 May 2022 08:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652702654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JVL1DIq9QTdR4Z/4ygKFN2lYNsZiE8srbgcSQrrJLj8=;
 b=Ai66gxLE73vmAHVhLJE56+dU09NuvEb8rXFN7X/o9hsyCQPdWOTjFSkcMQ1mB/cx9yE/4B
 AtlVAMMwKFtVBpZiSj8lH16J6PQ2QLNZIUdC/rYaFAk+wvUEO8UgGi23M9pwggAUZWBeBL
 82e3yj/bsJC7bP58juZevSpcGqfxa+s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-iBZMz2UPN9KhG7AHTfQijw-1; Mon, 16 May 2022 08:04:12 -0400
X-MC-Unique: iBZMz2UPN9KhG7AHTfQijw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B2C185A5BC;
 Mon, 16 May 2022 12:04:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BB3140CF8E2;
 Mon, 16 May 2022 12:04:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 38A4721E690D; Mon, 16 May 2022 14:04:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  armbru@redhat.com,  berrange@redhat.com,
 dgilbert@redhat.com,  Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v3 3/8] qmp: add filtering of statistics by target vCPU
References: <20220516090058.1195767-1-pbonzini@redhat.com>
 <20220516090234.1195907-2-pbonzini@redhat.com>
Date: Mon, 16 May 2022 14:04:11 +0200
In-Reply-To: <20220516090234.1195907-2-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 16 May 2022 11:02:29 +0200")
Message-ID: <87lev1y98k.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Introduce a simple filtering of statistics, that allows to retrieve
> statistics for a subset of the guest vCPUs.  This will be used for
> example by the HMP monitor, in order to retrieve the statistics
> for the currently selected CPU.
>
> Example:
> { "execute": "query-stats",
>   "arguments": {
>     "target": "vcpu",
>     "vcpus": [ "/machine/unattached/device[2]",
>                "/machine/unattached/device[4]" ] } }
>
> Extracted from a patch by Mark Kanda.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  accel/kvm/kvm-all.c     |  9 +++++++--
>  include/monitor/stats.h |  9 ++++++++-
>  monitor/qmp-cmds.c      | 34 +++++++++++++++++++++++++++++++++-
>  qapi/stats.json         | 20 +++++++++++++++++---
>  4 files changed, 65 insertions(+), 7 deletions(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 6a6bbe2994..28f8a45205 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2311,7 +2311,8 @@ bool kvm_dirty_ring_enabled(void)
>      return kvm_state->kvm_dirty_ring_size ? true : false;
>  }
>  
> -static void query_stats_cb(StatsResultList **result, StatsTarget target, Error **errp);
> +static void query_stats_cb(StatsResultList **result, StatsTarget target,
> +                           strList *targets, Error **errp);
>  static void query_stats_schemas_cb(StatsSchemaList **result, Error **errp);
>  
>  static int kvm_init(MachineState *ms)
> @@ -4049,7 +4050,8 @@ static void query_stats_schema_vcpu(CPUState *cpu, run_on_cpu_data data)
>      close(stats_fd);
>  }
>  
> -static void query_stats_cb(StatsResultList **result, StatsTarget target, Error **errp)
> +static void query_stats_cb(StatsResultList **result, StatsTarget target,
> +                           strList *targets, Error **errp)
>  {
>      KVMState *s = kvm_state;
>      CPUState *cpu;
> @@ -4073,6 +4075,9 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target, Error *
>          stats_args.result.stats = result;
>          stats_args.errp = errp;
>          CPU_FOREACH(cpu) {
> +            if (!str_in_list(cpu->parent_obj.canonical_path, targets)) {
> +                continue;
> +            }
>              run_on_cpu(cpu, query_stats_vcpu, RUN_ON_CPU_HOST_PTR(&stats_args));
>          }
>          break;
> diff --git a/include/monitor/stats.h b/include/monitor/stats.h
> index 89552ab06f..92a1df3072 100644
> --- a/include/monitor/stats.h
> +++ b/include/monitor/stats.h
> @@ -10,7 +10,8 @@
>  
>  #include "qapi/qapi-types-stats.h"
>  
> -typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target, Error **errp);
> +typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target,
> +                              strList *targets, Error **errp);
>  typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
>  
>  /*
> @@ -30,4 +31,10 @@ void add_stats_entry(StatsResultList **, StatsProvider, const char *id,
>  void add_stats_schema(StatsSchemaList **, StatsProvider, StatsTarget,
>                        StatsSchemaValueList *);
>  
> +/*
> + * True if a string matches the filter passed to the stats_fn callabck,
> + * false otherwise.
> + */
> +bool str_in_list(const char *string, strList *list);
> +
>  #endif /* STATS_H */
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index d83faeca88..1ec7409bc2 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -463,13 +463,30 @@ void add_stats_callbacks(StatRetrieveFunc *stats_fn,
>      QTAILQ_INSERT_TAIL(&stats_callbacks, entry, next);
>  }
>  
> +static strList *stats_target_filter(StatsFilter *filter)
> +{
> +    switch (filter->target) {
> +    case STATS_TARGET_VM:
> +        return NULL;
> +    case STATS_TARGET_VCPU:
> +        if (!filter->u.vcpu.has_vcpus) {
> +            return NULL;
> +        }
> +        return filter->u.vcpu.vcpus;
> +        break;
> +    default:
> +        abort();
> +    }
> +}
> +
>  StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
>  {
>      StatsResultList *stats_results = NULL;
> +    strList *targets = stats_target_filter(filter);
>      StatsCallbacks *entry;
>  
>      QTAILQ_FOREACH(entry, &stats_callbacks, next) {
> -        entry->stats_cb(&stats_results, filter->target, errp);
> +        entry->stats_cb(&stats_results, filter->target, targets, errp);
>      }
>  
>      return stats_results;
> @@ -512,3 +529,18 @@ void add_stats_schema(StatsSchemaList **schema_results,
>      entry->stats = stats_list;
>      QAPI_LIST_PREPEND(*schema_results, entry);
>  }
> +
> +bool str_in_list(const char *string, strList *list)
> +{
> +    strList *str_list = NULL;
> +
> +    if (!list) {
> +        return true;

Are you sure the empty list is supposed to contain any string?

> +    }
> +    for (str_list = list; str_list; str_list = str_list->next) {
> +        if (g_str_equal(string, str_list->value)) {
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> diff --git a/qapi/stats.json b/qapi/stats.json
> index 382223e197..859fc0f459 100644
> --- a/qapi/stats.json
> +++ b/qapi/stats.json
> @@ -68,16 +68,30 @@
>  { 'enum': 'StatsTarget',
>    'data': [ 'vm', 'vcpu' ] }
>  
> +##
> +# @StatsVCPUFilter:
> +#
> +# @vcpus: list of QOM paths for the desired vCPU objects.
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'StatsVCPUFilter',
> +  'data': { '*vcpus': [ 'str' ] } }
> +
>  ##
>  # @StatsFilter:
>  #
>  # The arguments to the query-stats command; specifies a target for which to
> -# request statistics.
> +# request statistics and optionally the required subset of information for
> +# that target:
> +# - which vCPUs to request statistics for
>  #
>  # Since: 7.1
>  ##
> -{ 'struct': 'StatsFilter',
> -  'data': { 'target': 'StatsTarget' } }
> +{ 'union': 'StatsFilter',
> +        'base': { 'target': 'StatsTarget' },
> +  'discriminator': 'target',
> +  'data': { 'vcpu': 'StatsVCPUFilter' } }
>  
>  ##
>  # @StatsValue:


