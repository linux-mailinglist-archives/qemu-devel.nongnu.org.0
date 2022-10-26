Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8986F60EA3F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:27:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmzl-00010T-Tr; Wed, 26 Oct 2022 16:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmzj-0000pd-Ls
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:27:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmzi-00053h-1i
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666816039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ts+yjIC1VUzg29noO5HV9RQNiDdpwExkHItW8XbEaxo=;
 b=dFzBIcNK0SzW2XX4V7RNh5SYl5BxykA3Ni7U+rjoBNGFFk+5pA9wzL+izD+Ydnym5vcWSG
 ScjKhzzBq3PA1ij75v01Ol4slvwYZ5R/qxPH/CjrQAQJ4JuPlDLIOMn4JBZbbJNKh+vQq2
 eMayTqysRO5YRDBhE7GcnFnRz6iTo5Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-7rz3zAWQPLid-c5NWNiWog-1; Wed, 26 Oct 2022 16:27:18 -0400
X-MC-Unique: 7rz3zAWQPLid-c5NWNiWog-1
Received: by mail-wm1-f70.google.com with SMTP id
 i83-20020a1c3b56000000b003cf4ff1b917so160635wma.2
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ts+yjIC1VUzg29noO5HV9RQNiDdpwExkHItW8XbEaxo=;
 b=NJI9KrmuyJusAZ/TNVrUEx0Quvg9nQbEDFmSAi0X/8HQA4jPDsixYjhH9eoaJ7qoP/
 j9uYR54OUiXqrv2vZ3/EGeLMC34ukL1pB0giGbZVjlort4vfTz/+SpCrgyBStLRhOZOO
 nduqeZeoug1GewLCoUUpBo+YH6Q86gP3TsjtPur/xcQpzcPK/K6gEHxm+7zaisCjwnVS
 gt+dBRHt0SAxbLqPSoeDOItOqfGl3RvtO4D3gSdAzaIKg1Cxy4yggxOwCH0T6WXWgsnZ
 eF5Hbw33l/r+FvWgeBpBYF5LUoIRoRWXsL20ST3kcOCcBUbjaMLs953Zo6+jTzIq/Qyy
 alXg==
X-Gm-Message-State: ACrzQf2qxpQKO2y1yvlxBqfBrM/kmTF9MKi2B/FxhNJCbu0hc9qEBZDR
 vlbxI9cH6D4FwMDWETf9LAfIs7Soj1upqIpfbhZu4CMkB5Jt2Gzn9Qdof+cJSyMIpJG9ZeCPEjB
 AvWq3CcWx7eRaeNM=
X-Received: by 2002:a5d:4b04:0:b0:235:f22b:6621 with SMTP id
 v4-20020a5d4b04000000b00235f22b6621mr22961970wrq.462.1666816037360; 
 Wed, 26 Oct 2022 13:27:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM63h+FOvNFLycXwMn9kI/GETfPtSt7rgzOhuxmHjhndYyR8cOu2ueC+Q8swzK8JLB0tuBJqCA==
X-Received: by 2002:a5d:4b04:0:b0:235:f22b:6621 with SMTP id
 v4-20020a5d4b04000000b00235f22b6621mr22961958wrq.462.1666816037073; 
 Wed, 26 Oct 2022 13:27:17 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 c8-20020a05600c0ac800b003b4935f04a4sm3322091wmr.5.2022.10.26.13.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:26:44 -0700 (PDT)
Date: Wed, 26 Oct 2022 16:26:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [RFC PATCH] virtio: re-order vm_running and use_started checks
Message-ID: <20221026162520-mutt-send-email-mst@kernel.org>
References: <20221014132108.2559156-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221014132108.2559156-1-alex.bennee@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 14, 2022 at 02:21:08PM +0100, Alex Bennée wrote:
> During migration the virtio device state can be restored before we
> restart the VM. As no devices can be running while the VM is paused it
> makes sense to bail out early in that case.
> 
> This returns the order introduced in:
> 
>  9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> 
> to what virtio-sock was doing longhand.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>

Queued but Alex, generally pls post non-RFC if you expect patch
to me merged.

> ---
>  include/hw/virtio/virtio.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index f41b4a7e64..ebb58feaac 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -385,14 +385,14 @@ static inline bool virtio_is_big_endian(VirtIODevice *vdev)
>  
>  static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
>  {
> -    if (vdev->use_started) {
> -        return vdev->started;
> -    }
> -
>      if (!vdev->vm_running) {
>          return false;
>      }
>  
> +    if (vdev->use_started) {
> +        return vdev->started;
> +    }
> +
>      return status & VIRTIO_CONFIG_S_DRIVER_OK;
>  }
>  
> -- 
> 2.34.1


