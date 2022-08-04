Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202B8589A59
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 12:17:58 +0200 (CEST)
Received: from localhost ([::1]:50492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJXvQ-000421-T1
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 06:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oJXro-0008D4-8i
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 06:14:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oJXrl-0004CY-Nf
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 06:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659608048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5RVywGVfidpMTyhxOnoRPtdCpV8vkKo7ExIXaORKsq0=;
 b=BNicYBJU2btEaMq9I19vg3E25jd/qlDmpP4YVcY1IcCW3YPczlGpnuHYGqONOXNmr2GgO7
 NKztlv7tMCGFmuJcvvF0RkdppamW262HX+RXbkrFGY/b0GA7BfL8RFRcdgDnrwW0asap9q
 SpW62CH+WS4uAfS769M+X+I42M++20c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-inKe8biZMfmYhr1_AI3gDA-1; Thu, 04 Aug 2022 06:14:05 -0400
X-MC-Unique: inKe8biZMfmYhr1_AI3gDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BD2A3802B83;
 Thu,  4 Aug 2022 10:14:05 +0000 (UTC)
Received: from localhost (unknown [10.39.193.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92F822166B26;
 Thu,  4 Aug 2022 10:14:04 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>, Fam Zheng
 <fam@euphon.net>, Amit Shah <amit@kernel.org>, Laurent Vivier
 <lvivier@redhat.com>, Hanna Reitz <hreitz@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David
 Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 1/2] virtio: document vdc->get_features() callback
In-Reply-To: <20220803173606.965926-2-stefanha@redhat.com>
Organization: Red Hat GmbH
References: <20220803173606.965926-1-stefanha@redhat.com>
 <20220803173606.965926-2-stefanha@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Thu, 04 Aug 2022 12:14:02 +0200
Message-ID: <87h72s8get.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 03 2022, Stefan Hajnoczi <stefanha@redhat.com> wrote:

> Suggested-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/virtio/virtio.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index db1c0ddf6b..8d27fe1824 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -120,9 +120,29 @@ struct VirtioDeviceClass {
>      /* This is what a VirtioDevice must implement */
>      DeviceRealize realize;
>      DeviceUnrealize unrealize;
> +
> +    /**
> +     * get_features:
> +     * @vdev: the VirtIODevice
> +     * @requested_features: existing device feature bits from
> +     *                      vdev->host_features
> +     * @errp: pointer to error object
> +     *
> +     * Get the device feature bits.
> +     *
> +     * The ->get_features() function typically sets always-on device feature
> +     * bits as well as conditional feature bits that require some logic to
> +     * compute.
> +     *
> +     * Device feature bits can also be set in vdev->host_features before this
> +     * function is called using DEFINE_PROP_BIT64() qdev properties.
> +     *
> +     * Returns: the final device feature bits to store in vdev->host_features.
> +     */

Not sure if we want to go full function doc for features, as none of the
other callbacks have it...

I thought about something like

"Called with vdev->host_features in requested_features. Returns device
feature bits to be stored in vdev->host_features after factoring in
device-specific feature bits."

The important part IMHO is that requested_features contains
vdev->host_features, so no need to merge them in.

>      uint64_t (*get_features)(VirtIODevice *vdev,
>                               uint64_t requested_features,
>                               Error **errp);
> +
>      uint64_t (*bad_features)(VirtIODevice *vdev);
>      void (*set_features)(VirtIODevice *vdev, uint64_t val);
>      int (*validate_features)(VirtIODevice *vdev);


