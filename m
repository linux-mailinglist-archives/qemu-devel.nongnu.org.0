Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 091F8458F9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 11:41:19 +0200 (CEST)
Received: from localhost ([::1]:49610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbihy-0006fw-8D
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 05:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40605)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hbieJ-0004gq-2T
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 05:37:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hbiZQ-0000t8-Jn
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 05:32:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41168)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hbiZP-0000sU-AV; Fri, 14 Jun 2019 05:32:27 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6F86E3084213;
 Fri, 14 Jun 2019 09:32:21 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6075839C3;
 Fri, 14 Jun 2019 09:32:20 +0000 (UTC)
Date: Fri, 14 Jun 2019 11:32:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190614093219.GC6042@dhcp-200-226.str.redhat.com>
References: <20190613153405.24769-1-kwolf@redhat.com>
 <87muikedsg.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87muikedsg.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 14 Jun 2019 09:32:21 +0000 (UTC)
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

Am 14.06.2019 um 11:06 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > monitor.c mixes a lot of different things in a single file: The core
> > monitor infrastructure, HMP infrastrcture, QMP infrastructure, and the
> > implementation of several HMP and QMP commands. Almost worse, struct
> > Monitor mixes state for HMP, for QMP, and state actually shared between
> > all monitors. monitor.c must be linked with a system emulator and even
> > requires per-target compilation because some of the commands it
> > implements access system emulator state.
> >
> > The reason why I care about this is that I'm working on a protoype for a
> > storage daemon, which wants to use QMP (but probably not HMP) and
> > obviously doesn't have any system emulator state. So I'm interested in
> > some core monitor parts that can be linked to non-system-emulator tools.
> >
> > This series first creates separate structs MonitorQMP and MonitorHMP
> > which inherit from Monitor, and then moves the associated infrastructure
> > code into separate source files.
> >
> > While the split is probably not perfect, I think it's an improvement of
> > the current state even for QEMU proper, and it's good enough so I can
> > link my storage daemon against just monitor/core.o and monitor/qmp.o and
> > get a useless QMP monitor that parses the JSON input and rejects
> > everything as an unknown command.
> >
> > Next I'll try to teach it a subset of QMP commands that can actually be
> > supported in a tool, but while there will be a few follow-up patches to
> > achieve this, I don't expect that this work will bring up much that
> > needs to be changed in the splitting process done in this series.
> 
> I think I can address the remaining rather minor issues without a
> respin.  Please let me know if you disagree with any of my remarks.

Feel free to make the changes you suggested, possibly with the exception
of the #includes in monitor-internal.h where I think you're only
partially right (see my reply there).

Please also consider fixing the commit message typo I pointed out for
patch 15.

Kevin

