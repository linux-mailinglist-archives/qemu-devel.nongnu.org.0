Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500AC4C54A9
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 09:42:37 +0100 (CET)
Received: from localhost ([::1]:40916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNsex-0004Zr-OA
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 03:42:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNsZu-0002fi-WB
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 03:37:24 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=36466
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNsZq-0005RR-0J
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 03:37:22 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id c6so10368752ybk.3
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 00:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FSOlr+NFvRM3xwykARgR0M1FVO7oN6kO7hFcJXgy+ZE=;
 b=XKn7hbS4pUC6mAWpN/Jtns3xtR1EidjbsUNQPaEGJIx3FE5y9JCiPjtJqGODzN10to
 Gp/tNH14HgPMAJ/YVKj15wlyHAa/MiimVAHVlb9S164rg22xJCTrL1Ki+lnnld0fGh2v
 bNM3ZaEg7mJz+VNXq53b2nm98v3X1wiw+URbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FSOlr+NFvRM3xwykARgR0M1FVO7oN6kO7hFcJXgy+ZE=;
 b=4ZPdw0ZGSXMuDzrjYm8S3Wk4acj+mUJTET73gX7ao+erW4R5E4uWymjIUYAO5RupWG
 TIbgj6DDEifs3KBsaNrcgE/YVJr6QioEmOF5YaN9gaM5I4KaJFK7ugwlKOw3wXvPs0Nx
 j0mayFc/aXvN1W8FIbY3gdpD0H+cGhxXDYT/xMKhL8z7cnA+GjAT7ZEvqYvsdh4jIDxT
 MkAmsFbC7TtwVZpcBU2GefLSRZZXAMGus/KpiLPRWOTCMZZTh6ellf9/HGFYPL060YfY
 MhmhBVpziG6penaTPgyv04/l3PcrY7lteDBdrD4jpY14gYebYkDlW/iMvn7Westhjfr6
 jBHg==
X-Gm-Message-State: AOAM531Fqr63ZwG35dJrQ4su5GLOaXIIpi8gYWknSx6pgtgNn/AQ39gD
 H6eN4gDnodWOm2p3JPdAvlUgEjyPBCimrBuhlxJUNA==
X-Google-Smtp-Source: ABdhPJwsHSZe79fU3T8uYBd8dBgHnlb/0RHlJdfEufi6/gIkaYA27GTZ/lXCBvMe4dtnrcPJCtDIAIt6chT8WlJDLcY=
X-Received: by 2002:a25:fc1f:0:b0:624:3d6c:78cd with SMTP id
 v31-20020a25fc1f000000b006243d6c78cdmr11336993ybd.286.1645864636815; Sat, 26
 Feb 2022 00:37:16 -0800 (PST)
MIME-Version: 1.0
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220225171402.64861-4-Vladislav.Yaroshchuk@jetbrains.com>
 <50a27646-ce9c-c702-965f-46b602be9220@gmail.com>
In-Reply-To: <50a27646-ce9c-c702-965f-46b602be9220@gmail.com>
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Date: Sat, 26 Feb 2022 11:37:05 +0300
Message-ID: <CAGmdLqQ8J+-sK=Huh-G8w-S0RQUEyKkN2rb6PsZAFXbd6Jk2EQ@mail.gmail.com>
Subject: Re: [PATCH v15 3/8] net/vmnet: implement shared mode (vmnet-shared)
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, r.bolshakov@yadro.com, 
 eblake@redhat.com, phillip.ennen@gmail.com, phillip@axleos.com, 
 armbru@redhat.com, hsp.cat7@gmail.com, hello@adns.io, roman@roolebo.dev, 
 Peter Maydell <peter.maydell@linaro.org>, dirty@apple.com, f4bug@amsat.org, 
 agraf@csgraf.de, kraxel@redhat.com,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu_oss@crudebyte.com
Content-Type: multipart/alternative; boundary="000000000000070c9105d8e7b910"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-yb1-xb2d.google.com
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

--000000000000070c9105d8e7b910
Content-Type: text/plain; charset="UTF-8"

Hi Akihiko,

On Fri, Feb 25, 2022 at 8:46 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/02/26 2:13, Vladislav Yaroshchuk wrote:
> > Interaction with vmnet.framework in different modes
> > differs only on configuration stage, so we can create
> > common `send`, `receive`, etc. procedures and reuse them.
> >
> > vmnet.framework supports iov, but writing more than
> > one iov into vmnet interface fails with
> > 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> > one and passing it to vmnet works fine. That's the
> > reason why receive_iov() left unimplemented. But it still
> > works with good enough performance having .receive()
> > net/vmnet: implement shared mode (vmnet-shared)
> >
> > Interaction with vmnet.framework in different modes
> > differs only on configuration stage, so we can create
> > common `send`, `receive`, etc. procedures and reuse them.
> >
> > vmnet.framework supports iov, but writing more than
> > one iov into vmnet interface fails with
> > 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> > one and passing it to vmnet works fine. That's the
> > reason why receive_iov() left unimplemented. But it still
> > works with good enough performance having .receive()
> > implemented only.
> >
> > Also, there is no way to unsubscribe from vmnet packages
> > receiving except registering and unregistering event
> > callback or simply drop packages just ignoring and
> > not processing them when related flag is set. Here we do
> > using the second way.
> >
> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
> > Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
>
> Thank you for persistently working on this.
>
> > ---
> >   net/vmnet-common.m | 302 +++++++++++++++++++++++++++++++++++++++++++++
> >   net/vmnet-shared.c |  94 +++++++++++++-
> >   net/vmnet_int.h    |  39 +++++-
> >   3 files changed, 430 insertions(+), 5 deletions(-)
> >
> > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> > index 56612c72ce..2f70921cae 100644
> > --- a/net/vmnet-common.m
> > +++ b/net/vmnet-common.m
> > @@ -10,6 +10,8 @@
> >    */
> >
> >   #include "qemu/osdep.h"
> > +#include "qemu/main-loop.h"
> > +#include "qemu/log.h"
> >   #include "qapi/qapi-types-net.h"
> >   #include "vmnet_int.h"
> >   #include "clients.h"
> > @@ -17,4 +19,304 @@
> >   #include "qapi/error.h"
> >
> >   #include <vmnet/vmnet.h>
> > +#include <dispatch/dispatch.h>
> >
> > +
> > +static inline void vmnet_set_send_bh_scheduled(VmnetCommonState *s,
> > +                                               bool enable)
> > +{
> > +    qatomic_set(&s->send_scheduled, enable);
> > +}
> > +
> > +
> > +static inline bool vmnet_is_send_bh_scheduled(VmnetCommonState *s)
> > +{
> > +    return qatomic_load_acquire(&s->send_scheduled);
> > +}
> > +
> > +
> > +static inline void vmnet_set_send_enabled(VmnetCommonState *s,
> > +                                          bool enable)
> > +{
> > +    if (enable) {
> > +        vmnet_interface_set_event_callback(
> > +            s->vmnet_if,
> > +            VMNET_INTERFACE_PACKETS_AVAILABLE,
> > +            s->if_queue,
> > +            ^(interface_event_t event_id, xpc_object_t event) {
> > +                assert(event_id == VMNET_INTERFACE_PACKETS_AVAILABLE);
> > +                /*
> > +                 * This function is being called from a non qemu
> thread, so
> > +                 * we only schedule a BH, and do the rest of the io
> completion
> > +                 * handling from vmnet_send_bh() which runs in a qemu
> context.
> > +                 *
> > +                 * Avoid scheduling multiple bottom halves
> > +                 */
> > +                if (!vmnet_is_send_bh_scheduled(s)) {
> > +                    vmnet_set_send_bh_scheduled(s, true);
>
> It can be interrupted between vmnet_is_send_bh_scheduled and
> vmnet_set_send_bh_scheduled, which leads to data race.
>
>
Sorry, I did not clearly understand what you meant. Since this
callback (block) is submitted on DISPATCH_QUEUE_SERIAL,
only one instance of the callback will be executed at any
moment of time.
https://developer.apple.com/documentation/dispatch/dispatch_queue_serial

Also this is the only place where we schedule a bottom half.

After we set the 'send_scheduled' flag, all the other
callback  blocks will do nothing (skip the if block) until
the bottom half is executed and reset 'send_scheduled'.
I don't see any races here :(

Correct me if I'm wrong please.


> > +                    qemu_bh_schedule(s->send_bh);
> > +                }
> > +            });
> > +    } else {
> > +        vmnet_interface_set_event_callback(
> > +            s->vmnet_if,
> > +            VMNET_INTERFACE_PACKETS_AVAILABLE,
> > +            NULL,
> > +            NULL);
> > +    }
> > +}
> > +
> > +
> > +static void vmnet_send_completed(NetClientState *nc, ssize_t len)
> > +{
> > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> > +    vmnet_set_send_enabled(s, true);
> > +}
> > +
> > +
> > +static void vmnet_send_bh(void *opaque)
> > +{
> > +    NetClientState *nc = (NetClientState *) opaque;
> > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> > +
> > +    struct iovec *iov = s->iov_buf;
> > +    struct vmpktdesc *packets = s->packets_buf;
> > +    int pkt_cnt;
> > +    int i;
> > +
> > +    vmnet_return_t status;
> > +    ssize_t size;
> > +
> > +    /* read as many packets as present */
> > +    pkt_cnt = VMNET_PACKETS_LIMIT;
>
> There could be more than VMNET_PACKETS_LIMIT. You may call vmnet_read in
> a loop.
>
> > +    for (i = 0; i < pkt_cnt; ++i) {
> > +        packets[i].vm_pkt_size = s->max_packet_size;
> > +        packets[i].vm_pkt_iovcnt = 1;
> > +        packets[i].vm_flags = 0;
> > +    }
> > +
> > +    status = vmnet_read(s->vmnet_if, packets, &pkt_cnt);
> > +    if (status != VMNET_SUCCESS) {
> > +        error_printf("vmnet: read failed: %s\n",
> > +                     vmnet_status_map_str(status));
> > +        goto done;
> > +    }
> > +
> > +    for (i = 0; i < pkt_cnt; ++i) {
> > +        size = qemu_send_packet_async(nc,
> > +                                      iov[i].iov_base,
> > +                                      packets[i].vm_pkt_size,
> > +                                      vmnet_send_completed);
> > +        if (size == 0) {
> > +            vmnet_set_send_enabled(s, false);
> > +            goto done;
> > +        } else if (size < 0) {
> > +            break;
> > +        }
>
> goto is not needed here. "break" when size <= 0.
>
> > +    }
> > +
> > +done:
> > +    vmnet_set_send_bh_scheduled(s, false);
> > +}
> > +
> > +
> > +static void vmnet_bufs_init(VmnetCommonState *s)
> > +{
> > +    struct vmpktdesc *packets = s->packets_buf;
> > +    struct iovec *iov = s->iov_buf;
> > +    int i;
> > +
> > +    for (i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
> > +        iov[i].iov_len = s->max_packet_size;
> > +        iov[i].iov_base = g_malloc0(iov[i].iov_len);
> > +        packets[i].vm_pkt_iov = iov + i;
> > +    }
> > +}
> > +
> > +
> > +const char *vmnet_status_map_str(vmnet_return_t status)
> > +{
> > +    switch (status) {
> > +    case VMNET_SUCCESS:
> > +        return "success";
> > +    case VMNET_FAILURE:
> > +        return "general failure (possibly not enough privileges)";
> > +    case VMNET_MEM_FAILURE:
> > +        return "memory allocation failure";
> > +    case VMNET_INVALID_ARGUMENT:
> > +        return "invalid argument specified";
> > +    case VMNET_SETUP_INCOMPLETE:
> > +        return "interface setup is not complete";
> > +    case VMNET_INVALID_ACCESS:
> > +        return "invalid access, permission denied";
> > +    case VMNET_PACKET_TOO_BIG:
> > +        return "packet size is larger than MTU";
> > +    case VMNET_BUFFER_EXHAUSTED:
> > +        return "buffers exhausted in kernel";
> > +    case VMNET_TOO_MANY_PACKETS:
> > +        return "packet count exceeds limit";
> > +#if defined(MAC_OS_VERSION_11_0) && \
> > +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
> > +    case VMNET_SHARING_SERVICE_BUSY:
> > +        return "conflict, sharing service is in use";
> > +#endif
> > +    default:
> > +        return "unknown vmnet error";
> > +    }
> > +}
> > +
> > +
> > +int vmnet_if_create(NetClientState *nc,
> > +                    xpc_object_t if_desc,
> > +                    Error **errp)
> > +{
> > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);;
>
> Duplicate semicolons.
>
> > +    dispatch_semaphore_t if_created_sem = dispatch_semaphore_create(0);
>
> if_created_sem leaks.
>
> > +    __block vmnet_return_t if_status;
> > +
> > +    s->if_queue = dispatch_queue_create(
> > +        "org.qemu.vmnet.if_queue",
> > +        DISPATCH_QUEUE_SERIAL
> > +    );
> > +
> > +    xpc_dictionary_set_bool(
> > +        if_desc,
> > +        vmnet_allocate_mac_address_key,
> > +        false
> > +    );
> > +#ifdef DEBUG
> > +    qemu_log("vmnet.start.interface_desc:\n");
> > +    xpc_dictionary_apply(if_desc,
> > +                         ^bool(const char *k, xpc_object_t v) {
> > +                             char *desc = xpc_copy_description(v);
> > +                             qemu_log("  %s=%s\n", k, desc);
> > +                             free(desc);
> > +                             return true;
> > +                         });
> > +#endif /* DEBUG */
> > +
> > +    s->vmnet_if = vmnet_start_interface(
> > +        if_desc,
> > +        s->if_queue,
> > +        ^(vmnet_return_t status, xpc_object_t interface_param) {
> > +            if_status = status;
> > +            if (status != VMNET_SUCCESS || !interface_param) {
> > +                dispatch_semaphore_signal(if_created_sem);
> > +                return;
> > +            }
> > +
> > +#ifdef DEBUG
> > +            qemu_log("vmnet.start.interface_param:\n");
> > +            xpc_dictionary_apply(interface_param,
> > +                                 ^bool(const char *k, xpc_object_t v) {
> > +                                     char *desc =
> xpc_copy_description(v);
> > +                                     qemu_log("  %s=%s\n", k, desc);
> > +                                     free(desc);
> > +                                     return true;
> > +                                 });
> > +#endif /* DEBUG */
> > +
> > +            s->mtu = xpc_dictionary_get_uint64(
> > +                interface_param,
> > +                vmnet_mtu_key);
> > +            s->max_packet_size = xpc_dictionary_get_uint64(
> > +                interface_param,
> > +                vmnet_max_packet_size_key);
> > +
> > +            dispatch_semaphore_signal(if_created_sem);
> > +        });
> > +
> > +    if (s->vmnet_if == NULL) {
> > +        error_setg(errp,
> > +                   "unable to create interface "
> > +                   "with requested params");
>
> You don't need line breaks here. Breaking a string into a few would also
> makes it a bit hard to grep.
>
> > +        return -1;
>
> s->if_queue leaks.
>
> > +    }
> > +
> > +    dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_FOREVER);
> > +
> > +    if (if_status != VMNET_SUCCESS) {
> > +        error_setg(errp,
> > +                   "cannot create vmnet interface: %s",
> > +                   vmnet_status_map_str(if_status));
> > +        return -1;
> > +    }
> > +
> > +    s->send_bh = aio_bh_new(qemu_get_aio_context(), vmnet_send_bh, nc);
> > +    vmnet_bufs_init(s);
> > +    vmnet_set_send_bh_scheduled(s, false);
> > +    vmnet_set_send_enabled(s, true);
> > +    return 0;
> > +}
> > +
> > +
> > +ssize_t vmnet_receive_common(NetClientState *nc,
> > +                             const uint8_t *buf,
> > +                             size_t size)
> > +{
> > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> > +    struct vmpktdesc packet;
> > +    struct iovec iov;
> > +    int pkt_cnt;
> > +    vmnet_return_t if_status;
> > +
> > +    if (size > s->max_packet_size) {
> > +        warn_report("vmnet: packet is too big, %zu > %llu\n",
>
> Use PRIu64.
>
> > +                    packet.vm_pkt_size,
> > +                    s->max_packet_size);
> > +        return -1;
> > +    }
> > +
> > +    iov.iov_base = (char *) buf;
> > +    iov.iov_len = size;
> > +
> > +    packet.vm_pkt_iovcnt = 1;
> > +    packet.vm_flags = 0;
> > +    packet.vm_pkt_size = size;
> > +    packet.vm_pkt_iov = &iov;
> > +    pkt_cnt = 1;
> > +
> > +    if_status = vmnet_write(s->vmnet_if, &packet, &pkt_cnt);
> > +    if (if_status != VMNET_SUCCESS) {
> > +        error_report("vmnet: write error: %s\n",
> > +                     vmnet_status_map_str(if_status));
>
> Why don't return -1?
>
> > +    }
> > +
> > +    if (if_status == VMNET_SUCCESS && pkt_cnt) {
> > +        return size;
> > +    }
> > +    return 0;
> > +}
> > +
> > +
> > +void vmnet_cleanup_common(NetClientState *nc)
> > +{
> > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);;
>
> Duplicate semicolons.
>
> > +    dispatch_semaphore_t if_created_sem;
> > +
> > +    qemu_purge_queued_packets(nc); > +
> vmnet_set_send_bh_scheduled(s, true);
> > +    vmnet_set_send_enabled(s, false);
> > +
> > +    if (s->vmnet_if == NULL) {
> > +        return;
> > +    }
> > +
> > +    if_created_sem = dispatch_semaphore_create(0);
> > +    vmnet_stop_interface(
> > +        s->vmnet_if,
> > +        s->if_queue,
> > +        ^(vmnet_return_t status) {
> > +            assert(status == VMNET_SUCCESS);
> > +            dispatch_semaphore_signal(if_created_sem);
> > +        });
> > +    dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_FOREVER);
> > +
> > +    qemu_bh_delete(s->send_bh);
> > +    dispatch_release(if_created_sem);
> > +    dispatch_release(s->if_queue);
> > +
> > +    for (int i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
> > +        g_free(s->iov_buf[i].iov_base);
> > +    }
> > +}
> > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
> > index f07afaaf21..66f66c034b 100644
> > --- a/net/vmnet-shared.c
> > +++ b/net/vmnet-shared.c
> > @@ -10,16 +10,102 @@
> >
> >   #include "qemu/osdep.h"
> >   #include "qapi/qapi-types-net.h"
> > +#include "qapi/error.h"
> >   #include "vmnet_int.h"
> >   #include "clients.h"
> > -#include "qemu/error-report.h"
> > -#include "qapi/error.h"
> >
> >   #include <vmnet/vmnet.h>
> >
> > +typedef struct VmnetSharedState {
> > +    VmnetCommonState cs;
> > +} VmnetSharedState;
> > +
> > +
> > +static bool validate_options(const Netdev *netdev, Error **errp)
> > +{
> > +    const NetdevVmnetSharedOptions *options = &(netdev->u.vmnet_shared);
> > +
> > +#if !defined(MAC_OS_VERSION_11_0) || \
> > +    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
> > +    if (options->has_isolated) {
> > +        error_setg(errp,
> > +                   "vmnet-shared.isolated feature is "
> > +                   "unavailable: outdated vmnet.framework API");
> > +        return false;
> > +    }
> > +#endif
> > +
> > +    if ((options->has_start_address ||
> > +         options->has_end_address ||
> > +         options->has_subnet_mask) &&
> > +        !(options->has_start_address &&
> > +          options->has_end_address &&
> > +          options->has_subnet_mask)) {
> > +        error_setg(errp,
> > +                   "'start-address', 'end-address', 'subnet-mask' "
> > +                   "should be provided together"
> > +        );
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +}
> > +
> > +static xpc_object_t build_if_desc(const Netdev *netdev)
> > +{
> > +    const NetdevVmnetSharedOptions *options = &(netdev->u.vmnet_shared);
> > +    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
> > +
> > +    xpc_dictionary_set_uint64(
> > +        if_desc,
> > +        vmnet_operation_mode_key,
> > +        VMNET_SHARED_MODE
> > +    );
> > +
> > +    if (options->has_nat66_prefix) {
> > +        xpc_dictionary_set_string(if_desc,
> > +                                  vmnet_nat66_prefix_key,
> > +                                  options->nat66_prefix);
> > +    }
> > +
> > +    if (options->has_start_address) {
> > +        xpc_dictionary_set_string(if_desc,
> > +                                  vmnet_start_address_key,
> > +                                  options->start_address);
> > +        xpc_dictionary_set_string(if_desc,
> > +                                  vmnet_end_address_key,
> > +                                  options->end_address);
> > +        xpc_dictionary_set_string(if_desc,
> > +                                  vmnet_subnet_mask_key,
> > +                                  options->subnet_mask);
> > +    }
> > +
> > +#if defined(MAC_OS_VERSION_11_0) && \
> > +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
> > +    xpc_dictionary_set_bool(
> > +        if_desc,
> > +        vmnet_enable_isolation_key,
> > +        options->isolated
> > +    );
> > +#endif
> > +
> > +    return if_desc;
> > +}
> > +
> > +static NetClientInfo net_vmnet_shared_info = {
> > +    .type = NET_CLIENT_DRIVER_VMNET_SHARED,
> > +    .size = sizeof(VmnetSharedState),
> > +    .receive = vmnet_receive_common,
> > +    .cleanup = vmnet_cleanup_common,
> > +};
> > +
> >   int net_init_vmnet_shared(const Netdev *netdev, const char *name,
> >                             NetClientState *peer, Error **errp)
> >   {
> > -  error_setg(errp, "vmnet-shared is not implemented yet");
> > -  return -1;
> > +    NetClientState *nc = qemu_new_net_client(&net_vmnet_shared_info,
> > +                                             peer, "vmnet-shared",
> name);
> > +    if (!validate_options(netdev, errp)) {
> > +        g_assert_not_reached();
>
> g_assert_not_reached is for debugging purpose and may be dropped
> depending on the build option.
>
> > +    }
> > +    return vmnet_if_create(nc, build_if_desc(netdev), errp);
> >   }
> > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> > index aac4d5af64..acfe3a88c0 100644
> > --- a/net/vmnet_int.h
> > +++ b/net/vmnet_int.h
> > @@ -15,11 +15,48 @@
> >   #include "clients.h"
> >
> >   #include <vmnet/vmnet.h>
> > +#include <dispatch/dispatch.h>
> > +
> > +/**
> > + *  From vmnet.framework documentation
> > + *
> > + *  Each read/write call allows up to 200 packets to be
> > + *  read or written for a maximum of 256KB.
> > + *
> > + *  Each packet written should be a complete
> > + *  ethernet frame.
> > + *
> > + *  https://developer.apple.com/documentation/vmnet
> > + */
> > +#define VMNET_PACKETS_LIMIT 200
> >
> >   typedef struct VmnetCommonState {
> > -  NetClientState nc;
> > +    NetClientState nc;
> > +    interface_ref vmnet_if;
> > +
> > +    bool send_scheduled;
> >
> > +    uint64_t mtu;
> > +    uint64_t max_packet_size;
> > +
> > +    struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
> > +    struct iovec iov_buf[VMNET_PACKETS_LIMIT];
> > +
> > +    dispatch_queue_t if_queue;
> > +
> > +    QEMUBH *send_bh;
> >   } VmnetCommonState;
> >
> > +const char *vmnet_status_map_str(vmnet_return_t status);
> > +
> > +int vmnet_if_create(NetClientState *nc,
> > +                    xpc_object_t if_desc,
> > +                    Error **errp);
> > +
> > +ssize_t vmnet_receive_common(NetClientState *nc,
> > +                             const uint8_t *buf,
> > +                             size_t size);
> > +
> > +void vmnet_cleanup_common(NetClientState *nc);
> >
> >   #endif /* VMNET_INT_H */
>
>
Other issues will be fixed and submitted later,
thank you!

Regards,
Vladislav Yaroshchuk

--000000000000070c9105d8e7b910
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div>Hi Akihiko,<div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 25, 2022=
 at 8:46 PM Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">ak=
ihiko.odaki@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 2022/02/26 2:13, Vladislav Yaroshchuk wrote:<br>
&gt; Interaction with vmnet.framework in different modes<br>
&gt; differs only on configuration stage, so we can create<br>
&gt; common `send`, `receive`, etc. procedures and reuse them.<br>
&gt; <br>
&gt; vmnet.framework supports iov, but writing more than<br>
&gt; one iov into vmnet interface fails with<br>
&gt; &#39;VMNET_INVALID_ARGUMENT&#39;. Collecting provided iovs into<br>
&gt; one and passing it to vmnet works fine. That&#39;s the<br>
&gt; reason why receive_iov() left unimplemented. But it still<br>
&gt; works with good enough performance having .receive()<br>
&gt; net/vmnet: implement shared mode (vmnet-shared)<br>
&gt; <br>
&gt; Interaction with vmnet.framework in different modes<br>
&gt; differs only on configuration stage, so we can create<br>
&gt; common `send`, `receive`, etc. procedures and reuse them.<br>
&gt; <br>
&gt; vmnet.framework supports iov, but writing more than<br>
&gt; one iov into vmnet interface fails with<br>
&gt; &#39;VMNET_INVALID_ARGUMENT&#39;. Collecting provided iovs into<br>
&gt; one and passing it to vmnet works fine. That&#39;s the<br>
&gt; reason why receive_iov() left unimplemented. But it still<br>
&gt; works with good enough performance having .receive()<br>
&gt; implemented only.<br>
&gt; <br>
&gt; Also, there is no way to unsubscribe from vmnet packages<br>
&gt; receiving except registering and unregistering event<br>
&gt; callback or simply drop packages just ignoring and<br>
&gt; not processing them when related flag is set. Here we do<br>
&gt; using the second way.<br>
&gt; <br>
&gt; Signed-off-by: Phillip Tennen &lt;<a href=3D"mailto:phillip@axleos.com=
" target=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:Vladislav.Ya=
roshchuk@jetbrains.com" target=3D"_blank">Vladislav.Yaroshchuk@jetbrains.co=
m</a>&gt;<br>
<br>
Thank you for persistently working on this.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0net/vmnet-common.m | 302 +++++++++++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0net/vmnet-shared.c |=C2=A0 94 +++++++++++++-<br>
&gt;=C2=A0 =C2=A0net/vmnet_int.h=C2=A0 =C2=A0 |=C2=A0 39 +++++-<br>
&gt;=C2=A0 =C2=A03 files changed, 430 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/net/vmnet-common.m b/net/vmnet-common.m<br>
&gt; index 56612c72ce..2f70921cae 100644<br>
&gt; --- a/net/vmnet-common.m<br>
&gt; +++ b/net/vmnet-common.m<br>
&gt; @@ -10,6 +10,8 @@<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/main-loop.h&quot;<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qapi/qapi-types-net.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;vmnet_int.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;clients.h&quot;<br>
&gt; @@ -17,4 +19,304 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &lt;vmnet/vmnet.h&gt;<br>
&gt; +#include &lt;dispatch/dispatch.h&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +<br>
&gt; +static inline void vmnet_set_send_bh_scheduled(VmnetCommonState *s,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bool enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 qatomic_set(&amp;s-&gt;send_scheduled, enable);<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +static inline bool vmnet_is_send_bh_scheduled(VmnetCommonState *s)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return qatomic_load_acquire(&amp;s-&gt;send_scheduled);=
<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +static inline void vmnet_set_send_enabled(VmnetCommonState *s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (enable) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_interface_set_event_callback(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;vmnet_if,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_INTERFACE_PACKETS_AVA=
ILABLE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;if_queue,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(interface_event_t event_i=
d, xpc_object_t event) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(event_=
id =3D=3D VMNET_INTERFACE_PACKETS_AVAILABLE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* This =
function is being called from a non qemu thread, so<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we on=
ly schedule a BH, and do the rest of the io completion<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* handl=
ing from vmnet_send_bh() which runs in a qemu context.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Avoid=
 scheduling multiple bottom halves<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!vmnet_is=
_send_bh_scheduled(s)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 vmnet_set_send_bh_scheduled(s, true);<br>
<br>
It can be interrupted between vmnet_is_send_bh_scheduled and <br>
vmnet_set_send_bh_scheduled, which leads to data race.<br>
<br></blockquote><div><br></div><div>Sorry, I did not clearly understand wh=
at you meant. Since this</div><div>callback (block) is submitted on=C2=A0DI=
SPATCH_QUEUE_SERIAL,</div><div>only one instance of the callback will be ex=
ecuted at any</div><div>moment of time.</div><div><a href=3D"https://develo=
per.apple.com/documentation/dispatch/dispatch_queue_serial">https://develop=
er.apple.com/documentation/dispatch/dispatch_queue_serial</a></div><div><br=
></div><div>Also this is the only place where we schedule a bottom half.</d=
iv><div><br>After we set the &#39;send_scheduled&#39; flag, all the other=
=C2=A0</div><div>callback=C2=A0 blocks will do nothing (skip the if block) =
until</div><div>the bottom half is executed and reset &#39;send_scheduled&#=
39;.=C2=A0</div><div>I don&#39;t see any races here :(</div><div><br></div>=
<div>Correct me if I&#39;m wrong please.</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 qemu_bh_schedule(s-&gt;send_bh);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_interface_set_event_callback(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;vmnet_if,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_INTERFACE_PACKETS_AVA=
ILABLE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +static void vmnet_send_completed(NetClientState *nc, ssize_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc,=
 nc);<br>
&gt; +=C2=A0 =C2=A0 vmnet_set_send_enabled(s, true);<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +static void vmnet_send_bh(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 NetClientState *nc =3D (NetClientState *) opaque;<br>
&gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc,=
 nc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 struct iovec *iov =3D s-&gt;iov_buf;<br>
&gt; +=C2=A0 =C2=A0 struct vmpktdesc *packets =3D s-&gt;packets_buf;<br>
&gt; +=C2=A0 =C2=A0 int pkt_cnt;<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 vmnet_return_t status;<br>
&gt; +=C2=A0 =C2=A0 ssize_t size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* read as many packets as present */<br>
&gt; +=C2=A0 =C2=A0 pkt_cnt =3D VMNET_PACKETS_LIMIT;<br>
<br>
There could be more than VMNET_PACKETS_LIMIT. You may call vmnet_read in <b=
r>
a loop.<br>
<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; pkt_cnt; ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_pkt_size =3D s-&gt;max_pack=
et_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_pkt_iovcnt =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_flags =3D 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 status =3D vmnet_read(s-&gt;vmnet_if, packets, &amp;pkt=
_cnt);<br>
&gt; +=C2=A0 =C2=A0 if (status !=3D VMNET_SUCCESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&quot;vmnet: read failed: %s=
\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0vmnet_status_map_str(status));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; pkt_cnt; ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D qemu_send_packet_async(nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iov[i].iov_=
base,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].=
vm_pkt_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_send_=
completed);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_set_send_enabled(s, f=
alse);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (size &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
goto is not needed here. &quot;break&quot; when size &lt;=3D 0.<br>
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +done:<br>
&gt; +=C2=A0 =C2=A0 vmnet_set_send_bh_scheduled(s, false);<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +static void vmnet_bufs_init(VmnetCommonState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct vmpktdesc *packets =3D s-&gt;packets_buf;<br>
&gt; +=C2=A0 =C2=A0 struct iovec *iov =3D s-&gt;iov_buf;<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; VMNET_PACKETS_LIMIT; ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iov[i].iov_len =3D s-&gt;max_packet_size;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iov[i].iov_base =3D g_malloc0(iov[i].iov_=
len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_pkt_iov =3D iov + i;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +const char *vmnet_status_map_str(vmnet_return_t status)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 switch (status) {<br>
&gt; +=C2=A0 =C2=A0 case VMNET_SUCCESS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;success&quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_FAILURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;general failure (possibly no=
t enough privileges)&quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_MEM_FAILURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;memory allocation failure&qu=
ot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_INVALID_ARGUMENT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;invalid argument specified&q=
uot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_SETUP_INCOMPLETE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;interface setup is not compl=
ete&quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_INVALID_ACCESS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;invalid access, permission d=
enied&quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_PACKET_TOO_BIG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;packet size is larger than M=
TU&quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_BUFFER_EXHAUSTED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;buffers exhausted in kernel&=
quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_TOO_MANY_PACKETS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;packet count exceeds limit&q=
uot;;<br>
&gt; +#if defined(MAC_OS_VERSION_11_0) &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 MAC_OS_X_VERSION_MIN_REQUIRED &gt;=3D MAC_OS_VERSION_11=
_0<br>
&gt; +=C2=A0 =C2=A0 case VMNET_SHARING_SERVICE_BUSY:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;conflict, sharing service is=
 in use&quot;;<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;unknown vmnet error&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +int vmnet_if_create(NetClientState *nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 xpc_object_t if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc,=
 nc);;<br>
<br>
Duplicate semicolons.<br>
<br>
&gt; +=C2=A0 =C2=A0 dispatch_semaphore_t if_created_sem =3D dispatch_semaph=
ore_create(0);<br>
<br>
if_created_sem leaks.<br>
<br>
&gt; +=C2=A0 =C2=A0 __block vmnet_return_t if_status;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;if_queue =3D dispatch_queue_create(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;org.qemu.vmnet.if_queue&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DISPATCH_QUEUE_SERIAL<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 xpc_dictionary_set_bool(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_allocate_mac_address_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 false<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +#ifdef DEBUG<br>
&gt; +=C2=A0 =C2=A0 qemu_log(&quot;vmnet.start.interface_desc:\n&quot;);<br=
>
&gt; +=C2=A0 =C2=A0 xpc_dictionary_apply(if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0^bool(const char *k, xpc_object_t v) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *desc =3D xpc_copy_description(v);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log(&quot;=C2=A0 %s=3D%s\n&quot;, k=
, desc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(desc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0});<br>
&gt; +#endif /* DEBUG */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;vmnet_if =3D vmnet_start_interface(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;if_queue,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(vmnet_return_t status, xpc_object_t int=
erface_param) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if_status =3D status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (status !=3D VMNET_SUCCE=
SS || !interface_param) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_sema=
phore_signal(if_created_sem);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +#ifdef DEBUG<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;vmnet.start.=
interface_param:\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_apply(interf=
ace_param,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^bool(const char *k, xpc_o=
bject_t v) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *desc =
=3D xpc_copy_description(v);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log(&qu=
ot;=C2=A0 %s=3D%s\n&quot;, k, desc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(desc);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0});<br>
&gt; +#endif /* DEBUG */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mtu =3D xpc_dictionar=
y_get_uint64(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface_par=
am,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_mtu_key=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;max_packet_size =3D x=
pc_dictionary_get_uint64(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface_par=
am,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_max_pac=
ket_size_key);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_semaphore_signal(i=
f_created_sem);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;vmnet_if =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;unable to create interface &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;with requested params&quot;);<br>
<br>
You don&#39;t need line breaks here. Breaking a string into a few would als=
o <br>
makes it a bit hard to grep.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
<br>
s-&gt;if_queue leaks.<br>
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_F=
OREVER);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (if_status !=3D VMNET_SUCCESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;cannot create vmnet interface: %s&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
vmnet_status_map_str(if_status));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;send_bh =3D aio_bh_new(qemu_get_aio_context(), vm=
net_send_bh, nc);<br>
&gt; +=C2=A0 =C2=A0 vmnet_bufs_init(s);<br>
&gt; +=C2=A0 =C2=A0 vmnet_set_send_bh_scheduled(s, false);<br>
&gt; +=C2=A0 =C2=A0 vmnet_set_send_enabled(s, true);<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +ssize_t vmnet_receive_common(NetClientState *nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint8_t *buf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc,=
 nc);<br>
&gt; +=C2=A0 =C2=A0 struct vmpktdesc packet;<br>
&gt; +=C2=A0 =C2=A0 struct iovec iov;<br>
&gt; +=C2=A0 =C2=A0 int pkt_cnt;<br>
&gt; +=C2=A0 =C2=A0 vmnet_return_t if_status;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (size &gt; s-&gt;max_packet_size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;vmnet: packet is too bi=
g, %zu &gt; %llu\n&quot;,<br>
<br>
Use PRIu64.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 packet.vm_pkt_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 s-&gt;max_packet_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 iov.iov_base =3D (char *) buf;<br>
&gt; +=C2=A0 =C2=A0 iov.iov_len =3D size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 packet.vm_pkt_iovcnt =3D 1;<br>
&gt; +=C2=A0 =C2=A0 packet.vm_flags =3D 0;<br>
&gt; +=C2=A0 =C2=A0 packet.vm_pkt_size =3D size;<br>
&gt; +=C2=A0 =C2=A0 packet.vm_pkt_iov =3D &amp;iov;<br>
&gt; +=C2=A0 =C2=A0 pkt_cnt =3D 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if_status =3D vmnet_write(s-&gt;vmnet_if, &amp;packet, =
&amp;pkt_cnt);<br>
&gt; +=C2=A0 =C2=A0 if (if_status !=3D VMNET_SUCCESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;vmnet: write error: %s=
\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0vmnet_status_map_str(if_status));<br>
<br>
Why don&#39;t return -1?<br>
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (if_status =3D=3D VMNET_SUCCESS &amp;&amp; pkt_cnt) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return size;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +void vmnet_cleanup_common(NetClientState *nc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc,=
 nc);;<br>
<br>
Duplicate semicolons.<br>
<br>
&gt; +=C2=A0 =C2=A0 dispatch_semaphore_t if_created_sem;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_purge_queued_packets(nc); &gt; +=C2=A0 =C2=A0 vmne=
t_set_send_bh_scheduled(s, true);<br>
&gt; +=C2=A0 =C2=A0 vmnet_set_send_enabled(s, false);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;vmnet_if =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if_created_sem =3D dispatch_semaphore_create(0);<br>
&gt; +=C2=A0 =C2=A0 vmnet_stop_interface(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;vmnet_if,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;if_queue,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(vmnet_return_t status) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(status =3D=3D VMNET_=
SUCCESS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_semaphore_signal(i=
f_created_sem);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt; +=C2=A0 =C2=A0 dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_F=
OREVER);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_bh_delete(s-&gt;send_bh);<br>
&gt; +=C2=A0 =C2=A0 dispatch_release(if_created_sem);<br>
&gt; +=C2=A0 =C2=A0 dispatch_release(s-&gt;if_queue);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (int i =3D 0; i &lt; VMNET_PACKETS_LIMIT; ++i) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(s-&gt;iov_buf[i].iov_base);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c<br>
&gt; index f07afaaf21..66f66c034b 100644<br>
&gt; --- a/net/vmnet-shared.c<br>
&gt; +++ b/net/vmnet-shared.c<br>
&gt; @@ -10,16 +10,102 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qapi/qapi-types-net.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;vmnet_int.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;clients.h&quot;<br>
&gt; -#include &quot;qemu/error-report.h&quot;<br>
&gt; -#include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &lt;vmnet/vmnet.h&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +typedef struct VmnetSharedState {<br>
&gt; +=C2=A0 =C2=A0 VmnetCommonState cs;<br>
&gt; +} VmnetSharedState;<br>
&gt; +<br>
&gt; +<br>
&gt; +static bool validate_options(const Netdev *netdev, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 const NetdevVmnetSharedOptions *options =3D &amp;(netde=
v-&gt;u.vmnet_shared);<br>
&gt; +<br>
&gt; +#if !defined(MAC_OS_VERSION_11_0) || \<br>
&gt; +=C2=A0 =C2=A0 MAC_OS_X_VERSION_MIN_REQUIRED &lt; MAC_OS_VERSION_11_0<=
br>
&gt; +=C2=A0 =C2=A0 if (options-&gt;has_isolated) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;vmnet-shared.isolated feature is &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;unavailable: outdated vmnet.framework API&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if ((options-&gt;has_start_address ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options-&gt;has_end_address ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options-&gt;has_subnet_mask) &amp;&=
amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 !(options-&gt;has_start_address &amp;&amp=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;has_end_address &amp;&=
amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;has_subnet_mask)) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;&#39;start-address&#39;, &#39;end-address&#39;, &#39;subnet-mask&#39;=
 &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;should be provided together&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static xpc_object_t build_if_desc(const Netdev *netdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 const NetdevVmnetSharedOptions *options =3D &amp;(netde=
v-&gt;u.vmnet_shared);<br>
&gt; +=C2=A0 =C2=A0 xpc_object_t if_desc =3D xpc_dictionary_create(NULL, NU=
LL, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 xpc_dictionary_set_uint64(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_operation_mode_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_SHARED_MODE<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (options-&gt;has_nat66_prefix) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_nat66_prefix_key,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;nat66_prefix)=
;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (options-&gt;has_start_address) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_start_address_key,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;start_address=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_end_address_key,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;end_address);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_subnet_mask_key,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;subnet_mask);=
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +#if defined(MAC_OS_VERSION_11_0) &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 MAC_OS_X_VERSION_MIN_REQUIRED &gt;=3D MAC_OS_VERSION_11=
_0<br>
&gt; +=C2=A0 =C2=A0 xpc_dictionary_set_bool(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_enable_isolation_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;isolated<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return if_desc;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static NetClientInfo net_vmnet_shared_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .type =3D NET_CLIENT_DRIVER_VMNET_SHARED,<br>
&gt; +=C2=A0 =C2=A0 .size =3D sizeof(VmnetSharedState),<br>
&gt; +=C2=A0 =C2=A0 .receive =3D vmnet_receive_common,<br>
&gt; +=C2=A0 =C2=A0 .cleanup =3D vmnet_cleanup_common,<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0int net_init_vmnet_shared(const Netdev *netdev, const char=
 *name,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NetClientState *peer, Error **errp)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 error_setg(errp, &quot;vmnet-shared is not implemented yet&quo=
t;);<br>
&gt; -=C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 NetClientState *nc =3D qemu_new_net_client(&amp;net_vmn=
et_shared_info,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0peer, &quot;vmnet-shared&quot;, name);<br>
&gt; +=C2=A0 =C2=A0 if (!validate_options(netdev, errp)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
<br>
g_assert_not_reached is for debugging purpose and may be dropped <br>
depending on the build option.<br>
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return vmnet_if_create(nc, build_if_desc(netdev), errp)=
;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; diff --git a/net/vmnet_int.h b/net/vmnet_int.h<br>
&gt; index aac4d5af64..acfe3a88c0 100644<br>
&gt; --- a/net/vmnet_int.h<br>
&gt; +++ b/net/vmnet_int.h<br>
&gt; @@ -15,11 +15,48 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;clients.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &lt;vmnet/vmnet.h&gt;<br>
&gt; +#include &lt;dispatch/dispatch.h&gt;<br>
&gt; +<br>
&gt; +/**<br>
&gt; + *=C2=A0 From vmnet.framework documentation<br>
&gt; + *<br>
&gt; + *=C2=A0 Each read/write call allows up to 200 packets to be<br>
&gt; + *=C2=A0 read or written for a maximum of 256KB.<br>
&gt; + *<br>
&gt; + *=C2=A0 Each packet written should be a complete<br>
&gt; + *=C2=A0 ethernet frame.<br>
&gt; + *<br>
&gt; + *=C2=A0 <a href=3D"https://developer.apple.com/documentation/vmnet" =
rel=3D"noreferrer" target=3D"_blank">https://developer.apple.com/documentat=
ion/vmnet</a><br>
&gt; + */<br>
&gt; +#define VMNET_PACKETS_LIMIT 200<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0typedef struct VmnetCommonState {<br>
&gt; -=C2=A0 NetClientState nc;<br>
&gt; +=C2=A0 =C2=A0 NetClientState nc;<br>
&gt; +=C2=A0 =C2=A0 interface_ref vmnet_if;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 bool send_scheduled;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 uint64_t mtu;<br>
&gt; +=C2=A0 =C2=A0 uint64_t max_packet_size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];<br>
&gt; +=C2=A0 =C2=A0 struct iovec iov_buf[VMNET_PACKETS_LIMIT];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dispatch_queue_t if_queue;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 QEMUBH *send_bh;<br>
&gt;=C2=A0 =C2=A0} VmnetCommonState;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +const char *vmnet_status_map_str(vmnet_return_t status);<br>
&gt; +<br>
&gt; +int vmnet_if_create(NetClientState *nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 xpc_object_t if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Error **errp);<br>
&gt; +<br>
&gt; +ssize_t vmnet_receive_common(NetClientState *nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint8_t *buf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size);<br>
&gt; +<br>
&gt; +void vmnet_cleanup_common(NetClientState *nc);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#endif /* VMNET_INT_H */<br>
<br></blockquote><div><br></div><div>Other issues will be fixed and submitt=
ed later,</div><div>thank you!<br></div><div><br></div><div>Regards,</div><=
div>Vladislav Yaroshchuk</div></div></div></div>

--000000000000070c9105d8e7b910--

