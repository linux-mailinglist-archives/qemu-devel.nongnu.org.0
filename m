Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2615B2B7904
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:46:01 +0100 (CET)
Received: from localhost ([::1]:50418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJ6G-0002tW-4E
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfIxH-0008DT-I1
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:36:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfIxD-0005NR-S3
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vy7hsFjfEUoxkds7D5dPoa8W6H60HYUaoNFwGWZIr20=;
 b=YPhInOUGW8ma7Zm2PuSlxybPYAzrm16Ry6NU5DznXyRUm0E8SR/HdxJHGqHuQmx8nXqze3
 sLrj96p6OICCREMKfGFLCYaCgL1mlKTQT0E0Szsp0tVtv89O0b4NDjChd1Ii7fkKUkuryP
 ZwPfRkEh82y0/9uaIBCJz+3k0Os/0dA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-zhn1rzo3PY6AUGwLEf_TyA-1; Wed, 18 Nov 2020 03:36:36 -0500
X-MC-Unique: zhn1rzo3PY6AUGwLEf_TyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 512A96414C;
 Wed, 18 Nov 2020 08:36:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0F535B4BE;
 Wed, 18 Nov 2020 08:36:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 61A6211358BA; Wed, 18 Nov 2020 09:36:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
 <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
 <20201116211352.GC1235237@habkost.net>
 <87mtzgbc29.fsf@dusky.pond.sub.org>
 <20201118011917.GB10041@SPB-NB-133.local>
Date: Wed, 18 Nov 2020 09:36:33 +0100
In-Reply-To: <20201118011917.GB10041@SPB-NB-133.local> (Roman Bolshakov's
 message of "Wed, 18 Nov 2020 04:19:17 +0300")
Message-ID: <87ft57oycu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo, there's a question for you further down, marked with your name.

Roman Bolshakov <r.bolshakov@yadro.com> writes:

> On Tue, Nov 17, 2020 at 09:51:58AM +0100, Markus Armbruster wrote:
>> Eduardo Habkost <ehabkost@redhat.com> writes:
>> 
>> > On Mon, Nov 16, 2020 at 10:20:04AM -0600, Eric Blake wrote:
>> >> On 11/16/20 7:10 AM, Roman Bolshakov wrote:
>> >> > There's a problem for management applications to determine if certain
>> >> > accelerators available. Generic QMP command should help with that.
>> >> > 
>> >> > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> >> > ---
>> >> >  monitor/qmp-cmds.c | 15 +++++++++++++++
>> >> >  qapi/machine.json  | 19 +++++++++++++++++++
>> >> >  2 files changed, 34 insertions(+)
>> >> > 
>> >> 
>> >> > +++ b/qapi/machine.json
>> >> > @@ -591,6 +591,25 @@
>> >> >  ##
>> >> >  { 'command': 'query-kvm', 'returns': 'KvmInfo' }
>> >> >  
>> >> > +##
>> >> > +# @query-accel:
>> >> > +#
>> >> > +# Returns information about an accelerator
>> >> > +#
>> >> > +# Returns: @KvmInfo
>> 
>> Is reusing KvmInfo here is good idea?  Recall:
>> 
>>     ##
>>     # @KvmInfo:
>>     #
>>     # Information about support for KVM acceleration
>>     #
>>     # @enabled: true if KVM acceleration is active
>>     #
>>     # @present: true if KVM acceleration is built into this executable
>>     #
>>     # Since: 0.14.0
>>     ##
>>     { 'struct': 'KvmInfo', 'data': {'enabled': 'bool', 'present': 'bool'} }
>> 
>> I figure @present will always be true with query-accel.  In other words,
>> it's useless noise.
>> 
>
> Hi Markus,
>
> Actually, no. Provided implementation returns present = true only if we
> can find the accel in QOM, i.e. on macOS we get present = false for kvm.
> And on Linux we get present = false for hvf, e.g.:
>
> C: {"execute": "query-accel", "arguments": {"name": "hvf"}}
> S: {"return": {"enabled": true, "present": true}}
> C: {"execute": "query-accel", "arguments": {"name": "kvm"}}
> S: {"return": {"enabled": false, "present": false}}
> C: {"execute": "query-accel", "arguments": {"name": "tcg"}}
> S: {"return": {"enabled": false, "present": true}}

Aha.  I expected query-accel to fail when the named accelerator does not
exist.  Has two advantages:

* Same behavior for "does not exist because it's not compiled in" and
  for "does not exist because it was added only to a future version of
  QEMU'".  Easier for QMP clients: they get to handle one kind of
  failure rather than two.

* If we later change 'name' from 'str' to an enum, behavior stays the
  same.

Compelling enough, don't you think?

>> If we return information on all accelerators, KvmInfo won't do, because
>> it lacks the accelerator name.
>> 
>> If we choose to reuse KvmInfo regardless, it needs to be renamed to
>> something like AccelInfo, and the doc comment generalized beyond KVM.
>> 
>
> I have renamed it to AccelInfo in another patch in the series :)

