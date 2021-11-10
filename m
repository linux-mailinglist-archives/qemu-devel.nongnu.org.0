Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BDA44C28B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:54:34 +0100 (CET)
Received: from localhost ([::1]:47532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mko3d-0002nL-Vf
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:54:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mko1b-0000jB-Bk
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:52:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mko1Y-0006Ki-QQ
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636552344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V7ZjhBC0nOPfY8YP6cpGqVXAoD1cWheUfX2z/FX683A=;
 b=eRdgyXJUW+p/l13ayG6msnQwTT5TTUZlA+f4lEV4675wMZnou3flUvqwFtH5fFFmEFv+Oq
 AbRXqVjSTmYWG4n0EKGqXPQ6qMMyDozV9G6HKHMu9V5EtHU32YN+3MIjH0MhsOoWHipStO
 BeWJgNwq7p4Eer7r2NLyG4vqWsd2F5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-jjrvw5bZN-2BuQjzZPc1RA-1; Wed, 10 Nov 2021 08:52:20 -0500
X-MC-Unique: jjrvw5bZN-2BuQjzZPc1RA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9113D18D6A2A;
 Wed, 10 Nov 2021 13:52:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2769160C17;
 Wed, 10 Nov 2021 13:52:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C6B0C11380A7; Wed, 10 Nov 2021 14:52:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v9 7/8] qmp: add QMP command x-query-virtio-queue-element
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
 <1636539792-20967-8-git-send-email-jonah.palmer@oracle.com>
