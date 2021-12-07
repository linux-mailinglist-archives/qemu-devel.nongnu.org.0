Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4263046C315
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 19:48:15 +0100 (CET)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mufVc-0000GY-Vt
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 13:48:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mufQh-0006oR-Tl
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 13:43:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mufQe-0001DE-1a
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 13:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638902582;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=okCF6uq+S0oh9Xd9d/LriKcH2HNlc6ttHxvNp0xjCY4=;
 b=RzOzYjJ2YVRD8pvK/9V2xqM7T5Aq5e/VhunSncmy0/jXfnEcbpV5wsdEoCbktpzSgQuT8T
 dDWEblWc6yNmU9cLEIxnvVySD92FT6C/YIQvuRK2RetYXtN6tz+JtDw2IGiztDJYcKWvO9
 KTnjxv1IxrBj058bFvwE7KH7PBhn54E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-hOujm_l7Oie4Nlv0ljSWPg-1; Tue, 07 Dec 2021 13:42:58 -0500
X-MC-Unique: hOujm_l7Oie4Nlv0ljSWPg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D6E9802C91;
 Tue,  7 Dec 2021 18:42:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.140])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA1FF6D036;
 Tue,  7 Dec 2021 18:42:55 +0000 (UTC)
Date: Tue, 7 Dec 2021 18:42:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v2 1/3] qmp: Support for querying stats
Message-ID: <Ya+rLex1djU/1Wc1@redhat.com>
References: <20211119195153.11815-1-mark.kanda@oracle.com>
 <20211119195153.11815-2-mark.kanda@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20211119195153.11815-2-mark.kanda@oracle.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Copying in Markus as QAPI maintainer, since I feel this proposed
design is a little oddball from typical QAPI design approach....

