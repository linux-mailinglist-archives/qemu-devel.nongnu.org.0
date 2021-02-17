Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D725E31DE9F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 18:52:27 +0100 (CET)
Received: from localhost ([::1]:38466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCQzy-00063o-U5
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 12:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lCQyF-0004lF-GS
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:50:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lCQyB-0005P4-OH
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:50:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613584234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P/VECI3IrcV5+jUujN2L9jFGFpyik9VXbpf1sLcryuY=;
 b=d4faAQ68WWtmuvQblUlGzlue2PVvNXkOVs6e1stqMFMMFoRK1MZgE8+f5POfGZJ7tNKjEF
 STjD/9FndjmS+v0EzPxUEGl1DdikouGAZU2rggCqKMpeUWnU3C286Mk0H6/EjUR/LaUdN8
 9/67FRRqiznmg9TOOL3HUzAFyNQrht8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-og2dZlrIPzq_Dx7s-bfo7A-1; Wed, 17 Feb 2021 12:50:30 -0500
X-MC-Unique: og2dZlrIPzq_Dx7s-bfo7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1289C107ACF3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 17:50:30 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-218.ams2.redhat.com [10.36.113.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE91A5D748;
 Wed, 17 Feb 2021 17:50:28 +0000 (UTC)
Date: Wed, 17 Feb 2021 18:50:26 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 4/6] qapi: Apply aliases in qobject-input-visitor
Message-ID: <20210217175026.GC5662@merkur.fritz.box>
References: <20210211183118.422036-1-kwolf@redhat.com>
 <20210211183118.422036-5-kwolf@redhat.com>
 <871rder9py.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <871rder9py.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Am 17.02.2021 um 16:32 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > When looking for an object in a struct in the external representation,
> > check not only the currently visited struct, but also whether an alias
> > in the current StackObject matches and try to fetch the value from the
> > alias then. Providing two values for the same object through different
> > aliases is an error.
> >
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> 
> Looking just at qobject_input_try_get_object() for now.

:-(

This patch doesn't even feel that complicated to me.

Old: Get the value from the QDict of the current StackObject with the
given name.

New: First do alias resolution (with find_object_member), which results
in a StackObject and a name, and that's the QDict and key where you get
the value from.


Minor complication: Aliases can refer to members of nested objects that
may not be provided in the input. But we want these to work.

For example, my chardev series defines aliases to flatten
SocketAddressLegacy (old syntax, I haven't rebased it yet):

{ 'union': 'SocketAddressLegacy',
  'data': {
    'inet': 'InetSocketAddress',
    'unix': 'UnixSocketAddress',
    'vsock': 'VsockSocketAddress',
    'fd': 'String' },
  'aliases': [
    {'source': ['data']},
    {'alias': 'fd', 'source': ['data', 'str']}
  ]}

Of course, the idea is that this input should work:

{ 'type': 'inet', 'hostname': 'localhost', 'port': '1234' }

However, without implicit objects, parsing 'data' fails because it
expects an object, but none is given (we specified all of its members on
the top level through aliases). What we would have to give is:

{ 'type': 'inet', 'hostname': 'localhost', 'port': '1234', 'data': {} }

And _that_ would work. Visiting 'data' succeeds because we now have the
object that the visitor expects, and when visiting its members, the
aliases fill in all of the mandatory values.

So what this patch does is to implicitly assume the 'data': {} instead
of erroring out when we know that aliases exist that can still provide
values for the content of 'data'.

> > ---
> >  qapi/qobject-input-visitor.c | 214 +++++++++++++++++++++++++++++++++--
> >  1 file changed, 205 insertions(+), 9 deletions(-)
> >
> > diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
> > index dd04ef0027..3ea5e5abd6 100644
> > --- a/qapi/qobject-input-visitor.c
> > +++ b/qapi/qobject-input-visitor.c
> > @@ -95,6 +95,8 @@ struct QObjectInputVisitor {
> >      QObject *root;
> >      bool keyval;                /* Assume @root made with keyval_parse() */
> >  
> > +    QDict *empty_qdict;         /* Used for implicit objects */
> > +
> >      /* Stack of objects being visited (all entries will be either
> >       * QDict or QList). */
> >      QSLIST_HEAD(, StackObject) stack;
> > @@ -167,9 +169,178 @@ static const char *full_name(QObjectInputVisitor *qiv, const char *name)
> >      return full_name_so(qiv, name, false, tos);
> >  }
> >  
> > +static bool find_object_member(QObjectInputVisitor *qiv,
> > +                               StackObject **so, const char **name,
> > +                               bool *implicit_object, Error **errp);
> > +
> > +/*
> > + * Check whether the alias member defined by @a is present in the
> > + * input and can be used to obtain the value for the member @name in
> > + * the currently visited object.
> > + */
> > +static bool alias_present(QObjectInputVisitor *qiv,
> > +                          InputVisitorAlias *a, const char *name)
> > +{
> > +    StackObject *so = a->alias_so;
> > +
> > +    /*
> > +     * The passed source @name is only relevant for wildcard aliases which
> > +     * don't have a separate name, otherwise we use the alias name.
> > +     */
> > +    if (a->name) {
> > +        name = a->name;
> > +    }
> > +
> > +    /*
> > +     * Check whether the alias member is present in the input
> > +     * (possibly recursively because aliases are transitive).
> > +     */
> > +    if (!find_object_member(qiv, &so, &name, NULL, NULL)) {
> > +        return false;
> > +    }
> > +
> > +    /*
> > +     * Every source can be used only once. If a value in the input would end up
> > +     * being used twice through aliases, we'll fail the second access.
> > +     */
> > +    if (!g_hash_table_contains(so->h, name)) {
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +}
> > +
> > +/*
> > + * Check whether the member @name in the object visited by @so can be
> > + * specified in the input by using the alias described by @a.
> > + *
> > + * If @name is only a prefix of the alias source, but doesn't match
> > + * immediately, false is returned and @implicit_object is set to true
> > + * if it is non-NULL.  In all other cases, @implicit_object is left
> > + * unchanged.
> > + */
> > +static bool alias_source_matches(QObjectInputVisitor *qiv,
> > +                                 StackObject *so, InputVisitorAlias *a,
> > +                                 const char *name, bool *implicit_object)
> > +{
> > +    if (a->src[0] == NULL) {
> > +        assert(a->name == NULL);
> > +        return true;
> > +    }
> > +
> > +    if (!strcmp(a->src[0], name)) {
> > +        if (a->name && a->src[1] == NULL) {
> > +            /*
> > +             * We're matching an exact member, the source for this alias is
> > +             * immediately in @so.
> > +             */
> > +            return true;
> > +        } else if (implicit_object) {
> > +            /*
> > +             * We're only looking at a prefix of the source path for the alias.
> > +             * If the input contains no object of the requested name, we will
> > +             * implicitly create an empty one so that the alias can still be
> > +             * used.
> > +             *
> > +             * We want to create the implicit object only if the alias is
> > +             * actually used, but we can't tell here for wildcard aliases (only
> > +             * a later visitor call will determine this). This means that
> > +             * wildcard aliases must never have optional keys in their source
> > +             * path.
> > +             */
> > +            if (!a->name || alias_present(qiv, a, a->name)) {
> > +                *implicit_object = true;
> > +            }
> > +        }
> > +    }
> > +
> > +    return false;
> > +}
> > +
> > +/*
> > + * Find the place in the input where the value for the object member
> > + * @name in @so is specified, considering applicable aliases.
> > + *
> > + * If a value could be found, true is returned and @so and @name are
> > + * updated to identify the key name and StackObject where the value
> > + * can be found in the input.  (This is either unchanged or the
> > + * alias_so/name of an alias.)  The value of @implicit_object on
> > + * return is undefined in this case.
> > + *
> > + * If no value could be found in the input, false is returned.  This
> > + * is not an error and @errp remains unchanged.  If @implicit_object
> > + * is non-NULL, it is set to true if the given name is a prefix of the
> > + * source path of an alias for which a value may be present in the
> > + * input.  It is set to false otherwise.
> > + *
> > + * If an error occurs (e.g. two values are specified for the member
> > + * through different names), false is returned and @errp is set.  The
> > + * value of @implicit_object on return is undefined in this case.
> > + */
> > +static bool find_object_member(QObjectInputVisitor *qiv,
> > +                               StackObject **so, const char **name,
> > +                               bool *implicit_object, Error **errp)
> > +{
> > +    StackObject *cur_so = *so;
> > +    QDict *qdict = qobject_to(QDict, cur_so->obj);
> > +    const char *found = NULL;
> > +    bool found_is_wildcard = false;
> > +    InputVisitorAlias *a;
> > +
> > +    if (implicit_object) {
> > +        *implicit_object = false;
> > +    }
> > +
> > +    /* Directly present in the container */
> > +    if (qdict_haskey(qdict, *name)) {
> > +        found = *name;
> > +    }
> > +
> > +    /*
> > +     * Find aliases whose source path matches @name in this StackObject. We can
> > +     * then get the value with the key a->name from a->alias_so.
> > +     */
> > +    QSLIST_FOREACH(a, &cur_so->aliases, next) {
> > +        if (a->name == NULL && found) {
> > +            /*
> > +             * Skip wildcard aliases if we already have a match. This is
> > +             * not a conflict that should result in an error.
> > +             */
> > +            continue;
> > +        }
> > +
> > +        if (!alias_source_matches(qiv, cur_so, a, *name, implicit_object)) {
> > +            continue;
> > +        }
> > +
> > +        if (!alias_present(qiv, a, *name)) {
> > +            continue;
> > +        }
> > +
> > +        if (found && !found_is_wildcard) {
> > +            error_setg(errp, "Value for parameter %s was already given "
> > +                       "through an alias",
> > +                       full_name_so(qiv, *name, false, *so));
> > +            return false;
> > +        } else {
> > +            found = a->name ?: *name;
> > +            *so = a->alias_so;
> > +            found_is_wildcard = !a->name;
> > +        }
> > +    }
> > +
> > +    /* Chained aliases: *so/found might be the source of another alias */
> > +    if (found && (*so != cur_so || found != *name)) {
> > +        find_object_member(qiv, so, &found, NULL, errp);
> > +    }
> > +
> > +    *name = found;
> > +    return found;
> > +}
> > +
> >  static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
> >                                               const char *name,
> > -                                             bool consume)
> > +                                             bool consume, Error **errp)
> 
> Reminder:
> 
>  * The @name parameter of visit_type_FOO() describes the relation
>  * between this QAPI value and its parent container.  When visiting
>  * the root of a tree, @name is ignored; when visiting a member of an
>  * object, @name is the key associated with the value; when visiting a
>  * member of a list, @name is NULL; and when visiting the member of an
>  * alternate, @name should equal the name used for visiting the
>  * alternate.
> 
> >  {
> >      StackObject *tos;
> >      QObject *qobj;
>        QObject *ret;
> 
>        if (QSLIST_EMPTY(&qiv->stack)) {
>            /* Starting at root, name is ignored. */
>            assert(qiv->root);
>            return qiv->root;
>        }
> 
>        /* We are in a container; find the next element. */
>        tos = QSLIST_FIRST(&qiv->stack);
>        qobj = tos->obj;
> > @@ -187,10 +358,30 @@ static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
> >      assert(qobj);
> >  
> >      if (qobject_type(qobj) == QTYPE_QDICT) {
> 
> We're visiting a member of object @qobj, which is tos->obj.
> 
> > -        assert(name);
> > -        ret = qdict_get(qobject_to(QDict, qobj), name);
> > -        if (tos->h && consume && ret) {
> > -            bool removed = g_hash_table_remove(tos->h, name);
> > +        StackObject *so = tos;
> > +        const char *key = name;
> > +        bool implicit_object;
> > +
> > +        assert(key);
> > +        if (!find_object_member(qiv, &so, &key, &implicit_object, errp)) {
> 
> No input found.
> 
> > +            if (implicit_object) {
> > +                /*
> > +                 * The member is not present in the input, but
> > +                 * something inside of it might still be given through
> > +                 * an alias. Pretend there was an empty object in the
> > +                 * input.
> > +                 */
> 
> Cue me scratching head.

I hope the above made it clearer.

> find_object_member()'s contract explains @implicit_object is true "if
> the given name is a prefix of the source path of an alias for which a
> value may be present in the input."
> 
> I figure this means qiv->stack has a stack object with an alias whose
> src[] has a prefix that resolves to @tos (the currently visited object).

No. tos->aliases contains an alias where @name is a prefix of
alias->src[] (but doesn't fully match src[]).

Or in other words, since @name is only a single element, being a prefix
means alias->src[0] == name.

The second condition ("for which a value may be present in the input")
means that if we know that the alias isn't used in the input, then we
don't create an implicit object, but use the traditinoal "not found"
path.

> Visiting the members of the currently visited object may or may not
> visit something where that src[] resolves completely, and that something
> may or may not have a member for the alias.
> 
> If it does, there is input, and "something" will happen to route it to
> the correct place.  What exactly?  Should become clearer further down.
> 
> If it doesn't, there is no input.

Visiting the aliased member will call qobject_input_try_get_object()
again, and this is where the alias will be used. We're only making sure
that it is even visited instead of erroring out earlier.

> > +                if (!qiv->empty_qdict) {
> > +                    qiv->empty_qdict = qdict_new();
> > +                }
> > +                return QOBJECT(qiv->empty_qdict);
> 
> So far, I have no idea *why* we pretend there was an empty object in the
> input, why sharing it is safe, and why changing the return value from
> null to empty dict is okay.  Should become clearer further down.
> 
> > +            } else {
> > +                return NULL;
> 
> There is definitely no input.
> 
> The old code returns null then (because the qdict_get() above returns
> null).  No change.  Good.
> 
> > +            }
> > +        }
> 
> We get here only when find_object_member() found input.

Yes. The interesting part of the patch ends here. We know the
StackObject and name where we find the right value.

> If no aliases applied, @so and @key are unchanged, i.e. @so is @tos, and
> @key is @name.  The code below is the old code with @qobj replaced by
> so->obj and @name replaced by @key.  No change.  Good.
> 
> Else, some alias (or chain of aliases) applied.
> 
> Let's assume a single alias for now.  It is defined for a stack object
> further down qiv->stack, with an alias name there, and it's src[]
> resolves to @tos (the currently visited object).

Specifically, to the member @name inside of @tos.

> find_object_member() found input there, i.e. the alias stack object's
> input has a member with the alias name.  It changed @so to the alias
> stack object, and @key to the alias name.  The code below then gets the
> input value from member with the alias name in the alias object.
> 
> This consumes the "alias member" of the outer input object, and uses it
> as input for the "true member" of the inner object.
> 
> Good.
> 
> I figure a chain of aliases works the same; the only difference is we
> need more steps to find the alias stack object and name.
> 
> Correct?

Yes, chains are handled inside find_object_member(), so if necessary, it
will recursively resolve aliases.

> > +        ret = qdict_get(qobject_to(QDict, so->obj), key);
> 
> Any particular reason why find_object_member() doesn't simply return the
> input it found?

I think it's more managable to have a function that is only responsible
for resolving names, and another to actually fetch the values from
there.

If it did both at once, qobject_input_try_get_object() wouldn't even
have anything to do any more. Getting the value from the input was its
job before the patch, so I don't see why it should be different
afterwards.

> > +        if (so->h && consume && ret) {
> 
> How can @ret be null?

I don't think it can because find_object_member() would return false.
This is old code that made sense when calling qdict_get() without
checking first if the value is present in the input.

> > +            bool removed = g_hash_table_remove(so->h, key);
> >              assert(removed);
> >          }
> >      } else {
> 
> Note that we access the parent container via tos->obj, so->obj, and
> qobj.  Too many aliases for my taste.  Let's eliminate qobj.

tos->obj and so->obj are different! They can be the same (if no alias
was used or the alias source was in the same object, i.e. a simple
rename), but they don't have to.

qobj exists before this patch and isn't touched at all. I can add
another patch to remove it, but it has nothing to do with this one.

> Now let me try to figure out how the magic around @implicit_object
> works.
> 
> Okay, I came, I saw, I ran out of brain juice.  Help!
> 
> Please walk me through an example that covers all the paths through
> this function, unless you have better ideas on how to explain it.

It is exactly one path that was added, the implicit object. The rest are
existing paths. I hope the example above clarified this path. If not,
then I'm not sure how to explain.

I can understand how the reason for having implicit objects may be
unclear (though the comments try to describe that - maybe you didn't
read it because you read my story backwards). But ignoring the why, the
how feels really obvious to me. The code that you've looked at so far
hasn't even changed much.

Kevin


