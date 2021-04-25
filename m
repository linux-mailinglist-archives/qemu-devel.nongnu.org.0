Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8CF36A59B
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 09:55:37 +0200 (CEST)
Received: from localhost ([::1]:46302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laZc8-0001zx-80
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 03:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laZb7-0001ai-Lh
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 03:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laZb4-0004i2-F2
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 03:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619337268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sztiFJ+SQ7Laxf7wcDA894QwKp28qIx4MQdQnZZ2PPw=;
 b=NEr6Rg7tnEXmR1mzlMmJtWERRlWxnFlEWrIPTravOoZ6EsDzE/GyopWChRvBQo4fiPVaQD
 oiCRoJfjmXszT8HvB/VsQTE++wJTNwY15m95f55GpVb9tBNdjEc/R1coFQJ7QsIqldRaKq
 SjVZxiEXcozqLY9npNE8vjqfcH5DvC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-_UxSF_QQM9uHuTgSl_jDGg-1; Sun, 25 Apr 2021 03:54:27 -0400
X-MC-Unique: _UxSF_QQM9uHuTgSl_jDGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFAB2343A3;
 Sun, 25 Apr 2021 07:54:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85E7760BE5;
 Sun, 25 Apr 2021 07:54:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 17893113525D; Sun, 25 Apr 2021 09:54:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 09/22] qapi: add match_nofail helper
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-10-jsnow@redhat.com>
Date: Sun, 25 Apr 2021 09:54:24 +0200
In-Reply-To: <20210422030720.3685766-10-jsnow@redhat.com> (John Snow's message
 of "Wed, 21 Apr 2021 23:07:07 -0400")
Message-ID: <871ray94un.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

> Mypy cannot generally understand that these regex functions cannot
> possibly fail. Add a _nofail helper that clarifies this for mypy.

Convention wants a blank line here.

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/common.py |  8 +++++++-
>  scripts/qapi/main.py   |  6 ++----
>  scripts/qapi/parser.py | 13 +++++++------
>  3 files changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index cbd3fd81d36..d38c1746767 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -12,7 +12,7 @@
>  # See the COPYING file in the top-level directory.
>  
>  import re
> -from typing import Optional, Sequence
> +from typing import Match, Optional, Sequence
>  
>  
>  #: Magic string that gets removed along with all space to its right.
> @@ -210,3 +210,9 @@ def gen_endif(ifcond: Sequence[str]) -> str:
>  #endif /* %(cond)s */
>  ''', cond=ifc)
>      return ret
> +
> +
> +def match_nofail(pattern: str, string: str) -> Match[str]:
> +    match = re.match(pattern, string)
> +    assert match is not None
> +    return match

Name it must_match()?  You choose.

I wish we could have more stating typing with less notational overhead,
but no free lunch...

[...]


