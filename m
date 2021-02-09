Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53503315364
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 17:06:24 +0100 (CET)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9VWx-00053E-Dr
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 11:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9VTg-0003xK-CG
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:03:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9VTd-00021U-3G
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612886575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CLPlE5kS4dl+rE77oR/9KRWDaL+dL4Iif+9rfq8G4tA=;
 b=i/gHPel9R2mV76mSRFE6T5k3rtieHOStFO2AazInGrRb0/yePvOs9R4kN614bsgVeuY12R
 09dob5RGkn87FV4Xoe5tAB2LL1aDV9jVLl4b4J5at77K3Klz6A7ebxNmFmFL5oS2+YwlRl
 rFa+DF/0//9JBAJZCGvkEOVGQ0SG7cQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-jwbGUd-APGq9ucj0tVH1qA-1; Tue, 09 Feb 2021 11:02:53 -0500
X-MC-Unique: jwbGUd-APGq9ucj0tVH1qA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5D7279EC1
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 16:02:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F8BD60C04;
 Tue,  9 Feb 2021 16:02:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C4CF2113865F; Tue,  9 Feb 2021 17:02:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 4/6] qapi: Apply aliases in qobject-input-visitor
References: <20201112172850.401925-1-kwolf@redhat.com>
 <20201112172850.401925-5-kwolf@redhat.com>
Date: Tue, 09 Feb 2021 17:02:50 +0100
In-Reply-To: <20201112172850.401925-5-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 12 Nov 2020 18:28:48 +0100")
Message-ID: <87tuqlb55h.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

> When looking for an object in a struct in the external representation,
> check not only the currently visited struct, but also whether an alias
> in the current StackObject matches and try to fetch the value from the
> alias then. Providing two values for the same object through different
> aliases is an error.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

I had to read this patch mostly backwards to make sense of it.  I
recommend you read my review mostly backwards, too: forward within each
function, backwards otherwise.

I sometimes put helpers after their users to avoid that.

