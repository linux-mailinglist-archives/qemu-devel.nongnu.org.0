Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618D8450A2C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:52:51 +0100 (CET)
Received: from localhost ([::1]:44988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmfDu-0003Jh-H3
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:52:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0F-00033V-Mx
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0D-0005Fj-S0
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=40DjtVawOkvSfGu4Q5CJerXc3MdyuapDarfgCyKOILc=;
 b=TJaivcPyrbVQQvHcpShvz+4tnzGJQn/g7LFBoYcqnAMkm1gU524QwaVjYErLz/2YVrWq/f
 dBXNaZQI68c4EOE0ObiEmgmkrDlMBFoqPjhXwu9HM2QbV4kjHyYV0ITMz/E7MXs2i4wEf0
 3RdkPi9tjkuYXpo4o32CZIxz8pOfJQo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-KprIiqXuOXSu-ne5H3obug-1; Mon, 15 Nov 2021 11:38:39 -0500
X-MC-Unique: KprIiqXuOXSu-ne5H3obug-1
Received: by mail-ed1-f71.google.com with SMTP id
 w13-20020a05640234cd00b003e2fde5ff8aso14469725edc.14
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=40DjtVawOkvSfGu4Q5CJerXc3MdyuapDarfgCyKOILc=;
 b=0z5UUO1lMFszCvJl+wj7Bux8j6IDfPsQgxGX3Xaa5X26689yPBc//137A5EBwWy+s9
 45yEDBagmpBv93A6W1VRX3ZGwQP5ndrhpe5AbHJZiJTVdpNTuWKKEzbwio/tUIOFMgff
 DEpzue/uMgdbjqifJ47efGt+Vgq3MQwJ0zh7x8jWmUurTy2yFKYI1jvABjdxeN7KIeXH
 SBrDI9naUQzbHUJRRjcdBAoIzVeE//TlpKI/zUVri6cXzptYUV+mEn3A16zGP7dHJP8X
 nMXrsJMxHEvMue3wLPWxf9Hemh1PKsuPFDouyw7ciVpaqE9+mhjNasD2H11+bujOshNj
 qqTw==
X-Gm-Message-State: AOAM531c8S1ZpNV/j4b4mCWdpALhMtQsAU+xw41kouHgOoR/ip46NtVH
 qv1gWl/WzkbuZp0WC/kDBlr+vF5YRFctcJIm5fwRiALi5Em6hVDEN4vMK+QkbsIIClSZFCQ9Q9F
 AfcLlXd8sh8Tceje94Rk/RpjgdMQnNESQoKuHLRt8h/U7AG8dJZ9yFz32DZ4x
X-Received: by 2002:a05:6402:2155:: with SMTP id
 bq21mr56414514edb.181.1636994317967; 
 Mon, 15 Nov 2021 08:38:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5M+QVzE1CSmxBOJ6M7xiOp7SeBwT4kunxC7zwG0nttNwIvbI2YyJdUN2negWqQ/vZFruLCA==
X-Received: by 2002:a05:6402:2155:: with SMTP id
 bq21mr56414462edb.181.1636994317688; 
 Mon, 15 Nov 2021 08:38:37 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id dp16sm7220349ejc.34.2021.11.15.08.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:38:37 -0800 (PST)
Date: Mon, 15 Nov 2021 11:38:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/20] virtio: use virtio accessor to access packed event
Message-ID: <20211115163607.177432-13-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

We used to access packed descriptor event and off_wrap via
address_space_{write|read}_cached(). When we hit the cache, memcpy()
is used which is not atomic which may lead a wrong value to be read or
wrote.

This patch fixes this by switching to use
virito_{stw|lduw}_phys_cached() to make sure the access is atomic.

Fixes: 683f7665679c1 ("virtio: event suppression support for packed ring")
Cc: qemu-stable@nongnu.org
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211111063854.29060-2-jasowang@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 939bcbfeb9..ea7c079fb0 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -247,13 +247,10 @@ static void vring_packed_event_read(VirtIODevice *vdev,
     hwaddr off_off = offsetof(VRingPackedDescEvent, off_wrap);
     hwaddr off_flags = offsetof(VRingPackedDescEvent, flags);
 
-    address_space_read_cached(cache, off_flags, &e->flags,
-                              sizeof(e->flags));
+    e->flags = virtio_lduw_phys_cached(vdev, cache, off_flags);
     /* Make sure flags is seen before off_wrap */
     smp_rmb();
-    address_space_read_cached(cache, off_off, &e->off_wrap,
-                              sizeof(e->off_wrap));
-    virtio_tswap16s(vdev, &e->off_wrap);
+    e->off_wrap = virtio_lduw_phys_cached(vdev, cache, off_off);
     virtio_tswap16s(vdev, &e->flags);
 }
 
@@ -263,8 +260,7 @@ static void vring_packed_off_wrap_write(VirtIODevice *vdev,
 {
     hwaddr off = offsetof(VRingPackedDescEvent, off_wrap);
 
-    virtio_tswap16s(vdev, &off_wrap);
-    address_space_write_cached(cache, off, &off_wrap, sizeof(off_wrap));
+    virtio_stw_phys_cached(vdev, cache, off, off_wrap);
     address_space_cache_invalidate(cache, off, sizeof(off_wrap));
 }
 
@@ -273,8 +269,7 @@ static void vring_packed_flags_write(VirtIODevice *vdev,
 {
     hwaddr off = offsetof(VRingPackedDescEvent, flags);
 
-    virtio_tswap16s(vdev, &flags);
-    address_space_write_cached(cache, off, &flags, sizeof(flags));
+    virtio_stw_phys_cached(vdev, cache, off, flags);
     address_space_cache_invalidate(cache, off, sizeof(flags));
 }
 
-- 
MST


