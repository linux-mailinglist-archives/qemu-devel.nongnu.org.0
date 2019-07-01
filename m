Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EF6454AB
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 08:28:40 +0200 (CEST)
Received: from localhost ([::1]:48746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbfhW-0004pC-UL
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 02:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53691)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hbffn-00047v-5M
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 02:26:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hbfek-0003xp-0A
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 02:25:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56518)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hbfed-0003mc-A6; Fri, 14 Jun 2019 02:25:40 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1DCB385376;
 Fri, 14 Jun 2019 06:25:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF89560C44;
 Fri, 14 Jun 2019 06:25:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6836311386A6; Fri, 14 Jun 2019 08:25:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20190613153405.24769-1-kwolf@redhat.com>
 <20190613153405.24769-8-kwolf@redhat.com>
 <874l4sitx2.fsf@dusky.pond.sub.org>
Date: Fri, 14 Jun 2019 08:25:30 +0200
In-Reply-To: <874l4sitx2.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Fri, 14 Jun 2019 08:04:57 +0200")
Message-ID: <87muikheed.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 14 Jun 2019 06:25:33 +0000 (UTC)
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

Markus Armbruster <armbru@redhat.com> writes:

> Kevin Wolf <kwolf@redhat.com> writes:
>
>> Create a new monitor/ subdirectory and move monitor.c there. As the plan
>> is to move the monitor core into separate files, use the chance to
>> rename it to misc.c.
>>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  docs/devel/writing-qmp-commands.txt |  2 +-
>>  monitor.c => monitor/misc.c         |  2 +-
>>  MAINTAINERS                         |  4 ++--
>>  Makefile.objs                       |  1 +
>>  Makefile.target                     |  3 ++-
>>  monitor/Makefile.objs               |  1 +
>>  monitor/trace-events                | 11 +++++++++++
>>  trace-events                        | 10 ----------
>>  8 files changed, 19 insertions(+), 15 deletions(-)
>>  rename monitor.c => monitor/misc.c (99%)
>>  create mode 100644 monitor/Makefile.objs
>>  create mode 100644 monitor/trace-events
>
> I still think we should move hmp.h to include/monitor/.

Comment applies to the next patch, sorry.

> hmp-commands-info.hx and hmp-commands.hx, too.  Not worth a respin by
> itself.

