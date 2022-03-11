Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989B64D621C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 14:09:03 +0100 (CET)
Received: from localhost ([::1]:35096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSf0w-0001yw-7V
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 08:09:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nSeyu-0001H3-C6
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 08:06:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nSeyr-0005r1-Bv
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 08:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647004012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pxfVErtcxj487yc+rSZMrX7LQ0XKJpuHhoqApMRSVU8=;
 b=JBrJDLb01nwJIydMseIVGxBUi/+v46KooyaJD23iIxwSXGYzzV66q592qzZ5vch3zG1SvU
 eFz6NhN6LMSS6nvRceJklMk0LrvBsFPhzsBD2LxwtQJqiIIT30WsZs4I+IoqwqEGBj5NdW
 WMa1HIkoBIJzRf/8hwYghBteNEgcbgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-yGlFsQdAM7ueP84mpUtQeg-1; Fri, 11 Mar 2022 08:06:49 -0500
X-MC-Unique: yGlFsQdAM7ueP84mpUtQeg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65A9A800422;
 Fri, 11 Mar 2022 13:06:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0774126E55;
 Fri, 11 Mar 2022 13:06:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3FB8C21E6A00; Fri, 11 Mar 2022 14:06:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v4 1/3] qmp: Support for querying stats
References: <20220215150433.2310711-1-mark.kanda@oracle.com>
 <20220215150433.2310711-2-mark.kanda@oracle.com>
Date: Fri, 11 Mar 2022 14:06:46 +0100
In-Reply-To: <20220215150433.2310711-2-mark.kanda@oracle.com> (Mark Kanda's
 message of "Tue, 15 Feb 2022 09:04:31 -0600")
Message-ID: <87a6dw7i55.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Kanda <mark.kanda@oracle.com> writes:

