Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BC33D251E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 16:04:20 +0200 (CEST)
Received: from localhost ([::1]:54894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ZJD-0001WK-70
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 10:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6ZHp-0000pF-UK
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:02:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6ZHm-0007jm-Cp
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626962568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pCQaWANURdYNUrPAk9ADSUcB6E0e/RtADQKegLjRuVg=;
 b=QsLMHQIbQmmHo8nRe2LQftULgN0J4TjGCN3sGaHtVP3aIPJ/tuHZxhjjNuwPXWBaUmt//j
 5Ut09ojj8kc8DSjQrjijVzoiKYVXzCRdWAS1HNE1kdj23TCwLXD+GaqsujN/ctmWhdObHN
 +3WEztIFbcFqZxBW2GCVfGZ19F8JrFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-0TJLzaoeNSGnq4UGAK83nw-1; Thu, 22 Jul 2021 10:02:46 -0400
X-MC-Unique: 0TJLzaoeNSGnq4UGAK83nw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 987031084F54
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 14:02:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9E275C1D1;
 Thu, 22 Jul 2021 14:02:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5EA5011326B9; Thu, 22 Jul 2021 16:02:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] qapi: introduce forwarding visitor
References: <20210719104033.185109-1-pbonzini@redhat.com>
 <20210719104033.185109-2-pbonzini@redhat.com>
Date: Thu, 22 Jul 2021 16:02:34 +0200
In-Reply-To: <20210719104033.185109-2-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 19 Jul 2021 12:40:32 +0200")
Message-ID: <87v952fnut.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: imammedo@redhat.com, alex.williamson@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> This new adaptor visitor takes a single field of the adaptee, and exposes it
> with a different name.
>
> This will be used for QOM alias properties.  Alias targets can of course
> have a different name than the alias property itself (e.g. a machine's
> pflash0 might be an alias of a property named 'drive').  When the target's
> getter or setter invokes the visitor, it will use a different name than
> what the caller expects, and the visitor will not be able to find it
> (or will consume erroneously).
>
> The solution is for alias getters and setters to wrap the incoming
> visitor, and forward the sole field that the target is expecting while
> renaming it appropriately.

Double-checking: the other fields are not accessible via this visitor.
Correct?

>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qapi/forward-visitor.h    |  27 +++
>  qapi/meson.build                  |   1 +
>  qapi/qapi-forward-visitor.c       | 307 ++++++++++++++++++++++++++++++
>  tests/unit/meson.build            |   1 +
>  tests/unit/test-forward-visitor.c | 165 ++++++++++++++++
>  5 files changed, 501 insertions(+)
>  create mode 100644 include/qapi/forward-visitor.h
>  create mode 100644 qapi/qapi-forward-visitor.c
>  create mode 100644 tests/unit/test-forward-visitor.c

Missing: update of the big comment in include/qapi/visitor.h.  Can be
done on top.

