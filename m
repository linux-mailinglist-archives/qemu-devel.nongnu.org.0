Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7673E355C
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 14:37:13 +0200 (CEST)
Received: from localhost ([::1]:37974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCLZf-0001XS-Q4
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 08:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCLYo-0000lN-Ln
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:36:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCLYl-0007mn-VI
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628339774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Za9edc3ilOLKsFY1VTQlg0sPj4u5SDf/1nukGtbQRIk=;
 b=PzTJHwsKX/22SNRb3YAtfcwxXp9dccvu+s4ZhCH4gsab2DGD1eDD9+6lZmemT1bt47i43x
 blcVUQZEnQNbFdBeROgU4yWA1Q2CDvTFpMR8CQn4czYCQQqavlLf3GXEjqsWwLdM3Em7+1
 ifWtPsy8Hr87wOxqYR9MQrjPt3rM1XE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-1MAon21gOa-NLupA5Qsczw-1; Sat, 07 Aug 2021 08:36:13 -0400
X-MC-Unique: 1MAon21gOa-NLupA5Qsczw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A106180FCA7;
 Sat,  7 Aug 2021 12:36:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EAA31000186;
 Sat,  7 Aug 2021 12:35:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E981111380A0; Sat,  7 Aug 2021 14:35:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v6 1/6] qmp: add QMP command x-debug-query-virtio
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-2-git-send-email-jonah.palmer@oracle.com>
Date: Sat, 07 Aug 2021 14:35:51 +0200
In-Reply-To: <1626086137-16292-2-git-send-email-jonah.palmer@oracle.com>
 (Jonah Palmer's message of "Mon, 12 Jul 2021 06:35:32 -0400")
Message-ID: <87o8a9e8k8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

QAPI schema review only.

Jonah Palmer <jonah.palmer@oracle.com> writes:

> From: Laurent Vivier <lvivier@redhat.com>
>
> This new command lists all the instances of VirtIODevice with
> their path and virtio type.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>

[...]

> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index 4912b97..0c89789 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -91,5 +91,6 @@
>  { 'include': 'misc.json' }
>  { 'include': 'misc-target.json' }
>  { 'include': 'audio.json' }
> +{ 'include': 'virtio.json' }
>  { 'include': 'acpi.json' }
>  { 'include': 'pci.json' }
> diff --git a/qapi/virtio.json b/qapi/virtio.json
> new file mode 100644
> index 0000000..804adbe
> --- /dev/null
> +++ b/qapi/virtio.json
> @@ -0,0 +1,72 @@

Please insert at the beginning

   # -*- Mode: Python -*-
   # vim: filetype=python
   #

> +##
> +# = Virtio devices
> +##
> +
> +##
> +# @VirtioType:
> +#
> +# An enumeration of Virtio device types.
> +#
> +# Since: 6.1

6.2 now, here and below.

> +##
> +{ 'enum': 'VirtioType',
> +  'data': [ 'unknown', 'virtio-net', 'virtio-blk', 'virtio-console',
> +            'virtio-rng', 'virtio-balloon', 'virtio-iomem', 'virtio-rpmsg',
> +            'virtio-scsi', 'virtio-9p', 'virtio-mac80211-wlan',
> +            'virtio-serial', 'virtio-caif', 'virtio-memory-balloon',
> +            'unknown-14', 'unknown-15', 'virtio-gpu', 'virtio-clock',
> +            'virtio-input', 'vhost-vsock', 'virtio-crypto', 'virtio-signal-dist',
> +            'virtio-pstore', 'virtio-iommu', 'virtio-mem', 'unknown-25',
> +            'vhost-user-fs', 'virtio-pmem', 'unknown-28', 'virtio-mac80211-hwsim' ]

Please limit line length to approximately 70 characters.

> +}
> +
> +##
> +# @VirtioInfo:
> +#
> +# Information about a given VirtIODevice
> +#
> +# @path: VirtIO device canonical path.

Peeking ahead at the example, I conclude this is a QOM path.  Please
spell that out, e.g. "@path: the device's canonical QOM path".

> +#
> +# @type: VirtIO device type.
> +#
> +# Since: 6.1
> +#
> +##
> +{ 'struct': 'VirtioInfo',
> +  'data': {
> +    'path': 'str',
> +    'type': 'VirtioType'
> +  }
> +}
> +
> +##
> +# @x-debug-query-virtio:
> +#
> +# Return the list of all VirtIO devices
> +#
> +# Returns: list of @VirtioInfo
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "x-debug-query-virtio" }
> +# <- { "return": [
> +#        {
> +#            "path": "/machine/peripheral-anon/device[3]/virtio-backend",
> +#            "type": "virtio-net"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
> +#            "type": "virtio-serial"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
> +#            "type": "virtio-blk"
> +#        }
> +#      ]
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }

[...]


