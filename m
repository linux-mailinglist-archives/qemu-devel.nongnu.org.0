Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9377546B335
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 07:50:09 +0100 (CET)
Received: from localhost ([::1]:49836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muUIg-000055-Fh
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 01:50:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1muUDe-00074f-A3
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 01:44:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1muUDZ-0002zg-7r
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 01:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638859487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gBeYnKMRZjX6z04LB4TCyVUuNOOA+xhccOGec5TBI5w=;
 b=B648wBRwGm3K+RWS021zr3SLOr812kDKfjkLqErzcsMXgou+qjYSXb9jS3pUUBooPb5ELR
 LUca0EX+yky8OR6qRC6Nr4KNwFt4pJSeHM23Fji2TwdTUbN4T/TWSL65CxBNCJYKUbnDrq
 SIYG4AI7e94HwxdYmUeaMNowMPFC5oY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-XnCzwnRGOSiaaQVr4-A_Ig-1; Tue, 07 Dec 2021 01:44:44 -0500
X-MC-Unique: XnCzwnRGOSiaaQVr4-A_Ig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C11F3801AAB;
 Tue,  7 Dec 2021 06:44:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7800419C59;
 Tue,  7 Dec 2021 06:43:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 081DA113865F; Tue,  7 Dec 2021 07:43:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v10 3/8] qmp: add QMP command x-query-virtio
References: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
 <1638794606-19631-4-git-send-email-jonah.palmer@oracle.com>
