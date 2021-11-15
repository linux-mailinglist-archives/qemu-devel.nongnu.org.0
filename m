Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E03C450A14
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:50:24 +0100 (CET)
Received: from localhost ([::1]:40676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmfBX-0000KD-LN
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:50:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0B-0002m2-D9
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf09-0005F3-T1
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRD2/IioiIoVIn6009mdQAigxmvDmmRgeeMF/xF2ruo=;
 b=SoYJAl5drpY8PBdy5RoVteMEs+jxVufJUUHoGk+51cEB1nAf+wiLFyNotqxmfjEle61Y4F
 RH/QnQ4w1E8wnukHykcF4xnJqg2c2OCs9Yv0ui4TlRDN9UoEoubTJ4sZHaeuZ6zzNCIXVe
 /njrdAY+dadH1+UMX6WCEIULQcb4JZU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-F9bMm6UDMeWXcpKxF0hQfw-1; Mon, 15 Nov 2021 11:38:36 -0500
X-MC-Unique: F9bMm6UDMeWXcpKxF0hQfw-1
Received: by mail-ed1-f72.google.com with SMTP id
 b15-20020aa7c6cf000000b003e7cf0f73daso2199241eds.22
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jRD2/IioiIoVIn6009mdQAigxmvDmmRgeeMF/xF2ruo=;
 b=vB3Wua/9kIfoVvD/A8OMaQWollShc4fiiuMa9wfVkY80gtT7G3Y2cXSZSw0yrYehaM
 C+TdGzPGA2etTBXYWaQQpoXHOJ3qSdh44dhGjSGf5qemLDvrDdlh1TvSSISua+AD0dVq
 01udkYkNzTWq6vnEDFQ7CRq0oTHy2GCnBTTl+wdDKFV7KURIORE4iJpuWgpHDWJ8zpKC
 FHP+sWynU3oYgiT42ItpR+w25x6JNzPjV/ajd4ZEy93EDQNRrDi+DalgcnKLNO28486a
 3kwDHxIdrZlguX33mWiLD7TcvN8FcPLtVAuir4dmwMUq/8BjpQ2iRYgF52xr9TlS+wnl
 4wjA==
X-Gm-Message-State: AOAM532OIiF/AyjotywP72pJcBD2Qvi8WCCL+Z1H0PJQUBIzQmrha2II
 CAjEsUomHxIxHjbwsYr5nWI33h8aFm8U96W3IPEBjmAG5/b7wIrN/jElD9ye6coZxn269aJqRhn
 +hp91A7oli+Ja3Htk1tb2jfTNpDWP8Fml8VWcKvLWbMpZyo9b8oHAwjU7t0Qd
X-Received: by 2002:a17:906:619:: with SMTP id
 s25mr339594ejb.237.1636994314464; 
 Mon, 15 Nov 2021 08:38:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfFlS/X56Klrc+BMHdQG/ag3vPLt75Z8R9s1KnwmWXmCV7cZnTRKqhfx3lao8/d9AQSKrJCA==
X-Received: by 2002:a17:906:619:: with SMTP id
 s25mr339542ejb.237.1636994314122; 
 Mon, 15 Nov 2021 08:38:34 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id l11sm7881877edb.28.2021.11.15.08.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:38:33 -0800 (PST)
Date: Mon, 15 Nov 2021 11:38:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/20] virtio: use virtio accessor to access packed descriptor
 flags
Message-ID: <20211115163607.177432-12-mst@redhat.com>
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

We used to access packed descriptor flags via
address_space_{write|read}_cached(). When we hit the cache, memcpy()
is used which is not an atomic operation which may lead a wrong value
is read or wrote.

So this patch switches to use virito_{stw|lduw}_phys_cached() to make
sure the aceess is atomic.

Fixes: 86044b24e865f ("virtio: basic packed virtqueue support")
Cc: qemu-stable@nongnu.org
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211111063854.29060-1-jasowang@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index cc69a9b881..939bcbfeb9 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -507,11 +507,9 @@ static void vring_packed_desc_read_flags(VirtIODevice *vdev,
                                          MemoryRegionCache *cache,
                                          int i)
 {
-    address_space_read_cached(cache,
-                              i * sizeof(VRingPackedDesc) +
-                              offsetof(VRingPackedDesc, flags),
-                              flags, sizeof(*flags));
-    virtio_tswap16s(vdev, flags);
+    hwaddr off = i * sizeof(VRingPackedDesc) + offsetof(VRingPackedDesc, flags);
+
+    *flags = virtio_lduw_phys_cached(vdev, cache, off);
 }
 
 static void vring_packed_desc_read(VirtIODevice *vdev,
@@ -564,8 +562,7 @@ static void vring_packed_desc_write_flags(VirtIODevice *vdev,
 {
     hwaddr off = i * sizeof(VRingPackedDesc) + offsetof(VRingPackedDesc, flags);
 
-    virtio_tswap16s(vdev, &desc->flags);
-    address_space_write_cached(cache, off, &desc->flags, sizeof(desc->flags));
+    virtio_stw_phys_cached(vdev, cache, off, desc->flags);
     address_space_cache_invalidate(cache, off, sizeof(desc->flags));
 }
 
-- 
MST


