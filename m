Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BF836A581
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 09:24:31 +0200 (CEST)
Received: from localhost ([::1]:33802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laZ81-0003oY-Q8
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 03:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laZ7H-0003Q0-Qz
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 03:23:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laZ7E-0002xM-IT
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 03:23:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619335419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NUC1UXwUrmqOOMZjGInenONALJ186g7113mLGF50nDQ=;
 b=B0gzZT+BbQdFY2sZ0jfeFwX03lrv8v3TxPDoKSXMVpg7nSTxzzDwQevCMGoIiml23H2slr
 gNe0cDxgXTAI09btfYiktLdQT3eOviDWFak1qdW/WH88h4l7IDGkQRFOnwCfwbaQW2TFSF
 qHCDIomGZaSOA7hGELPOkij8FL4f1do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-tAkKBDa6PDmnbFMumKZJ1A-1; Sun, 25 Apr 2021 03:23:36 -0400
X-MC-Unique: tAkKBDa6PDmnbFMumKZJ1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52B2F107ACC7;
 Sun, 25 Apr 2021 07:23:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D622B19C46;
 Sun, 25 Apr 2021 07:23:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 67F7F113525D; Sun, 25 Apr 2021 09:23:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 06/22] qapi/parser: assert get_expr returns object in
 outer loop
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-7-jsnow@redhat.com>
Date: Sun, 25 Apr 2021 09:23:33 +0200
In-Reply-To: <20210422030720.3685766-7-jsnow@redhat.com> (John Snow's message
 of "Wed, 21 Apr 2021 23:07:04 -0400")
Message-ID: <87im4a96a2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> get_expr can return many things, depending on where it is used. In the
> outer parsing loop, we expect and require it to return a dict.
>
> (It's (maybe) a bit involved to teach mypy that when nested is False,
> this is already always True. I'll look into it later, maybe.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/parser.py | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index c75434e75a5..6b443b1247e 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -78,6 +78,8 @@ def _parse(self):
>                  continue
>  
>              expr = self.get_expr(False)
> +            assert isinstance(expr, dict)  # Guaranteed when nested=False
> +
>              if 'include' in expr:
>                  self.reject_expr_doc(cur_doc)
>                  if len(expr) != 1:
> @@ -278,6 +280,7 @@ def get_values(self):
>              self.accept()
>  
>      def get_expr(self, nested):
> +        # TODO: Teach mypy that nested=False means the retval is a Dict.
>          if self.tok != '{' and not nested:
>              raise QAPIParseError(self, "expected '{'")
>          if self.tok == '{':

The better place to assert a post condition would be ...

                self.accept()
                expr = self.get_members()
            elif self.tok == '[':
                self.accept()
                expr = self.get_values()
            elif self.tok in "'tf":
                expr = self.val
                self.accept()
            else:
                raise QAPIParseError(
                    self, "expected '{', '[', string, or boolean")

... here.

            return expr

But then it may not help mypy over the hump, which is the whole point of
the patch.

Alternative ways to skin this cat:

* Split get_object() off get_expr().

  diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
  index ca5e8e18e0..c79b3c7d08 100644
  --- a/scripts/qapi/parser.py
  +++ b/scripts/qapi/parser.py
  @@ -262,9 +262,12 @@ def get_values(self):
                   raise QAPIParseError(self, "expected ',' or ']'")
               self.accept()

  -    def get_expr(self, nested):
  -        if self.tok != '{' and not nested:
  +    def get_object(self):
  +        if self.tok != '{':
               raise QAPIParseError(self, "expected '{'")
  +        return self.get_expr()
  +
  +    def get_expr(self):
           if self.tok == '{':
               self.accept()
               expr = self.get_members()

* Shift "top-level expression must be dict" up:

    diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
    index ca5e8e18e0..ee8cbf3531 100644
    --- a/scripts/qapi/parser.py
    +++ b/scripts/qapi/parser.py
    @@ -68,7 +68,10 @@ def __init__(self, fname, previously_included=None, incl_info=None):
                         self.docs.append(cur_doc)
                     continue

    -            expr = self.get_expr(False)
    +            expr = self.get_expr()
    +            if not isinstance(expr, OrderedDict):
    +                raise QAPISemError(
    +                    info, "top-level expression must be an object")
                 if 'include' in expr:
                     self.reject_expr_doc(cur_doc)
                     if len(expr) != 1:
    @@ -262,9 +265,7 @@ def get_values(self):
                     raise QAPIParseError(self, "expected ',' or ']'")
                 self.accept()

    -    def get_expr(self, nested):
    -        if self.tok != '{' and not nested:
    -            raise QAPIParseError(self, "expected '{'")
    +    def get_expr(self):
             if self.tok == '{':
                 self.accept()
                 expr = self.get_members()

* Shift it further, into expr.py:

   diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
   index 496f7e0333..0a83c493a0 100644
   --- a/scripts/qapi/expr.py
   +++ b/scripts/qapi/expr.py
   @@ -600,7 +600,10 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
        """
        for expr_elem in exprs:
            # Expression
   -        assert isinstance(expr_elem['expr'], dict)
   +        if not isinstance(expr_elem['expr'], dict):
   +            raise QAPISemError(
   +                info, "top-level expression must be an object")
   +            
            for key in expr_elem['expr'].keys():
                assert isinstance(key, str)
            expr: _JSONObject = expr_elem['expr']

Shifting it up would be closer to qapi-code-gen.txt than what we have
now.

All observations, no demands.


