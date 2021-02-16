Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E116531CA85
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 13:24:21 +0100 (CET)
Received: from localhost ([::1]:45138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBzOu-0005tO-VI
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 07:24:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBzNb-0005Ip-DB
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 07:22:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBzNY-0006q7-VO
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 07:22:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613478174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rIrYnqA45fbMO/a0qhPxwQuQVIvgdY5GCAzB1nObFd0=;
 b=hTZ6PWj9FmFWruu4EIbuAi7ir07G+Razdxd4bIGuTnFir4aI5KAjojLlHWqw49F5JHvJDe
 p8jD4PSI18S+8qtSuVcyfLI76WVI5k8AR9NJROzxGIiyPJ4tct230UWvfri/1PPfMmCuZo
 MhurxJdtbSMd2nFzeOfJJFThV+8fjhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-SV9LISWsMyKV-PlmnJ_XOQ-1; Tue, 16 Feb 2021 07:22:53 -0500
X-MC-Unique: SV9LISWsMyKV-PlmnJ_XOQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87BE8EC1A1
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 12:22:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-100.ams2.redhat.com
 [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31B3E10016F0;
 Tue, 16 Feb 2021 12:22:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B5C79113865F; Tue, 16 Feb 2021 13:22:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 3/6] qapi: Simplify full_name_nth() in
 qobject-input-visitor
References: <20210211183118.422036-1-kwolf@redhat.com>
 <20210211183118.422036-4-kwolf@redhat.com>
Date: Tue, 16 Feb 2021 13:22:50 +0100
In-Reply-To: <20210211183118.422036-4-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 11 Feb 2021 19:31:15 +0100")
Message-ID: <87czx0urqd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

> Instead of counting how many elements from the top of the stack we need
> to ignore until we find the thing we're interested in, we can just
> directly pass the StackObject pointer because all callers already know
> it.
>
> We only need a different way now to tell if we want to know the name of
> something contained in the given StackObject or of the StackObject
> itself. Passing name = NULL is the obvious way to request the latter.

Is the last sentence still accurate?

> This simplifies the interface and makes it easier to use in cases where
> we have the StackObject, but don't know how many steps down the stack it
> is.

No such case exists, but the next patch adds one.  Correct?

> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qobject-input-visitor.c | 43 ++++++++++++++++++++----------------
>  1 file changed, 24 insertions(+), 19 deletions(-)
>
> diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
> index aa95cd49bd..dd04ef0027 100644
> --- a/qapi/qobject-input-visitor.c
> +++ b/qapi/qobject-input-visitor.c
> @@ -108,20 +108,20 @@ static QObjectInputVisitor *to_qiv(Visitor *v)
>  }
>  
>  /*
> - * Find the full name of something @qiv is currently visiting.
> - * @qiv is visiting something named @name in the stack of containers
> - * @qiv->stack.
> - * If @n is zero, return its full name.
> - * If @n is positive, return the full name of the @n-th container
> - * counting from the top.  The stack of containers must have at least
> - * @n elements.
> - * The returned string is valid until the next full_name_nth(@v) or
> - * destruction of @v.
> + * Find the full name of a member in @so which @qiv is currently
> + * visiting.  If the currently visited thing is an object, @name is
> + * the (local) name of the member to describe.  If it is a list, @name
> + * is ignored and the current index (so->index) is included.
> + *
> + * If @skip_member is true, find the full name of @so itself instead.
> + * @name must be NULL then.
> + *
> + * The returned string is valid until the next full_name_so(@qiv) or
> + * destruction of @qiv.
>   */
> -static const char *full_name_nth(QObjectInputVisitor *qiv, const char *name,
> -                                 int n)
> +static const char *full_name_so(QObjectInputVisitor *qiv, const char *name,
> +                                bool skip_member, StackObject *so)
>  {
> -    StackObject *so;
>      char buf[32];
>  
>      if (qiv->errname) {
> @@ -130,10 +130,14 @@ static const char *full_name_nth(QObjectInputVisitor *qiv, const char *name,
>          qiv->errname = g_string_new("");
>      }
>  
> -    QSLIST_FOREACH(so , &qiv->stack, node) {
> -        if (n) {
> -            n--;
> -        } else if (qobject_type(so->obj) == QTYPE_QDICT) {
> +    if (skip_member && so) {
> +        assert(name == NULL);
> +        name = so->name;
> +        so = QSLIST_NEXT(so, node);
> +    }
> +
> +    for (; so; so = QSLIST_NEXT(so, node)) {
> +        if (qobject_type(so->obj) == QTYPE_QDICT) {
>              g_string_prepend(qiv->errname, name ?: "<anonymous>");
>              g_string_prepend_c(qiv->errname, '.');
>          } else {
> @@ -144,7 +148,6 @@ static const char *full_name_nth(QObjectInputVisitor *qiv, const char *name,
>          }
>          name = so->name;
>      }
> -    assert(!n);
>  
>      if (name) {
>          g_string_prepend(qiv->errname, name);
> @@ -159,7 +162,9 @@ static const char *full_name_nth(QObjectInputVisitor *qiv, const char *name,
>  
>  static const char *full_name(QObjectInputVisitor *qiv, const char *name)
>  {
> -    return full_name_nth(qiv, name, 0);
> +    StackObject *tos = QSLIST_FIRST(&qiv->stack);
> +
> +    return full_name_so(qiv, name, false, tos);
>  }
>  
>  static QObject *qobject_input_try_get_object(QObjectInputVisitor *qiv,
> @@ -503,7 +508,7 @@ static bool qobject_input_check_list(Visitor *v, Error **errp)
>  
>      if (tos->entry) {
>          error_setg(errp, "Only %u list elements expected in %s",
> -                   tos->index + 1, full_name_nth(qiv, NULL, 1));
> +                   tos->index + 1, full_name_so(qiv, NULL, true, tos));
>          return false;
>      }
>      return true;


