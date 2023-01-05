Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7769D65E7C7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:27:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMMm-0003m3-4R; Thu, 05 Jan 2023 04:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMf-0003Z6-5T
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMd-0007dz-E7
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7O+vNVhmLUQjfn3Cyf7aQgAL9ZeGEbnP6Cc3i+Bvxck=;
 b=Az6Nr1wZty/ekuG/njj2rq+n1nts8kjYn4cHJ/DyfdO4il7aDDiGdtqigE4bp4MskN/8Qe
 Z57TUVg2cOu4iSEEGnFAcr1mw/dGUC/xmQ/moU/reagKqjItijFUzYiSDLe2eufw8m4jdS
 rr8xyMa5sogqeAMhCocnNKUzTbVbB70=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-247-EK7dlHmMP4mMf5-faWxpAw-1; Thu, 05 Jan 2023 04:16:41 -0500
X-MC-Unique: EK7dlHmMP4mMf5-faWxpAw-1
Received: by mail-wm1-f70.google.com with SMTP id
 q6-20020a05600c2e4600b003d211775a99so1181966wmf.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7O+vNVhmLUQjfn3Cyf7aQgAL9ZeGEbnP6Cc3i+Bvxck=;
 b=C842n7/7Fhw14XrIKtlt43zFSv2GM9vgO2wtT3GD60ArydN4eqEz5h7zzZ8S1fBceD
 l/KnUV7/wJjjmCWuS2pcEVQ6+An9vsnHGsuNQ8KsyP7O/YCypSK47xZdEo7j/S6litkO
 yV7LRaViS31SwcYFEQm0DOZeBn5+B6miBZU9d3wJPsfK+HErzi4Rd83fsCX/yjb4sgHV
 ILkCdZjgByaEgqy9ieQ0CBonD3ATpqrMqPzTMFd9BUkue5d2yzU63Hr9iiOlbBgUc0X9
 I1k+tLUNg9RoWTMdJX3XnLywNjMw1DFD3lWmT4HV9oywwSkmOhjpbx1wNK6Dz01VhxYo
 qRUg==
X-Gm-Message-State: AFqh2kpXauQ5ns1AbLq6GPIyTgjuy+WmEVgQFjtS2aJqWICW1gqjlm43
 YEsGDoQZ2uLJ8toXFFhEwlgXF4ot6ZT4hb/d6FBAY5+69I5QyAEZoavuSNRX4mbMpMHMB21aTCM
 eF1zoYtoMUP2uwciaRYL4d/8uD9lbZjo97LmVvq+R/hfkKjqtLsL4FW2yU8Ee
X-Received: by 2002:a05:600c:4920:b0:3cf:7514:a82e with SMTP id
 f32-20020a05600c492000b003cf7514a82emr36460184wmp.23.1672910200255; 
 Thu, 05 Jan 2023 01:16:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsltgO1Yhgqji6i+39X28oeZwo4vsyQhyFiW5c6tGZ127jeMtw2DiH48yaywowHvSr+xezboA==
X-Received: by 2002:a05:600c:4920:b0:3cf:7514:a82e with SMTP id
 f32-20020a05600c492000b003cf7514a82emr36460168wmp.23.1672910199984; 
 Thu, 05 Jan 2023 01:16:39 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b003d978f8f255sm2376826wmq.27.2023.01.05.01.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:16:39 -0800 (PST)
Date: Thu, 5 Jan 2023 04:16:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Longpeng <longpeng2@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 42/51] vdpa: commit all host notifier MRs in a single MR
 transaction
Message-ID: <20230105091310.263867-43-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

This allows the vhost-vdpa device to batch the setup of all its MRs of
host notifiers.

This significantly reduces the device starting time, e.g. the time spend
on setup the host notifier MRs reduce from 423ms to 32ms for a VM with
64 vCPUs and 3 vhost-vDPA generic devices (vdpa_sim_blk, 64vq per device).

Signed-off-by: Longpeng <longpeng2@huawei.com>
Message-Id: <20221227072015.3134-4-longpeng2@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/vhost-vdpa.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index c295a8c917..542e003101 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -519,9 +519,18 @@ static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
 {
     int i;
 
+    /*
+     * Pack all the changes to the memory regions in a single
+     * transaction to avoid a few updating of the address space
+     * topology.
+     */
+    memory_region_transaction_begin();
+
     for (i = dev->vq_index; i < dev->vq_index + n; i++) {
         vhost_vdpa_host_notifier_uninit(dev, i);
     }
+
+    memory_region_transaction_commit();
 }
 
 static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
@@ -534,17 +543,21 @@ static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
         return;
     }
 
+    /*
+     * Pack all the changes to the memory regions in a single
+     * transaction to avoid a few updating of the address space
+     * topology.
+     */
+    memory_region_transaction_begin();
+
     for (i = dev->vq_index; i < dev->vq_index + dev->nvqs; i++) {
         if (vhost_vdpa_host_notifier_init(dev, i)) {
-            goto err;
+            vhost_vdpa_host_notifiers_uninit(dev, i - dev->vq_index);
+            break;
         }
     }
 
-    return;
-
-err:
-    vhost_vdpa_host_notifiers_uninit(dev, i - dev->vq_index);
-    return;
+    memory_region_transaction_commit();
 }
 
 static void vhost_vdpa_svq_cleanup(struct vhost_dev *dev)
-- 
MST


