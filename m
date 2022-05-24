Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FB6532AAA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:49:04 +0200 (CEST)
Received: from localhost ([::1]:34266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTyA-0008TF-WA
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ntTic-00019z-PO
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ntTia-0002tT-9C
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653395575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xdY06vCfPAsjlpByfTac2gD0dePI40sy2yPDtjTtaok=;
 b=Uoq5wUpbD+4PzDNPI+cz29+dboel3zQ+R1giEdP4MTLG+RCBCWuRvVOJ0vccjsfumj+SXK
 tEjqgvWm4FlZCGrO901NF6sb3+watKvvzUfmP4m4eWVBsfFcquaTcmDO46xzWHhEG73/nH
 mAF35cJPl/ooHRGgUzQLZWhiQbtwV3A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-pAORjE9ZONW5_yEFZvVqBQ-1; Tue, 24 May 2022 08:32:51 -0400
X-MC-Unique: pAORjE9ZONW5_yEFZvVqBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 943F53C025B0;
 Tue, 24 May 2022 12:32:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 433F940C1438;
 Tue, 24 May 2022 12:32:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6E09721E6906; Tue, 24 May 2022 14:32:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  armbru@redhat.com,  Mark Kanda
 <mark.kanda@oracle.com>
Subject: Re: [PATCH 5/8] qmp: add filtering of statistics by provider
References: <20220523150509.349412-1-pbonzini@redhat.com>
 <20220523150722.349700-1-pbonzini@redhat.com>
 <20220523150722.349700-5-pbonzini@redhat.com>
Date: Tue, 24 May 2022 14:32:49 +0200
In-Reply-To: <20220523150722.349700-5-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 23 May 2022 17:07:19 +0200")
Message-ID: <877d6bxg9a.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

> Allow retrieving the statistics from a specific provider only.
> This can be used in the future by HMP commands such as "info
> sync-profile" or "info profile".  The next patch also adds
> filter-by-provider capabilities to the HMP equivalent of
> query-stats, "info stats".
>
> Example:
>
> { "execute": "query-stats",
>   "arguments": {
>     "target": "vm",
>     "providers": [
>       { "provider": "kvm" } ] } }
>
> The QAPI is a bit more verbose than just a list of StatsProvider,
> so that it can be subsequently extended with filtering of statistics
> by name.
>
> Extracted from a patch by Mark Kanda.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  accel/kvm/kvm-all.c     |  3 ++-
>  include/monitor/stats.h |  4 +++-
>  monitor/hmp-cmds.c      |  2 +-
>  monitor/qmp-cmds.c      | 45 ++++++++++++++++++++++++++++++++---------
>  qapi/stats.json         | 17 ++++++++++++++--
>  5 files changed, 56 insertions(+), 15 deletions(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 3ee431a431..461b6cf927 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2644,7 +2644,8 @@ static int kvm_init(MachineState *ms)
>      }
>  
>      if (kvm_check_extension(kvm_state, KVM_CAP_BINARY_STATS_FD)) {
> -        add_stats_callbacks(query_stats_cb, query_stats_schemas_cb);
> +        add_stats_callbacks(STATS_PROVIDER_KVM, query_stats_cb,
> +                            query_stats_schemas_cb);
>      }
>  
>      return 0;
> diff --git a/include/monitor/stats.h b/include/monitor/stats.h
> index 8c50feeaa9..840c4ed08e 100644
> --- a/include/monitor/stats.h
> +++ b/include/monitor/stats.h
> @@ -17,10 +17,12 @@ typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
>  /*
>   * Register callbacks for the QMP query-stats command.
>   *
> + * @provider: stats provider

Argument documentation that merely paraphrases the type is redundant.
May I have a proper contract?

>   * @stats_fn: routine to query stats:
>   * @schema_fn: routine to query stat schemas:
>   */
> -void add_stats_callbacks(StatRetrieveFunc *stats_fn,
> +void add_stats_callbacks(StatsProvider provider,
> +                         StatRetrieveFunc *stats_fn,
>                           SchemaRetrieveFunc *schemas_fn);
>  
>  /*
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index c0cb440902..8d2c4792d5 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2394,7 +2394,7 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
>          goto exit_no_print;
>      }
>  
> -    schema = qmp_query_stats_schemas(&err);
> +    schema = qmp_query_stats_schemas(false, 0, &err);

NULL instead of 0 please.

>      if (err) {
>          goto exit;
>      }
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index ebf6f49446..7be0e7414a 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -445,6 +445,7 @@ HumanReadableText *qmp_x_query_irq(Error **errp)
>  }
>  
>  typedef struct StatsCallbacks {
> +    StatsProvider provider;
>      StatRetrieveFunc *stats_cb;
>      SchemaRetrieveFunc *schemas_cb;
>      QTAILQ_ENTRY(StatsCallbacks) next;
> @@ -453,16 +454,34 @@ typedef struct StatsCallbacks {
>  static QTAILQ_HEAD(, StatsCallbacks) stats_callbacks =
>      QTAILQ_HEAD_INITIALIZER(stats_callbacks);
>  
> -void add_stats_callbacks(StatRetrieveFunc *stats_fn,
> +void add_stats_callbacks(StatsProvider provider,
> +                         StatRetrieveFunc *stats_fn,
>                           SchemaRetrieveFunc *schemas_fn)
>  {
>      StatsCallbacks *entry = g_new(StatsCallbacks, 1);
> +    entry->provider = provider;
>      entry->stats_cb = stats_fn;
>      entry->schemas_cb = schemas_fn;
>  
>      QTAILQ_INSERT_TAIL(&stats_callbacks, entry, next);
>  }
>  
> +static bool stats_provider_requested(StatsProvider provider,
> +                                     StatsFilter *filter)
> +{
> +    StatsRequestList *request;
> +
> +    if (!filter->has_providers) {
> +        return true;
> +    }
> +    for (request = filter->providers; request; request = request->next) {
> +        if (request->value->provider == provider) {
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +

This is just like apply_str_list_filter().  Good!  Could we make the two
names similar, too?

>  StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
>  {
>      StatsResultList *stats_results = NULL;
> @@ -487,27 +506,33 @@ StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
>      }
>  
>      QTAILQ_FOREACH(entry, &stats_callbacks, next) {
> -        entry->stats_cb(&stats_results, filter->target, targets, errp);
> -        if (*errp) {
> -            qapi_free_StatsResultList(stats_results);
> -            return NULL;
> +        if (stats_provider_requested(entry->provider, filter)) {
> +            entry->stats_cb(&stats_results, filter->target, targets, errp);
> +            if (*errp) {
> +                qapi_free_StatsResultList(stats_results);
> +                return NULL;
> +            }

I like if (!wanted) continue in such loops for less nesting.  Clearly a
matter of taste.

>          }
>      }
>  
>      return stats_results;
>  }
>  
> -StatsSchemaList *qmp_query_stats_schemas(Error **errp)
> +StatsSchemaList *qmp_query_stats_schemas(bool has_provider,
> +                                         StatsProvider provider,
> +                                         Error **errp)
>  {
>      StatsSchemaList *stats_results = NULL;
>      StatsCallbacks *entry;
>      ERRP_GUARD();
>  
>      QTAILQ_FOREACH(entry, &stats_callbacks, next) {
> -        entry->schemas_cb(&stats_results, errp);
> -        if (*errp) {
> -            qapi_free_StatsSchemaList(stats_results);
> -            return NULL;
> +        if (!has_provider || provider == entry->provider) {
> +            entry->schemas_cb(&stats_results, errp);
> +            if (*errp) {
> +                qapi_free_StatsSchemaList(stats_results);
> +                return NULL;
> +            }

Likewise.

>          }
>      }
>  
> diff --git a/qapi/stats.json b/qapi/stats.json
> index e8ed907793..b75bb86124 100644
> --- a/qapi/stats.json
> +++ b/qapi/stats.json
> @@ -68,6 +68,18 @@
>  { 'enum': 'StatsTarget',
>    'data': [ 'vm', 'vcpu' ] }
>  
> +##
> +# @StatsRequest:
> +#
> +# Indicates a set of statistics that should be returned by query-stats.
> +#
> +# @provider: provider for which to return statistics.
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'StatsRequest',
> +  'data': { 'provider': 'StatsProvider' } }
> +
>  ##
>  # @StatsVCPUFilter:
>  #
> @@ -85,11 +97,12 @@
>  # request statistics and optionally the required subset of information for
>  # that target:
>  # - which vCPUs to request statistics for
> +# - which provider to request statistics from
>  #
>  # Since: 7.1
>  ##
>  { 'union': 'StatsFilter',
> -        'base': { 'target': 'StatsTarget' },
> +        'base': { 'target': 'StatsTarget', '*providers': [ 'StatsRequest' ] },

Easier to read, I think:

           'base': {
               'target': 'StatsTarget',
               '*providers': [ 'StatsRequest' ] },

>    'discriminator': 'target',
>    'data': { 'vcpu': 'StatsVCPUFilter' } }
>  
> @@ -225,5 +238,5 @@
>  # Since: 7.1
>  ##
>  { 'command': 'query-stats-schemas',
> -  'data': { },
> +  'data': { '*provider': 'StatsProvider' },
>    'returns': [ 'StatsSchema' ] }

Only the "NULL instead of 0" is a request, the remainder suggestions.
So, with that request addressed
Reviewed-by: Markus Armbruster <armbru@redhat.com>

PS: Consider adding

    [diff]
            orderFile = scripts/git.orderfile

to your .git/config.


