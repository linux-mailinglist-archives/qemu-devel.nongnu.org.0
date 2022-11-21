Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2D5632D9D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 21:05:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxD1E-0008R7-HR; Mon, 21 Nov 2022 15:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxD1D-0008Qw-30
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 15:03:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxD1A-0000LT-DC
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 15:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669061027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=pTiQnOOjeelsATQnKW0MWMEkzslQynRZQEQGwBCMR7o=;
 b=h6ecn11TZ8cn12ho1yIKUMuothU4MOg+knbN6d/0RqIBStsGljFn0ACHGZBbzN6/XZ9u61
 wO/ocigY6Zn+7C8OzfzWlYsNo8xTCYA1Sm/rjhcxPJs/bK1coNUPNnGCWnDzn7klT/8/PE
 XPfVW3nZL0wKLw2nQSobkw5U16jY4BY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-532-VciJ1V1SNv6cqC8vI-dLsg-1; Mon, 21 Nov 2022 15:03:45 -0500
X-MC-Unique: VciJ1V1SNv6cqC8vI-dLsg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m17-20020a05600c3b1100b003cf9cc47da5so6980720wms.9
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 12:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pTiQnOOjeelsATQnKW0MWMEkzslQynRZQEQGwBCMR7o=;
 b=mbwGPjfSxiBaJN1CFAXqdxYpvHkrk/aIe30fnKGC0MgHs9R2PL2gfvLLNPqZ9m1WGj
 N+/0q2IUTaHFBWracKY5tETy12pvW2x0ojXSkdgqOZNKTBLG9YsEiQs9Vqny4A+oB66h
 DikOtbanVwaKYByf+hPtB86LMP4oKVsDanfu9f4aC2Od4FxSIQyN8v/0OC33hJTc5ReL
 8/Ke7hEBE02rWEhUbXr0qUX4BwDjoYD4GlLUrNSLpxNvKYj++EwA+5/pr4RF5bsTvQd9
 TkStKnqNv49OOCh0ejn+I8ReSQV6BSor2sWb1kYym0fvfyLy93Av905ddJn2889CC1Bb
 Ftyw==
X-Gm-Message-State: ANoB5pksconegWzkTpRValJ3rRXvaRTHk0okvyQ/AGdlEZej5EzxBIBh
 lS9RkWKJIa76faMHSC+8bRgN5bD5wWyg/oTbVUdGrnuM5zZteQTTYCpMYMUtjcpN5nNvn6gLsNm
 QqgAVIWGsWNpFXABSYCt+8l3lylSkuAEfE1Zfy0oF7ueurRvlboBq3/xZ9AuU
X-Received: by 2002:a05:6000:105:b0:236:64e6:8c04 with SMTP id
 o5-20020a056000010500b0023664e68c04mr11981242wrx.579.1669061024194; 
 Mon, 21 Nov 2022 12:03:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5dYXneJNtoFPvm1BlfwWoRylIEhDLKpYfz0aGh+p4sMq4qsctXXowyvicXQOXgOH5MY0lrzg==
X-Received: by 2002:a05:6000:105:b0:236:64e6:8c04 with SMTP id
 o5-20020a056000010500b0023664e68c04mr11981223wrx.579.1669061023794; 
 Mon, 21 Nov 2022 12:03:43 -0800 (PST)
Received: from redhat.com ([2.52.21.254]) by smtp.gmail.com with ESMTPSA id
 d5-20020adffbc5000000b002417e7f0685sm14305569wrs.9.2022.11.21.12.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 12:03:43 -0800 (PST)
Date: Mon, 21 Nov 2022 15:03:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Subject: [PATCH] virtio: disable error for out of spec queue-enable
Message-ID: <20221121200339.362452-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

Virtio 1.0 is pretty clear that features have to be
negotiated before enabling VQs. Unfortunately Seabios
ignored this ever since gaining 1.0 support (UEFI is ok).
Comment the error out for now, and add a TODO.

Fixes: 3c37f8b8d1 ("virtio: introduce virtio_queue_enable()")
Cc: "Kangjie Xu" <kangjie.xu@linux.alibaba.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9683b2e158..eb6347ab5d 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2499,10 +2499,17 @@ void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
 {
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
 
+    /*
+     * TODO: Seabios is currently out of spec and triggering this error.
+     * So this needs to be fixed in Seabios, then this can
+     * be re-enabled for new machine types only, and also after
+     * being converted to LOG_GUEST_ERROR.
+     *
     if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
         error_report("queue_enable is only suppported in devices of virtio "
                      "1.0 or later.");
     }
+    */
 
     if (k->queue_enable) {
         k->queue_enable(vdev, queue_index);
-- 
MST


