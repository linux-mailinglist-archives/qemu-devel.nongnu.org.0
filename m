Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC06432DB
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 07:48:27 +0200 (CEST)
Received: from localhost ([::1]:37054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbIb4-0001yz-Dj
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 01:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55486)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hbIYn-0000sb-F8
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 01:46:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hbIXP-00005T-F4
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 01:44:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51654)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hbIXN-0008Vp-Hj; Thu, 13 Jun 2019 01:44:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A48B1C057E65;
 Thu, 13 Jun 2019 05:44:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4645980CB;
 Thu, 13 Jun 2019 05:44:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B81481138648; Thu, 13 Jun 2019 07:44:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20190611134043.9524-1-kwolf@redhat.com>
 <20190611134043.9524-11-kwolf@redhat.com>
 <87wohrx7r7.fsf@dusky.pond.sub.org>
 <20190612153108.GF9699@localhost.localdomain>
Date: Thu, 13 Jun 2019 07:44:34 +0200
In-Reply-To: <20190612153108.GF9699@localhost.localdomain> (Kevin Wolf's
 message of "Wed, 12 Jun 2019 17:31:08 +0200")
Message-ID: <87tvcuqbst.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 13 Jun 2019 05:44:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 10/11] monitor: Split out monitor/hmp.c
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

> Am 12.06.2019 um 15:17 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > Move HMP infrastructure from monitor/misc.c to monitor/hmp.c. This is
>> > code that can be shared for all targets, so compile it only once.
>> >
>> > The amount of function and particularly extern variables in
>> > monitor_int.h is probably a bit larger than it needs to be, but this way
>> > no non-trivial code modifications are needed. The interfaces between HMP
>> > and the monitor core can be cleaned up later.
>> >
>> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> > ---
>> >  include/monitor/monitor.h |    1 +
>> >  monitor/monitor_int.h     |   31 +
>> >  monitor/hmp.c             | 1387 +++++++++++++++++++++++++++++++++++++
>> >  monitor/misc.c            | 1338 +----------------------------------
>> >  monitor/Makefile.objs     |    2 +-
>> >  monitor/trace-events      |    4 +-
>> >  6 files changed, 1429 insertions(+), 1334 deletions(-)
>> >  create mode 100644 monitor/hmp.c
>> >
>> > diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
>> > index 7bbab05320..8547529e49 100644
>> > --- a/include/monitor/monitor.h
>> > +++ b/include/monitor/monitor.h
>> > @@ -22,6 +22,7 @@ bool monitor_cur_is_qmp(void);
>> >  void monitor_init_globals(void);
>> >  void monitor_init(Chardev *chr, int flags);
>> >  void monitor_init_qmp(Chardev *chr, int flags);
>> > +void monitor_init_hmp(Chardev *chr, int flags);
>> >  void monitor_cleanup(void);
>> >  
>> >  int monitor_suspend(Monitor *mon);
>> > diff --git a/monitor/monitor_int.h b/monitor/monitor_int.h
>> > index 4aabee54e1..88eaed9c5c 100644
>> > --- a/monitor/monitor_int.h
>> > +++ b/monitor/monitor_int.h
>> > @@ -27,6 +27,7 @@
>> >  
>> >  #include "qemu-common.h"
>> >  #include "monitor/monitor.h"
>> > +#include "qemu/cutils.h"
>> >  
>> >  #include "qapi/qmp/qdict.h"
>> >  #include "qapi/qmp/json-parser.h"
>> > @@ -154,6 +155,29 @@ static inline bool monitor_is_qmp(const Monitor *mon)
>> >      return (mon->flags & MONITOR_USE_CONTROL);
>> >  }
>> >  
>> > +/**
>> > + * Is @name in the '|' separated list of names @list?
>> > + */
>> > +static inline int compare_cmd(const char *name, const char *list)
>> > +{
>> > +    const char *p, *pstart;
>> > +    int len;
>> > +    len = strlen(name);
>> > +    p = list;
>> > +    for (;;) {
>> > +        pstart = p;
>> > +        p = qemu_strchrnul(p, '|');
>> > +        if ((p - pstart) == len && !memcmp(pstart, name, len)) {
>> > +            return 1;
>> > +        }
>> > +        if (*p == '\0') {
>> > +            break;
>> > +        }
>> > +        p++;
>> > +    }
>> > +    return 0;
>> > +}
>> > +
>> 
>> What's the justification for inline?
>
> It seemed small enough, but maybe it isn't (it has also grown by two
> lines after fixing the coding style). I can leave it in misc.c and just
> make it public.

Yes, please.

> I'd just need a more specific name than compare_cmd() to make it public.

Arguably a good idea even for static inlines in an internal header :)

>> >  typedef QTAILQ_HEAD(MonitorList, Monitor) MonitorList;
>> >  extern IOThread *mon_iothread;
>> >  extern QEMUBH *qmp_dispatcher_bh;
>> > @@ -162,6 +186,8 @@ extern QemuMutex monitor_lock;
>> >  extern MonitorList mon_list;
>> >  extern int mon_refcount;
>> >  
>> > +extern mon_cmd_t mon_cmds[];
>> > +
>> 
>> Any particular reason for not moving this one to hmp.c, along with
>> info_cmds?  Question, not demand :)
>
> Yes, it's not part of the core infrastructure, but contains commands
> specific to the system emulator. If a tool were to use HMP, it would
> have to provide its own command tables.
>
> If we ever create a monitor/hmp-sysemu.c or something like it, this
> would be a good place for the tables.

I'm very much in favor of splitting up monitor/misc.c further.  It's
okay to leave that for later, of course.

