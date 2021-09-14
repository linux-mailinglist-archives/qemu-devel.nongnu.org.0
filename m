Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EC240A6FF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 09:00:55 +0200 (CEST)
Received: from localhost ([::1]:58348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ2R4-0000qj-Ha
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 03:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ2P1-0007tM-7W
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:58:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ2Oy-0003aX-Rx
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631602724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nxIrOgY2N9mh2T/lLAWHFPsHTtkV0uIdKkwDWcRifOA=;
 b=Mwzx9lwci2fEBX3mOEgXSiPHmIqfiGTgvcMBtVOK7bds4uBFjGRR7rSdxCAH9DGVm6zS6D
 0fEsao0ea2kk4c+iIK1IexHIo7woCu04bt/JlS0Q3kuvOgxda35gbHve9O6uXawctA+57G
 4iZV21O/kn8ev3nuRsVu43jTONL8mxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-9mF64MiZPo6c6WK8UfgNgw-1; Tue, 14 Sep 2021 02:58:42 -0400
X-MC-Unique: 9mF64MiZPo6c6WK8UfgNgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED9A6835DE5
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 06:58:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7385D838BC;
 Tue, 14 Sep 2021 06:58:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E420B113865F; Tue, 14 Sep 2021 08:58:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 4/6] qapi: Apply aliases in qobject-input-visitor
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-5-kwolf@redhat.com>
 <87pmtld99s.fsf@dusky.pond.sub.org> <YTi0HPZRC7vaBtVz@redhat.com>
