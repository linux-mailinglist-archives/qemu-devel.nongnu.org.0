Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D4697931
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 10:44:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSEJw-0002a1-DD; Wed, 15 Feb 2023 04:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSEJu-0002ZR-8N
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 04:43:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSEJs-0003jM-LE
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 04:43:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676454198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Uu1pIjpu8DMdjfMgiPMyA1n+y6iKBN/ZQBjcZPBmXnk=;
 b=WE3d92fLPr6YkCLobb51V3McCx5RoQyRDBgnuycKwpQaIXmLryRe+l+zsADchXaJY8cDMv
 jZvL4CcQwH6LQCkRAkYoDliPt777Wc07d6q9XjeKYLescKI6m1pqccXoBcqf/8gFlj9NAE
 9hMtwlRZHZwIjwz6D7FH968WpFzCqQA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-Ek7mYrMgPWqLZFPl6Nzhbw-1; Wed, 15 Feb 2023 04:43:15 -0500
X-MC-Unique: Ek7mYrMgPWqLZFPl6Nzhbw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2E1D293248F;
 Wed, 15 Feb 2023 09:43:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6E762026D4B;
 Wed, 15 Feb 2023 09:43:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8AC4B21E6A1F; Wed, 15 Feb 2023 10:43:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v4 4/6] qapi/parser: add QAPIExpression type
References: <20230215000011.1725012-1-jsnow@redhat.com>
 <20230215000011.1725012-5-jsnow@redhat.com>
Date: Wed, 15 Feb 2023 10:43:13 +0100
In-Reply-To: <20230215000011.1725012-5-jsnow@redhat.com> (John Snow's message
 of "Tue, 14 Feb 2023 19:00:09 -0500")
Message-ID: <87v8k3clhq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

John Snow <jsnow@redhat.com> writes:

> This patch creates a new type, QAPIExpression, which represents a parsed
> expression complete with QAPIDoc and QAPISourceInfo.
>
> This patch turns parser.exprs into a list of QAPIExpression instead,
> and adjusts expr.py to match.
>
> This allows the types we specify in parser.py to be "remembered" all the
> way through expr.py and into schema.py. Several assertions around
> packing and unpacking this data can be removed as a result.

Suggest to add:

  It also corrects a harmless typing error.  Before the patch,
  check_exprs() allegedly takes a List[_JSONObject].  It actually takes
  a list of dicts of the form

      {'expr': E, 'info': I, 'doc': D}

  where E is of type _ExprValue, I is of type QAPISourceInfo, and D is
  of type QAPIDoc.  Key 'doc' is optional.  This is not a _JSONObject!
  Passes type checking anyway, because _JSONObject is Dict[str, object].

> Signed-off-by: John Snow <jsnow@redhat.com>

[...]

> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index 1b006cdc133..50906e27d49 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -21,6 +21,7 @@
>      TYPE_CHECKING,
>      Dict,
>      List,
> +    Mapping,
>      Optional,
>      Set,
>      Union,
> @@ -37,15 +38,24 @@
>      from .schema import QAPISchemaFeature, QAPISchemaMember
>  
>  
> -#: Represents a single Top Level QAPI schema expression.
> -TopLevelExpr = Dict[str, object]
> -
>  # Return value alias for get_expr().
>  _ExprValue = Union[List[object], Dict[str, object], str, bool]
>  
> -# FIXME: Consolidate and centralize definitions for TopLevelExpr,
> -# _ExprValue, _JSONValue, and _JSONObject; currently scattered across
> -# several modules.
> +
> +# FIXME: Consolidate and centralize definitions for _ExprValue,
> +# JSONValue, and _JSONObject; currently scattered across several
> +# modules.
> +
> +
> +class QAPIExpression(Dict[str, object]):
> +    # pylint: disable=too-few-public-methods
> +    def __init__(self,
> +                 data: Mapping[str, object],

Would @expr be a better name?

> +                 info: QAPISourceInfo,
> +                 doc: Optional['QAPIDoc'] = None):
> +        super().__init__(data)
> +        self.info = info
> +        self.doc: Optional['QAPIDoc'] = doc
>  
>  
>  class QAPIParseError(QAPISourceError):

[...]

Regardless,
Reviewed-by: Markus Armbruster <armbru@redhat.com>


