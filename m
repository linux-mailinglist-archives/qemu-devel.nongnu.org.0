Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7908340B0B8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:33:30 +0200 (CEST)
Received: from localhost ([::1]:34542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9V3-000851-Gz
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ9MB-0005aI-Hz
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ9M8-0005G8-FE
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1peG8FlXGAVPxZXXgHgHcqiMb6ER609wDdnL4U1fej4=;
 b=DXnORQk7EfTOi1pB5iZUWTvk+Ldc6HDcAmaa6iX6DyxXxZGDnuucWs6vfhyq9LqRBJJXiW
 PRUGdRoDBxLbvZUpTFoDWPINuYqjIyD58OL9Z96MbG0xOEMpJ+B7qJGRyTltvxC3ew+TVC
 aNu66laHwAFPAio+eDlkDvC6V65qoUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-LQV7d7O0PiafpGiijWMqfA-1; Tue, 14 Sep 2021 10:24:14 -0400
X-MC-Unique: LQV7d7O0PiafpGiijWMqfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A096218414A4
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 14:24:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C2375C1D1;
 Tue, 14 Sep 2021 14:24:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D46FE113865F; Tue, 14 Sep 2021 16:24:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 4/6] qapi: Apply aliases in qobject-input-visitor
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-5-kwolf@redhat.com>
 <87pmtld99s.fsf@dusky.pond.sub.org> <YTi0HPZRC7vaBtVz@redhat.com>
 <87bl4vfxsw.fsf@dusky.pond.sub.org> <YUBs/bfbt18uNPeS@redhat.com>
