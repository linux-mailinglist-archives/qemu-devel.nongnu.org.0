Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F71F325292
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 16:43:08 +0100 (CET)
Received: from localhost ([::1]:42920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFInC-0006Jh-No
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 10:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFIlQ-0005Of-Qi
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:41:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFIlK-0002sC-Dv
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:41:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614267667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=efU8A1PZ9w8JclArpXq56E7ZKUtWLME6c5IPVnVe0kY=;
 b=SLfCXwJ0I1P8hNRzL5MZgTAmQbgQhHcvL73I3X1zRoRUr3tHP3BPW4vcWMNZMXBQ3VgEYk
 lAjPq+6/CG/GBl1A4lPSi86x7/k7Be5TNH21muiwsrClizKjYjr3aUsGBxjVSXi3flXXia
 Ff+NquviKy4HO2w4Pahqnyz5wOOJNN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-L0HzRMCFNHCL7lILGH0oIA-1; Thu, 25 Feb 2021 10:41:06 -0500
X-MC-Unique: L0HzRMCFNHCL7lILGH0oIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E0761005501;
 Thu, 25 Feb 2021 15:41:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB92D60D07;
 Thu, 25 Feb 2021 15:41:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4FB45113860F; Thu, 25 Feb 2021 16:41:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 13/16] qapi/expr.py: Modify check_keys to accept any
 Collection
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-14-jsnow@redhat.com>
Date: Thu, 25 Feb 2021 16:41:03 +0100
In-Reply-To: <20210223003408.964543-14-jsnow@redhat.com> (John Snow's message
 of "Mon, 22 Feb 2021 19:34:05 -0500")
Message-ID: <87v9agupdc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

> This is a minor adjustment that allows the 'required' and 'optional'
> keys fields to take a default value of an empty, immutable sequence (the
> empty tuple).

Quite marginal, but simple enough for me not to say no to it.

> This reveals a quirk of this function, which is that "a + b" is
> list-specific behavior. We can accept a wider variety of types if we
> avoid that behavior. Using Collection allows us to accept things like
> lists, tuples, sets, and so on.
>
> (Iterable would also have worked, but Iterable also includes things like
> generator expressions which are consumed upon iteration, which would
> require a rewrite to make sure that each input was only traversed once.)

Totally not worth it now :)

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/expr.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 2b96bec722f..0b841f292d7 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -33,6 +33,7 @@
>  
>  import re
>  from typing import (
> +    Collection,
>      Iterable,
>      List,
>      MutableMapping,
> @@ -133,8 +134,8 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
>  def check_keys(value: _JSObject,
>                 info: QAPISourceInfo,
>                 source: str,
> -               required: List[str],
> -               optional: List[str]) -> None:
> +               required: Collection[str] = (),
> +               optional: Collection[str] = ()) -> None:
>      """
>      Ensures an object has a specific set of keys. [Const]
>  

Any particular reason not to squash this part into PATCH 08?  Oh, I
figure it's because it requires the next hunk, and squashing that one
would kill PATCH 08's "This commit *only* adds annotations."  What about
putting the next hunk before 08, and squash the remainder?

> @@ -155,7 +156,7 @@ def pprint(elems: Iterable[str]) -> str:
>              "%s misses key%s %s"
>              % (source, 's' if len(missing) > 1 else '',
>                 pprint(missing)))
> -    allowed = set(required + optional)
> +    allowed = set(required) | set(optional)
>      unknown = set(value) - allowed
>      if unknown:
>          raise QAPISemError(