> Introduce QMP support for querying stats. Provide a framework for adding new
> stats and support for the following commands:
>
> - query-stats
> Returns a list of all stats per target type (only VM and vCPU to start), with
> additional options for specifying stat names, vCPU qom paths, and providers.
>
> - query-stats-schemas
> Returns a list of stats included in each target type, with an option for
> specifying the provider.
>
> The framework provides a method to register callbacks for these QMP commands.
>
> The first use-case will be for fd-based KVM stats (in an upcoming patch).
>
> Examples (with fd-based KVM stats):
>
> - Query all VM stats:
>
> { "execute": "query-stats", "arguments" : { "target": "vm" } }
>
> { "return": {
>   "vm": [
>      { "provider": "kvm",
>        "stats": [
>           { "name": "max_mmu_page_hash_collisions", "value": 0 },
>           { "name": "max_mmu_rmap_size", "value": 0 },
>           { "name": "nx_lpage_splits", "value": 148 },
>           ...
>      { "provider": "xyz",
>        "stats": [ ...
>      ...
> ] } }
>
> - Query all vCPU stats:
>
> { "execute": "query-stats", "arguments" : { "target": "vcpu" } }
>
> { "return": {
>     "vcpus": [
>       { "path": "/machine/unattached/device[0]"
>         "providers": [
>           { "provider": "kvm",
>             "stats": [
>               { "name": "guest_mode", "value": 0 },
>               { "name": "directed_yield_successful", "value": 0 },
>               { "name": "directed_yield_attempted", "value": 106 },
>               ...
>           { "provider": "xyz",
>             "stats": [ ...
>            ...
>       { "path": "/machine/unattached/device[1]"
>         "providers": [
>           { "provider": "kvm",
>             "stats": [...
>           ...
> } ] } }
>
> - Query 'exits' and 'l1d_flush' KVM stats, and 'somestat' from provider 'xyz'
> for vCPUs '/machine/unattached/device[2]' and '/machine/unattached/device[4]':
>
> { "execute": "query-stats",
>   "arguments": {
>     "target": "vcpu",
>     "vcpus": [ "/machine/unattached/device[2]",
>                "/machine/unattached/device[4]" ],
>     "filters": [
>       { "provider": "kvm",
>         "fields": [ "l1d_flush", "exits" ] },
>       { "provider": "xyz",
>         "fields": [ "somestat" ] } ] } }

Are the stats bulky enough to justfify the extra complexity of
filtering?

>
> { "return": {
>     "vcpus": [
>       { "path": "/machine/unattached/device[2]"
>         "providers": [
>           { "provider": "kvm",
>             "stats": [ { "name": "l1d_flush", "value": 41213 },
>                        { "name": "exits", "value": 74291 } ] },
>           { "provider": "xyz",
>             "stats": [ ... ] } ] },
>       { "path": "/machine/unattached/device[4]"
>         "providers": [
>           { "provider": "kvm",
>             "stats": [ { "name": "l1d_flush", "value": 16132 },
>                        { "name": "exits", "value": 57922 } ] },
>           { "provider": "xyz",
>             "stats": [ ... ] } ] } ] } }
>
> - Query stats schemas:
>
> { "execute": "query-stats-schemas" }
>
> { "return": {
>     "vcpu": [
>       { "provider": "kvm",
>         "stats": [
>            { "name": "guest_mode",
>              "unit": "none",
>              "base": 10,
>              "exponent": 0,
>              "type": "instant" },
>           { "name": "directed_yield_successful",
>              "unit": "none",
>              "base": 10,
>              "exponent": 0,
>              "type": "cumulative" },
>              ...
>       { "provider": "xyz",
>         ...
>    "vm": [
>       { "provider": "kvm",
>         "stats": [
>            { "name": "max_mmu_page_hash_collisions",
>              "unit": "none",
>              "base": 10,
>              "exponent": 0,
>              "type": "peak" },
>       { "provider": "xyz",
>       ...

Can you give a use case for query-stats-schemas?

>
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> ---
>  include/monitor/stats.h |  51 ++++++++
>  monitor/qmp-cmds.c      | 219 +++++++++++++++++++++++++++++++++
>  qapi/meson.build        |   1 +
>  qapi/qapi-schema.json   |   1 +
>  qapi/stats.json         | 259 ++++++++++++++++++++++++++++++++++++++++

That's a lot of schema code.

How much of it is for query-stats, and how much for query-stats-schemas?

How much of the query-stats part is for filtering?

>  5 files changed, 531 insertions(+)
>  create mode 100644 include/monitor/stats.h
>  create mode 100644 qapi/stats.json

[...]

> diff --git a/qapi/stats.json b/qapi/stats.json
> new file mode 100644
> index 0000000000..ae5dc3ee2c
> --- /dev/null
> +++ b/qapi/stats.json
> @@ -0,0 +1,259 @@
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
> +# = Stats
> +##
> +
> +##
> +# @StatsType:
> +#
> +# Enumeration of stats types

We commonly put a blank line between overview and arguments.

> +# @cumulative: stat is cumulative; value can only increase.
> +# @instant: stat is instantaneous; value can increase or decrease.
> +# @peak: stat is the peak value; value can only increase.
> +# @linear-hist: stat is a linear histogram.
> +# @log-hist: stat is a logarithmic histogram.
> +#
> +# Since: 7.0
> +##
> +{ 'enum' : 'StatsType',
> +  'data' : [ 'cumulative', 'instant', 'peak', 'linear-hist', 'log-hist' ] }
> +
> +##
> +# @StatsUnit:
> +#
> +# Enumeration of stats units
> +# @bytes: stat reported in bytes.
> +# @seconds: stat reported in seconds.
> +# @cycles: stat reported in clock cycles.
> +# @none: no unit for this stat.
> +#
> +# Since: 7.0
> +##
> +{ 'enum' : 'StatsUnit',
> +  'data' : [ 'bytes', 'seconds', 'cycles', 'none' ] }
> +
> +##
> +# @StatsBase:
> +#
> +# Enumeration of stats base
> +# @pow10: scale is based on power of 10.
> +# @pow2: scale is based on power of 2.
> +#
> +# Since: 7.0
> +##
> +{ 'enum' : 'StatsBase',
> +  'data' : [ 'pow10', 'pow2' ] }
> +
> +##
> +# @StatsProvider:
> +#
> +# Enumeration of stats providers.
> +#
> +# Since: 7.0
> +##
> +{ 'enum': 'StatsProvider',
> +  'data': [ ] }
> +
> +##
> +# @StatsTarget:
> +#
> +# Enumeration of stats targets.
> +# @vm: stat is per vm.
> +# @vcpu: stat is per vcpu.
> +#
> +# Since: 7.0
> +##
> +{ 'enum': 'StatsTarget',
> +  'data': [ 'vm', 'vcpu' ] }
> +
> +##
> +# @StatsRequest:
> +#
> +# Stats filter element.
> +# @provider: stat provider.
> +# @fields: list of stat names.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'StatsRequest',
> +  'data': { '*provider': 'StatsProvider',
> +            '*fields': [ 'str' ] } }
> +
> +##
> +# @StatsRequestArray:
> +#
> +# @filters: filters for this request.
> +##
> +{ 'struct': 'StatsRequestArray',
> +  'data': { '*filters': [ 'StatsRequest' ] } }
> +
> +##
> +# @StatsVCPURequestArray:
> +#
> +# @vcpus: list of qom paths.
> +##
> +{ 'struct': 'StatsVCPURequestArray',
> +  'base': 'StatsRequestArray',
> +  'data': { '*vcpus': [ 'str' ] } }
> +
> +##
> +# @StatsFilter:
> +#
> +# Target specific filter.
> +#
> +# Since: 7.0
> +##
> +{ 'union': 'StatsFilter',
> +  'base': { 'target': 'StatsTarget' },
> +  'discriminator': 'target',
> +  'data': { 'vcpu': 'StatsVCPURequestArray',
> +            'vm': 'StatsRequestArray' } }
> +
> +##
> +# @StatsValueArray:
> +#
> +# @values: uint64 list.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'StatsValueArray',
> +  'data': { 'values' : [ 'uint64' ] } }
> +
> +##
> +# @StatsValue:
> +#
> +# @scalar: single uint64.
> +# @list: list of uint64.
> +#
> +# Since: 7.0
> +##
> +{ 'alternate': 'StatsValue',
> +  'data': { 'scalar': 'uint64',
> +            'list': 'StatsValueArray' } }

Any particular reason for wrapping the array in a struct?

> +
> +##
> +# @Stats:
> +#
> +# @name: name of stat.
> +# @value: stat value.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'Stats',
> +  'data': { 'name': 'str',
> +            'value' : 'StatsValue' } }
> +
> +##
> +# @StatsResultsEntry:
> +#
> +# @provider: stat provider.
> +# @stats: list of stats.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'StatsResultsEntry',
> +  'data': { 'provider': 'StatsProvider',
> +            'stats': [ 'Stats' ] } }
> +
> +##
> +# @StatsResultsVCPUEntry:
> +#
> +# @path: vCPU qom path.
> +# @providers: per provider results.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'StatsResultsVCPUEntry',
> +  'data': { 'path': 'str',
> +            'providers': [ 'StatsResultsEntry' ] } }
> +
> +##
> +# @StatsResults:
> +#
> +# Target specific results.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'StatsResults',
> +  'data': {
> +      '*vcpus': [ 'StatsResultsVCPUEntry' ],
> +      '*vm': [ 'StatsResultsEntry' ] } }
> +
> +##
> +# @query-stats:
> +#
> +# data: @StatsFilter.
> +# Returns: @StatsResults.
> +#
> +# Since: 7.0
> +##
> +{ 'command': 'query-stats',
> +  'data': 'StatsFilter',
> +  'boxed': true,
> +  'returns': 'StatsResults' }
> +
> +##
> +# @StatsSchemaValue:
> +#
> +# Individual stat schema.
> +# @name: stat name.
> +# @type: @StatType.
> +# @unit: @StatUnit.
> +# @base: @StatBase.
> +# @exponent: Used together with @base.
> +# @bucket-size: Used with linear-hist to report bucket size
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'StatsSchemaValue',
> +  'data': { 'name': 'str',
> +            'type': 'StatsType',
> +            'unit': 'StatsUnit',
> +            'base': 'StatsBase',
> +            'exponent': 'int16',
> +            '*bucket-size': 'uint32' } }
> +
> +##
> +# @StatsSchemaProvider:
> +#
> +# @provider: @StatsProvider.
> +# @stats: list of stats.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'StatsSchemaProvider',
> +  'data': { 'provider': 'StatsProvider',
> +            'stats': [ 'StatsSchemaValue' ] } }
> +
> +##
> +# @StatsSchemaResults:
> +#
> +# @vm: vm stats schemas.
> +# @vcpu: vcpu stats schemas.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'StatsSchemaResults',
> +  'data': { '*vm': [ 'StatsSchemaProvider' ],
> +            '*vcpu': [ 'StatsSchemaProvider' ] } }
> +
> +##
> +# @query-stats-schemas:
> +#
> +# Query Stats schemas.
> +# Returns @StatsSchemaResult.
> +#
> +# Since: 7.0
> +##
> +{ 'command': 'query-stats-schemas',
> +  'data': { '*provider': 'StatsProvider' },
> +  'returns': 'StatsSchemaResults' }


