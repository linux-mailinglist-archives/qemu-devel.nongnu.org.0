Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770413E355F
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 14:43:46 +0200 (CEST)
Received: from localhost ([::1]:44250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCLg1-0005zr-I8
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 08:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCLf1-0005BM-NP
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:42:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCLez-0002ez-IG
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628340160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SjiAPNYu4W8vlOqvPTtwbuy3QNzJlg5oBjWuGF2v9G0=;
 b=Md5fYokJzZCGV52zq7v5KeTVbmoNoj9R2idRGr9rrHKJTh1pZYndu1CyQ7Zsjp/FqaI5f4
 4/EDPxBhiE/XTPURsKSavGU9/ooCS0XKJ0bYXW7CcERINWtb60HBYM8WeoyeUczVU3Qw6J
 otI/FLxrWvy3ORZTqUUQKqpBTeoLrsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-PpgVStNNMFqWMl7RAyFFQw-1; Sat, 07 Aug 2021 08:42:39 -0400
X-MC-Unique: PpgVStNNMFqWMl7RAyFFQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28FB310066E8;
 Sat,  7 Aug 2021 12:42:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE64F5D9FC;
 Sat,  7 Aug 2021 12:42:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 46E2711380A0; Sat,  7 Aug 2021 14:42:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v6 2/6] qmp: add QMP command x-debug-virtio-status
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-3-git-send-email-jonah.palmer@oracle.com>
Date: Sat, 07 Aug 2021 14:42:13 +0200
In-Reply-To: <1626086137-16292-3-git-send-email-jonah.palmer@oracle.com>
 (Jonah Palmer's message of "Mon, 12 Jul 2021 06:35:33 -0400")
Message-ID: <87bl69e89m.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 mst@redhat.com, michael.roth@amd.com, jasowang@redhat.com, david@redhat.com,
 qemu-devel@nongnu.org, amit@kernel.org, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, si-wei.liu@oracle.com,
 marcandre.lureau@redhat.com, joao.m.martins@oracle.com, mreitz@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jonah Palmer <jonah.palmer@oracle.com> writes:

> From: Laurent Vivier <lvivier@redhat.com>
>
> This new command shows the status of a VirtIODevice
> (features, endianness and number of virtqueues)
>
> Next patch will improve output by decoding feature bits.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>

[...]

> diff --git a/qapi/virtio.json b/qapi/virtio.json
> index 804adbe..4bd09c9 100644
> --- a/qapi/virtio.json
> +++ b/qapi/virtio.json
> @@ -70,3 +70,79 @@
>  ##
>  
>  { 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
> +
> +##
> +# @VirtioStatusEndianness:
> +#
> +# Enumeration of endianness for VirtioDevice
> +#
> +# Since: 6.1

6.2 now, here, below, and in the remainder of this series.

> +##
> +{ 'enum': 'VirtioStatusEndianness',
> +  'data': [ 'unknown', 'little', 'big' ]
> +}
> +
> +##
> +# @VirtioStatus:
> +#
> +# @device-id: VirtIODevice status

"status"?  Really?

> +#
> +# @device-endian: VirtIODevice device_endian
> +#
> +# @guest-features: VirtIODevice guest_features
> +#
> +# @host-features: VirtIODevice host_features
> +#
> +# @backend-features: VirtIODevice backend_features
> +#
> +# @num-vqs: number of VirtIODevice queues
> +#
> +# Since: 6.1
> +#
> +##
> +
> +{ 'struct': 'VirtioStatus',
> +  'data': {
> +    'device-id': 'int',

VirtIODevice member @device_id is uint64_t.  Should this be 'uint16'?

> +    'device-endian': 'VirtioStatusEndianness',
> +    'guest-features': 'uint64',
> +    'host-features': 'uint64',
> +    'backend-features': 'uint64',
> +    'num-vqs': 'uint16'

virtio_get_num_queues() returns int.  Sure 'uint16' is the right type?

> +  }
> +}
> +
> +##
> +# @x-debug-virtio-status:
> +#
> +# Return the status of virtio device

"of a virtio device"

> +#
> +# @path: QOBject path of the VirtIODevice

"QOM path", please.

> +#
> +# Returns: status of the VirtIODevice
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "x-debug-virtio-status",
> +#      "arguments": {
> +#          "path": "/machine/peripheral-anon/device[3]/virtio-backend"
> +#      }
> +#   }
> +# <- { "return": {
> +#          "backend-features": 0,
> +#          "guest-features": 5111807911,
> +#          "num-vqs": 3,
> +#          "host-features": 6337593319,
> +#          "device-endian": "little",
> +#          "device-id": 1
> +#      }
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-debug-virtio-status',
> +  'data': { 'path': 'str' },
> +  'returns': 'VirtioStatus'
> +}


