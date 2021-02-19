Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AD231F658
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 10:13:41 +0100 (CET)
Received: from localhost ([::1]:35240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD1r2-0006o4-BE
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 04:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD1p4-0005tz-JZ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:11:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD1p1-0001Bj-1t
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613725892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VK+LN3Yh1CynkDIx+3+8JUG0JqLSPfhd+6+fbbIWlnY=;
 b=eKTTh7ObsDwYeu7PHL/60Of4wa4m6LxAyNlp3agQHl/QUVwO6PU7f9JXR3W7Tu5U1g7Hi+
 PmI6I+rRakPTtTKKtQFmpvAAC4m/gktitg1Us2FTivmhGfDZ9uoJE+4B3bfIEzNcSNj8Uw
 0EhNnp9LbJ848pmNx6BZlilquy9XJBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-qHbD1xi6Nrm0B0Sk8jts7A-1; Fri, 19 Feb 2021 04:11:30 -0500
X-MC-Unique: qHbD1xi6Nrm0B0Sk8jts7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9C65801965
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:11:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 734111002393;
 Fri, 19 Feb 2021 09:11:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C0146113860F; Fri, 19 Feb 2021 10:11:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 4/6] qapi: Apply aliases in qobject-input-visitor
References: <20210211183118.422036-1-kwolf@redhat.com>
 <20210211183118.422036-5-kwolf@redhat.com>
 <871rder9py.fsf@dusky.pond.sub.org>
 <20210217175026.GC5662@merkur.fritz.box>
 <87o8ghebrb.fsf@dusky.pond.sub.org>
 <20210218161007.GA10998@merkur.fritz.box>
Date: Fri, 19 Feb 2021 10:11:27 +0100
In-Reply-To: <20210218161007.GA10998@merkur.fritz.box> (Kevin Wolf's message
 of "Thu, 18 Feb 2021 17:10:07 +0100")
