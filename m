Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C5D44EA84
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 16:38:33 +0100 (CET)
Received: from localhost ([::1]:56692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlYdM-0004kT-D6
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 10:38:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mlYcP-0003wb-6D
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 10:37:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mlYcK-0002bM-C0
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 10:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636731447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cKvEVquHCvgYrQZHZHxGtBJgZb8WTD6/DM56FB+sVVM=;
 b=b1Y7kPoJ8+2GqlKnZ3465kQVismgD+dhT6leSXuDqlhvqhQvc0+a+Ru9q1QAKBq4LX7Ujh
 7mD8PdgZixhkSgk4n01nj+1UtSdaXN2MFMgGR/Dpm/YDAsxGpojCvBeHCCdX2o6wgWx+f5
 f5je1RQzI1TRgKKAaUEIHD/lTMWo7+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-h-dwZHDRNYCQWS6KotJitw-1; Fri, 12 Nov 2021 10:37:24 -0500
X-MC-Unique: h-dwZHDRNYCQWS6KotJitw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA1E01006AA0;
 Fri, 12 Nov 2021 15:37:22 +0000 (UTC)
Received: from localhost (unknown [10.39.194.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B9BD5D9DC;
 Fri, 12 Nov 2021 15:37:21 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 1/5] virtio: introduce virtio_force_modern()
In-Reply-To: <20211112145749.618157-2-pasic@linux.ibm.com>
Organization: Red Hat GmbH
References: <20211112145749.618157-1-pasic@linux.ibm.com>
 <20211112145749.618157-2-pasic@linux.ibm.com>
User-Agent: Notmuch/0.33.1 (https://notmuchmail.org)
Date: Fri, 12 Nov 2021 16:37:20 +0100
Message-ID: <877dddmllb.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12 2021, Halil Pasic <pasic@linux.ibm.com> wrote:

> Legacy vs modern should be detected via transport specific means. We
> can't wait till feature negotiation is done. Let us introduce
> virtio_force_modern() as a means for the transport code to signal
> that the device should operate in modern mode (because a modern driver
> was detected).
>
> A new callback is added for the situations where the device needs
> to do more than just setting the VIRTIO_F_VERSION_1 feature bit. For
> example, when vhost is involved, we may need to propagate the features
> to the vhost device.
>
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> ---
>
> I'm still struggling with how to deal with vhost-user and co. The
> problem is that I'm not very familiar with the life-cycle of, let us
> say, a vhost_user device.
>
> Looks to me like the vhost part might be just an implementation detail,
> and could even become a hot swappable thing.
>
> Another thing is, that vhost processes set_features differently. It
> might or might not be a good idea to change this.
>
> Does anybody know why don't we propagate the features on features_set,
> but under a set of different conditions, one of which is the vhost
> device is started?
> ---
>  hw/virtio/virtio.c         | 13 +++++++++++++
>  include/hw/virtio/virtio.h |  2 ++
>  2 files changed, 15 insertions(+)
>

Did you see my feedback in
https://lore.kernel.org/qemu-devel/87tugzc26y.fsf@redhat.com/? I think
at least some of it still applies.

> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 3a1f6c520c..26db1b31e6 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3281,6 +3281,19 @@ void virtio_init(VirtIODevice *vdev, const char *name,
>      vdev->use_guest_notifier_mask = true;
>  }
>  
> +void  virtio_force_modern(VirtIODevice *vdev)

I'd still prefer to call this virtio_indicate_modern: we don't really
force anything; the driver has simply already decided that it will use
the modern interface and we provide an early indication in the features
so that code looking at them makes the right decisions.

> +{
> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> +
> +    virtio_add_feature(&vdev->guest_features, VIRTIO_F_VERSION_1);
> +    /* Let the device do it's normal thing. */
> +    virtio_set_features(vdev, vdev->guest_features);

I don't think this is substantially different from setting VERSION_1
only: At least the callers you introduce call this during reset,
i.e. when guest_features is 0 anyway. We still have the whole processing
that is done after feature setting that may have effects different from
what the ultimate feature setting will give us. While I don't think
calling set_features twice is forbidden, that sequence is likely quite
untested, and I'm not sure we can exclude side effects.

> +    /* For example for vhost-user we have to propagate to the vhost dev. */
> +    if (k->force_modern) {
> +        k->force_modern(vdev);
> +    }
> +}
> +
>  /*
>   * Only devices that have already been around prior to defining the virtio
>   * standard support legacy mode; this includes devices not specified in the


