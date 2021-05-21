Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D39B38C066
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 09:08:09 +0200 (CEST)
Received: from localhost ([::1]:58860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljzGR-0006uQ-TM
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 03:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljzEf-00068t-JL
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:06:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljzE0-0006MM-Cb
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621580734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dPQxpukW2+dqaKmQ+Ow8IEDSk+DcGpUHsknip9l8bKM=;
 b=hhdhskNQV7wM5nC8SjHFZykxGEXkmQ9HyyY2KSdeQdicHhPCQxbQlQSHWo5jGpVr3inVJj
 m+DMKR6OAxDKDaJxGAaqVwi4LjlyR+8GBK0hB9HpBjFNEYl9LC6YEDjHfCaujt9I3kBRq1
 17RDA3gfA2cE4b1Rm5EpMyn5fjCfLKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-tPPH6gNtO8adurmJFFJBbw-1; Fri, 21 May 2021 03:05:32 -0400
X-MC-Unique: tPPH6gNtO8adurmJFFJBbw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D77C801B14;
 Fri, 21 May 2021 07:05:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BBCD5D76F;
 Fri, 21 May 2021 07:05:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D84CD113865F; Fri, 21 May 2021 09:05:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [RFC v3 04/29] vhost: Add x-vhost-enable-shadow-vq qmp
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-5-eperezma@redhat.com>
Date: Fri, 21 May 2021 09:05:15 +0200
In-Reply-To: <20210519162903.1172366-5-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Wed, 19 May 2021 18:28:38 +0200")
Message-ID: <87y2c8pnx0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio P=C3=A9rez <eperezma@redhat.com> writes:

> Command to enable shadow virtqueue looks like:
>
> { "execute": "x-vhost-enable-shadow-vq",
>   "arguments": { "name": "dev0", "enable": true } }
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  qapi/net.json     | 22 ++++++++++++++++++++++
>  hw/virtio/vhost.c |  6 ++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index c31748c87f..660feafdd2 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -77,6 +77,28 @@
>  ##
>  { 'command': 'netdev_del', 'data': {'id': 'str'} }
> =20
> +##
> +# @x-vhost-enable-shadow-vq:
> +#
> +# Use vhost shadow virtqueue.
> +#
> +# @name: the device name of the VirtIO device
> +#
> +# @enable: true to use he alternate shadow VQ notification path

Typo "he".

What's a "notification path", and why should I care?

Maybe

   # @enable: Enable alternate shadow VQ notification

> +#
> +# Returns: Error if failure, or 'no error' for success. Not found if vho=
st is not enabled.

This is confusing.  What do you mean by "Not found"?

If you mean DeviceNotFound:

1. Not actually true: qmp_x_vhost_enable_shadow_vq() always fails with
GenericError.  Perhaps later patches will change that.

2. Do you really need to distinguish "vhost is not enabled" from other
errors?

> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "x-vhost-enable-shadow-vq", "arguments": { "name": "vi=
rtio-net", "enable": false } }

Please break the long line, e.g. like this:

   # -> { "execute": "x-vhost-enable-shadow-vq",
   #      "arguments": { "name": "virtio-net", "enable": false } }

We normally show output in examples, too.

> +#
> +##
> +{ 'command': 'x-vhost-enable-shadow-vq',
> +  'data': {'name': 'str', 'enable': 'bool'},
> +  'if': 'defined(CONFIG_VHOST_KERNEL)' }
> +
>  ##
>  # @NetLegacyNicOptions:
>  #
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 40f9f64ebd..c4c1f80661 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -15,6 +15,7 @@
> =20
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-commands-net.h"
>  #include "hw/virtio/vhost.h"
>  #include "qemu/atomic.h"
>  #include "qemu/range.h"
> @@ -1831,3 +1832,8 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
> =20
>      return -1;
>  }
> +
> +void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error *=
*errp)
> +{
> +    error_setg(errp, "Shadow virtqueue still not implemented");
> +}


