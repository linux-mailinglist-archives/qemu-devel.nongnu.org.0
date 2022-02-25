Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2394C4D3F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:06:13 +0100 (CET)
Received: from localhost ([::1]:42154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeyq-0003og-K9
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:06:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNefY-0007L0-Pw
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:46:17 -0500
Received: from [2607:f8b0:4864:20::1029] (port=52054
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNefV-0004z1-Rj
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:46:16 -0500
Received: by mail-pj1-x1029.google.com with SMTP id d15so2056546pjg.1
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=F27l6p+76CT+6Q8orfOf9bN4zrk23sbGMhZB+tCWNOg=;
 b=hP9E70GDHPHb5WwmhlxNipFbWgglrNXf1fD81DUZekeQzWw9BTcavP76GBHEyvnSbi
 0sc+1Ma35FzCsby0rV42XKmjUowjWBVT8lcaF1q4HHaGpaMgm8H2sOumwf2Qb8FW2qe5
 3uETkxnK0Tf1uUjI5sPZQ9aSCsPkuqN6U05xLALbRAcisYV1Zg2p8uhyFGGqibAbZ5t3
 WA9Vi/dwe2t1PAPx06Yk2B7XxCdDAohNI0vYJWPc46Cj8peSgOcBSew92A9R0jI/3B8s
 pvuXGYmyLCEvAQVdt9JxiHJRlgB6RfL9tC9n/aHPx/vBLnSRmbjRNhpQ0oLXCIRtm/dF
 Pu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F27l6p+76CT+6Q8orfOf9bN4zrk23sbGMhZB+tCWNOg=;
 b=JYs3x2x+UBbWZwm5H0kRwQl6MnP1NgllZIxsoS0XTXOA9ZjVDCNBPhXy3oMINgslYp
 0ZA6KCAcjCvjbN4Gnca1GegG96LT1Ek5DOsZr10I0CMKafOA57v2N5ScA4PmJPFgX2gQ
 Z73DwVGckGMbhQmFebCRCPj2La4P1Io+yvDwjlvEIlWC17aYx7X6SahJXuyVB4WIRv4c
 GDiz+FNMFJ9HTA1/VYIX8fmFcvBKbBMZXRTd5ullfqIOogA6lXhcBk+nc6cZgWwO/giW
 xGrI6ok6ul0VVruIDLJ3AqMmhTr+vyB7Lj3WAOcutif2Wu1nq60D4V0FT3xkRGulSdD4
 BZrQ==
X-Gm-Message-State: AOAM530Oq710eHBZHTjV6Vn04P/BkitcxEc1qwgnq0krbKwoPzLr5d1z
 lv1Nxg6n1Ac048RLW6q9JMI=
X-Google-Smtp-Source: ABdhPJw5Shfo4pwW6YC8V7rOLoYlAkJhsRKDLJdKZzdoEqebWAwydIBjLU8tDXMXjzB5TBfcmFTzdA==
X-Received: by 2002:a17:90a:5291:b0:1bb:ef4d:947d with SMTP id
 w17-20020a17090a529100b001bbef4d947dmr4191549pjh.243.1645811172195; 
 Fri, 25 Feb 2022 09:46:12 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a056a00194b00b004e1131f86d2sm4159682pfk.8.2022.02.25.09.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 09:46:11 -0800 (PST)
Message-ID: <50a27646-ce9c-c702-965f-46b602be9220@gmail.com>
Date: Sat, 26 Feb 2022 02:46:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v15 3/8] net/vmnet: implement shared mode (vmnet-shared)
Content-Language: en-US
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>,
 qemu-devel@nongnu.org
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220225171402.64861-4-Vladislav.Yaroshchuk@jetbrains.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220225171402.64861-4-Vladislav.Yaroshchuk@jetbrains.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1029.google.com
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, dirty@apple.com, f4bug@amsat.org,
 r.bolshakov@yadro.com, agraf@csgraf.de, phillip@axleos.com, roman@roolebo.dev,
 hsp.cat7@gmail.com, hello@adns.io, qemu_oss@crudebyte.com, eblake@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/02/26 2:13, Vladislav Yaroshchuk wrote:
> Interaction with vmnet.framework in different modes
> differs only on configuration stage, so we can create
> common `send`, `receive`, etc. procedures and reuse them.
> 
> vmnet.framework supports iov, but writing more than
> one iov into vmnet interface fails with
> 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> one and passing it to vmnet works fine. That's the
> reason why receive_iov() left unimplemented. But it still
> works with good enough performance having .receive()
> net/vmnet: implement shared mode (vmnet-shared)
> 
> Interaction with vmnet.framework in different modes
> differs only on configuration stage, so we can create
> common `send`, `receive`, etc. procedures and reuse them.
> 
> vmnet.framework supports iov, but writing more than
> one iov into vmnet interface fails with
> 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> one and passing it to vmnet works fine. That's the
> reason why receive_iov() left unimplemented. But it still
> works with good enough performance having .receive()
> implemented only.
> 
> Also, there is no way to unsubscribe from vmnet packages
> receiving except registering and unregistering event
> callback or simply drop packages just ignoring and
> not processing them when related flag is set. Here we do
> using the second way.
> 
> Signed-off-by: Phillip Tennen <phillip@axleos.com>
> Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>

Thank you for persistently working on this.

> ---
>   net/vmnet-common.m | 302 +++++++++++++++++++++++++++++++++++++++++++++
>   net/vmnet-shared.c |  94 +++++++++++++-
>   net/vmnet_int.h    |  39 +++++-
>   3 files changed, 430 insertions(+), 5 deletions(-)
> 
> diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> index 56612c72ce..2f70921cae 100644
> --- a/net/vmnet-common.m
> +++ b/net/vmnet-common.m
> @@ -10,6 +10,8 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/log.h"
>   #include "qapi/qapi-types-net.h"
>   #include "vmnet_int.h"
>   #include "clients.h"
> @@ -17,4 +19,304 @@
>   #include "qapi/error.h"
>   
>   #include <vmnet/vmnet.h>
> +#include <dispatch/dispatch.h>
>   
> +
> +static inline void vmnet_set_send_bh_scheduled(VmnetCommonState *s,
> +                                               bool enable)
> +{
> +    qatomic_set(&s->send_scheduled, enable);
> +}
> +
> +
> +static inline bool vmnet_is_send_bh_scheduled(VmnetCommonState *s)
> +{
> +    return qatomic_load_acquire(&s->send_scheduled);
> +}
> +
> +
> +static inline void vmnet_set_send_enabled(VmnetCommonState *s,
> +                                          bool enable)
> +{
> +    if (enable) {
> +        vmnet_interface_set_event_callback(
> +            s->vmnet_if,
> +            VMNET_INTERFACE_PACKETS_AVAILABLE,
> +            s->if_queue,
> +            ^(interface_event_t event_id, xpc_object_t event) {
> +                assert(event_id == VMNET_INTERFACE_PACKETS_AVAILABLE);
> +                /*
> +                 * This function is being called from a non qemu thread, so
> +                 * we only schedule a BH, and do the rest of the io completion
> +                 * handling from vmnet_send_bh() which runs in a qemu context.
> +                 *
> +                 * Avoid scheduling multiple bottom halves
> +                 */
> +                if (!vmnet_is_send_bh_scheduled(s)) {
> +                    vmnet_set_send_bh_scheduled(s, true);

It can be interrupted between vmnet_is_send_bh_scheduled and 
vmnet_set_send_bh_scheduled, which leads to data race.

> +                    qemu_bh_schedule(s->send_bh);
> +                }
> +            });
> +    } else {
> +        vmnet_interface_set_event_callback(
> +            s->vmnet_if,
> +            VMNET_INTERFACE_PACKETS_AVAILABLE,
> +            NULL,
> +            NULL);
> +    }
> +}
> +
> +
> +static void vmnet_send_completed(NetClientState *nc, ssize_t len)
> +{
> +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> +    vmnet_set_send_enabled(s, true);
> +}
> +
> +
> +static void vmnet_send_bh(void *opaque)
> +{
> +    NetClientState *nc = (NetClientState *) opaque;
> +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> +
> +    struct iovec *iov = s->iov_buf;
> +    struct vmpktdesc *packets = s->packets_buf;
> +    int pkt_cnt;
> +    int i;
> +
> +    vmnet_return_t status;
> +    ssize_t size;
> +
> +    /* read as many packets as present */
> +    pkt_cnt = VMNET_PACKETS_LIMIT;

There could be more than VMNET_PACKETS_LIMIT. You may call vmnet_read in 
a loop.

> +    for (i = 0; i < pkt_cnt; ++i) {
> +        packets[i].vm_pkt_size = s->max_packet_size;
> +        packets[i].vm_pkt_iovcnt = 1;
> +        packets[i].vm_flags = 0;
> +    }
> +
> +    status = vmnet_read(s->vmnet_if, packets, &pkt_cnt);
> +    if (status != VMNET_SUCCESS) {
> +        error_printf("vmnet: read failed: %s\n",
> +                     vmnet_status_map_str(status));
> +        goto done;
> +    }
> +
> +    for (i = 0; i < pkt_cnt; ++i) {
> +        size = qemu_send_packet_async(nc,
> +                                      iov[i].iov_base,
> +                                      packets[i].vm_pkt_size,
> +                                      vmnet_send_completed);
> +        if (size == 0) {
> +            vmnet_set_send_enabled(s, false);
> +            goto done;
> +        } else if (size < 0) {
> +            break;
> +        }

goto is not needed here. "break" when size <= 0.

> +    }
> +
> +done:
> +    vmnet_set_send_bh_scheduled(s, false);
> +}
> +
> +
> +static void vmnet_bufs_init(VmnetCommonState *s)
> +{
> +    struct vmpktdesc *packets = s->packets_buf;
> +    struct iovec *iov = s->iov_buf;
> +    int i;
> +
> +    for (i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
> +        iov[i].iov_len = s->max_packet_size;
> +        iov[i].iov_base = g_malloc0(iov[i].iov_len);
> +        packets[i].vm_pkt_iov = iov + i;
> +    }
> +}
> +
> +
> +const char *vmnet_status_map_str(vmnet_return_t status)
> +{
> +    switch (status) {
> +    case VMNET_SUCCESS:
> +        return "success";
> +    case VMNET_FAILURE:
> +        return "general failure (possibly not enough privileges)";
> +    case VMNET_MEM_FAILURE:
> +        return "memory allocation failure";
> +    case VMNET_INVALID_ARGUMENT:
> +        return "invalid argument specified";
> +    case VMNET_SETUP_INCOMPLETE:
> +        return "interface setup is not complete";
> +    case VMNET_INVALID_ACCESS:
> +        return "invalid access, permission denied";
> +    case VMNET_PACKET_TOO_BIG:
> +        return "packet size is larger than MTU";
> +    case VMNET_BUFFER_EXHAUSTED:
> +        return "buffers exhausted in kernel";
> +    case VMNET_TOO_MANY_PACKETS:
> +        return "packet count exceeds limit";
> +#if defined(MAC_OS_VERSION_11_0) && \
> +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
> +    case VMNET_SHARING_SERVICE_BUSY:
> +        return "conflict, sharing service is in use";
> +#endif
> +    default:
> +        return "unknown vmnet error";
> +    }
> +}
> +
> +
> +int vmnet_if_create(NetClientState *nc,
> +                    xpc_object_t if_desc,
> +                    Error **errp)
> +{
> +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);;

Duplicate semicolons.

> +    dispatch_semaphore_t if_created_sem = dispatch_semaphore_create(0);

if_created_sem leaks.

> +    __block vmnet_return_t if_status;
> +
> +    s->if_queue = dispatch_queue_create(
> +        "org.qemu.vmnet.if_queue",
> +        DISPATCH_QUEUE_SERIAL
> +    );
> +
> +    xpc_dictionary_set_bool(
> +        if_desc,
> +        vmnet_allocate_mac_address_key,
> +        false
> +    );
> +#ifdef DEBUG
> +    qemu_log("vmnet.start.interface_desc:\n");
> +    xpc_dictionary_apply(if_desc,
> +                         ^bool(const char *k, xpc_object_t v) {
> +                             char *desc = xpc_copy_description(v);
> +                             qemu_log("  %s=%s\n", k, desc);
> +                             free(desc);
> +                             return true;
> +                         });
> +#endif /* DEBUG */
> +
> +    s->vmnet_if = vmnet_start_interface(
> +        if_desc,
> +        s->if_queue,
> +        ^(vmnet_return_t status, xpc_object_t interface_param) {
> +            if_status = status;
> +            if (status != VMNET_SUCCESS || !interface_param) {
> +                dispatch_semaphore_signal(if_created_sem);
> +                return;
> +            }
> +
> +#ifdef DEBUG
> +            qemu_log("vmnet.start.interface_param:\n");
> +            xpc_dictionary_apply(interface_param,
> +                                 ^bool(const char *k, xpc_object_t v) {
> +                                     char *desc = xpc_copy_description(v);
> +                                     qemu_log("  %s=%s\n", k, desc);
> +                                     free(desc);
> +                                     return true;
> +                                 });
> +#endif /* DEBUG */
> +
> +            s->mtu = xpc_dictionary_get_uint64(
> +                interface_param,
> +                vmnet_mtu_key);
> +            s->max_packet_size = xpc_dictionary_get_uint64(
> +                interface_param,
> +                vmnet_max_packet_size_key);
> +
> +            dispatch_semaphore_signal(if_created_sem);
> +        });
> +
> +    if (s->vmnet_if == NULL) {
> +        error_setg(errp,
> +                   "unable to create interface "
> +                   "with requested params");

You don't need line breaks here. Breaking a string into a few would also 
makes it a bit hard to grep.

> +        return -1;

s->if_queue leaks.

> +    }
> +
> +    dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_FOREVER);
> +
> +    if (if_status != VMNET_SUCCESS) {
> +        error_setg(errp,
> +                   "cannot create vmnet interface: %s",
> +                   vmnet_status_map_str(if_status));
> +        return -1;
> +    }
> +
> +    s->send_bh = aio_bh_new(qemu_get_aio_context(), vmnet_send_bh, nc);
> +    vmnet_bufs_init(s);
> +    vmnet_set_send_bh_scheduled(s, false);
> +    vmnet_set_send_enabled(s, true);
> +    return 0;
> +}
> +
> +
> +ssize_t vmnet_receive_common(NetClientState *nc,
> +                             const uint8_t *buf,
> +                             size_t size)
> +{
> +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
> +    struct vmpktdesc packet;
> +    struct iovec iov;
> +    int pkt_cnt;
> +    vmnet_return_t if_status;
> +
> +    if (size > s->max_packet_size) {
> +        warn_report("vmnet: packet is too big, %zu > %llu\n",

Use PRIu64.

> +                    packet.vm_pkt_size,
> +                    s->max_packet_size);
> +        return -1;
> +    }
> +
> +    iov.iov_base = (char *) buf;
> +    iov.iov_len = size;
> +
> +    packet.vm_pkt_iovcnt = 1;
> +    packet.vm_flags = 0;
> +    packet.vm_pkt_size = size;
> +    packet.vm_pkt_iov = &iov;
> +    pkt_cnt = 1;
> +
> +    if_status = vmnet_write(s->vmnet_if, &packet, &pkt_cnt);
> +    if (if_status != VMNET_SUCCESS) {
> +        error_report("vmnet: write error: %s\n",
> +                     vmnet_status_map_str(if_status));

Why don't return -1?

> +    }
> +
> +    if (if_status == VMNET_SUCCESS && pkt_cnt) {
> +        return size;
> +    }
> +    return 0;
> +}
> +
> +
> +void vmnet_cleanup_common(NetClientState *nc)
> +{
> +    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);;

