Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDDA61376F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:08:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIQ-0002Ma-4j; Mon, 31 Oct 2022 08:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHz-00085O-UZ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHx-0002zu-O8
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yjK+tqQBsPYEdCPjR7NK8gx+6B2l5qZSWxjZ9IzXr+I=;
 b=g/Qd7U+QPgkq1Ujlt8XnqCoiZSA2azrTkveTK7RYRrsz137CXox7rP/5I87G6C+VCR4ArR
 CP5HJ7+8uMMarhq3xW15xI1ZzjIWQmPQMXzGS2i7LsToF/DDIFKHJChMO13uYdfhURvHB8
 K9YJ3ZX9VqEVPOe2yCf+4hXjYecPNDY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-78-A_KghG24PRmTGAlx2-_npQ-1; Mon, 31 Oct 2022 08:53:12 -0400
X-MC-Unique: A_KghG24PRmTGAlx2-_npQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso265865wmk.3
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yjK+tqQBsPYEdCPjR7NK8gx+6B2l5qZSWxjZ9IzXr+I=;
 b=7kTTRcywDqnZ4TK4+Tvx03uWS9jh55fSlxmsYEdhHEr2Ag6WRyWS9Ep3S0Bs/xvaVE
 /vvymwrPC+dCQmFHlLAZe7wA1NAaHqiHsW0REN8vocBJUggJ5VeYMow787nQ/q2H3vps
 RjRd0nUxG5bIwFT9sNIVHZ7NEbcGjronDY7bEu9Xe7MZrFPT4/QYrGcXkUtdkBGj/Ox3
 vlS04oDS5qGxHQxmyQ49piEb5krqMSCCJUU9JEP+Gb4nme+1TTz+ewpZkJ3uRpcQmVx4
 kfxzA7KhDGqOpDL91oVbpENnZ6j/sos+zkq7JwNFzMqZXt4Yl/KimyNyO8Bz4uiGUL+/
 oNzg==
X-Gm-Message-State: ACrzQf3zK/h/uYyf6sqkmgrfLeH/OCeFVJcBNznrNvDHE3bpTDVIyciU
 0mb0Nb1GupiJOoPgRtInfbcNrFeklvM57DsPcxOVpylvJbhEz91zzr8tt56d7GHtTZeI1dhQc16
 k4iRCITYYKfi5uGDK36owEKANW+KIfYQC+tw6Lc0uS7Qc8E2xRxtveuKh96Q3
X-Received: by 2002:a05:6000:100c:b0:235:6980:aa24 with SMTP id
 a12-20020a056000100c00b002356980aa24mr8030665wrx.238.1667220790762; 
 Mon, 31 Oct 2022 05:53:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4QWg6KSf5y97JunjXhPuv8X8hf9BvqJX0Si5cScGSdulXPJP8TX2PcxKw9+OG7qi/vyHK0Eg==
X-Received: by 2002:a05:6000:100c:b0:235:6980:aa24 with SMTP id
 a12-20020a056000100c00b002356980aa24mr8030649wrx.238.1667220790467; 
 Mon, 31 Oct 2022 05:53:10 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 j13-20020a05600c410d00b003c6bd12ac27sm7226705wmi.37.2022.10.31.05.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:10 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 51/86] virtio-net: enable vq reset feature
Message-ID: <20221031124928.128475-52-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Add virtqueue reset feature for virtio-net

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-Id: <20221017092558.111082-16-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f5adba45d5..975bbc22f9 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -788,6 +788,7 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
     }
 
     if (!get_vhost_net(nc->peer)) {
+        virtio_add_feature(&features, VIRTIO_F_RING_RESET);
         return features;
     }
 
-- 
MST


