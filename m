Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAEA613746
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:01:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUID-0000sd-BI; Mon, 31 Oct 2022 08:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHb-0005p6-NB
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHa-0002r1-1L
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6uK+4zsl0JYm6l7lOzD9Nix6fgmHw0181ZM3BtJtePE=;
 b=DHZY3qEEO/ATeIUDcqwa1KY1P4NuPHUIAmVzI+re1jTz42XptYRgA2fbTZRivJJsyFAAW8
 LpipRhiFkIvEFJoPJCLj2uGMYprQ8gkX5FZHx60gAtSYzfQO1l5+rRSArX7OVE6CxRLVgq
 u1PgJuSo4CfE1wcOpanuQMm9Ovaq2yY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-504-p75mMMv7MLiQIjnCveRFjg-1; Mon, 31 Oct 2022 08:52:48 -0400
X-MC-Unique: p75mMMv7MLiQIjnCveRFjg-1
Received: by mail-wr1-f70.google.com with SMTP id
 e13-20020adf9bcd000000b00236b36cd8cbso1543202wrc.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6uK+4zsl0JYm6l7lOzD9Nix6fgmHw0181ZM3BtJtePE=;
 b=xVJcnxX4PG94FmGczGwwNkR9263IQA/e/0QtJ+l+vga6u8W4ERn17KNB4gk6/XTdeu
 qOTbfMUFwmBj7FM/rp3rES9Lg1hct+wCE77dyK1f25JIH1l8xFd+bdFvR8yNKX5fCx7a
 iKsHFvb3fr5A9ioZN2zUiY4GJWuOrk8vLmCWAoLyV9Ip0RUepiIhj31o5dWBYPATt1Ro
 v+ZBsQfUG79QCPcumbdcL3JT4Q2aol4Du7Bp9jbzUQenRpgYWKYLLnsqNlW61YDZQ+tp
 350Yk9kQ8CZtxOsZK7BuxRDHj7mH71Scp60S09Uid1UHstOseVm3JZmjzOiTdTuOOtLQ
 lRyg==
X-Gm-Message-State: ACrzQf3kyjO92gOXe0DeW5YZkqTe7t6eYnimAUxWg1nIoet944iy3EOM
 V6a+LEUp4zgp8okzSh93+bAAJYoASOZPE9+/FqXSl3d+eggumSGtVgyhxhR3czvjbA8xwwBZOS1
 BahJGz8awugUWqW313KkQ4IA/kP9Z6SCPD3jW/Gag17011fhfSousGvi02+pq
X-Received: by 2002:adf:da43:0:b0:236:dcca:1950 with SMTP id
 r3-20020adfda43000000b00236dcca1950mr594762wrl.385.1667220766879; 
 Mon, 31 Oct 2022 05:52:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM55xXHbD6gfrOClsAHXBiVPDw6cwvVyg3T4L4o1bNRT7QroHtkINhOnhlhXWO1teoOzeFkgLQ==
X-Received: by 2002:adf:da43:0:b0:236:dcca:1950 with SMTP id
 r3-20020adfda43000000b00236dcca1950mr594744wrl.385.1667220766603; 
 Mon, 31 Oct 2022 05:52:46 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bd26-20020a05600c1f1a00b003c6b70a4d69sm7178766wmb.42.2022.10.31.05.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:46 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 42/86] virtio-pci: support queue enable
Message-ID: <20221031124928.128475-43-mst@redhat.com>
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

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

PCI devices support device specific vq enable.

Based on this function, the driver can re-enable the virtqueue after the
virtqueue is reset.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-7-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index d4f2ffe986..855718d586 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1342,6 +1342,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
                        proxy->vqs[vdev->queue_sel].used[0]);
             proxy->vqs[vdev->queue_sel].enabled = 1;
             proxy->vqs[vdev->queue_sel].reset = 0;
+            virtio_queue_enable(vdev, vdev->queue_sel);
         } else {
             virtio_error(vdev, "wrong value for queue_enable %"PRIx64, val);
         }
-- 
MST


