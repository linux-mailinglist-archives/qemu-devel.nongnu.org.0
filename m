Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9193D322916
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 11:54:58 +0100 (CET)
Received: from localhost ([::1]:46924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVLF-00062M-Jh
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 05:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lEVKF-0005YY-7E
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:53:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lEVKD-0006U7-Nt
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614077632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wuM+V7JisvLFnSPVGOWgvhuCv62ELUPyhvjtExOXSwg=;
 b=D2FiCltOTuFJMZT/omMCXddJ1Cb9L0nLl2x8otDatAV6SZlzmqO/vwGLjbAmPb9dX1u436
 LWaKDboxezxLnXwM8OB1Z2Uy2TMn/l+2YYy/vprOflBHY0fps51IAsgoSiQyUjv6oE61GJ
 H6G0svyWeFPATzCR3H2WcM+0zLUnZ1g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-KWsKGtpiPQOcIxH-NcIL5w-1; Tue, 23 Feb 2021 05:53:50 -0500
X-MC-Unique: KWsKGtpiPQOcIxH-NcIL5w-1
Received: by mail-wm1-f71.google.com with SMTP id w20so111874wmc.0
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 02:53:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wuM+V7JisvLFnSPVGOWgvhuCv62ELUPyhvjtExOXSwg=;
 b=B2n43qR+3+DFG+A27vxk7LCVg81hLVV96Hv5N0My2JcM2REenm6rVA2TMLNBd431bT
 kLHrLnBEE3WHKsT1SSQvb+hs+XpsSkaqYbGs5DbI+2vFFhjCdSV6CgbWi39+ndCaPVjc
 BmouI2c2iD/zKyP90/sPGyhegnw/iGU2D7t2NZUqt1Lw0V5gaksfTUpDKNV8HVC3d3dn
 Vzvbs/dZUu+qLY1lBTxHcXzFm42rE6SoqmY+8r9oBrukPiWIGtCUDCdP3dWUh67riQZz
 gi6ptix/WWDMYEPzx3fKS3ryYUBStEZwxWtZpq6gP2l6G1afVu6jSvMJxWUXW08mHZTR
 TpCA==
X-Gm-Message-State: AOAM530BHX1ZFt1JqyuNNCR4GW66vD4M1dygqRo6HyYG2mVo3qniNjdS
 Kt9l3l36iWclyJWigDYu6w1qbEebEjqEclXFba/NRDK/IwySCnAtafBPkBjQ1FQamOxPvR1rmwU
 QcAMKfFXurKVZENQ=
X-Received: by 2002:a5d:540d:: with SMTP id g13mr25912712wrv.143.1614077629546; 
 Tue, 23 Feb 2021 02:53:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJ4c5bMqZL8NUWLaMsaah+9Bf3fv8Qcefia75ueKg9euwPOf4ZHsVL9iWyllzdubrOYmhEag==
X-Received: by 2002:a5d:540d:: with SMTP id g13mr25912702wrv.143.1614077629369; 
 Tue, 23 Feb 2021 02:53:49 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id g1sm2491811wmh.9.2021.02.23.02.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 02:53:49 -0800 (PST)
Date: Tue, 23 Feb 2021 11:53:46 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] vhost: simplify vhost_dev_init() fail_busyloop label
Message-ID: <20210223105346.ii4ex7no5fd434zi@steredhat>
References: <20210222114931.272308-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210222114931.272308-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 11:49:31AM +0000, Stefan Hajnoczi wrote:
>Requiring a conditional for every goto is tedious:
>
>  if (busyloop_timeout) {
>      goto fail_busyloop;
>  } else {
>      goto fail;
>  }
>
>Move the conditional to into the fail_busyloop label so that it's safe
>to jump to this label unconditionally.
>
>This change makes the migrate_add_blocker() error case more consistent.
>It jumped to fail_busyloop unconditionally whereas the memslots limits
>error case was conditional.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> hw/virtio/vhost.c | 12 +++++-------
> 1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>index 6e17d631f7..2a01662b08 100644
>--- a/hw/virtio/vhost.c
>+++ b/hw/virtio/vhost.c
>@@ -1388,18 +1388,16 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
>         error_report("vhost backend memory slots limit is less"
>                 " than current number of present memory slots");
>         r = -1;
>-        if (busyloop_timeout) {
>-            goto fail_busyloop;
>-        } else {
>-            goto fail;
>-        }
>+        goto fail_busyloop;
>     }
>
>     return 0;
>
> fail_busyloop:
>-    while (--i >= 0) {
>-        vhost_virtqueue_set_busyloop_timeout(hdev, hdev->vq_index + i, 0);
>+    if (busyloop_timeout) {
>+        while (--i >= 0) {
>+            vhost_virtqueue_set_busyloop_timeout(hdev, hdev->vq_index + i, 0);
>+        }
>     }
> fail:
>     hdev->nvqs = n_initialized_vqs;
>-- 
>2.29.2
>


