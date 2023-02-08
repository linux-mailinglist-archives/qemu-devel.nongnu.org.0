Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786B868F319
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 17:23:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPnDb-0006vO-CB; Wed, 08 Feb 2023 11:22:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPnDa-0006vF-9F
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 11:22:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPnDY-0003TP-LW
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 11:22:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675873363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RyftKnX+IWenmTK6ReyXl7I8WvE9PnWKnD4eyiaFLOE=;
 b=h9jefw2XVUY4ePEYqqxqGcshqdipb+y9hYFUtPjRFSv61rnFmJjYWKhTX/Cn4vjW0eMsG+
 xDe3/BBm3a64zC//XWZkWmy8E7j9xnZ78bxsbCTMxSDYLTwyCPD6jU1TRGTtinpkb9qrN7
 RPaZF8fiiW+UxhagjTb4ZZQv3qzh2HU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-4_UHllvbM3WtMedMI_66-w-1; Wed, 08 Feb 2023 11:22:42 -0500
X-MC-Unique: 4_UHllvbM3WtMedMI_66-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3AA1101A521;
 Wed,  8 Feb 2023 16:22:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A889B404CD84;
 Wed,  8 Feb 2023 16:22:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 88F4A21E6A1F; Wed,  8 Feb 2023 17:22:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v2 3/7] qapi/expr: Use TopLevelExpr where appropriate
References: <20230208021306.870657-1-jsnow@redhat.com>
 <20230208021306.870657-4-jsnow@redhat.com>
Date: Wed, 08 Feb 2023 17:22:40 +0100
In-Reply-To: <20230208021306.870657-4-jsnow@redhat.com> (John Snow's message
 of "Tue, 7 Feb 2023 21:13:02 -0500")
Message-ID: <87fsbgunxr.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

> Remove most usages of _JSONObject with a more semantically meaningful
> alias. Note that this is only a semantic alias; the distinction is not
> enforced by the type system. This is merely a benefit for the human:
> instead of check_xyz functions operating on a representation of some
> "JSON Object", we can document them as operating on QAPI's Top Level
> Expressions directly; it's more semantically meaningful.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/expr.py | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 293f830fe9d..338c9ea4131 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -44,7 +44,7 @@
>  
>  from .common import c_name
>  from .error import QAPISemError
> -from .parser import ParsedExpression
> +from .parser import ParsedExpression, TopLevelExpr
>  from .source import QAPISourceInfo
>  
>  
> @@ -229,11 +229,11 @@ def pprint(elems: Iterable[str]) -> str:
>                 pprint(unknown), pprint(allowed)))
>  
>  
> -def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
> +def check_flags(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
>      """
>      Ensure flag members (if present) have valid values.
>  
> -    :param expr: The expression to validate.
> +    :param expr: The `TopLevelExpr` to validate.
>      :param info: QAPI schema source file information.
>  
>      :raise QAPISemError:
> @@ -447,9 +447,9 @@ def check_features(features: Optional[object],
>          check_if(feat, info, source)
>  
>  
> -def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
> +def check_enum(expr: TopLevelExpr, info: QAPISourceInfo) -> None:
>      """
> -    Normalize and validate this expression as an ``enum`` definition.
> +    Normalize and validate this `TopLevelExpr` as an ``enum`` definition.

Doc comment style question raised in review of PATCH 2 applies.

More of the same below.

>  
>      :param expr: The expression to validate.
>      :param info: QAPI schema source file information.

[...]


