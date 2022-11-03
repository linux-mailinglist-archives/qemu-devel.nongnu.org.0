Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D1C618480
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:32:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqd7s-0001MV-J6; Thu, 03 Nov 2022 12:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqd7l-0001Eq-3v
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:31:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqd7j-0002Bx-H7
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667493082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpKJaCiHOUhfpWsLlKGlVek6Mfaeeg5hzjIKFLCZIJY=;
 b=iX8LAX7H0FIxALlbBi10hzdNwghpSlrxZUwuciD4ledAoRprzXIEB2F+IFPUbU1dyQ5wz/
 z59Z9LdLMAALJomBAvW6sA7n9e31T4dd/zj7BHeU52SwX2jp9MP1Y6HdMAr+LwM7fylXsT
 8zrdH7DAXH3zNtV4dseg2/ApPG8vd7w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-AQ0cMyI1MlmZLy8giF_jTw-1; Thu, 03 Nov 2022 12:31:20 -0400
X-MC-Unique: AQ0cMyI1MlmZLy8giF_jTw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i128-20020a1c3b86000000b003cf4ff1b917so1089332wma.2
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 09:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bpKJaCiHOUhfpWsLlKGlVek6Mfaeeg5hzjIKFLCZIJY=;
 b=MjrG4m2NL8/fP6rpnepLsUjt4f8CuNVqJXtNZt9r35apWp0HsE+Ni76Y/Rp4rr4T3v
 eAx/zELaEKNFXSzZcLCSzdsZ0SYKc5sPhv5jSI2iD2m+l7WjVO+XcmY2EE0f/19vkQqN
 bChxofdAtO2TPJ+EPEee24fhN3TlrTHkXRdGa3nRGu10kLMk5pkaNGVR6cRQgqb6xD0Z
 qOilmKeIm/vSHWAVNk/y4p6O1hrGmMj3Qsak0OjD4sztjVcd99//GI14TwR9ztRp7XMh
 h3OPllNdJnlNPB4w5kpUrZumRdXvDEFlPQxMyhr2ILsmr/6JuIyQZSyMJmAA7e6LZ3mL
 pYkg==
X-Gm-Message-State: ACrzQf3MBB8d/q7D8csYhHqGwEpwnZBVZaKSR9sAJ6RWvMD/0eF10+vS
 YVX1aKAxpGWCpgxKat+ivvlyWX0HN/7eCKjhfCmhw658th33cK3k3W8Nvj0VVFZj7dcwlHlqVUQ
 Kx31V0eTAJW25WYA=
X-Received: by 2002:a5d:420f:0:b0:238:3d2a:cd24 with SMTP id
 n15-20020a5d420f000000b002383d2acd24mr3364528wrq.469.1667493079681; 
 Thu, 03 Nov 2022 09:31:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4lKQw6X+Cg9iCPd/p1PhH6dX46YfjrPqnJzclZ87aEVnNMTccya/id/VFqG9sNsPUD1VXMuA==
X-Received: by 2002:a5d:420f:0:b0:238:3d2a:cd24 with SMTP id
 n15-20020a5d420f000000b002383d2acd24mr3364514wrq.469.1667493079405; 
 Thu, 03 Nov 2022 09:31:19 -0700 (PDT)
Received: from redhat.com ([2.55.15.188]) by smtp.gmail.com with ESMTPSA id
 iv9-20020a05600c548900b003cf87623c16sm490732wmb.4.2022.11.03.09.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 09:31:18 -0700 (PDT)
Date: Thu, 3 Nov 2022 12:31:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [RFC PATCH] virtio: re-order vm_running and use_started checks
Message-ID: <20221103122827-mutt-send-email-mst@kernel.org>
References: <20221014132108.2559156-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221014132108.2559156-1-alex.bennee@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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

Still checking but this seems to cause make check to fail on Fedora 36 under ubsan.

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


