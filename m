Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87134C860C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 09:12:26 +0100 (CET)
Received: from localhost ([::1]:48268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOxcP-0008Lq-Gg
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 03:12:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nOxZi-0006hy-PV
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:09:39 -0500
Received: from [2607:f8b0:4864:20::112f] (port=41514
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nOxZc-0000qb-Jw
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:09:37 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2d62593ad9bso135474387b3.8
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OxBXbAwQHxdoSWWXfDo+C6ULEoO98rWUQk3NJQLhJV0=;
 b=IR7BT552ZmFS7woyvtsanMhc1+YCZP9/pXpHmsb0Q0V5UvZnlxDakmZUiuFfzBQQPm
 lCGg+rLAS2Q7fUDizWYpmw5cIf6MsZiw4r9v5mWeCOW7tlYdIOl1MqLMJy5R14MxoBrL
 urBTEKyCyBwq0GnBUk0gTLcEXvN1GU9E+8zYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OxBXbAwQHxdoSWWXfDo+C6ULEoO98rWUQk3NJQLhJV0=;
 b=kcFi3Ea3VQBtP7XegTpBAKeGF1fZyYhsZfuomp3YNDIzEhx64FdFF2SdGe2+0b3rpI
 y88OSWlMAD9vJE7id4fpZy4LGBdA1LiVSFm8sfvnTSniOE/Jhbx9SWp1BBY4tYe76z+m
 FtK51iPCg1seEbeKGWmIjAopo0lZhR5ZJZCzwWS3UBtN37Muco5uY5Hrch0BybQSnzGJ
 gdDxaqSSSE3AfsCwUQChgRbNgp1uUGnPXvG37hnFVeffkZftEY2rd1cqApUpydrFZW7Z
 /WUMo0J7rMtacXd+ePbhwDUQtxYYBas7iqZHVyDucCfjubm5z4UBReme4NF1GT/NvX2k
 9Z4w==
X-Gm-Message-State: AOAM532LrQtgKaR8se/aOVdA/THHaEuw3+a6NzSa348V3EyJJPgUEukc
 Faj3oSyI7jJjOa0HbQQPa8lB6yk67J79BLv5HePICA==
X-Google-Smtp-Source: ABdhPJyySJ58zWWygfIGHc+TnXH8O2KqIvIhdUMemwn99vxIuntgMRC9c60TyE9xCc76Xa5ZX2Xr3MgygSTGGScDGyU=
X-Received: by 2002:a81:5a08:0:b0:2db:d8c6:7e4f with SMTP id
 o8-20020a815a08000000b002dbd8c67e4fmr2889151ywb.256.1646122171345; Tue, 01
 Mar 2022 00:09:31 -0800 (PST)
MIME-Version: 1.0
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220225171402.64861-4-Vladislav.Yaroshchuk@jetbrains.com>
 <50a27646-ce9c-c702-965f-46b602be9220@gmail.com>
 <CAGmdLqQ8J+-sK=Huh-G8w-S0RQUEyKkN2rb6PsZAFXbd6Jk2EQ@mail.gmail.com>
 <f839edfc-de5f-7002-4916-21c541a5185b@gmail.com>
 <CAGmdLqRVtJN8YoxfeCYuay-k+RVofM8W=wicn0fRdjau0uwCHQ@mail.gmail.com>
 <CAMVc7JVnxNTMhked8x=Z0baY2ApMKwB8FrESYWQjm43-6Wm+3A@mail.gmail.com>
 <CAGmdLqQhd9q9VQUKEd_hb9rnb2HwrdAv31aB67sUj_=jiLX_Sw@mail.gmail.com>
 <7b4e06fe-4d10-0870-5d6e-d2e70d7eb3a2@gmail.com>
In-Reply-To: <7b4e06fe-4d10-0870-5d6e-d2e70d7eb3a2@gmail.com>
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Date: Tue, 1 Mar 2022 11:09:20 +0300
Message-ID: <CAGmdLqTqcESsiyTMavKZ3U8=5yPtqdq2tunZTH-tfrzwfUMGug@mail.gmail.com>
Subject: Re: [PATCH v15 3/8] net/vmnet: implement shared mode (vmnet-shared)
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>, 
 Roman Bolshakov <r.bolshakov@yadro.com>, Eric Blake <eblake@redhat.com>,
 phillip.ennen@gmail.com, 
 Phillip Tennen <phillip@axleos.com>, Markus Armbruster <armbru@redhat.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Roman Bolshakov <roman@roolebo.dev>, 
 Peter Maydell <peter.maydell@linaro.org>, Cameron Esfahani <dirty@apple.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000004831b605d923af17"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-yw1-x112f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004831b605d923af17
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 1, 2022 at 8:52 AM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/02/28 20:59, Vladislav Yaroshchuk wrote:
> >
> >
> > On Sat, Feb 26, 2022 at 3:27 PM Akihiko Odaki <akihiko.odaki@gmail.com
> > <mailto:akihiko.odaki@gmail.com>> wrote:
> >
> >     On Sat, Feb 26, 2022 at 8:33 PM Vladislav Yaroshchuk
> >     <vladislav.yaroshchuk@jetbrains.com
> >     <mailto:vladislav.yaroshchuk@jetbrains.com>> wrote:
> >      >
> >      >
> >      >
> >      > On Sat, Feb 26, 2022 at 12:16 PM Akihiko Odaki
> >     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>> wrote:
> >      >>
> >      >> On 2022/02/26 17:37, Vladislav Yaroshchuk wrote:
> >      >> >
> >      >> > Hi Akihiko,
> >      >> >
> >      >> > On Fri, Feb 25, 2022 at 8:46 PM Akihiko Odaki
> >     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
> >      >> > <mailto:akihiko.odaki@gmail.com
> >     <mailto:akihiko.odaki@gmail.com>>> wrote:
> >      >> >
> >      >> >     On 2022/02/26 2:13, Vladislav Yaroshchuk wrote:
> >      >> >      > Interaction with vmnet.framework in different modes
> >      >> >      > differs only on configuration stage, so we can create
> >      >> >      > common `send`, `receive`, etc. procedures and reuse
> them.
> >      >> >      >
> >      >> >      > vmnet.framework supports iov, but writing more than
> >      >> >      > one iov into vmnet interface fails with
> >      >> >      > 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> >      >> >      > one and passing it to vmnet works fine. That's the
> >      >> >      > reason why receive_iov() left unimplemented. But it
> still
> >      >> >      > works with good enough performance having .receive()
> >      >> >      > net/vmnet: implement shared mode (vmnet-shared)
> >      >> >      >
> >      >> >      > Interaction with vmnet.framework in different modes
> >      >> >      > differs only on configuration stage, so we can create
> >      >> >      > common `send`, `receive`, etc. procedures and reuse
> them.
> >      >> >      >
> >      >> >      > vmnet.framework supports iov, but writing more than
> >      >> >      > one iov into vmnet interface fails with
> >      >> >      > 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> >      >> >      > one and passing it to vmnet works fine. That's the
> >      >> >      > reason why receive_iov() left unimplemented. But it
> still
> >      >> >      > works with good enough performance having .receive()
> >      >> >      > implemented only.
> >      >> >      >
> >      >> >      > Also, there is no way to unsubscribe from vmnet packages
> >      >> >      > receiving except registering and unregistering event
> >      >> >      > callback or simply drop packages just ignoring and
> >      >> >      > not processing them when related flag is set. Here we do
> >      >> >      > using the second way.
> >      >> >      >
> >      >> >      > Signed-off-by: Phillip Tennen <phillip@axleos.com
> >     <mailto:phillip@axleos.com>
> >      >> >     <mailto:phillip@axleos.com <mailto:phillip@axleos.com>>>
> >      >> >      > Signed-off-by: Vladislav Yaroshchuk
> >      >> >     <Vladislav.Yaroshchuk@jetbrains.com
> >     <mailto:Vladislav.Yaroshchuk@jetbrains.com>
> >      >> >     <mailto:Vladislav.Yaroshchuk@jetbrains.com
> >     <mailto:Vladislav.Yaroshchuk@jetbrains.com>>>
> >      >> >
> >      >> >     Thank you for persistently working on this.
> >      >> >
> >      >> >      > ---
> >      >> >      >   net/vmnet-common.m | 302
> >      >> >     +++++++++++++++++++++++++++++++++++++++++++++
> >      >> >      >   net/vmnet-shared.c |  94 +++++++++++++-
> >      >> >      >   net/vmnet_int.h    |  39 +++++-
> >      >> >      >   3 files changed, 430 insertions(+), 5 deletions(-)
> >      >> >      >
> >      >> >      > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> >      >> >      > index 56612c72ce..2f70921cae 100644
> >      >> >      > --- a/net/vmnet-common.m
> >      >> >      > +++ b/net/vmnet-common.m
> >      >> >      > @@ -10,6 +10,8 @@
> >      >> >      >    */
> >      >> >      >
> >      >> >      >   #include "qemu/osdep.h"
> >      >> >      > +#include "qemu/main-loop.h"
> >      >> >      > +#include "qemu/log.h"
> >      >> >      >   #include "qapi/qapi-types-net.h"
> >      >> >      >   #include "vmnet_int.h"
> >      >> >      >   #include "clients.h"
> >      >> >      > @@ -17,4 +19,304 @@
> >      >> >      >   #include "qapi/error.h"
> >      >> >      >
> >      >> >      >   #include <vmnet/vmnet.h>
> >      >> >      > +#include <dispatch/dispatch.h>
> >      >> >      >
> >      >> >      > +
> >      >> >      > +static inline void
> >     vmnet_set_send_bh_scheduled(VmnetCommonState *s,
> >      >> >      > +                                               bool
> >     enable)
> >      >> >      > +{
> >      >> >      > +    qatomic_set(&s->send_scheduled, enable);
> >      >> >      > +}
> >      >> >      > +
> >      >> >      > +
> >      >> >      > +static inline bool
> >     vmnet_is_send_bh_scheduled(VmnetCommonState *s)
> >      >> >      > +{
> >      >> >      > +    return qatomic_load_acquire(&s->send_scheduled);
> >      >> >      > +}
> >      >> >      > +
> >      >> >      > +
> >      >> >      > +static inline void
> >     vmnet_set_send_enabled(VmnetCommonState *s,
> >      >> >      > +                                          bool enable)
> >      >> >      > +{
> >      >> >      > +    if (enable) {
> >      >> >      > +        vmnet_interface_set_event_callback(
> >      >> >      > +            s->vmnet_if,
> >      >> >      > +            VMNET_INTERFACE_PACKETS_AVAILABLE,
> >      >> >      > +            s->if_queue,
> >      >> >      > +            ^(interface_event_t event_id, xpc_object_t
> >     event) {
> >      >> >      > +                assert(event_id ==
> >      >> >     VMNET_INTERFACE_PACKETS_AVAILABLE);
> >      >> >      > +                /*
> >      >> >      > +                 * This function is being called from
> >     a non qemu
> >      >> >     thread, so
> >      >> >      > +                 * we only schedule a BH, and do the
> >     rest of the
> >      >> >     io completion
> >      >> >      > +                 * handling from vmnet_send_bh() which
> >     runs in a
> >      >> >     qemu context.
> >      >> >      > +                 *
> >      >> >      > +                 * Avoid scheduling multiple bottom
> halves
> >      >> >      > +                 */
> >      >> >      > +                if (!vmnet_is_send_bh_scheduled(s)) {
> >      >> >      > +                    vmnet_set_send_bh_scheduled(s,
> true);
> >      >> >
> >      >> >     It can be interrupted between vmnet_is_send_bh_scheduled
> and
> >      >> >     vmnet_set_send_bh_scheduled, which leads to data race.
> >      >> >
> >      >> >
> >      >> > Sorry, I did not clearly understand what you meant. Since this
> >      >> > callback (block) is submitted on DISPATCH_QUEUE_SERIAL,
> >      >> > only one instance of the callback will be executed at any
> >      >> > moment of time.
> >      >> >
> >
> https://developer.apple.com/documentation/dispatch/dispatch_queue_serial
> >     <
> https://developer.apple.com/documentation/dispatch/dispatch_queue_serial>
> >      >> >
> >     <
> https://developer.apple.com/documentation/dispatch/dispatch_queue_serial
> >     <
> https://developer.apple.com/documentation/dispatch/dispatch_queue_serial>>
> >      >> >
> >      >> > Also this is the only place where we schedule a bottom half.
> >      >> >
> >      >> > After we set the 'send_scheduled' flag, all the other
> >      >> > callback  blocks will do nothing (skip the if block) until
> >      >> > the bottom half is executed and reset 'send_scheduled'.
> >      >> > I don't see any races here :(
> >      >> >
> >      >> > Correct me if I'm wrong please.
> >      >>
> >      >> My explanation that the interruption between
> >     vmnet_is_send_bh_scheduled
> >      >> and vmnet_set_send_bh_scheduled is problematic was actually
> >     misleading.
> >      >>
> >      >> The problem is that vmnet_send_bh resets 'send_scheduled' after
> >     calling
> >      >> vmnet_read. If we got another packet after vmnet_read, it would
> be
> >      >> silently ignored.
> >      >>
> >      >> By the way, I forgot to mention another problem:
> >     vmnet_send_completed
> >      >> calls vmnet_set_send_enabled, but the other packets in the
> >     buffer may
> >      >> not be sent yet. Also, unregistering callbacks in
> >     vmnet_set_send_enabled
> >      >> is probably not enough to stop the callback being fired since
> some
> >      >> dispatch blocks are already in the dispatch queue.
> >      >>
> >      >
> >      > Now I understand what you mean, thanks.
> >      > What do you think about the workaround? For me
> >      > it is quite difficult question how to synchronize qemu with
> >      > vmnet thread, especially with completion callback.
> >
> >     You may add a new field to represent the number of packets being sent
> >     in the buffer. The field must be maintained by vmnet_send_bh and
> >     vmnet_send_completed, which are on the iothread. vmnet_send_bh should
> >     do nothing if the field is greater than 0 at the beginning of the
> >     function. vmnet_send_completed should call
> >     qemu_bh_schedule(s->send_bh).
> >
> >
> > Thank you for the idea! Sounds meaningful to
> > schedule a bottom half in vmnet thread and do the
> > rest of things in iothread with no concurrency.
> >
> > Not sure that only one field is enough, cause
> > we may have two states on bh execution start:
> > 1. There are packets in vmnet buffer s->packets_buf
> >      that were rejected by qemu_send_async and waiting
> >      to be sent. If this happens, we should complete sending
> >      these waiting packets with qemu_send_async firstly,
> >      and after that we should call vmnet_read to get
> >      new ones and send them to QEMU;
> > 2. There are no packets in s->packets_buf to be sent to
> >      qemu, we only need to get new packets from vmnet
> >      with vmnet_read and send them to QEMU
>
> In case 1, you should just keep calling qemu_send_packet_async. Actually
> qemu_send_packet_async adds the packet to its internal queue and calls
> the callback when it is consumed.
>
>
I'm not sure we can keep calling qemu_send_packet_async,
because as docs from net/queue.c says:

/* [...]
 * If a sent callback is provided to send(), the caller must handle a
 * zero return from the delivery handler by not sending any more packets
 * until we have invoked the callback. Only in that case will we queue
 * the packet.
 *
 * If a sent callback isn't provided, we just drop the packet to avoid
 * unbounded queueing.
 */

So after we did vmnet_read and read N packets
into temporary s->packets_buf, we begin calling
qemu_send_packet_async. If it returns 0 - it says
"no more packets until sent_cb called please".
At this moment we have N packets in s->packets_buf
and already queued K < N of them. But, packets K..N
are not queued and keep waiting for sent_cb to be sent
with qemu_send_packet_async.
Thus when sent_cb called, we should finish
our transfer of packets K..N from s->packets_buf
to qemu calling qemu_send_packet_async.
I meant this.

But also it's possible that while waiting for sent_cb
some new packet(s) has been received and it's
ready to be read with vmnet_read. To handle this,
when sent_cb is called and we're done with
packets K..N in s->packets_buf, we should also
query vmnet_read to check whether something
new is present.


Best Regards,

Vladislav Yaroshchuk

>
> > It can be done kinda this way:
> > ```
> > struct s:
> >      send_bh:                    bh
> >      packets_buf:              array[packet]
> >      ## Three new fields
> >      send_enabled:           bool
> >      packets_send_pos:    int
> >      packets_batch_size:  int
> >
> > fun bh_send(s):
> >      ## Send disabled - do nothing
> >      if not s->send_enabled:
> >          return
> >      ## If some packets are waiting to be sent in
> >      ## s->packets_buf - send them
> >      if s->packets_send_pos < s->packets_batch_size:
> >          if not qemu_send_wrapper(s):
> >              return
> >
> >      ## Try to read new packets from vmnet
> >      s->packets_send_pos = 0
> >      s->packets_batch_size = 0
> >      s->packets_buf = vmnet_read(&s->packets_batch_size)
> >      if s->packets_batch_size > 0:
> >          # If something received - process them
> >          qemu_send_wrapper(s)
> > fun qemu_send_wrapper(s):
> >      for i in s->packets_send_pos to s->packets_batch_size:
> >          size = qemu_send_async(s->packets_buf[i],
> >                                                    vmnet_send_completed)
> >          if size == 0:
> >              ## Disable packets processing until vmnet_send_completed
> >              ## Save the state: packets to be sent now in s->packets_buf
> >              ## in range s->packets_send_pos..s->packets_batch_size
> >              s->send_enabled = false
> >              s->packets_send_pos = i + 1
> >              break
> >          if size < 0:
> >              ## On error just drop the packets
> >              s->packets_send_pos = 0
> >              s->packets_batch_size = 0
> >              break
> >
> >       return s->send_enabled
> >
> >
> > fun vmnet_send_completed(s):
> >      ## Complete sending packets from s->packets_buf
> >      s->send_enabled = true
> >      qemu_bh_schedule(s->send_bh)
> >
> > ## From callback we only scheduling the bh
> > vmnet.set_callback(callback = s: qemu_bh_schedule(s->send_bh))
> > ```
> >
> > I think a simpler implementation may exist, but currently
> > I see only this approach with the send_enabled flag and
> > two more fields to save packets sending state.
> >
> >     vmnet_set_send_enabled and send_scheduled can be simply removed.
> >     qemu_bh_schedule ensures there is no duplicate scheduling.
> >
> > Yep, my mistake. Previously I used schedule_oneshot which
> > creates a new bh for each call which causes duplicate scheduling.
> >
> >
> >     Regards,
> >     Akihiko Odaki
> >
> >      >
> >      >
> >      >>
> >      >> Regards,
> >      >> Akihiko Odaki
> >      >>
> >      >> >
> >      >> >      > +                    qemu_bh_schedule(s->send_bh);
> >      >> >      > +                }
> >      >> >      > +            });
> >      >> >      > +    } else {
> >      >> >      > +        vmnet_interface_set_event_callback(
> >      >> >      > +            s->vmnet_if,
> >      >> >      > +            VMNET_INTERFACE_PACKETS_AVAILABLE,
> >      >> >      > +            NULL,
> >      >> >      > +            NULL);
> >      >> >      > +    }
> >      >> >      > +}
> >      >> >      > +
> >      >> >      > +
> >      >> >      > +static void vmnet_send_completed(NetClientState *nc,
> >     ssize_t len)
> >      >> >      > +{
> >      >> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState,
> >     nc, nc);
> >      >> >      > +    vmnet_set_send_enabled(s, true);
> >      >> >      > +}
> >      >> >      > +
> >      >> >      > +
> >      >> >      > +static void vmnet_send_bh(void *opaque)
> >      >> >      > +{
> >      >> >      > +    NetClientState *nc = (NetClientState *) opaque;
> >      >> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState,
> >     nc, nc);
> >      >> >      > +
> >      >> >      > +    struct iovec *iov = s->iov_buf;
> >      >> >      > +    struct vmpktdesc *packets = s->packets_buf;
> >      >> >      > +    int pkt_cnt;
> >      >> >      > +    int i;
> >      >> >      > +
> >      >> >      > +    vmnet_return_t status;
> >      >> >      > +    ssize_t size;
> >      >> >      > +
> >      >> >      > +    /* read as many packets as present */
> >      >> >      > +    pkt_cnt = VMNET_PACKETS_LIMIT;
> >      >> >
> >      >> >     There could be more than VMNET_PACKETS_LIMIT. You may call
> >      >> >     vmnet_read in
> >      >> >     a loop.
> >      >> >
> >      >> >      > +    for (i = 0; i < pkt_cnt; ++i) {
> >      >> >      > +        packets[i].vm_pkt_size = s->max_packet_size;
> >      >> >      > +        packets[i].vm_pkt_iovcnt = 1;
> >      >> >      > +        packets[i].vm_flags = 0;
> >      >> >      > +    }
> >      >> >      > +
> >      >> >      > +    status = vmnet_read(s->vmnet_if, packets,
> &pkt_cnt);
> >      >> >      > +    if (status != VMNET_SUCCESS) {
> >      >> >      > +        error_printf("vmnet: read failed: %s\n",
> >      >> >      > +                     vmnet_status_map_str(status));
> >      >> >      > +        goto done;
> >      >> >      > +    }
> >      >> >      > +
> >      >> >      > +    for (i = 0; i < pkt_cnt; ++i) {
> >      >> >      > +        size = qemu_send_packet_async(nc,
> >      >> >      > +                                      iov[i].iov_base,
> >      >> >      > +
> >     packets[i].vm_pkt_size,
> >      >> >      > +
> >     vmnet_send_completed);
> >      >> >      > +        if (size == 0) {
> >      >> >      > +            vmnet_set_send_enabled(s, false);
> >      >> >      > +            goto done;
> >      >> >      > +        } else if (size < 0) {
> >      >> >      > +            break;
> >      >> >      > +        }
> >      >> >
> >      >> >     goto is not needed here. "break" when size <= 0.
> >      >> >
> >      >> >      > +    }
> >      >> >      > +
> >      >> >      > +done:
> >      >> >      > +    vmnet_set_send_bh_scheduled(s, false);
> >      >> >      > +}
> >      >> >      > +
> >      >> >      > +
> >      >> >      > +static void vmnet_bufs_init(VmnetCommonState *s)
> >      >> >      > +{
> >      >> >      > +    struct vmpktdesc *packets = s->packets_buf;
> >      >> >      > +    struct iovec *iov = s->iov_buf;
> >      >> >      > +    int i;
> >      >> >      > +
> >      >> >      > +    for (i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
> >      >> >      > +        iov[i].iov_len = s->max_packet_size;
> >      >> >      > +        iov[i].iov_base = g_malloc0(iov[i].iov_len);
> >      >> >      > +        packets[i].vm_pkt_iov = iov + i;
> >      >> >      > +    }
> >      >> >      > +}
> >      >> >      > +
> >      >> >      > +
> >      >> >      > +const char *vmnet_status_map_str(vmnet_return_t status)
> >      >> >      > +{
> >      >> >      > +    switch (status) {
> >      >> >      > +    case VMNET_SUCCESS:
> >      >> >      > +        return "success";
> >      >> >      > +    case VMNET_FAILURE:
> >      >> >      > +        return "general failure (possibly not enough
> >     privileges)";
> >      >> >      > +    case VMNET_MEM_FAILURE:
> >      >> >      > +        return "memory allocation failure";
> >      >> >      > +    case VMNET_INVALID_ARGUMENT:
> >      >> >      > +        return "invalid argument specified";
> >      >> >      > +    case VMNET_SETUP_INCOMPLETE:
> >      >> >      > +        return "interface setup is not complete";
> >      >> >      > +    case VMNET_INVALID_ACCESS:
> >      >> >      > +        return "invalid access, permission denied";
> >      >> >      > +    case VMNET_PACKET_TOO_BIG:
> >      >> >      > +        return "packet size is larger than MTU";
> >      >> >      > +    case VMNET_BUFFER_EXHAUSTED:
> >      >> >      > +        return "buffers exhausted in kernel";
> >      >> >      > +    case VMNET_TOO_MANY_PACKETS:
> >      >> >      > +        return "packet count exceeds limit";
> >      >> >      > +#if defined(MAC_OS_VERSION_11_0) && \
> >      >> >      > +    MAC_OS_X_VERSION_MIN_REQUIRED >=
> MAC_OS_VERSION_11_0
> >      >> >      > +    case VMNET_SHARING_SERVICE_BUSY:
> >      >> >      > +        return "conflict, sharing service is in use";
> >      >> >      > +#endif
> >      >> >      > +    default:
> >      >> >      > +        return "unknown vmnet error";
> >      >> >      > +    }
> >      >> >      > +}
> >      >> >      > +
> >      >> >      > +
> >      >> >      > +int vmnet_if_create(NetClientState *nc,
> >      >> >      > +                    xpc_object_t if_desc,
> >      >> >      > +                    Error **errp)
> >      >> >      > +{
> >      >> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState,
> >     nc, nc);;
> >      >> >
> >      >> >     Duplicate semicolons.
> >      >> >
> >      >> >      > +    dispatch_semaphore_t if_created_sem =
> >      >> >     dispatch_semaphore_create(0);
> >      >> >
> >      >> >     if_created_sem leaks.
> >      >> >
> >      >> >      > +    __block vmnet_return_t if_status;
> >      >> >      > +
> >      >> >      > +    s->if_queue = dispatch_queue_create(
> >      >> >      > +        "org.qemu.vmnet.if_queue",
> >      >> >      > +        DISPATCH_QUEUE_SERIAL
> >      >> >      > +    );
> >      >> >      > +
> >      >> >      > +    xpc_dictionary_set_bool(
> >      >> >      > +        if_desc,
> >      >> >      > +        vmnet_allocate_mac_address_key,
> >      >> >      > +        false
> >      >> >      > +    );
> >      >> >      > +#ifdef DEBUG
> >      >> >      > +    qemu_log("vmnet.start.interface_desc:\n");
> >      >> >      > +    xpc_dictionary_apply(if_desc,
> >      >> >      > +                         ^bool(const char *k,
> >     xpc_object_t v) {
> >      >> >      > +                             char *desc =
> >     xpc_copy_description(v);
> >      >> >      > +                             qemu_log("  %s=%s\n", k,
> >     desc);
> >      >> >      > +                             free(desc);
> >      >> >      > +                             return true;
> >      >> >      > +                         });
> >      >> >      > +#endif /* DEBUG */
> >      >> >      > +
> >      >> >      > +    s->vmnet_if = vmnet_start_interface(
> >      >> >      > +        if_desc,
> >      >> >      > +        s->if_queue,
> >      >> >      > +        ^(vmnet_return_t status, xpc_object_t
> >     interface_param) {
> >      >> >      > +            if_status = status;
> >      >> >      > +            if (status != VMNET_SUCCESS ||
> >     !interface_param) {
> >      >> >      > +
> dispatch_semaphore_signal(if_created_sem);
> >      >> >      > +                return;
> >      >> >      > +            }
> >      >> >      > +
> >      >> >      > +#ifdef DEBUG
> >      >> >      > +            qemu_log("vmnet.start.interface_param:\n");
> >      >> >      > +            xpc_dictionary_apply(interface_param,
> >      >> >      > +                                 ^bool(const char *k,
> >      >> >     xpc_object_t v) {
> >      >> >      > +                                     char *desc =
> >      >> >     xpc_copy_description(v);
> >      >> >      > +                                     qemu_log("
> >     %s=%s\n", k, desc);
> >      >> >      > +                                     free(desc);
> >      >> >      > +                                     return true;
> >      >> >      > +                                 });
> >      >> >      > +#endif /* DEBUG */
> >      >> >      > +
> >      >> >      > +            s->mtu = xpc_dictionary_get_uint64(
> >      >> >      > +                interface_param,
> >      >> >      > +                vmnet_mtu_key);
> >      >> >      > +            s->max_packet_size =
> >     xpc_dictionary_get_uint64(
> >      >> >      > +                interface_param,
> >      >> >      > +                vmnet_max_packet_size_key);
> >      >> >      > +
> >      >> >      > +            dispatch_semaphore_signal(if_created_sem);
> >      >> >      > +        });
> >      >> >      > +
> >      >> >      > +    if (s->vmnet_if == NULL) {
> >      >> >      > +        error_setg(errp,
> >      >> >      > +                   "unable to create interface "
> >      >> >      > +                   "with requested params");
> >      >> >
> >      >> >     You don't need line breaks here. Breaking a string into a
> >     few would
> >      >> >     also
> >      >> >     makes it a bit hard to grep.
> >      >> >
> >      >> >      > +        return -1;
> >      >> >
> >      >> >     s->if_queue leaks.
> >      >> >
> >      >> >      > +    }
> >      >> >      > +
> >      >> >      > +    dispatch_semaphore_wait(if_created_sem,
> >     DISPATCH_TIME_FOREVER);
> >      >> >      > +
> >      >> >      > +    if (if_status != VMNET_SUCCESS) {
> >      >> >      > +        error_setg(errp,
> >      >> >      > +                   "cannot create vmnet interface: %s",
> >      >> >      > +                   vmnet_status_map_str(if_status));
> >      >> >      > +        return -1;
> >      >> >      > +    }
> >      >> >      > +
> >      >> >      > +    s->send_bh = aio_bh_new(qemu_get_aio_context(),
> >      >> >     vmnet_send_bh, nc);
> >      >> >      > +    vmnet_bufs_init(s);
> >      >> >      > +    vmnet_set_send_bh_scheduled(s, false);
> >      >> >      > +    vmnet_set_send_enabled(s, true);
> >      >> >      > +    return 0;
> >      >> >      > +}
> >      >> >      > +
> >      >> >      > +
> >      >> >      > +ssize_t vmnet_receive_common(NetClientState *nc,
> >      >> >      > +                             const uint8_t *buf,
> >      >> >      > +                             size_t size)
> >      >> >      > +{
> >      >> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState,
> >     nc, nc);
> >      >> >      > +    struct vmpktdesc packet;
> >      >> >      > +    struct iovec iov;
> >      >> >      > +    int pkt_cnt;
> >      >> >      > +    vmnet_return_t if_status;
> >      >> >      > +
> >      >> >      > +    if (size > s->max_packet_size) {
> >      >> >      > +        warn_report("vmnet: packet is too big, %zu >
> >     %llu\n",
> >      >> >
> >      >> >     Use PRIu64.
> >      >> >
> >      >> >      > +                    packet.vm_pkt_size,
> >      >> >      > +                    s->max_packet_size);
> >      >> >      > +        return -1;
> >      >> >      > +    }
> >      >> >      > +
> >      >> >      > +    iov.iov_base = (char *) buf;
> >      >> >      > +    iov.iov_len = size;
> >      >> >      > +
> >      >> >      > +    packet.vm_pkt_iovcnt = 1;
> >      >> >      > +    packet.vm_flags = 0;
> >      >> >      > +    packet.vm_pkt_size = size;
> >      >> >      > +    packet.vm_pkt_iov = &iov;
> >      >> >      > +    pkt_cnt = 1;
> >      >> >      > +
> >      >> >      > +    if_status = vmnet_write(s->vmnet_if, &packet,
> >     &pkt_cnt);
> >      >> >      > +    if (if_status != VMNET_SUCCESS) {
> >      >> >      > +        error_report("vmnet: write error: %s\n",
> >      >> >      > +                     vmnet_status_map_str(if_status));
> >      >> >
> >      >> >     Why don't return -1?
> >      >> >
> >      >> >      > +    }
> >      >> >      > +
> >      >> >      > +    if (if_status == VMNET_SUCCESS && pkt_cnt) {
> >      >> >      > +        return size;
> >      >> >      > +    }
> >      >> >      > +    return 0;
> >      >> >      > +}
> >      >> >      > +
> >      >> >      > +
> >      >> >      > +void vmnet_cleanup_common(NetClientState *nc)
> >      >> >      > +{
> >      >> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState,
> >     nc, nc);;
> >      >> >
> >      >> >     Duplicate semicolons.
> >      >> >
> >      >> >      > +    dispatch_semaphore_t if_created_sem;
> >      >> >      > +
> >      >> >      > +    qemu_purge_queued_packets(nc); > +
> >      >> >     vmnet_set_send_bh_scheduled(s, true);
> >      >> >      > +    vmnet_set_send_enabled(s, false);
> >      >> >      > +
> >      >> >      > +    if (s->vmnet_if == NULL) {
> >      >> >      > +        return;
> >      >> >      > +    }
> >      >> >      > +
> >      >> >      > +    if_created_sem = dispatch_semaphore_create(0);
> >      >> >      > +    vmnet_stop_interface(
> >      >> >      > +        s->vmnet_if,
> >      >> >      > +        s->if_queue,
> >      >> >      > +        ^(vmnet_return_t status) {
> >      >> >      > +            assert(status == VMNET_SUCCESS);
> >      >> >      > +            dispatch_semaphore_signal(if_created_sem);
> >      >> >      > +        });
> >      >> >      > +    dispatch_semaphore_wait(if_created_sem,
> >     DISPATCH_TIME_FOREVER);
> >      >> >      > +
> >      >> >      > +    qemu_bh_delete(s->send_bh);
> >      >> >      > +    dispatch_release(if_created_sem);
> >      >> >      > +    dispatch_release(s->if_queue);
> >      >> >      > +
> >      >> >      > +    for (int i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
> >      >> >      > +        g_free(s->iov_buf[i].iov_base);
> >      >> >      > +    }
> >      >> >      > +}
> >      >> >      > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
> >      >> >      > index f07afaaf21..66f66c034b 100644
> >      >> >      > --- a/net/vmnet-shared.c
> >      >> >      > +++ b/net/vmnet-shared.c
> >      >> >      > @@ -10,16 +10,102 @@
> >      >> >      >
> >      >> >      >   #include "qemu/osdep.h"
> >      >> >      >   #include "qapi/qapi-types-net.h"
> >      >> >      > +#include "qapi/error.h"
> >      >> >      >   #include "vmnet_int.h"
> >      >> >      >   #include "clients.h"
> >      >> >      > -#include "qemu/error-report.h"
> >      >> >      > -#include "qapi/error.h"
> >      >> >      >
> >      >> >      >   #include <vmnet/vmnet.h>
> >      >> >      >
> >      >> >      > +typedef struct VmnetSharedState {
> >      >> >      > +    VmnetCommonState cs;
> >      >> >      > +} VmnetSharedState;
> >      >> >      > +
> >      >> >      > +
> >      >> >      > +static bool validate_options(const Netdev *netdev,
> >     Error **errp)
> >      >> >      > +{
> >      >> >      > +    const NetdevVmnetSharedOptions *options =
> >      >> >     &(netdev->u.vmnet_shared);
> >      >> >      > +
> >      >> >      > +#if !defined(MAC_OS_VERSION_11_0) || \
> >      >> >      > +    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
> >      >> >      > +    if (options->has_isolated) {
> >      >> >      > +        error_setg(errp,
> >      >> >      > +                   "vmnet-shared.isolated feature is "
> >      >> >      > +                   "unavailable: outdated
> >     vmnet.framework API");
> >      >> >      > +        return false;
> >      >> >      > +    }
> >      >> >      > +#endif
> >      >> >      > +
> >      >> >      > +    if ((options->has_start_address ||
> >      >> >      > +         options->has_end_address ||
> >      >> >      > +         options->has_subnet_mask) &&
> >      >> >      > +        !(options->has_start_address &&
> >      >> >      > +          options->has_end_address &&
> >      >> >      > +          options->has_subnet_mask)) {
> >      >> >      > +        error_setg(errp,
> >      >> >      > +                   "'start-address', 'end-address',
> >     'subnet-mask' "
> >      >> >      > +                   "should be provided together"
> >      >> >      > +        );
> >      >> >      > +        return false;
> >      >> >      > +    }
> >      >> >      > +
> >      >> >      > +    return true;
> >      >> >      > +}
> >      >> >      > +
> >      >> >      > +static xpc_object_t build_if_desc(const Netdev *netdev)
> >      >> >      > +{
> >      >> >      > +    const NetdevVmnetSharedOptions *options =
> >      >> >     &(netdev->u.vmnet_shared);
> >      >> >      > +    xpc_object_t if_desc = xpc_dictionary_create(NULL,
> >     NULL, 0);
> >      >> >      > +
> >      >> >      > +    xpc_dictionary_set_uint64(
> >      >> >      > +        if_desc,
> >      >> >      > +        vmnet_operation_mode_key,
> >      >> >      > +        VMNET_SHARED_MODE
> >      >> >      > +    );
> >      >> >      > +
> >      >> >      > +    if (options->has_nat66_prefix) {
> >      >> >      > +        xpc_dictionary_set_string(if_desc,
> >      >> >      > +
> vmnet_nat66_prefix_key,
> >      >> >      > +
> options->nat66_prefix);
> >      >> >      > +    }
> >      >> >      > +
> >      >> >      > +    if (options->has_start_address) {
> >      >> >      > +        xpc_dictionary_set_string(if_desc,
> >      >> >      > +
> vmnet_start_address_key,
> >      >> >      > +
> options->start_address);
> >      >> >      > +        xpc_dictionary_set_string(if_desc,
> >      >> >      > +
> vmnet_end_address_key,
> >      >> >      > +
> options->end_address);
> >      >> >      > +        xpc_dictionary_set_string(if_desc,
> >      >> >      > +
> vmnet_subnet_mask_key,
> >      >> >      > +
> options->subnet_mask);
> >      >> >      > +    }
> >      >> >      > +
> >      >> >      > +#if defined(MAC_OS_VERSION_11_0) && \
> >      >> >      > +    MAC_OS_X_VERSION_MIN_REQUIRED >=
> MAC_OS_VERSION_11_0
> >      >> >      > +    xpc_dictionary_set_bool(
> >      >> >      > +        if_desc,
> >      >> >      > +        vmnet_enable_isolation_key,
> >      >> >      > +        options->isolated
> >      >> >      > +    );
> >      >> >      > +#endif
> >      >> >      > +
> >      >> >      > +    return if_desc;
> >      >> >      > +}
> >      >> >      > +
> >      >> >      > +static NetClientInfo net_vmnet_shared_info = {
> >      >> >      > +    .type = NET_CLIENT_DRIVER_VMNET_SHARED,
> >      >> >      > +    .size = sizeof(VmnetSharedState),
> >      >> >      > +    .receive = vmnet_receive_common,
> >      >> >      > +    .cleanup = vmnet_cleanup_common,
> >      >> >      > +};
> >      >> >      > +
> >      >> >      >   int net_init_vmnet_shared(const Netdev *netdev, const
> >     char *name,
> >      >> >      >                             NetClientState *peer, Error
> >     **errp)
> >      >> >      >   {
> >      >> >      > -  error_setg(errp, "vmnet-shared is not implemented
> yet");
> >      >> >      > -  return -1;
> >      >> >      > +    NetClientState *nc =
> >     qemu_new_net_client(&net_vmnet_shared_info,
> >      >> >      > +                                             peer,
> >      >> >     "vmnet-shared", name);
> >      >> >      > +    if (!validate_options(netdev, errp)) {
> >      >> >      > +        g_assert_not_reached();
> >      >> >
> >      >> >     g_assert_not_reached is for debugging purpose and may be
> >     dropped
> >      >> >     depending on the build option.
> >      >> >
> >      >> >      > +    }
> >      >> >      > +    return vmnet_if_create(nc, build_if_desc(netdev),
> >     errp);
> >      >> >      >   }
> >      >> >      > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> >      >> >      > index aac4d5af64..acfe3a88c0 100644
> >      >> >      > --- a/net/vmnet_int.h
> >      >> >      > +++ b/net/vmnet_int.h
> >      >> >      > @@ -15,11 +15,48 @@
> >      >> >      >   #include "clients.h"
> >      >> >      >
> >      >> >      >   #include <vmnet/vmnet.h>
> >      >> >      > +#include <dispatch/dispatch.h>
> >      >> >      > +
> >      >> >      > +/**
> >      >> >      > + *  From vmnet.framework documentation
> >      >> >      > + *
> >      >> >      > + *  Each read/write call allows up to 200 packets to be
> >      >> >      > + *  read or written for a maximum of 256KB.
> >      >> >      > + *
> >      >> >      > + *  Each packet written should be a complete
> >      >> >      > + *  ethernet frame.
> >      >> >      > + *
> >      >> >      > + * https://developer.apple.com/documentation/vmnet
> >     <https://developer.apple.com/documentation/vmnet>
> >      >> >     <https://developer.apple.com/documentation/vmnet
> >     <https://developer.apple.com/documentation/vmnet>>
> >      >> >      > + */
> >      >> >      > +#define VMNET_PACKETS_LIMIT 200
> >      >> >      >
> >      >> >      >   typedef struct VmnetCommonState {
> >      >> >      > -  NetClientState nc;
> >      >> >      > +    NetClientState nc;
> >      >> >      > +    interface_ref vmnet_if;
> >      >> >      > +
> >      >> >      > +    bool send_scheduled;
> >      >> >      >
> >      >> >      > +    uint64_t mtu;
> >      >> >      > +    uint64_t max_packet_size;
> >      >> >      > +
> >      >> >      > +    struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
> >      >> >      > +    struct iovec iov_buf[VMNET_PACKETS_LIMIT];
> >      >> >      > +
> >      >> >      > +    dispatch_queue_t if_queue;
> >      >> >      > +
> >      >> >      > +    QEMUBH *send_bh;
> >      >> >      >   } VmnetCommonState;
> >      >> >      >
> >      >> >      > +const char *vmnet_status_map_str(vmnet_return_t
> status);
> >      >> >      > +
> >      >> >      > +int vmnet_if_create(NetClientState *nc,
> >      >> >      > +                    xpc_object_t if_desc,
> >      >> >      > +                    Error **errp);
> >      >> >      > +
> >      >> >      > +ssize_t vmnet_receive_common(NetClientState *nc,
> >      >> >      > +                             const uint8_t *buf,
> >      >> >      > +                             size_t size);
> >      >> >      > +
> >      >> >      > +void vmnet_cleanup_common(NetClientState *nc);
> >      >> >      >
> >      >> >      >   #endif /* VMNET_INT_H */
> >      >> >
> >      >> >
> >      >> > Other issues will be fixed and submitted later,
> >      >> > thank you!
> >      >> >
> >      >> > Regards,
> >      >> > Vladislav Yaroshchuk
> >      >>
> >      >
> >      > Regards,
> >      > Vladislav Yaroshchuk
> >
> >
> > Best Regards,
> >
> > Vladislav Yaroshchuk
>
>

--0000000000004831b605d923af17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFR1ZSwgTWFy
IDEsIDIwMjIgYXQgODo1MiBBTSBBa2loaWtvIE9kYWtpICZsdDs8YSBocmVmPSJtYWlsdG86YWtp
aGlrby5vZGFraUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5ha2loaWtvLm9kYWtpQGdtYWls
LmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVv
dGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlk
IHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+T24gMjAyMi8wMi8yOCAyMDo1OSwg
VmxhZGlzbGF2IFlhcm9zaGNodWsgd3JvdGU6PGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZn
dDsgT24gU2F0LCBGZWIgMjYsIDIwMjIgYXQgMzoyNyBQTSBBa2loaWtvIE9kYWtpICZsdDs8YSBo
cmVmPSJtYWlsdG86YWtpaGlrby5vZGFraUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5ha2lo
aWtvLm9kYWtpQGdtYWlsLmNvbTwvYT4gPGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpha2loaWtvLm9kYWtpQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFraWhpa28ub2Rh
a2lAZ21haWwuY29tPC9hPiZndDsmZ3Q7IHdyb3RlOjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKg
IMKgT24gU2F0LCBGZWIgMjYsIDIwMjIgYXQgODozMyBQTSBWbGFkaXNsYXYgWWFyb3NoY2h1azxi
cj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJtYWlsdG86dmxhZGlzbGF2Lnlhcm9zaGNodWtA
amV0YnJhaW5zLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnZsYWRpc2xhdi55YXJvc2hjaHVrQGpldGJy
YWlucy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
dmxhZGlzbGF2Lnlhcm9zaGNodWtAamV0YnJhaW5zLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnZsYWRp
c2xhdi55YXJvc2hjaHVrQGpldGJyYWlucy5jb208L2E+Jmd0OyZndDsgd3JvdGU6PGJyPg0KJmd0
O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgT24gU2F0LCBGZWIgMjYsIDIwMjIgYXQgMTI6MTYg
UE0gQWtpaGlrbyBPZGFraTxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJtYWlsdG86YWtp
aGlrby5vZGFraUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5ha2loaWtvLm9kYWtpQGdtYWls
LmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86YWtpaGlrby5vZGFraUBnbWFpbC5j
b20iIHRhcmdldD0iX2JsYW5rIj5ha2loaWtvLm9kYWtpQGdtYWlsLmNvbTwvYT4mZ3Q7Jmd0OyB3
cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZn
dDsgT24gMjAyMi8wMi8yNiAxNzozNywgVmxhZGlzbGF2IFlhcm9zaGNodWsgd3JvdGU6PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0
OyBIaSBBa2loaWtvLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDsgT24gRnJpLCBGZWIgMjUsIDIwMjIgYXQgODo0NiBQTSBBa2lo
aWtvIE9kYWtpPGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Im1haWx0bzpha2loaWtvLm9k
YWtpQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFraWhpa28ub2Rha2lAZ21haWwuY29tPC9h
PiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpha2loaWtvLm9kYWtpQGdtYWlsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmFraWhpa28ub2Rha2lAZ21haWwuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyZndDsgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpha2loaWtvLm9k
YWtpQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFraWhpa28ub2Rha2lAZ21haWwuY29tPC9h
Pjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmFraWhpa28ub2Rh
a2lAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+YWtpaGlrby5vZGFraUBnbWFpbC5jb208L2E+
Jmd0OyZndDsmZ3Q7IHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoE9uIDIwMjIvMDIvMjYgMjoxMywgVmxh
ZGlzbGF2IFlhcm9zaGNodWsgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoCAmZ3Q7IEludGVyYWN0aW9uIHdpdGggdm1uZXQuZnJhbWV3b3JrIGluIGRpZmZlcmVu
dCBtb2Rlczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyBkaWZm
ZXJzIG9ubHkgb24gY29uZmlndXJhdGlvbiBzdGFnZSwgc28gd2UgY2FuIGNyZWF0ZTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyBjb21tb24gYHNlbmRgLCBgcmVj
ZWl2ZWAsIGV0Yy4gcHJvY2VkdXJlcyBhbmQgcmV1c2UgdGhlbS48YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0
O8KgIMKgIMKgICZndDsgdm1uZXQuZnJhbWV3b3JrIHN1cHBvcnRzIGlvdiwgYnV0IHdyaXRpbmcg
bW9yZSB0aGFuPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7IG9u
ZSBpb3YgaW50byB2bW5ldCBpbnRlcmZhY2UgZmFpbHMgd2l0aDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyAmIzM5O1ZNTkVUX0lOVkFMSURfQVJHVU1FTlQmIzM5
Oy4gQ29sbGVjdGluZyBwcm92aWRlZCBpb3ZzIGludG88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZn
dDsgJmd0O8KgIMKgIMKgICZndDsgb25lIGFuZCBwYXNzaW5nIGl0IHRvIHZtbmV0IHdvcmtzIGZp
bmUuIFRoYXQmIzM5O3MgdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDC
oCAmZ3Q7IHJlYXNvbiB3aHkgcmVjZWl2ZV9pb3YoKSBsZWZ0IHVuaW1wbGVtZW50ZWQuIEJ1dCBp
dCBzdGlsbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyB3b3Jr
cyB3aXRoIGdvb2QgZW5vdWdoIHBlcmZvcm1hbmNlIGhhdmluZyAucmVjZWl2ZSgpPGJyPg0KJmd0
O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7IG5ldC92bW5ldDogaW1wbGVtZW50
IHNoYXJlZCBtb2RlICh2bW5ldC1zaGFyZWQpPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZn
dDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAm
Z3Q7IEludGVyYWN0aW9uIHdpdGggdm1uZXQuZnJhbWV3b3JrIGluIGRpZmZlcmVudCBtb2Rlczxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyBkaWZmZXJzIG9ubHkg
b24gY29uZmlndXJhdGlvbiBzdGFnZSwgc28gd2UgY2FuIGNyZWF0ZTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyBjb21tb24gYHNlbmRgLCBgcmVjZWl2ZWAsIGV0
Yy4gcHJvY2VkdXJlcyBhbmQgcmV1c2UgdGhlbS48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsg
Jmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKg
ICZndDsgdm1uZXQuZnJhbWV3b3JrIHN1cHBvcnRzIGlvdiwgYnV0IHdyaXRpbmcgbW9yZSB0aGFu
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7IG9uZSBpb3YgaW50
byB2bW5ldCBpbnRlcmZhY2UgZmFpbHMgd2l0aDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyAmIzM5O1ZNTkVUX0lOVkFMSURfQVJHVU1FTlQmIzM5Oy4gQ29sbGVj
dGluZyBwcm92aWRlZCBpb3ZzIGludG88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8Kg
IMKgIMKgICZndDsgb25lIGFuZCBwYXNzaW5nIGl0IHRvIHZtbmV0IHdvcmtzIGZpbmUuIFRoYXQm
IzM5O3MgdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7IHJl
YXNvbiB3aHkgcmVjZWl2ZV9pb3YoKSBsZWZ0IHVuaW1wbGVtZW50ZWQuIEJ1dCBpdCBzdGlsbDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyB3b3JrcyB3aXRoIGdv
b2QgZW5vdWdoIHBlcmZvcm1hbmNlIGhhdmluZyAucmVjZWl2ZSgpPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7IGltcGxlbWVudGVkIG9ubHkuPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsm
Z3Q7ICZndDvCoCDCoCDCoCAmZ3Q7IEFsc28sIHRoZXJlIGlzIG5vIHdheSB0byB1bnN1YnNjcmli
ZSBmcm9tIHZtbmV0IHBhY2thZ2VzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDC
oCDCoCAmZ3Q7IHJlY2VpdmluZyBleGNlcHQgcmVnaXN0ZXJpbmcgYW5kIHVucmVnaXN0ZXJpbmcg
ZXZlbnQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgY2FsbGJh
Y2sgb3Igc2ltcGx5IGRyb3AgcGFja2FnZXMganVzdCBpZ25vcmluZyBhbmQ8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgbm90IHByb2Nlc3NpbmcgdGhlbSB3aGVu
IHJlbGF0ZWQgZmxhZyBpcyBzZXQuIEhlcmUgd2UgZG88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZn
dDsgJmd0O8KgIMKgIMKgICZndDsgdXNpbmcgdGhlIHNlY29uZCB3YXkuPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7
ICZndDvCoCDCoCDCoCAmZ3Q7IFNpZ25lZC1vZmYtYnk6IFBoaWxsaXAgVGVubmVuICZsdDs8YSBo
cmVmPSJtYWlsdG86cGhpbGxpcEBheGxlb3MuY29tIiB0YXJnZXQ9Il9ibGFuayI+cGhpbGxpcEBh
eGxlb3MuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OnBoaWxsaXBAYXhsZW9zLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnBoaWxsaXBAYXhsZW9zLmNvbTwv
YT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOnBoaWxsaXBAYXhsZW9zLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnBoaWxs
aXBAYXhsZW9zLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cGhpbGxpcEBheGxl
b3MuY29tIiB0YXJnZXQ9Il9ibGFuayI+cGhpbGxpcEBheGxlb3MuY29tPC9hPiZndDsmZ3Q7Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyBTaWduZWQtb2Zm
LWJ5OiBWbGFkaXNsYXYgWWFyb3NoY2h1azxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqAmbHQ7PGEgaHJlZj0ibWFpbHRvOlZsYWRpc2xhdi5ZYXJvc2hjaHVrQGpldGJyYWlu
cy5jb20iIHRhcmdldD0iX2JsYW5rIj5WbGFkaXNsYXYuWWFyb3NoY2h1a0BqZXRicmFpbnMuY29t
PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOlZsYWRpc2xh
di5ZYXJvc2hjaHVrQGpldGJyYWlucy5jb20iIHRhcmdldD0iX2JsYW5rIj5WbGFkaXNsYXYuWWFy
b3NoY2h1a0BqZXRicmFpbnMuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsg
Jmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86VmxhZGlzbGF2Lllhcm9zaGNo
dWtAamV0YnJhaW5zLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPlZsYWRpc2xhdi5ZYXJvc2hjaHVrQGpl
dGJyYWlucy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86VmxhZGlzbGF2Lllhcm9zaGNodWtAamV0YnJhaW5zLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPlZs
YWRpc2xhdi5ZYXJvc2hjaHVrQGpldGJyYWlucy5jb208L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsmZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8Kg
IMKgIMKgVGhhbmsgeW91IGZvciBwZXJzaXN0ZW50bHkgd29ya2luZyBvbiB0aGlzLjxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoCAmZ3Q7IC0tLTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgbmV0L3ZtbmV0LWNvbW1vbi5tIHwgMzAyPGJyPg0KJmd0O8KgIMKgIMKgICZndDsm
Z3Q7ICZndDvCoCDCoCDCoCsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgbmV0
L3ZtbmV0LXNoYXJlZC5jIHzCoCA5NCArKysrKysrKysrKysrLTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgbmV0L3ZtbmV0X2ludC5owqAgwqAgfMKgIDM5
ICsrKysrLTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
MyBmaWxlcyBjaGFuZ2VkLCA0MzAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSk8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgZGlmZiAtLWdpdCBhL25ldC92bW5ldC1jb21tb24u
bSBiL25ldC92bW5ldC1jb21tb24ubTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAg
wqAgwqAgJmd0OyBpbmRleCA1NjYxMmM3MmNlLi4yZjcwOTIxY2FlIDEwMDY0NDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyAtLS0gYS9uZXQvdm1uZXQtY29tbW9u
Lm08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKysrIGIvbmV0
L3ZtbmV0LWNvbW1vbi5tPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAm
Z3Q7IEBAIC0xMCw2ICsxMCw4IEBAPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgKi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKg
ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDvCoCDCoCNp
bmNsdWRlICZxdW90O3FlbXUvb3NkZXAuaCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0
OyAmZ3Q7wqAgwqAgwqAgJmd0OyArI2luY2x1ZGUgJnF1b3Q7cWVtdS9tYWluLWxvb3AuaCZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArI2luY2x1ZGUg
JnF1b3Q7cWVtdS9sb2cuaCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgI2luY2x1ZGUgJnF1b3Q7cWFwaS9xYXBpLXR5cGVzLW5ldC5oJnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAjaW5jbHVk
ZSAmcXVvdDt2bW5ldF9pbnQuaCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgI2luY2x1ZGUgJnF1b3Q7Y2xpZW50cy5oJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7IEBAIC0xNyw0ICsxOSwzMDQgQEA8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDvCoCDCoCNpbmNsdWRl
ICZxdW90O3FhcGkvZXJyb3IuaCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgI2luY2x1ZGUgJmx0O3ZtbmV0L3ZtbmV0LmgmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICsjaW5jbHVkZSAmbHQ7ZGlzcGF0Y2gvZGlzcGF0Y2gu
aCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArc3RhdGljIGlubGluZSB2b2lkPGJyPg0KJmd0
O8KgIMKgIMKgdm1uZXRfc2V0X3NlbmRfYmhfc2NoZWR1bGVkKFZtbmV0Q29tbW9uU3RhdGUgKnMs
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGJvb2w8YnI+DQomZ3Q7wqAgwqAgwqBlbmFibGUpPGJyPg0KJmd0O8KgIMKgIMKgICZndDsm
Z3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCBxYXRvbWljX3NldCgmYW1wO3MtJmd0O3NlbmRfc2NoZWR1bGVk
LCBlbmFibGUpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyAr
fTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0
O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK3N0YXRpYyBpbmxpbmUgYm9vbDxicj4NCiZndDvC
oCDCoCDCoHZtbmV0X2lzX3NlbmRfYmhfc2NoZWR1bGVkKFZtbmV0Q29tbW9uU3RhdGUgKnMpPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICt7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCByZXR1cm4gcWF0b21pY19s
b2FkX2FjcXVpcmUoJmFtcDtzLSZndDtzZW5kX3NjaGVkdWxlZCk7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICt9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7
ICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKg
IMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyAr
c3RhdGljIGlubGluZSB2b2lkPGJyPg0KJmd0O8KgIMKgIMKgdm1uZXRfc2V0X3NlbmRfZW5hYmxl
ZChWbW5ldENvbW1vblN0YXRlICpzLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgYm9vbCBlbmFibGUpPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7
ICZndDvCoCDCoCDCoCAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCBpZiAoZW5hYmxlKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7
ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCB2bW5ldF9pbnRlcmZhY2Vfc2V0X2V2ZW50
X2NhbGxiYWNrKDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgcy0mZ3Q7dm1uZXRfaWYsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsm
Z3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBWTU5FVF9JTlRFUkZBQ0Vf
UEFDS0VUU19BVkFJTEFCTEUsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBzLSZndDtpZl9xdWV1ZSw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIF4oaW50ZXJm
YWNlX2V2ZW50X3QgZXZlbnRfaWQsIHhwY19vYmplY3RfdDxicj4NCiZndDvCoCDCoCDCoGV2ZW50
KSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBhc3NlcnQoZXZlbnRfaWQgPT08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyZndDsgJmd0O8KgIMKgIMKgVk1ORVRfSU5URVJGQUNFX1BBQ0tFVFNfQVZBSUxBQkxFKTs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIC8qPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCogVGhpcyBmdW5jdGlvbiBpcyBiZWluZyBjYWxs
ZWQgZnJvbTxicj4NCiZndDvCoCDCoCDCoGEgbm9uIHFlbXU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyZndDsgJmd0O8KgIMKgIMKgdGhyZWFkLCBzbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIHdlIG9ubHkgc2No
ZWR1bGUgYSBCSCwgYW5kIGRvIHRoZTxicj4NCiZndDvCoCDCoCDCoHJlc3Qgb2YgdGhlPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoGlvIGNvbXBsZXRpb248YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgKiBoYW5kbGluZyBmcm9tIHZtbmV0X3NlbmRfYmgoKSB3aGljaDxicj4NCiZndDvCoCDC
oCDCoHJ1bnMgaW4gYTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqBxZW11
IGNvbnRleHQuPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0
O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBBdm9pZCBzY2hlZHVs
aW5nIG11bHRpcGxlIGJvdHRvbSBoYWx2ZXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0
O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKi88YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGlmICghdm1uZXRfaXNfc2VuZF9iaF9zY2hlZHVsZWQocykpIHs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHZtbmV0X3NldF9zZW5kX2JoX3NjaGVkdWxlZChzLCB0cnVlKTs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqBJdCBj
YW4gYmUgaW50ZXJydXB0ZWQgYmV0d2VlbiB2bW5ldF9pc19zZW5kX2JoX3NjaGVkdWxlZCBhbmQ8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgdm1uZXRfc2V0X3NlbmRfYmhf
c2NoZWR1bGVkLCB3aGljaCBsZWFkcyB0byBkYXRhIHJhY2UuPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsmZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7Jmd0OyAmZ3Q7IFNvcnJ5LCBJIGRpZCBub3QgY2xlYXJseSB1bmRlcnN0YW5kIHdo
YXQgeW91IG1lYW50LiBTaW5jZSB0aGlzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDsg
Y2FsbGJhY2sgKGJsb2NrKSBpcyBzdWJtaXR0ZWQgb24gRElTUEFUQ0hfUVVFVUVfU0VSSUFMLDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7IG9ubHkgb25lIGluc3RhbmNlIG9mIHRoZSBj
YWxsYmFjayB3aWxsIGJlIGV4ZWN1dGVkIGF0IGFueTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0
OyAmZ3Q7IG1vbWVudCBvZiB0aW1lLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9kZXZlbG9wZXIuYXBwbGUuY29tL2RvY3Vt
ZW50YXRpb24vZGlzcGF0Y2gvZGlzcGF0Y2hfcXVldWVfc2VyaWFsIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj5odHRwczovL2RldmVsb3Blci5hcHBsZS5jb20vZG9jdW1lbnRhdGlv
bi9kaXNwYXRjaC9kaXNwYXRjaF9xdWV1ZV9zZXJpYWw8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHBzOi8vZGV2ZWxvcGVyLmFwcGxlLmNvbS9kb2N1bWVudGF0aW9uL2Rpc3Bh
dGNoL2Rpc3BhdGNoX3F1ZXVlX3NlcmlhbCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cHM6Ly9kZXZlbG9wZXIuYXBwbGUuY29tL2RvY3VtZW50YXRpb24vZGlzcGF0Y2gvZGlz
cGF0Y2hfcXVldWVfc2VyaWFsPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL2RldmVsb3Blci5hcHBsZS5j
b20vZG9jdW1lbnRhdGlvbi9kaXNwYXRjaC9kaXNwYXRjaF9xdWV1ZV9zZXJpYWwiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZGV2ZWxvcGVyLmFwcGxlLmNvbS9kb2N1
bWVudGF0aW9uL2Rpc3BhdGNoL2Rpc3BhdGNoX3F1ZXVlX3NlcmlhbDwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9kZXZlbG9wZXIuYXBwbGUuY29tL2RvY3VtZW50YXRp
b24vZGlzcGF0Y2gvZGlzcGF0Y2hfcXVldWVfc2VyaWFsIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwczovL2RldmVsb3Blci5hcHBsZS5jb20vZG9jdW1lbnRhdGlvbi9kaXNw
YXRjaC9kaXNwYXRjaF9xdWV1ZV9zZXJpYWw8L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7IEFsc28gdGhpcyBp
cyB0aGUgb25seSBwbGFjZSB3aGVyZSB3ZSBzY2hlZHVsZSBhIGJvdHRvbSBoYWxmLjxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDsg
QWZ0ZXIgd2Ugc2V0IHRoZSAmIzM5O3NlbmRfc2NoZWR1bGVkJiMzOTsgZmxhZywgYWxsIHRoZSBv
dGhlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7IGNhbGxiYWNrwqAgYmxvY2tzIHdp
bGwgZG8gbm90aGluZyAoc2tpcCB0aGUgaWYgYmxvY2spIHVudGlsPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsmZ3Q7ICZndDsgdGhlIGJvdHRvbSBoYWxmIGlzIGV4ZWN1dGVkIGFuZCByZXNldCAmIzM5
O3NlbmRfc2NoZWR1bGVkJiMzOTsuPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDsgSSBk
b24mIzM5O3Qgc2VlIGFueSByYWNlcyBoZXJlIDooPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7
ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0OyBDb3JyZWN0IG1lIGlmIEkmIzM5
O20gd3JvbmcgcGxlYXNlLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7Jmd0OyBNeSBleHBsYW5hdGlvbiB0aGF0IHRoZSBpbnRlcnJ1cHRpb24gYmV0d2Vl
bjxicj4NCiZndDvCoCDCoCDCoHZtbmV0X2lzX3NlbmRfYmhfc2NoZWR1bGVkPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7IGFuZCB2bW5ldF9zZXRfc2VuZF9iaF9zY2hlZHVsZWQgaXMgcHJvYmxl
bWF0aWMgd2FzIGFjdHVhbGx5PGJyPg0KJmd0O8KgIMKgIMKgbWlzbGVhZGluZy48YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgVGhlIHByb2JsZW0g
aXMgdGhhdCB2bW5ldF9zZW5kX2JoIHJlc2V0cyAmIzM5O3NlbmRfc2NoZWR1bGVkJiMzOTsgYWZ0
ZXI8YnI+DQomZ3Q7wqAgwqAgwqBjYWxsaW5nPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7IHZt
bmV0X3JlYWQuIElmIHdlIGdvdCBhbm90aGVyIHBhY2tldCBhZnRlciB2bW5ldF9yZWFkLCBpdCB3
b3VsZCBiZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyBzaWxlbnRseSBpZ25vcmVkLjxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyBCeSB0aGUg
d2F5LCBJIGZvcmdvdCB0byBtZW50aW9uIGFub3RoZXIgcHJvYmxlbTo8YnI+DQomZ3Q7wqAgwqAg
wqB2bW5ldF9zZW5kX2NvbXBsZXRlZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyBjYWxscyB2
bW5ldF9zZXRfc2VuZF9lbmFibGVkLCBidXQgdGhlIG90aGVyIHBhY2tldHMgaW4gdGhlPGJyPg0K
Jmd0O8KgIMKgIMKgYnVmZmVyIG1heTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyBub3QgYmUg
c2VudCB5ZXQuIEFsc28sIHVucmVnaXN0ZXJpbmcgY2FsbGJhY2tzIGluPGJyPg0KJmd0O8KgIMKg
IMKgdm1uZXRfc2V0X3NlbmRfZW5hYmxlZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyBpcyBw
cm9iYWJseSBub3QgZW5vdWdoIHRvIHN0b3AgdGhlIGNhbGxiYWNrIGJlaW5nIGZpcmVkIHNpbmNl
IHNvbWU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgZGlzcGF0Y2ggYmxvY2tzIGFyZSBhbHJl
YWR5IGluIHRoZSBkaXNwYXRjaCBxdWV1ZS48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IE5vdyBJIHVuZGVyc3Rh
bmQgd2hhdCB5b3UgbWVhbiwgdGhhbmtzLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IFdoYXQgZG8g
eW91IHRoaW5rIGFib3V0IHRoZSB3b3JrYXJvdW5kPyBGb3IgbWU8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyBpdCBpcyBxdWl0ZSBkaWZmaWN1bHQgcXVlc3Rpb24gaG93IHRvIHN5bmNocm9uaXplIHFl
bXUgd2l0aDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHZtbmV0IHRocmVhZCwgZXNwZWNpYWxseSB3
aXRoIGNvbXBsZXRpb24gY2FsbGJhY2suPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBZb3Ug
bWF5IGFkZCBhIG5ldyBmaWVsZCB0byByZXByZXNlbnQgdGhlIG51bWJlciBvZiBwYWNrZXRzIGJl
aW5nIHNlbnQ8YnI+DQomZ3Q7wqAgwqAgwqBpbiB0aGUgYnVmZmVyLiBUaGUgZmllbGQgbXVzdCBi
ZSBtYWludGFpbmVkIGJ5IHZtbmV0X3NlbmRfYmggYW5kPGJyPg0KJmd0O8KgIMKgIMKgdm1uZXRf
c2VuZF9jb21wbGV0ZWQsIHdoaWNoIGFyZSBvbiB0aGUgaW90aHJlYWQuIHZtbmV0X3NlbmRfYmgg
c2hvdWxkPGJyPg0KJmd0O8KgIMKgIMKgZG8gbm90aGluZyBpZiB0aGUgZmllbGQgaXMgZ3JlYXRl
ciB0aGFuIDAgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGU8YnI+DQomZ3Q7wqAgwqAgwqBmdW5jdGlv
bi4gdm1uZXRfc2VuZF9jb21wbGV0ZWQgc2hvdWxkIGNhbGw8YnI+DQomZ3Q7wqAgwqAgwqBxZW11
X2JoX3NjaGVkdWxlKHMtJmd0O3NlbmRfYmgpLjxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQom
Z3Q7IFRoYW5rIHlvdSBmb3IgdGhlIGlkZWEhIFNvdW5kcyBtZWFuaW5nZnVsIHRvPGJyPg0KJmd0
OyBzY2hlZHVsZSBhIGJvdHRvbSBoYWxmIGluIHZtbmV0IHRocmVhZCBhbmQgZG8gdGhlPGJyPg0K
Jmd0OyByZXN0IG9mIHRoaW5ncyBpbiBpb3RocmVhZCB3aXRoIG5vIGNvbmN1cnJlbmN5Ljxicj4N
CiZndDsgPGJyPg0KJmd0OyBOb3Qgc3VyZSB0aGF0IG9ubHkgb25lIGZpZWxkIGlzIGVub3VnaCwg
Y2F1c2U8YnI+DQomZ3Q7IHdlIG1heSBoYXZlIHR3byBzdGF0ZXMgb24gYmggZXhlY3V0aW9uIHN0
YXJ0Ojxicj4NCiZndDsgMS4gVGhlcmUgYXJlIHBhY2tldHMgaW4gdm1uZXQgYnVmZmVyIHMtJmd0
O3BhY2tldHNfYnVmPGJyPg0KJmd0O8KgIMKgIMKgIHRoYXQgd2VyZSByZWplY3RlZCBieSBxZW11
X3NlbmRfYXN5bmMgYW5kIHdhaXRpbmc8YnI+DQomZ3Q7wqAgwqAgwqAgdG8gYmUgc2VudC4gSWYg
dGhpcyBoYXBwZW5zLCB3ZSBzaG91bGQgY29tcGxldGUgc2VuZGluZzxicj4NCiZndDvCoCDCoCDC
oCB0aGVzZSB3YWl0aW5nIHBhY2tldHMgd2l0aCBxZW11X3NlbmRfYXN5bmMgZmlyc3RseSw8YnI+
DQomZ3Q7wqAgwqAgwqAgYW5kIGFmdGVyIHRoYXQgd2Ugc2hvdWxkIGNhbGwgdm1uZXRfcmVhZCB0
byBnZXQ8YnI+DQomZ3Q7wqAgwqAgwqAgbmV3IG9uZXMgYW5kIHNlbmQgdGhlbSB0byBRRU1VOzxi
cj4NCiZndDsgMi4gVGhlcmUgYXJlIG5vIHBhY2tldHMgaW4gcy0mZ3Q7cGFja2V0c19idWYgdG8g
YmUgc2VudCB0bzxicj4NCiZndDvCoCDCoCDCoCBxZW11LCB3ZSBvbmx5IG5lZWQgdG8gZ2V0IG5l
dyBwYWNrZXRzIGZyb20gdm1uZXQ8YnI+DQomZ3Q7wqAgwqAgwqAgd2l0aCB2bW5ldF9yZWFkIGFu
ZCBzZW5kIHRoZW0gdG8gUUVNVTxicj4NCjxicj4NCkluIGNhc2UgMSwgeW91IHNob3VsZCBqdXN0
IGtlZXAgY2FsbGluZyBxZW11X3NlbmRfcGFja2V0X2FzeW5jLiBBY3R1YWxseSA8YnI+DQpxZW11
X3NlbmRfcGFja2V0X2FzeW5jIGFkZHMgdGhlIHBhY2tldCB0byBpdHMgaW50ZXJuYWwgcXVldWUg
YW5kIGNhbGxzIDxicj4NCnRoZSBjYWxsYmFjayB3aGVuIGl0IGlzIGNvbnN1bWVkLjxicj4NCjxi
cj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5JJiMzOTttIG5vdCBzdXJlIHdlIGNh
biBrZWVwIGNhbGxpbmcgcWVtdV9zZW5kX3BhY2tldF9hc3luYyw8L2Rpdj48ZGl2PmJlY2F1c2Ug
YXMgZG9jcyBmcm9twqBuZXQvcXVldWUuYyBzYXlzOjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
LyogWy4uLl08YnI+wqAqIElmIGEgc2VudCBjYWxsYmFjayBpcyBwcm92aWRlZCB0byBzZW5kKCks
IHRoZSBjYWxsZXIgbXVzdCBoYW5kbGUgYTxicj7CoCogemVybyByZXR1cm4gZnJvbSB0aGUgZGVs
aXZlcnkgaGFuZGxlciBieSBub3Qgc2VuZGluZyBhbnkgbW9yZSBwYWNrZXRzPGJyPsKgKiB1bnRp
bCB3ZSBoYXZlIGludm9rZWQgdGhlIGNhbGxiYWNrLiBPbmx5IGluIHRoYXQgY2FzZSB3aWxsIHdl
IHF1ZXVlPGJyPsKgKiB0aGUgcGFja2V0Ljxicj7CoCo8YnI+wqAqIElmIGEgc2VudCBjYWxsYmFj
ayBpc24mIzM5O3QgcHJvdmlkZWQsIHdlIGp1c3QgZHJvcCB0aGUgcGFja2V0IHRvIGF2b2lkPGJy
PsKgKiB1bmJvdW5kZWQgcXVldWVpbmcuPGJyPsKgKi88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PlNvIGFmdGVyIHdlIGRpZCB2bW5ldF9yZWFkIGFuZCByZWFkIE4gcGFja2V0czwvZGl2PjxkaXY+
aW50byB0ZW1wb3Jhcnkgcy0mZ3Q7cGFja2V0c19idWYsIHdlIGJlZ2luIGNhbGxpbmc8L2Rpdj48
ZGl2PnFlbXVfc2VuZF9wYWNrZXRfYXN5bmMuIElmIGl0IHJldHVybnMgMCAtIGl0IHNheXM8YnI+
JnF1b3Q7bm8gbW9yZSBwYWNrZXRzIHVudGlsIHNlbnRfY2IgY2FsbGVkIHBsZWFzZSZxdW90Oy48
YnI+QXQgdGhpcyBtb21lbnQgd2UgaGF2ZSBOIHBhY2tldHMgaW4gcy0mZ3Q7cGFja2V0c19idWY8
YnI+YW5kIGFscmVhZHkgcXVldWVkIEsgJmx0OyBOIG9mIHRoZW0uIEJ1dCwgcGFja2V0cyBLLi5O
PGJyPmFyZSBub3QgcXVldWVkIGFuZCBrZWVwIHdhaXRpbmcgZm9yIHNlbnRfY2IgdG8gYmUgc2Vu
dDxicj53aXRoIHFlbXVfc2VuZF9wYWNrZXRfYXN5bmMuPGJyPlRodXMgd2hlbiBzZW50X2NiIGNh
bGxlZCwgd2Ugc2hvdWxkIGZpbmlzaDxicj5vdXIgdHJhbnNmZXIgb2YgcGFja2V0cyBLLi5OIGZy
b20gcy0mZ3Q7cGFja2V0c19idWY8YnI+dG8gcWVtdSBjYWxsaW5nIHFlbXVfc2VuZF9wYWNrZXRf
YXN5bmMuPGJyPkkgbWVhbnQgdGhpcy48YnI+PGJyPkJ1dCBhbHNvIGl0JiMzOTtzIHBvc3NpYmxl
IHRoYXQgd2hpbGUgd2FpdGluZyBmb3Igc2VudF9jYjxicj5zb21lIG5ldyBwYWNrZXQocykgaGFz
IGJlZW4gcmVjZWl2ZWQgYW5kIGl0JiMzOTtzPGJyPnJlYWR5IHRvIGJlIHJlYWQgd2l0aCB2bW5l
dF9yZWFkLiBUbyBoYW5kbGUgdGhpcyw8YnI+d2hlbiBzZW50X2NiIGlzIGNhbGxlZCBhbmQgd2Um
IzM5O3JlIGRvbmUgd2l0aDxicj5wYWNrZXRzIEsuLk4gaW4gcy0mZ3Q7cGFja2V0c19idWYsIHdl
IHNob3VsZCBhbHNvPC9kaXY+PGRpdj5xdWVyeSB2bW5ldF9yZWFkIHRvIGNoZWNrIHdoZXRoZXIg
c29tZXRoaW5nPC9kaXY+PGRpdj5uZXcgaXMgcHJlc2VudC48L2Rpdj48ZGl2Pjxicj48YnI+QmVz
dCBSZWdhcmRzLDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VmxhZGlzbGF2IFlhcm9zaGNodWs8
L2Rpdj48ZGl2Pjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxl
PSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQs
MjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+DQomZ3Q7IDxicj4NCiZndDsgSXQgY2FuIGJlIGRv
bmUga2luZGEgdGhpcyB3YXk6PGJyPg0KJmd0OyBgYGA8YnI+DQomZ3Q7IHN0cnVjdCBzOjxicj4N
CiZndDvCoCDCoCDCoCBzZW5kX2JoOsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJoPGJy
Pg0KJmd0O8KgIMKgIMKgIHBhY2tldHNfYnVmOsKgIMKgIMKgIMKgIMKgIMKgIMKgIGFycmF5W3Bh
Y2tldF08YnI+DQomZ3Q7wqAgwqAgwqAgIyMgVGhyZWUgbmV3IGZpZWxkczxicj4NCiZndDvCoCDC
oCDCoCBzZW5kX2VuYWJsZWQ6wqAgwqAgwqAgwqAgwqAgwqBib29sPGJyPg0KJmd0O8KgIMKgIMKg
IHBhY2tldHNfc2VuZF9wb3M6wqAgwqAgaW50PGJyPg0KJmd0O8KgIMKgIMKgIHBhY2tldHNfYmF0
Y2hfc2l6ZTrCoCBpbnQ8YnI+DQomZ3Q7IDxicj4NCiZndDsgZnVuIGJoX3NlbmQocyk6PGJyPg0K
Jmd0O8KgIMKgIMKgICMjIFNlbmQgZGlzYWJsZWQgLSBkbyBub3RoaW5nPGJyPg0KJmd0O8KgIMKg
IMKgIGlmIG5vdCBzLSZndDtzZW5kX2VuYWJsZWQ6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIHJl
dHVybjxicj4NCiZndDvCoCDCoCDCoCAjIyBJZiBzb21lIHBhY2tldHMgYXJlIHdhaXRpbmcgdG8g
YmUgc2VudCBpbjxicj4NCiZndDvCoCDCoCDCoCAjIyBzLSZndDtwYWNrZXRzX2J1ZiAtIHNlbmQg
dGhlbTxicj4NCiZndDvCoCDCoCDCoCBpZiBzLSZndDtwYWNrZXRzX3NlbmRfcG9zwqAmbHQ7IHMt
Jmd0O3BhY2tldHNfYmF0Y2hfc2l6ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgaWYgbm90IHFl
bXVfc2VuZF93cmFwcGVyKHMpOjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm48
YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCAjIyBUcnkgdG8gcmVhZCBuZXcgcGFja2V0cyBm
cm9tIHZtbmV0PGJyPg0KJmd0O8KgIMKgIMKgIHMtJmd0O3BhY2tldHNfc2VuZF9wb3PCoD0gMDxi
cj4NCiZndDvCoCDCoCDCoCBzLSZndDtwYWNrZXRzX2JhdGNoX3NpemUgPSAwPGJyPg0KJmd0O8Kg
IMKgIMKgIHMtJmd0O3BhY2tldHNfYnVmwqA9IHZtbmV0X3JlYWQoJmFtcDtzLSZndDtwYWNrZXRz
X2JhdGNoX3NpemUpPGJyPg0KJmd0O8KgIMKgIMKgIGlmIHMtJmd0O3BhY2tldHNfYmF0Y2hfc2l6
ZSAmZ3Q7IDA6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgICMgSWYgc29tZXRoaW5nIHJlY2VpdmVk
IC0gcHJvY2VzcyB0aGVtPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIHFlbXVfc2VuZF93cmFwcGVy
KHMpPGJyPg0KJmd0OyBmdW4gcWVtdV9zZW5kX3dyYXBwZXIocyk6PGJyPg0KJmd0O8KgIMKgIMKg
IGZvciBpIGluIHMtJmd0O3BhY2tldHNfc2VuZF9wb3PCoHRvIHMtJmd0O3BhY2tldHNfYmF0Y2hf
c2l6ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgc2l6ZSA9IHFlbXVfc2VuZF9hc3luYyhzLSZn
dDtwYWNrZXRzX2J1ZltpXSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdm1uZXRfc2Vu
ZF9jb21wbGV0ZWQpPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIGlmIHNpemUgPT0gMDo8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgIyMgRGlzYWJsZSBwYWNrZXRzIHByb2Nlc3NpbmcgdW50
aWwgdm1uZXRfc2VuZF9jb21wbGV0ZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgIyMg
U2F2ZSB0aGUgc3RhdGU6IHBhY2tldHMgdG8gYmUgc2VudCBub3cgaW4gcy0mZ3Q7cGFja2V0c19i
dWY8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgIyMgaW4gcmFuZ2Ugcy0mZ3Q7cGFja2V0
c19zZW5kX3Bvcy4ucy0mZ3Q7cGFja2V0c19iYXRjaF9zaXplPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIHMtJmd0O3NlbmRfZW5hYmxlZCA9IGZhbHNlPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIHMtJmd0O3BhY2tldHNfc2VuZF9wb3PCoD0gacKgKyAxPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIGJyZWFrPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIGlmwqBzaXplICZs
dDsgMDo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgIyMgT24gZXJyb3IganVzdCBkcm9w
IHRoZSBwYWNrZXRzPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIHMtJmd0O3BhY2tldHNf
c2VuZF9wb3PCoD0gMDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCBzLSZndDtwYWNrZXRz
X2JhdGNoX3NpemUgPSAwPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIGJyZWFrPGJyPg0K
Jmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqByZXR1cm4gcy0mZ3Q7c2VuZF9lbmFibGVkPGJyPg0K
Jmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDsgZnVuIHZtbmV0X3NlbmRfY29tcGxldGVkKHMpOjxi
cj4NCiZndDvCoCDCoCDCoCAjIyBDb21wbGV0ZSBzZW5kaW5nIHBhY2tldHMgZnJvbSBzLSZndDtw
YWNrZXRzX2J1Zjxicj4NCiZndDvCoCDCoCDCoCBzLSZndDtzZW5kX2VuYWJsZWQgPSB0cnVlPGJy
Pg0KJmd0O8KgIMKgIMKgIHFlbXVfYmhfc2NoZWR1bGUocy0mZ3Q7c2VuZF9iaCk8YnI+DQomZ3Q7
IDxicj4NCiZndDsgIyMgRnJvbSBjYWxsYmFjayB3ZSBvbmx5IHNjaGVkdWxpbmcgdGhlIGJoPGJy
Pg0KJmd0OyB2bW5ldC5zZXRfY2FsbGJhY2soY2FsbGJhY2sgPSBzOiBxZW11X2JoX3NjaGVkdWxl
KHMtJmd0O3NlbmRfYmgpKTxicj4NCiZndDsgYGBgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IEkgdGhp
bmsgYSBzaW1wbGVywqBpbXBsZW1lbnRhdGlvbiBtYXkgZXhpc3QsIGJ1dCBjdXJyZW50bHk8YnI+
DQomZ3Q7IEkgc2VlIG9ubHkgdGhpcyBhcHByb2FjaCB3aXRoIHRoZSBzZW5kX2VuYWJsZWQgZmxh
ZyBhbmQ8YnI+DQomZ3Q7IHR3byBtb3JlIGZpZWxkcyB0byBzYXZlIHBhY2tldHMgc2VuZGluZyBz
dGF0ZS48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoHZtbmV0X3NldF9zZW5kX2VuYWJsZWQg
YW5kIHNlbmRfc2NoZWR1bGVkIGNhbiBiZSBzaW1wbHkgcmVtb3ZlZC48YnI+DQomZ3Q7wqAgwqAg
wqBxZW11X2JoX3NjaGVkdWxlIGVuc3VyZXMgdGhlcmUgaXMgbm8gZHVwbGljYXRlIHNjaGVkdWxp
bmcuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IFllcCwgbXkgbWlzdGFrZS4gUHJldmlvdXNseSBJIHVz
ZWQgc2NoZWR1bGVfb25lc2hvdCB3aGljaDxicj4NCiZndDsgY3JlYXRlcyBhIG5ldyBiaCBmb3Ig
ZWFjaCBjYWxsIHdoaWNoIGNhdXNlcyBkdXBsaWNhdGUgc2NoZWR1bGluZy48YnI+DQomZ3Q7IDxi
cj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgUmVnYXJkcyw8YnI+DQomZ3Q7wqAgwqAgwqBBa2lo
aWtvIE9kYWtpPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsmZ3Q7IFJlZ2FyZHMsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7IEFraWhpa28gT2Rha2k8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcWVtdV9iaF9zY2hlZHVsZShzLSZndDtzZW5kX2JoKTs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIH0pOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgfSBlbHNlIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0
O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHZtbmV0X2ludGVyZmFjZV9zZXRfZXZlbnRfY2Fs
bGJhY2soPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCBzLSZndDt2bW5ldF9pZiw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsg
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIFZNTkVUX0lOVEVSRkFDRV9QQUNL
RVRTX0FWQUlMQUJMRSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIE5VTEwsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBOVUxMKTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsg
Jmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAg
wqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICtz
dGF0aWMgdm9pZCB2bW5ldF9zZW5kX2NvbXBsZXRlZChOZXRDbGllbnRTdGF0ZSAqbmMsPGJyPg0K
Jmd0O8KgIMKgIMKgc3NpemVfdCBsZW4pPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoCAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCBWbW5ldENvbW1vblN0YXRlICpzID0gRE9fVVBDQVNUKFZtbmV0Q29tbW9uU3Rh
dGUsPGJyPg0KJmd0O8KgIMKgIMKgbmMsIG5jKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsg
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHZtbmV0X3NldF9zZW5kX2VuYWJsZWQocywgdHJ1ZSk7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICt9PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArc3RhdGljIHZvaWQgdm1uZXRfc2VuZF9iaCh2b2lkICpvcGFxdWUp
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICt7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBOZXRDbGllbnRTdGF0
ZSAqbmMgPSAoTmV0Q2xpZW50U3RhdGUgKikgb3BhcXVlOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgVm1uZXRDb21tb25TdGF0ZSAqcyA9IERPX1VQ
Q0FTVChWbW5ldENvbW1vblN0YXRlLDxicj4NCiZndDvCoCDCoCDCoG5jLCBuYyk7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHN0cnVjdCBpb3ZlYyAqaW92ID0gcy0m
Z3Q7aW92X2J1Zjs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIHN0cnVjdCB2bXBrdGRlc2MgKnBhY2tldHMgPSBzLSZndDtwYWNrZXRzX2J1Zjs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGludCBwa3Rf
Y250Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
aW50IGk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHZtbmV0X3Jl
dHVybl90IHN0YXR1czs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIHNzaXplX3Qgc2l6ZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8Kg
IMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0
OyArwqAgwqAgLyogcmVhZCBhcyBtYW55IHBhY2tldHMgYXMgcHJlc2VudCAqLzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgcGt0X2NudCA9IFZNTkVU
X1BBQ0tFVFNfTElNSVQ7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgVGhlcmUgY291bGQgYmUgbW9yZSB0aGFuIFZN
TkVUX1BBQ0tFVFNfTElNSVQuIFlvdSBtYXkgY2FsbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0
OyAmZ3Q7wqAgwqAgwqB2bW5ldF9yZWFkIGluPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZn
dDvCoCDCoCDCoGEgbG9vcC48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZm9yIChpID0gMDsg
aSAmbHQ7IHBrdF9jbnQ7ICsraSkgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcGFja2V0c1tpXS52bV9wa3Rfc2l6ZSA9IHMtJmd0O21h
eF9wYWNrZXRfc2l6ZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgIMKgIHBhY2tldHNbaV0udm1fcGt0X2lvdmNudCA9IDE7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBwYWNrZXRzW2ld
LnZtX2ZsYWdzID0gMDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsg
Kzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgc3Rh
dHVzID0gdm1uZXRfcmVhZChzLSZndDt2bW5ldF9pZiwgcGFja2V0cywgJmFtcDtwa3RfY250KTs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGlmIChz
dGF0dXMgIT0gVk1ORVRfU1VDQ0VTUykgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgZXJyb3JfcHJpbnRmKCZxdW90O3ZtbmV0OiByZWFk
IGZhaWxlZDogJXNcbiZxdW90Oyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdm1uZXRfc3RhdHVzX21h
cF9zdHIoc3RhdHVzKSk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCDCoCDCoCBnb3RvIGRvbmU7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIGZvciAoaSA9IDA7IGkgJmx0OyBwa3RfY250OyArK2kpIHs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHNpemUgPSBxZW11
X3NlbmRfcGFja2V0X2FzeW5jKG5jLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgaW92W2ldLmlvdl9iYXNlLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqBwYWNrZXRzW2ldLnZtX3BrdF9zaXpl
LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7
wqAgwqAgwqB2bW5ldF9zZW5kX2NvbXBsZXRlZCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7
ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBpZiAoc2l6ZSA9PSAwKSB7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCB2
bW5ldF9zZXRfc2VuZF9lbmFibGVkKHMsIGZhbHNlKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZn
dDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGdvdG8gZG9uZTs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIH0gZWxz
ZSBpZiAoc2l6ZSAmbHQ7IDApIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7Jmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoGdvdG8g
aXMgbm90IG5lZWRlZCBoZXJlLiAmcXVvdDticmVhayZxdW90OyB3aGVuIHNpemUgJmx0Oz0gMC48
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0
OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDC
oCAmZ3Q7ICtkb25lOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0
OyArwqAgwqAgdm1uZXRfc2V0X3NlbmRfYmhfc2NoZWR1bGVkKHMsIGZhbHNlKTs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDC
oCAmZ3Q7ICtzdGF0aWMgdm9pZCB2bW5ldF9idWZzX2luaXQoVm1uZXRDb21tb25TdGF0ZSAqcyk8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK3s8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHN0cnVjdCB2bXBrdGRl
c2MgKnBhY2tldHMgPSBzLSZndDtwYWNrZXRzX2J1Zjs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZn
dDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHN0cnVjdCBpb3ZlYyAqaW92ID0gcy0mZ3Q7aW92
X2J1Zjs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IGludCBpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBmb3IgKGkg
PSAwOyBpICZsdDsgVk1ORVRfUEFDS0VUU19MSU1JVDsgKytpKSB7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBpb3ZbaV0uaW92X2xlbiA9
IHMtJmd0O21heF9wYWNrZXRfc2l6ZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIGlvdltpXS5pb3ZfYmFzZSA9IGdfbWFsbG9jMChpb3Zb
aV0uaW92X2xlbik7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCBwYWNrZXRzW2ldLnZtX3BrdF9pb3YgPSBpb3YgKyBpOzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZn
dDsgK2NvbnN0IGNoYXIgKnZtbmV0X3N0YXR1c19tYXBfc3RyKHZtbmV0X3JldHVybl90IHN0YXR1
cyk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK3s8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHN3aXRjaCAoc3Rh
dHVzKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCBjYXNlIFZNTkVUX1NVQ0NFU1M6PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCByZXR1cm4gJnF1b3Q7c3VjY2VzcyZxdW90Ozs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGNhc2UgVk1ORVRf
RkFJTFVSRTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIMKgIMKgIHJldHVybiAmcXVvdDtnZW5lcmFsIGZhaWx1cmUgKHBvc3NpYmx5IG5vdCBlbm91
Z2g8YnI+DQomZ3Q7wqAgwqAgwqBwcml2aWxlZ2VzKSZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGNhc2UgVk1ORVRfTUVNX0ZBSUxVUkU6
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDC
oCByZXR1cm4gJnF1b3Q7bWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZSZxdW90Ozs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGNhc2UgVk1ORVRfSU5W
QUxJRF9BUkdVTUVOVDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgIMKgIHJldHVybiAmcXVvdDtpbnZhbGlkIGFyZ3VtZW50IHNwZWNpZmllZCZx
dW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IGNhc2UgVk1ORVRfU0VUVVBfSU5DT01QTEVURTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsg
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHJldHVybiAmcXVvdDtpbnRlcmZhY2Ugc2V0
dXAgaXMgbm90IGNvbXBsZXRlJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgY2FzZSBWTU5FVF9JTlZBTElEX0FDQ0VTUzo8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHJldHVybiAm
cXVvdDtpbnZhbGlkIGFjY2VzcywgcGVybWlzc2lvbiBkZW5pZWQmcXVvdDs7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBjYXNlIFZNTkVUX1BBQ0tF
VF9UT09fQklHOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqAgwqAgcmV0dXJuICZxdW90O3BhY2tldCBzaXplIGlzIGxhcmdlciB0aGFuIE1UVSZx
dW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IGNhc2UgVk1ORVRfQlVGRkVSX0VYSEFVU1RFRDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsg
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHJldHVybiAmcXVvdDtidWZmZXJzIGV4aGF1
c3RlZCBpbiBrZXJuZWwmcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCBjYXNlIFZNTkVUX1RPT19NQU5ZX1BBQ0tFVFM6PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCByZXR1cm4gJnF1
b3Q7cGFja2V0IGNvdW50IGV4Y2VlZHMgbGltaXQmcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICsjaWYgZGVmaW5lZChNQUNfT1NfVkVSU0lPTl8xMV8w
KSAmYW1wOyZhbXA7IFw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIE1BQ19PU19YX1ZFUlNJT05fTUlOX1JFUVVJUkVEICZndDs9IE1BQ19PU19WRVJT
SU9OXzExXzA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIGNhc2UgVk1ORVRfU0hBUklOR19TRVJWSUNFX0JVU1k6PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCByZXR1cm4gJnF1b3Q7Y29uZmxp
Y3QsIHNoYXJpbmcgc2VydmljZSBpcyBpbiB1c2UmcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICsjZW5kaWY8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZn
dDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGRlZmF1bHQ6PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCByZXR1cm4gJnF1b3Q7dW5rbm93
biB2bW5ldCBlcnJvciZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKg
ICZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICtpbnQgdm1uZXRfaWZfY3JlYXRlKE5l
dENsaWVudFN0YXRlICpuYyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHhwY19vYmplY3RfdCBpZl9kZXNj
LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgRXJyb3IgKiplcnJwKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgVm1uZXRDb21tb25TdGF0ZSAqcyA9IERPX1VQQ0FTVChWbW5l
dENvbW1vblN0YXRlLDxicj4NCiZndDvCoCDCoCDCoG5jLCBuYyk7Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7Jmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoER1
cGxpY2F0ZSBzZW1pY29sb25zLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBkaXNwYXRjaF9z
ZW1hcGhvcmVfdCBpZl9jcmVhdGVkX3NlbSA9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZn
dDvCoCDCoCDCoGRpc3BhdGNoX3NlbWFwaG9yZV9jcmVhdGUoMCk7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsmZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgaWZf
Y3JlYXRlZF9zZW0gbGVha3MuPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIF9fYmxvY2sgdm1u
ZXRfcmV0dXJuX3QgaWZfc3RhdHVzOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAg
wqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCBzLSZndDtpZl9xdWV1ZSA9IGRpc3BhdGNoX3F1ZXVlX2NyZWF0ZSg8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgICZxdW90O29y
Zy5xZW11LnZtbmV0LmlmX3F1ZXVlJnF1b3Q7LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgRElTUEFUQ0hfUVVFVUVfU0VSSUFMPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCApOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB4cGNfZGljdGlvbmFyeV9zZXRfYm9v
bCg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKg
IMKgIGlmX2Rlc2MsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCB2bW5ldF9hbGxvY2F0ZV9tYWNfYWRkcmVzc19rZXksPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBmYWxzZTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgKTs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKyNpZmRlZiBERUJVRzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgcWVtdV9sb2co
JnF1b3Q7dm1uZXQuc3RhcnQuaW50ZXJmYWNlX2Rlc2M6XG4mcXVvdDspOzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgeHBjX2RpY3Rpb25hcnlfYXBw
bHkoaWZfZGVzYyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXmJvb2woY29uc3QgY2hhciAq
ayw8YnI+DQomZ3Q7wqAgwqAgwqB4cGNfb2JqZWN0X3Qgdikgezxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjaGFyICpkZXNjID08YnI+DQomZ3Q7wqAgwqAgwqB4cGNfY29weV9kZXNj
cmlwdGlvbih2KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcWVtdV9sb2coJnF1
b3Q7wqAgJXM9JXNcbiZxdW90Oywgayw8YnI+DQomZ3Q7wqAgwqAgwqBkZXNjKTs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnJlZShkZXNjKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmV0dXJuIHRydWU7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0pOzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArI2VuZGlmIC8qIERF
QlVHICovPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHMtJmd0O3Zt
bmV0X2lmID0gdm1uZXRfc3RhcnRfaW50ZXJmYWNlKDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0
OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgaWZfZGVzYyw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHMtJmd0O2lmX3F1ZXVl
LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgXih2bW5ldF9yZXR1cm5fdCBzdGF0dXMsIHhwY19vYmplY3RfdDxicj4NCiZndDvCoCDCoCDC
oGludGVyZmFjZV9wYXJhbSkgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgaWZfc3RhdHVzID0gc3RhdHVzOzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgaWYg
KHN0YXR1cyAhPSBWTU5FVF9TVUNDRVNTIHx8PGJyPg0KJmd0O8KgIMKgIMKgIWludGVyZmFjZV9w
YXJhbSkgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgZGlzcGF0Y2hfc2VtYXBob3JlX3NpZ25hbChpZl9jcmVhdGVk
X3NlbSk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm47PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0
O8KgIMKgIMKgICZndDsgKyNpZmRlZiBERUJVRzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgcWVtdV9sb2coJnF1b3Q7dm1uZXQu
c3RhcnQuaW50ZXJmYWNlX3BhcmFtOlxuJnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZn
dDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIHhwY19kaWN0aW9uYXJ5X2Fw
cGx5KGludGVyZmFjZV9wYXJhbSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgXmJvb2woY29uc3QgY2hhciAqayw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8Kg
IMKgIMKgeHBjX29iamVjdF90IHYpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY2hhciAqZGVzYyA9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoHhwY19jb3B5X2Rlc2NyaXB0aW9uKHYpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0
OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBxZW11X2xvZygmcXVvdDsgPGJyPg0KJmd0O8KgIMKgIMKgJXM9
JXNcbiZxdW90OywgaywgZGVzYyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGZyZWUoZGVzYyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJldHVybiB0cnVlOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKyNl
bmRpZiAvKiBERUJVRyAqLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAg
Jmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCBzLSZndDttdHUgPSB4cGNfZGljdGlvbmFyeV9nZXRfdWludDY0KDxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgaW50ZXJmYWNlX3BhcmFtLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdm1uZXRfbXR1X2tleSk7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCBzLSZndDttYXhfcGFja2V0X3NpemUgPTxicj4NCiZndDvCoCDCoCDCoHhwY19kaWN0aW9u
YXJ5X2dldF91aW50NjQoPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbnRlcmZhY2VfcGFyYW0sPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCB2bW5ldF9tYXhfcGFja2V0X3NpemVfa2V5KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsg
Jmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgZGlzcGF0Y2hfc2VtYXBob3JlX3NpZ25hbChpZl9j
cmVhdGVkX3NlbSk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCB9KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKg
ICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAg
wqAgaWYgKHMtJmd0O3ZtbmV0X2lmID09IE5VTEwpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZn
dDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIGVycm9yX3NldGcoZXJycCw8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJnF1b3Q7dW5hYmxlIHRvIGNyZWF0ZSBpbnRlcmZhY2UgJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZxdW90O3dpdGggcmVxdWVzdGVkIHBhcmFtcyZxdW90Oyk7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsmZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8Kg
IMKgIMKgWW91IGRvbiYjMzk7dCBuZWVkIGxpbmUgYnJlYWtzIGhlcmUuIEJyZWFraW5nIGEgc3Ry
aW5nIGludG8gYTxicj4NCiZndDvCoCDCoCDCoGZldyB3b3VsZDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7Jmd0OyAmZ3Q7wqAgwqAgwqBhbHNvPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoG1ha2VzIGl0IGEgYml0IGhhcmQgdG8gZ3JlcC48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqAgwqAgcmV0dXJuIC0xOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoHMtJmd0O2lmX3F1ZXVlIGxlYWtz
Ljxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsm
Z3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7
ICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIGRpc3BhdGNoX3NlbWFwaG9yZV93YWl0KGlmX2NyZWF0ZWRfc2VtLDxi
cj4NCiZndDvCoCDCoCDCoERJU1BBVENIX1RJTUVfRk9SRVZFUik7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsg
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGlmIChpZl9zdGF0dXMgIT0gVk1ORVRfU1VDQ0VTUykg
ezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgZXJyb3Jfc2V0ZyhlcnJwLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtjYW5ub3QgY3JlYXRl
IHZtbmV0IGludGVyZmFjZTogJXMmcXVvdDssPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZtbmV0X3N0YXR1
c19tYXBfc3RyKGlmX3N0YXR1cykpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcmV0dXJuIC0xOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0
OyAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCBzLSZndDtzZW5kX2JoID0gYWlvX2JoX25ldyhxZW11X2dldF9haW9f
Y29udGV4dCgpLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqB2bW5ldF9z
ZW5kX2JoLCBuYyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCB2bW5ldF9idWZzX2luaXQocyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB2bW5ldF9zZXRfc2VuZF9iaF9zY2hlZHVsZWQocywgZmFs
c2UpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
dm1uZXRfc2V0X3NlbmRfZW5hYmxlZChzLCB0cnVlKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZn
dDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHJldHVybiAwOzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDC
oCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK3Nz
aXplX3Qgdm1uZXRfcmVjZWl2ZV9jb21tb24oTmV0Q2xpZW50U3RhdGUgKm5jLDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb25zdCB1aW50OF90ICpidWYsPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHNpemVfdCBzaXplKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0
OyAmZ3Q7wqAgwqAgwqAgJmd0OyArezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgVm1uZXRDb21tb25TdGF0ZSAqcyA9IERPX1VQQ0FTVChWbW5ldENv
bW1vblN0YXRlLDxicj4NCiZndDvCoCDCoCDCoG5jLCBuYyk7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBzdHJ1Y3Qgdm1wa3RkZXNjIHBhY2tldDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHN0cnVj
dCBpb3ZlYyBpb3Y7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCBpbnQgcGt0X2NudDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIHZtbmV0X3JldHVybl90IGlmX3N0YXR1czs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0
OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaWYgKHNpemUgJmd0OyBzLSZndDttYXhfcGFja2V0
X3NpemUpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIMKgIMKgIHdhcm5fcmVwb3J0KCZxdW90O3ZtbmV0OiBwYWNrZXQgaXMgdG9vIGJpZywgJXp1
ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAlbGx1XG4mcXVvdDssPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsmZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgVXNlIFBS
SXU2NC48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
cGFja2V0LnZtX3BrdF9zaXplLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcy0mZ3Q7bWF4X3BhY2tldF9z
aXplKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IMKgIMKgIHJldHVybiAtMTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZn
dDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
aW92Lmlvdl9iYXNlID0gKGNoYXIgKikgYnVmOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaW92Lmlvdl9sZW4gPSBzaXplOzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsm
Z3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBwYWNrZXQudm1fcGt0X2lvdmNudCA9IDE7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBwYWNrZXQu
dm1fZmxhZ3MgPSAwOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0
OyArwqAgwqAgcGFja2V0LnZtX3BrdF9zaXplID0gc2l6ZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHBhY2tldC52bV9wa3RfaW92ID0gJmFtcDtp
b3Y7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBw
a3RfY250ID0gMTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsg
Kzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaWZf
c3RhdHVzID0gdm1uZXRfd3JpdGUocy0mZ3Q7dm1uZXRfaWYsICZhbXA7cGFja2V0LDxicj4NCiZn
dDvCoCDCoCDCoCZhbXA7cGt0X2NudCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCBpZiAoaWZfc3RhdHVzICE9IFZNTkVUX1NVQ0NFU1MpIHs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIGVy
cm9yX3JlcG9ydCgmcXVvdDt2bW5ldDogd3JpdGUgZXJyb3I6ICVzXG4mcXVvdDssPGJyPg0KJmd0
O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHZtbmV0X3N0YXR1c19tYXBfc3RyKGlmX3N0YXR1cykpOzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDC
oCDCoFdoeSBkb24mIzM5O3QgcmV0dXJuIC0xPzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB9
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGlmIChpZl9zdGF0dXMg
PT0gVk1ORVRfU1VDQ0VTUyAmYW1wOyZhbXA7IHBrdF9jbnQpIHs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHJldHVybiBzaXplOzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgcmV0dXJuIDA7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICt9PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqAgJmd0OyArdm9pZCB2bW5ldF9jbGVhbnVwX2NvbW1vbihOZXRDbGllbnRTdGF0ZSAq
bmMpPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICt7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBWbW5ldENvbW1v
blN0YXRlICpzID0gRE9fVVBDQVNUKFZtbmV0Q29tbW9uU3RhdGUsPGJyPg0KJmd0O8KgIMKgIMKg
bmMsIG5jKTs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgRHVwbGljYXRlIHNlbWljb2xvbnMuPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIGRpc3BhdGNoX3NlbWFwaG9yZV90IGlmX2NyZWF0ZWRfc2VtOzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBxZW11X3B1cmdlX3F1ZXVlZF9w
YWNrZXRzKG5jKTsgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDC
oHZtbmV0X3NldF9zZW5kX2JoX3NjaGVkdWxlZChzLCB0cnVlKTs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHZtbmV0X3NldF9zZW5kX2VuYWJsZWQo
cywgZmFsc2UpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyAr
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBpZiAo
cy0mZ3Q7dm1uZXRfaWYgPT0gTlVMTCkgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcmV0dXJuOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0
OyAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCBpZl9jcmVhdGVkX3NlbSA9IGRpc3BhdGNoX3NlbWFwaG9yZV9jcmVh
dGUoMCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCB2bW5ldF9zdG9wX2ludGVyZmFjZSg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHMtJmd0O3ZtbmV0X2lmLDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcy0mZ3Q7aWZfcXVldWUs
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDC
oCBeKHZtbmV0X3JldHVybl90IHN0YXR1cykgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgYXNzZXJ0KHN0YXR1cyA9PSBWTU5F
VF9TVUNDRVNTKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIGRpc3BhdGNoX3NlbWFwaG9yZV9zaWduYWwoaWZfY3JlYXRlZF9z
ZW0pOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
wqAgwqAgfSk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCBkaXNwYXRjaF9zZW1hcGhvcmVfd2FpdChpZl9jcmVhdGVkX3NlbSw8YnI+DQomZ3Q7wqAg
wqAgwqBESVNQQVRDSF9USU1FX0ZPUkVWRVIpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCBxZW11X2JoX2RlbGV0ZShzLSZndDtzZW5kX2JoKTs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGRpc3BhdGNoX3JlbGVhc2Uo
aWZfY3JlYXRlZF9zZW0pOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAg
Jmd0OyArwqAgwqAgZGlzcGF0Y2hfcmVsZWFzZShzLSZndDtpZl9xdWV1ZSk7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGZvciAoaW50IGkgPSAwOyBpICZsdDsgVk1O
RVRfUEFDS0VUU19MSU1JVDsgKytpKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBnX2ZyZWUocy0mZ3Q7aW92X2J1ZltpXS5pb3ZfYmFz
ZSk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB9
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICt9PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7IGRpZmYgLS1naXQgYS9uZXQvdm1u
ZXQtc2hhcmVkLmMgYi9uZXQvdm1uZXQtc2hhcmVkLmM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZn
dDsgJmd0O8KgIMKgIMKgICZndDsgaW5kZXggZjA3YWZhYWYyMS4uNjZmNjZjMDM0YiAxMDA2NDQ8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgLS0tIGEvbmV0L3Zt
bmV0LXNoYXJlZC5jPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7
ICsrKyBiL25ldC92bW5ldC1zaGFyZWQuYzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqAgJmd0OyBAQCAtMTAsMTYgKzEwLDEwMiBAQDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgI2luY2x1ZGUgJnF1b3Q7cWVtdS9vc2RlcC5oJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAjaW5jbHVkZSAmcXVvdDtx
YXBpL3FhcGktdHlwZXMtbmV0LmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0
O8KgIMKgIMKgICZndDsgKyNpbmNsdWRlICZxdW90O3FhcGkvZXJyb3IuaCZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgI2luY2x1ZGUgJnF1b3Q7
dm1uZXRfaW50LmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCNpbmNsdWRlICZxdW90O2NsaWVudHMuaCZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyAtI2luY2x1ZGUgJnF1b3Q7cWVtdS9lcnJvci1y
ZXBvcnQuaCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0
OyAtI2luY2x1ZGUgJnF1b3Q7cWFwaS9lcnJvci5oJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAjaW5jbHVkZSAmbHQ7dm1uZXQvdm1uZXQuaCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK3R5cGVkZWYgc3RydWN0IFZtbmV0U2hhcmVkU3RhdGUg
ezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgVm1u
ZXRDb21tb25TdGF0ZSBjczs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKg
ICZndDsgK30gVm1uZXRTaGFyZWRTdGF0ZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0
O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAg
Jmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICtzdGF0
aWMgYm9vbCB2YWxpZGF0ZV9vcHRpb25zKGNvbnN0IE5ldGRldiAqbmV0ZGV2LDxicj4NCiZndDvC
oCDCoCDCoEVycm9yICoqZXJycCk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKg
IMKgICZndDsgK3s8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIGNvbnN0IE5ldGRldlZtbmV0U2hhcmVkT3B0aW9ucyAqb3B0aW9ucyA9PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCZhbXA7KG5ldGRldi0mZ3Q7dS52bW5ldF9z
aGFyZWQpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICsjaWYgIWRlZmluZWQo
TUFDX09TX1ZFUlNJT05fMTFfMCkgfHwgXDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgTUFDX09TX1hfVkVSU0lPTl9NSU5fUkVRVUlSRUQgJmx0OyBN
QUNfT1NfVkVSU0lPTl8xMV8wPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCBpZiAob3B0aW9ucy0mZ3Q7aGFzX2lzb2xhdGVkKSB7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBlcnJvcl9zZXRn
KGVycnAsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O3ZtbmV0LXNoYXJlZC5pc29sYXRlZCBmZWF0
dXJlIGlzICZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDt1bmF2YWlsYWJsZTogb3V0ZGF0
ZWQ8YnI+DQomZ3Q7wqAgwqAgwqB2bW5ldC5mcmFtZXdvcmsgQVBJJnF1b3Q7KTs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHJldHVybiBm
YWxzZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKyNlbmRpZjxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBpZiAoKG9wdGlvbnMtJmd0
O2hhc19zdGFydF9hZGRyZXNzIHx8PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoG9wdGlvbnMtJmd0O2hhc19lbmRfYWRkcmVzcyB8fDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAg
wqBvcHRpb25zLSZndDtoYXNfc3VibmV0X21hc2spICZhbXA7JmFtcDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgICEob3B0aW9ucy0mZ3Q7
aGFzX3N0YXJ0X2FkZHJlc3MgJmFtcDsmYW1wOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgb3B0aW9ucy0mZ3Q7aGFzX2VuZF9hZGRy
ZXNzICZhbXA7JmFtcDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgIMKgIMKgIG9wdGlvbnMtJmd0O2hhc19zdWJuZXRfbWFzaykpIHs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIGVycm9y
X3NldGcoZXJycCw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7JiMzOTtzdGFydC1hZGRyZXNzJiMz
OTssICYjMzk7ZW5kLWFkZHJlc3MmIzM5Oyw8YnI+DQomZ3Q7wqAgwqAgwqAmIzM5O3N1Ym5ldC1t
YXNrJiMzOTsgJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O3Nob3VsZCBiZSBwcm92aWRl
ZCB0b2dldGhlciZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAg
Jmd0OyArwqAgwqAgwqAgwqAgKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIHJldHVybiBmYWxzZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZn
dDsgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgcmV0dXJuIHRydWU7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7
ICZndDvCoCDCoCDCoCAmZ3Q7ICt9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDC
oCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsg
K3N0YXRpYyB4cGNfb2JqZWN0X3QgYnVpbGRfaWZfZGVzYyhjb25zdCBOZXRkZXYgKm5ldGRldik8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK3s8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGNvbnN0IE5ldGRldlZt
bmV0U2hhcmVkT3B0aW9ucyAqb3B0aW9ucyA9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZn
dDvCoCDCoCDCoCZhbXA7KG5ldGRldi0mZ3Q7dS52bW5ldF9zaGFyZWQpOzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgeHBjX29iamVjdF90IGlmX2Rl
c2MgPSB4cGNfZGljdGlvbmFyeV9jcmVhdGUoTlVMTCw8YnI+DQomZ3Q7wqAgwqAgwqBOVUxMLCAw
KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgeHBjX2RpY3Rpb25h
cnlfc2V0X3VpbnQ2NCg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgIMKgIGlmX2Rlc2MsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCB2bW5ldF9vcGVyYXRpb25fbW9kZV9rZXksPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBWTU5F
VF9TSEFSRURfTU9ERTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0
OyArwqAgwqAgKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsg
Kzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaWYg
KG9wdGlvbnMtJmd0O2hhc19uYXQ2Nl9wcmVmaXgpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZn
dDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHhwY19kaWN0aW9uYXJ5X3NldF9zdHJp
bmcoaWZfZGVzYyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZtbmV0
X25hdDY2X3ByZWZpeF9rZXksPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBvcHRpb25zLSZndDtuYXQ2Nl9wcmVmaXgpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCBpZiAob3B0aW9ucy0mZ3Q7aGFzX3N0YXJ0X2FkZHJlc3MpIHs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHhwY19kaWN0
aW9uYXJ5X3NldF9zdHJpbmcoaWZfZGVzYyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0
O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHZtbmV0X3N0YXJ0X2FkZHJlc3Nfa2V5LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgb3B0aW9ucy0mZ3Q7c3RhcnRfYWRkcmVzcyk7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCB4cGNfZGljdGlv
bmFyeV9zZXRfc3RyaW5nKGlmX2Rlc2MsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB2bW5ldF9lbmRfYWRkcmVzc19rZXksPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7
ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBvcHRpb25zLSZndDtlbmRfYWRkcmVzcyk7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCB4cGNfZGljdGlvbmFyeV9z
ZXRfc3RyaW5nKGlmX2Rlc2MsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCB2bW5ldF9zdWJuZXRfbWFza19rZXksPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBvcHRpb25zLSZndDtzdWJuZXRfbWFzayk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsm
Z3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7
ICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKg
IMKgICZndDsgKyNpZiBkZWZpbmVkKE1BQ19PU19WRVJTSU9OXzExXzApICZhbXA7JmFtcDsgXDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgTUFDX09T
X1hfVkVSU0lPTl9NSU5fUkVRVUlSRUQgJmd0Oz0gTUFDX09TX1ZFUlNJT05fMTFfMDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgeHBjX2RpY3Rpb25h
cnlfc2V0X2Jvb2woPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCBpZl9kZXNjLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgdm1uZXRfZW5hYmxlX2lzb2xhdGlvbl9rZXksPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBvcHRp
b25zLSZndDtpc29sYXRlZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAg
Jmd0OyArwqAgwqAgKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZn
dDsgKyNlbmRpZjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyAr
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCByZXR1
cm4gaWZfZGVzYzs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsg
K308YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArc3RhdGljIE5ldENsaWVudElu
Zm8gbmV0X3ZtbmV0X3NoYXJlZF9pbmZvID0gezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgLnR5cGUgPSBORVRfQ0xJRU5UX0RSSVZFUl9WTU5FVF9T
SEFSRUQsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCAuc2l6ZSA9IHNpemVvZihWbW5ldFNoYXJlZFN0YXRlKSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIC5yZWNlaXZlID0gdm1uZXRfcmVjZWl2ZV9j
b21tb24sPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCAuY2xlYW51cCA9IHZtbmV0X2NsZWFudXBfY29tbW9uLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArfTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0
O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgaW50IG5ldF9pbml0X3ZtbmV0X3NoYXJlZChjb25zdCBOZXRkZXYgKm5ldGRldiwg
Y29uc3Q8YnI+DQomZ3Q7wqAgwqAgwqBjaGFyICpuYW1lLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgTmV0Q2xpZW50U3RhdGUgKnBlZXIsIEVycm9yPGJyPg0KJmd0O8KgIMKgIMKgKipl
cnJwKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgezxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyAtwqAgZXJyb3Jfc2V0
ZyhlcnJwLCAmcXVvdDt2bW5ldC1zaGFyZWQgaXMgbm90IGltcGxlbWVudGVkIHlldCZxdW90Oyk7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7IC3CoCByZXR1cm4g
LTE7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBO
ZXRDbGllbnRTdGF0ZSAqbmMgPTxicj4NCiZndDvCoCDCoCDCoHFlbXVfbmV3X25ldF9jbGllbnQo
JmFtcDtuZXRfdm1uZXRfc2hhcmVkX2luZm8sPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBlZXIsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsm
Z3Q7ICZndDvCoCDCoCDCoCZxdW90O3ZtbmV0LXNoYXJlZCZxdW90OywgbmFtZSk7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBpZiAoIXZhbGlkYXRl
X29wdGlvbnMobmV0ZGV2LCBlcnJwKSkgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgZ19hc3NlcnRfbm90X3JlYWNoZWQoKTs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqBnX2Fzc2VydF9ub3RfcmVhY2hlZCBpcyBmb3IgZGVidWdnaW5nIHB1cnBvc2UgYW5k
IG1heSBiZTxicj4NCiZndDvCoCDCoCDCoGRyb3BwZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZn
dDsgJmd0O8KgIMKgIMKgZGVwZW5kaW5nIG9uIHRoZSBidWlsZCBvcHRpb24uPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIHJldHVybiB2bW5ldF9pZl9jcmVhdGUobmMsIGJ1aWxkX2lmX2Rlc2MobmV0
ZGV2KSw8YnI+DQomZ3Q7wqAgwqAgwqBlcnJwKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsg
Jmd0O8KgIMKgIMKgICZndDvCoCDCoH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8Kg
IMKgIMKgICZndDsgZGlmZiAtLWdpdCBhL25ldC92bW5ldF9pbnQuaCBiL25ldC92bW5ldF9pbnQu
aDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyBpbmRleCBhYWM0
ZDVhZjY0Li5hY2ZlM2E4OGMwIDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqAgJmd0OyAtLS0gYS9uZXQvdm1uZXRfaW50Lmg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKysrIGIvbmV0L3ZtbmV0X2ludC5oPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7IEBAIC0xNSwxMSArMTUsNDggQEA8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDvCoCDCoCNpbmNsdWRlICZx
dW90O2NsaWVudHMuaCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAg
wqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
I2luY2x1ZGUgJmx0O3ZtbmV0L3ZtbmV0LmgmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7
ICZndDvCoCDCoCDCoCAmZ3Q7ICsjaW5jbHVkZSAmbHQ7ZGlzcGF0Y2gvZGlzcGF0Y2guaCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArLyoqPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICsgKsKgIEZyb20gdm1uZXQuZnJhbWV3b3JrIGRv
Y3VtZW50YXRpb248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsg
KyAqPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICsgKsKgIEVh
Y2ggcmVhZC93cml0ZSBjYWxsIGFsbG93cyB1cCB0byAyMDAgcGFja2V0cyB0byBiZTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArICrCoCByZWFkIG9yIHdyaXR0
ZW4gZm9yIGEgbWF4aW11bSBvZiAyNTZLQi48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0
O8KgIMKgIMKgICZndDsgKyAqPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDC
oCAmZ3Q7ICsgKsKgIEVhY2ggcGFja2V0IHdyaXR0ZW4gc2hvdWxkIGJlIGEgY29tcGxldGU8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKyAqwqAgZXRoZXJuZXQg
ZnJhbWUuPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICsgKjxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArICogPGEgaHJlZj0i
aHR0cHM6Ly9kZXZlbG9wZXIuYXBwbGUuY29tL2RvY3VtZW50YXRpb24vdm1uZXQiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZGV2ZWxvcGVyLmFwcGxlLmNvbS9kb2N1
bWVudGF0aW9uL3ZtbmV0PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczov
L2RldmVsb3Blci5hcHBsZS5jb20vZG9jdW1lbnRhdGlvbi92bW5ldCIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9kZXZlbG9wZXIuYXBwbGUuY29tL2RvY3VtZW50YXRp
b24vdm1uZXQ8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAm
bHQ7PGEgaHJlZj0iaHR0cHM6Ly9kZXZlbG9wZXIuYXBwbGUuY29tL2RvY3VtZW50YXRpb24vdm1u
ZXQiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZGV2ZWxvcGVyLmFw
cGxlLmNvbS9kb2N1bWVudGF0aW9uL3ZtbmV0PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBo
cmVmPSJodHRwczovL2RldmVsb3Blci5hcHBsZS5jb20vZG9jdW1lbnRhdGlvbi92bW5ldCIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9kZXZlbG9wZXIuYXBwbGUuY29t
L2RvY3VtZW50YXRpb24vdm1uZXQ8L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZn
dDsgJmd0O8KgIMKgIMKgICZndDsgKyAqLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7
wqAgwqAgwqAgJmd0OyArI2RlZmluZSBWTU5FVF9QQUNLRVRTX0xJTUlUIDIwMDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgdHlwZWRlZiBzdHJ1Y3QgVm1uZXRDb21tb25TdGF0
ZSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7IC3CoCBOZXRD
bGllbnRTdGF0ZSBuYzs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIE5ldENsaWVudFN0YXRlIG5jOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaW50ZXJmYWNlX3JlZiB2bW5ldF9pZjs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgYm9vbCBzZW5kX3NjaGVkdWxlZDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHVpbnQ2NF90IG10dTs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHVpbnQ2NF90IG1h
eF9wYWNrZXRfc2l6ZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZn
dDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
c3RydWN0IHZtcGt0ZGVzYyBwYWNrZXRzX2J1ZltWTU5FVF9QQUNLRVRTX0xJTUlUXTs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHN0cnVjdCBpb3Zl
YyBpb3ZfYnVmW1ZNTkVUX1BBQ0tFVFNfTElNSVRdOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0
OyAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCBkaXNwYXRjaF9xdWV1ZV90IGlmX3F1ZXVlOzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsm
Z3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBRRU1VQkggKnNlbmRfYmg7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7wqAgwqB9IFZtbmV0Q29tbW9uU3RhdGU7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICtjb25zdCBjaGFyICp2bW5ldF9zdGF0
dXNfbWFwX3N0cih2bW5ldF9yZXR1cm5fdCBzdGF0dXMpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvC
oCDCoCDCoCAmZ3Q7ICtpbnQgdm1uZXRfaWZfY3JlYXRlKE5ldENsaWVudFN0YXRlICpuYyw8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHhwY19vYmplY3RfdCBpZl9kZXNjLDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
RXJyb3IgKiplcnJwKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0O8KgIMKgIMKgICZn
dDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAmZ3Q7wqAgwqAgwqAgJmd0OyArc3NpemVf
dCB2bW5ldF9yZWNlaXZlX2NvbW1vbihOZXRDbGllbnRTdGF0ZSAqbmMsPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGNvbnN0IHVpbnQ4X3QgKmJ1Ziw8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyZndDsgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgc2l6ZV90IHNpemUpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7Jmd0OyAm
Z3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDC
oCAmZ3Q7ICt2b2lkIHZtbmV0X2NsZWFudXBfY29tbW9uKE5ldENsaWVudFN0YXRlICpuYyk7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDsmZ3Q7ICZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAjZW5kaWYgLyogVk1ORVRfSU5UX0gg
Ki88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
Jmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDsgT3RoZXIgaXNzdWVzIHdp
bGwgYmUgZml4ZWQgYW5kIHN1Ym1pdHRlZCBsYXRlciw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyZn
dDsgJmd0OyB0aGFuayB5b3UhPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7ICZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyZndDsgJmd0OyBSZWdhcmRzLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
Jmd0OyAmZ3Q7IFZsYWRpc2xhdiBZYXJvc2hjaHVrPGJyPg0KJmd0O8KgIMKgIMKgICZndDsmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBSZWdhcmRzLDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7IFZsYWRpc2xhdiBZYXJvc2hjaHVrPGJyPg0KJmd0OyA8YnI+
DQomZ3Q7IDxicj4NCiZndDsgQmVzdCBSZWdhcmRzLDxicj4NCiZndDsgPGJyPg0KJmd0OyBWbGFk
aXNsYXYgWWFyb3NoY2h1azxicj4NCjxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj4NCg==
--0000000000004831b605d923af17--

