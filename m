Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CFF26C265
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 14:01:54 +0200 (CEST)
Received: from localhost ([::1]:48576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIW8H-0001fg-9y
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 08:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kIW1Y-0001Md-AQ
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:54:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kIW1U-0000V8-Fo
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600257291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8/WkIN3zqk/MjMLAzQ3kRjoBxXohAtKBI8IbighYvpQ=;
 b=Flof6GiQbULWy+mC4THtidgFsdwiHrEKrtay5VmOMCEdNmm100U7b3E9CVF37BA1JeobUN
 zl2n748O4WvwfcUthqnJfMIxjAm35KQXpKhgWX7fN5ggoZg2+9OqRVO/4YOM60n2XjE/nK
 eQFgc9I9leck0BXOOuFd1dl8jzNs4jI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-xRvwrIjfONmDgahGwoXJEw-1; Wed, 16 Sep 2020 07:54:48 -0400
X-MC-Unique: xRvwrIjfONmDgahGwoXJEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44E98EA1C0;
 Wed, 16 Sep 2020 11:54:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 806A167CF9;
 Wed, 16 Sep 2020 11:54:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0DDE7113864A; Wed, 16 Sep 2020 13:54:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 04/37] qapi: move generator entrypoint into module
References: <20200915224027.2529813-1-jsnow@redhat.com>
 <20200915224027.2529813-5-jsnow@redhat.com>
Date: Wed, 16 Sep 2020 13:54:44 +0200
In-Reply-To: <20200915224027.2529813-5-jsnow@redhat.com> (John Snow's message
 of "Tue, 15 Sep 2020 18:39:54 -0400")
Message-ID: <877dsuos1n.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:35:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> As part of delinting and adding type hints to the QAPI generator, it's
> helpful for the entrypoint to be part of the module, only leaving a very
> tiny entrypoint shim outside of the module.
>
> As a result, all of the include statements are reworked to be module-aware,
> as explicit relative imports.

Should this be split into two commits, one for each of the paragraphs
above?

PEP 8 recommends absolute imports, with one exception:

    However, explicit relative imports are an acceptable alternative to
    absolute imports, especially when dealing with complex package
    layouts where using absolute imports would be unnecessarily verbose:

        from . import sibling
        from .sibling import example

    Standard library code should avoid complex package layouts and
    always use absolute imports.

Do you think it covers your use of relative imports?

> This is done primarily for the benefit of python tooling (pylint, mypy,
> flake8, et al) which otherwise has trouble consistently resolving
> "qapi.x" to mean "a sibling file in this folder."

Can you give me an example of some tool having troube?

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi-gen.py        | 94 +++-----------------------------------
>  scripts/qapi/commands.py   |  4 +-
>  scripts/qapi/doc.py        |  2 +-
>  scripts/qapi/events.py     |  8 ++--
>  scripts/qapi/expr.py       |  4 +-
>  scripts/qapi/gen.py        |  4 +-
>  scripts/qapi/introspect.py |  8 ++--
>  scripts/qapi/parser.py     |  4 +-
>  scripts/qapi/schema.py     |  8 ++--
>  scripts/qapi/script.py     | 91 ++++++++++++++++++++++++++++++++++++
>  scripts/qapi/types.py      |  6 +--
>  scripts/qapi/visit.py      |  6 +--
>  12 files changed, 124 insertions(+), 115 deletions(-)
>  create mode 100644 scripts/qapi/script.py

Naming is hard...  main.py?

>
> diff --git a/scripts/qapi-gen.py b/scripts/qapi-gen.py
> index 59becba3e1..e649f8dd44 100644
> --- a/scripts/qapi-gen.py
> +++ b/scripts/qapi-gen.py
> @@ -1,97 +1,15 @@
>  #!/usr/bin/env python3
> -
> -# This work is licensed under the terms of the GNU GPL, version 2 or later.
> -# See the COPYING file in the top-level directory.
> -

Keep the license blurb.

[...]


