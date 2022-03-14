Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620D04D8F17
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 22:52:35 +0100 (CET)
Received: from localhost ([::1]:56644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTscE-0002u5-0F
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 17:52:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nTsaR-0001ep-3l
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 17:50:44 -0400
Received: from [2607:f8b0:4864:20::b36] (port=41816
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nTsaM-0000nC-Vj
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 17:50:42 -0400
Received: by mail-yb1-xb36.google.com with SMTP id l2so33544431ybe.8
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 14:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oh7YZAduqlSJrwNWpUzdbKXdYhH0KB48LVBo1ESGrIw=;
 b=C4LVCub19hP25W3yuo6LjZjKQXNOSlmpOhnhgDZbLajJfF5Lt7/++xdLs48BX9qoMV
 gyVozbMAYqoIoYTDfc55pCTGi8LtXj9sbYtSw7tPKv6+ilcgWs5v1v9FSE6wgzhJeOhS
 5x36j9ME5PmiCo1Gt+1orZOM/nNlaGyKa2O88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oh7YZAduqlSJrwNWpUzdbKXdYhH0KB48LVBo1ESGrIw=;
 b=WaITqK342pTWZr8X6VIf2UADJbEOBuxxvTFtIHbvugHfaxO6HRVnknnDpKyiJpjDPJ
 QeW/ldiLDQVZ2zBQXYdLoIX24zk66BhckQAWtEFeTnGTj0JQbA7gsJ17QRLyK9C4a39e
 R/rjvNWAFy1dPx436rY/2fn30uz0LVYRzKsQwDyXB4NMckB+4d5PLEz3eS9aYMRkSfHc
 3Ef6udmYsIQ6DqpsHbusKxd0Zr0Fjvhw5fROy/x9ggk4vNURAqzUqItAnG5ZG0Gu8YFX
 A3wMPUyJjntgGOobMPljOq0aMDt26lpXBb+g7MoafnZzWSQ3VQCxZJV3vWp9aLDAmdYG
 uM1A==
X-Gm-Message-State: AOAM532c+PS3eFQu0m8rYgxgfbXGHzDtwXA6Nyp0GZaXYMthEbr71t10
 UrL6l0BH4SRsmrd9ixTyl5+N00lm+/9Xf4sXsMBepA==
X-Google-Smtp-Source: ABdhPJyMDaFlKdN1KymnnrDU+gEFYY/SBcY1zD99NSp/iRiElMzLVv3g56OqmNYaoxMQBxWzxHsuNdYU9TNy++XhR4A=
X-Received: by 2002:a25:a467:0:b0:61e:1b4a:7700 with SMTP id
 f94-20020a25a467000000b0061e1b4a7700mr19946787ybi.390.1647294637275; Mon, 14
 Mar 2022 14:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220314191545.81861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220314191545.81861-4-Vladislav.Yaroshchuk@jetbrains.com>
 <f050ce26-4cff-82c9-33f6-8532ecb8b6dc@gmail.com>
In-Reply-To: <f050ce26-4cff-82c9-33f6-8532ecb8b6dc@gmail.com>
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Date: Tue, 15 Mar 2022 00:50:26 +0300
Message-ID: <CAGmdLqT5Ka4=_P-tKHquimfYd_f4S7XeajUieKjyQ8sFqX33ig@mail.gmail.com>
Subject: Re: [PATCH v16 3/7] net/vmnet: implement shared mode (vmnet-shared)
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
Content-Type: multipart/alternative; boundary="000000000000b21f1005da34abd4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-yb1-xb36.google.com
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

--000000000000b21f1005da34abd4
Content-Type: text/plain; charset="UTF-8"

Thank you, Akihiko

On Mon, Mar 14, 2022 at 10:46 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/03/15 4:15, Vladislav Yaroshchuk wrote:
> > vmnet.framework supports iov, but writing more than
> > one iov into vmnet interface fails with
> > 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> > one and passing it to vmnet works fine. That's the
> > reason why receive_iov() left unimplemented. But it still
> > works with good enough performance having .receive()
> > implemented only.
> >
> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
> > Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
> > ---
> >   net/vmnet-common.m | 298 +++++++++++++++++++++++++++++++++++++++++++++
> >   net/vmnet-shared.c |  95 ++++++++++++++-
> >   net/vmnet_int.h    |  41 ++++++-
> >   3 files changed, 429 insertions(+), 5 deletions(-)
> >
> > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> > index 56612c72ce..20a33d2591 100644
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
> > @@ -17,4 +19,300 @@
> >   #include "qapi/error.h"
> >
> >   #include <vmnet/vmnet.h>
> > +#include <dispatch/dispatch.h>
> >
> > +static bool vmnet_qemu_send_wrapper(VmnetCommonState *s);
>
> The names of vmnet_qemu_send_wrapper and vmnet_send_bh does not tell
> them apart well. Since only vmnet_send_bh does reading, its name may
> include "read" to clarify that. "wrapper" in vmnet_qemu_send_wrapper may
> be also misleading as it does more than just calling the underlying QEMU
> facility, but it also updates VmnetCommonState.
>
>
Ok, I'll think about how to name them better.


> > +
> > +
> > +static void vmnet_send_completed(NetClientState *nc, ssize_t len)
> > +{
> > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> > +    /* Complete sending packets left in VmnetCommonState buffers */
> > +    s->send_enabled = vmnet_qemu_send_wrapper(s);
>
> It must qemu_bh_schedule(s->send_bh) after vmnet_qemu_send_wrapper.
>
>
Agree with you, thanks.


> Also, send_enabled flag can be removed as explained in:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg873923.html
>
>
Not sure about this. Values of packets_send_current_pos
and packets_send_end_pos may be equal, but QEMU may be
not ready to receive new packets - the explanation:
1. We are sending packets to QEMU with qemu_send_packet_async:
    packets_send_current_pos = 0
    packets_send_end_pos = 5
2. All five packets (0, 1, 2, 3, 4) have been successfully sent to QEMU,
    but qemu_send_packet_async returned 0 "no more packets" after
    the last invocation
3. In spite of this, all five packets are sent and
    packets_send_current_pos == packets_send_end_pos == 5
4. It seems that "pointers are equal ->  QEMU is ready", but actually
    it is not.

Also, hiding QEMU "ready"/"not ready" state behind pointers is a
bad choice I think. Having a concrete flag makes this more clear.
It provides understandability, not complexity (imho).


>  > send_enabled can be eliminated. When it is enabled, packets_send_pos
>  > and packets_batch_size must be equal. They must not be equal
>  > otherwise. packets_send_pos must represent the position of the packet
>  > which is not sent yet, possibly in the process of sending.
>  > vmnet_send_completed must call qemu_send_wrapper before scheduling
>  > send_bh. bh_send should do nothing if s->packets_send_pos <
>  > s->packets_batch_size.
>
> > +}
> > +
> > +
> > +static bool vmnet_qemu_send_wrapper(VmnetCommonState *s) {
> > +    ssize_t size;
> > +
> > +    /*
> > +     * Packets to send lay in [current_pos..end_pos)
> > +     * (including current_pos, excluding end_pos)
> > +     */
> > +    while (s->packets_send_current_pos < s->packets_send_end_pos) {
> > +        size = qemu_send_packet_async(&s->nc,
> > +
> s->iov_buf[s->packets_send_current_pos].iov_base,
> > +
> s->packets_buf[s->packets_send_current_pos].vm_pkt_size,
> > +                                      vmnet_send_completed);
> > +        ++s->packets_send_current_pos;
> > +        if (size == 0) {
> > +            /* QEMU is not ready - wait for completion callback call */
> > +            return false;
> > +        }
> > +    }
> > +    return true;
> > +}
> > +
> > +
> > +static void vmnet_send_bh(void *opaque)
> > +{
> > +    NetClientState *nc = (NetClientState *) opaque;
> > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> > +    struct vmpktdesc *packets = s->packets_buf;
> > +    vmnet_return_t status;
> > +    int i;
> > +
> > +    /*
> > +     * Do nothing if QEMU is not ready - wait
> > +     * for completion callback invocation
> > +     */
> > +    if (!s->send_enabled) {
> > +        return;
> > +    }
> > +
> > +    /* Read as many packets as present */
> > +    s->packets_send_current_pos = 0;
> > +    s->packets_send_end_pos = VMNET_PACKETS_LIMIT;
> > +    for (i = 0; i < s->packets_send_end_pos; ++i) {
> > +        packets[i].vm_pkt_size = s->max_packet_size;
> > +        packets[i].vm_pkt_iovcnt = 1;
> > +        packets[i].vm_flags = 0;
> > +    }
> > +
> > +    status = vmnet_read(s->vmnet_if, packets, &s->packets_send_end_pos);
> > +    if (status != VMNET_SUCCESS) {
> > +        error_printf("vmnet: read failed: %s\n",
> > +                     vmnet_status_map_str(status));
> > +        s->packets_send_current_pos = 0;
> > +        s->packets_send_end_pos = 0;
> > +        return;
> > +    }
> > +
> > +    /* Send packets to QEMU */
> > +    s->send_enabled = vmnet_qemu_send_wrapper(s);
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
> > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> > +    dispatch_semaphore_t if_created_sem = dispatch_semaphore_create(0);
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
> > +
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
> > +        dispatch_release(s->if_queue);
> > +        dispatch_release(if_created_sem);
> > +        error_setg(errp,
> > +                   "unable to create interface with requested params");
> > +        return -1;
> > +    }
> > +
> > +    dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_FOREVER);
> > +    dispatch_release(if_created_sem);
> > +
> > +    if (if_status != VMNET_SUCCESS) {
> > +        dispatch_release(s->if_queue);
> > +        error_setg(errp,
> > +                   "cannot create vmnet interface: %s",
> > +                   vmnet_status_map_str(if_status));
> > +        return -1;
> > +    }
> > +
> > +    s->send_bh = aio_bh_new(qemu_get_aio_context(), vmnet_send_bh, nc);
> > +    s->send_enabled = true;
> > +    vmnet_bufs_init(s);
> > +
> > +    vmnet_interface_set_event_callback(
> > +        s->vmnet_if,
> > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
> > +        s->if_queue,
> > +        ^(interface_event_t event_id, xpc_object_t event) {
> > +            assert(event_id == VMNET_INTERFACE_PACKETS_AVAILABLE);
> > +            /*
> > +             * This function is being called from a non qemu thread, so
> > +             * we only schedule a BH, and do the rest of the io
> completion
> > +             * handling from vmnet_send_bh() which runs in a qemu
> context.
> > +             */
> > +            qemu_bh_schedule(s->send_bh);
> > +        });
> > +
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
> > +        warn_report("vmnet: packet is too big, %zu > %" PRIu64,
> > +        packet.vm_pkt_size,
> > +        s->max_packet_size);
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
> > +        return -1;
> > +    }
> > +
> > +    if (if_status == VMNET_SUCCESS && pkt_cnt) {
>
> `if_status == VMNET_SUCCESS` is redundant.
>
>
Missed this, thanks.


> Regards,
> Akihiko Odaki
>
> > +        return size;
> > +    }
> > +    return 0;
> > +}
> > +
> > +
> > +void vmnet_cleanup_common(NetClientState *nc)
> > +{
> > +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> > +    dispatch_semaphore_t if_stopped_sem;
> > +
> > +    if (s->vmnet_if == NULL) {
> > +        return;
> > +    }
> > +
> > +    vmnet_interface_set_event_callback(
> > +        s->vmnet_if,
> > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
> > +        NULL,
> > +        NULL);
>
> I don't think this vmnet_interface_set_event_callback call is necessary.
>
>
I kept in mind that vmnet processing lives in a separate thread
and while cleanup it may continue receiving packets. While the
queue is not empty, vmnet_stop_interface hangs. Unregistering
callback ensures that this queue will be emptied asap.

It will work without vmnet_interface_set_event_callback here,
but I think it's better to be respectful to vmnet and clean everything
we can :)

