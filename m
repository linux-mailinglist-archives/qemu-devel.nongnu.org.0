Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF79F2D5BD4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:32:58 +0100 (CET)
Received: from localhost ([::1]:53192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knM41-0003Jx-Nu
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1knLTt-0006Mn-KZ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:55:37 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:47910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1knLTq-0002ky-Hi
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:55:37 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BACoFlH027727;
 Thu, 10 Dec 2020 12:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=2XLEjrSo/q9MZ88Bqu2jzNpMsOS+BnJwwQBIb7UrpC8=;
 b=LlR2rAVp+Ab/zWO8Z7wdyH7FnRnafVZW80jMnGLyPPVn15MWyrJ3bEC887eKcDD3sVlp
 k7etGdgYTqgS3x5/iRVZ8bcWGUXVE4wg1P0F5kdeVkPe+hMY3Es4kvD9cN3D+OFguyVK
 gmgqoSFOXzn2yy6kce6ezip1jjtlH07QOZLJCZ5InnHgkzaDzFKaNpiWnGii1wT8kmn0
 Z4BBXNA0oZsEVWef01BsBLruRYkoqRGX0o/xoq+0LfDe0r31oJpIFjGYZOb2yDkf5JL5
 iOBiYRVu1tDWRmehglfQpD9kbGYo7i761PL6itFxHL7lNd7mVHM6KeOgX6ZsOk2XLZul sw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 3581mr55d4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Dec 2020 12:55:14 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BAConEq173624;
 Thu, 10 Dec 2020 12:53:14 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 358m41ng6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 12:53:13 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BACr8T4029099;
 Thu, 10 Dec 2020 12:53:08 GMT
Received: from heatpipe (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 10 Dec 2020 04:53:08 -0800
Date: Thu, 10 Dec 2020 04:53:05 -0800
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v12 08/19] multi-process: define MPQemuMsg format and
 transmission functions
Message-ID: <20201210125305.GA1052517@heatpipe>
References: <cover.1606853298.git.jag.raman@oracle.com>
 <b9bcba65f98a763669255dd1bc6533bc8310a235.1606853298.git.jag.raman@oracle.com>
 <CAJ+F1CK+NHESWKSHEdvJ3j95iiAAY9LkrVw7zSrQpWMj8jNEAw@mail.gmail.com>
 <20201210014005.GA48815@flaka>
 <CAJ+F1CKQLU_=bJwHaFCmiOfmp4XitHMo92fn_Xw9MpAeX3FqEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CKQLU_=bJwHaFCmiOfmp4XitHMo92fn_Xw9MpAeX3FqEg@mail.gmail.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9830
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=2 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100083
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9830
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 mlxlogscore=999
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100083
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=elena.ufimtseva@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 10, 2020 at 12:20:06PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Dec 10, 2020 at 5:42 AM Elena Ufimtseva <elena.ufimtseva@oracle.com>
> wrote:
> 
> > On Mon, Dec 07, 2020 at 05:18:46PM +0400, Marc-André Lureau wrote:
> > > Hi
> > >
> > > On Wed, Dec 2, 2020 at 12:25 AM Jagannathan Raman <jag.raman@oracle.com>
> > > wrote:
> > >
> > > > From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > > >
> > > > Defines MPQemuMsg, which is the message that is sent to the remote
> > > > process. This message is sent over QIOChannel and is used to
> > > > command the remote process to perform various tasks.
> > > > Define transmission functions used by proxy and by remote.
> > > > There are certain restrictions on where its safe to use these
> > > > functions:
> > > >   - From main loop in co-routine context. Will block the main loop if
> > not
> > > > in
> > > >     co-routine context;
> > > >   - From vCPU thread with no co-routine context and if the channel is
> > not
> > > > part
> > > >     of the main loop handling;
> > > >   - From IOThread within co-routine context, outside of co-routine
> > context
> > > > will
> > > >     block IOThread;
> > > >
> > > > Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > > > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > > > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > > > ---
> > > >  include/hw/remote/mpqemu-link.h |  60 ++++++++++
> > > >  hw/remote/mpqemu-link.c         | 242
> > > > ++++++++++++++++++++++++++++++++++++++++
> > > >  MAINTAINERS                     |   2 +
> > > >  hw/remote/meson.build           |   1 +
> > > >  4 files changed, 305 insertions(+)
> > > >  create mode 100644 include/hw/remote/mpqemu-link.h
> > > >  create mode 100644 hw/remote/mpqemu-link.c
> > > >
> > > > diff --git a/include/hw/remote/mpqemu-link.h
> > > > b/include/hw/remote/mpqemu-link.h
> > > > new file mode 100644
> > > > index 0000000..2d79ff8
> > > > --- /dev/null
> > > > +++ b/include/hw/remote/mpqemu-link.h
> > > > @@ -0,0 +1,60 @@
> > > > +/*
> > > > + * Communication channel between QEMU and remote device process
> > > > + *
> > > > + * Copyright © 2018, 2020 Oracle and/or its affiliates.
> > > > + *
> > > > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > > > later.
> > > > + * See the COPYING file in the top-level directory.
> > > > + *
> > > > + */
> > > > +
> > > > +#ifndef MPQEMU_LINK_H
> > > > +#define MPQEMU_LINK_H
> > > > +
> > > > +#include "qom/object.h"
> > > > +#include "qemu/thread.h"
> > > > +#include "io/channel.h"
> > > > +
> > > > +#define REMOTE_MAX_FDS 8
> > > > +
> > > > +#define MPQEMU_MSG_HDR_SIZE offsetof(MPQemuMsg, data.u64)
> > > > +
> > > > +/**
> > > > + * MPQemuCmd:
> > > > + *
> > > > + * MPQemuCmd enum type to specify the command to be executed on the
> > remote
> > > > + * device.
> > > > + */
> > > > +typedef enum {
> > > > +    MPQEMU_CMD_INIT,
> > > > +    MPQEMU_CMD_MAX,
> > > > +} MPQemuCmd;
> > > > +
> > > > +/**
> > > > + * MPQemuMsg:
> > > > + * @cmd: The remote command
> > > > + * @size: Size of the data to be shared
> > > > + * @data: Structured data
> > > > + * @fds: File descriptors to be shared with remote device
> > > > + *
> > > > + * MPQemuMsg Format of the message sent to the remote device from
> > QEMU.
> > > > + *
> > > > + */
> > > > +typedef struct {
> > > > +    int cmd;
> > > > +    size_t size;
> > > > +
> > > > +    union {
> > > > +        uint64_t u64;
> > > > +    } data;
> > > > +
> > > > +    int fds[REMOTE_MAX_FDS];
> > > > +    int num_fds;
> > > > +} MPQemuMsg;
> > > > +
> > > > +void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
> > > > +void mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
> > > > +
> > > > +bool mpqemu_msg_valid(MPQemuMsg *msg);
> > > > +
> > > > +#endif
> > > > diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
> > > > new file mode 100644
> > > > index 0000000..e535ed2
> > > > --- /dev/null
> > > > +++ b/hw/remote/mpqemu-link.c
> > > > @@ -0,0 +1,242 @@
> > > > +/*
> > > > + * Communication channel between QEMU and remote device process
> > > > + *
> > > > + * Copyright © 2018, 2020 Oracle and/or its affiliates.
> > > > + *
> > > > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > > > later.
> > > > + * See the COPYING file in the top-level directory.
> > > > + *
> > > > + */
> > > > +
> > > > +#include "qemu/osdep.h"
> > > > +#include "qemu-common.h"
> > > > +
> > > > +#include "qemu/module.h"
> > > > +#include "hw/remote/mpqemu-link.h"
> > > > +#include "qapi/error.h"
> > > > +#include "qemu/iov.h"
> > > > +#include "qemu/error-report.h"
> > > > +#include "qemu/main-loop.h"
> > > > +
> > > > +/*
> > > > + * Send message over the ioc QIOChannel.
> > > > + * This function is safe to call from:
> > > > + * - From main loop in co-routine context. Will block the main loop if
> > > > not in
> > > > + *   co-routine context;
> > > > + * - From vCPU thread with no co-routine context and if the channel is
> > > > not part
> > > > + *   of the main loop handling;
> > > > + * - From IOThread within co-routine context, outside of co-routine
> > > > context
> > > > + *   will block IOThread;
> > > >
> > >
> > > Can drop the extra "From" on each line.
> > >
> > > + */
> > > > +void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
> > > > +{
> > > > +    bool iolock = qemu_mutex_iothread_locked();
> > > > +    bool iothread = qemu_get_current_aio_context() ==
> > > > qemu_get_aio_context() ?
> > > > +                    false : true;
> > > >
> > >
> > > I would introduce a qemu_in_iothread() helper (similar to
> > > qemu_in_coroutine() etc)
> > >
> > > +    Error *local_err = NULL;
> > > > +    struct iovec send[2] = {0};
> > > > +    int *fds = NULL;
> > > > +    size_t nfds = 0;
> > > > +
> > > > +    send[0].iov_base = msg;
> > > > +    send[0].iov_len = MPQEMU_MSG_HDR_SIZE;
> > > > +
> > > > +    send[1].iov_base = (void *)&msg->data;
> > > > +    send[1].iov_len = msg->size;
> > > > +
> > > > +    if (msg->num_fds) {
> > > > +        nfds = msg->num_fds;
> > > > +        fds = msg->fds;
> > > > +    }
> > > > +    /*
> > > > +     * Dont use in IOThread out of co-routine context as
> > > > +     * it will block IOThread.
> > > > +     */
> > > > +    if (iothread) {
> > > > +        assert(qemu_in_coroutine());
> > > > +    }
> > > >
> > >
> > > or simply assert(!iothread || qemu_in_coroutine())
> > >
> > > +    /*
> > > > +     * Skip unlocking/locking iothread when in IOThread running
> > > > +     * in co-routine context. Co-routine context is asserted above
> > > > +     * for IOThread case.
> > > > +     * Also skip this while in a co-routine in the main context.
> > > > +     */
> > > > +    if (iolock && !iothread && !qemu_in_coroutine()) {
> > > > +        qemu_mutex_unlock_iothread();
> > > > +    }
> > > > +
> > > > +    (void)qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send),
> > fds,
> > > > nfds,
> > > > +                                      &local_err);
> > > >
> > >
> > > That extra (void) is probably unnecessary.
> > >
> > >
> > > +
> > > > +    if (iolock && !iothread && !qemu_in_coroutine()) {
> > > > +        /* See above comment why skip locking here. */
> > > > +        qemu_mutex_lock_iothread();
> > > > +    }
> > > > +
> > > > +    if (errp) {
> > > > +        error_propagate(errp, local_err);
> > > > +    } else if (local_err) {
> > > > +        error_report_err(local_err);
> > > > +    }
> > > >
> > >
> >
> > Hi Marc-Andre,
> >
> > Thank you for reviewing the patches.
> >
> >
> > > Not sure this behaviour is recommended. Instead, a trace and an
> > ERRP_GUARD
> > > would be more idiomatic.
> >
> > Did you mean to suggest using trace_ functions for the general use, not
> > only the
> > failure path. Just want to make sure I understood correctly.
> >
> 
> That's what I would suggest for error handling: (not tested)
> 
> diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
> index d75b4782ee..a7ac37627e 100644
> --- a/hw/remote/mpqemu-link.c
> +++ b/hw/remote/mpqemu-link.c
> @@ -31,10 +31,10 @@
>   */
>  void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
>  {
> +    ERRP_GUARD();
>      bool iolock = qemu_mutex_iothread_locked();
>      bool iothread = qemu_get_current_aio_context() ==
> qemu_get_aio_context() ?
>                      false : true;
> -    Error *local_err = NULL;
>      struct iovec send[2] = {0};
>      int *fds = NULL;
>      size_t nfds = 0;
> @@ -66,21 +66,15 @@ void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc,
> Error **errp)
>          qemu_mutex_unlock_iothread();
>      }
> 
> -    (void)qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send), fds,
> nfds,
> -                                      &local_err);
> +    if (qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send), fds,
> nfds, errp) == -1) {
> +        trace_mpqemu_io_error(msg, ioc, error_get_pretty(*errp));
> +    }


Thanks, that answers my question. I didn't see the examples that
convinced me using trace events as the means of error reporting.
Now I do :)
> 
>      if (iolock && !iothread && !qemu_in_coroutine()) {
>          /* See above comment why skip locking here. */
>          qemu_mutex_lock_iothread();
>      }
> 
> -    if (errp) {
> -        error_propagate(errp, local_err);
> -    } else if (local_err) {
> -        error_report_err(local_err);
> -    }
> -
> -    return;
>  }
> 
> 
> 
> 
> >
> > Should the trace file subdirectory (in this case ./hw/remote/) be included
> > into
> > trace_events_subdirs of meson.build with the condition that
> > CONFIG_MULTIPROCESS is enabled?
> >
> > Something like
> > <snip>
> >
> > config_devices_mak_file = target + '-config-devices.mak'
> > devconfig = keyval.load(meson.current_build_dir() / target +
> > '-config-devices.mak')
> > have_multiprocess = 'CONFIG_MULTIPROCESS' in devconfig
> >
> > if have_multiproces
> > ...'
> >
> > </snip>
> >
> 
> That shouldn't be necessary, do like the other hw/ traces, adding themself
> to trace_events_subdirs.

Got it, thank you!
> 
> 
> -- 
> Marc-André Lureau