I noticed only after I sent my reply :)

>> >> > +#
>> >> > +# Since: 6.0.0
>> >> 
>> >> We're inconsistent on whether we have 'Since: x.y' or 'Since: x.y.z',
>> >> although I prefer the shorter form.  Maybe Markus has an opnion on that.
>> 
>> Yes: use the shorter form, unless .z != .0.
>> 
>> The shorter form is much more common:
>> 
>>     $ sed -En 's/.*since:? *([0-9][0-9.]*).*/\1/pi' qapi/*json | sed 's/[^.]//g' | sort | uniq -c
>>        1065 .
>>         129 ..
>> 
>> .z != 0 should be rare: the stable branch is for bug fixes, and bug
>> fixes rarely require schema changes.  It is: there is just one instance,
>> from commit ab9ba614556 (v3.0.0) and 0779afdc897 (v2.12.1).
>> 
>
> Thanks, I'll use 6.0 then.
>
>> >> > +#
>> >> > +# Example:
>> >> > +#
>> >> > +# -> { "execute": "query-accel", "arguments": { "name": "kvm" } }
>> >> > +# <- { "return": { "enabled": true, "present": true } }
>> >> > +#
>> >> > +##
>> >> > +{ 'command': 'query-accel',
>> >> > +  'data': { 'name': 'str' },
>> >> > +  'returns': 'KvmInfo' }
>> >> 
>> >> '@name' is undocumented and an open-coded string.  Better would be
>> >> requiring 'name' to be one of an enum type.  [...]
>> >
>> > This seem similar to CPU models, machine types, device types, and
>> > backend object types: the set of valid values is derived from the
>> > list of subtypes of a QOM type.  We don't duplicate lists of QOM
>> > types in the QAPI schema, today.
>> 
>> Yes.
>> 
>> > Do we want to duplicate the list of accelerators in the QAPI
>> > schema, or should we wait for a generic solution that works for
>> > any QOM type?
>> 
>> There are only a few accelerators, so duplicating them wouldn't be too
>> bad.  Still, we need a better reason than "because we can".
>> 
>> QAPI enum vs. 'str' doesn't affect the wire format: both use JSON
>> string.
>> 
>
> 'str' is quite flexible. If we remove an accel, provided QOM command
> won't complain. It'll just reply that the accel is not present :)
>
>> With a QAPI enum, the values available in this QEMU build are visible in
>> query-qmp-schema.
>> 
>> Without a QAPI enum, we need a separate, ad hoc query.  For QOM types,
>> we have qom-list-types.
>> 
>> If you're familiar with qom-list-types, you may want to skip to
>> "Conclusion:" now.
>> 
>> Ad hoc queries can take additional arguments.  qom-list-types does:
>> "implements" and "abstract" limit output.  Default is "all
>> non-abstract".
>> 
>> This provides a way to find accelerators: use "implements": "accel" to
>> return only concrete subtypes of "accel":
>> 
>>    ---> {"execute": "qom-list-types", "arguments": {"implements": "accel"}}
>>    <--- {"return": [{"name": "qtest-accel", "parent": "accel"}, {"name": "tcg-accel", "parent": "accel"}, {"name": "xen-accel", "parent": "accel"}, {"name": "kvm-accel", "parent": "accel"}, {"name": "accel", "parent": "object"}]}
>> 
>> Aside: the reply includes "accel", because it's not abstract.  Bug?
>> 
>> Same for CPU models ("implements": "cpu"), machine types ("implements":
>> "machine"), device types ("implements": "device").  Not for backend
>> object types, because they don't have a common base type.  Certain kinds
>> of backend object types do, e.g. character device backends are subtypes
>> of "chardev".
>> 
>> Ad hoc queries can provide additional information.  qom-list-types does:
>> the parent type.
>> 
>> This provides a second way to find subtypes, which might be more
>> efficient when you need to know the subtypes of T for many T:
>> 
>>    Get *all* QOM types in one go:
>> 
>>    ---> {"execute": "qom-list-types", "arguments": {"abstract": false}}
>>    <--- lots of output
>> 
>>    Use output member "parent" to construct the parent tree.  The
>>    sub-tree rooted at QOM type "accel" has the subtypes of "accel".
>> 
>>    Awkward: since output lacks an "abstract" member, we have to
>>    determine it indirectly, by getting just the concrete types:
>> 
>>    ---> {"execute": "qom-list-types", "arguments": {"abstract": true}}
>>    <--- slightly less output
>> 
>>    We can add "abstract" to the output if we care.
>> 
>>    Unlike the first way, this one works *only* for "is subtype of",
>>    *not* for "implements interface".
>> 
>>    We can add interface information to the output if we care.
>> 
>> Likewise, QOM properties are not in the QAPI schema, and we need ad hoc
>> queries instead of query-qmp-schema: qom-list-properties, qom-list,
>> device-list-properties.  Flaws include inadequate type information and
>> difficulties around dynamic properties.
>> 
>> Conclusion: as is, QOM is designed to defeat our general QAPI/QMP
>> introspection mechanism.  It provides its own instead.  Proper
>> integration of QOM and QAPI/QMP would be great.  Integrating small parts
>> in ways that do not get us closer to complete integration does not seem
>> worthwhile.
>> 
>> For some QOM types, we have additional ad hoc queries that provide more
>> information, e.g. query-machines, query-cpu-definitions, and now the
>> proposed query-accel.
>> 
>> query-accel is *only* necessary if its additional information is.
>> 
>
> Thanks for the profound answer!

You're welcome!

> I'm not an expert of QOM/QAPI. Please correct me if my understanding is
> wrong.
>
> 1. We can use QOM capabilities in QMP to get all accelerators:
>
> C: {"execute": "qom-list-types", "arguments": {"implements": "accel"}}
> S: {"return": [{"name": "qtest-accel", "parent": "accel"}, {"name": "tcg-accel", "parent": "accel"}, {"name": "hax-accel", "parent": "accel"}, {"name": "hvf-accel", "parent": "accel"}, {"name": "accel", "parent": "object"}]}
>
> The response answers if an accelerator was compiled with current QEMU
> binary. All accelerators outside of the list aren't present.

Correct.

> 2. We can't figure out if an accel is actually enabled without relying
> on ad-hoc query-accel because there are no means for that in QOM.
> I might be wrong here but I couldn't find a way to list fields of an
> accel class using qom-list and qom-get.

I have to confess I find the code confusing.

The part that counts is do_configure_accelerator().  I works as follows:

1. Look up the chosen accelerator's QOM type (can fail)
2. Instantiate it (can't fail)
3. Set properties (can fail)
4. Connect the accelerator to the current machine (can fail)

Aside: step 3 uses &error_fatal, unlike the other failures.  Fishy.

Failure in step 1 is "accelerator not compiled in".  Predictable with
qom-list-types.

Failure in step 3 doesn't look predictable.

Failure in step 4 can be due to kernel lacking (a workable version of)
KVM, but the current machine gets a say, too.  Also doesn't look
predictable.

Aside: kvm_init() reports errors with fprintf(), tsk, tsk, tsk.

Existing query-kvm doesn't really predict failure, either.  'present' is
true if CONFIG_KVM.  Should be equivalent to "QOM type exists",
i.e. step 1.  I guess 'enabled' is true when the KVM accelerator is in
use.

While figuring this out, I noticed that the TYPE_ACCEL instance we
create doesn't get its parent set.  It's therefore not in the QOM
composition tree, and inaccessible with qom-get.  Paolo, is this as it
should be?

> I have no particular preference of query-accel vs wiring current accel
> to QOM to be able to find it unless the latter one takes x10 time to
> implement and rework everything. But I need some understanding of what
> would be preferred way for everyone :)

If all you want is figuring out which accelerators this particular QEMU
build has, use qom-list-types.

If you have a compelling use case for predicting which accelerators can
actually work, and nobody has clever ideas on how to do that with
existing commands, then an ad hoc query-accel seems the way to go.

[...]
>> >>                                       [...]  Even better would be
>> >> returning an array of KvmInfo with information on all supported
>> >> accelerators at once, rather than making the user call this command once
>> >> per name.
>> >
>> > Maybe.  It would save us the work of answering the question
>> > above, but is this (querying information for all accelerators at
>> > once) going to be a common use case?
>> 
>> I recommend to scratch the query-accel parameter, and return information
>> on all accelerators in this build of QEMU.  Simple, and consistent with
>> similar ad hoc queries.  If a client is interested in just one, fishing
>> it out of the list is easy enough.
>> 
>
> Works for me. I'll then leave KvmInfo as is and will introduce AccelInfo
> with two fields: name and enabled. enabled will be true only for
> currently active accelerator.

Please document that at most on result can have 'enabled': true.


