Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492F551A0E0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 15:24:43 +0200 (CEST)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmEzi-0007ya-D0
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 09:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmEy4-0006bo-7W
 for qemu-devel@nongnu.org; Wed, 04 May 2022 09:23:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmExu-0004dC-VB
 for qemu-devel@nongnu.org; Wed, 04 May 2022 09:22:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651670552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NSrjYsZgTWyIqQndOOdtsHzq2gq3X2dCOytiSQaUHUg=;
 b=WMceMEteH4ZDAE8RyA8gWgabXJHw72gno7XXK4kTQ3gfSsQjuGTt0D8ygUeoi5ecmSwYOa
 T9hRZ2/NbrlRSLvjiYVU1uDkG6UqmCnHAKlvqBGv+1tKmZaTHxpbCeWIY6KtNpPBXPlToT
 WS/ngpa9iWi0A+cKoT2VSXRrtj9UtLw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-xUehR2pjP9aeh4PFSCTJuA-1; Wed, 04 May 2022 09:22:28 -0400
X-MC-Unique: xUehR2pjP9aeh4PFSCTJuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 891A03C138AD;
 Wed,  4 May 2022 13:22:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45E9D400F75F;
 Wed,  4 May 2022 13:22:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1003521E66D2; Wed,  4 May 2022 15:22:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  mark.kanda@oracle.com,  berrange@redhat.com,
 dgilbert@redhat.com
Subject: Re: [PATCH 1/8] qmp: Support for querying stats
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-2-pbonzini@redhat.com>
Date: Wed, 04 May 2022 15:22:27 +0200
In-Reply-To: <20220426141619.304611-2-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Tue, 26 Apr 2022 16:16:12 +0200")
Message-ID: <87sfpp3018.fsf@pond.sub.org>
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

The second sentence helps build the case for "we actually need this
stuff".

Can you point to existing uses of KVM binary stats introspection data?

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

[...]

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

For better or worse, we tend to eschew abbreviations in schema
identifiers.  Would you mind @linear-histogram and @log-histogram?

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

Do VM stats include vCPU stats?  "Entire virtual machine" suggests they
do...

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

The "and which statistics" part will be implemented later in this
series?

> +
> +##
> +# @StatsValue:
> +#
> +# @scalar: single uint64.
> +# @list: list of uint64.

Recommend to spell out uint64 as "unsigned 64 bit integer".

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

When exactly will @qom-path be present?

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

Generated documentation looks like

       type: StatsType
              kind of statistic, a StatType.

I think ", a @StatType" should be dropped.

If we decide to keep it: @StatsType.

> +#
> +# @unit: base unit of measurement for the statistics @StatUnit.

"@StatUnit", too.

If we decide to keep it: @StatsUnit.

@unit is optional.  What's the default?

> +#
> +# @base: base for the multiple of @unit that the statistic uses, either 2 or 10.
> +#        Only present if @exponent is non-zero.
> +#
> +# @exponent: exponent for the multiple of @unit that the statistic uses

Alright, given a stat value 42, what does it mean for the possible
combinations of @base and @exponent?

> +#
> +# @bucket-size: Used with linear-hist to report the width of each bucket
> +#               of the histogram.

Feels too terse.  Example, perhaps?

I assume @bucket-size is present exactly when @type is @linear-hist.
Correct?

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

How am I to connect each element of the result of query-stats to an
element of the result of query-stats-schema?

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


