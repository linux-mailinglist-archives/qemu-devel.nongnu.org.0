Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA43C7341
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:30:05 +0200 (CEST)
Received: from localhost ([::1]:42412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KMG-0006bP-Jh
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3KHk-00065H-Qb
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:25:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3KHg-0002ij-SI
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626189919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dRrSyMvC4xBLq45RllxvDccvt7i1AA7quNYUCiuPgHQ=;
 b=jHha93qeI9gXhb9mjNo7gcR9BJHOj3II0GFxIu7WB0xOYoJT/QOcg6hAxAAuP/ZQPa3+qr
 rUJkhRwk/Z26V8iwK/7yuAMqt0kSoAfnrrmWp15fQcCWOCQUKuQeE2DxFg8cY3EIz/Ta4H
 066m/QjddRMsDo5/pFIVXcz+wm+3FTY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-QVWlQUamNNOoUDQbABsT0A-1; Tue, 13 Jul 2021 11:25:16 -0400
X-MC-Unique: QVWlQUamNNOoUDQbABsT0A-1
Received: by mail-wr1-f72.google.com with SMTP id
 z6-20020a5d4c860000b029013a10564614so8625848wrs.15
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dRrSyMvC4xBLq45RllxvDccvt7i1AA7quNYUCiuPgHQ=;
 b=rcabZxRW2V8NZJXdbBjf89v8+A9fIUS/lKF/9/vZfddcJWaCvq6SrsyAcl533BzzFU
 nKJd4FbMX7OR7fvURB83UPPS/IskruXcyNueI46cqFq0SL5shER+n7aocmXm75T0iwY6
 S5buHXPhWbDYkCNqQ5gG7Sx3dsk61VVx5p/TJX9YJ+5u+oFPtlAVyNGIkHx+5Mk5wmKs
 4lvSkrHggNoRrItbK1gSJ7qOABLQ2l5tsp4fbGMY0bh+dGtjmMEZ8kWD3+zYM/ibfUqf
 WpCMQhl/g3rDe21YPezGbnCMZKeBt0pa0bu9pLw95ZtkB/WjzYNc6d1HFhbCbNgQIhFq
 Gb4Q==
X-Gm-Message-State: AOAM5319yZPNjxqvKQVnmAIOWp3EhDlsl/RrXkL0sgqlUIik9NqPieM9
 4ii+5R+4JACASdw3Up6aW3xu/zaHJ7gPv4r8s2/yOK3rlNlvLv+BdsqpwbcfDAXRqCrWTIXL+iR
 1pZYk0fleDkCzhcs=
X-Received: by 2002:a05:600c:2281:: with SMTP id
 1mr5845457wmf.10.1626189915543; 
 Tue, 13 Jul 2021 08:25:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeiE8eOHlkX1OKFjcukbKCnQ5vtBJoLSHJ8Si2gQQIztZ2TYUROqZg8+J/RS68j4ku6Lawqg==
X-Received: by 2002:a05:600c:2281:: with SMTP id
 1mr5845407wmf.10.1626189915190; 
 Tue, 13 Jul 2021 08:25:15 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id t6sm18226775wru.75.2021.07.13.08.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 08:25:14 -0700 (PDT)
Date: Tue, 13 Jul 2021 11:25:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v6 0/6] hmp,qmp: Add some commands to introspect virtio
 devices
