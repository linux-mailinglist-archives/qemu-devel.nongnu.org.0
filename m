Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973BD4A5C08
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 13:15:51 +0100 (CET)
Received: from localhost ([::1]:55976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEs4c-00042Z-Mw
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 07:15:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEry0-0000ME-Uz
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:09:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nErxw-0004JU-VX
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643717335;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3PuLN1ZKztqzCt+y/2/0/F5Nvtwhfe8MAF2F/AOX1Gk=;
 b=ORTmUP4CxIan41r+vpjWzFkQnuyPjl4O5HATvc0R+I/j/eEFLsbxvEe9zx1VPlbjNyIqot
 8D95AGapaKmDsi+s+GBFdZ2PG0sfxYFUBZ9l6FqdS+UZi0sTIHyv5rskU3boyK/MRCS6LC
 UgWMtnHO6gE2MzKcsNAZqbV0Uvh5C3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-r1i1y0OwOcSSodIMrGtSwQ-1; Tue, 01 Feb 2022 07:08:48 -0500
X-MC-Unique: r1i1y0OwOcSSodIMrGtSwQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7303593922;
 Tue,  1 Feb 2022 12:08:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F04B15F913;
 Tue,  1 Feb 2022 12:08:45 +0000 (UTC)
Date: Tue, 1 Feb 2022 12:08:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v3 1/3] qmp: Support for querying stats
Message-ID: <YfkiyiK+jfrdbVcY@redhat.com>
References: <20220131194312.1192626-1-mark.kanda@oracle.com>
 <20220131194312.1192626-2-mark.kanda@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20220131194312.1192626-2-mark.kanda@oracle.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 01:43:10PM -0600, Mark Kanda wrote:
