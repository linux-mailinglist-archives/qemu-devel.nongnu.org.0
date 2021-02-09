Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE63314F8F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 13:57:29 +0100 (CET)
Received: from localhost ([::1]:33448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Sa8-0003Hq-7g
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 07:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9SYs-0002bX-2i
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 07:56:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9SYj-0006FN-G5
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 07:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612875360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uJB7TaqpF7GAqXeaYnL11YHtRqAxheNhPH7TCqaXtBc=;
 b=N9guIsfObGJ5LshUn3nIARu4hpIQLV+IIZPTLj0uBSJ/St3CD2oVof642Zlqyr3/Efmfq5
 ZIcrwTi5IDccYq+J7qPR83ca2f8Pj1d7MSY9pW5+UOGkmtBsn3h2spJK2QwOUqEZIUKx/g
 6DeAOSJ2h2gmrdzdBSvwI22i9lKfqSA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-nD7At3iJOw2rz6Xrp1B22w-1; Tue, 09 Feb 2021 07:55:58 -0500
X-MC-Unique: nD7At3iJOw2rz6Xrp1B22w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30384801A86
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 12:55:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D13525D9CD;
 Tue,  9 Feb 2021 12:55:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6770A113865F; Tue,  9 Feb 2021 13:55:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/6] qapi: Remember alias definitions in
 qobject-input-visitor
References: <20201112172850.401925-1-kwolf@redhat.com>
 <20201112172850.401925-3-kwolf@redhat.com>
 <87tur2plzm.fsf@dusky.pond.sub.org>
 <20210127205951.GF6090@merkur.fritz.box>
Date: Tue, 09 Feb 2021 13:55:55 +0100
In-Reply-To: <20210127205951.GF6090@merkur.fritz.box> (Kevin Wolf's message of
 "Wed, 27 Jan 2021 21:59:51 +0100")
Message-ID: <87tuqlpfhg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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