>
> diff --git a/include/qapi/forward-visitor.h b/include/qapi/forward-visitor.h
> new file mode 100644
> index 0000000000..c7002d53e6
> --- /dev/null
> +++ b/include/qapi/forward-visitor.h
> @@ -0,0 +1,27 @@
> +/*
> + * Forwarding visitor
> + *
> + * Copyright Red Hat, Inc. 2021
> + *
> + * Author: Paolo Bonzini <pbonzini@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
> + * See the COPYING.LIB file in the top-level directory.
> + *
> + */
> +
> +#ifndef FORWARD_VISITOR_H
> +#define FORWARD_VISITOR_H
> +
> +#include "qapi/visitor.h"
> +
> +typedef struct ForwardFieldVisitor ForwardFieldVisitor;
> +
> +/*
> + * The forwarding visitor only expects a single name, @from, to be passed for
> + * toplevel fields.  It is converted to @to and forward to the @target visitor.
> + * Calls within a struct are forwarded without changing the name.
> + */
> +Visitor *visitor_forward_field(Visitor *target, const char *from, const char *to);
> +
> +#endif
> diff --git a/qapi/meson.build b/qapi/meson.build
> index 376f4ceafe..c356a385e3 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -2,6 +2,7 @@ util_ss.add(files(
>    'opts-visitor.c',
>    'qapi-clone-visitor.c',
>    'qapi-dealloc-visitor.c',
> +  'qapi-forward-visitor.c',
>    'qapi-util.c',
>    'qapi-visit-core.c',
>    'qobject-input-visitor.c',
> diff --git a/qapi/qapi-forward-visitor.c b/qapi/qapi-forward-visitor.c
> new file mode 100644
> index 0000000000..bc6412d52e
> --- /dev/null
> +++ b/qapi/qapi-forward-visitor.c
> @@ -0,0 +1,307 @@
> +/*
> + * Forward Visitor
> + *
> + * Copyright (C) 2021 Red Hat, Inc.
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
> + * See the COPYING.LIB file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include <math.h>
> +#include "qapi/compat-policy.h"
> +#include "qapi/error.h"
> +#include "qapi/forward-visitor.h"
> +#include "qapi/visitor-impl.h"
> +#include "qemu/queue.h"
> +#include "qapi/qmp/qjson.h"
> +#include "qapi/qmp/qbool.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qerror.h"
> +#include "qapi/qmp/qlist.h"
> +#include "qapi/qmp/qnull.h"
> +#include "qapi/qmp/qnum.h"
> +#include "qapi/qmp/qstring.h"
> +#include "qemu/cutils.h"
> +#include "qemu/option.h"
> +
> +struct ForwardFieldVisitor {
> +    Visitor visitor;
> +
> +    Visitor *target;
> +    char *from;
> +    char *to;
> +
> +    int depth;
> +};

Comment the members?  In particular @depth.

> +
> +static ForwardFieldVisitor *to_ffv(Visitor *v)
> +{
> +    return container_of(v, ForwardFieldVisitor, visitor);
> +}
> +
> +static bool forward_field_translate_name(ForwardFieldVisitor *v, const char **name,
> +                                         Error **errp)
> +{
> +    if (v->depth) {
> +        return true;
> +    }

Succeed when we're in a sub-struct.

> +    if (g_str_equal(*name, v->from)) {
> +        *name = v->to;
> +        return true;
> +    }

Succeed when we're in the root struct and @name is the alias name.
Replace the alias name by the real one.

> +    error_setg(errp, QERR_MISSING_PARAMETER, *name);
> +    return false;

Fail when we're in the root struct and @name is not the alias name.

> +}

Can you explain why you treat names in sub-structs differently than
names other than the alias name in the root struct?

> +
> +static bool forward_field_check_struct(Visitor *v, Error **errp)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);

Humor me: blank line between declarations and statements.

> +    return visit_check_struct(ffv->target, errp);
> +}
> +
> +static bool forward_field_start_struct(Visitor *v, const char *name, void **obj,
> +                                       size_t size, Error **errp)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    if (!forward_field_translate_name(ffv, &name, errp)) {
> +        return false;
> +    }
> +    if (!visit_start_struct(ffv->target, name, obj, size, errp)) {
> +        return false;
> +    }
> +    ffv->depth++;
> +    return true;
> +}
> +
> +static void forward_field_end_struct(Visitor *v, void **obj)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);

Humor me: blank line between declarations and statements.

> +    assert(ffv->depth);
> +    ffv->depth--;
> +    visit_end_struct(ffv->target, obj);
> +}
> +
> +static bool forward_field_start_list(Visitor *v, const char *name,
> +                                     GenericList **list, size_t size,
> +                                     Error **errp)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    if (!forward_field_translate_name(ffv, &name, errp)) {
> +        return false;
> +    }
> +    ffv->depth++;
> +    return visit_start_list(ffv->target, name, list, size, errp);
> +}
> +
> +static GenericList *forward_field_next_list(Visitor *v, GenericList *tail,
> +                                            size_t size)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    assert(ffv->depth);
> +    return visit_next_list(ffv->target, tail, size);
> +}
> +
> +static bool forward_field_check_list(Visitor *v, Error **errp)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    assert(ffv->depth);
> +    return visit_check_list(ffv->target, errp);
> +}
> +
> +static void forward_field_end_list(Visitor *v, void **obj)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    assert(ffv->depth);
> +    ffv->depth--;
> +    visit_end_list(ffv->target, obj);
> +}
> +
> +static bool forward_field_start_alternate(Visitor *v, const char *name,
> +                                          GenericAlternate **obj, size_t size,
> +                                          Error **errp)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    if (!forward_field_translate_name(ffv, &name, errp)) {
> +        return false;
> +    }
> +    /*
> +     * The name of alternates is reused when accessing the content,
> +     * so do not increase depth here.
> +     */

I understand why you don't increase @depth here (same reason
qobject-input-visitor.c doesn't qobject_input_push() here).  I don't
understand the comment :)

> +    return visit_start_alternate(ffv->target, name, obj, size, errp);
> +}
> +
> +static void forward_field_end_alternate(Visitor *v, void **obj)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    visit_end_alternate(ffv->target, obj);
> +}
> +
> +static bool forward_field_type_int64(Visitor *v, const char *name, int64_t *obj,
> +                                     Error **errp)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    if (!forward_field_translate_name(ffv, &name, errp)) {
> +        return false;
> +    }
> +    return visit_type_int64(ffv->target, name, obj, errp);
> +}
> +
> +static bool forward_field_type_uint64(Visitor *v, const char *name,
> +                                      uint64_t *obj, Error **errp)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    if (!forward_field_translate_name(ffv, &name, errp)) {
> +        return false;
> +    }
> +    return visit_type_uint64(ffv->target, name, obj, errp);
> +}
> +
> +static bool forward_field_type_bool(Visitor *v, const char *name, bool *obj,
> +                                    Error **errp)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    if (!forward_field_translate_name(ffv, &name, errp)) {
> +        return false;
> +    }
> +    return visit_type_bool(ffv->target, name, obj, errp);
> +}
> +
> +static bool forward_field_type_str(Visitor *v, const char *name, char **obj,
> +                                   Error **errp)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    if (!forward_field_translate_name(ffv, &name, errp)) {
> +        return false;
> +    }
> +    return visit_type_str(ffv->target, name, obj, errp);
> +}
> +
> +static bool forward_field_type_number(Visitor *v, const char *name, double *obj,
> +                                      Error **errp)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    if (!forward_field_translate_name(ffv, &name, errp)) {
> +        return false;
> +    }
> +    return visit_type_number(ffv->target, name, obj, errp);
> +}
> +
> +static bool forward_field_type_any(Visitor *v, const char *name, QObject **obj,
> +                                   Error **errp)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    if (!forward_field_translate_name(ffv, &name, errp)) {
> +        return false;
> +    }
> +    return visit_type_any(ffv->target, name, obj, errp);
> +}
> +
> +static bool forward_field_type_null(Visitor *v, const char *name,
> +                                    QNull **obj, Error **errp)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    if (!forward_field_translate_name(ffv, &name, errp)) {
> +        return false;
> +    }
> +    return visit_type_null(ffv->target, name, obj, errp);
> +}
> +
> +static void forward_field_optional(Visitor *v, const char *name, bool *present)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    if (!forward_field_translate_name(ffv, &name, NULL)) {
> +        *present = false;
> +        return;
> +    }
> +    visit_optional(ffv->target, name, present);
> +}
> +
> +static bool forward_field_deprecated_accept(Visitor *v, const char *name,
> +                                            Error **errp)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    if (!forward_field_translate_name(ffv, &name, errp)) {
> +        return false;
> +    }
> +    return visit_deprecated_accept(ffv->target, name, errp);
> +}
> +
> +static bool forward_field_deprecated(Visitor *v, const char *name)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    if (!forward_field_translate_name(ffv, &name, NULL)) {
> +        return false;
> +    }
> +    return visit_deprecated(ffv->target, name);
> +}
> +
> +static void forward_field_complete(Visitor *v, void *opaque)
> +{
> +    /*
> +     * Do nothing, the complete method will be called at due time
> +     * on the target visitor.
> +     */
> +}

