Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9FF46B719
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 10:30:53 +0100 (CET)
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muWoG-0006XJ-8z
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 04:30:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1muWn8-0005Vw-GX
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 04:29:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1muWn5-0008Py-Bc
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 04:29:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638869378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gJi77VqiCR+L3cf+hJKrOp5fkrcOkIEZOaV3JfdYIgI=;
 b=f3jh7A/Qcxxc7X6JTTdx9vOb+TCPOTKWJ1W/I9DVK0d+yTpk69159PlFjyJMcbwvNhGn2+
 J3umg5G9nIwNDl+aTRBzIWmEcDM7PDM+VRNAfqv+CBv0xMbOmmjU+ThxdVk13ZeymDu8BH
 vmVAOPz3jiwfIjzvt9/fzfGHNXElEQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-25kI2L1WOJersHaANRaYYg-1; Tue, 07 Dec 2021 04:29:35 -0500
X-MC-Unique: 25kI2L1WOJersHaANRaYYg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40D9E2AD;
 Tue,  7 Dec 2021 09:29:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6FFA1002EF0;
 Tue,  7 Dec 2021 09:29:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 670B3113865F; Tue,  7 Dec 2021 10:29:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v10 6/8] qmp: add QMP commands for virtio/vhost
 queue-status
References: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
 <1638794606-19631-7-git-send-email-jonah.palmer@oracle.com>
Date: Tue, 07 Dec 2021 10:29:02 +0100
In-Reply-To: <1638794606-19631-7-git-send-email-jonah.palmer@oracle.com>
 (Jonah Palmer's message of "Mon, 6 Dec 2021 07:43:24 -0500")
Message-ID: <87sfv4daqp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> These new commands show the internal status of a VirtIODevice's
> VirtQueue and a vhost device's vhost_virtqueue (if active).
>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> ---

[...]

> diff --git a/qapi/virtio.json b/qapi/virtio.json
> index 7ef1f95..56e56d2 100644
> --- a/qapi/virtio.json
> +++ b/qapi/virtio.json
> @@ -402,3 +402,255 @@
>    'data': { 'transports': [ 'str' ],
>              '*dev-features': [ 'str' ],
>              '*unknown-dev-features': 'uint64' } }
> +
> +##
> +# @VirtQueueStatus:
> +#
> +# Information of a VirtIODevice VirtQueue, including most members of
> +# the VirtQueue data structure.
> +#
> +# @name: Name of the VirtIODevice that uses this VirtQueue
> +#
> +# @queue-index: VirtQueue queue_index
> +#
> +# @inuse: VirtQueue inuse
> +#
> +# @vring-num: VirtQueue vring.num
> +#
> +# @vring-num-default: VirtQueue vring.num_default
> +#
> +# @vring-align: VirtQueue vring.align
> +#
> +# @vring-desc: VirtQueue vring.desc (descriptor area)
> +#
> +# @vring-avail: VirtQueue vring.avail (driver area)
> +#
> +# @vring-used: VirtQueue vring.used (device area)
> +#
> +# @last-avail-idx: VirtQueue last_avail_idx or return of vhost_dev
> +#                  vhost_get_vring_base (if vhost active)
> +#
> +# @shadow-avail-idx: VirtQueue shadow_avail_idx
> +#
> +# @used-idx: VirtQueue used_idx
> +#
> +# @signalled-used: VirtQueue signalled_used
> +#
> +# @signalled-used-valid: VirtQueue signalled_used_valid flag
> +#
> +# Since: 7.0
> +#
> +##
> +
> +{ 'struct': 'VirtQueueStatus',
> +  'data': { 'name': 'str',
> +            'queue-index': 'uint16',
> +            'inuse': 'uint32',
> +            'vring-num': 'uint32',
> +            'vring-num-default': 'uint32',
> +            'vring-align': 'uint32',
> +            'vring-desc': 'uint64',
> +            'vring-avail': 'uint64',
> +            'vring-used': 'uint64',
> +            '*last-avail-idx': 'uint16',
> +            '*shadow-avail-idx': 'uint16',
> +            'used-idx': 'uint16',
> +            'signalled-used': 'uint16',
> +            'signalled-used-valid': 'bool' } }
> +
> +##
> +# @x-query-virtio-queue-status:
> +#
> +# Return the status of a given VirtIODevice's VirtQueue
> +#
> +# @path: VirtIODevice canonical QOM path
> +#
> +# @queue: VirtQueue index to examine
> +#
> +# Features:
> +# @unstable: This command is meant for debugging

End with a period for consistency with existing docs, like you did in
v9.

