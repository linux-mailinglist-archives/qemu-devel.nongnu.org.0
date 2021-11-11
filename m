Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923C944DAE2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 17:59:47 +0100 (CET)
Received: from localhost ([::1]:39984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlDQQ-0003f2-D3
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 11:59:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mlDPO-0002iN-Qp
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 11:58:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mlDPL-0000fS-QZ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 11:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636649918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vHeaTJeY6N4ao/XntS0lMfOBBlCBg8/dgl6+/Wn8GFU=;
 b=K7PfkRGclMmuf5mCTreROpVeA/kb6p7K6hFkE6FPQn1CBgm1ieY41WUB8sv6e4ZFqIidGU
 4Sd+DSjXGFuPPtR/cQcryxcluF+TaMoaqx8AC4tiVDsOJ7khsEkpnM+upWwzI0vbOaIpRe
 vtjJZrRHDcYQg/NDY2nuM1YENvemV/0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-TYtn7g_bNp-a8kiYIMbTow-1; Thu, 11 Nov 2021 11:58:37 -0500
X-MC-Unique: TYtn7g_bNp-a8kiYIMbTow-1
Received: by mail-ed1-f72.google.com with SMTP id
 r25-20020a05640216d900b003dca3501ab4so5897818edx.15
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 08:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vHeaTJeY6N4ao/XntS0lMfOBBlCBg8/dgl6+/Wn8GFU=;
 b=hpZebFp79DWybnMJ5vWh40IfF0/n+BWvT+bK54cR/dl0BW2v6WYCLPQJy1VFBn/kan
 sv96UqpGBMTAtxNQsZOxXWbCod83786K0d3JF41N/ybU8hFKSY8LABgk433/oWmLn0MB
 ciwrX09ztalzjU0sg7PBBH+DVgjart6ZhK4rcrf6xfYJtkzl2MWQ4bslZIK5sEDMP+d9
 FQ+LkYssVTZ+l0/igyC5++68OLWGUryV54Vr+sbUNviV8ZkWAGpj1Qt41/u2pl5n6N6J
 RI4Ujkb9hEf9yoik7VBUt9hNrrWyeq4zts97ASaSnxUBRWlbyj2r7srdNCCCKB+Ow7Rq
 VXWA==
X-Gm-Message-State: AOAM531vv1BzSTio9Oa7aXBSx9ZDD3GDa3Yjc1A1Z3wpGluEYIlaCZI1
 sj6fewr5belKve/qxclKxNXqwrT2wdS8glidlKhKS3ZKqVAPPgQrY0nsmS85Zq0mCSvu3AZMH8F
 xhk7/tBD+sVU+tHs=
X-Received: by 2002:a17:907:9612:: with SMTP id
 gb18mr11159851ejc.205.1636649916093; 
 Thu, 11 Nov 2021 08:58:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxml2OcYYyTyP/tzUfOekQF+AGK1i6Xv9/X4IiCpdZpmQxKy9+i1JYMJOYRwjxWH4u8M40TzA==
X-Received: by 2002:a17:907:9612:: with SMTP id
 gb18mr11159822ejc.205.1636649915954; 
 Thu, 11 Nov 2021 08:58:35 -0800 (PST)
Received: from redhat.com ([2.55.135.246])
 by smtp.gmail.com with ESMTPSA id r26sm1659037ejd.85.2021.11.11.08.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 08:58:35 -0800 (PST)
Date: Thu, 11 Nov 2021 11:58:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/5] virtio-gpu: do not byteswap padding
Message-ID: <20211111115813-mutt-send-email-mst@kernel.org>
References: <20211111110604.207376-1-pbonzini@redhat.com>
 <20211111110604.207376-2-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211111110604.207376-2-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cohuck@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 12:06:00PM +0100, Paolo Bonzini wrote:
> In Linux 5.16, the padding of struct virtio_gpu_ctrl_hdr has become a
> single-byte field followed by a uint8_t[3] array of padding bytes,
> and virtio_gpu_ctrl_hdr_bswap does not compile anymore.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

No idea why we bothered swapping it anyway.
> ---
>  include/hw/virtio/virtio-gpu-bswap.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/hw/virtio/virtio-gpu-bswap.h b/include/hw/virtio/virtio-gpu-bswap.h
> index e2bee8f595..5faac0d8d5 100644
> --- a/include/hw/virtio/virtio-gpu-bswap.h
> +++ b/include/hw/virtio/virtio-gpu-bswap.h
> @@ -24,7 +24,6 @@ virtio_gpu_ctrl_hdr_bswap(struct virtio_gpu_ctrl_hdr *hdr)
>      le32_to_cpus(&hdr->flags);
>      le64_to_cpus(&hdr->fence_id);
>      le32_to_cpus(&hdr->ctx_id);
> -    le32_to_cpus(&hdr->padding);
>  }
>  
>  static inline void
> -- 
> 2.33.1
> 


