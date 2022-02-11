Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454164B26F9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 14:21:56 +0100 (CET)
Received: from localhost ([::1]:45176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIVs3-0005xL-DG
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 08:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nIV4Z-0002pS-NN
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 07:30:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nIV4V-0006vA-29
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 07:30:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644582640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v8jB/Eq7X8aJMhD2gwnKALzhZm/04rXfc1e73d/beTk=;
 b=K03jqtRKhB7s9lndtoKzfOxdT9/eRBuiQQd/X03atnSbU15+0Ih4SmmRFtONXgtZC8L+rx
 laWA9K0O0IkwzZEj21Fdyb6XQZJw8GPvHUK10CLgb9n4DRifahBpxjhx4sbqxIqfbHFkb1
 0W974tYL4rtNUTaqlYAYjOtXnKF+NM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-522RliFMN_ebka9wNmVqsQ-1; Fri, 11 Feb 2022 07:30:36 -0500
X-MC-Unique: 522RliFMN_ebka9wNmVqsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CD65100C664;
 Fri, 11 Feb 2022 12:30:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D739C6FAEA;
 Fri, 11 Feb 2022 12:30:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 646F621E6A00; Fri, 11 Feb 2022 13:30:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v12 5/8] qmp: decode feature & status bits in virtio-status
References: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
 <1644488520-21604-6-git-send-email-jonah.palmer@oracle.com>
