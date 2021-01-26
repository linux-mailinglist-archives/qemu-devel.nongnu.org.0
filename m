Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F86304357
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:03:35 +0100 (CET)
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4QoY-0004nA-4L
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4QkS-0001Ml-7w
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:59:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4QkO-0006Mp-AP
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611676754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EuLpG83X4YcmT03Xlq373jCrydEayHS3uPb67xotV+A=;
 b=Q3oYjaEM+6wfDbwmgdEkqxRkqcLAxV5kBFMAJELEbJlRCPP2doB91wWg2c4BrHH6Rvs8fZ
 q8wCfHTFbWBQqYWy/ufS1Jz5+BMTvmyVrTSVwottViSySWiKR/6DTOCAmLGpCpcWEBc79I
 4J5tXKclmtIqRW5+Bq2lOukfLnf8LVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-CnqEc6BIPReS6HVJiqWYIQ-1; Tue, 26 Jan 2021 10:59:12 -0500
X-MC-Unique: CnqEc6BIPReS6HVJiqWYIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A67A801AB8
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 15:59:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 445C960C5F;
 Tue, 26 Jan 2021 15:59:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C3065113865F; Tue, 26 Jan 2021 16:59:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/6] qapi: Add interfaces for alias support to Visitor
References: <20201112172850.401925-1-kwolf@redhat.com>
 <20201112172850.401925-2-kwolf@redhat.com>
Date: Tue, 26 Jan 2021 16:59:09 +0100
In-Reply-To: <20201112172850.401925-2-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 12 Nov 2020 18:28:45 +0100")
Message-ID: <87wnvz1ygi.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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

Kevin Wolf <kwolf@redhat.com> writes:

> This adds functions to the Visitor interface that can be used to define
> aliases and alias scopes.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/qapi/visitor-impl.h | 12 ++++++++++++
>  include/qapi/visitor.h      | 37 +++++++++++++++++++++++++++++++++++++
>  qapi/qapi-visit-core.c      | 21 +++++++++++++++++++++
>  3 files changed, 70 insertions(+)
>
> diff --git a/include/qapi/visitor-impl.h b/include/qapi/visitor-impl.h
> index 7362c043be..e30da2599c 100644
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
> +    void (*define_alias)(Visitor *v, const char *alias, const char **source);
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
> index ebc19ede7f..9bdc0ee03d 100644
> --- a/include/qapi/visitor.h
> +++ b/include/qapi/visitor.h
> @@ -459,6 +459,43 @@ void visit_end_alternate(Visitor *v, void **obj);
>   */
>  bool visit_optional(Visitor *v, const char *name, bool *present);
>  
> +/*
> + * Defines a new alias rule.
> + *
> + * If @alias is non-NULL, the member named @alias in the external
> + * representation of the current struct is defined as an alias for the
> + * member described by @source.
> + *
> + * If @alias is NULL, all members of the struct described by @source are
> + * considered to have alias members with the same key in the current
> + * struct.
> + *
> + * @source is a NULL-terminated array of names that describe the path to
> + * a member, starting from the currently visited struct.
> + *
> + * The alias stays valid until the current alias scope ends.
> + * visit_start/end_struct() implicitly start/end an alias scope.
> + * Additionally, visit_start/end_alias_scope() can be used to explicitly
> + * create a nested alias scope.
> + */
> +void visit_define_alias(Visitor *v, const char *alias, const char **source);
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
> index 7e5f40e7f0..719a9f5da2 100644
> --- a/qapi/qapi-visit-core.c
> +++ b/qapi/qapi-visit-core.c
> @@ -135,6 +135,27 @@ bool visit_optional(Visitor *v, const char *name, bool *present)
>      return *present;
>  }
>  
> +void visit_define_alias(Visitor *v, const char *alias, const char **source)
> +{
> +    if (v->define_alias) {
> +        v->define_alias(v, alias, source);
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

The code is trivial and neat, the contracts look fine.  What I'm missing
is "why do we want this", and "how should it be used".  The cover letter
gives me a (somewhat vague) idea on the former, but on the latter, I can
only guess.  I trust it'll become clear later in this series.

I think updating the big comment in visitor.h for aliases would help.
Let's postpone it until I've seen the rest of the series.


