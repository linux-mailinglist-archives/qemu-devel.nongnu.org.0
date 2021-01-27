Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326DC305C80
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 14:08:28 +0100 (CET)
Received: from localhost ([::1]:58810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4kYd-0005v7-9s
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 08:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4kXE-0005V0-MB
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 08:07:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4kXD-0005ZC-2Y
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 08:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611752817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1DhGqstdB6An6U46ljUZ5GDaOan8o4THA4rWR0r5rz8=;
 b=XRvT6O9dj0O0WXkrCPgDx0qScI53KI+5849ozozPys7wFNHwnzJcgZS9Phb+r9mPR/PlDA
 3CFTVvdrH0gY2AoU6VSikJzPt/S7GI2U6JBHJlao6452/7I3kyPGk/tl08Ofo3I9bFyvae
 HwZQQ1oCxTcwwoFBWtbQS98T6xiw4rY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-9HScuOFbOHWewwBjlPw6ag-1; Wed, 27 Jan 2021 08:06:56 -0500
X-MC-Unique: 9HScuOFbOHWewwBjlPw6ag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60950192CC40
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 13:06:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F5A65C1C2;
 Wed, 27 Jan 2021 13:06:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ACB89113865F; Wed, 27 Jan 2021 14:06:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/6] qapi: Remember alias definitions in
 qobject-input-visitor
References: <20201112172850.401925-1-kwolf@redhat.com>
 <20201112172850.401925-3-kwolf@redhat.com>
Date: Wed, 27 Jan 2021 14:06:53 +0100
In-Reply-To: <20201112172850.401925-3-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 12 Nov 2020 18:28:46 +0100")
Message-ID: <87tur2plzm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

What does .alias = NULL, .src[] empty mean?

The previous patch's contract for visit_define_alias():

   /*
    * Defines a new alias rule.
    *
    * If @alias is non-NULL, the member named @alias in the external
    * representation of the current struct is defined as an alias for the
    * member described by @source.
    *
    * If @alias is NULL, all members of the struct described by @source are
    * considered to have alias members with the same key in the current
    * struct.
    *
    * @source is a NULL-terminated array of names that describe the path to
    * a member, starting from the currently visited struct.
    *
    * The alias stays valid until the current alias scope ends.
    * visit_start/end_struct() implicitly start/end an alias scope.
    * Additionally, visit_start/end_alias_scope() can be used to explicitly
    * create a nested alias scope.
    */

If I read this correctly, then empty .src[] denotes "the current
struct", and therefore .alias = NULL, .src[] empty means "all members of
the current struct are considered to have alias members with the same
key in the current struct".  Which is be a complicated way to accomplish
nothing.

Am I confused?

> +     */
> +    const char **src;
> +
> +    /* StackObject in which the alias should be looked for */
> +    struct StackObject *alias_so;

Clear as mud.  Is it "the current struct"?  If not, what else?  Perhaps
an example would help me understand.

> +
> +    /*
> +     * The alias remains valid as long as the containing StackObject has

What's "the containing StackObject"?  I guess it's the one that has this
InputVisitorAlias in .aliases.

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

I get what the comment means, but imperative mood is odd for a variable.
"Number of open scopes", perhaps?

> +
>      QSLIST_ENTRY(StackObject) node; /* parent */
>  } StackObject;
>  

I'm afraid I'm too confused about the interface (previous patch) and the
data structures to continue review with reasonable efficiency.  I don't
mean to imply either is bad!  I'm just confused, that's all.

[...]


