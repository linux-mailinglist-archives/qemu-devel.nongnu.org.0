Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14371EC9A6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 08:41:12 +0200 (CEST)
Received: from localhost ([::1]:57592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgN5L-0007cC-T3
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 02:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jgN48-000728-Hm
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 02:39:57 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31006
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jgN46-0008GZ-27
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 02:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591166391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCJgsEWFDx1Y96EDI0WLsUS6Jy25cenHHB0IfUucqMc=;
 b=JagkhRKQxNFK/cxpVyPiH2vLvkOl+OiIXB0+9vmdXpmwt0qjlOieXAMCUHn0mnD93SU3MW
 OWbfPRT8tS9wlzX8979PBQHe3AXG86j8nPgn/LhwXXVW/ERpRyAM1qeiH1/TgaHY0bh/Br
 bsN9YiJnm8TkgsgC423U/lcXlnMdbI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-RtPyU9JMMHSSantJ4ifJCw-1; Wed, 03 Jun 2020 02:39:48 -0400
X-MC-Unique: RtPyU9JMMHSSantJ4ifJCw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD6F11005510;
 Wed,  3 Jun 2020 06:39:45 +0000 (UTC)
Received: from [10.72.12.214] (ovpn-12-214.pek2.redhat.com [10.72.12.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C66560C47;
 Wed,  3 Jun 2020 06:39:28 +0000 (UTC)
Subject: Re: [RFC v3 8/8] vhost-vdpa: introduce vhost-vdpa net client
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, armbru@redhat.com,
 eblake@redhat.com, cohuck@redhat.com
References: <20200529140620.28759-1-lulu@redhat.com>
 <20200529140620.28759-9-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4ae425c2-6b5f-5f64-9e26-f20b8f52f996@redhat.com>
Date: Wed, 3 Jun 2020 14:39:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200529140620.28759-9-lulu@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:12:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: mhabets@solarflare.com, qemu-devel@nongnu.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, maxime.coquelin@redhat.com, hch@infradead.org,
 eperezma@redhat.com, jgg@mellanox.com, shahafs@mellanox.com,
 kevin.tian@intel.com, parav@mellanox.com, vmireyno@marvell.com,
 cunming.liang@intel.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 Tiwei Bie <tiwei.bie@intel.com>, aadam@redhat.com, rdunlap@infradead.org,
 hanand@xilinx.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/5/29 下午10:06, Cindy Lu wrote:
> From: Tiwei Bie <tiwei.bie@intel.com>


Similar for this patch, you can change the git author and keep sobs for 
both Tiwei and Ling Shan.


>
> This patch set introduces a new net client type: vhost-vdpa.
> vhost-vdpa net client will set up a vDPA device which is specified
> by a "vhostdev" parameter.
>
> Co-authored-by: Lingshan Zhu <lingshan.zhu@intel.com>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   include/net/vhost-vdpa.h |  19 ++++
>   include/net/vhost_net.h  |   2 +-
>   net/Makefile.objs        |   2 +-
>   net/clients.h            |   2 +
>   net/net.c                |   3 +
>   net/vhost-vdpa.c         | 235 +++++++++++++++++++++++++++++++++++++++
>   qapi/net.json            |  26 ++++-
>   7 files changed, 285 insertions(+), 4 deletions(-)
>   create mode 100644 include/net/vhost-vdpa.h
>   create mode 100644 net/vhost-vdpa.c
>
> diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h
> new file mode 100644
> index 0000000000..6ce0d04f72
> --- /dev/null
> +++ b/include/net/vhost-vdpa.h
> @@ -0,0 +1,19 @@
> +/*
> + * vhost-vdpa.h
> + *
> + * Copyright(c) 2017-2018 Intel Corporation.
> + * Copyright(c) 2020 Red Hat, Inc.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef VHOST_VDPA_H
> +#define VHOST_VDPA_H
> +
> +struct vhost_net;
> +struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc);
> +uint64_t vhost_vdpa_get_acked_features(NetClientState *nc);
> +
> +#endif /* VHOST_VDPA_H */
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index 56e67fe164..0b87d3c6e9 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -41,4 +41,4 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net);
>   
>   int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>   int vhost_net_get_device_id(struct vhost_net *net, uint32_t *device_id);
> -endif
> +#endif
> diff --git a/net/Makefile.objs b/net/Makefile.objs
> index c5d076d19c..5ab45545db 100644
> --- a/net/Makefile.objs
> +++ b/net/Makefile.objs
> @@ -26,7 +26,7 @@ tap-obj-$(CONFIG_SOLARIS) = tap-solaris.o
>   tap-obj-y ?= tap-stub.o
>   common-obj-$(CONFIG_POSIX) += tap.o $(tap-obj-y)
>   common-obj-$(CONFIG_WIN32) += tap-win32.o
> -
> +common-obj-$(CONFIG_VHOST_NET_VDPA) += vhost-vdpa.o
>   vde.o-libs = $(VDE_LIBS)
>   
>   common-obj-$(CONFIG_CAN_BUS) += can/
> diff --git a/net/clients.h b/net/clients.h
> index a6ef267e19..92f9b59aed 100644
> --- a/net/clients.h
> +++ b/net/clients.h
> @@ -61,4 +61,6 @@ int net_init_netmap(const Netdev *netdev, const char *name,
>   int net_init_vhost_user(const Netdev *netdev, const char *name,
>                           NetClientState *peer, Error **errp);
>   
> +int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> +                        NetClientState *peer, Error **errp);
>   #endif /* QEMU_NET_CLIENTS_H */
> diff --git a/net/net.c b/net/net.c
> index 599fb61028..82624ea9ac 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -965,6 +965,9 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>   #ifdef CONFIG_VHOST_NET_USER
>           [NET_CLIENT_DRIVER_VHOST_USER] = net_init_vhost_user,
>   #endif
> +#ifdef CONFIG_VHOST_NET_VDPA
> +        [NET_CLIENT_DRIVER_VHOST_VDPA] = net_init_vhost_vdpa,
> +#endif
>   #ifdef CONFIG_L2TPV3
>           [NET_CLIENT_DRIVER_L2TPV3]    = net_init_l2tpv3,
>   #endif
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> new file mode 100644
> index 0000000000..7b98c142b5
> --- /dev/null
> +++ b/net/vhost-vdpa.c
> @@ -0,0 +1,235 @@
> +/*
> + * vhost-vdpa.c
> + *
> + * Copyright(c) 2017-2018 Intel Corporation.
> + * Copyright(c) 2020 Red Hat, Inc.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "clients.h"
> +#include "net/vhost_net.h"
> +#include "net/vhost-vdpa.h"
> +#include "hw/virtio/vhost-vdpa.h"
> +#include "qemu/config-file.h"
> +#include "qemu/error-report.h"
> +#include "qemu/option.h"
> +#include "qapi/error.h"
> +#include <sys/ioctl.h>
> +#include <err.h>
> +#include "standard-headers/linux/virtio_net.h"
> +#include "monitor/monitor.h"
> +#include "hw/virtio/vhost.h"
> +
> +/* Todo:need to add the multiqueue support here */
> +typedef struct VhostVDPAState {
> +    NetClientState nc;
> +    struct vhost_vdpa vhost_vdpa;
> +    VHostNetState *vhost_net;
> +    uint64_t acked_features;
> +    bool started;
> +} VhostVDPAState;
> +
> +VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> +{
> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> +    return s->vhost_net;
> +}
> +
> +uint64_t vhost_vdpa_get_acked_features(NetClientState *nc)
> +{
> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> +    return s->acked_features;
> +}
> +
> +static int vhost_vdpa_check_device_id(NetClientState *nc)


A better name is needed, something like "vhost_vdpa_net_check_devie_id" 
is better.


> +{
> +    uint32_t device_id;
> +    int ret;
> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> +    /* Get the device id from hw*/


The code explains itself, so no need for this comment.


> +    ret = vhost_net_get_device_id(s->vhost_net, &device_id);
> +    if (device_id != VIRTIO_ID_NET) {
> +        return -ENOTSUP;
> +    }
> +    return ret;
> +}
> +
> +static void vhost_vdpa_del(NetClientState *ncs)
> +{
> +    VhostVDPAState *s;
> +
> +    assert(ncs->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> +
> +    s = DO_UPCAST(VhostVDPAState, nc, ncs);
> +
> +    if (s->vhost_net) {
> +        /* save acked features */
> +        uint64_t features = vhost_net_get_acked_features(s->vhost_net);
> +        if (features) {
> +            s->acked_features = features;
> +        }


I'm not sure I get here, is the acked_features used in the 
vhost_net_cleanup()?


> +        vhost_net_cleanup(s->vhost_net);
> +    }
> +}
> +
> +static int vhost_vdpa_add(NetClientState *ncs, void *be)
> +{
> +    VhostNetOptions options;
> +    struct vhost_net *net = NULL;
> +    VhostVDPAState *s;
> +    int ret;
> +
> +    options.backend_type = VHOST_BACKEND_TYPE_VDPA;
> +
> +    assert(ncs->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> +
> +    s = DO_UPCAST(VhostVDPAState, nc, ncs);
> +
> +    options.net_backend = ncs;
> +    options.opaque      = be;
> +    options.busyloop_timeout = 0;
> +    net = vhost_net_init(&options);
> +    if (!net) {
> +        error_report("failed to init vhost_net for queue");
> +        goto err;
> +    }
> +
> +    if (s->vhost_net) {
> +        vhost_net_cleanup(s->vhost_net);
> +        g_free(s->vhost_net);
> +    }
> +    s->vhost_net = net;
> +    /* check the device id for vdpa */


The comment could be removed as well.


> +    ret = vhost_vdpa_check_device_id(ncs);
> +    if (ret) {
> +        goto err;
> +    }
> +    return 0;
> +err:
> +    if (net) {
> +        vhost_net_cleanup(net);
> +    }
> +    vhost_vdpa_del(ncs);
> +    return -1;
> +}
> +
> +static void vhost_vdpa_cleanup(NetClientState *nc)
> +{
> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> +
> +    if (s->vhost_net) {
> +        vhost_net_cleanup(s->vhost_net);
> +        g_free(s->vhost_net);
> +        s->vhost_net = NULL;
> +    }
> +
> +    qemu_purge_queued_packets(nc);


Why this is needed?

Thanks


> +}
> +
> +static bool vhost_vdpa_has_vnet_hdr(NetClientState *nc)
> +{
> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> +
> +    return true;
> +}
> +
> +static bool vhost_vdpa_has_ufo(NetClientState *nc)
> +{
> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> +    uint64_t  features = 0;
> +
> +    features |= (1ULL << VIRTIO_NET_F_HOST_UFO);
> +    features = vhost_net_get_features(s->vhost_net, features);
> +    return !!(features & (1ULL << VIRTIO_NET_F_HOST_UFO));
> +
> +}
> +
> +static NetClientInfo net_vhost_vdpa_info = {
> +        .type = NET_CLIENT_DRIVER_VHOST_VDPA,
> +        .size = sizeof(VhostVDPAState),
> +        .cleanup = vhost_vdpa_cleanup,
> +        .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
> +        .has_ufo = vhost_vdpa_has_ufo,
> +};
> +
> +static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
> +                               const char *name, const char *vhostdev,
> +                               bool has_fd, char *fd)
> +{
> +    NetClientState *nc = NULL;
> +    VhostVDPAState *s;
> +    int vdpa_device_fd = -1;
> +    Error *err = NULL;
> +    int ret = 0;
> +    assert(name);
> +
> +    nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device, name);
> +    snprintf(nc->info_str, sizeof(nc->info_str), "vhost-vdpa");
> +    nc->queue_index = 0;
> +
> +    s = DO_UPCAST(VhostVDPAState, nc, nc);
> +
> +    if (has_fd) {
> +        vdpa_device_fd = monitor_fd_param(cur_mon, fd, &err);
> +    } else{
> +        vdpa_device_fd = open(vhostdev, O_RDWR);
> +    }
> +
> +    if (vdpa_device_fd == -1) {
> +        return -errno;
> +    }
> +    s->vhost_vdpa.device_fd = vdpa_device_fd;
> +    ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
> +    assert(s->vhost_net);
> +
> +    if (ret) {
> +        if (has_fd) {
> +            close(vdpa_device_fd);
> +        }
> +    }
> +    return ret;
> +}
> +
> +static int net_vhost_check_net(void *opaque, QemuOpts *opts, Error **errp)
> +{
> +    const char *name = opaque;
> +    const char *driver, *netdev;
> +
> +    driver = qemu_opt_get(opts, "driver");
> +    netdev = qemu_opt_get(opts, "netdev");
> +    if (!driver || !netdev) {
> +        return 0;
> +    }
> +
> +    if (strcmp(netdev, name) == 0 &&
> +        !g_str_has_prefix(driver, "virtio-net-")) {
> +        error_setg(errp, "vhost-vdpa requires frontend driver virtio-net-*");
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> +                        NetClientState *peer, Error **errp)
> +{
> +    const NetdevVhostVDPAOptions *opts;
> +
> +    assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> +    opts = &netdev->u.vhost_vdpa;
> +    /* verify net frontend */
> +    if (qemu_opts_foreach(qemu_find_opts("device"), net_vhost_check_net,
> +                          (char *)name, errp)) {
> +        return -1;
> +    }
> +    return net_vhost_vdpa_init(peer, "vhost_vdpa", name, opts->vhostdev,
> +                    opts->has_fd, opts->fd);
> +}
> diff --git a/qapi/net.json b/qapi/net.json
> index cebb1b52e3..37507ce9ba 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -428,6 +428,27 @@
>       '*vhostforce':    'bool',
>       '*queues':        'int' } }
>   
> +##
> +# @NetdevVhostVDPAOptions:
> +#
> +# Vhost-vdpa network backend
> +#
> +# @vhostdev: name of a vdpa dev path in sysfs
> +#            (default path:/dev/vhost-vdpa-$ID)
> +#
> +# @fd: file descriptor of an already opened vdpa device
> +#
> +# @queues: number of queues to be created for multiqueue vhost-vdpa
> +#          (default: 1)
> +#
> +# Since: 5.1
> +##
> +{ 'struct': 'NetdevVhostVDPAOptions',
> +  'data': {
> +    '*vhostdev':     'str',
> +    '*fd':           'str',
> +    '*queues':       'int' } }
> +
>   ##
>   # @NetClientDriver:
>   #
> @@ -437,7 +458,7 @@
>   ##
>   { 'enum': 'NetClientDriver',
>     'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> -            'bridge', 'hubport', 'netmap', 'vhost-user' ] }
> +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
>   
>   ##
>   # @Netdev:
> @@ -465,7 +486,8 @@
>       'bridge':   'NetdevBridgeOptions',
>       'hubport':  'NetdevHubPortOptions',
>       'netmap':   'NetdevNetmapOptions',
> -    'vhost-user': 'NetdevVhostUserOptions' } }
> +    'vhost-user': 'NetdevVhostUserOptions',
> +    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
>   
>   ##
>   # @NetLegacy:


