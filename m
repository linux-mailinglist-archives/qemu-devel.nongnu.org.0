Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFE7401D82
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:18:44 +0200 (CEST)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGOR-0007Ns-7W
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNGMR-0004eM-9M
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:16:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNGMO-0005Wx-T0
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630941395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8DPYUZm7ZulDfnMUZc+7FkY6BG/S5BnN2Uz6dr2dQJ4=;
 b=IPnCEfWsUzBzuibq87azPFNrLGUeasBtPWDfgtouCbX5G4RG93u0yb/ox3YBB2f5piwqq7
 Zz6wXuixAs+HNtbL66b2/s2hD2iV7lATO0hynhOb9qXUR/E7uTe4h+3MiS09uMZunkvYzM
 OHUkOWEdmPesb1iTQnvP10/rvZluM30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-Fq2yIVmjMNG3rYCtL1pBBA-1; Mon, 06 Sep 2021 11:16:34 -0400
X-MC-Unique: Fq2yIVmjMNG3rYCtL1pBBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5441D84A5E3
 for <qemu-devel@nongnu.org>; Mon,  6 Sep 2021 15:16:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0F6460CA1;
 Mon,  6 Sep 2021 15:16:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 651451138606; Mon,  6 Sep 2021 17:16:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 4/6] qapi: Apply aliases in qobject-input-visitor
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-5-kwolf@redhat.com>
Date: Mon, 06 Sep 2021 17:16:31 +0200
In-Reply-To: <20210812161131.92017-5-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 12 Aug 2021 18:11:29 +0200")
Message-ID: <87pmtld99s.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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

> When looking for an object in a struct in the external representation,
> check not only the currently visited struct, but also whether an alias
> in the current StackObject matches and try to fetch the value from the
> alias then. Providing two values for the same object through different
> aliases is an error.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qobject-input-visitor.c | 227 +++++++++++++++++++++++++++++++++--
>  1 file changed, 218 insertions(+), 9 deletions(-)
>
> diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
> index 16a75442ff..6193df28a5 100644
> --- a/qapi/qobject-input-visitor.c
> +++ b/qapi/qobject-input-visitor.c
> @@ -97,6 +97,8 @@ struct QObjectInputVisitor {
>      QObject *root;
>      bool keyval;                /* Assume @root made with keyval_parse() */
>  
> +    QDict *empty_qdict;         /* Used for implicit objects */

Would

       /* For visiting objects where all members are from aliases */

be clearer?

> +
>      /* Stack of objects being visited (all entries will be either
>       * QDict or QList). */
>      QSLIST_HEAD(, StackObject) stack;
> @@ -169,9 +171,190 @@ static const char *full_name(QObjectInputVisitor *qiv, const char *name)
>      return full_name_so(qiv, name, false, tos);
>  }
>  
> +static bool find_object_member(QObjectInputVisitor *qiv,
> +                               StackObject **so, const char **name,
> +                               bool *is_alias_prefix, Error **errp);

According to the function's contract below, three cases:

* Input present: update *so, *name, return true.

* Input absent: zap *so, *name, set *is_alias_prefix, return false.

* Error: set *errp, leave *is_alias_prefix undefined, return false.

