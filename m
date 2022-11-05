Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98EA61DC8A
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:36:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMqe-0000YS-Qy; Sat, 05 Nov 2022 13:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMno-0007AA-33
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnk-0007aE-3O
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u5w7CZvyWmbkUiTzBcO0zP8z+AAuQB0yroUM/lTFU5g=;
 b=PeOTKlTkk66/TsWLNtNjNOy3EfcXyrvGfI21nHcGNDZkK3Dr38jgVuLrkZiKqK3BOzJVae
 4wGz6zGjI6rn85M7xb1h77N9skmencunxLZ8FhVf4NZ9mR51RA6RRFmb9eN0wxouCjjDt9
 hLDcT55LqUi47Gt0UfFuW0BU38tmex8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-T4JSR9SjORa48U7xfYlsLA-1; Sat, 05 Nov 2022 13:17:45 -0400
X-MC-Unique: T4JSR9SjORa48U7xfYlsLA-1
Received: by mail-wm1-f69.google.com with SMTP id
 az40-20020a05600c602800b003cfa26c40easo438398wmb.1
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u5w7CZvyWmbkUiTzBcO0zP8z+AAuQB0yroUM/lTFU5g=;
 b=IiT2SwtZ9QyWXATwR3bf72sUpVMRvmWm/yvGQwAJCDxK1KLXNWjX9GXBdosNz/5qW5
 gA2aIQfsl+QgCtjBJ4IGjm5CEes5Nkni4OllzUhm3iFvQMwwmQAiU0as7FRSnyguPUy+
 0s60IeGXOCNVhX2e5o8GWOIjVEwWuxls2fbdIJRiHyQKcxxUeTh/jPXy/58GOxlXcFVh
 htF+kGje8TYeWrqxydE81fQWndEOuclspWBOahoSlmoX/V+lue/UQtflHiBEcCnFUAob
 nAsGOzoqmEjmiK0YA4Wz3by3DeYLRDeLeJ8lRQ6fd7ZxtzWtVexV4JZNsTTQ9ic8XrBF
 /oXA==
X-Gm-Message-State: ACrzQf16pr40oXl752v0puQXiJvSzt7iUn0TjknwgyqijAdHrwahbayq
 IXuxh2rCKM/mUtyN89zXP1n1U2iOyrUPSdZH3BhvizXRR3L+DHCaM0Nem5Zm0OOUnP37Cw+zPT+
 M2lBol/uGrUhuifLopylde8gZ+papX6yToxdIH+O9SJ1NiKKryJdku4ZVVEF1
X-Received: by 2002:adf:eac6:0:b0:238:6b48:4bb6 with SMTP id
 o6-20020adfeac6000000b002386b484bb6mr9350083wrn.34.1667668663908; 
 Sat, 05 Nov 2022 10:17:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM70B9o+AS3MAF/QPCDXYLoDMywBDevvr1yRecqRuhRuhIFaIuJLWtA6AHzrsZxI4MPgeOIQBQ==
X-Received: by 2002:adf:eac6:0:b0:238:6b48:4bb6 with SMTP id
 o6-20020adfeac6000000b002386b484bb6mr9350067wrn.34.1667668663562; 
 Sat, 05 Nov 2022 10:17:43 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 az2-20020adfe182000000b00226dba960b4sm2748089wrb.3.2022.11.05.10.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:43 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v3 46/81] virtio-net: enable vq reset feature
Message-ID: <20221105171116.432921-47-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


