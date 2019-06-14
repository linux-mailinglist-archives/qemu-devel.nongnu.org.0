Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810B94547B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 08:07:48 +0200 (CEST)
Received: from localhost ([::1]:48682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbfNL-0007hR-Ob
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 02:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50088)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hbfKi-0005xi-NU
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 02:05:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hbfKh-0008BU-QA
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 02:05:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10047)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hbfKf-000899-PI; Fri, 14 Jun 2019 02:05:01 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 50FFA30917AB;
 Fri, 14 Jun 2019 06:04:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E8AD17CF8;
 Fri, 14 Jun 2019 06:04:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A99D111386A6; Fri, 14 Jun 2019 08:04:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20190613153405.24769-1-kwolf@redhat.com>
 <20190613153405.24769-8-kwolf@redhat.com>
Date: Fri, 14 Jun 2019 08:04:57 +0200
In-Reply-To: <20190613153405.24769-8-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 13 Jun 2019 17:33:57 +0200")
Message-ID: <874l4sitx2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 14 Jun 2019 06:04:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 07/15] Move monitor.c to monitor/misc.c
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

> Create a new monitor/ subdirectory and move monitor.c there. As the plan
> is to move the monitor core into separate files, use the chance to
> rename it to misc.c.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/devel/writing-qmp-commands.txt |  2 +-
>  monitor.c => monitor/misc.c         |  2 +-
>  MAINTAINERS                         |  4 ++--
>  Makefile.objs                       |  1 +
>  Makefile.target                     |  3 ++-
>  monitor/Makefile.objs               |  1 +
>  monitor/trace-events                | 11 +++++++++++
>  trace-events                        | 10 ----------
>  8 files changed, 19 insertions(+), 15 deletions(-)
>  rename monitor.c => monitor/misc.c (99%)
>  create mode 100644 monitor/Makefile.objs
>  create mode 100644 monitor/trace-events

I still think we should move hmp.h to include/monitor/.
hmp-commands-info.hx and hmp-commands.hx, too.  Not worth a respin by
itself.

