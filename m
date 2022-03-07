Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A121A4CFBFF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:56:26 +0100 (CET)
Received: from localhost ([::1]:54070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRB2P-0006Jo-OA
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:56:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRAD8-0002QG-GE
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRAD3-0002tQ-6b
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9/XoSsKmPEouICygtljc84b9npXxSXtesafLfFcgh0k=;
 b=Ze9+3ZcgXvJ3KCQDeAK5b+3UXHZwh3hxJLRuqPamuttgWFL/Lstm6325cdYKJPFRaJWEEC
 wwnWq6dUxKXJDrc30t0JJBiuoH6YFTDJi6CLneEY304mytXdFm6YdTi1gRpBPrtRyT1Wu2
 +/CmF0IHRPZKt5C2FBW4fn4hciUn2fI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-AP_MZkliNcCeoQxwMW_pEA-1; Mon, 07 Mar 2022 05:03:11 -0500
X-MC-Unique: AP_MZkliNcCeoQxwMW_pEA-1
Received: by mail-ej1-f72.google.com with SMTP id
 m12-20020a1709062acc00b006cfc98179e2so6770449eje.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9/XoSsKmPEouICygtljc84b9npXxSXtesafLfFcgh0k=;
 b=daQSzCc4jI5V/CYscRb/IZhN/62QUzbj7N4Qo8sSijeMA1m0AfYNZW2f1x+zTrv6GP
 KyFWCoZQkxeHj/r6gCCi1JS8+RqFubEijHabBupFO4c4IsHLQ0q5tWLjh0/+JBK5Jv48
 gnGVgL6NA9R9ExdGlKR9c6vBY/MCmWf+2U2hFJpmXFBUtvx+JGuUoLxK2KdH8SssGwU4
 3/jwDYkWCUY0VCBN91sxLvZCIR8OEabsIQzhsmiNTL/oR0CqdwqZGBEvEOsrhmK0+YSx
 SQkYiRhkrJFgpebNPZOl3X7m9Tx8UtMIFU1vr/vxl2xAXMs7QfTn5Pob6NB/BRIL0hGB
 X5Rw==
X-Gm-Message-State: AOAM531NpIYtZS0cEMqSZsjM72C/jBhes5HqNbwtkfPJZNUpk3q7FJ8u
 DeFEFrpsF44grtzgiP5EvML4CEKP65O4U0k3KxubAqyJv8OLxUo4AiCV27Rsw1X824poaA+lXaO
 8WwnQEe30pnc3RhHSdmJ1GibRNU61027ubUXm3NJa5GX/9slBDMRTr+2RaeSh
X-Received: by 2002:a17:906:1645:b0:6ce:de9:6eb1 with SMTP id
 n5-20020a170906164500b006ce0de96eb1mr8299570ejd.616.1646647389874; 
 Mon, 07 Mar 2022 02:03:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvFFwXtPYBkKRtgWyxtAe1DOU/fL7yQAyThq1OkVJ6bvlo2LS6u+34S8PwPY38SPFIYy7GOw==
X-Received: by 2002:a17:906:1645:b0:6ce:de9:6eb1 with SMTP id
 n5-20020a170906164500b006ce0de96eb1mr8299546ejd.616.1646647389584; 
 Mon, 07 Mar 2022 02:03:09 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 l9-20020a170906078900b006dac5f336f8sm3147357ejc.124.2022.03.07.02.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:03:09 -0800 (PST)
Date: Mon, 7 Mar 2022 05:03:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 36/47] vhost-vsock: detach the virqueue element in case of
 error
Message-ID: <20220307100058.449628-37-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: VictorV <vv474172261@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

In vhost_vsock_common_send_transport_reset(), if an element popped from
the virtqueue is invalid, we should call virtqueue_detach_element() to
detach it from the virtqueue before freeing its memory.

Fixes: fc0b9b0e1c ("vhost-vsock: add virtio sockets device")
Fixes: CVE-2022-26354
Cc: qemu-stable@nongnu.org
Reported-by: VictorV <vv474172261@gmail.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20220228095058.27899-1-sgarzare@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vsock-common.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 3f3771274e..ed706681ac 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -153,19 +153,23 @@ static void vhost_vsock_common_send_transport_reset(VHostVSockCommon *vvc)
     if (elem->out_num) {
         error_report("invalid vhost-vsock event virtqueue element with "
                      "out buffers");
-        goto out;
+        goto err;
     }
 
     if (iov_from_buf(elem->in_sg, elem->in_num, 0,
                      &event, sizeof(event)) != sizeof(event)) {
         error_report("vhost-vsock event virtqueue element is too short");
-        goto out;
+        goto err;
     }
 
     virtqueue_push(vq, elem, sizeof(event));
     virtio_notify(VIRTIO_DEVICE(vvc), vq);
 
-out:
+    g_free(elem);
+    return;
+
+err:
+    virtqueue_detach_element(vq, elem, 0);
     g_free(elem);
 }
 
-- 
MST


