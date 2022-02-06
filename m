Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0194AAED4
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:23:42 +0100 (CET)
Received: from localhost ([::1]:41284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGehq-0003iN-2I
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:23:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe1G-0003CW-TP
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:39:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe1E-0003oF-85
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:39:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0vE4QWcOltusrx/+ejXa9/zvF2A/DIwov02Z3bPnFZ8=;
 b=FhE7xPCHHKjBW/4LmQ+v6YkLUw9JZjW4AzRaeVOpVsXLggK+H7nShFFUZxqh6bp2UMRMJs
 pSuKr4aof1wcJP/JHjsv5JJnfd4pYXWXGNoYwuQz34oLYKQFjuITOdOH71KUmq9EylDOyW
 fphv19WJKU9K7mIJIVtHUzWV5KE3zPM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-bjDPlXarNlO5R-uczzypNA-1; Sun, 06 Feb 2022 04:39:38 -0500
X-MC-Unique: bjDPlXarNlO5R-uczzypNA-1
Received: by mail-wm1-f71.google.com with SMTP id
 a8-20020a7bc1c8000000b0037bc4c62e97so211772wmj.0
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:39:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0vE4QWcOltusrx/+ejXa9/zvF2A/DIwov02Z3bPnFZ8=;
 b=zAWYgZ7eE3raI7vw7M5LqK6CKYzKSA++Q1yL75knPiyYQo9o/FG1Z0erXKo1Dwm6l5
 VnGLezDhrI4EliR2QubwoyGmQKlIso1v+zI3N/H/x9YcSgr0DFff51Cxxgby8fuHEp5N
 SB4SoMIvkmoa8l202mJ+TMlKwfMSMCRugHgaggCSzxgckL5fc7Jp9kQj3X5/a4OEP4OB
 CzR69zNGsnj5X2VBkd/5petTd27n0ZL/b+6UJiseQZpUAn9XvrJWK4KgLkG/U4dXeJP4
 Qi8dTDfR0KsVYGdeiXN0LZ/dMO5JqceSMEEOwT128Gf9yUrzIi0OpQmErBF3gGXBKL45
 e/RQ==
X-Gm-Message-State: AOAM531Vw/u4iZkXDDoBxlsZIl22eLlb2Cd3KBDU4NOdc5ECkm9dVzlw
 yIPI14SArNpY5Rtty7r5cVec7wl0xyNDEhTKW5QI72rmg2cYxxR11yCB0cWxMJ4rDy4j2MuUX1Y
 kfqOa6B9azwPdld8=
X-Received: by 2002:a05:600c:3c9f:: with SMTP id
 bg31mr9759035wmb.86.1644140377094; 
 Sun, 06 Feb 2022 01:39:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpwMRc/8YDiMq+WmWYePTrZYiGHD93yZ8tKdsLV7dqWEg+Nn+0R3oAruKJS1amoPfLEaRwlw==
X-Received: by 2002:a05:600c:3c9f:: with SMTP id
 bg31mr9759009wmb.86.1644140376789; 
 Sun, 06 Feb 2022 01:39:36 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id 21sm12648523wmv.11.2022.02.06.01.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:39:35 -0800 (PST)
Date: Sun, 6 Feb 2022 04:39:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v11 0/8] hmp,qmp: Add commands to introspect virtio devices
Message-ID: <20220206043800-mutt-send-email-mst@kernel.org>
References: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: david@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 06:29:20AM -0500, Jonah Palmer wrote:
> This series introduces new QMP/HMP commands to dump the status of a
> virtio device at different levels.

I dropped this patchset due to various build failures.
Pls take a look at Peter's comments on the pull request
to see some of these.