Thank you!

Best Regards,

Vladislav

> +
> > +    qemu_purge_queued_packets(nc);
> > +
> > +    if_stopped_sem = dispatch_semaphore_create(0);
> > +    vmnet_stop_interface(
> > +        s->vmnet_if,
> > +        s->if_queue,
> > +        ^(vmnet_return_t status) {
> > +            assert(status == VMNET_SUCCESS);
> > +            dispatch_semaphore_signal(if_stopped_sem);
> > +        });
> > +    dispatch_semaphore_wait(if_stopped_sem, DISPATCH_TIME_FOREVER);
> > +
> > +    qemu_bh_delete(s->send_bh);
> > +    dispatch_release(if_stopped_sem);
> > +    dispatch_release(s->if_queue);
> > +
> > +    for (int i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
> > +        g_free(s->iov_buf[i].iov_base);
> > +    }
> > +}
> > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
> > index f07afaaf21..2f4eb1db2d 100644
> > --- a/net/vmnet-shared.c
> > +++ b/net/vmnet-shared.c
> > @@ -10,16 +10,103 @@
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
> > +        return -1;
> > +    }
> > +    return vmnet_if_create(nc, build_if_desc(netdev), errp);
> >   }
> > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> > index aac4d5af64..8f3321ef3e 100644
> > --- a/net/vmnet_int.h
> > +++ b/net/vmnet_int.h
> > @@ -15,11 +15,50 @@
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
> > +    uint64_t mtu;
> > +    uint64_t max_packet_size;
> >
> > +    dispatch_queue_t if_queue;
> > +
> > +    QEMUBH *send_bh;
> > +    bool send_enabled;
> > +
> > +    struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
> > +    int packets_send_current_pos;
> > +    int packets_send_end_pos;
> > +
> > +    struct iovec iov_buf[VMNET_PACKETS_LIMIT];
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

