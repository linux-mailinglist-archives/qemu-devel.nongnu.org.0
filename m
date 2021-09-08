Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF29403A97
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 15:29:16 +0200 (CEST)
Received: from localhost ([::1]:34006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNxdb-0002Cl-Rl
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 09:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNxcQ-00019M-2B
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:28:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNxcN-0004Oi-K3
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631107678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fvehdbiMEPj4zImZA008Sygv1b9VHQGjTar5D2QDOkw=;
 b=DLv6OsthnO1HwGV3xy6V4/w9T89WrQQzFSzZ4/TmuPvIYJAfVbRlPvgK/ELN4mcLBc80tU
 2wUd/saogpr/IAg2WxWQxyFeb+SEl/62XyQmtW+Yax/l7DXhtsfTGklWHnamWYhBfTk9I3
 L1mkrgwwcS8XDk+U1/bNmtOmLzfspR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-N97KKDUWPvS5HtmzNaXsLA-1; Wed, 08 Sep 2021 09:27:57 -0400
X-MC-Unique: N97KKDUWPvS5HtmzNaXsLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D70BC824FA7;
 Wed,  8 Sep 2021 13:27:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FEA01971F;
 Wed,  8 Sep 2021 13:27:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 932411138606; Wed,  8 Sep 2021 15:27:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 5/5] qapi: Fix bogus error for 'if': { 'not': '' }
References: <20210908045428.2689093-1-armbru@redhat.com>
 <20210908045428.2689093-6-armbru@redhat.com>
Date: Wed, 08 Sep 2021 15:27:51 +0200
In-Reply-To: <20210908045428.2689093-6-armbru@redhat.com> (Markus Armbruster's
 message of "Wed, 8 Sep 2021 06:54:28 +0200")
Message-ID: <87tuivtcx4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/qapi/expr.py             | 21 +++++++++++++--------
>  tests/qapi-schema/bad-if-not.err |  2 +-
>  2 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index b62f0a3640..ad3732c7f0 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -293,17 +293,22 @@ def _check_if(cond: Union[str, object]) -> None:
>                  info,
>                  "'if' condition of %s has conflicting keys" % source)
>  
> -        oper, operands = next(iter(cond.items()))
> +        if 'not' in cond:
> +            _check_if(cond['not'])
> +        elif 'all' in cond:
> +            _check_infix('all', cond['all'])
> +        else:
> +            _check_infix('any', cond['any'])
> +
> +    def _check_infix(operator: str, operands: object):
> +        if not isinstance(operands, list):
> +            raise QAPISemError(
> +                info,
> +                "'%s' condition of %s must be an array"
> +                % (operator, source))
>          if not operands:
>              raise QAPISemError(
>                  info, "'if' condition [] of %s is useless" % source)
> -
> -        if oper == "not":
> -            _check_if(operands)
> -            return
> -        if oper in ("all", "any") and not isinstance(operands, list):
> -            raise QAPISemError(
> -                info, "'%s' condition of %s must be an array" % (oper, source))
>          for operand in operands:
>              _check_if(operand)
>  
> diff --git a/tests/qapi-schema/bad-if-not.err b/tests/qapi-schema/bad-if-not.err
> index b3acdd679a..b33f5e16b8 100644
> --- a/tests/qapi-schema/bad-if-not.err
> +++ b/tests/qapi-schema/bad-if-not.err
> @@ -1,2 +1,2 @@
>  bad-if-not.json: In struct 'TestIfStruct':
> -bad-if-not.json:2: 'if' condition [] of struct is useless
> +bad-if-not.json:2: 'if' condition '' of struct is not a valid identifier

Squashing in this fixup:

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index ad3732c7f0..90bde501b0 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -300,7 +300,7 @@ def _check_if(cond: Union[str, object]) -> None:
         else:
             _check_infix('any', cond['any'])
 
-    def _check_infix(operator: str, operands: object):
+    def _check_infix(operator: str, operands: object) -> None:
         if not isinstance(operands, list):
             raise QAPISemError(
                 info,