> +#
> +# Returns: VirtQueueStatus of the VirtQueue
> +#
> +# Notes: last_avail_idx will not be displayed in the case where
> +#        the selected VirtIODevice has a running vhost device and
> +#        the VirtIODevice VirtQueue index (queue) does not exist for
> +#        the corresponding vhost device vhost_virtqueue. Also,
> +#        shadow_avail_idx will not be displayed in the case where
> +#        the selected VirtIODevice has a running vhost device.
> +#
> +# Since: 7.0
> +#
> +# Examples:
> +#
> +# 1. Get VirtQueueStatus for virtio-vsock (vhost-vsock running)
> +#
> +# -> { "execute": "x-query-virtio-queue-status",
> +#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
> +#                     "queue": 1 }
> +#    }
> +# <- { "return": {
> +#            "signalled-used": 0,
> +#            "inuse": 0,
> +#            "vring-align": 4096,
> +#            "vring-desc": 5217370112,
> +#            "signalled-used-valid": false,
> +#            "vring-num-default": 128,
> +#            "vring-avail": 5217372160,
> +#            "queue-index": 1,
> +#            "last-avail-idx": 0,
> +#            "vring-used": 5217372480,
> +#            "used-idx": 0,
> +#            "name": "vhost-vsock",
> +#            "vring-num": 128 }
> +#    }
> +#
> +# 2. Get VirtQueueStatus for virtio-serial (no vhost)
> +#
> +# -> { "execute": "x-query-virtio-queue-status",
> +#      "arguments": { "path": "/machine/peripheral-anon/device[0]/virtio-backend",
> +#                     "queue": 20 }
> +#    }
> +# <- { "return": {
> +#            "signalled-used": 0,
> +#            "inuse": 0,
> +#            "vring-align": 4096,
> +#            "vring-desc": 5182074880,
> +#            "signalled-used-valid": false,
> +#            "vring-num-default": 128,
> +#            "vring-avail": 5182076928,
> +#            "queue-index": 20,
> +#            "last-avail-idx": 0,
> +#            "vring-used": 5182077248,
> +#            "used-idx": 0,
> +#            "name": "virtio-serial",
> +#            "shadow-avail-idx": 0,
> +#            "vring-num": 128 }
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-query-virtio-queue-status',
> +  'data': { 'path': 'str', 'queue': 'uint16' },
> +  'returns': 'VirtQueueStatus',
> +  'features': [ 'unstable' ] }
> +
> +##
> +# @VirtVhostQueueStatus:
> +#
> +# Information of a vhost device's vhost_virtqueue, including most
> +# members of the vhost_dev vhost_virtqueue data structure.
> +#
> +# @name: Name of the VirtIODevice that uses this vhost_virtqueue
> +#
> +# @kick: vhost_virtqueue kick
> +#
> +# @call: vhost_virtqueue call
> +#
> +# @desc: vhost_virtqueue desc
> +#
> +# @avail: vhost_virtqueue avail
> +#
> +# @used: vhost_virtqueue used
> +#
> +# @num: vhost_virtqueue num
> +#
> +# @desc-phys: vhost_virtqueue desc_phys (descriptor area phys. addr.)
> +#
> +# @desc-size: vhost_virtqueue desc_size
> +#
> +# @avail-phys: vhost_virtqueue avail_phys (driver area phys. addr.)
> +#
> +# @avail-size: vhost_virtqueue avail_size
> +#
> +# @used-phys: vhost_virtqueue used_phys (device area phys. addr.)
> +#
> +# @used-size: vhost_virtqueue used_size
> +#
> +# Since: 7.0
> +#
> +##
> +
> +{ 'struct': 'VirtVhostQueueStatus',
> +  'data': { 'name': 'str',
> +            'kick': 'int',
> +            'call': 'int',
> +            'desc': 'uint64',
> +            'avail': 'uint64',
> +            'used': 'uint64',
> +            'num': 'int',
> +            'desc-phys': 'uint64',
> +            'desc-size': 'uint32',
> +            'avail-phys': 'uint64',
> +            'avail-size': 'uint32',
> +            'used-phys': 'uint64',
> +            'used-size': 'uint32' } }
> +
> +##
> +# @x-query-virtio-vhost-queue-status:
> +#
> +# Return information of a given vhost device's vhost_virtqueue
> +#
> +# @path: VirtIODevice canonical QOM path
> +#
> +# @queue: vhost_virtqueue index to examine
> +#
> +# Features:
> +# @unstable: This command ism eant for debugging

Likewise.

"is meant", like in v9.

> +#
> +# Returns: VirtVhostQueueStatus of the vhost_virtqueue
> +#
> +# Since: 7.0
> +#
> +# Examples:
> +#
> +# 1. Get vhost_virtqueue status for vhost-crypto
> +#
> +# -> { "execute": "x-query-virtio-vhost-queue-status",
> +#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
> +#                     "queue": 0 }
> +#    }
> +# <- { "return": {
> +#            "avail-phys": 5216124928,
> +#            "used-phys": 5216127040,
> +#            "avail-size": 2054,
> +#            "desc-size": 16384,
> +#            "used-size": 8198,
> +#            "desc": 140141447430144,
> +#            "num": 1024,
> +#            "name": "virtio-crypto",
> +#            "call": 0,
> +#            "avail": 140141447446528,
> +#            "desc-phys": 5216108544,
> +#            "used": 140141447448640,
> +#            "kick": 0 }
> +#    }
> +#
> +# 2. Get vhost_virtqueue status for vhost-vsock
> +#
> +# -> { "execute": "x-query-virtio-vhost-queue-status",
> +#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
> +#                     "queue": 0 }
> +#    }
> +# <- { "return": {
> +#            "avail-phys": 5182261248,
> +#            "used-phys": 5182261568,
> +#            "avail-size": 262,
> +#            "desc-size": 2048,
> +#            "used-size": 1030,
> +#            "desc": 140141413580800,
> +#            "num": 128,
> +#            "name": "vhost-vsock",
> +#            "call": 0,
> +#            "avail": 140141413582848,
> +#            "desc-phys": 5182259200,
> +#            "used": 140141413583168,
> +#            "kick": 0 }
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-query-virtio-vhost-queue-status',
> +  'data': { 'path': 'str', 'queue': 'uint16' },
> +  'returns': 'VirtVhostQueueStatus',
> +  'features': [ 'unstable' ] }

With my doc remarks addressed, QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


