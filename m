Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D906661DC75
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:28:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMqL-0000W6-2r; Sat, 05 Nov 2022 13:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnc-00075F-Hi
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnZ-0007Z7-6h
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=86mB4VRuELy+aXvTC76TKdS8NF61AriuuUX2BHwXz70=;
 b=E/VM5yjD2q7++yAnAmWkgJPJCPlO1QNMI+cwyViAvMcjtjiIEoAW7YftptP7XTBY6/xWI+
 aIxigOceznTCOUKzd0zN+oYHHKszojWNkZjfJNa6V6I3C5VKpk0lgsu+Wpv1tBxZdX/CKA
 N8GUIggMh5Pz73WaZHIHO0YmD5R5uGU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-599-9BC-QtShOs67uFPHwu-MyQ-1; Sat, 05 Nov 2022 13:17:34 -0400
X-MC-Unique: 9BC-QtShOs67uFPHwu-MyQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c130-20020a1c3588000000b003b56be513e1so3861725wma.0
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=86mB4VRuELy+aXvTC76TKdS8NF61AriuuUX2BHwXz70=;
 b=H9jCJ6aEQq9axrSZ8aykucsKkKD+re/4Dnq7SEEs55IK8lOTgxkkawN4wJK7jDJfDF
 DxBZiuyrw6cvOqEqytHjRupnsm36y+EWfiy2tiiigjPifo25DeDiY0/EDhgWvn0+wVQo
 hm6nzdACd7EOR02ANgPYqkttt9qdNZBSbnupDrW4WdQSFqH8YsjapLZde1qjnHb1u+/Q
 u5bYNfazvKdUkb0Fik+vzp6tsl5amoB5TA6LO1ck6K0g3V5yavwg+gdR+OdwY6xPsXj9
 70u8OEjIaI8KqWx1N/N4Aic9bHOiYu7AYBlxSKBzU54cDFooDc9MqfS/tNoYuLPaZZHP
 2r1Q==
X-Gm-Message-State: ACrzQf108wtL2aqj8TH24bSOXP1GrcMdpAXOB+hzMQG/LR1eBrlOPrzH
 aImaAxlDRcm/CyWci9u6tkMtdHDntKfUprPc0YLtEWXiNEKRe82yXIMYrD5luJR/4s8tE0aCBjC
 M6aJtnq9cVQHExDdZWivDwXgoNI4/Rc3YaNbeM/r1B3171SgrNaG68Q41TBmK
X-Received: by 2002:a5d:65cf:0:b0:236:9119:be3 with SMTP id
 e15-20020a5d65cf000000b0023691190be3mr25473335wrw.602.1667668652632; 
 Sat, 05 Nov 2022 10:17:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4QaI/DnNwGsHpfVJO/r83qe5XEfqL6K7rE9f7trBkRy+KHi4gJ/I2YnLWS35zIG8uahRBZIA==
X-Received: by 2002:a5d:65cf:0:b0:236:9119:be3 with SMTP id
 e15-20020a5d65cf000000b0023691190be3mr25473322wrw.602.1667668652357; 
 Sat, 05 Nov 2022 10:17:32 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b003b477532e66sm20555084wmq.2.2022.11.05.10.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:31 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v3 42/81] virtio-net: introduce flush_or_purge_queued_packets()
Message-ID: <20221105171116.432921-43-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Introduce the fucntion flush_or_purge_queued_packets(), it will be
used in device reset and virtqueue reset. Therefore, we extract the
common logic as a new function.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-12-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index b6903aea54..038a6fba7c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -124,6 +124,16 @@ static int vq2q(int queue_index)
     return queue_index / 2;
 }
 
+static void flush_or_purge_queued_packets(NetClientState *nc)
+{
+    if (!nc->peer) {
+        return;
+    }
+
+    qemu_flush_or_purge_queued_packets(nc->peer, true);
+    assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
+}
+
 /* TODO
  * - we could suppress RX interrupt if we were so inclined.
  */
@@ -566,12 +576,7 @@ static void virtio_net_reset(VirtIODevice *vdev)
 
     /* Flush any async TX */
     for (i = 0;  i < n->max_queue_pairs; i++) {
-        NetClientState *nc = qemu_get_subqueue(n->nic, i);
-
-        if (nc->peer) {
-            qemu_flush_or_purge_queued_packets(nc->peer, true);
-            assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
-        }
+        flush_or_purge_queued_packets(qemu_get_subqueue(n->nic, i));
     }
 }
 
-- 
MST


