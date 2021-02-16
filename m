Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB7031CA5C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 13:07:44 +0100 (CET)
Received: from localhost ([::1]:54848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBz8p-0005ni-ES
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 07:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBz7X-0004jP-SW
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 07:06:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBz7U-0007rZ-Qj
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 07:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613477178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C5QVGZXHHWRi0NeQ3qzk9npkP79jCS0aryCi4AdTVzs=;
 b=hVz4iN6+HWWTW3Xuu2xbPVsMklXfr1rAYGFV5OzXXstW1Csf+BEIbKxRREFTpRAeR6zfmJ
 SS8go74PdyX8nOp+528vshBNZGiVtHXdaJh3Bok4yaDRG/Gz373ka0/X8pETlsgaw9vwYE
 t9L0l/9poG8WBNS+ExA0EGSNCx3jmgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-gVTlL--FNxeLeeBRiPyU3g-1; Tue, 16 Feb 2021 07:06:16 -0500
X-MC-Unique: gVTlL--FNxeLeeBRiPyU3g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77C9BC284
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 12:06:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-100.ams2.redhat.com
 [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FDA05D9C0;
 Tue, 16 Feb 2021 12:06:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A41DD113865F; Tue, 16 Feb 2021 13:06:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 2/6] qapi: Remember alias definitions in
 qobject-input-visitor
References: <20210211183118.422036-1-kwolf@redhat.com>
 <20210211183118.422036-3-kwolf@redhat.com>
Date: Tue, 16 Feb 2021 13:06:13 +0100
In-Reply-To: <20210211183118.422036-3-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 11 Feb 2021 19:31:14 +0100")
Message-ID: <87wnv8kyiy.fsf@dusky.pond.sub.org>
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

> This makes qobject-input-visitor remember the currently valid aliases in
> each StackObject. It doesn't actually allow using the aliases yet.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qobject-input-visitor.c | 145 +++++++++++++++++++++++++++++++++++
>  1 file changed, 145 insertions(+)
>
> diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
> index 23843b242e..aa95cd49bd 100644
> --- a/qapi/qobject-input-visitor.c
> +++ b/qapi/qobject-input-visitor.c
> @@ -29,6 +29,50 @@
>  #include "qemu/cutils.h"
>  #include "qemu/option.h"
>  
> +/*
> + * Describes an alias that is relevant for the current StackObject,
> + * either because it aliases a member of the currently visited object
> + * or because it aliases a member of a nested object.
> + *
> + * When processing a nested object, all InputVisitorAlias objects that
> + * are relevant for the nested object are propagated, i.e. copied with
> + * the name of the nested object removed from @source.
> + */
> +typedef struct InputVisitorAlias {
> +    /* StackObject in which the alias was defined */
> +    struct StackObject *alias_so;
> +
> +    /*
> +     * Alias name as defined for @alias_so.
> +     * NULL means that this is a wildcard alias, i.e. all members of
> +     * @src get an alias in @alias_so with the same name.
> +     */
> +    const char *name;
> +
> +    /*
> +     * NULL terminated array representing a path to the source member

NULL-terminated

> +     * that the alias refers to.
> +     *
> +     * Must contain at least one non-NULL element if @alias is not NULL.
> +     *
> +     * If it contains no non-NULL element, @alias_so must be different
> +     * from the StackObject which contains this InputVisitorAlias in
> +     * its aliases list.  In this case, all elements in the currently
> +     * visited object have an alias with the same name in @alias_so.
> +     */
> +    const char **src;
> +
> +    /*
> +     * The alias remains valid as long as the StackObject which
> +     * contains this InputVisitorAlias in its aliases list has
> +     * StackObject.alias_scope_nesting >= InputVisitorAlias.scope_nesting
> +     * or until the whole StackObject is removed.
> +     */
> +    int scope_nesting;
> +
> +    QSLIST_ENTRY(InputVisitorAlias) next;
> +} InputVisitorAlias;
> +
>  typedef struct StackObject {
>      const char *name;            /* Name of @obj in its parent, if any */
>      QObject *obj;                /* QDict or QList being visited */
> @@ -38,6 +82,9 @@ typedef struct StackObject {
>      const QListEntry *entry;    /* If @obj is QList: unvisited tail */
>      unsigned index;             /* If @obj is QList: list index of @entry */
>  
> +    QSLIST_HEAD(, InputVisitorAlias) aliases;
> +    int alias_scope_nesting;    /* Number of open alias scopes */
> +
>      QSLIST_ENTRY(StackObject) node; /* parent */
>  } StackObject;
>  
> @@ -203,6 +250,43 @@ static const char *qobject_input_get_keyval(QObjectInputVisitor *qiv,
>      return qstring_get_str(qstr);
>  }
>  
> +/*
> + * Propagate aliases from the parent StackObject @src to its direct
> + * child StackObject @dst, which is representing the child struct @name.
> + *
> + * Every alias whose source path begins with @dst->name and which still
> + * applies in @dst (i.e. it is either a wildcard alias or has at least
> + * one more source path element) is propagated to @dst with the first
> + * element (i.e. @dst->name) removed from the source path.
> + */
> +static void propagate_aliases(StackObject *dst, StackObject *src)
> +{
> +    InputVisitorAlias *a;
> +
> +    QSLIST_FOREACH(a, &src->aliases, next) {
> +        if (!a->src[0] || strcmp(a->src[0], dst->name)) {
> +            continue;
> +        }
> +
> +        /*
> +         * If this is not a wildcard alias, but a->src[1] is NULL,
> +         * then it referred to dst->name in src and doesn't apply
> +         * inside dst any more.
> +         */
> +        if (a->src[1] || !a->name) {

The comment explains "if COND then there is nothing to do".  The code
that follows it does "if (!COND) { do stuff }".  Works, but I had to
stop and re-read to get it.

How do you like

           if (a->name && !a->src[1]) {
               continue;
           }
           do stuff

?

> +            InputVisitorAlias *alias = g_new(InputVisitorAlias, 1);
> +
> +            *alias = (InputVisitorAlias) {
> +                .name       = a->name,
> +                .alias_so   = a->alias_so,
> +                .src        = &a->src[1],
> +            };
> +
> +            QSLIST_INSERT_HEAD(&dst->aliases, alias, next);
> +        }
> +    }
> +}
> +
>  static const QListEntry *qobject_input_push(QObjectInputVisitor *qiv,
>                                              const char *name,
>                                              QObject *obj, void *qapi)
> @@ -226,6 +310,9 @@ static const QListEntry *qobject_input_push(QObjectInputVisitor *qiv,
>              g_hash_table_insert(h, (void *)qdict_entry_key(entry), NULL);
>          }
>          tos->h = h;
> +        if (!QSLIST_EMPTY(&qiv->stack)) {
> +            propagate_aliases(tos, QSLIST_FIRST(&qiv->stack));
> +        }
>      } else {
>          assert(qlist);
>          tos->entry = qlist_first(qlist);
> @@ -257,10 +344,17 @@ static bool qobject_input_check_struct(Visitor *v, Error **errp)
>  
>  static void qobject_input_stack_object_free(StackObject *tos)
>  {
> +    InputVisitorAlias *a;
> +
>      if (tos->h) {
>          g_hash_table_unref(tos->h);
>      }
>  
> +    while ((a = QSLIST_FIRST(&tos->aliases))) {
> +        QSLIST_REMOVE_HEAD(&tos->aliases, next);
> +        g_free(a);
> +    }
> +
>      g_free(tos);
>  }
>  
> @@ -274,6 +368,54 @@ static void qobject_input_pop(Visitor *v, void **obj)
>      qobject_input_stack_object_free(tos);
>  }
>  
> +static void qobject_input_start_alias_scope(Visitor *v)
> +{
> +    QObjectInputVisitor *qiv = to_qiv(v);
> +    StackObject *tos = QSLIST_FIRST(&qiv->stack);
> +
> +    tos->alias_scope_nesting++;
> +}
> +
> +static void qobject_input_end_alias_scope(Visitor *v)
> +{
> +    QObjectInputVisitor *qiv = to_qiv(v);
> +    StackObject *tos = QSLIST_FIRST(&qiv->stack);
> +    InputVisitorAlias *a, *next;
> +
> +    assert(tos->alias_scope_nesting > 0);
> +    tos->alias_scope_nesting--;
> +
> +    QSLIST_FOREACH_SAFE(a, &tos->aliases, next, next) {
> +        if (a->scope_nesting > tos->alias_scope_nesting) {
> +            QSLIST_REMOVE(&tos->aliases, a, InputVisitorAlias, next);
> +            g_free(a);
> +        }
> +    }
> +}
> +
> +static void qobject_input_define_alias(Visitor *v, const char *name,
> +                                       const char **source)
> +{
> +    QObjectInputVisitor *qiv = to_qiv(v);
> +    StackObject *tos = QSLIST_FIRST(&qiv->stack);
> +    InputVisitorAlias *alias = g_new(InputVisitorAlias, 1);
> +
> +    /*
> +     * The source path can become empty during alias propagation for
> +     * wildcard aliases, but not when defining an alias (it would map
> +     * all names onto themselves, which doesn't make sense).
> +     */
> +    assert(source[0]);
> +
> +    *alias = (InputVisitorAlias) {
> +        .name       = name,
> +        .alias_so   = tos,
> +        .src        = source,
> +    };
> +
> +    QSLIST_INSERT_HEAD(&tos->aliases, alias, next);
> +}
> +
>  static bool qobject_input_start_struct(Visitor *v, const char *name, void **obj,
>                                         size_t size, Error **errp)
>  {
> @@ -696,6 +838,9 @@ static QObjectInputVisitor *qobject_input_visitor_base_new(QObject *obj)
>      v->visitor.end_list = qobject_input_end_list;
>      v->visitor.start_alternate = qobject_input_start_alternate;
>      v->visitor.optional = qobject_input_optional;
> +    v->visitor.define_alias = qobject_input_define_alias;
> +    v->visitor.start_alias_scope = qobject_input_start_alias_scope;
> +    v->visitor.end_alias_scope = qobject_input_end_alias_scope;
>      v->visitor.free = qobject_input_free;
>  
>      v->root = qobject_ref(obj);


