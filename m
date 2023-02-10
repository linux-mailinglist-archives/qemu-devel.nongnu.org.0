Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23E969228D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 16:45:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVZZ-0002oF-UB; Fri, 10 Feb 2023 10:44:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQVZX-0002ny-JW
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:44:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQVZV-0006SR-IN
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676043860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uI4d0JQ2YR8owrwq7q25+R1RLKwG/nIEgPpWwzQSIXc=;
 b=gl8DqhfK+PyoHUXfbnj6d0Q39wdsSBNtiNrIP4BvbyljKIf0G/wZDYgTjxnvD384qkFyzf
 xPa3UwYGTp1XnLIfpI4MdlZ0vhXgFnqmeNHAPDrD0qXwLP2CPbBBoncICaRwQmDBqAp2lT
 rzGEtLZPezC5cPzdtO4Lv9TPWvq23Rk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-SLuM8bybM_aXbeiwY9mQwQ-1; Fri, 10 Feb 2023 10:44:19 -0500
X-MC-Unique: SLuM8bybM_aXbeiwY9mQwQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9192857F4E;
 Fri, 10 Feb 2023 15:44:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1952140EBF4;
 Fri, 10 Feb 2023 15:44:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8F22421E6A1F; Fri, 10 Feb 2023 16:44:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v3 4/7] qapi/expr: add typing workaround for AbstractSet
References: <20230209184758.1017863-1-jsnow@redhat.com>
 <20230209184758.1017863-5-jsnow@redhat.com>
Date: Fri, 10 Feb 2023 16:44:17 +0100
In-Reply-To: <20230209184758.1017863-5-jsnow@redhat.com> (John Snow's message
 of "Thu, 9 Feb 2023 13:47:55 -0500")
Message-ID: <87sffd5xv2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

John Snow <jsnow@redhat.com> writes:

> mypy can only narrow the type of `Mapping[str, ...].keys() & Set[str]`
> to `AbstractSet[str]` and not a `Set[str]`. As a result, if the type of
> an expression is changed to a Mapping[], mypy is unsure if the .pop() is
> safe.
>
> A forthcoming commit does exactly that, so wrap the expression in a
> set() constructor to force the intermediate expression to be resolved as
> a mutable type.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/expr.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index b56353bdf84..af802367eff 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -622,8 +622,8 @@ def check_expr(expr_elem: _JSONObject) -> None:
>      if 'include' in expr:
>          return
>  
> -    metas = expr.keys() & {'enum', 'struct', 'union', 'alternate',
> -                           'command', 'event'}
> +    metas = set(expr.keys() & {
> +        'enum', 'struct', 'union', 'alternate', 'command', 'event'})
>      if len(metas) != 1:
>          raise QAPISemError(
>              info,
                   "expression must have exactly one key"
                   " 'enum', 'struct', 'union', 'alternate',"
                   " 'command', 'event'")
           meta = metas.pop()

I'm mildly surprised that the result of operator & is considered
immutable.  How could it *not* be a freshly created set?  Oh well.

Passing a set to set() is a no-op, so

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Regardless, the code feels a bit too clever to me.  It actually did
already when I wrote it, but I the less clever ways I could think of
were also much more verbose.

The code checks that exactly one of a set of keys is present, and which
one it is.  Any ideas?


