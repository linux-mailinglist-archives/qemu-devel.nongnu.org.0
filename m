Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0EEBB181
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 11:35:16 +0200 (CEST)
Received: from localhost ([::1]:54252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCKkV-0006vY-Hm
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 05:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <johannes@sipsolutions.net>) id 1iCKj8-0006Jy-Hi
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 05:33:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <johannes@sipsolutions.net>) id 1iCKj6-0005ZK-6B
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 05:33:49 -0400
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]:50752
 helo=sipsolutions.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <johannes@sipsolutions.net>)
 id 1iCKj5-0005Y9-Va
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 05:33:48 -0400
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <johannes@sipsolutions.net>)
 id 1iCKj1-0007Md-5k; Mon, 23 Sep 2019 11:33:43 +0200
Message-ID: <24d18f1c38356b19461e77275b94a1ebf89838f1.camel@sipsolutions.net>
Subject: Re: [Qemu-devel] [RFC] contrib: add vhost-user-sim
From: Johannes Berg <johannes@sipsolutions.net>
To: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 23 Sep 2019 11:33:41 +0200
In-Reply-To: <20190923092548.GA26219@stefanha-x1.localdomain>
 (sfid-20190923_112553_080668_DB35AF28)
References: <20190917122644.15736-1-johannes@sipsolutions.net>
 <20190923092548.GA26219@stefanha-x1.localdomain>
 (sfid-20190923_112553_080668_DB35AF28)
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:191:4433::2
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
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2019-09-23 at 10:25 +0100, Stefan Hajnoczi wrote:
> 
> According to unix(7):
> 
>   The addrlen argument that describes the enclosing sockaddr_un
>   structure should have a value of at least:
> 
>     offsetof(struct sockaddr_un, sun_path)+strlen(addr.sun_path)+1
> 
>   or, more simply, addrlen can be specified as sizeof(struct sockaddr_un).
> 
> Please either increase len by 1 or use sizeof(struct sockaddr_un).

Good catch, I actually realized this later as I was porting it elsewhere
but forgot to update this code.

> g_new0() cannot return NULL, please remove this if statement.

:-)

Shows I don't work with glib much ...

> > +static int full_read(int fd, void *_buf, size_t len)
> > +{
> > +    unsigned char *buf = _buf;
> > +    ssize_t ret;
> > +
> > +    do {
> > +        ret = read(fd, buf, len);
> > +        if (ret > 0) {
> > +            buf += ret;
> > +            len -= ret;
> > +        } else if (ret == 0) {
> > +            return 0;
> > +        } else {
> > +            return -errno;
> > +        }
> 
> Want to loop on EINTR?

Can we even get EINTR? We're not really expecting to deal with any
signals in this code, do we?

But I guess we can.

> > +    switch (msg->op) {
> > +    case UM_TIMETRAVEL_REQUEST:
> > +        if (calendar_entry_remove(&conn->entry)) {
> > +            conn->entry.time = conn->offset + msg->time;
> > +            calendar_entry_add(&conn->entry);
> > +            DPRINT(" %d | calendar entry added for %lld\n", conn->idx, msg->time);
> > +        } else {
> > +            conn->entry.time = conn->offset + msg->time;
> > +            DPRINT(" %d | calendar entry time updated for %lld\n", conn->idx, msg->time);
> > +        }
> 
> Just checking the expected semantics:
> 
> If the entry was already added, then we update the time and it stays
> scheduled.  If the entry was not already added then we just stash away
> the time but don't schedule it?

Right.

The first case is the "normally running" case, where the request is
coming in after UM_TIMETRAVEL_WAIT but before we sent it
UM_TIMETRAVEL_RUN, i.e. when the sender of the message got an interrupt
from elsewhere and needs to change the next runtime.

The second case is when it's requesting before it went into
UM_TIMETRAVEL_WAIT, in which case we just want the entry to the calendar
to be added for when we actually get _WAIT.

> Also, are the DPRINT() messages swapped in the if ... else ... bodies?
> They seem to be talking about the other case.

Or better rephrased I guess :)

> > diff --git a/include/standard-headers/linux/um_timetravel.h b/include/standard-headers/linux/um_timetravel.h
> > new file mode 100644
> > index 000000000000..3aaced426a92
> > --- /dev/null
> > +++ b/include/standard-headers/linux/um_timetravel.h
> > @@ -0,0 +1,107 @@
> 
> Please use scripts/update-linux-headers.sh to import this header file
> with the necessary conversions (e.g. #include <linux/types.h> ->
> #include "standard-headers/linux/types.h", __u64 -> uint64_t).

Hah, sure, wasn't aware of that.


Note, I'm not happy with this code at all, it deadlocks all the time.
Unfortunately I haven't really been able to figure out how to make glib
do what I wanted.

The first issue is that sometimes glib actually seems to reports an FD
as readable when it's not, so I even put them into non-blocking mode :(

The second is that I can't seem to understand how to do recursive
mainloops.

To really do this *well*, it should remain a single-threaded
application, but would need a hook like

run_mainloop_until_fd_readable(vdev->call_fd)

inside the libvhost-user.c code, and that's a bit ugly ... if I even
could figure out how to implement that in glib.

johannes