--000000000000b21f1005da34abd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thank you, Akihiko</div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 14, 2022 at=
 10:46 PM Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akih=
iko.odaki@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 2022/03/15 4:15, Vladislav Yaroshchuk wrote:<br>
&gt; vmnet.framework supports iov, but writing more than<br>
&gt; one iov into vmnet interface fails with<br>
&gt; &#39;VMNET_INVALID_ARGUMENT&#39;. Collecting provided iovs into<br>
&gt; one and passing it to vmnet works fine. That&#39;s the<br>
&gt; reason why receive_iov() left unimplemented. But it still<br>
&gt; works with good enough performance having .receive()<br>
&gt; implemented only.<br>
&gt; <br>
&gt; Signed-off-by: Phillip Tennen &lt;<a href=3D"mailto:phillip@axleos.com=
" target=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:Vladislav.Ya=
roshchuk@jetbrains.com" target=3D"_blank">Vladislav.Yaroshchuk@jetbrains.co=
m</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0net/vmnet-common.m | 298 +++++++++++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0net/vmnet-shared.c |=C2=A0 95 ++++++++++++++-<br>
&gt;=C2=A0 =C2=A0net/vmnet_int.h=C2=A0 =C2=A0 |=C2=A0 41 ++++++-<br>
&gt;=C2=A0 =C2=A03 files changed, 429 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/net/vmnet-common.m b/net/vmnet-common.m<br>
&gt; index 56612c72ce..20a33d2591 100644<br>
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
&gt; @@ -17,4 +19,300 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &lt;vmnet/vmnet.h&gt;<br>
&gt; +#include &lt;dispatch/dispatch.h&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static bool vmnet_qemu_send_wrapper(VmnetCommonState *s);<br>
<br>
The names of vmnet_qemu_send_wrapper and vmnet_send_bh does not tell <br>
them apart well. Since only vmnet_send_bh does reading, its name may <br>
include &quot;read&quot; to clarify that. &quot;wrapper&quot; in vmnet_qemu=
_send_wrapper may <br>
be also misleading as it does more than just calling the underlying QEMU <b=
r>
facility, but it also updates VmnetCommonState.<br>
<br></blockquote><div><br></div><div>Ok, I&#39;ll think about how to name t=
hem better.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; +<br>
&gt; +<br>
&gt; +static void vmnet_send_completed(NetClientState *nc, ssize_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc,=
 nc);<br>