> Introduce QMP support for querying stats. Provide a framework for adding new
> stats and support for the following commands:
> 
> - query-stats
> Returns a list of all stats per target type (only VM and VCPU for now), with
> additional options for specifying stat names, VCPU qom paths, and stat provider.
> 
> - query-stats-schemas
> Returns a list of stats included in each schema type, with an option for
> specifying the stat provider.
> 
> The framework provides a method to register callbacks for these QMP commands.
> 
> The first usecase will be for fd-based KVM stats (in an upcoming patch).
> 
> Examples (with fd-based KVM stats):
> 
> - Display all VM stats:
> 
> { "execute": "query-stats", "arguments" : { "target": "vm" } }
> { "return": {
>     "list": [
>       { "provider": "kvm",
>         "stats": [
>           { "name": "max_mmu_page_hash_collisions", "value": 0 },
>           { "name": "max_mmu_rmap_size", "value": 0 },
>           { "name": "nx_lpage_splits", "value": 131 },
>          ...
>         ] }
>       { "provider": "provider XYZ",
>       ...
>     ],
>     "target": "vm"
>   }
> }

I still feel like this is rather verbose, and should be simplified
down to.

 { "return": {
     "vm": {
       "kvm": [ ... ]
       "provider-XYZ": [ ... ],
       ...
     }
 }


While vCPU would need one extra nesting layer

 { "return": {
     "vcpus": [
       {
         "path": "/vcpu0/path"
         "kvm": [ ... ]
         "provider-XYZ": [ ... ],
         ...
       },
       {
         "path": "/vcpu1/path"
         "kvm": [ ... ]
         "provider-XYZ": [ ... ],
         ...
       },
       ...
     ],
 }


The notable difference here is that we'd be adding new
keys to the StatsResultEntry struct, every time we gain
a new provider, so your QMP code couldn't be entirely
metadata driven - you'd need new code to wire up each
stats provider. 


> - Display 'exits' and 'l1d_flush' KVM stats for VCPUs at '/machine/unattached/device[2]'
> and '/machine/unattached/device[4]':

Shows the value of giving CPUs proper paths

  https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg06744.html

> 
> { "execute": "query-stats",
>   "arguments" : { "target": "vcpu",
>                   "fields": [ "exits", "l1d_flush" ],
> 	          "paths": [ "/machine/unattached/device[2]",
> 	                      "/machine/unattached/device[4]" ]
>                   "provider": "kvm" } }

This design requires multiple query-stats calls to get data from
multiple providers which I think is very undesirable from a
performance POV.

I'd like to see us able to query fields from many providers at
once

ie so we have something that looks like
 
 { "execute": "query-stats",
   "arguments" : { "target": "vcpu",
 	           "vcpus": [ "/machine/unattached/device[2]",
 	                      "/machine/unattached/device[4]" ]
                   "kvm": [ "exits", "l1d_flush" ],
		   "someprovider: [ "somefield" ] } }


> 
> { "return": {
>     "list": [
>       { "list": [
>           { "provider": "kvm",
>             "stats": [
>               { "name": "l1d_flush", "value": 14690 },
>               { "name": "exits", "value": 50898 }
>             ] }
>         ],
>         "path": "/machine/unattached/device[2]"
>       },
>       { "list": [
>           { "provider": "kvm",
>             "stats": [
>               { "name": "l1d_flush", "value": 24902 },
>               { "name": "exits", "value": 74374 }
>             ] }
> 	 ],
>         "path": "/machine/unattached/device[4]"
>       }
>     ],
>     "target": "vcpu"
>   }
> }
> 
> - Query stats schemas:
> 
> { "execute": "query-stats-schemas" }
> { "return": {
>     "vcpu": [
>       { "provider": "kvm",
>         "stats": [
>            { "name": "guest_mode",
>              "unit": "none",
>              "base": 10,
>              "exponent": 0,
>              "type": "instant" },
> 	   { "name": "directed_yield_successful",
>              "unit": "none",
>              "base": 10,
>              "exponent": 0,
>              "type": "cumulative" },
>              ...
> 	"provider": "provider XYZ",
> ...
>    "vm": [
>       { "provider": "kvm",
>         "stats": [
>            { "name": "max_mmu_page_hash_collisions",
>              "unit": "none",
>              "base": 10,
>              "exponent": 0,
>              "type": "peak" },
> 	"provider": "provider XYZ",
> ...
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> ---
>  include/monitor/stats.h |  36 ++++++
>  monitor/qmp-cmds.c      | 183 +++++++++++++++++++++++++++++
>  qapi/misc.json          | 253 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 472 insertions(+)
>  create mode 100644 include/monitor/stats.h
> 

> diff --git a/qapi/misc.json b/qapi/misc.json
> index e8054f415b..8d326464f0 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json

I'd suggest we introduce a 'stats.json' file just for this. We have
quite a few data types introduced, and its good to avoid 'misc.json'
becoming a dumping ground for ranom unrelated stuff.

> @@ -527,3 +527,256 @@
>   'data': { '*option': 'str' },
>   'returns': ['CommandLineOptionInfo'],
>   'allow-preconfig': true }
> +
> +##
> +# @StatType:

There's inconsistency with naming through these changes. Can we
ensure that everything uses 'Stats' (plural) as the prefix for
every type.

> +#
> +# Enumeration of stat types
> +# @cumulative: stat is cumulative; value can only increase.
> +# @instant: stat is instantaneous; value can increase or decrease.
> +# @peak: stat is the peak value; value can only increase.

Not documenting all members

> +#
> +# Since: 7.0
> +##
> +{ 'enum' : 'StatType',
> +  'data' : [ 'cumulative', 'instant', 'peak',
> +             'linear-hist', 'log-hist', 'unknown' ] }

IMHO 'unknown' shouldn't exist at all.

> +##
> +# @StatsVCPURequest:
> +#
> +# vcpu specific filter element.
> +# @paths: list of qom paths.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'StatsVCPURequest',
> +  'base': 'StatsRequest',
> +  'data': { '*paths': [ 'str' ] } }

Call the field 'vcpus' instead of 'paths' to make it
clear that we're listing VCPU paths here.

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

As mentioned earlier I think we need to have aility to query from
many providers at once. It'd be better to have provider name as
the field name, eg

 { 'struct': 'StatsRequest',
   'data': { '*kvm': ['str'],
             '*someprovider': [ 'str' ] } }

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
> +  'data': { 'vcpu': 'StatsVCPURequest',
> +            'vm': 'StatsRequest' } }

> +##
> +# @StatsValueArray:
> +#
> +# uint64 list for StatsValue.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'StatsValueArray',
> +  'data': { 'list' : [ 'uint64' ] } }

'values' or 'elements' rather than repeating 'list'

> +
> +##
> +# @StatsValue:
> +#
> +# @scalar: stat is single uint64.
> +# @list: stat is a list of uint64.
> +#
> +# Since: 7.0
> +##
> +{ 'alternate': 'StatsValue',
> +  'data': { 'scalar': 'uint64',
> +            'list': 'StatsValueArray' } }
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
> +# @VCPUResultsEntry:
> +#
> +# @path: qom path.
> +# @list: per provider @StatsResultEntry list.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'VCPUResultsEntry',
> +  'data': { 'path': 'str',
> +            'list': [ 'StatsResultsEntry' ] } }
> +
> +##
> +# @VMStatsResults:
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'VMStatsResults',
> +  'data': { 'list' : [ 'StatsResultsEntry' ] } }
> +
> +##
> +# @VCPUStatsResults:
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'VCPUStatsResults',
> +  'data': { 'list': [ 'VCPUResultsEntry' ] } }
> +
> +##
> +# @StatsResults:
> +#
> +# Target specific results.
> +#
> +# Since: 7.0
> +##
> +{ 'union': 'StatsResults',
> +  'base': { 'target': 'StatsTarget' },
> +  'discriminator': 'target',
> +  'data': { 'vcpu': 'VCPUStatsResults',
> +            'vm': 'VMStatsResults' } }

I feel we can simplify this all down somewhat, eliminating levels
of redundant nesting

{ 'struct': 'StatsResultsEntry',
  'data': { '*kvm': [ 'Stats' ] } }

{ 'struct': 'StatsResultsVCPUEntry',
  'base': 'StatsResultsEntry',
  'data': 'path': 'str' } }

{ 'struct': 'StatsResults',
  'data': {
      '*vcpus': ['StatsResultsVCPUEntry'],
      '*vm': 'StatsResultsEntry'
  }
}


> +
> +##
> +# @query-stats:
> +#
> +# data: @StatsFilter
> +# Returns: @StatsResults
> +#
> +# Since: 7.0
> +##
> +{ 'command': 'query-stats',
> +  'data': 'StatsFilter',
> +  'boxed': true,
> +  'returns': 'StatsResults' }

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


