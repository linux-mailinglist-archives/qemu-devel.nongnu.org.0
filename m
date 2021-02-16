Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D591831CA3C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:57:29 +0100 (CET)
Received: from localhost ([::1]:36312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lByyu-0005st-Vr
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:57:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lByxb-0005Rq-Pa
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:56:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lByxa-0003AW-1u
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613476565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y+aiUnZZB5VKY7nVAuWiAx6D0/G+qr02ES09xbBr7v4=;
 b=i2l08SH2UddMsFJWROdXry74+Tsl5AiXgXwbo4R3AAFAp5AJV7jCOYv6BbRfflPWileLiC
 bYohvc0gpgkkERqhFAzHUE8Iw4S6EyZlqNqa1xqcacr80I0MTkKWWqADAIoaIh+X0d8w1X
 CO9/BIToXPvGgCQQ5gvu82FZZb/qViM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-qvHCIccfNKe4Ekq-VxZ-wQ-1; Tue, 16 Feb 2021 06:56:03 -0500
X-MC-Unique: qvHCIccfNKe4Ekq-VxZ-wQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2A1A108C309
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 11:56:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-100.ams2.redhat.com
 [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CD1B10016FA;
 Tue, 16 Feb 2021 11:56:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DB29D113865F; Tue, 16 Feb 2021 12:56:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 1/6] qapi: Add interfaces for alias support to Visitor
References: <20210211183118.422036-1-kwolf@redhat.com>
 <20210211183118.422036-2-kwolf@redhat.com>
Date: Tue, 16 Feb 2021 12:56:00 +0100
In-Reply-To: <20210211183118.422036-2-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 11 Feb 2021 19:31:13 +0100")
Message-ID: <874kicmdkf.fsf@dusky.pond.sub.org>
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

> This adds functions to the Visitor interface that can be used to define
> aliases and alias scopes.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/qapi/visitor-impl.h | 12 ++++++++++
>  include/qapi/visitor.h      | 44 +++++++++++++++++++++++++++++++++++++
>  qapi/qapi-visit-core.c      | 22 +++++++++++++++++++
>  3 files changed, 78 insertions(+)
>
> diff --git a/include/qapi/visitor-impl.h b/include/qapi/visitor-impl.h
> index 7362c043be..d9a6874528 100644
> --- a/include/qapi/visitor-impl.h
> +++ b/include/qapi/visitor-impl.h
> @@ -113,6 +113,18 @@ struct Visitor
>         The core takes care of the return type in the public interface. */
>      void (*optional)(Visitor *v, const char *name, bool *present);
>  
> +    /*
> +     * Optional; intended for input visitors. If not given, aliases are
> +     * ignored.
> +     */
> +    void (*define_alias)(Visitor *v, const char *name, const char **source);
> +
> +    /* Must be set if define_alias is set */
> +    void (*start_alias_scope)(Visitor *v);
> +
> +    /* Must be set if define_alias is set */
> +    void (*end_alias_scope)(Visitor *v);
> +
>      /* Must be set */
>      VisitorType type;
>  
> diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
> index ebc19ede7f..2ecbc20624 100644
> --- a/include/qapi/visitor.h
> +++ b/include/qapi/visitor.h

Still missing: an update of the big comment.  That's okay, we can do
that last.

> @@ -459,6 +459,50 @@ void visit_end_alternate(Visitor *v, void **obj);
>   */
>  bool visit_optional(Visitor *v, const char *name, bool *present);
>  
> +/*
> + * Defines a new alias rule.
> + *
> + * If @name is non-NULL, the member called @name in the external
> + * representation of the currently visited object is defined as an
> + * alias for the member described by @source.  It is not allowed to
> + * call this function when the currently visited type is not an
> + * object.
> + *
> + * If @name is NULL, all members of the object described by @source
> + * are considered to have alias members with the same key in the
> + * currently visited object.
> + *
> + * @source is a NULL-terminated non-empty array of names that describe
> + * the path to a member, starting from the currently visited object.
> + * All elements in @source except the last one should describe
> + * objects.  If an intermediate element refers to a member with a
> + * non-object type, the alias won't work (this case can legitimately
> + * happen in unions where an alias only makes sense for one branch,
> + * but not for another).

A sufficiently paranoid reader will now realize that the system won't
catch mistakes.  I'm not objecting to that; I understand distinguishing
aliases that may work (just not now) from aliases that can't work is
non-trivial and quite probably not worth it.  I'm just wondering whether
we should be even more explicit, to help insufficiently paranoid
readers.

Here's a possible argument against: we expect this function to be used
only by generated code, and the maintainers of the generator are
expected to be sufficiently paranoid.

The same issue might exist in qapi-code-gen.txt.

> + *
> + * The alias stays valid until the current alias scope ends.
> + * visit_start/end_struct() implicitly start/end an alias scope.
> + * Additionally, visit_start/end_alias_scope() can be used to explicitly
> + * create a nested alias scope.
> + */
> +void visit_define_alias(Visitor *v, const char *name, const char **source);
> +
> +/*
> + * Begins an explicit alias scope.
> + *
> + * Alias definitions after here will only stay valid until the
> + * corresponding visit_end_alias_scope() is called.
> + */
> +void visit_start_alias_scope(Visitor *v);
> +
> +/*
> + * Ends an explicit alias scope.
> + *
> + * Alias definitions between the correspoding visit_start_alias_scope()
> + * call and here go out of scope and won't apply in later code any more.
> + */
> +void visit_end_alias_scope(Visitor *v);
> +
>  /*
>   * Visit an enum value.
>   *
> diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
> index 7e5f40e7f0..651dd88e02 100644
> --- a/qapi/qapi-visit-core.c
> +++ b/qapi/qapi-visit-core.c
> @@ -135,6 +135,28 @@ bool visit_optional(Visitor *v, const char *name, bool *present)
>      return *present;
>  }
>  
> +void visit_define_alias(Visitor *v, const char *name, const char **source)
> +{
> +    assert(source[0] != NULL);
> +    if (v->define_alias) {
> +        v->define_alias(v, name, source);
> +    }
> +}
> +
> +void visit_start_alias_scope(Visitor *v)
> +{
> +    if (v->start_alias_scope) {
> +        v->start_alias_scope(v);
> +    }
> +}
> +
> +void visit_end_alias_scope(Visitor *v)
> +{
> +    if (v->end_alias_scope) {
> +        v->end_alias_scope(v);
> +    }
> +}
> +
>  bool visit_is_input(Visitor *v)
>  {
>      return v->type == VISITOR_INPUT;