&gt; +=C2=A0 =C2=A0 /* Complete sending packets left in VmnetCommonState bu=
ffers */<br>
&gt; +=C2=A0 =C2=A0 s-&gt;send_enabled =3D vmnet_qemu_send_wrapper(s);<br>
<br>
It must qemu_bh_schedule(s-&gt;send_bh) after vmnet_qemu_send_wrapper.<br>
<br></blockquote><div><br></div><div>Agree with you, thanks.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Also, send_enabled flag can be removed as explained in:<br>
<a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg873923.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/qemu-d=
evel@nongnu.org/msg873923.html</a><br>
<br></blockquote><div><br></div><div>Not sure about this. Values of packets=
_send_current_pos=C2=A0</div><div>and packets_send_end_pos may be equal, bu=
t QEMU may be<br>not ready to receive new packets - the explanation:</div><=
div>1. We are sending packets to QEMU with qemu_send_packet_async:<br>=C2=
=A0 =C2=A0 packets_send_current_pos =3D 0</div><div>=C2=A0 =C2=A0 packets_s=
end_end_pos =3D 5<br>2. All five packets (0, 1, 2, 3, 4) have been successf=
ully sent to QEMU,<br>=C2=A0 =C2=A0 but qemu_send_packet_async returned 0 &=
quot;no more packets&quot; after<br>=C2=A0 =C2=A0 the last invocation</div>=
<div>3. In spite of this, all five packets are sent and<br>=C2=A0 =C2=A0 pa=
ckets_send_current_pos =3D=3D packets_send_end_pos =3D=3D 5<br>4. It seems =
that &quot;pointers are equal -&gt;=C2=A0 QEMU is ready&quot;, but actually=
 <br>=C2=A0 =C2=A0 it is not.=C2=A0</div><div><br></div><div>Also, hiding Q=