Pattern:

* Always forward to the wrapped visitor.

* If the method takes a name, massage it with
  forward_field_translate_name() first, which can fail.

In addition, track .depth.

Loads of code, mostly boring.

> +
> +static void forward_field_free(Visitor *v)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    g_free(ffv->from);
> +    g_free(ffv->to);
> +    g_free(ffv);
> +}
> +
> +Visitor *visitor_forward_field(Visitor *target, const char *from, const char *to)
> +{
> +    ForwardFieldVisitor *v = g_new0(ForwardFieldVisitor, 1);
> +
> +    v->visitor.type = target->type;

Do arbitrary types work?  Or is this limited to input and output
visitors?

> +    v->visitor.start_struct = forward_field_start_struct;
> +    v->visitor.check_struct = forward_field_check_struct;
> +    v->visitor.end_struct = forward_field_end_struct;
> +    v->visitor.start_list = forward_field_start_list;
> +    v->visitor.next_list = forward_field_next_list;
> +    v->visitor.check_list = forward_field_check_list;
> +    v->visitor.end_list = forward_field_end_list;
> +    v->visitor.start_alternate = forward_field_start_alternate;
> +    v->visitor.end_alternate = forward_field_end_alternate;
> +    v->visitor.optional = forward_field_optional;
> +    v->visitor.deprecated_accept = forward_field_deprecated_accept;
> +    v->visitor.deprecated = forward_field_deprecated;
> +    v->visitor.free = forward_field_free;
> +    v->visitor.type_int64 = forward_field_type_int64;
> +    v->visitor.type_uint64 = forward_field_type_uint64;
> +    v->visitor.type_bool = forward_field_type_bool;
> +    v->visitor.type_str = forward_field_type_str;
> +    v->visitor.type_number = forward_field_type_number;
> +    v->visitor.type_any = forward_field_type_any;
> +    v->visitor.type_null = forward_field_type_null;
> +    v->visitor.complete = forward_field_complete;

This is almost in the order of visitor-impl.h.  May I have it in the
exact order?

Not forwarded: method .type_size().  Impact: visit_type_size() will call
the wrapped visitor's .type_uint64() instead of its .type_size().  The
two differ for the opts visitor, the keyval input visitor, the string
input visitor, and the string output visitor.

Please fix, or document as restriction; your choice.

Your tests don't cover this.  Observation, not demand.

> +
> +    v->target = target;
> +    v->from = g_strdup(from);
> +    v->to = g_strdup(to);
> +
> +    return &v->visitor;
> +}

[Tests snipped, -ENOTIME...]