> ---
>  qapi/qobject-input-visitor.c | 169 +++++++++++++++++++++++++++++++++--
>  1 file changed, 160 insertions(+), 9 deletions(-)
>
> diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
> index 1415561828..faca5b6b55 100644
> --- a/qapi/qobject-input-visitor.c
> +++ b/qapi/qobject-input-visitor.c
> @@ -74,6 +74,8 @@ struct QObjectInputVisitor {
>      QObject *root;
>      bool keyval;                /* Assume @root made with keyval_parse() */
>  
> +    QDict *empty_qdict;         /* Used for implicit objects */
> +
>      /* Stack of objects being visited (all entries will be either
>       * QDict or QList). */
>      QSLIST_HEAD(, StackObject) stack;
> @@ -141,9 +143,139 @@ static const char *full_name(QObjectInputVisitor *qiv, const char *name)
>      return full_name_so(qiv, name, tos);
>  }
>  
> +static bool find_object_member(QObjectInputVisitor *qiv,
> +                               StackObject **so, const char **name,
> +                               bool *implicit_object, Error **errp);
> +
> +static bool alias_present(QObjectInputVisitor *qiv,
> +                          InputVisitorAlias *a, const char *name)
> +{
> +    StackObject *so = a->alias_so;
> +
> +    /*
> +     * The passed source @name is only relevant for wildcard aliases which
> +     * don't have a separate name, otherwise we use the alias name.
> +     */
> +    if (a->alias) {
> +        name = a->alias;
> +    }
> +
> +    if (!find_object_member(qiv, &so, &name, NULL, NULL)) {
> +        return false;
> +    }
> +
> +    /*
> +     * Every source can be used only once. If a value in the input would end up
> +     * being used twice through aliases, we'll fail the second access.
> +     */
> +    if (!g_hash_table_contains(so->h, name)) {
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static bool alias_source_matches(QObjectInputVisitor *qiv,
> +                                 StackObject *so, InputVisitorAlias *a,
> +                                 const char *name, bool *implicit_object)
> +{
> +    if (a->src[0] == NULL) {
> +        assert(a->alias == NULL);
> +        return true;
> +    }
> +
> +    if (!strcmp(a->src[0], name)) {
> +        if (a->alias && a->src[1] == NULL) {
> +            /*
> +             * We're matching an exact member, the source for this alias is
> +             * immediately in @so.
> +             */
> +            return true;
> +        } else if (implicit_object) {
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
> +             * path.
> +             */
> +            if (!a->alias || alias_present(qiv, a, a->alias)) {
> +                *implicit_object = true;
> +            }
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +static bool find_object_member(QObjectInputVisitor *qiv,
> +                               StackObject **so, const char **name,
> +                               bool *implicit_object, Error **errp)
> +{
> +    StackObject *cur_so = *so;
> +    QDict *qdict = qobject_to(QDict, cur_so->obj);
> +    const char *found = NULL;
> +    bool found_is_wildcard = false;
> +    InputVisitorAlias *a;
> +
> +    if (implicit_object) {
> +        *implicit_object = false;
> +    }
> +
> +    /* Directly present in the container */
> +    if (qdict_haskey(qdict, *name)) {
> +        found = *name;
> +    }
> +
> +    /*
> +     * Find aliases whose source path matches @name in this StackObject. We can
> +     * then get the value with the key a->alias from a->alias_so.
> +     */
> +    QSLIST_FOREACH(a, &cur_so->aliases, next) {
> +        if (a->alias == NULL && found) {
> +            /*
> +             * Skip wildcard aliases if we already have a match. This is
> +             * not a conflict that should result in an error.
> +             */
> +            continue;
> +        }
> +
> +        if (!alias_source_matches(qiv, cur_so, a, *name, implicit_object)) {
> +            continue;
> +        }
> +
> +        if (!alias_present(qiv, a, *name)) {
> +            continue;
> +        }
> +
> +        if (found && !found_is_wildcard) {
> +            error_setg(errp, "Value for parameter %s was already given "
> +                       "through an alias", full_name_so(qiv, *name, *so));
> +            return false;
> +        } else {
> +            found = a->alias ?: *name;
> +            *so = a->alias_so;
> +            found_is_wildcard = !a->alias;
> +        }
> +    }
> +
> +    /* Chained aliases: *so/found might be the source of another alias */
> +    if (found && (*so != cur_so || found != *name)) {
> +        find_object_member(qiv, so, &found, NULL, errp);
> +    }
> +
> +    *name = found;
> +    return found;
> +}
> +
>  static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
>                                               const char *name,
> -                                             bool consume)
> +                                             bool consume, Error **errp)
>  {
>      StackObject *tos;
>      QObject *qobj;
> @@ -161,10 +293,24 @@ static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
>      assert(qobj);
>  
>      if (qobject_type(qobj) == QTYPE_QDICT) {
> -        assert(name);
> -        ret = qdict_get(qobject_to(QDict, qobj), name);
> -        if (tos->h && consume && ret) {
> -            bool removed = g_hash_table_remove(tos->h, name);
> +        StackObject *so = tos;
> +        const char *key = name;
> +        bool implicit_object;
> +
> +        assert(key);
> +        if (!find_object_member(qiv, &so, &key, &implicit_object, errp)) {

I guess this changes @so, @key exactly when it follows an alias.

We'll see when @implicit_object is set when we get to the spot that sets
it (remember, reading backwards).

> +            if (implicit_object) {
> +                if (!qiv->empty_qdict) {
> +                    qiv->empty_qdict = qdict_new();
> +                }
> +                return QOBJECT(qiv->empty_qdict);

Returns a soft reference (not to be qobject_unref()'ed), which is
correct.

> +            } else {
> +                return NULL;
> +            }
> +        }
> +        ret = qdict_get(qobject_to(QDict, so->obj), key);
> +        if (so->h && consume && ret) {
> +            bool removed = g_hash_table_remove(so->h, key);
>              assert(removed);
>          }
>      } else {

Cases:

* !find_object_member() && implicit_object && no error set

  Return a shared empty QDict, no error set.

* !find_object_member() && implicit_object && error set

  Must not happen.

* !find_object_member() && !implicit_object && no error set

  Return null, no error set.

* !find_object_member() && !implicit_object && error set

  Return null, error set.

* find_object_member() && no error set

  Return input.

  implicit_object is ignored.

* find_object_member() && error set

  Must not happen.

I can only guess what these cases mean.

find_object_member() is too complicated to go without a written
contract.  Please add one.

I'd prefer to see it before I continue review.

> @@ -190,9 +336,10 @@ static QObject *qobject_input_get_object(QObjectInputVisitor *qiv,
>                                           const char *name,
>                                           bool consume, Error **errp)
>  {
> -    QObject *obj = qobject_input_try_get_object(qiv, name, consume);
> +    ERRP_GUARD();
> +    QObject *obj = qobject_input_try_get_object(qiv, name, consume, errp);
>  
> -    if (!obj) {
> +    if (!obj && !*errp) {

Likewise (below, not above; we're reading backwards).

>          error_setg(errp, QERR_MISSING_PARAMETER, full_name(qiv, name));
>      }
>      return obj;
> @@ -764,13 +911,16 @@ static bool qobject_input_type_size_keyval(Visitor *v, const char *name,
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
>          *present = false;
>          return;
>      }
>  
> +    error_free(local_err);
>      *present = true;
>  }
>  

Awkward.

Before the patch, qobject_input_try_get_object() returns the input for
@name, or else null.

Afterwards, we have three cases:

* Return non-null, no error set: this is the input for name, as before.

* Return null, no error set: there is no input for name.

* Return null, error set: "Value for parameter %s was already given
  through an alias".  We'll see what that means when we get to the spot
  that sets this error (remember, reading backwards).

I can't yet say whether this could be avoided.

> @@ -785,6 +935,7 @@ static void qobject_input_free(Visitor *v)
>          qobject_input_stack_object_free(tos);
>      }
>  
> +    qobject_unref(qiv->empty_qdict);
>      qobject_unref(qiv->root);
>      if (qiv->errname) {
>          g_string_free(qiv->errname, TRUE);


