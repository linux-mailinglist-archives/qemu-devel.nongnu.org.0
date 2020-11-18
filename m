Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE072B7FEB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:00:00 +0100 (CET)
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfOwB-0004L7-8x
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 09:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfOvJ-0003pa-Ns
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:59:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfOvI-0006VK-2E
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605711543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WbrcRCn7MU4QZ6XQtgUOWw64w5yWhxFWK4AQuWHZ+I0=;
 b=GwQoIk+UgmPT8twByVg8hOyIQME0gGei53Vdvzso79U3ioayecpnQL0ACCJ2XlSDdu5a2S
 JPAtjEwop7KjrKka+MUDKXII9+bLoNJzmJ7G0JoXEOof1K4pA5Enf87YFeDSVnWxgnNGLm
 2RLIPfs8h53XeXc1Utzbmio/931LJZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-ml1vnpYUOdac8DQnVf3d_Q-1; Wed, 18 Nov 2020 09:59:01 -0500
X-MC-Unique: ml1vnpYUOdac8DQnVf3d_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87F8D1085944
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 14:59:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 531D26062F;
 Wed, 18 Nov 2020 14:59:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B6F3C11358BA; Wed, 18 Nov 2020 15:58:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 03/16] qapi/expr.py: constrain incoming expression types
References: <20201026213637.47087-1-jsnow@redhat.com>
 <20201026213637.47087-4-jsnow@redhat.com>
Date: Wed, 18 Nov 2020 15:58:58 +0100
In-Reply-To: <20201026213637.47087-4-jsnow@redhat.com> (John Snow's message of
 "Mon, 26 Oct 2020 17:36:24 -0400")
Message-ID: <87ft56iudp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> mypy does not know the types of values stored in Dicts that masquerade
> as objects. Help the type checker out by constraining the type.

I'm not sure I understand what you mean by "dict masquerading as
object".

>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> ---
>  scripts/qapi/expr.py | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 5694c501fa38..f7c7f91326ef 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -15,9 +15,17 @@
>  # See the COPYING file in the top-level directory.
>  
>  import re
> +from typing import MutableMapping, Optional
>  
>  from .common import c_name
>  from .error import QAPISemError
> +from .parser import QAPIDoc
> +from .source import QAPISourceInfo
> +
> +
> +# Expressions in their raw form are JSON-like structures with arbitrary forms.
> +# Minimally, their top-level form must be a mapping of strings to values.

PEP 8: "For flowing long blocks of text with fewer structural
restrictions (docstrings or comments), the line length should be limited
to 72 characters."

> +Expression = MutableMapping[str, object]
>  
>  
>  # Names must be letters, numbers, -, and _.  They must start with letter,
> @@ -287,9 +295,20 @@ def check_event(expr, info):
>  
>  def check_exprs(exprs):
>      for expr_elem in exprs:
> -        expr = expr_elem['expr']
> -        info = expr_elem['info']
> -        doc = expr_elem.get('doc')

dict is arguably a rather awkward choice here.  I figure a named tuple
would be neater.  A class feels like overkill.  Observation, not demand.

> +        # Expression
> +        assert isinstance(expr_elem['expr'], dict)
> +        expr: Expression = expr_elem['expr']
> +        for key in expr.keys():
> +            assert isinstance(key, str)
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

I hope further typing work will reduce the isinstance() assertions
again.


