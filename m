Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355104C838E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 06:54:12 +0100 (CET)
Received: from localhost ([::1]:51540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOvSc-0000NS-P2
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 00:54:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOvQt-0007bu-GJ
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 00:52:23 -0500
Received: from [2607:f8b0:4864:20::1035] (port=36586
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOvQp-0004gi-L4
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 00:52:22 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso1180913pjk.1
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 21:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ISuLhaMu86wGUPY11cChdH19+oYrJtGY4G7MgiRKIs4=;
 b=Psx+mFTwtZMB4fMBAaE4LCnOLLUrsqbSN2LAypvgUOlRjl7Br5u3GnML5951TpIMDR
 68ScEiQ5Xhm/ltmeSHjDvMuT43Z5VRrKmUMNukvdSnhKOXtYiAeC0G4qqBfokQV5goHV
 5KUqPVz1MuxkSUrk+T++3RyaFdwUtgo26O4B4rv0uHpeYk+Ta8ZPggkGlo3TadxZymJL
 rO/3wvmZb0UfVqbb8h4M0AEUZPdiYsEkcdpUlsu7P82y1cc1be1myX9OqYUaipPcgKMG
 S8UCBysTBLaZ5vHGHzRh69oqBBEG/5tJXC1zoLLqfBw3TVWwgzdgbi265q+50ehUfRVa
 sv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ISuLhaMu86wGUPY11cChdH19+oYrJtGY4G7MgiRKIs4=;
 b=1UCKKDZZcmLBH0oTTaHK1GUZ1So5WtQsfenF9LZuElYVTC7n7Ee3JrpxwLJPNRuesq
 t6wNMN5Xw7U8dF2rNDOIgQdAnJrPwvTzuBZvQl16iptg1HGSV8AuIOP28xT1zav2NBdt
 7KEGH4TsSSwbJZF17iethjU8iTSbilHjG/WdpkU5KhiYpDyPNV1hSVZmeCUetmk0HcBY
 +K5Me0LvTtQo0nGUMzFy9yyFETgsyNRShRWY4H6hszziYmi1T4K1mFxhog3UUltq91eh
 G6ueX3ACsOAYyIEajfUE01ZdBDu4BWgnCxSjXquEHHAKrEBavtQxdogbUwOLy9BM5jEQ
 ZMWw==
X-Gm-Message-State: AOAM530AP+97dF2+LMGYwWe9PEnhUg6nYboLgQpjb5kUCXyhht+j5vzo
 kFuJUkJv6y12nEE78H2AGgo=
X-Google-Smtp-Source: ABdhPJyStWMa9jVDoPnqIUqKtEhXiLS3hvEdFxvuIqinfXRgBMDHSjlcMRuA02/+LklbEpBz5FUlsQ==
X-Received: by 2002:a17:902:74c9:b0:14f:9b08:99a7 with SMTP id
 f9-20020a17090274c900b0014f9b0899a7mr24463424plt.91.1646113936097; 
 Mon, 28 Feb 2022 21:52:16 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 cv15-20020a17090afd0f00b001bedcbca1a9sm580995pjb.57.2022.02.28.21.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 21:52:15 -0800 (PST)
Message-ID: <7b4e06fe-4d10-0870-5d6e-d2e70d7eb3a2@gmail.com>
Date: Tue, 1 Mar 2022 14:52:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v15 3/8] net/vmnet: implement shared mode (vmnet-shared)
Content-Language: en-US
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220225171402.64861-4-Vladislav.Yaroshchuk@jetbrains.com>
 <50a27646-ce9c-c702-965f-46b602be9220@gmail.com>
 <CAGmdLqQ8J+-sK=Huh-G8w-S0RQUEyKkN2rb6PsZAFXbd6Jk2EQ@mail.gmail.com>
 <f839edfc-de5f-7002-4916-21c541a5185b@gmail.com>
 <CAGmdLqRVtJN8YoxfeCYuay-k+RVofM8W=wicn0fRdjau0uwCHQ@mail.gmail.com>
 <CAMVc7JVnxNTMhked8x=Z0baY2ApMKwB8FrESYWQjm43-6Wm+3A@mail.gmail.com>
 <CAGmdLqQhd9q9VQUKEd_hb9rnb2HwrdAv31aB67sUj_=jiLX_Sw@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAGmdLqQhd9q9VQUKEd_hb9rnb2HwrdAv31aB67sUj_=jiLX_Sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 qemu Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Roman Bolshakov <roman@roolebo.dev>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/02/28 20:59, Vladislav Yaroshchuk wrote:
> 
> 
> On Sat, Feb 26, 2022 at 3:27 PM Akihiko Odaki <akihiko.odaki@gmail.com 
> <mailto:akihiko.odaki@gmail.com>> wrote:
> 
>     On Sat, Feb 26, 2022 at 8:33 PM Vladislav Yaroshchuk
>     <vladislav.yaroshchuk@jetbrains.com
>     <mailto:vladislav.yaroshchuk@jetbrains.com>> wrote:
>      >
>      >
>      >
>      > On Sat, Feb 26, 2022 at 12:16 PM Akihiko Odaki
>     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>> wrote:
>      >>
>      >> On 2022/02/26 17:37, Vladislav Yaroshchuk wrote:
>      >> >
>      >> > Hi Akihiko,
>      >> >
>      >> > On Fri, Feb 25, 2022 at 8:46 PM Akihiko Odaki
>     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
>      >> > <mailto:akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com>>> wrote:
>      >> >
>      >> >     On 2022/02/26 2:13, Vladislav Yaroshchuk wrote:
>      >> >      > Interaction with vmnet.framework in different modes
>      >> >      > differs only on configuration stage, so we can create
>      >> >      > common `send`, `receive`, etc. procedures and reuse them.
>      >> >      >
>      >> >      > vmnet.framework supports iov, but writing more than
>      >> >      > one iov into vmnet interface fails with
>      >> >      > 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
>      >> >      > one and passing it to vmnet works fine. That's the
>      >> >      > reason why receive_iov() left unimplemented. But it still
>      >> >      > works with good enough performance having .receive()
>      >> >      > net/vmnet: implement shared mode (vmnet-shared)
>      >> >      >
>      >> >      > Interaction with vmnet.framework in different modes
>      >> >      > differs only on configuration stage, so we can create
>      >> >      > common `send`, `receive`, etc. procedures and reuse them.
>      >> >      >
>      >> >      > vmnet.framework supports iov, but writing more than
>      >> >      > one iov into vmnet interface fails with
>      >> >      > 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
>      >> >      > one and passing it to vmnet works fine. That's the
>      >> >      > reason why receive_iov() left unimplemented. But it still
>      >> >      > works with good enough performance having .receive()
>      >> >      > implemented only.
>      >> >      >
>      >> >      > Also, there is no way to unsubscribe from vmnet packages
>      >> >      > receiving except registering and unregistering event
>      >> >      > callback or simply drop packages just ignoring and
>      >> >      > not processing them when related flag is set. Here we do
>      >> >      > using the second way.
>      >> >      >
>      >> >      > Signed-off-by: Phillip Tennen <phillip@axleos.com
>     <mailto:phillip@axleos.com>
>      >> >     <mailto:phillip@axleos.com <mailto:phillip@axleos.com>>>
>      >> >      > Signed-off-by: Vladislav Yaroshchuk
>      >> >     <Vladislav.Yaroshchuk@jetbrains.com
>     <mailto:Vladislav.Yaroshchuk@jetbrains.com>
>      >> >     <mailto:Vladislav.Yaroshchuk@jetbrains.com
>     <mailto:Vladislav.Yaroshchuk@jetbrains.com>>>
>      >> >
>      >> >     Thank you for persistently working on this.
>      >> >
>      >> >      > ---
>      >> >      >   net/vmnet-common.m | 302
>      >> >     +++++++++++++++++++++++++++++++++++++++++++++
>      >> >      >   net/vmnet-shared.c |  94 +++++++++++++-
>      >> >      >   net/vmnet_int.h    |  39 +++++-
>      >> >      >   3 files changed, 430 insertions(+), 5 deletions(-)
>      >> >      >
>      >> >      > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
>      >> >      > index 56612c72ce..2f70921cae 100644
>      >> >      > --- a/net/vmnet-common.m
>      >> >      > +++ b/net/vmnet-common.m
>      >> >      > @@ -10,6 +10,8 @@
>      >> >      >    */
>      >> >      >
>      >> >      >   #include "qemu/osdep.h"
>      >> >      > +#include "qemu/main-loop.h"
>      >> >      > +#include "qemu/log.h"
>      >> >      >   #include "qapi/qapi-types-net.h"
>      >> >      >   #include "vmnet_int.h"
>      >> >      >   #include "clients.h"
>      >> >      > @@ -17,4 +19,304 @@
>      >> >      >   #include "qapi/error.h"
>      >> >      >
>      >> >      >   #include <vmnet/vmnet.h>
>      >> >      > +#include <dispatch/dispatch.h>
>      >> >      >
>      >> >      > +
>      >> >      > +static inline void
>     vmnet_set_send_bh_scheduled(VmnetCommonState *s,
>      >> >      > +                                               bool
>     enable)
>      >> >      > +{
>      >> >      > +    qatomic_set(&s->send_scheduled, enable);
>      >> >      > +}
>      >> >      > +
>      >> >      > +
>      >> >      > +static inline bool
>     vmnet_is_send_bh_scheduled(VmnetCommonState *s)
>      >> >      > +{
>      >> >      > +    return qatomic_load_acquire(&s->send_scheduled);
>      >> >      > +}
>      >> >      > +
>      >> >      > +
>      >> >      > +static inline void
>     vmnet_set_send_enabled(VmnetCommonState *s,
>      >> >      > +                                          bool enable)
>      >> >      > +{
>      >> >      > +    if (enable) {
>      >> >      > +        vmnet_interface_set_event_callback(
>      >> >      > +            s->vmnet_if,
>      >> >      > +            VMNET_INTERFACE_PACKETS_AVAILABLE,
>      >> >      > +            s->if_queue,
>      >> >      > +            ^(interface_event_t event_id, xpc_object_t
>     event) {
>      >> >      > +                assert(event_id ==
>      >> >     VMNET_INTERFACE_PACKETS_AVAILABLE);
>      >> >      > +                /*
>      >> >      > +                 * This function is being called from
>     a non qemu
>      >> >     thread, so
>      >> >      > +                 * we only schedule a BH, and do the
>     rest of the
>      >> >     io completion
>      >> >      > +                 * handling from vmnet_send_bh() which
>     runs in a
>      >> >     qemu context.
>      >> >      > +                 *
>      >> >      > +                 * Avoid scheduling multiple bottom halves
>      >> >      > +                 */
>      >> >      > +                if (!vmnet_is_send_bh_scheduled(s)) {
>      >> >      > +                    vmnet_set_send_bh_scheduled(s, true);
>      >> >
>      >> >     It can be interrupted between vmnet_is_send_bh_scheduled and
>      >> >     vmnet_set_send_bh_scheduled, which leads to data race.
>      >> >
>      >> >
>      >> > Sorry, I did not clearly understand what you meant. Since this
>      >> > callback (block) is submitted on DISPATCH_QUEUE_SERIAL,
>      >> > only one instance of the callback will be executed at any
>      >> > moment of time.
>      >> >
>     https://developer.apple.com/documentation/dispatch/dispatch_queue_serial
>     <https://developer.apple.com/documentation/dispatch/dispatch_queue_serial>
>      >> >
>     <https://developer.apple.com/documentation/dispatch/dispatch_queue_serial
>     <https://developer.apple.com/documentation/dispatch/dispatch_queue_serial>>
>      >> >
>      >> > Also this is the only place where we schedule a bottom half.
>      >> >
>      >> > After we set the 'send_scheduled' flag, all the other
>      >> > callback  blocks will do nothing (skip the if block) until
>      >> > the bottom half is executed and reset 'send_scheduled'.
>      >> > I don't see any races here :(
>      >> >
>      >> > Correct me if I'm wrong please.
>      >>
>      >> My explanation that the interruption between
>     vmnet_is_send_bh_scheduled
>      >> and vmnet_set_send_bh_scheduled is problematic was actually
>     misleading.
>      >>
>      >> The problem is that vmnet_send_bh resets 'send_scheduled' after
>     calling
>      >> vmnet_read. If we got another packet after vmnet_read, it would be
>      >> silently ignored.
>      >>
>      >> By the way, I forgot to mention another problem:
>     vmnet_send_completed
>      >> calls vmnet_set_send_enabled, but the other packets in the
>     buffer may
>      >> not be sent yet. Also, unregistering callbacks in
>     vmnet_set_send_enabled
>      >> is probably not enough to stop the callback being fired since some
>      >> dispatch blocks are already in the dispatch queue.
>      >>
>      >
>      > Now I understand what you mean, thanks.
>      > What do you think about the workaround? For me
>      > it is quite difficult question how to synchronize qemu with
>      > vmnet thread, especially with completion callback.
> 
>     You may add a new field to represent the number of packets being sent
>     in the buffer. The field must be maintained by vmnet_send_bh and
>     vmnet_send_completed, which are on the iothread. vmnet_send_bh should
>     do nothing if the field is greater than 0 at the beginning of the
>     function. vmnet_send_completed should call
>     qemu_bh_schedule(s->send_bh).
> 
> 
> Thank you for the idea! Sounds meaningful to
> schedule a bottom half in vmnet thread and do the
> rest of things in iothread with no concurrency.
> 
> Not sure that only one field is enough, cause
> we may have two states on bh execution start:
> 1. There are packets in vmnet buffer s->packets_buf
>      that were rejected by qemu_send_async and waiting
>      to be sent. If this happens, we should complete sending
>      these waiting packets with qemu_send_async firstly,
>      and after that we should call vmnet_read to get
>      new ones and send them to QEMU;
> 2. There are no packets in s->packets_buf to be sent to
>      qemu, we only need to get new packets from vmnet
>      with vmnet_read and send them to QEMU

In case 1, you should just keep calling qemu_send_packet_async. Actually 
qemu_send_packet_async adds the packet to its internal queue and calls 
the callback when it is consumed.

> 
> It can be done kinda this way:
> ```
> struct s:
>      send_bh:                    bh
>      packets_buf:              array[packet]
>      ## Three new fields
>      send_enabled:           bool
>      packets_send_pos:    int
>      packets_batch_size:  int
> 
> fun bh_send(s):
>      ## Send disabled - do nothing
>      if not s->send_enabled:
>          return
>      ## If some packets are waiting to be sent in
>      ## s->packets_buf - send them
>      if s->packets_send_pos < s->packets_batch_size:
>          if not qemu_send_wrapper(s):
>              return
> 
>      ## Try to read new packets from vmnet
>      s->packets_send_pos = 0
>      s->packets_batch_size = 0
>      s->packets_buf = vmnet_read(&s->packets_batch_size)
>      if s->packets_batch_size > 0:
>          # If something received - process them
>          qemu_send_wrapper(s)
> fun qemu_send_wrapper(s):
>      for i in s->packets_send_pos to s->packets_batch_size:
>          size = qemu_send_async(s->packets_buf[i],
>                                                    vmnet_send_completed)
>          if size == 0:
>              ## Disable packets processing until vmnet_send_completed
>              ## Save the state: packets to be sent now in s->packets_buf
>              ## in range s->packets_send_pos..s->packets_batch_size
>              s->send_enabled = false
>              s->packets_send_pos = i + 1
>              break
>          if size < 0:
>              ## On error just drop the packets
>              s->packets_send_pos = 0
>              s->packets_batch_size = 0
>              break
> 
>       return s->send_enabled
> 
> 
> fun vmnet_send_completed(s):
>      ## Complete sending packets from s->packets_buf
>      s->send_enabled = true
>      qemu_bh_schedule(s->send_bh)
> 
> ## From callback we only scheduling the bh
> vmnet.set_callback(callback = s: qemu_bh_schedule(s->send_bh))
> ```
> 
> I think a simpler implementation may exist, but currently
> I see only this approach with the send_enabled flag and
> two more fields to save packets sending state.
> 
>     vmnet_set_send_enabled and send_scheduled can be simply removed.
>     qemu_bh_schedule ensures there is no duplicate scheduling.
> 
> Yep, my mistake. Previously I used schedule_oneshot which
> creates a new bh for each call which causes duplicate scheduling.
> 
> 
>     Regards,
>     Akihiko Odaki
> 
>      >
>      >
>      >>
>      >> Regards,
>      >> Akihiko Odaki
>      >>
>      >> >
>      >> >      > +                    qemu_bh_schedule(s->send_bh);
>      >> >      > +                }
>      >> >      > +            });
>      >> >      > +    } else {
>      >> >      > +        vmnet_interface_set_event_callback(
>      >> >      > +            s->vmnet_if,
>      >> >      > +            VMNET_INTERFACE_PACKETS_AVAILABLE,
>      >> >      > +            NULL,
>      >> >      > +            NULL);
>      >> >      > +    }
>      >> >      > +}
>      >> >      > +
>      >> >      > +
>      >> >      > +static void vmnet_send_completed(NetClientState *nc,
>     ssize_t len)
>      >> >      > +{
>      >> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState,
>     nc, nc);
>      >> >      > +    vmnet_set_send_enabled(s, true);
>      >> >      > +}
>      >> >      > +
>      >> >      > +
>      >> >      > +static void vmnet_send_bh(void *opaque)
>      >> >      > +{
>      >> >      > +    NetClientState *nc = (NetClientState *) opaque;
>      >> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState,
>     nc, nc);
>      >> >      > +
>      >> >      > +    struct iovec *iov = s->iov_buf;
>      >> >      > +    struct vmpktdesc *packets = s->packets_buf;
>      >> >      > +    int pkt_cnt;
>      >> >      > +    int i;
>      >> >      > +
>      >> >      > +    vmnet_return_t status;
>      >> >      > +    ssize_t size;
>      >> >      > +
>      >> >      > +    /* read as many packets as present */
>      >> >      > +    pkt_cnt = VMNET_PACKETS_LIMIT;
>      >> >
>      >> >     There could be more than VMNET_PACKETS_LIMIT. You may call
>      >> >     vmnet_read in
>      >> >     a loop.
>      >> >
>      >> >      > +    for (i = 0; i < pkt_cnt; ++i) {
>      >> >      > +        packets[i].vm_pkt_size = s->max_packet_size;
>      >> >      > +        packets[i].vm_pkt_iovcnt = 1;
>      >> >      > +        packets[i].vm_flags = 0;
>      >> >      > +    }
>      >> >      > +
>      >> >      > +    status = vmnet_read(s->vmnet_if, packets, &pkt_cnt);
>      >> >      > +    if (status != VMNET_SUCCESS) {
>      >> >      > +        error_printf("vmnet: read failed: %s\n",
>      >> >      > +                     vmnet_status_map_str(status));
>      >> >      > +        goto done;
>      >> >      > +    }
>      >> >      > +
>      >> >      > +    for (i = 0; i < pkt_cnt; ++i) {
>      >> >      > +        size = qemu_send_packet_async(nc,
>      >> >      > +                                      iov[i].iov_base,
>      >> >      > +                                     
>     packets[i].vm_pkt_size,
>      >> >      > +                                     
>     vmnet_send_completed);
>      >> >      > +        if (size == 0) {
>      >> >      > +            vmnet_set_send_enabled(s, false);
>      >> >      > +            goto done;
>      >> >      > +        } else if (size < 0) {
>      >> >      > +            break;
>      >> >      > +        }
>      >> >
>      >> >     goto is not needed here. "break" when size <= 0.
>      >> >
>      >> >      > +    }
>      >> >      > +
>      >> >      > +done:
>      >> >      > +    vmnet_set_send_bh_scheduled(s, false);
>      >> >      > +}
>      >> >      > +
>      >> >      > +
>      >> >      > +static void vmnet_bufs_init(VmnetCommonState *s)
>      >> >      > +{
>      >> >      > +    struct vmpktdesc *packets = s->packets_buf;
>      >> >      > +    struct iovec *iov = s->iov_buf;
>      >> >      > +    int i;
>      >> >      > +
>      >> >      > +    for (i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
>      >> >      > +        iov[i].iov_len = s->max_packet_size;
>      >> >      > +        iov[i].iov_base = g_malloc0(iov[i].iov_len);
>      >> >      > +        packets[i].vm_pkt_iov = iov + i;
>      >> >      > +    }
>      >> >      > +}
>      >> >      > +
>      >> >      > +
>      >> >      > +const char *vmnet_status_map_str(vmnet_return_t status)
>      >> >      > +{
>      >> >      > +    switch (status) {
>      >> >      > +    case VMNET_SUCCESS:
>      >> >      > +        return "success";
>      >> >      > +    case VMNET_FAILURE:
>      >> >      > +        return "general failure (possibly not enough
>     privileges)";
>      >> >      > +    case VMNET_MEM_FAILURE:
>      >> >      > +        return "memory allocation failure";
>      >> >      > +    case VMNET_INVALID_ARGUMENT:
>      >> >      > +        return "invalid argument specified";
>      >> >      > +    case VMNET_SETUP_INCOMPLETE:
>      >> >      > +        return "interface setup is not complete";
>      >> >      > +    case VMNET_INVALID_ACCESS:
>      >> >      > +        return "invalid access, permission denied";
>      >> >      > +    case VMNET_PACKET_TOO_BIG:
>      >> >      > +        return "packet size is larger than MTU";
>      >> >      > +    case VMNET_BUFFER_EXHAUSTED:
>      >> >      > +        return "buffers exhausted in kernel";
>      >> >      > +    case VMNET_TOO_MANY_PACKETS:
>      >> >      > +        return "packet count exceeds limit";
>      >> >      > +#if defined(MAC_OS_VERSION_11_0) && \
>      >> >      > +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
>      >> >      > +    case VMNET_SHARING_SERVICE_BUSY:
>      >> >      > +        return "conflict, sharing service is in use";
>      >> >      > +#endif
>      >> >      > +    default:
>      >> >      > +        return "unknown vmnet error";
>      >> >      > +    }
>      >> >      > +}
>      >> >      > +
>      >> >      > +
>      >> >      > +int vmnet_if_create(NetClientState *nc,
>      >> >      > +                    xpc_object_t if_desc,
>      >> >      > +                    Error **errp)
>      >> >      > +{
>      >> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState,
>     nc, nc);;
>      >> >
>      >> >     Duplicate semicolons.
>      >> >
>      >> >      > +    dispatch_semaphore_t if_created_sem =
>      >> >     dispatch_semaphore_create(0);
>      >> >
>      >> >     if_created_sem leaks.
>      >> >
>      >> >      > +    __block vmnet_return_t if_status;
>      >> >      > +
>      >> >      > +    s->if_queue = dispatch_queue_create(
>      >> >      > +        "org.qemu.vmnet.if_queue",
>      >> >      > +        DISPATCH_QUEUE_SERIAL
>      >> >      > +    );
>      >> >      > +
>      >> >      > +    xpc_dictionary_set_bool(
>      >> >      > +        if_desc,
>      >> >      > +        vmnet_allocate_mac_address_key,
>      >> >      > +        false
>      >> >      > +    );
>      >> >      > +#ifdef DEBUG
>      >> >      > +    qemu_log("vmnet.start.interface_desc:\n");
>      >> >      > +    xpc_dictionary_apply(if_desc,
>      >> >      > +                         ^bool(const char *k,
>     xpc_object_t v) {
>      >> >      > +                             char *desc =
>     xpc_copy_description(v);
>      >> >      > +                             qemu_log("  %s=%s\n", k,
>     desc);
>      >> >      > +                             free(desc);
>      >> >      > +                             return true;
>      >> >      > +                         });
>      >> >      > +#endif /* DEBUG */
>      >> >      > +
>      >> >      > +    s->vmnet_if = vmnet_start_interface(
>      >> >      > +        if_desc,
>      >> >      > +        s->if_queue,
>      >> >      > +        ^(vmnet_return_t status, xpc_object_t
>     interface_param) {
>      >> >      > +            if_status = status;
>      >> >      > +            if (status != VMNET_SUCCESS ||
>     !interface_param) {
>      >> >      > +                dispatch_semaphore_signal(if_created_sem);
>      >> >      > +                return;
>      >> >      > +            }
>      >> >      > +
>      >> >      > +#ifdef DEBUG
>      >> >      > +            qemu_log("vmnet.start.interface_param:\n");
>      >> >      > +            xpc_dictionary_apply(interface_param,
>      >> >      > +                                 ^bool(const char *k,
>      >> >     xpc_object_t v) {
>      >> >      > +                                     char *desc =
>      >> >     xpc_copy_description(v);
>      >> >      > +                                     qemu_log(" 
>     %s=%s\n", k, desc);
>      >> >      > +                                     free(desc);
>      >> >      > +                                     return true;
>      >> >      > +                                 });
>      >> >      > +#endif /* DEBUG */
>      >> >      > +
>      >> >      > +            s->mtu = xpc_dictionary_get_uint64(
>      >> >      > +                interface_param,
>      >> >      > +                vmnet_mtu_key);
>      >> >      > +            s->max_packet_size =
>     xpc_dictionary_get_uint64(
>      >> >      > +                interface_param,
>      >> >      > +                vmnet_max_packet_size_key);
>      >> >      > +
>      >> >      > +            dispatch_semaphore_signal(if_created_sem);
>      >> >      > +        });
>      >> >      > +
>      >> >      > +    if (s->vmnet_if == NULL) {
>      >> >      > +        error_setg(errp,
>      >> >      > +                   "unable to create interface "
>      >> >      > +                   "with requested params");
>      >> >
>      >> >     You don't need line breaks here. Breaking a string into a
>     few would
>      >> >     also
>      >> >     makes it a bit hard to grep.
>      >> >
>      >> >      > +        return -1;
>      >> >
>      >> >     s->if_queue leaks.
>      >> >
>      >> >      > +    }
>      >> >      > +
>      >> >      > +    dispatch_semaphore_wait(if_created_sem,
>     DISPATCH_TIME_FOREVER);
>      >> >      > +
>      >> >      > +    if (if_status != VMNET_SUCCESS) {
>      >> >      > +        error_setg(errp,
>      >> >      > +                   "cannot create vmnet interface: %s",
>      >> >      > +                   vmnet_status_map_str(if_status));
>      >> >      > +        return -1;
>      >> >      > +    }
>      >> >      > +
>      >> >      > +    s->send_bh = aio_bh_new(qemu_get_aio_context(),
>      >> >     vmnet_send_bh, nc);
>      >> >      > +    vmnet_bufs_init(s);
>      >> >      > +    vmnet_set_send_bh_scheduled(s, false);
>      >> >      > +    vmnet_set_send_enabled(s, true);
>      >> >      > +    return 0;
>      >> >      > +}
>      >> >      > +
>      >> >      > +
>      >> >      > +ssize_t vmnet_receive_common(NetClientState *nc,
>      >> >      > +                             const uint8_t *buf,
>      >> >      > +                             size_t size)
>      >> >      > +{
>      >> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState,
>     nc, nc);
>      >> >      > +    struct vmpktdesc packet;
>      >> >      > +    struct iovec iov;
>      >> >      > +    int pkt_cnt;
>      >> >      > +    vmnet_return_t if_status;
>      >> >      > +
>      >> >      > +    if (size > s->max_packet_size) {
>      >> >      > +        warn_report("vmnet: packet is too big, %zu >
>     %llu\n",
>      >> >
>      >> >     Use PRIu64.
>      >> >
>      >> >      > +                    packet.vm_pkt_size,
>      >> >      > +                    s->max_packet_size);
>      >> >      > +        return -1;
>      >> >      > +    }
>      >> >      > +
>      >> >      > +    iov.iov_base = (char *) buf;
>      >> >      > +    iov.iov_len = size;
>      >> >      > +
>      >> >      > +    packet.vm_pkt_iovcnt = 1;
>      >> >      > +    packet.vm_flags = 0;
>      >> >      > +    packet.vm_pkt_size = size;
>      >> >      > +    packet.vm_pkt_iov = &iov;
>      >> >      > +    pkt_cnt = 1;
>      >> >      > +
>      >> >      > +    if_status = vmnet_write(s->vmnet_if, &packet,
>     &pkt_cnt);
>      >> >      > +    if (if_status != VMNET_SUCCESS) {
>      >> >      > +        error_report("vmnet: write error: %s\n",
>      >> >      > +                     vmnet_status_map_str(if_status));
>      >> >
>      >> >     Why don't return -1?
>      >> >
>      >> >      > +    }
>      >> >      > +
>      >> >      > +    if (if_status == VMNET_SUCCESS && pkt_cnt) {
>      >> >      > +        return size;
>      >> >      > +    }
>      >> >      > +    return 0;
>      >> >      > +}
>      >> >      > +
>      >> >      > +
>      >> >      > +void vmnet_cleanup_common(NetClientState *nc)
>      >> >      > +{
>      >> >      > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState,
>     nc, nc);;
>      >> >
>      >> >     Duplicate semicolons.
>      >> >
>      >> >      > +    dispatch_semaphore_t if_created_sem;
>      >> >      > +
>      >> >      > +    qemu_purge_queued_packets(nc); > +
>      >> >     vmnet_set_send_bh_scheduled(s, true);
>      >> >      > +    vmnet_set_send_enabled(s, false);
>      >> >      > +
>      >> >      > +    if (s->vmnet_if == NULL) {
>      >> >      > +        return;
>      >> >      > +    }
>      >> >      > +
>      >> >      > +    if_created_sem = dispatch_semaphore_create(0);
>      >> >      > +    vmnet_stop_interface(
>      >> >      > +        s->vmnet_if,
>      >> >      > +        s->if_queue,
>      >> >      > +        ^(vmnet_return_t status) {
>      >> >      > +            assert(status == VMNET_SUCCESS);
>      >> >      > +            dispatch_semaphore_signal(if_created_sem);
>      >> >      > +        });
>      >> >      > +    dispatch_semaphore_wait(if_created_sem,
>     DISPATCH_TIME_FOREVER);
>      >> >      > +
>      >> >      > +    qemu_bh_delete(s->send_bh);
>      >> >      > +    dispatch_release(if_created_sem);
>      >> >      > +    dispatch_release(s->if_queue);
>      >> >      > +
>      >> >      > +    for (int i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
>      >> >      > +        g_free(s->iov_buf[i].iov_base);
>      >> >      > +    }
>      >> >      > +}
>      >> >      > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
>      >> >      > index f07afaaf21..66f66c034b 100644
>      >> >      > --- a/net/vmnet-shared.c
>      >> >      > +++ b/net/vmnet-shared.c
>      >> >      > @@ -10,16 +10,102 @@
>      >> >      >
>      >> >      >   #include "qemu/osdep.h"
>      >> >      >   #include "qapi/qapi-types-net.h"
>      >> >      > +#include "qapi/error.h"
>      >> >      >   #include "vmnet_int.h"
>      >> >      >   #include "clients.h"
>      >> >      > -#include "qemu/error-report.h"
>      >> >      > -#include "qapi/error.h"
>      >> >      >
>      >> >      >   #include <vmnet/vmnet.h>
>      >> >      >
>      >> >      > +typedef struct VmnetSharedState {
>      >> >      > +    VmnetCommonState cs;
>      >> >      > +} VmnetSharedState;
>      >> >      > +
>      >> >      > +
>      >> >      > +static bool validate_options(const Netdev *netdev,
>     Error **errp)
>      >> >      > +{
>      >> >      > +    const NetdevVmnetSharedOptions *options =
>      >> >     &(netdev->u.vmnet_shared);
>      >> >      > +
>      >> >      > +#if !defined(MAC_OS_VERSION_11_0) || \
>      >> >      > +    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
>      >> >      > +    if (options->has_isolated) {
>      >> >      > +        error_setg(errp,
>      >> >      > +                   "vmnet-shared.isolated feature is "
>      >> >      > +                   "unavailable: outdated
>     vmnet.framework API");
>      >> >      > +        return false;
>      >> >      > +    }
>      >> >      > +#endif
>      >> >      > +
>      >> >      > +    if ((options->has_start_address ||
>      >> >      > +         options->has_end_address ||
>      >> >      > +         options->has_subnet_mask) &&
>      >> >      > +        !(options->has_start_address &&
>      >> >      > +          options->has_end_address &&
>      >> >      > +          options->has_subnet_mask)) {
>      >> >      > +        error_setg(errp,
>      >> >      > +                   "'start-address', 'end-address',
>     'subnet-mask' "
>      >> >      > +                   "should be provided together"
>      >> >      > +        );
>      >> >      > +        return false;
>      >> >      > +    }
>      >> >      > +
>      >> >      > +    return true;
>      >> >      > +}
>      >> >      > +
>      >> >      > +static xpc_object_t build_if_desc(const Netdev *netdev)
>      >> >      > +{
>      >> >      > +    const NetdevVmnetSharedOptions *options =
>      >> >     &(netdev->u.vmnet_shared);
>      >> >      > +    xpc_object_t if_desc = xpc_dictionary_create(NULL,
>     NULL, 0);
>      >> >      > +
>      >> >      > +    xpc_dictionary_set_uint64(
>      >> >      > +        if_desc,
>      >> >      > +        vmnet_operation_mode_key,
>      >> >      > +        VMNET_SHARED_MODE
>      >> >      > +    );
>      >> >      > +
>      >> >      > +    if (options->has_nat66_prefix) {
>      >> >      > +        xpc_dictionary_set_string(if_desc,
>      >> >      > +                                  vmnet_nat66_prefix_key,
>      >> >      > +                                  options->nat66_prefix);
>      >> >      > +    }
>      >> >      > +
>      >> >      > +    if (options->has_start_address) {
>      >> >      > +        xpc_dictionary_set_string(if_desc,
>      >> >      > +                                  vmnet_start_address_key,
>      >> >      > +                                  options->start_address);
>      >> >      > +        xpc_dictionary_set_string(if_desc,
>      >> >      > +                                  vmnet_end_address_key,
>      >> >      > +                                  options->end_address);
>      >> >      > +        xpc_dictionary_set_string(if_desc,
>      >> >      > +                                  vmnet_subnet_mask_key,
>      >> >      > +                                  options->subnet_mask);
>      >> >      > +    }
>      >> >      > +
>      >> >      > +#if defined(MAC_OS_VERSION_11_0) && \
>      >> >      > +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
>      >> >      > +    xpc_dictionary_set_bool(
>      >> >      > +        if_desc,
>      >> >      > +        vmnet_enable_isolation_key,
>      >> >      > +        options->isolated
>      >> >      > +    );
>      >> >      > +#endif
>      >> >      > +
>      >> >      > +    return if_desc;
>      >> >      > +}
>      >> >      > +
>      >> >      > +static NetClientInfo net_vmnet_shared_info = {
>      >> >      > +    .type = NET_CLIENT_DRIVER_VMNET_SHARED,
>      >> >      > +    .size = sizeof(VmnetSharedState),
>      >> >      > +    .receive = vmnet_receive_common,
>      >> >      > +    .cleanup = vmnet_cleanup_common,
>      >> >      > +};
>      >> >      > +
>      >> >      >   int net_init_vmnet_shared(const Netdev *netdev, const
>     char *name,
>      >> >      >                             NetClientState *peer, Error
>     **errp)
>      >> >      >   {
>      >> >      > -  error_setg(errp, "vmnet-shared is not implemented yet");
>      >> >      > -  return -1;
>      >> >      > +    NetClientState *nc =
>     qemu_new_net_client(&net_vmnet_shared_info,
>      >> >      > +                                             peer,
>      >> >     "vmnet-shared", name);
>      >> >      > +    if (!validate_options(netdev, errp)) {
>      >> >      > +        g_assert_not_reached();
>      >> >
>      >> >     g_assert_not_reached is for debugging purpose and may be
>     dropped
>      >> >     depending on the build option.
>      >> >
>      >> >      > +    }
>      >> >      > +    return vmnet_if_create(nc, build_if_desc(netdev),
>     errp);
>      >> >      >   }
>      >> >      > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
>      >> >      > index aac4d5af64..acfe3a88c0 100644
>      >> >      > --- a/net/vmnet_int.h
>      >> >      > +++ b/net/vmnet_int.h
>      >> >      > @@ -15,11 +15,48 @@
>      >> >      >   #include "clients.h"
>      >> >      >
>      >> >      >   #include <vmnet/vmnet.h>
>      >> >      > +#include <dispatch/dispatch.h>
>      >> >      > +
>      >> >      > +/**
>      >> >      > + *  From vmnet.framework documentation
>      >> >      > + *
>      >> >      > + *  Each read/write call allows up to 200 packets to be
>      >> >      > + *  read or written for a maximum of 256KB.
>      >> >      > + *
>      >> >      > + *  Each packet written should be a complete
>      >> >      > + *  ethernet frame.
>      >> >      > + *
>      >> >      > + * https://developer.apple.com/documentation/vmnet
>     <https://developer.apple.com/documentation/vmnet>
>      >> >     <https://developer.apple.com/documentation/vmnet
>     <https://developer.apple.com/documentation/vmnet>>
>      >> >      > + */
>      >> >      > +#define VMNET_PACKETS_LIMIT 200
>      >> >      >
>      >> >      >   typedef struct VmnetCommonState {
>      >> >      > -  NetClientState nc;
>      >> >      > +    NetClientState nc;
>      >> >      > +    interface_ref vmnet_if;
>      >> >      > +
>      >> >      > +    bool send_scheduled;
>      >> >      >
>      >> >      > +    uint64_t mtu;
>      >> >      > +    uint64_t max_packet_size;
>      >> >      > +
>      >> >      > +    struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
>      >> >      > +    struct iovec iov_buf[VMNET_PACKETS_LIMIT];
>      >> >      > +
>      >> >      > +    dispatch_queue_t if_queue;
>      >> >      > +
>      >> >      > +    QEMUBH *send_bh;
>      >> >      >   } VmnetCommonState;
>      >> >      >
>      >> >      > +const char *vmnet_status_map_str(vmnet_return_t status);
>      >> >      > +
>      >> >      > +int vmnet_if_create(NetClientState *nc,
>      >> >      > +                    xpc_object_t if_desc,
>      >> >      > +                    Error **errp);
>      >> >      > +
>      >> >      > +ssize_t vmnet_receive_common(NetClientState *nc,
>      >> >      > +                             const uint8_t *buf,
>      >> >      > +                             size_t size);
>      >> >      > +
>      >> >      > +void vmnet_cleanup_common(NetClientState *nc);
>      >> >      >
>      >> >      >   #endif /* VMNET_INT_H */
>      >> >
>      >> >
>      >> > Other issues will be fixed and submitted later,
>      >> > thank you!
>      >> >
>      >> > Regards,
>      >> > Vladislav Yaroshchuk
>      >>
>      >
>      > Regards,
>      > Vladislav Yaroshchuk
> 
> 
> Best Regards,
> 
> Vladislav Yaroshchuk


