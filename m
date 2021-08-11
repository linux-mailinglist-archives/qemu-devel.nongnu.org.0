Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA3E3E8991
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 06:55:43 +0200 (CEST)
Received: from localhost ([::1]:45208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDgHF-0005OG-RK
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 00:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mDgGA-0004h8-AQ
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 00:54:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mDgG5-0006Pm-5j
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 00:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628657667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g0U0IKURyEx2hMxtOi7zHwAw2fTQOPxNAR9zQpc68Wc=;
 b=a8RiPu4A9+gG3izi2Q25FnJZsfgUSXzDS5UZ6d4wB6rncefkfqEEVI2Q05hrtVPeWZKc8m
 RZ9p/B/HmIaTeoK0hZqKBeFjTV/79jvFAyG18bNi473Z9+yKbtMriWsFm+uLmUycZdmsfQ
 gar70VCeYkgfcQrWoNxnV1SV7LQvfEw=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-IyrM4rr3MD2pdgqYIbotPQ-1; Wed, 11 Aug 2021 00:54:24 -0400
X-MC-Unique: IyrM4rr3MD2pdgqYIbotPQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 m9-20020a17090ade09b029017903cc8d6cso480555pjv.4
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 21:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=g0U0IKURyEx2hMxtOi7zHwAw2fTQOPxNAR9zQpc68Wc=;
 b=GU1Gz76z+uRfL6Xzs62CyKydnhbw51jO5bV7Ko656IyUOrzOOGx4TDuAYPRxbBqvRk
 m2mwyLxges+9lACPB9k3HwnSO3+U4owh60PxNlw832BRq/Cq3SfwYI9JP2QvJh4UxxLV
 eb2OU33lQIpE+kd/459MpSvyH4j5v11mkDvnbNnZVl7i7reC1jP42Q7/eQ+6Nms8LPIs
 5iOMqRSmi2yCNlnrpI2TbkSsGTnyrUbF8NRHr/5buA6ReyTpIvRF8CyWDEA6ErLslzXj
 OfA8rEGY4+pTXGTdVcXPiQOhovhZ8FCYfp3A58L9yf4nkJa1MQVOTIDq3K49+0c4sDA3
 VHWg==
X-Gm-Message-State: AOAM532Ch00PETznTxj6CQ/M0ayaPq4iN97++ou0dc/GRfCzS2R6TICd
 AlqyFA4K2Y9ACXWC+t+E+iEUXSW50GZ9pjvN0/Xy2bUDWMC57t3/NJPX9s4MX/AP/2H0PuJQ6Jn
 oZb90jkt4k3rxKcw=
X-Received: by 2002:a62:584:0:b029:32e:3b57:a1c6 with SMTP id
 126-20020a6205840000b029032e3b57a1c6mr32225597pff.13.1628657663008; 
 Tue, 10 Aug 2021 21:54:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGpyGKPtnq+xguv7ueIS2wEBvgH++TUuQTRqEMZSE5FfV+tuBGjxqO6JKpY0pdLn4Hy1KN9Q==
X-Received: by 2002:a62:584:0:b029:32e:3b57:a1c6 with SMTP id
 126-20020a6205840000b029032e3b57a1c6mr32225564pff.13.1628657662473; 
 Tue, 10 Aug 2021 21:54:22 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w9sm25591552pfg.151.2021.08.10.21.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 21:54:22 -0700 (PDT)
Subject: Re: [PATCH v3] net/macos: implement vmnet-based netdev
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20210708054451.9374-1-akihiko.odaki@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f9de3f28-d4b9-da63-3f52-752ba5c1edb7@redhat.com>
Date: Wed, 11 Aug 2021 12:54:14 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210708054451.9374-1-akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, stefanha@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, Phillip Tennen <phillip@axleos.com>, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/8 下午1:44, Akihiko Odaki 写道:
> From: Phillip Tennen <phillip@axleos.com>
>
> This patch implements a new netdev device, reachable via -netdev
> vmnet-macos, that’s backed by macOS’s vmnet framework.
>
> The vmnet framework provides native bridging support, and its usage in
> this patch is intended as a replacement for attempts to use a tap device
> via the tuntaposx kernel extension. Notably, the tap/tuntaposx approach
> never would have worked in the first place, as QEMU interacts with the
> tap device via poll(), and macOS does not support polling device files.
>
> vmnet requires either a special entitlement, granted via a provisioning
> profile, or root access. Otherwise attempts to create the virtual
> interface will fail with a “generic error” status code. QEMU may not
> currently be signed with an entitlement granted in a provisioning
> profile, as this would necessitate pre-signed binary build distribution,
> rather than source-code distribution.


This is something that needs to be addressed.

A question, does mac has something similar to SCM_RIGHTS that allows the 
handle to be created by privileged process and passed to unprivileged 
process? like tap,fd=XYZ.


> As such, using this netdev
> currently requires that qemu be run with root access. I’ve opened a
> feedback report with Apple to allow the use of the relevant entitlement
> with this use case:
> https://openradar.appspot.com/radar?id=5007417364447232
>
> vmnet offers three operating modes, all of which are supported by this
> patch via the “mode=host|shared|bridge” option:
>
> * "Host" mode: Allows the vmnet interface to communicate with other
> * vmnet
> interfaces that are in host mode and also with the native host.
> * "Shared" mode: Allows traffic originating from the vmnet interface to
> reach the Internet through a NAT. The vmnet interface can also
> communicate with the native host.
> * "Bridged" mode: Bridges the vmnet interface with a physical network
> interface.
>
> Each of these modes also provide some extra configuration that’s
> supported by this patch:
>
> * "Bridged" mode: The user may specify the physical interface to bridge
> with. Defaults to en0.
> * "Host" mode / "Shared" mode: The user may specify the DHCP range and
> subnet. Allocated by vmnet if not provided.
>
> vmnet also offers some extra configuration options that are not
> supported by this patch:
>
> * Enable isolation from other VMs using vmnet
> * Port forwarding rules
> * Enabling TCP segmentation offload
> * Only applicable in "shared" mode: specifying the NAT IPv6 prefix
> * Only available in "host" mode: specifying the IP address for the VM
> within an isolated network
>
> Note that this patch requires macOS 10.15 as a minimum, as this is when
> bridging support was implemented in vmnet.framework.
>
> Rebased to commit 9aef0954195cc592e86846dbbe7f3c2c5603690a by Akihiko
> Odaki.
>
> Signed-off-by: Phillip Tennen <phillip@axleos.com>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Message-Id: <20210315103209.20870-1-akihiko.odaki@gmail.com>
> ---
>   meson.build       |   3 +
>   net/clients.h     |   5 +
>   net/meson.build   |   1 +
>   net/net.c         |   3 +
>   net/vmnet-macos.c | 447 ++++++++++++++++++++++++++++++++++++++++++++++
>   qapi/net.json     | 120 ++++++++++++-
>   qemu-options.hx   |   9 +


I think we'd better list you as the maintainer for this backend.


>   7 files changed, 586 insertions(+), 2 deletions(-)
>   create mode 100644 net/vmnet-macos.c
>
> diff --git a/meson.build b/meson.build
> index b9a9b2120fe..0d2ceaa880e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -178,6 +178,7 @@ socket = []
>   version_res = []
>   coref = []
>   iokit = []
> +vmnet = not_found
>   emulator_link_args = []
>   nvmm =not_found
>   hvf = not_found
> @@ -192,6 +193,7 @@ if targetos == 'windows'
>   elif targetos == 'darwin'
>     coref = dependency('appleframeworks', modules: 'CoreFoundation')
>     iokit = dependency('appleframeworks', modules: 'IOKit', required: false)
> +  vmnet = dependency('appleframeworks', modules: 'vmnet')
>   elif targetos == 'sunos'
>     socket = [cc.find_library('socket'),
>               cc.find_library('nsl'),
> @@ -1259,6 +1261,7 @@ config_host_data.set('CONFIG_FUSE', fuse.found())
>   config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
>   config_host_data.set('CONFIG_X11', x11.found())
>   config_host_data.set('CONFIG_CFI', get_option('cfi'))
> +config_host_data.set('CONFIG_VMNET', vmnet.found())
>   config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
>   config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
>   config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
> diff --git a/net/clients.h b/net/clients.h
> index 92f9b59aedc..2c2af67f82a 100644
> --- a/net/clients.h
> +++ b/net/clients.h
> @@ -63,4 +63,9 @@ int net_init_vhost_user(const Netdev *netdev, const char *name,
>   
>   int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>                           NetClientState *peer, Error **errp);
> +
> +#ifdef CONFIG_VMNET
> +int net_init_vmnet_macos(const Netdev *netdev, const char *name,
> +                        NetClientState *peer, Error **errp);
> +#endif
>   #endif /* QEMU_NET_CLIENTS_H */
> diff --git a/net/meson.build b/net/meson.build
> index 1076b0a7ab4..ba6a5b7fa0b 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -37,5 +37,6 @@ endif
>   softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
>   softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
>   softmmu_ss.add(when: 'CONFIG_VHOST_NET_VDPA', if_true: files('vhost-vdpa.c'))
> +softmmu_ss.add(when: vmnet, if_true: files('vmnet-macos.c'))
>   
>   subdir('can')
> diff --git a/net/net.c b/net/net.c
> index 76bbb7c31b4..e753063a275 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1001,6 +1001,9 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>   #ifdef CONFIG_L2TPV3
>           [NET_CLIENT_DRIVER_L2TPV3]    = net_init_l2tpv3,
>   #endif
> +#ifdef CONFIG_VMNET
> +        [NET_CLIENT_DRIVER_VMNET_MACOS] = net_init_vmnet_macos,
> +#endif
>   };
>   
>   
> diff --git a/net/vmnet-macos.c b/net/vmnet-macos.c
> new file mode 100644
> index 00000000000..062ba2091e8
> --- /dev/null
> +++ b/net/vmnet-macos.c
> @@ -0,0 +1,447 @@
> +/*
> + * vmnet.framework backed netdev for macOS 10.15+ hosts
> + *
> + * Copyright (c) 2021 Phillip Tennen <phillip@axleos.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +#include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/error-report.h"
> +#include "qapi/qapi-types-net.h"
> +#include "net/net.h"
> +/* macOS vmnet framework header */
> +#include <vmnet/vmnet.h>
> +
> +typedef struct vmnet_state {
> +    NetClientState nc;
> +    interface_ref vmnet_iface_ref;
> +    /* Switched on after vmnet informs us that the interface has started */
> +    bool link_up;


Any reason for having a dedicated link_up here? Note that we had a 
boolean of link_down in the NetClientState.


> +    /*
> +     * If qemu_send_packet_async returns 0, this is switched off until our
> +     * delivery callback is invoked
> +     */
> +    bool qemu_ready_to_receive;


This looks suspicious. Usually, we disable the polling for a specific 
source and re-enable it during the sent_cb.

If we had any special reason for doing this, we need to add comment to 
explain here.


> +} vmnet_state_t;
> +
> +int net_init_vmnet_macos(const Netdev *netdev, const char *name,
> +                         NetClientState *peer, Error **errp);
> +
> +static const char *_vmnet_status_repr(vmnet_return_t status)
> +{
> +    switch (status) {
> +    case VMNET_SUCCESS:
> +        return "success";
> +    case VMNET_FAILURE:
> +        return "generic failure";
> +    case VMNET_MEM_FAILURE:
> +        return "out of memory";
> +    case VMNET_INVALID_ARGUMENT:
> +        return "invalid argument";
> +    case VMNET_SETUP_INCOMPLETE:
> +        return "setup is incomplete";
> +    case VMNET_INVALID_ACCESS:
> +        return "insufficient permissions";
> +    case VMNET_PACKET_TOO_BIG:
> +        return "packet size exceeds MTU";
> +    case VMNET_BUFFER_EXHAUSTED:
> +        return "kernel buffers temporarily exhausted";
> +    case VMNET_TOO_MANY_PACKETS:
> +        return "number of packets exceeds system limit";
> +    /* This error code was introduced in macOS 11.0 */
> +#if __MAC_OS_X_VERSION_MAX_ALLOWED >= 110000
> +    case VMNET_SHARING_SERVICE_BUSY:
> +        return "sharing service busy";
> +#endif
> +    default:
> +        return "unknown status code";
> +    }
> +}


I think it's better to reuse the standard Qemu error reporting 
mechanism. E.g the error_setg() etc.


> +
> +static operating_modes_t _vmnet_operating_mode_enum_compat(
> +    VmnetOperatingMode mode)
> +{
> +    switch (mode) {
> +    case VMNET_OPERATING_MODE_HOST:
> +        return VMNET_HOST_MODE;
> +    case VMNET_OPERATING_MODE_SHARED:
> +        return VMNET_SHARED_MODE;
> +    case VMNET_OPERATING_MODE_BRIDGED:
> +        return VMNET_BRIDGED_MODE;
> +    default:
> +        /* Should never happen as the modes are parsed before we get here */
> +        assert(false);


Let's use g_assert_not_reached() here.


> +    }
> +}
> +
> +static bool vmnet_can_receive(NetClientState *nc)
> +{
> +    vmnet_state_t *s = DO_UPCAST(vmnet_state_t, nc, nc);
> +    return s->link_up;
> +}
> +
> +static ssize_t vmnet_receive_iov(NetClientState *nc,
> +                                 const struct iovec *iovs,
> +                                 int iovcnt)
> +{
> +    vmnet_state_t *s = DO_UPCAST(vmnet_state_t, nc, nc);
> +
> +    /* Combine the provided iovs into a single vmnet packet */
> +    struct vmpktdesc *packet = g_new0(struct vmpktdesc, 1);
> +    packet->vm_pkt_iov = g_new0(struct iovec, iovcnt);
> +    memcpy(packet->vm_pkt_iov, iovs, sizeof(struct iovec) * iovcnt);
> +    packet->vm_pkt_iovcnt = iovcnt;
> +    packet->vm_flags = 0;
> +
> +    /* Figure out the packet size by iterating the iov's */
> +    for (int i = 0; i < iovcnt; i++) {
> +        const struct iovec *iov = iovs + i;
> +        packet->vm_pkt_size += iov->iov_len;
> +    }


We had iov_size() and iov_copy(), let's try to use them.


> +
> +    /* Finally, write the packet to the vmnet interface */
> +    int packet_count = 1;


Let's move this at the beginning of this function to be consistent with 
the rest Qemu codes.


> +    vmnet_return_t result = vmnet_write(s->vmnet_iface_ref, packet,
> +                                        &packet_count);
> +    if (result != VMNET_SUCCESS || packet_count != 1) {
> +        error_printf("Failed to send packet to host: %s\n",
> +            _vmnet_status_repr(result));
> +    }
> +    ssize_t wrote_bytes = packet->vm_pkt_size;
> +    g_free(packet->vm_pkt_iov);
> +    g_free(packet);
> +    return wrote_bytes;
> +}
> +
> +static void vmnet_send_completed(NetClientState *nc, ssize_t len)
> +{
> +    vmnet_state_t *vmnet_client_state = DO_UPCAST(vmnet_state_t, nc, nc);
> +    /* Ready to receive more packets! */
> +    vmnet_client_state->qemu_ready_to_receive = true;
> +}
> +
> +static NetClientInfo net_vmnet_macos_info = {
> +    .type = NET_CLIENT_DRIVER_VMNET_MACOS,
> +    .size = sizeof(vmnet_state_t),
> +    .receive_iov = vmnet_receive_iov,
> +    .can_receive = vmnet_can_receive,
> +};
> +
> +static bool _validate_ifname_is_valid_bridge_target(const char *ifname)
> +{
> +    /* Iterate available bridge interfaces, ensure the provided one is valid */
> +    xpc_object_t bridge_interfaces = vmnet_copy_shared_interface_list();
> +    bool failed_to_match_iface_name = xpc_array_apply(
> +        bridge_interfaces,
> +        ^bool(size_t index, xpc_object_t  _Nonnull value) {
> +        if (!strcmp(xpc_string_get_string_ptr(value), ifname)) {
> +            /* The interface name is valid! Stop iterating */
> +            return false;
> +        }
> +        return true;
> +    });


Can we use function pointer instead of using the embed blocks?


> +
> +    if (failed_to_match_iface_name) {
> +        error_printf("Invalid bridge interface name provided: %s\n", ifname);
> +        error_printf("Valid bridge interfaces:\n");
> +        xpc_array_apply(
> +            vmnet_copy_shared_interface_list(),
> +            ^bool(size_t index, xpc_object_t  _Nonnull value) {
> +            error_printf("\t%s\n", xpc_string_get_string_ptr(value));
> +            /* Keep iterating */
> +            return true;
> +        });
> +        exit(1);


So this is suspicious, if looks to me the caller won't even see false. 
If this this true, let's use void for this function.


> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static xpc_object_t _construct_vmnet_interface_description(
> +    const NetdevVmnetModeOptions *vmnet_opts)
> +{
> +    operating_modes_t mode = _vmnet_operating_mode_enum_compat(
> +        vmnet_opts->mode);
> +
> +    /* Validate options */
> +    if (mode == VMNET_HOST_MODE || mode == VMNET_SHARED_MODE) {
> +        NetdevVmnetModeOptionsHostOrShared mode_opts = vmnet_opts->u.host;
> +        /* If one DHCP parameter is configured, all 3 are required */
> +        if (mode_opts.has_dhcp_start_address ||
> +            mode_opts.has_dhcp_end_address ||
> +            mode_opts.has_dhcp_subnet_mask) {
> +            if (!(mode_opts.has_dhcp_start_address &&
> +                  mode_opts.has_dhcp_end_address &&
> +                  mode_opts.has_dhcp_subnet_mask)) {
> +                error_printf("Incomplete DHCP configuration provided\n");
> +                exit(1);
> +            }
> +        }
> +    } else if (mode == VMNET_BRIDGED_MODE) {
> +        /* Nothing to validate */
> +    } else {
> +        error_printf("Unknown vmnet mode %d\n", mode);
> +        exit(1);
> +    }
> +
> +    xpc_object_t interface_desc = xpc_dictionary_create(NULL, NULL, 0);
> +    xpc_dictionary_set_uint64(
> +        interface_desc,
> +        vmnet_operation_mode_key,
> +        mode
> +    );
> +
> +    if (mode == VMNET_BRIDGED_MODE) {
> +        /*
> +         * Configure the provided physical interface to act
> +         * as a bridge with QEMU
> +         */
> +        NetdevVmnetModeOptionsBridged mode_opts = vmnet_opts->u.bridged;
> +        /* Bridge with en0 by default */
> +        const char *physical_ifname = mode_opts.has_ifname ? mode_opts.ifname :
> +                                                             "en0";
> +        _validate_ifname_is_valid_bridge_target(physical_ifname);
> +        xpc_dictionary_set_string(interface_desc,
> +                                  vmnet_shared_interface_name_key,
> +                                  physical_ifname);
> +    } else if (mode == VMNET_HOST_MODE || mode == VMNET_SHARED_MODE) {
> +        /* Pass the DHCP configuration to vmnet, if the user provided one */
> +        NetdevVmnetModeOptionsHostOrShared mode_opts = vmnet_opts->u.host;
> +        if (mode_opts.has_dhcp_start_address) {
> +            /* All DHCP arguments are available, as per the checks above */
> +            xpc_dictionary_set_string(interface_desc,
> +                                      vmnet_start_address_key,
> +                                      mode_opts.dhcp_start_address);
> +            xpc_dictionary_set_string(interface_desc,
> +                                      vmnet_end_address_key,
> +                                      mode_opts.dhcp_end_address);
> +            xpc_dictionary_set_string(interface_desc,
> +                                      vmnet_subnet_mask_key,
> +                                      mode_opts.dhcp_subnet_mask);
> +        }
> +    }
> +
> +    return interface_desc;
> +}
> +
> +int net_init_vmnet_macos(const Netdev *netdev, const char *name,
> +                        NetClientState *peer, Error **errp)
> +{
> +    assert(netdev->type == NET_CLIENT_DRIVER_VMNET_MACOS);
> +
> +    NetdevVmnetModeOptions *vmnet_opts = netdev->u.vmnet_macos.options;
> +    xpc_object_t iface_desc = _construct_vmnet_interface_description(vmnet_opts);
> +
> +    NetClientState *nc = qemu_new_net_client(&net_vmnet_macos_info, peer,
> +                                             "vmnet", name);
> +    vmnet_state_t *vmnet_client_state = DO_UPCAST(vmnet_state_t, nc, nc);
> +
> +    dispatch_queue_t vmnet_dispatch_queue = dispatch_queue_create(
> +        "org.qemu.vmnet.iface_queue",
> +        DISPATCH_QUEUE_SERIAL
> +    );
> +
> +    __block vmnet_return_t vmnet_start_status = 0;
> +    __block uint64_t vmnet_iface_mtu = 0;
> +    __block uint64_t vmnet_max_packet_size = 0;
> +    __block const char *vmnet_mac_address = NULL;
> +    /*
> +     * We can't refer to an array type directly within a block,
> +     * so hold a pointer instead.
> +     */
> +    uuid_string_t vmnet_iface_uuid = {0};
> +    __block uuid_string_t *vmnet_iface_uuid_ptr = &vmnet_iface_uuid;
> +    /* These are only provided in VMNET_HOST_MODE and VMNET_SHARED_MODE */
> +    bool vmnet_provides_dhcp_info = (
> +        vmnet_opts->mode == VMNET_OPERATING_MODE_HOST ||
> +        vmnet_opts->mode == VMNET_OPERATING_MODE_SHARED);
> +    __block const char *vmnet_subnet_mask = NULL;
> +    __block const char *vmnet_dhcp_range_start = NULL;
> +    __block const char *vmnet_dhcp_range_end = NULL;
> +
> +    /* Create the vmnet interface */
> +    dispatch_semaphore_t vmnet_iface_sem = dispatch_semaphore_create(0);
> +    interface_ref vmnet_iface_ref = vmnet_start_interface(
> +        iface_desc,
> +        vmnet_dispatch_queue,
> +        ^(vmnet_return_t status, xpc_object_t  _Nullable interface_param) {
> +        vmnet_start_status = status;
> +        if (vmnet_start_status != VMNET_SUCCESS || !interface_param) {
> +            /* Early return if the interface couldn't be started */
> +            dispatch_semaphore_signal(vmnet_iface_sem);
> +            return;
> +        }
> +
> +        /*
> +         * Read the configuration that vmnet provided us.
> +         * The provided dictionary is owned by XPC and may be freed
> +         * shortly after this block's execution.
> +         * So, copy data buffers now.
> +         */
> +        vmnet_iface_mtu = xpc_dictionary_get_uint64(
> +            interface_param,
> +            vmnet_mtu_key
> +        );
> +        vmnet_max_packet_size = xpc_dictionary_get_uint64(
> +            interface_param,
> +            vmnet_max_packet_size_key
> +        );
> +        vmnet_mac_address = strdup(xpc_dictionary_get_string(
> +            interface_param,
> +            vmnet_mac_address_key
> +        ));
> +
> +        const uint8_t *iface_uuid = xpc_dictionary_get_uuid(
> +            interface_param,
> +            vmnet_interface_id_key
> +        );
> +        uuid_unparse_upper(iface_uuid, *vmnet_iface_uuid_ptr);
> +
> +        /* If we're in a mode that provides DHCP info, read it out now */
> +        if (vmnet_provides_dhcp_info) {
> +            vmnet_dhcp_range_start = strdup(xpc_dictionary_get_string(
> +                interface_param,
> +                vmnet_start_address_key
> +            ));
> +            vmnet_dhcp_range_end = strdup(xpc_dictionary_get_string(
> +                interface_param,
> +                vmnet_end_address_key
> +            ));
> +            vmnet_subnet_mask = strdup(xpc_dictionary_get_string(
> +                interface_param,
> +                vmnet_subnet_mask_key
> +            ));
> +        }
> +        dispatch_semaphore_signal(vmnet_iface_sem);
> +    });
> +
> +    /* And block until we receive a response from vmnet */
> +    dispatch_semaphore_wait(vmnet_iface_sem, DISPATCH_TIME_FOREVER);
> +
> +    /* Did we manage to start the interface? */
> +    if (vmnet_start_status != VMNET_SUCCESS || !vmnet_iface_ref) {
> +        error_printf("Failed to start interface: %s\n",
> +            _vmnet_status_repr(vmnet_start_status));
> +        if (vmnet_start_status == VMNET_FAILURE) {
> +            error_printf("Hint: vmnet requires running with root access\n");
> +        }
> +        return -1;
> +    }
> +
> +    info_report("Started vmnet interface with configuration:");
> +    info_report("MTU:              %llu", vmnet_iface_mtu);
> +    info_report("Max packet size:  %llu", vmnet_max_packet_size);
> +    info_report("MAC:              %s", vmnet_mac_address);
> +    if (vmnet_provides_dhcp_info) {
> +        info_report("DHCP IPv4 start:  %s", vmnet_dhcp_range_start);
> +        info_report("DHCP IPv4 end:    %s", vmnet_dhcp_range_end);
> +        info_report("IPv4 subnet mask: %s", vmnet_subnet_mask);
> +    }
> +    info_report("UUID:             %s", vmnet_iface_uuid);
> +
> +    /* The interface is up! Set a block to run when packets are received */
> +    vmnet_client_state->vmnet_iface_ref = vmnet_iface_ref;
> +    vmnet_return_t event_cb_stat = vmnet_interface_set_event_callback(
> +        vmnet_iface_ref,
> +        VMNET_INTERFACE_PACKETS_AVAILABLE,
> +        vmnet_dispatch_queue,
> +        ^(interface_event_t event_mask, xpc_object_t  _Nonnull event) {
> +        if (event_mask != VMNET_INTERFACE_PACKETS_AVAILABLE) {
> +            error_printf("Unknown vmnet interface event 0x%08x\n", event_mask);
> +            return;
> +        }
> +
> +        /* If we're unable to handle more packets now, drop this packet */
> +        if (!vmnet_client_state->qemu_ready_to_receive) {
> +            return;
> +        }
> +
> +        /*
> +         * TODO(Phillip Tennen <phillip@axleos.com>): There may be more than
> +         * one packet available.
> +         * As an optimization, we could read
> +         * vmnet_estimated_packets_available_key packets now.
> +         */
> +        char *packet_buf = g_malloc0(vmnet_max_packet_size);
> +        struct iovec *iov = g_new0(struct iovec, 1);
> +        iov->iov_base = packet_buf;
> +        iov->iov_len = vmnet_max_packet_size;
> +
> +        int pktcnt = 1;
> +        struct vmpktdesc *v = g_new0(struct vmpktdesc, pktcnt);
> +        v->vm_pkt_size = vmnet_max_packet_size;
> +        v->vm_pkt_iov = iov;
> +        v->vm_pkt_iovcnt = 1;
> +        v->vm_flags = 0;
> +
> +        vmnet_return_t result = vmnet_read(vmnet_iface_ref, v, &pktcnt);
> +        if (result != VMNET_SUCCESS) {
> +            error_printf("Failed to read packet from host: %s\n",
> +                _vmnet_status_repr(result));
> +        }
> +
> +        /* Ensure we read exactly one packet */
> +        assert(pktcnt == 1);
> +
> +        /* Dispatch this block to a global queue instead of the main queue,
> +         * which is only created when the program has a Cocoa event loop.
> +         * If QEMU is started with -nographic, no Cocoa event loop will be
> +         * created and thus the main queue will be unavailable.
> +         */
> +        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,
> +                                                 0),
> +                       ^{
> +            qemu_mutex_lock_iothread();
> +
> +            /*
> +             * Deliver the packet to the guest
> +             * If the delivery succeeded synchronously, this returns the length
> +             * of the sent packet.
> +             */
> +            if (qemu_send_packet_async(nc, iov->iov_base,
> +                                       v->vm_pkt_size,
> +                                       vmnet_send_completed) == 0) {
> +                vmnet_client_state->qemu_ready_to_receive = false;


Is there any way to disable and re-enable the callback?

I'm not familiar with the Mac, so I'd like Mac expert to review this 
patch before being merged.

Thanks


> +            }
> +
> +            /*
> +             * It's safe to free the packet buffers.
> +             * Even if delivery needs to wait, qemu_net_queue_append copies
> +             * the packet buffer.
> +             */
> +            g_free(v);
> +            g_free(iov);
> +            g_free(packet_buf);
> +
> +            qemu_mutex_unlock_iothread();
> +        });
> +    });
> +
> +    /* Did we manage to set an event callback? */
> +    if (event_cb_stat != VMNET_SUCCESS) {
> +        error_printf("Failed to set up a callback to receive packets: %s\n",
> +            _vmnet_status_repr(vmnet_start_status));
> +        exit(1);
> +    }
> +
> +    /* We're now ready to receive packets */
> +    vmnet_client_state->qemu_ready_to_receive = true;
> +    vmnet_client_state->link_up = true;
> +
> +    /* Include DHCP info if we're in a relevant mode */
> +    if (vmnet_provides_dhcp_info) {
> +        snprintf(nc->info_str, sizeof(nc->info_str),
> +                 "dhcp_start=%s,dhcp_end=%s,mask=%s",
> +                 vmnet_dhcp_range_start, vmnet_dhcp_range_end,
> +                 vmnet_subnet_mask);
> +    } else {
> +        snprintf(nc->info_str, sizeof(nc->info_str),
> +                 "mac=%s", vmnet_mac_address);
> +    }
> +
> +    return 0;
> +}
> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8a..e3b67f174fc 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -452,6 +452,115 @@
>       '*vhostdev':     'str',
>       '*queues':       'int' } }
>   
> +##
> +# @VmnetOperatingMode:
> +#
> +# The operating modes in which a vmnet netdev can run
> +# Only available on macOS
> +#
> +# @host: the guest may communicate with the host
> +#        and other guest network interfaces
> +#
> +# @shared: the guest may reach the Internet through a NAT,
> +#          and may communicate with the host and other guest
> +#          network interfaces
> +#
> +# @bridged: the guest's traffic is bridged with a
> +#           physical network interface of the host
> +#
> +# Since: 6.0
> +##
> +{ 'enum': 'VmnetOperatingMode',
> +  'data': [ 'host', 'shared', 'bridged' ],
> +  'if': 'defined(CONFIG_VMNET)' }
> +
> +##
> +# @NetdevVmnetModeOptionsBridged:
> +#
> +# Options for the vmnet-macos netdev
> +# that are only available in 'bridged' mode
> +# Only available on macOS
> +#
> +# @ifname: the physical network interface to bridge with
> +#          (defaults to en0 if not specified)
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'NetdevVmnetModeOptionsBridged',
> +  'data': { '*ifname':  'str' },
> +  'if': 'defined(CONFIG_VMNET)' }
> +
> +##
> +# @NetdevVmnetModeOptionsHostOrShared:
> +#
> +# Options for the vmnet-macos netdev
> +# that are only available in 'host' or 'shared' mode
> +# Only available on macOS
> +#
> +# @dhcp-start-address: the gateway address to use for the interface.
> +#                      The range to dhcp_end_address is placed in the DHCP pool.
> +#                      (only valid with mode=host|shared)
> +#                      (must be specified with dhcp-end-address and
> +#                       dhcp-subnet-mask)
> +#                      (allocated automatically if unset)
> +#
> +# @dhcp-end-address: the DHCP IPv4 range end address to use for the interface.
> +#                      (only valid with mode=host|shared)
> +#                      (must be specified with dhcp-start-address and
> +#                       dhcp-subnet-mask)
> +#                      (allocated automatically if unset)
> +#
> +# @dhcp-subnet-mask: the IPv4 subnet mask (string) to use on the interface.
> +#                    (only valid with mode=host|shared)
> +#                    (must be specified with dhcp-start-address and
> +#                     dhcp-end-address)
> +#                    (allocated automatically if unset)
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'NetdevVmnetModeOptionsHostOrShared',
> +  'data': {
> +    '*dhcp-start-address': 'str' ,
> +    '*dhcp-end-address':   'str',
> +    '*dhcp-subnet-mask':   'str' },
> +  'if': 'defined(CONFIG_VMNET)' }
> +
> +##
> +# @NetdevVmnetModeOptions:
> +#
> +# Options specific to different operating modes of a vmnet netdev
> +# Only available on macOS
> +#
> +# @mode: the operating mode vmnet should run in
> +#
> +# Since: 6.0
> +##
> +{ 'union': 'NetdevVmnetModeOptions',
> +  'base': { 'mode': 'VmnetOperatingMode' },
> +  'discriminator': 'mode',
> +  'data': {
> +    'bridged':      'NetdevVmnetModeOptionsBridged',
> +    'host':         'NetdevVmnetModeOptionsHostOrShared',
> +    'shared':       'NetdevVmnetModeOptionsHostOrShared' },
> +  'if': 'defined(CONFIG_VMNET)' }
> +
> +##
> +# @NetdevVmnetOptions:
> +#
> +# vmnet network backend
> +# Only available on macOS
> +#
> +# @options: a structure specifying the mode and mode-specific options
> +#           (once QAPI supports a union type as a branch to another union type,
> +#            this structure can be changed to a union, and the contents of
> +#            NetdevVmnetModeOptions moved here)
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'NetdevVmnetOptions',
> +  'data': {'options': 'NetdevVmnetModeOptions' },
> +  'if': 'defined(CONFIG_VMNET)' }
> +
>   ##
>   # @NetClientDriver:
>   #
> @@ -460,10 +569,13 @@
>   # Since: 2.7
>   #
>   #        @vhost-vdpa since 5.1
> +#
> +#        @vmnet-macos since 6.0 (only available on macOS)
>   ##
>   { 'enum': 'NetClientDriver',
>     'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
> +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
> +            { 'name': 'vmnet-macos', 'if': 'defined(CONFIG_VMNET)' } ] }
>   
>   ##
>   # @Netdev:
> @@ -477,6 +589,8 @@
>   # Since: 1.2
>   #
>   #        'l2tpv3' - since 2.1
> +#
> +#        'vmnet-macos' since 6.0 (only available on macOS)
>   ##
>   { 'union': 'Netdev',
>     'base': { 'id': 'str', 'type': 'NetClientDriver' },
> @@ -492,7 +606,9 @@
>       'hubport':  'NetdevHubPortOptions',
>       'netmap':   'NetdevNetmapOptions',
>       'vhost-user': 'NetdevVhostUserOptions',
> -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
> +    'vmnet-macos': { 'type': 'NetdevVmnetOptions',
> +                     'if': 'defined(CONFIG_VMNET)' } } }
>   
>   ##
>   # @RxState:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index f7210779409..5ff872b3e84 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2609,6 +2609,15 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>   #ifdef __linux__
>       "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
>       "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
> +#endif
> +#ifdef CONFIG_VMNET
> +    "-netdev vmnet-macos,id=str,mode=bridged[,ifname=ifname]\n"
> +    "         configure a macOS-provided vmnet network in \"physical interface bridge\" mode\n"
> +    "         the physical interface to bridge with defaults to en0 if unspecified\n"
> +    "-netdev vmnet-macos,id=str,mode=host|shared\n"
> +    "                     [,dhcp_start_address=addr,dhcp_end_address=addr,dhcp_subnet_mask=mask]\n"
> +    "         configure a macOS-provided vmnet network in \"host\" or \"shared\" mode\n"
> +    "         the DHCP configuration will be set automatically if unspecified\n"
>   #endif
>       "-netdev hubport,id=str,hubid=n[,netdev=nd]\n"
>       "                configure a hub port on the hub with ID 'n'\n", QEMU_ARCH_ALL)


