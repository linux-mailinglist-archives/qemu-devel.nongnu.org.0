Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4619C314F97
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 13:59:03 +0100 (CET)
Received: from localhost ([::1]:36502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Sbe-0004bA-Ax
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 07:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9Sa7-0003iv-Ku
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 07:57:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9Sa2-0006mB-Kp
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 07:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612875439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l14VMiB6c/BjemUCRxmVCpDKN09KPp4ACDu5DXvfjIw=;
 b=PUwLZDVOivJn1V5QIcdtLzGesXZgV7W0FRZzy5qF8Mr+OVH3RZpUU88P6tIXsUjHHsJ7Xk
 5uWevZHU/rGqXz0O/8a9V9O6/ifNLFUy/M4SEdH3jY0JDa1Ee9I5c3CyTT/32syFgyLmmH
 K+AduXIQ6OWRTI0P0jH67kSgEMcIQ0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-3Uae16YCMmKa5OlHDpgs_A-1; Tue, 09 Feb 2021 07:57:17 -0500
X-MC-Unique: 3Uae16YCMmKa5OlHDpgs_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBDFB8030B7
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 12:57:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 886667770C;
 Tue,  9 Feb 2021 12:57:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1CD1F113865F; Tue,  9 Feb 2021 13:57:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/6] qapi: Remember alias definitions in
 qobject-input-visitor
References: <20201112172850.401925-1-kwolf@redhat.com>
 <20201112172850.401925-3-kwolf@redhat.com>
Date: Tue, 09 Feb 2021 13:57:15 +0100
In-Reply-To: <20201112172850.401925-3-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 12 Nov 2020 18:28:46 +0100")
Message-ID: <87sg65pff8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Let me look at the actual code now Kevin reduced my confusion about the
interface and the data structures.

Kevin Wolf <kwolf@redhat.com> writes:

> This makes qobject-input-visitor remember the currently valid aliases in
> each StackObject. It doesn't actually allow using the aliases yet.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qobject-input-visitor.c | 115 +++++++++++++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>
> diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
> index 23843b242e..a00ac32682 100644
> --- a/qapi/qobject-input-visitor.c
> +++ b/qapi/qobject-input-visitor.c
> @@ -29,6 +29,29 @@
>  #include "qemu/cutils.h"
>  #include "qemu/option.h"
>  
> +typedef struct InputVisitorAlias {
> +   /* Alias name. NULL for any (wildcard alias). */
> +    const char *alias;
> +
> +    /*
> +     * NULL terminated array representing a path.
> +     * Must contain at least one non-NULL element if alias is not NULL.
> +     */
> +    const char **src;
> +
> +    /* StackObject in which the alias should be looked for */
> +    struct StackObject *alias_so;
> +
> +    /*
> +     * The alias remains valid as long as the containing StackObject has
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
> @@ -38,6 +61,9 @@ typedef struct StackObject {
>      const QListEntry *entry;    /* If @obj is QList: unvisited tail */
>      unsigned index;             /* If @obj is QList: list index of @entry */
>  
> +    QSLIST_HEAD(, InputVisitorAlias) aliases;
> +    int alias_scope_nesting;    /* Increase on scope start, decrease on end */
> +
>      QSLIST_ENTRY(StackObject) node; /* parent */
>  } StackObject;
>  
> @@ -203,6 +229,38 @@ static const char *qobject_input_get_keyval(QObjectInputVisitor *qiv,
>      return qstring_get_str(qstr);
>  }
>  
> +/*
> + * Propagates aliases from the parent StackObject @src to its direct
> + * child StackObject @dst, which is representing the child struct @name.

@name must equal dst->name, I think.  Drop the parameter?

> + *
> + * Every alias whose source path begins with @name and which still
> + * applies in @dst (i.e. it is either a wildcard alias or has at least
> + * one more source path element) is propagated to @dst with the first

I'm not sure I get the parenthesis.  Perhaps the code will enlighten me.

> + * element (i.e. @name) removed from the source path.
> + */
> +static void propagate_aliases(StackObject *dst, StackObject *src,
> +                              const char *name)
> +{
> +    InputVisitorAlias *a;
> +
> +    QSLIST_FOREACH(a, &src->aliases, next) {
> +        if (!a->src[0] || strcmp(a->src[0], name)) {
> +            continue;
> +        }

We only look at the aliases that apply to @dst or below.  They do only
when ->src[0] equals dst->name.  Makes sense.

> +        if (a->src[1] || !a->alias) {

If a->src[1], the alias applies below @dst, not to @dst.  To get it to
the place where it applies, we first need to propagate to @dst.

Else, the alias applies to @dst.  If !a->alias, we're looking at a
wildcard alias, i.e. all members of the object described by @dst are
aliased.  Why do we need to propagate only wildcard aliases to @dst?

> +            InputVisitorAlias *alias = g_new(InputVisitorAlias, 1);
> +
> +            *alias = (InputVisitorAlias) {
> +                .alias      = a->alias,
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
> @@ -226,6 +284,9 @@ static const QListEntry *qobject_input_push(QObjectInputVisitor *qiv,
>              g_hash_table_insert(h, (void *)qdict_entry_key(entry), NULL);
>          }
>          tos->h = h;
> +        if (!QSLIST_EMPTY(&qiv->stack)) {
> +            propagate_aliases(tos, QSLIST_FIRST(&qiv->stack), name);
> +        }

What if QSLIST_EMPTY(&qiv->stack) and tos->aliases contains aliases that
apply deeper?

>      } else {
>          assert(qlist);
>          tos->entry = qlist_first(qlist);
> @@ -257,10 +318,17 @@ static bool qobject_input_check_struct(Visitor *v, Error **errp)
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
> @@ -274,6 +342,50 @@ static void qobject_input_pop(Visitor *v, void **obj)
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
> +static void qobject_input_define_alias(Visitor *v, const char *alias_name,
> +                                       const char **source)
> +{
> +    QObjectInputVisitor *qiv = to_qiv(v);
> +    StackObject *tos = QSLIST_FIRST(&qiv->stack);
> +    InputVisitorAlias *alias = g_new(InputVisitorAlias, 1);
> +
> +    /* The source path can only be empty for wildcard aliases */
> +    assert(source[0] || !alias_name);

Possibly related: the "What does .alias = NULL, .src[] empty mean?" we
discussed previously.

> +
> +    *alias = (InputVisitorAlias) {
> +        .alias      = alias_name,
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
> @@ -696,6 +808,9 @@ static QObjectInputVisitor *qobject_input_visitor_base_new(QObject *obj)
>      v->visitor.end_list = qobject_input_end_list;
>      v->visitor.start_alternate = qobject_input_start_alternate;
>      v->visitor.optional = qobject_input_optional;
> +    v->visitor.define_alias = qobject_input_define_alias;
> +    v->visitor.start_alias_scope = qobject_input_start_alias_scope;
> +    v->visitor.end_alias_scope = qobject_input_end_alias_scope;
>      v->visitor.free = qobject_input_free;
>  
>      v->root = qobject_ref(obj);


