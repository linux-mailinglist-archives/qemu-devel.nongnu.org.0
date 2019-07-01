Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0594454FB
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 08:48:47 +0200 (CEST)
Received: from localhost ([::1]:48818 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbg0u-00041A-Mu
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 02:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57186)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hbfvG-0001pk-Eb
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 02:42:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hbfv7-0001Ay-F6
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 02:42:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43182)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hbfqD-0004T5-6Z; Fri, 14 Jun 2019 02:37:37 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 68404308212A;
 Fri, 14 Jun 2019 06:37:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38A5E5C257;
 Fri, 14 Jun 2019 06:37:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C3A9111386A6; Fri, 14 Jun 2019 08:37:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20190613153405.24769-1-kwolf@redhat.com>
 <20190613153405.24769-10-kwolf@redhat.com>
Date: Fri, 14 Jun 2019 08:37:29 +0200
In-Reply-To: <20190613153405.24769-10-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 13 Jun 2019 17:33:59 +0200")
Message-ID: <87h88shdue.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 14 Jun 2019 06:37:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 09/15] monitor: Create
 monitor-internal.h with common definitions
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

> Before we can split monitor/misc.c, we need to create a header file that
> contains the common definitions that will be used by multiple source
> files.
>
> For a start, add the type definitions for Monitor, MonitorHMP and
> MonitorQMP and their dependencies. We'll add functions as needed when
> splitting monitor/misc.c.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  monitor/monitor-internal.h | 148 +++++++++++++++++++++++++++++++++++++
>  monitor/misc.c             | 110 +--------------------------
>  MAINTAINERS                |   2 +
>  3 files changed, 151 insertions(+), 109 deletions(-)
>  create mode 100644 monitor/monitor-internal.h
>
> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> new file mode 100644
> index 0000000000..17a632b0ad
> --- /dev/null
> +++ b/monitor/monitor-internal.h
> @@ -0,0 +1,148 @@
> +/*
> + * QEMU monitor
> + *
> + * Copyright (c) 2003-2004 Fabrice Bellard
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef MONITOR_INT_H
> +#define MONITOR_INT_H

Rename to MONITOR_INTERNAL_H, so it again matches the file name.  Can
touch up in my tree.

> +
> +#include "monitor/monitor.h"
> +#include "qapi/qmp/qdict.h"

These too are superfluous.  I'm willing to tolerate monitor.h anyway,
since anything including monitor-internal.h is almost certainly going to
need monitor.h, too.

> +#include "qapi/qmp/json-parser.h"
> +#include "qapi/qmp/dispatch.h"
> +#include "qapi/qapi-types-misc.h"
> +
> +#include "qemu/readline.h"
> +#include "chardev/char-fe.h"
> +#include "sysemu/iothread.h"

Another superfluous one.

Happy to drop these two #include in my tree.

[...]

With that:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