Date: Wed, 10 Nov 2021 14:52:16 +0100
In-Reply-To: <1636539792-20967-8-git-send-email-jonah.palmer@oracle.com>
 (Jonah Palmer's message of "Wed, 10 Nov 2021 05:23:11 -0500")
Message-ID: <87a6icw227.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> This new command shows the information of a VirtQueue element.
>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>

[...]

> diff --git a/qapi/virtio.json b/qapi/virtio.json
> index 0f65044..c57fbc5 100644
> --- a/qapi/virtio.json
> +++ b/qapi/virtio.json
> @@ -1061,3 +1061,180 @@
>  { 'command': 'x-query-virtio-vhost-queue-status',
>    'data': { 'path': 'str', 'queue': 'uint16' },
>    'returns': 'VirtVhostQueueStatus', 'features': [ 'unstable' ] }
> +
> +##
> +# @VirtioRingDescFlags:
> +#
> +# An enumeration of the virtio ring descriptor flags
> +#
> +# Since: 6.3
> +#
> +##
> +
> +{ 'enum': 'VirtioRingDescFlags',
> +  'data': [ 'next', 'write', 'indirect', 'avail', 'used' ]
> +}
> +
> +##
> +# @VirtioRingDesc:
> +#
> +# Information regarding the VRing descriptor area
> +#
> +# @addr: guest physical address of the descriptor data
> +#
> +# @len: length of the descriptor data
> +#
> +# @flags: list of descriptor flags
> +#
> +# Since: 6.3
> +#
> +##
> +
> +{ 'struct': 'VirtioRingDesc',
> +  'data': { 'addr': 'uint64',
> +            'len': 'uint32',
> +            'flags': [ 'VirtioRingDescFlags' ] } }
> +
> +##
> +# @VirtioRingAvail:
> +#
> +# Information regarding the avail VRing (also known as the driver
> +# area)
> +#
> +# @flags: VRingAvail flags
> +#
> +# @idx: VRingAvail index
> +#
> +# @ring: VRingAvail ring[] entry at provided index
> +#
> +# Since: 6.3
> +#
> +##
> +
> +{ 'struct': 'VirtioRingAvail',
> +  'data': { 'flags': 'uint16',
> +            'idx': 'uint16',
> +            'ring': 'uint16' } }
> +
> +##
> +# @VirtioRingUsed:
> +#
> +# Information regarding the used VRing (also known as the device
> +# area)
> +#
> +# @flags: VRingUsed flags
> +#
> +# @idx: VRingUsed index
> +#
> +# Since: 6.3
> +#
> +##
> +
> +{ 'struct': 'VirtioRingUsed',
> +  'data': { 'flags': 'uint16',
> +            'idx': 'uint16' } }
> +
> +##
> +# @VirtioQueueElement:
> +#
> +# Information regarding a VirtQueue VirtQueueElement including
> +# descriptor, driver, and device areas
> +#
> +# @device-name: name of the VirtIODevice which this VirtQueue belongs
> +#               to (for reference)
> +#
> +# @index: index of the element in the queue
> +#
> +# @ndescs: number of descriptors
> +#
> +# @descs: list of the descriptors

Can @ndescs ever be not equal to the length of @descs?

If no, it's redundant.

> +#
> +# @avail: VRingAvail info
> +#
> +# @used: VRingUsed info
> +#
> +# Since: 6.3
> +#
> +##
> +
> +{ 'struct': 'VirtioQueueElement',
> +  'data': { 'device-name': 'str',
> +            'index': 'uint32',
> +            'ndescs': 'uint32',
> +            'descs': [ 'VirtioRingDesc' ],
> +            'avail': 'VirtioRingAvail',
> +            'used': 'VirtioRingUsed' } }
> +
> +##
> +# @x-query-virtio-queue-element:
> +#
> +# Return the information about a VirtQueue VirtQueueElement (by
> +# default looks at the head of the queue)
> +#
> +# @path: VirtIODevice canonical QOM path
> +#
> +# @queue: VirtQueue index to examine
> +#
> +# @index: the index in the queue, by default head
> +#
> +# Features:
> +# @unstable: This command is meant for debugging.
> +#
> +# Returns: VirtioQueueElement information
> +#
> +# Since: 6.3
> +#
> +# Examples:
> +#
> +# 1. Introspect on virtio-net virtqueue 0 at index 5
> +#
> +# -> { "execute": "x-query-virtio-queue-element",
> +#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
> +#                     "queue": 0,
> +#                     "index": 5 }
> +#    }
> +# <- { "return": {
> +#         "index": 5,
> +#         "ndescs": 1,
> +#         "device-name": "virtio-net",
> +#         "descs": [ { "flags": ["write"], "len": 1536, "addr": 5257305600 } ],
> +#         "avail": { "idx": 256, "flags": 0, "ring": 5 },
> +#         "used": { "idx": 13, "flags": 0 } }
> +#    }
> +#
> +# 2. Introspect on virtio-crypto virtqueue 1 at head
> +#
> +# -> { "execute": "x-query-virtio-queue-element",
> +#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
> +#                     "queue": 1 }
> +#    }
> +# <- { "return": {
> +#         "index": 0,
> +#         "ndescs": 1,
> +#         "device-name": "virtio-crypto",
> +#         "descs": [ { "flags": [], "len": 0, "addr": 8080268923184214134 } ],
> +#         "avail": { "idx": 280, "flags": 0, "ring": 0 },
> +#         "used": { "idx": 280, "flags": 0 } }
> +#    }
> +#
> +# 3. Introspect on virtio-scsi virtqueue 2 at head
> +#
> +# -> { "execute": "x-query-virtio-queue-element",
> +#      "arguments": { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
> +#                     "queue": 2 }
> +#    }
> +# <- { "return": {
> +#         "index": 19,
> +#         "ndescs": 1,
> +#         "device-name": "virtio-scsi",
> +#         "descs": [ { "flags": ["used", "indirect", "write"], "len": 4099327944,
> +#                      "addr": 12055409292258155293 } ],
> +#         "avail": { "idx": 1147, "flags": 0, "ring": 19 },
> +#         "used": { "idx": 1147, "flags": 0 } }
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-query-virtio-queue-element',
> +  'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
> +  'returns': 'VirtioQueueElement', 'features': [ 'unstable' ] }


