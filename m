Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C74045787
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 10:31:53 +0200 (CEST)
Received: from localhost ([::1]:49272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbhcm-0003Mx-A9
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 04:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54923)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hbhau-0002gS-Kw
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 04:29:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hbhat-0001qR-M0
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 04:29:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34899)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hbhar-0001n5-Eb; Fri, 14 Jun 2019 04:29:53 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7F9D13082E56;
 Fri, 14 Jun 2019 08:29:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 498927BE97;
 Fri, 14 Jun 2019 08:29:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BADA811386A6; Fri, 14 Jun 2019 10:29:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20190613153405.24769-1-kwolf@redhat.com>
 <20190613153405.24769-13-kwolf@redhat.com>
Date: Fri, 14 Jun 2019 10:29:42 +0200
In-Reply-To: <20190613153405.24769-13-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 13 Jun 2019 17:34:02 +0200")
Message-ID: <87tvcsfu2x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 14 Jun 2019 08:29:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 12/15] monitor: Split out
 monitor/monitor.c
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Move the monitor core infrastructure from monitor/misc.c to
> monitor/monitor.c. This is code that can be shared for all targets, so
> compile it only once.
>
> What remains in monitor/misc.c after this patch is mostly monitor
> command implementations (which could move to hmp-cmds.c or qmp-cmds.c
> later) and code that requires a system emulator or is even
> target-dependent (including HMP command completion code).
>
> The amount of function and particularly extern variables in
> monitor_int.h is probably a bit larger than it needs to be, but this way
> no non-trivial code modifications are needed. The interfaces between all
> monitor parts can be cleaned up later.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
[...]
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> new file mode 100644
> index 0000000000..6802b8e491
> --- /dev/null
> +++ b/monitor/monitor.c
> @@ -0,0 +1,637 @@
[...]
> +QemuOptsList qemu_mon_opts = {
> +    .name = "mon",
> +    .implied_opt_name = "chardev",
> +    .head = QTAILQ_HEAD_INITIALIZER(qemu_mon_opts.head),
> +    .desc = {
> +        {
> +            .name = "mode",
> +            .type = QEMU_OPT_STRING,
> +        },{
> +            .name = "chardev",
> +            .type = QEMU_OPT_STRING,
> +        },{
> +            .name = "pretty",
> +            .type = QEMU_OPT_BOOL,
> +        },
> +        { /* end of list */ }

checkpatch.pl gripes:

    WARNING: Block comments use a leading /* on a separate line

I agree with ignoring this one, because it's the way it looks
everywhere.

> +    },
> +};
[...]

Reviewed-by: Markus Armbruster <armbru@redhat.com>