Date: Tue, 14 Sep 2021 08:58:39 +0200
In-Reply-To: <YTi0HPZRC7vaBtVz@redhat.com> (Kevin Wolf's message of "Wed, 8
 Sep 2021 15:01:16 +0200")
Message-ID: <87bl4vfxsw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

> Am 06.09.2021 um 17:16 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > When looking for an object in a struct in the external representation,
>> > check not only the currently visited struct, but also whether an alias
>> > in the current StackObject matches and try to fetch the value from the
>> > alias then. Providing two values for the same object through different
>> > aliases is an error.
>> >
>> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> > ---
>> >  qapi/qobject-input-visitor.c | 227 +++++++++++++++++++++++++++++++++--
>> >  1 file changed, 218 insertions(+), 9 deletions(-)
>> >
>> > diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
>> > index 16a75442ff..6193df28a5 100644
>> > --- a/qapi/qobject-input-visitor.c
>> > +++ b/qapi/qobject-input-visitor.c
>> > @@ -97,6 +97,8 @@ struct QObjectInputVisitor {
>> >      QObject *root;
>> >      bool keyval;                /* Assume @root made with keyval_parse() */
>> >  
>> > +    QDict *empty_qdict;         /* Used for implicit objects */
>> 
>> Would
>> 
>>        /* For visiting objects where all members are from aliases */
>> 
>> be clearer?
>
> I know what I meant with "implicit objects", so not to me, but if you
> think it's clearer this way, then it probably is.

We're writing comments not so much for you and me now, but for someone
else trying to understand the code.  That someone else may well be
forgetful me six months from now :)

>> > +
>> >      /* Stack of objects being visited (all entries will be either
>> >       * QDict or QList). */
>> >      QSLIST_HEAD(, StackObject) stack;
>> > @@ -169,9 +171,190 @@ static const char *full_name(QObjectInputVisitor *qiv, const char *name)
>> >      return full_name_so(qiv, name, false, tos);
>> >  }
>> >  
>> > +static bool find_object_member(QObjectInputVisitor *qiv,
>> > +                               StackObject **so, const char **name,
>> > +                               bool *is_alias_prefix, Error **errp);
>> 
>> According to the function's contract below, three cases:
>> 
>> * Input present: update *so, *name, return true.
>> 
>> * Input absent: zap *so, *name, set *is_alias_prefix, return false.
>> 
>> * Error: set *errp, leave *is_alias_prefix undefined, return false.
>> 
>> > +
>> > +/*
>> > + * Check whether the member @name in @so, or an alias for it, is
>> > + * present in the input and can be used to obtain the value.
>> > + */
>> > +static bool input_present(QObjectInputVisitor *qiv, StackObject *so,
>> > +                          const char *name)
>> > +{
>> > +    /*
>> > +     * Check whether the alias member is present in the input
>> > +     * (possibly recursively because aliases are transitive).
>> > +     * The QAPI generator makes sure that alises cannot form loops, so
>> > +     * the recursion guaranteed to terminate.
>> > +     */
>> > +    if (!find_object_member(qiv, &so, &name, NULL, NULL)) {
>> 
>> * Input absent: zap @so and @name.
>> 
>> * Error: don't zap.
>> 
>> Since @so and @name aren't used anymore, the difference doesn't matter.
>> Okay.
>> 
>> > +        return false;
>> > +    }
>> > +
>> > +    /*
>> > +     * Every source can be used only once. If a value in the input
>> > +     * would end up being used twice through aliases, we'll fail the
>> > +     * second access.
>> > +     */
>> > +    if (!g_hash_table_contains(so->h, name)) {
>> > +        return false;
>> > +    }
>> > +
>> > +    return true;
>> > +}
>> > +
>> > +/*
>> > + * Check whether the member @name in the object visited by @so can be
>> > + * specified in the input by using the alias described by @a (which
>> > + * must be an alias contained in so->aliases).
>> > + *
>> > + * If @name is only a prefix of the alias source, but doesn't match
>> > + * immediately, false is returned and *is_alias_prefix is set to true
>> > + * if it is non-NULL.  In all other cases, *is_alias_prefix is left
>> > + * unchanged.
>> > + */
>> > +static bool alias_source_matches(QObjectInputVisitor *qiv,
>> > +                                 StackObject *so, InputVisitorAlias *a,
>> > +                                 const char *name, bool *is_alias_prefix)
>> > +{
>> > +    if (a->src[0] == NULL) {
>> > +        assert(a->name == NULL);
>> > +        return true;
>> > +    }
>> > +
>> > +    if (!strcmp(a->src[0], name)) {
>> > +        if (a->name && a->src[1] == NULL) {
>> > +            /*
>> > +             * We're matching an exact member, the source for this alias is
>> > +             * immediately in @so.
>> > +             */
>> > +            return true;
>> > +        } else if (is_alias_prefix) {
>> > +            /*
>> > +             * We're only looking at a prefix of the source path for the alias.
>> > +             * If the input contains no object of the requested name, we will
>> > +             * implicitly create an empty one so that the alias can still be
>> > +             * used.
>> > +             *
>> > +             * We want to create the implicit object only if the alias is
>> > +             * actually used, but we can't tell here for wildcard aliases (only
>> > +             * a later visitor call will determine this). This means that
>> > +             * wildcard aliases must never have optional keys in their source
>> > +             * path. The QAPI generator checks this condition.
>> > +             */
>> 
>> Double-checking: this actually ensures that we only ever create the
>> implicit object when it will not remain empty.  Correct?
>
> For wildcard aliases, we still can't know which keys will be visited
> later. Checking that we don't have optional keys only avoids the
> confusion between absent and present, but empty objects that you would
> get from the implicit objects. So it means that creating an implicit
> object is never wrong, either the nested object can be visited (which
> means we needed the implicit object) or it errors out.

What I'm trying to understand is whether aliases may make up an empty
object, and if yes, under what conditions.  Can you help me?

"Make up an empty object" = have an empty QDict in the result where the
JSON input doesn't have a {}.

>> > +            if (!a->name || input_present(qiv, a->alias_so, a->name)) {
>> > +                *is_alias_prefix = true;
>> > +            }
>> > +        }
>> > +    }
>> > +
>> > +    return false;
>> > +}
>> > +
>> > +/*
>> > + * Find the place in the input where the value for the object member
>> > + * @name in @so is specified, considering applicable aliases.
>> > + *
>> > + * If a value could be found, true is returned and @so and @name are
>> > + * updated to identify the key name and StackObject where the value
>> > + * can be found in the input.  (This is either unchanged or the
>> > + * alias_so/name of an alias.)  The value of @is_alias_prefix on
>> > + * return is undefined in this case.
>> > + *
>> > + * If no value could be found in the input, false is returned and @so
>> > + * and @name are set to NULL.  This is not an error and @errp remains
>> > + * unchanged.  If @is_alias_prefix is non-NULL, it is set to true if
>> > + * the given name is a prefix of the source path of an alias for which
>> > + * a value may be present in the input.  It is set to false otherwise.
>> > + *
>> > + * If an error occurs (e.g. two values are specified for the member
>> > + * through different names), false is returned and @errp is set.  The
>> > + * value of @is_alias_prefix on return is undefined in this case.
>> > + */
>> > +static bool find_object_member(QObjectInputVisitor *qiv,
>> > +                               StackObject **so, const char **name,
>> > +                               bool *is_alias_prefix, Error **errp)
>> > +{
>> > +    QDict *qdict = qobject_to(QDict, (*so)->obj);
>> > +    const char *found_name = NULL;
>> > +    StackObject *found_so = NULL;
>> > +    bool found_is_wildcard = false;
>> > +    InputVisitorAlias *a;
>> > +
>> > +    if (is_alias_prefix) {
>> > +        *is_alias_prefix = false;
>> > +    }
>> > +
>> > +    /* Directly present in the container */
>> > +    if (qdict_haskey(qdict, *name)) {
>> > +        found_name = *name;
>> > +        found_so = *so;
>> > +    }
>> > +
>> > +    /*
>> > +     * Find aliases whose source path matches @name in this StackObject. We can
>> > +     * then get the value with the key a->name from a->alias_so.
>> > +     */
>> > +    QSLIST_FOREACH(a, &(*so)->aliases, next) {
>> > +        if (a->name == NULL && found_name && !found_is_wildcard) {
>> > +            /*
>> > +             * Skip wildcard aliases if we already have a match. This is
>> > +             * not a conflict that should result in an error.
>> > +             *
>> > +             * However, multiple wildcard aliases matching is an error
>> > +             * and will be caught below.
>> > +             */
>> > +            continue;
>> > +        }
>> > +
>> > +        if (!alias_source_matches(qiv, *so, a, *name, is_alias_prefix)) {
>> > +            continue;
>> > +        }
>> 
>> According to the contract of alias_source_matches() above, three cases:
>> 
>> * No match: try next alias
>> 
>> * Partial match: set *is_alias_prefix = true if non-null
>> 
>> * Full match: leave it alone
>> 
>> > +
>> > +        /*
>> > +         * For single-member aliases, an alias name is specified in the
>> > +         * alias definition. For wildcard aliases, the alias has the same
>> > +         * name as the member in the source object, i.e. *name.
>> > +         */
>> > +        if (!input_present(qiv, a->alias_so, a->name ?: *name)) {
>> > +            continue;
>> 
>> What if alias_source_matches() already set *is_alias_prefix = true?
>> 
>> I figure this can't happen, because it guards the assignment with the
>> exact same call of input_present().  In other words, we can get here
>> only for "full match".  Correct?
>
> Probably, but my reasoning is much simpler: If alias_source_matches()
> sets *is_alias_prefix, it also returns false, so we would already have
> taken a different path above.

I see.  The contract even says so: "false is returned and
*is_alias_prefix is set to true".  It's actually the only way for
*is_alias_prefix to become true.

Output parameters that are set only sometimes require the caller to
initialize the receiving variable, or use it only under the same
condition it is set.  The former is easy to forget, and the latter is
easy to get wrong.

"Set sometimes" can be useful, say when you have several calls where the
output should "accumulate".  When you don't, I prefer to set always,
because it makes the function harder to misuse.  Would you mind?

>> Such repeated calls of helpers can be a sign of awkward interfaces.
>> Let's not worry about that now.
>> 
>> > +        }
>> > +
>> > +        /*
>> > +         * A non-wildcard alias simply overrides a wildcard alias, but
>> > +         * two matching non-wildcard aliases or two matching wildcard
>> > +         * aliases conflict with each other.
>> > +         */
>> > +        if (found_name && (!found_is_wildcard || a->name == NULL)) {
>> > +            error_setg(errp, "Value for parameter %s was already given "
>> > +                       "through an alias",
>> > +                       full_name_so(qiv, *name, false, *so));
>> > +            return false;
>> > +        } else {
>> > +            found_name = a->name ?: *name;
>> > +            found_so = a->alias_so;
>> > +            found_is_wildcard = !a->name;
>> > +        }
>> > +    }
>> > +
>> > +    /*
>> > +     * Chained aliases: *found_so/found_name might be the source of
>> > +     * another alias.
>> > +     */
>> > +    if (found_name && (found_so != *so || found_name != *name)) {
>> > +        find_object_member(qiv, &found_so, &found_name, NULL, errp);
>> 
>> * Input present: update @found_so, @found_name.
>> 
>> * Input absent: zap @found_name, @found_name.
>> 
>> * Error: set *errp.
>> 
>>   Can @found_name be non-null?  If yes, we can set *errp and return
>>   true, which would be bad.
>
> Good catch, this looks like a bug.
>
> Maybe the best solution is to guarantee *name == NULL on return for
> error cases. Apart from updating the contract, the only relevant place
> is the error_setg() above where we would add an explicit *name = NULL.

Yup, "set always" :)

>> > +    }
>> > +
>> > +    *so = found_so;
>> > +    *name = found_name;
>> > +
>> > +    return found_name != NULL;
>> > +}
>> > +
>> >  static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
>> >                                               const char *name,
>> > -                                             bool consume)
>> > +                                             bool consume, Error **errp)
>> 
>> Before the patch, two cases:
>> 
>> * Input present: consume input if @consume, return the input
>> 
>> * Input absent: return null
>> 
>> The patch adds
>> 
>> * Other error: set *errp, return null
>> 
>> Slightly awkward to use, as we shall see below at [1] and [2].
>> Observation, not demand.
>> 
>> >  {
>> >      StackObject *tos;
>> >      QObject *qobj;
>> > @@ -189,10 +372,31 @@ static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
>> >      assert(qobj);
>> >  
>> >      if (qobject_type(qobj) == QTYPE_QDICT) {
>> > -        assert(name);
>> > -        ret = qdict_get(qobject_to(QDict, qobj), name);
>> > -        if (tos->h && consume && ret) {
>> > -            bool removed = g_hash_table_remove(tos->h, name);
>> > +        StackObject *so = tos;
>> > +        const char *key = name;
>> > +        bool is_alias_prefix;
>> > +
>> > +        assert(key);
>> > +        if (!find_object_member(qiv, &so, &key, &is_alias_prefix, errp)) {
>> 
>> * Input absent: zap @so, @key, set @is_alias_prefix.
>> 
>> * Error: set *errp, leave @is_alias_prefix undefined.
>> 
>> > +            if (is_alias_prefix) {
>> 
>> Use of undefined @is_alias_prefix in case "Error".  Bug in code or in
>> contract?
>
> We should probably use ERRP_GUARD() and check for !*errp here.

A need to use ERRP_GUARD() often signals "awkward interface".

What about always setting is_alias_prefix?  Then it's false on error.

>> > +                /*
>> > +                 * The member is not present in the input, but
>> > +                 * something inside of it might still be given through
>> > +                 * an alias. Pretend there was an empty object in the
>> > +                 * input.
>> > +                 */
>> 
>> We pretend there was an object to make the calling visitor enter the
>> object and visit its members.  Visiting a member first looks for input
>> in the (empty) object, then follows aliases to look for it elsewhere.
>> 
>> Is "might" still correct?  The comment in alias_source_matches() makes
>> me hope it's actually "will".
>
> No, unfortunately it's still "might". This is not a problem of the new
> code, but a limitation of the way how visitors work. We just can't know
> which keys the caller will visit later and whether the given input will
> match up with them.

I see.  Thanks!

>> 
>> > +                if (!qiv->empty_qdict) {
>> > +                    qiv->empty_qdict = qdict_new();
>> > +                }
>> > +                return QOBJECT(qiv->empty_qdict);
>> > +            } else {
>> > +                return NULL;
>> > +            }
>> > +        }
>> > +        ret = qdict_get(qobject_to(QDict, so->obj), key);
>> > +        assert(ret != NULL);
>> > +        if (so->h && consume) {
>> > +            bool removed = g_hash_table_remove(so->h, key);
>> >              assert(removed);
>> >          }
>> >      } else {
>
> Kevin


