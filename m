Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4022E49DBE5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 08:50:13 +0100 (CET)
Received: from localhost ([::1]:55092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCzXn-0005Je-Tf
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 02:50:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCz8t-0001pt-LZ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:24:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCz8q-0004Cq-P4
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643268263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6+DP+eaVuddOqss1nFq0v0t/QawddfeM/yt18+SNU9c=;
 b=fLRvcWfLnHg/xCp/iiJGyLV7ihQyh+Ov2WHsYqWXdKKCt9249aZU9l4bU8BUt7xmVzCiY1
 5IRZ1U4mUxZdiLwZQGvlXdXTXALvoTbBa2sxo8F66waTITRzSolP90CqH9Cg/lUaJbWQwK
 JCn8Axc6JjR0gGO+2hWkqWboJBRaScU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-_bLYxnMGPnSxFqEZIeCf_A-1; Thu, 27 Jan 2022 02:24:20 -0500
X-MC-Unique: _bLYxnMGPnSxFqEZIeCf_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99C551083F62;
 Thu, 27 Jan 2022 07:24:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 398DF78DD7;
 Thu, 27 Jan 2022 07:24:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BCFA0113864A; Thu, 27 Jan 2022 08:24:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 3/7] qapi/commands: Optionally generate trace for QMP
 commands
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
 <20220126161130.3240892-4-vsementsov@virtuozzo.com>
Date: Thu, 27 Jan 2022 08:24:13 +0100
In-Reply-To: <20220126161130.3240892-4-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 26 Jan 2022 17:11:26 +0100")
Message-ID: <87y231vdya.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Add trace generation disabled by default and new option --gen-trace to
> enable it.  The next commit will enable it for qapi/, but not for qga/
> and tests/.  Making it work for the latter two would involve some Meson
> hackery to ensure we generate the trace-events files before trace-tool
> uses them.  Since we don't actually support tracing there, we'll bypass
> that problem.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  scripts/qapi/commands.py | 91 +++++++++++++++++++++++++++++++++++-----
>  scripts/qapi/main.py     | 14 +++++--
>  2 files changed, 91 insertions(+), 14 deletions(-)
>
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index 17e5ed2414..fa90b6246b 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py

[...]

> @@ -265,6 +319,17 @@ def _begin_user_module(self, name: str) -> None:
>  
>  ''',
>                               commands=commands, visit=visit))
> +
> +        if self._gen_tracing and commands != 'qapi-commands':
> +            self._genc.add(mcgen('''
> +#include "trace/trace-qapi.h"

I believe this include is superfluous.

> +#include "qapi/qmp/qjson.h"
> +#include "trace/trace-%(nm)s_trace_events.h"
> +''',
> +                                 nm=c_name(commands, protect=False)))
> +            # We use c_name(commands, protect=False) to turn '-' into '_', to
> +            # match .underscorify() in trace/meson.build
> +
>          self._genh.add(mcgen('''
>  #include "%(types)s.h"
>  

[...]