> [Jonah: Rebasing from previous patchset from Dec. 9 (v10). Original patches
>  are by Laurnet Vivier from May 2020.
> 
>  Rebase from v10 to v11 mainly includes a check when querying or gathering
>  any information about a virtio device. This check queries the QOM composition
>  tree to make sure that the device (a) exists and (b) is realized before
>  attempting to get any more information from it. This is done to get some
>  kind of synchronicity between @virtio_list and the QOM composition tree.]
> 
> 1. List available virtio devices in the machine
> 
> HMP Form:
> 
>     info virtio
> 
>     Example:
> 
>         (qemu) info virtio
>         /machine/peripheral/vsock0/virtio-backend [vhost-vsock]
>         /machine/peripheral/crypto0/virtio-backend [virtio-crypto]
>         /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
>         /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
>         /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]
> 
> QMP Form:
> 
>     { 'command': 'x-query-virtio',
>       'returns': ['VirtioInfo'],
>       'features': [ 'unstable' ] }
> 
>     Example:
> 
>         -> { "execute": "x-query-virtio" }
>         <- { "return": [
>                {
>                    "path": "/machine/peripheral/vsock0/virtio-backend",
>                    "name": "vhost-vsock"
>                },
>                {
>                    "path": "/machine/peripheral/crypto0/virtio-backend",
>                    "name": "virtio-crypto"
>                },
>                {
>                    "path": "/machine/peripheral-anon/device[2]/virtio-backend",
>                    "name": "virtio-scsi"
>                },
>                {
>                    "path": "/machine/peripheral-anon/device[1]/virtio-backend",
>                    "name": "virtio-net"
>                },
>                {
>                    "path": "/machine/peripheral-anon/device[0]/virtio-backend",
>                    "name": "virtio-serial"
>                }
>              ]
>            }
> 
> 2. Display status of a given virtio device
> 
> HMP Form:
> 
>     info virtio-status <path>
> 
>     Example:
> 
>         (qemu) info virtio-status /machine/peripheral/vsock0/virtio-backend
>         /machine/peripheral/vsock0/virtio-backend:
>             device_name:             vhost-vsock (vhost)
>             device_id:               19
>             vhost_started:           true
>             bus_name:                (null)
>             broken:                  false
>             disabled:                false
>             disable_legacy_check:    false
>             started:                 true
>             use_started:             true
>             start_on_kick:           false
>             use_guest_notifier_mask: true
>             vm_running:              true
>             num_vqs:                 3
>             queue_sel:               2
>             isr:                     0
>             endianness:              little
>             status: ACKNOWLEDGE, DRIVER, FEATURES_OK, DRIVER_OK
>             Guest features:   EVENT_IDX, INDIRECT_DESC, VERSION_1
>             Host features:    PROTOCOL_FEATURES, EVENT_IDX, INDIRECT_DESC, VERSION_1, ANY_LAYOUT,
>                               NOTIFY_ON_EMPTY
>             Backend features:
>             VHost:
>                 nvqs:           2
>                 vq_index:       0
>                 max_queues:     0
>                 n_mem_sections: 4
>                 n_tmp_sections: 4
>                 backend_cap:    0
>                 log_enabled:    false
>                 log_size:       0
>                 Features:          EVENT_IDX, INDIRECT_DESC, VERSION_1, ANY_LAYOUT, NOTIFY_ON_EMPTY
>                                    LOG_ALL
>                 Acked features:    EVENT_IDX, INDIRECT_DESC, VERSION_1
>                 Backend features:
>                 Protocol features:
> 
> QMP Form:
> 
>     { 'command': 'x-query-virtio-status',
>       'data': { 'path': 'str' },
>       'returns': 'VirtioStatus',
>       'features': [ 'unstable' ] }
> 
>     Example:
> 
>         -> { "execute": "x-query-virtio-status",
>              "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend" }
>            }
>         <- { "return": {
>                    "device-endian": "little",
>                    "bus-name": "",
>                    "disable-legacy-check": false,
>                    "name": "vhost-vsock",
>                    "started": true,
>                    "device-id": 19,
>                    "vhost-dev": {
>                       "n-tmp-sections": 4,
>                       "n-mem-sections": 4,
>                       "max-queues": 0,
>                       "backend-cap": 0,
>                       "log-size": 0,
>                       "backend-features": {
>                          "transports": [],
>                          "dev-features": []
>                       },
>                       "nvqs": 2,
>                       "protocol-features": {
>                          "protocols": []
>                       },
>                       "vq-index": 0,
>                       "log-enabled": false,
>                       "acked-features": {
>                          "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
>                          "dev-features": []
>                       },
>                       "features": {
>                          "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1", "ANY_LAYOUT",
>                                         "NOTIFY_ON_EMPTY"],
>                          "dev-features": ["LOG_ALL"]
>                       }
>                    },
>                    "backend-features": {
>                       "transports": [],
>                       "dev-features": []
>                    },
>                    "start-on-kick": false,
>                    "isr": 0,
>                    "broken": false,
>                    "status": {
>                       "statuses": ["ACKNOWLEDGE", "DRIVER", "FEATURES_OK", "DRIVER_OK"]
>                    },
>                    "num-vqs": 3,
>                    "guest-features": {
>                       "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
>                       "dev-features": []
>                    },
>                    "host-features": {
>                       "transports": ["PROTOCOL_FEATURES", "EVENT_IDX", "INDIRECT_DESC", "VERSION_1",
>                                      "ANY_LAYOUT", "NOTIFY_ON_EMPTY"],
>                       "dev-features": []
>                    },
>                    "use-guest-notifier-mask": true,
>                    "vm-running": true,
>                    "queue-sel": 2,
>                    "disabled": false,
>                    "vhost-started": true,
>                    "use-started": true
>              }
>            }
> 
> 
> 3. Display status of a given virtio queue
> 
> HMP Form:
> 
>     info virtio-queue-status <path> <queue>
> 
>     Example:
> 
>         (qemu) info virtio-queue-status /machine/peripheral-anon/device[1]/virtio-backend 2
>         /machine/peripheral-anon/device[1]/virtio-backend:
>             device_name:          virtio-net
>             queue_index:          2
>             inuse:                0
>             used_idx:             27
>             signalled_used:       27
>             signalled_used_valid: true
>             VRing:
>                 num:          64
>                 num_default:  64
>                 align:        4096
>                 desc:         0x00000001342b5000
>                 avail:        0x00000001342b5400
>                 used:         0x00000001342b54c0
> 
> QMP Form:
> 
>     { 'command': 'x-query-virtio-queue-status',
>       'data': { 'path': 'str', 'queue': 'uint16' },
>       'returns': 'VirtQueueStatus',
>       'features': [ 'unstable' ] }
> 
>     Example:
> 
>         -> { "execute": "x-query-virtio-queue-status",
>              "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
>                             "queue": 2 }
>            }
>         <- { "return": {
>                    "signalled-used": 27,
>                    "inuse": 0,
>                    "vring-align": 4096,
>                    "vring-desc": 5170221056,
>                    "signalled-used-valid": true,
>                    "vring-num-default": 64,
>                    "vring-avail": 5170222080,
>                    "queue-index": 2,
>                    "vring-used": 5170222272,
>                    "used-idx": 27,
>                    "name": "virtio-net",
>                    "vring-num": 64 }
>            }
> 
> 4. Display status of a given vhost queue
> 
> HMP Form:
> 
>     info virtio-vhost-queue-status <path> <queue>
> 
>     Example:
> 
>         (qemu) info virtio-vhost-queue-status /machine/peripheral-anon/device[1]/virtio-backend 1
>         /machine/peripheral-anon/device[1]/virtio-backend:
>             device_name:          virtio-net (vhost)
>             kick:                 0
>             call:                 0
>             VRing:
>                 num:         256
>                 desc:        0x00007f31c032c000
>                 desc_phys:   0x00000001340c6000
>                 desc_size:   4096
>                 avail:       0x00007f31c032d000
>                 avail_phys:  0x00000001340c7000
>                 avail_size:  518
>                 used:        0x00007f31c032d240
>                 used_phys:   0x00000001340c7240
>                 used_size:   2054
> 
> QMP Form:
> 
>     { 'command': 'x-query-virtio-vhost-queue-status',
>       'data': { 'path': 'str', 'queue': 'uint16' },
>       'returns': 'VirtVhostQueueStatus',
>       'features': [ 'unstable' ] }
> 
>     Example:
> 
>         -> { "execute": "x-query-virtio-vhost-queue-status",
>              "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
>                             "queue": 1 }
>            }
>         <- { "return": {
>                    "avail-phys": 5168197632,
>                    "used-phys": 5168198208,
>                    "avail-size": 518,
>                    "desc-size": 4096,
>                    "used-size": 2054,
>                    "desc": 139851654676480,
>                    "num": 256,
>                    "name": "virtio-net",
>                    "call": 0,
>                    "avail": 139851654680576,
>                    "desc-phys": 5168193536,
>                    "used": 139851654681152,
>                    "kick": 0 }
>            }
> 
> 5. Display an element of a given virtio queue
> 
> HMP Form:
> 
>     info virtio-queue-element <path> <queue> [index]
> 
>     Example:
> 
>         Dump the information of the head element of the third queue of virtio-scsi:
> 
>         (qemu) info virtio-queue-element /machine/peripheral-anon/device[2]/virtio-backend 2
>         /machine/peripheral-anon/device[2]/virtio-backend:
>             device_name: virtio-scsi
>             index:       125
>             desc:
>                descs:   addr 0xa4f90f1d0653b5fc len 1862028160 (used, avail, next)
>             avail:
>                flags: 0
>                idx:   2936
>                ring:  125
>             used:
>                flags: 0
>                idx:   2936
> 
> QMP Form:
> 
>     { 'command': 'x-query-virtio-queue-element',
>       'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
>       'returns': 'VirtioQueueElement',
>       'features': [ 'unstable' ] }
> 
>     Example:
> 
>         -> { "execute": "x-query-virtio-queue-element",
>              "arguments": { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
>                             "queue": 2 }
>            }
>         <- { "return": {
>                    "index": 125,
>                    "name": "virtio-scsi",
>                    "descs": [
>                       { "flags": ["used", "avail", "next"],
>                         "len": 1862028160,
>                         "addr": 11887549308755752444 }
>                    ],
>                    "avail": {
>                       "idx": 2936,
>                       "flags": 0,
>                       "ring": 125
>                    },
>                    "used": {
>                       "idx": 2936,
>                       "flags": 0
>                    }
>              }
>            }
> 
> v11: minor reformatting in virtio.json
>      added synchronicity check when querying virtio devices
> 
> v10: rebased for upstream (Qemu 7.0)
>      reformat virtio.json for better consistency
>      removed all enums from virtio.json; replaced with string literals
>      removed @ndescs from VirtioQueueElement
>      removed examples in hmp-commands-info.hx (to fix 'inconsistent
>      literal block quoting' error from Sphinx)
> 
> v9: rebased for upstream (Qemu 6.3)
>     change QMP command prefixes from 'x-debug-virtio' to
>     'x-query-virtio'
>     add 'unstable' feature to all 'x-query-virtio' prefixed
>     QMP commands
>     fix odd indentation for qapi/virtio.json
>     device features support for virtio-mem
>     move HMP sub-commands under 'virtio' top level to 'info'
>     top level
> 
> v8: add assert in virtio_id_to_name() to make sure we're
>     not returning NULL
>     minor documentation additions to qapi/virtio.json
>     add virtio introspection support for vhost-user-rng
> 
> v7: rebased for upstream (Qemu 6.2)
>     add ability to map between numberic device ID and
>     string device ID (name) for virtio devices
>     add get_vhost() callback function for VirtIODevices
>     expose more fields of VirtIODevice
>     expose fields of vhost devices
>     decode vhost user protocol features
>     decode VirtIODevice configuration statuses
>     vhost support for displaying virtio queue statuses
>     vhost support for displaying vhost queue statuses
>     expose driver and device areas when introspecting a
>     virtio queue element
>     changed patch attribution
> 
> v6: rebased for upstream (Qemu 6.1)
>     add all virtio/vhost types in same order as
>     include/standard-headers/linux/virtio_ids.h
>     use QAPI_LIST_PREPEND in qmp_x_debug_query_virtio rather than open
>     coding
> 
> v5: rebased for upstream
>     add device name, used index, and relative indicies to virtio queue-status
>     HMP command
>     add device name to virtio queue-status QMP command
>     add new virtio device features
> 
> v4: re-send series as v3 didn't reach qemu-devel
> 
> v3: use qapi_free_VirtioInfoList() on the head of the list, not on the tail.
>     Prefix the QMP commands with 'x-debug-'
> 
> v2: introduce VirtioType enum
>     use an enum for the endianness
>     change field names to stick to naming convertions (s/_/-/)
>     add a patch to decode feature bits
>     don't check if the queue is empty to allow display of old elements
>     use enum for desc flags
>     manage indirect desc
>     decode device features in the HMP command
> 
> Jonah Palmer (2):
>   virtio: drop name parameter for virtio_init()
>   virtio: add vhost support for virtio devices
> 
> Laurent Vivier (6):
>   qmp: add QMP command x-query-virtio
>   qmp: add QMP command x-query-virtio-status
>   qmp: decode feature & status bits in virtio-status
>   qmp: add QMP commands for virtio/vhost queue-status
>   qmp: add QMP command x-query-virtio-queue-element
>   hmp: add virtio commands
> 
>  hmp-commands-info.hx                   |  70 +++
>  hw/9pfs/virtio-9p-device.c             |   2 +-
>  hw/block/vhost-user-blk.c              |   9 +-
>  hw/block/virtio-blk.c                  |  31 +-
>  hw/char/virtio-serial-bus.c            |  14 +-
>  hw/display/vhost-user-gpu.c            |   7 +
>  hw/display/virtio-gpu-base.c           |  20 +-
>  hw/input/vhost-user-input.c            |   7 +
>  hw/input/virtio-input.c                |  13 +-
>  hw/net/virtio-net.c                    |  58 ++-
>  hw/scsi/vhost-scsi.c                   |   8 +
>  hw/scsi/virtio-scsi.c                  |  20 +-
>  hw/virtio/meson.build                  |   2 +
>  hw/virtio/vhost-user-fs.c              |  20 +-
>  hw/virtio/vhost-user-i2c.c             |   7 +-
>  hw/virtio/vhost-user-rng.c             |   9 +-
>  hw/virtio/vhost-user-vsock.c           |   2 +-
>  hw/virtio/vhost-vsock-common.c         |  22 +-
>  hw/virtio/vhost-vsock.c                |   2 +-
>  hw/virtio/vhost.c                      |   4 +-
>  hw/virtio/virtio-balloon.c             |  17 +-
>  hw/virtio/virtio-crypto.c              |  22 +-
>  hw/virtio/virtio-iommu.c               |  17 +-
>  hw/virtio/virtio-mem.c                 |  14 +-
>  hw/virtio/virtio-pmem.c                |   3 +-
>  hw/virtio/virtio-rng.c                 |   2 +-
>  hw/virtio/virtio-stub.c                |  42 ++
>  hw/virtio/virtio.c                     | 742 ++++++++++++++++++++++++++++-
>  include/hw/virtio/vhost-vsock-common.h |   2 +-
>  include/hw/virtio/vhost.h              |   3 +
>  include/hw/virtio/virtio-gpu.h         |   3 +-
>  include/hw/virtio/virtio.h             |  26 +-
>  include/monitor/hmp.h                  |   5 +
>  monitor/hmp-cmds.c                     | 311 ++++++++++++
>  qapi/meson.build                       |   1 +
>  qapi/qapi-schema.json                  |   1 +
>  qapi/virtio.json                       | 841 +++++++++++++++++++++++++++++++++
>  tests/qtest/qmp-cmd-test.c             |   1 +
>  38 files changed, 2335 insertions(+), 45 deletions(-)
>  create mode 100644 hw/virtio/virtio-stub.c
>  create mode 100644 qapi/virtio.json
> 
> -- 
> 1.8.3.1


