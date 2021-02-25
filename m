Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A50A325171
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:24:52 +0100 (CET)
Received: from localhost ([::1]:52070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHZS-0006t0-RB
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFHYN-0006Nw-1l
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:23:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFHYJ-0000xC-TP
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614263017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eW9sN4NwSX/q6pl/3H89WNiuqsFsI8f2+dIgafxmRkM=;
 b=hfqzDkHur4opAW/bFjVQ9wfYfD5yMC1/KBhS9kM7Qmry9ozgAYfRcl6kGZKqE39O7dXUST
 uVpvb6VMoOY9F0lQfGswJYdsQLZbRNY3oxIn6cKAwwEeG90DbB7JN/70l4RxxkP/Z568E5
 pCOcDvAz7VwL+Vw+mc2ggAH+rgFqxMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-C-QQ_twKMf6-TO0U_lRfMw-1; Thu, 25 Feb 2021 09:23:36 -0500
X-MC-Unique: C-QQ_twKMf6-TO0U_lRfMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 191E5107ACC7;
 Thu, 25 Feb 2021 14:23:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FBF51001281;
 Thu, 25 Feb 2021 14:23:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 342D3113860F; Thu, 25 Feb 2021 15:23:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 09/16] qapi/expr.py: Consolidate check_if_str calls
 in check_if
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-10-jsnow@redhat.com>
Date: Thu, 25 Feb 2021 15:23:33 +0100
In-Reply-To: <20210223003408.964543-10-jsnow@redhat.com> (John Snow's message
 of "Mon, 22 Feb 2021 19:34:01 -0500")
Message-ID: <87a6rsb50a.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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

> This is a small rewrite to address some minor style nits.
>
> Don't compare against the empty list to check for the empty condition, and
> move the normalization forward to unify the check on the now-normalized
> structure.
>
> With the check unified, the local nested function isn't needed anymore
> and can be brought down into the normal flow of the function. With the
> nesting level changed, shuffle the error strings around a bit to get
> them to fit in 79 columns.
>
> Note: though ifcond is typed as Sequence[str] elsewhere, we *know* that
> the parser will produce real, bona-fide lists. It's okay to check
> isinstance(ifcond, list) here.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/expr.py | 36 ++++++++++++++++--------------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index df6c64950fa..3235a3b809e 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -128,30 +128,26 @@ def check_flags(expr: Expression, info: QAPISourceInfo) -> None:
>  
>  def check_if(expr: _JSObject, info: QAPISourceInfo, source: str) -> None:
>  
> -    def check_if_str(ifcond: object) -> None:
> -        if not isinstance(ifcond, str):
> -            raise QAPISemError(
> -                info,
> -                "'if' condition of %s must be a string or a list of strings"
> -                % source)
> -        if ifcond.strip() == '':
> -            raise QAPISemError(
> -                info,
> -                "'if' condition '%s' of %s makes no sense"
> -                % (ifcond, source))
> -
>      ifcond = expr.get('if')
>      if ifcond is None:
>          return
> -    if isinstance(ifcond, list):
> -        if ifcond == []:
> +
> +    # Normalize to a list
> +    if not isinstance(ifcond, list):
> +        ifcond = [ifcond]
> +        expr['if'] = ifcond
> +
> +    if not ifcond:
> +        raise QAPISemError(info, f"'if' condition [] of {source} is useless")

In the old code, the connection between the conditional and the error
message was a bit more obvious.

> +
> +    for element in ifcond:

@element is rather long.  If you hate @elt, what about @ifc?

> +        if not isinstance(element, str):
> +            raise QAPISemError(info, (
> +                f"'if' condition of {source}"
> +                " must be a string or a list of strings"))
> +        if element.strip() == '':
>              raise QAPISemError(
> -                info, "'if' condition [] of %s is useless" % source)
> -        for elt in ifcond:
> -            check_if_str(elt)
> -    else:
> -        check_if_str(ifcond)
> -        expr['if'] = [ifcond]
> +                info, f"'if' condition '{element}' of {source} makes no sense")
>  
>  
>  def normalize_members(members: object) -> None:

Perhaps:

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index df6c64950f..e904924599 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -128,30 +128,26 @@ def check_flags(expr: Expression, info: QAPISourceInfo) -> None:
 
 def check_if(expr: _JSObject, info: QAPISourceInfo, source: str) -> None:
 
-    def check_if_str(ifcond: object) -> None:
-        if not isinstance(ifcond, str):
-            raise QAPISemError(
-                info,
-                "'if' condition of %s must be a string or a list of strings"
-                % source)
-        if ifcond.strip() == '':
-            raise QAPISemError(
-                info,
-                "'if' condition '%s' of %s makes no sense"
-                % (ifcond, source))
-
     ifcond = expr.get('if')
     if ifcond is None:
         return
+
     if isinstance(ifcond, list):
         if ifcond == []:
             raise QAPISemError(
                 info, "'if' condition [] of %s is useless" % source)
-        for elt in ifcond:
-            check_if_str(elt)
     else:
-        check_if_str(ifcond)
-        expr['if'] = [ifcond]
+        # Normalize to a list
+        ifcond = expr['if'] = [ifcond]
+
+    for elt in ifcond:
+        if not isinstance(elt, str):
+            raise QAPISemError(info, (
+                f"'if' condition of {source}"
+                " must be a string or a list of strings"))
+        if elt.strip() == '':
+            raise QAPISemError(
+                info, f"'if' condition '{elt}' of {source} makes no sense")
 
 
 def normalize_members(members: object) -> None:


Bonus: slightly less churn.


