Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC860429728
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 20:55:38 +0200 (CEST)
Received: from localhost ([::1]:57384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma0SX-0005Pz-Ti
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 14:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma0Qu-00044K-1H
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:53:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma0Qs-00053p-D7
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:53:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633978433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JRc58L3qk72K7uvWT4eFfiPx5Vl14k499IndLBGyNCw=;
 b=I99O09Aa2FkMwb+Mu2GCXiSqZ0NcpClnu4OqbgufTzXD5TtxG5bqdpfi7WTyQmDCMRHAJU
 T57oODziOsgDtpKfJgPXCO7Oq0yqEpNKX0LICH0aCWqbWZil3jjLyolddUprFUCoHAvmG4
 gY6tG0S3AME8roIFnIiSFHpIxhire80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-fgbfv7AXO72GuGmRonTa2A-1; Mon, 11 Oct 2021 14:53:50 -0400
X-MC-Unique: fgbfv7AXO72GuGmRonTa2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 189111B2C981;
 Mon, 11 Oct 2021 18:53:49 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A99960938;
 Mon, 11 Oct 2021 18:53:25 +0000 (UTC)
Date: Mon, 11 Oct 2021 13:53:23 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 4/5] qapi: Implement deprecated-input={reject,crash}
 for enum values
Message-ID: <20211011185323.ajhqe4qyvvi3bke4@redhat.com>
References: <20211009120944.2858887-1-armbru@redhat.com>
 <20211009120944.2858887-5-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211009120944.2858887-5-armbru@redhat.com>
User-Agent: NeoMutt/20210205-852-339c0c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 libvir-list@redhat.com, qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 09, 2021 at 02:09:43PM +0200, Markus Armbruster wrote:
> This copies the code implementing the policy from qapi/qmp-dispatch.c
> to qapi/qobject-input-visitor.c.  Tolerable, but if we acquire more
> copes, we should look into factoring them out.

copies

> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/devel/qapi-code-gen.rst |  6 ++++--
>  qapi/compat.json             |  3 ++-
>  include/qapi/util.h          |  6 +++++-
>  qapi/qapi-visit-core.c       | 18 +++++++++++++++---
>  scripts/qapi/types.py        | 17 ++++++++++++++++-
>  5 files changed, 42 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index 00334e9fb8..006a6f4a9a 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -708,8 +708,10 @@ QEMU shows a certain behaviour.
>  Special features
>  ~~~~~~~~~~~~~~~~
>  
> -Feature "deprecated" marks a command, event, or struct member as
> -deprecated.  It is not supported elsewhere so far.
> +Feature "deprecated" marks a command, event, struct or enum member as

Do we want the comma before the conjunction?  (I've seen style guides
that recommend it, and style guides that discourage it; while I tend
to write by the former style, I usually don't care about the latter.
Rather, switching styles mid-patch caught my attention).

> +deprecated.  It is not supported elsewhere so far.  Interfaces so
> +marked may be withdrawn in future releases in accordance with QEMU's
> +deprecation policy.
>  
>  
> +++ b/qapi/qapi-visit-core.c
> @@ -393,7 +393,7 @@ static bool input_type_enum(Visitor *v, const char *name, int *obj,
>                              const QEnumLookup *lookup, Error **errp)
>  {
>      int64_t value;
> -    char *enum_str;
> +    g_autofree char *enum_str = NULL;

Nice change while touching the code.  Is it worth mentioning in the
commit message?

>  
>      if (!visit_type_str(v, name, &enum_str, errp)) {
>          return false;
> @@ -402,11 +402,23 @@ static bool input_type_enum(Visitor *v, const char *name, int *obj,
>      value = qapi_enum_parse(lookup, enum_str, -1, NULL);
>      if (value < 0) {
>          error_setg(errp, QERR_INVALID_PARAMETER, enum_str);
> -        g_free(enum_str);
>          return false;
>      }
>  
> -    g_free(enum_str);
> +    if (lookup->flags && (lookup->flags[value] & QAPI_ENUM_DEPRECATED)) {
> +        switch (v->compat_policy.deprecated_input) {
> +        case COMPAT_POLICY_INPUT_ACCEPT:
> +            break;
> +        case COMPAT_POLICY_INPUT_REJECT:
> +            error_setg(errp, "Deprecated value '%s' disabled by policy",
> +                       enum_str);
> +            return false;
> +        case COMPAT_POLICY_INPUT_CRASH:
> +        default:
> +            abort();
> +        }
> +    }
> +
>      *obj = value;
>      return true;
>  }

Grammar fixes are minor, so:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


