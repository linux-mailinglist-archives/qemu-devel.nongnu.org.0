Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF126511445
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 11:24:34 +0200 (CEST)
Received: from localhost ([::1]:41476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njduT-0000YY-5O
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 05:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1njdq3-0005Ex-KM
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:20:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1njdpy-00054e-HS
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651051191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uidfCOurG5mXdCr5OD+G0Anucxtt6Sz8i4d+fA8ffZA=;
 b=ITCwk3wpvAblynaCpiJBPymFsk8xR3HDsV8H3+L4Uxn9uDFiUaA8LGqXEoUYPmSobCQrdy
 vK34860Vm6U/sSz4ef0iiitXA0IczRrjS9VCaOBI9kVrwh2rw15Kx2Sq6vM1r4w2ys+Apl
 utNfGBLIge7VHTuIhYMcVLRf4/MDpTE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-KmzctUAwNX-gyZYWo_xo2w-1; Wed, 27 Apr 2022 05:19:50 -0400
X-MC-Unique: KmzctUAwNX-gyZYWo_xo2w-1
Received: by mail-wm1-f71.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so381404wmj.0
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 02:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uidfCOurG5mXdCr5OD+G0Anucxtt6Sz8i4d+fA8ffZA=;
 b=4WM0KUSTeRitKhVzakJHLmENybcxnbfIlLkxFsmddpUkfaoRyuv3ZPDNN+Qz7BNpZ3
 zoCmMVcw0zPGWiRTQj1RA23EGqgLvfq6XbGtbWD/onQ9fq0EOpFGO/EeW9YvdOA8Qn0f
 maAH616Q2oHy/24Kbo9mX/LdQv1T3yzNFPDwYrJuEiPa5SRMlAZxW/SFx25fpsv4WQsJ
 BoOi5HTUjEbAF5zJEPAQHdVBf7wScfVNH23/1HwXkNq22Nn60AH4Jd0tp5lx5VA+FJx5
 /V7c1nVjxPqOSwvPAskl0u1V7+2ZqmuLGcHzqRKCXanaKwitpu/XbUV7pbbq8BjQ0jGt
 ABhA==
X-Gm-Message-State: AOAM531t/AUT3nyPslxf9tNe1W44VUKu8ylml30wwXMf5pq/IkRXsmsO
 mVOOw1EE34drW2ZQQXN0UY/FI+UL2YOlB8qt+6UF2k+NFSNDahLQHefpGySUrAVYcMJzWxenvWe
 Ul6ClJfQOYpjDxh0=
X-Received: by 2002:a05:600c:4a08:b0:394:64e:e2d4 with SMTP id
 c8-20020a05600c4a0800b00394064ee2d4mr1117491wmp.4.1651051188945; 
 Wed, 27 Apr 2022 02:19:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA5CWpA5OisByB4ju7/ZhesuoXJz1PMkLdcDo2+Z/NcReeu5CHYl9nK9ha/zMmGOW5J0incQ==
X-Received: by 2002:a05:600c:4a08:b0:394:64e:e2d4 with SMTP id
 c8-20020a05600c4a0800b00394064ee2d4mr1117464wmp.4.1651051188553; 
 Wed, 27 Apr 2022 02:19:48 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 r3-20020a5d6c63000000b0020a94e82a3dsm13718530wrz.64.2022.04.27.02.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 02:19:47 -0700 (PDT)
Date: Wed, 27 Apr 2022 10:19:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/8] qmp: Support for querying stats
Message-ID: <YmkKsQ9rFh+Ydfsu@work-vm>
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-2-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426141619.304611-2-pbonzini@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
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

Is there any hierarchy to the naming or is it just a big flat name
space?

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

Is there some way to reset the peak or cumulative values?

Dave

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
>  monitor/qmp-cmds.c      |  71 +++++++++++++++
>  qapi/meson.build        |   1 +
>  qapi/qapi-schema.json   |   1 +
>  qapi/stats.json         | 192 ++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 298 insertions(+)
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
> index 5e7302cbb9..97825b25fa 100644
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
> @@ -426,3 +428,72 @@ HumanReadableText *qmp_x_query_irq(Error **errp)
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
> index 0000000000..7454dd7daa
> --- /dev/null
> +++ b/qapi/stats.json
> @@ -0,0 +1,192 @@
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
> +# @linear-hist: stat is a linear histogram.
> +# @log-hist: stat is a logarithmic histogram.
> +#
> +# Since: 7.1
> +##
> +{ 'enum' : 'StatsType',
> +  'data' : [ 'cumulative', 'instant', 'peak', 'linear-hist', 'log-hist' ] }
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
> +# @vm: the entire virtual machine.
> +# @vcpu: a virtual CPU.
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
> +# request statistics, and which statistics are requested from each provider.
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'StatsFilter',
> +  'data': { 'target': 'StatsTarget' } }
> +
> +##
> +# @StatsValue:
> +#
> +# @scalar: single uint64.
> +# @list: list of uint64.
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
> +# @name: stat name.
> +#
> +# @type: kind of statistic, a @StatType.
> +#
> +# @unit: base unit of measurement for the statistics @StatUnit.
> +#
> +# @base: base for the multiple of @unit that the statistic uses, either 2 or 10.
> +#        Only present if @exponent is non-zero.
> +#
> +# @exponent: exponent for the multiple of @unit that the statistic uses
> +#
> +# @bucket-size: Used with linear-hist to report the width of each bucket
> +#               of the histogram.
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
> +# @target: kind of object that can be queried through this provider.
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
> -- 
> 2.35.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


