Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5B93493D2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:13:52 +0100 (CET)
Received: from localhost ([::1]:58818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPQkB-0001V8-Jx
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPQbe-0008TN-PG
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:05:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPQbV-00044M-Ul
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:05:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616681090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XOu5T+hSVRgsK9OlAdaNt72C5k4qAiEncVOgi8SC9WY=;
 b=SPHZJPfAIWgI7SXzG8M3El/k+GgdF0bwLznhw2qF4E+a9h0eShKqATi+hCGsC/ZulDiRR6
 mAmbR9nL/f1VyhF7FZH4NmTjxVCy++OCSB1FeulonVg7ExLoWQ606GUpRR30r5dS6DSIrQ
 mXtKGqxhZgyx50ALWfYhhch40EKy8Tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-0-ki68lbNdGYdSfGPbbCyg-1; Thu, 25 Mar 2021 10:04:48 -0400
X-MC-Unique: 0-ki68lbNdGYdSfGPbbCyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9D5580006E;
 Thu, 25 Mar 2021 14:04:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BF4E5D741;
 Thu, 25 Mar 2021 14:04:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1AE1E11327E1; Thu, 25 Mar 2021 15:04:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 05/19] qapi/expr.py: constrain incoming expression types
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-6-jsnow@redhat.com>
Date: Thu, 25 Mar 2021 15:04:46 +0100
In-Reply-To: <20210325060356.4040114-6-jsnow@redhat.com> (John Snow's message
 of "Thu, 25 Mar 2021 02:03:42 -0400")
Message-ID: <871rc3tjlt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> mypy does not know the types of values stored in Dicts that masquerade
> as objects. Help the type checker out by constraining the type.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/expr.py | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index b4bbcd54c0..b75c85c160 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -15,9 +15,18 @@
>  # See the COPYING file in the top-level directory.
>  
>  import re
> +from typing import Dict, Optional
>  
>  from .common import c_name
>  from .error import QAPISemError
> +from .parser import QAPIDoc
> +from .source import QAPISourceInfo
> +
> +
> +# Deserialized JSON objects as returned by the parser;
> +# The values of this mapping are not necessary to exhaustively type

Not necessary and also not practical with current mypy.  Correct?

> +# here, because the purpose of this module is to interrogate that type.
> +_JSONObject = Dict[str, object]
>  
>  
>  # Names consist of letters, digits, -, and _, starting with a letter.
> @@ -315,9 +324,20 @@ def check_event(expr, info):
>  
>  def check_exprs(exprs):
>      for expr_elem in exprs:
> -        expr = expr_elem['expr']
> -        info = expr_elem['info']
> -        doc = expr_elem.get('doc')
> +        # Expression
> +        assert isinstance(expr_elem['expr'], dict)

I dislike relaxing OrderedDict to dict here.  I'm going to accept it
anyway, because the difference between the two is going away in 3.7, and
because so far order actually matters only in certain sub-expressions,
not top-level expressions.

> +        for key in expr_elem['expr'].keys():
> +            assert isinstance(key, str)
> +        expr: _JSONObject = expr_elem['expr']
> +
> +        # QAPISourceInfo
> +        assert isinstance(expr_elem['info'], QAPISourceInfo)
> +        info: QAPISourceInfo = expr_elem['info']
> +
> +        # Optional[QAPIDoc]
> +        tmp = expr_elem.get('doc')
> +        assert tmp is None or isinstance(tmp, QAPIDoc)
> +        doc: Optional[QAPIDoc] = tmp
>  
>          if 'include' in expr:
>              continue

I see you didn't bite on the idea to do less checking here.  Okay.