Message-ID: <878s7kpglc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 18.02.2021 um 14:39 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > Am 17.02.2021 um 16:32 hat Markus Armbruster geschrieben:
>> >> Kevin Wolf <kwolf@redhat.com> writes:
>> >> 
>> >> > When looking for an object in a struct in the external representation,
>> >> > check not only the currently visited struct, but also whether an alias
>> >> > in the current StackObject matches and try to fetch the value from the
>> >> > alias then. Providing two values for the same object through different
>> >> > aliases is an error.
>> >> >
>> >> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> >> 
>> >> Looking just at qobject_input_try_get_object() for now.
>> >
>> > :-(
>> >
>> > This patch doesn't even feel that complicated to me.
>> 
>> I suspect it's just me having an unusually obtuse week.
>> 
>> The code is straightforward enough.  What I'm missing is a bit of "how
>> does this accomplish the goal" and "why is this safe" here and there.
>> 
>> > Old: Get the value from the QDict of the current StackObject with the
>> > given name.
>> >
>> > New: First do alias resolution (with find_object_member), which results
>> > in a StackObject and a name, and that's the QDict and key where you get
>> > the value from.
>> 
>> This part I understand.
>> 
>> We simultaneously walk the QAPI type and the input QObject, consuming
>> input as we go.
>> 
>> Whenever the walk leaves a QAPI object type, we check the corresponding
>> QObject has been consumed completely.
>> 
>> With aliases, we additionally look for input in a certain enclosing
>> input object (i.e. up the recursion stack).  If found, consume.
>> 
>> > Minor complication: Aliases can refer to members of nested objects that
>> > may not be provided in the input. But we want these to work.
>> >
>> > For example, my chardev series defines aliases to flatten
>> > SocketAddressLegacy (old syntax, I haven't rebased it yet):
>> >
>> > { 'union': 'SocketAddressLegacy',
>> >   'data': {
>> >     'inet': 'InetSocketAddress',
>> >     'unix': 'UnixSocketAddress',
>> >     'vsock': 'VsockSocketAddress',
>> >     'fd': 'String' },
>> >   'aliases': [
>> >     {'source': ['data']},
>> >     {'alias': 'fd', 'source': ['data', 'str']}
>> >   ]}
>> >
>> > Of course, the idea is that this input should work:
>> >
>> > { 'type': 'inet', 'hostname': 'localhost', 'port': '1234' }
>> >
>> > However, without implicit objects, parsing 'data' fails because it
>> > expects an object, but none is given (we specified all of its members on
>> > the top level through aliases). What we would have to give is:
>> >
>> > { 'type': 'inet', 'hostname': 'localhost', 'port': '1234', 'data': {} }
>> >
>> > And _that_ would work. Visiting 'data' succeeds because we now have the
>> > object that the visitor expects, and when visiting its members, the
>> > aliases fill in all of the mandatory values.
>> >
>> > So what this patch does is to implicitly assume the 'data': {} instead
>> > of erroring out when we know that aliases exist that can still provide
>> > values for the content of 'data'.
>> 
>> Aliases exist than can still provide, but will they?  What if input is
>> 
>>     {"type": "inet"}
>> 
>> ?
>> 
>> Your explanation makes me guess this is equivalent to
>> 
>>     {"type": "inet", "data": {}}
>> 
>> which fails the visit, because mandatory members of "data" are missing.
>> Fine.
>
> Okay, if you want the gory details, then the answer is yes for this
> case, but it depends.

I'm afraid I need the gory details to get over the review hump.

> If we're aliasing a single member, then we can easily check whether the
> alias is actually specified. If it's not in the input, no implicit
> object.

I figure this check is in the code parts I haven't gotten to, yet.  Not
your fault.

> But in our example, it is a wildcard alias and we don't know yet which
> aliases it will use. This depends on what the visitor for the implicit
> object will do (future tense).
>
>> If we make the members optional, it succeeds: qobject_input_optional()
>> checks both the regular and the aliased input, finds neither, and
>> returns false.  Still fine.
>> 
>> What if "data" is optional, too?  Hmmm...
>
> Yes, don't use optional objects in the middle of the path of a wildcard
> alias unless there is no semantic difference between empty object and
> absent object.

Aha!  So my spidey-sense wasn't entirely wrong.

>                This is documented in the code, but it might actually
> still be missing from qapi-code-gen.txt.

I can't find it there.  Needs fixing, obviously.

I guess checking "path of a wildcard alias crosses optional objects" is
hard (impractical?) for the same reasons checking "alias can't resolve"
is.

I'd expect "alias can't resolve" to be caused by typos, incomplete
renames, and such.  Basic testing should catch at least the typos.  Not
ideal, but I guess it'll do, at least for now.

Relying on testing to catch "crosses optional objects" mistakes feels
iffier to me, because it takes more careful tests.

Ham-fisted way to make basic tests catch it: *ignore* optional objects
when resolving aliases.  Is this a bad idea?

>> Example:
>> 
>>     { 'struct': 'Outer',
>>       'data': { '*inner': 'Inner' },
>> 
>>     { 'struct': 'Inner',
>>       'data': { '*true-name': 'str' } }
>> 
>> For input {}, we get an Outer object with
>> 
>>     .has_inner = false,
>>     .inner = NULL
>> 
>> Now add
>> 
>>       'aliases': [ { 'name': 'alias-name',
>>                      'source': [ 'inner', 'true-name' ] } ] }
>> 
>> What do we get now?  Is it
>> 
>>      .has_inner = true,
>>      .inner = { .has_true_name = false,
>>                 .true_name = NULL }
>> 
>> perhaps?
>
> I think this is the result you would get if you had used a wildcard
> alias. But since you used a single-member alias, we would see that
> 'alias-name' is not in the input and actually still return the original
> result:
>
>     .has_inner = false,
>     .inner = NULL

I wasn't aware there's a difference.  Now I am.

Thanks!


