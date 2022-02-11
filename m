Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE4E4B25D8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 13:34:32 +0100 (CET)
Received: from localhost ([::1]:33372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIV8B-0006fP-A6
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 07:34:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nIUkz-0007fx-JO
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 07:10:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nIUkv-0002yK-NQ
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 07:10:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644581429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FObOxnkxrxu7KBW1F0VwISDoVU4FJD6n4cfO04cXx/c=;
 b=TOBMxy3Hcip9aTHYRzXK2Gmvs633krVG9yPlEze8ovY5LJjH0ilUcK6MnuIb+ipPQNDULf
 yKMESseccOOY2Ii+QXabAKUh3gGwynWuYUtUCC07BHAhikIim+8V43ESDVrBS/MtNmFYVW
 YHygxXvDRk1BTlsDZYXub4TpZSKstPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-2LdGF2vXMhGV1mK8USDeaQ-1; Fri, 11 Feb 2022 07:10:21 -0500
X-MC-Unique: 2LdGF2vXMhGV1mK8USDeaQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C96BB86A8A2;
 Fri, 11 Feb 2022 12:10:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35FF96E1EC;
 Fri, 11 Feb 2022 12:10:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D4AE621E6A00; Fri, 11 Feb 2022 13:10:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v12 7/8] qmp: add QMP command x-query-virtio-queue-element
References: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
 <1644488520-21604-8-git-send-email-jonah.palmer@oracle.com>
Date: Fri, 11 Feb 2022 13:10:11 +0100
In-Reply-To: <1644488520-21604-8-git-send-email-jonah.palmer@oracle.com>
 (Jonah Palmer's message of "Thu, 10 Feb 2022 05:21:59 -0500")
Message-ID: <87tud57gf0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
> This new command shows the information of a VirtQueue element.
>
> [Note: Up until v10 of this patch series, virtio.json had many (15+)
>  enums defined (e.g. decoded device features, statuses, etc.). In v10
>  most of these enums were removed and replaced with string literals.
>  By doing this we get (1) simpler schema, (2) smaller generated code,
>  and (3) less maintenance burden for when new things are added (e.g.
>  devices, device features, etc.).]
>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>

[...]

> diff --git a/qapi/virtio.json b/qapi/virtio.json
> index 44cc05c..bb93d6d 100644
> --- a/qapi/virtio.json
> +++ b/qapi/virtio.json
> @@ -656,3 +656,186 @@
>    'data': { 'path': 'str', 'queue': 'uint16' },
>    'returns': 'VirtVhostQueueStatus',
>    'features': [ 'unstable' ] }
> +
> +##
> +# @VirtioRingDesc:
> +#
> +# Information regarding the vring descriptor area
> +#
> +# @addr: Guest physical address of the descriptor area
> +#
> +# @len: Length of the descriptor area
> +#
> +# @flags: List of descriptor flags
> +#
> +# Since: 7.0
> +#
> +##
> +
> +{ 'struct': 'VirtioRingDesc',
> +  'data': { 'addr': 'uint64',
> +            'len': 'uint32',
> +            'flags': [ 'str' ] } }
> +
> +##
> +# @VirtioRingAvail:
> +#
> +# Information regarding the avail vring (a.k.a. driver area)
> +#
> +# @flags: VRingAvail flags
> +#
> +# @idx: VRingAvail index
> +#
> +# @ring: VRingAvail ring[] entry at provided index
> +#
> +# Since: 7.0
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
> +# Information regarding the used vring (a.k.a. device area)
> +#
> +# @flags: VRingUsed flags
> +#
> +# @idx: VRingUsed index
> +#
> +# Since: 7.0
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
> +# Information regarding a VirtQueue's VirtQueueElement including
> +# descriptor, driver, and device areas
> +#
> +# @name: Name of the VirtIODevice that uses this VirtQueue
> +#
> +# @index: Index of the element in the queue
> +#
> +# @descs: List of descriptors (VirtioRingDesc)
> +#
> +# @avail: VRingAvail info
> +#
> +# @used: VRingUsed info
> +#
> +# Since: 7.0
> +#
> +##
> +
> +{ 'struct': 'VirtioQueueElement',
> +  'data': { 'name': 'str',
> +            'index': 'uint32',
> +            'descs': [ 'VirtioRingDesc' ],
> +            'avail': 'VirtioRingAvail',
> +            'used': 'VirtioRingUsed' } }
> +
> +##
> +# @x-query-virtio-queue-element:
> +#
> +# Return the information about a VirtQueue's VirtQueueElement
> +# (default: head of the queue)

I'd put this line ...

> +#
> +# @path: VirtIODevice canonical QOM path
> +#
> +# @queue: VirtQueue index to examine
> +#
> +# @index: Index of the element in the queue

... here.

> +#
> +# Features:
> +# @unstable: This command is meant for debugging.
> +#
> +# Returns: VirtioQueueElement information
> +#
> +# Since: 7.0
> +#
> +# Examples:
> +#
> +# 1. Introspect on virtio-net's VirtQueue 0 at index 5
> +#
> +# -> { "execute": "x-query-virtio-queue-element",
> +#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
> +#                     "queue": 0,
> +#                     "index": 5 }
> +#    }
> +# <- { "return": {
> +#            "index": 5,
> +#            "name": "virtio-net",
> +#            "descs": [
> +#               { "flags": ["write"], "len": 1536, "addr": 5257305600 }
> +#            ],
> +#            "avail": {
> +#               "idx": 256,
> +#               "flags": 0,
> +#               "ring": 5
> +#            },
> +#            "used": {
> +#               "idx": 13,
> +#               "flags": 0
> +#            },
> +#    }
> +#
> +# 2. Introspect on virtio-crypto's VirtQueue 1 at head
> +#
> +# -> { "execute": "x-query-virtio-queue-element",
> +#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
> +#                     "queue": 1 }
> +#    }
> +# <- { "return": {
> +#            "index": 0,
> +#            "name": "virtio-crypto",
> +#            "descs": [
> +#               { "flags": [], "len": 0, "addr": 8080268923184214134 }
> +#            ],
> +#            "avail": {
> +#               "idx": 280,
> +#               "flags": 0,
> +#               "ring": 0
> +#            },
> +#            "used": {
> +#               "idx": 280,
> +#               "flags": 0
> +#            }
> +#    }
> +#
> +# 3. Introspect on virtio-scsi's VirtQueue 2 at head
> +#
> +# -> { "execute": "x-query-virtio-queue-element",
> +#      "arguments": { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
> +#                     "queue": 2 }
> +#    }
> +# <- { "return": {
> +#            "index": 19,
> +#            "name": "virtio-scsi",
> +#            "descs": [
> +#               { "flags": ["used", "indirect", "write"], "len": 4099327944,
> +#                 "addr": 12055409292258155293 }
> +#            ],
> +#            "avail": {
> +#               "idx": 1147,
> +#               "flags": 0,
> +#               "ring": 19
> +#            },
> +#            "used": {
> +#               "idx": 280,
> +#               "flags": 0
> +#            }
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-query-virtio-queue-element',
> +  'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
> +  'returns': 'VirtioQueueElement',
> +  'features': [ 'unstable' ] }

Preferably with my doc tweak, QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


