Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872F942BC89
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:12:30 +0200 (CEST)
Received: from localhost ([::1]:58302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mabFN-0003hY-Mh
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mabDK-0002td-G0
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:10:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mabDG-0006s6-BH
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:10:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634119816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XIV6EWlf8IYh7mOxA5NB+uuQJyLxn6kGVxkuMI5GYog=;
 b=bsGly8ZB84YYvX2eeaAnMpAK+4QdXYnJ6Yq9s9K8I2nvyQBa5fu16RHLd4OGAEAfmEaFAF
 cVHVBEQBwijOqKjvlTd51weOsrFi8T3rBWl5JuXAjF8pMV+n3cYcQPFcnDQF96xjKow792
 B/J+A7JltqQ2C2qwxBVVxOvjYpqdrGs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-GbNySCLVNx-agQsb4ZzFGg-1; Wed, 13 Oct 2021 06:10:15 -0400
X-MC-Unique: GbNySCLVNx-agQsb4ZzFGg-1
Received: by mail-wr1-f69.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so1622305wrh.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 03:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XIV6EWlf8IYh7mOxA5NB+uuQJyLxn6kGVxkuMI5GYog=;
 b=cVuLJHZKIzFGoxa8Wsp8JIoQdQblv4P5HUPJMBKmUkJnJx4Y5AL0REdMoJjlF/Ej4n
 EuHkGCmzBYePMQV2QlKbObFjSiwSbsSTYqGKNJS0XPiQpW3fd2fw8DCwm2c+YdA/20cH
 Ft2dxoUUC5zr63jcaH2SqPtPrlTiaCoEzUVqkJLlxI7OFa9xHWLF4mec/QXkAkqUrVHH
 Xytn+qKM8xtA897MZQqMMCUfQlY9i4ArnXxLSIYHy/PLH5tdnlBFgaQR7Nw3995uBNJJ
 oX+WLn/b/tY3DYxgsxZpY2ZtLCPNoAmqoyPHb3mVc6EfMKJCSU6sKIoA+ikrUPAHYL2u
 UnAg==
X-Gm-Message-State: AOAM533T79H4V/boz9sHaKdcKdG/8gZZRQFr13JJolDPQibCWuDvbKgq
 lfWQt2pnlMz+RqoNoEbeOFaFO/jLA3EZQR2EP/jMyv6xXd33oxnkAHKf9TPt1UU/pBm6oK4CijN
 V7ZSdKFmLqdK5OLw=
X-Received: by 2002:a5d:6c65:: with SMTP id r5mr38598502wrz.26.1634119814108; 
 Wed, 13 Oct 2021 03:10:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdzEUsRMSd5Z6w3cXq4dmtWNY5MNbht2wMdWdZK2XnSLKoIDFYiOilvxVG3omeTmm8H874VQ==
X-Received: by 2002:a5d:6c65:: with SMTP id r5mr38598465wrz.26.1634119813789; 
 Wed, 13 Oct 2021 03:10:13 -0700 (PDT)
Received: from redhat.com ([2.55.30.112])
 by smtp.gmail.com with ESMTPSA id p25sm4782688wma.2.2021.10.13.03.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 03:10:13 -0700 (PDT)
Date: Wed, 13 Oct 2021 06:10:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] virtio: write back F_VERSION_1 before validate
Message-ID: <20211013060923-mutt-send-email-mst@kernel.org>
References: <20211011053921.1198936-1-pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211011053921.1198936-1-pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Xie Yongji <xieyongji@bytedance.com>, stefanha@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 07:39:21AM +0200, Halil Pasic wrote:
> The virtio specification virtio-v1.1-cs01 states: "Transitional devices
> MUST detect Legacy drivers by detecting that VIRTIO_F_VERSION_1 has not
> been acknowledged by the driver."  This is exactly what QEMU as of 6.1
> has done relying solely on VIRTIO_F_VERSION_1 for detecting that.
> 
> However, the specification also says: "... the driver MAY read (but MUST
> NOT write) the device-specific configuration fields to check that it can
> support the device ..." before setting FEATURES_OK.
> 
> In that case, any transitional device relying solely on
> VIRTIO_F_VERSION_1 for detecting legacy drivers will return data in
> legacy format.  In particular, this implies that it is in big endian
> format for big endian guests. This naturally confuses the driver which
> expects little endian in the modern mode.
> 
> It is probably a good idea to amend the spec to clarify that
> VIRTIO_F_VERSION_1 can only be relied on after the feature negotiation
> is complete. Before validate callback existed, config space was only
> read after FEATURES_OK. However, we already have two regressions, so
> let's address this here as well.
> 
> The regressions affect the VIRTIO_NET_F_MTU feature of virtio-net and
> the VIRTIO_BLK_F_BLK_SIZE feature of virtio-blk for BE guests when
> virtio 1.0 is used on both sides. The latter renders virtio-blk unusable
> with DASD backing, because things simply don't work with the default.
> See Fixes tags for relevant commits.
> 
> For QEMU, we can work around the issue by writing out the feature bits
> with VIRTIO_F_VERSION_1 bit set.  We (ab)use the finalize_features
> config op for this. This isn't enough to address all vhost devices since
> these do not get the features until FEATURES_OK, however it looks like
> the affected devices actually never handled the endianness for legacy
> mode correctly, so at least that's not a regression.
> 
> No devices except virtio net and virtio blk seem to be affected.
> 
> Long term the right thing to do is to fix the hypervisors.
> 
> Cc: <stable@vger.kernel.org> #v4.11
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Fixes: 82e89ea077b9 ("virtio-blk: Add validation for block size in config space")
> Fixes: fe36cbe0671e ("virtio_net: clear MTU when out of range")
> Reported-by: markver@us.ibm.com
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>

OK this looks good! How about a QEMU patch to make it spec compliant on
BE?

> ---
> 
> @Connie: I made some more commit message changes to accommodate Michael's
> requests. I just assumed these will work or you as well and kept your
> r-b. Please shout at me if it needs to be dropped :)
> ---
>  drivers/virtio/virtio.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index 0a5b54034d4b..236081afe9a2 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -239,6 +239,17 @@ static int virtio_dev_probe(struct device *_d)
>  		driver_features_legacy = driver_features;
>  	}
>  
> +	/*
> +	 * Some devices detect legacy solely via F_VERSION_1. Write
> +	 * F_VERSION_1 to force LE config space accesses before FEATURES_OK for
> +	 * these when needed.
> +	 */
> +	if (drv->validate && !virtio_legacy_is_little_endian()
> +			  && device_features & BIT_ULL(VIRTIO_F_VERSION_1)) {
> +		dev->features = BIT_ULL(VIRTIO_F_VERSION_1);
> +		dev->config->finalize_features(dev);
> +	}
> +
>  	if (device_features & (1ULL << VIRTIO_F_VERSION_1))
>  		dev->features = driver_features & device_features;
>  	else
> 
> base-commit: 60a9483534ed0d99090a2ee1d4bb0b8179195f51
> -- 
> 2.25.1