EMU &quot;ready&quot;/&quot;not ready&quot;=C2=A0state behind pointers is a=
 <br>bad choice I think. Having a concrete flag makes this more clear.<br>I=
t provides=C2=A0understandability, not complexity=C2=A0(imho).</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0&gt; send_enabled can be eliminated. When it is enabled, packets_send=
_pos<br>
=C2=A0&gt; and packets_batch_size must be equal. They must not be equal<br>
=C2=A0&gt; otherwise. packets_send_pos must represent the position of the p=
acket<br>
=C2=A0&gt; which is not sent yet, possibly in the process of sending.<br>
=C2=A0&gt; vmnet_send_completed must call qemu_send_wrapper before scheduli=
ng<br>
=C2=A0&gt; send_bh. bh_send should do nothing if s-&gt;packets_send_pos &lt=
;<br>
=C2=A0&gt; s-&gt;packets_batch_size.<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +static bool vmnet_qemu_send_wrapper(VmnetCommonState *s) {<br>
&gt; +=C2=A0 =C2=A0 ssize_t size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Packets to send lay in [current_pos..end_pos)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0* (including current_pos, excluding end_pos)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 while (s-&gt;packets_send_current_pos &lt; s-&gt;packet=
s_send_end_pos) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D qemu_send_packet_async(&amp;s-&g=
t;nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;iov_b=
uf[s-&gt;packets_send_current_pos].iov_base,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;packe=
ts_buf[s-&gt;packets_send_current_pos].vm_pkt_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_send_=
completed);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++s-&gt;packets_send_current_pos;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* QEMU is not ready - wait=
 for completion callback call */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +static void vmnet_send_bh(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 NetClientState *nc =3D (NetClientState *) opaque;<br>
&gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc,=
 nc);<br>
&gt; +=C2=A0 =C2=A0 struct vmpktdesc *packets =3D s-&gt;packets_buf;<br>
&gt; +=C2=A0 =C2=A0 vmnet_return_t status;<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Do nothing if QEMU is not ready - wait<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* for completion callback invocation<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (!s-&gt;send_enabled) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Read as many packets as present */<br>
&gt; +=C2=A0 =C2=A0 s-&gt;packets_send_current_pos =3D 0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;packets_send_end_pos =3D VMNET_PACKETS_LIMIT;<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; s-&gt;packets_send_end_pos; ++i) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_pkt_size =3D s-&gt;max_pack=
et_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_pkt_iovcnt =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packets[i].vm_flags =3D 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 status =3D vmnet_read(s-&gt;vmnet_if, packets, &amp;s-&=
gt;packets_send_end_pos);<br>
&gt; +=C2=A0 =C2=A0 if (status !=3D VMNET_SUCCESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&quot;vmnet: read failed: %s=
\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0vmnet_status_map_str(status));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;packets_send_current_pos =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;packets_send_end_pos =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Send packets to QEMU */<br>
&gt; +=C2=A0 =C2=A0 s-&gt;send_enabled =3D vmnet_qemu_send_wrapper(s);<br>
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
 nc);<br>
