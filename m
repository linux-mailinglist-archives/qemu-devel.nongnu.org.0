Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471784DA3D1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 21:16:46 +0100 (CET)
Received: from localhost ([::1]:58588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUDb3-0005Rs-4D
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 16:16:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDZZ-0004Cn-PQ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:15:13 -0400
Received: from [2607:f8b0:4864:20::1134] (port=33673
 helo=mail-yw1-x1134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDZW-00047Q-94
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:15:13 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2dbd8777564so1398207b3.0
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 13:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cUMoQVSlH31RQN6KtFJh50Ig3MZxZce7v8//SIIJKkc=;
 b=MDHlnOgTp82YC1bVMHDRhNrWIoDq/HJYcpj0o1ezFk2mouOQKB5dynRdYqPjKalY4o
 HEBrppxpge7bhRxHZG59/JNF6WGjT29ZETlGJ/gEF1ZRClUN6hz6KJ0UiIdzYi0YSv6y
 1W7Y2sl8cueR7B5h8yFZJq0utg+WFq5ut4YcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cUMoQVSlH31RQN6KtFJh50Ig3MZxZce7v8//SIIJKkc=;
 b=SKeOd0JphyK0Sm73T+zlt8ymIVl5rccc5W5ntOAQuY4MT6yOjHc0xjSEPlT0zultJD
 vOXc6FZ0J04Nk6vLd0d8/d9te9jZjhWe2Jg6MNdII3tnozu06MXE9LAxEi/mQOIYW/h8
 L5lrIrBLszFkjJfUZ4uJqe5JVe9U5mV9IJm2J454Os1YnGQzQ/QGBpbmSdWQ9Dp+5ROk
 1enu1iXZX1uhuwH2Fj6UMP7cIaW19G8jaQaaAy5G20QrGzpuo0ga11FUVNuyO8KhA7DK
 jxVGv6V2IaILJecsu2Effh/OKbUrlNLyXvRmw/vp08hf8VOoV4OaxU1bx2gQhG0PqtUM
 uo4w==
X-Gm-Message-State: AOAM5309wLZSgNJKx7kSy9wy1jPD3qexVnF4Ai/6ppb2i/XHAa/gneNr
 JtLUQvUqsTdlXKLG6+PIM6kXkG0Y7bC0oQ0b/xRshw==
X-Google-Smtp-Source: ABdhPJwpl91uASNTlTmURj3mgDC1sklBI28xzcgUo2jbmlIDsaFuDCxTCXG8B6gyXWyNCtol7RmpzSYAA2XuGCW/5hY=
X-Received: by 2002:a81:6dce:0:b0:2dc:217b:807 with SMTP id
 i197-20020a816dce000000b002dc217b0807mr26872861ywc.17.1647375309080; Tue, 15
 Mar 2022 13:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220315195914.12107-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220315195914.12107-4-Vladislav.Yaroshchuk@jetbrains.com>
 <0b7af74a-92be-f7e7-0131-117c346b7f60@gmail.com>
In-Reply-To: <0b7af74a-92be-f7e7-0131-117c346b7f60@gmail.com>
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Date: Tue, 15 Mar 2022 23:14:58 +0300
Message-ID: <CAGmdLqQjFkS_stGUi1-sL5SRokKqieuY2eLKGcG9HHwLF6abVQ@mail.gmail.com>
Subject: Re: [PATCH v18 3/7] net/vmnet: implement shared mode (vmnet-shared)
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
Content-Type: multipart/alternative; boundary="0000000000001c331105da477480"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-yw1-x1134.google.com
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

--0000000000001c331105da477480
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 15, 2022 at 11:07 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/03/16 4:59, Vladislav Yaroshchuk wrote:
> > Interaction with vmnet.framework in different modes
> > differs only on configuration stage, so we can create
> > common `send`, `receive`, etc. procedures and reuse them.
> >
> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
> > Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
> > ---
> >   net/vmnet-common.m | 368 +++++++++++++++++++++++++++++++++++++++++++++
> >   net/vmnet-shared.c |  90 ++++++++++-
> >   net/vmnet_int.h    |  40 ++++-
> >   3 files changed, 493 insertions(+), 5 deletions(-)
> >
> > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> > index 06326efb1c..b9dac7b241 100644
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
> > @@ -17,4 +19,370 @@
> >   #include "qapi/error.h"
> >
> >   #include <vmnet/vmnet.h>
> > +#include <dispatch/dispatch.h>
> >
> > +
>

[...]


> > +/**
> > + * Bottom half callback that transfers packets from vmnet interface
> > + * to QEMU.
> > + *
> > + * The process of transferring packets is three-staged:
> > + * 1. Handle vmnet event;
> > + * 2. Read packets from vmnet interface into temporary buffer;
> > + * 3. Write packets from temporary buffer to QEMU.
> > + *
> > + * QEMU may suspend this process on the last stage, returning 0 from
> > + * qemu_send_packet_async function. If this happens, we should
> > + * respectfully wait until it is ready to consume more packets,
> > + * write left ones in temporary buffer and only after this
> > + * continue reading more packets from vmnet interface.
> > + *
> > + * Packets to be transferred are stored into packets_buf,
> > + * in the window (packets_send_current_pos..packets_send_end_pos]
> > + * excluding current_pos, including end_pos.
>
> I wonder why you changed the window from [packets_send_current_pos,
> packets_send_end_pos). It is an unconventional way to represent such
> kind of window, requires signed integers and calculating
> packets_send_current_pos + 1 before operating with the first item of the
> window.
>
>
Did this mistakenly while removing send_enabled :facepalm:
Sorry for this.

Submitting v19 with this fixed.

Best Regards,
Vladislav Yaroshchuk



> Regards,
> Akihiko Odaki
>
> + *
> > + * Thus, if QEMU is not ready, buffer is not read and
> > + * packets_send_current_pos < packets_send_end_pos.
> > + */
> > +static void vmnet_send_bh(void *opaque)
> > +{
> > +    NetClientState *nc = (NetClientState *) opaque;
> > +    VmnetState *s = DO_UPCAST(VmnetState, nc, nc);
> > +
> > +    /*
> > +     * Do nothing if QEMU is not ready - wait
> > +     * for completion callback invocation
> > +     */
> > +    if (s->packets_send_current_pos < s->packets_send_end_pos) {
> > +        return;
> > +    }
> > +
> > +    /* Read packets from vmnet interface */
> > +    if (vmnet_read_packets(s) > 0) {
> > +        /* Send them to QEMU */
> > +        vmnet_write_packets_to_qemu(s);
> > +    }
> > +}
> > +
> > +
> > +/**
> > + * Completion callback to be invoked by QEMU when it becomes
> > + * ready to consume more packets.
> > + */
> > +static void vmnet_send_completed(NetClientState *nc, ssize_t len)
> > +{
> > +    VmnetState *s = DO_UPCAST(VmnetState, nc, nc);
> > +
> > +    /* Callback is invoked eq queued packet is sent */
> > +    ++s->packets_send_current_pos;
> > +
> > +    /* Complete sending packets left in VmnetState buffers */
> > +    vmnet_write_packets_to_qemu(s);
> > +
> > +    /* And read new ones from vmnet if VmnetState buffer is ready */
> > +    if (s->packets_send_current_pos < s->packets_send_end_pos) {
> > +        qemu_bh_schedule(s->send_bh);
> > +    }
> > +}
> > +
> > +
> > +static void vmnet_bufs_init(VmnetState *s)
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
> > +int vmnet_if_create(NetClientState *nc,
> > +                    xpc_object_t if_desc,
> > +                    Error **errp)
> > +{
> > +    VmnetState *s = DO_UPCAST(VmnetState, nc, nc);
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
> > +    vmnet_bufs_init(s);
> > +
> > +    s->packets_send_current_pos = -1;
> > +    s->packets_send_end_pos = -1;
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
> > +void vmnet_cleanup_common(NetClientState *nc)
> > +{
> > +    VmnetState *s = DO_UPCAST(VmnetState, nc, nc);
> > +    dispatch_semaphore_t if_stopped_sem;
> > +
> > +    if (s->vmnet_if == NULL) {
> > +        return;
> > +    }
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
> > +    qemu_purge_queued_packets(nc);
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
> > index 6dfb133a18..2ce2323bdb 100644
> > --- a/net/vmnet-shared.c
> > +++ b/net/vmnet-shared.c
> > @@ -10,16 +10,98 @@
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
> > +    .size = sizeof(VmnetState),
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
> > +        return -1;
> > +    }
> > +    return vmnet_if_create(nc, build_if_desc(netdev), errp);
> >   }
> > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> > index c383038a1d..adf6e8c20d 100644
> > --- a/net/vmnet_int.h
> > +++ b/net/vmnet_int.h
> > @@ -15,11 +15,49 @@
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
> >   typedef struct VmnetState {
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
> > +
> > +    struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
> > +    int packets_send_current_pos;
> > +    int packets_send_end_pos;
> > +
> > +    struct iovec iov_buf[VMNET_PACKETS_LIMIT];
> >   } VmnetState;
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

--0000000000001c331105da477480
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 15, 2022 at 11:07 PM Akih=
iko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 2022/03/16 4:59, Vladislav Yaroshchuk wrote:<br>
&gt; Interaction with vmnet.framework in different modes<br>
&gt; differs only on configuration stage, so we can create<br>
&gt; common `send`, `receive`, etc. procedures and reuse them.<br>
&gt; <br>
&gt; Signed-off-by: Phillip Tennen &lt;<a href=3D"mailto:phillip@axleos.com=
" target=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:Vladislav.Ya=
roshchuk@jetbrains.com" target=3D"_blank">Vladislav.Yaroshchuk@jetbrains.co=
m</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0net/vmnet-common.m | 368 +++++++++++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0net/vmnet-shared.c |=C2=A0 90 ++++++++++-<br>
&gt;=C2=A0 =C2=A0net/vmnet_int.h=C2=A0 =C2=A0 |=C2=A0 40 ++++-<br>
&gt;=C2=A0 =C2=A03 files changed, 493 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/net/vmnet-common.m b/net/vmnet-common.m<br>
&gt; index 06326efb1c..b9dac7b241 100644<br>
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
&gt; @@ -17,4 +19,370 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &lt;vmnet/vmnet.h&gt;<br>
&gt; +#include &lt;dispatch/dispatch.h&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +<br></blockquote><div><br></div><div>[...]</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +/**<br>
&gt; + * Bottom half callback that transfers packets from vmnet interface<b=
r>
&gt; + * to QEMU.<br>
&gt; + *<br>
&gt; + * The process of transferring packets is three-staged:<br>
&gt; + * 1. Handle vmnet event;<br>
&gt; + * 2. Read packets from vmnet interface into temporary buffer;<br>
&gt; + * 3. Write packets from temporary buffer to QEMU.<br>
&gt; + *<br>
&gt; + * QEMU may suspend this process on the last stage, returning 0 from<=
br>
&gt; + * qemu_send_packet_async function. If this happens, we should<br>
&gt; + * respectfully wait until it is ready to consume more packets,<br>
&gt; + * write left ones in temporary buffer and only after this<br>
&gt; + * continue reading more packets from vmnet interface.<br>
&gt; + *<br>
&gt; + * Packets to be transferred are stored into packets_buf,<br>
&gt; + * in the window (packets_send_current_pos..packets_send_end_pos]<br>
&gt; + * excluding current_pos, including end_pos.<br>
<br>
I wonder why you changed the window from [packets_send_current_pos, <br>
packets_send_end_pos). It is an unconventional way to represent such <br>
kind of window, requires signed integers and calculating <br>
packets_send_current_pos + 1 before operating with the first item of the <b=
r>
window.<br>
<br></blockquote><div><br></div><div>Did this mistakenly while removing sen=
d_enabled :facepalm:<br>Sorry for this.</div><div><br></div><div>Submitting=
 v19 with this fixed.</div><div><br></div><div>Best Regards,</div><div>Vlad=
islav Yaroshchuk</div><div><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
Regards,<br>
Akihiko Odaki=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; + *<br>
&gt; + * Thus, if QEMU is not ready, buffer is not read and<br>
&gt; + * packets_send_current_pos &lt; packets_send_end_pos.<br>
&gt; + */<br>
&gt; +static void vmnet_send_bh(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 NetClientState *nc =3D (NetClientState *) opaque;<br>
&gt; +=C2=A0 =C2=A0 VmnetState *s =3D DO_UPCAST(VmnetState, nc, nc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Do nothing if QEMU is not ready - wait<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* for completion callback invocation<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;packets_send_current_pos &lt; s-&gt;packets_s=
end_end_pos) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Read packets from vmnet interface */<br>
&gt; +=C2=A0 =C2=A0 if (vmnet_read_packets(s) &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Send them to QEMU */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_write_packets_to_qemu(s);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * Completion callback to be invoked by QEMU when it becomes<br>
&gt; + * ready to consume more packets.<br>
&gt; + */<br>
&gt; +static void vmnet_send_completed(NetClientState *nc, ssize_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VmnetState *s =3D DO_UPCAST(VmnetState, nc, nc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Callback is invoked eq queued packet is sent */<br>
&gt; +=C2=A0 =C2=A0 ++s-&gt;packets_send_current_pos;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Complete sending packets left in VmnetState buffers =
*/<br>
&gt; +=C2=A0 =C2=A0 vmnet_write_packets_to_qemu(s);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* And read new ones from vmnet if VmnetState buffer is=
 ready */<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;packets_send_current_pos &lt; s-&gt;packets_s=
end_end_pos) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_bh_schedule(s-&gt;send_bh);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +static void vmnet_bufs_init(VmnetState *s)<br>
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
&gt; +int vmnet_if_create(NetClientState *nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 xpc_object_t if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VmnetState *s =3D DO_UPCAST(VmnetState, nc, nc);<br>
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
&gt; +=C2=A0 =C2=A0 vmnet_bufs_init(s);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;packets_send_current_pos =3D -1;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;packets_send_end_pos =3D -1;<br>
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
&gt; +void vmnet_cleanup_common(NetClientState *nc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VmnetState *s =3D DO_UPCAST(VmnetState, nc, nc);<br>
&gt; +=C2=A0 =C2=A0 dispatch_semaphore_t if_stopped_sem;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;vmnet_if =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
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
&gt; +=C2=A0 =C2=A0 qemu_purge_queued_packets(nc);<br>
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
&gt; index 6dfb133a18..2ce2323bdb 100644<br>
&gt; --- a/net/vmnet-shared.c<br>
&gt; +++ b/net/vmnet-shared.c<br>
&gt; @@ -10,16 +10,98 @@<br>
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
&gt; +=C2=A0 =C2=A0 .size =3D sizeof(VmnetState),<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return vmnet_if_create(nc, build_if_desc(netdev), errp)=
;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; diff --git a/net/vmnet_int.h b/net/vmnet_int.h<br>
&gt; index c383038a1d..adf6e8c20d 100644<br>
&gt; --- a/net/vmnet_int.h<br>
&gt; +++ b/net/vmnet_int.h<br>
&gt; @@ -15,11 +15,49 @@<br>
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
&gt;=C2=A0 =C2=A0typedef struct VmnetState {<br>
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
&gt; +<br>
&gt; +=C2=A0 =C2=A0 struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];<br>
&gt; +=C2=A0 =C2=A0 int packets_send_current_pos;<br>
&gt; +=C2=A0 =C2=A0 int packets_send_end_pos;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 struct iovec iov_buf[VMNET_PACKETS_LIMIT];<br>
&gt;=C2=A0 =C2=A0} VmnetState;<br>
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

--0000000000001c331105da477480--

