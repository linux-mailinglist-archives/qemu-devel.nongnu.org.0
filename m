Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAE4425254
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 13:54:57 +0200 (CEST)
Received: from localhost ([::1]:40780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYRzE-0007mV-FM
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 07:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mYRxe-0006OS-Vw
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:53:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mYRxd-0003Hk-Ey
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:53:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633607596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AZvF8lHSRTx5C1gxLkoYVX71Yos23PQLi8wLibZ0710=;
 b=CsOuRWmN7r4m+unJ89OFffL8BGavpp7x+CnXtuNBmB4TdbDJf7Tnyl5KNmTm+9O608Z17V
 QVBYyUmAlWwgvBtkip58JeQ7oYJdJsJgeeHBxnrL5ILAJm9m9Xaosu/poCFI8nzXn5bViT
 +sOHJeiS/AvPckKap7WaEVHTR94X2eg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-f60KTsS4N0205Zinm8Nj0g-1; Thu, 07 Oct 2021 07:52:49 -0400
X-MC-Unique: f60KTsS4N0205Zinm8Nj0g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 985AB100CC84;
 Thu,  7 Oct 2021 11:52:47 +0000 (UTC)
Received: from localhost (unknown [10.39.193.140])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F47D4EC7D;
 Thu,  7 Oct 2021 11:52:26 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Xie Yongji
 <xieyongji@bytedance.com>, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] virtio: write back F_VERSION_1 before validate
In-Reply-To: <20211006142533.2735019-1-pasic@linux.ibm.com>
Organization: Red Hat GmbH
References: <20211006142533.2735019-1-pasic@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Thu, 07 Oct 2021 13:52:24 +0200
Message-ID: <875yu9yruv.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 06 2021, Halil Pasic <pasic@linux.ibm.com> wrote:

> The virtio specification virtio-v1.1-cs01 states: Transitional devices
> MUST detect Legacy drivers by detecting that VIRTIO_F_VERSION_1 has not
> been acknowledged by the driver.  This is exactly what QEMU as of 6.1
> has done relying solely on VIRTIO_F_VERSION_1 for detecting that.
>
> However, the specification also says: driver MAY read (but MUST NOT
> write) the device-specific configuration fields to check that it can
> support the device before setting FEATURES_OK.

Suggest to put the citations from the spec into quotes, so that they are
distinguishable from the rest of the text.

>
> In that case, any transitional device relying solely on
> VIRTIO_F_VERSION_1 for detecting legacy drivers will return data in
> legacy format.  In particular, this implies that it is in big endian
> format for big endian guests. This naturally confuses the driver which
> expects little endian in the modern mode.
>
> It is probably a good idea to amend the spec to clarify that
> VIRTIO_F_VERSION_1 can only be relied on after the feature negotiation
> is complete. However, we already have regression so let's try to address

s/regression/a regression/

> it.

Maybe mention what the regression is?

Also mention that we use this workaround for modern on BE only?

>
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Fixes: 82e89ea077b9 ("virtio-blk: Add validation for block size in config space")
> Fixes: fe36cbe0671e ("virtio_net: clear MTU when out of range")
> Reported-by: markver@us.ibm.com
> ---
>  drivers/virtio/virtio.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index 0a5b54034d4b..494cfecd3376 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -239,6 +239,16 @@ static int virtio_dev_probe(struct device *_d)
>  		driver_features_legacy = driver_features;
>  	}
>  
> +	/*
> +	 * Some devices detect legacy solely via F_VERSION_1. Write
> +	 * F_VERSION_1 to force LE for these when needed.

"...to force LE config space accesses before FEATURES_OK for these when
needed (BE)."

?

> +	 */
> +	if (drv->validate && !virtio_legacy_is_little_endian()
> +			  && BIT_ULL(VIRTIO_F_VERSION_1) & device_features) {

Nit: putting device_features first would read more naturally to me.

> +		dev->features = BIT_ULL(VIRTIO_F_VERSION_1);
> +		dev->config->finalize_features(dev);
> +	}
> +
>  	if (device_features & (1ULL << VIRTIO_F_VERSION_1))
>  		dev->features = driver_features & device_features;
>  	else

Patch LGTM.


