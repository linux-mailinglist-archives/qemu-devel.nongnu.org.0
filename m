Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F90747DAC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 10:55:09 +0200 (CEST)
Received: from localhost ([::1]:45284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcnPw-0002sH-CA
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 04:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48498)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hcnP7-0002NQ-OX
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 04:54:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hcnP6-00051t-Ko
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 04:54:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47142)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hcnP3-0004rD-QQ; Mon, 17 Jun 2019 04:54:13 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6AAAC3084243;
 Mon, 17 Jun 2019 08:54:04 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-99.ams2.redhat.com [10.36.117.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E5F468434;
 Mon, 17 Jun 2019 08:54:01 +0000 (UTC)
Date: Mon, 17 Jun 2019 10:53:59 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190617085359.GA7397@linux.fritz.box>
References: <20190613153405.24769-1-kwolf@redhat.com>
 <87muikedsg.fsf@dusky.pond.sub.org>
 <20190614093219.GC6042@dhcp-200-226.str.redhat.com>
 <8736kabnfz.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8736kabnfz.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 17 Jun 2019 08:54:04 +0000 (UTC)
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

Am 15.06.2019 um 22:31 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 14.06.2019 um 11:06 hat Markus Armbruster geschrieben:
> >> Kevin Wolf <kwolf@redhat.com> writes:
> >> 
> >> > monitor.c mixes a lot of different things in a single file: The core
> >> > monitor infrastructure, HMP infrastrcture, QMP infrastructure, and the
> >> > implementation of several HMP and QMP commands. Almost worse, struct
> >> > Monitor mixes state for HMP, for QMP, and state actually shared between
> >> > all monitors. monitor.c must be linked with a system emulator and even
> >> > requires per-target compilation because some of the commands it
> >> > implements access system emulator state.
> >> >
> >> > The reason why I care about this is that I'm working on a protoype for a
> >> > storage daemon, which wants to use QMP (but probably not HMP) and
> >> > obviously doesn't have any system emulator state. So I'm interested in
> >> > some core monitor parts that can be linked to non-system-emulator tools.
> >> >
> >> > This series first creates separate structs MonitorQMP and MonitorHMP
> >> > which inherit from Monitor, and then moves the associated infrastructure
> >> > code into separate source files.
> >> >
> >> > While the split is probably not perfect, I think it's an improvement of
> >> > the current state even for QEMU proper, and it's good enough so I can
> >> > link my storage daemon against just monitor/core.o and monitor/qmp.o and
> >> > get a useless QMP monitor that parses the JSON input and rejects
> >> > everything as an unknown command.
> >> >
> >> > Next I'll try to teach it a subset of QMP commands that can actually be
> >> > supported in a tool, but while there will be a few follow-up patches to
> >> > achieve this, I don't expect that this work will bring up much that
> >> > needs to be changed in the splitting process done in this series.
> >> 
> >> I think I can address the remaining rather minor issues without a
> >> respin.  Please let me know if you disagree with any of my remarks.
> >
> > Feel free to make the changes you suggested, possibly with the exception
> > of the #includes in monitor-internal.h where I think you're only
> > partially right (see my reply there).
> >
> > Please also consider fixing the commit message typo I pointed out for
> > patch 15.
> 
> Done.  Result in my public repository https://repo.or.cz/qemu/armbru.git
> tag pull-monitor-2019-06-15, just in case you want to run your eyes over
> it.  Incremental diff appended.

I didn't actually apply the patch or checkout your branch, but at least
from reading the diff it looks okay.

Kevin

