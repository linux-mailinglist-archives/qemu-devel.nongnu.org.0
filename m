Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0560236A5A2
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 10:01:02 +0200 (CEST)
Received: from localhost ([::1]:48786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laZhN-0003Ff-47
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 04:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laZfo-0002jH-1n
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 03:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laZfm-0007ib-Er
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 03:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619337561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/ggC73nYJ1+WL2zjgWD/W0uXBDLMtQEMBtipGS5x9MU=;
 b=QFkiTPGpILRDayHZ/FYq4a6DrLB6HGPH5N5UujQyuK03ZfDadKe3Tsu7c9/bgPd2p4ZFzD
 eXdN4cdwWfcdRSA7x9GKa0yI9LbBLvtoLtRPnIXJo6QBUPxE/M8Is2LVcbSR8qsJqqSyDt
 sjpMLPuEccKa90s9eju0rfBFfpOHzfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-Bm6FQlKZNPyAzzbAg_yKkA-1; Sun, 25 Apr 2021 03:59:19 -0400
X-MC-Unique: Bm6FQlKZNPyAzzbAg_yKkA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 328701006C81;
 Sun, 25 Apr 2021 07:59:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 014F53A47;
 Sun, 25 Apr 2021 07:59:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 85EC0113525D; Sun, 25 Apr 2021 09:59:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 10/22] qapi/parser: Fix typing of token membership tests
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-11-jsnow@redhat.com>
Date: Sun, 25 Apr 2021 09:59:16 +0200
In-Reply-To: <20210422030720.3685766-11-jsnow@redhat.com> (John Snow's message
 of "Wed, 21 Apr 2021 23:07:08 -0400")
Message-ID: <87v98a7q23.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

> When the token can be None, we can't use 'x in "abc"' style membership
> tests to group types of tokens together, because 'None in "abc"' is a
> TypeError.
>
> Easy enough to fix, if not a little ugly.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/parser.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index 7f3c009f64b..16fd36f8391 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -272,7 +272,7 @@ def get_values(self):
>          if self.tok == ']':
>              self.accept()
>              return expr
> -        if self.tok not in "{['tf":
> +        if self.tok is None or self.tok not in "{['tf":
>              raise QAPIParseError(
>                  self, "expected '{', '[', ']', string, or boolean")
>          while True:
> @@ -294,7 +294,8 @@ def get_expr(self, nested):
>          elif self.tok == '[':
>              self.accept()
>              expr = self.get_values()
> -        elif self.tok in "'tf":
> +        elif self.tok and self.tok in "'tf":
> +            assert isinstance(self.val, (str, bool))
>              expr = self.val
>              self.accept()
>          else:

How can self.tok be None?

I suspect this is an artifact of PATCH 04.  Before, self.tok is
initialized to the first token, then set to subsequent tokens (all str)
in turn.  After, it's initialized to None, then set to tokens in turn.


