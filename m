Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93D3198F3E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 11:01:57 +0200 (CEST)
Received: from localhost ([::1]:34222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJCmS-0003E0-Sf
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 05:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jJCl4-0002hU-Me
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 05:00:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jJCl3-0004Ch-7X
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 05:00:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54967
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jJCl3-0004CH-3B
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 05:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585645228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=baA2q1erCPl/u1jhOO+OGGUytcuY31TOiWSZERdgZWs=;
 b=Vt/jlEfWkAvF1745kLC08XsoPhAQN5/7O1brggsg3lPzbu0mXLIvcz2uOlPRx3Uflstkmo
 beyCCUhncZSA0IytbI3rvS7AX2t9tl9l8kF/iX1jyF8wthZ43iFFR9LAyl6j08s9/MiA3U
 2IxVePCbaD5ApEMBeVlkboGrBNZL7o4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-KGdr-35qMvacckLmd7FfMw-1; Tue, 31 Mar 2020 05:00:25 -0400
X-MC-Unique: KGdr-35qMvacckLmd7FfMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB0AB100551A;
 Tue, 31 Mar 2020 09:00:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-69.ams2.redhat.com
 [10.36.112.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FA6F100EBB6;
 Tue, 31 Mar 2020 09:00:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2778511385E2; Tue, 31 Mar 2020 11:00:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 1/6] scripts/coccinelle: add error-use-after-free.cocci
References: <20200324153630.11882-1-vsementsov@virtuozzo.com>
 <20200324153630.11882-2-vsementsov@virtuozzo.com>
Date: Tue, 31 Mar 2020 11:00:12 +0200
In-Reply-To: <20200324153630.11882-2-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 24 Mar 2020 18:36:25 +0300")
Message-ID: <87bloc3nmr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org,
 quintela@redhat.com, dgilbert@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com, den@openvz.org, mreitz@redhat.com,
 jsnow@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Add script to find and fix trivial use-after-free of Error objects.
> How to use:
> spatch --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
>  --macro-file scripts/cocci-macro-file.h --in-place \
>  --no-show-diff ( FILES... | --use-gitgrep . )

Pasto: you mean scripts/coccinelle/error-use-after-free.cocci.

--use-gitgrep is just one of several methods.  Any particular reason for
recommending it over the others?

>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  scripts/coccinelle/error-use-after-free.cocci | 52 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 scripts/coccinelle/error-use-after-free.cocci
>
> diff --git a/scripts/coccinelle/error-use-after-free.cocci b/scripts/cocc=
inelle/error-use-after-free.cocci
> new file mode 100644
> index 0000000000..7cfa42355b
> --- /dev/null
> +++ b/scripts/coccinelle/error-use-after-free.cocci
> @@ -0,0 +1,52 @@
> +// Find and fix trivial use-after-free of Error objects
> +//
> +// Copyright (c) 2020 Virtuozzo International GmbH.
> +//
> +// This program is free software; you can redistribute it and/or
> +// modify it under the terms of the GNU General Public License as
> +// published by the Free Software Foundation; either version 2 of the
> +// License, or (at your option) any later version.
> +//
> +// This program is distributed in the hope that it will be useful,
> +// but WITHOUT ANY WARRANTY; without even the implied warranty of
> +// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +// GNU General Public License for more details.
> +//
> +// You should have received a copy of the GNU General Public License
> +// along with this program.  If not, see
> +// <http://www.gnu.org/licenses/>.
> +//
> +// How to use:
> +// spatch --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
> +//  --macro-file scripts/cocci-macro-file.h --in-place \
> +//  --no-show-diff ( FILES... | --use-gitgrep . )

Same pasto.

I doubt including basic spatch instructions with every script is a good
idea.  Better explain it in one place, with proper maintenance.
scripts/coccinelle/README?  We could be a bit more verbose there,
e.g. to clarify required vs. suggested options.

> +
> +@ exists@
> +identifier fn, fn2;
> +expression err;
> +@@
> +
> + fn(...)
> + {
> +     <...
> +(
> +     error_free(err);
> ++    err =3D NULL;
> +|
> +     error_report_err(err);
> ++    err =3D NULL;
> +|
> +     error_reportf_err(err, ...);
> ++    err =3D NULL;
> +|
> +     warn_report_err(err);
> ++    err =3D NULL;
> +|
> +     warn_reportf_err(err, ...);
> ++    err =3D NULL;
> +)
> +     ... when !=3D err =3D NULL
> +         when !=3D exit(...)
> +     fn2(..., err, ...)
> +     ...>
> + }

This inserts err =3D NULL after error_free() if there is a path to a
certain kind of use of @err without such an assignment.

The "when !=3D exit()" part excludes certain "phony" paths.  It's not a
tight check; there are other ways to unconditionally terminate the
process or jump elsewhere behind Coccinelle's back.  Not a problem, the
script is meant to have its output reviewed manually.

Should we mention the need to review the script's output?

> diff --git a/MAINTAINERS b/MAINTAINERS
> index b5c86ec494..ba97cc43fc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2037,6 +2037,7 @@ F: include/qemu/error-report.h
>  F: qapi/error.json
>  F: util/error.c
>  F: util/qemu-error.c
> +F: scripts/coccinelle/*err*.cocci

Silently captures existing scripts in addition to this new one.
Tolerable.  The globbing looks rather brittle, though.

> =20
>  GDB stub
>  M: Alex Benn=C3=A9e <alex.bennee@linaro.org>