Date: Fri, 11 Feb 2022 13:30:32 +0100
In-Reply-To: <1644488520-21604-6-git-send-email-jonah.palmer@oracle.com>
 (Jonah Palmer's message of "Thu, 10 Feb 2022 05:21:57 -0500")
Message-ID: <871r09pouv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Display feature names instead of bitmaps for host, guest, and
> backend for VirtIODevices.
>
> Display status names instead of bitmaps for VirtIODevices.
>
> Display feature names instead of bitmaps for backend, protocol,
> acked, and features (hdev->features) for vhost devices.
>
> Decode features according to device ID. Decode statuses
> according to configuration status bitmap (config_status_map).
> Decode vhost user protocol features according to vhost user
> protocol bitmap (vhost_user_protocol_map).
>
> Transport features are on the first line. Undecoded bits (if
> any) are stored in a separate field.
>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>

[...]

> diff --git a/qapi/virtio.json b/qapi/virtio.json
> index ba61d83..474a8bd 100644
> --- a/qapi/virtio.json
> +++ b/qapi/virtio.json
> @@ -106,10 +106,10 @@
>              'n-tmp-sections': 'int',
>              'nvqs': 'uint32',
>              'vq-index': 'int',
> -            'features': 'uint64',
> -            'acked-features': 'uint64',
> -            'backend-features': 'uint64',
> -            'protocol-features': 'uint64',
> +            'features': 'VirtioDeviceFeatures',
> +            'acked-features': 'VirtioDeviceFeatures',
> +            'backend-features': 'VirtioDeviceFeatures',
> +            'protocol-features': 'VhostDeviceProtocols',
>              'max-queues': 'uint64',
>              'backend-cap': 'uint64',
>              'log-enabled': 'bool',
> @@ -176,11 +176,11 @@
>              'device-id': 'uint16',
>              'vhost-started': 'bool',
>              'device-endian': 'str',
> -            'guest-features': 'uint64',
> -            'host-features': 'uint64',
> -            'backend-features': 'uint64',
> +            'guest-features': 'VirtioDeviceFeatures',
> +            'host-features': 'VirtioDeviceFeatures',
> +            'backend-features': 'VirtioDeviceFeatures',
>              'num-vqs': 'int',
> -            'status': 'uint8',
> +            'status': 'VirtioDeviceStatus',
>              'isr': 'uint8',
>              'queue-sel': 'uint16',
>              'vm-running': 'bool',
> @@ -222,14 +222,28 @@
>  #            "name": "virtio-crypto",
>  #            "started": true,
>  #            "device-id": 20,
> -#            "backend-features": 0,
> +#            "backend-features": {
> +#               "transports": [],
> +#               "dev-features": []
> +#            },
>  #            "start-on-kick": false,
>  #            "isr": 1,
>  #            "broken": false,
> -#            "status": 15,
> +#            "status": {
> +#               "statuses": ["ACKNOWLEDGE", "DRIVER", "FEATURES_OK",
> +#                            "DRIVER_OK"]
> +#            },
>  #            "num-vqs": 2,
> -#            "guest-features": 5100273664,
> -#            "host-features": 6325010432,
> +#            "guest-features": {
> +#               "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
> +#               "dev-features": []
> +#            },
> +#            "host-features": {
> +#               "transports": ["PROTOCOL_FEATURES", "EVENT_IDX",
> +#                              "INDIRECT_DESC", "VERSION_1", "ANY_LAYOUT",
> +#                              "NOTIFY_ON_EMPTY"],
> +#               "dev-features": []
> +#            },
>  #            "use-guest-notifier-mask": true,
>  #            "vm-running": true,
>  #            "queue-sel": 1,
> @@ -257,22 +271,65 @@
>  #               "max-queues": 1,
>  #               "backend-cap": 2,
>  #               "log-size": 0,
> -#               "backend-features": 0,
> +#               "backend-features": {
> +#                  "transports": [],
> +#                  "dev-features": []
> +#               },
>  #               "nvqs": 2,
> -#               "protocol-features": 0,
> +#               "protocol-features": {
> +#                  "protocols": []
> +#               },
>  #               "vq-index": 0,
>  #               "log-enabled": false,
> -#               "acked-features": 5100306432,
> -#               "features": 13908344832
> +#               "acked-features": {
> +#                  "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1",
> +#                                 "ANY_LAYOUT", "NOTIFY_ON_EMPTY"],
> +#                  "dev-features": ["MRG_RXBUF"]
> +#               },
> +#               "features": {
> +#                  "transports": ["EVENT_IDX", "INDIRECT_DESC",
> +#                                 "IOMMU_PLATFORM", "VERSION_1", "ANY_LAYOUT",
> +#                                 "NOTIFY_ON_EMPTY"],
> +#                  "dev-features": ["LOG_ALL", "MRG_RXBUF"]
> +#               }
> +#            },
> +#            "backend-features": {
> +#               "transports": ["PROTOCOL_FEATURES", "EVENT_IDX", "INDIRECT_DESC",
> +#                              "VERSION_1", "ANY_LAYOUT", "NOTIFY_ON_EMPTY"],
> +#               "dev-features": ["GSO", "CTRL_MAC_ADDR", "GUEST_ANNOUNCE", "CTRL_RX_EXTRA",
> +#                                "CTRL_VLAN", "CTRL_RX", "CTRL_VQ", "STATUS", "MRG_RXBUF",
> +#                                "HOST_UFO", "HOST_ECN", "HOST_TSO6", "HOST_TSO4",
> +#                                "GUEST_UFO", "GUEST_ECN", "GUEST_TSO6", "GUEST_TSO4",
> +#                                "MAC", "CTRL_GUEST_OFFLOADS", "GUEST_CSUM", "CSUM"]
>  #            },
> -#            "backend-features": 6337593319,
>  #            "start-on-kick": false,
>  #            "isr": 1,
>  #            "broken": false,
> -#            "status": 15,
> +#            "status": {
> +#               "statuses": ["ACKNOWLEDGE", "DRIVER", "FEATURES_OK", "DRIVER_OK"]
> +#            },
>  #            "num-vqs": 3,
> -#            "guest-features": 5111807911,
> -#            "host-features": 6337593319,
> +#            "guest-features": {
> +#               "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
> +#               "dev-features": ["CTRL_MAC_ADDR", "GUEST_ANNOUNCE", "CTRL_VLAN",
> +#                                "CTRL_RX", "CTRL_VQ", "STATUS", "MRG_RXBUF",
> +#                                "HOST_UFO", "HOST_ECN", "HOST_TSO6",
> +#                                "HOST_TSO4", "GUEST_UFO", "GUEST_ECN",
> +#                                "GUEST_TSO6", "GUEST_TSO4", "MAC",
> +#                                "CTRL_GUEST_OFFLOADS", "GUEST_CSUM", "CSUM"]
> +#            },
> +#            "host-features": {
> +#               "transports": ["PROTOCOL_FEATURES", "EVENT_IDX",
> +#                              "INDIRECT_DESC", "VERSION_1", "ANY_LAYOUT",
> +#                              "NOTIFY_ON_EMPTY"],
> +#               "dev-features": ["GSO", "CTRL_MAC_ADDR", "GUEST_ANNOUNCE",
> +#                                "CTRL_RX_EXTRA", "CTRL_VLAN", "CTRL_RX",
> +#                                "CTRL_VQ", "STATUS", "MRG_RXBUF", "HOST_UFO",
> +#                                "HOST_ECN", "HOST_TSO4", "HOST_TSO4",
> +#                                "GUEST_UFO", "GUEST_ECN", "GUEST_TSO6",
> +#                                "GUEST_TSO4", "MAC", "CTRL_GUEST_OFFLOADS",
> +#                                "GUEST_CSUM", "CSUM"]
> +#            },
>  #            "use-guest-notifier-mask": true,
>  #            "vm-running": true,
>  #            "queue-sel": 2,
> @@ -288,3 +345,62 @@
>    'data': { 'path': 'str' },
>    'returns': 'VirtioStatus',
>    'features': [ 'unstable' ] }
> +
> +##
> +# @VirtioDeviceStatus:
> +#
> +# A structure defined to list the configuration statuses of a virtio
> +# device
> +#
> +# @statuses: List of decoded configuration statuses of the virtio
> +#            device
> +#
> +# @unknown-statuses: Virtio device statuses bitmap that have not been decoded
> +#
> +# Since: 7.0
> +##
> +
> +{ 'struct': 'VirtioDeviceStatus',
> +  'data': { 'statuses': [ 'str' ],
> +            '*unknown-statuses': 'uint8' } }
> +
> +##
> +# @VhostDeviceProtocols:
> +#
> +# A structure defined to list the vhost user protocol features of a
> +# Vhost User device
> +#
> +# @protocols: List of decoded vhost user protocol features of a vhost
> +#             user device
> +#
> +# @unknown-protocols: Vhost user device protocol features bitmap that
> +#                     have not been decoded
> +#
> +# Since: 7.0
> +##
> +
> +{ 'struct': 'VhostDeviceProtocols',
> +  'data': { 'protocols': [ 'str' ],
> +            '*unknown-protocols': 'uint64' } }
> +
> +##
> +# @VirtioDeviceFeatures:
> +#
> +# The common fields that apply to most Virtio devices. Some devices
> +# may not have their own device-specific features (e.g. virtio-rng).
> +#
> +# @transports: List of transport features of the virtio device
> +#
> +# @dev-features: List of device-specific features (if the device has
> +#                unique features)
> +#
> +# @unknown-dev-features: Virtio device features bitmap that have not
> +#                        been decoded
> +#
> +# Since: 7.0
> +##
> +
> +{ 'struct': 'VirtioDeviceFeatures',
> +  'data': { 'transports': [ 'str' ],
> +            '*dev-features': [ 'str' ],
> +            '*unknown-dev-features': 'uint64' } }

I think I'd factor out the common pair of members (list of strings, list
of integers).  This is not a demand.

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


