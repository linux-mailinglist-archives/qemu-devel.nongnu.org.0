Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2478B2B5B5B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 09:54:39 +0100 (CET)
Received: from localhost ([::1]:40316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kewl4-0007DC-6m
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 03:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kewif-0005kO-JU
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:52:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kewic-0005GJ-3U
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605603124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SH+agb4pgGPVQAIl7acsVaNf47tO5XoTFK5gTEUQa3Y=;
 b=YUTG4eLSSB3V7F0ppHCSlGeQEPOTQFq197BWFRxN7dCd2VxzXtox8wnQlSft0DkdfMmR4z
 33Evtd/BjCZmq0YfuSm6en1XjVUcPccYmFfXtE28Kd0tSuAy7u8BtGQHaGwWdKSG5Ht+a6
 HxU/xyaUzHKAtSi91VGdObsoJA+NUj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-WaUen37KP5ShU_7utdI6zQ-1; Tue, 17 Nov 2020 03:52:01 -0500
X-MC-Unique: WaUen37KP5ShU_7utdI6zQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86179879516;
 Tue, 17 Nov 2020 08:52:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2195C19C78;
 Tue, 17 Nov 2020 08:52:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 906AD11358BA; Tue, 17 Nov 2020 09:51:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
 <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
 <20201116211352.GC1235237@habkost.net>
Date: Tue, 17 Nov 2020 09:51:58 +0100
In-Reply-To: <20201116211352.GC1235237@habkost.net> (Eduardo Habkost's message
 of "Mon, 16 Nov 2020 16:13:52 -0500")
Message-ID: <87mtzgbc29.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel
 P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Mon, Nov 16, 2020 at 10:20:04AM -0600, Eric Blake wrote:
>> On 11/16/20 7:10 AM, Roman Bolshakov wrote:
>> > There's a problem for management applications to determine if certain
>> > accelerators available. Generic QMP command should help with that.
>> > 
>> > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> > ---
>> >  monitor/qmp-cmds.c | 15 +++++++++++++++
>> >  qapi/machine.json  | 19 +++++++++++++++++++
>> >  2 files changed, 34 insertions(+)
>> > 
>> 
>> > +++ b/qapi/machine.json
>> > @@ -591,6 +591,25 @@
>> >  ##
>> >  { 'command': 'query-kvm', 'returns': 'KvmInfo' }
>> >  
>> > +##
>> > +# @query-accel:
>> > +#
>> > +# Returns information about an accelerator
>> > +#
>> > +# Returns: @KvmInfo

Is reusing KvmInfo here is good idea?  Recall:

    ##
    # @KvmInfo:
    #
    # Information about support for KVM acceleration
    #
    # @enabled: true if KVM acceleration is active
    #
    # @present: true if KVM acceleration is built into this executable
    #
    # Since: 0.14.0
    ##
    { 'struct': 'KvmInfo', 'data': {'enabled': 'bool', 'present': 'bool'} }

I figure @present will always be true with query-accel.  In other words,
it's useless noise.

If we return information on all accelerators, KvmInfo won't do, because
it lacks the accelerator name.

If we choose to reuse KvmInfo regardless, it needs to be renamed to
something like AccelInfo, and the doc comment generalized beyond KVM.

>> > +#
>> > +# Since: 6.0.0
>> 
>> We're inconsistent on whether we have 'Since: x.y' or 'Since: x.y.z',
>> although I prefer the shorter form.  Maybe Markus has an opnion on that.

Yes: use the shorter form, unless .z != .0.

The shorter form is much more common:

    $ sed -En 's/.*since:? *([0-9][0-9.]*).*/\1/pi' qapi/*json | sed 's/[^.]//g' | sort | uniq -c
       1065 .
        129 ..

.z != 0 should be rare: the stable branch is for bug fixes, and bug
fixes rarely require schema changes.  It is: there is just one instance,
from commit ab9ba614556 (v3.0.0) and 0779afdc897 (v2.12.1).

>> > +#
>> > +# Example:
>> > +#
>> > +# -> { "execute": "query-accel", "arguments": { "name": "kvm" } }
>> > +# <- { "return": { "enabled": true, "present": true } }
>> > +#
>> > +##
>> > +{ 'command': 'query-accel',
>> > +  'data': { 'name': 'str' },
>> > +  'returns': 'KvmInfo' }
>> 
>> '@name' is undocumented and an open-coded string.  Better would be
>> requiring 'name' to be one of an enum type.  [...]
>
> This seem similar to CPU models, machine types, device types, and
> backend object types: the set of valid values is derived from the
> list of subtypes of a QOM type.  We don't duplicate lists of QOM
> types in the QAPI schema, today.

Yes.

> Do we want to duplicate the list of accelerators in the QAPI
> schema, or should we wait for a generic solution that works for
> any QOM type?

There are only a few accelerators, so duplicating them wouldn't be too
bad.  Still, we need a better reason than "because we can".

QAPI enum vs. 'str' doesn't affect the wire format: both use JSON
string.

With a QAPI enum, the values available in this QEMU build are visible in
query-qmp-schema.

Without a QAPI enum, we need a separate, ad hoc query.  For QOM types,
we have qom-list-types.

If you're familiar with qom-list-types, you may want to skip to
"Conclusion:" now.

Ad hoc queries can take additional arguments.  qom-list-types does:
"implements" and "abstract" limit output.  Default is "all
non-abstract".

This provides a way to find accelerators: use "implements": "accel" to
return only concrete subtypes of "accel":

   ---> {"execute": "qom-list-types", "arguments": {"implements": "accel"}}
   <--- {"return": [{"name": "qtest-accel", "parent": "accel"}, {"name": "tcg-accel", "parent": "accel"}, {"name": "xen-accel", "parent": "accel"}, {"name": "kvm-accel", "parent": "accel"}, {"name": "accel", "parent": "object"}]}

Aside: the reply includes "accel", because it's not abstract.  Bug?

Same for CPU models ("implements": "cpu"), machine types ("implements":
"machine"), device types ("implements": "device").  Not for backend
object types, because they don't have a common base type.  Certain kinds
of backend object types do, e.g. character device backends are subtypes
of "chardev".

Ad hoc queries can provide additional information.  qom-list-types does:
the parent type.

This provides a second way to find subtypes, which might be more
efficient when you need to know the subtypes of T for many T:

   Get *all* QOM types in one go:

   ---> {"execute": "qom-list-types", "arguments": {"abstract": false}}
   <--- lots of output

   Use output member "parent" to construct the parent tree.  The
   sub-tree rooted at QOM type "accel" has the subtypes of "accel".

   Awkward: since output lacks an "abstract" member, we have to
   determine it indirectly, by getting just the concrete types:

   ---> {"execute": "qom-list-types", "arguments": {"abstract": true}}
   <--- slightly less output

   We can add "abstract" to the output if we care.

   Unlike the first way, this one works *only* for "is subtype of",
   *not* for "implements interface".

   We can add interface information to the output if we care.

Likewise, QOM properties are not in the QAPI schema, and we need ad hoc
queries instead of query-qmp-schema: qom-list-properties, qom-list,
device-list-properties.  Flaws include inadequate type information and
difficulties around dynamic properties.

Conclusion: as is, QOM is designed to defeat our general QAPI/QMP
introspection mechanism.  It provides its own instead.  Proper
integration of QOM and QAPI/QMP would be great.  Integrating small parts
in ways that do not get us closer to complete integration does not seem
worthwhile.

For some QOM types, we have additional ad hoc queries that provide more
information, e.g. query-machines, query-cpu-definitions, and now the
proposed query-accel.

query-accel is *only* necessary if its additional information is.

I unde

>>                                       [...]  Even better would be
>> returning an array of KvmInfo with information on all supported
>> accelerators at once, rather than making the user call this command once
>> per name.
>
> Maybe.  It would save us the work of answering the question
> above, but is this (querying information for all accelerators at
> once) going to be a common use case?

I recommend to scratch the query-accel parameter, and return information
on all accelerators in this build of QEMU.  Simple, and consistent with
similar ad hoc queries.  If a client is interested in just one, fishing
it out of the list is easy enough.


