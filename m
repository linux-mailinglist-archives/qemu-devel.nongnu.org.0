Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D86545BCA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 07:45:18 +0200 (CEST)
Received: from localhost ([::1]:58582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzXSO-0003P6-VV
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 01:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzXOW-0001tU-EK
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 01:41:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzXOR-00032L-0s
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 01:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654839669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHOgCJhDAL9UHl6ApIUnerSgL89m2XtSOsdWVrl1gqQ=;
 b=SfAoy/XqRWsqld/vJtiONdN4aDnHWF7y7x+8AYqNNJAVOFHOrGZA7sJ7rAJOd62uhlShtv
 HPokNGcsCBeAJM8psXtqFtY01DIAq/l4D0hCMOe+EU7tdMp0CYS3VNA1lorXLXp2Fo6GUG
 sKz6XTDzDL/G1EXFxOE1OU0vEnV2Nm0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-PrHEGzqkNHKGPVLq9rYL_w-1; Fri, 10 Jun 2022 01:41:08 -0400
X-MC-Unique: PrHEGzqkNHKGPVLq9rYL_w-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay1-20020a05600c1e0100b0039c3a3fc6a4so773902wmb.4
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 22:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lHOgCJhDAL9UHl6ApIUnerSgL89m2XtSOsdWVrl1gqQ=;
 b=XNHhfiedFy9/+mpJBsJtUMn7dTZcAQW3X2DUM9ZjztD1uCnkN0MhsZjFX7tcWFd7CS
 xXZ/E/M2s/Zfh7WMTQQw5AzN87JlNU66V+KeIAJ+cA7uS2Wf4kka3RoFA3/3J467HFuB
 u+8bFsel79mpYzXJVLyrMdECQaze1rYuwT75EjR/Obr45K6RfjLgie1fvEftjOiLOcoI
 jQV/BGfpTd7+X45slYpe3c3YbjWQX4CXvZKG49XAQ6Q6WSccTTzMQtG78ElvMygLAodX
 JOGGKhyUS9xR8/xj3UG73zJs4W4lfgr4sVTa2N2fzmgKAxw8KTrP/NCafE5fPd5qxnDp
 JEdg==
X-Gm-Message-State: AOAM531jMDRATLTUKsDWhEGK4MUNYXZTtICeRmdvIwZISUYU1DGoWzGD
 98m8+1Vf0HvPhYuW4hs6mYm1NQlVcgL+EQwXthDBvlcUkkpIo+UWb8qoijfbM2NZBZJYtAXOKvU
 xVc1QYlppyqR36SE=
X-Received: by 2002:a05:6000:1541:b0:219:c96a:3d3b with SMTP id
 1-20020a056000154100b00219c96a3d3bmr4346839wry.393.1654839666430; 
 Thu, 09 Jun 2022 22:41:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfwVtYGg/HVVY+M7Yh1DbLmmnQOJoyUxmjzLhNie2Xk3URGECxyXMhOIW2Kmtz8DhGt/nKZg==
X-Received: by 2002:a05:6000:1541:b0:219:c96a:3d3b with SMTP id
 1-20020a056000154100b00219c96a3d3bmr4346803wry.393.1654839665959; 
 Thu, 09 Jun 2022 22:41:05 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 m2-20020adfe942000000b0020fcaba73bcsm26661331wrn.104.2022.06.09.22.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 22:41:04 -0700 (PDT)
Date: Fri, 10 Jun 2022 01:41:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Cc: qemu-devel@nongnu.org, boris.ostrovsky@oracle.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 qemu-block@nongnu.org, groug@kaod.org, qemu_oss@crudebyte.com,
 stefanha@redhat.com, lvivier@redhat.com, mathieu.poirier@linaro.org,
 arei.gonglei@huawei.com, eric.auger@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, david@redhat.com, marcandre.lureau@redhat.com,
 armbru@redhat.com, michael.roth@amd.com, eblake@redhat.com,
 thuth@redhat.com, pbonzini@redhat.com, kwolf@redhat.com,
 raphael.norwitz@nutanix.com
Subject: Re: [PATCH v14 5/8] qmp: decode feature & status bits in virtio-status
Message-ID: <20220610014053-mutt-send-email-mst@kernel.org>
References: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
 <1648819405-25696-6-git-send-email-jonah.palmer@oracle.com>
 <20220516161200-mutt-send-email-mst@kernel.org>
 <3e273430-762e-af04-21fa-d92a879ca28f@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e273430-762e-af04-21fa-d92a879ca28f@oracle.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, May 19, 2022 at 02:30:43AM -0400, Jonah Palmer wrote:
> 
> On 5/16/22 16:26, Michael S. Tsirkin wrote:
> 
>     On Fri, Apr 01, 2022 at 09:23:22AM -0400, Jonah Palmer wrote:
> 
>         From: Laurent Vivier <lvivier@redhat.com>
> 
>         Display feature names instead of bitmaps for host, guest, and
>         backend for VirtIODevices.
> 
>         Display status names instead of bitmaps for VirtIODevices.
> 
>         Display feature names instead of bitmaps for backend, protocol,
>         acked, and features (hdev->features) for vhost devices.
> 
>         Decode features according to device ID. Decode statuses
>         according to configuration status bitmap (config_status_map).
>         Decode vhost user protocol features according to vhost user
>         protocol bitmap (vhost_user_protocol_map).
> 
>         Transport features are on the first line. Undecoded bits (if
>         any) are stored in a separate field.
> 
>         Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> 
> 
>     So this has several problems that I missed previously.
>     First, sign off from poster is missing.
> 
> My apologies, will add missing Laurent's SOB in correct order for
> patches 3-8.


Were you going to repost?

> 
> 
> 
> 
>         ---
>          hw/block/virtio-blk.c          |  29 ++++
>          hw/char/virtio-serial-bus.c    |  11 ++
>          hw/display/virtio-gpu.c        |  18 ++
>          hw/input/virtio-input.c        |  10 ++
>          hw/net/virtio-net.c            |  47 +++++
>          hw/scsi/virtio-scsi.c          |  17 ++
>          hw/virtio/vhost-user-fs.c      |  10 ++
>          hw/virtio/vhost-user-i2c.c     |  14 ++
>          hw/virtio/vhost-vsock-common.c |  10 ++
>          hw/virtio/virtio-balloon.c     |  14 ++
>          hw/virtio/virtio-crypto.c      |  10 ++
>          hw/virtio/virtio-iommu.c       |  14 ++
>          hw/virtio/virtio-mem.c         |  11 ++
>          hw/virtio/virtio.c             | 302 ++++++++++++++++++++++++++++++++-
>          include/hw/virtio/vhost.h      |   3 +
>          include/hw/virtio/virtio.h     |  19 +++
>          qapi/virtio.json               | 156 ++++++++++++++---
>          17 files changed, 667 insertions(+), 28 deletions(-)
> 
>         diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
>         index 27c71ad316..f104603040 100644
>         --- a/hw/block/virtio-blk.c
>         +++ b/hw/block/virtio-blk.c
>         @@ -13,6 +13,7 @@
> 
>          #include "qemu/osdep.h"
>          #include "qapi/error.h"
>         +#include "qapi/qapi-visit-virtio.h"
>          #include "qemu/iov.h"
>          #include "qemu/module.h"
>          #include "qemu/error-report.h"
>         @@ -33,10 +34,38 @@
>          #include "migration/qemu-file-types.h"
>          #include "hw/virtio/virtio-access.h"
>          #include "qemu/coroutine.h"
>         +#include "standard-headers/linux/vhost_types.h"
> 
>          /* Config size before the discard support (hide associated config fields) */
>          #define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
>                                               max_discard_sectors)
>         +
>         +qmp_virtio_feature_map_t blk_map[] = {
>         +#define FEATURE_ENTRY(name) \
>         +    { VIRTIO_BLK_F_##name, #name }
>         +    FEATURE_ENTRY(SIZE_MAX),
>         +    FEATURE_ENTRY(SEG_MAX),
>         +    FEATURE_ENTRY(GEOMETRY),
>         +    FEATURE_ENTRY(RO),
>         +    FEATURE_ENTRY(BLK_SIZE),
>         +    FEATURE_ENTRY(TOPOLOGY),
>         +    FEATURE_ENTRY(MQ),
>         +    FEATURE_ENTRY(DISCARD),
>         +    FEATURE_ENTRY(WRITE_ZEROES),
>         +#ifndef VIRTIO_BLK_NO_LEGACY
>         +    FEATURE_ENTRY(BARRIER),
>         +    FEATURE_ENTRY(SCSI),
>         +    FEATURE_ENTRY(FLUSH),
>         +    FEATURE_ENTRY(CONFIG_WCE),
>         +#endif /* !VIRTIO_BLK_NO_LEGACY */
>         +#undef FEATURE_ENTRY
>         +#define FEATURE_ENTRY(name) \
>         +    { VHOST_F_##name, #name }
>         +    FEATURE_ENTRY(LOG_ALL),
>         +#undef FEATURE_ENTRY
>         +    { -1, "" }
>         +};
>         +
>          /*
>           * Starting from the discard feature, we can use this array to properly
>           * set the config size depending on the features enabled.
>         diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
>         index 7d4601cb5d..fbb31a2b16 100644
>         --- a/hw/char/virtio-serial-bus.c
>         +++ b/hw/char/virtio-serial-bus.c
>         @@ -20,6 +20,7 @@
> 
>          #include "qemu/osdep.h"
>          #include "qapi/error.h"
>         +#include "qapi/qapi-visit-virtio.h"
>          #include "qemu/iov.h"
>          #include "qemu/main-loop.h"
>          #include "qemu/module.h"
>         @@ -32,6 +33,16 @@
>          #include "hw/virtio/virtio-serial.h"
>          #include "hw/virtio/virtio-access.h"
> 
>         +qmp_virtio_feature_map_t serial_map[] = {
>         +#define FEATURE_ENTRY(name) \
>         +    { VIRTIO_CONSOLE_F_##name, #name }
>         +    FEATURE_ENTRY(SIZE),
>         +    FEATURE_ENTRY(MULTIPORT),
>         +    FEATURE_ENTRY(EMERG_WRITE),
>         +#undef FEATURE_ENTRY
>         +    { -1, "" }
>         +};
>         +
>          static struct VirtIOSerialDevices {
>              QLIST_HEAD(, VirtIOSerial) devices;
>          } vserdevices;
>         diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
>         index 529b5246b2..0bd5dc6232 100644
>         --- a/hw/display/virtio-gpu.c
>         +++ b/hw/display/virtio-gpu.c
>         @@ -29,10 +29,28 @@
>          #include "qemu/log.h"
>          #include "qemu/module.h"
>          #include "qapi/error.h"
>         +#include "qapi/qapi-visit-virtio.h"
>          #include "qemu/error-report.h"
>         +#include "standard-headers/linux/vhost_types.h"
> 
>          #define VIRTIO_GPU_VM_VERSION 1
> 
>         +qmp_virtio_feature_map_t gpu_map[] = {
>         +#define FEATURE_ENTRY(name) \
>         +    { VIRTIO_GPU_F_##name, #name }
>         +    FEATURE_ENTRY(VIRGL),
>         +    FEATURE_ENTRY(EDID),
>         +    FEATURE_ENTRY(RESOURCE_UUID),
>         +    FEATURE_ENTRY(RESOURCE_BLOB),
>         +    FEATURE_ENTRY(CONTEXT_INIT),
>         +#undef FEATURE_ENTRY
>         +#define FEATURE_ENTRY(name) \
>         +    { VHOST_F_##name, #name }
>         +    FEATURE_ENTRY(LOG_ALL),
>         +#undef FEATURE_ENTRY
>         +    { -1, "" }
>         +};
>         +
> 
> 
>     Now I had some experience with this, the trick makes it
>     harder to find where is a given macro used, and at the same
>     time saves very little. Also should a macro name change, we
>     do not want the name to change.
>     Let's just keep it simple please.
>     Plain array of macros and strings with no tricks.
> 
> Sure thing. Should I define the macro outside of the map
> definition? E.g:
> 
> #define FEATURE_ENTRY(name) { ##name, #name }
> qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
>     FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL),
>     FEATURE_ENTRY(VIRTIO_GPU_F_EDID),
>     ...
>     { -1, "" }
> };
> 
> Also, is that what you were thinking as a "plain array of macros
> and strings"? Or was there something more simple you had in mind?
> 
> 
> 
> 
>          static struct virtio_gpu_simple_resource*
>          virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
>          static struct virtio_gpu_simple_resource *
>         diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
>         index 5b5398b3ca..fe0ed6d5b4 100644
>         --- a/hw/input/virtio-input.c
>         +++ b/hw/input/virtio-input.c
>         @@ -6,6 +6,7 @@
> 
>          #include "qemu/osdep.h"
>          #include "qapi/error.h"
>         +#include "qapi/qapi-visit-virtio.h"
>          #include "qemu/iov.h"
>          #include "qemu/module.h"
>          #include "trace.h"
>         @@ -14,10 +15,19 @@
>          #include "hw/qdev-properties.h"
>          #include "hw/virtio/virtio-input.h"
> 
>         +#include "standard-headers/linux/vhost_types.h"
>          #include "standard-headers/linux/input.h"
> 
>          #define VIRTIO_INPUT_VM_VERSION 1
> 
>         +qmp_virtio_feature_map_t input_map[] = {
>         +#define FEATURE_ENTRY(name) \
>         +    { VHOST_F_##name, #name }
>         +    FEATURE_ENTRY(LOG_ALL),
>         +#undef FEATURE_ENTRY
>         +    { -1, "" }
>         +};
>         +
>          /* ----------------------------------------------------------------- */
> 
>          void virtio_input_send(VirtIOInput *vinput, virtio_input_event *event)
>         diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>         index 027ce40c6f..9356958fb6 100644
>         --- a/hw/net/virtio-net.c
>         +++ b/hw/net/virtio-net.c
>         @@ -35,9 +35,11 @@
>          #include "hw/qdev-properties.h"
>          #include "qapi/qapi-types-migration.h"
>          #include "qapi/qapi-events-migration.h"
>         +#include "qapi/qapi-visit-virtio.h"
>          #include "hw/virtio/virtio-access.h"
>          #include "migration/misc.h"
>          #include "standard-headers/linux/ethtool.h"
>         +#include "standard-headers/linux/vhost_types.h"
>          #include "sysemu/sysemu.h"
>          #include "trace.h"
>          #include "monitor/qdev.h"
>         @@ -90,6 +92,51 @@
>                                                   VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
>                                                   VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)
> 
>         +qmp_virtio_feature_map_t net_map[] = {
>         +#define FEATURE_ENTRY(name) \
>         +    { VIRTIO_NET_F_##name, #name }
>         +    FEATURE_ENTRY(CSUM),
>         +    FEATURE_ENTRY(GUEST_CSUM),
>         +    FEATURE_ENTRY(CTRL_GUEST_OFFLOADS),
>         +    FEATURE_ENTRY(MTU),
>         +    FEATURE_ENTRY(MAC),
>         +    FEATURE_ENTRY(GUEST_TSO4),
>         +    FEATURE_ENTRY(GUEST_TSO6),
>         +    FEATURE_ENTRY(GUEST_ECN),
>         +    FEATURE_ENTRY(GUEST_UFO),
>         +    FEATURE_ENTRY(HOST_TSO4),
>         +    FEATURE_ENTRY(HOST_TSO6),
>         +    FEATURE_ENTRY(HOST_ECN),
>         +    FEATURE_ENTRY(HOST_UFO),
>         +    FEATURE_ENTRY(MRG_RXBUF),
>         +    FEATURE_ENTRY(STATUS),
>         +    FEATURE_ENTRY(CTRL_VQ),
>         +    FEATURE_ENTRY(CTRL_RX),
>         +    FEATURE_ENTRY(CTRL_VLAN),
>         +    FEATURE_ENTRY(CTRL_RX_EXTRA),
>         +    FEATURE_ENTRY(GUEST_ANNOUNCE),
>         +    FEATURE_ENTRY(MQ),
>         +    FEATURE_ENTRY(CTRL_MAC_ADDR),
>         +    FEATURE_ENTRY(HASH_REPORT),
>         +    FEATURE_ENTRY(RSS),
>         +    FEATURE_ENTRY(RSC_EXT),
>         +    FEATURE_ENTRY(STANDBY),
>         +    FEATURE_ENTRY(SPEED_DUPLEX),
>         +#ifndef VIRTIO_NET_NO_LEGACY
>         +    FEATURE_ENTRY(GSO),
>         +#endif /* VIRTIO_NET_NO_LEGACY */
>         +#undef FEATURE_ENTRY
>         +#define FEATURE_ENTRY(name) \
>         +    { VHOST_NET_F_##name, #name }
>         +    FEATURE_ENTRY(VIRTIO_NET_HDR),
>         +#undef FEATURE_ENTRY
>         +#define FEATURE_ENTRY(name) \
>         +    { VHOST_F_##name, #name }
>         +    FEATURE_ENTRY(LOG_ALL),
>         +#undef FEATURE_ENTRY
>         +    { -1, "" }
>         +};
>         +
>          static const VirtIOFeature feature_sizes[] = {
>              {.flags = 1ULL << VIRTIO_NET_F_MAC,
>               .end = endof(struct virtio_net_config, mac)},
>         diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
>         index 2a6141d081..9ca8faa40e 100644
>         --- a/hw/scsi/virtio-scsi.c
>         +++ b/hw/scsi/virtio-scsi.c
>         @@ -15,7 +15,9 @@
> 
>          #include "qemu/osdep.h"
>          #include "qapi/error.h"
>         +#include "qapi/qapi-visit-virtio.h"
>          #include "standard-headers/linux/virtio_ids.h"
>         +#include "standard-headers/linux/vhost_types.h"
>          #include "hw/virtio/virtio-scsi.h"
>          #include "migration/qemu-file-types.h"
>          #include "qemu/error-report.h"
>         @@ -29,6 +31,21 @@
>          #include "hw/virtio/virtio-access.h"
>          #include "trace.h"
> 
>         +qmp_virtio_feature_map_t scsi_map[] = {
>         +#define FEATURE_ENTRY(name) \
>         +    { VIRTIO_SCSI_F_##name, #name }
>         +    FEATURE_ENTRY(INOUT),
>         +    FEATURE_ENTRY(HOTPLUG),
>         +    FEATURE_ENTRY(CHANGE),
>         +    FEATURE_ENTRY(T10_PI),
>         +#undef FEATURE_ENTRY
>         +#define FEATURE_ENTRY(name) \
>         +    { VHOST_F_##name, #name }
>         +    FEATURE_ENTRY(LOG_ALL),
>         +#undef FEATURE_ENTRY
>         +    { -1, "" }
>         +};
>         +
>          static inline int virtio_scsi_get_lun(uint8_t *lun)
>          {
>              return ((lun[2] << 8) | lun[3]) & 0x3FFF;
>         diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
>         index e513e4fdda..096cc07c44 100644
>         --- a/hw/virtio/vhost-user-fs.c
>         +++ b/hw/virtio/vhost-user-fs.c
>         @@ -15,6 +15,7 @@
>          #include <sys/ioctl.h>
>          #include "standard-headers/linux/virtio_fs.h"
>          #include "qapi/error.h"
>         +#include "qapi/qapi-visit-virtio.h"
>          #include "hw/qdev-properties.h"
>          #include "hw/qdev-properties-system.h"
>          #include "hw/virtio/virtio-bus.h"
>         @@ -23,6 +24,15 @@
>          #include "hw/virtio/vhost-user-fs.h"
>          #include "monitor/monitor.h"
>          #include "sysemu/sysemu.h"
>         +#include "standard-headers/linux/vhost_types.h"
>         +
>         +qmp_virtio_feature_map_t fs_map[] = {
>         +#define FEATURE_ENTRY(name) \
>         +    { VHOST_F_##name, #name }
>         +    FEATURE_ENTRY(LOG_ALL),
>         +#undef FEATURE_ENTRY
>         +    { -1, "" }
>         +};
> 
>          static const int user_feature_bits[] = {
>              VIRTIO_F_VERSION_1,
>         diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
>         index 6020eee093..931ec9836c 100644
>         --- a/hw/virtio/vhost-user-i2c.c
>         +++ b/hw/virtio/vhost-user-i2c.c
>         @@ -8,11 +8,25 @@
> 
>          #include "qemu/osdep.h"
>          #include "qapi/error.h"
>         +#include "qapi/qapi-visit-virtio.h"
>          #include "hw/qdev-properties.h"
>          #include "hw/virtio/virtio-bus.h"
>          #include "hw/virtio/vhost-user-i2c.h"
>          #include "qemu/error-report.h"
>          #include "standard-headers/linux/virtio_ids.h"
>         +#include "standard-headers/linux/vhost_types.h"
>         +
>         +qmp_virtio_feature_map_t i2c_map[] = {
>         +#define FEATURE_ENTRY(name) \
>         +    { VHOST_F_##name, #name }
>         +    FEATURE_ENTRY(LOG_ALL),
>         +#undef FEATURE_ENTRY
>         +#define FEATURE_ENTRY(name) \
>         +    { VIRTIO_I2C_F_##name, #name }
>         +    FEATURE_ENTRY(ZERO_LENGTH_REQUEST),
>         +#undef FEATURE_ENTRY
>         +    { -1, "" }
>         +};
> 
>          static const int feature_bits[] = {
>              VIRTIO_I2C_F_ZERO_LENGTH_REQUEST,
>         diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
>         index 7394818e00..b03f94d8f8 100644
>         --- a/hw/virtio/vhost-vsock-common.c
>         +++ b/hw/virtio/vhost-vsock-common.c
>         @@ -11,12 +11,22 @@
>          #include "qemu/osdep.h"
>          #include "standard-headers/linux/virtio_vsock.h"
>          #include "qapi/error.h"
>         +#include "qapi/qapi-visit-virtio.h"
>          #include "hw/virtio/virtio-access.h"
>          #include "qemu/error-report.h"
>          #include "hw/qdev-properties.h"
>          #include "hw/virtio/vhost-vsock.h"
>          #include "qemu/iov.h"
>          #include "monitor/monitor.h"
>         +#include "standard-headers/linux/vhost_types.h"
>         +
>         +qmp_virtio_feature_map_t vsock_map[] = {
>         +#define FEATURE_ENTRY(name) \
>         +    { VHOST_F_##name, #name }
>         +    FEATURE_ENTRY(LOG_ALL),
>         +#undef FEATURE_ENTRY
>         +    { -1, "" }
>         +};
> 
>          const int feature_bits[] = {
>              VIRTIO_VSOCK_F_SEQPACKET,
>         diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
>         index 193ff5261c..b2ae0a4d8c 100644
>         --- a/hw/virtio/virtio-balloon.c
>         +++ b/hw/virtio/virtio-balloon.c
>         @@ -28,6 +28,7 @@
>          #include "qapi/error.h"
>          #include "qapi/qapi-events-machine.h"
>          #include "qapi/visitor.h"
>         +#include "qapi/qapi-visit-virtio.h"
>          #include "trace.h"
>          #include "qemu/error-report.h"
>          #include "migration/misc.h"
>         @@ -38,6 +39,19 @@
> 
>          #define BALLOON_PAGE_SIZE  (1 << VIRTIO_BALLOON_PFN_SHIFT)
> 
>         +qmp_virtio_feature_map_t balloon_map[] = {
>         +#define FEATURE_ENTRY(name) \
>         +    { VIRTIO_BALLOON_F_##name, #name }
>         +    FEATURE_ENTRY(MUST_TELL_HOST),
>         +    FEATURE_ENTRY(STATS_VQ),
>         +    FEATURE_ENTRY(DEFLATE_ON_OOM),
>         +    FEATURE_ENTRY(FREE_PAGE_HINT),
>         +    FEATURE_ENTRY(PAGE_POISON),
>         +    FEATURE_ENTRY(REPORTING),
>         +#undef FEATURE_ENTRY
>         +    { -1, "" }
>         +};
>         +
>          typedef struct PartiallyBalloonedPage {
>              ram_addr_t base_gpa;
>              unsigned long *bitmap;
>         diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
>         index 947a11c3af..5c9a3d045d 100644
>         --- a/hw/virtio/virtio-crypto.c
>         +++ b/hw/virtio/virtio-crypto.c
>         @@ -16,6 +16,7 @@
>          #include "qemu/main-loop.h"
>          #include "qemu/module.h"
>          #include "qapi/error.h"
>         +#include "qapi/qapi-visit-virtio.h"
>          #include "qemu/error-report.h"
> 
>          #include "hw/virtio/virtio.h"
>         @@ -23,10 +24,19 @@
>          #include "hw/qdev-properties.h"
>          #include "hw/virtio/virtio-access.h"
>          #include "standard-headers/linux/virtio_ids.h"
>         +#include "standard-headers/linux/vhost_types.h"
>          #include "sysemu/cryptodev-vhost.h"
> 
>          #define VIRTIO_CRYPTO_VM_VERSION 1
> 
>         +qmp_virtio_feature_map_t crypto_map[] = {
>         +#define FEATURE_ENTRY(name) \
>         +    { VHOST_F_##name, #name }
>         +    FEATURE_ENTRY(LOG_ALL),
>         +#undef FEATURE_ENTRY
>         +    { -1, "" }
>         +};
>         +
>          /*
>           * Transfer virtqueue index to crypto queue index.
>           * The control virtqueue is after the data virtqueues
>         diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>         index 4ed5bb16ba..d993106d10 100644
>         --- a/hw/virtio/virtio-iommu.c
>         +++ b/hw/virtio/virtio-iommu.c
>         @@ -26,6 +26,7 @@
>          #include "sysemu/kvm.h"
>          #include "sysemu/reset.h"
>          #include "qapi/error.h"
>         +#include "qapi/qapi-visit-virtio.h"
>          #include "qemu/error-report.h"
>          #include "trace.h"
> 
>         @@ -41,6 +42,19 @@
>          #define VIOMMU_DEFAULT_QUEUE_SIZE 256
>          #define VIOMMU_PROBE_SIZE 512
> 
>         +qmp_virtio_feature_map_t iommu_map[] = {
>         +#define FEATURE_ENTRY(name) \
>         +    { VIRTIO_IOMMU_F_##name, #name }
>         +    FEATURE_ENTRY(INPUT_RANGE),
>         +    FEATURE_ENTRY(DOMAIN_RANGE),
>         +    FEATURE_ENTRY(MAP_UNMAP),
>         +    FEATURE_ENTRY(BYPASS),
>         +    FEATURE_ENTRY(PROBE),
>         +    FEATURE_ENTRY(MMIO),
>         +#undef FEATURE_ENTRY
>         +    { -1, "" }
>         +};
>         +
>          typedef struct VirtIOIOMMUDomain {
>              uint32_t id;
>              bool bypass;
>         diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
>         index 465a996214..31e7af834e 100644
>         --- a/hw/virtio/virtio-mem.c
>         +++ b/hw/virtio/virtio-mem.c
>         @@ -25,6 +25,7 @@
>          #include "hw/virtio/virtio-mem.h"
>          #include "qapi/error.h"
>          #include "qapi/visitor.h"
>         +#include "qapi/qapi-visit-virtio.h"
>          #include "exec/ram_addr.h"
>          #include "migration/misc.h"
>          #include "hw/boards.h"
>         @@ -32,6 +33,16 @@
>          #include CONFIG_DEVICES
>          #include "trace.h"
> 
>         +qmp_virtio_feature_map_t mem_map[] = {
>         +#define FEATURE_ENTRY(name) \
>         +    { VIRTIO_MEM_F_##name, #name }
>         +#ifndef CONFIG_ACPI
>         +    FEATURE_ENTRY(ACPI_PXM),
>         +#endif /* CONFIG_ACPI */
>         +#undef FEATURE_ENTRY
>         +    { -1, "" }
>         +};
>         +
>          /*
>           * We only had legacy x86 guests that did not support
>           * VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE. Other targets don't have legacy guests.
>         diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>         index 7f8eb29ced..af376be933 100644
>         --- a/hw/virtio/virtio.c
>         +++ b/hw/virtio/virtio.c
>         @@ -34,10 +34,99 @@
>          #include "sysemu/dma.h"
>          #include "sysemu/runstate.h"
>          #include "standard-headers/linux/virtio_ids.h"
>         +#include "standard-headers/linux/vhost_types.h"
>         +#include CONFIG_DEVICES
> 
>          /* QAPI list of realized VirtIODevices */
>          static QTAILQ_HEAD(, VirtIODevice) virtio_list;
> 
>         +/*
>         + * Maximum size of virtio device config space
>         + */
>         +#define VHOST_USER_MAX_CONFIG_SIZE 256
>         +
>         +enum VhostUserProtocolFeature {
>         +    VHOST_USER_PROTOCOL_F_MQ = 0,
>         +    VHOST_USER_PROTOCOL_F_LOG_SHMFD = 1,
>         +    VHOST_USER_PROTOCOL_F_RARP = 2,
>         +    VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
>         +    VHOST_USER_PROTOCOL_F_NET_MTU = 4,
>         +    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
>         +    VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
>         +    VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
>         +    VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
>         +    VHOST_USER_PROTOCOL_F_CONFIG = 9,
>         +    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
>         +    VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
>         +    VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
>         +    VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
>         +    VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
>         +    VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
>         +    VHOST_USER_PROTOCOL_F_MAX
>         +};
>         +
>         +static qmp_virtio_feature_map_t transport_map[] = {
>         +#define FEATURE_ENTRY(name) \
>         +    { VIRTIO_F_##name, #name }
>         +#ifndef VIRTIO_CONFIG_NO_LEGACY
>         +    FEATURE_ENTRY(NOTIFY_ON_EMPTY),
>         +    FEATURE_ENTRY(ANY_LAYOUT),
>         +#endif /* VIRTIO_CONFIG_NO_LEGACY */
>         +    FEATURE_ENTRY(VERSION_1),
>         +    FEATURE_ENTRY(IOMMU_PLATFORM),
>         +    FEATURE_ENTRY(RING_PACKED),
>         +    FEATURE_ENTRY(ORDER_PLATFORM),
>         +    FEATURE_ENTRY(SR_IOV),
>         +#undef FEATURE_ENTRY
>         +#define FEATURE_ENTRY(name) \
>         +    { VIRTIO_RING_F_##name, #name }
>         +    FEATURE_ENTRY(INDIRECT_DESC),
>         +    FEATURE_ENTRY(EVENT_IDX),
>         +#undef FEATURE_ENTRY
>         +#define FEATURE_ENTRY(name) \
>         +    { VHOST_USER_F_##name, #name }
>         +    FEATURE_ENTRY(PROTOCOL_FEATURES),
>         +#undef FEATURE_ENTRY
>         +    { -1, "" }
>         +};
>         +
>         +static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
>         +#define FEATURE_ENTRY(name) \
>         +    { VHOST_USER_PROTOCOL_F_##name, #name }
>         +    FEATURE_ENTRY(MQ),
>         +    FEATURE_ENTRY(LOG_SHMFD),
>         +    FEATURE_ENTRY(RARP),
>         +    FEATURE_ENTRY(REPLY_ACK),
>         +    FEATURE_ENTRY(NET_MTU),
>         +    FEATURE_ENTRY(SLAVE_REQ),
>         +    FEATURE_ENTRY(CROSS_ENDIAN),
>         +    FEATURE_ENTRY(CRYPTO_SESSION),
>         +    FEATURE_ENTRY(PAGEFAULT),
>         +    FEATURE_ENTRY(CONFIG),
>         +    FEATURE_ENTRY(SLAVE_SEND_FD),
>         +    FEATURE_ENTRY(HOST_NOTIFIER),
>         +    FEATURE_ENTRY(INFLIGHT_SHMFD),
>         +    FEATURE_ENTRY(RESET_DEVICE),
>         +    FEATURE_ENTRY(INBAND_NOTIFICATIONS),
>         +    FEATURE_ENTRY(CONFIGURE_MEM_SLOTS),
>         +#undef FEATURE_ENTRY
>         +    { -1, "" }
>         +};
>         +
>         +/* virtio device configuration statuses */
>         +static qmp_virtio_feature_map_t config_status_map[] = {
>         +#define STATUS_ENTRY(name) \
>         +    { VIRTIO_CONFIG_S_##name, #name }
>         +    STATUS_ENTRY(DRIVER_OK),
>         +    STATUS_ENTRY(FEATURES_OK),
>         +    STATUS_ENTRY(DRIVER),
>         +    STATUS_ENTRY(NEEDS_RESET),
>         +    STATUS_ENTRY(FAILED),
>         +    STATUS_ENTRY(ACKNOWLEDGE),
>         +#undef STATUS_ENTRY
>         +    { -1, "" }
>         +};
>         +
>          /*
>           * The alignment to use between consumer and producer parts of vring.
>           * x86 pagesize again. This is the default, used by transports like PCI
>         @@ -3962,6 +4051,196 @@ static VirtIODevice *virtio_device_find(const char *path)
>              return NULL;
>          }
> 
>         +#define CONVERT_FEATURES(type, map, is_status, bitmap)   \
>         +    ({                                                   \
>         +        type *list = NULL;                               \
>         +        type *node;                                      \
>         +        for (i = 0; map[i].virtio_bit != -1; i++) {      \
>         +            if (is_status) {                             \
>         +                bit = map[i].virtio_bit;                 \
>         +            }                                            \
>         +            else {                                       \
>         +                bit = 1ULL << map[i].virtio_bit;         \
>         +            }                                            \
>         +            if ((bitmap & bit) == 0) {                   \
>         +                continue;                                \
>         +            }                                            \
>         +            node = g_new0(type, 1);                      \
>         +            node->value = g_strdup(map[i].feature_name); \
>         +            node->next = list;                           \
>         +            list = node;                                 \
>         +            bitmap ^= bit;                               \
>         +        }                                                \
>         +        list;                                            \
>         +    })
>         +
>         +static VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
>         +{
>         +    VirtioDeviceStatus *status;
>         +    uint8_t bit;
>         +    int i;
>         +
>         +    status = g_new0(VirtioDeviceStatus, 1);
>         +    status->statuses = CONVERT_FEATURES(strList, config_status_map, 1, bitmap);
>         +    status->has_unknown_statuses = bitmap != 0;
>         +    if (status->has_unknown_statuses) {
>         +        status->unknown_statuses = bitmap;
>         +    }
>         +
>         +    return status;
>         +}
>         +
>         +static VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap)
>         +{
>         +    VhostDeviceProtocols *vhu_protocols;
>         +    uint64_t bit;
>         +    int i;
>         +
>         +    vhu_protocols = g_new0(VhostDeviceProtocols, 1);
>         +    vhu_protocols->protocols =
>         +                    CONVERT_FEATURES(strList,
>         +                                     vhost_user_protocol_map, 0, bitmap);
>         +    vhu_protocols->has_unknown_protocols = bitmap != 0;
>         +    if (vhu_protocols->has_unknown_protocols) {
>         +        vhu_protocols->unknown_protocols = bitmap;
>         +    }
>         +
>         +    return vhu_protocols;
>         +}
>         +
>         +static VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id,
>         +                                                 uint64_t bitmap)
>         +{
>         +    VirtioDeviceFeatures *features;
>         +    uint64_t bit;
>         +    int i;
>         +
>         +    features = g_new0(VirtioDeviceFeatures, 1);
>         +    features->has_dev_features = true;
>         +
>         +    /* transport features */
>         +    features->transports = CONVERT_FEATURES(strList, transport_map, 0, bitmap);
>         +
>         +    /* device features */
>         +    switch (device_id) {
>         +#ifdef CONFIG_VIRTIO_SERIAL
>         +    case VIRTIO_ID_CONSOLE:
>         +        features->dev_features =
>         +            CONVERT_FEATURES(strList, serial_map, 0, bitmap);
>         +        break;
>         +#endif
>         +#ifdef CONFIG_VIRTIO_BLK
>         +    case VIRTIO_ID_BLOCK:
>         +        features->dev_features =
>         +            CONVERT_FEATURES(strList, blk_map, 0, bitmap);
>         +        break;
>         +#endif
>         +#ifdef CONFIG_VIRTIO_GPU
>         +    case VIRTIO_ID_GPU:
>         +        features->dev_features =
>         +            CONVERT_FEATURES(strList, gpu_map, 0, bitmap);
>         +        break;
>         +#endif
>         +#ifdef CONFIG_VIRTIO_NET
>         +    case VIRTIO_ID_NET:
>         +        features->dev_features =
>         +            CONVERT_FEATURES(strList, net_map, 0, bitmap);
>         +        break;
>         +#endif
>         +#ifdef CONFIG_VIRTIO_SCSI
>         +    case VIRTIO_ID_SCSI:
>         +        features->dev_features =
>         +            CONVERT_FEATURES(strList, scsi_map, 0, bitmap);
>         +        break;
>         +#endif
>         +#ifdef CONFIG_VIRTIO_BALLOON
>         +    case VIRTIO_ID_BALLOON:
>         +        features->dev_features =
>         +            CONVERT_FEATURES(strList, balloon_map, 0, bitmap);
>         +        break;
>         +#endif
>         +#ifdef CONFIG_VIRTIO_IOMMU
>         +    case VIRTIO_ID_IOMMU:
>         +        features->dev_features =
>         +            CONVERT_FEATURES(strList, iommu_map, 0, bitmap);
>         +        break;
>         +#endif
>         +#ifdef CONFIG_VIRTIO_INPUT
>         +    case VIRTIO_ID_INPUT:
>         +        features->dev_features =
>         +            CONVERT_FEATURES(strList, input_map, 0, bitmap);
>         +        break;
>         +#endif
>         +#ifdef CONFIG_VHOST_USER_FS
>         +    case VIRTIO_ID_FS:
>         +        features->dev_features =
>         +            CONVERT_FEATURES(strList, fs_map, 0, bitmap);
>         +        break;
>         +#endif
>         +#ifdef CONFIG_VHOST_VSOCK
>         +    case VIRTIO_ID_VSOCK:
>         +        features->dev_features =
>         +            CONVERT_FEATURES(strList, vsock_map, 0, bitmap);
>         +        break;
>         +#endif
>         +#ifdef CONFIG_VIRTIO_CRYPTO
>         +    case VIRTIO_ID_CRYPTO:
>         +        features->dev_features =
>         +            CONVERT_FEATURES(strList, crypto_map, 0, bitmap);
>         +        break;
>         +#endif
>         +#ifdef CONFIG_VIRTIO_MEM
>         +    case VIRTIO_ID_MEM:
>         +        features->dev_features =
>         +            CONVERT_FEATURES(strList, mem_map, 0, bitmap);
>         +        break;
>         +#endif
>         +#ifdef CONFIG_VIRTIO_I2C_ADAPTER
>         +    case VIRTIO_ID_I2C_ADAPTER:
>         +        features->dev_features =
>         +            CONVERT_FEATURES(strList, i2c_map, 0, bitmap);
>         +        break;
>         +#endif
>         +    /* No features */
>         +    case VIRTIO_ID_9P:
>         +    case VIRTIO_ID_PMEM:
>         +    case VIRTIO_ID_RNG:
>         +    case VIRTIO_ID_IOMEM:
>         +    case VIRTIO_ID_RPMSG:
>         +    case VIRTIO_ID_CLOCK:
>         +    case VIRTIO_ID_MAC80211_WLAN:
>         +    case VIRTIO_ID_MAC80211_HWSIM:
>         +    case VIRTIO_ID_RPROC_SERIAL:
>         +    case VIRTIO_ID_MEMORY_BALLOON:
>         +    case VIRTIO_ID_CAIF:
>         +    case VIRTIO_ID_SIGNAL_DIST:
>         +    case VIRTIO_ID_PSTORE:
>         +    case VIRTIO_ID_SOUND:
>         +    case VIRTIO_ID_BT:
>         +    case VIRTIO_ID_RPMB:
>         +    case VIRTIO_ID_VIDEO_ENCODER:
>         +    case VIRTIO_ID_VIDEO_DECODER:
>         +    case VIRTIO_ID_SCMI:
>         +    case VIRTIO_ID_NITRO_SEC_MOD:
>         +    case VIRTIO_ID_WATCHDOG:
>         +    case VIRTIO_ID_CAN:
>         +    case VIRTIO_ID_DMABUF:
>         +    case VIRTIO_ID_PARAM_SERV:
>         +    case VIRTIO_ID_AUDIO_POLICY:
>         +    case VIRTIO_ID_GPIO:
>         +        break;
>         +    default:
>         +        g_assert_not_reached();
>         +    }
>         +
>         +    features->has_unknown_dev_features = bitmap != 0;
>         +    if (features->has_unknown_dev_features) {
>         +        features->unknown_dev_features = bitmap;
>         +    }
>         +
>         +    return features;
>         +}
>         +
>          VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
>          {
>              VirtIODevice *vdev;
>         @@ -3977,9 +4256,12 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
>              status->name = g_strdup(vdev->name);
>              status->device_id = vdev->device_id;
>              status->vhost_started = vdev->vhost_started;
>         -    status->guest_features = vdev->guest_features;
>         -    status->host_features = vdev->host_features;
>         -    status->backend_features = vdev->backend_features;
>         +    status->guest_features = qmp_decode_features(vdev->device_id,
>         +                                                 vdev->guest_features);
>         +    status->host_features = qmp_decode_features(vdev->device_id,
>         +                                                vdev->host_features);
>         +    status->backend_features = qmp_decode_features(vdev->device_id,
>         +                                                   vdev->backend_features);
> 
>              switch (vdev->device_endian) {
>              case VIRTIO_DEVICE_ENDIAN_LITTLE:
>         @@ -3994,7 +4276,7 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
>              }
> 
>              status->num_vqs = virtio_get_num_queues(vdev);
>         -    status->status = vdev->status;
>         +    status->status = qmp_decode_status(vdev->status);
>              status->isr = vdev->isr;
>              status->queue_sel = vdev->queue_sel;
>              status->vm_running = vdev->vm_running;
>         @@ -4017,10 +4299,14 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
>                  status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
>                  status->vhost_dev->nvqs = hdev->nvqs;
>                  status->vhost_dev->vq_index = hdev->vq_index;
>         -        status->vhost_dev->features = hdev->features;
>         -        status->vhost_dev->acked_features = hdev->acked_features;
>         -        status->vhost_dev->backend_features = hdev->backend_features;
>         -        status->vhost_dev->protocol_features = hdev->protocol_features;
>         +        status->vhost_dev->features =
>         +            qmp_decode_features(vdev->device_id, hdev->features);
>         +        status->vhost_dev->acked_features =
>         +            qmp_decode_features(vdev->device_id, hdev->acked_features);
>         +        status->vhost_dev->backend_features =
>         +            qmp_decode_features(vdev->device_id, hdev->backend_features);
>         +        status->vhost_dev->protocol_features =
>         +            qmp_decode_protocols(hdev->protocol_features);
>                  status->vhost_dev->max_queues = hdev->max_queues;
>                  status->vhost_dev->backend_cap = hdev->backend_cap;
>                  status->vhost_dev->log_enabled = hdev->log_enabled;
>         diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>         index 58a73e7b7a..4aaa21faf6 100644
>         --- a/include/hw/virtio/vhost.h
>         +++ b/include/hw/virtio/vhost.h
>         @@ -5,6 +5,9 @@
>          #include "hw/virtio/virtio.h"
>          #include "exec/memory.h"
> 
>         +#define VHOST_F_DEVICE_IOTLB 63
>         +#define VHOST_USER_F_PROTOCOL_FEATURES 30
>         +
>          /* Generic structures common for any vhost based device. */
> 
>          struct vhost_inflight {
>         diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>         index ef99a626a8..9df4e081c9 100644
>         --- a/include/hw/virtio/virtio.h
>         +++ b/include/hw/virtio/virtio.h
>         @@ -71,6 +71,25 @@ typedef struct VirtQueueElement
>          #define TYPE_VIRTIO_DEVICE "virtio-device"
>          OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
> 
>         +typedef struct {
>         +    int virtio_bit;
>         +    const char *feature_name;
>         +} qmp_virtio_feature_map_t;
>         +
>         +extern qmp_virtio_feature_map_t serial_map[];
>         +extern qmp_virtio_feature_map_t blk_map[];
>         +extern qmp_virtio_feature_map_t gpu_map[];
>         +extern qmp_virtio_feature_map_t net_map[];
>         +extern qmp_virtio_feature_map_t scsi_map[];
>         +extern qmp_virtio_feature_map_t balloon_map[];
>         +extern qmp_virtio_feature_map_t iommu_map[];
>         +extern qmp_virtio_feature_map_t input_map[];
>         +extern qmp_virtio_feature_map_t fs_map[];
>         +extern qmp_virtio_feature_map_t vsock_map[];
>         +extern qmp_virtio_feature_map_t crypto_map[];
>         +extern qmp_virtio_feature_map_t mem_map[];
>         +extern qmp_virtio_feature_map_t i2c_map[];
>         +
> 
> 
>     So this hack where extern is in a common header, but the
>     actual values are spread in individual C files is not really
>     acceptable.
> 
> Understood. Will move these map definitions into virtio.c
> instead.
> 
> 
>     Also, the names are too generic and are not prefixed with
>     virtio which is a problem for a generic virtio.h header.
>     this kind of name is only ok as a static variable.
> 
> No problem, I can change them to something like
> 'virtio_x_feature_map'.
> 
> 
>     And, it seems to be causing problems when some devices
>     are disabled at config time. E.g. with virtio gpu disabled
>     we get:
> 
>     https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/jobs/2463276202__;!!ACWV5N9M2RV99hQ!LxUl7ygdoZjKT_zWfAfkcior1j2Bn4E5okOrtbudwWyRsmGyRMxMdQlIVhn5AhR7n6LHvABmkhnR$
>     https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/jobs/2463276291__;!!ACWV5N9M2RV99hQ!LxUl7ygdoZjKT_zWfAfkcior1j2Bn4E5okOrtbudwWyRsmGyRMxMdQlIVhn5AhR7n6LHvK89VWxr$
> 
>     libqemu-ppc64-softmmu.fa.p/hw_virtio_virtio.c.o: In function `qmp_decode_features':
>     /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4167: undefined reference to `gpu_map'
>     /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4167: undefined reference to `gpu_map'
> 
> 
>     I could not figure it out from a quick look, please debug.
> 
> Got it, will debug. May be missing an #ifdef somewhere I suspect...
> 
> It will take some time for me to get the next series (v15) out since
> I'll be away next week but hopefully I'll be able to get them out sooner
> rather than later once I'm back.
> 
> Thanks,
> 
> Jonah
> 
> 
> 
> 
>          enum virtio_device_endian {
>              VIRTIO_DEVICE_ENDIAN_UNKNOWN,
>              VIRTIO_DEVICE_ENDIAN_LITTLE,
>         diff --git a/qapi/virtio.json b/qapi/virtio.json
>         index ba61d83df7..474a8bd64e 100644
>         --- a/qapi/virtio.json
>         +++ b/qapi/virtio.json
>         @@ -106,10 +106,10 @@
>                      'n-tmp-sections': 'int',
>                      'nvqs': 'uint32',
>                      'vq-index': 'int',
>         -            'features': 'uint64',
>         -            'acked-features': 'uint64',
>         -            'backend-features': 'uint64',
>         -            'protocol-features': 'uint64',
>         +            'features': 'VirtioDeviceFeatures',
>         +            'acked-features': 'VirtioDeviceFeatures',
>         +            'backend-features': 'VirtioDeviceFeatures',
>         +            'protocol-features': 'VhostDeviceProtocols',
>                      'max-queues': 'uint64',
>                      'backend-cap': 'uint64',
>                      'log-enabled': 'bool',
>         @@ -176,11 +176,11 @@
>                      'device-id': 'uint16',
>                      'vhost-started': 'bool',
>                      'device-endian': 'str',
>         -            'guest-features': 'uint64',
>         -            'host-features': 'uint64',
>         -            'backend-features': 'uint64',
>         +            'guest-features': 'VirtioDeviceFeatures',
>         +            'host-features': 'VirtioDeviceFeatures',
>         +            'backend-features': 'VirtioDeviceFeatures',
>                      'num-vqs': 'int',
>         -            'status': 'uint8',
>         +            'status': 'VirtioDeviceStatus',
>                      'isr': 'uint8',
>                      'queue-sel': 'uint16',
>                      'vm-running': 'bool',
>         @@ -222,14 +222,28 @@
>          #            "name": "virtio-crypto",
>          #            "started": true,
>          #            "device-id": 20,
>         -#            "backend-features": 0,
>         +#            "backend-features": {
>         +#               "transports": [],
>         +#               "dev-features": []
>         +#            },
>          #            "start-on-kick": false,
>          #            "isr": 1,
>          #            "broken": false,
>         -#            "status": 15,
>         +#            "status": {
>         +#               "statuses": ["ACKNOWLEDGE", "DRIVER", "FEATURES_OK",
>         +#                            "DRIVER_OK"]
>         +#            },
>          #            "num-vqs": 2,
>         -#            "guest-features": 5100273664,
>         -#            "host-features": 6325010432,
>         +#            "guest-features": {
>         +#               "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
>         +#               "dev-features": []
>         +#            },
>         +#            "host-features": {
>         +#               "transports": ["PROTOCOL_FEATURES", "EVENT_IDX",
>         +#                              "INDIRECT_DESC", "VERSION_1", "ANY_LAYOUT",
>         +#                              "NOTIFY_ON_EMPTY"],
>         +#               "dev-features": []
>         +#            },
>          #            "use-guest-notifier-mask": true,
>          #            "vm-running": true,
>          #            "queue-sel": 1,
>         @@ -257,22 +271,65 @@
>          #               "max-queues": 1,
>          #               "backend-cap": 2,
>          #               "log-size": 0,
>         -#               "backend-features": 0,
>         +#               "backend-features": {
>         +#                  "transports": [],
>         +#                  "dev-features": []
>         +#               },
>          #               "nvqs": 2,
>         -#               "protocol-features": 0,
>         +#               "protocol-features": {
>         +#                  "protocols": []
>         +#               },
>          #               "vq-index": 0,
>          #               "log-enabled": false,
>         -#               "acked-features": 5100306432,
>         -#               "features": 13908344832
>         +#               "acked-features": {
>         +#                  "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1",
>         +#                                 "ANY_LAYOUT", "NOTIFY_ON_EMPTY"],
>         +#                  "dev-features": ["MRG_RXBUF"]
>         +#               },
>         +#               "features": {
>         +#                  "transports": ["EVENT_IDX", "INDIRECT_DESC",
>         +#                                 "IOMMU_PLATFORM", "VERSION_1", "ANY_LAYOUT",
>         +#                                 "NOTIFY_ON_EMPTY"],
>         +#                  "dev-features": ["LOG_ALL", "MRG_RXBUF"]
>         +#               }
>         +#            },
>         +#            "backend-features": {
>         +#               "transports": ["PROTOCOL_FEATURES", "EVENT_IDX", "INDIRECT_DESC",
>         +#                              "VERSION_1", "ANY_LAYOUT", "NOTIFY_ON_EMPTY"],
>         +#               "dev-features": ["GSO", "CTRL_MAC_ADDR", "GUEST_ANNOUNCE", "CTRL_RX_EXTRA",
>         +#                                "CTRL_VLAN", "CTRL_RX", "CTRL_VQ", "STATUS", "MRG_RXBUF",
>         +#                                "HOST_UFO", "HOST_ECN", "HOST_TSO6", "HOST_TSO4",
>         +#                                "GUEST_UFO", "GUEST_ECN", "GUEST_TSO6", "GUEST_TSO4",
>         +#                                "MAC", "CTRL_GUEST_OFFLOADS", "GUEST_CSUM", "CSUM"]
>          #            },
>         -#            "backend-features": 6337593319,
>          #            "start-on-kick": false,
>          #            "isr": 1,
>          #            "broken": false,
>         -#            "status": 15,
>         +#            "status": {
>         +#               "statuses": ["ACKNOWLEDGE", "DRIVER", "FEATURES_OK", "DRIVER_OK"]
>         +#            },
>          #            "num-vqs": 3,
>         -#            "guest-features": 5111807911,
>         -#            "host-features": 6337593319,
>         +#            "guest-features": {
>         +#               "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
>         +#               "dev-features": ["CTRL_MAC_ADDR", "GUEST_ANNOUNCE", "CTRL_VLAN",
>         +#                                "CTRL_RX", "CTRL_VQ", "STATUS", "MRG_RXBUF",
>         +#                                "HOST_UFO", "HOST_ECN", "HOST_TSO6",
>         +#                                "HOST_TSO4", "GUEST_UFO", "GUEST_ECN",
>         +#                                "GUEST_TSO6", "GUEST_TSO4", "MAC",
>         +#                                "CTRL_GUEST_OFFLOADS", "GUEST_CSUM", "CSUM"]
>         +#            },
>         +#            "host-features": {
>         +#               "transports": ["PROTOCOL_FEATURES", "EVENT_IDX",
>         +#                              "INDIRECT_DESC", "VERSION_1", "ANY_LAYOUT",
>         +#                              "NOTIFY_ON_EMPTY"],
>         +#               "dev-features": ["GSO", "CTRL_MAC_ADDR", "GUEST_ANNOUNCE",
>         +#                                "CTRL_RX_EXTRA", "CTRL_VLAN", "CTRL_RX",
>         +#                                "CTRL_VQ", "STATUS", "MRG_RXBUF", "HOST_UFO",
>         +#                                "HOST_ECN", "HOST_TSO4", "HOST_TSO4",
>         +#                                "GUEST_UFO", "GUEST_ECN", "GUEST_TSO6",
>         +#                                "GUEST_TSO4", "MAC", "CTRL_GUEST_OFFLOADS",
>         +#                                "GUEST_CSUM", "CSUM"]
>         +#            },
>          #            "use-guest-notifier-mask": true,
>          #            "vm-running": true,
>          #            "queue-sel": 2,
>         @@ -288,3 +345,62 @@
>            'data': { 'path': 'str' },
>            'returns': 'VirtioStatus',
>            'features': [ 'unstable' ] }
>         +
>         +##
>         +# @VirtioDeviceStatus:
>         +#
>         +# A structure defined to list the configuration statuses of a virtio
>         +# device
>         +#
>         +# @statuses: List of decoded configuration statuses of the virtio
>         +#            device
>         +#
>         +# @unknown-statuses: Virtio device statuses bitmap that have not been decoded
>         +#
>         +# Since: 7.0
>         +##
>         +
>         +{ 'struct': 'VirtioDeviceStatus',
>         +  'data': { 'statuses': [ 'str' ],
>         +            '*unknown-statuses': 'uint8' } }
>         +
>         +##
>         +# @VhostDeviceProtocols:
>         +#
>         +# A structure defined to list the vhost user protocol features of a
>         +# Vhost User device
>         +#
>         +# @protocols: List of decoded vhost user protocol features of a vhost
>         +#             user device
>         +#
>         +# @unknown-protocols: Vhost user device protocol features bitmap that
>         +#                     have not been decoded
>         +#
>         +# Since: 7.0
>         +##
>         +
>         +{ 'struct': 'VhostDeviceProtocols',
>         +  'data': { 'protocols': [ 'str' ],
>         +            '*unknown-protocols': 'uint64' } }
>         +
>         +##
>         +# @VirtioDeviceFeatures:
>         +#
>         +# The common fields that apply to most Virtio devices. Some devices
>         +# may not have their own device-specific features (e.g. virtio-rng).
>         +#
>         +# @transports: List of transport features of the virtio device
>         +#
>         +# @dev-features: List of device-specific features (if the device has
>         +#                unique features)
>         +#
>         +# @unknown-dev-features: Virtio device features bitmap that have not
>         +#                        been decoded
>         +#
>         +# Since: 7.0
>         +##
>         +
>         +{ 'struct': 'VirtioDeviceFeatures',
>         +  'data': { 'transports': [ 'str' ],
>         +            '*dev-features': [ 'str' ],
>         +            '*unknown-dev-features': 'uint64' } }
>         --
>         2.35.1
> 