Date: Tue, 14 Sep 2021 16:24:11 +0200
In-Reply-To: <YUBs/bfbt18uNPeS@redhat.com> (Kevin Wolf's message of "Tue, 14
 Sep 2021 11:35:57 +0200")
Message-ID: <87r1dr6xro.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

> Am 14.09.2021 um 08:58 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > Am 06.09.2021 um 17:16 hat Markus Armbruster geschrieben:
>> >> Kevin Wolf <kwolf@redhat.com> writes:
>> >> 
>> >> > When looking for an object in a struct in the external representation,
>> >> > check not only the currently visited struct, but also whether an alias
>> >> > in the current StackObject matches and try to fetch the value from the
>> >> > alias then. Providing two values for the same object through different
>> >> > aliases is an error.
>> >> >
>> >> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>
>> >> > +/*
>> >> > + * Check whether the member @name in the object visited by @so can be
>> >> > + * specified in the input by using the alias described by @a (which
>> >> > + * must be an alias contained in so->aliases).
>> >> > + *
>> >> > + * If @name is only a prefix of the alias source, but doesn't match
>> >> > + * immediately, false is returned and *is_alias_prefix is set to true
>> >> > + * if it is non-NULL.  In all other cases, *is_alias_prefix is left
>> >> > + * unchanged.
>> >> > + */
>> >> > +static bool alias_source_matches(QObjectInputVisitor *qiv,
>> >> > +                                 StackObject *so, InputVisitorAlias *a,
>> >> > +                                 const char *name, bool *is_alias_prefix)
>> >> > +{
>> >> > +    if (a->src[0] == NULL) {
>> >> > +        assert(a->name == NULL);
>> >> > +        return true;
>> >> > +    }
>> >> > +
>> >> > +    if (!strcmp(a->src[0], name)) {
>> >> > +        if (a->name && a->src[1] == NULL) {
>> >> > +            /*
>> >> > +             * We're matching an exact member, the source for this alias is
>> >> > +             * immediately in @so.
>> >> > +             */
>> >> > +            return true;
>> >> > +        } else if (is_alias_prefix) {
>> >> > +            /*
>> >> > +             * We're only looking at a prefix of the source path for the alias.
>> >> > +             * If the input contains no object of the requested name, we will
>> >> > +             * implicitly create an empty one so that the alias can still be
>> >> > +             * used.
>> >> > +             *
>> >> > +             * We want to create the implicit object only if the alias is
>> >> > +             * actually used, but we can't tell here for wildcard aliases (only
>> >> > +             * a later visitor call will determine this). This means that
>> >> > +             * wildcard aliases must never have optional keys in their source
>> >> > +             * path. The QAPI generator checks this condition.
>> >> > +             */
>> >> 
>> >> Double-checking: this actually ensures that we only ever create the
>> >> implicit object when it will not remain empty.  Correct?
>> >
>> > For wildcard aliases, we still can't know which keys will be visited
>> > later. Checking that we don't have optional keys only avoids the
>> > confusion between absent and present, but empty objects that you would
>> > get from the implicit objects. So it means that creating an implicit
>> > object is never wrong, either the nested object can be visited (which
>> > means we needed the implicit object) or it errors out.
>> 
>> What I'm trying to understand is whether aliases may make up an empty
>> object, and if yes, under what conditions.  Can you help me?
>> 
>> "Make up an empty object" = have an empty QDict in the result where the
>> JSON input doesn't have a {}.
>
> Well, the result is a C type, not a QDict. We never build a single QDict
> for the object including values resolved from aliases, we just fetch the
> values from different QDicts if necessary.

I managed to confuse myself.  Fortunately, it looks like I failed to
confuse you.

> But for what I think you're trying to get at: Yes, it can happen that we
> start visiting a struct which was not present in the JSON, and for which
> no members will match. This is if you have a wildcard alias for the
> members of this object because we must assume that the alias might
> provide the necessary values - but it might as well not have them.
>
> There are two cases here:
>
> 1. The nested object contains non-optional members. This is an error
>    case. The error message will change from missing struct to missing
>    member, but this isn't too bad because the missing member does in
>    fact exist on the outer level, too, as an alias. So I think the error
>    message is still good.
>
> 2. The nested object only contains optional members. Then the alias
>    allows just not specifying the empty nested object, all of the zero
>    required members are taken from the outer object.
>
>    This would be a problem if the nested object were optional itself
>    because it would turn absent into present, but empty. So this is the
>    reason why we check in the generator that you don't have optional
>    members in the path of wildcard aliases.

I'm too tired / stupid to grasp this in the abstract.  I'll try again
tomorrow, with concrete examples.

>> >> > +
>> >> > +        /*
>> >> > +         * For single-member aliases, an alias name is specified in the
>> >> > +         * alias definition. For wildcard aliases, the alias has the same
>> >> > +         * name as the member in the source object, i.e. *name.
>> >> > +         */
>> >> > +        if (!input_present(qiv, a->alias_so, a->name ?: *name)) {
>> >> > +            continue;
>> >> 
>> >> What if alias_source_matches() already set *is_alias_prefix = true?
>> >> 
>> >> I figure this can't happen, because it guards the assignment with the
>> >> exact same call of input_present().  In other words, we can get here
>> >> only for "full match".  Correct?
>> >
>> > Probably, but my reasoning is much simpler: If alias_source_matches()
>> > sets *is_alias_prefix, it also returns false, so we would already have
>> > taken a different path above.
>> 
>> I see.  The contract even says so: "false is returned and
>> *is_alias_prefix is set to true".  It's actually the only way for
>> *is_alias_prefix to become true.
>> 
>> Output parameters that are set only sometimes require the caller to
>> initialize the receiving variable, or use it only under the same
>> condition it is set.  The former is easy to forget, and the latter is
>> easy to get wrong.
>> 
>> "Set sometimes" can be useful, say when you have several calls where the
>> output should "accumulate".  When you don't, I prefer to set always,
>> because it makes the function harder to misuse.  Would you mind?
>
> It does "accumulate" here. We want to return true if any of the aliases
> make it true.

You're right.

It doesn't accumulate with find_object_member() below.  There, the code
always sets, but the contract doesn't actually promise it.

>> >> > @@ -189,10 +372,31 @@ static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
>> >> >      assert(qobj);
>> >> >  
>> >> >      if (qobject_type(qobj) == QTYPE_QDICT) {
>> >> > -        assert(name);
>> >> > -        ret = qdict_get(qobject_to(QDict, qobj), name);
>> >> > -        if (tos->h && consume && ret) {
>> >> > -            bool removed = g_hash_table_remove(tos->h, name);
>> >> > +        StackObject *so = tos;
>> >> > +        const char *key = name;
>> >> > +        bool is_alias_prefix;
>> >> > +
>> >> > +        assert(key);
>> >> > +        if (!find_object_member(qiv, &so, &key, &is_alias_prefix, errp)) {
>> >> 
>> >> * Input absent: zap @so, @key, set @is_alias_prefix.
>> >> 
>> >> * Error: set *errp, leave @is_alias_prefix undefined.
>> >> 
>> >> > +            if (is_alias_prefix) {
>> >> 
>> >> Use of undefined @is_alias_prefix in case "Error".  Bug in code or in
>> >> contract?
>> >
>> > We should probably use ERRP_GUARD() and check for !*errp here.
>> 
>> A need to use ERRP_GUARD() often signals "awkward interface".
>> 
>> What about always setting is_alias_prefix?  Then it's false on error.
>
> Ok, I can define it as false for error cases if you prefer.
>
> I'm not sure if I find it more readable than !*errp && ..., though. It
> makes is_alias_prefix carry more information than its name suggests.
>
> Kevin


