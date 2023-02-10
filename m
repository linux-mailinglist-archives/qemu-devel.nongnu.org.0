Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4B1691F2E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 13:35:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQSas-0001Ag-JR; Fri, 10 Feb 2023 07:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQSaq-0001AV-AB
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:33:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQSak-0002ko-LV
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676032401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+kb41g1dkwvVVNQ138l9yBrxtae564pOE4JVQf53ppM=;
 b=S9pTAR5F4rtB2n4R9rr8PhknNcCdifbm1XKqF06kd8471CFGNVdlU5e3CKUqjzlUS3P6Ak
 5AS0XjFz9tIJQB3fzwoXKU38lX9F4NXz2up4Aq7I+vQjo6uCa2zM7GN+8kOGYKQMajauuE
 o/wjrK/kkeYZlkU3pWZEICarbXJuxng=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-WaKJ8R_HO52THo4nlQrtSg-1; Fri, 10 Feb 2023 07:33:18 -0500
X-MC-Unique: WaKJ8R_HO52THo4nlQrtSg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A6CE38173D0;
 Fri, 10 Feb 2023 12:33:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D70DF492C3F;
 Fri, 10 Feb 2023 12:33:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C3ADF21E6A1F; Fri, 10 Feb 2023 13:33:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v3 3/7] qapi/expr: Split check_expr out from check_exprs
References: <20230209184758.1017863-1-jsnow@redhat.com>
 <20230209184758.1017863-4-jsnow@redhat.com>
Date: Fri, 10 Feb 2023 13:33:16 +0100
In-Reply-To: <20230209184758.1017863-4-jsnow@redhat.com> (John Snow's message
 of "Thu, 9 Feb 2023 13:47:54 -0500")
Message-ID: <87pmahr983.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Another observation...

John Snow <jsnow@redhat.com> writes:

> Primarily, this reduces a nesting level of a particularly long
> block. It's mostly code movement, but a new docstring is created.
>
> It also has the effect of creating a fairly convenient "catch point" in
> check_exprs for exception handling without making the nesting level even
> worse.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> This patch was originally written as part of my effort to factor out
> QAPISourceInfo from this file by having expr.py raise a simple
> exception, then catch and wrap it at the higher level.
>
> This series doesn't do that anymore, but reducing the nesting level
> still seemed subjectively nice. It's not crucial.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/expr.py | 179 +++++++++++++++++++++++--------------------
>  1 file changed, 95 insertions(+), 84 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 5a1782b57ea..b56353bdf84 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -595,6 +595,99 @@ def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
>      check_type(args, info, "'data'", allow_dict=not boxed)
>  
>  
> +def check_expr(expr_elem: _JSONObject) -> None:

[...]

>  def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
>      """
>      Validate and normalize a list of parsed QAPI schema expressions.

The typing is kind of wrong.

The list is the value of QAPISchemaParser.exprs, which is (losely) typed
as List[Dict[str, object]].  It is actually a dict mapping

   'expr' -> _ExprValue
   'info' -> QAPISourceInfo
   'doc'  -> Optional[QAPIDoc]

Thet's not what _JSONObject is!  Its doc string describes it as
"Deserialized JSON objects as returned by the parser", i.e. the same as
_ExprValue.

Works only because _JSONObject is a dict mapping arbitrary keys to
_JSONObject, str or bool.

This patch spreads the flawed typing to the new function.

Gets healed later in the series.

[...]


