Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450F9526266
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 14:56:18 +0200 (CEST)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npUq8-0007zq-FY
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 08:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1npUma-0005VO-7k
 for qemu-devel@nongnu.org; Fri, 13 May 2022 08:52:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1npUmU-0003q4-UP
 for qemu-devel@nongnu.org; Fri, 13 May 2022 08:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652446349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jvWh8iVPpfjVyVtFBywZlryK6NM/0i32omuQ9amqUtA=;
 b=C+4RSn5/1k6Q9WaAnYNGssFlN/QS0MZwkBnzx+wdnoDF/OtxaIn9OcbbJkWU4AGJ7p++23
 lTHqOsEBK68N6rwIcoFgx+nbTMsAd5TKMzGb1MQyWro01sPSi0c20BaGlCQMRnyMOs6G/i
 QfmxkFsE+Ix+TwqNU2ynjehz/EtWo/Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-dfkkhSoZOnK39q6vlMph2g-1; Fri, 13 May 2022 08:52:28 -0400
X-MC-Unique: dfkkhSoZOnK39q6vlMph2g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7275D3802AC3;
 Fri, 13 May 2022 12:52:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13A65416156;
 Fri, 13 May 2022 12:52:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D043321E690D; Fri, 13 May 2022 14:52:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  armbru@redhat.com,  dgilbert@redhat.com,
 berrange@redhat.com,  Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v2 1/8] qmp: Support for querying stats
References: <20220511084833.195963-1-pbonzini@redhat.com>
 <20220511084833.195963-2-pbonzini@redhat.com>
Date: Fri, 13 May 2022 14:52:26 +0200
In-Reply-To: <20220511084833.195963-2-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Wed, 11 May 2022 10:48:26 +0200")
Message-ID: <87wnepy4qd.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