Date: Tue, 07 Dec 2021 07:43:51 +0100
In-Reply-To: <1638794606-19631-4-git-send-email-jonah.palmer@oracle.com>
 (Jonah Palmer's message of "Mon, 6 Dec 2021 07:43:21 -0500")
Message-ID: <87ee6ogbiw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jonah Palmer <jonah.palmer@oracle.com> writes:

> From: Laurent Vivier <lvivier@redhat.com>
>
> This new command lists all the instances of VirtIODevices with
> their canonical QOM path and name.
>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> ---
>  hw/virtio/meson.build      |  2 ++
>  hw/virtio/virtio-stub.c    | 14 ++++++++++
>  hw/virtio/virtio.c         | 27 ++++++++++++++++++
>  include/hw/virtio/virtio.h |  1 +
>  qapi/meson.build           |  1 +
>  qapi/qapi-schema.json      |  1 +
>  qapi/virtio.json           | 68 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/qtest/qmp-cmd-test.c |  1 +
>  8 files changed, 115 insertions(+)
>  create mode 100644 hw/virtio/virtio-stub.c
>  create mode 100644 qapi/virtio.json
>
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 521f7d6..d893f5f 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -6,8 +6,10 @@ softmmu_virtio_ss.add(when: 'CONFIG_VHOST', if_false: files('vhost-stub.c'))
>  
>  softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
>  softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
> +softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
>  
>  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
> +softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
>  
>  virtio_ss = ss.source_set()
>  virtio_ss.add(files('virtio.c'))
> diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
> new file mode 100644
> index 0000000..05a81ed
> --- /dev/null
> +++ b/hw/virtio/virtio-stub.c
> @@ -0,0 +1,14 @@
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-virtio.h"
> +
> +static void *qmp_virtio_unsupported(Error **errp)
> +{
> +    error_setg(errp, "Virtio is disabled");
> +    return NULL;
> +}
> +
> +VirtioInfoList *qmp_x_query_virtio(Error **errp)
> +{
> +    return qmp_virtio_unsupported(errp);
> +}
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 867834d..76a63a0 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -13,6 +13,8 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-commands-virtio.h"
> +#include "qapi/qapi-visit-virtio.h"
>  #include "cpu.h"
>  #include "trace.h"
>  #include "qemu/error-report.h"
> @@ -29,6 +31,9 @@
>  #include "sysemu/runstate.h"
>  #include "standard-headers/linux/virtio_ids.h"
>  
> +/* QAPI list of realized VirtIODevices */
> +static QTAILQ_HEAD(, VirtIODevice) virtio_list;
> +
>  /*
>   * The alignment to use between consumer and producer parts of vring.
>   * x86 pagesize again. This is the default, used by transports like PCI
> @@ -3700,6 +3705,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
>      vdev->listener.commit = virtio_memory_listener_commit;
>      vdev->listener.name = "virtio";
>      memory_listener_register(&vdev->listener, vdev->dma_as);
> +    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
>  }
>  
>  static void virtio_device_unrealize(DeviceState *dev)
> @@ -3714,6 +3720,7 @@ static void virtio_device_unrealize(DeviceState *dev)
>          vdc->unrealize(dev);
>      }
>  
> +    QTAILQ_REMOVE(&virtio_list, vdev, next);
>      g_free(vdev->bus_name);
>      vdev->bus_name = NULL;
>  }
> @@ -3887,6 +3894,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
>      vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
>  
>      vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
> +
> +    QTAILQ_INIT(&virtio_list);
>  }

@virtio_list duplicates information that exists in the QOM composition
tree.  It needs to stay in sync.  You could search the composition tree
instead.  I don't particularly care, but a virtio or QOM maintainer
might have a preference.

>  
>  bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
> @@ -3897,6 +3906,24 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
>      return virtio_bus_ioeventfd_enabled(vbus);
>  }
>  
> +VirtioInfoList *qmp_x_query_virtio(Error **errp)
> +{
> +    VirtioInfoList *list = NULL;
> +    VirtioInfoList *node;
> +    VirtIODevice *vdev;
> +
> +    QTAILQ_FOREACH(vdev, &virtio_list, next) {
> +        DeviceState *dev = DEVICE(vdev);
> +        node = g_new0(VirtioInfoList, 1);
> +        node->value = g_new(VirtioInfo, 1);
> +        node->value->path = g_strdup(dev->canonical_path);
> +        node->value->name = g_strdup(vdev->name);
> +        QAPI_LIST_PREPEND(list, node->value);
> +    }
> +
> +    return list;
> +}
> +
>  static const TypeInfo virtio_device_info = {
>      .name = TYPE_VIRTIO_DEVICE,
>      .parent = TYPE_DEVICE,
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 0a12bd5..3b4eb85 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -110,6 +110,7 @@ struct VirtIODevice
>      bool use_guest_notifier_mask;
>      AddressSpace *dma_as;
>      QLIST_HEAD(, VirtQueue) *vector_queues;
> +    QTAILQ_ENTRY(VirtIODevice) next;
>  };
>  
>  struct VirtioDeviceClass {
> diff --git a/qapi/meson.build b/qapi/meson.build
> index c0c49c1..e332f28 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -48,6 +48,7 @@ qapi_all_modules = [
>    'sockets',
>    'trace',
>    'transaction',
> +  'virtio',
>    'yank',
>  ]
>  if have_system
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index 4912b97..1512ada 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -93,3 +93,4 @@
>  { 'include': 'audio.json' }
>  { 'include': 'acpi.json' }
>  { 'include': 'pci.json' }
> +{ 'include': 'virtio.json' }
> diff --git a/qapi/virtio.json b/qapi/virtio.json
> new file mode 100644
> index 0000000..5372cde
> --- /dev/null
> +++ b/qapi/virtio.json
> @@ -0,0 +1,68 @@
> +# -*- Mode: Python -*-
> +# vim: filetype=python
> +#
> +
> +##
> +# = Virtio devices
> +##
> +
> +##
> +# @VirtioInfo:
> +#
> +# Basic information about a given VirtIODevice
> +#
> +# @path: The VirtIODevice's canonical QOM path
> +#
> +# @name: Name of the VirtIODevice
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'struct': 'VirtioInfo',
> +  'data': { 'path': 'str',
> +            'name': 'str' } }
> +
> +##
> +# @x-query-virtio:
> +#
> +# Returns a list of all realized VirtIODevices
> +#
> +# Features:
> +# @unstable: This command is meant for debugging

End with a period for consistency with existing docs.

> +#
> +# Returns: List of gathered VirtIODevices
> +#
> +# Since: 7.0
> +#
> +# Example:
> +#
> +# -> { "execute": "x-query-virtio" }
> +# <- { "return": [
> +#        {
> +#            "path": "/machine/peripheral-anon/device[4]/virtio-backend",
> +#            "name": "virtio-input"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral/crypto0/virtio-backend",
> +#            "name": "virtio-crypto"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral-anon/device[2]/virtio-backend",
> +#            "name": "virtio-scsi"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
> +#            "name": "virtio-net"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
> +#            "name": "virtio-serial"
> +#        }
> +#      ]
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-query-virtio',
> +  'returns': [ 'VirtioInfo' ],
> +  'features': [ 'unstable' ] }

This command is actually redundant: qom-list and qom-get suffice to
search /machine/ for virtio devices whose property realized is true.

To recognize virtio devices without relying on a naming convention, you
can use

    {"execute": "qom-list-types",
     "arguments": {"implements": "virtio-device"}}

Perhaps we want the command anyway, for convenience.  That's for to the
virtio maintainer to decide, I guess.  In case of "wanted":

QAPI schema
Reviewed-by: Markus Armbruster <armbru@redhat.com>

But please point out the redundancy in the commit message and/or a
comment.

[...]