Message-ID: <20210713112429-mutt-send-email-mst@kernel.org>
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 amit@kernel.org, michael.roth@amd.com, jasowang@redhat.com, david@redhat.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, si-wei.liu@oracle.com, marcandre.lureau@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com, armbru@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 06:35:31AM -0400, Jonah Palmer wrote:
> This series introduces new QMP/HMP commands to dump the status of a
> virtio device at different levels.
> 
> [Jonah: Rebasing previous patchset from March for Qemu 6.1
> (here: https://lore.kernel.org/qemu-devel/1616084984-11263-1-git-send-email-jonah.palmer@oracle.com/)
> from Laurent's original qmp/hmp virtio commands from last May
> (here: https://lore.kernel.org/qemu-devel/20200507134800.10837-1-lvivier@redhat.com/)
> which included updating Makefile to meson.build, adding all virtio/vhost types, and
> other minor patching (e.g. qmp_x_debug_query_virtio uses QAPI_LIST_PREPEND rather
> than open coding to iterate through list of virtio devices, see patch 1/6).
> 
> Also, added new features (since Qemu 6.1) to virtio-gpu, virtio-net, and
> virtio-balloon. Lastly, added display for the virtio device name in a
> few of the qmp/hmp commands as well as relative indicies for vrings 
> (see patches 4/6, 6/6).]


Acked-by: Michael S. Tsirkin <mst@redhat.com>

needs to be either merged or acked by HMP maintainer.


> 1. Main command
> 
> HMP Only:
> 
>     virtio [subcommand]
> 
>     Example:
> 
>         List all sub-commands:
> 
>         (qemu) virtio
>         virtio query -- List all available virtio devices
>         virtio status path -- Display status of a given virtio device
>         virtio queue-status path queue -- Display status of a given virtio queue
>         virtio queue-element path queue [index] -- Display element of a given virtio queue
> 
> 2. List available virtio deices in the machine
> 
> HMP Form:
> 
>     virtio query
> 
>     Example:
> 
>         (qemu) virtio query
>         /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
>         /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
>         /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]
> 
> QMP Form:
> 
>     { 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
> 
>     Example:
> 
>         -> { "execute": "x-debug-query-virtio" }
>         <- { "return": [
>                 {
>                     "path": "/machine/peripheral-anon/device[2]/virtio-backend",
>                     "type": "virtio-scsi"
>                 },
>                 {
>                     "path": "/machine/peripheral-anon/device[1]/virtio-backend",
>                     "type": "virtio-net"
>                 },
>                 {
>                     "path": "/machine/peripheral-anon/device[0]/virtio-backend",
>                     "type": "virtio-serial"
>                 }
>             ]
>         }
> 
> 3. Display status of a given virtio device
> 
> HMP Form:
> 
>     virtio status <path>
> 
>     Example:
> 
>         (qemu) virtio status /machine/peripheral-anon/device[2]/virtio-backend
>         /machine/peripheral-anon/device[2]/virtio-backend:
>             Device Id:          8
>             Guest features:     event-idx, indirect-desc, version-1, change,
>                                 hotplug
>             Host features:      event-idx, indirect-desc, bad-feature, version-1,
>                                 any-layout, notify-on-empty, change, hotplug
>             Backend features:
>             Endianness:         little
>             VirtQueues:         4
> 
> QMP Form:
> 
>     { 'command': 'x-debug-virtio-status',
>       'data': { 'path': 'str' },
>       'returns': 'VirtioStatus'
>     }
> 
>     Example:
> 
>         -> { "execute": "x-debug-virtio-status"
>              "arguments": {
>                 "path": "/machine/peripheral-anon/device[2]/virtio-backend"
>              }
>            }
>         <- { "return": {
>                 "device-endian": "little",
>                 "device-id": 8,
>                 "backend-features": {
>                     "transport": [
>                     ],
>                     "type": "virtio-scsi",
>                     "features": [
>                     ]
>                 },
>                 "num-vqs": 4,
>                 "guest-features": {
>                     "transport": [
>                         "event-idx",
>                         "indirect-desc",
>                         "version-1"
>                     ],
>                     "type": "virtio-scsi",
>                     "features": [
>                         "change",
>                         "hotplug"
>                     ]
>                 },
>                 "host-features": {
>                     "transport": [
>                         "event-idx",
>                         "indirect-desc",
>                         "bad-feature",
>                         "version-1",
>                         "any-layout",
>                         "notify-on-empty"
>                     ],
>                     "type": "virtio-scsi",
>                     "features": [
>                         "change",
>                         "hotplug"
>                     ]
>                 }
>             }
>         }
> 
> 4. Display status of a given virtio queue
> 
> HMP Form:
> 
>     virtio queue-status <path> <queue>
> 
>     Example:
> 
>         (qemu) virtio queue-status /machine/peripheral-anon/device[2]/virtio-backend 3
>         /machine/peripheral-anon/device[2]/virtio-backend:
>             device_type:            virtio-scsi
>             index:                  3
>             inuse:                  0
>             last_avail_idx:         4174 (78 % 256)
>             shadow_avail_idx:       4174 (78 % 256)
>             signalled_used:         4174 (78 % 256)
>             signalled_used_valid:   1
>             VRing:
>                 num:            256
>                 num_default:    256
>                 align:          4096
>                 desc:           0x000000003cf9e000
>                 avail:          0x000000003cf9f000
>                 used:           0x000000003cf9f240
> 
> QMP Form:
> 
>     { 'command': 'x-debug-virtio-queue-status',
>       'data': { 'path': 'str', 'queue': 'uint16' },
>       'returns': 'VirtQueueStatus'
>     }
> 
>     Example:
> 
>         -> { "execute": "x-debug-virtio-queue-status",
>             "arguments": {
>                 "path": "/machine/peripheral-anon/decice[2]/virtio-backend",
>                 "queue": 3
>             }
>            }
>         <- { "return": {
>                 "signalled-used": 4188,
>                 "inuse": 0,
>                 "vring-align": 4096,
>                 "vring-desc": 1023008768,
>                 "signalled-used-valid": 1,
>                 "vring-num-default": 256,
>                 "vring-avail": 1023012864,
>                 "queue-index": 3,
>                 "last-avail-idx": 4188,
>                 "vring-used": 1023013440,
>                 "used-idx": 4188,
>                 "device-type": "virtio-scsi",
>                 "shadow-avail-idx": 4188
>                 "vring-num": 256
>            }
>           }
> 
> 5. Display element of a given virtio queue
> 
> HMP Form:
> 
>     virtio queue-element <path> <queue> [index]
> 
>     Example:
> 
>         Dump the information of the head element of the third queue of virtio-scsi:
> 
>         (qemu) virtio queue-element /machine/peripheral-anon/device[3]/virtio-backend 3
>         index: 122
>         ndescs: 3
>         descs: addr 0x7302d000 len 4096 (write), addr 0x3c951763 len 108 (write, next),
>                addr 0x3c951728 len 51 (next)
> 
>         (qemu) xp/128x 0x7302d000
>         000000007302d000: 0xce 0x14 0x56 0x77 0x78 0x7f 0x00 0x00
>         000000007302d008: 0x05 0x00 0x00 0x00 0x00 0x00 0x00 0x00
>         000000007302d010: 0xf9 0x00 0x00 0x00 0x00 0x00 0x00 0x00
>         000000007302d018: 0x4f 0xf9 0x55 0x77 0x78 0x7f 0x00 0x00
>         ...
> 
> QMP Form:
> 
>     { 'command': 'x-debug-virtio-queue-element',
>       'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
>       'returns': 'VirtioQueueElement'
>     }
> 
>     Example:
> 
>         -> { "execute": "x-debug-virtio-queue-element",
>              "arguments": {
>                 "path": "/machine/peripheral-anon/device[2]/virtio-backend",
>                 "queue": 0
>              }
>            }
>         <- { "return": {
>                 "index": 122,
>                 "ndescs": 3,
>                 "descs": [
>                     {
>                         "flags": [
>                             "write"
>                         ],
>                         "len": 4096,
>                         "addr": 1929564160
>                     },
>                     {
>                         "flags": [
>                             "write",
>                             "next"
>                         ],
>                         "len": 108,
>                         "addr": 1016403811
>                     },
>                     {
>                         "flags": [
>                             "next"
>                         ],
>                         "len": 51,
>                         "addr": 1016403752
>                     }
>                 ]
>             }
>         }
> 
> [Jonah:
> Comments:
> 
> One thing worth mentioning that this patch series adds is some maintenance
> burden. More specifically, the following would need to be done if a new
> virtio device type (with features) were to be added:
> 
>  - In the new */virtio-<device>.c: add #include "qapi/qapi-visit-virtio.h"
>    and define a qmp_virtio_feature_map_t map structure with device feature
>    entries (e.g. FEATURE_ENTRY(_FEATURE_))
> 
>  - In qapi/virtio.json: define a new enumeration of Virtio<Device>Feature
>    (including its enumerated features) and define a new
>    VirtioDeviceFeaturesOptions<Device> and add it to VirtioDeviceFeatures
> 
>  - In hw/virtio/virtio.c: add a case to switch statements in qmp_decode_features
>    and hmp_virtio_dump_features
> 
> If you're just adding a new feature for an already existing virtio device:
> 
>  - In */virtio-<device>.c: add the new FEATURE_ENTRY(_FEATURE_) in the
>    device's qmp_virtio_feature_map_t structure
> 
>  - In qapi/virtio.json: add the enumeration of the new virtio device
>    feature in the corresponding Virtio<Device>Feature JSON structure
> 
> In the previous patch series (v4) there was a comment regarding the
> implementation of the switch case in hmp_virtio_dump_features. It would
> be nice to not need to explicitly define a case for each virtio device
> type (with features) here, but it's not very clear (to me) on how this
> could be achieved (and optimally we'd probably want something similar for
> qmp_decode_features as well).
> 
> The suggestion to this problem (from last May) was to do something like:
> 
>     if (features->type < something_MAX) {
>         features_str = anarray[features->type];
>         ...
>         monitor_printf(mon, "%s", features_str(list->value));
>         ...
>     }
> 
> But, (1): the device type enumerations were changed to "flat" enums in v4
> and, as I understand it, flat enums have no value associated with them so
> we wouldn't be able to use it to index anarray. And (2): not every virtio
> device has features (e.g. virtio-9p, virtio-input, vhost-user-fs, etc.)
> so we'd still need to take that into account and filter-out those devices
> as well.
> 
> I've looked at it for awhile but, at least to me, it wasn't obvious how
> this could be done.
> 
> Note: for patch 5/6, checkpatch.pl gives the following error:
> 
>    ERROR: "foo * bar" should be "foo *bar"
>    #329: FILE: hw/virtio/virtio.c:4164
>             type##FeatureList * list = features->u.field.features;
> 
> But doing both 'type##FeatureList * list = ...' and
> 'type##FeatureList *list = ...' give errors, so I just left it as the former
> representation. ]
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
> Laurent Vivier (6):
>   qmp: add QMP command x-debug-query-virtio
>   qmp: add QMP command x-debug-virtio-status
>   qmp: decode feature bits in virtio-status
>   qmp: add QMP command x-debug-virtio-queue-status
>   qmp: add QMP command x-debug-virtio-queue-element
>   hmp: add virtio commands
> 
>  docs/system/monitor.rst      |   2 +
>  hmp-commands-virtio.hx       | 162 ++++++++++++
>  hmp-commands.hx              |  10 +
>  hw/block/virtio-blk.c        |  23 ++
>  hw/char/virtio-serial-bus.c  |  11 +
>  hw/display/virtio-gpu-base.c |  12 +
>  hw/net/virtio-net.c          |  38 +++
>  hw/scsi/virtio-scsi.c        |  12 +
>  hw/virtio/meson.build        |   2 +
>  hw/virtio/virtio-balloon.c   |  14 +
>  hw/virtio/virtio-iommu.c     |  14 +
>  hw/virtio/virtio-stub.c      |  34 +++
>  hw/virtio/virtio.c           | 574 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/virtio/virtio.h   |  14 +
>  include/monitor/hmp.h        |   4 +
>  meson.build                  |   1 +
>  monitor/misc.c               |  17 ++
>  qapi/meson.build             |   1 +
>  qapi/qapi-schema.json        |   1 +
>  qapi/virtio.json             | 604 +++++++++++++++++++++++++++++++++++++++++++
>  tests/qtest/qmp-cmd-test.c   |   1 +
>  21 files changed, 1551 insertions(+)
>  create mode 100644 hmp-commands-virtio.hx
>  create mode 100644 hw/virtio/virtio-stub.c
>  create mode 100644 qapi/virtio.json
> 
> -- 
> 1.8.3.1


