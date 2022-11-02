Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4C561688C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:23:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGKi-0000xD-H4; Wed, 02 Nov 2022 12:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKM-0000em-Vd
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKK-000382-Gh
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u5w7CZvyWmbkUiTzBcO0zP8z+AAuQB0yroUM/lTFU5g=;
 b=KH6qV0NbH3TsxVEXHjMHd+4r+2oZYhyseJDHTKmk9nSe7E9+P37QQPfvxMizkRkLmm7bgp
 Ys29bPSvAbplDeEE6eszhxMDVxC2SRD9i2CHWrULs7J49PbOQqwJ5EG2GzBMp/qO5fHIuZ
 KDP9sRspc7KHi5oa7uVPnlQr2oPpv64=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-237-KB1ER6FYOz6ykcUUCn-R9Q-1; Wed, 02 Nov 2022 12:10:44 -0400
X-MC-Unique: KB1ER6FYOz6ykcUUCn-R9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 p14-20020a05600c204e00b003cf4cce4da5so651607wmg.0
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u5w7CZvyWmbkUiTzBcO0zP8z+AAuQB0yroUM/lTFU5g=;
 b=sViM+qDsolG8041pqZ/Sd+QXO4sqWmX6J+sE56ligCpX9ZtqAU5OueuQcqcKMrfvOJ
 knZwVUp2UW/uT9Gp8V+2rpi32CyDCJjIrECKpzOyeqB5JLVlHSGefmev3u4HaHpuJH1d
 mFU3FVbtom7u3FqCm+pOgA+wnJusC3VqRm4JkzxNLzX5Mw78lqDAFjg3mXll8/WrjAsX
 rPXI9UaqV5GmrRd4GhghQRd8az4dKCitwIEHZVjw0i3JJ7BXJMAkDseSJ3j0ng9i5e3J
 UjtNIKaJPcLH8R4GF/rDGYuxFrMh4bkzzdjmAtc5bY8UcmRltmFylEcPQy8j/N7f3eh0
 X+9g==
X-Gm-Message-State: ACrzQf2cDO850yLN2mXv2tMUpdHi74Zhm8NxRiuNThuKDbXh1KKvW9Nv
 8mMmLTi/zC+O3aVJRzn7ghU9Vxa5IShR7xOLJgc8dr8qEEsHRdQP9746ZCiLzMi5Xk5Pghz8U4W
 7TY+btLz/sxk65EloAphCQXFBPBDLcoGyYeQ7ZHcae0FujeYPPOZtNnHVnjsx
X-Received: by 2002:a05:6000:38d:b0:236:c7a0:5932 with SMTP id
 u13-20020a056000038d00b00236c7a05932mr11490561wrf.93.1667405441266; 
 Wed, 02 Nov 2022 09:10:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM651Ie9Nixc1yRchj2LqYGA9aL6oKe+gsd7kz8I55vD/7vRnFFGa9VW9eJMRktpcA5LgS1bfw==
X-Received: by 2002:a05:6000:38d:b0:236:c7a0:5932 with SMTP id
 u13-20020a056000038d00b00236c7a05932mr11490532wrf.93.1667405441015; 
 Wed, 02 Nov 2022 09:10:41 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 m2-20020a5d4a02000000b00236695ff94fsm13105463wrq.34.2022.11.02.09.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:40 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 49/82] virtio-net: enable vq reset feature
Message-ID: <20221102160336.616599-50-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index e68daf51bb..8b32339b76 100644
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