> +
> +/*
> + * Check whether the member @name in @so, or an alias for it, is
> + * present in the input and can be used to obtain the value.
> + */
> +static bool input_present(QObjectInputVisitor *qiv, StackObject *so,
> +                          const char *name)
> +{
> +    /*
> +     * Check whether the alias member is present in the input
> +     * (possibly recursively because aliases are transitive).
> +     * The QAPI generator makes sure that alises cannot form loops, so
> +     * the recursion guaranteed to terminate.
> +     */
> +    if (!find_object_member(qiv, &so, &name, NULL, NULL)) {

* Input absent: zap @so and @name.

* Error: don't zap.

Since @so and @name aren't used anymore, the difference doesn't matter.
Okay.

> +        return false;
> +    }
> +
> +    /*
> +     * Every source can be used only once. If a value in the input
> +     * would end up being used twice through aliases, we'll fail the
> +     * second access.
> +     */
> +    if (!g_hash_table_contains(so->h, name)) {
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +/*
> + * Check whether the member @name in the object visited by @so can be
> + * specified in the input by using the alias described by @a (which
> + * must be an alias contained in so->aliases).
> + *
> + * If @name is only a prefix of the alias source, but doesn't match
> + * immediately, false is returned and *is_alias_prefix is set to true
> + * if it is non-NULL.  In all other cases, *is_alias_prefix is left
> + * unchanged.
> + */
> +static bool alias_source_matches(QObjectInputVisitor *qiv,
> +                                 StackObject *so, InputVisitorAlias *a,
> +                                 const char *name, bool *is_alias_prefix)
> +{
> +    if (a->src[0] == NULL) {
> +        assert(a->name == NULL);
> +        return true;
> +    }
> +
> +    if (!strcmp(a->src[0], name)) {
> +        if (a->name && a->src[1] == NULL) {
> +            /*
> +             * We're matching an exact member, the source for this alias is
> +             * immediately in @so.
> +             */
> +            return true;
> +        } else if (is_alias_prefix) {
> +            /*
> +             * We're only looking at a prefix of the source path for the alias.
> +             * If the input contains no object of the requested name, we will
> +             * implicitly create an empty one so that the alias can still be
> +             * used.
> +             *
> +             * We want to create the implicit object only if the alias is
> +             * actually used, but we can't tell here for wildcard aliases (only
> +             * a later visitor call will determine this). This means that
> +             * wildcard aliases must never have optional keys in their source
> +             * path. The QAPI generator checks this condition.
> +             */

Double-checking: this actually ensures that we only ever create the
implicit object when it will not remain empty.  Correct?

> +            if (!a->name || input_present(qiv, a->alias_so, a->name)) {
> +                *is_alias_prefix = true;
> +            }
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +/*
> + * Find the place in the input where the value for the object member
> + * @name in @so is specified, considering applicable aliases.
> + *
> + * If a value could be found, true is returned and @so and @name are
> + * updated to identify the key name and StackObject where the value
> + * can be found in the input.  (This is either unchanged or the
> + * alias_so/name of an alias.)  The value of @is_alias_prefix on
> + * return is undefined in this case.
> + *
> + * If no value could be found in the input, false is returned and @so
> + * and @name are set to NULL.  This is not an error and @errp remains
> + * unchanged.  If @is_alias_prefix is non-NULL, it is set to true if
> + * the given name is a prefix of the source path of an alias for which
> + * a value may be present in the input.  It is set to false otherwise.
> + *
> + * If an error occurs (e.g. two values are specified for the member
> + * through different names), false is returned and @errp is set.  The
> + * value of @is_alias_prefix on return is undefined in this case.
> + */
> +static bool find_object_member(QObjectInputVisitor *qiv,
> +                               StackObject **so, const char **name,
> +                               bool *is_alias_prefix, Error **errp)
> +{
> +    QDict *qdict = qobject_to(QDict, (*so)->obj);
> +    const char *found_name = NULL;
> +    StackObject *found_so = NULL;
> +    bool found_is_wildcard = false;
> +    InputVisitorAlias *a;
> +
> +    if (is_alias_prefix) {
> +        *is_alias_prefix = false;
> +    }
> +
> +    /* Directly present in the container */
> +    if (qdict_haskey(qdict, *name)) {
> +        found_name = *name;
> +        found_so = *so;
> +    }
> +
> +    /*
> +     * Find aliases whose source path matches @name in this StackObject. We can
> +     * then get the value with the key a->name from a->alias_so.
> +     */
> +    QSLIST_FOREACH(a, &(*so)->aliases, next) {
> +        if (a->name == NULL && found_name && !found_is_wildcard) {
> +            /*
> +             * Skip wildcard aliases if we already have a match. This is
> +             * not a conflict that should result in an error.
> +             *
> +             * However, multiple wildcard aliases matching is an error
> +             * and will be caught below.
> +             */
> +            continue;
> +        }
> +
> +        if (!alias_source_matches(qiv, *so, a, *name, is_alias_prefix)) {
> +            continue;
> +        }

According to the contract of alias_source_matches() above, three cases:

* No match: try next alias

* Partial match: set *is_alias_prefix = true if non-null

* Full match: leave it alone

> +
> +        /*
> +         * For single-member aliases, an alias name is specified in the
> +         * alias definition. For wildcard aliases, the alias has the same
> +         * name as the member in the source object, i.e. *name.
> +         */
> +        if (!input_present(qiv, a->alias_so, a->name ?: *name)) {
> +            continue;

What if alias_source_matches() already set *is_alias_prefix = true?

I figure this can't happen, because it guards the assignment with the
exact same call of input_present().  In other words, we can get here
only for "full match".  Correct?

Such repeated calls of helpers can be a sign of awkward interfaces.
Let's not worry about that now.

> +        }
> +
> +        /*
> +         * A non-wildcard alias simply overrides a wildcard alias, but
> +         * two matching non-wildcard aliases or two matching wildcard
> +         * aliases conflict with each other.
> +         */
> +        if (found_name && (!found_is_wildcard || a->name == NULL)) {
> +            error_setg(errp, "Value for parameter %s was already given "
> +                       "through an alias",
> +                       full_name_so(qiv, *name, false, *so));
> +            return false;
> +        } else {
> +            found_name = a->name ?: *name;
> +            found_so = a->alias_so;
> +            found_is_wildcard = !a->name;
> +        }
> +    }
> +
> +    /*
> +     * Chained aliases: *found_so/found_name might be the source of
> +     * another alias.
> +     */
> +    if (found_name && (found_so != *so || found_name != *name)) {
> +        find_object_member(qiv, &found_so, &found_name, NULL, errp);

* Input present: update @found_so, @found_name.

* Input absent: zap @found_name, @found_name.

* Error: set *errp.

  Can @found_name be non-null?  If yes, we can set *errp and return
  true, which would be bad.

> +    }
> +
> +    *so = found_so;
> +    *name = found_name;
> +
> +    return found_name != NULL;
> +}
> +
>  static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
>                                               const char *name,
> -                                             bool consume)
> +                                             bool consume, Error **errp)

Before the patch, two cases:

* Input present: consume input if @consume, return the input

* Input absent: return null

The patch adds

* Other error: set *errp, return null

Slightly awkward to use, as we shall see below at [1] and [2].
Observation, not demand.

>  {
>      StackObject *tos;
>      QObject *qobj;
> @@ -189,10 +372,31 @@ static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
>      assert(qobj);
>  
>      if (qobject_type(qobj) == QTYPE_QDICT) {
> -        assert(name);
> -        ret = qdict_get(qobject_to(QDict, qobj), name);
> -        if (tos->h && consume && ret) {
> -            bool removed = g_hash_table_remove(tos->h, name);
> +        StackObject *so = tos;
> +        const char *key = name;
> +        bool is_alias_prefix;
> +
> +        assert(key);
> +        if (!find_object_member(qiv, &so, &key, &is_alias_prefix, errp)) {

* Input absent: zap @so, @key, set @is_alias_prefix.

* Error: set *errp, leave @is_alias_prefix undefined.

> +            if (is_alias_prefix) {

Use of undefined @is_alias_prefix in case "Error".  Bug in code or in
contract?

> +                /*
> +                 * The member is not present in the input, but
> +                 * something inside of it might still be given through
> +                 * an alias. Pretend there was an empty object in the
> +                 * input.
> +                 */

We pretend there was an object to make the calling visitor enter the
object and visit its members.  Visiting a member first looks for input
in the (empty) object, then follows aliases to look for it elsewhere.

Is "might" still correct?  The comment in alias_source_matches() makes
me hope it's actually "will".


> +                if (!qiv->empty_qdict) {
> +                    qiv->empty_qdict = qdict_new();
> +                }
> +                return QOBJECT(qiv->empty_qdict);
> +            } else {
> +                return NULL;
> +            }
> +        }
> +        ret = qdict_get(qobject_to(QDict, so->obj), key);
> +        assert(ret != NULL);
> +        if (so->h && consume) {
> +            bool removed = g_hash_table_remove(so->h, key);
>              assert(removed);
>          }
>      } else {
> @@ -218,9 +422,10 @@ static QObject *qobject_input_get_object(QObjectInputVisitor *qiv,
>                                           const char *name,
>                                           bool consume, Error **errp)
>  {
> -    QObject *obj = qobject_input_try_get_object(qiv, name, consume);
> +    ERRP_GUARD();
> +    QObject *obj = qobject_input_try_get_object(qiv, name, consume, errp);
>  
> -    if (!obj) {
> +    if (!obj && !*errp) {
>          error_setg(errp, QERR_MISSING_PARAMETER, full_name(qiv, name));
>      }

[1] Squash case "Input absent" into case "Error".

>      return obj;
> @@ -803,13 +1008,16 @@ static bool qobject_input_type_size_keyval(Visitor *v, const char *name,
>  static void qobject_input_optional(Visitor *v, const char *name, bool *present)
>  {
>      QObjectInputVisitor *qiv = to_qiv(v);
> -    QObject *qobj = qobject_input_try_get_object(qiv, name, false);
> +    Error *local_err = NULL;
> +    QObject *qobj = qobject_input_try_get_object(qiv, name, false, &local_err);
>  
> -    if (!qobj) {
> +    /* If there was an error, let the caller try and run into the error */
> +    if (!qobj && !local_err) {

[2] Case "Input absent", and ...

>          *present = false;
>          return;
>      }

... cases "Input present" and "Error".

>  
> +    error_free(local_err);
>      *present = true;
>  }
>  
> @@ -842,6 +1050,7 @@ static void qobject_input_free(Visitor *v)
>          qobject_input_stack_object_free(tos);
>      }
>  
> +    qobject_unref(qiv->empty_qdict);
>      qobject_unref(qiv->root);
>      if (qiv->errname) {
>          g_string_free(qiv->errname, TRUE);


