Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451444CFA78
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:20:51 +0100 (CET)
Received: from localhost ([::1]:38822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRATy-0006Ja-8u
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:20:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABv-0000VD-6v
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABq-0002hg-9A
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2MmbtRN8dUw8oStDJevhrQCWdjKFEsw6VGH8lAmLmm4=;
 b=BZl/6xBYchDhLOR+YnNHRCANXuHORimRqj1iTtjhc9iYMksctI35JzSqlrmuOUD+FRVxwu
 mO90f0TwonOau9fjqF58VSQ9RCFOIE4SRdQ9eq2ltojAXBaNvX5ybxT0CKrYcTlSxy0kB+
 Xk70hS0GL7sjAahhdzxn6/sGA5m0iNA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-kKQxzg9jN86FYeMZZLLaHw-1; Mon, 07 Mar 2022 05:02:04 -0500
X-MC-Unique: kKQxzg9jN86FYeMZZLLaHw-1
Received: by mail-ed1-f69.google.com with SMTP id
 bq19-20020a056402215300b0040f276105a4so8331401edb.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2MmbtRN8dUw8oStDJevhrQCWdjKFEsw6VGH8lAmLmm4=;
 b=UPB/SHfS8NSnv3vkmJ5NobtKgOrSSHY2CY9MKDLxV6Y6cxCCKz305VxWx0AvwfQ65X
 O1fpjs8xXYWTJSs5G3ubFWTuUsAqS2gqQRcJjQ0D0LupoBP7aF+KnKyz4qScg8YHaGyC
 lO8V74SzjZdAYNx+A5mejHXi+KztaDU16UhCrFVU4eyLF6YUrozA0ULWfRk09HB8Lu5B
 t+IbSjE1wXDgQKSgIsHC5aILUPE1SG4bY9PoFXcv+8hrVlwp1qeN4tMB3kgCvRwZl3C/
 vlEzfeph28rltZdzj591EQsuk0+0VDYKJvSYsZuYIbjrRRtjoMBQvT2PMvQA1I/PsrXz
 wI6w==
X-Gm-Message-State: AOAM531RqvWTeoi+C/7SsFTLTtjVu/bzHi2Equo49dKM3vSsBh3fOUgu
 GjTE67o1N8ZxtRafuMFuF1Z7H6vwmtzf7SBq9JF79aDy9eAEzhWqwjT6S39vbbkSU2lg3UGruas
 g8FzQKeU91cfkBoq71y5uEJ2CMJnQ84Gq8WhXABKDKTK6xKtQuC5Q0EY2++lz
X-Received: by 2002:a17:907:3ea5:b0:6da:6ef4:b058 with SMTP id
 hs37-20020a1709073ea500b006da6ef4b058mr8781934ejc.124.1646647322776; 
 Mon, 07 Mar 2022 02:02:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1hAcJCcE4CFbWfxuTvMaT2t+peAlxG4mTvK3jFRo5SmHartrsqhkFUhdFrreq8OuN1vCOtg==
X-Received: by 2002:a17:907:3ea5:b0:6da:6ef4:b058 with SMTP id
 hs37-20020a1709073ea500b006da6ef4b058mr8781908ejc.124.1646647322548; 
 Mon, 07 Mar 2022 02:02:02 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 v2-20020a509d02000000b00412d53177a6sm5999457ede.20.2022.03.07.02.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:02:02 -0800 (PST)
Date: Mon, 7 Mar 2022 05:02:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 13/47] hw/virtio: vdpa: Fix leak of host-notifier
 memory-region
Message-ID: <20220307100058.449628-14-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, jasowang@redhat.com,
 qemu-stable@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

If call virtio_queue_set_host_notifier_mr fails, should free
host-notifier memory-region.

This problem can trigger a coredump with some vDPA drivers (mlx5,
but not with the vdpasim), if we unplug the virtio-net card from
the guest after a stop/start.

The same fix has been done for vhost-user:
  1f89d3b91e3e ("hw/virtio: Fix leak of host-notifier memory-region")

Fixes: d0416d487bd5 ("vhost-vdpa: map virtqueue notification area if possible")
Cc: jasowang@redhat.com
Resolves: https://bugzilla.redhat.com/2027208
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20220211170259.1388734-1-lvivier@redhat.com>
Cc: qemu-stable@nongnu.org
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 04ea43704f..11f696468d 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -431,6 +431,7 @@ static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
     g_free(name);
 
     if (virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, true)) {
+        object_unparent(OBJECT(&n->mr));
         munmap(addr, page_size);
         goto err;
     }
-- 
MST


