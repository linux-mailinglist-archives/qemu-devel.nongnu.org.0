Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F6138D9F4
	for <lists+qemu-devel@lfdr.de>; Sun, 23 May 2021 10:09:30 +0200 (CEST)
Received: from localhost ([::1]:56918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkjAv-0008Sd-OW
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 04:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lkj90-0007a5-CD
 for qemu-devel@nongnu.org; Sun, 23 May 2021 04:07:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lkj8y-0002uy-UP
 for qemu-devel@nongnu.org; Sun, 23 May 2021 04:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621757248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DgcIc2kECGdwbaU8V5teS+alm1M6ChIRT72T0ktMb84=;
 b=WfaZGapd/isrliFe38l9O+nRQe1ftl5hu5eLUDr+cr73Ibgkhf1pM8S0vs2WlLOpsexydQ
 JE4LLrzCIaWzlg1rmj95m766iXx3u52wYZxoOzApSTUtIitWVHvrW+Jia0dtkT4DA+guwV
 brBusrBHj+lifDEkz/JLOXCbowm0+TU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-YOFo2p4eNmq7CN5MH3giEQ-1; Sun, 23 May 2021 04:07:26 -0400
X-MC-Unique: YOFo2p4eNmq7CN5MH3giEQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso7776308wrf.4
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 01:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DgcIc2kECGdwbaU8V5teS+alm1M6ChIRT72T0ktMb84=;
 b=iiv+BJuwalOfGjylHpReXIGhiEv5jXKTRD0W/yIDE2dFNc/K4haWSJnlL89mfHw1Lj
 JaFyyyPlvI03YPugsGFqwlW8bbBXaQsSjh6Mv65ypVNl5qvj4WzrBEgFQVANj2Kn1idX
 itje2ZZBAWG4cAWT9X721Vl/osOkIfKZL346aVQVKRt12vwkTJJZymQZ1eppd5uBdquf
 kPtXqoi9sRrFxqovKQA7xJR49tJjIZ7LRaViH19RrwENoshL3296UFKKlCpZlF75pFNW
 DYwlu+oXO0xZqX4YtU+G3ldOcslw2KQd/0x4TWTjLzSyAyQ9OHIY1a36FUXhZisxyhSQ
 7aGQ==
X-Gm-Message-State: AOAM532gyPMbq63ElDBXVGRoqMxJEup81cHF8FjOPI6zCX0Mz9NBDhzf
 HuOc+FEKD3szkfhyccTo9QkGP6GFyW4/+etzs0gTfdmFgQb5pbp/yQgzPCBYnyvdCma2PIt9aHs
 CHFoJvzTnRxIN6OE=
X-Received: by 2002:a5d:4003:: with SMTP id n3mr16854553wrp.173.1621757245750; 
 Sun, 23 May 2021 01:07:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsYdqaZNpwPhuyR+AKrUxGkUY1wpH2Mh727AgSUXjoXPEkTLPfdwekr0inH4inATecAd5DJQ==
X-Received: by 2002:a5d:4003:: with SMTP id n3mr16854543wrp.173.1621757245622; 
 Sun, 23 May 2021 01:07:25 -0700 (PDT)
Received: from redhat.com ([2a10:8006:fcda:0:90d:c7e7:9e26:b297])
 by smtp.gmail.com with ESMTPSA id z18sm8010232wro.33.2021.05.23.01.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 01:07:25 -0700 (PDT)
Date: Sun, 23 May 2021 04:07:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/virtio: Have virtio_bus_get_vdev_bad_features()
 return 64-bit value
Message-ID: <20210523040632-mutt-send-email-mst@kernel.org>
References: <20210520102822.2471710-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210520102822.2471710-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Frederic Konrad <konrad@adacore.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 20, 2021 at 12:28:22PM +0200, Philippe Mathieu-Daudé wrote:
> In commit 019a3edbb25 ("virtio: make features 64bit wide") we
> increased the 'features' field to 64-bit, but forgot to update
> the virtio_bus_get_vdev_bad_features() helper. The 'bad features'
> are truncated to 32-bit. The virtio_net_bad_features() handler
> from the virtio-net devices is potentially affected.

I'm fine with increasing it for consistency, but bad features
are all legacy things aren't they? So there isn't a functional
issue ... or did I miss anything?

> 
> Have the virtio_bus_get_vdev_bad_features() helper return the
> full 64-bit value.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 019a3edbb25 ("virtio: make features 64bit wide")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/virtio/virtio-bus.h | 2 +-
>  hw/virtio/virtio-bus.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
> index ef8abe49c5a..f9955ff577a 100644
> --- a/include/hw/virtio/virtio-bus.h
> +++ b/include/hw/virtio/virtio-bus.h
> @@ -122,7 +122,7 @@ uint16_t virtio_bus_get_vdev_id(VirtioBusState *bus);
>  /* Get the config_len field of the plugged device. */
>  size_t virtio_bus_get_vdev_config_len(VirtioBusState *bus);
>  /* Get bad features of the plugged device. */
> -uint32_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus);
> +uint64_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus);
>  /* Get config of the plugged device. */
>  void virtio_bus_get_vdev_config(VirtioBusState *bus, uint8_t *config);
>  /* Set config of the plugged device. */
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index 859978d2487..25a2b68a234 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -134,7 +134,7 @@ size_t virtio_bus_get_vdev_config_len(VirtioBusState *bus)
>  }
>  
>  /* Get bad features of the plugged device. */
> -uint32_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus)
> +uint64_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus)
>  {
>      VirtIODevice *vdev = virtio_bus_get_device(bus);
>      VirtioDeviceClass *k;
> -- 
> 2.26.3