On Fri, Nov 19, 2021 at 01:51:51PM -0600, Mark Kanda wrote:
> Introduce qmp support for querying stats. Provide a framework for
> adding new stats and support for the following commands:
> 
> - query-stats
> Returns a list of all stats, with options for specifying a stat
> name and schema type. A schema type is the set of stats associated
> with a given component (e.g. vm or vcpu).
> 
> - query-stats-schemas
> Returns a list of stats included in each schema type, with an
> option for specifying the schema name.
> 
> - query-stats-instances
> Returns a list of stat instances and their associated schema type.
> 
> The framework provides a method to register callbacks for these qmp
> commands.
> 
> The first usecase will be for fd-based KVM stats (in an upcoming
> patch).
> 
> Examples (with fd-based KVM stats):
> 
> { "execute": "query-stats" }
> { "return": [
>     { "name": "vcpu_1",
>       "type": "kvm-vcpu",
>       "stats": [
>         { "name": "guest_mode",
>           "unit": "none",
>           "base": 10,
>           "val": [ 0 ],
>           "exponent": 0,
>           "type": "instant" },
>         { "name": "directed_yield_successful",
>           "unit": "none",
>           "base": 10,
>           "val": [ 0 ],
>           "exponent": 0,
>           "type": "cumulative" },
> ...
>     },
>     { "name": "vcpu_0",
>       "type": "kvm-vcpu",
>       "stats": ...
> ...
>  },
>     { "name": "vm",
>       "type": "kvm-vm",
>       "stats": [
>         { "name": "max_mmu_page_hash_collisions",
>           "unit": "none",
>           "base": 10,
>           "val": [ 0 ],
>           "exponent": 0,
>           "type": "peak" },
>           ...

So this is essentially exposing the low level kernel data structure
'struct kvm_stats_desc' mapped 1-to-1 into QAPI.

There are pros/cons to doing that should be explored to see whether
this actually makes sense for the QMP design.

I understand this design is intended to be fully self-describing
such that we can add arbitrarily more fields without ever
changing QEMU code, and with a simple mapping from the kernel
kvm_stats_desc.

Taking the first level of data returned, we see the natural
structure of the data wrt vCPUs is flattened:

 { "return": [
     { "name": "vcpu_0",
       "type": "kvm-vcpu",
       "stats": [...],  // stats for vcpu 0
     },
     { "name": "vcpu_1",
       "type": "kvm-vcpu",
       "stats": [...],  // stats for vcpu 0
     },
     ...other vCPUs...
     { "name": "vm",
       "type": "kvm-vm",
       "stats": [...],  // stats for the VM
     },
 }

This name+type stuff is all unnecessarily indirect. If we ever
have to add more data unrelated to the kvm stats, we're going
to need QEMU changes no matter what, so this indirect structure
isn't future proofing it.

I'd rather expect us to have named struct fields for each
different provider of data, respecting the natural hierachy.
ie use an array for vCPU data.

I understand this is future proofed to be able to support
non-KVM stats. If we have KVM per-vCPU stat and non-KVM
per-VCPU stats at the same time, I'd expect them all to
appear in the same place.  IOW, overall I'd expect to
see grouping more like

 { "return": {
     "vcpus": [
        
        [ // stats for vcpu 0
          { "provider": 'kvm',
            "stats": [...] },
          { "provider": 'qemu',
            "stats"; [...] }
        ],
        
        [ // stats for vcpu 1
          { "provider": 'kvm',
            "stats": [...] },
          { "provider": 'qemu',
            "stats"; [...] }
        ],
        
        ...other vCPUs...
     ]
     "vm": [
         { "provider": 'kvm',
           "stats": [...] },
         { "provider": 'qemu',
           "stats"; [...] } ],
     ],
 }


Now onto the values being reported. AFAICT from the kernel
docs, for all the types of data it currently reports
(cumulative, instant, peak, none), there is only ever going
to be a single value. I assume the ability to report multiple
values is future proofing for a later requirement. This is
fine from a kerenl POV since they're trying to fit this into
a flat struct. QAPI is way more flexible. It can switch
between reporting an scale or array or scalars for the
same field. So if we know the stat will only ever have
1 value, we should be reporting a scalar, not an array
which will only ever have one value.

Second, for a given named statistic, AFAICT, the data type,
unit, base and exponent are all fixed. I don't see a reason
for us to be reporting that information every time we call
'query-stats'. Just report the name + value(s).  Apps that
want a specific named stat won't care about the dimensions,
because they'll already know what the value means.

Apps that want to be metadata driven to handle arbitrary
stats, can just call 'query-stats-schemas' to learn about
the dimensions one time.

This will give waaay lower data transfer for querying
values repeatedly.

> 
> { "execute": "query-stats-schemas" }
> { "return": [
>     { "type": "kvm-vcpu",
>       "stats": [
>         { "name": "guest_mode" },
>         { "name": "directed_yield_successful" },
>         ...
>         },
>     { "type": "kvm-vm",
>       "stats": [
>         { "name": "max_mmu_page_hash_collisions" },
>         { "name": "max_mmu_rmap_size" },
>         ...

...this can be used to introspect the data type, unit,
base, exponent as a one time task, if needed.

Again, I'd expect the first level of nested to be
removed  to mirror 'query-stats',

 { "return": {
     "vcpu": [
         {
           "provider": "kvm",
           "stats": [
             { "name": "guest_mode",
               "unit": "none",
               "base": 10,
               "exponent": 0 },
             { "name": "directed_yield_successful"
               "unit": "none",
               "base": 10,
               "exponent": 0 },
             },
           ],
         },
         {
           "provider": "qemu"
           "stats": [
             {
               "name": "something_blah_blah",
               "unit": "bytes",
               "base": 2,
               "exponent": 20,
             },
          ]
        },
    ],
    "vm": [
        {
          "provider": "kvm",
          "stats": [
            { "name": "max_mmu_page_hash_collisions", ... }
            { "name": "max_mmu_rmap_size", ... }
          ]
        },
        {
          "provider": "qemu",
          "stats": [
            { "name": "blah", ... }
          ]
        },
    }
 }

> 
> { "execute": "query-stats-instances" }
> { "return": [
>     { "name": "vcpu_1",
>       "type": "kvm-vcpu" },
>     { "name": "vcpu_0",
>       "type": "kvm-vcpu" },
>     { "name": "vm",
>       "type": "kvm-vm" } ]
> }

I don't see a need for this command at all. It doesn't tell
apps anything they can't already learn from "query-stats-schemas"

New 'type' values will involve QEMU code changes no matter what.
So in the even we need something other than 'vcpu' and 'vm' stats
reported by 'query-stats', apps can just query the QAPI schema
in the normal manner to learn about struct field names that exist
in this QEMU version.

IOW, this really just re-invented QAPI introspection for no
benefit IMHO.

> diff --git a/qapi/misc.json b/qapi/misc.json
> index 358548abe1..a0a07ef0b1 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -527,3 +527,145 @@
>   'data': { '*option': 'str' },
>   'returns': ['CommandLineOptionInfo'],
>   'allow-preconfig': true }
> +
> +##
> +# @StatType:
> +#
> +# Enumeration of stat types
> +# @cumulative: stat is cumulative; value can only increase.
> +# @instant: stat is instantaneous; value can increase or decrease.
> +# @peak: stat is the peak value; value can only increase.
> +#
> +# Since: 7.0
> +##
> +{ 'enum' : 'StatType',
> +  'data' : [ 'cumulative', 'instant', 'peak' ] }
> +
> +##
> +# @StatUnit:
> +#
> +# Enumeration of stat units
> +# @bytes: stat reported in bytes.
> +# @seconds: stat reported in seconds.
> +# @cycles: stat reported in clock cycles.
> +# @none: no unit for this stat.
> +#
> +# Since: 7.0
> +##
> +{ 'enum' : 'StatUnit',
> +  'data' : [ 'bytes', 'seconds', 'cycles', 'none' ] }
> +
> +##
> +# @StatData:
> +#
> +# Individual stat
> +# @name: Stat name
> +# @type: @StatType
> +# @unit: @StatUnit
> +# @base: Exponent base (2 or 10)
> +# @exponent: Used together with @base
> +# @val: List of uint64 values
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'StatData',
> +  'data': { 'name': 'str',
> +            'type': 'StatType',
> +            'unit': 'StatUnit',
> +            'base': 'uint8',
> +            'exponent': 'int16',
> +            'val': [ 'uint64' ] } }
> +
> +##
> +# @Stats:
> +#
> +# Stats per resource (e.g. vm or vcpu)
> +# @name: Resource name
> +# @stats: List of @StatData
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'Stats',
> +  'data': {'name': 'str',
> +           'type': 'StatSchemaType',
> +           'stats': [ 'StatData' ] } }
> +
> +##
> +# @query-stats:
> +#
> +# @name: Stat name (optional)
> +# @type: Type name (optional)
> +# Returns: List of @Stats
> +#
> +# Since: 7.0
> +##
> +{ 'command': 'query-stats',
> +  'data': { '*name': 'str', '*type': 'str' },
> +  'returns': [ 'Stats' ] }

The 'name' and 'type' are used for filtering I presume. Only allowing
a single value for each feels pretty inflexible. I'd say we want to
allow mutliple requests at a time for efficiency.

Bearing in mind my other suggestions above, I'd think we should have
something  more like

 { 'enum': 'StatsProvider',
   'data': ["kvm", "qemu", "tcg", ....],
 }

 { 'struct': 'StatsRequest',
   'data': {
      'provider': 'StatsProvider',
      // If omitted, report everything for this provider
      '*fields': [ 'str' ]
   }
 }

 { 'struct': 'StatsVCPURequest',
   'base': 'StatsRequest',
   'data': {
     // To request subset of vCPUs e.g.
     //  "cpu_set": "0-3"
     // Could use ['int'] instead if desired
     '*cpu_set': str,
   },
 }

 { 'struct': 'StatsFilter',
   'data': {
     // If omitted means don't report that group of data
     '*vcpu': 'StatsVCPURequest',
     '*vm': 'StatsRequest',
   },
 }

 { 'alternate': 'StatsValue',
   'data': { 'scalar': 'int64',
             'list': [ 'int64 ' ] }
 }

 { 'struct': 'StatsResultsEntry',
   'data': {
     'provider': 'StatsProvider',
     'stats': [ 'StatsValue' ]
   }
 }

 { 'struct': 'StatsResults':
   'data': {
     '*vcpu': [ [ 'StatsResultsEntry' ] ],
     '*vm': [ 'StatsResultsEntry' ]
   }
 }

 { 'command': 'query-stats',
   'data': { 'filter': '*StatsFilter' },
   'returns': 'StatsResults' }


> +
> +##
> +# @StatSchemaType:
> +#
> +# Enumeration of stats schema types
> +#
> +# Since: 7.0
> +##
> +{ 'enum' : 'StatSchemaType',
> +  'data' : [ ] }
> +
> +##
> +# @StatSchemaEntry:
> +#
> +# Individual stat in a schema type
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'StatSchemaEntry',
> +  'data': { 'name': 'str' } }
> +
> +##
> +# @StatsSchema:
> +#
> +# Stats per @StatSchemaType
> +# @type: @StatSchemaType
> +# @stats: @StatCchemaName
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'StatsSchema',
> +  'data': { 'type': 'StatSchemaType',
> +            'stats': [ 'StatSchemaEntry' ] } }
> +
> +##
> +# @query-stats-schemas:
> +#
> +# @type: type name (optional)
> +# Returns: List of @StatsSchema
> +#
> +# Since: 7.0
> +##
> +{ 'command': 'query-stats-schemas',
> +  'data': { '*type': 'str' },
> +  'returns': [ 'StatsSchema' ] }

I'd think this is more like

 { 'struct': 'StatsSchemaValue',
   'data': {
     'name': 'str',
     'type': 'StatType',
     'unit': 'StatUnit',
     'base': 'uint8',
     'exponent': 'int16',
   },
 }

 { 'struct': 'StatsSchemaProvider',
   'data': {
     'provider': 'StatsProvider',
     'stats': [ 'StatsSchemaValue'],
   }
 }

 { 'struct': 'StatsSchemaResult',
   'data': {
     'vcpu': ['StatsSchemaProvider'],
     'vm': ['StatsSchemaProvider'],
   }
 }

 { 'command': 'query-stats-schemas',
   'returns': [ 'StatsSchemaResult' ] }


> +
> +##
> +# @StatsInstance:
> +#
> +# @name: resource name
> +# @type: @StatSchemaType
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'StatsInstance',
> +  'data': { 'name': 'str',
> +            'type': 'StatSchemaType' } }
> +
> +##
> +# @query-stats-instances:
> +#
> +# Returns list of @StatsInstance
> +#
> +# Since: 7.0
> +##
> +{ 'command': 'query-stats-instances',
> +  'returns': [ 'StatsInstance' ] }

As mentioned earlier, IMHO this doesn't need to exist.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


