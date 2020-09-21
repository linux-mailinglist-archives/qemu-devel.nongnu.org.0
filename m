Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8E62722C0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 13:39:37 +0200 (CEST)
Received: from localhost ([::1]:48686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKKAS-0004Kv-LY
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 07:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kKK4B-0006C1-V1
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 07:33:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43290
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kKK4A-0001BJ-3b
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 07:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600687985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zU1UuXmYbLJaJZ3QFezYItjoYd07TLF83B1qBr2RadM=;
 b=FiJweQ8ASDaEhr5EiZokSvS7fSGql1l/YaiAC6gTFiE0S84UNiCjlHiWg6AuDbS6iWd5nX
 9vhT9EOdSEs5c3N+qGigKGqFVw5JHj3uo9C0ozWzJ9crC8cTL7+tW8u0eCtoBwXPLcFcSN
 auHC8lopkU5rUZFHjAaMgEJvoJyh/Ow=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-OBgwr4eyP3qJ7RmLxM0_Qg-1; Mon, 21 Sep 2020 07:29:59 -0400
X-MC-Unique: OBgwr4eyP3qJ7RmLxM0_Qg-1
Received: by mail-wm1-f72.google.com with SMTP id b14so2395668wmj.3
 for <qemu-devel@nongnu.org>; Mon, 21 Sep 2020 04:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zU1UuXmYbLJaJZ3QFezYItjoYd07TLF83B1qBr2RadM=;
 b=giBLHslDzCill2fOOvWXlH+yKuApEPhfbsNBUhN5cWkffB0CvhhOcfKlAkd3Tf7W70
 Vaw/kx9xcbTlXXz5N9HHO1HiP2J7kcx0xDJbQ7hBFu2/gAleSL2T31zqwXF0CCEtrw+U
 UIWs6DIWy4YLMstkksfhvWqlLB831dbvnNhEJI6y7hbujB+FkuImGxsLwg5MZzokiOR4
 Stze/ezRSdFpVKAyP3XISUW5XI07vcrW5J8PnyOrViLOPfos+1S8Z+6PsKKf6Oq+LSpA
 cgvvWixpA6tzWsMaLv/jKzYwsLxZ8xULF5D9V6+SDdm9QBzEOplVs7MLSNFtNjF/Ba7B
 u5gw==
X-Gm-Message-State: AOAM532/WXYqkY03A2wsPIy3E7bV3ZBWRhsA9hZ1ZBFu2P2GQgfAIrjh
 ZCfY6uKAw7J1GYkU3K4DGWJC2VZ5l62cMINr4jNo+1aaATgQSN6L0lDWyIVlZRgs8Yv2H4xm/uf
 uNUPt+5oGdFBNjJs=
X-Received: by 2002:a7b:c182:: with SMTP id y2mr30904387wmi.21.1600687798407; 
 Mon, 21 Sep 2020 04:29:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoyDO/9TonCGQds0gnaxmTxh5Ziwreelu8sM5Gtj80Cy3zscXBT0rvXEvc59BeELeemm9uPQ==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr30904367wmi.21.1600687798193; 
 Mon, 21 Sep 2020 04:29:58 -0700 (PDT)
Received: from redhat.com (bzq-109-65-116-225.red.bezeqint.net.
 [109.65.116.225])
 by smtp.gmail.com with ESMTPSA id f12sm19067773wmf.26.2020.09.21.04.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 04:29:57 -0700 (PDT)
Date: Mon, 21 Sep 2020 07:29:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 07/15] vhost: check queue state in the vhost_dev_set_log
 routine
Message-ID: <20200921112913.555392-8-mst@redhat.com>
References: <20200921112913.555392-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200921112913.555392-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 04:38:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dima Stepanov <dimastep@yandex-team.ru>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dima Stepanov <dimastep@yandex-team.ru>

If the vhost-user-blk daemon provides only one virtqueue, but device was
added with several queues, then QEMU will send more VHOST-USER command
than expected by daemon side. The vhost_virtqueue_start() routine
handles such case by checking the return value from the
virtio_queue_get_desc_addr() function call. Add the same check to the
vhost_dev_set_log() routine.

Signed-off-by: Dima Stepanov <dimastep@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <6232946d5af09e9775076645909964a6539b8ab5.1599813294.git.dimastep@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 1b2d735b54..7c9542b1f6 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -835,12 +835,24 @@ out:
 static int vhost_dev_set_log(struct vhost_dev *dev, bool enable_log)
 {
     int r, i, idx;
+    hwaddr addr;
+
     r = vhost_dev_set_features(dev, enable_log);
     if (r < 0) {
         goto err_features;
     }
     for (i = 0; i < dev->nvqs; ++i) {
         idx = dev->vhost_ops->vhost_get_vq_index(dev, dev->vq_index + i);
+        addr = virtio_queue_get_desc_addr(dev->vdev, idx);
+        if (!addr) {
+            /*
+             * The queue might not be ready for start. If this
+             * is the case there is no reason to continue the process.
+             * The similar logic is used by the vhost_virtqueue_start()
+             * routine.
+             */
+            continue;
+        }
         r = vhost_virtqueue_set_addr(dev, dev->vqs + i, idx,
                                      enable_log);
         if (r < 0) {
-- 
MST