> From: Mark Kanda <mark.kanda@oracle.com>
>
> Introduce QMP support for querying stats. Provide a framework for adding new
> stats and support for the following commands:
>
> - query-stats
> Returns a list of all stats per target type (only VM and vCPU to start), with
> additional options for specifying stat names, vCPU qom paths, and providers.
>
> - query-stats-schemas
> Returns a list of stats included in each target type, with an option for
> specifying the provider.  The concepts in the schema are based on the
> KVM binary stats' own introspection data, just translated to QAPI.
>
> The framework provides a method to register callbacks for these QMP commands.
> Most of the work in fact is done by the callbacks, and a large majority of
> this patch is new QAPI structs and commands.
>
> The first use-case will be for fd-based KVM stats (in an upcoming patch).
>
> Examples (with fd-based KVM stats):
>
> - Query all VM stats:
>
> { "execute": "query-stats", "arguments" : { "target": "vm" } }
>
> { "return": [
>      { "provider": "kvm",
>        "stats": [
>           { "name": "max_mmu_page_hash_collisions", "value": 0 },
>           { "name": "max_mmu_rmap_size", "value": 0 },
>           { "name": "nx_lpage_splits", "value": 148 },
>           ... ] },
>      { "provider": "xyz",
>        "stats": [ ... ] }
> ] }
>
> - Query all vCPU stats:
>
> { "execute": "query-stats", "arguments" : { "target": "vcpu" } }
>
> { "return": [
>      { "provider": "kvm",
>        "qom_path": "/machine/unattached/device[0]"
>        "stats": [
>           { "name": "guest_mode", "value": 0 },
>           { "name": "directed_yield_successful", "value": 0 },
>           { "name": "directed_yield_attempted", "value": 106 },
>           ... ] },
>      { "provider": "kvm",
>        "qom_path": "/machine/unattached/device[1]"
>        "stats": [
>           { "name": "guest_mode", "value": 0 },
>           { "name": "directed_yield_successful", "value": 0 },
>           { "name": "directed_yield_attempted", "value": 106 },
>           ... ] },
> ] }
>
> - Retrieve the schemas:
>
> { "execute": "query-stats-schemas" }
>
> { "return": [
>     { "provider": "kvm",
>       "target": "vcpu",
>       "stats": [
>          { "name": "guest_mode",
>            "unit": "none",
>            "base": 10,
>            "exponent": 0,
>            "type": "instant" },
>         { "name": "directed_yield_successful",
>            "unit": "none",
>            "base": 10,
>            "exponent": 0,
>            "type": "cumulative" },
>         ... ]
>     },
>     { "provider": "kvm",
>       "target": "vm",
>       "stats": [
>         { "name": "max_mmu_page_hash_collisions",
>            "unit": "none",
>            "base": 10,
>            "exponent": 0,
>            "type": "peak" },
>         ... ]
>     },
>     { "provider": "xyz",
>       "target": "vm",
>       "stats": [ ... ]
>     }
> ] }
>
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/monitor/stats.h |  33 +++++++
>  monitor/qmp-cmds.c      |  71 ++++++++++++++
>  qapi/meson.build        |   1 +
>  qapi/qapi-schema.json   |   1 +
>  qapi/stats.json         | 201 ++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 307 insertions(+)
>  create mode 100644 include/monitor/stats.h
>  create mode 100644 qapi/stats.json
>
> diff --git a/include/monitor/stats.h b/include/monitor/stats.h
> new file mode 100644
> index 0000000000..89552ab06f
> --- /dev/null
> +++ b/include/monitor/stats.h
> @@ -0,0 +1,33 @@
> +/*
> + * Copyright (c) 2022 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef STATS_H
> +#define STATS_H
> +
> +#include "qapi/qapi-types-stats.h"
> +
> +typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target, Error **errp);
> +typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
> +
> +/*
> + * Register callbacks for the QMP query-stats command.
> + *
> + * @stats_fn: routine to query stats:
> + * @schema_fn: routine to query stat schemas:
> + */
> +void add_stats_callbacks(StatRetrieveFunc *stats_fn,
> +                         SchemaRetrieveFunc *schemas_fn);
> +
> +/*
> + * Helper routines for adding stats entries to the results lists.
> + */
> +void add_stats_entry(StatsResultList **, StatsProvider, const char *id,
> +                     StatsList *stats_list);
> +void add_stats_schema(StatsSchemaList **, StatsProvider, StatsTarget,
> +                      StatsSchemaValueList *);
> +
> +#endif /* STATS_H */
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 1ebb89f46c..d83faeca88 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -35,6 +35,7 @@
>  #include "qapi/qapi-commands-control.h"
>  #include "qapi/qapi-commands-machine.h"
>  #include "qapi/qapi-commands-misc.h"
> +#include "qapi/qapi-commands-stats.h"
>  #include "qapi/qapi-commands-ui.h"
>  #include "qapi/type-helpers.h"
>  #include "qapi/qmp/qerror.h"
> @@ -43,6 +44,7 @@
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/intc/intc.h"
>  #include "hw/rdma/rdma.h"
> +#include "monitor/stats.h"
>  
>  NameInfo *qmp_query_name(Error **errp)
>  {
> @@ -441,3 +443,72 @@ HumanReadableText *qmp_x_query_irq(Error **errp)
>  
>      return human_readable_text_from_str(buf);
>  }
> +
> +typedef struct StatsCallbacks {
> +    StatRetrieveFunc *stats_cb;
> +    SchemaRetrieveFunc *schemas_cb;
> +    QTAILQ_ENTRY(StatsCallbacks) next;
> +} StatsCallbacks;
> +
> +static QTAILQ_HEAD(, StatsCallbacks) stats_callbacks =
> +    QTAILQ_HEAD_INITIALIZER(stats_callbacks);
> +
> +void add_stats_callbacks(StatRetrieveFunc *stats_fn,
> +                         SchemaRetrieveFunc *schemas_fn)
> +{
> +    StatsCallbacks *entry = g_new(StatsCallbacks, 1);
> +    entry->stats_cb = stats_fn;
> +    entry->schemas_cb = schemas_fn;
> +
> +    QTAILQ_INSERT_TAIL(&stats_callbacks, entry, next);
> +}
> +
> +StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
> +{
> +    StatsResultList *stats_results = NULL;
> +    StatsCallbacks *entry;
> +
> +    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
> +        entry->stats_cb(&stats_results, filter->target, errp);
> +    }
> +
> +    return stats_results;
> +}
> +
> +StatsSchemaList *qmp_query_stats_schemas(Error **errp)
> +{
> +    StatsSchemaList *stats_results = NULL;
> +    StatsCallbacks *entry;
> +
> +    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
> +        entry->schemas_cb(&stats_results, errp);
> +    }
> +
> +    return stats_results;
> +}
> +
> +void add_stats_entry(StatsResultList **stats_results, StatsProvider provider,
> +                     const char *qom_path, StatsList *stats_list)
> +{
> +    StatsResult *entry = g_new0(StatsResult, 1);
> +    entry->provider = provider;
> +    if (qom_path) {
> +        entry->has_qom_path = true;
> +        entry->qom_path = g_strdup(qom_path);
> +    }
> +    entry->stats = stats_list;
> +
> +    QAPI_LIST_PREPEND(*stats_results, entry);
> +}
> +
> +void add_stats_schema(StatsSchemaList **schema_results,
> +                      StatsProvider provider, StatsTarget target,
> +                      StatsSchemaValueList *stats_list)
> +{
> +    StatsSchema *entry = g_new0(StatsSchema, 1);
> +
> +    entry->provider = provider;
> +    entry->target = target;
> +    entry->stats = stats_list;
> +    QAPI_LIST_PREPEND(*schema_results, entry);
> +}
> diff --git a/qapi/meson.build b/qapi/meson.build
> index 656ef0e039..fd5c93d643 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -46,6 +46,7 @@ qapi_all_modules = [
>    'replay',
>    'run-state',
>    'sockets',
> +  'stats',
>    'trace',
>    'transaction',
>    'yank',
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index 4912b9744e..92d7ecc52c 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -93,3 +93,4 @@
>  { 'include': 'audio.json' }
>  { 'include': 'acpi.json' }
>  { 'include': 'pci.json' }
> +{ 'include': 'stats.json' }
> diff --git a/qapi/stats.json b/qapi/stats.json
> new file mode 100644
> index 0000000000..033cb60d71
> --- /dev/null
> +++ b/qapi/stats.json
> @@ -0,0 +1,201 @@
> +# -*- Mode: Python -*-
> +# vim: filetype=python
> +#
> +# Copyright (c) 2022 Oracle and/or its affiliates.
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or later.
> +# See the COPYING file in the top-level directory.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +##
> +# = Statistics
> +##
> +
> +##
> +# @StatsType:
> +#
> +# Enumeration of statistics types
> +#
> +# @cumulative: stat is cumulative; value can only increase.
> +# @instant: stat is instantaneous; value can increase or decrease.
> +# @peak: stat is the peak value; value can only increase.
> +# @linear-histogram: stat is a linear histogram.
> +# @log2-histogram: stat is a logarithmic histogram, with one bucket
> +#                  for each power of two.
> +#
> +# Since: 7.1
> +##
> +{ 'enum' : 'StatsType',
> +  'data' : [ 'cumulative', 'instant', 'peak', 'linear-histogram', 'log2-histogram' ] }
> +
> +##
> +# @StatsUnit:
> +#
> +# Enumeration of unit of measurement for statistics
> +#
> +# @bytes: stat reported in bytes.
> +# @seconds: stat reported in seconds.
> +# @cycles: stat reported in clock cycles.
> +#
> +# Since: 7.1
> +##
> +{ 'enum' : 'StatsUnit',
> +  'data' : [ 'bytes', 'seconds', 'cycles' ] }
> +
> +##
> +# @StatsProvider:
> +#
> +# Enumeration of statistics providers.
> +#
> +# Since: 7.1
> +##
> +{ 'enum': 'StatsProvider',
> +  'data': [ ] }
> +
> +##
> +# @StatsTarget:
> +#
> +# The kinds of objects on which one can request statistics.
> +#
> +# @vm: statistics that apply to the entire virtual machine or
> +#      the entire QEMU process.
> +#
> +# @vcpu: statistics that apply to a single virtual CPU.
> +#
> +# Since: 7.1
> +##
> +{ 'enum': 'StatsTarget',
> +  'data': [ 'vm', 'vcpu' ] }
> +
> +##
> +# @StatsFilter:
> +#
> +# The arguments to the query-stats command; specifies a target for which to
> +# request statistics.
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'StatsFilter',
> +  'data': { 'target': 'StatsTarget' } }
> +
> +##
> +# @StatsValue:
> +#
> +# @scalar: single unsigned 64-bit integers.
> +# @list: list of unsigned 64-bit integers (used for histograms).
> +#
> +# Since: 7.1
> +##
> +{ 'alternate': 'StatsValue',
> +  'data': { 'scalar': 'uint64',
> +            'list': [ 'uint64' ] } }
> +
> +##
> +# @Stats:
> +#
> +# @name: name of stat.
> +# @value: stat value.
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'Stats',
> +  'data': { 'name': 'str',
> +            'value' : 'StatsValue' } }
> +
> +##
> +# @StatsResult:
> +#
> +# @provider: provider for this set of statistics.
> +# @qom-path: QOM path of the object for which the statistics are returned

