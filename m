Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D374245837
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 11:08:17 +0200 (CEST)
Received: from localhost ([::1]:49474 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbiC1-0007e2-26
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 05:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35224)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hbiAs-00070u-EE
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 05:07:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hbiAr-0002Kp-EG
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 05:07:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43510)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hbiAp-0002It-4j; Fri, 14 Jun 2019 05:07:03 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5B15B859FC;
 Fri, 14 Jun 2019 09:06:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2657C5D9C3;
 Fri, 14 Jun 2019 09:06:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AF6B011386A6; Fri, 14 Jun 2019 11:06:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20190613153405.24769-1-kwolf@redhat.com>
Date: Fri, 14 Jun 2019 11:06:55 +0200
In-Reply-To: <20190613153405.24769-1-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 13 Jun 2019 17:33:50 +0200")
Message-ID: <87muikedsg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 14 Jun 2019 09:06:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 00/15] monitor: Split monitor.c in
 core/HMP/QMP/misc
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

> monitor.c mixes a lot of different things in a single file: The core
> monitor infrastructure, HMP infrastrcture, QMP infrastructure, and the
> implementation of several HMP and QMP commands. Almost worse, struct
> Monitor mixes state for HMP, for QMP, and state actually shared between
> all monitors. monitor.c must be linked with a system emulator and even
> requires per-target compilation because some of the commands it
> implements access system emulator state.
>
> The reason why I care about this is that I'm working on a protoype for a
> storage daemon, which wants to use QMP (but probably not HMP) and
> obviously doesn't have any system emulator state. So I'm interested in
> some core monitor parts that can be linked to non-system-emulator tools.
>
> This series first creates separate structs MonitorQMP and MonitorHMP
> which inherit from Monitor, and then moves the associated infrastructure
> code into separate source files.
>
> While the split is probably not perfect, I think it's an improvement of
> the current state even for QEMU proper, and it's good enough so I can
> link my storage daemon against just monitor/core.o and monitor/qmp.o and
> get a useless QMP monitor that parses the JSON input and rejects
> everything as an unknown command.
>
> Next I'll try to teach it a subset of QMP commands that can actually be
> supported in a tool, but while there will be a few follow-up patches to
> achieve this, I don't expect that this work will bring up much that
> needs to be changed in the splitting process done in this series.

I think I can address the remaining rather minor issues without a
respin.  Please let me know if you disagree with any of my remarks.

Thanks for helping out with the monitor code!  I know it's rather crusty
in places.

Dave, I'll take this through my tree, if you don't mind.