Duplicate semicolons.

> +    dispatch_semaphore_t if_created_sem;
> +
> +    qemu_purge_queued_packets(nc); > +    vmnet_set_send_bh_scheduled(s, true);
> +    vmnet_set_send_enabled(s, false);
> +
> +    if (s->vmnet_if == NULL) {
> +        return;
> +    }
> +
> +    if_created_sem = dispatch_semaphore_create(0);
> +    vmnet_stop_interface(
> +        s->vmnet_if,
> +        s->if_queue,
> +        ^(vmnet_return_t status) {
> +            assert(status == VMNET_SUCCESS);
> +            dispatch_semaphore_signal(if_created_sem);
> +        });
> +    dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_FOREVER);
> +
> +    qemu_bh_delete(s->send_bh);
> +    dispatch_release(if_created_sem);
> +    dispatch_release(s->if_queue);
> +
> +    for (int i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
> +        g_free(s->iov_buf[i].iov_base);
> +    }
> +}
> diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
> index f07afaaf21..66f66c034b 100644
> --- a/net/vmnet-shared.c
> +++ b/net/vmnet-shared.c
> @@ -10,16 +10,102 @@
>   
>   #include "qemu/osdep.h"
>   #include "qapi/qapi-types-net.h"
> +#include "qapi/error.h"
>   #include "vmnet_int.h"
>   #include "clients.h"
> -#include "qemu/error-report.h"
> -#include "qapi/error.h"
>   
>   #include <vmnet/vmnet.h>
>   
> +typedef struct VmnetSharedState {
> +    VmnetCommonState cs;
> +} VmnetSharedState;
> +
> +
> +static bool validate_options(const Netdev *netdev, Error **errp)
> +{
> +    const NetdevVmnetSharedOptions *options = &(netdev->u.vmnet_shared);
> +
> +#if !defined(MAC_OS_VERSION_11_0) || \
> +    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
> +    if (options->has_isolated) {
> +        error_setg(errp,
> +                   "vmnet-shared.isolated feature is "
> +                   "unavailable: outdated vmnet.framework API");
> +        return false;
> +    }
> +#endif
> +
> +    if ((options->has_start_address ||
> +         options->has_end_address ||
> +         options->has_subnet_mask) &&
> +        !(options->has_start_address &&
> +          options->has_end_address &&
> +          options->has_subnet_mask)) {
> +        error_setg(errp,
> +                   "'start-address', 'end-address', 'subnet-mask' "
> +                   "should be provided together"
> +        );
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static xpc_object_t build_if_desc(const Netdev *netdev)
> +{
> +    const NetdevVmnetSharedOptions *options = &(netdev->u.vmnet_shared);
> +    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
> +
> +    xpc_dictionary_set_uint64(
> +        if_desc,
> +        vmnet_operation_mode_key,
> +        VMNET_SHARED_MODE
> +    );
> +
> +    if (options->has_nat66_prefix) {
> +        xpc_dictionary_set_string(if_desc,
> +                                  vmnet_nat66_prefix_key,
> +                                  options->nat66_prefix);
> +    }
> +
> +    if (options->has_start_address) {
> +        xpc_dictionary_set_string(if_desc,
> +                                  vmnet_start_address_key,
> +                                  options->start_address);
> +        xpc_dictionary_set_string(if_desc,
> +                                  vmnet_end_address_key,
> +                                  options->end_address);
> +        xpc_dictionary_set_string(if_desc,
> +                                  vmnet_subnet_mask_key,
> +                                  options->subnet_mask);
> +    }
> +
> +#if defined(MAC_OS_VERSION_11_0) && \
> +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
> +    xpc_dictionary_set_bool(
> +        if_desc,
> +        vmnet_enable_isolation_key,
> +        options->isolated
> +    );
> +#endif
> +
> +    return if_desc;
> +}
> +
> +static NetClientInfo net_vmnet_shared_info = {
> +    .type = NET_CLIENT_DRIVER_VMNET_SHARED,
> +    .size = sizeof(VmnetSharedState),
> +    .receive = vmnet_receive_common,
> +    .cleanup = vmnet_cleanup_common,
> +};
> +
>   int net_init_vmnet_shared(const Netdev *netdev, const char *name,
>                             NetClientState *peer, Error **errp)
>   {
> -  error_setg(errp, "vmnet-shared is not implemented yet");
> -  return -1;
> +    NetClientState *nc = qemu_new_net_client(&net_vmnet_shared_info,
> +                                             peer, "vmnet-shared", name);
> +    if (!validate_options(netdev, errp)) {
> +        g_assert_not_reached();

g_assert_not_reached is for debugging purpose and may be dropped 
depending on the build option.

> +    }
> +    return vmnet_if_create(nc, build_if_desc(netdev), errp);
>   }
> diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> index aac4d5af64..acfe3a88c0 100644
> --- a/net/vmnet_int.h
> +++ b/net/vmnet_int.h
> @@ -15,11 +15,48 @@
>   #include "clients.h"
>   
>   #include <vmnet/vmnet.h>
> +#include <dispatch/dispatch.h>
> +
> +/**
> + *  From vmnet.framework documentation
> + *
> + *  Each read/write call allows up to 200 packets to be
> + *  read or written for a maximum of 256KB.
> + *
> + *  Each packet written should be a complete
> + *  ethernet frame.
> + *
> + *  https://developer.apple.com/documentation/vmnet
> + */
> +#define VMNET_PACKETS_LIMIT 200
>   
>   typedef struct VmnetCommonState {
> -  NetClientState nc;
> +    NetClientState nc;
> +    interface_ref vmnet_if;
> +
> +    bool send_scheduled;
>   
> +    uint64_t mtu;
> +    uint64_t max_packet_size;
> +
> +    struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
> +    struct iovec iov_buf[VMNET_PACKETS_LIMIT];
> +
> +    dispatch_queue_t if_queue;
> +
> +    QEMUBH *send_bh;
>   } VmnetCommonState;
>   
> +const char *vmnet_status_map_str(vmnet_return_t status);
> +
> +int vmnet_if_create(NetClientState *nc,
> +                    xpc_object_t if_desc,
> +                    Error **errp);
> +
> +ssize_t vmnet_receive_common(NetClientState *nc,
> +                             const uint8_t *buf,
> +                             size_t size);
> +
> +void vmnet_cleanup_common(NetClientState *nc);
>   
>   #endif /* VMNET_INT_H */