> Am 27.01.2021 um 14:06 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > This makes qobject-input-visitor remember the currently valid aliases in
>> > each StackObject. It doesn't actually allow using the aliases yet.
>> >
>> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> > ---
>> >  qapi/qobject-input-visitor.c | 115 +++++++++++++++++++++++++++++++++++
>> >  1 file changed, 115 insertions(+)
>> >
>> > diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
>> > index 23843b242e..a00ac32682 100644
>> > --- a/qapi/qobject-input-visitor.c
>> > +++ b/qapi/qobject-input-visitor.c
>> > @@ -29,6 +29,29 @@
>> >  #include "qemu/cutils.h"
>> >  #include "qemu/option.h"
>> >  
>> > +typedef struct InputVisitorAlias {
>> > +   /* Alias name. NULL for any (wildcard alias). */
>> > +    const char *alias;
>> > +
>> > +    /*
>> > +     * NULL terminated array representing a path.
>> > +     * Must contain at least one non-NULL element if alias is not NULL.
>> 
>> What does .alias = NULL, .src[] empty mean?
>> 
>> The previous patch's contract for visit_define_alias():
>> 
>>    /*
>>     * Defines a new alias rule.
>>     *
>>     * If @alias is non-NULL, the member named @alias in the external
>>     * representation of the current struct is defined as an alias for the
>>     * member described by @source.
>>     *
>>     * If @alias is NULL, all members of the struct described by @source are
>>     * considered to have alias members with the same key in the current
>>     * struct.
>>     *
>>     * @source is a NULL-terminated array of names that describe the path to
>>     * a member, starting from the currently visited struct.
>>     *
>>     * The alias stays valid until the current alias scope ends.
>>     * visit_start/end_struct() implicitly start/end an alias scope.
>>     * Additionally, visit_start/end_alias_scope() can be used to explicitly
>>     * create a nested alias scope.
>>     */
>> 
>> If I read this correctly, then empty .src[] denotes "the current
>> struct", and therefore .alias = NULL, .src[] empty means "all members of
>> the current struct are considered to have alias members with the same
>> key in the current struct".  Which is be a complicated way to accomplish
>> nothing.
>> 
>> Am I confused?
>
> Indeed, this doesn't make sense when @alias_so is the currently
> processed StackObject. I guess qobject_input_define_alias() should just
> forbid this case.

Yes, please.

> But see below for the relevant case.
>
>> > +     */
>> > +    const char **src;
>> > +
>> > +    /* StackObject in which the alias should be looked for */
>> > +    struct StackObject *alias_so;
>> 
>> Clear as mud.  Is it "the current struct"?  If not, what else?  Perhaps
>> an example would help me understand.
>
> It is the object where the alias was defined.
>
> .alias = NULL, .src[] empty happens after propagating the alias to a
> child object, i.e. alias_so is different from the current StackObject.
>
> Let's take a simple SocketAddressLegacy object as an example. Without
> aliases, it might look like this:
>
> { 'type': 'inet',
>   'data': { 'host': 'localhost', 'port': 1234 } }
>
> We want to eliminate 'data' from the external representation with an
> alias, so we map everything in 'data' to the top level. So the actual
> external representation that we want to parse in the example is this:
>
> { 'type': 'inet', 'host': 'localhost', 'port': 1234 }
>
> For the implementation this alias means that while visiting the top
> level SocketAddressLegacy object (with StackObject A) we define an
> InputVisitorAlias like this:
>
>     {
>         .alias = NULL,

Make all members of ...

>         .src = ['data', NULL],

...  the object .data also available in ...

>         .alias_so = A,

the object corresponding to A, which is the object we're visiting right
now (A is on top of the stack).

Correct?

>     }
>
> When we proceed to visit the 'data' member, we call start_struct, which
> creates a new StackObject B. The alias is propagated, stripping 'data'
> from the start of .src:
>
>     {
>         .alias = NULL,

Make all members of ...

>         .src = [NULL],

... the current object also available in ...

>         .alias_so = A, /* This still refers to A, not B! */

the object corresponding to A, which is the object containing the one
we're visiting right now (A right below the top of the stack).

Correct?

>     }
>
> Next we're parsing the members of InetSocketAddress (the type of
> 'data'). The visitor wants to visit 'host' now, but it's not present in
> the QDict to parse (StackObject.obj, which is actually an empty QDict in
> this case because 'data' wasn't given at all).

Wait a sec!  Doesn't qobject_input_start_struct(v, "data", ...) *fail*
when "data" is absent?  Oh, looks like you're messing with that in PATCH
4.  Forward reference only in your explanation, not in this patch, which
"doesn't actually allow using the aliases yet".

> So what happens is that it looks at aliases that could provide a value
> for this key. Its alias list contains the alias=NULL,src=[NULL] item,
> which makes it check if 'host' exists in .alias_so (which is the
> StackObject that belongs to the top level SocketAddressLegacy) instead,
> and indeed we have a 'host' key there, so we can take the value from
> there.

When src[0] isn't null, this InputVisitorAlias is to be applied deeper
in the visit, and we ignore it here.

Correct?

> Does this make the mechanism a bit clearer?

Feels like it :)

>> > +
>> > +    /*
>> > +     * The alias remains valid as long as the containing StackObject has
>> 
>> What's "the containing StackObject"?  I guess it's the one that has this
>> InputVisitorAlias in .aliases.
>
> Yes.
>
>> > +     * StackObject.alias_scope_nesting >= InputVisitorAlias.scope_nesting
>> > +     * or until the whole StackObject is removed.
>> > +     */
>> > +    int scope_nesting;
>> > +
>> > +    QSLIST_ENTRY(InputVisitorAlias) next;
>> > +} InputVisitorAlias;
>> > +
>> >  typedef struct StackObject {
>> >      const char *name;            /* Name of @obj in its parent, if any */
>> >      QObject *obj;                /* QDict or QList being visited */
>> > @@ -38,6 +61,9 @@ typedef struct StackObject {
>> >      const QListEntry *entry;    /* If @obj is QList: unvisited tail */
>> >      unsigned index;             /* If @obj is QList: list index of @entry */
>> >  
>> > +    QSLIST_HEAD(, InputVisitorAlias) aliases;

We need a list because any number of aliases may apply here (src[0]
null) or deeper in the stack (not null).

Correct?

>> > +    int alias_scope_nesting;    /* Increase on scope start, decrease on end */
>> 
>> I get what the comment means, but imperative mood is odd for a variable.
>> "Number of open scopes", perhaps?
>
> Works for me.
>
>> > +
>> >      QSLIST_ENTRY(StackObject) node; /* parent */
>> >  } StackObject;
>> >  
>> 
>> I'm afraid I'm too confused about the interface (previous patch) and the
>> data structures to continue review with reasonable efficiency.  I don't
>> mean to imply either is bad!  I'm just confused, that's all.
>
> I hope the above helps to resolve the confusion. Feel free to come back
> with more questions or ping me on IRC if necessary.

Thanks!


