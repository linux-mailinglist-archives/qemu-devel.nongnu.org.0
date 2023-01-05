Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B52B65E825
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:45:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMMi-0003gV-QU; Thu, 05 Jan 2023 04:16:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMX-0003T0-0s
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMV-0007co-Ip
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7LskVb0WftUs5Y9U6s9hpIbm/dgd89CPNCSIXPh1law=;
 b=Hqt+6QsfIeXMBT716N2202eCO0wjVz/XzCIqCsPezVl4g5oBg8QwX5Y8Vi8z/3jRdnSKNT
 wK+P2e0lAiBFoER0Wkvcms2Fid219cd67ijCKePZ7Q5CHhd1/PDMHu/j6zfCEpmYJ7ZreV
 BPazuhrg01iUiktgfVNRdHAIXDKmOSE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-AIidXt9AN0ieZiQo66bRug-1; Thu, 05 Jan 2023 04:16:33 -0500
X-MC-Unique: AIidXt9AN0ieZiQo66bRug-1
Received: by mail-wm1-f71.google.com with SMTP id
 m38-20020a05600c3b2600b003d23f8c6ebdso1263929wms.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:16:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7LskVb0WftUs5Y9U6s9hpIbm/dgd89CPNCSIXPh1law=;
 b=noq5XrBGtkNixsswcJY+jqepiLeLnszrO3cZdmq7+3/t1sOTyl4Z6pPJAdpBhiDrpp
 w/gOUPJ0FppnLIBKxkp8H197Jmo1Y2rlJB2IEYIj9Kp5/wgjrLUgoyFeDDBXhK0QIuNA
 vbPkUD2hQJD4LnbOy6oievPqkBEUR6qx7KkI30G57rOcS1IF0ZzYHtT7/aEf+vOESFaU
 51Kb8nRZwBmZki5h+9VgJvN46UBXLv4BHzEyY/BsrGYWIdOYqohmXIA6G4SQf1Kk0eaT
 9HkXBLCbLEETklemcrcAdBsLPSzpalMJDXjzx3QHS0JHQFVonD/MNS1Tm7e0IW0T//5+
 Ksyw==
X-Gm-Message-State: AFqh2kpUImFg7z+52BSM5l+gpvQB9teqF7f5CsRQOe+ELQQK50P+8IVx
 LQ0uh+CDR9A22iZT1xCLDYQPNAdpHy8Am2k+LFjZijVoAk96ptR/20zmTrHyuqaS64N7ZKOhuz/
 +p08azplaS4v5RoGAtxJhWraKOR8GXI8jsbtLaj47VzrHhXYzkTvheSBbDPcU
X-Received: by 2002:a05:600c:4995:b0:3d3:4f43:fbc2 with SMTP id
 h21-20020a05600c499500b003d34f43fbc2mr36185602wmp.41.1672910191635; 
 Thu, 05 Jan 2023 01:16:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtx9i/+UCEddPXe4GcL5V2c0G3pR5RnxTtE+O9nOw2vR05yTvEAHf+ggHpmV7c6YEPpPJFL7g==
X-Received: by 2002:a05:600c:4995:b0:3d3:4f43:fbc2 with SMTP id
 h21-20020a05600c499500b003d34f43fbc2mr36185584wmp.41.1672910191339; 
 Thu, 05 Jan 2023 01:16:31 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003b4ff30e566sm6184184wms.3.2023.01.05.01.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:16:30 -0800 (PST)
Date: Thu, 5 Jan 2023 04:16:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Longpeng <longpeng2@huawei.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 39/51] vdpa: harden the error path if get_iova_range failed
Message-ID: <20230105091310.263867-40-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Longpeng <longpeng2@huawei.com>

We should stop if the GET_IOVA_RANGE ioctl failed.

Signed-off-by: Longpeng <longpeng2@huawei.com>
Message-Id: <20221224114848.3062-3-longpeng2@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index b6e1e84ed2..1a13a34d35 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -805,7 +805,13 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         return queue_pairs;
     }
 
-    vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
+    r = vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
+    if (unlikely(r < 0)) {
+        error_setg(errp, "vhost-vdpa: get iova range failed: %s",
+                   strerror(-r));
+        goto err;
+    }
+
     if (opts->x_svq) {
         if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
             goto err_svq;
-- 
MST