Since @qom-path is optional, we better document when it's present.  In
the review thread for v1, you explained "Only if the target is vcpus,
for the current set of targets."  More general, and hopefully still
correct, would be "Present if that object is a QOM object", but the
phrasing feels rather clumsy.  Would appending ", if any" suffice?

> +# @stats: list of statistics.
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'StatsResult',
> +  'data': { 'provider': 'StatsProvider',
> +            '*qom-path': 'str',
> +            'stats': [ 'Stats' ] } }
> +
> +##
> +# @query-stats:
> +#
> +# Return runtime-collected statistics for objects such as the
> +# VM or its vCPUs.
> +#
> +# The arguments are a StatsFilter and specify the provider and objects
> +# to return statistics about.
> +#
> +# Returns: a list of StatsResult, one for each provider and object
> +#          (e.g., for each vCPU).
> +#
> +# Since: 7.1
> +##
> +{ 'command': 'query-stats',
> +  'data': 'StatsFilter',
> +  'boxed': true,
> +  'returns': [ 'StatsResult' ] }
> +
> +##
> +# @StatsSchemaValue:
> +#
> +# Schema for a single statistic.
> +#
> +# @name: name of the statistic; each element of the schema is uniquely
> +#        identified by a target, a provider (both available in @StatsSchema)
> +#        and the name.
> +#
> +# @type: kind of statistic.
> +#
> +# @unit: basic unit of measure for the statistic; if missing, the statistic
> +#        is a simple number or counter.
> +#
> +# @base: base for the multiple of @unit in which the statistic is measured.
> +#        Only present if @exponent is non-zero; @base and @exponent together
> +#        form a SI prefix (e.g., _nano-_ for ``base=10`` and ``exponent=-9``)
> +#        or IEC binary prefix (e.g. _kibi-_ for ``base=2`` and ``exponent=10``)
> +#
> +# @exponent: exponent for the multiple of @unit in which the statistic is
> +#            expressed, or 0 for the basic unit
> +#
> +# @bucket-size: Used with the @linear-histogram @StatsType, contains the width

Suggest 'present when @type is "linear-histogram", contains ...'.

> +#               of each bucket of the histogram.
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'StatsSchemaValue',
> +  'data': { 'name': 'str',
> +            'type': 'StatsType',
> +            '*unit': 'StatsUnit',
> +            '*base': 'int8',
> +            'exponent': 'int16',
> +            '*bucket-size': 'uint32' } }
> +
> +##
> +# @StatsSchema:
> +#
> +# Schema for all available statistics for a provider and target.
> +#
> +# @provider: provider for this set of statistics.
> +#
> +# @target: the kind of object that can be queried through the provider.
> +#
> +# @stats: list of statistics.
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'StatsSchema',
> +  'data': { 'provider': 'StatsProvider',
> +            'target': 'StatsTarget',
> +            'stats': [ 'StatsSchemaValue' ] } }
> +
> +##
> +# @query-stats-schemas:
> +#
> +# Return the schema for all available runtime-collected statistics.
> +#
> +# Since: 7.1
> +##
> +{ 'command': 'query-stats-schemas',
> +  'data': { },
> +  'returns': [ 'StatsSchema' ] }


