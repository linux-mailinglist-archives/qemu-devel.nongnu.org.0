Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59648612131
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 09:57:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oogii-0001lj-0h; Sat, 29 Oct 2022 03:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oogie-0001kc-NU
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 03:57:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oogic-0006r4-3r
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 03:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667030245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xGPqmTauyiE+lSpGjS2RMpJlj4S++hlS/RK+BCH4YKA=;
 b=OXNxfx7TtorFmByMWYRp5wzjMA6CYza1P0/b5xp1jarQk5S07C3y75uzKm0ZWeEZF1ikZF
 Yh0hISUC1EZUcFBzdtTkXAlzpzRBC7sviCYF8WjsZgbNqOBUhru00OPfEZJJTtJ4vpcWf5
 xxVkgZv+ew2V23QGUelmQTHnjGYNK6Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-Ek4Z3kFbMaeKTSyck2NizA-1; Sat, 29 Oct 2022 03:57:23 -0400
X-MC-Unique: Ek4Z3kFbMaeKTSyck2NizA-1
Received: by mail-wm1-f69.google.com with SMTP id
 h8-20020a1c2108000000b003cf550bfc8dso3444538wmh.2
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 00:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xGPqmTauyiE+lSpGjS2RMpJlj4S++hlS/RK+BCH4YKA=;
 b=d+Wjzb96e2IE+gcMK5rgHUAJE8AqeMAhRkvDAuqi8GK7PoDSpXdM2ZvTngvxHlfTCx
 +vCmbewulYhguJg/iOukHd9x4kkNyinw8Txh2N1oTY4NQqo+4SLWnyodsqOePq/yR9/m
 odBOBsGDbd+HifB3GT95URBbLYj98C8zPPG3Z1t7/9q1xqR+k7xsQst57VoA/LWfe9Mj
 HrdME6zx98xlrUph4WIwB4F5xFpXXoyaQQIzHtIAelh8XYAK6CYUhr9DnGUqG9UWxx0x
 Ft7BMfXJosCzuqEBdV4yCDS1jp8o5ydFiJDeeM+nVHfqqt/KWVLGiBk6QKSG71ulTUhC
 8LgA==
X-Gm-Message-State: ACrzQf32fW7ieBovZtS8dyOn+qBqQPWUpOm+VCGebQChVKQtg3jgVLD8
 HFrBI1RbTnAeldWAMNHV5mt/BHcss/y1iTzEV5wSJp6qe1oOyIFxsZIHub8mIP1ZDRdUdqoZX8d
 KS/3H19CKKSfBSmk=
X-Received: by 2002:a05:600c:4849:b0:3c6:7e82:a9d7 with SMTP id
 j9-20020a05600c484900b003c67e82a9d7mr1702027wmo.75.1667030242629; 
 Sat, 29 Oct 2022 00:57:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5sP1EaOFgMj/3d5BLSh3e7tI5jHD22FWdNTmZWJc4ZGIugPb0Eb4uPpolfOFT+u2PkkFEorA==
X-Received: by 2002:a05:600c:4849:b0:3c6:7e82:a9d7 with SMTP id
 j9-20020a05600c484900b003c67e82a9d7mr1702006wmo.75.1667030242375; 
 Sat, 29 Oct 2022 00:57:22 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 d17-20020a05600c4c1100b003cf37c5ddc0sm852665wmp.22.2022.10.29.00.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 00:57:21 -0700 (PDT)
Date: Sat, 29 Oct 2022 03:57:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org,
 sgarzare@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 0/2] vhost-vdpa: add support for vIOMMU
Message-ID: <20221029035659-mutt-send-email-mst@kernel.org>
References: <20221027074032.1101939-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027074032.1101939-1-lulu@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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

On Thu, Oct 27, 2022 at 03:40:30PM +0800, Cindy Lu wrote:
> These patches are to support vIOMMU in vdpa device
> 
> changes in V3
> 1. Move function vfio_get_xlat_addr to memory.c
> 2. Use the existing memory listener, while the MR is
> iommu MR then call the function iommu_region_add/
> iommu_region_del
> 
> changes in V4
> 1.make the comments in vfio_get_xlat_addr more general

I expect there will be v5 addressing Alex's comments.

> Cindy Lu (2):
>   vfio: move the function vfio_get_xlat_addr() to memory.c
>   vhost-vdpa: add support for vIOMMU
> 
>  hw/vfio/common.c               |  92 +----------------------
>  hw/virtio/vhost-vdpa.c         | 131 ++++++++++++++++++++++++++++++---
>  include/exec/memory.h          |   4 +
>  include/hw/virtio/vhost-vdpa.h |  10 +++
>  softmmu/memory.c               |  84 +++++++++++++++++++++
>  5 files changed, 222 insertions(+), 99 deletions(-)
> 
> -- 
> 2.34.3


