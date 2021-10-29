Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B23643FECE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 16:57:05 +0200 (CEST)
Received: from localhost ([::1]:55406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgTJX-0000ZL-Rw
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 10:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mgTGi-0006ki-TP
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mgTGd-0001tH-An
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635519237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GNRxhNDcRrggFUPwWRln9o931h7QP53klAiJEMZFnNs=;
 b=iF/tsUHuA0+UIIHii6JFQINOMVOdFmAgLC7sMsJpoUmH7EmKkCTAyFFa0yEgLCuHG2RGNz
 GU3ratB0ZaaYlc/B2PGaheYkdPKasRp1Z5N0ZIDDtISKKmdXkChwgULW0tTc8l+KbxMTs1
 E2q5pNQeSGP6b8lBXGPRYLCskQkBTLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-SIevudkRPxG7esS40gXkbw-1; Fri, 29 Oct 2021 10:53:54 -0400
X-MC-Unique: SIevudkRPxG7esS40gXkbw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67CA2806702;
 Fri, 29 Oct 2021 14:53:53 +0000 (UTC)
Received: from localhost (unknown [10.39.193.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B27026E77;
 Fri, 29 Oct 2021 14:53:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v1 1/3] virtio: introduce virtio_force_modern()
In-Reply-To: <20211028220017.930806-2-pasic@linux.ibm.com>
Organization: Red Hat GmbH
References: <20211028220017.930806-1-pasic@linux.ibm.com>
 <20211028220017.930806-2-pasic@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 29 Oct 2021 16:53:25 +0200
Message-ID: <87tugzc26y.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 29 2021, Halil Pasic <pasic@linux.ibm.com> wrote:

> Legacy vs modern should be detected via transport specific means. We
> can't wait till feature negotiation is done. Let us introduce
> virtio_force_modern() as a means for the transport code to signal
> that the device should operate in modern mode (because a modern driver
> was detected).
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
>  hw/virtio/virtio.c         | 12 ++++++++++++
>  include/hw/virtio/virtio.h |  1 +
>  2 files changed, 13 insertions(+)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 3a1f6c520c..75aee0e098 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3281,6 +3281,18 @@ void virtio_init(VirtIODevice *vdev, const char *name,
>      vdev->use_guest_notifier_mask = true;
>  }
>  
> +void  virtio_force_modern(VirtIODevice *vdev)

<bikeshed> I'm not sure I like that name. We're not actually forcing the
device to be modern, we just set an early indication in the device
before proper feature negotiation has finished. Maybe
virtio_indicate_modern()? </bikeshed>

> +{
> +    /*
> +     * This takes care of the devices that implement config space access
> +     * in QEMU. For vhost-user and similar we need to make sure the features
> +     * are actually propagated to the device implementing the config space.
> +     *
> +     * A VirtioDeviceClass callback may be a good idea.
> +     */
> +    virtio_set_features(vdev, (1ULL << VIRTIO_F_VERSION_1));

Do we really need/want to do the whole song-and-dance for setting
features, just for setting VERSION_1? Devices may modify some of their
behaviour or features, depending on what features they are called with,
and we will be calling this one again later with what is likely a
different feature set. Also, the return code is not checked.

Maybe introduce a new function that sets guest_features directly and
errors out if the features are not set in host_features? If we try to
set VERSION_1 here despite the device not offering it, we are in a
pickle anyway, as we should not have gotten here if we did not offer it,
and we really should moan and fail in that case.

> +}
> +
>  /*
>   * Only devices that have already been around prior to defining the virtio
>   * standard support legacy mode; this includes devices not specified in the