&gt; +=C2=A0 =C2=A0 dispatch_semaphore_t if_created_sem =3D dispatch_semaph=
ore_create(0);<br>
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
&gt; +<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_release(s-&gt;if_queue);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_release(if_created_sem);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;unable to create interface with requested params&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_F=
OREVER);<br>
&gt; +=C2=A0 =C2=A0 dispatch_release(if_created_sem);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (if_status !=3D VMNET_SUCCESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_release(s-&gt;if_queue);<br>
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
&gt; +=C2=A0 =C2=A0 s-&gt;send_enabled =3D true;<br>
&gt; +=C2=A0 =C2=A0 vmnet_bufs_init(s);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 vmnet_interface_set_event_callback(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;vmnet_if,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_INTERFACE_PACKETS_AVAILABLE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;if_queue,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(interface_event_t event_id, xpc_object_=
t event) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(event_id =3D=3D VMNE=
T_INTERFACE_PACKETS_AVAILABLE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* This function is be=
ing called from a non qemu thread, so<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we only schedule a =
BH, and do the rest of the io completion<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* handling from vmnet=
_send_bh() which runs in a qemu context.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_bh_schedule(s-&gt;send=
_bh);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt; +<br>
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
g, %zu &gt; %&quot; PRIu64,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packet.vm_pkt_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;max_packet_size);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (if_status =3D=3D VMNET_SUCCESS &amp;&amp; pkt_cnt) =
{<br>
<br>
`if_status =3D=3D VMNET_SUCCESS` is redundant.<br>
<br></blockquote><div><br></div><div>Missed this, thanks.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
Regards,<br>
Akihiko Odaki<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return size;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +void vmnet_cleanup_common(NetClientState *nc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, nc,=
 nc);<br>
&gt; +=C2=A0 =C2=A0 dispatch_semaphore_t if_stopped_sem;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;vmnet_if =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 vmnet_interface_set_event_callback(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;vmnet_if,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_INTERFACE_PACKETS_AVAILABLE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);<br>
<br>
I don&#39;t think this vmnet_interface_set_event_callback call is necessary=
.<br>
<br></blockquote><div><br></div><div>I kept in mind that vmnet processing l=
ives in a separate thread<br>and while cleanup it may continue receiving pa=
ckets. While the<br>queue is not empty, vmnet_stop_interface hangs. Unregis=
tering<br>callback ensures that this queue will be emptied asap.<br><br>It =
will work without vmnet_interface_set_event_callback here,</div><div>but I =
think it&#39;s better to be respectful to vmnet and clean everything<br>we =
can :)=C2=A0=C2=A0</div><div>=C2=A0</div><div>Thank you!<br><br>Best Regard=
s,<br><br>Vladislav<br><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_purge_queued_packets(nc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if_stopped_sem =3D dispatch_semaphore_create(0);<br>
&gt; +=C2=A0 =C2=A0 vmnet_stop_interface(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;vmnet_if,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;if_queue,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(vmnet_return_t status) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(status =3D=3D VMNET_=
SUCCESS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_semaphore_signal(i=
f_stopped_sem);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt; +=C2=A0 =C2=A0 dispatch_semaphore_wait(if_stopped_sem, DISPATCH_TIME_F=
OREVER);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_bh_delete(s-&gt;send_bh);<br>
&gt; +=C2=A0 =C2=A0 dispatch_release(if_stopped_sem);<br>
&gt; +=C2=A0 =C2=A0 dispatch_release(s-&gt;if_queue);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (int i =3D 0; i &lt; VMNET_PACKETS_LIMIT; ++i) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(s-&gt;iov_buf[i].iov_base);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c<br>
&gt; index f07afaaf21..2f4eb1db2d 100644<br>
&gt; --- a/net/vmnet-shared.c<br>
&gt; +++ b/net/vmnet-shared.c<br>
&gt; @@ -10,16 +10,103 @@<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return vmnet_if_create(nc, build_if_desc(netdev), errp)=
;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; diff --git a/net/vmnet_int.h b/net/vmnet_int.h<br>
&gt; index aac4d5af64..8f3321ef3e 100644<br>
&gt; --- a/net/vmnet_int.h<br>
&gt; +++ b/net/vmnet_int.h<br>
&gt; @@ -15,11 +15,50 @@<br>
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
&gt; +=C2=A0 =C2=A0 uint64_t mtu;<br>
&gt; +=C2=A0 =C2=A0 uint64_t max_packet_size;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 dispatch_queue_t if_queue;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 QEMUBH *send_bh;<br>
&gt; +=C2=A0 =C2=A0 bool send_enabled;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];<br>
&gt; +=C2=A0 =C2=A0 int packets_send_current_pos;<br>
&gt; +=C2=A0 =C2=A0 int packets_send_end_pos;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 struct iovec iov_buf[VMNET_PACKETS_LIMIT];<br>
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
<br>
</blockquote></div></div>

--000000000000b21f1005da34abd4--

